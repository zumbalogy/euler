; The sum of the squares of the first 10 natural numbers is
; 1^2 + 2^2 + ... + 10^2 = 385

; The square of the sum of the first 10 natural numbers is
; (1 + 2 + ... + 10)^2 = 55^2 = 3025

; The delta for the sum of the squares of the first 10 natural numbers
; and the square of the sum is 3025 − 385 = 2640

; Find delta for the sum of squares of the first 100 natural numbers and square of the sum.

(- (* 101 101 50 50) (/ (* 201 100 101) 6))
; 25164150

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn sq [x]
  (* x x))

(defn sum-range [x]
  (* (inc x) (/ x 2)))

(defn sum-sq-range [x]
  (reduce + (map sq (range (inc x)))))

(println
  (- (sq (sum-range 100))
     (sum-sq-range 100)))
; 25164150
