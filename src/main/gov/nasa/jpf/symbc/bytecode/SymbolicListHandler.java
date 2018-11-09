package gov.nasa.jpf.symbc.bytecode;

import gov.nasa.jpf.jvm.bytecode.JVMInvokeInstruction;
import gov.nasa.jpf.symbc.numeric.Expression;
import gov.nasa.jpf.symbc.numeric.IntegerExpression;
import gov.nasa.jpf.symbc.numeric.PCChoiceGenerator;
import gov.nasa.jpf.symbc.string.StringExpression;
import gov.nasa.jpf.symbc.string.SymbolicStringBuilder;
import gov.nasa.jpf.vm.ChoiceGenerator;
import gov.nasa.jpf.vm.Instruction;
import gov.nasa.jpf.vm.StackFrame;
import gov.nasa.jpf.vm.ThreadInfo;

public class SymbolicListHandler {
	
	public boolean isMethodListSymbolic(JVMInvokeInstruction invInst, ThreadInfo th) {
		String cname = invInst.getInvokedMethodClassName();
		if (cname.equals("java.util.ArrayList")
				|| cname.equals("java.lang.Integer")
//				|| cname.equals("java.lang.Float")
//				|| cname.equals("java.lang.Double")
//				|| cname.equals("java.lang.Long")
//				|| cname.equals("java.lang.Short")
//				|| cname.equals("java.lang.Byte")
//				|| cname.equals("java.lang.Char")
//				|| cname.equals("java.lang.Boolean")
//				|| cname.equals("java.lang.Object")
				){
	        
			StackFrame sf = th.getModifiableTopFrame();

			int numStackSlots = invInst.getArgSize();

			for (int i = 0; i < numStackSlots; i++) {
				Expression sym_v1 = (Expression) sf.getOperandAttr(i);
				if (sym_v1 != null) {
					return true; 
				}
			}
			return false;
		}	
		else return false;
	}

	public Instruction handleSymbolicLists(JVMInvokeInstruction invInst, ThreadInfo th) {
		boolean needToHandle = isMethodListSymbolic(invInst, th);

		if (needToHandle) {
			// do the string manipulations
			String mname = invInst.getInvokedMethodName();
			String shortName = mname.substring(0, mname.indexOf("("));
			if (shortName.equals("add")) {
				Instruction handled = null;
//				handled = handleAddx(invInst, th);
				if (handled != null) {
					return handled;
				}
			} else if (shortName.equals("get")) {
				Instruction handled = null;
				if (handled != null) {
					return handled;
				}
			}  else if (shortName.equals("<init>")) {
				Instruction handled = handleInit(invInst, th);
				if (handled != null) {
					return handled;
				} else {
					return null;
				}
			} else if (shortName.equals("intValue")) {
//				handleintValue(invInst, th);
			} else {
				throw new RuntimeException("ERROR: symbolic method not handled: " + shortName);
				//return null;
			}
			return invInst.getNext(th);
		} else {
			return null;
		}
	}
	
	public Instruction handleInit(JVMInvokeInstruction invInst,  ThreadInfo th) {

		String cname = invInst.getInvokedMethodClassName();
		if (cname.equals("java.lang.ArrayList")) {
			
			StackFrame sf = th.getModifiableTopFrame();
			StringExpression sym_v1 = (StringExpression) sf.getOperandAttr(0);
			SymbolicStringBuilder sym_v2 = (SymbolicStringBuilder) sf.getOperandAttr(1);
			if (sym_v1 == null) {
				throw new RuntimeException("ERROR: symbolic StringBuilder method must have one symbolic operand in Init");
			} else {
				sf.pop(); /* string object */
				sf.pop(); /* one stringBuilder Object */
				sym_v2.putstr(sym_v1);
				sf.setOperandAttr(sym_v2);
				return invInst.getNext();
			}
		} else {
			// Corina TODO: we should allow symbolic string analysis to kick in only when desired
			//throw new RuntimeException("Warning Symbolic String Analysis: Initialization type not handled in symbc/bytecode/SymbolicStringHandler init");
			return null;
		}
	}

}
