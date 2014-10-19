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

(defn reduce_to_pow [input pow]
  (reduce #(+ %1 (Math/pow %2 pow)) 0 input))

(defn sum_digits_to_pow [input pow]
  (reduce_to_pow (extract_digits input) pow))

(defn eq_pow_sum [input pow]
  (== input (sum_digits_to_pow input pow)))

(print
  (reduce +
    (filter #(eq_pow_sum % 5)
      (range 2 999999))))
; 443839







