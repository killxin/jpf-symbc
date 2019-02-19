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
(declare-fun data_1_SYMARRAY () (MyList Int))
(declare-fun i_2_SYMINT () Int)
(declare-fun length_4_SYMINT () Int)
(assert (and 
(>= length_4_SYMINT (- 2147483648))
(<= length_4_SYMINT 2147483647)
(>= i_2_SYMINT (- 2147483648))
(<= i_2_SYMINT 2147483647)
(< (- length_4_SYMINT 1) i_2_SYMINT)
(let ((a!1 (=> (> length_4_SYMINT 0) (> (s!ze (mapping data_1_SYMARRAY) 10) 0))))
  (and (= length_4_SYMINT (seq.len (element data_1_SYMARRAY)))
       (>= length_4_SYMINT (s!ze (mapping data_1_SYMARRAY) 10))
       a!1))
))
;

;(define-fun i_2_SYMINT () Int
;  8)
;(define-fun length_4_SYMINT () Int
;  8)
;(define-fun data_1_SYMARRAY () List_Int
;  (let ((a!1 (seq.++ (seq.unit 42)
;                   (seq.++ (seq.unit 44) (seq.++ (seq.unit 46) (seq.unit 48))))))
;(let ((a!2 (seq.++ (seq.unit 36)
;                   (seq.++ (seq.unit 38) (seq.++ (seq.unit 40) a!1)))))
;  (List_Int (lambda ((x!1 Int))
;              (or (= x!1 6)
;                  (= x!1 (- 6))
;                  (= x!1 (- 2))
;                  (= x!1 (- 9))
;                  (= x!1 4)
;                  (= x!1 1)
;                  (= x!1 10)
;                  (= x!1 (- 11))
;                  (= x!1 3)))
;            (seq.++ (seq.unit 34) a!2)))))