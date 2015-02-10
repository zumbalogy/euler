; If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
; Find the sum of all the multiples of 3 or 5 below 1000.

(println
  (reduce +
    (filter
      #(or
        (zero? (mod % 3))
        (zero? (mod % 5)))
    (range 1000))))
; 233168

;;;;;;;;;;;;;;;;;;;;;

(require '[clojure.set :refer [union]])


(def foo (set (range 0 1000 5)))
(def bar (set (range 0 1000 3)))

(reduce + (union foo bar))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(reduce +
  (filter
    #(or
      (zero? (mod % 3))
      (zero? (mod % 5)))
    (range 1000)))
;; 233168

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(- (+ (reduce + (range 0 1000 3))
      (reduce + (range 0 1000 5)))
   (reduce + (range 0 1000 15)))
;; 233168

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(def foo (range 0 1000 5))
(def bar (range 0 1000 3))

(def foobar(into foo bar))

(def uniqfoobar (distinct foobar))

(reduce + uniqfoobar)


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
