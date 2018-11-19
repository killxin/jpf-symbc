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

import gov.nasa.jpf.symbc.Debug;
import java.util.ArrayList;

public class TestArray {
	public static void testBasic(int x) {
		int[] arr = new int[10];
		for (int i = 0; i < arr.length; i++) {
			arr[i] = i;
		}
		
		System.out.println("Contents of arr: " );
		for (int i : arr) {
			System.out.print(i + " ");
		}
		System.out.println("\n");
		
		if (arr[x] == 3) {
			System.out.println("Found solution for arr[x] == 3: " + Debug.getSolvedPC());
		} else {
			System.out.println("Found solution for arr[x] != 3: " + Debug.getSolvedPC());
		}
	}
	
	public static void testArrayList(int x, int y) {		
		int arrSize = 5;
		ArrayList<Integer> arrList = new ArrayList<>();
		for (int i = 0; i < arrSize; i++) {
			arrList.add(y);
		}
		
//		System.out.println("Contents of arr: " );
//		for (int i : arrList) {
//			System.out.print(i + " ");
//		}
//		System.out.println("\n");
		
		if (arrList.get(x) == 30) {
//			System.out.println("Found solution for arrList[x] == 3: " + Debug.getSolvedPC());
			System.out.println("Found solution for arrList[x] == 30");
		} else {
//			System.out.println("Found solution for arrList[x] != 3: " + Debug.getSolvedPC());
			System.out.println("Found solution for arrList[x] != 30");
		}
	}
	
	public static void testMyArray(ArrayList a, ArrayList b) {
		int arrSize = 5;
		for (int i = 0; i < arrSize; i++) {
			a.add(i); b.add(5-i);
		}
		if ((int)a.get(2)==(int)b.get(2)) {
//			System.out.println("Found solution for arrList[x] == 3: " + Debug.getSolvedPC());
			System.out.println("Found solution for a[2] == b[2]");
		} else {
//			System.out.println("Found solution for arrList[x] != 3: " + Debug.getSolvedPC());
			System.out.println("Found solution for a[2] != b[2]");
		}
	}
	
	public static void testMyArray2(ArrayList a, int x) {
		int arrSize = 5;
		for (int i = 0; i < arrSize; i++) {
			a.add(x);
		}
		if ((int)a.get(3)==5) {
//			System.out.println("Found solution for arrList[x] == 3: " + Debug.getSolvedPC());
			System.out.println("Found solution for a[6] == 5");
		} else {
//			System.out.println("Found solution for arrList[x] != 3: " + Debug.getSolvedPC());
			System.out.println("Found solution for a[6] != 5");
		}
	}
	
	public static void main(String[] args) {
		//testBasic(0);
//		testArrayList(0,3);
//		testMyArray(new ArrayList(), new ArrayList());
		testMyArray2(new ArrayList(), 5);
	}
}