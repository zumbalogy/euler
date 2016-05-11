; A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number. A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

; As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28_123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

; Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

(use 'clojure.set)

(defn sum_factors [n]
  (let [rt (Math/sqrt n)]
    (reduce
      #(+ %1 %2 (quot n %2))
      (if (== 0 (mod rt 1)) (inc rt) 1)
      (filter
        #(zero? (mod n %))
        (range 2 rt)))))

(def abundants
  (filter #(< % (sum_factors %)) (drop 2 (range))))

(defn add_pairs [n]
  (set (for [x n y n] (+ x y))))

(def my_combos
  (add_pairs (take-while #(< % 28123) abundants)))

(def non_abundant_set
  (difference (set (range 28123)) my_combos))

(println
  (reduce + non_abundant_set))
; 4,179,871
