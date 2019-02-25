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
(declare-fun arr_5_SYMARRAY () (MyList Int))
(declare-fun arr_1_SYMARRAY () (MyList Int))
(declare-fun index_2_SYMINT () Int)
(declare-fun val_3_SYMINT () Int)
(declare-fun ret_4_SYMINT () Int)
(assert (and 
(>= index_2_SYMINT (- 2147483648))
(<= index_2_SYMINT 2147483647)
(>= val_3_SYMINT (- 2147483648))
(<= val_3_SYMINT 2147483647)
(>= ret_4_SYMINT (- 2147483648))
(<= ret_4_SYMINT 2147483647)
(let ((a!1 (- (- (seq.len (element arr_1_SYMARRAY)) index_2_SYMINT) 1)))
(let ((a!2 (seq.++ (seq.extract (element arr_1_SYMARRAY) 0 index_2_SYMINT)
                   (seq.++ (seq.unit val_3_SYMINT)
                           (seq.extract (element arr_1_SYMARRAY)
                                        (+ index_2_SYMINT 1)
                                        a!1)))))
  (and (>= index_2_SYMINT 0)
       (< index_2_SYMINT (seq.len (element arr_1_SYMARRAY)))
       (= (seq.unit ret_4_SYMINT)
          (seq.at (element arr_1_SYMARRAY) index_2_SYMINT))
       (= (element arr_5_SYMARRAY) a!2))))
))
;
(declare-const retMain_6_SYMOBJECT (MyList Int))
(assert (= retMain_6_SYMOBJECT arr_5_SYMARRAY))
;(define-fun arr_1_SYMARRAY () List_Int
;  (List_Int (lambda ((x!1 Int)) false) (seq.unit (- 2147483610))))
;(define-fun arr_5_SYMARRAY () List_Int
;  (List_Int (lambda ((x!1 Int)) true) (seq.unit (- 2147483610))))
;(define-fun index_2_SYMINT () Int
;  0)
;(define-fun val_3_SYMINT () Int
;  (- 2147483610))
;(define-fun ret_4_SYMINT () Int
;  (- 2147483610))
;;Param:arr_1_SYMARRAY
;Param:val_3_SYMINT
;Param:index_2_SYMINT
;Locals:arr_5_SYMARRAY
;Locals:val_3_SYMINT
;Locals:index_2_SYMINT
;Return:retMain_6_SYMOBJECT
