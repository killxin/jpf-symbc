package gov.nasa.jpf.symbc.collections;

import java.util.Map;

import gov.nasa.jpf.symbc.arrays.ArrayExpression;
import gov.nasa.jpf.symbc.numeric.ConstraintExpressionVisitor;
import gov.nasa.jpf.symbc.numeric.Expression;

public class ArrayListExpression extends Expression {
//	public IntegerExpression length;
    private String elemType = "?";
    private final String name;

    public String getName() {
        return this.name;
    }

    public ArrayListExpression(String name) {
        this.name=name;
//        this.length = new SymbolicInteger(name+"_length");
    }

    public static String getNewName(ArrayExpression prev) {
        String newName = prev.getName();
        if (newName.indexOf("!") == -1) {
            newName = newName + "!1";
        } else {
            /* Increment the number after '!' */
            int aux = Integer.parseInt(newName.substring(newName.indexOf("!") + 1));
            newName = newName.substring(0, newName.indexOf("!") + 1) + (aux + 1);
        }
        return newName;
    }

    public String getRootName() {
        if (this.getName().indexOf("!") == -1) {
            return this.getName();
        } else {
            return this.getName().substring(0, this.getName().indexOf("!"));
        }

    }
    
    public String getElemType() {
        return elemType;
    }

   public String stringPC() {
        return (name != null) ? name : "ARRAY_" + hashCode();
    }

    public void accept(ConstraintExpressionVisitor visitor) {
        visitor.preVisit(this);
        visitor.postVisit(this);
    }

    public void getVarsVals(Map<String,Object> varsVals) {
        return;
    }

    public int compareTo(Expression expr) {
        // unimplemented
        return 0;
    }

    public String toString() {
        return this.stringPC();
    }
}
