;; What is the 10 001st prime number? (not including one)

(defn is_prime [input]
  (= [1] (for [x (range 1 (Math/sqrt input))
    :when (== (mod input x) 0)] x)))


(def x 4)

(is_prime x)



