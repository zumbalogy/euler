; A permutation is an ordered arrangement of objects.
; For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4.
; If the permutations are in lexicographic order if listed numerically or alphabetically.
; The lexicographic permutations of 0, 1 and 2 are: 012 021 102 120 201 210

; What is the millionth lexicographic permutation of the digits 0, 1, 2, 3 ,4 ,5 ,6 7, 8, and 9?

; this would ignore duplicate permutations like ([1 1] [1 1])

(ns my.combinatorics
  (:require [clojure.math.combinatorics :as combo]))

(defn shift-it [lex i]
  (let [rlex (reverse lex)
        n (nth rlex i)
        [head t] (split-at i rlex)
        tail (rest t)
        spot (.indexOf tail (first (filter #(< % n) tail)))
        [h2 t2] (split-at (inc spot) tail)
        out-head (reverse (sort (reverse (concat head h2))))
        out (reverse (concat out-head [n] t2))
        alt-out (concat (rest lex) [n])]
    ; (println
    ;   "\n out" out
    ;   "\n tail" tail
    ;   "\n spot " spot
    ;   "\n head" head
    ;   "\n h2" h2
    ;   "\n n" n
    ;   "\n t2" t2
    ;   )
    (if (and (= (inc i) (count lex)) (= -1 spot) (> (first alt-out) (first lex)))
      alt-out
      (if (and (not= spot -1) (= (count lex) (count out)))
        out
        nil))))

(defn sub-next-lex [lex]
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

(assert (= (next-lex [0 1 2]) [0 2 1]))
(assert (= (next-lex [0 2 1]) [1 0 2]))
(assert (= (next-lex [1 0 2]) [1 2 0]))
(assert (= (next-lex [1 2 0]) [2 0 1]))
(assert (= (next-lex [2 0 1]) [2 1 0]))
(assert (= (combo/nth-permutation (range 10) 4)
           (next-lex [0 1 2 3 4 5 6 8 9 7])))


(println (combo/nth-permutation (range 10) 999999))
(println (nth (iterate next-lex (range 10)) 999999))


; 7 9 8 6
; 8 6 7 9



; 2783915460
