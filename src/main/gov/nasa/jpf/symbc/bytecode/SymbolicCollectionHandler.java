package gov.nasa.jpf.symbc.bytecode;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.Map.Entry;
import java.util.Stack;
import java.util.TreeMap;

import edu.nju.seg.symbc.collections.CollectionConstraint;
import edu.nju.seg.symbc.collections.FrameAttribute;
import edu.nju.seg.symbc.collections.CollectionExpression;
import edu.nju.seg.symbc.collections.CollectionOperation;
import gov.nasa.jpf.JPFException;
import gov.nasa.jpf.ListenerAdapter;
import gov.nasa.jpf.jvm.bytecode.CHECKCAST;
import gov.nasa.jpf.jvm.bytecode.JVMInvokeInstruction;
import gov.nasa.jpf.symbc.bytecode.BytecodeUtils.VarType;
import gov.nasa.jpf.symbc.numeric.Expression;
import gov.nasa.jpf.symbc.numeric.IntegerConstant;
import gov.nasa.jpf.symbc.numeric.IntegerExpression;
import gov.nasa.jpf.symbc.numeric.PCChoiceGenerator;
import gov.nasa.jpf.symbc.numeric.PathCondition;
import gov.nasa.jpf.symbc.numeric.SymbolicInteger;
import gov.nasa.jpf.vm.ChoiceGenerator;
import gov.nasa.jpf.vm.ElementInfo;
import gov.nasa.jpf.vm.Instruction;
import gov.nasa.jpf.vm.StackFrame;
import gov.nasa.jpf.vm.ThreadInfo;
import gov.nasa.jpf.vm.VM;

import org.objectweb.asm.*;

public class SymbolicCollectionHandler {
	
	public static Map<String, CollectionOperation> sig2opt = new TreeMap<>();
	static {
		for(CollectionOperation opt : CollectionOperation.values()) {
			sig2opt.put(opt.getSignature(), opt);
		}
	}

	public boolean isMethodListSymbolic(JVMInvokeInstruction invInst, ThreadInfo th) {
		String fullName = invInst.getInvokedMethod().getFullName();
		CollectionOperation opt = sig2opt.get(fullName);
		if(opt == null) {
			return false;
		} else if (opt.isPure()) {
			StackFrame sf = th.getModifiableTopFrame();
			int numStackSlots = invInst.getArgSize();
			int numParams = invInst.getInvokedMethod().isStatic() ? numStackSlots : numStackSlots - 1;
			for (int i = 0; i < numParams; i++) {
				if (sf.isOperandRef(i)) {
					ElementInfo ei = th.getElementInfo(sf.peek(i));
					Expression sym_v1 = (Expression) sf.getOperandAttr(i);
					if (sym_v1 != null) {
						// copy the attr from stack to heap for object
						ei.setObjectAttr(sym_v1);
						return true;
					} else {
						sym_v1 = (Expression) ei.getObjectAttr();
						if (sym_v1 != null) {
							return true;
						}
					}
				} else {
					Expression sym_v1 = (Expression) sf.getOperandAttr(i);
					if(sym_v1 != null) {
						return true;
					}
				}
			}
			if (!invInst.getInvokedMethod().isStatic()) {
				int baseIdx = numStackSlots - 1;
				ElementInfo base = th.getElementInfo(sf.peek(baseIdx));
				Expression sym_b = (Expression) base.getObjectAttr();
				if(sym_b != null) {
					if (sym_b instanceof CollectionExpression) {
						if (((CollectionExpression) sym_b).isSYM()) {
							return true;
						}
					} else {
						return true;
					}
				}
			}
			return false;
		} else {
			// have side-effect
			StackFrame sf = th.getModifiableTopFrame();
			int numStackSlots = invInst.getArgSize();
			for (int i = 0; i < numStackSlots; i++) {
				if (sf.isOperandRef(i)) {
					ElementInfo ei = th.getElementInfo(sf.peek(i));
					Expression sym_v1 = (Expression) sf.getOperandAttr(i);
					if (sym_v1 != null) {
						// copy the attr from stack to heap for object
						ei.setObjectAttr(sym_v1);
					}
				}
			}
			return true;
		} 
	}
	
	public Instruction handleSymbolicLists(JVMInvokeInstruction invInst, ThreadInfo th) {
		boolean needToHandle = isMethodListSymbolic(invInst, th);
		if (needToHandle) {
			String mname = invInst.getInvokedMethod().getFullName();
			CollectionOperation opt = sig2opt.get(mname);
			return handleCollectionOperationFromat(opt, invInst, th);
		}
		return null;
	}
	
	public Instruction handleCollectionOperationFromat(CollectionOperation opt, JVMInvokeInstruction invInst, ThreadInfo th) {
		String fullName = invInst.getInvokedMethod().getFullName();
		int offset = fullName.lastIndexOf(".");
		String className = fullName.substring(0,offset);
		String methodDesc = fullName.substring(offset+1);
		if(className.startsWith("java.util")) {
			ChoiceGenerator<?> cg;
			if (!th.isFirstStepInsn()) {
				cg = new PCChoiceGenerator(1);
				th.getVM().setNextChoiceGenerator(cg);
				return invInst;
			} else {
				// turn off symbolic execution
				Map<ElementInfo, Object> intent = new HashMap<>();
				StackFrame sf = th.getModifiableTopFrame();
				int numParams = invInst.getArgSize();
				Stack<Expression> paramExps = new Stack<>();
				for (int i = 0; i < numParams; i++) {
					if(sf.isOperandRef(i)) {
						ElementInfo pi = th.getModifiableElementInfo(sf.peek(i));
						Expression sym_pi = pi != null ? (Expression) pi.getObjectAttr() : null;
						if (sym_pi == null) {
							String typeName = pi.getClassInfo().getName();
							if (typeName.equals("java.lang.Integer")) {
								sym_pi = new IntegerConstant(pi.asInteger());
								System.out.println("create symbolic expression for concrete Integer " + sym_pi);
							} else if (typeName.equals("java.util.ArrayList")) {
								sym_pi = new CollectionExpression(BytecodeUtils.varName("@" + sf.peek(i), VarType.ARRLIST), typeName, false);
								System.out.println("create symbolic expression for empty ArrayList " + sym_pi);
							} else {
								throw new JPFException("object is of type " + pi.getClassInfo().getName());
							}
						}
						paramExps.push(sym_pi);
						// turn off symbolic execution
						intent.put(pi, sym_pi);
						pi.removeObjectAttr(sym_pi);
					} else {
						int pi = sf.peek(i);
						IntegerExpression sym_pi = sf.hasOperandAttr() ? (IntegerExpression) sf.getOperandAttr() : null;
						if(sym_pi == null) {
							sym_pi = new IntegerConstant(pi);
							System.out.println("create symbolic expression for concrete int "+sym_pi);
						}
						paramExps.push(sym_pi);
						sf.removeOperandAttr(i, sym_pi);
					}
				}
				CollectionExpression sym_b = null, new_sym_b = null;
				if(!invInst.getInvokedMethod().isStatic()) {
					sym_b = (CollectionExpression) paramExps.pop();
					// ensure the element type of sym_b
					sym_b.setElementTypeName(opt, invInst, th);
					if(!opt.isPure()) {
						new_sym_b = updateVersion(sym_b);
						// update the object symbol
						ElementInfo base = th.getModifiableElementInfo(sf.peek(numParams-1));
						intent.put(base, new_sym_b);
					}
				}
				Expression retExp;
				Type retType = Type.getReturnType(methodDesc);
				if(retType.getSort() == Type.VOID) {
					retExp = null;
				} else if(retType.getSort() == Type.BOOLEAN) {
					retExp = new SymbolicInteger(BytecodeUtils.varName("rEturn", VarType.INT), 0, 1);
				} else if(retType.getSort() == Type.OBJECT) {
					String typeName = retType.getClassName();
					if(typeName.equals("java.lang.Object")) {
						Instruction nextInst = invInst.getNext(th);
						if(nextInst instanceof CHECKCAST) {
							CHECKCAST checkCast = (CHECKCAST) nextInst;
							typeName = checkCast.getTypeName();
						}
					}
					if(typeName.equals("java.lang.Integer")) {
						retExp = new SymbolicInteger(BytecodeUtils.varName("rEturn", VarType.INT));
					} else {
						throw new JPFException("object is of type " + retType);
					}
				} else {
					throw new JPFException("object is of type " + retType);
				}
				CollectionConstraint cc = new CollectionConstraint(opt, sym_b, paramExps.toArray(new Expression[]{}), retExp, new_sym_b);
				pushCC2PC(th,cc);
				sf.setFrameAttr(new FrameAttribute(retExp,intent));
				addListenerOnReturnInstruction(invInst, th);
			}
		} else if(className.startsWith("java.lang")) {
			StackFrame sf = th.getModifiableTopFrame();
			int numParams = invInst.getArgSize();
			if(numParams == 1) {
				if(sf.isOperandRef()) {
					ElementInfo p = th.getModifiableElementInfo(sf.peek());
					Expression sym_p = p != null ? (Expression) p.getObjectAttr() : null;
					if (sym_p == null) {
						if (p.getClassInfo().getName().equals("java.lang.Integer")) {
							sym_p = new IntegerConstant(p.asInteger());
							System.out.println("create symbolic expression for concrete Integer " + sym_p);
						} else {
							throw new JPFException("object is of type " + p.getClassInfo().getName());
						}
					}
					// turn off symbolic execution
					Map<ElementInfo, Object> intent = new HashMap<>();
					intent.put(p, sym_p);
					p.removeObjectAttr(sym_p);
					sf.setFrameAttr(new FrameAttribute(sym_p,intent));
				} else {
					int p = sf.peek();
					IntegerExpression sym_p = sf.hasOperandAttr() ? (IntegerExpression) sf.getOperandAttr() : null;
					if(sym_p == null) {
						sym_p = new IntegerConstant(p);
						System.out.println("create symbolic expression for concrete int "+sym_p);
					}
					sf.removeOperandAttr(sym_p);
					sf.setFrameAttr(new FrameAttribute(sym_p,null));
				}
				addListenerOnReturnInstruction(invInst, th);
			} else {
				throw new RuntimeException("ERROR: symbolic method not handled: " + fullName);
			}
		}
		return null;
	}
	
	// insert listener to bing retExp to return value and turn on symbolic execution when return
	public void addListenerOnReturnInstruction(JVMInvokeInstruction invInst, ThreadInfo th) {
		Instruction inst = invInst.getInvokedMethod().getLastInsn();
        th.getVM().addListener(new ListenerAdapter() {
			@Override
			public void instructionExecuted(VM vm, ThreadInfo currentThread, Instruction nextInstruction,
					Instruction executedInstruction) {
				if(executedInstruction.equals(inst)) {
					if(recoverFromSymbolicMethod(currentThread)) {
						vm.removeListener(this);
					}
				}
			}
		});
	}

	void pushCC2PC(ThreadInfo th, CollectionConstraint cc) {
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
		pc.cpc._addOpt(cc);
		((PCChoiceGenerator) cg).setCurrentPC(pc);
	}
	
	boolean recoverFromSymbolicMethod(ThreadInfo th) {
		StackFrame frame = th.getModifiableTopFrame();
		Object obj = frame.getFrameAttr();
		if(obj instanceof FrameAttribute) {
			FrameAttribute fAttr = (FrameAttribute) obj; 
			// bind the rEturn expression to return value
			Expression retExp = fAttr.rEturn;
			if(retExp != null) {
				if(frame.isOperandRef()) {
					int retRef = frame.peek();
					ElementInfo retEI = th.getModifiableElementInfo(retRef);
					System.out.println("RET "+retRef);
					System.out.println("RET (before set attr)"+retEI.getObjectAttr());
					retEI.setObjectAttr(retExp);
					System.out.println("RET "+retEI.getObjectAttr());
				} else {
					frame.setOperandAttr(retExp);
					System.out.println("RET "+frame.getOperandAttr());
				}
			}
			// turn on symbolic execution
			Map<ElementInfo,Object> intent = fAttr.symbcInfo;
			if(intent != null) {
				for(Entry<ElementInfo,Object> entry : intent.entrySet()) {
					entry.getKey().setObjectAttr(entry.getValue());
				}
			}
			frame.removeFrameAttr(fAttr);
			return true;
		}
		return false;
	}
	
	CollectionExpression updateVersion(CollectionExpression sym) {
		Pattern pat = Pattern.compile("^(.*)_\\d+_[^_]+$");
		Matcher mat = pat.matcher(sym.getName());
		mat.find();
		// clone sym, the version number increase, if sym isSYM then the result isSYM too
		CollectionExpression copy_sym = sym.clone();
		copy_sym.setName(BytecodeUtils.varName(mat.group(1), VarType.ARRLIST));
		return copy_sym;
	}

}
