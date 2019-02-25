package edu.nju.seg.symbc;

import java.util.HashMap;
import java.util.Map;

import gov.nasa.jpf.ListenerAdapter;
import gov.nasa.jpf.jvm.bytecode.CHECKCAST;
import gov.nasa.jpf.jvm.bytecode.JVMInvokeInstruction;
import gov.nasa.jpf.vm.ElementInfo;
import gov.nasa.jpf.vm.Instruction;
import gov.nasa.jpf.vm.MethodInfo;
import gov.nasa.jpf.vm.StackFrame;
import gov.nasa.jpf.vm.ThreadInfo;
import gov.nasa.jpf.vm.VM;
import gov.nasa.jpf.vm.bytecode.ReturnInstruction;

public class CollectionExpression extends LibraryExpression {
	
	private String elementTypeName;
	
	private String[] keyValueTypeNames;

	public CollectionExpression(String name, String typeName) {
		super(name, typeName);
		this.elementTypeName = null;
		this.keyValueTypeNames = new String[2];
	}

	public CollectionExpression clone() {
		CollectionExpression copy = new CollectionExpression(name, typeName);
		copy.setCopyFrom(this);
		copy.setElementTypeName(this.elementTypeName);
		copy.setKeyValueTypeNames(this.keyValueTypeNames[0], this.keyValueTypeNames[1]);
		return copy;
	}

	public String getElementTypeName() {
		return elementTypeName;
	}
	
	public String[] getKeyValueTypeNames() {
		return keyValueTypeNames;
	}
	
	private String getSort(String typeName) {
		switch (typeName) {
		case "java.lang.Integer":
		case "java.lang.Byte":
		case "int":
			return "Int";
		case "java.lang.Float":
		case "java.lang.Double":
		case "float":
		case "double":
			return "Real";
		default:
			return typeName;
		}
	}
	
	public String getElementSort() {
		return getSort(elementTypeName);
	}
	
	public String getKeySort() {
		return getSort(keyValueTypeNames[0]);
	}
	
	public String getValueSort() {
		return getSort(keyValueTypeNames[1]);
	}
	
	public CollectionExpression getCopyFrom() {
		return (CollectionExpression) copyFrom;
	}

	public void setCopyFrom(CollectionExpression copyFrom) {
		this.copyFrom = copyFrom;
	}

	public void setElementTypeName(String elementType) {
		this.elementTypeName = elementType;
		CollectionExpression pre = getCopyFrom();
		while(pre != null && pre.getElementTypeName() == null) {
			pre.setElementTypeName(elementType);
			pre = pre.getCopyFrom();
		}
	}
	
	public void setKeyTypeName(String keyType) {
		this.keyValueTypeNames[0] = keyType;
		CollectionExpression pre = getCopyFrom();
		while(pre != null && pre.getElementTypeName() == null) {
			pre.setKeyTypeName(keyType);
			pre = pre.getCopyFrom();
		}
	}
	
	public void setValueTypeName(String valueType) {
		this.keyValueTypeNames[1] = valueType;
		CollectionExpression pre = getCopyFrom();
		while(pre != null && pre.getElementTypeName() == null) {
			pre.setValueTypeName(valueType);
			pre = pre.getCopyFrom();
		}
	}
	
	public void setKeyValueTypeNames(String keyType, String valueType) {
		this.keyValueTypeNames[0] = keyType;
		this.keyValueTypeNames[1] = valueType;
		CollectionExpression pre = getCopyFrom();
		while(pre != null && pre.getElementTypeName() == null) {
			pre.setKeyValueTypeNames(keyType, valueType);
			pre = pre.getCopyFrom();
		}
	}
	
	public void setElementOrKeyValueTypes(LibraryOperation opt, JVMInvokeInstruction invInst, ThreadInfo th, Map<ElementInfo, Object> intent) {
		StackFrame sf = th.getTopFrame();
		if(getElementTypeName() == null) {
			String optSig = opt.getSignature();
			if(optSig.contains("contains(Ljava/lang/Object;)") ||
					optSig.contains("add(Ljava/lang/Object;)") ||
					optSig.contains("add(ILjava/lang/Object;)") 
			) {
				String typeName = th.getElementInfo(sf.peek(0)).getClassInfo().getName();
				setElementTypeName(typeName);
			} else if(optSig.contains("get(I)Ljava/lang/Object;")) {
				Instruction nextInst = invInst.getNext(th);
				if(nextInst instanceof CHECKCAST) {
					CHECKCAST checkCast = (CHECKCAST) nextInst;
					String typeName = checkCast.getTypeName();
					setElementTypeName(typeName);
				}
			} else if(optSig.contains("addAll(Ljava/util/Collection;)") ||
					optSig.contains("addAll(ILjava/util/Collection;)")
			) {
				int objRef = sf.peek();
				ElementInfo ei = th.getElementInfo(objRef);
				if(intent.containsKey(ei) && intent.get(ei) instanceof CollectionExpression) {
					CollectionExpression ce = (CollectionExpression) intent.get(ei);
					if(ce.getElementTypeName() != null) {
						setElementTypeName(ce.getElementTypeName());
					} 
				} else if(ei.getObjectAttr() instanceof CollectionExpression) {
					CollectionExpression ce = (CollectionExpression) ei.getObjectAttr();
					if(ce.getElementTypeName() != null) {
						setElementTypeName(ce.getElementTypeName());
					}
				}
			}
		}
		if(getKeyValueTypeNames()[0] == null || getKeyValueTypeNames()[1] == null) {
			String optSig = opt.getSignature();
			if(optSig.contains("put(Ljava/lang/Object;Ljava/lang/Object;)")) {
				String valueType = th.getElementInfo(sf.peek(0)).getClassInfo().getName();
				String keyType = th.getElementInfo(sf.peek(1)).getClassInfo().getName();
				setKeyValueTypeNames(keyType, valueType);
			} else if(optSig.contains("get(Ljava/lang/Object;)Ljava/lang/Object;")) {
				String keyType = th.getElementInfo(sf.peek(0)).getClassInfo().getName();
				setKeyTypeName(keyType);
				Instruction nextInst = invInst.getNext(th);
				if(nextInst instanceof CHECKCAST) {
					CHECKCAST checkCast = (CHECKCAST) nextInst;
					String valueType = checkCast.getTypeName();
					setValueTypeName(valueType);
				}
			} else if(optSig.contains("containsKey")) {
				String keyType = th.getElementInfo(sf.peek(0)).getClassInfo().getName();
				setKeyTypeName(keyType);
			} else if(optSig.contains("containsValue")) {
				String valueType = th.getElementInfo(sf.peek(0)).getClassInfo().getName();
				setValueTypeName(valueType);
			}
		}
	}
	
	public static Map<Integer, String> objRef2ElemType = new HashMap<>();
	public static Map<Integer, String[]> objRef2KVTypes = new HashMap<>();
	
	public static void ensureElementOrKeyValueTypes(LibraryOperation opt, JVMInvokeInstruction invInst, ThreadInfo th) {
		StackFrame sf = th.getTopFrame();
		String optSig = opt.getSignature();
		if(optSig.contains("add(Ljava/lang/Object;)") ||
				optSig.contains("add(ILjava/lang/Object;)")
		) {
			String typeName = th.getElementInfo(sf.peek(0)).getClassInfo().getName();
			int objRef = sf.peek(1);
			objRef2ElemType.put(objRef, typeName);
		} else if(optSig.contains("put(Ljava/lang/Object;Ljava/lang/Object;)")) {
			String valueType = th.getElementInfo(sf.peek(0)).getClassInfo().getName();
			String keyType = th.getElementInfo(sf.peek(1)).getClassInfo().getName();
			int objRef = sf.peek(2);
			objRef2KVTypes.put(objRef, new String[] {keyType, valueType});
		} else if(optSig.contains("iterator()") ||
				optSig.contains("listIterator()") 
		) {
			int objRef = sf.peek();
			if(objRef2ElemType.containsKey(objRef)) {
				String typeName = objRef2ElemType.get(objRef);
				MethodInfo mi = invInst.getInvokedMethod();
				th.getVM().addListener(new ListenerAdapter() {
					@Override
					public void instructionExecuted(VM vm, ThreadInfo currentThread, Instruction nextInstruction,
							Instruction executedInstruction) {
						if(executedInstruction instanceof ReturnInstruction && 
								executedInstruction.getMethodInfo().equals(mi)) {
							StackFrame frame = th.getTopFrame();
							int retRef = frame.peek();
							objRef2ElemType.put(retRef, typeName);
							vm.removeListener(this);
						}
					}
				});
			}
		} else if(optSig.contains("listIterator(I)")) {
			int objRef = sf.peek(1);
			if(objRef2ElemType.containsKey(objRef)) {
				String typeName = objRef2ElemType.get(objRef);
				MethodInfo mi = invInst.getInvokedMethod();
				th.getVM().addListener(new ListenerAdapter() {
					@Override
					public void instructionExecuted(VM vm, ThreadInfo currentThread, Instruction nextInstruction,
							Instruction executedInstruction) {
						if(executedInstruction instanceof ReturnInstruction && 
								executedInstruction.getMethodInfo().equals(mi)) {
							StackFrame frame = th.getTopFrame();
							int retRef = frame.peek();
							objRef2ElemType.put(retRef, typeName);
							vm.removeListener(this);
						}
					}
				});
			}
		}
	}
	
}
