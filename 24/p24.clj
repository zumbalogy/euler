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

; (def shift-it (memoize shift-it))
(def first-shift (memoize first-shift))

(defn ranked-shift [lex]
  (let [sorted (sort lex)
        ranked (map #(.indexOf sorted %) lex)
        shifted (first-shift ranked)]
    (when shifted
      (map #(nth sorted %) shifted))))

(defn chop [lex i]
  (let [[h t] (split-at (- (count lex) i) lex)
        t2 (ranked-shift t)]
    (when t2
      (concat h t2))))

(defn next-lex [lex]
  (or (some #(chop lex %) (range 1 (inc (count lex))))
      (concat (rest lex) [(first lex)])))

; (next-lex [0 1 2]) ;[0 2 1]
; (next-lex [0 2 1]) ;[1 0 2]
; (next-lex [1 0 2]) ;[1 2 0]
; (next-lex [1 2 0]) ;[2 0 1]
; (next-lex [2 0 1]) ;[2 1 0]

(println '(0 2 1) "<-correct")
(println (next-lex [0 1 2]))

(println)


; (println '(1 2 0) " : in")
; (println (shift-it [1 2 0] 1) " : out")
; (println '(2 0 1) "<-correct")
;
; (println)
;
(println '(0 1 2 3 4 5 6 9 7 8) "<-correct")
(time (println (next-lex [0 1 2 3 4 5 6 8 9 7])))
;
(println '(0 1 3 9 8 4 6 7 2 5) "<-correct")
(time (println (nth (iterate next-lex (range 10)) 10000)))

;
; (assert (= (next-lex [0 1 2]) [0 2 1]))
; (assert (= (next-lex [0 2 1]) [1 0 2]))
; (assert (= (next-lex [1 0 2]) [1 2 0]))
; (assert (= (next-lex [1 2 0]) [2 0 1]))
; (assert (= (next-lex [2 0 1]) [2 1 0]))
; (assert (= [0 1 2 3 4 5 6 9 7 8]
;            (next-lex [0 1 2 3 4 5 6 8 9 7])))
; (assert (= [0 1 3 9 8 4 6 7 2 5]
;            (nth (iterate next-lex (range 10)) 10000)))

(println (time
  (nth (iterate next-lex (range 10)) 999999))
)
; 2783915460
