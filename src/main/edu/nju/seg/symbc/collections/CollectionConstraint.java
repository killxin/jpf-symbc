package edu.nju.seg.symbc.collections;

import java.util.Arrays;

import gov.nasa.jpf.symbc.numeric.Expression;

public class CollectionConstraint {
	
	private CollectionOperator opt;
	
	private Expression base;

	private Expression[] params;
	
	private Expression rEturn;
	
	private Expression _base;
	
	private Expression[] _params;
	
	public CollectionConstraint and;
    
	public CollectionConstraint(CollectionOperator opt, Expression base, Expression[] params, Expression rEturn,
			Expression _base, Expression[] _params) {
		this.opt = opt;
		this.base = base;
		this.params = params;
		this.rEturn = rEturn;
		this._base = _base;
		this._params = _params;
	}

	public CollectionOperator getOpt() {
		return opt;
	}

	public Expression getBase() {
		return base;
	}

	public Expression[] getParams() {
		return params;
	}

	public Expression getrEturn() {
		return rEturn;
	}

	public Expression _getBase() {
		return _base;
	}

	public Expression[] _getParams() {
		return _params;
	}

	public String toString() {
        return rEturn.toString() + _base.toString() + Arrays.toString(_params) + 
        		" = " + opt.toString() + base.toString() + Arrays.toString(params) + "\n" +
        		((and == null) ? "" : " and " + and);
    }

	public boolean equals(Object o) {
        if(!(o instanceof CollectionConstraint)) {
        	return false;
        } else {
        	CollectionConstraint cc = (CollectionConstraint) o;
	        return (opt == null ? cc.opt == null : opt.equals(cc.opt))
	            && (base == null ? cc.base == null : base.equals(cc.base))
	            && (params == null ? cc.params == null : Arrays.equals(params, cc.params))
	            && (rEturn == null ? cc.rEturn == null : rEturn.equals(cc.rEturn))
	            && (_base == null ? cc._base == null : _base.equals(cc._base))
	            && (_params == null ? cc._params == null : Arrays.equals(_params, cc._params));
	        }
      }

      public int hashCode() {
    	  int result = Integer.MAX_VALUE;
    	  if (opt != null) {
    		  result = result ^ opt.hashCode();
    	  }
    	  if (base != null) {
    		  result = result ^ base.hashCode();
    	  }
    	  if (params != null) {
    		  result = result ^ params.hashCode();
    	  }
    	  if (rEturn != null) {
    		  result = result ^ rEturn.hashCode();
    	  }
    	  return result;
     }
}
