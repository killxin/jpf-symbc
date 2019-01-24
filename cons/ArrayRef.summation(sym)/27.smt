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
(declare-fun ret_20_SYMINT () Int)
(declare-fun ret_22_SYMINT () Int)
(declare-fun ret_24_SYMINT () Int)
(declare-fun ret_26_SYMINT () Int)
(declare-fun ret_28_SYMINT () Int)
(declare-fun ret_30_SYMINT () Int)
(declare-fun ret_32_SYMINT () Int)
(declare-fun ret_34_SYMINT () Int)
(declare-fun ret_36_SYMINT () Int)
(declare-fun ret_38_SYMINT () Int)
(declare-fun ret_40_SYMINT () Int)
(declare-fun ret_42_SYMINT () Int)
(declare-fun ret_44_SYMINT () Int)
(declare-fun ret_46_SYMINT () Int)
(declare-fun ret_48_SYMINT () Int)
(declare-fun ret_50_SYMINT () Int)
(declare-fun ret_52_SYMINT () Int)
(declare-fun ret_54_SYMINT () Int)
(assert (and 
(>= length_2_SYMINT (- 2147483648))
(<= length_2_SYMINT 2147483647)
(> 26 (- length_2_SYMINT 1))
(<= 25 (- length_2_SYMINT 1))
(<= 24 (- length_2_SYMINT 1))
(<= 23 (- length_2_SYMINT 1))
(<= 22 (- length_2_SYMINT 1))
(<= 21 (- length_2_SYMINT 1))
(<= 20 (- length_2_SYMINT 1))
(<= 19 (- length_2_SYMINT 1))
(<= 18 (- length_2_SYMINT 1))
(<= 17 (- length_2_SYMINT 1))
(<= 16 (- length_2_SYMINT 1))
(<= 15 (- length_2_SYMINT 1))
(<= 14 (- length_2_SYMINT 1))
(<= 13 (- length_2_SYMINT 1))
(<= 12 (- length_2_SYMINT 1))
(<= 11 (- length_2_SYMINT 1))
(<= 10 (- length_2_SYMINT 1))
(<= 9 (- length_2_SYMINT 1))
(<= 8 (- length_2_SYMINT 1))
(<= 7 (- length_2_SYMINT 1))
(<= 6 (- length_2_SYMINT 1))
(<= 5 (- length_2_SYMINT 1))
(<= 4 (- length_2_SYMINT 1))
(<= 3 (- length_2_SYMINT 1))
(<= 2 (- length_2_SYMINT 1))
(<= 1 (- length_2_SYMINT 1))
(<= 0 (- length_2_SYMINT 1))
(>= ret_54_SYMINT (- 2147483648))
(<= ret_54_SYMINT 2147483647)
(and (>= 25 0)
     (< 25 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_54_SYMINT) (seq.at (element numbers_1_SYMARRAY) 25)))
(>= ret_52_SYMINT (- 2147483648))
(<= ret_52_SYMINT 2147483647)
(and (>= 24 0)
     (< 24 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_52_SYMINT) (seq.at (element numbers_1_SYMARRAY) 24)))
(>= ret_50_SYMINT (- 2147483648))
(<= ret_50_SYMINT 2147483647)
(and (>= 23 0)
     (< 23 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_50_SYMINT) (seq.at (element numbers_1_SYMARRAY) 23)))
(>= ret_48_SYMINT (- 2147483648))
(<= ret_48_SYMINT 2147483647)
(and (>= 22 0)
     (< 22 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_48_SYMINT) (seq.at (element numbers_1_SYMARRAY) 22)))
(>= ret_46_SYMINT (- 2147483648))
(<= ret_46_SYMINT 2147483647)
(and (>= 21 0)
     (< 21 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_46_SYMINT) (seq.at (element numbers_1_SYMARRAY) 21)))
(>= ret_44_SYMINT (- 2147483648))
(<= ret_44_SYMINT 2147483647)
(and (>= 20 0)
     (< 20 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_44_SYMINT) (seq.at (element numbers_1_SYMARRAY) 20)))
(>= ret_42_SYMINT (- 2147483648))
(<= ret_42_SYMINT 2147483647)
(and (>= 19 0)
     (< 19 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_42_SYMINT) (seq.at (element numbers_1_SYMARRAY) 19)))
(>= ret_40_SYMINT (- 2147483648))
(<= ret_40_SYMINT 2147483647)
(and (>= 18 0)
     (< 18 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_40_SYMINT) (seq.at (element numbers_1_SYMARRAY) 18)))
(>= ret_38_SYMINT (- 2147483648))
(<= ret_38_SYMINT 2147483647)
(and (>= 17 0)
     (< 17 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_38_SYMINT) (seq.at (element numbers_1_SYMARRAY) 17)))
(>= ret_36_SYMINT (- 2147483648))
(<= ret_36_SYMINT 2147483647)
(and (>= 16 0)
     (< 16 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_36_SYMINT) (seq.at (element numbers_1_SYMARRAY) 16)))
(>= ret_34_SYMINT (- 2147483648))
(<= ret_34_SYMINT 2147483647)
(and (>= 15 0)
     (< 15 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_34_SYMINT) (seq.at (element numbers_1_SYMARRAY) 15)))
(>= ret_32_SYMINT (- 2147483648))
(<= ret_32_SYMINT 2147483647)
(and (>= 14 0)
     (< 14 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_32_SYMINT) (seq.at (element numbers_1_SYMARRAY) 14)))
(>= ret_30_SYMINT (- 2147483648))
(<= ret_30_SYMINT 2147483647)
(and (>= 13 0)
     (< 13 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_30_SYMINT) (seq.at (element numbers_1_SYMARRAY) 13)))
(>= ret_28_SYMINT (- 2147483648))
(<= ret_28_SYMINT 2147483647)
(and (>= 12 0)
     (< 12 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_28_SYMINT) (seq.at (element numbers_1_SYMARRAY) 12)))
(>= ret_26_SYMINT (- 2147483648))
(<= ret_26_SYMINT 2147483647)
(and (>= 11 0)
     (< 11 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_26_SYMINT) (seq.at (element numbers_1_SYMARRAY) 11)))
(>= ret_24_SYMINT (- 2147483648))
(<= ret_24_SYMINT 2147483647)
(and (>= 10 0)
     (< 10 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_24_SYMINT) (seq.at (element numbers_1_SYMARRAY) 10)))
(>= ret_22_SYMINT (- 2147483648))
(<= ret_22_SYMINT 2147483647)
(and (>= 9 0)
     (< 9 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_22_SYMINT) (seq.at (element numbers_1_SYMARRAY) 9)))
(>= ret_20_SYMINT (- 2147483648))
(<= ret_20_SYMINT 2147483647)
(and (>= 8 0)
     (< 8 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_20_SYMINT) (seq.at (element numbers_1_SYMARRAY) 8)))
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
(declare-const retMain_55_SYMINT Int)
(assert (= retMain_55_SYMINT ( +  ret_54_SYMINT ( +  ret_52_SYMINT ( +  ret_50_SYMINT ( +  ret_48_SYMINT ( +  ret_46_SYMINT ( +  ret_44_SYMINT ( +  ret_42_SYMINT ( +  ret_40_SYMINT ( +  ret_38_SYMINT ( +  ret_36_SYMINT ( +  ret_34_SYMINT ( +  ret_32_SYMINT ( +  ret_30_SYMINT ( +  ret_28_SYMINT ( +  ret_26_SYMINT ( +  ret_24_SYMINT ( +  ret_22_SYMINT ( +  ret_20_SYMINT ( +  ret_18_SYMINT ( +  ret_16_SYMINT ( +  ret_14_SYMINT ( +  ret_12_SYMINT ( +  ret_10_SYMINT ( +  ret_8_SYMINT ( +  ret_6_SYMINT ret_4_SYMINT)))))))))))))))))))))))))))
;(define-fun length_2_SYMINT () Int
;  26)
;(define-fun ret_10_SYMINT () Int
;  (- 2147475844))
;(define-fun numbers_1_SYMARRAY () List_Int
;  (let ((a!1 (seq.++ (seq.unit (- 2147473921))
;                   (seq.++ (seq.unit (- 2147479181))
;                           (seq.++ (seq.unit (- 2147480640))
;                                   (seq.unit (- 2147475041)))))))
;(let ((a!2 (seq.++ (seq.unit (- 2147475909))
;                   (seq.++ (seq.unit (- 2147479016))
;                           (seq.++ (seq.unit (- 2147475558)) a!1)))))
;(let ((a!3 (seq.++ (seq.unit (- 2147481794))
;                   (seq.++ (seq.unit (- 2147482204))
;                           (seq.++ (seq.unit (- 2147477185)) a!2)))))
;(let ((a!4 (seq.++ (seq.unit (- 2147476517))
;                   (seq.++ (seq.unit (- 2147481630))
;                           (seq.++ (seq.unit (- 2147474027)) a!3)))))
;(let ((a!5 (seq.++ (seq.unit (- 2147483341))
;                   (seq.++ (seq.unit (- 2147475707))
;                           (seq.++ (seq.unit (- 2147476116)) a!4)))))
;(let ((a!6 (seq.++ (seq.unit (- 2147478622))
;                   (seq.++ (seq.unit (- 2147478613))
;                           (seq.++ (seq.unit (- 2147481596)) a!5)))))
;(let ((a!7 (seq.++ (seq.unit (- 2147474919))
;                   (seq.++ (seq.unit (- 2147477927))
;                           (seq.++ (seq.unit (- 2147483214)) a!6)))))
;(let ((a!8 (seq.++ (seq.unit (- 2147474306))
;                   (seq.++ (seq.unit (- 2147478890))
;                           (seq.++ (seq.unit (- 2147475844)) a!7)))))
;  (List_Int (lambda ((x!1 Int))
;              (or (= x!1 6)
;                  (= x!1 7)
;                  (= x!1 (- 6))
;                  (= x!1 8)
;                  (= x!1 (- 2))
;                  (= x!1 (- 4))
;                  (= x!1 (- 9))
;                  (= x!1 4)
;                  (= x!1 9)
;                  (= x!1 10)))
;            (seq.++ (seq.unit (- 2147483263)) a!8)))))))))))
;(define-fun ret_32_SYMINT () Int
;  (- 2147481630))
;(define-fun ret_22_SYMINT () Int
;  (- 2147481596))
;(define-fun ret_4_SYMINT () Int
;  (- 2147483263))
;(define-fun ret_16_SYMINT () Int
;  (- 2147483214))
;(define-fun ret_44_SYMINT () Int
;  (- 2147479016))
;(define-fun ret_14_SYMINT () Int
;  (- 2147477927))
;(define-fun ret_40_SYMINT () Int
;  (- 2147477185))
;(define-fun ret_26_SYMINT () Int
;  (- 2147475707))
;(define-fun ret_50_SYMINT () Int
;  (- 2147479181))
;(define-fun ret_8_SYMINT () Int
;  (- 2147478890))
;(define-fun ret_48_SYMINT () Int
;  (- 2147473921))
;(define-fun ret_46_SYMINT () Int
;  (- 2147475558))
;(define-fun ret_38_SYMINT () Int
;  (- 2147482204))
;(define-fun ret_36_SYMINT () Int
;  (- 2147481794))
;(define-fun ret_34_SYMINT () Int
;  (- 2147474027))
;(define-fun ret_42_SYMINT () Int
;  (- 2147475909))
;(define-fun ret_24_SYMINT () Int
;  (- 2147483341))
;(define-fun ret_12_SYMINT () Int
;  (- 2147474919))
;(define-fun ret_6_SYMINT () Int
;  (- 2147474306))
;(define-fun ret_54_SYMINT () Int
;  (- 2147475041))
;(define-fun ret_52_SYMINT () Int
;  (- 2147480640))
;(define-fun ret_20_SYMINT () Int
;  (- 2147478613))
;(define-fun ret_18_SYMINT () Int
;  (- 2147478622))
;(define-fun ret_30_SYMINT () Int
;  (- 2147476517))
;(define-fun ret_28_SYMINT () Int
;  (- 2147476116))