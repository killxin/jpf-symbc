package edu.nju.seg.symbc;

import gov.nasa.jpf.jvm.bytecode.CHECKCAST;
import gov.nasa.jpf.jvm.bytecode.JVMInvokeInstruction;
import gov.nasa.jpf.vm.Instruction;
import gov.nasa.jpf.vm.StackFrame;
import gov.nasa.jpf.vm.ThreadInfo;

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
			if(opt == LibraryOperation.ARRAYLIST_ADD) {
				String typeName = th.getModifiableElementInfo(sf.peek(0)).getClassInfo().getName();
				setElementTypeName(typeName);
			} else if(opt == LibraryOperation.ARRAYLIST_ADD2) {
				String typeName = th.getModifiableElementInfo(sf.peek(1)).getClassInfo().getName();
				setElementTypeName(typeName);
			} else if(opt == LibraryOperation.ARRAYLIST_GET) {
				Instruction nextInst = invInst.getNext(th);
				if(nextInst instanceof CHECKCAST) {
					CHECKCAST checkCast = (CHECKCAST) nextInst;
					String typeName = checkCast.getTypeName();
					setElementTypeName(typeName);
				}
			}
		}
	}
	
	public CollectionExpression getCopyFrom() {
		return (CollectionExpression) copyFrom;
	}

	public void setCopyFrom(CollectionExpression copyFrom) {
		this.copyFrom = copyFrom;
	}
}
