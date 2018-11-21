package edu.nju.seg.symbc.collections;

public enum CollectionOperation {

	COLLECTION_SIZE("java.util.Collection.size()I", true),
	COLLECTION_ISEMPTY("java.util.Collection.isEmpty()Z", true),
	COLLECTION_CONTAINS("java.util.Collection.contains(Ljava/lang/Object;)Z", true),
	COLLECTION_ITERATOR("java.util.Collection.iterator()Ljava/util/Iterator;", true),
	COLLECTION_TOARRAY("java.util.Collection.toArray()[Ljava/lang/Object;", true),
	COLLECTION_TOARRAY2("java.util.Collection.toArray([Ljava/lang/Object;)[Ljava/lang/Object;", true),
	COLLECTION_ADD("java.util.Collection.add(Ljava/lang/Object;)Z", true),
	COLLECTION_REMOVE("java.util.Collection.remove(Ljava/lang/Object;)Z", true),
	COLLECTION_CONTAINSALL("java.util.Collection.containsAll(Ljava/util/Collection;)Z", true),
	COLLECTION_ADDALL("java.util.Collection.addAll(Ljava/util/Collection;)Z", true),
	COLLECTION_REMOVEALL("java.util.Collection.removeAll(Ljava/util/Collection;)Z", true),
	COLLECTION_REMOVEIF("java.util.Collection.removeIf(Ljava/util/function/Predicate;)Z", true),
	COLLECTION_RETAINALL("java.util.Collection.retainAll(Ljava/util/Collection;)Z", true),
	COLLECTION_CLEAR("java.util.Collection.clear()V", true),
	COLLECTION_EQUALS("java.util.Collection.equals(Ljava/lang/Object;)Z", true),
	COLLECTION_HASHCODE("java.util.Collection.hashCode()I", true),
	COLLECTION_SPLITERATOR("java.util.Collection.spliterator()Ljava/util/Spliterator;", true),
	COLLECTION_STREAM("java.util.Collection.stream()Ljava/util/stream/Stream;", true),
	COLLECTION_PARALLELSTREAM("java.util.Collection.parallelStream()Ljava/util/stream/Stream;", true),
	LIST_SIZE("java.util.List.size()I", true),
	LIST_ISEMPTY("java.util.List.isEmpty()Z", true),
	LIST_CONTAINS("java.util.List.contains(Ljava/lang/Object;)Z", true),
	LIST_ITERATOR("java.util.List.iterator()Ljava/util/Iterator;", true),
	LIST_TOARRAY("java.util.List.toArray()[Ljava/lang/Object;", true),
	LIST_TOARRAY2("java.util.List.toArray([Ljava/lang/Object;)[Ljava/lang/Object;", true),
	LIST_ADD("java.util.List.add(Ljava/lang/Object;)Z", true),
	LIST_REMOVE("java.util.List.remove(Ljava/lang/Object;)Z", true),
	LIST_CONTAINSALL("java.util.List.containsAll(Ljava/util/Collection;)Z", true),
	LIST_ADDALL("java.util.List.addAll(Ljava/util/Collection;)Z", true),
	LIST_ADDALL2("java.util.List.addAll(ILjava/util/Collection;)Z", true),
	LIST_REMOVEALL("java.util.List.removeAll(Ljava/util/Collection;)Z", true),
	LIST_RETAINALL("java.util.List.retainAll(Ljava/util/Collection;)Z", true),
	LIST_REPLACEALL("java.util.List.replaceAll(Ljava/util/function/UnaryOperator;)V", true),
	LIST_SORT("java.util.List.sort(Ljava/util/Comparator;)V", true),
	LIST_CLEAR("java.util.List.clear()V", true),
	LIST_EQUALS("java.util.List.equals(Ljava/lang/Object;)Z", true),
	LIST_HASHCODE("java.util.List.hashCode()I", true),
	LIST_GET("java.util.List.get(I)Ljava/lang/Object;", true),
	LIST_SET("java.util.List.set(ILjava/lang/Object;)Ljava/lang/Object;", true),
	LIST_ADD2("java.util.List.add(ILjava/lang/Object;)V", true),
	LIST_REMOVE2("java.util.List.remove(I)Ljava/lang/Object;", true),
	LIST_INDEXOF("java.util.List.indexOf(Ljava/lang/Object;)I", true),
	LIST_LASTINDEXOF("java.util.List.lastIndexOf(Ljava/lang/Object;)I", true),
	LIST_LISTITERATOR("java.util.List.listIterator()Ljava/util/ListIterator;", true),
	LIST_LISTITERATOR2("java.util.List.listIterator(I)Ljava/util/ListIterator;", true),
	LIST_SUBLIST("java.util.List.subList(II)Ljava/util/List;", true),
	LIST_SPLITERATOR("java.util.List.spliterator()Ljava/util/Spliterator;", true),
	SET_SIZE("java.util.Set.size()I", true),
	SET_ISEMPTY("java.util.Set.isEmpty()Z", true),
	SET_CONTAINS("java.util.Set.contains(Ljava/lang/Object;)Z", true),
	SET_ITERATOR("java.util.Set.iterator()Ljava/util/Iterator;", true),
	SET_TOARRAY("java.util.Set.toArray()[Ljava/lang/Object;", true),
	SET_TOARRAY2("java.util.Set.toArray([Ljava/lang/Object;)[Ljava/lang/Object;", true),
	SET_ADD("java.util.Set.add(Ljava/lang/Object;)Z", true),
	SET_REMOVE("java.util.Set.remove(Ljava/lang/Object;)Z", true),
	SET_CONTAINSALL("java.util.Set.containsAll(Ljava/util/Collection;)Z", true),
	SET_ADDALL("java.util.Set.addAll(Ljava/util/Collection;)Z", true),
	SET_RETAINALL("java.util.Set.retainAll(Ljava/util/Collection;)Z", true),
	SET_REMOVEALL("java.util.Set.removeAll(Ljava/util/Collection;)Z", true),
	SET_CLEAR("java.util.Set.clear()V", true),
	SET_EQUALS("java.util.Set.equals(Ljava/lang/Object;)Z", true),
	SET_HASHCODE("java.util.Set.hashCode()I", true),
	SET_SPLITERATOR("java.util.Set.spliterator()Ljava/util/Spliterator;", true),
	MAP_SIZE("java.util.Map.size()I", true),
	MAP_ISEMPTY("java.util.Map.isEmpty()Z", true),
	MAP_CONTAINSKEY("java.util.Map.containsKey(Ljava/lang/Object;)Z", true),
	MAP_CONTAINSVALUE("java.util.Map.containsValue(Ljava/lang/Object;)Z", true),
	MAP_GET("java.util.Map.get(Ljava/lang/Object;)Ljava/lang/Object;", true),
	MAP_PUT("java.util.Map.put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", true),
	MAP_REMOVE("java.util.Map.remove(Ljava/lang/Object;)Ljava/lang/Object;", true),
	MAP_PUTALL("java.util.Map.putAll(Ljava/util/Map;)V", true),
	MAP_CLEAR("java.util.Map.clear()V", true),
	MAP_KEYSET("java.util.Map.keySet()Ljava/util/Set;", true),
	MAP_VALUES("java.util.Map.values()Ljava/util/Collection;", true),
	MAP_ENTRYSET("java.util.Map.entrySet()Ljava/util/Set;", true),
	MAP_EQUALS("java.util.Map.equals(Ljava/lang/Object;)Z", true),
	MAP_HASHCODE("java.util.Map.hashCode()I", true),
	MAP_GETORDEFAULT("java.util.Map.getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", true),
	MAP_FOREACH("java.util.Map.forEach(Ljava/util/function/BiConsumer;)V", true),
	MAP_REPLACEALL("java.util.Map.replaceAll(Ljava/util/function/BiFunction;)V", true),
	MAP_PUTIFABSENT("java.util.Map.putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", true),
	MAP_REMOVE2("java.util.Map.remove(Ljava/lang/Object;Ljava/lang/Object;)Z", true),
	MAP_REPLACE("java.util.Map.replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z", true),
	MAP_REPLACE2("java.util.Map.replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", true),
	MAP_COMPUTEIFABSENT("java.util.Map.computeIfAbsent(Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;", true),
	MAP_COMPUTEIFPRESENT("java.util.Map.computeIfPresent(Ljava/lang/Object;Ljava/util/function/BiFunction;)Ljava/lang/Object;", true),
	MAP_COMPUTE("java.util.Map.compute(Ljava/lang/Object;Ljava/util/function/BiFunction;)Ljava/lang/Object;", true),
	MAP_MERGE("java.util.Map.merge(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/function/BiFunction;)Ljava/lang/Object;", true),
	ARRAYLIST_INIT("java.util.ArrayList.<init>(I)V", true),
	ARRAYLIST_INIT2("java.util.ArrayList.<init>()V", false),
	ARRAYLIST_INIT3("java.util.ArrayList.<init>(Ljava/util/Collection;)V", true),
	ARRAYLIST_TRIMTOSIZE("java.util.ArrayList.trimToSize()V", true),
	ARRAYLIST_ENSURECAPACITY("java.util.ArrayList.ensureCapacity(I)V", true),
	ARRAYLIST_CALCULATECAPACITY("java.util.ArrayList.calculateCapacity([Ljava/lang/Object;I)I", true),
	ARRAYLIST_HUGECAPACITY("java.util.ArrayList.hugeCapacity(I)I", true),
	ARRAYLIST_SIZE("java.util.ArrayList.size()I", true),
	ARRAYLIST_ISEMPTY("java.util.ArrayList.isEmpty()Z", true),
	ARRAYLIST_CONTAINS("java.util.ArrayList.contains(Ljava/lang/Object;)Z", true),
	ARRAYLIST_INDEXOF("java.util.ArrayList.indexOf(Ljava/lang/Object;)I", true),
	ARRAYLIST_LASTINDEXOF("java.util.ArrayList.lastIndexOf(Ljava/lang/Object;)I", true),
	ARRAYLIST_CLONE("java.util.ArrayList.clone()Ljava/lang/Object;", true),
	ARRAYLIST_TOARRAY("java.util.ArrayList.toArray()[Ljava/lang/Object;", true),
	ARRAYLIST_TOARRAY2("java.util.ArrayList.toArray([Ljava/lang/Object;)[Ljava/lang/Object;", true),
	ARRAYLIST_ELEMENTDATA("java.util.ArrayList.elementData(I)Ljava/lang/Object;", true),
	ARRAYLIST_GET("java.util.ArrayList.get(I)Ljava/lang/Object;", true),
	ARRAYLIST_SET("java.util.ArrayList.set(ILjava/lang/Object;)Ljava/lang/Object;", true),
	ARRAYLIST_ADD("java.util.ArrayList.add(Ljava/lang/Object;)Z", false),
	ARRAYLIST_ADD2("java.util.ArrayList.add(ILjava/lang/Object;)V", true),
	ARRAYLIST_REMOVE("java.util.ArrayList.remove(I)Ljava/lang/Object;", true),
	ARRAYLIST_REMOVE2("java.util.ArrayList.remove(Ljava/lang/Object;)Z", true),
	ARRAYLIST_CLEAR("java.util.ArrayList.clear()V", true),
	ARRAYLIST_ADDALL("java.util.ArrayList.addAll(Ljava/util/Collection;)Z", true),
	ARRAYLIST_ADDALL2("java.util.ArrayList.addAll(ILjava/util/Collection;)Z", true),
	ARRAYLIST_REMOVERANGE("java.util.ArrayList.removeRange(II)V", true),
	ARRAYLIST_REMOVEALL("java.util.ArrayList.removeAll(Ljava/util/Collection;)Z", true),
	ARRAYLIST_RETAINALL("java.util.ArrayList.retainAll(Ljava/util/Collection;)Z", true),
	ARRAYLIST_LISTITERATOR("java.util.ArrayList.listIterator(I)Ljava/util/ListIterator;", true),
	ARRAYLIST_LISTITERATOR2("java.util.ArrayList.listIterator()Ljava/util/ListIterator;", true),
	ARRAYLIST_ITERATOR("java.util.ArrayList.iterator()Ljava/util/Iterator;", true),
	ARRAYLIST_SUBLIST("java.util.ArrayList.subList(II)Ljava/util/List;", true),
	ARRAYLIST_SUBLISTRANGECHECK("java.util.ArrayList.subListRangeCheck(III)V", true),
	ARRAYLIST_FOREACH("java.util.ArrayList.forEach(Ljava/util/function/Consumer;)V", true),
	ARRAYLIST_SPLITERATOR("java.util.ArrayList.spliterator()Ljava/util/Spliterator;", true),
	ARRAYLIST_REMOVEIF("java.util.ArrayList.removeIf(Ljava/util/function/Predicate;)Z", true),
	ARRAYLIST_REPLACEALL("java.util.ArrayList.replaceAll(Ljava/util/function/UnaryOperator;)V", true),
	ARRAYLIST_SORT("java.util.ArrayList.sort(Ljava/util/Comparator;)V", true),
	ARRAYLIST_ACCESS$100("java.util.ArrayList.access$100(Ljava/util/ArrayList;)I", true),
	ARRAYLIST_CLINIT("java.util.ArrayList.<clinit>()V", true),
	LINKEDLIST_INIT("java.util.LinkedList.<init>()V", true),
	LINKEDLIST_INIT2("java.util.LinkedList.<init>(Ljava/util/Collection;)V", true),
	LINKEDLIST_LINKLAST("java.util.LinkedList.linkLast(Ljava/lang/Object;)V", true),
	LINKEDLIST_LINKBEFORE("java.util.LinkedList.linkBefore(Ljava/lang/Object;Ljava/util/LinkedList$Node;)V", true),
	LINKEDLIST_UNLINK("java.util.LinkedList.unlink(Ljava/util/LinkedList$Node;)Ljava/lang/Object;", true),
	LINKEDLIST_GETFIRST("java.util.LinkedList.getFirst()Ljava/lang/Object;", true),
	LINKEDLIST_GETLAST("java.util.LinkedList.getLast()Ljava/lang/Object;", true),
	LINKEDLIST_REMOVEFIRST("java.util.LinkedList.removeFirst()Ljava/lang/Object;", true),
	LINKEDLIST_REMOVELAST("java.util.LinkedList.removeLast()Ljava/lang/Object;", true),
	LINKEDLIST_ADDFIRST("java.util.LinkedList.addFirst(Ljava/lang/Object;)V", true),
	LINKEDLIST_ADDLAST("java.util.LinkedList.addLast(Ljava/lang/Object;)V", true),
	LINKEDLIST_CONTAINS("java.util.LinkedList.contains(Ljava/lang/Object;)Z", true),
	LINKEDLIST_SIZE("java.util.LinkedList.size()I", true),
	LINKEDLIST_ADD("java.util.LinkedList.add(Ljava/lang/Object;)Z", true),
	LINKEDLIST_REMOVE("java.util.LinkedList.remove(Ljava/lang/Object;)Z", true),
	LINKEDLIST_ADDALL("java.util.LinkedList.addAll(Ljava/util/Collection;)Z", true),
	LINKEDLIST_ADDALL2("java.util.LinkedList.addAll(ILjava/util/Collection;)Z", true),
	LINKEDLIST_CLEAR("java.util.LinkedList.clear()V", true),
	LINKEDLIST_GET("java.util.LinkedList.get(I)Ljava/lang/Object;", true),
	LINKEDLIST_SET("java.util.LinkedList.set(ILjava/lang/Object;)Ljava/lang/Object;", true),
	LINKEDLIST_ADD2("java.util.LinkedList.add(ILjava/lang/Object;)V", true),
	LINKEDLIST_REMOVE2("java.util.LinkedList.remove(I)Ljava/lang/Object;", true),
	LINKEDLIST_NODE("java.util.LinkedList.node(I)Ljava/util/LinkedList$Node;", true),
	LINKEDLIST_INDEXOF("java.util.LinkedList.indexOf(Ljava/lang/Object;)I", true),
	LINKEDLIST_LASTINDEXOF("java.util.LinkedList.lastIndexOf(Ljava/lang/Object;)I", true),
	LINKEDLIST_PEEK("java.util.LinkedList.peek()Ljava/lang/Object;", true),
	LINKEDLIST_ELEMENT("java.util.LinkedList.element()Ljava/lang/Object;", true),
	LINKEDLIST_POLL("java.util.LinkedList.poll()Ljava/lang/Object;", true),
	LINKEDLIST_REMOVE3("java.util.LinkedList.remove()Ljava/lang/Object;", true),
	LINKEDLIST_OFFER("java.util.LinkedList.offer(Ljava/lang/Object;)Z", true),
	LINKEDLIST_OFFERFIRST("java.util.LinkedList.offerFirst(Ljava/lang/Object;)Z", true),
	LINKEDLIST_OFFERLAST("java.util.LinkedList.offerLast(Ljava/lang/Object;)Z", true),
	LINKEDLIST_PEEKFIRST("java.util.LinkedList.peekFirst()Ljava/lang/Object;", true),
	LINKEDLIST_PEEKLAST("java.util.LinkedList.peekLast()Ljava/lang/Object;", true),
	LINKEDLIST_POLLFIRST("java.util.LinkedList.pollFirst()Ljava/lang/Object;", true),
	LINKEDLIST_POLLLAST("java.util.LinkedList.pollLast()Ljava/lang/Object;", true),
	LINKEDLIST_PUSH("java.util.LinkedList.push(Ljava/lang/Object;)V", true),
	LINKEDLIST_POP("java.util.LinkedList.pop()Ljava/lang/Object;", true),
	LINKEDLIST_REMOVEFIRSTOCCURRENCE("java.util.LinkedList.removeFirstOccurrence(Ljava/lang/Object;)Z", true),
	LINKEDLIST_REMOVELASTOCCURRENCE("java.util.LinkedList.removeLastOccurrence(Ljava/lang/Object;)Z", true),
	LINKEDLIST_LISTITERATOR("java.util.LinkedList.listIterator(I)Ljava/util/ListIterator;", true),
	LINKEDLIST_DESCENDINGITERATOR("java.util.LinkedList.descendingIterator()Ljava/util/Iterator;", true),
	LINKEDLIST_CLONE("java.util.LinkedList.clone()Ljava/lang/Object;", true),
	LINKEDLIST_TOARRAY("java.util.LinkedList.toArray()[Ljava/lang/Object;", true),
	LINKEDLIST_TOARRAY2("java.util.LinkedList.toArray([Ljava/lang/Object;)[Ljava/lang/Object;", true),
	LINKEDLIST_SPLITERATOR("java.util.LinkedList.spliterator()Ljava/util/Spliterator;", true),
	HASHSET_INIT("java.util.HashSet.<init>()V", true),
	HASHSET_INIT2("java.util.HashSet.<init>(Ljava/util/Collection;)V", true),
	HASHSET_INIT3("java.util.HashSet.<init>(IF)V", true),
	HASHSET_INIT4("java.util.HashSet.<init>(I)V", true),
	HASHSET_INIT5("java.util.HashSet.<init>(IFZ)V", true),
	HASHSET_ITERATOR("java.util.HashSet.iterator()Ljava/util/Iterator;", true),
	HASHSET_SIZE("java.util.HashSet.size()I", true),
	HASHSET_ISEMPTY("java.util.HashSet.isEmpty()Z", true),
	HASHSET_CONTAINS("java.util.HashSet.contains(Ljava/lang/Object;)Z", true),
	HASHSET_ADD("java.util.HashSet.add(Ljava/lang/Object;)Z", true),
	HASHSET_REMOVE("java.util.HashSet.remove(Ljava/lang/Object;)Z", true),
	HASHSET_CLEAR("java.util.HashSet.clear()V", true),
	HASHSET_CLONE("java.util.HashSet.clone()Ljava/lang/Object;", true),
	HASHSET_SPLITERATOR("java.util.HashSet.spliterator()Ljava/util/Spliterator;", true),
	HASHSET_CLINIT("java.util.HashSet.<clinit>()V", true),
	TREESET_INIT("java.util.TreeSet.<init>(Ljava/util/NavigableMap;)V", true),
	TREESET_INIT2("java.util.TreeSet.<init>()V", true),
	TREESET_INIT3("java.util.TreeSet.<init>(Ljava/util/Comparator;)V", true),
	TREESET_INIT4("java.util.TreeSet.<init>(Ljava/util/Collection;)V", true),
	TREESET_INIT5("java.util.TreeSet.<init>(Ljava/util/SortedSet;)V", true),
	TREESET_ITERATOR("java.util.TreeSet.iterator()Ljava/util/Iterator;", true),
	TREESET_DESCENDINGITERATOR("java.util.TreeSet.descendingIterator()Ljava/util/Iterator;", true),
	TREESET_DESCENDINGSET("java.util.TreeSet.descendingSet()Ljava/util/NavigableSet;", true),
	TREESET_SIZE("java.util.TreeSet.size()I", true),
	TREESET_ISEMPTY("java.util.TreeSet.isEmpty()Z", true),
	TREESET_CONTAINS("java.util.TreeSet.contains(Ljava/lang/Object;)Z", true),
	TREESET_ADD("java.util.TreeSet.add(Ljava/lang/Object;)Z", true),
	TREESET_REMOVE("java.util.TreeSet.remove(Ljava/lang/Object;)Z", true),
	TREESET_CLEAR("java.util.TreeSet.clear()V", true),
	TREESET_ADDALL("java.util.TreeSet.addAll(Ljava/util/Collection;)Z", true),
	TREESET_SUBSET("java.util.TreeSet.subSet(Ljava/lang/Object;ZLjava/lang/Object;Z)Ljava/util/NavigableSet;", true),
	TREESET_HEADSET("java.util.TreeSet.headSet(Ljava/lang/Object;Z)Ljava/util/NavigableSet;", true),
	TREESET_TAILSET("java.util.TreeSet.tailSet(Ljava/lang/Object;Z)Ljava/util/NavigableSet;", true),
	TREESET_SUBSET2("java.util.TreeSet.subSet(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedSet;", true),
	TREESET_HEADSET2("java.util.TreeSet.headSet(Ljava/lang/Object;)Ljava/util/SortedSet;", true),
	TREESET_TAILSET2("java.util.TreeSet.tailSet(Ljava/lang/Object;)Ljava/util/SortedSet;", true),
	TREESET_COMPARATOR("java.util.TreeSet.comparator()Ljava/util/Comparator;", true),
	TREESET_FIRST("java.util.TreeSet.first()Ljava/lang/Object;", true),
	TREESET_LAST("java.util.TreeSet.last()Ljava/lang/Object;", true),
	TREESET_LOWER("java.util.TreeSet.lower(Ljava/lang/Object;)Ljava/lang/Object;", true),
	TREESET_FLOOR("java.util.TreeSet.floor(Ljava/lang/Object;)Ljava/lang/Object;", true),
	TREESET_CEILING("java.util.TreeSet.ceiling(Ljava/lang/Object;)Ljava/lang/Object;", true),
	TREESET_HIGHER("java.util.TreeSet.higher(Ljava/lang/Object;)Ljava/lang/Object;", true),
	TREESET_POLLFIRST("java.util.TreeSet.pollFirst()Ljava/lang/Object;", true),
	TREESET_POLLLAST("java.util.TreeSet.pollLast()Ljava/lang/Object;", true),
	TREESET_CLONE("java.util.TreeSet.clone()Ljava/lang/Object;", true),
	TREESET_SPLITERATOR("java.util.TreeSet.spliterator()Ljava/util/Spliterator;", true),
	TREESET_CLINIT("java.util.TreeSet.<clinit>()V", true),
	LINKEDHASHSET_INIT("java.util.LinkedHashSet.<init>(IF)V", true),
	LINKEDHASHSET_INIT2("java.util.LinkedHashSet.<init>(I)V", true),
	LINKEDHASHSET_INIT3("java.util.LinkedHashSet.<init>()V", true),
	LINKEDHASHSET_INIT4("java.util.LinkedHashSet.<init>(Ljava/util/Collection;)V", true),
	LINKEDHASHSET_SPLITERATOR("java.util.LinkedHashSet.spliterator()Ljava/util/Spliterator;", true),
	HASHMAP_HASH("java.util.HashMap.hash(Ljava/lang/Object;)I", true),
	HASHMAP_COMPARABLECLASSFOR("java.util.HashMap.comparableClassFor(Ljava/lang/Object;)Ljava/lang/Class;", true),
	HASHMAP_COMPARECOMPARABLES("java.util.HashMap.compareComparables(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/Object;)I", true),
	HASHMAP_TABLESIZEFOR("java.util.HashMap.tableSizeFor(I)I", true),
	HASHMAP_INIT("java.util.HashMap.<init>(IF)V", true),
	HASHMAP_INIT2("java.util.HashMap.<init>(I)V", true),
	HASHMAP_INIT3("java.util.HashMap.<init>()V", true),
	HASHMAP_INIT4("java.util.HashMap.<init>(Ljava/util/Map;)V", true),
	HASHMAP_PUTMAPENTRIES("java.util.HashMap.putMapEntries(Ljava/util/Map;Z)V", true),
	HASHMAP_SIZE("java.util.HashMap.size()I", true),
	HASHMAP_ISEMPTY("java.util.HashMap.isEmpty()Z", true),
	HASHMAP_GET("java.util.HashMap.get(Ljava/lang/Object;)Ljava/lang/Object;", true),
	HASHMAP_GETNODE("java.util.HashMap.getNode(ILjava/lang/Object;)Ljava/util/HashMap$Node;", true),
	HASHMAP_CONTAINSKEY("java.util.HashMap.containsKey(Ljava/lang/Object;)Z", true),
	HASHMAP_PUT("java.util.HashMap.put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", true),
	HASHMAP_PUTVAL("java.util.HashMap.putVal(ILjava/lang/Object;Ljava/lang/Object;ZZ)Ljava/lang/Object;", true),
	HASHMAP_RESIZE("java.util.HashMap.resize()[Ljava/util/HashMap$Node;", true),
	HASHMAP_TREEIFYBIN("java.util.HashMap.treeifyBin([Ljava/util/HashMap$Node;I)V", true),
	HASHMAP_PUTALL("java.util.HashMap.putAll(Ljava/util/Map;)V", true),
	HASHMAP_REMOVE("java.util.HashMap.remove(Ljava/lang/Object;)Ljava/lang/Object;", true),
	HASHMAP_REMOVENODE("java.util.HashMap.removeNode(ILjava/lang/Object;Ljava/lang/Object;ZZ)Ljava/util/HashMap$Node;", true),
	HASHMAP_CLEAR("java.util.HashMap.clear()V", true),
	HASHMAP_CONTAINSVALUE("java.util.HashMap.containsValue(Ljava/lang/Object;)Z", true),
	HASHMAP_KEYSET("java.util.HashMap.keySet()Ljava/util/Set;", true),
	HASHMAP_VALUES("java.util.HashMap.values()Ljava/util/Collection;", true),
	HASHMAP_ENTRYSET("java.util.HashMap.entrySet()Ljava/util/Set;", true),
	HASHMAP_GETORDEFAULT("java.util.HashMap.getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", true),
	HASHMAP_PUTIFABSENT("java.util.HashMap.putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", true),
	HASHMAP_REMOVE2("java.util.HashMap.remove(Ljava/lang/Object;Ljava/lang/Object;)Z", true),
	HASHMAP_REPLACE("java.util.HashMap.replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z", true),
	HASHMAP_REPLACE2("java.util.HashMap.replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", true),
	HASHMAP_COMPUTEIFABSENT("java.util.HashMap.computeIfAbsent(Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;", true),
	HASHMAP_COMPUTEIFPRESENT("java.util.HashMap.computeIfPresent(Ljava/lang/Object;Ljava/util/function/BiFunction;)Ljava/lang/Object;", true),
	HASHMAP_COMPUTE("java.util.HashMap.compute(Ljava/lang/Object;Ljava/util/function/BiFunction;)Ljava/lang/Object;", true),
	HASHMAP_MERGE("java.util.HashMap.merge(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/function/BiFunction;)Ljava/lang/Object;", true),
	HASHMAP_FOREACH("java.util.HashMap.forEach(Ljava/util/function/BiConsumer;)V", true),
	HASHMAP_REPLACEALL("java.util.HashMap.replaceAll(Ljava/util/function/BiFunction;)V", true),
	HASHMAP_CLONE("java.util.HashMap.clone()Ljava/lang/Object;", true),
	HASHMAP_LOADFACTOR("java.util.HashMap.loadFactor()F", true),
	HASHMAP_CAPACITY("java.util.HashMap.capacity()I", true),
	HASHMAP_NEWNODE("java.util.HashMap.newNode(ILjava/lang/Object;Ljava/lang/Object;Ljava/util/HashMap$Node;)Ljava/util/HashMap$Node;", true),
	HASHMAP_REPLACEMENTNODE("java.util.HashMap.replacementNode(Ljava/util/HashMap$Node;Ljava/util/HashMap$Node;)Ljava/util/HashMap$Node;", true),
	HASHMAP_NEWTREENODE("java.util.HashMap.newTreeNode(ILjava/lang/Object;Ljava/lang/Object;Ljava/util/HashMap$Node;)Ljava/util/HashMap$TreeNode;", true),
	HASHMAP_REPLACEMENTTREENODE("java.util.HashMap.replacementTreeNode(Ljava/util/HashMap$Node;Ljava/util/HashMap$Node;)Ljava/util/HashMap$TreeNode;", true),
	HASHMAP_REINITIALIZE("java.util.HashMap.reinitialize()V", true),
	HASHMAP_AFTERNODEACCESS("java.util.HashMap.afterNodeAccess(Ljava/util/HashMap$Node;)V", true),
	HASHMAP_AFTERNODEINSERTION("java.util.HashMap.afterNodeInsertion(Z)V", true),
	HASHMAP_AFTERNODEREMOVAL("java.util.HashMap.afterNodeRemoval(Ljava/util/HashMap$Node;)V", true),
	HASHMAP_INTERNALWRITEENTRIES("java.util.HashMap.internalWriteEntries(Ljava/io/ObjectOutputStream;)V", true),
	TREEMAP_INIT("java.util.TreeMap.<init>()V", true),
	TREEMAP_INIT2("java.util.TreeMap.<init>(Ljava/util/Comparator;)V", true),
	TREEMAP_INIT3("java.util.TreeMap.<init>(Ljava/util/Map;)V", true),
	TREEMAP_INIT4("java.util.TreeMap.<init>(Ljava/util/SortedMap;)V", true),
	TREEMAP_SIZE("java.util.TreeMap.size()I", true),
	TREEMAP_CONTAINSKEY("java.util.TreeMap.containsKey(Ljava/lang/Object;)Z", true),
	TREEMAP_CONTAINSVALUE("java.util.TreeMap.containsValue(Ljava/lang/Object;)Z", true),
	TREEMAP_GET("java.util.TreeMap.get(Ljava/lang/Object;)Ljava/lang/Object;", true),
	TREEMAP_COMPARATOR("java.util.TreeMap.comparator()Ljava/util/Comparator;", true),
	TREEMAP_FIRSTKEY("java.util.TreeMap.firstKey()Ljava/lang/Object;", true),
	TREEMAP_LASTKEY("java.util.TreeMap.lastKey()Ljava/lang/Object;", true),
	TREEMAP_PUTALL("java.util.TreeMap.putAll(Ljava/util/Map;)V", true),
	TREEMAP_GETENTRY("java.util.TreeMap.getEntry(Ljava/lang/Object;)Ljava/util/TreeMap$Entry;", true),
	TREEMAP_GETENTRYUSINGCOMPARATOR("java.util.TreeMap.getEntryUsingComparator(Ljava/lang/Object;)Ljava/util/TreeMap$Entry;", true),
	TREEMAP_GETCEILINGENTRY("java.util.TreeMap.getCeilingEntry(Ljava/lang/Object;)Ljava/util/TreeMap$Entry;", true),
	TREEMAP_GETFLOORENTRY("java.util.TreeMap.getFloorEntry(Ljava/lang/Object;)Ljava/util/TreeMap$Entry;", true),
	TREEMAP_GETHIGHERENTRY("java.util.TreeMap.getHigherEntry(Ljava/lang/Object;)Ljava/util/TreeMap$Entry;", true),
	TREEMAP_GETLOWERENTRY("java.util.TreeMap.getLowerEntry(Ljava/lang/Object;)Ljava/util/TreeMap$Entry;", true),
	TREEMAP_PUT("java.util.TreeMap.put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", true),
	TREEMAP_REMOVE("java.util.TreeMap.remove(Ljava/lang/Object;)Ljava/lang/Object;", true),
	TREEMAP_CLEAR("java.util.TreeMap.clear()V", true),
	TREEMAP_CLONE("java.util.TreeMap.clone()Ljava/lang/Object;", true),
	TREEMAP_FIRSTENTRY("java.util.TreeMap.firstEntry()Ljava/util/Map$Entry;", true),
	TREEMAP_LASTENTRY("java.util.TreeMap.lastEntry()Ljava/util/Map$Entry;", true),
	TREEMAP_POLLFIRSTENTRY("java.util.TreeMap.pollFirstEntry()Ljava/util/Map$Entry;", true),
	TREEMAP_POLLLASTENTRY("java.util.TreeMap.pollLastEntry()Ljava/util/Map$Entry;", true),
	TREEMAP_LOWERENTRY("java.util.TreeMap.lowerEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;", true),
	TREEMAP_LOWERKEY("java.util.TreeMap.lowerKey(Ljava/lang/Object;)Ljava/lang/Object;", true),
	TREEMAP_FLOORENTRY("java.util.TreeMap.floorEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;", true),
	TREEMAP_FLOORKEY("java.util.TreeMap.floorKey(Ljava/lang/Object;)Ljava/lang/Object;", true),
	TREEMAP_CEILINGENTRY("java.util.TreeMap.ceilingEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;", true),
	TREEMAP_CEILINGKEY("java.util.TreeMap.ceilingKey(Ljava/lang/Object;)Ljava/lang/Object;", true),
	TREEMAP_HIGHERENTRY("java.util.TreeMap.higherEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;", true),
	TREEMAP_HIGHERKEY("java.util.TreeMap.higherKey(Ljava/lang/Object;)Ljava/lang/Object;", true),
	TREEMAP_KEYSET("java.util.TreeMap.keySet()Ljava/util/Set;", true),
	TREEMAP_NAVIGABLEKEYSET("java.util.TreeMap.navigableKeySet()Ljava/util/NavigableSet;", true),
	TREEMAP_DESCENDINGKEYSET("java.util.TreeMap.descendingKeySet()Ljava/util/NavigableSet;", true),
	TREEMAP_VALUES("java.util.TreeMap.values()Ljava/util/Collection;", true),
	TREEMAP_ENTRYSET("java.util.TreeMap.entrySet()Ljava/util/Set;", true),
	TREEMAP_DESCENDINGMAP("java.util.TreeMap.descendingMap()Ljava/util/NavigableMap;", true),
	TREEMAP_SUBMAP("java.util.TreeMap.subMap(Ljava/lang/Object;ZLjava/lang/Object;Z)Ljava/util/NavigableMap;", true),
	TREEMAP_HEADMAP("java.util.TreeMap.headMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;", true),
	TREEMAP_TAILMAP("java.util.TreeMap.tailMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;", true),
	TREEMAP_SUBMAP2("java.util.TreeMap.subMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedMap;", true),
	TREEMAP_HEADMAP2("java.util.TreeMap.headMap(Ljava/lang/Object;)Ljava/util/SortedMap;", true),
	TREEMAP_TAILMAP2("java.util.TreeMap.tailMap(Ljava/lang/Object;)Ljava/util/SortedMap;", true),
	TREEMAP_REPLACE("java.util.TreeMap.replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z", true),
	TREEMAP_REPLACE2("java.util.TreeMap.replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", true),
	TREEMAP_FOREACH("java.util.TreeMap.forEach(Ljava/util/function/BiConsumer;)V", true),
	TREEMAP_REPLACEALL("java.util.TreeMap.replaceAll(Ljava/util/function/BiFunction;)V", true),
	TREEMAP_KEYITERATOR("java.util.TreeMap.keyIterator()Ljava/util/Iterator;", true),
	TREEMAP_DESCENDINGKEYITERATOR("java.util.TreeMap.descendingKeyIterator()Ljava/util/Iterator;", true),
	TREEMAP_COMPARE("java.util.TreeMap.compare(Ljava/lang/Object;Ljava/lang/Object;)I", true),
	TREEMAP_VALEQUALS("java.util.TreeMap.valEquals(Ljava/lang/Object;Ljava/lang/Object;)Z", true),
	TREEMAP_EXPORTENTRY("java.util.TreeMap.exportEntry(Ljava/util/TreeMap$Entry;)Ljava/util/Map$Entry;", true),
	TREEMAP_KEYORNULL("java.util.TreeMap.keyOrNull(Ljava/util/TreeMap$Entry;)Ljava/lang/Object;", true),
	TREEMAP_KEY("java.util.TreeMap.key(Ljava/util/TreeMap$Entry;)Ljava/lang/Object;", true),
	TREEMAP_GETFIRSTENTRY("java.util.TreeMap.getFirstEntry()Ljava/util/TreeMap$Entry;", true),
	TREEMAP_GETLASTENTRY("java.util.TreeMap.getLastEntry()Ljava/util/TreeMap$Entry;", true),
	TREEMAP_SUCCESSOR("java.util.TreeMap.successor(Ljava/util/TreeMap$Entry;)Ljava/util/TreeMap$Entry;", true),
	TREEMAP_PREDECESSOR("java.util.TreeMap.predecessor(Ljava/util/TreeMap$Entry;)Ljava/util/TreeMap$Entry;", true),
	TREEMAP_COLOROF("java.util.TreeMap.colorOf(Ljava/util/TreeMap$Entry;)Z", true),
	TREEMAP_PARENTOF("java.util.TreeMap.parentOf(Ljava/util/TreeMap$Entry;)Ljava/util/TreeMap$Entry;", true),
	TREEMAP_SETCOLOR("java.util.TreeMap.setColor(Ljava/util/TreeMap$Entry;Z)V", true),
	TREEMAP_LEFTOF("java.util.TreeMap.leftOf(Ljava/util/TreeMap$Entry;)Ljava/util/TreeMap$Entry;", true),
	TREEMAP_RIGHTOF("java.util.TreeMap.rightOf(Ljava/util/TreeMap$Entry;)Ljava/util/TreeMap$Entry;", true),
	TREEMAP_READTREESET("java.util.TreeMap.readTreeSet(ILjava/io/ObjectInputStream;Ljava/lang/Object;)V", true),
	TREEMAP_ADDALLFORTREESET("java.util.TreeMap.addAllForTreeSet(Ljava/util/SortedSet;Ljava/lang/Object;)V", true),
	TREEMAP_BUILDFROMSORTED("java.util.TreeMap.buildFromSorted(IIIILjava/util/Iterator;Ljava/io/ObjectInputStream;Ljava/lang/Object;)Ljava/util/TreeMap$Entry;", true),
	TREEMAP_COMPUTEREDLEVEL("java.util.TreeMap.computeRedLevel(I)I", true),
	TREEMAP_KEYSPLITERATORFOR("java.util.TreeMap.keySpliteratorFor(Ljava/util/NavigableMap;)Ljava/util/Spliterator;", true),
	TREEMAP_KEYSPLITERATOR("java.util.TreeMap.keySpliterator()Ljava/util/Spliterator;", true),
	TREEMAP_DESCENDINGKEYSPLITERATOR("java.util.TreeMap.descendingKeySpliterator()Ljava/util/Spliterator;", true),
	TREEMAP_ACCESS$000("java.util.TreeMap.access$000(Ljava/util/TreeMap;Ljava/util/TreeMap$Entry;)V", true),
	TREEMAP_ACCESS$100("java.util.TreeMap.access$100(Ljava/util/TreeMap;)I", true),
	TREEMAP_ACCESS$200("java.util.TreeMap.access$200()Ljava/lang/Object;", true),
	TREEMAP_ACCESS$300("java.util.TreeMap.access$300(Ljava/util/TreeMap;)Ljava/util/Comparator;", true),
	TREEMAP_ACCESS$400("java.util.TreeMap.access$400(Ljava/util/TreeMap;)I", true),
	TREEMAP_ACCESS$500("java.util.TreeMap.access$500(Ljava/util/TreeMap;)Ljava/util/TreeMap$Entry;", true),
	TREEMAP_CLINIT("java.util.TreeMap.<clinit>()V", true),
	LINKEDHASHMAP_REINITIALIZE("java.util.LinkedHashMap.reinitialize()V", true),
	LINKEDHASHMAP_NEWNODE("java.util.LinkedHashMap.newNode(ILjava/lang/Object;Ljava/lang/Object;Ljava/util/HashMap$Node;)Ljava/util/HashMap$Node;", true),
	LINKEDHASHMAP_REPLACEMENTNODE("java.util.LinkedHashMap.replacementNode(Ljava/util/HashMap$Node;Ljava/util/HashMap$Node;)Ljava/util/HashMap$Node;", true),
	LINKEDHASHMAP_NEWTREENODE("java.util.LinkedHashMap.newTreeNode(ILjava/lang/Object;Ljava/lang/Object;Ljava/util/HashMap$Node;)Ljava/util/HashMap$TreeNode;", true),
	LINKEDHASHMAP_REPLACEMENTTREENODE("java.util.LinkedHashMap.replacementTreeNode(Ljava/util/HashMap$Node;Ljava/util/HashMap$Node;)Ljava/util/HashMap$TreeNode;", true),
	LINKEDHASHMAP_AFTERNODEREMOVAL("java.util.LinkedHashMap.afterNodeRemoval(Ljava/util/HashMap$Node;)V", true),
	LINKEDHASHMAP_AFTERNODEINSERTION("java.util.LinkedHashMap.afterNodeInsertion(Z)V", true),
	LINKEDHASHMAP_AFTERNODEACCESS("java.util.LinkedHashMap.afterNodeAccess(Ljava/util/HashMap$Node;)V", true),
	LINKEDHASHMAP_INTERNALWRITEENTRIES("java.util.LinkedHashMap.internalWriteEntries(Ljava/io/ObjectOutputStream;)V", true),
	LINKEDHASHMAP_INIT("java.util.LinkedHashMap.<init>(IF)V", true),
	LINKEDHASHMAP_INIT2("java.util.LinkedHashMap.<init>(I)V", true),
	LINKEDHASHMAP_INIT3("java.util.LinkedHashMap.<init>()V", true),
	LINKEDHASHMAP_INIT4("java.util.LinkedHashMap.<init>(Ljava/util/Map;)V", true),
	LINKEDHASHMAP_INIT5("java.util.LinkedHashMap.<init>(IFZ)V", true),
	LINKEDHASHMAP_CONTAINSVALUE("java.util.LinkedHashMap.containsValue(Ljava/lang/Object;)Z", true),
	LINKEDHASHMAP_GET("java.util.LinkedHashMap.get(Ljava/lang/Object;)Ljava/lang/Object;", true),
	LINKEDHASHMAP_GETORDEFAULT("java.util.LinkedHashMap.getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", true),
	LINKEDHASHMAP_CLEAR("java.util.LinkedHashMap.clear()V", true),
	LINKEDHASHMAP_REMOVEELDESTENTRY("java.util.LinkedHashMap.removeEldestEntry(Ljava/util/Map$Entry;)Z", true),
	LINKEDHASHMAP_KEYSET("java.util.LinkedHashMap.keySet()Ljava/util/Set;", true),
	LINKEDHASHMAP_VALUES("java.util.LinkedHashMap.values()Ljava/util/Collection;", true),
	LINKEDHASHMAP_ENTRYSET("java.util.LinkedHashMap.entrySet()Ljava/util/Set;", true),
	LINKEDHASHMAP_FOREACH("java.util.LinkedHashMap.forEach(Ljava/util/function/BiConsumer;)V", true),
	LINKEDHASHMAP_REPLACEALL("java.util.LinkedHashMap.replaceAll(Ljava/util/function/BiFunction;)V", true),
	ITERATOR_HASNEXT("java.util.Iterator.hasNext()Z", true),
	ITERATOR_NEXT("java.util.Iterator.next()Ljava/lang/Object;", true),
	ITERATOR_REMOVE("java.util.Iterator.remove()V", true),
	ITERATOR_FOREACHREMAINING("java.util.Iterator.forEachRemaining(Ljava/util/function/Consumer;)V", true),
	LISTITERATOR_HASNEXT("java.util.ListIterator.hasNext()Z", true),
	LISTITERATOR_NEXT("java.util.ListIterator.next()Ljava/lang/Object;", true),
	LISTITERATOR_HASPREVIOUS("java.util.ListIterator.hasPrevious()Z", true),
	LISTITERATOR_PREVIOUS("java.util.ListIterator.previous()Ljava/lang/Object;", true),
	LISTITERATOR_NEXTINDEX("java.util.ListIterator.nextIndex()I", true),
	LISTITERATOR_PREVIOUSINDEX("java.util.ListIterator.previousIndex()I", true),
	LISTITERATOR_REMOVE("java.util.ListIterator.remove()V", true),
	LISTITERATOR_SET("java.util.ListIterator.set(Ljava/lang/Object;)V", true),
	LISTITERATOR_ADD("java.util.ListIterator.add(Ljava/lang/Object;)V", true),
	INTEGER_VALUEOF("java.lang.Integer.valueOf(I)Ljava/lang/Integer;", true),
	INTEGER_INTVALUE("java.lang.Integer.intValue()I", true);
	
	private final boolean isPure;
	private final String str;

	private CollectionOperation(String str, boolean isPure) {
		this.str = str;
		this.isPure = isPure;
	}
	
	public boolean isPure() {
		return isPure;
	}
	
	public String getSignature() {
		return str;
	}
}