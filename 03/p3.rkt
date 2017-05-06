#lang racket

; The prime factors of 13195 are 5, 7, 13 and 29.
; What is the largest prime factor of the number 600851475143?

(define (lpf input)
  (let loop ([i 2] [out input])
    (if (< out (* i i))
      out
      (if (= 0 (remainder out i))
        (loop i (/ out i))
        (loop (+ 1 i) out)))))

(println (lpf 600851475143))
; 6857
