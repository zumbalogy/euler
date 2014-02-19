;; euler prob number 1

;; If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
;; Find the sum of all the multiples of 3 or 5 below 1000.

(def foo (set (range 0 1000 5)))
(def bar (set (range 0 1000 3)))

(reduce + (union foo bar))


;; 233168
;; this is the correct answer



;; playing around



(def foo (range 0 1000 5))
(def bar (range 0 1000 3))

(def foobar(into foo bar))

(def uniqfoobar (distinct foobar))

(reduce + uniqfoobar)



(require '[clojure.set :refer [union]])

(seq [1 2 3])
(def one (seq [1 2 3 7]))
(def two (set [3 3 4 5]))
(def three (seq [7 8 9]))

(reduce +  one)

(union one one)
(union two two)

(union one three)

(into [1 2 3] [3 4 5])
(distinct [1 2 2 3])
(distinct (into [1 2 3] [3 4 5]))

(nth one 1)

(union #{1 2 3} #{3 4 5})
