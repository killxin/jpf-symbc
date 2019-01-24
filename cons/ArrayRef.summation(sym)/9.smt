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
(declare-fun numbers_1_SYMARRAY () (MyList Int))
(declare-fun length_2_SYMINT () Int)
(declare-fun ret_4_SYMINT () Int)
(declare-fun ret_6_SYMINT () Int)
(declare-fun ret_8_SYMINT () Int)
(declare-fun ret_10_SYMINT () Int)
(declare-fun ret_12_SYMINT () Int)
(declare-fun ret_14_SYMINT () Int)
(declare-fun ret_16_SYMINT () Int)
(declare-fun ret_18_SYMINT () Int)
(assert (and 
(>= length_2_SYMINT (- 2147483648))
(<= length_2_SYMINT 2147483647)
(> 8 (- length_2_SYMINT 1))
(<= 7 (- length_2_SYMINT 1))
(<= 6 (- length_2_SYMINT 1))
(<= 5 (- length_2_SYMINT 1))
(<= 4 (- length_2_SYMINT 1))
(<= 3 (- length_2_SYMINT 1))
(<= 2 (- length_2_SYMINT 1))
(<= 1 (- length_2_SYMINT 1))
(<= 0 (- length_2_SYMINT 1))
(>= ret_18_SYMINT (- 2147483648))
(<= ret_18_SYMINT 2147483647)
(and (>= 7 0)
     (< 7 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_18_SYMINT) (seq.at (element numbers_1_SYMARRAY) 7)))
(>= ret_16_SYMINT (- 2147483648))
(<= ret_16_SYMINT 2147483647)
(and (>= 6 0)
     (< 6 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_16_SYMINT) (seq.at (element numbers_1_SYMARRAY) 6)))
(>= ret_14_SYMINT (- 2147483648))
(<= ret_14_SYMINT 2147483647)
(and (>= 5 0)
     (< 5 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_14_SYMINT) (seq.at (element numbers_1_SYMARRAY) 5)))
(>= ret_12_SYMINT (- 2147483648))
(<= ret_12_SYMINT 2147483647)
(and (>= 4 0)
     (< 4 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_12_SYMINT) (seq.at (element numbers_1_SYMARRAY) 4)))
(>= ret_10_SYMINT (- 2147483648))
(<= ret_10_SYMINT 2147483647)
(and (>= 3 0)
     (< 3 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_10_SYMINT) (seq.at (element numbers_1_SYMARRAY) 3)))
(>= ret_8_SYMINT (- 2147483648))
(<= ret_8_SYMINT 2147483647)
(and (>= 2 0)
     (< 2 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_8_SYMINT) (seq.at (element numbers_1_SYMARRAY) 2)))
(>= ret_6_SYMINT (- 2147483648))
(<= ret_6_SYMINT 2147483647)
(and (>= 1 0)
     (< 1 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_6_SYMINT) (seq.at (element numbers_1_SYMARRAY) 1)))
(>= ret_4_SYMINT (- 2147483648))
(<= ret_4_SYMINT 2147483647)
(and (>= 0 0)
     (< 0 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_4_SYMINT) (seq.at (element numbers_1_SYMARRAY) 0)))
(let ((a!1 (=> (> length_2_SYMINT 0)
               (> (s!ze (mapping numbers_1_SYMARRAY) 10) 0))))
  (and (= length_2_SYMINT (seq.len (element numbers_1_SYMARRAY)))
       (>= length_2_SYMINT (s!ze (mapping numbers_1_SYMARRAY) 10))
       a!1))
))
;
(declare-const retMain_19_SYMINT Int)
(assert (= retMain_19_SYMINT ( +  ret_18_SYMINT ( +  ret_16_SYMINT ( +  ret_14_SYMINT ( +  ret_12_SYMINT ( +  ret_10_SYMINT ( +  ret_8_SYMINT ( +  ret_6_SYMINT ret_4_SYMINT)))))))))
;(define-fun length_2_SYMINT () Int
;  8)
;(define-fun ret_8_SYMINT () Int
;  (- 2147479688))
;(define-fun ret_10_SYMINT () Int
;  (- 2147477667))
;(define-fun numbers_1_SYMARRAY () List_Int
;  (let ((a!1 (seq.++ (seq.unit (- 2147482075))
;                   (seq.++ (seq.unit (- 2147477629))
;                           (seq.++ (seq.unit (- 2147482257))
;                                   (seq.unit (- 2147476081)))))))
;(let ((a!2 (seq.++ (seq.unit (- 2147483024))
;                   (seq.++ (seq.unit (- 2147479688))
;                           (seq.++ (seq.unit (- 2147477667)) a!1)))))
;  (List_Int (lambda ((x!1 Int))
;              (or (= x!1 6)
;                  (= x!1 (- 8))
;                  (= x!1 (- 4))
;                  (= x!1 0)
;                  (= x!1 (- 3))
;                  (= x!1 4)
;                  (= x!1 10)
;                  (= x!1 (- 11))
;                  (= x!1 (- 5))))
;            (seq.++ (seq.unit (- 2147476583)) a!2)))))
;(define-fun ret_16_SYMINT () Int
;  (- 2147482257))
;(define-fun ret_18_SYMINT () Int
;  (- 2147476081))
;(define-fun ret_14_SYMINT () Int
;  (- 2147477629))
;(define-fun ret_12_SYMINT () Int
;  (- 2147482075))
;(define-fun ret_6_SYMINT () Int
;  (- 2147483024))
;(define-fun ret_4_SYMINT () Int
;  (- 2147476583))