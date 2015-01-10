;  New terms in the Fibonacci sequence is the sum of the previous two terms. Starting with 1 and 2, the first 10 terms will be:
;  1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
;  Total the even fibs under 4 million.

(def fibs
  (lazy-cat [0 1]
    (map + fibs (rest fibs))))

(reduce +
  (take-while #(< % 4000000)
    (take-nth 3 fibs)))
; every 3rd fib is even
; 4613732









