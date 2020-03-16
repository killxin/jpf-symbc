;Data Structure
(declare-datatypes (T) (
    (Set (mk-set (mapping (Array T Bool))))
    (List (mk-list (element (Seq T))))
    (Iterator (mk-iterator (mapping (Array T Bool)) (previous (Array T Bool))))
    (ListIterator (mk-listIterator (element (Seq T)) (position Int)))
))
(declare-datatypes (K V) (
    (Entry (mk-entry (key K) (value V)))
    (Map (mk-map (key (Array K Bool)) (mapping (Array K V))))
))
(declare-datatypes () (
    (FileInputStream (mk-pair (length Int) (readPosition Int) (isOpen Bool)))
))
(define-fun-rec s!ze ((a!1 (Array Int Bool)) (x!1 Int)) Int (ite (< x!1 min!nt) 0 (ite (= true (select a!1 x!1)) (+ (s!ze a!1 (- x!1 1)) 1) (s!ze a!1 (- x!1 1)))))
(define-fun-rec s!ze ((a!1 (Seq Int)) (x!1 Int)) Int (ite (< x!1 min!nt) 0 (ite (seq.contains a!1 (seq.unit x!1)) (+ (s!ze a!1 (- x!1 1)) 1) (s!ze a!1 (- x!1 1)))))
(define-fun-rec m!e ((a!1 (Array Int Bool)) (x!1 Int)) (Seq Int) (ite (< x!1 min!nt) (as seq.empty (Seq Int)) (ite (select a!1 x!1) (seq.++ (m!e a!1 (- x!1 1)) (seq.unit x!1)) (m!e a!1 (- x!1 1)))))
(define-fun-rec e!m ((a!1 (Seq Int)) (x!1 Int)) (Array Int Bool) (ite (< x!1 min!nt) ((as const (Array Int Bool)) false) (ite (seq.contains a!1 (seq.unit x!1)) (store (e!m a!1 (- x!1 1)) x!1 true) (e!m a!1 (- x!1 1)))))
(define-fun mapping ((a!1 (List Int))) (Array Int Bool) (e!m (element a!1) max!nt))
(define-fun !te ((a!1 (List Int))) (Seq Int) (element a!1))
(define-fun !te ((a!1 (Set Int))) (Seq Int) (m!e (mapping a!1) max!nt))
;START
;java.util.Collection.size()I
;java.util.Set.size()I
;java.util.HashSet.size()I
;java.util.TreeSet.size()I
    ;(define-fun-rec s!ze ((a!1 (Array Int Bool)) (x!1 Int)) Int (ite (< x!1 min!nt) 0 (ite (= true (select a!1 x!1)) (+ (s!ze a!1 (- x!1 1)) 1) (s!ze a!1 (- x!1 1)))))
(assert 
    (= ?r (s!ze (mapping ?p0) max!nt))
)
;java.util.Collection.isEmpty()Z
;java.util.Set.isEmpty()Z
;java.util.HashSet.isEmpty()Z
;java.util.TreeSet.isEmpty()Z
    ;(define-fun-rec s!ze ((a!1 (Array Int Bool)) (x!1 Int)) Int (ite (< x!1 min!nt) 0 (ite (= true (select a!1 x!1)) (+ (s!ze a!1 (- x!1 1)) 1) (s!ze a!1 (- x!1 1)))))
(assert
    (= ?r (ite (= (s!ze (mapping ?p0) max!nt) 0) 1 0))
)
;java.util.Collection.contains(Ljava/lang/Object;)Z
;java.util.Set.contains(Ljava/lang/Object;)Z
;java.util.HashSet.contains(Ljava/lang/Object;)Z
;java.util.TreeSet.contains(Ljava/lang/Object;)Z
(assert
    (= ?r (ite (select (mapping ?p0) ?p1) 1 0))
)
;java.util.Collection.iterator()Ljava/util/Iterator;
;java.util.List.iterator()Ljava/util/Iterator;
;java.util.ArrayList.iterator()Ljava/util/Iterator;
;java.util.Set.iterator()Ljava/util/Iterator;
;java.util.HashSet.iterator()Ljava/util/Iterator;
;java.util.TreeSet.iterator()Ljava/util/Iterator;
(assert (and
    (= (mapping ?r) (mapping ?p0))
    (= (previous ?r) (lambda ((x ?T)) false))
    ; (forall ((x ?T)) (= (select (previous ?r) x) false))
))
;java.util.Collection.add(Ljava/lang/Object;)Z
;java.util.Set.add(Ljava/lang/Object;)Z
;java.util.HashSet.add(Ljava/lang/Object;)Z
;java.util.TreeSet.add(Ljava/lang/Object;)Z
(assert (ite 
    (select (mapping ?p0) ?p1)
    (and (= ?r 0) (= (mapping ?_p0) (mapping ?p0)))
    (and (= ?r 1) (= (mapping ?_p0) (store (mapping ?p0) ?p1 true)))
))
;java.util.Collection.remove(Ljava/lang/Object;)Z
;java.util.Set.remove(Ljava/lang/Object;)Z
;java.util.HashSet.remove(Ljava/lang/Object;)Z
;java.util.TreeSet.remove(Ljava/lang/Object;)Z
(assert (ite 
    (select (mapping ?p0) ?p1)
    (and (= ?r 1) (= (mapping ?_p0) (store (mapping ?p0) ?p1 false)))
    (and (= ?r 0) (= (mapping ?_p0) (mapping ?p0)))
))
;java.util.Collection.containsAll(Ljava/util/Collection;)Z
;java.util.Set.containsAll(Ljava/util/Collection;)Z
;java.util.List.containsAll(Ljava/util/Collection;)Z
(assert 
    (= ?r (ite 
        (forall ((x ?T)) (=> (select (mapping ?p1) x) (select (mapping ?p0) x)))
    1 0))
)
;java.util.Collection.addAll(Ljava/util/Collection;)Z
;java.util.Set.addAll(Ljava/util/Collection;)Z
;java.util.TreeSet.addAll(Ljava/util/Collection;)Z
    ;(define-fun-rec e!m ((a!1 (Seq Int)) (x!1 Int)) (Array Int Bool) (ite (< x!1 min!nt) ((as const (Array Int Bool)) false) (ite (seq.contains a!1 (seq.unit x!1)) (store (e!m a!1 (- x!1 1)) x!1 true) (e!m a!1 (- x!1 1)))))
    ;(define-fun mapping ((a!1 (List Int))) (Array Int Bool) (e!m (element a!1) max!nt))
(assert (and
    (= (mapping ?_p0) ((_ map or) (mapping ?p0) (mapping ?p1)))
    (= ?r (ite (= (mapping ?_p0) (mapping ?p0)) 0 1))
))
;java.util.Collection.removeAll(Ljava/util/Collection;)Z
;java.util.Set.removeAll(Ljava/util/Collection;)Z
;java.util.List.removeAll(Ljava/util/Collection;)Z
;java.util.ArrayList.removeAll(Ljava/util/Collection;)Z
    ;(define-fun-rec e!m ((a!1 (Seq Int)) (x!1 Int)) (Array Int Bool) (ite (< x!1 min!nt) ((as const (Array Int Bool)) false) (ite (seq.contains a!1 (seq.unit x!1)) (store (e!m a!1 (- x!1 1)) x!1 true) (e!m a!1 (- x!1 1)))))
    ;(define-fun mapping ((a!1 (List Int))) (Array Int Bool) (e!m (element a!1) max!nt))
(assert (and
    (= (mapping ?_p0) ((_ map and) (mapping ?p0) ((_ map not) (mapping ?p1))))
    (= ?r (ite (= (mapping ?_p0) (mapping ?p0)) 0 1))
))
;java.util.Collection.retainAll(Ljava/util/Collection;)Z
;java.util.Set.retainAll(Ljava/util/Collection;)Z
;java.util.List.retainAll(Ljava/util/Collection;)Z
;java.util.ArrayList.retainAll(Ljava/util/Collection;)Z
    ;(define-fun-rec e!m ((a!1 (Seq Int)) (x!1 Int)) (Array Int Bool) (ite (< x!1 min!nt) ((as const (Array Int Bool)) false) (ite (seq.contains a!1 (seq.unit x!1)) (store (e!m a!1 (- x!1 1)) x!1 true) (e!m a!1 (- x!1 1)))))
    ;(define-fun mapping ((a!1 (List Int))) (Array Int Bool) (e!m (element a!1) max!nt))
(assert (and
    (= (mapping ?_p0) ((_ map and) (mapping ?p0) (mapping ?p1)))
    (= ?r (ite (= (mapping ?_p0) (mapping ?p0)) 0 1))
))
;java.util.Collection.clear()V
;java.util.Set.clear()V
;java.util.HashSet.clear()V
;java.util.TreeSet.clear()V
;java.util.HashSet.<init>()V
;java.util.HashSet.<init>(IF)V
;java.util.HashSet.<init>(I)V
;java.util.TreeSet.<init>()V
(assert 
    (= (mapping ?_p0) (lambda ((x ?T)) false))
    ;(forall ((x ?T)) (= (select (mapping ?_p0) x) false))
)
;java.util.HashSet.<init>(Ljava/util/Collection;)V
;java.util.TreeSet.<init>(Ljava/util/Collection;)V
;java.util.TreeSet.<init>(Ljava/util/SortedSet;)V
(assert 
    (= (mapping ?_p0) (mapping ?p1))
)
;java.util.HashSet.clone()Ljava/lang/Object;
;java.util.TreeSet.clone()Ljava/lang/Object;
;java.util.NavigableSet.descendingSet()Ljava/util/NavigableSet;
;java.util.TreeSet.descendingSet()Ljava/util/NavigableSet;
(assert 
    (= (mapping ?r) (mapping ?p0))
)
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
    (select (mapping ?p0) ?r)
    (forall ((x ?T)) (=> (select (mapping ?p0) x) (<= ?r x)))
))
;java.util.SortedSet.last()Ljava/lang/Object;
;java.util.TreeSet.last()Ljava/lang/Object;
(assert (and
    (select (mapping ?p0) ?r)
    (forall ((x ?T)) (=> (select (mapping ?p0) x) (>= ?r x)))
))
;java.util.NavigableSet.lower(Ljava/lang/Object;)Ljava/lang/Object;
;java.util.TreeSet.lower(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (select (mapping ?p0) ?r)
    (forall ((x ?T)) (=> (and (select (mapping ?p0) x) (< x ?p1)) (>= ?r x)))
))
;java.util.NavigableSet.floor(Ljava/lang/Object;)Ljava/lang/Object;
;java.util.TreeSet.floor(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (select (mapping ?p0) ?r)
    (forall ((x ?T)) (=> (and (select (mapping ?p0) x) (<= x ?p1)) (>= ?r x)))
))
;java.util.NavigableSet.ceiling(Ljava/lang/Object;)Ljava/lang/Object;
;java.util.TreeSet.ceiling(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (select (mapping ?p0) ?r)
    (forall ((x ?T)) (=> (and (select (mapping ?p0) x) (>= x ?p1)) (<= ?r x)))
))
;java.util.NavigableSet.higher(Ljava/lang/Object;)Ljava/lang/Object;
;java.util.TreeSet.higher(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (select (mapping ?p0) ?r)
    (forall ((x ?T)) (=> (and (select (mapping ?p0) x) (> x ?p1)) (<= ?r x)))
))
;java.util.NavigableSet.pollFirst()Ljava/lang/Object;
;java.util.TreeSet.pollFirst()Ljava/lang/Object;
(assert (and
    (select (mapping ?p0) ?r)
    (forall ((x ?T)) (=> (select (mapping ?p0) x) (<= ?r x)))
    (= (mapping ?_p0) (store (mapping ?p0) ?r false))
))
;java.util.NavigableSet.pollLast()Ljava/lang/Object;
;java.util.TreeSet.pollLast()Ljava/lang/Object;
(assert (and
    (select (mapping ?p0) ?r)
    (forall ((x ?T)) (=> (select (mapping ?p0) x) (>= ?r x)))
    (= (mapping ?_p0) (store (mapping ?p0) ?r false))
))
;Array.arraylength()I
;java.util.List.size()I
;java.util.ArrayList.size()I
;java.util.LinkedList.size()I
(assert 
    (= ?r (seq.len (element ?p0)))
)
;java.util.List.isEmpty()Z
;java.util.ArrayList.isEmpty()Z
(assert 
    (= ?r (ite (= (seq.len (element ?p0)) 0) 1 0))
)
;java.util.List.contains(Ljava/lang/Object;)Z
;java.util.ArrayList.contains(Ljava/lang/Object;)Z
;java.util.LinkedList.contains(Ljava/lang/Object;)Z
(assert 
    (= ?r (ite (seq.contains (element ?p0) (seq.unit ?p1)) 1 0))
)
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
(assert 
    (= (element ?r) (element ?p0))
)
;java.util.List.add(Ljava/lang/Object;)Z
;java.util.ArrayList.add(Ljava/lang/Object;)Z
;java.util.LinkedList.add(Ljava/lang/Object;)Z
;java.util.LinkedList.offer(Ljava/lang/Object;)Z
;java.util.LinkedList.offerLast(Ljava/lang/Object;)Z
(assert (and
    (= ?r 1)
    (= (element ?_p0) (seq.++ (element ?p0) (seq.unit ?p1)))
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
    )
))
;java.util.List.addAll(Ljava/util/Collection;)Z
;java.util.ArrayList.addAll(Ljava/util/Collection;)Z
;java.util.LinkedList.addAll(Ljava/util/Collection;)Z
    ;(define-fun-rec m!e ((a!1 (Array Int Bool)) (x!1 Int)) (Seq Int) (ite (< x!1 min!nt) (as seq.empty (Seq Int)) (ite (select a!1 x!1) (seq.++ (m!e a!1 (- x!1 1)) (seq.unit x!1)) (m!e a!1 (- x!1 1)))))
    ;(define-fun !te ((a!1 (List Int))) (Seq Int) (element a!1)
    ;(define-fun !te ((a!1 (Set Int))) (Seq Int) (m!e (mapping a!1) max!nt)
(assert (and
    ;(= (element ?_p0) (seq.++ (element ?p0) (m!e (mapping ?p1) max!nt)))
    (= (element ?_p0) (seq.++ (element ?p0) (!te ?p1)))
    (= ?r (ite (= (element ?_p0) (element ?p0)) 0 1))
    ;(= (mapping ?_p0) ((_ map or) (mapping ?p0) (mapping ?p1)))
))
;java.util.List.addAll(ILjava/util/Collection;)Z
;java.util.ArrayList.addAll(ILjava/util/Collection;)Z
;java.util.LinkedList.addAll(ILjava/util/Collection;)Z
    ;(define-fun-rec m!e ((a!1 (Array Int Bool)) (x!1 Int)) (Seq Int) (ite (< x!1 min!nt) (as seq.empty (Seq Int)) (ite (select a!1 x!1) (seq.++ (m!e a!1 (- x!1 1)) (seq.unit x!1)) (m!e a!1 (- x!1 1)))))
    ;(define-fun !te ((a!1 (List Int))) (Seq Int) (element a!1)
    ;(define-fun !te ((a!1 (Set Int))) (Seq Int) (m!e (mapping a!1) max!nt)
(assert (and
    (let ((size (seq.len (element ?p0))))
        (= (element ?_p0) (seq.++
            (seq.extract (element ?p0) 0 ?p1)
            ;(m!e (mapping ?p2) max!nt)
            (!te ?p2)
            (seq.extract (element ?p0) ?p1 (- size ?p1))
        ))
    )
    (= ?r (ite (= (element ?_p0) (element ?p0)) 0 1))
    ;(= (mapping ?_p0) ((_ map or) (mapping ?p0) (mapping ?p1)))
)
;java.util.List.clear()V
;java.util.ArrayList.clear()V
;java.util.LinkedList.clear()V
;java.util.ArrayList.<init>(I)V
;java.util.ArrayList.<init>()V
;java.util.LinkedList.<init>()V
(assert
    (= (element ?_p0) (as seq.empty (Seq ?T)))
    ;(= (seq.len (element ?_p0)) 0)
)
;Array.<init>(I)V
(assert
    (= (seq.len (element ?_p0)) ?p1)
)
;Array.get(I)Ljava/lang/Object;
;java.util.List.get(I)Ljava/lang/Object;
;java.util.ArrayList.get(I)Ljava/lang/Object;
;java.util.LinkedList.get(I)Ljava/lang/Object;
(assert (and
    (>= ?p1 0) (< ?p1 (seq.len (element ?p0)))
    (= (seq.unit ?r) (seq.at (element ?p0) ?p1))
))
;Array.set(ILjava/lang/Object;)V
(assert (let ((size (seq.len (element ?p0))))
    (and
        (>= ?p1 0) (< ?p1 size)
        (= (element ?_p0) (seq.++ 
            (seq.extract (element ?p0) 0 ?p1)
            (seq.unit ?p2)
            (seq.extract (element ?p0) (+ ?p1 1) (- (- size ?p1) 1))
        ))
    )
))
;java.util.List.set(ILjava/lang/Object;)Ljava/lang/Object;
;java.util.ArrayList.set(ILjava/lang/Object;)Ljava/lang/Object;
;java.util.LinkedList.set(ILjava/lang/Object;)Ljava/lang/Object;
(assert (let ((size (seq.len (element ?p0))))
    (and
        (>= ?p1 0) (< ?p1 size)
        (= (element ?_p0) (seq.++ 
            (seq.extract (element ?p0) 0 ?p1)
            (seq.unit ?p2)
            (seq.extract (element ?p0) (+ ?p1 1) (- (- size ?p1) 1))
        ))
        (= (seq.unit ?r) (seq.at (element ?p0) ?p1))
    )
))
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
        ;(= (mapping ?_p0) (store (mapping ?p0) ?p2 true))
    )
))
;java.util.List.remove(I)Ljava/lang/Object;
;java.util.ArrayList.remove(I)Ljava/lang/Object;
;java.util.LinkedList.remove(I)Ljava/lang/Object;
(assert (let ((size (seq.len (element ?p0))))
    (and
        (>= ?p1 0) (< ?p1 size)
        (= (element ?_p0) 
            (seq.++ 
                (seq.extract (element ?p0) 0 ?p1)
                (seq.extract (element ?p0) (+ ?p1 1) (- (- size ?p1) 1))
            )
        )
        (= (seq.unit ?r) (seq.at (element ?p0) ?p1))
    )
))
;java.util.List.indexOf(Ljava/lang/Object;)I
;java.util.ArrayList.indexOf(Ljava/lang/Object;)I
;java.util.LinkedList.indexOf(Ljava/lang/Object;)I
(assert 
    (= ?r (seq.indexof (element ?p0) (seq.unit ?p1)))
)
;java.util.List.lastIndexOf(Ljava/lang/Object;)I
;java.util.ArrayList.lastIndexOf(Ljava/lang/Object;)I
;java.util.LinkedList.lastIndexOf(Ljava/lang/Object;)I
(assert (and
    (= ?r (seq.indexof (element ?p0) (seq.unit ?p1) ?r))
    (= -1 (seq.indexof (element ?p0) (seq.unit ?p1) (+ ?r 1)))
))
;java.util.List.subList(II)Ljava/util/List;
;java.util.ArrayList.subList(II)Ljava/util/List;
    ; The returned list is backed by this list, so non-structural changes in the returned list are reflected in this list
(assert (and 
    (>= ?p1 0) (>= ?p2 ?p1) (< ?p2 (seq.len (element ?p0)))
    (= (element ?r) (seq.extract (element ?p0) ?p1 (- ?p2 ?p1)))
))
;java.util.ArrayList.<init>(Ljava/util/Collection;)V
;java.util.LinkedList.<init>(Ljava/util/Collection;)V
(assert
    (= (element ?_p0) (element ?p1))
)
;java.util.ArrayList.removeRange(II)V
(assert (let ((size (seq.len (element ?p0))))
    (and 
        (>= ?p1 0) (>= ?p2 ?p1) (< ?p2 size)
        (= (element ?_p0) 
            (seq.++
                (seq.extract (element ?p0) 0 ?p1)
                (seq.extract (element ?p0) ?p2 (- size ?p2))
            )
        )
    )
))
;java.util.LinkedList.getFirst()Ljava/lang/Object;
;java.util.LinkedList.peek()Ljava/lang/Object;
;java.util.LinkedList.element()Ljava/lang/Object;
;java.util.LinkedList.peekFirst()Ljava/lang/Object;
(assert
    (= (seq.unit ?r) (seq.at (element ?p0) 0))
)
;java.util.LinkedList.getLast()Ljava/lang/Object;
;java.util.LinkedList.peekLast()Ljava/lang/Object;
(assert 
    (= (seq.unit ?r) (seq.at (element ?p0) (- (seq.len (element ?p0)) 1)))
)
;java.util.LinkedList.removeFirst()Ljava/lang/Object;
;java.util.LinkedList.poll()Ljava/lang/Object;
;java.util.LinkedList.remove()Ljava/lang/Object;
;java.util.LinkedList.pollFirst()Ljava/lang/Object;
;java.util.LinkedList.pop()Ljava/lang/Object;
(assert (and
    (= (seq.unit ?r) (seq.at (element ?_p0) 0))
    (= (element ?_p0) (seq.extract (element ?p0) 1 (- (seq.len (element ?p0)) 1)))
))
;java.util.LinkedList.removeLast()Ljava/lang/Object;
;java.util.LinkedList.pollLast()Ljava/lang/Object;
(assert (and
    (= (seq.unit ?r) (seq.at (element ?_p0) (- (seq.len (element ?p0)) 1)))
    (= (element ?_p0) (seq.extract (element ?p0) 0 (- (seq.len (element ?p0)) 1)))
))
;java.util.LinkedList.addFirst(Ljava/lang/Object;)V
;java.util.LinkedList.push(Ljava/lang/Object;)V
(assert
    (= (element ?_p0) (seq.++ (seq.unit ?p1) (element ?p0)))
)
;java.util.LinkedList.addLast(Ljava/lang/Object;)V
(assert
    (= (element ?_p0) (seq.++ (element ?p0) (seq.unit ?p1)))
)
;java.util.LinkedList.offerFirst(Ljava/lang/Object;)Z
(assert (and 
    (= ?r 1)
    (= (element ?_p0) (seq.++ (seq.unit ?p1) (element ?p0)))
))
;java.util.LinkedList.removeLastOccurrence(Ljava/lang/Object;)Z
(assert (ite
    (seq.contains (element ?p0) (seq.unit ?p1))
    (and 
        (= ?r 1)
        (let ((size (seq.len (element ?p0)))(idx (seq.indexof (element ?p0) ?p1 idx)))
            (and
                (= -1 (seq.indexof (element ?p0) (seq.unit ?p1) (+ ?r 1)))
                (= (element ?_p0) (seq.++
                    (seq.extract (element ?p0) 0 idx)
                    (seq.extract (element ?p0) (+ idx 1) (- (- size idx) 1))
                ))
            )
        )
    )
    (and
        (= ?r 0)
        (= (element ?_p0) (element ?p0))
    )
))
;java.util.Map.size()I
;java.util.HashMap.size()I
;java.util.TreeMap.size()I
    ;(define-fun-rec s!ze ((a!1 (Array Int Bool)) (x!1 Int)) Int (ite (< x!1 min!nt) 0 (ite (= true (select a!1 x!1)) (+ (s!ze a!1 (- x!1 1)) 1) (s!ze a!1 (- x!1 1)))))
(assert 
    (= ?r (s!ze (key ?p0) max!nt))
    ;(ite (forall ((k ?K)) (= (select (key ?p0) k) false)) (= ?r 0) (> ?r 0))
)
;java.util.Map.isEmpty()Z
;java.util.HashMap.isEmpty()Z
    ;(define-fun-rec s!ze ((a!1 (Array Int Bool)) (x!1 Int)) Int (ite (< x!1 min!nt) 0 (ite (= true (select a!1 x!1)) (+ (s!ze a!1 (- x!1 1)) 1) (s!ze a!1 (- x!1 1)))))
(assert
    (= ?r (ite (= (s!ze ?p0) 0) 1 0))
    ;(= ?r (ite (forall ((k ?K)) (= (select (key ?p0) k) false)) 1 0))
)
;java.util.Map.containsKey(Ljava/lang/Object;)Z
;java.util.HashMap.containsKey(Ljava/lang/Object;)Z
;java.util.TreeMap.containsKey(Ljava/lang/Object;)Z
(assert 
    (= ?r (ite (select (key ?p0) ?p1) 1 0))
)
;java.util.Map.containsValue(Ljava/lang/Object;)Z
;java.util.HashMap.containsValue(Ljava/lang/Object;)Z
;java.util.TreeMap.containsValue(Ljava/lang/Object;)Z
(assert 
    (= ?r (ite (exists ((k ?K)) 
        (and
            (select (key ?p0) k)
            (= ?p1 (select (mapping ?p0) k))
        ) 
    ) 1 0))
)
;java.util.Map.get(Ljava/lang/Object;)Ljava/lang/Object;
;java.util.HashMap.get(Ljava/lang/Object;)Ljava/lang/Object;
;java.util.TreeMap.get(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (select (key ?p0) ?p1)
    (= ?r (select (mapping ?p0) ?p1))
))
;java.util.Map.put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
;java.util.HashMap.put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
;java.util.TreeMap.put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (= (select (mapping ?p0) ?p1) ?r)
    (= (key ?_p0) (store (key ?p0) ?p1 true))
    (= (mapping ?_p0) (store (mapping ?p0) ?p1 ?p2))
))
;java.util.Map.remove(Ljava/lang/Object;)Ljava/lang/Object;
;java.util.HashMap.remove(Ljava/lang/Object;)Ljava/lang/Object;
;java.util.TreeMap.remove(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (select (key ?p0) ?p1)
    (= (key ?_p0) (store (key ?p0) ?p1 false))
    (= (mapping ?_p0) (mapping ?p0))
))
;java.util.Map.putAll(Ljava/util/Map;)V
;java.util.HashMap.putAll(Ljava/util/Map;)V
;java.util.TreeMap.putAll(Ljava/util/Map;)V
    ;maybe timeout
(assert (forall ((k ?K))
    (ite (select (key ?p1) k)
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
(assert 
    (forall ((k ?K)) (= (select (key ?_p0) k) false))
)
;java.util.Map.keySet()Ljava/util/Set;
;java.util.HashMap.keySet()Ljava/util/Set;
;java.util.SortedMap.keySet()Ljava/util/Set;
;java.util.TreeMap.keySet()Ljava/util/Set;
;java.util.NavigableMap.descendingKeySet()Ljava/util/NavigableSet;
;java.util.TreeMap.descendingKeySet()Ljava/util/NavigableSet;
;java.util.NavigableMap.navigableKeySet()Ljava/util/NavigableSet;
;java.util.TreeMap.navigableKeySet()Ljava/util/NavigableSet;
(assert 
    (= (mapping ?r) (key ?p0))
)
;java.util.Map.values()Ljava/util/Collection;
;java.util.HashMap.values()Ljava/util/Collection;
;java.util.SortedMap.values()Ljava/util/Collection;
;java.util.TreeMap.values()Ljava/util/Collection;
(assert
    (forall ((y ?V)) 
        (ite
            (exists ((x ?K)) (and 
                (select (key ?p0) x) 
                (= y (select (mapping ?p0) x))
            )) 
            (select (mapping ?r) y) 
            (not (select (mapping ?r) y))
        )
    )
    ;(forall ((k ?K)) 
    ;    (=> 
    ;        (select (key ?p0) k)
    ;        (select (mapping ?r) (select (mapping ?p0) k))
    ;    )
    ;)
)
;java.util.Map.entrySet()Ljava/util/Set;
;java.util.HashMap.entrySet()Ljava/util/Set;
;java.util.SortedMap.entrySet()Ljava/util/Set;
;java.util.TreeMap.entrySet()Ljava/util/Set;
(assert
    (forall ((x ?K)(y ?V)) 
        (ite 
            (and (select (key ?p0) x) (= y (select (mapping ?p0) x))) 
            (select (mapping ?r) (mk-entry x y))
            (not (select (mapping ?r) (mk-entry x y)))
        )
    )
    ;(forall ((k ?K)) 
    ;    (=> 
    ;        (= true (select (key ?p0) k))
    ;        (= true (select (mapping ?r) k (select (mapping ?p0) k)))
    ;    )
    ;)
)
;java.util.Map.getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
;java.util.HashMap.getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
(assert (ite
    (select (key ?p0) ?p1)
    (= ?r (select (mapping ?p0) ?p1))
    (= ?r ?p2)
))
;java.util.Map.remove(Ljava/lang/Object;Ljava/lang/Object;)Z
;java.util.HashMap.remove(Ljava/lang/Object;Ljava/lang/Object;)Z
(assert (ite
    (and
        (select (key ?p0) ?p1)
        (= ?p2 (select (mapping ?p0) ?p1))
    )
    (and
        (= (key ?_p0) (store (key ?p0) ?p1 false))
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
    (select (key ?p0) ?p1)
    (= ?r (select (mapping ?p0) ?p1))
    (= (key ?_p0) (store (key ?p0) ?p1 true))
    (= (mapping ?_p0) (store (mapping ?p0) ?p1 ?p2))
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
    (select (key ?p0) ?r)
    (forall ((x ?K)) (=> (select (key ?p0) x) (<= ?r x)))
))
;java.util.SortedMap.lastKey()Ljava/lang/Object;
;java.util.TreeMap.lastKey()Ljava/lang/Object;
(assert (and
    (select (key ?p0) ?r)
    (forall ((x ?K)) (=> (select (key ?p0) x) (>= ?r x)))
))
;java.util.NavigableMap.firstEntry()Ljava/util/Map$Entry;
;java.util.TreeMap.firstEntry()Ljava/util/Map$Entry;
(assert (and
    (select (key ?p0) (key ?r))
    (forall ((x ?K)) (=> (select (key ?p0) x) (<= (key ?r) x))
    (= (value ?r) (select (mapping ?p0) (key ?r)))
))
;java.util.NavigableMap.lastEntry()Ljava/util/Map$Entry;
;java.util.TreeMap.lastEntry()Ljava/util/Map$Entry;
(assert (and
    (select (key ?p0) (key ?r))
    (forall ((x ?K)) (=> (select (key ?p0) x)) (>= (key ?r) x))
    (= (value ?r) (select (mapping ?p0) (key ?r)))
))
;java.util.NavigableMap.pollFirstEntry()Ljava/util/Map$Entry;
;java.util.TreeMap.pollFirstEntry()Ljava/util/Map$Entry;
(assert (and
    (select (key ?p0) (key ?r))
    (forall ((x ?K)) (=> (select (key ?p0) x)) (<= (key ?r) x))
    (= (value ?r) (select (mapping ?p0) (key ?r)))
    (= (key ?_p0) (store (key ?p0) (key ?r) false))
    (= (mapping ?_p0) (mapping ?p0))
))
;java.util.NavigableMap.pollLastEntry()Ljava/util/Map$Entry;
;java.util.TreeMap.pollLastEntry()Ljava/util/Map$Entry;
(assert (and
    (select (key ?p0) (key ?r))
    (forall ((x ?K)) (=> (select (key ?p0) x) (>= (key ?r) x)))
    (= (value ?r) (select (mapping ?p0) (key ?r)))
    (= (key ?_p0) (store (key ?p0) (key ?r) false))
    (= (mapping ?_p0) (mapping ?p0))
))
;java.util.NavigableMap.lowerEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
;java.util.TreeMap.lowerEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
(assert (and
    (select (key ?p0) (key ?r))
    (forall ((x ?K)) 
        (=> 
            (and (select (key ?p0) x) (< x ?p1))
            (>= (key ?r) x)
        )
    )
    (= (value ?r) (select (mapping ?p0) (key ?r)))
))
;java.util.NavigableMap.lowerKey(Ljava/lang/Object;)Ljava/lang/Object;
;java.util.TreeMap.lowerKey(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (select (key ?p0) ?r)
    (forall ((x ?K)) 
        (=> 
            (and (select (key ?p0) x) (< x ?p1)) 
            (>= ?r x)
        )
    )
))
;java.util.NavigableMap.floorEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
;java.util.TreeMap.floorEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
(assert (and
    (select (key ?p0) (key ?r))
    (forall ((x ?K)) 
        (=> 
            (and (select (key ?p0) x) (<= x ?p1))
            (>= (key ?r) x)
        )
    )
    (= (value ?r) (select (mapping ?p0) (key ?r)))
))
;java.util.NavigableMap.floorKey(Ljava/lang/Object;)Ljava/lang/Object;
;java.util.TreeMap.floorKey(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (select (key ?p0) ?r)
    (forall ((x ?K)) 
        (=> 
            (and (select (key ?p0) x) (<= x ?p1)) 
            (>= ?r x)
        )
    )
))
;java.util.NavigableMap.ceilingEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
;java.util.TreeMap.ceilingEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
(assert (and
    (select (key ?p0) (key ?r))
    (forall ((x ?K)) 
        (=> 
            (and (select (key ?p0) x) (>= x ?p1))
            (<= (key ?r) x)
        )
    )
    (= (value ?r) (select (mapping ?p0) (key ?r)))
))
;java.util.NavigableMap.ceilingKey(Ljava/lang/Object;)Ljava/lang/Object;
;java.util.TreeMap.ceilingKey(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (select (key ?p0) ?r)
    (forall ((x ?K)) 
        (=> 
            (and (select (key ?p0) x) (>= x ?p1)) 
            (<= ?r x)
        )
    )
))
;java.util.NavigableMap.higherEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
;java.util.TreeMap.higherEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
(assert (and
    (select (key ?p0) (key ?r))
    (forall ((x ?K)) 
        (=> 
            (and (select (key ?p0) x) (> x ?p1))
            (<= (key ?r) x)
        )
    )
    (= (value ?r) (select (mapping ?p0) (key ?r)))
))
;java.util.NavigableMap.higherKey(Ljava/lang/Object;)Ljava/lang/Object;
;java.util.TreeMap.higherKey(Ljava/lang/Object;)Ljava/lang/Object;
(assert (and
    (select (key ?p0) ?r)
    (forall ((x ?K)) 
        (=> 
            (and (select (key ?p0) x) (> x ?p1)) 
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
(assert
    (= ?r (key ?p0))
)
;java.util.Map$Entry.getValue()Ljava/lang/Object;
(assert 
    (= ?r (value ?p0))
)
;java.util.Map$Entry.setValue(Ljava/lang/Object;)Ljava/lang/Object;
(assert 
    (= ?r (value ?p0))
    (= (key ?_p0) (key ?p0))
    (= (value ?_p0) ?p1)
)
;java.util.Iterator.hasNext()Z
(assert 
    (= ?r (ite (exists ((x ?T)) (and
        (= true (select (mapping ?p0) x))
        (= false (select (previous ?p0) x))
    )) 1 0))
)
;java.util.Iterator.next()Ljava/lang/Object;
(assert (and 
    (= true (select (mapping ?p0) ?r))
    (= false (select (previous ?p0) ?r))
    (forall ((x Int)) (=> (and (select (mapping ?p0) x) (not (select (previous ?p0) x))) (>= x ?r)))
    (= (mapping ?_p0) (mapping ?p0))
    (= (previous ?_p0) (store (previous ?p0) ?r true))
))
;java.util.Iterator.remove()V
(assert (and 
    (= (previous ?_p0) (previous ?p0))
    ;error: no ?r
    (= (mapping ?_p0) (store (mapping ?p0) ?r false))
))
;java.util.ListIterator.hasNext()Z
(assert (and 
    (>= (position ?p0) -1)
    (< (position ?p0) (seq.len (element ?p0)))
    (= ?r (ite  
        (< (+ (position ?p0) 1) (seq.len (element ?p0))) 
    1 0))
))
;java.util.ListIterator.next()Ljava/lang/Object;
(assert (and
    (>= (position ?p0) -1)
    (< (position ?p0) (seq.len (element ?p0)))
    (= (seq.unit ?r) (seq.at (element ?p0) (+ (position ?p0) 1)))
    (= (position ?_p0) (+ (position ?p0) 1))
    (= (element ?_p0) (element ?p0))
))
;java.util.ListIterator.hasPrevious()Z
(assert (and
    (>= (position ?p0) -1)
    (< (position ?p0) (seq.len (element ?p0)))
    (= ?r 
        (ite (>= (- (position ?p0) 1) 0) 1 0)
    )
))
;java.util.ListIterator.previous()Ljava/lang/Object;
(assert (and
    (>= (position ?p0) -1)
    (< (position ?p0) (seq.len (element ?p0)))
    (= (seq.unit ?r) (seq.at (element ?p0) (- (position ?p0) 1)))
    (= (position ?_p0) (- (position ?p0) 1))
    (= (element ?_p0) (element ?p0))
))
;java.util.ListIterator.nextIndex()I
(assert (and 
    (>= (position ?p0) -1)
    (< (position ?p0) (seq.len (element ?p0)))
    (= ?r (+ (position ?p0) 1))
))
;java.util.ListIterator.previousIndex()I
(assert (and
    (>= (position ?p0) -1)
    (< (position ?p0) (seq.len (element ?p0)))
    (= ?r (- (position ?p0) 1))
))
;java.util.ListIterator.remove()V
(assert (and
    (>= (position ?p0) -1)
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
    (>= (position ?p0) -1)
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
    (>= (position ?p0) -1)
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
;java.lang.String.<init>()V
;java.lang.StringBuilder.<init>()V
;java.lang.StringBuffer.<init>()V
;java.lang.StringBuilder.<init>(I)V
;java.lang.StringBuffer.<init>(I)V
(assert (= "" ?_p0))
;java.lang.String.<init>(Ljava/lang/String;)V
;java.lang.String.<init>(Ljava/lang/StringBuffer;)V
;java.lang.String.<init>(Ljava/lang/StringBuilder;)V
;java.lang.StringBuilder.<init>(Ljava/lang/String;)V
;java.lang.StringBuffer.<init>(Ljava/lang/String;)V
(assert (= ?p1 ?_p0))
;java.lang.String.equals(Ljava/lang/Object;)Z
;java.lang.String.contentEquals(Ljava/lang/StringBuffer;)Z
;java.lang.String.contentEquals(Ljava/lang/CharSequence;)Z
(assert 
	(= ?r (ite (= ?p0 ?p1) 1 0))
)
;java.lang.String.charAt(I)C
;java.lang.StringBuilder.charAt(I)C
;java.lang.StringBuffer.charAt(I)C
(define-fun CcastI ((c String)) (Int) 
(ite (= c "}") 125 (ite (= c "|") 124 (ite (= c "{") 123 (ite (= c "z") 122 (ite (= c "y") 121 (ite (= c "x") 120 (ite (= c "w") 119 (ite (= c "v") 118 (ite (= c "u") 117 (ite (= c "t") 116 (ite (= c "s") 115 (ite (= c "r") 114 (ite (= c "q") 113 (ite (= c "p") 112 (ite (= c "o") 111 (ite (= c "n") 110 (ite (= c "m") 109 (ite (= c "l") 108 (ite (= c "k") 107 (ite (= c "j") 106 (ite (= c "i") 105 (ite (= c "h") 104 (ite (= c "g") 103 (ite (= c "f") 102 (ite (= c "e") 101 (ite (= c "d") 100 (ite (= c "c") 99 (ite (= c "b") 98 (ite (= c "a") 97 (ite (= c "`") 96 (ite (= c "_") 95 (ite (= c "^") 94 (ite (= c "]") 93 (ite (= c "\") 92 (ite (= c "[") 91 (ite (= c "Z") 90 (ite (= c "Y") 89 (ite (= c "X") 88 (ite (= c "W") 87 (ite (= c "V") 86 (ite (= c "U") 85 (ite (= c "T") 84 (ite (= c "S") 83 (ite (= c "R") 82 (ite (= c "Q") 81 (ite (= c "P") 80 (ite (= c "O") 79 (ite (= c "N") 78 (ite (= c "M") 77 (ite (= c "L") 76 (ite (= c "K") 75 (ite (= c "J") 74 (ite (= c "I") 73 (ite (= c "H") 72 (ite (= c "G") 71 (ite (= c "F") 70 (ite (= c "E") 69 (ite (= c "D") 68 (ite (= c "C") 67 (ite (= c "B") 66 (ite (= c "A") 65 (ite (= c "@") 64 (ite (= c "?") 63 (ite (= c ">") 62 (ite (= c "=") 61 (ite (= c "<") 60 (ite (= c ";") 59 (ite (= c ":") 58 (ite (= c "9") 57 (ite (= c "8") 56 (ite (= c "7") 55 (ite (= c "6") 54 (ite (= c "5") 53 (ite (= c "4") 52 (ite (= c "3") 51 (ite (= c "2") 50 (ite (= c "1") 49 (ite (= c "0") 48 (ite (= c "/") 47 (ite (= c ".") 46 (ite (= c "-") 45 (ite (= c ",") 44 (ite (= c "+") 43 (ite (= c "*") 42 (ite (= c ")") 41 (ite (= c "(") 40 (ite (= c "'") 39 (ite (= c "&") 38 (ite (= c "%") 37 (ite (= c "$") 36 (ite (= c "#") 35 (ite (= c """") 34 (ite (= c "!") 33 (ite (= c " ") 32 126)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(assert 
	(= ?r (CcastI (str.at ?p0 ?p1)))
)
;java.lang.String.length()I
;java.lang.StringBuilder.length()I
;java.lang.StringBuffer.length()I
(assert (= ?r (str.len ?p0)))
;java.lang.String.isEmpty()Z
(assert (= ?r (ite (= (str.len ?p0) 0) 1 0)))
;java.lang.String.startsWith(Ljava/lang/String;)Z
(assert (= ?r 
	(ite (str.prefixof ?p1 ?p0) 1 0)
))
;java.lang.String.startsWith(Ljava/lang/String;I)Z
(assert (= ?r 
	(ite 
		(str.prefixof ?p1
			(str.substr ?p0 ?p2 (- (str.len ?p0) ?p2))
		)
		1 0)
))
;java.lang.String.endsWith(Ljava/lang/String;)Z
(assert (= ?r 
	(ite (str.suffixof ?p1 ?p0) 1 0)
))
;java.lang.String.indexOf(Ljava/lang/String;)I
;java.lang.StringBuilder.indexOf(Ljava/lang/String;)I
;java.lang.StringBuffer.indexOf(Ljava/lang/String;)I
(assert (= ?r
	(str.indexof ?p0 ?p1)
))
;java.lang.String.indexOf(Ljava/lang/String;I)I
;java.lang.StringBuilder.indexOf(Ljava/lang/String;I)I
;java.lang.StringBuffer.indexOf(Ljava/lang/String;I)I
(assert (= ?r
	(str.indexof ?p0 ?p1 ?p2)
))
;java.lang.String.substring(I)Ljava/lang/String;
(assert (= ?r
	(str.substr ?p0 ?p1 (- (str.len ?p0) ?p1))
))
;java.lang.String.substring(II)Ljava/lang/String;
;java.lang.String.subSequence(II)Ljava/lang/CharSequence;
(assert (= ?r
	(str.substr ?p0 ?p1 (- ?p2 ?p1))
))
;java.lang.String.concat(Ljava/lang/String;)Ljava/lang/String;
(assert (= ?r (str.++ ?p0 ?p1)))
;java.lang.StringBuilder.append(Ljava/lang/String;)Ljava/lang/StringBuilder;
;java.lang.StringBuilder.append(Ljava/lang/StringBuffer;)Ljava/lang/StringBuilder;
;java.lang.StringBuffer.append(Ljava/lang/String;)Ljava/lang/StringBuffer;
;java.lang.StringBuffer.append(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;
(assert (and (= ?r ?_p0) (= ?_p0 (str.++ ?p0 ?p1))))
;java.lang.StringBuilder.append(Z)Ljava/lang/StringBuilder;
;java.lang.StringBuilder.append(C)Ljava/lang/StringBuilder;
;java.lang.StringBuilder.append(I)Ljava/lang/StringBuilder;
;java.lang.StringBuilder.append(J)Ljava/lang/StringBuilder;
;java.lang.StringBuffer.append(Z)Ljava/lang/StringBuffer;
;java.lang.StringBuffer.append(C)Ljava/lang/StringBuffer;
;java.lang.StringBuffer.append(I)Ljava/lang/StringBuffer;
;java.lang.StringBuffer.append(J)Ljava/lang/StringBuffer;
(define-fun IcastC ((n Int)) (String) 
(ite (= n 125) "}" (ite (= n 124) "|" (ite (= n 123) "{" (ite (= n 122) "z" (ite (= n 121) "y" (ite (= n 120) "x" (ite (= n 119) "w" (ite (= n 118) "v" (ite (= n 117) "u" (ite (= n 116) "t" (ite (= n 115) "s" (ite (= n 114) "r" (ite (= n 113) "q" (ite (= n 112) "p" (ite (= n 111) "o" (ite (= n 110) "n" (ite (= n 109) "m" (ite (= n 108) "l" (ite (= n 107) "k" (ite (= n 106) "j" (ite (= n 105) "i" (ite (= n 104) "h" (ite (= n 103) "g" (ite (= n 102) "f" (ite (= n 101) "e" (ite (= n 100) "d" (ite (= n 99) "c" (ite (= n 98) "b" (ite (= n 97) "a" (ite (= n 96) "`" (ite (= n 95) "_" (ite (= n 94) "^" (ite (= n 93) "]" (ite (= n 92) "\" (ite (= n 91) "[" (ite (= n 90) "Z" (ite (= n 89) "Y" (ite (= n 88) "X" (ite (= n 87) "W" (ite (= n 86) "V" (ite (= n 85) "U" (ite (= n 84) "T" (ite (= n 83) "S" (ite (= n 82) "R" (ite (= n 81) "Q" (ite (= n 80) "P" (ite (= n 79) "O" (ite (= n 78) "N" (ite (= n 77) "M" (ite (= n 76) "L" (ite (= n 75) "K" (ite (= n 74) "J" (ite (= n 73) "I" (ite (= n 72) "H" (ite (= n 71) "G" (ite (= n 70) "F" (ite (= n 69) "E" (ite (= n 68) "D" (ite (= n 67) "C" (ite (= n 66) "B" (ite (= n 65) "A" (ite (= n 64) "@" (ite (= n 63) "?" (ite (= n 62) ">" (ite (= n 61) "=" (ite (= n 60) "<" (ite (= n 59) ";" (ite (= n 58) ":" (ite (= n 57) "9" (ite (= n 56) "8" (ite (= n 55) "7" (ite (= n 54) "6" (ite (= n 53) "5" (ite (= n 52) "4" (ite (= n 51) "3" (ite (= n 50) "2" (ite (= n 49) "1" (ite (= n 48) "0" (ite (= n 47) "/" (ite (= n 46) "." (ite (= n 45) "-" (ite (= n 44) "," (ite (= n 43) "+" (ite (= n 42) "*" (ite (= n 41) ")" (ite (= n 40) "(" (ite (= n 39) "'" (ite (= n 38) "&" (ite (= n 37) "%" (ite (= n 36) "$" (ite (= n 35) "#" (ite (= n 34) """" (ite (= n 33) "!" (ite (= n 32) " " "~")))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(assert (and (= ?r ?_p0) (= ?_p0 (str.++ ?p0 (IcastC ?p1)))))
;java.lang.String.contains(Ljava/lang/CharSequence;)Z
(assert (= ?r 
	(ite (str.contains ?p0 ?p1) 1 0)
))
;java.lang.String.toString()Ljava/lang/String;
;java.lang.StringBuilder.toString()Ljava/lang/String;
;java.lang.StringBuffer.toString()Ljava/lang/String;
(assert (= ?r ?p0))
;java.lang.String.valueOf(Z)Ljava/lang/String;
(assert (= ?r
	(ite (= ?p0 1) "true" "false")
))
;java.lang.String.valueOf(C)Ljava/lang/String;
(define-fun IcastC ((n Int)) (String) 
(ite (= n 125) "}" (ite (= n 124) "|" (ite (= n 123) "{" (ite (= n 122) "z" (ite (= n 121) "y" (ite (= n 120) "x" (ite (= n 119) "w" (ite (= n 118) "v" (ite (= n 117) "u" (ite (= n 116) "t" (ite (= n 115) "s" (ite (= n 114) "r" (ite (= n 113) "q" (ite (= n 112) "p" (ite (= n 111) "o" (ite (= n 110) "n" (ite (= n 109) "m" (ite (= n 108) "l" (ite (= n 107) "k" (ite (= n 106) "j" (ite (= n 105) "i" (ite (= n 104) "h" (ite (= n 103) "g" (ite (= n 102) "f" (ite (= n 101) "e" (ite (= n 100) "d" (ite (= n 99) "c" (ite (= n 98) "b" (ite (= n 97) "a" (ite (= n 96) "`" (ite (= n 95) "_" (ite (= n 94) "^" (ite (= n 93) "]" (ite (= n 92) "\" (ite (= n 91) "[" (ite (= n 90) "Z" (ite (= n 89) "Y" (ite (= n 88) "X" (ite (= n 87) "W" (ite (= n 86) "V" (ite (= n 85) "U" (ite (= n 84) "T" (ite (= n 83) "S" (ite (= n 82) "R" (ite (= n 81) "Q" (ite (= n 80) "P" (ite (= n 79) "O" (ite (= n 78) "N" (ite (= n 77) "M" (ite (= n 76) "L" (ite (= n 75) "K" (ite (= n 74) "J" (ite (= n 73) "I" (ite (= n 72) "H" (ite (= n 71) "G" (ite (= n 70) "F" (ite (= n 69) "E" (ite (= n 68) "D" (ite (= n 67) "C" (ite (= n 66) "B" (ite (= n 65) "A" (ite (= n 64) "@" (ite (= n 63) "?" (ite (= n 62) ">" (ite (= n 61) "=" (ite (= n 60) "<" (ite (= n 59) ";" (ite (= n 58) ":" (ite (= n 57) "9" (ite (= n 56) "8" (ite (= n 55) "7" (ite (= n 54) "6" (ite (= n 53) "5" (ite (= n 52) "4" (ite (= n 51) "3" (ite (= n 50) "2" (ite (= n 49) "1" (ite (= n 48) "0" (ite (= n 47) "/" (ite (= n 46) "." (ite (= n 45) "-" (ite (= n 44) "," (ite (= n 43) "+" (ite (= n 42) "*" (ite (= n 41) ")" (ite (= n 40) "(" (ite (= n 39) "'" (ite (= n 38) "&" (ite (= n 37) "%" (ite (= n 36) "$" (ite (= n 35) "#" (ite (= n 34) """" (ite (= n 33) "!" (ite (= n 32) " " "~")))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(assert (= ?r (IcastC ?p0)))
;java.lang.String.valueOf(I)Ljava/lang/String;
;java.lang.Integer.toString()Ljava/lang/String;
(assert (= ?r (int.to.str ?p0)))
;java.lang.String.valueOf(J)Ljava/lang/String;
(assert (= ?r (int.to.str ?p0)))
;java.lang.Integer.valueOf(I)Ljava/lang/Integer;
;java.lang.Integer.intValue()I
(assert (= ?r ?p0))
;java.lang.Integer.sum(II)I
(assert (= ?r (+ ?p0 ?p1)))
;java.lang.Integer.max(II)I
(assert (= ?r (ite (> ?p0 ?p1) ?p0 ?p1)))
;java.lang.Integer.min(II)I
(assert (= ?r (ite (< ?p0 ?p1) ?p0 ?p1)))
;java.lang.Integer.compareTo(Ljava/lang/Integer;)I
(assert (= ?r
	(ite (= ?p0 ?p1) 0 
		(ite (> ?p0 ?p1) 1 -1)
	)
))
;java.lang.Integer.parseInt(Ljava/lang/String;)I
(assert (= ?r (str.to.int ?p0)))
;java.io.FileInputStream.<init>(Ljava/lang/String;)V
(assert (and 
    (>= (length ?_p0) 0) (<= (length ?_p0) 2048)
    (= (readPosition ?_p0) 0)
    (= (isOpen ?_p0) true)
))
;java.io.InputStream.read([B)I
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
;java.io.InputStream.close()V
;java.io.FileInputStream.close()V
(assert (= (isOpen ?p0) true))
(assert (= (isOpen ?_p0) false))
;return_equal(XX)V
(assert (= ?p0 ?p1))
;java.security.MessageDigest.update([BII)V
(assert ;pre
    (and 
        (>= ?p2 0)
        (< ?p2 (seq.len (element ?p1)))
        (> ?p3 0)
        (<= (+ ?p2 ?p3) (seq.len (element ?p1)))
    )
);post
(assert true)
;END