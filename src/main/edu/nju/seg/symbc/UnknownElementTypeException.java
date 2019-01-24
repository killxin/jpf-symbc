package edu.nju.seg.symbc;

public class UnknownElementTypeException extends Exception {
	
	public CollectionExpression ce;
	
	public UnknownElementTypeException(String message, CollectionExpression ce) {
		super(message);
		this.ce = ce;
	}

	public String toString() {
		return super.toString() + ": " + ce;
	}
}
