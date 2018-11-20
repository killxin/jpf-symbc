package edu.nju.seg.symbc.collections;

import java.util.Map;

import gov.nasa.jpf.symbc.numeric.ConstraintExpressionVisitor;
import gov.nasa.jpf.symbc.numeric.Expression;

public class CollectionExpression extends Expression {
	
	private String name;
	private boolean isSYM;

	public CollectionExpression(String name) {
		this.name = name;
		this.isSYM = false;
//        this.length = new SymbolicInteger(name+"_length");
	}

	public CollectionExpression(String name, boolean isSYM) {
		this.name = name;
		this.isSYM = isSYM;
	}

	public CollectionExpression clone() {
		return new CollectionExpression(name, isSYM);
	}

	public String getName() {
		return name;
	}
	
	public boolean isSYM() {
		return isSYM;
	}
	
	public String toString() {
		return name;
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
