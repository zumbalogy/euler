; Let d(n) equal the sum of divisors of n.

; If d(a) = b and d(b) = a and a ≠ b, then a and b are amicable.

; The divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; so d(220) = 284.
; The divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

; Sum all amicable numbers under 10_000.


(defn take_factors [n]
  (filter #(zero? (mod n %)) (range 1 n)))

(defn sum_factors [n]
  (reduce + (take_factors n)))

(defn amicable? [a]
  (let [b (sum_factors a)]
    (and
      (not (= a b))
      (= a (sum_factors b)))))

(print
  (reduce + (filter amicable? (range 1 10000))))
; 31626

; There are 10 amicable numbers in this range.
; 220 284 1184 1210 2620 2924 5020 5564 6232 6368