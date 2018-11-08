package gov.nasa.jpf.symbc.collections;

import java.util.Arrays;
import java.util.Map;

import gov.nasa.jpf.symbc.numeric.Constraint;
import gov.nasa.jpf.symbc.numeric.Expression;
import gov.nasa.jpf.symbc.numeric.LinearIntegerConstraint;

public class SequenceConstraint extends Constraint {
	
	private final SequenceOperator opt;
	
	private final Expression base;

	private final Expression[] params;
	
	private final Expression rEturn;

    public SequenceConstraint(SequenceOperator opt, Expression b, Expression[] p, Expression r) {
    	this.opt = opt;
        this.base = b;
        this.params = p;
        this.rEturn = r;
      }
      
    
      public SequenceOperator getOpt() {
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


	public String toString() {
        return opt.toString() + base.toString() + Arrays.toString(params) + rEturn.toString()
        		+ ((and == null) ? "" : " &&\n" + and.toString());
      }

      public boolean equals(Object o) {
        if (!(o instanceof Constraint)) {
          return false;
        } else if(!(o instanceof SequenceConstraint)) {
        	return false;
        } else {

        return opt.equals(((SequenceConstraint) o).opt)
            && base.equals(((SequenceConstraint) o).base)
            && params.equals(((SequenceConstraint) o).params)
            && rEturn.equals(((SequenceConstraint) o).rEturn);
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
    	  //return left.hashCode() ^ comp.hashCode() ^ right.hashCode();
      }
    	
      @Override
      public LinearIntegerConstraint not() {
          return null;
      }    
  }