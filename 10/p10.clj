; The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

; Find the sum of all the primes below two million.

(defn is_prime [input]
  (not-any? #(== 0 (mod input %)) (range 3 (inc (Math/sqrt input)) 2)))

(println
  (reduce + 2 (filter is_prime (range 3 2000000 2))))
; 142_913_828_922
