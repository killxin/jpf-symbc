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
(declare-fun ret_106_SYMINT () Int)
(declare-fun ret_108_SYMINT () Int)
(declare-fun ret_110_SYMINT () Int)
(declare-fun ret_112_SYMINT () Int)
(declare-fun ret_114_SYMINT () Int)
(declare-fun ret_116_SYMINT () Int)
(declare-fun ret_118_SYMINT () Int)
(declare-fun ret_120_SYMINT () Int)
(declare-fun ret_122_SYMINT () Int)
(declare-fun ret_124_SYMINT () Int)
(declare-fun ret_126_SYMINT () Int)
(declare-fun ret_128_SYMINT () Int)
(declare-fun ret_130_SYMINT () Int)
(declare-fun ret_132_SYMINT () Int)
(declare-fun ret_134_SYMINT () Int)
(declare-fun ret_136_SYMINT () Int)
(declare-fun ret_138_SYMINT () Int)
(declare-fun ret_140_SYMINT () Int)
(declare-fun ret_142_SYMINT () Int)
(declare-fun ret_144_SYMINT () Int)
(declare-fun ret_146_SYMINT () Int)
(declare-fun ret_148_SYMINT () Int)
(declare-fun ret_150_SYMINT () Int)
(declare-fun ret_152_SYMINT () Int)
(declare-fun ret_154_SYMINT () Int)
(declare-fun ret_156_SYMINT () Int)
(declare-fun ret_158_SYMINT () Int)
(assert (and 
(>= length_2_SYMINT (- 2147483648))
(<= length_2_SYMINT 2147483647)
(> 78 (- length_2_SYMINT 1))
(<= 77 (- length_2_SYMINT 1))
(<= 76 (- length_2_SYMINT 1))
(<= 75 (- length_2_SYMINT 1))
(<= 74 (- length_2_SYMINT 1))
(<= 73 (- length_2_SYMINT 1))
(<= 72 (- length_2_SYMINT 1))
(<= 71 (- length_2_SYMINT 1))
(<= 70 (- length_2_SYMINT 1))
(<= 69 (- length_2_SYMINT 1))
(<= 68 (- length_2_SYMINT 1))
(<= 67 (- length_2_SYMINT 1))
(<= 66 (- length_2_SYMINT 1))
(<= 65 (- length_2_SYMINT 1))
(<= 64 (- length_2_SYMINT 1))
(<= 63 (- length_2_SYMINT 1))
(<= 62 (- length_2_SYMINT 1))
(<= 61 (- length_2_SYMINT 1))
(<= 60 (- length_2_SYMINT 1))
(<= 59 (- length_2_SYMINT 1))
(<= 58 (- length_2_SYMINT 1))
(<= 57 (- length_2_SYMINT 1))
(<= 56 (- length_2_SYMINT 1))
(<= 55 (- length_2_SYMINT 1))
(<= 54 (- length_2_SYMINT 1))
(<= 53 (- length_2_SYMINT 1))
(<= 52 (- length_2_SYMINT 1))
(<= 51 (- length_2_SYMINT 1))
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
(>= ret_158_SYMINT (- 2147483648))
(<= ret_158_SYMINT 2147483647)
(and (>= 77 0)
     (< 77 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_158_SYMINT) (seq.at (element numbers_1_SYMARRAY) 77)))
(>= ret_156_SYMINT (- 2147483648))
(<= ret_156_SYMINT 2147483647)
(and (>= 76 0)
     (< 76 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_156_SYMINT) (seq.at (element numbers_1_SYMARRAY) 76)))
(>= ret_154_SYMINT (- 2147483648))
(<= ret_154_SYMINT 2147483647)
(and (>= 75 0)
     (< 75 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_154_SYMINT) (seq.at (element numbers_1_SYMARRAY) 75)))
(>= ret_152_SYMINT (- 2147483648))
(<= ret_152_SYMINT 2147483647)
(and (>= 74 0)
     (< 74 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_152_SYMINT) (seq.at (element numbers_1_SYMARRAY) 74)))
(>= ret_150_SYMINT (- 2147483648))
(<= ret_150_SYMINT 2147483647)
(and (>= 73 0)
     (< 73 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_150_SYMINT) (seq.at (element numbers_1_SYMARRAY) 73)))
(>= ret_148_SYMINT (- 2147483648))
(<= ret_148_SYMINT 2147483647)
(and (>= 72 0)
     (< 72 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_148_SYMINT) (seq.at (element numbers_1_SYMARRAY) 72)))
(>= ret_146_SYMINT (- 2147483648))
(<= ret_146_SYMINT 2147483647)
(and (>= 71 0)
     (< 71 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_146_SYMINT) (seq.at (element numbers_1_SYMARRAY) 71)))
(>= ret_144_SYMINT (- 2147483648))
(<= ret_144_SYMINT 2147483647)
(and (>= 70 0)
     (< 70 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_144_SYMINT) (seq.at (element numbers_1_SYMARRAY) 70)))
(>= ret_142_SYMINT (- 2147483648))
(<= ret_142_SYMINT 2147483647)
(and (>= 69 0)
     (< 69 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_142_SYMINT) (seq.at (element numbers_1_SYMARRAY) 69)))
(>= ret_140_SYMINT (- 2147483648))
(<= ret_140_SYMINT 2147483647)
(and (>= 68 0)
     (< 68 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_140_SYMINT) (seq.at (element numbers_1_SYMARRAY) 68)))
(>= ret_138_SYMINT (- 2147483648))
(<= ret_138_SYMINT 2147483647)
(and (>= 67 0)
     (< 67 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_138_SYMINT) (seq.at (element numbers_1_SYMARRAY) 67)))
(>= ret_136_SYMINT (- 2147483648))
(<= ret_136_SYMINT 2147483647)
(and (>= 66 0)
     (< 66 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_136_SYMINT) (seq.at (element numbers_1_SYMARRAY) 66)))
(>= ret_134_SYMINT (- 2147483648))
(<= ret_134_SYMINT 2147483647)
(and (>= 65 0)
     (< 65 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_134_SYMINT) (seq.at (element numbers_1_SYMARRAY) 65)))
(>= ret_132_SYMINT (- 2147483648))
(<= ret_132_SYMINT 2147483647)
(and (>= 64 0)
     (< 64 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_132_SYMINT) (seq.at (element numbers_1_SYMARRAY) 64)))
(>= ret_130_SYMINT (- 2147483648))
(<= ret_130_SYMINT 2147483647)
(and (>= 63 0)
     (< 63 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_130_SYMINT) (seq.at (element numbers_1_SYMARRAY) 63)))
(>= ret_128_SYMINT (- 2147483648))
(<= ret_128_SYMINT 2147483647)
(and (>= 62 0)
     (< 62 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_128_SYMINT) (seq.at (element numbers_1_SYMARRAY) 62)))
(>= ret_126_SYMINT (- 2147483648))
(<= ret_126_SYMINT 2147483647)
(and (>= 61 0)
     (< 61 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_126_SYMINT) (seq.at (element numbers_1_SYMARRAY) 61)))
(>= ret_124_SYMINT (- 2147483648))
(<= ret_124_SYMINT 2147483647)
(and (>= 60 0)
     (< 60 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_124_SYMINT) (seq.at (element numbers_1_SYMARRAY) 60)))
(>= ret_122_SYMINT (- 2147483648))
(<= ret_122_SYMINT 2147483647)
(and (>= 59 0)
     (< 59 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_122_SYMINT) (seq.at (element numbers_1_SYMARRAY) 59)))
(>= ret_120_SYMINT (- 2147483648))
(<= ret_120_SYMINT 2147483647)
(and (>= 58 0)
     (< 58 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_120_SYMINT) (seq.at (element numbers_1_SYMARRAY) 58)))
(>= ret_118_SYMINT (- 2147483648))
(<= ret_118_SYMINT 2147483647)
(and (>= 57 0)
     (< 57 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_118_SYMINT) (seq.at (element numbers_1_SYMARRAY) 57)))
(>= ret_116_SYMINT (- 2147483648))
(<= ret_116_SYMINT 2147483647)
(and (>= 56 0)
     (< 56 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_116_SYMINT) (seq.at (element numbers_1_SYMARRAY) 56)))
(>= ret_114_SYMINT (- 2147483648))
(<= ret_114_SYMINT 2147483647)
(and (>= 55 0)
     (< 55 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_114_SYMINT) (seq.at (element numbers_1_SYMARRAY) 55)))
(>= ret_112_SYMINT (- 2147483648))
(<= ret_112_SYMINT 2147483647)
(and (>= 54 0)
     (< 54 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_112_SYMINT) (seq.at (element numbers_1_SYMARRAY) 54)))
(>= ret_110_SYMINT (- 2147483648))
(<= ret_110_SYMINT 2147483647)
(and (>= 53 0)
     (< 53 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_110_SYMINT) (seq.at (element numbers_1_SYMARRAY) 53)))
(>= ret_108_SYMINT (- 2147483648))
(<= ret_108_SYMINT 2147483647)
(and (>= 52 0)
     (< 52 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_108_SYMINT) (seq.at (element numbers_1_SYMARRAY) 52)))
(>= ret_106_SYMINT (- 2147483648))
(<= ret_106_SYMINT 2147483647)
(and (>= 51 0)
     (< 51 (seq.len (element numbers_1_SYMARRAY)))
     (= (seq.unit ret_106_SYMINT) (seq.at (element numbers_1_SYMARRAY) 51)))
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
(declare-const retMain_159_SYMINT Int)
(assert (= retMain_159_SYMINT ( +  ret_158_SYMINT ( +  ret_156_SYMINT ( +  ret_154_SYMINT ( +  ret_152_SYMINT ( +  ret_150_SYMINT ( +  ret_148_SYMINT ( +  ret_146_SYMINT ( +  ret_144_SYMINT ( +  ret_142_SYMINT ( +  ret_140_SYMINT ( +  ret_138_SYMINT ( +  ret_136_SYMINT ( +  ret_134_SYMINT ( +  ret_132_SYMINT ( +  ret_130_SYMINT ( +  ret_128_SYMINT ( +  ret_126_SYMINT ( +  ret_124_SYMINT ( +  ret_122_SYMINT ( +  ret_120_SYMINT ( +  ret_118_SYMINT ( +  ret_116_SYMINT ( +  ret_114_SYMINT ( +  ret_112_SYMINT ( +  ret_110_SYMINT ( +  ret_108_SYMINT ( +  ret_106_SYMINT ( +  ret_104_SYMINT ( +  ret_102_SYMINT ( +  ret_100_SYMINT ( +  ret_98_SYMINT ( +  ret_96_SYMINT ( +  ret_94_SYMINT ( +  ret_92_SYMINT ( +  ret_90_SYMINT ( +  ret_88_SYMINT ( +  ret_86_SYMINT ( +  ret_84_SYMINT ( +  ret_82_SYMINT ( +  ret_80_SYMINT ( +  ret_78_SYMINT ( +  ret_76_SYMINT ( +  ret_74_SYMINT ( +  ret_72_SYMINT ( +  ret_70_SYMINT ( +  ret_68_SYMINT ( +  ret_66_SYMINT ( +  ret_64_SYMINT ( +  ret_62_SYMINT ( +  ret_60_SYMINT ( +  ret_58_SYMINT ( +  ret_56_SYMINT ( +  ret_54_SYMINT ( +  ret_52_SYMINT ( +  ret_50_SYMINT ( +  ret_48_SYMINT ( +  ret_46_SYMINT ( +  ret_44_SYMINT ( +  ret_42_SYMINT ( +  ret_40_SYMINT ( +  ret_38_SYMINT ( +  ret_36_SYMINT ( +  ret_34_SYMINT ( +  ret_32_SYMINT ( +  ret_30_SYMINT ( +  ret_28_SYMINT ( +  ret_26_SYMINT ( +  ret_24_SYMINT ( +  ret_22_SYMINT ( +  ret_20_SYMINT ( +  ret_18_SYMINT ( +  ret_16_SYMINT ( +  ret_14_SYMINT ( +  ret_12_SYMINT ( +  ret_10_SYMINT ( +  ret_8_SYMINT ( +  ret_6_SYMINT ret_4_SYMINT)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
;(define-fun ret_18_SYMINT () Int
;  (- 2147478468))
;(define-fun ret_136_SYMINT () Int
;  (- 2147477238))
;(define-fun length_2_SYMINT () Int
;  78)
;(define-fun ret_154_SYMINT () Int
;  (- 2147477576))
;(define-fun ret_150_SYMINT () Int
;  (- 2147482464))
;(define-fun ret_74_SYMINT () Int
;  (- 2147475380))
;(define-fun ret_58_SYMINT () Int
;  (- 2147482834))
;(define-fun numbers_1_SYMARRAY () List_Int
;  (let ((a!1 (lambda ((x!1 Int))
;             (and (not (= x!1 7))
;                  (not (= x!1 0))
;                  (not (= x!1 (- 10)))
;                  (not (= x!1 9))
;                  (not (= x!1 1))
;                  (not (= x!1 (- 1)))
;                  (not (= x!1 (- 11)))
;                  (not (= x!1 3))
;                  (not (= x!1 5)))))
;      (a!2 (seq.++ (seq.unit (- 2147482323))
;                   (seq.++ (seq.unit (- 2147477576))
;                           (seq.++ (seq.unit (- 2147474626))
;                                   (seq.unit (- 2147479301)))))))
;(let ((a!3 (seq.++ (seq.unit (- 2147478737))
;                   (seq.++ (seq.unit (- 2147480608))
;                           (seq.++ (seq.unit (- 2147482464)) a!2)))))
;(let ((a!4 (seq.++ (seq.unit (- 2147475269))
;                   (seq.++ (seq.unit (- 2147482686))
;                           (seq.++ (seq.unit (- 2147476139)) a!3)))))
;(let ((a!5 (seq.++ (seq.unit (- 2147475288))
;                   (seq.++ (seq.unit (- 2147477238))
;                           (seq.++ (seq.unit (- 2147482030)) a!4)))))
;(let ((a!6 (seq.++ (seq.unit (- 2147483598))
;                   (seq.++ (seq.unit (- 2147483456))
;                           (seq.++ (seq.unit (- 2147482634)) a!5)))))
;(let ((a!7 (seq.++ (seq.unit (- 2147474742))
;                   (seq.++ (seq.unit (- 2147482867))
;                           (seq.++ (seq.unit (- 2147480939)) a!6)))))
;(let ((a!8 (seq.++ (seq.unit (- 2147473849))
;                   (seq.++ (seq.unit (- 2147481984))
;                           (seq.++ (seq.unit (- 2147479114)) a!7)))))
;(let ((a!9 (seq.++ (seq.unit (- 2147474995))
;                   (seq.++ (seq.unit (- 2147480251))
;                           (seq.++ (seq.unit (- 2147474512)) a!8)))))
;(let ((a!10 (seq.++ (seq.unit (- 2147476326))
;                    (seq.++ (seq.unit (- 2147477111))
;                            (seq.++ (seq.unit (- 2147474111)) a!9)))))
;(let ((a!11 (seq.++ (seq.unit (- 2147481092))
;                    (seq.++ (seq.unit (- 2147475438))
;                            (seq.++ (seq.unit (- 2147483296)) a!10)))))
;(let ((a!12 (seq.++ (seq.unit (- 2147480111))
;                    (seq.++ (seq.unit (- 2147474731))
;                            (seq.++ (seq.unit (- 2147476747)) a!11)))))
;(let ((a!13 (seq.++ (seq.unit (- 2147473866))
;                    (seq.++ (seq.unit (- 2147478777))
;                            (seq.++ (seq.unit (- 2147481290)) a!12)))))
;(let ((a!14 (seq.++ (seq.unit (- 2147479800))
;                    (seq.++ (seq.unit (- 2147473734))
;                            (seq.++ (seq.unit (- 2147473858)) a!13)))))
;(let ((a!15 (seq.++ (seq.unit (- 2147475380))
;                    (seq.++ (seq.unit (- 2147480964))
;                            (seq.++ (seq.unit (- 2147476223)) a!14)))))
;(let ((a!16 (seq.++ (seq.unit (- 2147477940))
;                    (seq.++ (seq.unit (- 2147481359))
;                            (seq.++ (seq.unit (- 2147476120)) a!15)))))
;(let ((a!17 (seq.++ (seq.unit (- 2147482447))
;                    (seq.++ (seq.unit (- 2147477214))
;                            (seq.++ (seq.unit (- 2147479842)) a!16)))))
;(let ((a!18 (seq.++ (seq.unit (- 2147475525))
;                    (seq.++ (seq.unit (- 2147482834))
;                            (seq.++ (seq.unit (- 2147481986)) a!17)))))
;(let ((a!19 (seq.++ (seq.unit (- 2147482080))
;                    (seq.++ (seq.unit (- 2147479995))
;                            (seq.++ (seq.unit (- 2147474242)) a!18)))))
;(let ((a!20 (seq.++ (seq.unit (- 2147483510))
;                    (seq.++ (seq.unit (- 2147480928))
;                            (seq.++ (seq.unit (- 2147481786)) a!19)))))
;(let ((a!21 (seq.++ (seq.unit (- 2147481669))
;                    (seq.++ (seq.unit (- 2147483422))
;                            (seq.++ (seq.unit (- 2147482863)) a!20)))))
;(let ((a!22 (seq.++ (seq.unit (- 2147480252))
;                    (seq.++ (seq.unit (- 2147479513))
;                            (seq.++ (seq.unit (- 2147481317)) a!21)))))
;(let ((a!23 (seq.++ (seq.unit (- 2147476118))
;                    (seq.++ (seq.unit (- 2147481680))
;                            (seq.++ (seq.unit (- 2147483479)) a!22)))))
;(let ((a!24 (seq.++ (seq.unit (- 2147483382))
;                    (seq.++ (seq.unit (- 2147475183))
;                            (seq.++ (seq.unit (- 2147479534)) a!23)))))
;(let ((a!25 (seq.++ (seq.unit (- 2147474597))
;                    (seq.++ (seq.unit (- 2147477942))
;                            (seq.++ (seq.unit (- 2147478468)) a!24)))))
;(let ((a!26 (seq.++ (seq.unit (- 2147477031))
;                    (seq.++ (seq.unit (- 2147481800))
;                            (seq.++ (seq.unit (- 2147473890)) a!25)))))
;  (List_Int a!1
;            (seq.++ (seq.unit (- 2147478577))
;                    (seq.++ (seq.unit (- 2147482117)) a!26)))))))))))))))))))))))))))))
;(define-fun ret_10_SYMINT () Int
;  (- 2147481800))
;(define-fun ret_114_SYMINT () Int
;  (- 2147474512))
;(define-fun ret_56_SYMINT () Int
;  (- 2147475525))
;(define-fun ret_32_SYMINT () Int
;  (- 2147480252))
;(define-fun ret_120_SYMINT () Int
;  (- 2147479114))
;(define-fun ret_118_SYMINT () Int
;  (- 2147481984))
;(define-fun ret_22_SYMINT () Int
;  (- 2147475183))
;(define-fun ret_4_SYMINT () Int
;  (- 2147478577))
;(define-fun ret_100_SYMINT () Int
;  (- 2147475438))
;(define-fun ret_110_SYMINT () Int
;  (- 2147474995))
;(define-fun ret_68_SYMINT () Int
;  (- 2147477940))
;(define-fun ret_156_SYMINT () Int
;  (- 2147474626))
;(define-fun ret_148_SYMINT () Int
;  (- 2147480608))
;(define-fun ret_14_SYMINT () Int
;  (- 2147474597))
;(define-fun ret_96_SYMINT () Int
;  (- 2147476747))
;(define-fun ret_26_SYMINT () Int
;  (- 2147476118))
;(define-fun ret_108_SYMINT () Int
;  (- 2147474111))
;(define-fun ret_126_SYMINT () Int
;  (- 2147480939))
;(define-fun ret_62_SYMINT () Int
;  (- 2147482447))
;(define-fun ret_48_SYMINT () Int
;  (- 2147481786))
;(define-fun ret_46_SYMINT () Int
;  (- 2147480928))
;(define-fun ret_112_SYMINT () Int
;  (- 2147480251))
;(define-fun ret_86_SYMINT () Int
;  (- 2147473866))
;(define-fun ret_36_SYMINT () Int
;  (- 2147481317))
;(define-fun ret_140_SYMINT () Int
;  (- 2147475269))
;(define-fun ret_102_SYMINT () Int
;  (- 2147483296))
;(define-fun ret_34_SYMINT () Int
;  (- 2147479513))
;(define-fun ret_90_SYMINT () Int
;  (- 2147481290))
;(define-fun ret_54_SYMINT () Int
;  (- 2147474242))
;(define-fun ret_52_SYMINT () Int
;  (- 2147479995))
;(define-fun ret_88_SYMINT () Int
;  (- 2147478777))
;(define-fun ret_134_SYMINT () Int
;  (- 2147475288))
;(define-fun ret_122_SYMINT () Int
;  (- 2147474742))
;(define-fun ret_72_SYMINT () Int
;  (- 2147476120))
;(define-fun ret_30_SYMINT () Int
;  (- 2147483479))
;(define-fun ret_78_SYMINT () Int
;  (- 2147476223))
;(define-fun ret_158_SYMINT () Int
;  (- 2147479301))
;(define-fun ret_106_SYMINT () Int
;  (- 2147477111))
;(define-fun ret_124_SYMINT () Int
;  (- 2147482867))
;(define-fun ret_70_SYMINT () Int
;  (- 2147481359))
;(define-fun ret_66_SYMINT () Int
;  (- 2147479842))
;(define-fun ret_132_SYMINT () Int
;  (- 2147482634))
;(define-fun ret_138_SYMINT () Int
;  (- 2147482030))
;(define-fun ret_94_SYMINT () Int
;  (- 2147474731))
;(define-fun ret_152_SYMINT () Int
;  (- 2147482323))
;(define-fun ret_16_SYMINT () Int
;  (- 2147477942))
;(define-fun ret_98_SYMINT () Int
;  (- 2147481092))
;(define-fun ret_116_SYMINT () Int
;  (- 2147473849))
;(define-fun ret_44_SYMINT () Int
;  (- 2147483510))
;(define-fun ret_40_SYMINT () Int
;  (- 2147483422))
;(define-fun ret_130_SYMINT () Int
;  (- 2147483456))
;(define-fun ret_76_SYMINT () Int
;  (- 2147480964))
;(define-fun ret_60_SYMINT () Int
;  (- 2147481986))
;(define-fun ret_80_SYMINT () Int
;  (- 2147479800))
;(define-fun ret_50_SYMINT () Int
;  (- 2147482080))
;(define-fun ret_8_SYMINT () Int
;  (- 2147477031))
;(define-fun ret_104_SYMINT () Int
;  (- 2147476326))
;(define-fun ret_38_SYMINT () Int
;  (- 2147481669))
;(define-fun ret_24_SYMINT () Int
;  (- 2147479534))
;(define-fun ret_12_SYMINT () Int
;  (- 2147473890))
;(define-fun ret_42_SYMINT () Int
;  (- 2147482863))
;(define-fun ret_6_SYMINT () Int
;  (- 2147482117))
;(define-fun ret_82_SYMINT () Int
;  (- 2147473734))
;(define-fun ret_142_SYMINT () Int
;  (- 2147482686))
;(define-fun ret_92_SYMINT () Int
;  (- 2147480111))
;(define-fun ret_64_SYMINT () Int
;  (- 2147477214))
;(define-fun ret_146_SYMINT () Int
;  (- 2147478737))
;(define-fun ret_128_SYMINT () Int
;  (- 2147483598))
;(define-fun ret_20_SYMINT () Int
;  (- 2147483382))
;(define-fun ret_84_SYMINT () Int
;  (- 2147473858))
;(define-fun ret_144_SYMINT () Int
;  (- 2147476139))
;(define-fun ret_28_SYMINT () Int
;  (- 2147481680))