;COLLECTION
(declare-datatypes (T) (
    (Set (mk-pair (mapping (Array T Bool))))
    (List (mk-pair (mapping (Array T Bool)) (element (Seq T))))
))
(declare-datatypes (K V) (
    (Entry (mk-pair (key K) (value V)))
    (Map (mk-pair (key (Set K)) (mapping (Array K V))))
))
;START
;java.util.ArrayList.<init>(I)V
(assert (= (seq.len (element ?_p0)) 0))
;java.util.ArrayList.<init>()V#java.util.LinkedList.<init>()V
(assert (= (seq.len (element ?_p0)) 0))
;java.util.ArrayList.<init>(Ljava/util/Collection;)V#java.util.LinkedList.<init>(Ljava/util/Collection;)V
(assert (= (element ?_p0) (element ?p1)))
;java.util.ArrayList.trimToSize()V
(assert true)
;java.util.ArrayList.ensureCapacity(I)V
(assert true)
;java.util.ArrayList.size()I#java.util.LinkedList.size()I
(assert (= ?r (seq.len (element ?p0))))
;java.util.ArrayList.isEmpty()Z
(assert (= ?r (= (seq.len (element ?p0)) 0)))
;java.util.ArrayList.contains(Ljava/lang/Object;)Z#java.util.LinkedList.contains(Ljava/lang/Object;)Z
(assert (= ?r (seq.contains (element ?p0) (seq.unit ?p1))))
;java.util.ArrayList.indexOf(Ljava/lang/Object;)I#java.util.LinkedList.indexOf(Ljava/lang/Object;)I
(assert (= ?r (seq.indexof (element ?p0) (seq.unit ?p1))))
;java.util.ArrayList.lastIndexOf(Ljava/lang/Object;)I#java.util.LinkedList.lastIndexOf(Ljava/lang/Object;)I
(assert (= ?r (seq.indexof (element ?p0) (seq.unit ?p1) ?r)))
;java.util.ArrayList.clone()Ljava/lang/Object;#java.util.LinkedList.clone()Ljava/lang/Object;
(assert (= (element ?r) (element ?p0)))
;java.util.ArrayList.toArray()[Ljava/lang/Object;#java.util.LinkedList.toArray()[Ljava/lang/Object;
(assert (= (element ?r) (element ?p0)))
;java.util.ArrayList.toArray([Ljava/lang/Object;)[Ljava/lang/Object;#java.util.LinkedList.toArray([Ljava/lang/Object;)[Ljava/lang/Object;
(assert (and 
    (= (element ?_p1) (element ?p0))
    (= ?r ?_p1)
))
;java.util.ArrayList.get(I)Ljava/lang/Object;#java.util.LinkedList.get(I)Ljava/lang/Object;
(assert (= (seq.unit ?r) (seq.at (element ?p0) ?p1)))
;java.util.ArrayList.set(ILjava/lang/Object;)Ljava/lang/Object;#java.util.LinkedList.set(ILjava/lang/Object;)Ljava/lang/Object;
(assert (= (seq.unit ?r) (seq.at (element ?p0) ?p1)))
(assert (and 
    (let ((size (seq.len (element ?p0))))
        (= (element ?_p0) (seq.++ 
            (seq.extract (element ?p0) 0 ?p1)
            (seq.unit ?p2)
            (seq.extract (element ?p0) (+ ?p1 1) (- (- size ?p1) 1)))))
))
;java.util.ArrayList.add(Ljava/lang/Object;)Z#java.util.LinkedList.add(Ljava/lang/Object;)Z
(assert (= ?r true))
(assert (and 
    (let ((size (seq.len (element ?p0))))
        (= (element ?_p0) (seq.++ 
            (seq.extract (element ?p0) 0 (size ?p0))
            (seq.unit ?p1)
            (seq.extract (element ?p0) (size ?p0) (- size (size ?p0))))))
))
;java.util.ArrayList.add(ILjava/lang/Object;)V#java.util.LinkedList.add(ILjava/lang/Object;)V
(assert (and
    (let ((size (seq.len (element ?p0))))
        (= (element ?_p0) (seq.++ 
            (seq.extract (element ?p0) 0 ?p1)
            (seq.unit ?p2)
            (seq.extract (element ?p0) ?p1 (- size ?p1)))))
))
;java.util.ArrayList.remove(I)Ljava/lang/Object;#java.util.LinkedList.remove(I)Ljava/lang/Object;
(assert (and
    (>= ?p1 0) (< ?p1 (seq.len (element ?p0)))
    (and 
        (= (seq.unit ?r) (seq.at (element ?p0) ?p0))
        (let ((size (seq.len (element ?p0))))
            (= (element ?_p0) (seq.++ 
                (seq.extract (element ?p0) 0 ?p1)
                (seq.extract (element ?p0) (+ ?p1 1) (- (- size ?p1) 1)))))
    )
))
;java.util.ArrayList.remove(Ljava/lang/Object;)Z#java.util.LinkedList.remove(Ljava/lang/Object;)Z#java.util.LinkedList.removeFirstOccurrence(Ljava/lang/Object;)Z
(assert (ite
    (seq.contains (element ?p0) (seq.unit ?p1))
    (and 
        (= ?r true)
        (let ((size (seq.len (element ?p0)))(idx (seq.indexof (element ?p0) ?p1)))
            (= (element ?_p0) (seq.++
                (seq.extract (element ?p0) 0 idx)
                (seq.extract (element ?p0) (+ idx 1) (- (- size idx) 1)))))
    )
    (and
        (= ?r false)
        (= (element ?_p0) (element ?p0))
    )
))
;java.util.ArrayList.clear()V#java.util.LinkedList.clear()V
(assert (= (seq.len (element ?_p0)) 0))
;java.util.ArrayList.addAll(Ljava/util/Collection;)Z#java.util.LinkedList.addAll(Ljava/util/Collection;)Z
(assert (and 
    (= ?r (> (seq.len (element ?p1)) 0))
    (let ((size (seq.len (element ?p0))))
        (= (element ?_p0) (seq.++
            (seq.extract (element ?p0) 0 (seq.len (element ?p0)))
            ?p1
            (seq.extract (element ?p0) (seq.len (element ?p0)) (- size (seq.len (element ?p0)))))))
))
;java.util.ArrayList.addAll(ILjava/util/Collection;)Z#java.util.LinkedList.addAll(ILjava/util/Collection;)Z
(assert (and 
    (= ?r (> (seq.len (element ?p1)) 0))
    (let ((size (seq.len (element ?p0))))
        (= (element ?_p0) (seq.++
            (seq.extract (element ?p0) 0 ?p1)
            ?p2
            (seq.extract (element ?p0) ?p1 (- size ?p1)))))
))
;java.util.ArrayList.removeRange(II)V
(assert 
    (let ((size (seq.len (element ?p0))))
        (= (element ?_p0) (seq.++
            (seq.extract (element ?p0) 0 ?p1)
            (seq.extract (element ?p0) ?p2 (- size ?p2)))))
)
;java.util.ArrayList.removeAll(Ljava/util/Collection;)Z
;java.util.ArrayList.retainAll(Ljava/util/Collection;)Z
;java.util.ArrayList.subList(II)Ljava/util/List;
(assert (= ?r (seq.extract ?p0 ?p1 (- ?p2 ?p1))))
;java.util.LinkedList.getFirst()Ljava/lang/Object;#java.util.LinkedList.peek()Ljava/lang/Object;#java.util.LinkedList.element()Ljava/lang/Object;#java.util.LinkedList.peekFirst()Ljava/lang/Object;
(assert (= (seq.unit ?r) (seq.at (element ?_p0) 0)))
;java.util.LinkedList.getLast()Ljava/lang/Object;#;java.util.LinkedList.peekLast()Ljava/lang/Object;
(assert (= (seq.unit ?r) (seq.at (element ?_p0) (- (seq.len (element ?p0)) 1))))
;java.util.LinkedList.removeFirst()Ljava/lang/Object;#java.util.LinkedList.poll()Ljava/lang/Object;#java.util.LinkedList.remove()Ljava/lang/Object;#java.util.LinkedList.pollFirst()Ljava/lang/Object;#java.util.LinkedList.pop()Ljava/lang/Object;
(assert (= (seq.unit ?r) (seq.at (element ?_p0) 0)))
(assert (= (element ?_p0) (seq.extract (element ?p0) 1 (- (seq.len (element ?p0)) 1))))
;java.util.LinkedList.removeLast()Ljava/lang/Object;#java.util.LinkedList.pollLast()Ljava/lang/Object;
(assert (= (seq.unit ?r) (seq.at (element ?_p0) (- (seq.len (element ?p0)) 1))))
(assert (= (element ?_p0) (seq.extract (element ?p0) 0 (- (seq.len (element ?p0)) 1))))
;java.util.LinkedList.addFirst(Ljava/lang/Object;)V#java.util.LinkedList.push(Ljava/lang/Object;)V
(assert (= (element ?_p0) (seq.++ (seq.unit ?p1) (element ?p0))))
;java.util.LinkedList.addLast(Ljava/lang/Object;)V
(assert (= (element ?_p0) (seq.++ (element ?p0) (seq.unit ?p1))))
;java.util.LinkedList.offer(Ljava/lang/Object;)Z#java.util.LinkedList.offerLast(Ljava/lang/Object;)Z
(assert (= ?r true))
(assert (= (element ?_p0) (seq.++ (element ?p0) (seq.unit ?p1))))
;java.util.LinkedList.offerFirst(Ljava/lang/Object;)Z
(assert (= ?r true))
(assert (= (element ?_p0) (seq.++ (seq.unit ?p1) (element ?p0))))
;java.util.LinkedList.removeLastOccurrence(Ljava/lang/Object;)Z
(assert (ite
    (seq.contains (element ?p0) (seq.unit ?p1))
    (and 
        (= ?r true)
        (let ((size (seq.len (element ?p0)))(idx (seq.indexof (element ?p0) ?p1 idx)))
            (= (element ?_p0) (seq.++
                (seq.extract (element ?p0) 0 idx)
                (seq.extract (element ?p0) (+ idx 1) (- (- size idx) 1)))))
    )
    (and
        (= ?r false)
        (= (element ?_p0) (element ?p0))
    )
))
;java.util.HashSet.<init>()V#java.util.HashSet.<init>(IF)V#java.util.HashSet.<init>(I)V#;java.util.TreeSet.<init>()V
(assert (= (mapping ?_p0) ((as const (Array ?T Bool)) false)))
;java.util.HashSet.<init>(Ljava/util/Collection;)V#java.util.TreeSet.<init>(Ljava/util/Collection;)V#;java.util.TreeSet.<init>(Ljava/util/SortedSet;)V
(assert (= (mapping ?_p0) (mapping ?p1)))
;java.util.HashSet.size()I#java.util.TreeSet.size()I
(assert (ite 
    (= (mapping ?p0) ((as const (Array ?T Bool)) false)) 
    (= ?r 0) 
    (> ?r 0)
))
;java.util.HashSet.isEmpty()Z#java.util.TreeSet.isEmpty()Z
(assert (= ?r (= (mapping ?p0) ((as const (Array ?T Bool)) false))))
;java.util.HashSet.contains(Ljava/lang/Object;)Z#java.util.TreeSet.contains(Ljava/lang/Object;)Z
(assert (= ?r (select (mapping ?p0) ?p1)))
;java.util.HashSet.add(Ljava/lang/Object;)Z#java.util.TreeSet.add(Ljava/lang/Object;)Z
(assert (ite 
        (= true (select (mapping ?p0) ?p1))
        (and (= ?r false) (= (mapping ?_p0) (mapping ?p0)))
        (and (= ?r true)
            (forall ((x T))
                (ite (= x ?p1)
                    (= (select (mapping ?_p0) x) true)
                    (= (select (mapping ?_p0) x) (select (mapping ?p0) x))
            )))
))
;java.util.HashSet.remove(Ljava/lang/Object;)Z#java.util.TreeSet.remove(Ljava/lang/Object;)Z
(assert (ite 
        (= true (select (mapping ?p0) ?p1))
        (and (= ?r true)
            (forall ((x T))
                (ite (= x ?p1)
                    (= (select (mapping ?_p0) x) false)
                    (= (select (mapping ?_p0) x) (select (mapping ?p0) x))
            )))
        (and (= ?r false) (= (mapping ?_p0) (mapping ?p0)))
))
;java.util.HashSet.clear()V#java.util.TreeSet.clear()V
(assert (= (mapping ?_p0) ((as const (Array ?T Bool)) false)))
;java.util.HashSet.clone()Ljava/lang/Object;#java.util.TreeSet.clone()Ljava/lang/Object;
(assert (= (mapping ?r) (mapping ?p0)))
;java.util.TreeSet.addAll(Ljava/util/Collection;)Z
(assert (= ?r true))
(assert (= ?_p0 ((_ map or) (mapping ?p0) (mapping ?p1))))
;java.util.TreeSet.subSet(Ljava/lang/Object;ZLjava/lang/Object;Z)Ljava/util/NavigableSet;
(assert 
    (forall ((x ?T))
        (ite 
            (and (ite ?p2 (>= x ?p1) (> x ?p1)) (ite ?p4 (<= x ?p3) (< x ?p3)))
            (= (select (mapping ?r) x) (select (mapping ?p0) x))
            (= (select (mapping ?r) x) false)
        ))
)
;java.util.TreeSet.headSet(Ljava/lang/Object;Z)Ljava/util/NavigableSet;
(assert 
    (forall ((x ?T))
        (ite 
            (ite ?p2 (<= x ?p1) (< x ?p1))
            (= (select (mapping ?r) x) (select (mapping ?p0) x))
            (= (select (mapping ?r) x) false)
        ))
)
;java.util.TreeSet.tailSet(Ljava/lang/Object;Z)Ljava/util/NavigableSet;
(assert 
    (forall ((x ?T))
        (ite 
            (ite ?p2 (>= x ?p1) (> x ?p1))
            (= (select (mapping ?r) x) (select (mapping ?p0) x))
            (= (select (mapping ?r) x) false)
        ))
)
;java.util.TreeSet.subSet(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedSet;
(assert 
    (forall ((x ?T))
        (ite 
            (and (>= x ?p1) (< x ?p2))
            (= (select (mapping ?r) x) (select (mapping ?p0) x))
            (= (select (mapping ?r) x) false)
        ))
)
;java.util.TreeSet.headSet(Ljava/lang/Object;)Ljava/util/SortedSet;
(assert 
    (forall ((x ?T))
        (ite 
            (< x ?p1)
            (= (select (mapping ?r) x) (select (mapping ?p0) x))
            (= (select (mapping ?r) x) false)
        ))
)
;java.util.TreeSet.tailSet(Ljava/lang/Object;)Ljava/util/SortedSet;
(assert 
    (forall ((x ?T))
        (ite 
            (>= x ?p1)
            (= (select (mapping ?r) x) (select (mapping ?p0) x))
            (= (select (mapping ?r) x) false)
        ))
)
;java.util.TreeSet.first()Ljava/lang/Object;
(assert (and
    (= true (select (mapping ?p0) ?r))
    (forall ((x ?T)) 
        (=> (= true (select (mapping ?p0) x)) (<= ?r x)))
))
;java.util.TreeSet.last()Ljava/lang/Object;
(assert (and
    (= true (select (mapping ?p0) ?r))
    (forall ((x ?T)) 
        (=> (= true (select (mapping ?p0) x)) (>= ?r x)))
))
;java.util.TreeSet.lower(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (= true (select (mapping ?p0) ?r))
    (forall ((x ?T)) 
        (=> (and (= true (select (mapping ?p0) x)) (< x ?p1)) (>= ?r x)))
))
;java.util.TreeSet.floor(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (= true (select (mapping ?p0) ?r))
    (forall ((x ?T)) 
        (=> (and (= true (select (mapping ?p0) x)) (<= x ?p1)) (>= ?r x)))
))
;java.util.TreeSet.ceiling(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (= true (select (mapping ?p0) ?r))
    (forall ((x ?T)) 
        (=> (and (= true (select (mapping ?p0) x)) (>= x ?p1)) (<= ?r x)))
))
;java.util.TreeSet.higher(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (= true (select (mapping ?p0) ?r))
    (forall ((x ?T)) 
        (=> (and (= true (select (mapping ?p0) x)) (> x ?p1)) (<= ?r x)))
))
;java.util.TreeSet.pollFirst()Ljava/lang/Object;
(assert (and
    (= true (select (mapping ?p0) ?r))
    (forall ((x ?T)) 
        (=> (= true (select (mapping ?p0) x)) (<= ?r x)))
    (forall ((x T))
                (ite (= x ?r)
                    (= (select (mapping ?_p0) x) false)
                    (= (select (mapping ?_p0) x) (select (mapping ?p0) x))))
))
;java.util.TreeSet.pollLast()Ljava/lang/Object;
(assert (and
    (= true (select (mapping ?p0) ?r))
    (forall ((x ?T)) 
        (=> (= true (select (mapping ?p0) x)) (>= ?r x)))
    (forall ((x ?T))
                (ite (= x ?r)
                    (= (select (mapping ?_p0) x) false)
                    (= (select (mapping ?_p0) x) (select (mapping ?p0) x))))
))
;java.util.HashMap.<init>(IF)V#java.util.HashMap.<init>(I)V#java.util.HashMap.<init>()V#java.util.TreeMap.<init>()V
(assert (= (key ?_p0) ((as const (Array ?K Bool)) false)))
;java.util.HashMap.<init>(Ljava/util/Map;)V#java.util.TreeMap.<init>(Ljava/util/Map;)V#java.util.TreeMap.<init>(Ljava/util/SortedMap;)V
(assert (and
    (= (key ?_p0) (key ?p1))
    (= (mapping ?_p0) (mapping ?p1))
))
;java.util.HashMap.size()I#java.util.TreeMap.size()I
(assert (ite 
    (= (key ?p0) ((as const (Array ?K Bool)) false)) 
    (= ?r 0) 
    (> ?r 0)
))
;java.util.HashMap.isEmpty()Z
(assert (= ?r (= (key ?p0) ((as const (Array ?K Bool)) false))))
;java.util.HashMap.get(Ljava/lang/Object;)Ljava/lang/Object;#java.util.TreeMap.get(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (= true (select (key ?p0) ?p1))
    (= ?r (select (mapping ?p0) ?p1))
))
;java.util.HashMap.containsKey(Ljava/lang/Object;)Z#java.util.TreeMap.containsKey(Ljava/lang/Object;)Z
(assert (= true (select (key ?p0) ?p1)))
;java.util.HashMap.put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;#java.util.TreeMap.put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (forall (k ?K)
        (ite (= k ?p1)
            (and
                (= true (select (key ?_p0) k))
                (= ?p2 (select (mapping ?_p0) ?p1))
            )
            (and
                (= (select (key ?_p0) k) (select (key ?p0) k))
                (= (select (mapping ?_p0) ?p1) (select (mapping ?p0) ?p1))
            )))
))
;java.util.HashMap.putAll(Ljava/util/Map;)V#java.util.TreeMap.putAll(Ljava/util/Map;)V
(assert
    (forall ((k ?K))
        (ite (= true (select (key ?p1) k))
            (and 
                (= true (select (key ?_p0) k))
                (= (select (mapping ?p1) k) (select (mapping ?p1) k))
            )
            (and
                (= (select (key ?_p0) k) (select (key ?p0) k))
                (= (select (mapping ?_p0) ?p1) (select (mapping ?p0) ?p1))
            )))
)
;java.util.HashMap.remove(Ljava/lang/Object;)Ljava/lang/Object;#java.util.TreeMap.remove(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (= true (select (key ?p0) ?p1))
    (forall (k ?K)
        (ite (= k ?p1)
            (= false (select (key ?_p0) k))
            (= (select (key ?_p0) k) (select (key ?p0) k))))
    (= (mapping ?_p0) (mapping ?p0))
))
;java.util.HashMap.clear()V#java.util.TreeMap.clear()V
(assert (= (key ?_p0) ((as const (Array ?K Bool)) false)))
;java.util.HashMap.containsValue(Ljava/lang/Object;)Z#java.util.TreeMap.containsValue(Ljava/lang/Object;)Z
(assert (= ?r 
    (exists ((k ?K)) (and
        (= true (select (key ?p0) k))
        (= ?p1 (select (mapping ?p0) k))))
))
;java.util.HashMap.keySet()Ljava/util/Set;#;java.util.TreeMap.keySet()Ljava/util/Set;#java.util.TreeMap.descendingKeySet()Ljava/util/NavigableSet;#java.util.TreeMap.navigableKeySet()Ljava/util/NavigableSet;
(assert (= ?r (key ?p0)))
;java.util.HashMap.values()Ljava/util/Collection;#java.util.TreeMap.values()Ljava/util/Collection;
(assert (and 
    (forall ((k ?K)) 
        (ite (= true (select (key ?p0) k))
            (= true (select ?r (select (mapping ?p0) k)))))
    (= ?r ((_ map or) ((as const (Array ?V Bool)) false) ?r))
))
;java.util.HashMap.entrySet()Ljava/util/Set;#java.util.TreeMap.entrySet()Ljava/util/Set;
(assert (= ?r (mapping ?p0)))
;java.util.HashMap.getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
(assert (ite
    (= true (select (value ?p0) ?p1))
    (= ?r (select (mapping ?p0) ?p1))
    (= ?r ?p2)
))
;java.util.HashMap.putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
;java.util.HashMap.remove(Ljava/lang/Object;Ljava/lang/Object;)Z
(assert (ite
    (and
        (= true (select (key ?p0) ?p1))
        (= ?p2 (select (mapping ?p0) ?p1))
    )
    (and
        (forall (k ?K)
            (ite (= k ?p1)
                (= false (select (key ?_p0) k))
                (= (select (key ?_p0) k) (select (key ?p0) k))))
        (= (mapping ?_p0) (mapping ?p0))
    )
    (and
        (= (key ?_p0) (key ?p0))
        (= (mapping ?_p0) (mapping ?p0))
    )
))
;java.util.HashMap.replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z#java.util.TreeMap.replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
;java.util.HashMap.replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;#java.util.TreeMap.replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (= true (select (key ?p0) ?p1))
    (forall (k ?K)
        (ite (= k ?p1)
            (and
                (= true (select (key ?_p0) k))
                (= ?p2 (select (mapping ?_p0) ?p1))
            )
            (and
                (= (select (key ?_p0) k) (select (key ?p0) k))
                (= (select (mapping ?_p0) ?p1) (select (mapping ?p0) ?p1)))))
))
;java.util.HashMap.clone()Ljava/lang/Object;#java.util.TreeMap.clone()Ljava/lang/Object;#java.util.TreeMap.descendingMap()Ljava/util/NavigableMap;
(assert (and
    (= (key ?r) (key ?p0))
    (= (value ?r) (value ?p0))
    (= (mapping ?r) (mapping ?p0))
))
;java.util.TreeMap.firstKey()Ljava/lang/Object;
(assert (and
    (= true (select (key ?p0) ?r))
    (forall ((x ?K)) 
        (=> (= true (select (key ?p0) x)) (<= ?r x)))
))
;java.util.TreeMap.lastKey()Ljava/lang/Object;
(assert (and
    (= true (select (key ?p0) ?r))
    (forall ((x ?K)) 
        (=> (= true (select (key ?p0) x)) (>= ?r x)))
))
;java.util.TreeMap.firstEntry()Ljava/util/Map$Entry;
(assert (and
    (= true (select (key ?p0) (key ?r)))
    (forall ((x ?K)) 
        (=> (= true (select (key ?p0) x)) (<= (key ?r) x)))
    (= (value ?r) (select (mapping ?p0) (key ?r)))
))
;java.util.TreeMap.lastEntry()Ljava/util/Map$Entry;
(assert (and
    (= true (select (key ?p0) (key ?r)))
    (forall ((x ?K)) 
        (=> (= true (select (key ?p0) x)) (>= (key ?r) x)))
    (= (value ?r) (select (mapping ?p0) (key ?r)))
))
;java.util.TreeMap.pollFirstEntry()Ljava/util/Map$Entry;
(assert (and
    (= true (select (key ?p0) (key ?r)))
    (forall ((x ?K)) 
        (=> (= true (select (key ?p0) x)) (<= (key ?r) x)))
    (= (value ?r) (select (mapping ?p0) (key ?r)))
    (forall (k ?K)
        (ite (= k (key ?r))
            (= false (select (key ?_p0) k))
            (= (select (key ?_p0) k) (select (key ?p0) k))))
    (= (mapping ?_p0) (mapping ?p0))
))
;java.util.TreeMap.pollLastEntry()Ljava/util/Map$Entry;
(assert (and
    (= true (select (key ?p0) (key ?r)))
    (forall ((x ?K)) 
        (=> (= true (select (key ?p0) x)) (>= (key ?r) x)))
    (= (value ?r) (select (mapping ?p0) (key ?r)))
    (forall (k ?K)
        (ite (= k (key ?r))
            (= false (select (key ?_p0) k))
            (= (select (key ?_p0) k) (select (key ?p0) k))))
    (= (mapping ?_p0) (mapping ?p0))
))
;java.util.TreeMap.lowerEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
(assert (and
    (= true (select (key ?p0) (key ?r)))
    (forall ((x ?K)) 
        (=> (and (= true (select (key ?p0) x)) (< x ?p1)) (>= (key ?r) x)))
    (= (value ?r) (select (mapping ?p0) (key ?r)))
))
;java.util.TreeMap.lowerKey(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (= true (select (key ?p0) ?r))
    (forall ((x ?K)) 
        (=> (and (= true (select (key ?p0) x)) (< x ?p1)) (>= ?r x)))
))
;java.util.TreeMap.floorEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
(assert (and
    (= true (select (key ?p0) (key ?r)))
    (forall ((x ?K)) 
        (=> (and (= true (select (key ?p0) x)) (<= x ?p1)) (>= (key ?r) x)))
    (= (value ?r) (select (mapping ?p0) (key ?r)))
))
;java.util.TreeMap.floorKey(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (= true (select (key ?p0) ?r))
    (forall ((x ?K)) 
        (=> (and (= true (select (key ?p0) x)) (<= x ?p1)) (>= ?r x)))
))
;java.util.TreeMap.ceilingEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
(assert (and
    (= true (select (key ?p0) (key ?r)))
    (forall ((x ?K)) 
        (=> (and (= true (select (key ?p0) x)) (>= x ?p1)) (<= (key ?r) x)))
    (= (value ?r) (select (mapping ?p0) (key ?r)))
))
;java.util.TreeMap.ceilingKey(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (= true (select (key ?p0) ?r))
    (forall ((x ?K)) 
        (=> (and (= true (select (key ?p0) x)) (>= x ?p1)) (<= ?r x)))
))
;java.util.TreeMap.higherEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
(assert (and
    (= true (select (key ?p0) (key ?r)))
    (forall ((x ?K)) 
        (=> (and (= true (select (key ?p0) x)) (> x ?p1)) (<= (key ?r) x)))
    (= (value ?r) (select (mapping ?p0) (key ?r)))
))
;java.util.TreeMap.higherKey(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (= true (select (key ?p0) ?r))
    (forall ((x ?K)) 
        (=> (and (= true (select (key ?p0) x)) (> x ?p1)) (<= ?r x)))
))
;java.util.TreeMap.subMap(Ljava/lang/Object;ZLjava/lang/Object;Z)Ljava/util/NavigableMap;
(assert (and
    (forall ((x ?K))
        (ite 
            (and (ite ?p2 (>= x ?p1) (> x ?p1)) (ite ?p4 (<= x ?p3) (< x ?p3)))
            (= (select (key ?r) x) (select (key ?p0) x))
            (= (select (key ?r) x) false)
        ))
    (= (mapping ?r) (mapping ?p0))
))
;java.util.TreeMap.headMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;
(assert (and
    (forall ((x ?K))
        (ite 
            (ite ?p2 (<= x ?p1) (< x ?p1))
            (= (select (key ?r) x) (select (key ?p0) x))
            (= (select (key ?r) x) false)
        ))
    (= (mapping ?r) (mapping ?p0))
))
;java.util.TreeMap.tailMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;
(assert (and
    (forall ((x ?K))
        (ite 
            (ite ?p2 (>= x ?p1) (> x ?p1))
            (= (select (key ?r) x) (select (key ?p0) x))
            (= (select (key ?r) x) false)
        ))
    (= (mapping ?r) (mapping ?p0))
))
;java.util.TreeMap.subMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedMap;
(assert (and
    (forall ((x ?K))
        (ite 
            (and (>= x ?p1) (< x ?p2))
            (= (select (key ?r) x) (select (key ?p0) x))
            (= (select (key ?r) x) false)
        ))
    (= (mapping ?r) (mapping ?p0))
))
;java.util.TreeMap.headMap(Ljava/lang/Object;)Ljava/util/SortedMap;
(assert (and
    (forall ((x ?K))
        (ite 
            (< x ?p1)
            (= (select (key ?r) x) (select (key ?p0) x))
            (= (select (key ?r) x) false)
        ))
    (= (mapping ?r) (mapping ?p0))
))
;java.util.TreeMap.tailMap(Ljava/lang/Object;)Ljava/util/SortedMap;
(assert (and
    (forall ((x ?K))
        (ite 
            (>= x ?p1)
            (= (select (key ?r) x) (select (key ?p0) x))
            (= (select (key ?r) x) false)
        ))
    (= (mapping ?r) (mapping ?p0))
))
;java.util.Map$Entry.getKey()Ljava/lang/Object;
(assert (= ?r (key ?p0)))
;java.util.Map$Entry.getValue()Ljava/lang/Object;
(assert (= ?r (value ?p0)))
;java.util.Map$Entry.setValue(Ljava/lang/Object;)Ljava/lang/Object;
(assert (= ?r (key ?p0)))
(assert (= (value ?_p0) ?p1))
;END
