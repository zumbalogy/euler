; The sum of the squares of the first ten natural numbers is,

; 1^2 + 2^2 + ... + 10^2 = 385
; The square of the sum of the first ten natural numbers is,

; (1 + 2 + ... + 10)^2 = 55^2 = 3025
; delta for sum of the squares of first ten natural numbers and square of the sum is 3025 − 385 = 2640

; Find delta for sum of squares of the first one hundred natural numbers and square of the sum

(- (* (* 101 50) (* 101 50)) (/ (* 100 101 201) 6))

; 25164150

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn square [input]
  (* input input))

(def sqsum
  (reduce + (map square (range 101))))

(def sumsq
  (square (reduce + (range 101))))

(println
  (- sumsq sqsum))
; 25164150
