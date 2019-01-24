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
(declare-fun ret@Iterator_54_SYMOBJECT () (MyIterator Int))
(declare-fun ret@Iterator_90_SYMOBJECT () (MyIterator Int))
(declare-fun ret@Iterator_2_SYMOBJECT () (MyIterator Int))
(declare-fun ret@Iterator_3_SYMOBJECT () (MyIterator Int))
(declare-fun ret@Iterator_78_SYMOBJECT () (MyIterator Int))
(declare-fun ret@Iterator_6_SYMOBJECT () (MyIterator Int))
(declare-fun coll_1_SYMOBJECT () (MySet Int))
(declare-fun ret_4_SYMINT () Int)
(declare-fun ret_77_SYMINT () Int)
(declare-fun ret_53_SYMINT () Int)
(declare-fun ret_5_SYMINT () Int)
(declare-fun ret_79_SYMINT () Int)
(declare-fun ret_55_SYMINT () Int)
(declare-fun ret_7_SYMINT () Int)
(declare-fun ret_89_SYMINT () Int)
(declare-fun ret_91_SYMINT () Int)
(declare-fun ret_95_SYMINT () Int)
(assert (and 
(>= ret_95_SYMINT 0)
(<= ret_95_SYMINT 1)
(= 0 ret_95_SYMINT)
(>= ret_91_SYMINT (- 2147483648))
(<= ret_91_SYMINT 2147483647)
(>= ret_79_SYMINT (- 2147483648))
(<= ret_79_SYMINT 2147483647)
(< ret_91_SYMINT ret_79_SYMINT)
(<= ret_91_SYMINT ret_79_SYMINT)
(>= ret_89_SYMINT 0)
(<= ret_89_SYMINT 1)
(not (= 0 ret_89_SYMINT))
(>= ret_55_SYMINT (- 2147483648))
(<= ret_55_SYMINT 2147483647)
(< ret_79_SYMINT ret_55_SYMINT)
(<= ret_79_SYMINT ret_55_SYMINT)
(>= ret_77_SYMINT 0)
(<= ret_77_SYMINT 1)
(not (= 0 ret_77_SYMINT))
(>= ret_7_SYMINT (- 2147483648))
(<= ret_7_SYMINT 2147483647)
(< ret_55_SYMINT ret_7_SYMINT)
(<= ret_55_SYMINT ret_7_SYMINT)
(>= ret_53_SYMINT 0)
(<= ret_53_SYMINT 1)
(not (= 0 ret_53_SYMINT))
(>= ret_4_SYMINT (- 2147483648))
(<= ret_4_SYMINT 2147483647)
(< ret_7_SYMINT ret_4_SYMINT)
(<= ret_7_SYMINT ret_4_SYMINT)
(>= ret_5_SYMINT 0)
(<= ret_5_SYMINT 1)
(not (= 0 ret_5_SYMINT))
(let ((a!1 (exists ((x Int))
             (and (= true (select (mapping ret@Iterator_90_SYMOBJECT) x))
                  (= false (select (previous ret@Iterator_90_SYMOBJECT) x))))))
  (= ret_95_SYMINT (ite a!1 1 0)))
(and (= true (select (mapping ret@Iterator_78_SYMOBJECT) ret_91_SYMINT))
     (= false (select (previous ret@Iterator_78_SYMOBJECT) ret_91_SYMINT))
     (= (mapping ret@Iterator_90_SYMOBJECT) (mapping ret@Iterator_78_SYMOBJECT))
     (= (previous ret@Iterator_90_SYMOBJECT)
        (store (previous ret@Iterator_78_SYMOBJECT) ret_91_SYMINT true)))
(let ((a!1 (exists ((x Int))
             (and (= true (select (mapping ret@Iterator_78_SYMOBJECT) x))
                  (= false (select (previous ret@Iterator_78_SYMOBJECT) x))))))
  (= ret_89_SYMINT (ite a!1 1 0)))
(and (= true (select (mapping ret@Iterator_54_SYMOBJECT) ret_79_SYMINT))
     (= false (select (previous ret@Iterator_54_SYMOBJECT) ret_79_SYMINT))
     (= (mapping ret@Iterator_78_SYMOBJECT) (mapping ret@Iterator_54_SYMOBJECT))
     (= (previous ret@Iterator_78_SYMOBJECT)
        (store (previous ret@Iterator_54_SYMOBJECT) ret_79_SYMINT true)))
(let ((a!1 (exists ((x Int))
             (and (= true (select (mapping ret@Iterator_54_SYMOBJECT) x))
                  (= false (select (previous ret@Iterator_54_SYMOBJECT) x))))))
  (= ret_77_SYMINT (ite a!1 1 0)))
(and (= true (select (mapping ret@Iterator_6_SYMOBJECT) ret_55_SYMINT))
     (= false (select (previous ret@Iterator_6_SYMOBJECT) ret_55_SYMINT))
     (= (mapping ret@Iterator_54_SYMOBJECT) (mapping ret@Iterator_6_SYMOBJECT))
     (= (previous ret@Iterator_54_SYMOBJECT)
        (store (previous ret@Iterator_6_SYMOBJECT) ret_55_SYMINT true)))
(let ((a!1 (exists ((x Int))
             (and (= true (select (mapping ret@Iterator_6_SYMOBJECT) x))
                  (= false (select (previous ret@Iterator_6_SYMOBJECT) x))))))
  (= ret_53_SYMINT (ite a!1 1 0)))
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