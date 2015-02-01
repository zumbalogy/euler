;  New terms in the Fibonacci sequence is the sum of the previous two terms. Starting with 1 and 2, the first 10 terms will be:
;  1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
;  Total the even fibs under 4 million.

(def fibs
  (lazy-cat [0 1]
    (map + fibs (rest fibs))))

(reduce +
  (filter even?
    (take-while (partial > 4000000)
      fibs)))
; 4613732

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(reduce +
  (take-while (partial > 4000000)
    (take-nth 3 fibs)))
; every 3rd fib is even

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(reduce +
  (take-while #(< % 4000000)
    (take-nth 3 fibs)))
; every 3rd fib is even

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(print
  (reduce +
    (take-nth 3 (take-while (partial > 4000000) fibs))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; (reduce +
;         (for [x fibs :when (and (even? x) (< x 4000000))] x))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(take 4 fibs)

(take 10 (for [x (range 100) y (range 100) :while (< y x)]  [x y]))

(take 10 (for [x fibs] [x]))

(take 10 (for [x fibs :while (<= x 2)] [x]))

(for [x fibs :while (<= x 2)] [x])

(for [x fibs :while (and (even? x) (< x 4000000)) ] [x])
;; why is this not grabbing more of them????
;; i think the lazy one stop evaling once they hit a false. makes sense i guess

(for [x fibs :while (<= x 4000000)] [x])


(for [x fibs :while (and (<= x 4000000)(<= 0 x))] [x])

(even? 2)

(<= 1 2)

(<= 1 2)

(and (<= 1 2) (< 3 4))

(def foo (for [x fibs :while (<= x 4000000)] [x]))



(flatten (doall foo))

(doall foo)

(for [x (flatten (doall foo)) :while (> 4000000 x)] x)

(for [x (flatten foo) :while (<= x 5)] [x])

(for [x (flatten foo) :while (even? x)] x)
(for [x (flatten (doall foo)) :when (even? x)] x)

(reduce + (for [x (flatten (doall foo)) :when (even? x)] x))
;; 4613732

(for [x [0 1 2 3 4 5]
             :let [y (* x 3)]
             :when (even? y)]
         y)


(def foo (for [x fibs :while (<= x 4000000)] [x]))

(reduce + (for [x (flatten  foo) :when (even? x)] x))


(take 9 fibs)


(concat [1 2 3] [3 4 5])








