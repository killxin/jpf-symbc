/*
 * Copyright (C) 2014, United States Government, as represented by the
 * Administrator of the National Aeronautics and Space Administration.
 * All rights reserved.
 *
 * Symbolic Pathfinder (jpf-symbc) is licensed under the Apache License, 
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License. You may obtain a copy of the License at
 * 
 *        http://www.apache.org/licenses/LICENSE-2.0. 
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and 
 * limitations under the License.
 */
package gov.nasa.jpf.symbc.bytecode;

import java.util.HashMap;
import java.util.Map;

import gov.nasa.jpf.symbc.bytecode.BytecodeUtils.VarType;
import gov.nasa.jpf.symbc.collections.ArrayListExpression;
import gov.nasa.jpf.symbc.collections.SequenceOperator;
import gov.nasa.jpf.symbc.numeric.Expression;
import gov.nasa.jpf.symbc.numeric.IntegerExpression;
import gov.nasa.jpf.symbc.numeric.PCChoiceGenerator;
import gov.nasa.jpf.symbc.numeric.PathCondition;
import gov.nasa.jpf.symbc.numeric.SymbolicInteger;
import gov.nasa.jpf.vm.ChoiceGenerator;
import gov.nasa.jpf.vm.ClassChangeException;
import gov.nasa.jpf.vm.ClassInfo;
import gov.nasa.jpf.vm.ElementInfo;
import gov.nasa.jpf.vm.Instruction;
import gov.nasa.jpf.vm.MJIEnv;
import gov.nasa.jpf.vm.MethodInfo;
import gov.nasa.jpf.vm.StackFrame;
import gov.nasa.jpf.vm.ThreadInfo;

// need to fix names



public class INVOKEVIRTUAL extends gov.nasa.jpf.jvm.bytecode.INVOKEVIRTUAL {
	public INVOKEVIRTUAL(String clsName, String methodName, String methodSignature) {
	    super(clsName, methodName, methodSignature);
	  }
	@Override
	public Instruction execute( ThreadInfo th) {
		int objRef = th.getCalleeThis(getArgSize());

	    if (objRef == -1) {
	      lastObj = -1;
	      return th.createAndThrowException("java.lang.NullPointerException", "Calling '" + mname + "' on null object");
	    }

	    MethodInfo mi = getInvokedMethod(th, objRef);

	    if (mi == null) {
	      ClassInfo ci = th.getClassInfo(objRef);
	      String clsName = (ci != null) ? ci.getName() : "?UNKNOWN?";
	      return th.createAndThrowException("java.lang.NoSuchMethodError", clsName + '.' + mname);
	    }
	    
	    if(mi.getFullName().equals("java.util.ArrayList.add(Ljava/lang/Object;)Z")) {
//	        ElementInfo ei = th.getElementInfo(objRef);
	        ClassInfo ciCaller = mi.getClassInfo();
	        StackFrame frame = ciCaller.createStackFrame( th, mi);
	        int numParams = getArgSize();
	        for(int i=numParams-1;i>=0;i--) {
	        	Object attr = frame.getOperandAttr(i);
	        	System.out.println(i+": "+frame.peek(i)+":"+attr);
	        	ElementInfo ei = th.getModifiableElementInfo(frame.peek(i));
	        	if(ei != null) {
	        		System.out.println(ei.getObjectAttr());
	        	}
	        }
        	ElementInfo p1 = th.getModifiableElementInfo(frame.peek(0));
        	ElementInfo base = th.getModifiableElementInfo(frame.peek(1));
        	Object sym_b = base != null ? base.getObjectAttr() : null;
        	Object sym_p = p1 != null ? p1.getObjectAttr() : null;
        	// currently just handle both != null
        	if(sym_b != null && sym_p != null) {
        		ArrayListExpression asym_b = (ArrayListExpression) sym_b;
        		IntegerExpression isym_p = (IntegerExpression) sym_p;
        		// create a choice generator to associate the precondition with it
	            ChoiceGenerator<?> cg = null;
	          	if (!th.isFirstStepInsn()) { // first time around
	                  cg = new PCChoiceGenerator(1);
	                  th.getVM().setNextChoiceGenerator(cg);
	                  return this;
	              } else { // this is what really returns results
	                  cg = th.getVM().getChoiceGenerator();   
	              }
	        	
	        	PCChoiceGenerator prev_cg = cg.getPreviousChoiceGeneratorOfType(PCChoiceGenerator.class);
	            PathCondition pc;
	            if (prev_cg == null)
	                pc = new PathCondition();
	            else
	                pc = ((PCChoiceGenerator) prev_cg).getCurrentPC();
	//
	            pc._addOpt(SequenceOperator.ADD, asym_b, new Expression[]{isym_p}, null);
//	            pc._addDet(Comparator.GE, sym_v.length, new IntegerConstant(0));
	            ((PCChoiceGenerator) cg).setCurrentPC(pc);
        	}
	    }
	    
	    if(mi.getFullName().equals("java.util.ArrayList.get(I)Ljava/lang/Object;")) {
	        ClassInfo ciCaller = mi.getClassInfo();
	        StackFrame frame = ciCaller.createStackFrame( th, mi);
	        int numParams = getArgSize();
	        for(int i=numParams-1;i>=0;i--) {
	        	Object attr = frame.getOperandAttr(i);
	        	System.out.println(i+": "+frame.peek(i)+":"+attr);
	        	ElementInfo ei = th.getModifiableElementInfo(frame.peek(i));
	        	if(ei != null) {
	        		System.out.println(ei.getObjectAttr());
	        	}
	        }
        	ElementInfo base = th.getModifiableElementInfo(frame.peek(1));
        	Object sym_b = base != null ? base.getObjectAttr() : null;
        	Object sym_p = frame.getOperandAttr(0);
        	// currently just handle both != null
        	if(sym_b != null && sym_p != null) {
        		ArrayListExpression asym_b = (ArrayListExpression) sym_b;
        		IntegerExpression isym_p = (IntegerExpression) sym_p;
        		// create a choice generator to associate the precondition with it
	            ChoiceGenerator<?> cg = null;
	          	if (!th.isFirstStepInsn()) { // first time around
	                  cg = new PCChoiceGenerator(1);
	                  th.getVM().setNextChoiceGenerator(cg);
	                  return this;
	              } else { // this is what really returns results
	                  cg = th.getVM().getChoiceGenerator();   
	              }
	        	
	        	PCChoiceGenerator prev_cg = cg.getPreviousChoiceGeneratorOfType(PCChoiceGenerator.class);
	            PathCondition pc;
	            if (prev_cg == null)
	                pc = new PathCondition();
	            else
	                pc = ((PCChoiceGenerator) prev_cg).getCurrentPC();
	//
	            IntegerExpression retExp = new SymbolicInteger(BytecodeUtils.varName("rEturn", VarType.INT));
	            pc._addOpt(SequenceOperator.GET, asym_b, new Expression[]{isym_p}, retExp);
	            th.getTopFrame().addFrameAttr(retExp);
//	            pc._addDet(Comparator.GE, sym_v.length, new IntegerConstant(0));
	            ((PCChoiceGenerator) cg).setCurrentPC(pc);
        	}
	    }
	    
		BytecodeUtils.InstructionOrSuper nextInstr = BytecodeUtils.execute(this,  th);
        if (nextInstr.callSuper) {
            return super.execute(th);
        } else {
            return nextInstr.inst;
        }
    }
}
