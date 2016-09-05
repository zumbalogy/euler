; The sum of the squares of the first 10 natural numbers is
; 1^2 + 2^2 + ... + 10^2 = 385

; The square of the sum of the first 10 natural numbers is
; (1 + 2 + ... + 10)^2 = 55^2 = 3025

; The delta for the sum of the squares of the first 10 natural numbers
; and the square of the sum is 3025 − 385 = 2640

; Find delta for the sum of squares of the first 100 natural numbers and square of the sum.

(defn sq-sum [x]
  (* (inc x) (inc x) (/ x 2) (/ x 2)))

(defn sum-sq [x]
  (/ (* x (inc x) (inc (* 2 x))) 6))

(println
  (- (sq-sum 100)
     (sum-sq 100)))
; 25164150
