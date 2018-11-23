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
        (=> (and (>= x ?r) (< x (size ?_p1))) 
                (= (select (element ?_p1) x) (select (element ?p1) x))
            )))
;java.io.FileInputStream.close()V
(assert (= (isOpen ?p0) true))
(assert (= (isOpen ?_p0) false))
;END

;ARRAYLIST
(declare-datatypes (T) (
  (ArrayList (mk-pair (element (Array Int T)) (size Int)))
))
(declare-datatypes () (
  (FileInputStream (mk-pair (content (ArrayList Int)) (readPoint Int) (isOpen Bool)))
))
(declare-const AB357_4_SYMOBJECT (ArrayList Int))
(declare-const AB357_5_SYMOBJECT (ArrayList Int))
(declare-const FI352_3_SYMOBJECT FileInputStream)
(declare-const FI352_6_SYMOBJECT FileInputStream)
(declare-const rEturn_7_SYMINT Int)
(assert (= (isOpen FI@352_3_SYMOBJECT) true))
(assert (ite (= (readPoint FI@352_3_SYMOBJECT) (size (content FI@352_3_SYMOBJECT))) 
            (and (= rEturn_7_SYMINT -1) (= (readPoint FI@352_6_SYMOBJECT) 0)) 
            (and 
                (ite (> (+ (readPoint FI@352_3_SYMOBJECT) (size AB@357_4_SYMOBJECT)) (size (content FI@352_3_SYMOBJECT))
                    (= rEturn_7_SYMINT (- (size (content FI@352_3_SYMOBJECT)) (readPiont FI@352_3_SYMOBJECT)))
                    (= rEturn_7_SYMINT (size AB@357_4_SYMOBJECT))))
                (= (readPoint FI@352_6_SYMOBJECT) (+ (readPoint FI@352_3_SYMOBJECT) rEturn_7_SYMINT))
            )))
(assert (= (size AB@357_4_SYMOBJECT) (size AB@357_5_SYMOBJECT)))
(assert (forall ((x Int))
            (=> (and (>= x 0) (< x rEturn_7_SYMINT)) 
                (= (select (element AB@357_5_SYMOBJECT) x) (select (element (content FI@352_3_SYMOBJECT) (+ (readPoint FI@352_3_SYMOBJECT) x))))
            )))
(assert (forall ((x Int))
        (=> (and (>= x rEturn_7_SYMINT) (< x (size AB@357_5_SYMOBJECT))) 
                (= (select (element AB@357_5_SYMOBJECT) x) (select (element AB@357_4_SYMOBJECT)))
            )))

(check-sat)
(get-model)
