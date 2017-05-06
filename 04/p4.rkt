#lang racket

; Find the largest palindome number (9009) that
; is the product of 2 3-digit numbers.

; this will ignore 5 digit ones for now, since the largest will be 6 digits

(define (to-pal x)
  (let* ([str (number->string x)]
         [rstr (list->string (reverse (string->list str)))])
    (string->number (string-append str rstr))))

(define (good-prod? x)
  (let loop ([i 100])
    (if (and (= 0 (remainder x i)) (< 100 (/ x i) 999))
      #t
      (if (< 999 i)
        #f
        (loop (+ 1 i))))))

(define output
  (let loop ([i 999])
    (if (good-prod? (to-pal i))
      (to-pal i)
      (loop (- i 1)))))

(println
  output)
; 906609
; 913 * 993
