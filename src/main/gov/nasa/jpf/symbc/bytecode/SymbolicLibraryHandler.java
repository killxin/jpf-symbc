package gov.nasa.jpf.symbc.bytecode;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.bcel.generic.ArrayType;
import org.apache.bcel.generic.Type;

import java.util.Map.Entry;
import java.util.TreeMap;

import edu.nju.seg.symbc.CollectionExpression;
import edu.nju.seg.symbc.StringExpression;
import edu.nju.seg.symbc.FileExpression;
import edu.nju.seg.symbc.FrameAttribute;
import edu.nju.seg.symbc.LibraryConstraint;
import edu.nju.seg.symbc.LibraryExpression;
import edu.nju.seg.symbc.LibraryOperation;
import gov.nasa.jpf.Config;
import gov.nasa.jpf.JPFException;
import gov.nasa.jpf.ListenerAdapter;
import gov.nasa.jpf.jvm.bytecode.CHECKCAST;
import gov.nasa.jpf.jvm.bytecode.JVMInvokeInstruction;
import gov.nasa.jpf.jvm.bytecode.RETURN;
import gov.nasa.jpf.symbc.bytecode.BytecodeUtils.VarType;
import gov.nasa.jpf.symbc.numeric.Expression;
import gov.nasa.jpf.symbc.numeric.IntegerConstant;
import gov.nasa.jpf.symbc.numeric.IntegerExpression;
import gov.nasa.jpf.symbc.numeric.PCChoiceGenerator;
import gov.nasa.jpf.symbc.numeric.PCParser;
import gov.nasa.jpf.symbc.numeric.PathCondition;
import gov.nasa.jpf.symbc.numeric.SymbolicInteger;
import gov.nasa.jpf.symbc.string.SymbolicStringBuilder;
import gov.nasa.jpf.vm.ChoiceGenerator;
import gov.nasa.jpf.vm.ElementInfo;
import gov.nasa.jpf.vm.Instruction;
import gov.nasa.jpf.vm.MethodInfo;
import gov.nasa.jpf.vm.StackFrame;
import gov.nasa.jpf.vm.ThreadInfo;
import gov.nasa.jpf.vm.VM;
import gov.nasa.jpf.vm.bytecode.ReturnInstruction;

public class SymbolicLibraryHandler {

	public static Map<String, LibraryOperation> sig2opt = new TreeMap<>();
	static {
		for (LibraryOperation opt : LibraryOperation.values()) {
			sig2opt.put(opt.getSignature(), opt);
		}
	}
	
	public boolean isMethodSymbolic(JVMInvokeInstruction invInst, ThreadInfo th) {
//		String fullName = invInst.getInvokedMethod().getFullName();
//		LibraryOperation opt = sig2opt.get(fullName);
//		if (opt == null) {
//			// java.util.ArrayList$ListItr.nextIndex()I is too detail
//			String upperName = invInst.getInvokedMethodClassName()+"."+invInst.getInvokedMethodName();
//			opt = sig2opt.get(upperName);
//		}
		// java.util.Collection.size()I cannot be regard as java.util.ArrayList.size()I
		String mname = invInst.getInvokedMethodClassName() + "." + invInst.getInvokedMethodName();
		LibraryOperation opt = sig2opt.get(mname);
		if (opt == null) {
			return false;
		} else {
			if (!inSymScale(invInst,th)) {
				CollectionExpression.ensureElementOrKeyValueTypes(opt, invInst, th);
				return false;
			} else {
				String smtFormat = PCParser.smtFormats.get(opt);
				if (smtFormat == null) {
//				String className = fullName.substring(0, fullName.lastIndexOf("."));
					String className = invInst.getInvokedMethodClassName();
					if (className.startsWith("java.lang")) {
						smtFormat = "java.lang does not need smtFormat";
					} else {
						throw new RuntimeException("error in get LibraryConstraint: " + opt);
					}
				}
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
			}
		}
	}

	public static boolean inSymScale(Instruction invInst, ThreadInfo th) {
		// System.out.println("method name "+methodName);
		Config conf = th.getVM().getConfig();
//		String[] scales = conf.getStringArray("symbolic.libraries.scale");
		String[] scales = conf.getStringArray("target");
		if(scales == null) {
			return BytecodeUtils.isMethodSymbolic(th.getVM().getConfig(), 
					invInst.getMethodInfo().getFullName(),
					invInst.getMethodInfo().getArgumentsSize(), null);
		} else {
			String methodName = invInst.getMethodInfo().getFullName();
			if(methodName.contains("main([Ljava/lang/String;)")||methodName.contains("setUp()")) {
				return false;
			}
			String className = invInst.getMethodInfo().getClassName();
			for(String scale : scales) {
				if(scale.equals(className)) {
					return true;
				}
			}
			return false;
		}
	}

	public Instruction handleSymbolicLibraries(JVMInvokeInstruction invInst, ThreadInfo th) {
		boolean needToHandle = isMethodSymbolic(invInst, th);
		if (needToHandle) {
			// java.util.Collection.size()I cannot be regard as java.util.ArrayList.size()I
			String mname = invInst.getInvokedMethodClassName() + "." + invInst.getInvokedMethodName();
			LibraryOperation opt = sig2opt.get(mname);
//			String mname = invInst.getInvokedMethod().getFullName();
//			LibraryOperation opt = sig2opt.get(mname);
//			if (opt == null) {
			// java.util.ArrayList$ListItr.nextIndex()I is too detail
//				String upperName = invInst.getInvokedMethodClassName()+"."+invInst.getInvokedMethodName();
//				opt = sig2opt.get(upperName);
//			}
			return handleLibraryOperationFromat(opt, invInst, th);
		}
		return null;
	}

	public Instruction handleLibraryOperationFromat(LibraryOperation opt, JVMInvokeInstruction invInst, ThreadInfo th) {
//		String fullName = invInst.getInvokedMethod().getFullName();
//		int offset = fullName.lastIndexOf(".");
//		String className = fullName.substring(0, offset);
//		String methodDesc = fullName.substring(offset + 1);
		String className = invInst.getInvokedMethodClassName();
		String methodDesc = invInst.getInvokedMethodName();
		String fullName = className + "." + methodDesc;
		if(fullName.equals("java.util.List.listIterator()Ljava/util/ListIterator;")){
		System.out.println(fullName);
		}
		if (className.startsWith("java.util") || className.startsWith("java.io") || className.startsWith("java.security")
				|| className.startsWith("java.lang.String") || className.startsWith("java.lang.Integer")) {
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
							((CollectionExpression) sym_pi).setElementOrKeyValueTypes(opt, invInst, th, intent);
						}
						paramExps.push(sym_pi);
						if (sym_pi instanceof LibraryExpression && smtFormat.contains("?_p" + (numParams - i - 1))) {
							LibraryExpression new_sym_pi = updateVersion((LibraryExpression) sym_pi);
							_paramExps.push(new_sym_pi);
							// update the object symbol
							intent.put(pi, new_sym_pi);
//						} else if (sym_pi instanceof StringSymbolic && smtFormat.contains("?_p" + (numParams - i - 1))) {
//							StringSymbolic new_sym_pi = updateVersion((StringSymbolic) sym_pi);
//							_paramExps.push(new_sym_pi);
//							intent.put(pi, new_sym_pi);
						} else {
							_paramExps.push(null);
							intent.put(pi, sym_pi);
						}
						// turn off symbolic execution
						pi.removeObjectAttr(sym_pi);
					} else {
						int pi = sf.peek(i);
						IntegerExpression sym_pi = sf.hasOperandAttr(i) ? (IntegerExpression) sf.getOperandAttr(i)
								: null;
//						Expression sym_pi = sf.hasOperandAttr(i) ? (Expression) sf.getOperandAttr(i) : null;
						if (sym_pi == null) {
							sym_pi = new IntegerConstant(pi);
							System.out.println("create symbolic expression for concrete int " + sym_pi);
						}
						paramExps.push(sym_pi);
						_paramExps.push(null);
						sf.removeOperandAttr(i, sym_pi);
					}
				}
				Type retType = Type.getReturnType(methodDesc);
				Expression retExp = createReturnExpression(retType, invInst, th, intent);
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
		MethodInfo mi = invInst.getInvokedMethod();
		th.getVM().addListener(new ListenerAdapter() {
			@Override
			public void instructionExecuted(VM vm, ThreadInfo currentThread, Instruction nextInstruction,
					Instruction executedInstruction) {
				if(executedInstruction instanceof ReturnInstruction && 
						executedInstruction.getMethodInfo().equals(mi)) {
					if (recoverFromSymbolicMethod(currentThread)) {
						vm.removeListener(this);
					}
				}
			}
		});
	}

	public static void pushCC2PC(ThreadInfo th, LibraryConstraint cc) {
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
		// if currentPC has constraints, append them to pc
		LibraryConstraint currentLPC = ((PCChoiceGenerator) cg).getCurrentPC().lpc.header;
		while (currentLPC != null) {
			pc.lpc._addOpt(currentLPC);
			currentLPC = currentLPC.and;
		}
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
					if(retRef != 0) {
						ElementInfo retEI = th.getModifiableElementInfo(retRef);
						System.out.println("RET " + retRef);
						System.out.println("RET (before set attr)" + retEI.getObjectAttr());
						retEI.setObjectAttr(retExp);
						System.out.println("RET " + retEI.getObjectAttr());
					} else {
						System.out.println("RET null");
					}
				} else {
					frame.setOperandAttr(retExp);
					System.out.println("RET " + frame.getOperandAttr());
				}
			}
			// turn on symbolic execution
			Map<ElementInfo, Object> intent = fAttr.symbcInfo;
			if (intent != null) {
				for (Entry<ElementInfo, Object> entry : intent.entrySet()) {
					ElementInfo ei = entry.getKey();
					ei.getModifiableInstance().setObjectAttr(entry.getValue());
					System.out.println("attach attribute " + entry.getValue() + " to " + entry.getKey());
//					ei.setObjectAttr(entry.getValue());
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
		} else if (typeName.equals("java.lang.Character")) {
			char value = ei.getDeclaredCharField("value", "java.lang.Character");
			sym_ei = new IntegerConstant(value);
			System.out.println("create symbolic expression for concrete Character " + sym_ei);
		} else if (typeName.equals("java.lang.Boolean")) {
			boolean value = ei.getDeclaredBooleanField("value","java.lang.Boolean");
			sym_ei = new IntegerConstant(value ? 1 :0);
			System.out.println("create symbolic expression for Boolean " + sym_ei);
		} else if (typeName.equals("java.lang.String") || typeName.equals("java.lang.StringBuilder") || typeName.equals("java.lang.StringBuffer")) {
			sym_ei = new StringExpression(BytecodeUtils.varName("String@" + ei.getObjectRef(), VarType.STRING), typeName);
			System.out.println("create symbolic expression for String " + sym_ei);
		} else if (typeName.equals("java.util.ArrayList") || typeName.equals("java.util.LinkedList")) {
			sym_ei = new CollectionExpression(BytecodeUtils.varName("List@" + ei.getObjectRef(), VarType.OBJECT),
					typeName);
			System.out.println("create symbolic expression for empty ArrayList " + sym_ei);
		} else if (typeName.equals("java.util.HashSet") || typeName.equals("java.util.TreeSet")) {
			sym_ei = new CollectionExpression(BytecodeUtils.varName("Set@" + ei.getObjectRef(), VarType.OBJECT),
					typeName);
			System.out.println("create symbolic expression for empty HashSet " + sym_ei);
		} else if (typeName.equals("java.util.HashMap") || typeName.equals("java.util.TreeMap")) {
			sym_ei = new CollectionExpression(BytecodeUtils.varName("Map@" + ei.getObjectRef(), VarType.OBJECT),
					typeName);
			System.out.println("create symbolic expression for empty HashMap " + sym_ei);
		}
		else if (typeName.equals("java.io.FileInputStream")) {
			sym_ei = new FileExpression(BytecodeUtils.varName("FI@" + ei.getObjectRef(), VarType.OBJECT), typeName);
			System.out.println("create symbolic expression for empty FileInputStream " + sym_ei);
		} else if (typeName.startsWith("[") && !typeName.startsWith("[[")) {
			sym_ei = new CollectionExpression(BytecodeUtils.varName("Array@" + ei.getObjectRef(), VarType.OBJECT),
					"java.util.ArrayList");
			String elementTypeName;
			if (typeName.matches("^(\\[Ljava).+")) {
				elementTypeName = typeName.substring(2).replace(";", "");
			} else {
				switch(typeName) {
				case "[B": 
				case "[S":
				case "[I":
				case "[L":
					elementTypeName = "int";
					break;
				case "[Z":
					elementTypeName = "boolean";
					break;
				case "[C":
					elementTypeName = "char";
				case "[F":
				case "[D":
					elementTypeName = "float";
					break;
				default:
					elementTypeName = "unknown";
					System.out.println("unknown array type");
				}
			}
			((CollectionExpression) sym_ei).setElementTypeName(elementTypeName);
//		} else if (typeName.equals("[B")) {
//			sym_ei = new CollectionExpression(BytecodeUtils.varName("AB@" + ei.getObjectRef(), VarType.OBJECT),
//					"java.util.ArrayList");
//			((CollectionExpression) sym_ei).setElementTypeName("java.lang.Byte");
			LibraryConstraint cc = new LibraryConstraint(LibraryOperation.ARRAY_INIT2,
					new Expression[] { null, new IntegerConstant(ei.arrayLength()) }, null,
					new Expression[] { sym_ei, null });
			// add this constraint to current PC
			ChoiceGenerator<?> cg = th.getVM().getChoiceGenerator();
			PathCondition pc = ((PCChoiceGenerator) cg).getCurrentPC();
			pc.lpc._addOpt(cc);
			((PCChoiceGenerator) cg).setCurrentPC(pc);
			System.out.println("create symbolic expression for byte[] " + sym_ei);
		} else {
			if(typeName.equals("java.security.MessageDigest")) {
				// define data type if necessary
				sym_ei = new IntegerConstant(24);
				System.out.println("create concrete Integer 24 to represent java.security.MessageDigest (unused) " + sym_ei);
			} else {
				throw new JPFException("object is of type " + ei.getClassInfo().getName());
			}
		}
		return sym_ei;
	}

	Expression createReturnExpression(Type retType, JVMInvokeInstruction invInst, ThreadInfo th,
			Map<ElementInfo, Object> intent) {
		Expression retExp;
		if (retType == Type.VOID) {
			retExp = null;
		} else if (retType == Type.BOOLEAN) {
			retExp = new SymbolicInteger(BytecodeUtils.varName("ret", VarType.INT), 0, 1);
		} else if (retType == Type.CHAR || retType == Type.INT) {
			retExp = new SymbolicInteger(BytecodeUtils.varName("ret", VarType.INT));
		} else if (retType == Type.STRING) {
			retExp = new StringExpression(BytecodeUtils.varName("ret", VarType.STRING), "java.lang.String");
		} else if (retType.getType() == Type.OBJECT.getType() || retType instanceof ArrayType) {
			CollectionExpression sym_b = null;
			StackFrame sf = th.getModifiableTopFrame();
			int objRef = invInst.getArgSize() - 1;
			if (sf.isOperandRef(objRef)) {
				ElementInfo base = th.getElementInfo(sf.peek(objRef));
				if (intent.get(base) instanceof CollectionExpression) {
					sym_b = (CollectionExpression) intent.get(base);
				}
			}
			String typeName = retType.toString();
			if (retType instanceof ArrayType) {
				String elementTypeName = ((ArrayType) retType).getElementType().toString();
				retExp = new CollectionExpression(BytecodeUtils.varName("ret@Array", VarType.ARRAY), "java.util.ArrayList");
				if (elementTypeName.equals("java.lang.Object")) {
					Instruction nextInst = invInst.getNext(th);
					if (nextInst instanceof CHECKCAST) {
						CHECKCAST checkCast = (CHECKCAST) nextInst;
						elementTypeName = checkCast.getTypeName();
					}
				}
				if (elementTypeName.equals("java.lang.Object") && sym_b != null) {
					if (sym_b.getElementTypeName() != null) {
						elementTypeName = sym_b.getElementTypeName();
					} else if(sym_b.getKeyValueTypeNames()[1] != null) {
						elementTypeName = sym_b.getKeyValueTypeNames()[1];
					}
				} else if (elementTypeName.startsWith("[")) {
					// change elementTypeName from "[Ljava.lang.Integer;" to "java.lang.Integer" or java.lang.others
					elementTypeName = elementTypeName.replaceAll("^(\\[L?)|;", "");
				}
				((CollectionExpression) retExp).setElementTypeName(elementTypeName);
			} else if (typeName.equals("java.util.Iterator") || 
					typeName.equals("java.util.List") ||
					typeName.equals("java.util.ListIterator")) {
				String suffix = typeName.substring(typeName.lastIndexOf(".") + 1);
				retExp = new CollectionExpression(BytecodeUtils.varName("ret@" + suffix, VarType.OBJECT), typeName);
				if (sym_b != null) {
					((CollectionExpression) retExp).setElementTypeName(sym_b.getElementTypeName());
				}
			} else if(typeName.equals("java.util.Set") || typeName.equals("java.util.Collection")) {
				retExp = new CollectionExpression(BytecodeUtils.varName("ret@Set", VarType.OBJECT), typeName);
				if (sym_b != null) {
					if(invInst.getInvokedMethod().getName().contains("keySet")) {
						((CollectionExpression) retExp).setElementTypeName(sym_b.getKeyValueTypeNames()[0]);
					} else if(invInst.getInvokedMethod().getName().contains("values")) {
						((CollectionExpression) retExp).setElementTypeName(sym_b.getKeyValueTypeNames()[1]);
					} else {
						((CollectionExpression) retExp).setElementTypeName(sym_b.getElementTypeName());
					}
				}
			} else {
				if (typeName.equals("java.lang.Object")) {
					Instruction nextInst = invInst.getNext(th);
					if (nextInst instanceof CHECKCAST) {
						CHECKCAST checkCast = (CHECKCAST) nextInst;
						typeName = checkCast.getTypeName();
					}
				}
				if (typeName.equals("java.lang.Object") && sym_b != null) {
					if (sym_b.getElementTypeName() != null) {
						typeName = sym_b.getElementTypeName();
					} else if(sym_b.getKeyValueTypeNames()[1] != null) {
						typeName = sym_b.getKeyValueTypeNames()[1];
					}
				}
				if (typeName.equals("java.lang.Integer")) {
					retExp = new SymbolicInteger(BytecodeUtils.varName("ret", VarType.INT));
				} else if (typeName.equals("java.lang.Character")) {
					retExp = new SymbolicInteger(BytecodeUtils.varName("ret", VarType.INT), 0, 128);
				} else if (typeName.equals("java.lang.Boolean")) {
					retExp = new SymbolicInteger(BytecodeUtils.varName("ret", VarType.INT), 0, 1);
				} else if (typeName.equals("java.lang.String") || typeName.equals("java.lang.StringBuilder")
						|| typeName.equals("java.lang.StringBuffer")) {
					retExp = new StringExpression(BytecodeUtils.varName("ret", VarType.STRING), "java.lang.String");
				} else {
					System.out.println(sym_b.getKeyValueTypeNames()[0]);
					throw new JPFException("object is of type " + retType);
				}
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
//	StringSymbolic updateVersion(StringSymbolic sym) {
//		Pattern pat = Pattern.compile("^(.*)_\\d+_[^_]+$");
//		Matcher mat = pat.matcher(sym.getName());
//		mat.find();
//		StringSymbolic copy_sym = new StringSymbolic(BytecodeUtils.varName(mat.group(1), VarType.STRING));
//		return copy_sym;
//	}

}
