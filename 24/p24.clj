; A permutation is an ordered arrangement of objects.
; For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4.
; If the permutations are in lexicographic order if listed numerically or alphabetically.
; The lexicographic permutations of 0, 1 and 2 are: 012 021 102 120 201 210

; What is the millionth lexicographic permutation of the digits 0, 1, 2, 3 ,4 ,5 ,6 7, 8, and 9?

; 012 021 102 120 201 210
; 000 001 010 011 100 101
; abc acb bac bca cab cba
; acb abc cab cba bac bca
; bac bca abc acb cba cab
; cab cba acb abc bca bac
; bca bac cba cab abc acb
; cba cab bca bac acb abc

(ns my.combinatorics
  (:require [clojure.math.combinatorics :as combo]))

; (defn shift-it [lex i]
;   (let [rlex (reverse lex)
;         n (nth rlex i)
;         [head t] (split-at i rlex)
;         tail (rest t)
;         spot (.indexOf tail (first (filter #(< % n) tail)))
;         [h2 t2] (split-at (inc spot) tail)
;         out (reverse (concat (butlast head) h2 [n] t2))]
;     ; (println "out" out "\ntail" tail "\nspot " spot "\nhead" head "\n h2" h2 "\n n" n "\n t2" t2)
;     (if (and (= (inc i) (count lex)) (= -1 spot))
;       (concat (rest lex) [n])
;       (if (and (not= spot -1) (= (count lex) (count out)))
;         out
;         nil))))

(defn shift-it [lex i]
  (let [rlex (reverse lex)
        n (nth rlex i)
        [head t] (split-at i rlex)
        tail (rest t)
        spot (.indexOf tail (first (filter #(< % n) tail)))
        [h2 t2] (split-at (inc spot) tail)
        out (reverse (concat (butlast head) h2 [n] t2))
        alt-out (concat (rest lex) [n])]
    ; (println "out" out "\ntail" tail "\nspot " spot "\nhead" head "\n h2" h2 "\n n" n "\n t2" t2)
    ; (if (and (= (inc i) (count lex)) (= -1 spot) (not= lex alt-out))
    ;   alt-out
      (if (and (not= spot -1) (= (count lex) (count out)))
        out
        nil)))

; (shift-it [1 2 0] 1)
; tail (1)
; spot  0
; head (0)
;  h2 (1)
;  n 2
;  t2 ()
; (2 1)
;
;
; 0 2 1
;
; ;; =>> 201

(defn sub-next-lex [lex]
  ; this would ignore duplicate permutations like ([1 1] [1 1])
  (first (keep #(shift-it lex %) (range (count lex)))))

(defn next-lex [lex]
  (loop [i 1]
    (let [[head tail] (split-at (- (count lex) i) lex)
          new-tail (sub-next-lex tail)]
      (if (> i (count lex))
        (concat (rest lex) [(first lex)])
        (if new-tail
          (concat head new-tail)
          (recur (inc i)))))))

; (next-lex [3 4 5 6 7 8 9 1 0 2])
; (3 4 5 6 7 8 9 1 2 0)

(assert (= (next-lex [0 1 2]) [0 2 1]))
(assert (= (next-lex [0 2 1]) [1 0 2]))
(assert (= (next-lex [1 0 2]) [1 2 0]))
(assert (= (next-lex [1 2 0]) [2 0 1]))
(assert (= (next-lex [2 0 1]) [2 1 0]))

(println (combo/nth-permutation (range 10) 999998))
(println (next-lex [2 7 8 3 9 1 5 4 0 6]))

(println "\n" [0 1 2 3 4 5 6 9 7 8] "\n" (nth (iterate next-lex (range 10)) 4))

(println (combo/nth-permutation (range 10) 3))
(println (combo/nth-permutation (range 10) 4))

(println)
;
(println [0 1 2 3 4 5 6 8 9 7])
(println (next-lex [0 1 2 3 4 5 6 8 9 7]))

; 2783915460
