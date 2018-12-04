package edu.nju.seg.symbc;

import java.util.Map;

import gov.nasa.jpf.symbc.numeric.ConstraintExpressionVisitor;
import gov.nasa.jpf.symbc.numeric.Expression;

public class LibraryExpression extends Expression {
	
	protected String name;
	protected boolean isSYM;
	protected String typeName;
	protected com.microsoft.z3.Sort sort;
	protected LibraryExpression copyFrom;

	public LibraryExpression(String name, String typeName, boolean isSYM) {
		this.name = name;
		this.typeName = typeName;
		this.isSYM = isSYM;
		this.sort = null;
		this.copyFrom = null;
	}

	public LibraryExpression clone() {
		LibraryExpression copy = new LibraryExpression(name, typeName, isSYM);
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
	
	public void setSYM(boolean isSYM) {
		this.isSYM = isSYM;
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
	
	public com.microsoft.z3.Sort getSort() {
		return sort;
	}

	public void setSort(com.microsoft.z3.Sort sort) {
		this.sort = sort;
	}

	public LibraryExpression getCopyFrom() {
		return copyFrom;
	}

	public void setCopyFrom(LibraryExpression copyFrom) {
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
		return 0;
	}
}
