; 2520 is the smallest number that can be divided by the numbers from 1 to 10 without any remainder.

; What is the smallest positive number that is evenly divisible by the numbers from 1 to 20?

(defn gdc [a b]
  (if (= b 0)
    a
    (gdc b (rem a b))))

(defn lcm [a b]
  (quot (* a b) (gdc a b)))

(println
  (reduce lcm (range 11 21)))
; 232792560
