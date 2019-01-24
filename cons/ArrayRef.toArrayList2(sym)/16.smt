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
(declare-fun List@378_37_SYMOBJECT () (MyList Int))
(declare-fun List@378_7_SYMOBJECT () (MyList Int))
(declare-fun List@378_62_SYMOBJECT () (MyList Int))
(declare-fun List@378_17_SYMOBJECT () (MyList Int))
(declare-fun List@378_27_SYMOBJECT () (MyList Int))
(declare-fun List@378_72_SYMOBJECT () (MyList Int))
(declare-fun List@378_77_SYMOBJECT () (MyList Int))
(declare-fun List@378_57_SYMOBJECT () (MyList Int))
(declare-fun List@378_67_SYMOBJECT () (MyList Int))
(declare-fun List@378_47_SYMOBJECT () (MyList Int))
(declare-fun List@378_42_SYMOBJECT () (MyList Int))
(declare-fun List@378_22_SYMOBJECT () (MyList Int))
(declare-fun List@378_2_SYMOBJECT () (MyList Int))
(declare-fun List@378_3_SYMOBJECT () (MyList Int))
(declare-fun List@378_12_SYMOBJECT () (MyList Int))
(declare-fun List@378_32_SYMOBJECT () (MyList Int))
(declare-fun List@378_52_SYMOBJECT () (MyList Int))
(declare-fun array_1_SYMARRAY () (MyList Int))
(declare-fun length_4_SYMINT () Int)
(declare-fun ret_6_SYMINT () Int)
(declare-fun ret_8_SYMINT () Int)
(declare-fun length_9_SYMINT () Int)
(declare-fun ret_11_SYMINT () Int)
(declare-fun ret_13_SYMINT () Int)
(declare-fun length_14_SYMINT () Int)
(declare-fun ret_16_SYMINT () Int)
(declare-fun ret_18_SYMINT () Int)
(declare-fun length_19_SYMINT () Int)
(declare-fun ret_21_SYMINT () Int)
(declare-fun ret_23_SYMINT () Int)
(declare-fun length_24_SYMINT () Int)
(declare-fun ret_26_SYMINT () Int)
(declare-fun ret_28_SYMINT () Int)
(declare-fun length_29_SYMINT () Int)
(declare-fun ret_31_SYMINT () Int)
(declare-fun ret_33_SYMINT () Int)
(declare-fun length_34_SYMINT () Int)
(declare-fun ret_36_SYMINT () Int)
(declare-fun ret_38_SYMINT () Int)
(declare-fun length_39_SYMINT () Int)
(declare-fun ret_41_SYMINT () Int)
(declare-fun ret_43_SYMINT () Int)
(declare-fun length_44_SYMINT () Int)
(declare-fun ret_46_SYMINT () Int)
(declare-fun ret_48_SYMINT () Int)
(declare-fun length_49_SYMINT () Int)
(declare-fun ret_51_SYMINT () Int)
(declare-fun ret_53_SYMINT () Int)
(declare-fun length_54_SYMINT () Int)
(declare-fun ret_56_SYMINT () Int)
(declare-fun ret_58_SYMINT () Int)
(declare-fun length_59_SYMINT () Int)
(declare-fun ret_61_SYMINT () Int)
(declare-fun ret_63_SYMINT () Int)
(declare-fun length_64_SYMINT () Int)
(declare-fun ret_66_SYMINT () Int)
(declare-fun ret_68_SYMINT () Int)
(declare-fun length_69_SYMINT () Int)
(declare-fun ret_71_SYMINT () Int)
(declare-fun ret_73_SYMINT () Int)
(declare-fun length_74_SYMINT () Int)
(declare-fun ret_76_SYMINT () Int)
(declare-fun ret_78_SYMINT () Int)
(declare-fun length_79_SYMINT () Int)
(assert (and 
(>= length_79_SYMINT (- 2147483648))
(<= length_79_SYMINT 2147483647)
(>= 15 length_79_SYMINT)
(>= length_74_SYMINT (- 2147483648))
(<= length_74_SYMINT 2147483647)
(< 14 length_74_SYMINT)
(>= length_69_SYMINT (- 2147483648))
(<= length_69_SYMINT 2147483647)
(< 13 length_69_SYMINT)
(>= length_64_SYMINT (- 2147483648))
(<= length_64_SYMINT 2147483647)
(< 12 length_64_SYMINT)
(>= length_59_SYMINT (- 2147483648))
(<= length_59_SYMINT 2147483647)
(< 11 length_59_SYMINT)
(>= length_54_SYMINT (- 2147483648))
(<= length_54_SYMINT 2147483647)
(< 10 length_54_SYMINT)
(>= length_49_SYMINT (- 2147483648))
(<= length_49_SYMINT 2147483647)
(< 9 length_49_SYMINT)
(>= length_44_SYMINT (- 2147483648))
(<= length_44_SYMINT 2147483647)
(< 8 length_44_SYMINT)
(>= length_39_SYMINT (- 2147483648))
(<= length_39_SYMINT 2147483647)
(< 7 length_39_SYMINT)
(>= length_34_SYMINT (- 2147483648))
(<= length_34_SYMINT 2147483647)
(< 6 length_34_SYMINT)
(>= length_29_SYMINT (- 2147483648))
(<= length_29_SYMINT 2147483647)
(< 5 length_29_SYMINT)
(>= length_24_SYMINT (- 2147483648))
(<= length_24_SYMINT 2147483647)
(< 4 length_24_SYMINT)
(>= length_19_SYMINT (- 2147483648))
(<= length_19_SYMINT 2147483647)
(< 3 length_19_SYMINT)
(>= length_14_SYMINT (- 2147483648))
(<= length_14_SYMINT 2147483647)
(< 2 length_14_SYMINT)
(>= length_9_SYMINT (- 2147483648))
(<= length_9_SYMINT 2147483647)
(< 1 length_9_SYMINT)
(>= length_4_SYMINT (- 2147483648))
(<= length_4_SYMINT 2147483647)
(< 0 length_4_SYMINT)
(let ((a!1 (=> (> length_79_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_79_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_79_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(>= ret_76_SYMINT (- 2147483648))
(<= ret_76_SYMINT 2147483647)
(>= ret_78_SYMINT 0)
(<= ret_78_SYMINT 1)
(= ret_78_SYMINT 1)
(= (element List@378_77_SYMOBJECT)
   (seq.++ (element List@378_72_SYMOBJECT) (seq.unit ret_76_SYMINT)))
(= (mapping List@378_77_SYMOBJECT)
   (store (mapping List@378_72_SYMOBJECT) ret_76_SYMINT true))
(and (>= 14 0)
     (< 14 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_76_SYMINT) (seq.at (element array_1_SYMARRAY) 14)))
(let ((a!1 (=> (> length_74_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_74_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_74_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(>= ret_71_SYMINT (- 2147483648))
(<= ret_71_SYMINT 2147483647)
(>= ret_73_SYMINT 0)
(<= ret_73_SYMINT 1)
(= ret_73_SYMINT 1)
(= (element List@378_72_SYMOBJECT)
   (seq.++ (element List@378_67_SYMOBJECT) (seq.unit ret_71_SYMINT)))
(= (mapping List@378_72_SYMOBJECT)
   (store (mapping List@378_67_SYMOBJECT) ret_71_SYMINT true))
(and (>= 13 0)
     (< 13 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_71_SYMINT) (seq.at (element array_1_SYMARRAY) 13)))
(let ((a!1 (=> (> length_69_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_69_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_69_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(>= ret_66_SYMINT (- 2147483648))
(<= ret_66_SYMINT 2147483647)
(>= ret_68_SYMINT 0)
(<= ret_68_SYMINT 1)
(= ret_68_SYMINT 1)
(= (element List@378_67_SYMOBJECT)
   (seq.++ (element List@378_62_SYMOBJECT) (seq.unit ret_66_SYMINT)))
(= (mapping List@378_67_SYMOBJECT)
   (store (mapping List@378_62_SYMOBJECT) ret_66_SYMINT true))
(and (>= 12 0)
     (< 12 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_66_SYMINT) (seq.at (element array_1_SYMARRAY) 12)))
(let ((a!1 (=> (> length_64_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_64_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_64_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(>= ret_61_SYMINT (- 2147483648))
(<= ret_61_SYMINT 2147483647)
(>= ret_63_SYMINT 0)
(<= ret_63_SYMINT 1)
(= ret_63_SYMINT 1)
(= (element List@378_62_SYMOBJECT)
   (seq.++ (element List@378_57_SYMOBJECT) (seq.unit ret_61_SYMINT)))
(= (mapping List@378_62_SYMOBJECT)
   (store (mapping List@378_57_SYMOBJECT) ret_61_SYMINT true))
(and (>= 11 0)
     (< 11 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_61_SYMINT) (seq.at (element array_1_SYMARRAY) 11)))
(let ((a!1 (=> (> length_59_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_59_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_59_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(>= ret_56_SYMINT (- 2147483648))
(<= ret_56_SYMINT 2147483647)
(>= ret_58_SYMINT 0)
(<= ret_58_SYMINT 1)
(= ret_58_SYMINT 1)
(= (element List@378_57_SYMOBJECT)
   (seq.++ (element List@378_52_SYMOBJECT) (seq.unit ret_56_SYMINT)))
(= (mapping List@378_57_SYMOBJECT)
   (store (mapping List@378_52_SYMOBJECT) ret_56_SYMINT true))
(and (>= 10 0)
     (< 10 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_56_SYMINT) (seq.at (element array_1_SYMARRAY) 10)))
(let ((a!1 (=> (> length_54_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_54_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_54_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(>= ret_51_SYMINT (- 2147483648))
(<= ret_51_SYMINT 2147483647)
(>= ret_53_SYMINT 0)
(<= ret_53_SYMINT 1)
(= ret_53_SYMINT 1)
(= (element List@378_52_SYMOBJECT)
   (seq.++ (element List@378_47_SYMOBJECT) (seq.unit ret_51_SYMINT)))
(= (mapping List@378_52_SYMOBJECT)
   (store (mapping List@378_47_SYMOBJECT) ret_51_SYMINT true))
(and (>= 9 0)
     (< 9 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_51_SYMINT) (seq.at (element array_1_SYMARRAY) 9)))
(let ((a!1 (=> (> length_49_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_49_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_49_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(>= ret_46_SYMINT (- 2147483648))
(<= ret_46_SYMINT 2147483647)
(>= ret_48_SYMINT 0)
(<= ret_48_SYMINT 1)
(= ret_48_SYMINT 1)
(= (element List@378_47_SYMOBJECT)
   (seq.++ (element List@378_42_SYMOBJECT) (seq.unit ret_46_SYMINT)))
(= (mapping List@378_47_SYMOBJECT)
   (store (mapping List@378_42_SYMOBJECT) ret_46_SYMINT true))
(and (>= 8 0)
     (< 8 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_46_SYMINT) (seq.at (element array_1_SYMARRAY) 8)))
(let ((a!1 (=> (> length_44_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_44_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_44_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(>= ret_41_SYMINT (- 2147483648))
(<= ret_41_SYMINT 2147483647)
(>= ret_43_SYMINT 0)
(<= ret_43_SYMINT 1)
(= ret_43_SYMINT 1)
(= (element List@378_42_SYMOBJECT)
   (seq.++ (element List@378_37_SYMOBJECT) (seq.unit ret_41_SYMINT)))
(= (mapping List@378_42_SYMOBJECT)
   (store (mapping List@378_37_SYMOBJECT) ret_41_SYMINT true))
(and (>= 7 0)
     (< 7 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_41_SYMINT) (seq.at (element array_1_SYMARRAY) 7)))
(let ((a!1 (=> (> length_39_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_39_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_39_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(>= ret_36_SYMINT (- 2147483648))
(<= ret_36_SYMINT 2147483647)
(>= ret_38_SYMINT 0)
(<= ret_38_SYMINT 1)
(= ret_38_SYMINT 1)
(= (element List@378_37_SYMOBJECT)
   (seq.++ (element List@378_32_SYMOBJECT) (seq.unit ret_36_SYMINT)))
(= (mapping List@378_37_SYMOBJECT)
   (store (mapping List@378_32_SYMOBJECT) ret_36_SYMINT true))
(and (>= 6 0)
     (< 6 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_36_SYMINT) (seq.at (element array_1_SYMARRAY) 6)))
(let ((a!1 (=> (> length_34_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_34_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_34_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(>= ret_31_SYMINT (- 2147483648))
(<= ret_31_SYMINT 2147483647)
(>= ret_33_SYMINT 0)
(<= ret_33_SYMINT 1)
(= ret_33_SYMINT 1)
(= (element List@378_32_SYMOBJECT)
   (seq.++ (element List@378_27_SYMOBJECT) (seq.unit ret_31_SYMINT)))
(= (mapping List@378_32_SYMOBJECT)
   (store (mapping List@378_27_SYMOBJECT) ret_31_SYMINT true))
(and (>= 5 0)
     (< 5 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_31_SYMINT) (seq.at (element array_1_SYMARRAY) 5)))
(let ((a!1 (=> (> length_29_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_29_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_29_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(>= ret_26_SYMINT (- 2147483648))
(<= ret_26_SYMINT 2147483647)
(>= ret_28_SYMINT 0)
(<= ret_28_SYMINT 1)
(= ret_28_SYMINT 1)
(= (element List@378_27_SYMOBJECT)
   (seq.++ (element List@378_22_SYMOBJECT) (seq.unit ret_26_SYMINT)))
(= (mapping List@378_27_SYMOBJECT)
   (store (mapping List@378_22_SYMOBJECT) ret_26_SYMINT true))
(and (>= 4 0)
     (< 4 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_26_SYMINT) (seq.at (element array_1_SYMARRAY) 4)))
(let ((a!1 (=> (> length_24_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_24_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_24_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(>= ret_21_SYMINT (- 2147483648))
(<= ret_21_SYMINT 2147483647)
(>= ret_23_SYMINT 0)
(<= ret_23_SYMINT 1)
(= ret_23_SYMINT 1)
(= (element List@378_22_SYMOBJECT)
   (seq.++ (element List@378_17_SYMOBJECT) (seq.unit ret_21_SYMINT)))
(= (mapping List@378_22_SYMOBJECT)
   (store (mapping List@378_17_SYMOBJECT) ret_21_SYMINT true))
(and (>= 3 0)
     (< 3 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_21_SYMINT) (seq.at (element array_1_SYMARRAY) 3)))
(let ((a!1 (=> (> length_19_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_19_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_19_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(>= ret_16_SYMINT (- 2147483648))
(<= ret_16_SYMINT 2147483647)
(>= ret_18_SYMINT 0)
(<= ret_18_SYMINT 1)
(= ret_18_SYMINT 1)
(= (element List@378_17_SYMOBJECT)
   (seq.++ (element List@378_12_SYMOBJECT) (seq.unit ret_16_SYMINT)))
(= (mapping List@378_17_SYMOBJECT)
   (store (mapping List@378_12_SYMOBJECT) ret_16_SYMINT true))
(and (>= 2 0)
     (< 2 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_16_SYMINT) (seq.at (element array_1_SYMARRAY) 2)))
(let ((a!1 (=> (> length_14_SYMINT 0)
               (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_14_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_14_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(>= ret_11_SYMINT (- 2147483648))
(<= ret_11_SYMINT 2147483647)
(>= ret_13_SYMINT 0)
(<= ret_13_SYMINT 1)
(= ret_13_SYMINT 1)
(= (element List@378_12_SYMOBJECT)
   (seq.++ (element List@378_7_SYMOBJECT) (seq.unit ret_11_SYMINT)))
(= (mapping List@378_12_SYMOBJECT)
   (store (mapping List@378_7_SYMOBJECT) ret_11_SYMINT true))
(and (>= 1 0)
     (< 1 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_11_SYMINT) (seq.at (element array_1_SYMARRAY) 1)))
(let ((a!1 (=> (> length_9_SYMINT 0) (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_9_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_9_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(>= ret_6_SYMINT (- 2147483648))
(<= ret_6_SYMINT 2147483647)
(>= ret_8_SYMINT 0)
(<= ret_8_SYMINT 1)
(= ret_8_SYMINT 1)
(= (element List@378_7_SYMOBJECT)
   (seq.++ (element List@378_3_SYMOBJECT) (seq.unit ret_6_SYMINT)))
(= (mapping List@378_7_SYMOBJECT)
   (store (mapping List@378_3_SYMOBJECT) ret_6_SYMINT true))
(and (>= 0 0)
     (< 0 (seq.len (element array_1_SYMARRAY)))
     (= (seq.unit ret_6_SYMINT) (seq.at (element array_1_SYMARRAY) 0)))
(let ((a!1 (=> (> length_4_SYMINT 0) (> (s!ze (mapping array_1_SYMARRAY) 10) 0))))
  (and (= length_4_SYMINT (seq.len (element array_1_SYMARRAY)))
       (>= length_4_SYMINT (s!ze (mapping array_1_SYMARRAY) 10))
       a!1))
(let ((a!1 (forall ((x Int))
             (= (select (mapping List@378_3_SYMOBJECT) x) false))))
  (and (= (seq.len (element List@378_3_SYMOBJECT)) 0) a!1))
))
;
(declare-const retMain_80_SYMOBJECT (MyList Int))
(assert (= retMain_80_SYMOBJECT List@378_77_SYMOBJECT))
;(define-fun List@378_67_SYMOBJECT () List_Int
;  (let ((a!1 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11))
;                           (seq.++ (seq.unit (- 11)) (seq.unit (- 11)))))))
;(let ((a!2 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!1)))))
;(let ((a!3 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!2)))))
;(let ((a!4 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!3)))))
;  (List_Int (lambda ((x!1 Int)) (= x!1 (- 11))) a!4))))))
;(define-fun List@378_72_SYMOBJECT () List_Int
;  (let ((a!1 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11))
;                           (seq.++ (seq.unit (- 11)) (seq.unit (- 11)))))))
;(let ((a!2 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!1)))))
;(let ((a!3 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!2)))))
;(let ((a!4 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!3)))))
;  (List_Int (lambda ((x!1 Int)) (= x!1 (- 11))) (seq.++ (seq.unit (- 11)) a!4)))))))
;(define-fun ret_58_SYMINT () Int
;  1)
;(define-fun array_1_SYMARRAY () List_Int
;  (let ((a!1 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11))
;                           (seq.++ (seq.unit (- 11)) (seq.unit 8703))))))
;(let ((a!2 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!1)))))
;(let ((a!3 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!2)))))
;(let ((a!4 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!3)))))
;  (List_Int (lambda ((x!1 Int))
;              (or (= x!1 (- 11))
;                  (= x!1 222)
;                  (= x!1 10)
;                  (= x!1 220)
;                  (= x!1 127)
;                  (= x!1 (- 5))))
;            (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!4))))))))
;(define-fun length_59_SYMINT () Int
;  15)
;(define-fun length_34_SYMINT () Int
;  15)
;(define-fun ret_56_SYMINT () Int
;  (- 11))
;(define-fun length_14_SYMINT () Int
;  15)
;(define-fun length_64_SYMINT () Int
;  15)
;(define-fun ret_68_SYMINT () Int
;  1)
;(define-fun length_79_SYMINT () Int
;  15)
;(define-fun length_69_SYMINT () Int
;  15)
;(define-fun length_29_SYMINT () Int
;  15)
;(define-fun length_44_SYMINT () Int
;  15)
;(define-fun ret_26_SYMINT () Int
;  (- 11))
;(define-fun List@378_57_SYMOBJECT () List_Int
;  (let ((a!1 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11))
;                           (seq.++ (seq.unit (- 11)) (seq.unit (- 11)))))))
;(let ((a!2 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!1)))))
;(let ((a!3 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!2)))))
;  (List_Int (lambda ((x!1 Int)) (= x!1 (- 11))) (seq.++ (seq.unit (- 11)) a!3))))))
;(define-fun ret_48_SYMINT () Int
;  1)
;(define-fun length_74_SYMINT () Int
;  15)
;(define-fun ret_46_SYMINT () Int
;  (- 11))
;(define-fun ret_36_SYMINT () Int
;  (- 11))
;(define-fun List@378_77_SYMOBJECT () List_Int
;  (let ((a!1 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11))
;                           (seq.++ (seq.unit (- 11)) (seq.unit 8703))))))
;(let ((a!2 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!1)))))
;(let ((a!3 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!2)))))
;(let ((a!4 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!3)))))
;  (List_Int (lambda ((x!1 Int)) (or (= x!1 (- 11)) (= x!1 8703)))
;            (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!4))))))))
;(define-fun length_9_SYMINT () Int
;  15)
;(define-fun ret_31_SYMINT () Int
;  (- 11))
;(define-fun length_49_SYMINT () Int
;  15)
;(define-fun ret_41_SYMINT () Int
;  (- 11))
;(define-fun List@378_22_SYMOBJECT () List_Int
;  (let ((a!1 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11))
;                           (seq.++ (seq.unit (- 11)) (seq.unit (- 11)))))))
;  (List_Int (lambda ((x!1 Int)) (= x!1 (- 11))) a!1)))
;(define-fun ret_73_SYMINT () Int
;  1)
;(define-fun ret_11_SYMINT () Int
;  (- 11))
;(define-fun List@378_47_SYMOBJECT () List_Int
;  (let ((a!1 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11))
;                           (seq.++ (seq.unit (- 11)) (seq.unit (- 11)))))))
;(let ((a!2 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!1)))))
;  (List_Int (lambda ((x!1 Int)) (= x!1 (- 11)))
;            (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!2))))))
;(define-fun ret_78_SYMINT () Int
;  1)
;(define-fun ret_63_SYMINT () Int
;  1)
;(define-fun length_24_SYMINT () Int
;  15)
;(define-fun ret_61_SYMINT () Int
;  (- 11))
;(define-fun length_54_SYMINT () Int
;  15)
;(define-fun List@378_37_SYMOBJECT () List_Int
;  (let ((a!1 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11))
;                           (seq.++ (seq.unit (- 11)) (seq.unit (- 11)))))))
;(let ((a!2 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!1)))))
;  (List_Int (lambda ((x!1 Int)) (= x!1 (- 11))) a!2))))
;(define-fun ret_66_SYMINT () Int
;  (- 11))
;(define-fun List@378_62_SYMOBJECT () List_Int
;  (let ((a!1 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11))
;                           (seq.++ (seq.unit (- 11)) (seq.unit (- 11)))))))
;(let ((a!2 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!1)))))
;(let ((a!3 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!2)))))
;  (List_Int (lambda ((x!1 Int)) (= x!1 (- 11)))
;            (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!3)))))))
;(define-fun List@378_52_SYMOBJECT () List_Int
;  (let ((a!1 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11))
;                           (seq.++ (seq.unit (- 11)) (seq.unit (- 11)))))))
;(let ((a!2 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!1)))))
;(let ((a!3 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!2)))))
;  (List_Int (lambda ((x!1 Int)) (= x!1 (- 11))) a!3)))))
;(define-fun ret_53_SYMINT () Int
;  1)
;(define-fun ret_43_SYMINT () Int
;  1)
;(define-fun List@378_17_SYMOBJECT () List_Int
;  (List_Int (lambda ((x!1 Int)) (= x!1 (- 11)))
;          (seq.++ (seq.unit (- 11))
;                  (seq.++ (seq.unit (- 11)) (seq.unit (- 11))))))
;(define-fun ret_33_SYMINT () Int
;  1)
;(define-fun List@378_12_SYMOBJECT () List_Int
;  (List_Int (lambda ((x!1 Int)) (= x!1 (- 11)))
;          (seq.++ (seq.unit (- 11)) (seq.unit (- 11)))))
;(define-fun List@378_7_SYMOBJECT () List_Int
;  (List_Int (lambda ((x!1 Int)) (= x!1 (- 11))) (seq.unit (- 11))))
;(define-fun ret_21_SYMINT () Int
;  (- 11))
;(define-fun ret_71_SYMINT () Int
;  (- 11))
;(define-fun ret_16_SYMINT () Int
;  (- 11))
;(define-fun List@378_3_SYMOBJECT () List_Int
;  (List_Int (lambda ((x!1 Int)) false) (as seq.empty (Seq Int))))
;(define-fun List@378_32_SYMOBJECT () List_Int
;  (let ((a!1 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11))
;                           (seq.++ (seq.unit (- 11)) (seq.unit (- 11)))))))
;  (List_Int (lambda ((x!1 Int)) (= x!1 (- 11)))
;            (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!1)))))
;(define-fun length_19_SYMINT () Int
;  15)
;(define-fun ret_76_SYMINT () Int
;  8703)
;(define-fun List@378_27_SYMOBJECT () List_Int
;  (let ((a!1 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11))
;                           (seq.++ (seq.unit (- 11)) (seq.unit (- 11)))))))
;  (List_Int (lambda ((x!1 Int)) (= x!1 (- 11))) (seq.++ (seq.unit (- 11)) a!1))))
;(define-fun length_39_SYMINT () Int
;  15)
;(define-fun ret_8_SYMINT () Int
;  1)
;(define-fun length_4_SYMINT () Int
;  15)
;(define-fun ret_38_SYMINT () Int
;  1)
;(define-fun ret_23_SYMINT () Int
;  1)
;(define-fun ret_51_SYMINT () Int
;  (- 11))
;(define-fun List@378_42_SYMOBJECT () List_Int
;  (let ((a!1 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11))
;                           (seq.++ (seq.unit (- 11)) (seq.unit (- 11)))))))
;(let ((a!2 (seq.++ (seq.unit (- 11))
;                   (seq.++ (seq.unit (- 11)) (seq.++ (seq.unit (- 11)) a!1)))))
;  (List_Int (lambda ((x!1 Int)) (= x!1 (- 11))) (seq.++ (seq.unit (- 11)) a!2)))))
;(define-fun ret_6_SYMINT () Int
;  (- 11))
;(define-fun ret_13_SYMINT () Int
;  1)
;(define-fun ret_18_SYMINT () Int
;  1)
;(define-fun ret_28_SYMINT () Int
;  1)