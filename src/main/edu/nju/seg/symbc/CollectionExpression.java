package edu.nju.seg.symbc;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import gov.nasa.jpf.ListenerAdapter;
import gov.nasa.jpf.jvm.bytecode.CHECKCAST;
import gov.nasa.jpf.jvm.bytecode.JVMInvokeInstruction;
import gov.nasa.jpf.symbc.numeric.Expression;
import gov.nasa.jpf.vm.ElementInfo;
import gov.nasa.jpf.vm.Instruction;
import gov.nasa.jpf.vm.StackFrame;
import gov.nasa.jpf.vm.ThreadInfo;
import gov.nasa.jpf.vm.VM;

public class CollectionExpression extends LibraryExpression {
	
	private String elementTypeName;

	public CollectionExpression(String name, String typeName, boolean isSYM) {
		super(name, typeName, isSYM);
		this.elementTypeName = null;
	}

	public CollectionExpression clone() {
		CollectionExpression copy = new CollectionExpression(name, typeName, isSYM);
		copy.setCopyFrom(this);
		copy.setElementTypeName(this.elementTypeName);
		return copy;
	}

	public String getElementTypeName() {
		return elementTypeName;
	}
	
	public String getElementSort() {
		switch (elementTypeName) {
		case "java.lang.Integer":
		case "java.lang.Byte":
			return "Int";
		default:
			return elementTypeName;
		}
	}
	
	public CollectionExpression getCopyFrom() {
		return (CollectionExpression) copyFrom;
	}

	public void setCopyFrom(CollectionExpression copyFrom) {
		this.copyFrom = copyFrom;
	}

	public void setElementTypeName(String elementTypeName) {
		this.elementTypeName = elementTypeName;
		CollectionExpression pre = getCopyFrom();
		while(pre != null && pre.getElementTypeName() == null) {
			pre.setElementTypeName(elementTypeName);
			pre = pre.getCopyFrom();
		}
	}
	
	public void setElementTypeName(LibraryOperation opt, JVMInvokeInstruction invInst, ThreadInfo th) {
		StackFrame sf = th.getTopFrame();
		if(getElementTypeName() == null) {
			if(opt == LibraryOperation.LIST_ADD ||
					opt == LibraryOperation.ARRAYLIST_ADD ||
					opt == LibraryOperation.LINKEDLIST_ADD ||
					opt == LibraryOperation.LIST_ADD2 ||
					opt == LibraryOperation.ARRAYLIST_ADD2 ||
					opt == LibraryOperation.LINKEDLIST_ADD2
			) {
				String typeName = th.getModifiableElementInfo(sf.peek(0)).getClassInfo().getName();
				setElementTypeName(typeName);
			} else if(opt == LibraryOperation.LIST_GET ||
					opt == LibraryOperation.ARRAYLIST_GET ||
					opt == LibraryOperation.LINKEDLIST_GET
			) {
				Instruction nextInst = invInst.getNext(th);
				if(nextInst instanceof CHECKCAST) {
					CHECKCAST checkCast = (CHECKCAST) nextInst;
					String typeName = checkCast.getTypeName();
					setElementTypeName(typeName);
				}
			}
		}
	}
	
	public static Map<Integer, String> objRef2elemType = new HashMap<>();
	
	public static void ensureElementType(LibraryOperation opt, JVMInvokeInstruction invInst, ThreadInfo th) {
		StackFrame sf = th.getTopFrame();
		if(opt == LibraryOperation.LIST_ADD ||
				opt == LibraryOperation.ARRAYLIST_ADD ||
				opt == LibraryOperation.LINKEDLIST_ADD
		) {
			String typeName = th.getModifiableElementInfo(sf.peek(0)).getClassInfo().getName();
			int objRef = sf.peek(1);
			objRef2elemType.put(objRef, typeName);
		} else if(opt == LibraryOperation.ARRAYLIST_LISTITERATOR) {
			int objRef = sf.peek(1);
			if(objRef2elemType.containsKey(objRef)) {
				String typeName = objRef2elemType.get(objRef);
				Instruction inst = invInst.getInvokedMethod().getLastInsn();
				th.getVM().addListener(new ListenerAdapter() {
					@Override
					public void instructionExecuted(VM vm, ThreadInfo currentThread, Instruction nextInstruction,
							Instruction executedInstruction) {
						if (executedInstruction.equals(inst)) {
							StackFrame frame = th.getModifiableTopFrame();
							int retRef = frame.peek();
							objRef2elemType.put(retRef, typeName);
							vm.removeListener(this);
						}
					}
				});
			}
		}
	}
	
}
