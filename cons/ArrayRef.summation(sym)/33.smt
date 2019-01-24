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
(declare-fun ret_56_SYMINT () Int)
(declare-fun ret_58_SYMINT () Int)
(declare-fun ret_60_SYMINT () Int)
(declare-fun ret_62_SYMINT () Int)
(declare-fun ret_64_SYMINT () Int)
(declare-fun ret_66_SYMINT () Int)
(assert (and 
(>= length_2_SYMINT (- 2147483648))
(<= length_2_SYMINT 2147483647)
(> 32 (- length_2_SYMINT 1))
(<= 31 (- length_2_SYMINT 1))
(<= 30 (- length_2_SYMINT 1))
(<= 29 (- length_2_SYMINT 1))
(<= 28 (- length_2_SYMINT 1))
(<= 27 (- length_2_SYMINT 1))
(<= 26 (- length_2_SYMINT 1))
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
(>= ret_66_SYMINT (- 2147483648))
(<= ret_66_SYMINT 2147483647)
(and (>= 31 0)
     (< 31 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_66_SYMINT) (seq.at (element numbers_1_SYMARRAY) 31)))
(>= ret_64_SYMINT (- 2147483648))
(<= ret_64_SYMINT 2147483647)
(and (>= 30 0)
     (< 30 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_64_SYMINT) (seq.at (element numbers_1_SYMARRAY) 30)))
(>= ret_62_SYMINT (- 2147483648))
(<= ret_62_SYMINT 2147483647)
(and (>= 29 0)
     (< 29 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_62_SYMINT) (seq.at (element numbers_1_SYMARRAY) 29)))
(>= ret_60_SYMINT (- 2147483648))
(<= ret_60_SYMINT 2147483647)
(and (>= 28 0)
     (< 28 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_60_SYMINT) (seq.at (element numbers_1_SYMARRAY) 28)))
(>= ret_58_SYMINT (- 2147483648))
(<= ret_58_SYMINT 2147483647)
(and (>= 27 0)
     (< 27 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_58_SYMINT) (seq.at (element numbers_1_SYMARRAY) 27)))
(>= ret_56_SYMINT (- 2147483648))
(<= ret_56_SYMINT 2147483647)
(and (>= 26 0)
     (< 26 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_56_SYMINT) (seq.at (element numbers_1_SYMARRAY) 26)))
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
(declare-const retMain_67_SYMINT Int)
(assert (= retMain_67_SYMINT ( +  ret_66_SYMINT ( +  ret_64_SYMINT ( +  ret_62_SYMINT ( +  ret_60_SYMINT ( +  ret_58_SYMINT ( +  ret_56_SYMINT ( +  ret_54_SYMINT ( +  ret_52_SYMINT ( +  ret_50_SYMINT ( +  ret_48_SYMINT ( +  ret_46_SYMINT ( +  ret_44_SYMINT ( +  ret_42_SYMINT ( +  ret_40_SYMINT ( +  ret_38_SYMINT ( +  ret_36_SYMINT ( +  ret_34_SYMINT ( +  ret_32_SYMINT ( +  ret_30_SYMINT ( +  ret_28_SYMINT ( +  ret_26_SYMINT ( +  ret_24_SYMINT ( +  ret_22_SYMINT ( +  ret_20_SYMINT ( +  ret_18_SYMINT ( +  ret_16_SYMINT ( +  ret_14_SYMINT ( +  ret_12_SYMINT ( +  ret_10_SYMINT ( +  ret_8_SYMINT ( +  ret_6_SYMINT ret_4_SYMINT)))))))))))))))))))))))))))))))))
;(define-fun length_2_SYMINT () Int
;  32)
;(define-fun ret_10_SYMINT () Int
;  (- 2147482432))
;(define-fun ret_58_SYMINT () Int
;  (- 2147480842))
;(define-fun numbers_1_SYMARRAY () List_Int
;  (let ((a!1 (lambda ((x!1 Int))
;             (and (not (= x!1 6))
;                  (not (= x!1 2))
;                  (not (= x!1 (- 2)))
;                  (not (= x!1 (- 4)))
;                  (not (= x!1 0))
;                  (not (= x!1 (- 9)))
;                  (not (= x!1 1))
;                  (not (= x!1 (- 1)))
;                  (not (= x!1 (- 5)))
;                  (not (= x!1 3))
;                  (not (= x!1 5)))))
;      (a!2 (seq.++ (seq.unit (- 2147476204))
;                   (seq.++ (seq.unit (- 2147477969))
;                           (seq.++ (seq.unit (- 2147483449))
;                                   (seq.unit (- 2147476143)))))))
;(let ((a!3 (seq.++ (seq.unit (- 2147474606))
;                   (seq.++ (seq.unit (- 2147477247))
;                           (seq.++ (seq.unit (- 2147480842)) a!2)))))
;(let ((a!4 (seq.++ (seq.unit (- 2147482383))
;                   (seq.++ (seq.unit (- 2147476253))
;                           (seq.++ (seq.unit (- 2147483184)) a!3)))))
;(let ((a!5 (seq.++ (seq.unit (- 2147478187))
;                   (seq.++ (seq.unit (- 2147476718))
;                           (seq.++ (seq.unit (- 2147479546)) a!4)))))
;(let ((a!6 (seq.++ (seq.unit (- 2147482235))
;                   (seq.++ (seq.unit (- 2147482241))
;                           (seq.++ (seq.unit (- 2147475351)) a!5)))))
;(let ((a!7 (seq.++ (seq.unit (- 2147482061))
;                   (seq.++ (seq.unit (- 2147482558))
;                           (seq.++ (seq.unit (- 2147479628)) a!6)))))
;(let ((a!8 (seq.++ (seq.unit (- 2147475018))
;                   (seq.++ (seq.unit (- 2147479665))
;                           (seq.++ (seq.unit (- 2147483139)) a!7)))))
;(let ((a!9 (seq.++ (seq.unit (- 2147476214))
;                   (seq.++ (seq.unit (- 2147480801))
;                           (seq.++ (seq.unit (- 2147476432)) a!8)))))
;(let ((a!10 (seq.++ (seq.unit (- 2147479500))
;                    (seq.++ (seq.unit (- 2147482364))
;                            (seq.++ (seq.unit (- 2147475650)) a!9)))))
;(let ((a!11 (seq.++ (seq.unit (- 2147478689))
;                    (seq.++ (seq.unit (- 2147476365))
;                            (seq.++ (seq.unit (- 2147482432)) a!10)))))
;  (List_Int a!1 (seq.++ (seq.unit (- 2147480922)) a!11)))))))))))))
;(define-fun ret_56_SYMINT () Int
;  (- 2147477247))
;(define-fun ret_66_SYMINT () Int
;  (- 2147476143))
;(define-fun ret_32_SYMINT () Int
;  (- 2147482558))
;(define-fun ret_22_SYMINT () Int
;  (- 2147476432))
;(define-fun ret_4_SYMINT () Int
;  (- 2147480922))
;(define-fun ret_16_SYMINT () Int
;  (- 2147475650))
;(define-fun ret_44_SYMINT () Int
;  (- 2147476718))
;(define-fun ret_40_SYMINT () Int
;  (- 2147475351))
;(define-fun ret_14_SYMINT () Int
;  (- 2147482364))
;(define-fun ret_26_SYMINT () Int
;  (- 2147479665))
;(define-fun ret_60_SYMINT () Int
;  (- 2147476204))
;(define-fun ret_50_SYMINT () Int
;  (- 2147476253))
;(define-fun ret_8_SYMINT () Int
;  (- 2147476365))
;(define-fun ret_62_SYMINT () Int
;  (- 2147477969))
;(define-fun ret_48_SYMINT () Int
;  (- 2147482383))
;(define-fun ret_46_SYMINT () Int
;  (- 2147479546))
;(define-fun ret_38_SYMINT () Int
;  (- 2147482241))
;(define-fun ret_36_SYMINT () Int
;  (- 2147482235))
;(define-fun ret_34_SYMINT () Int
;  (- 2147479628))
;(define-fun ret_42_SYMINT () Int
;  (- 2147478187))
;(define-fun ret_24_SYMINT () Int
;  (- 2147475018))
;(define-fun ret_12_SYMINT () Int
;  (- 2147479500))
;(define-fun ret_6_SYMINT () Int
;  (- 2147478689))
;(define-fun ret_54_SYMINT () Int
;  (- 2147474606))
;(define-fun ret_52_SYMINT () Int
;  (- 2147483184))
;(define-fun ret_64_SYMINT () Int
;  (- 2147483449))
;(define-fun ret_20_SYMINT () Int
;  (- 2147480801))
;(define-fun ret_18_SYMINT () Int
;  (- 2147476214))
;(define-fun ret_30_SYMINT () Int
;  (- 2147482061))
;(define-fun ret_28_SYMINT () Int
;  (- 2147483139))