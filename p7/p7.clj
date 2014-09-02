;; What is the 10 001st prime number? (not including one)

(defn is_prime [input]
  (= [1] (for [x (range 1 (inc (Math/sqrt input)))
    :when (== (mod input x) 0)] x)))

(last (take 10001 (filter is_prime (range))))
; 104743
