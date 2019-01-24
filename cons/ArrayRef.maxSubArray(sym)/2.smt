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
(declare-fun nums_1_SYMARRAY () (MyList Int))
(declare-fun length_2_SYMINT () Int)
(declare-fun ret_3_SYMINT () Int)
(declare-fun length_4_SYMINT () Int)
(declare-fun ret_6_SYMINT () Int)
(declare-fun length_7_SYMINT () Int)
(assert (and 
(>= length_7_SYMINT (- 2147483648))
(<= length_7_SYMINT 2147483647)
(>= 2 length_7_SYMINT)
(>= ret_6_SYMINT (- 2147483648))
(<= ret_6_SYMINT 2147483647)
(>= ret_3_SYMINT (- 2147483648))
(<= ret_3_SYMINT 2147483647)
(> ret_6_SYMINT ret_3_SYMINT)
(<= ret_3_SYMINT 0)
(>= length_4_SYMINT (- 2147483648))
(<= length_4_SYMINT 2147483647)
(< 1 length_4_SYMINT)
(>= length_2_SYMINT (- 2147483648))
(<= length_2_SYMINT 2147483647)
(not (= 0 length_2_SYMINT))
(let ((a!1 (=> (> length_7_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_7_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_7_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 1 0)
     (< 1 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_6_SYMINT) (seq.at (element nums_1_SYMARRAY) 1)))
(let ((a!1 (=> (> length_4_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_4_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_4_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 0 0)
     (< 0 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_3_SYMINT) (seq.at (element nums_1_SYMARRAY) 0)))
(let ((a!1 (=> (> length_2_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_2_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_2_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
))
;
(declare-const retMain_8_SYMINT Int)
(assert (= retMain_8_SYMINT ret_6_SYMINT))
;(define-fun length_4_SYMINT () Int
;  2)
;(define-fun length_7_SYMINT () Int
;  2)
;(define-fun length_2_SYMINT () Int
;  2)
;(define-fun nums_1_SYMARRAY () List_Int
;  (List_Int (lambda ((x!1 Int)) (or (= x!1 (- 6)) (= x!1 (- 10)) (= x!1 (- 11))))
;          (seq.++ (seq.unit (- 2147482325)) (seq.unit (- 2147482324)))))
;(define-fun ret_6_SYMINT () Int
;  (- 2147482324))
;(define-fun ret_3_SYMINT () Int
;  (- 2147482325))