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
(declare-fun ret_68_SYMINT () Int)
(declare-fun ret_70_SYMINT () Int)
(declare-fun ret_72_SYMINT () Int)
(declare-fun ret_74_SYMINT () Int)
(declare-fun ret_76_SYMINT () Int)
(declare-fun ret_78_SYMINT () Int)
(declare-fun ret_80_SYMINT () Int)
(declare-fun ret_82_SYMINT () Int)
(declare-fun ret_84_SYMINT () Int)
(declare-fun ret_86_SYMINT () Int)
(declare-fun ret_88_SYMINT () Int)
(declare-fun ret_90_SYMINT () Int)
(declare-fun ret_92_SYMINT () Int)
(declare-fun ret_94_SYMINT () Int)
(declare-fun ret_96_SYMINT () Int)
(declare-fun ret_98_SYMINT () Int)
(declare-fun ret_100_SYMINT () Int)
(declare-fun ret_102_SYMINT () Int)
(declare-fun ret_104_SYMINT () Int)
(assert (and 
(>= length_2_SYMINT (- 2147483648))
(<= length_2_SYMINT 2147483647)
(> 51 (- length_2_SYMINT 1))
(<= 50 (- length_2_SYMINT 1))
(<= 49 (- length_2_SYMINT 1))
(<= 48 (- length_2_SYMINT 1))
(<= 47 (- length_2_SYMINT 1))
(<= 46 (- length_2_SYMINT 1))
(<= 45 (- length_2_SYMINT 1))
(<= 44 (- length_2_SYMINT 1))
(<= 43 (- length_2_SYMINT 1))
(<= 42 (- length_2_SYMINT 1))
(<= 41 (- length_2_SYMINT 1))
(<= 40 (- length_2_SYMINT 1))
(<= 39 (- length_2_SYMINT 1))
(<= 38 (- length_2_SYMINT 1))
(<= 37 (- length_2_SYMINT 1))
(<= 36 (- length_2_SYMINT 1))
(<= 35 (- length_2_SYMINT 1))
(<= 34 (- length_2_SYMINT 1))
(<= 33 (- length_2_SYMINT 1))
(<= 32 (- length_2_SYMINT 1))
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
(>= ret_104_SYMINT (- 2147483648))
(<= ret_104_SYMINT 2147483647)
(and (>= 50 0)
     (< 50 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_104_SYMINT) (seq.at (element numbers_1_SYMARRAY) 50)))
(>= ret_102_SYMINT (- 2147483648))
(<= ret_102_SYMINT 2147483647)
(and (>= 49 0)
     (< 49 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_102_SYMINT) (seq.at (element numbers_1_SYMARRAY) 49)))
(>= ret_100_SYMINT (- 2147483648))
(<= ret_100_SYMINT 2147483647)
(and (>= 48 0)
     (< 48 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_100_SYMINT) (seq.at (element numbers_1_SYMARRAY) 48)))
(>= ret_98_SYMINT (- 2147483648))
(<= ret_98_SYMINT 2147483647)
(and (>= 47 0)
     (< 47 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_98_SYMINT) (seq.at (element numbers_1_SYMARRAY) 47)))
(>= ret_96_SYMINT (- 2147483648))
(<= ret_96_SYMINT 2147483647)
(and (>= 46 0)
     (< 46 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_96_SYMINT) (seq.at (element numbers_1_SYMARRAY) 46)))
(>= ret_94_SYMINT (- 2147483648))
(<= ret_94_SYMINT 2147483647)
(and (>= 45 0)
     (< 45 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_94_SYMINT) (seq.at (element numbers_1_SYMARRAY) 45)))
(>= ret_92_SYMINT (- 2147483648))
(<= ret_92_SYMINT 2147483647)
(and (>= 44 0)
     (< 44 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_92_SYMINT) (seq.at (element numbers_1_SYMARRAY) 44)))
(>= ret_90_SYMINT (- 2147483648))
(<= ret_90_SYMINT 2147483647)
(and (>= 43 0)
     (< 43 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_90_SYMINT) (seq.at (element numbers_1_SYMARRAY) 43)))
(>= ret_88_SYMINT (- 2147483648))
(<= ret_88_SYMINT 2147483647)
(and (>= 42 0)
     (< 42 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_88_SYMINT) (seq.at (element numbers_1_SYMARRAY) 42)))
(>= ret_86_SYMINT (- 2147483648))
(<= ret_86_SYMINT 2147483647)
(and (>= 41 0)
     (< 41 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_86_SYMINT) (seq.at (element numbers_1_SYMARRAY) 41)))
(>= ret_84_SYMINT (- 2147483648))
(<= ret_84_SYMINT 2147483647)
(and (>= 40 0)
     (< 40 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_84_SYMINT) (seq.at (element numbers_1_SYMARRAY) 40)))
(>= ret_82_SYMINT (- 2147483648))
(<= ret_82_SYMINT 2147483647)
(and (>= 39 0)
     (< 39 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_82_SYMINT) (seq.at (element numbers_1_SYMARRAY) 39)))
(>= ret_80_SYMINT (- 2147483648))
(<= ret_80_SYMINT 2147483647)
(and (>= 38 0)
     (< 38 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_80_SYMINT) (seq.at (element numbers_1_SYMARRAY) 38)))
(>= ret_78_SYMINT (- 2147483648))
(<= ret_78_SYMINT 2147483647)
(and (>= 37 0)
     (< 37 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_78_SYMINT) (seq.at (element numbers_1_SYMARRAY) 37)))
(>= ret_76_SYMINT (- 2147483648))
(<= ret_76_SYMINT 2147483647)
(and (>= 36 0)
     (< 36 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_76_SYMINT) (seq.at (element numbers_1_SYMARRAY) 36)))
(>= ret_74_SYMINT (- 2147483648))
(<= ret_74_SYMINT 2147483647)
(and (>= 35 0)
     (< 35 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_74_SYMINT) (seq.at (element numbers_1_SYMARRAY) 35)))
(>= ret_72_SYMINT (- 2147483648))
(<= ret_72_SYMINT 2147483647)
(and (>= 34 0)
     (< 34 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_72_SYMINT) (seq.at (element numbers_1_SYMARRAY) 34)))
(>= ret_70_SYMINT (- 2147483648))
(<= ret_70_SYMINT 2147483647)
(and (>= 33 0)
     (< 33 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_70_SYMINT) (seq.at (element numbers_1_SYMARRAY) 33)))
(>= ret_68_SYMINT (- 2147483648))
(<= ret_68_SYMINT 2147483647)
(and (>= 32 0)
     (< 32 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_68_SYMINT) (seq.at (element numbers_1_SYMARRAY) 32)))
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
(declare-const retMain_105_SYMINT Int)
(assert (= retMain_105_SYMINT ( +  ret_104_SYMINT ( +  ret_102_SYMINT ( +  ret_100_SYMINT ( +  ret_98_SYMINT ( +  ret_96_SYMINT ( +  ret_94_SYMINT ( +  ret_92_SYMINT ( +  ret_90_SYMINT ( +  ret_88_SYMINT ( +  ret_86_SYMINT ( +  ret_84_SYMINT ( +  ret_82_SYMINT ( +  ret_80_SYMINT ( +  ret_78_SYMINT ( +  ret_76_SYMINT ( +  ret_74_SYMINT ( +  ret_72_SYMINT ( +  ret_70_SYMINT ( +  ret_68_SYMINT ( +  ret_66_SYMINT ( +  ret_64_SYMINT ( +  ret_62_SYMINT ( +  ret_60_SYMINT ( +  ret_58_SYMINT ( +  ret_56_SYMINT ( +  ret_54_SYMINT ( +  ret_52_SYMINT ( +  ret_50_SYMINT ( +  ret_48_SYMINT ( +  ret_46_SYMINT ( +  ret_44_SYMINT ( +  ret_42_SYMINT ( +  ret_40_SYMINT ( +  ret_38_SYMINT ( +  ret_36_SYMINT ( +  ret_34_SYMINT ( +  ret_32_SYMINT ( +  ret_30_SYMINT ( +  ret_28_SYMINT ( +  ret_26_SYMINT ( +  ret_24_SYMINT ( +  ret_22_SYMINT ( +  ret_20_SYMINT ( +  ret_18_SYMINT ( +  ret_16_SYMINT ( +  ret_14_SYMINT ( +  ret_12_SYMINT ( +  ret_10_SYMINT ( +  ret_8_SYMINT ( +  ret_6_SYMINT ret_4_SYMINT))))))))))))))))))))))))))))))))))))))))))))))))))))
;(define-fun length_2_SYMINT () Int
;  51)
;(define-fun ret_10_SYMINT () Int
;  (- 2147478010))
;(define-fun ret_74_SYMINT () Int
;  (- 2147482437))
;(define-fun ret_58_SYMINT () Int
;  (- 2147477756))
;(define-fun numbers_1_SYMARRAY () List_Int
;  (let ((a!1 (lambda ((x!1 Int))
;             (and (not (= x!1 6))
;                  (not (= x!1 7))
;                  (not (= x!1 (- 2)))
;                  (not (= x!1 (- 3)))
;                  (not (= x!1 (- 10)))
;                  (not (= x!1 1))
;                  (not (= x!1 (- 1)))
;                  (not (= x!1 (- 11)))
;                  (not (= x!1 (- 7))))))
;      (a!2 (seq.++ (seq.unit (- 2147474494))
;                   (seq.++ (seq.unit (- 2147474030))
;                           (seq.++ (seq.unit (- 2147481373))
;                                   (seq.unit (- 2147483618)))))))
;(let ((a!3 (seq.++ (seq.unit (- 2147480889))
;                   (seq.++ (seq.unit (- 2147482184))
;                           (seq.++ (seq.unit (- 2147475014)) a!2)))))
;(let ((a!4 (seq.++ (seq.unit (- 2147481255))
;                   (seq.++ (seq.unit (- 2147475636))
;                           (seq.++ (seq.unit (- 2147478797)) a!3)))))
;(let ((a!5 (seq.++ (seq.unit (- 2147480447))
;                   (seq.++ (seq.unit (- 2147474806))
;                           (seq.++ (seq.unit (- 2147474827)) a!4)))))
;(let ((a!6 (seq.++ (seq.unit (- 2147482437))
;                   (seq.++ (seq.unit (- 2147482384))
;                           (seq.++ (seq.unit (- 2147479111)) a!5)))))
;(let ((a!7 (seq.++ (seq.unit (- 2147477316))
;                   (seq.++ (seq.unit (- 2147480280))
;                           (seq.++ (seq.unit (- 2147482230)) a!6)))))
;(let ((a!8 (seq.++ (seq.unit (- 2147483515))
;                   (seq.++ (seq.unit (- 2147478496))
;                           (seq.++ (seq.unit (- 2147480291)) a!7)))))
;(let ((a!9 (seq.++ (seq.unit (- 2147475384))
;                   (seq.++ (seq.unit (- 2147477756))
;                           (seq.++ (seq.unit (- 2147478408)) a!8)))))
;(let ((a!10 (seq.++ (seq.unit (- 2147476995))
;                    (seq.++ (seq.unit (- 2147480906))
;                            (seq.++ (seq.unit (- 2147482426)) a!9)))))
;(let ((a!11 (seq.++ (seq.unit (- 2147482725))
;                    (seq.++ (seq.unit (- 2147483121))
;                            (seq.++ (seq.unit (- 2147481607)) a!10)))))
;(let ((a!12 (seq.++ (seq.unit (- 2147473919))
;                    (seq.++ (seq.unit (- 2147479455))
;                            (seq.++ (seq.unit (- 2147480475)) a!11)))))
;(let ((a!13 (seq.++ (seq.unit (- 2147477871))
;                    (seq.++ (seq.unit (- 2147477504))
;                            (seq.++ (seq.unit (- 2147474156)) a!12)))))
;(let ((a!14 (seq.++ (seq.unit (- 2147475017))
;                    (seq.++ (seq.unit (- 2147474973))
;                            (seq.++ (seq.unit (- 2147482053)) a!13)))))
;(let ((a!15 (seq.++ (seq.unit (- 2147483426))
;                    (seq.++ (seq.unit (- 2147480927))
;                            (seq.++ (seq.unit (- 2147477520)) a!14)))))
;(let ((a!16 (seq.++ (seq.unit (- 2147476038))
;                    (seq.++ (seq.unit (- 2147481004))
;                            (seq.++ (seq.unit (- 2147479889)) a!15)))))
;(let ((a!17 (seq.++ (seq.unit (- 2147483028))
;                    (seq.++ (seq.unit (- 2147478010))
;                            (seq.++ (seq.unit (- 2147480142)) a!16)))))
;  (List_Int a!1
;            (seq.++ (seq.unit (- 2147474444))
;                    (seq.++ (seq.unit (- 2147479732)) a!17))))))))))))))))))))
;(define-fun ret_56_SYMINT () Int
;  (- 2147475384))
;(define-fun ret_32_SYMINT () Int
;  (- 2147477871))
;(define-fun ret_22_SYMINT () Int
;  (- 2147480927))
;(define-fun ret_4_SYMINT () Int
;  (- 2147474444))
;(define-fun ret_100_SYMINT () Int
;  (- 2147474030))
;(define-fun ret_68_SYMINT () Int
;  (- 2147477316))
;(define-fun ret_14_SYMINT () Int
;  (- 2147476038))
;(define-fun ret_96_SYMINT () Int
;  (- 2147475014))
;(define-fun ret_26_SYMINT () Int
;  (- 2147475017))
;(define-fun ret_62_SYMINT () Int
;  (- 2147483515))
;(define-fun ret_48_SYMINT () Int
;  (- 2147481607))
;(define-fun ret_46_SYMINT () Int
;  (- 2147483121))
;(define-fun ret_36_SYMINT () Int
;  (- 2147474156))
;(define-fun ret_86_SYMINT () Int
;  (- 2147481255))
;(define-fun ret_34_SYMINT () Int
;  (- 2147477504))
;(define-fun ret_102_SYMINT () Int
;  (- 2147481373))
;(define-fun ret_90_SYMINT () Int
;  (- 2147478797))
;(define-fun ret_54_SYMINT () Int
;  (- 2147482426))
;(define-fun ret_52_SYMINT () Int
;  (- 2147480906))
;(define-fun ret_88_SYMINT () Int
;  (- 2147475636))
;(define-fun ret_72_SYMINT () Int
;  (- 2147482230))
;(define-fun ret_30_SYMINT () Int
;  (- 2147482053))
;(define-fun ret_78_SYMINT () Int
;  (- 2147479111))
;(define-fun ret_70_SYMINT () Int
;  (- 2147480280))
;(define-fun ret_66_SYMINT () Int
;  (- 2147480291))
;(define-fun ret_94_SYMINT () Int
;  (- 2147482184))
;(define-fun ret_16_SYMINT () Int
;  (- 2147481004))
;(define-fun ret_98_SYMINT () Int
;  (- 2147474494))
;(define-fun ret_44_SYMINT () Int
;  (- 2147482725))
;(define-fun ret_40_SYMINT () Int
;  (- 2147479455))
;(define-fun ret_76_SYMINT () Int
;  (- 2147482384))
;(define-fun ret_60_SYMINT () Int
;  (- 2147478408))
;(define-fun ret_80_SYMINT () Int
;  (- 2147480447))
;(define-fun ret_50_SYMINT () Int
;  (- 2147476995))
;(define-fun ret_8_SYMINT () Int
;  (- 2147483028))
;(define-fun ret_104_SYMINT () Int
;  (- 2147483618))
;(define-fun ret_38_SYMINT () Int
;  (- 2147473919))
;(define-fun ret_24_SYMINT () Int
;  (- 2147477520))
;(define-fun ret_12_SYMINT () Int
;  (- 2147480142))
;(define-fun ret_42_SYMINT () Int
;  (- 2147480475))
;(define-fun ret_6_SYMINT () Int
;  (- 2147479732))
;(define-fun ret_82_SYMINT () Int
;  (- 2147474806))
;(define-fun ret_92_SYMINT () Int
;  (- 2147480889))
;(define-fun ret_64_SYMINT () Int
;  (- 2147478496))
;(define-fun ret_20_SYMINT () Int
;  (- 2147483426))
;(define-fun ret_18_SYMINT () Int
;  (- 2147479889))
;(define-fun ret_84_SYMINT () Int
;  (- 2147474827))
;(define-fun ret_28_SYMINT () Int
;  (- 2147474973))