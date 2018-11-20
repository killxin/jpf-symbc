package edu.nju.seg.symbc.collections;

public enum CollectionOperator {
	ARRAYLIST_ADD(" ArrayList_add "), 
	ARRAYLIST_GET(" ArrayList_get "), 
	ARRAYLIST_INIT(" ArrayList_init ");

	private final String str;

	CollectionOperator(String str) {
		this.str = str;
	}
	
	@Override
	public String toString() {
		return str;
	}
}