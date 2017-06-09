; A permutation is an ordered arrangement of objects.
; For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4.
; If the permutations are in lexicographic order if listed numerically or alphabetically.
; The lexicographic permutations of 0, 1 and 2 are: 012 021 102 120 201 210

; What is the millionth lexicographic permutation of the digits 0, 1, 2, 3 ,4 ,5 ,6 7, 8, and 9?

; NOTE: this code will ignore duplicate permutations like ([1 1] [1 1]) if there were any

(defn shift-it [lex i]
  (let [rlex (reverse lex)
        n (nth rlex i)
        [head t] (split-at i rlex)
        tail (rest t)
        spot (.indexOf tail (first (filter #(< % n) tail)))
        [h2 t2] (split-at (inc spot) tail)
        out-head (sort > (concat head h2))]
      (when (not= spot -1)
        (reverse (concat out-head [n] t2)))))

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

; (defn chop [lex i]
;   (let [[h t] (split-at (- (count lex) i) lex)
;         t2 (sub-next-lex t)]
;     (when t2 (concat h t2))))
;
; (defn next-lex [lex]
;   (or (first (keep #(chop lex %) (range 1 (inc (count lex)))))
;       (concat (rest lex) [(first lex)])))

(time (nth (iterate next-lex (range 10)) 10000))

(assert (= (next-lex [0 1 2]) [0 2 1]))
(assert (= (next-lex [0 2 1]) [1 0 2]))
(assert (= (next-lex [1 0 2]) [1 2 0]))
(assert (= (next-lex [1 2 0]) [2 0 1]))
(assert (= (next-lex [2 0 1]) [2 1 0]))
(assert (= [0 1 2 3 4 5 6 9 7 8]
           (next-lex [0 1 2 3 4 5 6 8 9 7])))
(assert (= [0 1 3 9 8 4 6 7 2 5]
           (nth (iterate next-lex (range 10)) 10000)))

(println
  (nth (iterate next-lex (range 10)) 999999))

; 2783915460
