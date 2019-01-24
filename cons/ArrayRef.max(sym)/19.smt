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
(declare-fun ret_5_SYMINT () Int)
(declare-fun ret_6_SYMINT () Int)
(declare-fun length_7_SYMINT () Int)
(declare-fun ret_9_SYMINT () Int)
(declare-fun ret_10_SYMINT () Int)
(declare-fun length_11_SYMINT () Int)
(declare-fun ret_13_SYMINT () Int)
(declare-fun ret_14_SYMINT () Int)
(declare-fun length_15_SYMINT () Int)
(declare-fun ret_17_SYMINT () Int)
(declare-fun ret_18_SYMINT () Int)
(declare-fun length_19_SYMINT () Int)
(declare-fun ret_21_SYMINT () Int)
(declare-fun ret_22_SYMINT () Int)
(declare-fun length_23_SYMINT () Int)
(declare-fun ret_25_SYMINT () Int)
(declare-fun ret_26_SYMINT () Int)
(declare-fun length_27_SYMINT () Int)
(declare-fun ret_29_SYMINT () Int)
(declare-fun ret_30_SYMINT () Int)
(declare-fun length_31_SYMINT () Int)
(declare-fun ret_33_SYMINT () Int)
(declare-fun ret_34_SYMINT () Int)
(declare-fun length_35_SYMINT () Int)
(declare-fun ret_37_SYMINT () Int)
(declare-fun ret_38_SYMINT () Int)
(declare-fun length_39_SYMINT () Int)
(declare-fun ret_41_SYMINT () Int)
(declare-fun ret_42_SYMINT () Int)
(declare-fun length_43_SYMINT () Int)
(declare-fun ret_45_SYMINT () Int)
(declare-fun ret_46_SYMINT () Int)
(declare-fun length_47_SYMINT () Int)
(declare-fun ret_49_SYMINT () Int)
(declare-fun ret_50_SYMINT () Int)
(declare-fun length_51_SYMINT () Int)
(declare-fun ret_53_SYMINT () Int)
(declare-fun ret_54_SYMINT () Int)
(declare-fun length_55_SYMINT () Int)
(declare-fun ret_57_SYMINT () Int)
(declare-fun ret_58_SYMINT () Int)
(declare-fun length_59_SYMINT () Int)
(declare-fun ret_61_SYMINT () Int)
(declare-fun ret_62_SYMINT () Int)
(declare-fun length_63_SYMINT () Int)
(declare-fun ret_65_SYMINT () Int)
(declare-fun ret_66_SYMINT () Int)
(declare-fun length_67_SYMINT () Int)
(declare-fun ret_69_SYMINT () Int)
(declare-fun ret_70_SYMINT () Int)
(declare-fun length_71_SYMINT () Int)
(declare-fun ret_73_SYMINT () Int)
(declare-fun ret_74_SYMINT () Int)
(declare-fun length_75_SYMINT () Int)
(assert (and 
(>= length_75_SYMINT (- 2147483648))
(<= length_75_SYMINT 2147483647)
(>= 19 length_75_SYMINT)
(>= ret_73_SYMINT (- 2147483648))
(<= ret_73_SYMINT 2147483647)
(>= ret_70_SYMINT (- 2147483648))
(<= ret_70_SYMINT 2147483647)
(> ret_73_SYMINT ret_70_SYMINT)
(>= length_71_SYMINT (- 2147483648))
(<= length_71_SYMINT 2147483647)
(< 18 length_71_SYMINT)
(>= ret_69_SYMINT (- 2147483648))
(<= ret_69_SYMINT 2147483647)
(>= ret_66_SYMINT (- 2147483648))
(<= ret_66_SYMINT 2147483647)
(> ret_69_SYMINT ret_66_SYMINT)
(>= length_67_SYMINT (- 2147483648))
(<= length_67_SYMINT 2147483647)
(< 17 length_67_SYMINT)
(>= ret_65_SYMINT (- 2147483648))
(<= ret_65_SYMINT 2147483647)
(>= ret_62_SYMINT (- 2147483648))
(<= ret_62_SYMINT 2147483647)
(> ret_65_SYMINT ret_62_SYMINT)
(>= length_63_SYMINT (- 2147483648))
(<= length_63_SYMINT 2147483647)
(< 16 length_63_SYMINT)
(>= ret_61_SYMINT (- 2147483648))
(<= ret_61_SYMINT 2147483647)
(>= ret_58_SYMINT (- 2147483648))
(<= ret_58_SYMINT 2147483647)
(> ret_61_SYMINT ret_58_SYMINT)
(>= length_59_SYMINT (- 2147483648))
(<= length_59_SYMINT 2147483647)
(< 15 length_59_SYMINT)
(>= ret_57_SYMINT (- 2147483648))
(<= ret_57_SYMINT 2147483647)
(>= ret_54_SYMINT (- 2147483648))
(<= ret_54_SYMINT 2147483647)
(> ret_57_SYMINT ret_54_SYMINT)
(>= length_55_SYMINT (- 2147483648))
(<= length_55_SYMINT 2147483647)
(< 14 length_55_SYMINT)
(>= ret_53_SYMINT (- 2147483648))
(<= ret_53_SYMINT 2147483647)
(>= ret_50_SYMINT (- 2147483648))
(<= ret_50_SYMINT 2147483647)
(> ret_53_SYMINT ret_50_SYMINT)
(>= length_51_SYMINT (- 2147483648))
(<= length_51_SYMINT 2147483647)
(< 13 length_51_SYMINT)
(>= ret_49_SYMINT (- 2147483648))
(<= ret_49_SYMINT 2147483647)
(>= ret_46_SYMINT (- 2147483648))
(<= ret_46_SYMINT 2147483647)
(> ret_49_SYMINT ret_46_SYMINT)
(>= length_47_SYMINT (- 2147483648))
(<= length_47_SYMINT 2147483647)
(< 12 length_47_SYMINT)
(>= ret_45_SYMINT (- 2147483648))
(<= ret_45_SYMINT 2147483647)
(>= ret_42_SYMINT (- 2147483648))
(<= ret_42_SYMINT 2147483647)
(> ret_45_SYMINT ret_42_SYMINT)
(>= length_43_SYMINT (- 2147483648))
(<= length_43_SYMINT 2147483647)
(< 11 length_43_SYMINT)
(>= ret_41_SYMINT (- 2147483648))
(<= ret_41_SYMINT 2147483647)
(>= ret_38_SYMINT (- 2147483648))
(<= ret_38_SYMINT 2147483647)
(> ret_41_SYMINT ret_38_SYMINT)
(>= length_39_SYMINT (- 2147483648))
(<= length_39_SYMINT 2147483647)
(< 10 length_39_SYMINT)
(>= ret_37_SYMINT (- 2147483648))
(<= ret_37_SYMINT 2147483647)
(>= ret_34_SYMINT (- 2147483648))
(<= ret_34_SYMINT 2147483647)
(> ret_37_SYMINT ret_34_SYMINT)
(>= length_35_SYMINT (- 2147483648))
(<= length_35_SYMINT 2147483647)
(< 9 length_35_SYMINT)
(>= ret_33_SYMINT (- 2147483648))
(<= ret_33_SYMINT 2147483647)
(>= ret_30_SYMINT (- 2147483648))
(<= ret_30_SYMINT 2147483647)
(> ret_33_SYMINT ret_30_SYMINT)
(>= length_31_SYMINT (- 2147483648))
(<= length_31_SYMINT 2147483647)
(< 8 length_31_SYMINT)
(>= ret_29_SYMINT (- 2147483648))
(<= ret_29_SYMINT 2147483647)
(>= ret_26_SYMINT (- 2147483648))
(<= ret_26_SYMINT 2147483647)
(> ret_29_SYMINT ret_26_SYMINT)
(>= length_27_SYMINT (- 2147483648))
(<= length_27_SYMINT 2147483647)
(< 7 length_27_SYMINT)
(>= ret_25_SYMINT (- 2147483648))
(<= ret_25_SYMINT 2147483647)
(>= ret_22_SYMINT (- 2147483648))
(<= ret_22_SYMINT 2147483647)
(> ret_25_SYMINT ret_22_SYMINT)
(>= length_23_SYMINT (- 2147483648))
(<= length_23_SYMINT 2147483647)
(< 6 length_23_SYMINT)
(>= ret_21_SYMINT (- 2147483648))
(<= ret_21_SYMINT 2147483647)
(>= ret_18_SYMINT (- 2147483648))
(<= ret_18_SYMINT 2147483647)
(> ret_21_SYMINT ret_18_SYMINT)
(>= length_19_SYMINT (- 2147483648))
(<= length_19_SYMINT 2147483647)
(< 5 length_19_SYMINT)
(>= ret_17_SYMINT (- 2147483648))
(<= ret_17_SYMINT 2147483647)
(>= ret_14_SYMINT (- 2147483648))
(<= ret_14_SYMINT 2147483647)
(> ret_17_SYMINT ret_14_SYMINT)
(>= length_15_SYMINT (- 2147483648))
(<= length_15_SYMINT 2147483647)
(< 4 length_15_SYMINT)
(>= ret_13_SYMINT (- 2147483648))
(<= ret_13_SYMINT 2147483647)
(>= ret_10_SYMINT (- 2147483648))
(<= ret_10_SYMINT 2147483647)
(> ret_13_SYMINT ret_10_SYMINT)
(>= length_11_SYMINT (- 2147483648))
(<= length_11_SYMINT 2147483647)
(< 3 length_11_SYMINT)
(>= ret_9_SYMINT (- 2147483648))
(<= ret_9_SYMINT 2147483647)
(>= ret_6_SYMINT (- 2147483648))
(<= ret_6_SYMINT 2147483647)
(> ret_9_SYMINT ret_6_SYMINT)
(>= length_7_SYMINT (- 2147483648))
(<= length_7_SYMINT 2147483647)
(< 2 length_7_SYMINT)
(>= ret_5_SYMINT (- 2147483648))
(<= ret_5_SYMINT 2147483647)
(>= ret_2_SYMINT (- 2147483648))
(<= ret_2_SYMINT 2147483647)
(> ret_5_SYMINT ret_2_SYMINT)
(>= length_3_SYMINT (- 2147483648))
(<= length_3_SYMINT 2147483647)
(< 1 length_3_SYMINT)
(let ((a!1 (=> (> length_75_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_75_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_75_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(>= ret_74_SYMINT (- 2147483648))
(<= ret_74_SYMINT 2147483647)
(and (>= 18 0)
     (< 18 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_74_SYMINT) (seq.at (element array_1_SYMARRAY) 18)))
(and (>= 18 0)
     (< 18 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_73_SYMINT) (seq.at (element array_1_SYMARRAY) 18)))
(let ((a!1 (=> (> length_71_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_71_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_71_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(and (>= 17 0)
     (< 17 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_70_SYMINT) (seq.at (element array_1_SYMARRAY) 17)))
(and (>= 17 0)
     (< 17 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_69_SYMINT) (seq.at (element array_1_SYMARRAY) 17)))
(let ((a!1 (=> (> length_67_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_67_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_67_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(and (>= 16 0)
     (< 16 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_66_SYMINT) (seq.at (element array_1_SYMARRAY) 16)))
(and (>= 16 0)
     (< 16 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_65_SYMINT) (seq.at (element array_1_SYMARRAY) 16)))
(let ((a!1 (=> (> length_63_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_63_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_63_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(and (>= 15 0)
     (< 15 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_62_SYMINT) (seq.at (element array_1_SYMARRAY) 15)))
(and (>= 15 0)
     (< 15 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_61_SYMINT) (seq.at (element array_1_SYMARRAY) 15)))
(let ((a!1 (=> (> length_59_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_59_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_59_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(and (>= 14 0)
     (< 14 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_58_SYMINT) (seq.at (element array_1_SYMARRAY) 14)))
(and (>= 14 0)
     (< 14 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_57_SYMINT) (seq.at (element array_1_SYMARRAY) 14)))
(let ((a!1 (=> (> length_55_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_55_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_55_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(and (>= 13 0)
     (< 13 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_54_SYMINT) (seq.at (element array_1_SYMARRAY) 13)))
(and (>= 13 0)
     (< 13 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_53_SYMINT) (seq.at (element array_1_SYMARRAY) 13)))
(let ((a!1 (=> (> length_51_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_51_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_51_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(and (>= 12 0)
     (< 12 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_50_SYMINT) (seq.at (element array_1_SYMARRAY) 12)))
(and (>= 12 0)
     (< 12 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_49_SYMINT) (seq.at (element array_1_SYMARRAY) 12)))
(let ((a!1 (=> (> length_47_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_47_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_47_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(and (>= 11 0)
     (< 11 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_46_SYMINT) (seq.at (element array_1_SYMARRAY) 11)))
(and (>= 11 0)
     (< 11 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_45_SYMINT) (seq.at (element array_1_SYMARRAY) 11)))
(let ((a!1 (=> (> length_43_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_43_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_43_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(and (>= 10 0)
     (< 10 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_42_SYMINT) (seq.at (element array_1_SYMARRAY) 10)))
(and (>= 10 0)
     (< 10 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_41_SYMINT) (seq.at (element array_1_SYMARRAY) 10)))
(let ((a!1 (=> (> length_39_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_39_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_39_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(and (>= 9 0)
     (< 9 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_38_SYMINT) (seq.at (element array_1_SYMARRAY) 9)))
(and (>= 9 0)
     (< 9 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_37_SYMINT) (seq.at (element array_1_SYMARRAY) 9)))
(let ((a!1 (=> (> length_35_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_35_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_35_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(and (>= 8 0)
     (< 8 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_34_SYMINT) (seq.at (element array_1_SYMARRAY) 8)))
(and (>= 8 0)
     (< 8 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_33_SYMINT) (seq.at (element array_1_SYMARRAY) 8)))
(let ((a!1 (=> (> length_31_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_31_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_31_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(and (>= 7 0)
     (< 7 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_30_SYMINT) (seq.at (element array_1_SYMARRAY) 7)))
(and (>= 7 0)
     (< 7 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_29_SYMINT) (seq.at (element array_1_SYMARRAY) 7)))
(let ((a!1 (=> (> length_27_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_27_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_27_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(and (>= 6 0)
     (< 6 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_26_SYMINT) (seq.at (element array_1_SYMARRAY) 6)))
(and (>= 6 0)
     (< 6 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_25_SYMINT) (seq.at (element array_1_SYMARRAY) 6)))
(let ((a!1 (=> (> length_23_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_23_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_23_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(and (>= 5 0)
     (< 5 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_22_SYMINT) (seq.at (element array_1_SYMARRAY) 5)))
(and (>= 5 0)
     (< 5 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_21_SYMINT) (seq.at (element array_1_SYMARRAY) 5)))
(let ((a!1 (=> (> length_19_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_19_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_19_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(and (>= 4 0)
     (< 4 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_18_SYMINT) (seq.at (element array_1_SYMARRAY) 4)))
(and (>= 4 0)
     (< 4 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_17_SYMINT) (seq.at (element array_1_SYMARRAY) 4)))
(let ((a!1 (=> (> length_15_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_15_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_15_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(and (>= 3 0)
     (< 3 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_14_SYMINT) (seq.at (element array_1_SYMARRAY) 3)))
(and (>= 3 0)
     (< 3 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_13_SYMINT) (seq.at (element array_1_SYMARRAY) 3)))
(let ((a!1 (=> (> length_11_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_11_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_11_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(and (>= 2 0)
     (< 2 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_10_SYMINT) (seq.at (element array_1_SYMARRAY) 2)))
(and (>= 2 0)
     (< 2 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_9_SYMINT) (seq.at (element array_1_SYMARRAY) 2)))
(let ((a!1 (=> (> length_7_SYMINT 0) (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_7_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_7_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(and (>= 1 0)
     (< 1 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_6_SYMINT) (seq.at (element array_1_SYMARRAY) 1)))
(and (>= 1 0)
     (< 1 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_5_SYMINT) (seq.at (element array_1_SYMARRAY) 1)))
(let ((a!1 (=> (> length_3_SYMINT 0) (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_3_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_3_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(and (>= 0 0)
     (< 0 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_2_SYMINT) (seq.at (element array_1_SYMARRAY) 0)))
))
;
(declare-const retMain_76_SYMINT Int)
(assert (= retMain_76_SYMINT ret_74_SYMINT))
;(define-fun ret_2_SYMINT () Int
;  (- 2147483647))
;(define-fun ret_25_SYMINT () Int
;  (- 2147483641))
;(define-fun ret_10_SYMINT () Int
;  (- 2147483645))
;(define-fun ret_74_SYMINT () Int
;  (- 2147481949))
;(define-fun array_1_SYMARRAY () List_Int
;  (let ((a!1 (seq.++ (seq.unit (- 2147482872))
;                   (seq.++ (seq.unit (- 2147481951))
;                           (seq.++ (seq.unit (- 2147481950))
;                                   (seq.unit (- 2147481949)))))))
;(let ((a!2 (seq.++ (seq.unit (- 2147483542))
;                   (seq.++ (seq.unit (- 2147483484))
;                           (seq.++ (seq.unit (- 2147483427)) a!1)))))
;(let ((a!3 (seq.++ (seq.unit (- 2147483619))
;                   (seq.++ (seq.unit (- 2147483608))
;                           (seq.++ (seq.unit (- 2147483570)) a!2)))))
;(let ((a!4 (seq.++ (seq.unit (- 2147483641))
;                   (seq.++ (seq.unit (- 2147483639))
;                           (seq.++ (seq.unit (- 2147483631)) a!3)))))
;(let ((a!5 (seq.++ (seq.unit (- 2147483644))
;                   (seq.++ (seq.unit (- 2147483643))
;                           (seq.++ (seq.unit (- 2147483642)) a!4)))))
;(let ((a!6 (seq.++ (seq.unit (- 2147483647))
;                   (seq.++ (seq.unit (- 2147483646))
;                           (seq.++ (seq.unit (- 2147483645)) a!5)))))
;  (List_Int (lambda ((x!1 Int))
;              (or (= x!1 (- 6))
;                  (= x!1 2)
;                  (= x!1 (- 3))
;                  (= x!1 10)
;                  (= x!1 (- 11))
;                  (= x!1 5)))
;            a!6))))))))
;(define-fun length_59_SYMINT () Int
;  19)
;(define-fun ret_58_SYMINT () Int
;  (- 2147483427))
;(define-fun length_75_SYMINT () Int
;  19)
;(define-fun ret_22_SYMINT () Int
;  (- 2147483642))
;(define-fun ret_17_SYMINT () Int
;  (- 2147483643))
;(define-fun length_31_SYMINT () Int
;  19)
;(define-fun length_23_SYMINT () Int
;  19)
;(define-fun ret_29_SYMINT () Int
;  (- 2147483639))
;(define-fun ret_14_SYMINT () Int
;  (- 2147483644))
;(define-fun ret_26_SYMINT () Int
;  (- 2147483641))
;(define-fun ret_65_SYMINT () Int
;  (- 2147481951))
;(define-fun length_63_SYMINT () Int
;  19)
;(define-fun length_71_SYMINT () Int
;  19)
;(define-fun ret_45_SYMINT () Int
;  (- 2147483570))
;(define-fun ret_62_SYMINT () Int
;  (- 2147482872))
;(define-fun ret_46_SYMINT () Int
;  (- 2147483570))
;(define-fun ret_57_SYMINT () Int
;  (- 2147483427))
;(define-fun length_67_SYMINT () Int
;  19)
;(define-fun ret_34_SYMINT () Int
;  (- 2147483631))
;(define-fun ret_41_SYMINT () Int
;  (- 2147483608))
;(define-fun ret_9_SYMINT () Int
;  (- 2147483645))
;(define-fun ret_54_SYMINT () Int
;  (- 2147483484))
;(define-fun ret_73_SYMINT () Int
;  (- 2147481949))
;(define-fun length_15_SYMINT () Int
;  19)
;(define-fun ret_30_SYMINT () Int
;  (- 2147483639))
;(define-fun length_51_SYMINT () Int
;  19)
;(define-fun length_35_SYMINT () Int
;  19)
;(define-fun ret_61_SYMINT () Int
;  (- 2147482872))
;(define-fun ret_5_SYMINT () Int
;  (- 2147483646))
;(define-fun ret_70_SYMINT () Int
;  (- 2147481950))
;(define-fun ret_69_SYMINT () Int
;  (- 2147481950))
;(define-fun ret_66_SYMINT () Int
;  (- 2147481951))
;(define-fun length_3_SYMINT () Int
;  19)
;(define-fun length_55_SYMINT () Int
;  19)
;(define-fun ret_53_SYMINT () Int
;  (- 2147483484))
;(define-fun ret_33_SYMINT () Int
;  (- 2147483631))
;(define-fun ret_21_SYMINT () Int
;  (- 2147483642))
;(define-fun length_11_SYMINT () Int
;  19)
;(define-fun length_19_SYMINT () Int
;  19)
;(define-fun ret_50_SYMINT () Int
;  (- 2147483542))
;(define-fun length_39_SYMINT () Int
;  19)
;(define-fun ret_49_SYMINT () Int
;  (- 2147483542))
;(define-fun ret_38_SYMINT () Int
;  (- 2147483619))
;(define-fun length_7_SYMINT () Int
;  19)
;(define-fun ret_42_SYMINT () Int
;  (- 2147483608))
;(define-fun length_27_SYMINT () Int
;  19)
;(define-fun ret_6_SYMINT () Int
;  (- 2147483646))
;(define-fun ret_37_SYMINT () Int
;  (- 2147483619))
;(define-fun length_47_SYMINT () Int
;  19)
;(define-fun ret_13_SYMINT () Int
;  (- 2147483644))
;(define-fun ret_18_SYMINT () Int
;  (- 2147483643))
;(define-fun length_43_SYMINT () Int
;  19)