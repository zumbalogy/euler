; Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

; 1634 = 1^4 + 6^4 + 3^4 + 4^4
; 8208 = 8^4 + 2^4 + 0^4 + 8^4
; 9474 = 9^4 + 4^4 + 7^4 + 4^4
; As 1 = 1^4 is not a sum it is not included.

; The sum of these numbers is 1634 + 8208 + 9474 = 19316.

; Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

(use '[clojure.string :only (split)])

(defn extract_digits [input]
  (map read-string (split (str input) #"")))

(defn pow_reducer [input pow]
  (reduce #(+ %1 (Math/pow %2 pow)) 0 input))

(defn eq_pow_sum_5 [input]
  (== input (pow_reducer (extract_digits input) 5)))

(print
  (reduce +
    (filter eq_pow_sum_5 (range 2 999999))))
; 443839
; from: 4150 4151 54748 92727 93084 194979

; could maybe do something smart with summing all combinations of the 5th power of each of the 10 digits, and seeing what ones sum to contain those numbers
