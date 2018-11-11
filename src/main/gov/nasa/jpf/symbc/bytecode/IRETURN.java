package gov.nasa.jpf.symbc.bytecode;

import java.util.Map;
import java.util.Map.Entry;

import gov.nasa.jpf.symbc.numeric.Expression;
import gov.nasa.jpf.util.ObjectList;
import gov.nasa.jpf.vm.ElementInfo;
import gov.nasa.jpf.vm.Instruction;
import gov.nasa.jpf.vm.StackFrame;
import gov.nasa.jpf.vm.ThreadInfo;

public class IRETURN extends gov.nasa.jpf.jvm.bytecode.IRETURN {

	@Override
	public Instruction execute(ThreadInfo th) {
		String fullName = mi.getFullName();
        if(fullName.equalsIgnoreCase("java.lang.Integer.intValue()I")) {
        	StackFrame callerFrame = th.getCallerStackFrame();
        	int objRef = callerFrame.peek(0);
        	ElementInfo ei = th.getElementInfo(objRef);
        	Object attr = ei.getObjectAttr();
        	super.setReturnAttr(th, attr);
        	System.out.println("IRET:"+callerFrame);
        	System.out.println("IRET:"+th.getTopFrame());
        	System.out.println("IRET:"+callerFrame.getOperandAttr());
        	System.out.println("IRET:"+super.getReturnAttr(th));
//        	System.out.println("IRET:"+ei+":"+ei.getObjectAttr());
        	Object objAttr = ei.getObjectAttr();
    		Object head = ObjectList.getFirst(objAttr);
    		Object pre = null;
    		while(head != null) {
    			System.out.println("IRET:"+objRef+":"+head);
    			Object current = ObjectList.getNext(head, pre);
    			pre = head;
    			head = current;
    		}
        }
        
		StackFrame callerFrame = th.getCallerStackFrame();
		Object retExp = callerFrame.getFrameAttr();
		if(retExp instanceof Expression) {
			super.addReturnAttr(th, retExp);
			callerFrame.removeFrameAttr(retExp);
		}
		
		StackFrame calleeFrame = th.getTopFrame();
		Object objFAttr = calleeFrame.getFrameAttr();
		if(objFAttr instanceof Map) {
			Map<Object,Object> fAttr = (Map) objFAttr;
			for(Entry<Object,Object> entry : fAttr.entrySet()) {
				Object key = entry.getKey();
				if(key instanceof ElementInfo) {
					ElementInfo ei = (ElementInfo) key;
					ei.addObjectAttr(entry.getValue());
				}
				// useless maybe
				else if (key instanceof Integer) {
					// [@373,0(x_1_SYMINT)^top] --> [@373,0(x_1_SYMINT)^top-(top-1),@374^top]
		            // addOperandAttr(offset): top-offset, set offset = top-(top-1) = 1
					calleeFrame.addOperandAttr(calleeFrame.getTopPos()-(Integer)key, entry.getValue());
				}
			}
		}
        
        return super.execute(th);
	}

}
