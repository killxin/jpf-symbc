/*
 * Copyright (C) 2014, United States Government, as represented by the
 * Administrator of the National Aeronautics and Space Administration.
 * All rights reserved.
 *
 * Symbolic Pathfinder (jpf-symbc) is licensed under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License. You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

//
//Copyright (C) 2006 United States Government as represented by the
//Administrator of the National Aeronautics and Space Administration
//(NASA).  All Rights Reserved.
//
//This software is distributed under the NASA Open Source Agreement
//(NOSA), version 1.3.  The NOSA has been approved by the Open Source
//Initiative.  See the file NOSA-1.3-JPF at the top of the distribution
//directory tree for the complete NOSA document.
//
//THE SUBJECT SOFTWARE IS PROVIDED "AS IS" WITHOUT ANY WARRANTY OF ANY
//KIND, EITHER EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING, BUT NOT
//LIMITED TO, ANY WARRANTY THAT THE SUBJECT SOFTWARE WILL CONFORM TO
//SPECIFICATIONS, ANY IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR
//A PARTICULAR PURPOSE, OR FREEDOM FROM INFRINGEMENT, ANY WARRANTY THAT
//THE SUBJECT SOFTWARE WILL BE ERROR FREE, OR ANY WARRANTY THAT
//DOCUMENTATION, IF PROVIDED, WILL CONFORM TO THE SUBJECT SOFTWARE.
//

package gov.nasa.jpf.symbc.numeric.solvers;

import java.io.PrintWriter;
import java.util.*;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;

//TODO: problem: we do not distinguish between ints and reals?
// still needs a lot of work: do not use!

import com.microsoft.z3.*;

import edu.nju.seg.symbc.CollectionExpression;
import edu.nju.seg.symbc.StringExpression;
import edu.nju.seg.symbc.LibraryExpression;
import edu.nju.seg.symbc.UnknownElementTypeException;
import gov.nasa.jpf.JPFException;
import gov.nasa.jpf.symbc.SymbolicInstructionFactory;
import gov.nasa.jpf.symbc.arrays.ArrayExpression;
import gov.nasa.jpf.symbc.bytecode.BytecodeUtils;
import gov.nasa.jpf.symbc.numeric.Expression;
import gov.nasa.jpf.symbc.numeric.PCParser;
import gov.nasa.jpf.symbc.numeric.SymbolicInteger;
import gov.nasa.jpf.symbc.numeric.SymbolicReal;
import symlib.Util;

public class ProblemZ3 extends ProblemGeneral {

	// This class acts as a safeguard to prevent
	// issues when referencing ProblemZ3 in case the z3 libs are
	// not on the ld_library_path. If the
	// Z3 solver object and context were class fields,
	// we would likely encounter a linker error
	private static class Z3Wrapper {
		private Context ctx;
		private Solver solver;

		private static Z3Wrapper instance = null;

		public static Z3Wrapper getInstance() {
			if (instance != null) {
				return instance;
			}
			return instance = new Z3Wrapper();
		}

		private Z3Wrapper() {
			HashMap<String, String> cfg = new HashMap<String, String>();
			cfg.put("model", "true");
			// add by rhjiang
//			cfg.put("timeout", "20000");
			ctx = new Context(cfg);
			solver = ctx.mkSolver();
		}

		public Solver getSolver() {
			return this.solver;
		}

		public Context getCtx() {
			return this.ctx;
		}
	}

	private Solver solver;
	private Context ctx;

	// Do we use the floating point theory or linear arithmetic over reals
	private boolean useFpForReals = false;

	public ProblemZ3() {
		Z3Wrapper z3 = Z3Wrapper.getInstance();
		solver = z3.getSolver();
		ctx = z3.getCtx();
		solver.push();
		useFpForReals = SymbolicInstructionFactory.fp;
	}

	public void cleanup() {
		int scopes = solver.getNumScopes();
		if (scopes > 0) {
			solver.pop(scopes);
		}
	}

	public Object makeIntVar(String name, long min, long max) {
		try {
			IntExpr intConst = ctx.mkIntConst(name);
			solver.add(ctx.mkGe(intConst, ctx.mkInt(min)));
			solver.add(ctx.mkLe(intConst, ctx.mkInt(max)));
			return intConst;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in makeIntVar: \n" + e);
		}
	}

	public Object makeRealVar(String name, double min, double max) {
		try {
			if (useFpForReals) {
				Expr expr = ctx.mkConst(name, ctx.mkFPSortDouble());
				solver.add(ctx.mkFPGt((FPExpr) expr, ctx.mkFP(min, ctx.mkFPSortDouble())));
				solver.add(ctx.mkFPLt((FPExpr) expr, ctx.mkFP(max, ctx.mkFPSortDouble())));
				return expr;
			} else {
				RealExpr expr = ctx.mkRealConst(name);
				solver.add(ctx.mkGe(expr, ctx.mkReal("" + min)));
				solver.add(ctx.mkLe(expr, ctx.mkReal("" + max)));
				return expr;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
		}
	}

	public Object eq(long value, Object exp) {
		try {
			return ctx.mkEq(ctx.mkInt(value), (Expr) exp);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
		}
	}

	public Object eq(Object exp, long value) {

		return ctx.mkEq(ctx.mkInt(value), (Expr) exp);
	}

	// should we use Expr or ArithExpr?
	public Object eq(Object exp1, Object exp2) {
		try {
			return ctx.mkEq((Expr) exp1, (Expr) exp2);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);

		}
	}

	// TODO: should convert double to rational
//	public Object eq(double value, Object exp){
//		try{
//			return  ctx.MkEq(ctx.MkReal(arg0, arg1), (RealExpr)exp);
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
//
//	    }
//	}

//	public Object eq(Object exp, double value){
//		try{
//			return  ctx.MkEq(ctx.MkReal(arg0, arg1), (RealExpr)exp);;
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
//
//	    }
//	}

	public Object neq(long value, Object exp) {
		return ctx.mkNot(ctx.mkEq(ctx.mkInt(value), (Expr) exp));
	}

	public Object neq(Object exp, long value) {
		return ctx.mkNot(ctx.mkEq(ctx.mkInt(value), (Expr) exp));
	}

	public Object neq(Object exp1, Object exp2) {
		try {
			return ctx.mkNot(ctx.mkEq((Expr) exp1, (Expr) exp2));
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
		}
	}

	public Object not(Object exp1) {
		try {
			return ctx.mkNot((BoolExpr) exp1);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);

		}
	}

	// TODO: convert doubles to rationals
//	public Object neq(double value, Object exp){
//		try{
//			return  vc.notExpr(vc.eqExpr(vc.ratExpr(Double.toString(value), base), (Expr)exp));
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
//
//	    }
//	}
//
//	public Object neq(Object exp, double value){
//		try{
//			return  vc.notExpr(vc.eqExpr((Expr)exp, vc.ratExpr(Double.toString(value), base)));
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
//
//	    }
//	}

	public Object leq(long value, Object exp) {
		try {
			return ctx.mkLe(ctx.mkInt(value), (IntExpr) exp);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);

		}
	}

	public Object leq(Object exp, long value) {
		try {
			return ctx.mkLe((IntExpr) exp, ctx.mkInt(value));
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);

		}
	}

	public Object leq(Object exp1, Object exp2) {
		try {
			return ctx.mkLe((ArithExpr) exp1, (ArithExpr) exp2);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);

		}
	}

//	public Object leq(double value, Object exp){
//		try{
//			return  vc.leExpr(vc.ratExpr(Double.toString(value), base), (Expr)exp);
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
//
//	    }
//	}
//
//	public Object leq(Object exp, double value){
//		try{
//			return  vc.leExpr((Expr)exp, vc.ratExpr(Double.toString(value), base));
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
//
//	    }
//	}
//
	public Object geq(long value, Object exp) {
		try {
			return ctx.mkGe(ctx.mkInt(value), (IntExpr) exp);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);

		}
	}

	public Object geq(Object exp, long value) {
		try {
			return ctx.mkGe((IntExpr) exp, ctx.mkInt(value));
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);

		}
	}

	public Object geq(Object exp1, Object exp2) {
		try {
			return ctx.mkGe((ArithExpr) exp1, (ArithExpr) exp2);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);

		}
	}

//	public Object geq(double value, Object exp){
//		try{
//			return  vc.geExpr(vc.ratExpr(Double.toString(value), base), (Expr)exp);
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
//
//	    }
//	}
//
//	public Object geq(Object exp, double value){
//		try{
//			return  vc.geExpr((Expr)exp, vc.ratExpr(Double.toString(value), base));
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
//
//	    }
//	}
//
	public Object lt(long value, Object exp) {
		try {
			return ctx.mkLt(ctx.mkInt(value), (IntExpr) exp);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);

		}
	}

	public Object lt(Object exp, long value) {
		try {
			return ctx.mkLt((IntExpr) exp, ctx.mkInt(value));
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);

		}
	}

	public Object lt(Object exp1, Object exp2) {
		try {
			return ctx.mkLt((ArithExpr) exp1, (ArithExpr) exp2);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);

		}
	}

//	public Object lt(double value, Object exp){
//		try{
//			return  vc.ltExpr(vc.ratExpr(Double.toString(value), base), (Expr)exp);
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
//
//	    }
//	}
//
//	public Object lt(Object exp, double value){
//		try{
//			return  vc.ltExpr((Expr)exp, vc.ratExpr(Double.toString(value), base));
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
//
//	    }
//	}
//
//
	public Object gt(long value, Object exp) {
		try {
			return ctx.mkGt(ctx.mkInt(value), (IntExpr) exp);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);

		}
	}

	public Object gt(Object exp, long value) {
		try {
			return ctx.mkGt((IntExpr) exp, ctx.mkInt(value));
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);

		}
	}

	public Object gt(Object exp1, Object exp2) {
		try {
			return ctx.mkGt((ArithExpr) exp1, (ArithExpr) exp2);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);

		}
	}

//	public Object implies(Object exp1, Object exp2){
//		try{
//			return  vc.impliesExpr((Expr)exp1, (Expr)exp2);
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
//
//	    }
//	}

//	public Object gt(double value, Object exp){
//		try{
//			return  vc.gtExpr(vc.ratExpr(Double.toString(value), base), (Expr)exp);
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
//
//	    }
//	}
//
//	public Object gt(Object exp, double value){
//		try{
//			return  vc.gtExpr((Expr)exp, vc.ratExpr(Double.toString(value), base));
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
//
//	    }
//	}
//
//
//
//
	public Object plus(long value, Object exp) {
		try {
			return ctx.mkAdd(new ArithExpr[] { ctx.mkInt(value), (IntExpr) exp });
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
		}
	}

	public Object plus(Object exp, long value) {
		try {
			return ctx.mkAdd(new ArithExpr[] { ctx.mkInt(value), (IntExpr) exp });
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
		}
	}

	public Object plus(Object exp1, Object exp2) {
		try {
			return ctx.mkAdd(new ArithExpr[] { (ArithExpr) exp1, (ArithExpr) exp2 });
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
		}
	}

//	public Object plus(double value, Object exp) {
//		try{
//			return  vc.plusExpr(vc.ratExpr(Double.toString(value), base), (Expr)exp);
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
//		}
//	}
//
//	public Object plus(Object exp, double value) {
//		try{
//			return  vc.plusExpr((Expr)exp, vc.ratExpr(Double.toString(value), base));
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
//		}
//	}

	public Object minus(long value, Object exp) {
		try {
			return ctx.mkSub(new ArithExpr[] { ctx.mkInt(value), (IntExpr) exp });
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
		}
	}

	public Object minus(Object exp, long value) {
		try {
			return ctx.mkSub(new ArithExpr[] { (IntExpr) exp, ctx.mkInt(value) });
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
		}
	}

	public Object minus(Object exp1, Object exp2) {
		try {
			return ctx.mkSub(new ArithExpr[] { (ArithExpr) exp1, (ArithExpr) exp2 });
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
		}
	}

//	public Object minus(double value, Object exp) {
//		try{
//			return  vc.minusExpr(vc.ratExpr(Double.toString(value), base), (Expr)exp);
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
//		}
//	}
//
//	public Object minus(Object exp, double value) {
//		try{
//			return  vc.minusExpr((Expr)exp, vc.ratExpr(Double.toString(value), base));
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
//		}
//	}

	public Object mult(long value, Object exp) {
		try {
			return ctx.mkMul(new ArithExpr[] { (IntExpr) exp, ctx.mkInt(value) });
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
		}
	}

	public Object mult(Object exp, long value) {
		try {
			return ctx.mkMul(new ArithExpr[] { (IntExpr) exp, ctx.mkInt(value) });
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
		}
	}

	public Object mult(Object exp1, Object exp2) {
		try {
			return ctx.mkMul(new ArithExpr[] { (ArithExpr) exp1, (ArithExpr) exp2 });
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
		}
	}
//	public Object mult(double value, Object exp) {
//		try{
//			return  vc.multExpr(vc.ratExpr(Double.toString(value), base), (Expr)exp);
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
//		}
//	}
//	public Object mult(Object exp, double value) {
//		try{
//			return  vc.multExpr((Expr)exp, vc.ratExpr(Double.toString(value), base));
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
//		}
//	}
//
//

	public Object div(long value, Object exp) {
		try {
			return ctx.mkDiv(ctx.mkInt(value), (IntExpr) exp);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
		}
	}

	public Object div(Object exp, long value) {
		try {
			return ctx.mkDiv((IntExpr) exp, ctx.mkInt(value));
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
		}
	}

	public Object div(Object exp1, Object exp2) {
		try {
			return ctx.mkDiv((ArithExpr) exp1, (ArithExpr) exp2);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
		}
	}

	public Object rem(Object exp, long value) {// added by corina
		try {

			return ctx.mkRem((IntExpr) exp, ctx.mkInt(value));
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
		}
	}

	public Object rem(long value, Object exp) {// added by corina
		try {

			return ctx.mkRem(ctx.mkInt(value), (IntExpr) exp);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
		}
	}

	public Object rem(Object exp1, Object exp2) {// added by corina
		try {
			if (exp2 instanceof Integer)
				return ctx.mkRem((IntExpr) exp1, ctx.mkInt((Integer) exp2));
			return ctx.mkRem((IntExpr) exp1, (IntExpr) exp2);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
		}
	}

//	public Object div(double value, Object exp) {
//		try{
//			return  vc.divideExpr(vc.ratExpr(Double.toString(value), base), (Expr)exp);
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
//		}
//	}
//	public Object div(Object exp, double value) {
//		try{
//			return  vc.divideExpr((Expr)exp, vc.ratExpr(Double.toString(value), base));
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
//		}
//	}

	public long getIntValue(Object dpVar) {
		try {
			Model model = solver.getModel();
			return Long.parseLong((model.evaluate((IntExpr) dpVar, false)).toString());
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
		}
	}

	public static Model currentModel = null;

	// add by rhjiang
	public static Model getCurrentModel() {
		return currentModel;
	}

	public static Context getZ3Context() {
		return Z3Wrapper.getInstance().ctx;
	}

	public Boolean solve() {
		try {
//	        System.out.println("rh: "+Arrays.toString(Arrays.copyOfRange(solver.getAssertions(),2,10)));
			System.out.println("rh: ");
			for (BoolExpr expr : solver.getAssertions()) {
				System.out.println(expr);
			}
			Status status = solver.check();
			if (Status.SATISFIABLE == status) {
				System.out.println("********rh: SAT********");
				currentModel = solver.getModel();
				generateConstraint(solver);
				return true;
			} else if (Status.UNSATISFIABLE == status) {
				System.out.println("********rh: UNSAT********");
//				Arrays.stream(solver.getAssertions()).forEach(x -> System.out.println(x));
//				System.out.println("************************");
//				System.out.println("rh: Core: "+ solver.getUnsatCore().length + Arrays.toString(solver.getUnsatCore()));
				return false;
			} else {
				System.out.println("********rh: UNKNOWN********");
				// should not rise UNKNOWN
//				System.exit(-1);
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: " + e);
		}
	}

	// add by czz
	/**
	 * do not use again!!! constraint that contains the return variable of the
	 * function
	 */
	private static String returnConstraint;

	/**
	 * do not use again!!! get constraint that contains the return variable of the
	 * function
	 */
	private static String getReturnConstraint() {
		if (returnConstraint == null) {
			return "";
		} else {
			return returnConstraint;
		}
	}

	/**
	 * constraint without library type declaration
	 */
	public static String constraint = null;

	/**
	 * get constraint without library type declaration
	 */
	public static String getCurrentConstraint() {
		return constraint;
	}

	public static Map<String, String> argsTypeMap = BytecodeUtils.getArgsTypeMap();
	public static Map<String, Expression> argsExpressionMap = BytecodeUtils.getArgsExpressionMap();
	public static Map<String, Expression> expressionMap = new HashMap<String, Expression>();

	public static void clearArgsExpressionMaps() {
		argsTypeMap.clear();
		argsExpressionMap.clear();
		expressionMap.clear();
	}

	private void updateExpressionMap(Map<String, Expression> expressionMap, Expression e) {
		Pattern pat = Pattern.compile("^(.*)_(\\d+)_[^_]+$");
		Matcher mat = pat.matcher(e.stringPC());
		if (mat.find()) {
			int id = Integer.parseInt(mat.group(2));
			for (Entry<String, Expression> entry : expressionMap.entrySet()) {
				if (mat.group(1).equals(entry.getKey())) {
					Matcher mat2 = pat.matcher(entry.getValue().stringPC());
					mat2.find();
					if (Integer.parseInt(mat2.group(2)) < id) {
						entry.setValue(e);
						break;
					}
				}
			}
		}
	}

//	public final static int MAX_INT = 128;
//	public final static int MIN_INT = -10;
	public final static int MAX_INT = 4;
	public final static int MIN_INT = -2;

	public void generateConstraint(Solver solver) {
		StringBuffer result = new StringBuffer();
//		for (String sort_name: dataTypeSortMap.keySet()) {
//			System.out.println("Datatype sort name:" + sort_name);
//		}
		for (String name : argsExpressionMap.keySet()) {
			expressionMap.put(name, argsExpressionMap.get(name));
		}

		for (LibraryExpression le : PCParser.symLibraryVar.keySet()) {
			updateExpressionMap(expressionMap, le);
			Object tempExpr = PCParser.symLibraryVar.get(le);
			assert tempExpr instanceof Expr;
			Expr expr = (Expr) tempExpr;
			String libExpr = expr.getFuncDecl().toString();
			for (String sort_name : dataTypeSortMap.keySet()) {
				// change to unique sort name
				String mySortName = "(My" + sort_name.replace("_", " ") + ")";
//				libExpr = replaceLast(libExpr, sort_name, mySortName);
				libExpr = libExpr.replaceAll(sort_name + "\\)$", mySortName + ")");
			}
			result.append(libExpr).append("\n");
		}
		for (SymbolicInteger si : PCParser.symIntegerVar.keySet()) {
			updateExpressionMap(expressionMap, si);
			Object tempExpr = PCParser.symIntegerVar.get(si);
			assert tempExpr instanceof Expr;
			Expr expr = (Expr) tempExpr;
			result.append(expr.getFuncDecl()).append("\n");
		}
		for (SymbolicReal sr : PCParser.symRealVar.keySet()) {
			updateExpressionMap(expressionMap, sr);
			Object tempExpr = PCParser.symRealVar.get(sr);
			assert tempExpr instanceof Expr;
			Expr expr = (Expr) tempExpr;
			result.append(expr.getFuncDecl()).append("\n");
		}
		if (solver.getAssertions() != null && solver.getAssertions().length > 0) {
			result.append("(assert (and \n");
			Arrays.stream(solver.getAssertions()).forEach(x -> result.append(x).append("\n"));
			result.append("))\n;");
		}
		String smt = result.toString();
		if (smt.contains("max!nt")) {
			smt = smt.replace("max!nt", Integer.toString(ProblemZ3.MAX_INT));
		}
		if (smt.contains("min!nt")) {
			smt = smt.replace("min!nt", Integer.toString(ProblemZ3.MIN_INT));
		}
		constraint = smt;
	}

//	public static String replaceLast(String str, String target, String other) {
//		StringBuilder result = new StringBuilder(str);
//		result.replace(result.lastIndexOf(target), result.lastIndexOf(target) + other.length(), other);
//		return result.toString();
//	}
	// add by czz end

	public void post(Object constraint) {
		try {
			solver.add((BoolExpr) constraint);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error posting constraint to Z3 \n" + e);
		}
	}

	@Override
	public Object eq(double value, Object exp) {
		try {
			if (useFpForReals) {
				return ctx.mkFPEq(ctx.mkFPNumeral(value, ctx.mkFPSort64()), (FPExpr) exp);
			} else {
				return ctx.mkEq(ctx.mkReal("" + value), (Expr) exp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: eq(double, Object) failed.\n" + e);
		}
	}

	@Override
	public Object eq(Object exp, double value) {
		try {
			if (useFpForReals) {
				return ctx.mkFPEq((FPExpr) exp, ctx.mkFPNumeral(value, ctx.mkFPSort64()));
			} else {
				return ctx.mkEq((Expr) exp, ctx.mkReal("" + value));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: eq(double, Object) failed.\n" + e);
		}
	}

	@Override
	public Object neq(double value, Object exp) {
		try {
			if (useFpForReals) {
				return ctx.mkNot(ctx.mkFPEq(ctx.mkFPNumeral(value, ctx.mkFPSort64()), (FPExpr) exp));
			} else {
				return ctx.mkNot(ctx.mkEq(ctx.mkReal("" + value), (Expr) exp));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: neq(double, Object) failed.\n" + e);
		}
	}

	@Override
	public Object neq(Object exp, double value) {
		try {
			if (useFpForReals) {
				return ctx.mkNot(ctx.mkFPEq((FPExpr) exp, ctx.mkFPNumeral(value, ctx.mkFPSort64())));
			} else {
				return ctx.mkNot(ctx.mkEq((Expr) exp, ctx.mkReal("" + value)));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: neq(double, Object) failed.\n" + e);
		}
	}

	@Override
	public Object leq(double value, Object exp) {
		try {
			if (useFpForReals) {
				return ctx.mkFPLEq(ctx.mkFPNumeral(value, ctx.mkFPSort64()), (FPExpr) exp);
			} else {
				return ctx.mkLe(ctx.mkReal("" + value), (ArithExpr) exp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: leq(double, Object) failed.\n" + e);
		}
	}

	@Override
	public Object leq(Object exp, double value) {
		try {
			if (useFpForReals) {
				return ctx.mkFPLEq((FPExpr) exp, ctx.mkFPNumeral(value, ctx.mkFPSort64()));
			} else {
				return ctx.mkLe((ArithExpr) exp, ctx.mkReal("" + value));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: leq(double, Object) failed.\n" + e);
		}
	}

	@Override
	public Object geq(double value, Object exp) {
		try {
			if (useFpForReals) {
				return ctx.mkFPGEq(ctx.mkFPNumeral(value, ctx.mkFPSort64()), (FPExpr) exp);
			} else {
				return ctx.mkGe(ctx.mkReal("" + value), (ArithExpr) exp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: geq(double, Object) failed.\n" + e);
		}
	}

	@Override
	public Object geq(Object exp, double value) {
		try {
			if (useFpForReals) {
				return ctx.mkFPGEq((FPExpr) exp, ctx.mkFPNumeral(value, ctx.mkFPSort64()));
			} else {
				return ctx.mkGe((ArithExpr) exp, ctx.mkReal("" + value));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: geq(double, Object) failed.\n" + e);
		}
	}

	@Override
	public Object lt(double value, Object exp) {
		try {
			if (useFpForReals) {
				return ctx.mkFPLt(ctx.mkFPNumeral(value, ctx.mkFPSort64()), (FPExpr) exp);
			} else {
				return ctx.mkLt(ctx.mkReal("" + value), (ArithExpr) exp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: lt(double, Object) failed.\n" + e);
		}
	}

	@Override
	public Object lt(Object exp, double value) {
		try {
			if (useFpForReals) {
				return ctx.mkFPLt((FPExpr) exp, ctx.mkFPNumeral(value, ctx.mkFPSort64()));
			} else {
				return ctx.mkLt((ArithExpr) exp, ctx.mkReal("" + value));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: lt(double, Object) failed.\n" + e);
		}
	}

	@Override
	public Object gt(double value, Object exp) {
		try {
			if (useFpForReals) {
				return ctx.mkFPGt(ctx.mkFPNumeral(value, ctx.mkFPSort64()), (FPExpr) exp);
			} else {
				return ctx.mkGt(ctx.mkReal("" + value), (ArithExpr) exp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: gt(double, Object) failed.\n" + e);
		}
	}

	@Override
	public Object gt(Object exp, double value) {
		try {
			if (useFpForReals) {
				return ctx.mkFPGt((FPExpr) exp, ctx.mkFPNumeral(value, ctx.mkFPSort64()));
			} else {
				return ctx.mkGt((ArithExpr) exp, ctx.mkReal("" + value));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: gt(double, Object) failed.\n" + e);
		}
	}

	@Override
	public Object plus(double value, Object exp) {
		try {
			if (useFpForReals) {
				return ctx.mkFPAdd(ctx.mkFPRoundNearestTiesToEven(), ctx.mkFPNumeral(value, ctx.mkFPSort64()),
						(FPExpr) exp);
			} else {
				return ctx.mkAdd(ctx.mkReal("" + value), (ArithExpr) exp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: plus(Object, double) failed.\n" + e);
		}
	}

	@Override
	public Object plus(Object exp, double value) {
		try {
			if (useFpForReals) {
				return ctx.mkFPAdd(ctx.mkFPRoundNearestTiesToEven(), (FPExpr) exp,
						ctx.mkFPNumeral(value, ctx.mkFPSort64()));
			} else {
				return ctx.mkAdd((ArithExpr) exp, ctx.mkReal("" + value));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: plus(Object, double) failed.\n" + e);
		}
	}

	@Override
	public Object minus(double value, Object exp) {
		try {
			if (useFpForReals) {
				return ctx.mkFPSub(ctx.mkFPRoundNearestTiesToEven(), ctx.mkFPNumeral(value, ctx.mkFPSort64()),
						(FPExpr) exp);
			} else {
				return ctx.mkSub(ctx.mkReal("" + value), (ArithExpr) exp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: minus(double, Object) failed.\n" + e);
		}
	}

	@Override
	public Object minus(Object exp, double value) {
		try {
			if (useFpForReals) {
				return ctx.mkFPSub(ctx.mkFPRoundNearestTiesToEven(), (FPExpr) exp,
						ctx.mkFPNumeral(value, ctx.mkFPSort64()));
			} else {
				return ctx.mkSub((ArithExpr) exp, ctx.mkReal("" + value));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: minus(double, Object) failed.\n" + e);
		}
	}

	@Override
	public Object mult(double value, Object exp) {
		try {
			if (useFpForReals) {
				return ctx.mkFPMul(ctx.mkFPRoundNearestTiesToEven(), ctx.mkFPNumeral(value, ctx.mkFPSort64()),
						(FPExpr) exp);
			} else {
				return ctx.mkMul(ctx.mkReal("" + value), (ArithExpr) exp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: mult(double, Object) failed.\n" + e);
		}
	}

	@Override
	public Object mult(Object exp, double value) {
		try {
			if (useFpForReals) {
				return ctx.mkFPMul(ctx.mkFPRoundNearestTiesToEven(), (FPExpr) exp,
						ctx.mkFPNumeral(value, ctx.mkFPSort64()));
			} else {
				return ctx.mkMul((ArithExpr) exp, ctx.mkReal("" + value));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: mult(double, Object) failed.\n" + e);
		}
	}

	@Override
	public Object div(double value, Object exp) {
		try {
			if (useFpForReals) {
				return ctx.mkFPDiv(ctx.mkFPRoundNearestTiesToEven(), ctx.mkFPNumeral(value, ctx.mkFPSort64()),
						(FPExpr) exp);
			} else {
				return ctx.mkDiv(ctx.mkReal("" + value), (ArithExpr) exp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: div(double, Object) failed.\n" + e);
		}
	}

	@Override
	public Object div(Object exp, double value) {
		try {
			if (useFpForReals) {
				return ctx.mkFPDiv(ctx.mkFPRoundNearestTiesToEven(), (FPExpr) exp,
						ctx.mkFPNumeral(value, ctx.mkFPSort64()));
			} else {
				return ctx.mkDiv((ArithExpr) exp, ctx.mkReal("" + value));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: div(double, Object) failed.\n" + e);
		}
	}

	@Override
	public Object and(long value, Object exp) {
		throw new RuntimeException("## Error Z3 \n");
	}

	@Override
	public Object and(Object exp, long value) {
		throw new RuntimeException("## Error Z3 \n");
	}

	@Override
	public Object and(Object exp1, Object exp2) {
		throw new RuntimeException("## Error Z3 \n");
	}

	@Override
	public Object or(long value, Object exp) {
		throw new RuntimeException("## Error Z3 \n");
	}

	@Override
	public Object or(Object exp, long value) {
		throw new RuntimeException("## Error Z3 \n");
	}

	@Override
	public Object or(Object exp1, Object exp2) {
		throw new RuntimeException("## Error Z3 \n");
	}

	@Override
	public Object xor(long value, Object exp) {
		throw new RuntimeException("## Error Z3 \n");
	}

	@Override
	public Object xor(Object exp, long value) {
		throw new RuntimeException("## Error Z3 \n");
	}

	@Override
	public Object xor(Object exp1, Object exp2) {
		throw new RuntimeException("## Error Z3 \n");
	}

	@Override
	public Object shiftL(long value, Object exp) {
		throw new RuntimeException("## Error Z3 \n");
	}

	@Override
	public Object shiftL(Object exp, long value) {
		throw new RuntimeException("## Error Z3 \n");
	}

	@Override
	public Object shiftL(Object exp1, Object exp2) {
		throw new RuntimeException("## Error Z3 \n");
	}

	@Override
	public Object shiftR(long value, Object exp) {
		throw new RuntimeException("## Error Z3 \n");
	}

	@Override
	public Object shiftR(Object exp, long value) {
		throw new RuntimeException("## Error Z3 \n");
	}

	@Override
	public Object shiftR(Object exp1, Object exp2) {
		throw new RuntimeException("## Error Z3 \n");
	}

	@Override
	public Object shiftUR(long value, Object exp) {
		throw new RuntimeException("## Error Z3 \n");
	}

	@Override
	public Object shiftUR(Object exp, long value) {
		throw new RuntimeException("## Error Z3 \n");
	}

	@Override
	public Object shiftUR(Object exp1, Object exp2) {
		throw new RuntimeException("## Error Z3 \n");
	}

	@Override
	public Object mixed(Object exp1, Object exp2) {
		// TODO Auto-generated method stub
		if (exp1 instanceof RealExpr && exp2 instanceof IntExpr) {
			return ctx.mkEq((RealExpr) exp1, ctx.mkInt2Real((IntExpr) exp2));
		}
		throw new RuntimeException("## Error Z3 \n");
	}

	@Override
	public double getRealValueInf(Object dpVar) {
		throw new RuntimeException("## Error Z3 \n");// return 0;
	}

	@Override
	public double getRealValueSup(Object dpVar) {
		// TODO Auto-generated method stub
		throw new RuntimeException("## Error Z3 \n");// return 0;
	}

	@Override
	public double getRealValue(Object dpVar) {
		try {
			Model model = solver.getModel();
			String strResult = model.eval((Expr) dpVar, true).toString().replaceAll("\\s+", "");
			Expr temp = model.eval((Expr) dpVar, false);
			if (temp instanceof com.microsoft.z3.RatNum) {
				strResult = ((com.microsoft.z3.RatNum) temp).toDecimalString(10);
			}
			return Double.parseDouble(strResult.replace('?', '0'));
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3: Exception caught in Z3 JNI: \n" + e);
		}
	}

	@Override
	public void postLogicalOR(Object[] constraint) {
		// TODO Auto-generated method stub
		throw new RuntimeException("## Error Z3 \n");
	}

	// Added by Aymeric to support arrays
	@Override
	public Object makeArrayVar(String name) {
		try {
			Sort int_type = ctx.mkIntSort();
			return ctx.mkArrayConst(name, int_type, int_type);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3 : Exception caught in Z3 JNI: " + e);
		}
	}

	@Override
	public Object makeRealArrayVar(String name) {
		try {
			Sort int_type = ctx.mkIntSort();
			Sort real_type = ctx.mkRealSort();
			return ctx.mkArrayConst(name, int_type, real_type);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3 : Exception caught in Z3 JNI: " + e);
		}
	}

	@Override
	public Object select(Object exp1, Object exp2) {
		try {
			return ctx.mkSelect((ArrayExpr) exp1, (IntExpr) exp2);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3 : Exception caught in Z3 JNI: " + e);
		}
	}

	@Override
	public Object store(Object exp1, Object exp2, Object exp3) {
		try {
			return ctx.mkStore((ArrayExpr) exp1, (IntExpr) exp2, (IntExpr) exp3);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3 : Exception caught in Z3 JNI: " + e);
		}
	}

	@Override
	public Object realSelect(Object exp1, Object exp2) {
		try {
			return ctx.mkSelect((ArrayExpr) exp1, (IntExpr) exp2);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3 : Exception caught in Z3 JNI: " + e);
		}
	}

	@Override
	public Object realStore(Object exp1, Object exp2, Object exp3) {
		try {
			return ctx.mkStore((ArrayExpr) exp1, (IntExpr) exp2, (RealExpr) exp3);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3 : Exception caught in Z3 JNI: " + e);
		}
	}

	@Override
	public Object makeIntConst(long value) {
		try {
			return ctx.mkInt(value);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3 : Exception caught in Z3 JNI: " + e);
		}
	}

	@Override
	public Object makeRealConst(double value) {
		try {
			return ctx.mkReal("" + value);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3 : Exception caught in Z3 JNI: " + e);
		}
	}

	private final static String sizeZ3Func = "(define-fun-rec s!ze ((a!1 (Array Int Bool)) (x!1 Int)) Int (ite (< x!1 "
			+ MIN_INT + ") 0 (ite (select a!1 x!1) (+ (s!ze a!1 (- x!1 1)) 1) (s!ze a!1 (- x!1 1)))))\n";
	private final static String listSizeZ3Func = "(define-fun-rec s!ze ((a!1 (Seq Int)) (x!1 Int)) Int (ite (< x!1 "
			+ MIN_INT
			+ ") 0 (ite (seq.contains a!1 (seq.unit x!1)) (+ (s!ze a!1 (- x!1 1)) 1) (s!ze a!1 (- x!1 1)))))\n";
	private final static String m2eZ3Func = "(define-fun-rec m!e ((a!1 (Array Int Bool)) (x!1 Int)) (Seq Int) (ite (< x!1 "
			+ MIN_INT
			+ ") (as seq.empty (Seq Int)) (ite (select a!1 x!1) (seq.++ (m!e a!1 (- x!1 1)) (seq.unit x!1)) (m!e a!1 (- x!1 1)))))\n";
	private final static String e2mZ3Func = "(define-fun-rec e!m ((a!1 (Seq Int)) (x!1 Int)) (Array Int Bool) (ite (< x!1 "
			+ MIN_INT
			+ ") ((as const (Array Int Bool)) false) (ite (seq.contains a!1 (seq.unit x!1)) (store (e!m a!1 (- x!1 1)) x!1 true) (e!m a!1 (- x!1 1)))))\n";
	private final static String listMappingZ3Func = "(define-fun mapping ((a!1 List_Int)) (Array Int Bool) (e!m (element a!1) "
			+ MAX_INT + "))\n";

	public BoolExpr[] parseSMTLIB2String(
			String smt/* , Symbol[] symb1, Sort[] sort, Symbol[] symb2, FuncDecl[] func */) {
		try {
			Set<Sort> sortSet = new LinkedHashSet<>();
			Set<FuncDecl> funcSet = new LinkedHashSet<>();
			for (Entry<SymbolicInteger, Object> entry : PCParser.symIntegerVar.entrySet()) {
				Symbol key = ctx.mkSymbol(entry.getKey().toString());
				FuncDecl value = ctx.mkConstDecl(key, ctx.mkIntSort());
				funcSet.add(value);
			}
			for (Entry<SymbolicReal, Object> entry : PCParser.symRealVar.entrySet()) {
				Symbol key = ctx.mkSymbol(entry.getKey().toString());
				FuncDecl value = ctx.mkConstDecl(key, ctx.mkRealSort());
				funcSet.add(value);
			}
			for (Entry<LibraryExpression, Object> entry : PCParser.symLibraryVar.entrySet()) {
				Sort sort = entry.getKey().getSort();
				Symbol key = ctx.mkSymbol(entry.getKey().toString());
				FuncDecl value = ctx.mkConstDecl(key, sort);
				funcSet.add(value);
				sortSet.add(sort);
				if (sort instanceof DatatypeSort) {
					FuncDecl[][] acc = ((DatatypeSort) sort).getAccessors();
					for (int i = 0; i < acc.length; i++) {
						for (int j = 0; j < acc[i].length; j++) {
							funcSet.add(acc[i][j]);
						}
					}
				}
			}
			Symbol[] symbs1 = new Symbol[sortSet.size()];
			Sort[] sorts = new Sort[sortSet.size()];
			int i;
			i = 0;
			for (Sort sort : sortSet) {
				symbs1[i] = sort.getName();
				if (sort.getName().toString().equals("List_Int")) {
					smt = listMappingZ3Func + smt;
				}
				sorts[i] = sort;
				i++;
			}
			Symbol[] symbs2 = new Symbol[funcSet.size()];
			FuncDecl[] funcs = new FuncDecl[funcSet.size()];
			i = 0;
			for (FuncDecl func : funcSet) {
				symbs2[i] = func.getName();
				funcs[i] = func;
				i++;
			}
			StringBuilder res = new StringBuilder();
			res.append(sizeZ3Func).append(listSizeZ3Func).append(m2eZ3Func).append(e2mZ3Func);
			smt = res.toString() + smt;
//			System.out.println(smt);
			return ctx.parseSMTLIB2String(smt, symbs1, sorts, symbs2, funcs);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3 : Exception caught in Z3 JNI: " + e);
		}
	}

	public Object makeLibraryVar(LibraryExpression cRef) throws UnknownElementTypeException {
		try {
			Sort sort = cRef.getSort();
			String boundSMT = null;
			if (sort == null) {
				CollectionExpression ce;
				switch (cRef.getTypeName()) {
				case "java.util.Collection":
				case "java.util.Set":
				case "java.util.HashSet":
				case "java.util.TreeSet":
					ce = (CollectionExpression) cRef;
					if (ce.getElementTypeName() == null) {
						throw new UnknownElementTypeException(
								"symbol should be lazy instantiated until its elementType is ensured", ce);
					}
					sort = mkSetSort(mkSortFromTypeName(ce.getElementTypeName()));
					boundSMT = String.format(
							"(assert (= (mapping %s) ((_ map and) (mapping %s) (lambda ((x!1 Int)) (and (>= x!1 %d) (<= x!1 %d))))))\n",
							ce.getName(), ce.getName(), MIN_INT, MAX_INT);
					break;
				case "java.util.List":
				case "java.util.ArrayList":
				case "java.util.LinkedList":
					ce = (CollectionExpression) cRef;
					if (ce.getElementTypeName() == null) {
						throw new UnknownElementTypeException(
								"symbol should be lazy instantiated until its elementType is ensured", ce);
					}
					sort = mkListSort(mkSortFromTypeName(ce.getElementTypeName()));
					// no duplicate element and out-of-bound element
					boundSMT = String.format("(assert (= (s!ze (element %s) %d) (seq.len (element %s))))\n",
							ce.getName(), MAX_INT, ce.getName());
					break;
				case "java.util.Map":
				case "java.util.HashMap":
				case "java.util.TreeMap":
					ce = (CollectionExpression) cRef;
					String[] kvTypes = ce.getKeyValueTypeNames();
					if (kvTypes[0] == null || kvTypes[1] == null) {
						throw new UnknownElementTypeException(
								"symbol should be lazy instantiated until its keyValueTypes are ensured", ce);
					}
					sort = mkMapSort(mkSortFromTypeName(kvTypes[0]), mkSortFromTypeName(kvTypes[1]));
					boundSMT = String.format(
							"(assert (= (key %s) ((_ map and) (key %s) (lambda ((x!1 Int)) (and (>= x!1 %d) (<= x!1 %d))))))\n",
							ce.getName(), ce.getName(), MIN_INT, MAX_INT)
							+ String.format(
									"(assert (forall ((x Int)) (=> (select (key %s) x) (and (>= (select (mapping %s) x) %d) (<= (select (mapping %s) x) %d)))))\n",
									ce.getName(), ce.getName(), MIN_INT, ce.getName(), MAX_INT);
					break;
				case "java.util.Iterator":
					ce = (CollectionExpression) cRef;
					if (ce.getElementTypeName() == null) {
						throw new UnknownElementTypeException(
								"symbol should be lazy instantiated until its elementType is ensured", ce);
					}
					sort = mkIteratorSort(mkSortFromTypeName(ce.getElementTypeName()));
					break;
				case "java.util.ListIterator":
					ce = (CollectionExpression) cRef;
					if (ce.getElementTypeName() == null) {
						throw new UnknownElementTypeException(
								"symbol should be lazy instantiated until its elementType is ensured", ce);
					}
					sort = mkListIteratorSort(mkSortFromTypeName(ce.getElementTypeName()));
					break;
				case "java.io.FileInputStream":
					sort = mkFileInputStreamSort();
					break;
				case "java.lang.String":
				case "java.lang.StringBuilder":
				case "java.lang.StringBuffer":
					sort = ctx.mkStringSort();
					break;
				default:
					throw new RuntimeException("symbol is of type " + cRef.getTypeName());
				}
				cRef.setSort(sort);
			}
			Expr res = ctx.mkConst(cRef.getName(), sort);
			PCParser.symLibraryVar.put(cRef, res);
			if (boundSMT != null) {
				cRef.setBound(parseSMTLIB2String(boundSMT));
			}
			if (cRef.getBound() != null) {
				Arrays.stream(cRef.getBound()).forEach(x -> post(x));
			}
			return res;
		} catch (UnknownElementTypeException e) {
			throw e;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("## Error Z3 : Exception caught in Z3 JNI: " + e);
		}
	}

	public Sort mkSortFromTypeName(String typeName) {
		switch (typeName) {
		case "int":
		case "byte":
		case "java.lang.Integer":
		case "java.lang.Byte":
		case "boolean":
		case "java.lang.Boolean":
		case "char":
		case "java.lang.Character":
			return ctx.mkIntSort();
		case "float":
		case "double":
		case "java.lang.Float":
		case "java.lang.Double":
			return ctx.mkRealSort();
		case "java.lang.String":
			return ctx.mkStringSort();
		default:
			throw new RuntimeException("symbol is of type " + typeName);
		}
	}

	public static Map<String, DatatypeSort> dataTypeSortMap = new TreeMap<>();

	private Sort mkSetSort(Sort element_sort) {
		String sort_name = "Set_" + element_sort;
		if (dataTypeSortMap.containsKey(sort_name)) {
			return dataTypeSortMap.get(sort_name);
		} else {
			String[] size_element = new String[] { "mapping" };
			Sort[] sorts = new Sort[] { ctx.mkArraySort(element_sort, ctx.mkBoolSort()) };
			int[] sort_refs = null;
			Constructor cons = ctx.mkConstructor(sort_name, "is_" + sort_name, size_element, sorts, sort_refs);
			DatatypeSort sort = ctx.mkDatatypeSort(sort_name, new Constructor[] { cons });
			dataTypeSortMap.put(sort_name, sort);
			System.out.println("Datatype Summary:");
			FuncDecl[][] acc = sort.getAccessors();
			System.out.println(sort.getConstructors()[0]);
			for (int i = 0; i < acc.length; i++) {
				for (int j = 0; j < acc[i].length; j++) {
					System.out.println(sort.getAccessors()[i][j]);
				}
			}
			System.out.println("=====");
			return sort;
		}
	}

	private Sort mkListSort(Sort element_sort) {
		String sort_name = "List_" + element_sort;
		if (dataTypeSortMap.containsKey(sort_name)) {
			return dataTypeSortMap.get(sort_name);
		} else {
//			String[] size_element = new String[] { "mapping", "element" };
//			Sort[] sorts = new Sort[] { ctx.mkArraySort(element_sort, ctx.mkBoolSort()), ctx.mkSeqSort(element_sort) };
			String[] size_element = new String[] { "element" };
			Sort[] sorts = new Sort[] { ctx.mkSeqSort(element_sort) };
			int[] sort_refs = null;
			Constructor cons = ctx.mkConstructor(sort_name, "is_" + sort_name, size_element, sorts, sort_refs);
			DatatypeSort sort = ctx.mkDatatypeSort(sort_name, new Constructor[] { cons });
			dataTypeSortMap.put(sort_name, sort);
			System.out.println("Datatype Summary:");
			FuncDecl[][] acc = sort.getAccessors();
			System.out.println(sort.getConstructors()[0]);
			for (int i = 0; i < acc.length; i++) {
				for (int j = 0; j < acc[i].length; j++) {
					System.out.println(sort.getAccessors()[i][j]);
				}
			}
			System.out.println("=====");
			return sort;
		}
	}

	private Sort mkMapSort(Sort key_sort, Sort value_sort) {
		String sort_name = "Map_" + key_sort + "_" + value_sort;
		if (dataTypeSortMap.containsKey(sort_name)) {
			return dataTypeSortMap.get(sort_name);
		} else {
			String[] size_element = new String[] { "key", "mapping" };
			Sort[] sorts = new Sort[] { ctx.mkArraySort(key_sort, ctx.mkBoolSort()),
					ctx.mkArraySort(key_sort, value_sort) };
			int[] sort_refs = null;
			Constructor cons = ctx.mkConstructor(sort_name, "is_" + sort_name, size_element, sorts, sort_refs);
			DatatypeSort sort = ctx.mkDatatypeSort(sort_name, new Constructor[] { cons });
			dataTypeSortMap.put(sort_name, sort);
			System.out.println("Datatype Summary:");
			FuncDecl[][] acc = sort.getAccessors();
			System.out.println(sort.getConstructors()[0]);
			for (int i = 0; i < acc.length; i++) {
				for (int j = 0; j < acc[i].length; j++) {
					System.out.println(sort.getAccessors()[i][j]);
				}
			}
			System.out.println("=====");
			return sort;
		}
	}

	private Sort mkIteratorSort(Sort element_sort) {
		String sort_name = "Iterator_" + element_sort;
		if (dataTypeSortMap.containsKey(sort_name)) {
			return dataTypeSortMap.get(sort_name);
		} else {
			String[] size_element = new String[] { "mapping", "previous" };
			Sort[] sorts = new Sort[] { ctx.mkArraySort(element_sort, ctx.mkBoolSort()),
					ctx.mkArraySort(element_sort, ctx.mkBoolSort()) };
			int[] sort_refs = null;
			Constructor cons = ctx.mkConstructor(sort_name, "is_" + sort_name, size_element, sorts, sort_refs);
			DatatypeSort sort = ctx.mkDatatypeSort(sort_name, new Constructor[] { cons });
			dataTypeSortMap.put(sort_name, sort);
			System.out.println("Datatype Summary:");
			FuncDecl[][] acc = sort.getAccessors();
			System.out.println(sort.getConstructors()[0]);
			for (int i = 0; i < acc.length; i++) {
				for (int j = 0; j < acc[i].length; j++) {
					System.out.println(sort.getAccessors()[i][j]);
				}
			}
			System.out.println("=====");
			return sort;
		}
	}

	private Sort mkListIteratorSort(Sort element_sort) {
		String sort_name = "ListIterator_" + element_sort;
		if (dataTypeSortMap.containsKey(sort_name)) {
			return dataTypeSortMap.get(sort_name);
		} else {
			String[] size_element = new String[] { "position", "element" };
			Sort[] sorts = new Sort[] { ctx.mkIntSort(), ctx.mkSeqSort(element_sort) };
			int[] sort_refs = null;
			Constructor cons = ctx.mkConstructor(sort_name, "is_" + sort_name, size_element, sorts, sort_refs);
			DatatypeSort sort = ctx.mkDatatypeSort(sort_name, new Constructor[] { cons });
			dataTypeSortMap.put(sort_name, sort);
			System.out.println("Datatype Summary:");
			FuncDecl[][] acc = sort.getAccessors();
			System.out.println(sort.getConstructors()[0]);
			for (int i = 0; i < acc.length; i++) {
				for (int j = 0; j < acc[i].length; j++) {
					System.out.println(sort.getAccessors()[i][j]);
				}
			}
			System.out.println("=====");
			return sort;
		}
	}

	public Sort mkFileInputStreamSort() {
		String sort_name = "FileInpurStream";
		if (dataTypeSortMap.containsKey(sort_name)) {
			return dataTypeSortMap.get(sort_name);
		} else {
			String[] size_element = new String[] { "length", "readPosition", "isOpen" };
			Sort[] sorts = new Sort[] { ctx.mkIntSort(), ctx.mkIntSort(), ctx.mkBoolSort() };
			int[] sort_refs = null;
			Constructor cons = ctx.mkConstructor(sort_name, "is_" + sort_name, size_element, sorts, sort_refs);
			DatatypeSort sort = ctx.mkDatatypeSort(sort_name, new Constructor[] { cons });
			dataTypeSortMap.put(sort_name, sort);
			System.out.println("Datatype Summary:");
			FuncDecl[][] acc = sort.getAccessors();
			System.out.println(sort.getConstructors()[0]);
			for (int i = 0; i < acc.length; i++) {
				for (int j = 0; j < acc[i].length; j++) {
					System.out.println(sort.getAccessors()[i][j]);
				}
			}
			System.out.println("=====");
			return sort;
		}
	}

}
