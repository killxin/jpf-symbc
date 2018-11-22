package edu.nju.seg.symbc.collections;

import java.util.Map;

import gov.nasa.jpf.jvm.bytecode.CHECKCAST;
import gov.nasa.jpf.jvm.bytecode.JVMInvokeInstruction;
import gov.nasa.jpf.symbc.numeric.ConstraintExpressionVisitor;
import gov.nasa.jpf.symbc.numeric.Expression;
import gov.nasa.jpf.vm.Instruction;
import gov.nasa.jpf.vm.StackFrame;
import gov.nasa.jpf.vm.ThreadInfo;

public class CollectionExpression extends Expression {
	
	private String name;
	private boolean isSYM;
	private String typeName;
	private String elementTypeName;
	private com.microsoft.z3.Sort sort;
	private CollectionExpression copyFrom;

	public CollectionExpression(String name) {
		this.name = name;
		this.isSYM = false;
//        this.length = new SymbolicInteger(name+"_length");
	}

	public CollectionExpression(String name, String typeName, boolean isSYM) {
		this.name = name;
		this.typeName = typeName;
		this.isSYM = isSYM;
		this.elementTypeName = null;
		this.sort = null;
		this.copyFrom = null;
	}

	public CollectionExpression clone() {
		CollectionExpression copy = new CollectionExpression(name, typeName, isSYM);
		copy.setElementTypeName(this.elementTypeName);
		copy.setCopyFrom(this);
		return copy;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public boolean isSYM() {
		return isSYM;
	}
	
	public String toString() {
		return name;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getElementTypeName() {
		return elementTypeName;
	}

	public void setElementTypeName(String elementTypeName) {
		this.elementTypeName = elementTypeName;
		CollectionExpression pre = copyFrom;
		while(pre != null && pre.getElementTypeName() == null) {
			pre.setElementTypeName(elementTypeName);
			pre = pre.copyFrom;
		}
	}
	
	public void setElementTypeName(CollectionOperation opt, JVMInvokeInstruction invInst, ThreadInfo th) {
		StackFrame sf = th.getTopFrame();
		if(getElementTypeName() == null) {
			if(opt == CollectionOperation.ARRAYLIST_ADD) {
				String typeName = th.getModifiableElementInfo(sf.peek(0)).getClassInfo().getName();
				setElementTypeName(typeName);
			} else if(opt == CollectionOperation.ARRAYLIST_ADD2) {
				String typeName = th.getModifiableElementInfo(sf.peek(1)).getClassInfo().getName();
				setElementTypeName(typeName);
			} else if(opt == CollectionOperation.ARRAYLIST_GET) {
				Instruction nextInst = invInst.getNext(th);
				if(nextInst instanceof CHECKCAST) {
					CHECKCAST checkCast = (CHECKCAST) nextInst;
					String typeName = checkCast.getTypeName();
					setElementTypeName(typeName);
				}
			}
		}
	}
	
	public com.microsoft.z3.Sort getSort() {
		return sort;
	}

	public void setSort(com.microsoft.z3.Sort sort) {
		this.sort = sort;
	}

	public CollectionExpression getCopyFrom() {
		return copyFrom;
	}

	public void setCopyFrom(CollectionExpression copyFrom) {
		this.copyFrom = copyFrom;
	}

	@Override
	public void accept(ConstraintExpressionVisitor visitor) {
		visitor.preVisit(this);
		visitor.postVisit(this);
	}
	
	@Override
	public String stringPC() {
		return getName();
	}

	@Override
	public void getVarsVals(Map<String, Object> varsVals) {
		// TODO: I don't know yet
	}

	@Override
	public int compareTo(Expression o) {
		// TODO Auto-generated method stub
		return 0;
	}
}
