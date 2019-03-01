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
(declare-fun m_2_SYMINT () Int)
(declare-fun n_4_SYMINT () Int)
(assert (and 
(>= n_4_SYMINT (- 2147483648))
(<= n_4_SYMINT 2147483647)
(<= n_4_SYMINT 0)
(>= m_2_SYMINT (- 2147483648))
(<= m_2_SYMINT 2147483647)
(> m_2_SYMINT 0)
))
;
(declare-const retMain_5_SYMOBJECT (MyList Int))
(assert (= retMain_5_SYMOBJECT Array@1803_3_SYMOBJECT))
;(define-fun m_2_SYMINT () Int
;  1)
;(define-fun n_4_SYMINT () Int
;  0)
;;Param:A_1_SYMARRAY
;Param:B_3_SYMARRAY
;Param:m_2_SYMINT
;Param:n_4_SYMINT
;Locals:A_1_SYMARRAY
;Locals:B_3_SYMARRAY
;Locals:m_2_SYMINT
;Locals:n_4_SYMINT
