package gov.nasa.jpf.symbc.bytecode;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.Map.Entry;
import java.util.TreeMap;

import edu.nju.seg.symbc.CollectionExpression;
import edu.nju.seg.symbc.FileExpression;
import edu.nju.seg.symbc.FrameAttribute;
import edu.nju.seg.symbc.LibraryConstraint;
import edu.nju.seg.symbc.LibraryExpression;
import edu.nju.seg.symbc.LibraryOperation;
import gov.nasa.jpf.JPFException;
import gov.nasa.jpf.ListenerAdapter;
import gov.nasa.jpf.jvm.bytecode.CHECKCAST;
import gov.nasa.jpf.jvm.bytecode.JVMInvokeInstruction;
import gov.nasa.jpf.symbc.bytecode.BytecodeUtils.VarType;
import gov.nasa.jpf.symbc.numeric.Expression;
import gov.nasa.jpf.symbc.numeric.IntegerConstant;
import gov.nasa.jpf.symbc.numeric.IntegerExpression;
import gov.nasa.jpf.symbc.numeric.PCChoiceGenerator;
import gov.nasa.jpf.symbc.numeric.PCParser;
import gov.nasa.jpf.symbc.numeric.PathCondition;
import gov.nasa.jpf.symbc.numeric.SymbolicInteger;
import gov.nasa.jpf.vm.ChoiceGenerator;
import gov.nasa.jpf.vm.ElementInfo;
import gov.nasa.jpf.vm.Instruction;
import gov.nasa.jpf.vm.StackFrame;
import gov.nasa.jpf.vm.ThreadInfo;
import gov.nasa.jpf.vm.VM;

import org.objectweb.asm.*;

public class SymbolicLibraryHandler {

	public static Map<String, LibraryOperation> sig2opt = new TreeMap<>();
	static {
		for (LibraryOperation opt : LibraryOperation.values()) {
			sig2opt.put(opt.getSignature(), opt);
		}
	}

	public boolean isMethodListSymbolic(JVMInvokeInstruction invInst, ThreadInfo th) {
		String fullName = invInst.getInvokedMethod().getFullName();
		LibraryOperation opt = sig2opt.get(fullName);
		if (opt == null) {
			return false;
		} else {
			String smtFormat = PCParser.smtFormats.get(opt);
			if (smtFormat == null) {
				throw new RuntimeException("error in get LibraryConstraint: " + opt);
			}
			if (smtFormat.contains("?_")) {
				// have side-effect
				StackFrame sf = th.getModifiableTopFrame();
				int numStackSlots = invInst.getArgSize();
				for (int i = 0; i < numStackSlots; i++) {
					if (sf.isOperandRef(i)) {
						ElementInfo ei = th.getModifiableElementInfo(sf.peek(i));
						Expression sym_v1 = (Expression) sf.getOperandAttr(i);
						if (sym_v1 != null) {
							// copy the attr from stack to heap for object
							ei.setObjectAttr(sym_v1);
						}
					}
				}
				return true;
			} else {
				StackFrame sf = th.getModifiableTopFrame();
				int numParams = invInst.getArgSize();
				for (int i = 0; i < numParams; i++) {
					if (sf.isOperandRef(i)) {
						ElementInfo ei = th.getModifiableElementInfo(sf.peek(i));
						Expression sym_pi = (Expression) sf.getOperandAttr(i);
						if (sym_pi != null) {
							// copy the attr from stack to heap for object
							ei.setObjectAttr(sym_pi);
						} else {
							sym_pi = (Expression) ei.getObjectAttr();
							if (sym_pi == null) {
								continue;
							}
						}
						if (sym_pi instanceof LibraryExpression) {
							if (((LibraryExpression) sym_pi).isSYM()) {
								return true;
							}
						} else {
							return true;
						}
					} else {
						Expression sym_v1 = (Expression) sf.getOperandAttr(i);
						if (sym_v1 != null) {
							return true;
						}
					}
				}
				return false;
			}
		}
	}

	public Instruction handleSymbolicLists(JVMInvokeInstruction invInst, ThreadInfo th) {
		boolean needToHandle = isMethodListSymbolic(invInst, th);
		if (needToHandle) {
			String mname = invInst.getInvokedMethod().getFullName();
			LibraryOperation opt = sig2opt.get(mname);
			return handleCollectionOperationFromat(opt, invInst, th);
		}
		return null;
	}

	public Instruction handleCollectionOperationFromat(LibraryOperation opt, JVMInvokeInstruction invInst,
			ThreadInfo th) {
		String fullName = invInst.getInvokedMethod().getFullName();
		int offset = fullName.lastIndexOf(".");
		String className = fullName.substring(0, offset);
		String methodDesc = fullName.substring(offset + 1);
		if (className.startsWith("java.util") || className.startsWith("java.io")) {
			ChoiceGenerator<?> cg;
			if (!th.isFirstStepInsn()) {
				cg = new PCChoiceGenerator(1);
				th.getVM().setNextChoiceGenerator(cg);
				return invInst;
			} else {
				String smtFormat = PCParser.smtFormats.get(opt);
				if (smtFormat == null) {
					throw new RuntimeException("error in get LibraryConstraint: " + opt);
				}
				// turn off symbolic execution
				Map<ElementInfo, Object> intent = new HashMap<>();
				StackFrame sf = th.getModifiableTopFrame();
				int numParams = invInst.getArgSize();
				LinkedList<Expression> paramExps = new LinkedList<>();
				LinkedList<Expression> _paramExps = new LinkedList<>();
				for (int i = 0; i < numParams; i++) {
					if (sf.isOperandRef(i)) {
						ElementInfo pi = th.getModifiableElementInfo(sf.peek(i));
						Expression sym_pi = (Expression) pi.getObjectAttr();
						if (sym_pi == null) {
							sym_pi = createSymbolicExpression(pi, th);
						}
						// determine the element type of collection
						if (sym_pi instanceof CollectionExpression) {
							((CollectionExpression) sym_pi).setElementTypeName(opt, invInst, th);
						}
						paramExps.push(sym_pi);
						if (sym_pi instanceof LibraryExpression && smtFormat.contains("?_p" + (numParams - i - 1))) {
							LibraryExpression new_sym_pi = updateVersion((LibraryExpression) sym_pi);
							_paramExps.push(new_sym_pi);
							// update the object symbol
							intent.put(pi, new_sym_pi);
						} else {
							_paramExps.push(null);
							intent.put(pi, sym_pi);
						}
						// turn off symbolic execution
						pi.removeObjectAttr(sym_pi);
					} else {
						int pi = sf.peek(i);
						IntegerExpression sym_pi = sf.hasOperandAttr() ? (IntegerExpression) sf.getOperandAttr() : null;
						if (sym_pi == null) {
							sym_pi = new IntegerConstant(pi);
							System.out.println("create symbolic expression for concrete int " + sym_pi);
						}
						paramExps.push(sym_pi);
						sf.removeOperandAttr(i, sym_pi);
					}
				}
				Type retType = Type.getReturnType(methodDesc);
				Expression retExp = createReturnExpression(retType, invInst, th);
				LibraryConstraint cc = new LibraryConstraint(opt, paramExps.toArray(new Expression[] {}), retExp,
						_paramExps.toArray(new Expression[] {}));
				pushCC2PC(th, cc);
				sf.setFrameAttr(new FrameAttribute(retExp, intent));
				addListenerOnReturnInstruction(invInst, th);
			}
		} else if (className.startsWith("java.lang")) {
			StackFrame sf = th.getModifiableTopFrame();
			int numParams = invInst.getArgSize();
			if (numParams == 1) {
				if (sf.isOperandRef()) {
					ElementInfo p = th.getModifiableElementInfo(sf.peek());
					Expression sym_p = (Expression) p.getObjectAttr();
					if (sym_p == null) {
						sym_p = createSymbolicExpression(p, th);
					}
					// turn off symbolic execution
					Map<ElementInfo, Object> intent = new HashMap<>();
					intent.put(p, sym_p);
					p.removeObjectAttr(sym_p);
					sf.setFrameAttr(new FrameAttribute(sym_p, intent));
				} else {
					int p = sf.peek();
					IntegerExpression sym_p = sf.hasOperandAttr() ? (IntegerExpression) sf.getOperandAttr() : null;
					if (sym_p == null) {
						sym_p = new IntegerConstant(p);
						System.out.println("create symbolic expression for concrete int " + sym_p);
					}
					sf.removeOperandAttr(sym_p);
					sf.setFrameAttr(new FrameAttribute(sym_p, null));
				}
				addListenerOnReturnInstruction(invInst, th);
			} else {
				throw new RuntimeException("ERROR: symbolic method not handled: " + fullName);
			}
		} else {
			throw new RuntimeException("ERROR: symbolic method not handled: " + fullName);
		}
		return null;
	}

	// insert listener to bing retExp to return value and turn on symbolic execution
	// when return
	public void addListenerOnReturnInstruction(JVMInvokeInstruction invInst, ThreadInfo th) {
		Instruction inst = invInst.getInvokedMethod().getLastInsn();
		th.getVM().addListener(new ListenerAdapter() {
			@Override
			public void instructionExecuted(VM vm, ThreadInfo currentThread, Instruction nextInstruction,
					Instruction executedInstruction) {
				if (executedInstruction.equals(inst)) {
					if (recoverFromSymbolicMethod(currentThread)) {
						vm.removeListener(this);
					}
				}
			}
		});
	}

	void pushCC2PC(ThreadInfo th, LibraryConstraint cc) {
		ChoiceGenerator<?> cg;
		cg = th.getVM().getChoiceGenerator();
		assert (cg instanceof PCChoiceGenerator) : "expected PCChoiceGenerator, got: " + cg;
		PathCondition pc;
		// pc is updated with the pc stored in the choice generator above
		// get the path condition from the
		// previous choice generator of the same type
		ChoiceGenerator<?> prev_cg = cg.getPreviousChoiceGenerator();
		while (!((prev_cg == null) || (prev_cg instanceof PCChoiceGenerator))) {
			prev_cg = prev_cg.getPreviousChoiceGenerator();
		}
		if (prev_cg == null) {
			pc = new PathCondition();
		} else {
			pc = ((PCChoiceGenerator) prev_cg).getCurrentPC();
		}
		assert pc != null;
		pc.lpc._addOpt(cc);
		((PCChoiceGenerator) cg).setCurrentPC(pc);
	}

	boolean recoverFromSymbolicMethod(ThreadInfo th) {
		StackFrame frame = th.getModifiableTopFrame();
		Object obj = frame.getFrameAttr();
		if (obj instanceof FrameAttribute) {
			FrameAttribute fAttr = (FrameAttribute) obj;
			// bind the rEturn expression to return value
			Expression retExp = fAttr.rEturn;
			if (retExp != null) {
				if (frame.isOperandRef()) {
					int retRef = frame.peek();
					ElementInfo retEI = th.getModifiableElementInfo(retRef);
					System.out.println("RET " + retRef);
					System.out.println("RET (before set attr)" + retEI.getObjectAttr());
					retEI.setObjectAttr(retExp);
					System.out.println("RET " + retEI.getObjectAttr());
				} else {
					frame.setOperandAttr(retExp);
					System.out.println("RET " + frame.getOperandAttr());
				}
			}
			// turn on symbolic execution
			Map<ElementInfo, Object> intent = fAttr.symbcInfo;
			if (intent != null) {
				for (Entry<ElementInfo, Object> entry : intent.entrySet()) {
					entry.getKey().setObjectAttr(entry.getValue());
				}
			}
			frame.removeFrameAttr(fAttr);
			return true;
		}
		return false;
	}

	Expression createSymbolicExpression(ElementInfo ei, ThreadInfo th) {
		Expression sym_ei;
		String typeName = ei.getClassInfo().getName();
		if (typeName.equals("java.lang.Integer")) {
			sym_ei = new IntegerConstant(ei.asInteger());
			System.out.println("create symbolic expression for concrete Integer " + sym_ei);
		} else if (typeName.equals("java.util.ArrayList")) {
			sym_ei = new CollectionExpression(BytecodeUtils.varName("AL@" + ei.getObjectRef(), VarType.OBJECT),
					typeName, false);
			System.out.println("create symbolic expression for empty ArrayList " + sym_ei);
		} else if (typeName.equals("java.io.FileInputStream")) {
			sym_ei = new FileExpression(BytecodeUtils.varName("FI@" + ei.getObjectRef(), VarType.OBJECT), typeName,
					false);
			System.out.println("create symbolic expression for empty FileInputStream " + sym_ei);
		} else if (typeName.equals("[B")) {
			sym_ei = new CollectionExpression(BytecodeUtils.varName("AB@" + ei.getObjectRef(), VarType.OBJECT),
					"java.util.ArrayList", false);
			((CollectionExpression) sym_ei).setElementTypeName("java.lang.Byte");
			LibraryConstraint cc = new LibraryConstraint(LibraryOperation.ARRAYLIST_INIT,
					new Expression[] { null, new IntegerConstant(ei.arrayLength()) }, null,
					new Expression[] { sym_ei, null });
			pushCC2PC(th, cc);
			System.out.println("create symbolic expression for byte[] " + sym_ei);
		} else {
			throw new JPFException("object is of type " + ei.getClassInfo().getName());
		}
		return sym_ei;
	}

	Expression createReturnExpression(Type retType, Instruction invInst, ThreadInfo th) {
		Expression retExp;
		if (retType.getSort() == Type.VOID) {
			retExp = null;
		} else if (retType.getSort() == Type.BOOLEAN) {
			retExp = new SymbolicInteger(BytecodeUtils.varName("rEturn", VarType.INT), 0, 1);
		} else if (retType.getSort() == Type.INT) {
			retExp = new SymbolicInteger(BytecodeUtils.varName("rEturn", VarType.INT));
		} else if (retType.getSort() == Type.OBJECT) {
			String typeName = retType.getClassName();
			if (typeName.equals("java.lang.Object")) {
				Instruction nextInst = invInst.getNext(th);
				if (nextInst instanceof CHECKCAST) {
					CHECKCAST checkCast = (CHECKCAST) nextInst;
					typeName = checkCast.getTypeName();
				}
			}
			if (typeName.equals("java.lang.Integer")) {
				retExp = new SymbolicInteger(BytecodeUtils.varName("rEturn", VarType.INT));
			} else {
				throw new JPFException("object is of type " + retType);
			}
		} else {
			throw new JPFException("object is of type " + retType);
		}
		return retExp;
	}

	LibraryExpression updateVersion(LibraryExpression sym) {
		Pattern pat = Pattern.compile("^(.*)_\\d+_[^_]+$");
		Matcher mat = pat.matcher(sym.getName());
		mat.find();
		LibraryExpression copy_sym = sym.clone();
		copy_sym.setName(BytecodeUtils.varName(mat.group(1), VarType.OBJECT));
		return copy_sym;
	}

}