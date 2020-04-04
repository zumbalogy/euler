#lang racket

; Each new term in the Fibonacci sequence is generated by adding the previous two terms.
; By starting with 1 and 2, the first 10 terms will be:
; 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

; Sum the even terms in the Fibonacci sequence under four million

(println (let loop ([a 1] [b 2] [sum 0])
  (if (< b 4000000)
    (loop b (+ a b) (if (even? b) (+ sum b) sum))
    sum)))

; 4613732