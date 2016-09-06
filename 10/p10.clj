; The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

; Find the sum of all the primes below two million.

; TODO: slow, use a sieve or something. 

(defn prime? [n]
  (not-any? #(zero? (rem n %)) (range 3 (inc (Math/sqrt n)) 2)))

(println
  (reduce + 2 (filter prime? (range 3 2000000 2))))
; 142_913_828_922
