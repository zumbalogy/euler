; A perfect number is a number for which the sum of its proper divisors is exactly equal to the number.
; The sum of the proper divisors of 28 are 1 + 2 + 4 + 7 + 14 = 28,so 28 is a perfect number.
; A number n is called deficient if the sum of its proper divisors is less than n and it is
; called abundant if this sum exceeds n.

; As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16,
; the smallest number that can be written as the sum of 2 abundant numbers is 24.
; By mathematical analysis, it can be shown that all integers greater than 28123 can be written as
; the sum of 2 abundant numbers. However, this upper limit cannot be reduced any further by
; analysis even though it is known that the greatest number that cannot be expressed as the
; sum of 2 abundant numbers is less than this limit.

; Find the sum of all the positive integers which cannot be written as the sum of 2 abundant numbers.

(defn sum_factors [n]
  (let [rt (Math/sqrt n)]
    (reduce
      #(+ %1 %2 (quot n %2))
      (if (zero? (rem rt 1)) (inc rt) 1)
      (filter #(zero? (rem n %))
        (range 2 rt)))))

(def abundants
  (filter #(< % (sum_factors %)) (drop 2 (range))))

(defn add_pairs [n]
  ; TODO: when x is at index a, only need y to be (drop a n)
  ; could make the when (< y x (+ x y) 28123) but needs to be <= and 28122 then
  ; this works but seems slower
  ; (set (filter #(< % 28123) (flatten (map-indexed #(map (partial + %2) (drop %1 n)) n)))))
  (set (for [x n y n :when (< (+ x y) 28123)] (+ x y))))

(defn sum-range [x]
  (* (/ x 2) (inc x)))

(def my_combos
  (add_pairs (take-while #(< % 28123) abundants)))

(println
  (- (sum-range 28122) (reduce + my_combos)))
; 4,179,871
