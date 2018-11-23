;ARRAYLIST
(declare-datatypes (T) ((ArrayList (mk-pair (element (Array Int T)) (size Int)))))
;FILEINPUTSTREAM
(declare-datatypes ((FileInputStream (mk-pair (content (ArrayList Int)) (readPoint Int) (isOpen Bool)))))
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
(assert (>= (size (content ?_p0)) 0))
(assert (= (readPoint ?_p0) 0))
(assert (= (isOpen ?_p0) true))
;java.io.FileInputStream.read([B)I
(assert (= (isOpen ?p0) true))
(assert (ite (= (readPoint ?p0) (size (content ?p0))) 
            (and (= ?r -1) (= (readPoint ?_p0) 0))
            (and 
                (ite (> (+ (readPoint ?p0) (size ?p1)) (size (content ?p0)))
                    (= ?r (- (size (content ?p0)) (readPoint ?p0)))
                    (= ?r (size ?p1)))
                (= (readPoint ?_p0) (+ (readPoint ?p0) ?r))
            )))
(assert (= (size ?p1) (size ?_p1)))
(assert (forall ((x Int))
        (=> (and (>= x 0) (< x ?r)) 
                (= (select (element ?_p1) x) (select (element (content ?p0)) (+ (readPoint ?p0) x)))
            )))
(assert (forall ((x Int))
        (=> (and (>= x ?r) (< x (size ?p1))) 
                (= (select (element ?_p1) x) (select (element ?p1) x))
            )))
(assert (= (content ?_p0) (content ?p0)))
(assert (= (isOpen ?_p0) (isOpen ?p0)))
;java.io.FileInputStream.close()V
(assert (= (isOpen ?p0) true))
(assert (= (isOpen ?_p0) false))
;END
