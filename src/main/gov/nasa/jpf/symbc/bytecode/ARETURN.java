package gov.nasa.jpf.symbc.bytecode;

import java.util.Map;
import java.util.Map.Entry;

import gov.nasa.jpf.symbc.numeric.Expression;
import gov.nasa.jpf.vm.ElementInfo;
import gov.nasa.jpf.vm.Instruction;
import gov.nasa.jpf.vm.StackFrame;
import gov.nasa.jpf.vm.ThreadInfo;

public class ARETURN extends gov.nasa.jpf.jvm.bytecode.ARETURN {

	@Override
	public Instruction execute(ThreadInfo th) {
		StackFrame callerFrame = th.getCallerStackFrame();
		Object retExp = callerFrame.getFrameAttr();
		if(retExp instanceof Expression) {
			StackFrame calleeFrame = th.getModifiableTopFrame();
			// caller frame peek() is parameters, callee frame is return value
			if(calleeFrame.isOperandRef()) {
				int retRef = calleeFrame.peek();
				ElementInfo retEI = th.getModifiableElementInfo(retRef);
				System.out.println("ARET "+retRef);
				System.out.println("ARET (before set attr)"+retEI.getObjectAttr());
//				retEI.addObjectAttr(retExp);
				retEI.setObjectAttr(retExp);
				System.out.println("ARET "+retEI.getObjectAttr());
			} else {
				super.addReturnAttr(th, retExp);
				System.out.println("ARET "+super.getReturnAttr(th));
			}
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
