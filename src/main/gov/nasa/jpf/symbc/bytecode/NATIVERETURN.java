package gov.nasa.jpf.symbc.bytecode;

import gov.nasa.jpf.vm.ElementInfo;
import gov.nasa.jpf.vm.Instruction;
import gov.nasa.jpf.vm.StackFrame;
import gov.nasa.jpf.vm.ThreadInfo;

public class NATIVERETURN extends gov.nasa.jpf.jvm.bytecode.NATIVERETURN {

	@Override
	public Instruction execute(ThreadInfo th) {
		String fullName = mi.getFullName();
        if(fullName.equalsIgnoreCase("java.lang.Integer.valueOf(I)Ljava/lang/Integer;")) {
        	StackFrame callerFrame = th.getCallerStackFrame();
        	int paramRef = callerFrame.peek(0);
        	Object attr = callerFrame.getOperandAttr(0);
        	Integer objRef = (Integer)super.getReturnValue(th);
        	ElementInfo ei = th.getModifiableElementInfo(objRef);
        	ei.setObjectAttr(attr);
        	System.out.println("NATIVE:"+callerFrame);
        	System.out.println("NATIVE:"+paramRef);
        	System.out.println("NATIVE:"+ei+":"+ei.getObjectAttr());
        }
        return super.execute(th);
	}

}
