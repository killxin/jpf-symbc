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
(declare-fun ret_9_SYMINT () Int)
(declare-fun length_10_SYMINT () Int)
(declare-fun ret_12_SYMINT () Int)
(declare-fun length_13_SYMINT () Int)
(declare-fun ret_15_SYMINT () Int)
(declare-fun length_16_SYMINT () Int)
(declare-fun ret_18_SYMINT () Int)
(declare-fun length_19_SYMINT () Int)
(declare-fun ret_21_SYMINT () Int)
(declare-fun length_22_SYMINT () Int)
(declare-fun ret_24_SYMINT () Int)
(declare-fun length_25_SYMINT () Int)
(declare-fun ret_27_SYMINT () Int)
(declare-fun length_28_SYMINT () Int)
(declare-fun ret_30_SYMINT () Int)
(declare-fun length_31_SYMINT () Int)
(declare-fun ret_33_SYMINT () Int)
(declare-fun length_34_SYMINT () Int)
(declare-fun ret_36_SYMINT () Int)
(declare-fun length_37_SYMINT () Int)
(declare-fun ret_39_SYMINT () Int)
(declare-fun length_40_SYMINT () Int)
(declare-fun ret_42_SYMINT () Int)
(declare-fun length_43_SYMINT () Int)
(declare-fun ret_45_SYMINT () Int)
(declare-fun length_46_SYMINT () Int)
(assert (and 
(>= length_46_SYMINT (- 2147483648))
(<= length_46_SYMINT 2147483647)
(>= 15 length_46_SYMINT)
(>= ret_45_SYMINT (- 2147483648))
(<= ret_45_SYMINT 2147483647)
(>= ret_42_SYMINT (- 2147483648))
(<= ret_42_SYMINT 2147483647)
(> ret_45_SYMINT ret_42_SYMINT)
(<= ret_42_SYMINT 0)
(>= length_43_SYMINT (- 2147483648))
(<= length_43_SYMINT 2147483647)
(< 14 length_43_SYMINT)
(>= ret_39_SYMINT (- 2147483648))
(<= ret_39_SYMINT 2147483647)
(> ret_42_SYMINT ret_39_SYMINT)
(<= ret_39_SYMINT 0)
(>= length_40_SYMINT (- 2147483648))
(<= length_40_SYMINT 2147483647)
(< 13 length_40_SYMINT)
(>= ret_36_SYMINT (- 2147483648))
(<= ret_36_SYMINT 2147483647)
(> ret_39_SYMINT ret_36_SYMINT)
(<= ret_36_SYMINT 0)
(>= length_37_SYMINT (- 2147483648))
(<= length_37_SYMINT 2147483647)
(< 12 length_37_SYMINT)
(>= ret_33_SYMINT (- 2147483648))
(<= ret_33_SYMINT 2147483647)
(> ret_36_SYMINT ret_33_SYMINT)
(<= ret_33_SYMINT 0)
(>= length_34_SYMINT (- 2147483648))
(<= length_34_SYMINT 2147483647)
(< 11 length_34_SYMINT)
(>= ret_30_SYMINT (- 2147483648))
(<= ret_30_SYMINT 2147483647)
(> ret_33_SYMINT ret_30_SYMINT)
(<= ret_30_SYMINT 0)
(>= length_31_SYMINT (- 2147483648))
(<= length_31_SYMINT 2147483647)
(< 10 length_31_SYMINT)
(>= ret_27_SYMINT (- 2147483648))
(<= ret_27_SYMINT 2147483647)
(> ret_30_SYMINT ret_27_SYMINT)
(<= ret_27_SYMINT 0)
(>= length_28_SYMINT (- 2147483648))
(<= length_28_SYMINT 2147483647)
(< 9 length_28_SYMINT)
(>= ret_24_SYMINT (- 2147483648))
(<= ret_24_SYMINT 2147483647)
(> ret_27_SYMINT ret_24_SYMINT)
(<= ret_24_SYMINT 0)
(>= length_25_SYMINT (- 2147483648))
(<= length_25_SYMINT 2147483647)
(< 8 length_25_SYMINT)
(>= ret_21_SYMINT (- 2147483648))
(<= ret_21_SYMINT 2147483647)
(> ret_24_SYMINT ret_21_SYMINT)
(<= ret_21_SYMINT 0)
(>= length_22_SYMINT (- 2147483648))
(<= length_22_SYMINT 2147483647)
(< 7 length_22_SYMINT)
(>= ret_18_SYMINT (- 2147483648))
(<= ret_18_SYMINT 2147483647)
(> ret_21_SYMINT ret_18_SYMINT)
(<= ret_18_SYMINT 0)
(>= length_19_SYMINT (- 2147483648))
(<= length_19_SYMINT 2147483647)
(< 6 length_19_SYMINT)
(>= ret_15_SYMINT (- 2147483648))
(<= ret_15_SYMINT 2147483647)
(> ret_18_SYMINT ret_15_SYMINT)
(<= ret_15_SYMINT 0)
(>= length_16_SYMINT (- 2147483648))
(<= length_16_SYMINT 2147483647)
(< 5 length_16_SYMINT)
(>= ret_12_SYMINT (- 2147483648))
(<= ret_12_SYMINT 2147483647)
(> ret_15_SYMINT ret_12_SYMINT)
(<= ret_12_SYMINT 0)
(>= length_13_SYMINT (- 2147483648))
(<= length_13_SYMINT 2147483647)
(< 4 length_13_SYMINT)
(>= ret_9_SYMINT (- 2147483648))
(<= ret_9_SYMINT 2147483647)
(> ret_12_SYMINT ret_9_SYMINT)
(<= ret_9_SYMINT 0)
(>= length_10_SYMINT (- 2147483648))
(<= length_10_SYMINT 2147483647)
(< 3 length_10_SYMINT)
(>= ret_6_SYMINT (- 2147483648))
(<= ret_6_SYMINT 2147483647)
(> ret_9_SYMINT ret_6_SYMINT)
(<= ret_6_SYMINT 0)
(>= length_7_SYMINT (- 2147483648))
(<= length_7_SYMINT 2147483647)
(< 2 length_7_SYMINT)
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
(let ((a!1 (=> (> length_46_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_46_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_46_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 14 0)
     (< 14 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_45_SYMINT) (seq.at (element nums_1_SYMARRAY) 14)))
(let ((a!1 (=> (> length_43_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_43_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_43_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 13 0)
     (< 13 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_42_SYMINT) (seq.at (element nums_1_SYMARRAY) 13)))
(let ((a!1 (=> (> length_40_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_40_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_40_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 12 0)
     (< 12 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_39_SYMINT) (seq.at (element nums_1_SYMARRAY) 12)))
(let ((a!1 (=> (> length_37_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_37_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_37_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 11 0)
     (< 11 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_36_SYMINT) (seq.at (element nums_1_SYMARRAY) 11)))
(let ((a!1 (=> (> length_34_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_34_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_34_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 10 0)
     (< 10 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_33_SYMINT) (seq.at (element nums_1_SYMARRAY) 10)))
(let ((a!1 (=> (> length_31_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_31_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_31_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 9 0)
     (< 9 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_30_SYMINT) (seq.at (element nums_1_SYMARRAY) 9)))
(let ((a!1 (=> (> length_28_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_28_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_28_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 8 0)
     (< 8 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_27_SYMINT) (seq.at (element nums_1_SYMARRAY) 8)))
(let ((a!1 (=> (> length_25_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_25_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_25_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 7 0)
     (< 7 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_24_SYMINT) (seq.at (element nums_1_SYMARRAY) 7)))
(let ((a!1 (=> (> length_22_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_22_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_22_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 6 0)
     (< 6 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_21_SYMINT) (seq.at (element nums_1_SYMARRAY) 6)))
(let ((a!1 (=> (> length_19_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_19_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_19_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 5 0)
     (< 5 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_18_SYMINT) (seq.at (element nums_1_SYMARRAY) 5)))
(let ((a!1 (=> (> length_16_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_16_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_16_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 4 0)
     (< 4 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_15_SYMINT) (seq.at (element nums_1_SYMARRAY) 4)))
(let ((a!1 (=> (> length_13_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_13_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_13_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 3 0)
     (< 3 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_12_SYMINT) (seq.at (element nums_1_SYMARRAY) 3)))
(let ((a!1 (=> (> length_10_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_10_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_10_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 2 0)
     (< 2 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_9_SYMINT) (seq.at (element nums_1_SYMARRAY) 2)))
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
(declare-const retMain_47_SYMINT Int)
(assert (= retMain_47_SYMINT ret_45_SYMINT))
;(define-fun length_13_SYMINT () Int
;  15)
;(define-fun ret_39_SYMINT () Int
;  (- 2147476805))
;(define-fun length_2_SYMINT () Int
;  15)
;(define-fun length_46_SYMINT () Int
;  15)
;(define-fun length_34_SYMINT () Int
;  15)
;(define-fun length_31_SYMINT () Int
;  15)
;(define-fun ret_27_SYMINT () Int
;  (- 2147483282))
;(define-fun ret_33_SYMINT () Int
;  (- 2147480602))
;(define-fun length_28_SYMINT () Int
;  15)
;(define-fun ret_21_SYMINT () Int
;  (- 2147483619))
;(define-fun ret_3_SYMINT () Int
;  (- 2147483646))
;(define-fun length_19_SYMINT () Int
;  15)
;(define-fun ret_45_SYMINT () Int
;  (- 2147476803))
;(define-fun nums_1_SYMARRAY () List_Int
;  (let ((a!1 (seq.++ (seq.unit (- 2147479186))
;                   (seq.++ (seq.unit (- 2147476805))
;                           (seq.++ (seq.unit (- 2147476804))
;                                   (seq.unit (- 2147476803)))))))
;(let ((a!2 (seq.++ (seq.unit (- 2147483282))
;                   (seq.++ (seq.unit (- 2147480646))
;                           (seq.++ (seq.unit (- 2147480602)) a!1)))))
;(let ((a!3 (seq.++ (seq.unit (- 2147483638))
;                   (seq.++ (seq.unit (- 2147483619))
;                           (seq.++ (seq.unit (- 2147483531)) a!2)))))
;(let ((a!4 (seq.++ (seq.unit (- 2147483644))
;                   (seq.++ (seq.unit (- 2147483643))
;                           (seq.++ (seq.unit (- 2147483641)) a!3)))))
;  (List_Int (lambda ((x!1 Int))
;              (or (= x!1 6)
;                  (= x!1 (- 8))
;                  (= x!1 (- 2))
;                  (= x!1 (- 9))
;                  (= x!1 10)
;                  (= x!1 (- 11))
;                  (= x!1 (- 7))
;                  (= x!1 (- 5))
;                  (= x!1 5)))
;            (seq.++ (seq.unit (- 2147483646))
;                    (seq.++ (seq.unit (- 2147483645)) a!4))))))))
;(define-fun length_10_SYMINT () Int
;  15)
;(define-fun ret_36_SYMINT () Int
;  (- 2147479186))
;(define-fun ret_15_SYMINT () Int
;  (- 2147483641))
;(define-fun ret_24_SYMINT () Int
;  (- 2147483531))
;(define-fun length_25_SYMINT () Int
;  15)
;(define-fun ret_12_SYMINT () Int
;  (- 2147483643))
;(define-fun ret_42_SYMINT () Int
;  (- 2147476804))
;(define-fun length_16_SYMINT () Int
;  15)
;(define-fun ret_6_SYMINT () Int
;  (- 2147483645))
;(define-fun length_40_SYMINT () Int
;  15)
;(define-fun length_7_SYMINT () Int
;  15)
;(define-fun ret_9_SYMINT () Int
;  (- 2147483644))
;(define-fun length_4_SYMINT () Int
;  15)
;(define-fun length_37_SYMINT () Int
;  15)
;(define-fun length_22_SYMINT () Int
;  15)
;(define-fun ret_18_SYMINT () Int
;  (- 2147483638))
;(define-fun ret_30_SYMINT () Int
;  (- 2147480646))
;(define-fun length_43_SYMINT () Int
;  15)