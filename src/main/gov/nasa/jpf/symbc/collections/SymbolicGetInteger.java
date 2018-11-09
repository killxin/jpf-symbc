package gov.nasa.jpf.symbc.collections;

import gov.nasa.jpf.symbc.numeric.IntegerExpression;
import gov.nasa.jpf.symbc.numeric.SymbolicInteger;

public class SymbolicGetInteger extends SymbolicInteger {
	ListExpression le;
	IntegerExpression index;
	boolean constant;
	
	public SymbolicGetInteger (String name, ListExpression le, IntegerExpression index) {
		super (name);
		this.le = le;
		this.index = index;
		constant = false;
	}
	
	public SymbolicGetInteger (String name, ListExpression le, IntegerExpression index, boolean constant) {
		this (name, le, index);
		this.constant = constant;
	}
	
	public boolean isConstant () {
		return constant;
	}

	public ListExpression getExpression(){
		return this.le;
	}
	
	public IntegerExpression getIndex(){
		return this.index;
	}

}
