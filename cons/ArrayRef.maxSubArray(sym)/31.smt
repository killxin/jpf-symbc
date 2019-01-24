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
(declare-fun ret_48_SYMINT () Int)
(declare-fun length_49_SYMINT () Int)
(declare-fun ret_51_SYMINT () Int)
(declare-fun length_52_SYMINT () Int)
(declare-fun ret_54_SYMINT () Int)
(declare-fun length_55_SYMINT () Int)
(declare-fun ret_57_SYMINT () Int)
(declare-fun length_58_SYMINT () Int)
(declare-fun ret_60_SYMINT () Int)
(declare-fun length_61_SYMINT () Int)
(declare-fun ret_63_SYMINT () Int)
(declare-fun length_64_SYMINT () Int)
(declare-fun ret_66_SYMINT () Int)
(declare-fun length_67_SYMINT () Int)
(declare-fun ret_69_SYMINT () Int)
(declare-fun length_70_SYMINT () Int)
(declare-fun ret_72_SYMINT () Int)
(declare-fun length_73_SYMINT () Int)
(declare-fun ret_75_SYMINT () Int)
(declare-fun length_76_SYMINT () Int)
(declare-fun ret_78_SYMINT () Int)
(declare-fun length_79_SYMINT () Int)
(declare-fun ret_81_SYMINT () Int)
(declare-fun length_82_SYMINT () Int)
(declare-fun ret_84_SYMINT () Int)
(declare-fun length_85_SYMINT () Int)
(declare-fun ret_87_SYMINT () Int)
(declare-fun length_88_SYMINT () Int)
(declare-fun ret_90_SYMINT () Int)
(declare-fun length_91_SYMINT () Int)
(declare-fun ret_93_SYMINT () Int)
(declare-fun length_94_SYMINT () Int)
(assert (and 
(>= length_94_SYMINT (- 2147483648))
(<= length_94_SYMINT 2147483647)
(>= 31 length_94_SYMINT)
(>= ret_93_SYMINT (- 2147483648))
(<= ret_93_SYMINT 2147483647)
(>= ret_90_SYMINT (- 2147483648))
(<= ret_90_SYMINT 2147483647)
(> ret_93_SYMINT ret_90_SYMINT)
(<= ret_90_SYMINT 0)
(>= length_91_SYMINT (- 2147483648))
(<= length_91_SYMINT 2147483647)
(< 30 length_91_SYMINT)
(>= ret_87_SYMINT (- 2147483648))
(<= ret_87_SYMINT 2147483647)
(> ret_90_SYMINT ret_87_SYMINT)
(<= ret_87_SYMINT 0)
(>= length_88_SYMINT (- 2147483648))
(<= length_88_SYMINT 2147483647)
(< 29 length_88_SYMINT)
(>= ret_84_SYMINT (- 2147483648))
(<= ret_84_SYMINT 2147483647)
(> ret_87_SYMINT ret_84_SYMINT)
(<= ret_84_SYMINT 0)
(>= length_85_SYMINT (- 2147483648))
(<= length_85_SYMINT 2147483647)
(< 28 length_85_SYMINT)
(>= ret_81_SYMINT (- 2147483648))
(<= ret_81_SYMINT 2147483647)
(> ret_84_SYMINT ret_81_SYMINT)
(<= ret_81_SYMINT 0)
(>= length_82_SYMINT (- 2147483648))
(<= length_82_SYMINT 2147483647)
(< 27 length_82_SYMINT)
(>= ret_78_SYMINT (- 2147483648))
(<= ret_78_SYMINT 2147483647)
(> ret_81_SYMINT ret_78_SYMINT)
(<= ret_78_SYMINT 0)
(>= length_79_SYMINT (- 2147483648))
(<= length_79_SYMINT 2147483647)
(< 26 length_79_SYMINT)
(>= ret_75_SYMINT (- 2147483648))
(<= ret_75_SYMINT 2147483647)
(> ret_78_SYMINT ret_75_SYMINT)
(<= ret_75_SYMINT 0)
(>= length_76_SYMINT (- 2147483648))
(<= length_76_SYMINT 2147483647)
(< 25 length_76_SYMINT)
(>= ret_72_SYMINT (- 2147483648))
(<= ret_72_SYMINT 2147483647)
(> ret_75_SYMINT ret_72_SYMINT)
(<= ret_72_SYMINT 0)
(>= length_73_SYMINT (- 2147483648))
(<= length_73_SYMINT 2147483647)
(< 24 length_73_SYMINT)
(>= ret_69_SYMINT (- 2147483648))
(<= ret_69_SYMINT 2147483647)
(> ret_72_SYMINT ret_69_SYMINT)
(<= ret_69_SYMINT 0)
(>= length_70_SYMINT (- 2147483648))
(<= length_70_SYMINT 2147483647)
(< 23 length_70_SYMINT)
(>= ret_66_SYMINT (- 2147483648))
(<= ret_66_SYMINT 2147483647)
(> ret_69_SYMINT ret_66_SYMINT)
(<= ret_66_SYMINT 0)
(>= length_67_SYMINT (- 2147483648))
(<= length_67_SYMINT 2147483647)
(< 22 length_67_SYMINT)
(>= ret_63_SYMINT (- 2147483648))
(<= ret_63_SYMINT 2147483647)
(> ret_66_SYMINT ret_63_SYMINT)
(<= ret_63_SYMINT 0)
(>= length_64_SYMINT (- 2147483648))
(<= length_64_SYMINT 2147483647)
(< 21 length_64_SYMINT)
(>= ret_60_SYMINT (- 2147483648))
(<= ret_60_SYMINT 2147483647)
(> ret_63_SYMINT ret_60_SYMINT)
(<= ret_60_SYMINT 0)
(>= length_61_SYMINT (- 2147483648))
(<= length_61_SYMINT 2147483647)
(< 20 length_61_SYMINT)
(>= ret_57_SYMINT (- 2147483648))
(<= ret_57_SYMINT 2147483647)
(> ret_60_SYMINT ret_57_SYMINT)
(<= ret_57_SYMINT 0)
(>= length_58_SYMINT (- 2147483648))
(<= length_58_SYMINT 2147483647)
(< 19 length_58_SYMINT)
(>= ret_54_SYMINT (- 2147483648))
(<= ret_54_SYMINT 2147483647)
(> ret_57_SYMINT ret_54_SYMINT)
(<= ret_54_SYMINT 0)
(>= length_55_SYMINT (- 2147483648))
(<= length_55_SYMINT 2147483647)
(< 18 length_55_SYMINT)
(>= ret_51_SYMINT (- 2147483648))
(<= ret_51_SYMINT 2147483647)
(> ret_54_SYMINT ret_51_SYMINT)
(<= ret_51_SYMINT 0)
(>= length_52_SYMINT (- 2147483648))
(<= length_52_SYMINT 2147483647)
(< 17 length_52_SYMINT)
(>= ret_48_SYMINT (- 2147483648))
(<= ret_48_SYMINT 2147483647)
(> ret_51_SYMINT ret_48_SYMINT)
(<= ret_48_SYMINT 0)
(>= length_49_SYMINT (- 2147483648))
(<= length_49_SYMINT 2147483647)
(< 16 length_49_SYMINT)
(>= ret_45_SYMINT (- 2147483648))
(<= ret_45_SYMINT 2147483647)
(> ret_48_SYMINT ret_45_SYMINT)
(<= ret_45_SYMINT 0)
(>= length_46_SYMINT (- 2147483648))
(<= length_46_SYMINT 2147483647)
(< 15 length_46_SYMINT)
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
(let ((a!1 (=> (> length_94_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_94_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_94_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 30 0)
     (< 30 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_93_SYMINT) (seq.at (element nums_1_SYMARRAY) 30)))
(let ((a!1 (=> (> length_91_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_91_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_91_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 29 0)
     (< 29 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_90_SYMINT) (seq.at (element nums_1_SYMARRAY) 29)))
(let ((a!1 (=> (> length_88_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_88_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_88_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 28 0)
     (< 28 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_87_SYMINT) (seq.at (element nums_1_SYMARRAY) 28)))
(let ((a!1 (=> (> length_85_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_85_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_85_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 27 0)
     (< 27 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_84_SYMINT) (seq.at (element nums_1_SYMARRAY) 27)))
(let ((a!1 (=> (> length_82_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_82_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_82_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 26 0)
     (< 26 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_81_SYMINT) (seq.at (element nums_1_SYMARRAY) 26)))
(let ((a!1 (=> (> length_79_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_79_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_79_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 25 0)
     (< 25 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_78_SYMINT) (seq.at (element nums_1_SYMARRAY) 25)))
(let ((a!1 (=> (> length_76_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_76_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_76_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 24 0)
     (< 24 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_75_SYMINT) (seq.at (element nums_1_SYMARRAY) 24)))
(let ((a!1 (=> (> length_73_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_73_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_73_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 23 0)
     (< 23 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_72_SYMINT) (seq.at (element nums_1_SYMARRAY) 23)))
(let ((a!1 (=> (> length_70_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_70_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_70_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 22 0)
     (< 22 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_69_SYMINT) (seq.at (element nums_1_SYMARRAY) 22)))
(let ((a!1 (=> (> length_67_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_67_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_67_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 21 0)
     (< 21 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_66_SYMINT) (seq.at (element nums_1_SYMARRAY) 21)))
(let ((a!1 (=> (> length_64_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_64_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_64_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 20 0)
     (< 20 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_63_SYMINT) (seq.at (element nums_1_SYMARRAY) 20)))
(let ((a!1 (=> (> length_61_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_61_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_61_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 19 0)
     (< 19 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_60_SYMINT) (seq.at (element nums_1_SYMARRAY) 19)))
(let ((a!1 (=> (> length_58_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_58_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_58_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 18 0)
     (< 18 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_57_SYMINT) (seq.at (element nums_1_SYMARRAY) 18)))
(let ((a!1 (=> (> length_55_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_55_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_55_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 17 0)
     (< 17 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_54_SYMINT) (seq.at (element nums_1_SYMARRAY) 17)))
(let ((a!1 (=> (> length_52_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_52_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_52_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 16 0)
     (< 16 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_51_SYMINT) (seq.at (element nums_1_SYMARRAY) 16)))
(let ((a!1 (=> (> length_49_SYMINT 0) (> (s!ze (mapping nums_1_SYMARRAY) 10) 0))))
  (and (= length_49_SYMINT (seq.len (element nums_1_SYMARRAY)))
       (>= length_49_SYMINT (s!ze (mapping nums_1_SYMARRAY) 10))
       a!1))
(and (>= 15 0)
     (< 15 (seq.len (element nums_1_SYMARRAY)))
     (= (seq.unit ret_48_SYMINT) (seq.at (element nums_1_SYMARRAY) 15)))
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
(declare-const retMain_95_SYMINT Int)
(assert (= retMain_95_SYMINT ret_93_SYMINT))
;(define-fun ret_39_SYMINT () Int
;  (- 2147483631))
;(define-fun length_2_SYMINT () Int
;  31)
;(define-fun length_70_SYMINT () Int
;  31)
;(define-fun length_58_SYMINT () Int
;  31)
;(define-fun length_94_SYMINT () Int
;  31)
;(define-fun length_34_SYMINT () Int
;  31)
;(define-fun length_31_SYMINT () Int
;  31)
;(define-fun ret_27_SYMINT () Int
;  (- 2147483635))
;(define-fun length_91_SYMINT () Int
;  31)
;(define-fun length_64_SYMINT () Int
;  31)
;(define-fun ret_93_SYMINT () Int
;  (- 2147478400))
;(define-fun length_28_SYMINT () Int
;  31)
;(define-fun length_79_SYMINT () Int
;  31)
;(define-fun ret_45_SYMINT () Int
;  (- 2147483629))
;(define-fun ret_48_SYMINT () Int
;  (- 2147483628))
;(define-fun ret_36_SYMINT () Int
;  (- 2147483632))
;(define-fun length_16_SYMINT () Int
;  31)
;(define-fun ret_57_SYMINT () Int
;  (- 2147483625))
;(define-fun length_67_SYMINT () Int
;  31)
;(define-fun length_40_SYMINT () Int
;  31)
;(define-fun ret_90_SYMINT () Int
;  (- 2147478401))
;(define-fun ret_54_SYMINT () Int
;  (- 2147483626))
;(define-fun ret_9_SYMINT () Int
;  (- 2147483641))
;(define-fun length_49_SYMINT () Int
;  31)
;(define-fun length_37_SYMINT () Int
;  31)
;(define-fun ret_72_SYMINT () Int
;  (- 2147483603))
;(define-fun ret_30_SYMINT () Int
;  (- 2147483634))
;(define-fun length_61_SYMINT () Int
;  31)
;(define-fun ret_78_SYMINT () Int
;  (- 2147483503))
;(define-fun length_73_SYMINT () Int
;  31)
;(define-fun ret_63_SYMINT () Int
;  (- 2147483622))
;(define-fun length_13_SYMINT () Int
;  31)
;(define-fun length_46_SYMINT () Int
;  31)
;(define-fun ret_69_SYMINT () Int
;  (- 2147483613))
;(define-fun length_82_SYMINT () Int
;  31)
;(define-fun ret_75_SYMINT () Int
;  (- 2147483540))
;(define-fun ret_66_SYMINT () Int
;  (- 2147483616))
;(define-fun length_55_SYMINT () Int
;  31)
;(define-fun ret_33_SYMINT () Int
;  (- 2147483633))
;(define-fun ret_21_SYMINT () Int
;  (- 2147483637))
;(define-fun ret_3_SYMINT () Int
;  (- 2147483643))
;(define-fun length_19_SYMINT () Int
;  31)
;(define-fun ret_60_SYMINT () Int
;  (- 2147483624))
;(define-fun length_76_SYMINT () Int
;  31)
;(define-fun length_52_SYMINT () Int
;  31)
;(define-fun ret_81_SYMINT () Int
;  (- 2147483102))
;(define-fun nums_1_SYMARRAY () List_Int
;  (let ((a!1 (seq.++ (seq.unit (- 2147481360))
;                   (seq.++ (seq.unit (- 2147478402))
;                           (seq.++ (seq.unit (- 2147478401))
;                                   (seq.unit (- 2147478400)))))))
;(let ((a!2 (seq.++ (seq.unit (- 2147483540))
;                   (seq.++ (seq.unit (- 2147483503))
;                           (seq.++ (seq.unit (- 2147483102)) a!1)))))
;(let ((a!3 (seq.++ (seq.unit (- 2147483616))
;                   (seq.++ (seq.unit (- 2147483613))
;                           (seq.++ (seq.unit (- 2147483603)) a!2)))))
;(let ((a!4 (seq.++ (seq.unit (- 2147483625))
;                   (seq.++ (seq.unit (- 2147483624))
;                           (seq.++ (seq.unit (- 2147483622)) a!3)))))
;(let ((a!5 (seq.++ (seq.unit (- 2147483628))
;                   (seq.++ (seq.unit (- 2147483627))
;                           (seq.++ (seq.unit (- 2147483626)) a!4)))))
;(let ((a!6 (seq.++ (seq.unit (- 2147483631))
;                   (seq.++ (seq.unit (- 2147483630))
;                           (seq.++ (seq.unit (- 2147483629)) a!5)))))
;(let ((a!7 (seq.++ (seq.unit (- 2147483634))
;                   (seq.++ (seq.unit (- 2147483633))
;                           (seq.++ (seq.unit (- 2147483632)) a!6)))))
;(let ((a!8 (seq.++ (seq.unit (- 2147483637))
;                   (seq.++ (seq.unit (- 2147483636))
;                           (seq.++ (seq.unit (- 2147483635)) a!7)))))
;(let ((a!9 (seq.++ (seq.unit (- 2147483640))
;                   (seq.++ (seq.unit (- 2147483639))
;                           (seq.++ (seq.unit (- 2147483638)) a!8)))))
;(let ((a!10 (seq.++ (seq.unit (- 2147483643))
;                    (seq.++ (seq.unit (- 2147483642))
;                            (seq.++ (seq.unit (- 2147483641)) a!9)))))
;  (List_Int (lambda ((x!1 Int))
;              (or (= x!1 7) (= x!1 (- 4)) (= x!1 4) (= x!1 10) (= x!1 5)))
;            a!10))))))))))))
;(define-fun ret_15_SYMINT () Int
;  (- 2147483639))
;(define-fun length_25_SYMINT () Int
;  31)
;(define-fun ret_24_SYMINT () Int
;  (- 2147483636))
;(define-fun length_10_SYMINT () Int
;  31)
;(define-fun ret_12_SYMINT () Int
;  (- 2147483640))
;(define-fun ret_51_SYMINT () Int
;  (- 2147483627))
;(define-fun ret_42_SYMINT () Int
;  (- 2147483630))
;(define-fun ret_6_SYMINT () Int
;  (- 2147483642))
;(define-fun length_7_SYMINT () Int
;  31)
;(define-fun length_4_SYMINT () Int
;  31)
;(define-fun length_22_SYMINT () Int
;  31)
;(define-fun length_85_SYMINT () Int
;  31)
;(define-fun length_88_SYMINT () Int
;  31)
;(define-fun ret_18_SYMINT () Int
;  (- 2147483638))
;(define-fun length_43_SYMINT () Int
;  31)
;(define-fun ret_84_SYMINT () Int
;  (- 2147481360))
;(define-fun ret_87_SYMINT () Int
;  (- 2147478402))