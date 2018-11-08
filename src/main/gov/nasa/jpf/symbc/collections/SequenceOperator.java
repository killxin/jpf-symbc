package gov.nasa.jpf.symbc.collections;

public enum SequenceOperator {

	ADD(" add "), GET(" get "), EMPTY(" empty ");

	private final String str;

	SequenceOperator(String str) {
		this.str = str;
	}

	@Override
	public String toString() {
		return str;
	}
}
