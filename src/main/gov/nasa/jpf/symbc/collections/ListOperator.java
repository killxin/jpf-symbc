package gov.nasa.jpf.symbc.collections;

public enum ListOperator {
	ADD(" add "), 
	GET(" get "), 
	EMPTY(" empty ");

	private final String str;

	ListOperator(String str) {
		this.str = str;
	}

	@Override
	public String toString() {
		return str;
	}
}