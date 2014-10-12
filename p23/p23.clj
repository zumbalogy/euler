; A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

; A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

; As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28_123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

; Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

;;;;;;;;;;;;;;;;;;;;;;;;

(defn is_divisible? [total div]
  (= 0 (mod total div)))

(defn take_divs [input]
  (filter #(is_divisible? input %) (range 1 input)))

(defn sum_divs [input]
  (apply + (take_divs input)))

(defn abundant? [input]
  (> (sum_divs input) input))

(defn lower_abundants [input]
  (filter #(abundant? %) (range 1 input)))

(defn is_sum_of_abundant? [input]
  (let [abundants (lower_abundants input)]
    (some #(= input %)
      (for [x abundants y abundants]
        (+ x y)))))

(reduce + (filter (partial is_sum_of_abundant?) (range 24 28123)))



