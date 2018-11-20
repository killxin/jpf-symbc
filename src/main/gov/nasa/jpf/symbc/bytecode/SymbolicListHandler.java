package gov.nasa.jpf.symbc.bytecode;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeSet;

import edu.nju.seg.symbc.collections.CollectionConstraint;
import edu.nju.seg.symbc.collections.FrameAttribute;
import edu.nju.seg.symbc.collections.CollectionExpression;
import edu.nju.seg.symbc.collections.CollectionOperator;
import gov.nasa.jpf.JPFException;
import gov.nasa.jpf.ListenerAdapter;
import gov.nasa.jpf.jvm.bytecode.ARETURN;
import gov.nasa.jpf.jvm.bytecode.IRETURN;
import gov.nasa.jpf.jvm.bytecode.JVMInvokeInstruction;
import gov.nasa.jpf.jvm.bytecode.NATIVERETURN;
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

public class SymbolicListHandler {
	
	public static Set<String> pureMethods;
	public static Set<String> sideEffectMethods;
	static {
		pureMethods = new TreeSet<>();
		pureMethods.add("java.util.ArrayList.get(I)Ljava/lang/Object;");
		pureMethods.add("java.lang.Integer.valueOf(I)Ljava/lang/Integer;");
		pureMethods.add("java.lang.Integer.intValue()I");
		
		sideEffectMethods = new TreeSet<>();
		sideEffectMethods.add("java.util.ArrayList.<init>()V");
		sideEffectMethods.add("java.util.ArrayList.add(Ljava/lang/Object;)Z");
	}

	public boolean isMethodListSymbolic(JVMInvokeInstruction invInst, ThreadInfo th) {
		String fullName = invInst.getInvokedMethod().getFullName();
		if(sideEffectMethods.contains(fullName)) {
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
		} else if (pureMethods.contains(fullName)) {
			StackFrame sf = th.getModifiableTopFrame();
			int numStackSlots = invInst.getArgSize();
			int numParam = invInst.getInvokedMethod().isStatic() ? numStackSlots : numStackSlots - 1;
			for (int i = 0; i < numParam; i++) {
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
			return false;
		}
	}

	public Instruction handleSymbolicLists(JVMInvokeInstruction invInst, ThreadInfo th) {
		boolean needToHandle = isMethodListSymbolic(invInst, th);
		if (needToHandle) {
			String mname = invInst.getInvokedMethod().getFullName();
			if (mname.equals("java.util.ArrayList.<init>()V")) {
				ChoiceGenerator<?> cg;
				if (!th.isFirstStepInsn()) {
					cg = new PCChoiceGenerator(1);
					th.getVM().setNextChoiceGenerator(cg);
					return invInst;
				} else {
					handleArrayListInit(invInst, th);
				}
			} else if (mname.equals("java.util.ArrayList.add(Ljava/lang/Object;)Z")) {
				ChoiceGenerator<?> cg;
				if (!th.isFirstStepInsn()) {
					cg = new PCChoiceGenerator(1);
					th.getVM().setNextChoiceGenerator(cg);
					return invInst;
				} else {
					handleArrayListAdd(invInst, th);
				}
			} else if (mname.equals("java.util.ArrayList.get(I)Ljava/lang/Object;")) {
				ChoiceGenerator<?> cg;
				if (!th.isFirstStepInsn()) {
					cg = new PCChoiceGenerator(1);
					th.getVM().setNextChoiceGenerator(cg);
					return invInst;
				} else {
					handleArrayListGet(invInst, th);
				}
			} else if (mname.equals("java.lang.Integer.valueOf(I)Ljava/lang/Integer;")) {
				handleIntegerValueOf(invInst, th);
			} else if (mname.equals("java.lang.Integer.intValue()I")) {
				handleIntegerIntValue(invInst, th);
			} else {
				throw new RuntimeException("ERROR: symbolic method not handled: " + mname);
			}
		}
		return null;
	}

	public void handleArrayListAdd(JVMInvokeInstruction invInst, ThreadInfo th) {
		StackFrame sf = th.getModifiableTopFrame();
		ElementInfo p1 = th.getModifiableElementInfo(sf.peek(0));
		ElementInfo base = th.getModifiableElementInfo(sf.peek(1));
		CollectionExpression sym_b = base != null ? (CollectionExpression) base.getObjectAttr() : null;
		Expression sym_p = p1 != null ? (Expression) p1.getObjectAttr() : null;
		if (sym_p == null) {
			if (p1.getClassInfo().getName().equals("java.lang.Integer")) {
				sym_p = new IntegerConstant(p1.asInteger());
				System.out.println("create symbolic expression for concrete Integer " + sym_p);
			} else {
				throw new JPFException("object is of type " + p1.getClassInfo().getName());
			}
		}
		IntegerExpression retExp = new SymbolicInteger(BytecodeUtils.varName("rEturn", VarType.INT), 0, 1);
		CollectionExpression new_sym_b = updateVersion(sym_b);
		CollectionConstraint cc = new CollectionConstraint(CollectionOperator.ARRAYLIST_ADD, sym_b, new Expression[] { sym_p }, retExp, new_sym_b, null);
		pushCC2PC(th,cc);
		// turn off symbolic execution
		Map<ElementInfo, Object> intent = new HashMap<>();
		intent.put(base, new_sym_b); // update the object symbol
	    intent.put(p1, sym_p);
	    base.removeObjectAttr(sym_b);
	    p1.removeObjectAttr(sym_p);
	    sf.setFrameAttr(new FrameAttribute(retExp,intent));
	    // insert listener to do something when return
        th.getVM().addListener(new ListenerAdapter() {
			@Override
			public void instructionExecuted(VM vm, ThreadInfo currentThread, Instruction nextInstruction,
					Instruction executedInstruction) {
				if(executedInstruction instanceof IRETURN) {
					if(recoverFromSymbolicMethod(currentThread)) {
						vm.removeListener(this);
					}
				}
			}
		});
	}

	public void handleArrayListGet(JVMInvokeInstruction invInst, ThreadInfo th) {
		StackFrame sf = th.getModifiableTopFrame();
		int p1 = sf.peek();
		ElementInfo base = th.getModifiableElementInfo(sf.peek(1));
		CollectionExpression sym_b = (CollectionExpression) base.getObjectAttr();
		IntegerExpression sym_p = sf.hasOperandAttr() ? (IntegerExpression) sf.getOperandAttr() : null;
		if(sym_p == null) {
			sym_p = new IntegerConstant(p1);
			System.out.println("create symbolic expression for concrete int "+sym_p);
		}
		IntegerExpression retExp = new SymbolicInteger(BytecodeUtils.varName("rEturn", VarType.INT));
		CollectionConstraint cc = new CollectionConstraint(CollectionOperator.ARRAYLIST_GET, sym_b, new Expression[] { sym_p }, retExp, null, null);
		pushCC2PC(th, cc);
		// turn off symbolic execution
		Map<ElementInfo, Object> intent = new HashMap<>();
        intent.put(base, sym_b);
        sf.removeOperandAttr(sym_p);
        base.removeObjectAttr(sym_b);
        sf.setFrameAttr(new FrameAttribute(retExp,intent));
        // insert listener to do something when return
        th.getVM().addListener(new ListenerAdapter() {
			@Override
			public void instructionExecuted(VM vm, ThreadInfo currentThread, Instruction nextInstruction,
					Instruction executedInstruction) {
				if(executedInstruction instanceof ARETURN) {
					if(recoverFromSymbolicMethod(currentThread)) {
						vm.removeListener(this);
					}
				}
			}
		});
	}

	public void handleArrayListInit(JVMInvokeInstruction invInst, ThreadInfo th) {
		StackFrame sf = th.getModifiableTopFrame();
		int objRef = sf.peek();
		ElementInfo ei = th.getModifiableElementInfo(objRef);
		CollectionExpression sym_v = new CollectionExpression(BytecodeUtils.varName("@" + objRef, VarType.ARRLIST), false);
		ei.setObjectAttr(sym_v);
		CollectionConstraint cc = new CollectionConstraint(CollectionOperator.ARRAYLIST_INIT, sym_v, null, null, null, null);
		pushCC2PC(th, cc);
	}
	
	public void handleIntegerValueOf(JVMInvokeInstruction invInst, ThreadInfo th) {
		StackFrame sf = th.getModifiableTopFrame();
		IntegerExpression sym_p = (IntegerExpression) sf.getOperandAttr();
		// turn off symbolic execution
        sf.removeOperandAttr(sym_p);
        sf.setFrameAttr(new FrameAttribute(sym_p,null));
		// insert listener to do something when return
        th.getVM().addListener(new ListenerAdapter() {
			@Override
			public void instructionExecuted(VM vm, ThreadInfo currentThread, Instruction nextInstruction,
					Instruction executedInstruction) {
				if(executedInstruction instanceof NATIVERETURN) {
					if(recoverFromSymbolicMethod(currentThread)) {
						vm.removeListener(this);
					}
				}
			}
		});
	}
	
	public void handleIntegerIntValue(JVMInvokeInstruction invInst, ThreadInfo th) {
		StackFrame sf = th.getModifiableTopFrame();
		int objRef = sf.peek();
		ElementInfo base = th.getElementInfo(objRef);
		IntegerExpression sym_b = (IntegerExpression) base.getObjectAttr();
		Map<ElementInfo, Object> intent = new HashMap<>();
		intent.put(base, sym_b);
		base.removeObjectAttr(sym_b);
		sf.setFrameAttr(new FrameAttribute(sym_b, intent));
		// insert listener to do something when return
        th.getVM().addListener(new ListenerAdapter() {
			@Override
			public void instructionExecuted(VM vm, ThreadInfo currentThread, Instruction nextInstruction,
					Instruction executedInstruction) {
				if(executedInstruction instanceof IRETURN) {
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
		return new CollectionExpression(BytecodeUtils.varName(mat.group(1), VarType.ARRLIST), sym.isSYM());
	}

}
