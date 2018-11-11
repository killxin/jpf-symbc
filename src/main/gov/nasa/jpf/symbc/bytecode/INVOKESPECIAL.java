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

import gov.nasa.jpf.symbc.arrays.ArrayExpression;
import gov.nasa.jpf.symbc.bytecode.BytecodeUtils.InstructionOrSuper;
import gov.nasa.jpf.symbc.bytecode.BytecodeUtils.VarType;
import gov.nasa.jpf.symbc.collections.ArrayListExpression;
import gov.nasa.jpf.symbc.numeric.Comparator;
import gov.nasa.jpf.symbc.numeric.IntegerConstant;
import gov.nasa.jpf.symbc.numeric.PCChoiceGenerator;
import gov.nasa.jpf.symbc.numeric.PathCondition;
import gov.nasa.jpf.vm.ChoiceGenerator;
import gov.nasa.jpf.vm.ClassInfo;
import gov.nasa.jpf.vm.ElementInfo;
import gov.nasa.jpf.vm.Instruction;
import gov.nasa.jpf.vm.MethodInfo;
import gov.nasa.jpf.vm.StackFrame;
import gov.nasa.jpf.vm.ThreadInfo;

// need to fix names



/**
 * Invoke instance method; special handling for superclass, private,
 * and instance initialization method invocations
 * ..., objectref, [arg1, [arg2 ...]] => ...
 */
public class INVOKESPECIAL extends gov.nasa.jpf.jvm.bytecode.INVOKESPECIAL {
	public INVOKESPECIAL(String clsName, String methodName, String methodSignature) {
	    super(clsName, methodName, methodSignature);
	  }
	@Override
	public Instruction execute(ThreadInfo th) {
		MethodInfo mi = getInvokedMethod(th);

	    if (mi == null){
	      return th.createAndThrowException("java.lang.NoSuchMethodException!*", "Calling " + cname + '.' + mname);
	    }
	    
	    //	BytecodeUtils.execute: ... else if (argTypes[j].equalsIgnoreCase("int[]") ...
	    String fullName = mi.getFullName();
        if(fullName.equalsIgnoreCase("java.util.ArrayList.<init>()V")) {
        	// create a choice generator to associate the precondition with it
//            ChoiceGenerator<?> cg = null;
//        	if (!th.isFirstStepInsn()) { // first time around
//                cg = new PCChoiceGenerator(1);
//                th.getVM().setNextChoiceGenerator(cg);
//                return this;
//            } else { // this is what really returns results
//                cg = th.getVM().getChoiceGenerator();   
//            }
        	ClassInfo ciCaller = mi.getClassInfo();
	        StackFrame sf = ciCaller.createStackFrame( th, mi);
	        
	        int numParams = getArgSize();
	        for(int i=numParams-1;i>=0;i--) {
	        	sf.getOperandAttr(i);
	        	System.out.println(i+": "+sf.peek(i));
	        }
	        int stackIdx = 0;
	        int objRef = sf.peek(stackIdx);
	        ElementInfo ei = th.getModifiableElementInfo(objRef);
	        ArrayListExpression sym_v = new ArrayListExpression(BytecodeUtils.varName("@"+objRef, VarType.ARRLIST));
	        ei.setObjectAttr(sym_v);
	        System.out.println(ei.getObjectAttr());
//	        sf.setOperandAttr(stackIdx, sym_v);
//	        System.out.println(sf.peek(stackIdx)+":"+sf.getOperandAttr(stackIdx));
//        	ArrayExpression sym_v = new ArrayExpression(th.getElementInfo(sf.peek()).toString());
//            expressionMap.put(name, sym_v);
//            sf.setOperandAttr(stackIdx, sym_v);
//            outputString = outputString.concat(" " + sym_v + ",");
//
//            PCChoiceGenerator prev_cg = cg.getPreviousChoiceGeneratorOfType(PCChoiceGenerator.class);
//            PathCondition pc;
//            if (prev_cg == null)
//                pc = new PathCondition();
//            else
//                pc = ((PCChoiceGenerator) prev_cg).getCurrentPC();
////
//            pc._addDet(Comparator.GE, sym_v.length, new IntegerConstant(0));
//            ((PCChoiceGenerator) cg).setCurrentPC(pc)
        }
		BytecodeUtils.InstructionOrSuper nextInstr = BytecodeUtils.execute(this, th);
        if (nextInstr.callSuper) {
            return super.execute(th);
        } else {
            return nextInstr.inst;
        }
    }
}
