package edu.nju.seg.symbc;

import java.util.Arrays;

import edu.nju.seg.symbc.LibraryOperation;
import gov.nasa.jpf.symbc.numeric.Expression;

public class LibraryConstraint {

	private LibraryOperation opt;

	private Expression[] params;

	private Expression rEturn;

	private Expression[] _params;

	public LibraryConstraint and;

	public LibraryConstraint(LibraryOperation opt, Expression[] params, Expression rEturn, Expression[] _params) {
		if (!((params == null && _params == null) || (params.length == _params.length))) {
			throw new RuntimeException("the length of LibraryExpression params should be the same: "
					+ Arrays.toString(params) + " " + Arrays.toString(_params));
		}
		this.opt = opt;
		this.params = params;
		this.rEturn = rEturn;
		this._params = _params;
	}

	public LibraryOperation getOpt() {
		return opt;
	}

	public Expression getrEturn() {
		return rEturn;
	}

	public Expression[] getParams() {
		return params;
	}

	public Expression[] _getParams() {
		return _params;
	}

	public LibraryConstraint getAnd() {
		return and;
	}

	public String toString() {
		return rEturn.toString() + "," + Arrays.toString(_params) + " = " + opt.toString() + "( "
				+ Arrays.toString(params) + ")\n" + ((and == null) ? "" : " and " + and);
	}

	public boolean equals(Object o) {
		if (!(o instanceof LibraryConstraint)) {
			return false;
		} else {
			LibraryConstraint cc = (LibraryConstraint) o;
			return (opt == null ? cc.opt == null : opt.equals(cc.opt))
					&& (params == null ? cc.params == null : Arrays.equals(params, cc.params))
					&& (rEturn == null ? cc.rEturn == null : rEturn.equals(cc.rEturn))
					&& (_params == null ? cc._params == null : Arrays.equals(_params, cc._params));
		}
	}

	public int hashCode() {
		int result = Integer.MAX_VALUE;
		if (opt != null) {
			result = result ^ opt.hashCode();
		}
		if (params != null) {
			result = result ^ params.hashCode();
		}
		if (rEturn != null) {
			result = result ^ rEturn.hashCode();
		}
		if (_params != null) {
			result = result ^ _params.hashCode();
		}
		return result;
	}
}
