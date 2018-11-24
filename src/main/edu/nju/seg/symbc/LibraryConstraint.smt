;ARRAYLIST
(declare-datatypes (T) ((ArrayList (mk-pair (element (Array Int T)) (size Int)))))
;FILEINPUTSTREAM
(declare-datatypes ((FileInputStream (mk-pair (content (ArrayList Int)) (readPosition Int) (isOpen Bool)))))
;START
;java.util.ArrayList.<init>(I)V
(assert (= (size ?_p0) ?p1))
;java.util.ArrayList.<init>()V
(assert (= (size ?_p0) 0))
;java.util.ArrayList.add(Ljava/lang/Object;)Z
(assert (= (size ?_p0) (+ (size ?p0) 1)))
(assert (= (select (element ?_p0) (- (size ?_p0) 1)) ?p1))
(assert (forall ((x Int)) (=> (and (>= x 0) (< x (size ?p0))) (= (select (element ?_p0) x) (select (element ?p0) x)))))
;java.util.ArrayList.get(I)Ljava/lang/Object;
(assert (and (>= ?p1 0) (< ?p1 (size ?p0))))
(assert (= ?r (select (element ?p0) ?p1)))
;java.io.FileInputStream.<init>(Ljava/lang/String;)V
(assert (and (>= (size (content ?_p0)) 1024) (<= (size (content ?_p0)) 4096)))
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
