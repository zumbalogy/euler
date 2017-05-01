#lang racket

; The natural numbers below 10 that are multiples of 3 or 5 are 3, 5, 6 and 9.
; The sum of these multiples is 23.
; Find the sum of all the multiples of 3 or 5 below 1000.

(define (sum-under limit)
  (* limit (/ (+ limit 1) 2)))

(define (sum-steps step limit)
  (* step (sum-under (floor (/ (- limit 1) step)))))

(println
  (- (+ (sum-steps 3 1000) (sum-steps 5 1000)) (sum-steps 15 1000)))
; 233168
