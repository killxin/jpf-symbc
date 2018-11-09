package gov.nasa.jpf.symbc.collections;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import gov.nasa.jpf.symbc.numeric.Expression;
import gov.nasa.jpf.symbc.numeric.IntegerExpression;

public abstract class ListExpression extends Expression {
	
	Map<String, SymbolicGetInteger> elementAt = null;
	
	public Expression _get(IntegerExpression ie) {
		  if (elementAt == null) {
			  elementAt = new HashMap<String, SymbolicGetInteger>();
		  }
		  SymbolicGetInteger result = elementAt.get(ie.toString());
		  if (result == null) {
			  result = new SymbolicGetInteger("ElementAt(" + ie.toString() + ")", this, ie); //Rody: not sure about this
			  elementAt.put(ie.toString(), result);
		  }
		  return result;
	  }

	  public List solution() {
		    throw new RuntimeException( "## Error: Expression Solution request Error: " + this);
		  }
	  public ListExpression clone() {return clone();}

	  @Override
		public int compareTo(Expression o) {
			// TODO Auto-generated method stub
			return 0;
		}
		
	  public String getName() {
		    return "LIST_" + hashCode();
		  }
}
