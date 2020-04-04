#lang racket

; The prime factors of 13195 are 5, 7, 13 and 29.
; What is the largest prime factor of the number 600851475143?

(define (lpf-loop i input)
  (if (< input (* i i))
    input
    (if (= 0 (remainder input i))
      (lpf-loop i (/ input i))
      (lpf-loop (+ 1 i) input))))

(define (lpf input)
  (lpf-loop 2 input))

(println (lpf 600851475143))
; 6857
