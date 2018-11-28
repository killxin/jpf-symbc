;COLLECTION
(declare-datatypes (T) ((Collection (mk-pair (element (Array Int T)) (size Int)))))
;ARRAYLIST
(declare-datatypes (T) ((ArrayList (mk-pair (element (Array Int T)) (size Int) (capacity Int)))))
;FILEINPUTSTREAM
(declare-datatypes ((FileInputStream (mk-pair (content (ArrayList Int)) (readPosition Int) (isOpen Bool)))))
;START
;java.util.ArrayList.<init>(I)V
(assert (and 
    (= (capacity ?_p0) ?p1) 
    (= (size ?_p0) 0)
))
;java.util.ArrayList.<init>()V
(assert (and 
    (= (capacity ?_p0) 10)
    (= (size ?_p0) 0)
))
;java.util.ArrayList.<init>(Ljava/util/Collection;)V
(assert (and
    (= (capacity ?_p0) (size ?p1))
    (= (size ?_p0) (size ?p1))
    (= (element ?_p0) (element ?p1))
))
;java.util.ArrayList.trimToSize()V
(assert (and 
    (= (element ?_p0) (element ?p0)) 
    (= (size ?_p0) (size ?p0))
    (= (capacity ?_p0) (size ?p0))
))
;java.util.ArrayList.ensureCapacity(I)V
(assert (and 
    (>= ?p1 (size ?p0))
    (= (element ?_p0) (element ?p0))
    (= (size ?_p0) (size ?p0))
    (= (capacity ?_p0) ?p1)
))
;java.util.ArrayList.size()I
(assert (= ?r (size ?p0)))
;java.util.ArrayList.isEmpty()Z
(assert (= ?r (= (size ?p0) 0)))
;java.util.ArrayList.contains(Ljava/lang/Object;)Z
(assert (= ?r (exists ((x Int)) (and (>= x 0) (< x (size ?p0)) (= (select (element ?p0) x) ?p1)))))
;java.util.ArrayList.indexOf(Ljava/lang/Object;)I
(assert (and 
    (>= ?r 0) 
    (< ?r (size ?p0)) 
    (= (select (element ?p0) ?r) ?p1)
    (forAll ((x Int)) (=> (and (>= x 0) (< x ?r)) (not (= (select (element ?p0) x) ?p1))))
))
;java.util.ArrayList.lastIndexOf(Ljava/lang/Object;)I
(assert (and 
    (>= ?r 0)
    (< ?r (size ?p0))
    (= (select (element ?p0) ?r) ?p1)
    (forAll ((x Int)) (=> (and (> x ?r) (< x (size ?p0))) (not (= (select (element ?p0) x) ?p1))))
))
;java.util.ArrayList.clone()Ljava/lang/Object;
(assert (and
    (= (capacity ?r) (capacity ?p0))
    (= (size ?r) (size ?p0))
    (= (element ?r) (element ?p0))
))
;java.util.ArrayList.toArray()[Ljava/lang/Object;
(assert (and
    (= (size ?r) (size ?p0))
    (forAll (x Int) 
        (=> (and (> x 0) (<= x (size ?p0))) 
            (= (select (element ?r) x) (select (element ?p0) x))))
))
;java.util.ArrayList.toArray([Ljava/lang/Object;)[Ljava/lang/Object;
(assert (and 
    (= (size ?r) (size ?p0))
    (forAll (x Int)
        (=> (and (> x 0) (<= x (size ?p0))) 
            (= (select (element ?r) x) (select (element ?p0) x))))
))
;java.util.ArrayList.get(I)Ljava/lang/Object;
(assert (and
    (>= ?p1 0)
    (< ?p1 (size ?p0))
    (= ?r (select (element ?p0) ?p1))
))
;java.util.ArrayList.set(ILjava/lang/Object;)Ljava/lang/Object;
(assert (and 
    (>= ?p1 0) 
    (< ?p1 (size ?p0))
    (= (select (element ?p0) ?p1) ?r)
))
(assert (and
    (= (size ?_p0) (size ?p0))
    (= (capacity ?_p0) (size ?_p0))
    (= (select (element ?_p0) ?p1) ?p2)
    (forAll ((x Int)) (=> (and (>= x 0) (< x ?p1)) (= (select (element ?_p0) x) (select (element ?p0) x))))
    (forAll ((x Int)) (=> (and (> x ?p1) (< x (size ?p0))) (= (select (element ?_p0) x) (select (element ?p0) x))))
))
;java.util.ArrayList.add(Ljava/lang/Object;)Z
(assert (= ?r true))
(assert (and
    (= (size ?_p0) (+ (size ?p0) 1))
    (= (capacity ?_p0) (size ?_p0))
    (= (select (element ?_p0) (size ?p0)) ?p1)
    (forAll ((x Int)) (=> (and (>= x 0) (< x (size ?p0))) (= (select (element ?_p0) x) (select (element ?p0) x))))
    (forAll ((x Int)) (=> (and (>= x (size ?p0)) (< x (size ?p0))) (= (select (element ?_p0) (+ x 1)) (select (element ?p0) x))))
))
;java.util.ArrayList.add(ILjava/lang/Object;)V
(assert (and 
    (= (size ?_p0) (+ (size ?p0) 1))
    (= (capacity ?_p0) (size ?_p0))
    (= (select (element ?_p0) ?p1) ?p2)
    (forAll ((x Int)) (=> (and (>= x 0) (< x ?p1)) (= (select (element ?_p0) x) (select (element ?p0) x))))
    (forAll ((x Int)) (=> (and (>= x ?p1) (< x (size ?p0))) (= (select (element ?_p0) (+ x 1)) (select (element ?p0) x))))
))
;java.util.ArrayList.remove(I)Ljava/lang/Object;
(assert (= ?r true))
(assert (and 
    (= (size ?_p0) (- (size ?p0) 1))
    (= (capacity ?_p0) (size ?_p0))
    (forAll ((x Int)) (=> (and (>= x 0) (< x ?p1)) (= (select (element ?_p0) x) (select (element ?p0) x))))
    (forAll ((x Int)) (=> (and (> x ?p1) (< x (size ?p0))) (= (select (element ?_p0) (- x 1)) (select (element ?p0) x))))
))
;java.util.ArrayList.remove(Ljava/lang/Object;)Z
(assert (ite (exists ((x Int)) (and (>= x 0) (< x (size ?p0)) (= (select (element ?p0) x) ?p1)
            (forAll ((y Int)) (=> (and (>= y 0) (< y x)) (not (= (select (element ?p0) y) ?p1))))
            (forAll ((y Int)) (=> (and (> y x) (< y (size ?p0)) (= (select (element ?_p0) (- y 1)) (select (element ?p0) y)))))))
    (and (= ?r true) (= (size ?_p0) (- (size ?p0) 1)) (= (capacity ?_p0) (capacity ?p0)))
    (and (= ?r false) (= (size ?_p0) (size ?p0)) (= (capacity ?_p0) (capacity ?p0)))))
;java.util.ArrayList.clear()V
(assert (= (capacity ?_p0) 0))
(assert (= (size ?_p0) 0))
;java.util.ArrayList.addAll(Ljava/util/Collection;)Z
(assert (and 
    (= (size ?_p0) (+ (size ?p0) (size ?p1)))
    (= (capacity ?_p0) (size ?_p0))
    (forAll (x Int) (=> (and (>= x 0) (< x (size ?p1))) 
        (= (select (element ?_p0) (+ (size ?p0) x)) (select (element ?p1) x)))) 
    (forAll ((x Int)) (=> (and (>= x 0) (< x (size ?p0))) (= (select (element ?_p0) x) (select (element ?p0) x))))
    (forAll ((x Int)) (=> (and (>= x (size ?p0)) (< x (size ?p0))) (= (select (element ?_p0) (+ x (size ?p1))) (select (element ?p0) x))))
))
;java.util.ArrayList.addAll(ILjava/util/Collection;)Z
(assert (and 
    (= (size ?_p0) (+ (size ?p0) (size ?p2)))
    (= (capacity ?_p0) (size ?_p0))
    (forAll (x Int) (=> (and (> x 0) (<= x (size ?p2))) 
        (= (select (element ?_p0) (+ ?p1 x)) (select (element ?p2) x)))) 
    (forAll ((x Int)) (=> (and (>= x 0) (< x ?p1)) (= (select (element ?_p0) x) (select (element ?p0) x))))
    (forAll ((x Int)) (=> (and (>= x ?p1) (< x (size ?p0))) (= (select (element ?_p0) (+ x (size ?p2))) (select (element ?p0) x))))
))
;java.util.ArrayList.removeRange(II)V
(assert (and 
    (= (size ?_p0) (- (size ?p0) (- ?p2 ?p1)))
    (= (capacity ?_p0) (size ?_p0))
    (forAll (x Int) (=> (and (>= x 0) (< x (size ?p0)))
        (ite (and (>= x ?p1) (< x ?p2)) 
            (= (select (element ?_p0) x) (select (element ?_p0) (+ x (- ?p2 ?p1))))
            (= (select (element ?_p0) (+ (size ?p0) x)) (select (element ?p1) x)))) 
    (forAll ((x Int)) (=> (and (>= x 0) (< x (size ?p0))) (= (select (element ?_p0) x) (select (element ?p0) x))))
    (forAll ((x Int)) (=> (and (>= x (size ?p0)) (< x (size ?p0))) (= (select (element ?_p0) (+ x (size ?p1))) (select (element ?p0) x))))
))

;java.util.ArrayList.removeAll(Ljava/util/Collection;)Z

;java.util.ArrayList.retainAll(Ljava/util/Collection;)Z
	
;java.util.ArrayList.subList(II)Ljava/util/List;

;java.util.ArrayList.add(Ljava/lang/Object;)Z
(assert (= (size ?_p0) (+ (size ?p0) 1)))
(assert (= (select (element ?_p0) (- (size ?_p0) 1)) ?p1))
(assert (forall ((x Int)) (=> (and (>= x 0) (< x (size ?p0))) (= (select (element ?_p0) x) (select (element ?p0) x)))))
;java.util.ArrayList.get(I)Ljava/lang/Object;
(assert (and (>= ?p1 0) (< ?p1 (size ?p0))))
(assert (= ?r (select (element ?p0) ?p1)))
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
