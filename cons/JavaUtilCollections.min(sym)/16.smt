;Data Structure
(declare-datatypes (T) (
    (MySet (mk-pair (mapping (Array T Bool))))
    (MyList (mk-pair (mapping (Array T Bool)) (element (Seq T))))
    (MyIterator (mk-pair (mapping (Array T Bool)) (previous (Array T Bool))))
    (MyMyListIterator (mk-pair (position Int) (element (Seq T))))
))
(declare-datatypes (K V) (
    (MyEntry (mk-pair (key K) (value V)))
    (MyMap (mk-pair (key (Array K Bool)) (mapping (Array K V))))
))
(declare-datatypes () (
    (FileInputStream (mk-pair (length Int) (readPosition Int) (isOpen Bool)))
))
(declare-fun ret@Iterator_45_SYMOBJECT () (MyIterator Int))
(declare-fun ret@Iterator_33_SYMOBJECT () (MyIterator Int))
(declare-fun ret@Iterator_2_SYMOBJECT () (MyIterator Int))
(declare-fun ret@Iterator_9_SYMOBJECT () (MyIterator Int))
(declare-fun ret@Iterator_3_SYMOBJECT () (MyIterator Int))
(declare-fun ret@Iterator_6_SYMOBJECT () (MyIterator Int))
(declare-fun coll_1_SYMOBJECT () (MySet Int))
(declare-fun ret_4_SYMINT () Int)
(declare-fun ret_5_SYMINT () Int)
(declare-fun ret_7_SYMINT () Int)
(declare-fun ret_32_SYMINT () Int)
(declare-fun ret_8_SYMINT () Int)
(declare-fun ret_34_SYMINT () Int)
(declare-fun ret_10_SYMINT () Int)
(declare-fun ret_44_SYMINT () Int)
(declare-fun ret_46_SYMINT () Int)
(declare-fun ret_50_SYMINT () Int)
(assert (and 
(>= ret_50_SYMINT 0)
(<= ret_50_SYMINT 1)
(= 0 ret_50_SYMINT)
(>= ret_46_SYMINT (- 2147483648))
(<= ret_46_SYMINT 2147483647)
(>= ret_34_SYMINT (- 2147483648))
(<= ret_34_SYMINT 2147483647)
(< ret_46_SYMINT ret_34_SYMINT)
(<= ret_46_SYMINT ret_34_SYMINT)
(>= ret_44_SYMINT 0)
(<= ret_44_SYMINT 1)
(not (= 0 ret_44_SYMINT))
(>= ret_10_SYMINT (- 2147483648))
(<= ret_10_SYMINT 2147483647)
(< ret_34_SYMINT ret_10_SYMINT)
(<= ret_34_SYMINT ret_10_SYMINT)
(>= ret_32_SYMINT 0)
(<= ret_32_SYMINT 1)
(not (= 0 ret_32_SYMINT))
(>= ret_4_SYMINT (- 2147483648))
(<= ret_4_SYMINT 2147483647)
(< ret_10_SYMINT ret_4_SYMINT)
(<= ret_10_SYMINT ret_4_SYMINT)
(>= ret_8_SYMINT 0)
(<= ret_8_SYMINT 1)
(not (= 0 ret_8_SYMINT))
(>= ret_7_SYMINT (- 2147483648))
(<= ret_7_SYMINT 2147483647)
(> ret_7_SYMINT ret_4_SYMINT)
(>= ret_5_SYMINT 0)
(<= ret_5_SYMINT 1)
(not (= 0 ret_5_SYMINT))
(let ((a!1 (exists ((x Int))
             (and (= true (select (mapping ret@Iterator_45_SYMOBJECT) x))
                  (= false (select (previous ret@Iterator_45_SYMOBJECT) x))))))
  (= ret_50_SYMINT (ite a!1 1 0)))
(and (= true (select (mapping ret@Iterator_33_SYMOBJECT) ret_46_SYMINT))
     (= false (select (previous ret@Iterator_33_SYMOBJECT) ret_46_SYMINT))
     (= (mapping ret@Iterator_45_SYMOBJECT) (mapping ret@Iterator_33_SYMOBJECT))
     (= (previous ret@Iterator_45_SYMOBJECT)
        (store (previous ret@Iterator_33_SYMOBJECT) ret_46_SYMINT true)))
(let ((a!1 (exists ((x Int))
             (and (= true (select (mapping ret@Iterator_33_SYMOBJECT) x))
                  (= false (select (previous ret@Iterator_33_SYMOBJECT) x))))))
  (= ret_44_SYMINT (ite a!1 1 0)))
(and (= true (select (mapping ret@Iterator_9_SYMOBJECT) ret_34_SYMINT))
     (= false (select (previous ret@Iterator_9_SYMOBJECT) ret_34_SYMINT))
     (= (mapping ret@Iterator_33_SYMOBJECT) (mapping ret@Iterator_9_SYMOBJECT))
     (= (previous ret@Iterator_33_SYMOBJECT)
        (store (previous ret@Iterator_9_SYMOBJECT) ret_34_SYMINT true)))
(let ((a!1 (exists ((x Int))
             (and (= true (select (mapping ret@Iterator_9_SYMOBJECT) x))
                  (= false (select (previous ret@Iterator_9_SYMOBJECT) x))))))
  (= ret_32_SYMINT (ite a!1 1 0)))
(and (= true (select (mapping ret@Iterator_6_SYMOBJECT) ret_10_SYMINT))
     (= false (select (previous ret@Iterator_6_SYMOBJECT) ret_10_SYMINT))
     (= (mapping ret@Iterator_9_SYMOBJECT) (mapping ret@Iterator_6_SYMOBJECT))
     (= (previous ret@Iterator_9_SYMOBJECT)
        (store (previous ret@Iterator_6_SYMOBJECT) ret_10_SYMINT true)))
(let ((a!1 (exists ((x Int))
             (and (= true (select (mapping ret@Iterator_6_SYMOBJECT) x))
                  (= false (select (previous ret@Iterator_6_SYMOBJECT) x))))))
  (= ret_8_SYMINT (ite a!1 1 0)))
(and (= true (select (mapping ret@Iterator_3_SYMOBJECT) ret_7_SYMINT))
     (= false (select (previous ret@Iterator_3_SYMOBJECT) ret_7_SYMINT))
     (= (mapping ret@Iterator_6_SYMOBJECT) (mapping ret@Iterator_3_SYMOBJECT))
     (= (previous ret@Iterator_6_SYMOBJECT)
        (store (previous ret@Iterator_3_SYMOBJECT) ret_7_SYMINT true)))
(let ((a!1 (exists ((x Int))
             (and (= true (select (mapping ret@Iterator_3_SYMOBJECT) x))
                  (= false (select (previous ret@Iterator_3_SYMOBJECT) x))))))
  (= ret_5_SYMINT (ite a!1 1 0)))
(and (= true (select (mapping ret@Iterator_2_SYMOBJECT) ret_4_SYMINT))
     (= false (select (previous ret@Iterator_2_SYMOBJECT) ret_4_SYMINT))
     (= (mapping ret@Iterator_3_SYMOBJECT) (mapping ret@Iterator_2_SYMOBJECT))
     (= (previous ret@Iterator_3_SYMOBJECT)
        (store (previous ret@Iterator_2_SYMOBJECT) ret_4_SYMINT true)))
(let ((a!1 (forall ((x Int))
             (= (select (previous ret@Iterator_2_SYMOBJECT) x) false))))
  (and (= (mapping ret@Iterator_2_SYMOBJECT) (mapping coll_1_SYMOBJECT)) a!1))
))
;