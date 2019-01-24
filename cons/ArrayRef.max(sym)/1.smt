;Data Structure
(declare-datatypes (T) (
    (MySet (mk-pair (mapping (Array T Bool))))
    (MyList (mk-pair (mapping (Array T Bool)) (element (Seq T))))
    (MyIterator (mk-pair (mapping (Array T Bool)) (previous (Array T Bool))))
    (MyListIterator (mk-pair (position Int) (element (Seq T))))
))
(declare-datatypes (K V) (
    (MyEntry (mk-pair (key K) (value V)))
    (MyMap (mk-pair (key (Array K Bool)) (mapping (Array K V))))
))
(declare-datatypes () (
    (FileInputStream (mk-pair (length Int) (readPosition Int) (isOpen Bool)))
))
(define-fun-rec s!ze ((a!1 (Array Int Bool)) (x!1 Int)) Int (ite (< x!1 -10) 0 (ite (= true (select a!1 x!1)) (+ (s!ze a!1 (- x!1 1)) 1) (s!ze a!1 (- x!1 1)))))
(declare-fun array_1_SYMARRAY () (MyList Int))
(declare-fun ret_2_SYMINT () Int)
(declare-fun length_3_SYMINT () Int)
(assert (and 
(>= length_3_SYMINT (- 2147483648))
(<= length_3_SYMINT 2147483647)
(>= 1 length_3_SYMINT)
(let ((a!1 (=> (> length_3_SYMINT 0) (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_3_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_3_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(>= ret_2_SYMINT (- 2147483648))
(<= ret_2_SYMINT 2147483647)
(and (>= 0 0)
     (< 0 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_2_SYMINT) (seq.at (element array_1_SYMARRAY) 0)))
))
;
(declare-const retMain_4_SYMINT Int)
(assert (= retMain_4_SYMINT ret_2_SYMINT))
;(define-fun array_1_SYMARRAY () List_Int
;  (List_Int (lambda ((x!1 Int)) (= x!1 10)) (seq.unit (- 2147481852))))
;(define-fun ret_2_SYMINT () Int
;  (- 2147481852))
;(define-fun length_3_SYMINT () Int
;  1)