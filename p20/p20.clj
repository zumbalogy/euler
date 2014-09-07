; n! means n × (n − 1) × ... × 3 × 2 × 1

; For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
; and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

; Find the sum of the digits in the number 100!

(use '[clojure.string :only (split)])

(defn factorial [input]
  (reduce *' (range 2 (inc input))))

(defn sum_digits [input]
  (reduce + (map read-string (split (str input) #""))))

(print (sum_digits (factorial 100)))
; 648
