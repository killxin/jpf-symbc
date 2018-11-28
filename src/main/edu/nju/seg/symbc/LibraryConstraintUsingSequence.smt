;COLLECTION
(declare-datatypes (T) ((Collection ((element (Seq T))))))
;ARRAYLIST
(declare-datatypes (T) ((ArrayList (mk-pair (element (Sequence T))))))
;FILEINPUTSTREAM
(declare-datatypes ((FileInputStream (mk-pair (content (ArrayList Int)) (readPosition Int) (isOpen Bool)))))
;START
;java.util.ArrayList.<init>(I)V
(assert (= (seq.len (element ?_p0)) 0))
;java.util.ArrayList.<init>()V
(assert (= (seq.len (element ?_p0)) 0))
;java.util.ArrayList.<init>(Ljava/util/Collection;)V
(assert (= (element ?_p0) (element ?p1)))
;java.util.ArrayList.trimToSize()V
(assert true)
;java.util.ArrayList.ensureCapacity(I)V
(assert true)
;java.util.ArrayList.size()I
(assert (= ?r (seq.len (element ?p0))))
;java.util.ArrayList.isEmpty()Z
(assert (= ?r (= (seq.len (element ?p0)) 0)))
;java.util.ArrayList.contains(Ljava/lang/Object;)Z
(assert (= ?r (seq.contains (element ?p0) (seq.unit ?p1))))
;java.util.ArrayList.indexOf(Ljava/lang/Object;)I
(assert (= ?r (seq.indexof (element ?p0) (seq.unit ?p1))))
;java.util.ArrayList.lastIndexOf(Ljava/lang/Object;)I
(assert (= ?r (seq.indexof (element ?p0) (seq.unit ?p1) ?r)))
;java.util.ArrayList.clone()Ljava/lang/Object;
(assert (= (element ?r) (element ?p0)))
;java.util.ArrayList.toArray()[Ljava/lang/Object;
(assert (= (element ?r) (element ?p0)))
;java.util.ArrayList.toArray([Ljava/lang/Object;)[Ljava/lang/Object;
(assert (and 
    (= (element ?_p1) (element ?p0))
    (= ?r ?_p1)
))
;java.util.ArrayList.get(I)Ljava/lang/Object;
(assert (= ?r (seq.at (element ?p0) ?p1)))
;java.util.ArrayList.set(ILjava/lang/Object;)Ljava/lang/Object;
(assert (= ?r (seq.at (element ?p0) ?p1)))
(assert (and 
    (let ((size (seq.len (element ?p0))))
        (= (element ?_p0) (seq.++ 
            (seq.extract (element ?p0) 0 ?p1)
            (seq.unit ?p2)
            (seq.extract (element ?p0) (+ ?p1 1) (- (- size ?p1) 1)))))
))
;java.util.ArrayList.add(Ljava/lang/Object;)Z
(assert (= ?r true))
(assert (and 
    (let ((size (seq.len (element ?p0))))
        (= (element ?_p0) (seq.++ 
            (seq.extract (element ?p0) 0 (size ?p0))
            (seq.unit ?p1)
            (seq.extract (element ?p0) (size ?p0) (- size (size ?p0))))))
))
;java.util.ArrayList.add(ILjava/lang/Object;)V
(assert (and
    (let ((size (seq.len (element ?p0))))
        (= (element ?_p0) (seq.++ 
            (seq.extract (element ?p0) 0 ?p1)
            (seq.unit ?p2)
            (seq.extract (element ?p0) ?p1 (- size ?p1)))))
))
;java.util.ArrayList.remove(I)Ljava/lang/Object;
(assert (and 
    (= ?r true)
    (let ((size (seq.len (element ?p0))))
        (= (element ?_p0) (seq.++ 
            (seq.extract (element ?p0) 0 ?p1)
            (seq.extract (element ?p0) (+ ?p1 1) (- (- size ?p1) 1)))))
))
;java.util.ArrayList.remove(Ljava/lang/Object;)Z
(assert (and 
    (= ?r true)
    (let ((size (seq.len (element ?p0)))(idx (seq.indexof (element ?p0) ?p1)))
        (= (element ?_p0) (seq.++
            (seq.extract (element ?p0) 0 idx)
            (seq.extract (element ?p0) (+ idx 1) (- (- size idx) 1)))))
))
;java.util.ArrayList.clear()V
(assert (= (seq.len (element ?_p0)) 0))
;java.util.ArrayList.addAll(Ljava/util/Collection;)Z
(assert 
    (let ((size (seq.len (element ?p0))))
        (= (element ?_p0) (seq.++
            (seq.extract (element ?p0) 0 (seq.len (element ?p0)))
            ?p1
            (seq.extract (element ?p0) (seq.len (element ?p0)) (- size (seq.len (element ?p0)))))))
)
;java.util.ArrayList.addAll(ILjava/util/Collection;)Z
(assert 
    (let ((size (seq.len (element ?p0))))
        (= (element ?_p0) (seq.++
            (seq.extract (element ?p0) 0 ?p1)
            ?p2
            (seq.extract (element ?p0) ?p1 (- size ?p1)))))
)
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
;java.io.FileInputStream.<init>(Ljava/lang/String;)V
(assert (and (>= (size (content ?_p0)) 0) (<= (size (content ?_p0)) 4096)))
(assert (= (readPosition ?_p0) 0))
(assert (= (isOpen ?_p0) true))
;java.io.FileInputStream.read([B)I
(assert (= (isOpen ?p0) true))
(assert (ite (= (readPosition ?p0) (size (content ?p0))) 
            (and (= ?r -1) (= (readPosition ?_p0) 0))
            (and 
                (ite (>= (+ (readPosition ?p0) (size ?p1)) (size (content ?p0)))
                    (= ?r (- (size (content ?p0)) (readPosition ?p0)))
                    (= ?r (size ?p1)))
                (= (readPosition ?_p0) (+ (readPosition ?p0) ?r))
                (forall ((x Int))
                    (=> (and (>= x 0) (< x ?r)) 
                        (= (select (element ?_p1) x) (select (element (content ?p0)) (+ (readPosition ?p0) x)))
                ))
                (forall ((x Int))
                    (=> (and (>= x ?r) (< x (size ?p1))) 
                        (= (select (element ?_p1) x) (select (element ?p1) x))
                ))
            )))
(assert (= (size ?_p1) (size ?p1)))
(assert (= (content ?_p0) (content ?p0)))
(assert (= (isOpen ?_p0) true))
;java.io.FileInputStream.close()V
(assert (= (isOpen ?p0) true))
(assert (= (isOpen ?_p0) false))
;END
