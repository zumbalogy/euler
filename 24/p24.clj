; A permutation is an ordered arrangement of objects.
; For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4.
; If the permutations are in lexicographic order if listed numerically or alphabetically.
; The lexicographic permutations of 0, 1 and 2 are: 012 021 102 120 201 210

; What is the millionth lexicographic permutation of the digits 0, 1, 2, 3 ,4 ,5 ,6 7, 8, and 9?

(defn delete [i lst]
  ; TODO: do this the normal way
  (concat (take i lst) (drop (inc i) lst)))

(defn factorial [n]
  (reduce * (range 2 (inc n))))

(defn grab [indexes bag]
  (first (reduce (fn [[out new-bag] i] [(conj out (nth new-bag i)) (delete i new-bag)]) [[] bag] indexes)))

(defn n-lex-reducer [[sum out] i]
  (let [f (factorial i)
        q (if (= 0 i) 0 (quot sum f))
        x (- sum (* q f))]
    [x (conj out q)]))

(defn n-lex [n lex]
  (let [rrange (reverse (range (count lex)))
        indexes (last (reduce n-lex-reducer [n []] rrange))]
    (grab indexes lex)))

(println
  (n-lex 999999 (range 10)))
; 2783915460
