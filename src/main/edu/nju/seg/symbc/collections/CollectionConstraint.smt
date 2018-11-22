;ARRAYLIST
(declare-datatypes (T) ((ArrayList (mk-pair (element (Array Int T)) (size Int)))))
;START
;java.util.ArrayList.<init>()V
(assert (= (size ?b) 0))
;java.util.ArrayList.add(Ljava/lang/Object;)Z
(assert (= (size ?_b) (+ (size ?b) 1)))
(assert (= (select (element ?_b) (- (size ?_b) 1)) ?p0))
(assert (forall ((x Int)) (=> (and (>= x 0) (< x (size ?b))) (= (select (element ?_b) x) (select (element ?b) x)))))
;java.util.ArrayList.get(I)Ljava/lang/Object;
(assert (and (>= ?p0 0) (< ?p0 (size ?b))))
(assert (= ?r (select (element ?b) ?p0)))
;END