;Data Structure
(declare-datatypes (T) (
    (Set (mk-pair (mapping (Array T Bool))))
    (List (mk-pair (mapping (Array T Bool)) (element (Seq T))))
    (Iterator (mk-pair (mapping (Array T Bool)) (previous (Array T Bool))))
    (ListIterator (mk-pair (position Int) (element (Seq T))))
))
(declare-datatypes (K V) (
    (Entry (mk-pair (key K) (value V)))
    (Map (mk-pair (key (Array K Bool)) (mapping (Array K V))))
))
(declare-datatypes () (
    (FileInputStream (mk-pair (length Int) (readPosition Int) (isOpen Bool)))
))
;START
;java.util.Collection.size()I
;java.util.Set.size()I
;java.util.HashSet.size()I
;java.util.TreeSet.size()I
(assert (ite 
    (= (mapping ?p0) ((as const (Array ?T Bool)) false)) 
    (= ?r 0)
    (> ?r 0)
))
;java.util.Collection.isEmpty()Z
;java.util.Set.isEmpty()Z
;java.util.HashSet.isEmpty()Z
;java.util.TreeSet.isEmpty()Z
(assert (= ?r 
    (ite (= (mapping ?p0) ((as const (Array ?T Bool)) false)) 1 0)
))
;java.util.Collection.contains(Ljava/lang/Object;)Z
;java.util.Set.contains(Ljava/lang/Object;)Z
;java.util.HashSet.contains(Ljava/lang/Object;)Z
;java.util.TreeSet.contains(Ljava/lang/Object;)Z
(assert (= ?r 
    (ite (select (mapping ?p0) ?p1) 1 0)
))
;java.util.Collection.iterator()Ljava/util/Iterator;
;java.util.List.iterator()Ljava/util/Iterator;
;java.util.ArrayList.iterator()Ljava/util/Iterator;
;java.util.Set.iterator()Ljava/util/Iterator;
;java.util.HashSet.iterator()Ljava/util/Iterator;
;java.util.TreeSet.iterator()Ljava/util/Iterator;
(assert (and
    (= (mapping ?r) (mapping ?p0))
    (= (previous ?r) ((as const (Array ?T Bool)) false))
))
;java.util.Collection.add(Ljava/lang/Object;)Z
;java.util.Set.add(Ljava/lang/Object;)Z
;java.util.HashSet.add(Ljava/lang/Object;)Z
;java.util.TreeSet.add(Ljava/lang/Object;)Z
(assert (ite 
    (= true (select (mapping ?p0) ?p1))
    (and (= ?r 0) (= (mapping ?_p0) (mapping ?p0)))
    (and (= ?r 1)
        (forall ((x ?T))
            (ite (= x ?p1)
                (= (select (mapping ?_p0) x) true)
                (= (select (mapping ?_p0) x) (select (mapping ?p0) x))
            )
        )
    )
))
;java.util.Collection.remove(Ljava/lang/Object;)Z
;java.util.Set.remove(Ljava/lang/Object;)Z
;java.util.HashSet.remove(Ljava/lang/Object;)Z
;java.util.TreeSet.remove(Ljava/lang/Object;)Z
(assert (ite 
    (= true (select (mapping ?p0) ?p1))
    (and (= ?r 1)
        (forall ((x ?T))
            (ite (= x ?p1)
                (= (select (mapping ?_p0) x) false)
                (= (select (mapping ?_p0) x) (select (mapping ?p0) x))
            )
        )
    )
    (and (= ?r 0) (= (mapping ?_p0) (mapping ?p0)))
))
;java.util.Collection.containsAll(Ljava/util/Collection;)Z
;java.util.Set.containsAll(Ljava/util/Collection;)Z
;java.util.List.containsAll(Ljava/util/Collection;)Z
(assert (= ?r 
    (ite (forall ((x T))
        (=> 
            (= true (select (mapping ?p1) x))
            (= true (select (mapping ?p0) x))
        )
    ) 1 0)
))
;java.util.Collection.addAll(Ljava/util/Collection;)Z
;java.util.Set.addAll(Ljava/util/Collection;)Z
;java.util.TreeSet.addAll(Ljava/util/Collection;)Z
(assert (= (mapping ?_p0) ((_ map or) (mapping ?p0) (mapping ?p1))))
;java.util.Collection.removeAll(Ljava/util/Collection;)Z
;java.util.Set.removeAll(Ljava/util/Collection;)Z
;java.util.List.removeAll(Ljava/util/Collection;)Z
;java.util.ArrayList.removeAll(Ljava/util/Collection;)Z
(assert (= (mapping ?_p0) ((_ map and) (mapping ?p0) ((_ map not) (mapping ?p1)))))
;java.util.Collection.retainAll(Ljava/util/Collection;)Z
;java.util.Set.retainAll(Ljava/util/Collection;)Z
;java.util.List.retainAll(Ljava/util/Collection;)Z
;java.util.ArrayList.retainAll(Ljava/util/Collection;)Z
(assert (= (mapping ?_p0) ((_ map and) (mapping ?p0) (mapping ?p1))))
;java.util.Collection.clear()V
;java.util.Set.clear()V
;java.util.HashSet.clear()V
;java.util.TreeSet.clear()V
(assert (= (mapping ?_p0) ((as const (Array ?T Bool)) false)))
;java.util.HashSet.<init>()V
;java.util.HashSet.<init>(IF)V
;java.util.HashSet.<init>(I)V
;java.util.TreeSet.<init>()V
(assert (= (mapping ?_p0) ((as const (Array ?T Bool)) false)))
;java.util.HashSet.<init>(Ljava/util/Collection;)V
;java.util.TreeSet.<init>(Ljava/util/Collection;)V
;java.util.TreeSet.<init>(Ljava/util/SortedSet;)V
(assert (= (mapping ?_p0) (mapping ?p1)))
;java.util.HashSet.clone()Ljava/lang/Object;
;java.util.TreeSet.clone()Ljava/lang/Object;
;java.util.NavigableSet.descendingSet()Ljava/util/NavigableSet;
;java.util.TreeSet.descendingSet()Ljava/util/NavigableSet;
(assert (= (mapping ?r) (mapping ?p0)))
;java.util.NavigableSet.subSet(Ljava/lang/Object;ZLjava/lang/Object;Z)Ljava/util/NavigableSet;
;java.util.TreeSet.subSet(Ljava/lang/Object;ZLjava/lang/Object;Z)Ljava/util/NavigableSet;
(assert (forall ((x ?T))
    (ite 
        (and (ite ?p2 (>= x ?p1) (> x ?p1)) (ite ?p4 (<= x ?p3) (< x ?p3)))
        (= (select (mapping ?r) x) (select (mapping ?p0) x))
        (= (select (mapping ?r) x) false)
    )
))
;java.util.NavigableSet.headSet(Ljava/lang/Object;Z)Ljava/util/NavigableSet;
;java.util.TreeSet.headSet(Ljava/lang/Object;Z)Ljava/util/NavigableSet;
(assert (forall ((x ?T))
    (ite 
        (ite ?p2 (<= x ?p1) (< x ?p1))
        (= (select (mapping ?r) x) (select (mapping ?p0) x))
        (= (select (mapping ?r) x) false)
    )
))
;java.util.NavigableSet.tailSet(Ljava/lang/Object;Z)Ljava/util/NavigableSet;
;java.util.TreeSet.tailSet(Ljava/lang/Object;Z)Ljava/util/NavigableSet;
(assert (forall ((x ?T))
    (ite 
        (ite ?p2 (>= x ?p1) (> x ?p1))
        (= (select (mapping ?r) x) (select (mapping ?p0) x))
        (= (select (mapping ?r) x) false)
    )
))
;java.util.NavigableSet.subSet(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedSet;
;java.util.SortedSet.subSet(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedSet;
;java.util.TreeSet.subSet(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedSet;
(assert (forall ((x ?T))
    (ite 
        (and (>= x ?p1) (< x ?p2))
        (= (select (mapping ?r) x) (select (mapping ?p0) x))
        (= (select (mapping ?r) x) false)
    )
))
;java.util.NavigableSet.headSet(Ljava/lang/Object;)Ljava/util/SortedSet;
;java.util.SortedSet.headSet(Ljava/lang/Object;)Ljava/util/SortedSet;
;java.util.TreeSet.headSet(Ljava/lang/Object;)Ljava/util/SortedSet;
(assert (forall ((x ?T))
    (ite 
        (< x ?p1)
        (= (select (mapping ?r) x) (select (mapping ?p0) x))
        (= (select (mapping ?r) x) false)
    )
))
;java.util.NavigableSet.tailSet(Ljava/lang/Object;)Ljava/util/SortedSet;
;java.util.SortedSet.tailSet(Ljava/lang/Object;)Ljava/util/SortedSet;
;java.util.TreeSet.tailSet(Ljava/lang/Object;)Ljava/util/SortedSet;
(assert (forall ((x ?T))
    (ite 
        (>= x ?p1)
        (= (select (mapping ?r) x) (select (mapping ?p0) x))
        (= (select (mapping ?r) x) false)
    )
))
;java.util.SortedSet.first()Ljava/lang/Object;
;java.util.TreeSet.first()Ljava/lang/Object;
(assert (and
    (= true (select (mapping ?p0) ?r))
    (forall ((x ?T)) 
        (=> (= true (select (mapping ?p0) x)) (<= ?r x))
    )
))
;java.util.SortedSet.last()Ljava/lang/Object;
;java.util.TreeSet.last()Ljava/lang/Object;
(assert (and
    (= true (select (mapping ?p0) ?r))
    (forall ((x ?T)) 
        (=> (= true (select (mapping ?p0) x)) (>= ?r x))
    )
))
;java.util.NavigableSet.lower(Ljava/lang/Object;)Ljava/lang/Object;
;java.util.TreeSet.lower(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (= true (select (mapping ?p0) ?r))
    (forall ((x ?T)) 
        (=> (and (= true (select (mapping ?p0) x)) (< x ?p1)) (>= ?r x))
    )
))
;java.util.NavigableSet.floor(Ljava/lang/Object;)Ljava/lang/Object;
;java.util.TreeSet.floor(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (= true (select (mapping ?p0) ?r))
    (forall ((x ?T)) 
        (=> (and (= true (select (mapping ?p0) x)) (<= x ?p1)) (>= ?r x))
    )
))
;java.util.NavigableSet.ceiling(Ljava/lang/Object;)Ljava/lang/Object;
;java.util.TreeSet.ceiling(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (= true (select (mapping ?p0) ?r))
    (forall ((x ?T)) 
        (=> (and (= true (select (mapping ?p0) x)) (>= x ?p1)) (<= ?r x))
    )
))
;java.util.NavigableSet.higher(Ljava/lang/Object;)Ljava/lang/Object;
;java.util.TreeSet.higher(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (= true (select (mapping ?p0) ?r))
    (forall ((x ?T)) 
        (=> (and (= true (select (mapping ?p0) x)) (> x ?p1)) (<= ?r x))
    )
))
;java.util.NavigableSet.pollFirst()Ljava/lang/Object;
;java.util.TreeSet.pollFirst()Ljava/lang/Object;
(assert (and
    (= true (select (mapping ?p0) ?r))
    (forall ((x ?T)) 
        (=> (= true (select (mapping ?p0) x)) (<= ?r x))
    )
    (forall ((x ?T))
        (ite (= x ?r)
            (= (select (mapping ?_p0) x) false)
            (= (select (mapping ?_p0) x) (select (mapping ?p0) x))
        )
    )
))
;java.util.NavigableSet.pollLast()Ljava/lang/Object;
;java.util.TreeSet.pollLast()Ljava/lang/Object;
(assert (and
    (= true (select (mapping ?p0) ?r))
    (forall ((x ?T)) 
        (=> (= true (select (mapping ?p0) x)) (>= ?r x))
    )
    (forall ((x ?T))
        (ite (= x ?r)
            (= (select (mapping ?_p0) x) false)
            (= (select (mapping ?_p0) x) (select (mapping ?p0) x))
        )
    )
))
;java.util.List.size()I
;java.util.ArrayList.size()I
;java.util.LinkedList.size()I
(assert (and
    (= ?r (seq.len (element ?p0)))
    (let ((clause (= (mapping ?p0) ((as const (Array ?T Bool)) false))))
        (ite (= ?r 0) clause (not clause))
    )
))
;java.util.List.isEmpty()Z
;java.util.ArrayList.isEmpty()Z
(assert (= ?r 
    (ite (= (seq.len (element ?p0)) 0) 1 0)
))
;java.util.List.contains(Ljava/lang/Object;)Z
;java.util.ArrayList.contains(Ljava/lang/Object;)Z
;java.util.LinkedList.contains(Ljava/lang/Object;)Z
(assert (= ?r 
    (ite (seq.contains (element ?p0) (seq.unit ?p1)) 1 0)
))
;java.util.List.listIterator()Ljava/util/ListIterator;
;java.util.ArrayList.listIterator()Ljava/util/ListIterator;
(assert (and
    (= (position ?r) -1)
    (= (element ?r) (element ?p0))
))
;java.util.List.listIterator(I)Ljava/util/ListIterator;
;java.util.ArrayList.listIterator(I)Ljava/util/ListIterator;
;java.util.LinkedList.listIterator(I)Ljava/util/ListIterator;
(assert (and
    (= (position ?r) ?p1)
    (= (element ?r) (element ?p0))
))
;java.util.List.toArray()[Ljava/lang/Object;
;java.util.ArrayList.toArray()[Ljava/lang/Object;
;java.util.LinkedList.toArray()[Ljava/lang/Object;
;java.util.List.toArray([Ljava/lang/Object;)[Ljava/lang/Object;
;java.util.ArrayList.toArray([Ljava/lang/Object;)[Ljava/lang/Object;
;java.util.LinkedList.toArray([Ljava/lang/Object;)[Ljava/lang/Object;
;java.util.ArrayList.clone()Ljava/lang/Object;
;java.util.LinkedList.clone()Ljava/lang/Object;
(assert (and 
    (= (element ?r) (element ?p0))
    (= (mapping ?r) (mapping ?p0))
))
;java.util.List.add(Ljava/lang/Object;)Z
;java.util.ArrayList.add(Ljava/lang/Object;)Z
;java.util.LinkedList.add(Ljava/lang/Object;)Z
;java.util.LinkedList.offer(Ljava/lang/Object;)Z
;java.util.LinkedList.offerLast(Ljava/lang/Object;)Z
(assert (= ?r 1))
(assert (= (element ?_p0) (seq.++ (element ?p0) (seq.unit ?p1))))
(assert (forall ((x ?T))
    (ite (= x ?p1)
        (= (select (mapping ?_p0) x) true)
        (= (select (mapping ?_p0) x) (select (mapping ?p0) x))
    )
))
;java.util.List.remove(Ljava/lang/Object;)Z
;java.util.ArrayList.remove(Ljava/lang/Object;)Z
;java.util.LinkedList.remove(Ljava/lang/Object;)Z
;java.util.LinkedList.removeFirstOccurrence(Ljava/lang/Object;)Z
(assert (ite
    (seq.contains (element ?p0) (seq.unit ?p1))
    (and 
        (= ?r 1)
        (let ((size (seq.len (element ?p0))) (idx (seq.indexof (element ?p0) ?p1)))
            (= (element ?_p0) (seq.++
                (seq.extract (element ?p0) 0 idx)
                (seq.extract (element ?p0) (+ idx 1) (- (- size idx) 1))
            ))
        )
    )
    (and
        (= ?r 0)
        (= (element ?_p0) (element ?p0))
        (= (mapping ?_p0) (mapping ?p0))
    )
))
    ;(assert (ite 
    ;    (seq.contains (element ?_p0) (seq.unit ?p1)) 
    ;    (= (mapping ?_p0) (mapping ?p0))
    ;    (forall ((x ?T))
    ;        (ite (= x ?p1)
    ;            (= (select (mapping ?_p0) x) false)
    ;            (= (select (mapping ?_p0) x) (select (mapping ?p0) x))
    ;        )
    ;    )
    ;))
;java.util.List.addAll(Ljava/util/Collection;)Z
;java.util.ArrayList.addAll(Ljava/util/Collection;)Z
;java.util.LinkedList.addAll(Ljava/util/Collection;)Z
(assert (= (element ?_p0) (seq.++ (element ?p0) ?p1)))
(assert (= (mapping ?_p0) ((_ map or) (mapping ?p0) (mapping ?p1))))
;java.util.List.addAll(ILjava/util/Collection;)Z
;java.util.ArrayList.addAll(ILjava/util/Collection;)Z
;java.util.LinkedList.addAll(ILjava/util/Collection;)Z
(assert (let ((size (seq.len (element ?p0))))
    (= (element ?_p0) (seq.++
        (seq.extract (element ?p0) 0 ?p1)
        (element ?p2)
        (seq.extract (element ?p0) ?p1 (- size ?p1))
    ))
))
(assert (= (mapping ?_p0) ((_ map or) (mapping ?p0) (mapping ?p1))))
;java.util.List.clear()V
;java.util.ArrayList.clear()V
;java.util.LinkedList.clear()V
;java.util.ArrayList.<init>()V
;java.util.LinkedList.<init>()V
(assert (and
    (= (element ?_p0) (as seq.empty (Seq ?T)))
    (= (mapping ?_p0) ((as const (Array ?T Bool)) false))
))
;java.util.ArrayList.<init>(I)V
(assert (and
    (= (seq.len (element ?_p0)) ?p1)
    (= (mapping ?_p0) ((as const (Array ?T Bool)) false))
))
;java.util.List.get(I)Ljava/lang/Object;
;java.util.ArrayList.get(I)Ljava/lang/Object;
;java.util.LinkedList.get(I)Ljava/lang/Object;
(assert (and
    (>= ?p1 0) (< ?p1 (seq.len (element ?p0)))
    (= (seq.unit ?r) (seq.at (element ?p0) ?p1))
))
;java.util.List.set(ILjava/lang/Object;)Ljava/lang/Object;
;java.util.ArrayList.set(ILjava/lang/Object;)Ljava/lang/Object;
;java.util.LinkedList.set(ILjava/lang/Object;)Ljava/lang/Object;
(assert (let ((size (seq.len (element ?p0))))
    (and
        (>= ?p1 0) (< ?p1 size)
        (= (seq.unit ?r) (seq.at (element ?p0) ?p1))
        (= (element ?_p0) (seq.++ 
            (seq.extract (element ?p0) 0 ?p1)
            (seq.unit ?p2)
            (seq.extract (element ?p0) (+ ?p1 1) (- (- size ?p1) 1))
        ))
    )
))
    ;(assert (ite 
    ;    (seq.contains (element ?_p0) (seq.unit ?r))
    ;    (forall ((x ?T))
    ;        (ite (= x ?p2)
    ;            (= (select (mapping ?_p0) x) true)
    ;            (= (select (mapping ?_p0) x) (select (mapping ?p0) x))
    ;        )
    ;    )
    ;    (forall ((x ?T))
    ;        (ite (= x ?p2)
    ;           (= (select (mapping ?_p0) x) true)
    ;           (ite (= x ?r)
    ;                (= (select (mapping ?_p0) x) false)
    ;                (= (select (mapping ?_p0) x) (select (mapping ?p0) x))
    ;            )
    ;        )
    ;    )
    ;))
;java.util.List.add(ILjava/lang/Object;)V
;java.util.ArrayList.add(ILjava/lang/Object;)V
;java.util.LinkedList.add(ILjava/lang/Object;)V
(assert (let ((size (seq.len (element ?p0))))
    (and
        (>= ?p1 0) (<= ?p1 size)
        (= (element ?_p0) 
            (seq.++ 
                (seq.extract (element ?p0) 0 ?p1)
                (seq.unit ?p2)
                (seq.extract (element ?p0) ?p1 (- size ?p1))
            )
        )
    )
))
(assert (forall ((x ?T))
    (ite (= x ?p2)
        (= (select (mapping ?_p0) x) true)
        (= (select (mapping ?_p0) x) (select (mapping ?p0) x))
    )
))
;java.util.List.remove(I)Ljava/lang/Object;
;java.util.ArrayList.remove(I)Ljava/lang/Object;
;java.util.LinkedList.remove(I)Ljava/lang/Object;
(assert (let ((size (seq.len (element ?p0))))
    (and
        (>= ?p1 0) (< ?p1 size)
        (= (seq.unit ?r) (seq.at (element ?p0) ?p1))
        (= (element ?_p0) 
            (seq.++ 
                (seq.extract (element ?p0) 0 ?p1)
                (seq.extract (element ?p0) (+ ?p1 1) (- (- size ?p1) 1))
            )
        )
    )
))
    ;(assert (ite 
    ;    (seq.contains (element ?_p0) (seq.unit ?r)) 
    ;    (= (mapping ?_p0) (mapping ?p0))
    ;    (forall ((x ?T))
    ;        (ite (= x ?r)
    ;            (= (select (mapping ?_p0) x) false)
    ;            (= (select (mapping ?_p0) x) (select (mapping ?p0) x))
    ;        )
    ;    )
    ;))
;java.util.List.indexOf(Ljava/lang/Object;)I
;java.util.ArrayList.indexOf(Ljava/lang/Object;)I
;java.util.LinkedList.indexOf(Ljava/lang/Object;)I
(assert (= ?r (seq.indexof (element ?p0) (seq.unit ?p1))))
;java.util.List.lastIndexOf(Ljava/lang/Object;)I
;java.util.ArrayList.lastIndexOf(Ljava/lang/Object;)I
;java.util.LinkedList.lastIndexOf(Ljava/lang/Object;)I
(assert (= ?r (seq.indexof (element ?p0) (seq.unit ?p1) ?r)))
;java.util.List.subList(II)Ljava/util/List;
;java.util.ArrayList.subList(II)Ljava/util/List;
    ; The returned list is backed by this list, so non-structural changes in the returned list are reflected in this list
(assert (and 
    (>= ?p1 0) (>= ?p2 ?p1) (< ?p2 (seq.len (element ?p0)))
    (= (element ?r) (seq.extract (element ?p0) ?p1 (- ?p2 ?p1)))
))
;java.util.ArrayList.<init>(Ljava/util/Collection;)V
;java.util.LinkedList.<init>(Ljava/util/Collection;)V
(assert (and 
    (= (element ?_p0) (element ?p1))
    (= (mapping ?_p0) (mapping ?p1))
))
;java.util.ArrayList.removeRange(II)V
(assert (let ((size (seq.len (element ?p0))))
    (= (element ?_p0) 
        (seq.++
            (seq.extract (element ?p0) 0 ?p1)
            (seq.extract (element ?p0) ?p2 (- size ?p2))
        )
    )
))
;java.util.LinkedList.getFirst()Ljava/lang/Object;
;java.util.LinkedList.peek()Ljava/lang/Object;
;java.util.LinkedList.element()Ljava/lang/Object;
;java.util.LinkedList.peekFirst()Ljava/lang/Object;
(assert (= (seq.unit ?r) (seq.at (element ?_p0) 0)))
;java.util.LinkedList.getLast()Ljava/lang/Object;
;java.util.LinkedList.peekLast()Ljava/lang/Object;
(assert (= (seq.unit ?r) (seq.at (element ?_p0) (- (seq.len (element ?p0)) 1))))
;java.util.LinkedList.removeFirst()Ljava/lang/Object;
;java.util.LinkedList.poll()Ljava/lang/Object;
;java.util.LinkedList.remove()Ljava/lang/Object;
;java.util.LinkedList.pollFirst()Ljava/lang/Object;
;java.util.LinkedList.pop()Ljava/lang/Object;
(assert (= (seq.unit ?r) (seq.at (element ?_p0) 0)))
(assert (= (element ?_p0) (seq.extract (element ?p0) 1 (- (seq.len (element ?p0)) 1))))
    ;(assert (ite 
    ;    (seq.contains (element ?_p0) (seq.unit ?r)) 
    ;    (= (mapping ?_p0) (mapping ?p0))
    ;    (forall ((x ?T))
    ;        (ite (= x ?r)
    ;            (= (select (mapping ?_p0) x) false)
    ;            (= (select (mapping ?_p0) x) (select (mapping ?p0) x))
    ;        )
    ;    )
    ;))
;java.util.LinkedList.removeLast()Ljava/lang/Object;
;java.util.LinkedList.pollLast()Ljava/lang/Object;
(assert (= (seq.unit ?r) (seq.at (element ?_p0) (- (seq.len (element ?p0)) 1))))
(assert (= (element ?_p0) (seq.extract (element ?p0) 0 (- (seq.len (element ?p0)) 1))))
    ;(assert (ite 
    ;    (seq.contains (element ?_p0) (seq.unit ?r)) 
    ;    (= (mapping ?_p0) (mapping ?p0))
    ;    (forall ((x ?T))
    ;        (ite (= x ?r)
    ;            (= (select (mapping ?_p0) x) false)
    ;            (= (select (mapping ?_p0) x) (select (mapping ?p0) x))
    ;        )
    ;    )
    ;))
;java.util.LinkedList.addFirst(Ljava/lang/Object;)V
;java.util.LinkedList.push(Ljava/lang/Object;)V
(assert (= (element ?_p0) (seq.++ (seq.unit ?p1) (element ?p0))))
(assert (forall ((x ?T))
    (ite (= x ?p1)
        (= (select (mapping ?_p0) x) true)
        (= (select (mapping ?_p0) x) (select (mapping ?p0) x))
    )
))
;java.util.LinkedList.addLast(Ljava/lang/Object;)V
(assert (= (element ?_p0) (seq.++ (element ?p0) (seq.unit ?p1))))
(assert (forall ((x ?T))
    (ite (= x ?p1)
        (= (select (mapping ?_p0) x) true)
        (= (select (mapping ?_p0) x) (select (mapping ?p0) x))
    )
))
;java.util.LinkedList.offerFirst(Ljava/lang/Object;)Z
(assert (= ?r 1))
(assert (= (element ?_p0) (seq.++ (seq.unit ?p1) (element ?p0))))
(assert (forall ((x ?T))
    (ite (= x ?p1)
        (= (select (mapping ?_p0) x) true)
        (= (select (mapping ?_p0) x) (select (mapping ?p0) x))
    )
))
;java.util.LinkedList.removeLastOccurrence(Ljava/lang/Object;)Z
(assert (ite
    (seq.contains (element ?p0) (seq.unit ?p1))
    (and 
        (= ?r 1)
        (let ((size (seq.len (element ?p0)))(idx (seq.indexof (element ?p0) ?p1 idx)))
            (= (element ?_p0) (seq.++
                (seq.extract (element ?p0) 0 idx)
                (seq.extract (element ?p0) (+ idx 1) (- (- size idx) 1))
            ))
        )
    )
    (and
        (= ?r 0)
        (= (element ?_p0) (element ?p0))
        (= (mapping ?_p0) (mapping ?p0))
    )
))
    ;(assert (ite 
    ;    (seq.contains (element ?_p0) (seq.unit ?p1)) 
    ;    (= (mapping ?_p0) (mapping ?p0))
    ;    (forall ((x ?T))
    ;        (ite (= x ?p1)
    ;            (= (select (mapping ?_p0) x) false)
    ;            (= (select (mapping ?_p0) x) (select (mapping ?p0) x))
    ;        )
    ;    )
    ;))
;java.util.Map.size()I
;java.util.HashMap.size()I
;java.util.TreeMap.size()I
(assert (ite 
    (forall ((k ?K)) (= (select (key ?p0) k) false))
    (= ?r 0) 
    (> ?r 0)
))
;java.util.Map.isEmpty()Z
;java.util.HashMap.isEmpty()Z
(assert (= ?r 
    (ite (forall ((k ?K)) (= (select (key ?p0) k) false)) 1 0)
))
;java.util.Map.containsKey(Ljava/lang/Object;)Z
;java.util.HashMap.containsKey(Ljava/lang/Object;)Z
;java.util.TreeMap.containsKey(Ljava/lang/Object;)Z
(assert (= ?r
    (ite (= true (select (key ?p0) ?p1)) 1 0)
))
;java.util.Map.containsValue(Ljava/lang/Object;)Z
;java.util.HashMap.containsValue(Ljava/lang/Object;)Z
;java.util.TreeMap.containsValue(Ljava/lang/Object;)Z
(assert (= ?r 
    (ite (exists ((k ?K)) 
        (and
            (= true (select (key ?p0) k))
            (= ?p1 (select (mapping ?p0) k))
        ) 
    ) 1 0)
)))
;java.util.Map.get(Ljava/lang/Object;)Ljava/lang/Object;
;java.util.HashMap.get(Ljava/lang/Object;)Ljava/lang/Object;
;java.util.TreeMap.get(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (= true (select (key ?p0) ?p1))
    (= ?r (select (mapping ?p0) ?p1))
))
;java.util.Map.put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
;java.util.HashMap.put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
;java.util.TreeMap.put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (= (select (mapping ?p0) ?p1) ?r)
    (= (select (mapping ?_p0) ?p1) ?p2)
    (forall ((k ?K)) (or (= k ?p1) (= (select (mapping ?_p0) k) (select (mapping ?p0) k))))
    (= (select (key ?_p0) ?p1) true)
    (forall ((k ?K)) (or (= k ?p1) (= (select (key ?_p0) k) (select (key ?p0) k))))
))
;java.util.Map.remove(Ljava/lang/Object;)Ljava/lang/Object;
;java.util.HashMap.remove(Ljava/lang/Object;)Ljava/lang/Object;
;java.util.TreeMap.remove(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (= true (select (key ?p0) ?p1))
    (= (select (key ?_p0) ?p1) false)
    (forall ((k ?K)) (or (= k ?p1) (= (select (key ?_p0) k) (select (key ?p0) k))))
    (= (mapping ?_p0) (mapping ?p0))
))
;java.util.Map.putAll(Ljava/util/Map;)V
;java.util.HashMap.putAll(Ljava/util/Map;)V
;java.util.TreeMap.putAll(Ljava/util/Map;)V
    ;maybe timeout
(assert (forall ((k ?K))
    (ite (= true (select (key ?p1) k))
        (and 
            (= (select (key ?_p0) k) true)
            (= (select (mapping ?_p0) k) (select (mapping ?p1) k))
        )
        (and
            (= (select (key ?_p0) k) (select (key ?p0) k))
            (= (select (mapping ?_p0) k) (select (mapping ?p0) k))
        )
    )
))
;java.util.Map.clear()V
;java.util.HashMap.clear()V
;java.util.TreeMap.clear()V
;java.util.HashMap.<init>(IF)V
;java.util.HashMap.<init>(I)V
;java.util.HashMap.<init>()V
;java.util.TreeMap.<init>()V
(assert (forall ((k ?K)) (= (select (key ?p0) k) false)))
;java.util.Map.keySet()Ljava/util/Set;
;java.util.HashMap.keySet()Ljava/util/Set;
;java.util.SortedMap.keySet()Ljava/util/Set;
;java.util.TreeMap.keySet()Ljava/util/Set;
;java.util.NavigableMap.descendingKeySet()Ljava/util/NavigableSet;
;java.util.TreeMap.descendingKeySet()Ljava/util/NavigableSet;
;java.util.NavigableMap.navigableKeySet()Ljava/util/NavigableSet;
;java.util.TreeMap.navigableKeySet()Ljava/util/NavigableSet;
(assert (= ?r (key ?p0)))
;java.util.Map.values()Ljava/util/Collection;
;java.util.HashMap.values()Ljava/util/Collection;
;java.util.SortedMap.values()Ljava/util/Collection;
;java.util.TreeMap.values()Ljava/util/Collection;
(assert (and 
    (forall ((k ?K)) 
        (=> (= true (select (key ?p0) k))
            (= true (select (mapping ?r) (select (mapping ?p0) k)))
        )
    )
))
;java.util.Map.entrySet()Ljava/util/Set;
;java.util.HashMap.entrySet()Ljava/util/Set;
;java.util.SortedMap.entrySet()Ljava/util/Set;
;java.util.TreeMap.entrySet()Ljava/util/Set;
(assert (and 
    (forall ((k ?K)) 
        (=> 
            (= true (select (key ?p0) k))
            (= true (select (mapping ?r) k (select (mapping ?p0) k)))
        )
    )
))
;java.util.Map.getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
;java.util.HashMap.getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
(assert (ite
    (= true (select (value ?p0) ?p1))
    (= ?r (select (mapping ?p0) ?p1))
    (= ?r ?p2)
))
;java.util.Map.remove(Ljava/lang/Object;Ljava/lang/Object;)Z
;java.util.HashMap.remove(Ljava/lang/Object;Ljava/lang/Object;)Z
(assert (ite
    (and
        (= true (select (key ?p0) ?p1))
        (= ?p2 (select (mapping ?p0) ?p1))
    )
    (and
        (= (select (key ?_p0) ?p1) false)
        (forall ((k ?K)) (or (= k ?p1) (= (select (key ?_p0) k) (select (key ?p0) k))))
        (= (mapping ?_p0) (mapping ?p0))
    )
    (and
        (= (key ?_p0) (key ?p0))
        (= (mapping ?_p0) (mapping ?p0))
    )
))
;java.util.Map.replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
;java.util.HashMap.replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
;java.util.TreeMap.replace(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (= true (select (key ?p0) ?p1))
    (= ?r (select (mapping ?p0) ?p1))
    (= (select (mapping ?_p0) ?p1) ?p2)
    (forall ((k ?K)) (or (= k ?p1) (= (select (mapping ?_p0) k) (select (mapping ?p0) k))))
    (= (select (key ?_p0) ?p1) true)
    (forall ((k ?K)) (or (= k ?p1) (= (select (key ?_p0) k) (select (key ?p0) k))))
))
;java.util.HashMap.clone()Ljava/lang/Object;
;java.util.TreeMap.clone()Ljava/lang/Object;
;java.util.NavigableMap.descendingMap()Ljava/util/NavigableMap;
;java.util.TreeMap.descendingMap()Ljava/util/NavigableMap;
(assert (and
    (= (key ?r) (key ?p0))
    (= (mapping ?r) (mapping ?p0))
))
;java.util.HashMap.<init>(Ljava/util/Map;)V
;java.util.TreeMap.<init>(Ljava/util/Map;)V
;java.util.TreeMap.<init>(Ljava/util/SortedMap;)V
(assert (and 
    (= (key ?_p0) (key ?p1))
    (= (mapping ?_p0) (mapping ?p1))
))
;java.util.SortedMap.firstKey()Ljava/lang/Object;
;java.util.TreeMap.firstKey()Ljava/lang/Object;
(assert (and
    (= true (select (key ?p0) ?r))
    (forall ((x ?K)) 
        (=> (= true (select (key ?p0) x)) (<= ?r x))
    )
))
;java.util.SortedMap.lastKey()Ljava/lang/Object;
;java.util.TreeMap.lastKey()Ljava/lang/Object;
(assert (and
    (= true (select (key ?p0) ?r))
    (forall ((x ?K)) 
        (=> (= true (select (key ?p0) x)) (>= ?r x))
    )
))
;java.util.NavigableMap.firstEntry()Ljava/util/Map$Entry;
;java.util.TreeMap.firstEntry()Ljava/util/Map$Entry;
(assert (and
    (= true (select (key ?p0) (key ?r)))
    (forall ((x ?K)) 
        (=> (= true (select (key ?p0) x)) (<= (key ?r) x))
    )
    (= (value ?r) (select (mapping ?p0) (key ?r)))
))
;java.util.NavigableMap.lastEntry()Ljava/util/Map$Entry;
;java.util.TreeMap.lastEntry()Ljava/util/Map$Entry;
(assert (and
    (= true (select (key ?p0) (key ?r)))
    (forall ((x ?K)) 
        (=> (= true (select (key ?p0) x)) (>= (key ?r) x))
    )
    (= (value ?r) (select (mapping ?p0) (key ?r)))
))
;java.util.NavigableMap.pollFirstEntry()Ljava/util/Map$Entry;
;java.util.TreeMap.pollFirstEntry()Ljava/util/Map$Entry;
(assert (and
    (= true (select (key ?p0) (key ?r)))
    (forall ((x ?K)) 
        (=> (= true (select (key ?p0) x)) (<= (key ?r) x))
    )
    (= (value ?r) (select (mapping ?p0) (key ?r)))
    (= (select (key ?_p0) (key ?r)) false)
    (forall ((k ?K)) (or (= k (key ?r)) (= (select (key ?_p0) k) (select (key ?p0) k))))
    (= (mapping ?_p0) (mapping ?p0))
))
;java.util.NavigableMap.pollLastEntry()Ljava/util/Map$Entry;
;java.util.TreeMap.pollLastEntry()Ljava/util/Map$Entry;
(assert (and
    (= true (select (key ?p0) (key ?r)))
    (forall ((x ?K)) 
        (=> (= true (select (key ?p0) x)) (>= (key ?r) x))
    )
    (= (value ?r) (select (mapping ?p0) (key ?r)))
    (= (select (key ?_p0) (key ?r)) false)
    (forall ((k ?K)) (or (= k (key ?r)) (= (select (key ?_p0) k) (select (key ?p0) k))))
    (= (mapping ?_p0) (mapping ?p0))
))
;java.util.NavigableMap.lowerEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
;java.util.TreeMap.lowerEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
(assert (and
    (= true (select (key ?p0) (key ?r)))
    (forall ((x ?K)) 
        (=> 
            (and (= true (select (key ?p0) x)) (< x ?p1)) 
            (>= (key ?r) x)
        )
    )
    (= (value ?r) (select (mapping ?p0) (key ?r)))
))
;java.util.NavigableMap.lowerKey(Ljava/lang/Object;)Ljava/lang/Object;
;java.util.TreeMap.lowerKey(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (= true (select (key ?p0) ?r))
    (forall ((x ?K)) 
        (=> 
            (and (= true (select (key ?p0) x)) (< x ?p1)) 
            (>= ?r x)
        )
    )
))
;java.util.NavigableMap.floorEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
;java.util.TreeMap.floorEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
(assert (and
    (= true (select (key ?p0) (key ?r)))
    (forall ((x ?K)) 
        (=> 
            (and (= true (select (key ?p0) x)) (<= x ?p1)) 
            (>= (key ?r) x)
        )
    )
    (= (value ?r) (select (mapping ?p0) (key ?r)))
))
;java.util.NavigableMap.floorKey(Ljava/lang/Object;)Ljava/lang/Object;
;java.util.TreeMap.floorKey(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (= true (select (key ?p0) ?r))
    (forall ((x ?K)) 
        (=> 
            (and (= true (select (key ?p0) x)) (<= x ?p1)) 
            (>= ?r x)
        )
    )
))
;java.util.NavigableMap.ceilingEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
;java.util.TreeMap.ceilingEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
(assert (and
    (= true (select (key ?p0) (key ?r)))
    (forall ((x ?K)) 
        (=> 
            (and (= true (select (key ?p0) x)) (>= x ?p1)) 
            (<= (key ?r) x)
        )
    )
    (= (value ?r) (select (mapping ?p0) (key ?r)))
))
;java.util.NavigableMap.ceilingKey(Ljava/lang/Object;)Ljava/lang/Object;
;java.util.TreeMap.ceilingKey(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (= true (select (key ?p0) ?r))
    (forall ((x ?K)) 
        (=> 
            (and (= true (select (key ?p0) x)) (>= x ?p1)) 
            (<= ?r x)
        )
    )
))
;java.util.NavigableMap.higherEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
;java.util.TreeMap.higherEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
(assert (and
    (= true (select (key ?p0) (key ?r)))
    (forall ((x ?K)) 
        (=> 
            (and (= true (select (key ?p0) x)) (> x ?p1)) 
            (<= (key ?r) x)
        )
    )
    (= (value ?r) (select (mapping ?p0) (key ?r)))
))
;java.util.NavigableMap.higherKey(Ljava/lang/Object;)Ljava/lang/Object;
;java.util.TreeMap.higherKey(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (= true (select (key ?p0) ?r))
    (forall ((x ?K)) 
        (=> 
            (and (= true (select (key ?p0) x)) (> x ?p1)) 
            (<= ?r x)
        )
    )
))
;java.util.NavigableMap.subMap(Ljava/lang/Object;ZLjava/lang/Object;Z)Ljava/util/NavigableMap;
;java.util.TreeMap.subMap(Ljava/lang/Object;ZLjava/lang/Object;Z)Ljava/util/NavigableMap;
(assert (and
    (forall ((x ?K))
        (ite 
            (and (ite ?p2 (>= x ?p1) (> x ?p1)) (ite ?p4 (<= x ?p3) (< x ?p3)))
            (= (select (key ?r) x) (select (key ?p0) x))
            (= (select (key ?r) x) false)
        )
    )
    (= (mapping ?r) (mapping ?p0))
))
;java.util.NavigableMap.headMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;
;java.util.TreeMap.headMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;
(assert (and
    (forall ((x ?K))
        (ite 
            (ite ?p2 (<= x ?p1) (< x ?p1))
            (= (select (key ?r) x) (select (key ?p0) x))
            (= (select (key ?r) x) false)
        )
    )
    (= (mapping ?r) (mapping ?p0))
))
;java.util.NavigableMap.tailMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;
;java.util.TreeMap.tailMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;
(assert (and
    (forall ((x ?K))
        (ite 
            (ite ?p2 (>= x ?p1) (> x ?p1))
            (= (select (key ?r) x) (select (key ?p0) x))
            (= (select (key ?r) x) false)
        )
    )
    (= (mapping ?r) (mapping ?p0))
))
;java.util.NavigableMap.subMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedMap;
;java.util.SortedMap.subMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedMap;
;java.util.TreeMap.subMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedMap;
(assert (and
    (forall ((x ?K))
        (ite 
            (and (>= x ?p1) (< x ?p2))
            (= (select (key ?r) x) (select (key ?p0) x))
            (= (select (key ?r) x) false)
        )
    )
    (= (mapping ?r) (mapping ?p0))
))
;java.util.NavigableMap.headMap(Ljava/lang/Object;)Ljava/util/SortedMap;
;java.util.SortedMap.headMap(Ljava/lang/Object;)Ljava/util/SortedMap;
;java.util.TreeMap.headMap(Ljava/lang/Object;)Ljava/util/SortedMap;
(assert (and
    (forall ((x ?K))
        (ite 
            (< x ?p1)
            (= (select (key ?r) x) (select (key ?p0) x))
            (= (select (key ?r) x) false)
        )
    )
    (= (mapping ?r) (mapping ?p0))
))
;java.util.NavigableMap.tailMap(Ljava/lang/Object;)Ljava/util/SortedMap;
;java.util.SortedMap.tailMap(Ljava/lang/Object;)Ljava/util/SortedMap;
;java.util.TreeMap.tailMap(Ljava/lang/Object;)Ljava/util/SortedMap;
(assert (and
    (forall ((x ?K))
        (ite 
            (>= x ?p1)
            (= (select (key ?r) x) (select (key ?p0) x))
            (= (select (key ?r) x) false)
        )
    )
    (= (mapping ?r) (mapping ?p0))
))
;java.util.Map$Entry.getKey()Ljava/lang/Object;
(assert (= ?r (key ?p0)))
;java.util.Map$Entry.getValue()Ljava/lang/Object;
(assert (= ?r (value ?p0)))
;java.util.Map$Entry.setValue(Ljava/lang/Object;)Ljava/lang/Object;
(assert (= ?r (key ?p0)))
(assert (= (value ?_p0) ?p1))
;java.util.Iterator.hasNext()Z
(assert (= ?r 
    (ite (exists ((x ?T)) (and
        (= true (select (mapping ?p0) x))
        (= false (select (previous ?p0) x))
    )) 1 0)
))
;java.util.Iterator.next()Ljava/lang/Object;
(assert (and 
    (= true (select (mapping ?p0) ?r))
    (= false (select (previous ?p0) ?r))
    (= (mapping ?_p0) (mapping ?p0))
    (forall ((x ?T))
        (ite (= x ?r)
            (= (select (previous ?_p0) x) true)
            (= (select (previous ?_p0) x) (select (previous ?p0) x))
        )
    )
))
;java.util.Iterator.remove()V
(assert (and 
    (= (previous ?_p0) (previous ?p0))
    (forall ((x ?T))
        (ite (= x ?r)
            (= (select (mapping ?_p0) x) false)
            (= (select (mapping ?_p0) x) (select (mapping ?p0) x))
        )
    )
))
;java.util.ListIterator.hasNext()Z
(assert (and 
    (>= (position ?p0) 0)
    (< (position ?p0) (seq.len (element ?p0)))
    (= ?r 
        (ite (< (+ (position ?p0) 1) (seq.len (element ?p0))) 1 0)
    )
))
;java.util.ListIterator.next()Ljava/lang/Object;
(assert (and
    (>= (position ?p0) 0)
    (< (position ?p0) (seq.len (element ?p0)))
    (= (seq.unit ?r) (seq.at (element ?p0) (+ (position ?p0) 1)))
    (= (position ?_p0) (+ (position ?p0) 1))
    (= (element ?_p0) (element ?p0))
))
;java.util.ListIterator.hasPrevious()Z
(assert (and
    (>= (position ?p0) 0)
    (< (position ?p0) (seq.len (element ?p0)))
    (= ?r 
        (ite (>= (- (position ?p0) 1) 0) 1 0)
    )
))
;java.util.ListIterator.previous()Ljava/lang/Object;
(assert (and
    (>= (position ?p0) 0)
    (< (position ?p0) (seq.len (element ?p0)))
    (= (seq.unit ?r) (seq.at (element ?p0) (- (position ?p0) 1)))
    (= (position ?_p0) (- (position ?p0) 1))
    (= (element ?_p0) (element ?p0))
))
;java.util.ListIterator.nextIndex()I
(assert (and 
    (>= (position ?p0) 0)
    (< (position ?p0) (seq.len (element ?p0)))
    (= ?r (+ (position ?p0) 1))
))
;java.util.ListIterator.previousIndex()I
(assert (and
    (>= (position ?p0) 0)
    (< (position ?p0) (seq.len (element ?p0)))
    (= ?r (- (position ?p0) 1))
))
;java.util.ListIterator.remove()V
(assert (and
    (>= (position ?p0) 0)
    (< (position ?p0) (seq.len (element ?p0)))
    (let ((size (seq.len (element ?p0)) (pos (position ?p0))))
        (= (element ?_p0) (seq.++ 
            (seq.extract (element ?p0) 0 pos)
            (seq.extract (element ?p0) (+ pos 1) (- (- size pos) 1))
        ))
    )
    (= (position ?p_0) (position ?p0))
))
;java.util.ListIterator.set(Ljava/lang/Object;)V
(assert (and 
    (>= (position ?p0) 0)
    (< (position ?p0) (seq.len (element ?p0)))
    (let ((size (seq.len (element ?p0)) (pos (position ?p0))))
        (= (element ?_p0) (seq.++ 
            (seq.extract (element ?p0) 0 pos)
            (seq.unit ?p2)
            (seq.extract (element ?p0) (+ pos 1) (- (- size pos) 1))
        ))
    )
    (= (position ?p_0) (position ?p0))
))
;java.util.ListIterator.add(Ljava/lang/Object;)V
(assert (and 
    (>= (position ?p0) 0)
    (< (position ?p0) (seq.len (element ?p0)))
    (let ((size (seq.len (element ?p0)) (pos (position ?p0))))
        (= (element ?_p0) (seq.++ 
            (seq.extract (element ?p0) 0 pos)
            (seq.unit ?p2)
            (seq.extract (element ?p0) pos (- size pos))
        ))
    )
    (= (position ?p_0) (position ?p0))
))
;java.io.FileInputStream.<init>(Ljava/lang/String;)V
(assert (and 
    (>= (length ?_p0) 0) (<= (length ?_p0) 2048)
    (= (readPosition ?_p0) 0)
    (= (isOpen ?_p0) true)
))
;java.io.FileInputStream.read([B)I
(assert (= true (isOpen ?p0)))
(assert (and
    (= (isOpen ?_p0) true)
    (= (length ?_p0) (length ?p0))
))
(assert (ite 
    (= (readPosition ?p0) (length ?p0))
    (and (= ?r -1) (= (readPosition ?_p0) 0))
    (and 
        (let ((bufferLength (seq.len (element ?p1)))) 
            (ite 
                (>= (+ (readPosition ?p0) bufferLength) (length ?p0))
                (= ?r (- (length ?p0) (readPosition ?p0)))
                (= ?r bufferLength)
            )
        )
        (= (readPosition ?_p0) (+ (readPosition ?p0) ?r))
    )
))
;java.io.FileInputStream.close()V
(assert (= (isOpen ?p0) true))
(assert (= (isOpen ?_p0) false))
;END