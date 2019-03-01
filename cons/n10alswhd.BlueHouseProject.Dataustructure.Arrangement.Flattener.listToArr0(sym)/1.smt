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
(define-fun CcastI ((c String)) (Int) 
(ite (= c "}") 125 (ite (= c "|") 124 (ite (= c "{") 123 (ite (= c "z") 122 (ite (= c "y") 121 (ite (= c "x") 120 (ite (= c "w") 119 (ite (= c "v") 118 (ite (= c "u") 117 (ite (= c "t") 116 (ite (= c "s") 115 (ite (= c "r") 114 (ite (= c "q") 113 (ite (= c "p") 112 (ite (= c "o") 111 (ite (= c "n") 110 (ite (= c "m") 109 (ite (= c "l") 108 (ite (= c "k") 107 (ite (= c "j") 106 (ite (= c "i") 105 (ite (= c "h") 104 (ite (= c "g") 103 (ite (= c "f") 102 (ite (= c "e") 101 (ite (= c "d") 100 (ite (= c "c") 99 (ite (= c "b") 98 (ite (= c "a") 97 (ite (= c "`") 96 (ite (= c "_") 95 (ite (= c "^") 94 (ite (= c "]") 93 (ite (= c "\") 92 (ite (= c "[") 91 (ite (= c "Z") 90 (ite (= c "Y") 89 (ite (= c "X") 88 (ite (= c "W") 87 (ite (= c "V") 86 (ite (= c "U") 85 (ite (= c "T") 84 (ite (= c "S") 83 (ite (= c "R") 82 (ite (= c "Q") 81 (ite (= c "P") 80 (ite (= c "O") 79 (ite (= c "N") 78 (ite (= c "M") 77 (ite (= c "L") 76 (ite (= c "K") 75 (ite (= c "J") 74 (ite (= c "I") 73 (ite (= c "H") 72 (ite (= c "G") 71 (ite (= c "F") 70 (ite (= c "E") 69 (ite (= c "D") 68 (ite (= c "C") 67 (ite (= c "B") 66 (ite (= c "A") 65 (ite (= c "@") 64 (ite (= c "?") 63 (ite (= c ">") 62 (ite (= c "=") 61 (ite (= c "<") 60 (ite (= c ";") 59 (ite (= c ":") 58 (ite (= c "9") 57 (ite (= c "8") 56 (ite (= c "7") 55 (ite (= c "6") 54 (ite (= c "5") 53 (ite (= c "4") 52 (ite (= c "3") 51 (ite (= c "2") 50 (ite (= c "1") 49 (ite (= c "0") 48 (ite (= c "/") 47 (ite (= c ".") 46 (ite (= c "-") 45 (ite (= c ",") 44 (ite (= c "+") 43 (ite (= c "*") 42 (ite (= c ")") 41 (ite (= c "(") 40 (ite (= c "'") 39 (ite (= c "&") 38 (ite (= c "%") 37 (ite (= c "$") 36 (ite (= c "#") 35 (ite (= c """") 34 (ite (= c "!") 33 (ite (= c " ") 32 126)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(define-fun IcastC ((n Int)) (String) 
(ite (= n 125) "}" (ite (= n 124) "|" (ite (= n 123) "{" (ite (= n 122) "z" (ite (= n 121) "y" (ite (= n 120) "x" (ite (= n 119) "w" (ite (= n 118) "v" (ite (= n 117) "u" (ite (= n 116) "t" (ite (= n 115) "s" (ite (= n 114) "r" (ite (= n 113) "q" (ite (= n 112) "p" (ite (= n 111) "o" (ite (= n 110) "n" (ite (= n 109) "m" (ite (= n 108) "l" (ite (= n 107) "k" (ite (= n 106) "j" (ite (= n 105) "i" (ite (= n 104) "h" (ite (= n 103) "g" (ite (= n 102) "f" (ite (= n 101) "e" (ite (= n 100) "d" (ite (= n 99) "c" (ite (= n 98) "b" (ite (= n 97) "a" (ite (= n 96) "`" (ite (= n 95) "_" (ite (= n 94) "^" (ite (= n 93) "]" (ite (= n 92) "\" (ite (= n 91) "[" (ite (= n 90) "Z" (ite (= n 89) "Y" (ite (= n 88) "X" (ite (= n 87) "W" (ite (= n 86) "V" (ite (= n 85) "U" (ite (= n 84) "T" (ite (= n 83) "S" (ite (= n 82) "R" (ite (= n 81) "Q" (ite (= n 80) "P" (ite (= n 79) "O" (ite (= n 78) "N" (ite (= n 77) "M" (ite (= n 76) "L" (ite (= n 75) "K" (ite (= n 74) "J" (ite (= n 73) "I" (ite (= n 72) "H" (ite (= n 71) "G" (ite (= n 70) "F" (ite (= n 69) "E" (ite (= n 68) "D" (ite (= n 67) "C" (ite (= n 66) "B" (ite (= n 65) "A" (ite (= n 64) "@" (ite (= n 63) "?" (ite (= n 62) ">" (ite (= n 61) "=" (ite (= n 60) "<" (ite (= n 59) ";" (ite (= n 58) ":" (ite (= n 57) "9" (ite (= n 56) "8" (ite (= n 55) "7" (ite (= n 54) "6" (ite (= n 53) "5" (ite (= n 52) "4" (ite (= n 51) "3" (ite (= n 50) "2" (ite (= n 49) "1" (ite (= n 48) "0" (ite (= n 47) "/" (ite (= n 46) "." (ite (= n 45) "-" (ite (= n 44) "," (ite (= n 43) "+" (ite (= n 42) "*" (ite (= n 41) ")" (ite (= n 40) "(" (ite (= n 39) "'" (ite (= n 38) "&" (ite (= n 37) "%" (ite (= n 36) "$" (ite (= n 35) "#" (ite (= n 34) """" (ite (= n 33) "!" (ite (= n 32) " " "~")))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(declare-fun list_1_SYMOBJECT () (MyList Int))
(declare-fun ret@Array_4_SYMARRAY () (MyList Int))
(declare-fun Array@1803_3_SYMOBJECT () (MyList Int))
(declare-fun ret_2_SYMINT () Int)
(assert (and 
(and (= (element ret@Array_4_SYMARRAY) (element list_1_SYMOBJECT))
     (= (mapping ret@Array_4_SYMARRAY) (mapping list_1_SYMOBJECT)))
(let ((a!1 (forall ((x Int))
             (= (select (mapping Array@1803_3_SYMOBJECT) x) false))))
  (and (= (seq.len (element Array@1803_3_SYMOBJECT)) 20) a!1))
(>= ret_2_SYMINT (- 2147483648))
(<= ret_2_SYMINT 2147483647)
(let ((a!1 (=> (> ret_2_SYMINT 0) (> (s!ze (mapping list_1_SYMOBJECT) 10) 0))))
  (and (= ret_2_SYMINT (seq.len (element list_1_SYMOBJECT)))
       (>= ret_2_SYMINT (s!ze (mapping list_1_SYMOBJECT) 10))
       a!1))
))
;
(declare-const retMain_5_SYMOBJECT (MyList Int))
(assert (= retMain_5_SYMOBJECT Array@1803_3_SYMOBJECT))
;(define-fun ret@Array_4_SYMARRAY () List_Int
;  (let ((a!1 (seq.++ (seq.unit 80)
;                   (seq.++ (seq.unit 82) (seq.++ (seq.unit 84) (seq.unit 86))))))
;(let ((a!2 (seq.++ (seq.unit 74)
;                   (seq.++ (seq.unit 76) (seq.++ (seq.unit 78) a!1)))))
;(let ((a!3 (seq.++ (seq.unit 68)
;                   (seq.++ (seq.unit 70) (seq.++ (seq.unit 72) a!2)))))
;  (List_Int (_ as-array k!2) (seq.++ (seq.unit 64) (seq.++ (seq.unit 67) a!3)))))))
;(define-fun Array@1803_3_SYMOBJECT () List_Int
;  (let ((a!1 (seq.++ (seq.unit 59)
;                   (seq.++ (seq.unit 60) (seq.++ (seq.unit 61) (seq.unit 62))))))
;(let ((a!2 (seq.++ (seq.unit 56)
;                   (seq.++ (seq.unit 57) (seq.++ (seq.unit 58) a!1)))))
;(let ((a!3 (seq.++ (seq.unit 53)
;                   (seq.++ (seq.unit 54) (seq.++ (seq.unit 55) a!2)))))
;(let ((a!4 (seq.++ (seq.unit 50)
;                   (seq.++ (seq.unit 51) (seq.++ (seq.unit 52) a!3)))))
;(let ((a!5 (seq.++ (seq.unit 47)
;                   (seq.++ (seq.unit 48) (seq.++ (seq.unit 49) a!4)))))
;(let ((a!6 (seq.++ (seq.unit 44)
;                   (seq.++ (seq.unit 45) (seq.++ (seq.unit 46) a!5)))))
;  (List_Int (lambda ((x!1 Int)) false) (seq.++ (seq.unit 43) a!6)))))))))
;(define-fun list_1_SYMOBJECT () List_Int
;  (let ((a!1 (seq.++ (seq.unit 80)
;                   (seq.++ (seq.unit 82) (seq.++ (seq.unit 84) (seq.unit 86))))))
;(let ((a!2 (seq.++ (seq.unit 74)
;                   (seq.++ (seq.unit 76) (seq.++ (seq.unit 78) a!1)))))
;(let ((a!3 (seq.++ (seq.unit 68)
;                   (seq.++ (seq.unit 70) (seq.++ (seq.unit 72) a!2)))))
;  (List_Int (_ as-array k!2) (seq.++ (seq.unit 64) (seq.++ (seq.unit 67) a!3)))))))
;(define-fun ret_2_SYMINT () Int
;  12)
;(define-fun k!2 ((x!0 Int)) Bool
;  (ite (= x!0 5) false
;  (ite (= x!0 3) false
;  (ite (= x!0 (- 5)) false
;  (ite (= x!0 (- 11)) false
;  (ite (= x!0 (- 1)) false
;  (ite (= x!0 9) false
;  (ite (= x!0 (- 3)) false
;  (ite (= x!0 0) false
;  (ite (= x!0 (- 4)) false
;  (ite (= x!0 (- 6)) false
;    true)))))))))))
;;Param:list_1_SYMOBJECT
;Locals:list_1_SYMOBJECT
;Return:retMain_5_SYMOBJECT
