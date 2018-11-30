package edu.nju.seg.symbc;

public enum LibraryOperation {
	// java.util
	COLLECTION_SIZE("java.util.Collection.size()I"),
	COLLECTION_ISEMPTY("java.util.Collection.isEmpty()Z"),
	COLLECTION_CONTAINS("java.util.Collection.contains(Ljava/lang/Object;)Z"),
	COLLECTION_ITERATOR("java.util.Collection.iterator()Ljava/util/Iterator;"),
	COLLECTION_TOARRAY("java.util.Collection.toArray()[Ljava/lang/Object;"),
	COLLECTION_TOARRAY2("java.util.Collection.toArray([Ljava/lang/Object;)[Ljava/lang/Object;"),
	COLLECTION_ADD("java.util.Collection.add(Ljava/lang/Object;)Z"),
	COLLECTION_REMOVE("java.util.Collection.remove(Ljava/lang/Object;)Z"),
	COLLECTION_CONTAINSALL("java.util.Collection.containsAll(Ljava/util/Collection;)Z"),
	COLLECTION_ADDALL("java.util.Collection.addAll(Ljava/util/Collection;)Z"),
	COLLECTION_REMOVEALL("java.util.Collection.removeAll(Ljava/util/Collection;)Z"),
	COLLECTION_REMOVEIF("java.util.Collection.removeIf(Ljava/util/function/Predicate;)Z"),
	COLLECTION_RETAINALL("java.util.Collection.retainAll(Ljava/util/Collection;)Z"),
	COLLECTION_CLEAR("java.util.Collection.clear()V"),
	COLLECTION_EQUALS("java.util.Collection.equals(Ljava/lang/Object;)Z"),
	COLLECTION_HASHCODE("java.util.Collection.hashCode()I"),
	COLLECTION_SPLITERATOR("java.util.Collection.spliterator()Ljava/util/Spliterator;"),
	COLLECTION_STREAM("java.util.Collection.stream()Ljava/util/stream/Stream;"),
	COLLECTION_PARALLELSTREAM("java.util.Collection.parallelStream()Ljava/util/stream/Stream;"),
	LIST_SIZE("java.util.List.size()I"),
	LIST_ISEMPTY("java.util.List.isEmpty()Z"),
	LIST_CONTAINS("java.util.List.contains(Ljava/lang/Object;)Z"),
	LIST_ITERATOR("java.util.List.iterator()Ljava/util/Iterator;"),
	LIST_TOARRAY("java.util.List.toArray()[Ljava/lang/Object;"),
	LIST_TOARRAY2("java.util.List.toArray([Ljava/lang/Object;)[Ljava/lang/Object;"),
	LIST_ADD("java.util.List.add(Ljava/lang/Object;)Z"),
	LIST_REMOVE("java.util.List.remove(Ljava/lang/Object;)Z"),
	LIST_CONTAINSALL("java.util.List.containsAll(Ljava/util/Collection;)Z"),
	LIST_ADDALL("java.util.List.addAll(Ljava/util/Collection;)Z"),
	LIST_ADDALL2("java.util.List.addAll(ILjava/util/Collection;)Z"),
	LIST_REMOVEALL("java.util.List.removeAll(Ljava/util/Collection;)Z"),
	LIST_RETAINALL("java.util.List.retainAll(Ljava/util/Collection;)Z"),
	LIST_REPLACEALL("java.util.List.replaceAll(Ljava/util/function/UnaryOperator;)V"),
	LIST_SORT("java.util.List.sort(Ljava/util/Comparator;)V"),
	LIST_CLEAR("java.util.List.clear()V"),
	LIST_EQUALS("java.util.List.equals(Ljava/lang/Object;)Z"),
	LIST_HASHCODE("java.util.List.hashCode()I"),
	LIST_GET("java.util.List.get(I)Ljava/lang/Object;"),
	LIST_SET("java.util.List.set(ILjava/lang/Object;)Ljava/lang/Object;"),
	LIST_ADD2("java.util.List.add(ILjava/lang/Object;)V"),
	LIST_REMOVE2("java.util.List.remove(I)Ljava/lang/Object;"),
	LIST_INDEXOF("java.util.List.indexOf(Ljava/lang/Object;)I"),
	LIST_LASTINDEXOF("java.util.List.lastIndexOf(Ljava/lang/Object;)I"),
	LIST_LISTITERATOR("java.util.List.listIterator()Ljava/util/ListIterator;"),
	LIST_LISTITERATOR2("java.util.List.listIterator(I)Ljava/util/ListIterator;"),
	LIST_SUBLIST("java.util.List.subList(II)Ljava/util/List;"),
	LIST_SPLITERATOR("java.util.List.spliterator()Ljava/util/Spliterator;"),
	SET_SIZE("java.util.Set.size()I"),
	SET_ISEMPTY("java.util.Set.isEmpty()Z"),
	SET_CONTAINS("java.util.Set.contains(Ljava/lang/Object;)Z"),
	SET_ITERATOR("java.util.Set.iterator()Ljava/util/Iterator;"),
	SET_TOARRAY("java.util.Set.toArray()[Ljava/lang/Object;"),
	SET_TOARRAY2("java.util.Set.toArray([Ljava/lang/Object;)[Ljava/lang/Object;"),
	SET_ADD("java.util.Set.add(Ljava/lang/Object;)Z"),
	SET_REMOVE("java.util.Set.remove(Ljava/lang/Object;)Z"),
	SET_CONTAINSALL("java.util.Set.containsAll(Ljava/util/Collection;)Z"),
	SET_ADDALL("java.util.Set.addAll(Ljava/util/Collection;)Z"),
	SET_RETAINALL("java.util.Set.retainAll(Ljava/util/Collection;)Z"),
	SET_REMOVEALL("java.util.Set.removeAll(Ljava/util/Collection;)Z"),
	SET_CLEAR("java.util.Set.clear()V"),
	SET_EQUALS("java.util.Set.equals(Ljava/lang/Object;)Z"),
	SET_HASHCODE("java.util.Set.hashCode()I"),
	SET_SPLITERATOR("java.util.Set.spliterator()Ljava/util/Spliterator;"),
	MAP_SIZE("java.util.Map.size()I"),
	MAP_ISEMPTY("java.util.Map.isEmpty()Z"),
	MAP_CONTAINSKEY("java.util.Map.containsKey(Ljava/lang/Object;)Z"),
	MAP_CONTAINSVALUE("java.util.Map.containsValue(Ljava/lang/Object;)Z"),
	MAP_GET("java.util.Map.get(Ljava/lang/Object;)Ljava/lang/Object;"),
	MAP_PUT("java.util.Map.put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"),
	MAP_REMOVE("java.util.Map.remove(Ljava/lang/Object;)Ljava/lang/Object;"),
	MAP_PUTALL("java.util.Map.putAll(Ljava/util/Map;)V"),
	MAP_CLEAR("java.util.Map.clear()V"),
	MAP_KEYSET("java.util.Map.keySet()Ljava/util/Set;"),
	MAP_VALUES("java.util.Map.values()Ljava/util/Collection;"),
	MAP_ENTRYSET("java.util.Map.entrySet()Ljava/util/Set;"),
	MAP_EQUALS("java.util.Map.equals(Ljava/lang/Object;)Z"),
	MAP_HASHCODE("java.util.Map.hashCode()I"),
	MAP_GETORDEFAULT("java.util.Map.getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"),
	MAP_FOREACH("java.util.Map.forEach(Ljava/util/function/BiConsumer;)V"),
	MAP_REPLACEALL("java.util.Map.replaceAll(Ljava/util/function/BiFunction;)V"),
	MAP_PUTIFABSENT("java.util.Map.putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"),
	MAP_REMOVE2("java.util.Map.remove(Ljava/lang/Object;Ljava/lang/Object;)Z"),
	MAP_REPLACE("java.util.Map.replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z"),
	MAP_REPLACE2("java.util.Map.replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"),
	MAP_COMPUTEIFABSENT("java.util.Map.computeIfAbsent(Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;"),
	MAP_COMPUTEIFPRESENT("java.util.Map.computeIfPresent(Ljava/lang/Object;Ljava/util/function/BiFunction;)Ljava/lang/Object;"),
	MAP_COMPUTE("java.util.Map.compute(Ljava/lang/Object;Ljava/util/function/BiFunction;)Ljava/lang/Object;"),
	MAP_MERGE("java.util.Map.merge(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/function/BiFunction;)Ljava/lang/Object;"),
	ARRAYLIST_INIT("java.util.ArrayList.<init>(I)V"),
	ARRAYLIST_INIT2("java.util.ArrayList.<init>()V"),
	ARRAYLIST_INIT3("java.util.ArrayList.<init>(Ljava/util/Collection;)V"),
	ARRAYLIST_TRIMTOSIZE("java.util.ArrayList.trimToSize()V"),
	ARRAYLIST_ENSURECAPACITY("java.util.ArrayList.ensureCapacity(I)V"),
	ARRAYLIST_SIZE("java.util.ArrayList.size()I"),
	ARRAYLIST_ISEMPTY("java.util.ArrayList.isEmpty()Z"),
	ARRAYLIST_CONTAINS("java.util.ArrayList.contains(Ljava/lang/Object;)Z"),
	ARRAYLIST_INDEXOF("java.util.ArrayList.indexOf(Ljava/lang/Object;)I"),
	ARRAYLIST_LASTINDEXOF("java.util.ArrayList.lastIndexOf(Ljava/lang/Object;)I"),
	ARRAYLIST_CLONE("java.util.ArrayList.clone()Ljava/lang/Object;"),
	ARRAYLIST_TOARRAY("java.util.ArrayList.toArray()[Ljava/lang/Object;"),
	ARRAYLIST_TOARRAY2("java.util.ArrayList.toArray([Ljava/lang/Object;)[Ljava/lang/Object;"),
	ARRAYLIST_GET("java.util.ArrayList.get(I)Ljava/lang/Object;"),
	ARRAYLIST_SET("java.util.ArrayList.set(ILjava/lang/Object;)Ljava/lang/Object;"),
	ARRAYLIST_ADD("java.util.ArrayList.add(Ljava/lang/Object;)Z"),
	ARRAYLIST_ADD2("java.util.ArrayList.add(ILjava/lang/Object;)V"),
	ARRAYLIST_REMOVE("java.util.ArrayList.remove(I)Ljava/lang/Object;"),
	ARRAYLIST_REMOVE2("java.util.ArrayList.remove(Ljava/lang/Object;)Z"),
	ARRAYLIST_CLEAR("java.util.ArrayList.clear()V"),
	ARRAYLIST_ADDALL("java.util.ArrayList.addAll(Ljava/util/Collection;)Z"),
	ARRAYLIST_ADDALL2("java.util.ArrayList.addAll(ILjava/util/Collection;)Z"),
	ARRAYLIST_REMOVERANGE("java.util.ArrayList.removeRange(II)V"),
	ARRAYLIST_REMOVEALL("java.util.ArrayList.removeAll(Ljava/util/Collection;)Z"),
	ARRAYLIST_RETAINALL("java.util.ArrayList.retainAll(Ljava/util/Collection;)Z"),
	ARRAYLIST_LISTITERATOR("java.util.ArrayList.listIterator(I)Ljava/util/ListIterator;"),
	ARRAYLIST_LISTITERATOR2("java.util.ArrayList.listIterator()Ljava/util/ListIterator;"),
	ARRAYLIST_ITERATOR("java.util.ArrayList.iterator()Ljava/util/Iterator;"),
	ARRAYLIST_SUBLIST("java.util.ArrayList.subList(II)Ljava/util/List;"),
	ARRAYLIST_FOREACH("java.util.ArrayList.forEach(Ljava/util/function/Consumer;)V"),
	ARRAYLIST_SPLITERATOR("java.util.ArrayList.spliterator()Ljava/util/Spliterator;"),
	ARRAYLIST_REMOVEIF("java.util.ArrayList.removeIf(Ljava/util/function/Predicate;)Z"),
	ARRAYLIST_REPLACEALL("java.util.ArrayList.replaceAll(Ljava/util/function/UnaryOperator;)V"),
	ARRAYLIST_SORT("java.util.ArrayList.sort(Ljava/util/Comparator;)V"),
	LINKEDLIST_INIT("java.util.LinkedList.<init>()V"),
	LINKEDLIST_INIT2("java.util.LinkedList.<init>(Ljava/util/Collection;)V"),
	LINKEDLIST_GETFIRST("java.util.LinkedList.getFirst()Ljava/lang/Object;"),
	LINKEDLIST_GETLAST("java.util.LinkedList.getLast()Ljava/lang/Object;"),
	LINKEDLIST_REMOVEFIRST("java.util.LinkedList.removeFirst()Ljava/lang/Object;"),
	LINKEDLIST_REMOVELAST("java.util.LinkedList.removeLast()Ljava/lang/Object;"),
	LINKEDLIST_ADDFIRST("java.util.LinkedList.addFirst(Ljava/lang/Object;)V"),
	LINKEDLIST_ADDLAST("java.util.LinkedList.addLast(Ljava/lang/Object;)V"),
	LINKEDLIST_CONTAINS("java.util.LinkedList.contains(Ljava/lang/Object;)Z"),
	LINKEDLIST_SIZE("java.util.LinkedList.size()I"),
	LINKEDLIST_ADD("java.util.LinkedList.add(Ljava/lang/Object;)Z"),
	LINKEDLIST_REMOVE("java.util.LinkedList.remove(Ljava/lang/Object;)Z"),
	LINKEDLIST_ADDALL("java.util.LinkedList.addAll(Ljava/util/Collection;)Z"),
	LINKEDLIST_ADDALL2("java.util.LinkedList.addAll(ILjava/util/Collection;)Z"),
	LINKEDLIST_CLEAR("java.util.LinkedList.clear()V"),
	LINKEDLIST_GET("java.util.LinkedList.get(I)Ljava/lang/Object;"),
	LINKEDLIST_SET("java.util.LinkedList.set(ILjava/lang/Object;)Ljava/lang/Object;"),
	LINKEDLIST_ADD2("java.util.LinkedList.add(ILjava/lang/Object;)V"),
	LINKEDLIST_REMOVE2("java.util.LinkedList.remove(I)Ljava/lang/Object;"),
	LINKEDLIST_INDEXOF("java.util.LinkedList.indexOf(Ljava/lang/Object;)I"),
	LINKEDLIST_LASTINDEXOF("java.util.LinkedList.lastIndexOf(Ljava/lang/Object;)I"),
	LINKEDLIST_PEEK("java.util.LinkedList.peek()Ljava/lang/Object;"),
	LINKEDLIST_ELEMENT("java.util.LinkedList.element()Ljava/lang/Object;"),
	LINKEDLIST_POLL("java.util.LinkedList.poll()Ljava/lang/Object;"),
	LINKEDLIST_REMOVE3("java.util.LinkedList.remove()Ljava/lang/Object;"),
	LINKEDLIST_OFFER("java.util.LinkedList.offer(Ljava/lang/Object;)Z"),
	LINKEDLIST_OFFERFIRST("java.util.LinkedList.offerFirst(Ljava/lang/Object;)Z"),
	LINKEDLIST_OFFERLAST("java.util.LinkedList.offerLast(Ljava/lang/Object;)Z"),
	LINKEDLIST_PEEKFIRST("java.util.LinkedList.peekFirst()Ljava/lang/Object;"),
	LINKEDLIST_PEEKLAST("java.util.LinkedList.peekLast()Ljava/lang/Object;"),
	LINKEDLIST_POLLFIRST("java.util.LinkedList.pollFirst()Ljava/lang/Object;"),
	LINKEDLIST_POLLLAST("java.util.LinkedList.pollLast()Ljava/lang/Object;"),
	LINKEDLIST_PUSH("java.util.LinkedList.push(Ljava/lang/Object;)V"),
	LINKEDLIST_POP("java.util.LinkedList.pop()Ljava/lang/Object;"),
	LINKEDLIST_REMOVEFIRSTOCCURRENCE("java.util.LinkedList.removeFirstOccurrence(Ljava/lang/Object;)Z"),
	LINKEDLIST_REMOVELASTOCCURRENCE("java.util.LinkedList.removeLastOccurrence(Ljava/lang/Object;)Z"),
	LINKEDLIST_LISTITERATOR("java.util.LinkedList.listIterator(I)Ljava/util/ListIterator;"),
	LINKEDLIST_DESCENDINGITERATOR("java.util.LinkedList.descendingIterator()Ljava/util/Iterator;"),
	LINKEDLIST_CLONE("java.util.LinkedList.clone()Ljava/lang/Object;"),
	LINKEDLIST_TOARRAY("java.util.LinkedList.toArray()[Ljava/lang/Object;"),
	LINKEDLIST_TOARRAY2("java.util.LinkedList.toArray([Ljava/lang/Object;)[Ljava/lang/Object;"),
	LINKEDLIST_SPLITERATOR("java.util.LinkedList.spliterator()Ljava/util/Spliterator;"),
	HASHSET_INIT("java.util.HashSet.<init>()V"),
	HASHSET_INIT2("java.util.HashSet.<init>(Ljava/util/Collection;)V"),
	HASHSET_INIT3("java.util.HashSet.<init>(IF)V"),
	HASHSET_INIT4("java.util.HashSet.<init>(I)V"),
	HASHSET_ITERATOR("java.util.HashSet.iterator()Ljava/util/Iterator;"),
	HASHSET_SIZE("java.util.HashSet.size()I"),
	HASHSET_ISEMPTY("java.util.HashSet.isEmpty()Z"),
	HASHSET_CONTAINS("java.util.HashSet.contains(Ljava/lang/Object;)Z"),
	HASHSET_ADD("java.util.HashSet.add(Ljava/lang/Object;)Z"),
	HASHSET_REMOVE("java.util.HashSet.remove(Ljava/lang/Object;)Z"),
	HASHSET_CLEAR("java.util.HashSet.clear()V"),
	HASHSET_CLONE("java.util.HashSet.clone()Ljava/lang/Object;"),
	HASHSET_SPLITERATOR("java.util.HashSet.spliterator()Ljava/util/Spliterator;"),
	TREESET_INIT("java.util.TreeSet.<init>(Ljava/util/NavigableMap;)V"),
	TREESET_INIT2("java.util.TreeSet.<init>()V"),
	TREESET_INIT3("java.util.TreeSet.<init>(Ljava/util/Comparator;)V"),
	TREESET_INIT4("java.util.TreeSet.<init>(Ljava/util/Collection;)V"),
	TREESET_INIT5("java.util.TreeSet.<init>(Ljava/util/SortedSet;)V"),
	TREESET_ITERATOR("java.util.TreeSet.iterator()Ljava/util/Iterator;"),
	TREESET_DESCENDINGITERATOR("java.util.TreeSet.descendingIterator()Ljava/util/Iterator;"),
	TREESET_DESCENDINGSET("java.util.TreeSet.descendingSet()Ljava/util/NavigableSet;"),
	TREESET_SIZE("java.util.TreeSet.size()I"),
	TREESET_ISEMPTY("java.util.TreeSet.isEmpty()Z"),
	TREESET_CONTAINS("java.util.TreeSet.contains(Ljava/lang/Object;)Z"),
	TREESET_ADD("java.util.TreeSet.add(Ljava/lang/Object;)Z"),
	TREESET_REMOVE("java.util.TreeSet.remove(Ljava/lang/Object;)Z"),
	TREESET_CLEAR("java.util.TreeSet.clear()V"),
	TREESET_ADDALL("java.util.TreeSet.addAll(Ljava/util/Collection;)Z"),
	TREESET_SUBSET("java.util.TreeSet.subSet(Ljava/lang/Object;ZLjava/lang/Object;Z)Ljava/util/NavigableSet;"),
	TREESET_HEADSET("java.util.TreeSet.headSet(Ljava/lang/Object;Z)Ljava/util/NavigableSet;"),
	TREESET_TAILSET("java.util.TreeSet.tailSet(Ljava/lang/Object;Z)Ljava/util/NavigableSet;"),
	TREESET_SUBSET2("java.util.TreeSet.subSet(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedSet;"),
	TREESET_HEADSET2("java.util.TreeSet.headSet(Ljava/lang/Object;)Ljava/util/SortedSet;"),
	TREESET_TAILSET2("java.util.TreeSet.tailSet(Ljava/lang/Object;)Ljava/util/SortedSet;"),
	TREESET_COMPARATOR("java.util.TreeSet.comparator()Ljava/util/Comparator;"),
	TREESET_FIRST("java.util.TreeSet.first()Ljava/lang/Object;"),
	TREESET_LAST("java.util.TreeSet.last()Ljava/lang/Object;"),
	TREESET_LOWER("java.util.TreeSet.lower(Ljava/lang/Object;)Ljava/lang/Object;"),
	TREESET_FLOOR("java.util.TreeSet.floor(Ljava/lang/Object;)Ljava/lang/Object;"),
	TREESET_CEILING("java.util.TreeSet.ceiling(Ljava/lang/Object;)Ljava/lang/Object;"),
	TREESET_HIGHER("java.util.TreeSet.higher(Ljava/lang/Object;)Ljava/lang/Object;"),
	TREESET_POLLFIRST("java.util.TreeSet.pollFirst()Ljava/lang/Object;"),
	TREESET_POLLLAST("java.util.TreeSet.pollLast()Ljava/lang/Object;"),
	TREESET_CLONE("java.util.TreeSet.clone()Ljava/lang/Object;"),
	TREESET_SPLITERATOR("java.util.TreeSet.spliterator()Ljava/util/Spliterator;"),
	LINKEDHASHSET_INIT("java.util.LinkedHashSet.<init>(IF)V"),
	LINKEDHASHSET_INIT2("java.util.LinkedHashSet.<init>(I)V"),
	LINKEDHASHSET_INIT3("java.util.LinkedHashSet.<init>()V"),
	LINKEDHASHSET_INIT4("java.util.LinkedHashSet.<init>(Ljava/util/Collection;)V"),
	LINKEDHASHSET_SPLITERATOR("java.util.LinkedHashSet.spliterator()Ljava/util/Spliterator;"),
	MAP$ENTRY_GETKEY("java.util.Map$Entry.getKey()Ljava/lang/Object;"),
	MAP$ENTRY_GETVALUE("java.util.Map$Entry.getValue()Ljava/lang/Object;"),
	MAP$ENTRY_SETVALUE("java.util.Map$Entry.setValue(Ljava/lang/Object;)Ljava/lang/Object;"),
	HASHMAP_INIT("java.util.HashMap.<init>(IF)V"),
	HASHMAP_INIT2("java.util.HashMap.<init>(I)V"),
	HASHMAP_INIT3("java.util.HashMap.<init>()V"),
	HASHMAP_INIT4("java.util.HashMap.<init>(Ljava/util/Map;)V"),
	HASHMAP_SIZE("java.util.HashMap.size()I"),
	HASHMAP_ISEMPTY("java.util.HashMap.isEmpty()Z"),
	HASHMAP_GET("java.util.HashMap.get(Ljava/lang/Object;)Ljava/lang/Object;"),
	HASHMAP_CONTAINSKEY("java.util.HashMap.containsKey(Ljava/lang/Object;)Z"),
	HASHMAP_PUT("java.util.HashMap.put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"),
	HASHMAP_PUTALL("java.util.HashMap.putAll(Ljava/util/Map;)V"),
	HASHMAP_REMOVE("java.util.HashMap.remove(Ljava/lang/Object;)Ljava/lang/Object;"),
	HASHMAP_CLEAR("java.util.HashMap.clear()V"),
	HASHMAP_CONTAINSVALUE("java.util.HashMap.containsValue(Ljava/lang/Object;)Z"),
	HASHMAP_KEYSET("java.util.HashMap.keySet()Ljava/util/Set;"),
	HASHMAP_VALUES("java.util.HashMap.values()Ljava/util/Collection;"),
	HASHMAP_ENTRYSET("java.util.HashMap.entrySet()Ljava/util/Set;"),
	HASHMAP_GETORDEFAULT("java.util.HashMap.getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"),
	HASHMAP_PUTIFABSENT("java.util.HashMap.putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"),
	HASHMAP_REMOVE2("java.util.HashMap.remove(Ljava/lang/Object;Ljava/lang/Object;)Z"),
	HASHMAP_REPLACE("java.util.HashMap.replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z"),
	HASHMAP_REPLACE2("java.util.HashMap.replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"),
	HASHMAP_COMPUTEIFABSENT("java.util.HashMap.computeIfAbsent(Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;"),
	HASHMAP_COMPUTEIFPRESENT("java.util.HashMap.computeIfPresent(Ljava/lang/Object;Ljava/util/function/BiFunction;)Ljava/lang/Object;"),
	HASHMAP_COMPUTE("java.util.HashMap.compute(Ljava/lang/Object;Ljava/util/function/BiFunction;)Ljava/lang/Object;"),
	HASHMAP_MERGE("java.util.HashMap.merge(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/function/BiFunction;)Ljava/lang/Object;"),
	HASHMAP_FOREACH("java.util.HashMap.forEach(Ljava/util/function/BiConsumer;)V"),
	HASHMAP_REPLACEALL("java.util.HashMap.replaceAll(Ljava/util/function/BiFunction;)V"),
	HASHMAP_CLONE("java.util.HashMap.clone()Ljava/lang/Object;"),
	TREEMAP_INIT("java.util.TreeMap.<init>()V"),
	TREEMAP_INIT2("java.util.TreeMap.<init>(Ljava/util/Comparator;)V"),
	TREEMAP_INIT3("java.util.TreeMap.<init>(Ljava/util/Map;)V"),
	TREEMAP_INIT4("java.util.TreeMap.<init>(Ljava/util/SortedMap;)V"),
	TREEMAP_SIZE("java.util.TreeMap.size()I"),
	TREEMAP_CONTAINSKEY("java.util.TreeMap.containsKey(Ljava/lang/Object;)Z"),
	TREEMAP_CONTAINSVALUE("java.util.TreeMap.containsValue(Ljava/lang/Object;)Z"),
	TREEMAP_GET("java.util.TreeMap.get(Ljava/lang/Object;)Ljava/lang/Object;"),
	TREEMAP_COMPARATOR("java.util.TreeMap.comparator()Ljava/util/Comparator;"),
	TREEMAP_FIRSTKEY("java.util.TreeMap.firstKey()Ljava/lang/Object;"),
	TREEMAP_LASTKEY("java.util.TreeMap.lastKey()Ljava/lang/Object;"),
	TREEMAP_PUTALL("java.util.TreeMap.putAll(Ljava/util/Map;)V"),
	TREEMAP_PUT("java.util.TreeMap.put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"),
	TREEMAP_REMOVE("java.util.TreeMap.remove(Ljava/lang/Object;)Ljava/lang/Object;"),
	TREEMAP_CLEAR("java.util.TreeMap.clear()V"),
	TREEMAP_CLONE("java.util.TreeMap.clone()Ljava/lang/Object;"),
	TREEMAP_FIRSTENTRY("java.util.TreeMap.firstEntry()Ljava/util/Map$Entry;"),
	TREEMAP_LASTENTRY("java.util.TreeMap.lastEntry()Ljava/util/Map$Entry;"),
	TREEMAP_POLLFIRSTENTRY("java.util.TreeMap.pollFirstEntry()Ljava/util/Map$Entry;"),
	TREEMAP_POLLLASTENTRY("java.util.TreeMap.pollLastEntry()Ljava/util/Map$Entry;"),
	TREEMAP_LOWERENTRY("java.util.TreeMap.lowerEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;"),
	TREEMAP_LOWERKEY("java.util.TreeMap.lowerKey(Ljava/lang/Object;)Ljava/lang/Object;"),
	TREEMAP_FLOORENTRY("java.util.TreeMap.floorEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;"),
	TREEMAP_FLOORKEY("java.util.TreeMap.floorKey(Ljava/lang/Object;)Ljava/lang/Object;"),
	TREEMAP_CEILINGENTRY("java.util.TreeMap.ceilingEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;"),
	TREEMAP_CEILINGKEY("java.util.TreeMap.ceilingKey(Ljava/lang/Object;)Ljava/lang/Object;"),
	TREEMAP_HIGHERENTRY("java.util.TreeMap.higherEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;"),
	TREEMAP_HIGHERKEY("java.util.TreeMap.higherKey(Ljava/lang/Object;)Ljava/lang/Object;"),
	TREEMAP_KEYSET("java.util.TreeMap.keySet()Ljava/util/Set;"),
	TREEMAP_NAVIGABLEKEYSET("java.util.TreeMap.navigableKeySet()Ljava/util/NavigableSet;"),
	TREEMAP_DESCENDINGKEYSET("java.util.TreeMap.descendingKeySet()Ljava/util/NavigableSet;"),
	TREEMAP_VALUES("java.util.TreeMap.values()Ljava/util/Collection;"),
	TREEMAP_ENTRYSET("java.util.TreeMap.entrySet()Ljava/util/Set;"),
	TREEMAP_DESCENDINGMAP("java.util.TreeMap.descendingMap()Ljava/util/NavigableMap;"),
	TREEMAP_SUBMAP("java.util.TreeMap.subMap(Ljava/lang/Object;ZLjava/lang/Object;Z)Ljava/util/NavigableMap;"),
	TREEMAP_HEADMAP("java.util.TreeMap.headMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;"),
	TREEMAP_TAILMAP("java.util.TreeMap.tailMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;"),
	TREEMAP_SUBMAP2("java.util.TreeMap.subMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedMap;"),
	TREEMAP_HEADMAP2("java.util.TreeMap.headMap(Ljava/lang/Object;)Ljava/util/SortedMap;"),
	TREEMAP_TAILMAP2("java.util.TreeMap.tailMap(Ljava/lang/Object;)Ljava/util/SortedMap;"),
	TREEMAP_REPLACE("java.util.TreeMap.replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z"),
	TREEMAP_REPLACE2("java.util.TreeMap.replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"),
	TREEMAP_FOREACH("java.util.TreeMap.forEach(Ljava/util/function/BiConsumer;)V"),
	TREEMAP_REPLACEALL("java.util.TreeMap.replaceAll(Ljava/util/function/BiFunction;)V"),
	LINKEDHASHMAP_REINITIALIZE("java.util.LinkedHashMap.reinitialize()V"),
	LINKEDHASHMAP_NEWNODE("java.util.LinkedHashMap.newNode(ILjava/lang/Object;Ljava/lang/Object;Ljava/util/HashMap$Node;)Ljava/util/HashMap$Node;"),
	LINKEDHASHMAP_REPLACEMENTNODE("java.util.LinkedHashMap.replacementNode(Ljava/util/HashMap$Node;Ljava/util/HashMap$Node;)Ljava/util/HashMap$Node;"),
	LINKEDHASHMAP_NEWTREENODE("java.util.LinkedHashMap.newTreeNode(ILjava/lang/Object;Ljava/lang/Object;Ljava/util/HashMap$Node;)Ljava/util/HashMap$TreeNode;"),
	LINKEDHASHMAP_REPLACEMENTTREENODE("java.util.LinkedHashMap.replacementTreeNode(Ljava/util/HashMap$Node;Ljava/util/HashMap$Node;)Ljava/util/HashMap$TreeNode;"),
	LINKEDHASHMAP_AFTERNODEREMOVAL("java.util.LinkedHashMap.afterNodeRemoval(Ljava/util/HashMap$Node;)V"),
	LINKEDHASHMAP_AFTERNODEINSERTION("java.util.LinkedHashMap.afterNodeInsertion(Z)V"),
	LINKEDHASHMAP_AFTERNODEACCESS("java.util.LinkedHashMap.afterNodeAccess(Ljava/util/HashMap$Node;)V"),
	LINKEDHASHMAP_INTERNALWRITEENTRIES("java.util.LinkedHashMap.internalWriteEntries(Ljava/io/ObjectOutputStream;)V"),
	LINKEDHASHMAP_INIT("java.util.LinkedHashMap.<init>(IF)V"),
	LINKEDHASHMAP_INIT2("java.util.LinkedHashMap.<init>(I)V"),
	LINKEDHASHMAP_INIT3("java.util.LinkedHashMap.<init>()V"),
	LINKEDHASHMAP_INIT4("java.util.LinkedHashMap.<init>(Ljava/util/Map;)V"),
	LINKEDHASHMAP_INIT5("java.util.LinkedHashMap.<init>(IFZ)V"),
	LINKEDHASHMAP_CONTAINSVALUE("java.util.LinkedHashMap.containsValue(Ljava/lang/Object;)Z"),
	LINKEDHASHMAP_GET("java.util.LinkedHashMap.get(Ljava/lang/Object;)Ljava/lang/Object;"),
	LINKEDHASHMAP_GETORDEFAULT("java.util.LinkedHashMap.getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"),
	LINKEDHASHMAP_CLEAR("java.util.LinkedHashMap.clear()V"),
	LINKEDHASHMAP_REMOVEELDESTENTRY("java.util.LinkedHashMap.removeEldestEntry(Ljava/util/Map$Entry;)Z"),
	LINKEDHASHMAP_KEYSET("java.util.LinkedHashMap.keySet()Ljava/util/Set;"),
	LINKEDHASHMAP_VALUES("java.util.LinkedHashMap.values()Ljava/util/Collection;"),
	LINKEDHASHMAP_ENTRYSET("java.util.LinkedHashMap.entrySet()Ljava/util/Set;"),
	LINKEDHASHMAP_FOREACH("java.util.LinkedHashMap.forEach(Ljava/util/function/BiConsumer;)V"),
	LINKEDHASHMAP_REPLACEALL("java.util.LinkedHashMap.replaceAll(Ljava/util/function/BiFunction;)V"),
	ITERATOR_HASNEXT("java.util.Iterator.hasNext()Z"),
	ITERATOR_NEXT("java.util.Iterator.next()Ljava/lang/Object;"),
	ITERATOR_REMOVE("java.util.Iterator.remove()V"),
	ITERATOR_FOREACHREMAINING("java.util.Iterator.forEachRemaining(Ljava/util/function/Consumer;)V"),
	LISTITERATOR_HASNEXT("java.util.ListIterator.hasNext()Z"),
	LISTITERATOR_NEXT("java.util.ListIterator.next()Ljava/lang/Object;"),
	LISTITERATOR_HASPREVIOUS("java.util.ListIterator.hasPrevious()Z"),
	LISTITERATOR_PREVIOUS("java.util.ListIterator.previous()Ljava/lang/Object;"),
	LISTITERATOR_NEXTINDEX("java.util.ListIterator.nextIndex()I"),
	LISTITERATOR_PREVIOUSINDEX("java.util.ListIterator.previousIndex()I"),
	LISTITERATOR_REMOVE("java.util.ListIterator.remove()V"),
	LISTITERATOR_SET("java.util.ListIterator.set(Ljava/lang/Object;)V"),
	LISTITERATOR_ADD("java.util.ListIterator.add(Ljava/lang/Object;)V"),
	
	NAVIGABLESET_LOWER("java.util.NavigableSet.lower(Ljava/lang/Object;)Ljava/lang/Object;"),
	NAVIGABLESET_FLOOR("java.util.NavigableSet.floor(Ljava/lang/Object;)Ljava/lang/Object;"),
	NAVIGABLESET_CEILING("java.util.NavigableSet.ceiling(Ljava/lang/Object;)Ljava/lang/Object;"),
	NAVIGABLESET_HIGHER("java.util.NavigableSet.higher(Ljava/lang/Object;)Ljava/lang/Object;"),
	NAVIGABLESET_POLLFIRST("java.util.NavigableSet.pollFirst()Ljava/lang/Object;"),
	NAVIGABLESET_POLLLAST("java.util.NavigableSet.pollLast()Ljava/lang/Object;"),
	NAVIGABLESET_ITERATOR("java.util.NavigableSet.iterator()Ljava/util/Iterator;"),
	NAVIGABLESET_DESCENDINGSET("java.util.NavigableSet.descendingSet()Ljava/util/NavigableSet;"),
	NAVIGABLESET_DESCENDINGITERATOR("java.util.NavigableSet.descendingIterator()Ljava/util/Iterator;"),
	NAVIGABLESET_SUBSET("java.util.NavigableSet.subSet(Ljava/lang/Object;ZLjava/lang/Object;Z)Ljava/util/NavigableSet;"),
	NAVIGABLESET_HEADSET("java.util.NavigableSet.headSet(Ljava/lang/Object;Z)Ljava/util/NavigableSet;"),
	NAVIGABLESET_TAILSET("java.util.NavigableSet.tailSet(Ljava/lang/Object;Z)Ljava/util/NavigableSet;"),
	NAVIGABLESET_SUBSET2("java.util.NavigableSet.subSet(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedSet;"),
	NAVIGABLESET_HEADSET2("java.util.NavigableSet.headSet(Ljava/lang/Object;)Ljava/util/SortedSet;"),
	NAVIGABLESET_TAILSET2("java.util.NavigableSet.tailSet(Ljava/lang/Object;)Ljava/util/SortedSet;"),
	SORTEDSET_COMPARATOR("java.util.SortedSet.comparator()Ljava/util/Comparator;"),
	SORTEDSET_SUBSET("java.util.SortedSet.subSet(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedSet;"),
	SORTEDSET_HEADSET("java.util.SortedSet.headSet(Ljava/lang/Object;)Ljava/util/SortedSet;"),
	SORTEDSET_TAILSET("java.util.SortedSet.tailSet(Ljava/lang/Object;)Ljava/util/SortedSet;"),
	SORTEDSET_FIRST("java.util.SortedSet.first()Ljava/lang/Object;"),
	SORTEDSET_LAST("java.util.SortedSet.last()Ljava/lang/Object;"),
	SORTEDSET_SPLITERATOR("java.util.SortedSet.spliterator()Ljava/util/Spliterator;"),
	NAVIGABLEMAP_LOWERENTRY("java.util.NavigableMap.lowerEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;"),
	NAVIGABLEMAP_LOWERKEY("java.util.NavigableMap.lowerKey(Ljava/lang/Object;)Ljava/lang/Object;"),
	NAVIGABLEMAP_FLOORENTRY("java.util.NavigableMap.floorEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;"),
	NAVIGABLEMAP_FLOORKEY("java.util.NavigableMap.floorKey(Ljava/lang/Object;)Ljava/lang/Object;"),
	NAVIGABLEMAP_CEILINGENTRY("java.util.NavigableMap.ceilingEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;"),
	NAVIGABLEMAP_CEILINGKEY("java.util.NavigableMap.ceilingKey(Ljava/lang/Object;)Ljava/lang/Object;"),
	NAVIGABLEMAP_HIGHERENTRY("java.util.NavigableMap.higherEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;"),
	NAVIGABLEMAP_HIGHERKEY("java.util.NavigableMap.higherKey(Ljava/lang/Object;)Ljava/lang/Object;"),
	NAVIGABLEMAP_FIRSTENTRY("java.util.NavigableMap.firstEntry()Ljava/util/Map$Entry;"),
	NAVIGABLEMAP_LASTENTRY("java.util.NavigableMap.lastEntry()Ljava/util/Map$Entry;"),
	NAVIGABLEMAP_POLLFIRSTENTRY("java.util.NavigableMap.pollFirstEntry()Ljava/util/Map$Entry;"),
	NAVIGABLEMAP_POLLLASTENTRY("java.util.NavigableMap.pollLastEntry()Ljava/util/Map$Entry;"),
	NAVIGABLEMAP_DESCENDINGMAP("java.util.NavigableMap.descendingMap()Ljava/util/NavigableMap;"),
	NAVIGABLEMAP_NAVIGABLEKEYSET("java.util.NavigableMap.navigableKeySet()Ljava/util/NavigableSet;"),
	NAVIGABLEMAP_DESCENDINGKEYSET("java.util.NavigableMap.descendingKeySet()Ljava/util/NavigableSet;"),
	NAVIGABLEMAP_SUBMAP("java.util.NavigableMap.subMap(Ljava/lang/Object;ZLjava/lang/Object;Z)Ljava/util/NavigableMap;"),
	NAVIGABLEMAP_HEADMAP("java.util.NavigableMap.headMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;"),
	NAVIGABLEMAP_TAILMAP("java.util.NavigableMap.tailMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;"),
	NAVIGABLEMAP_SUBMAP2("java.util.NavigableMap.subMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedMap;"),
	NAVIGABLEMAP_HEADMAP2("java.util.NavigableMap.headMap(Ljava/lang/Object;)Ljava/util/SortedMap;"),
	NAVIGABLEMAP_TAILMAP2("java.util.NavigableMap.tailMap(Ljava/lang/Object;)Ljava/util/SortedMap;"),
	SORTEDMAP_COMPARATOR("java.util.SortedMap.comparator()Ljava/util/Comparator;"),
	SORTEDMAP_SUBMAP("java.util.SortedMap.subMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedMap;"),
	SORTEDMAP_HEADMAP("java.util.SortedMap.headMap(Ljava/lang/Object;)Ljava/util/SortedMap;"),
	SORTEDMAP_TAILMAP("java.util.SortedMap.tailMap(Ljava/lang/Object;)Ljava/util/SortedMap;"),
	SORTEDMAP_FIRSTKEY("java.util.SortedMap.firstKey()Ljava/lang/Object;"),
	SORTEDMAP_LASTKEY("java.util.SortedMap.lastKey()Ljava/lang/Object;"),
	SORTEDMAP_KEYSET("java.util.SortedMap.keySet()Ljava/util/Set;"),
	SORTEDMAP_VALUES("java.util.SortedMap.values()Ljava/util/Collection;"),
	SORTEDMAP_ENTRYSET("java.util.SortedMap.entrySet()Ljava/util/Set;"),

	// java.lang
	INTEGER_VALUEOF("java.lang.Integer.valueOf(I)Ljava/lang/Integer;"),
	INTEGER_INTVALUE("java.lang.Integer.intValue()I"),
	// java.io
	FILEINPUTSTREAM_INIT("java.io.FileInputStream.<init>(Ljava/lang/String;)V"),
	FILEINPUTSTREAM_READ2("java.io.FileInputStream.read([B)I"),
	FILEINPUTSTREAM_CLOSE("java.io.FileInputStream.close()V");
	
	private final String str;

	private LibraryOperation(String str) {
		this.str = str;
	}
	
	public String getSignature() {
		return str;
	}
}