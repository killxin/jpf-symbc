package gov.nasa.jpf.symbc.collections;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import gov.nasa.jpf.symbc.numeric.ConstraintExpressionVisitor;
import gov.nasa.jpf.symbc.numeric.Expression;

public class DerivedListExpression extends ListExpression {

	public ListExpression left;
	  public ListOperator op;
	  public ListExpression right;
	  
	  public Expression[] oprlist;

	  DerivedListExpression(ListExpression l, ListOperator o, ListExpression r) {
		oprlist = null;
	    left = l;
	    op = o;
	    right = r;
//	    left.addDependent(this);
//	    right.addDependent(this); 
	  }
	  
	  DerivedListExpression(ListOperator o, Expression[] olist) {
		  left = null;
		  right = null;
		  op = o;
		  int i = olist.length;
		  oprlist = new Expression[i];
		  for(int j = 0; j < i; j++){
			  oprlist[j] = olist[j];
//			  if(olist[j] instanceof ListExpression){
//				  ((ListExpression) oprlist[j]).addDependent(this);
//			  }
		  }
	  }
	  
	  DerivedListExpression(ListOperator o, ListExpression r) {
		    left = null;
		    op = o;
		    right = r;
//		    right.addDependent(this); 
		  }
	  
	    public DerivedListExpression clone() {
		  throw new RuntimeException("Operation not implemented");
	  }

	  public Set<Expression> getOperands() {
	    Set<Expression> operands = new HashSet<Expression>();
	    if (right != null) {
	      operands.add(right);
	    }
	    if (left != null) {
	      operands.add(left);
	    }
	    if (oprlist != null) {
	      for (Expression e : oprlist) {
	        operands.add(e);
	      }
	    }
	    return operands;
	  }

	  //TODO: add solution() cases for all supported operators
	  public List solution() {
		  List l;
	    if(left != null) 
	    	l = left.solution();
	    else
	    	l = new ArrayList();
	    List r = right.solution();
	    switch (op) {
	      case EMPTY:
	        return l;
	      default:
	        throw new RuntimeException(
	            "## Error: BinaryStringSolution solution: l " + l + " op " + op
	                + " r " + r);
	    }
	  }

	  public void getVarsVals(Map<String, Object> varsVals) {
		if(left != null) left.getVarsVals(varsVals);
	    right.getVarsVals(varsVals);
	  }

	  public String stringPC() {
		if (left != null)
	        return left.stringPC() + "." + op.toString() + "(" + right.stringPC() + ")";
		else if (right != null)
			return "." + op.toString() + "(" + right.stringPC() + ")";
		else 
		{
			StringBuilder s = new StringBuilder();
			   s.append("{");
			for(int i = 0; i < oprlist.length; i++){	
				s.append("(");			
				s.append(oprlist[i].toString());
				s.append(")");				
			}
			   s.append("}");	
			return "." + op.toString() + s;
			
		}
	  }

	  public String toString() {
			if (left != null)	  
	            return left.toString() + "." + op.toString() + "(" + right.toString() + ")";
			else if (right != null)
				return "." + op.toString() + "(" + right.toString() + ")";
			else 
			{
				StringBuilder s = new StringBuilder();
				   s.append("[");
				for(int i = 0; i < oprlist.length; i++){	
					s.append("(");			
					s.append(oprlist[i].toString());
					s.append(")");				
				}
				    s.append("]");	
				return "." + op.toString() + s;			
			}
					
	  }
	  	
	  public String getName() {
	    String name;
	    if (left != null)
	      name = left.getName() + "_" + op.toString() + "__" + right.getName()
	          + "___";
	    else if (right != null)
	      name = "_" + op.toString() + "__" + right.getName() + "___";
	    else {
	      StringBuilder s = new StringBuilder();
	      s.append("__");
	      for (int i = 0; i < oprlist.length; i++) {
	        s.append("__");
	        if (oprlist[i] instanceof ListExpression) {
	          s.append(((ListExpression)oprlist[i]).getName());
	        } else {
	          s.append(oprlist[i].toString());
	        }
	        s.append("___");
	      }
	      s.append("___");
	      name = "_" + op.toString() + s;
	    }

	    return "LIST_" + name;
	  }

		@Override
		public void accept(ConstraintExpressionVisitor visitor) {
			visitor.preVisit(this);
			left.accept(visitor);
			right.accept(visitor);
			visitor.postVisit(this);
		}

}
