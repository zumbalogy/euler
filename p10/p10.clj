; The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

; Find the sum of all the primes below two million.

(defn is_prime [input]
  (if (< input 3)
    (if (= input 1)
      (false)
      (true))
    (if (even? input)
      false
      (= [1]
         (for [x (range 1 (inc (Math/sqrt input)) 2)
                 :when (== (mod input x) 0)] x)))))


