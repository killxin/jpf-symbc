package gov.nasa.jpf.symbc.bytecode;

import edu.nju.seg.symbc.LibraryConstraint;
import edu.nju.seg.symbc.LibraryExpression;
import edu.nju.seg.symbc.LibraryOperation;
import gov.nasa.jpf.Config;
import gov.nasa.jpf.symbc.bytecode.BytecodeUtils.VarType;
import gov.nasa.jpf.symbc.numeric.Expression;
import gov.nasa.jpf.symbc.numeric.IntegerExpression;
import gov.nasa.jpf.symbc.numeric.PCChoiceGenerator;
import gov.nasa.jpf.symbc.numeric.SymbolicInteger;
import gov.nasa.jpf.vm.ChoiceGenerator;
import gov.nasa.jpf.vm.ElementInfo;
import gov.nasa.jpf.vm.Instruction;
import gov.nasa.jpf.vm.MJIEnv;
import gov.nasa.jpf.vm.StackFrame;
import gov.nasa.jpf.vm.ThreadInfo;

// add by czz
public class ARRAYLENGTH extends gov.nasa.jpf.jvm.bytecode.ARRAYLENGTH {

	@Override
	public Instruction execute(ThreadInfo ti) {
		Config conf = ti.getVM().getConfig();
		boolean symlibraries_flag = conf.getBoolean("symbolic.libraries");
		if (symlibraries_flag && SymbolicLibraryHandler.inSymScale(this, ti)) {
				ChoiceGenerator<?> cg;
				if (!ti.isFirstStepInsn()) {
					cg = new PCChoiceGenerator(1);
					ti.getVM().setNextChoiceGenerator(cg);
					return this;
				} else {
				    StackFrame frame = ti.getModifiableTopFrame();
			
				    arrayRef = frame.peek();
			
				    if (arrayRef == MJIEnv.NULL){
				      return ti.createAndThrowException("java.lang.NullPointerException",
				                                        "array length of null object");
				    }

				    LibraryExpression arrExpr = null;
				    SymbolicInteger lengthExpr = new SymbolicInteger(BytecodeUtils.varName("length", VarType.INT));
//				    assert frame.isOperandRef();
				    arrExpr = (LibraryExpression) frame.getOperandAttr();
				    if (arrExpr == null && frame.isOperandRef()) {
					    ElementInfo ei = ti.getElementInfo(arrayRef);
					    arrExpr = (LibraryExpression) ei.getObjectAttr();
					    frame.pop();
					    frame.push(ei.arrayLength());
				    }
				    
				    frame.setOperandAttr(lengthExpr);				    
					LibraryConstraint cc = new LibraryConstraint(LibraryOperation.ARRAY_LENGTH,
							new Expression[] {arrExpr}, lengthExpr, new Expression[1]);
					SymbolicLibraryHandler.pushCC2PC(ti, cc);
				    return getNext(ti);
			}
		} else {
			return super.execute(ti);
		}
	}
	
}
