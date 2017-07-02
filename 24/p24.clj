; A permutation is an ordered arrangement of objects.
; For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4.
; If the permutations are in lexicographic order if listed numerically or alphabetically.
; The lexicographic permutations of 0, 1 and 2 are: 012 021 102 120 201 210

; What is the millionth lexicographic permutation of the digits 0, 1, 2, 3 ,4 ,5 ,6 7, 8, and 9?

; NOTE: this code will ignore duplicate permutations like ([1 1] [1 1]) if there were any

(defn shift-it [lex i]
  (let [ri (dec (- (count lex) i))
        n (nth lex ri)
        [h t] (split-at ri lex)
        tail (rest t)
        spot (.indexOf h (last (filter #(< % n) h)))
        [h2 t2] (split-at spot h)
        out-tail (sort (concat t2 tail))]
      (when (not= -1 spot)
        (concat h2 [n] out-tail))))

(defn first-shift [lex]
  (some #(shift-it lex %) (range (count lex))))

(def first-shift (memoize first-shift))

(defn chop [lex i]
  (let [[h t] (split-at (- (count lex) i) lex)]
    (when-let [t2 (first-shift t)]
      (concat h t2))))

(defn next-lex [lex]
  (or (some #(chop lex %) (range 1 (inc (count lex))))
      (concat (rest lex) [(first lex)])))

(println '(0 1 3 9 8 4 6 7 2 5) "<-correct")
(time (println (nth (iterate next-lex (range 10)) 10000)))
(time (nth (iterate next-lex (range 10)) 50000))


; (println (time
;   (nth (iterate next-lex (range 10)) 999999)))
; 2783915460
