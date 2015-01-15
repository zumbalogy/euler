; The prime factors of 13195 are 5, 7, 13 and 29.
; What is the largest prime factor of the number 600851475143?

(defn odd_prime? [n]
  (not-any? #(zero? (mod n %))
    (range 3 (int (inc (Math/sqrt n))) 2)))

(defn prime_factor? [a b]
  (and
    (zero? (mod a b))
    (odd_prime? b)))

(defn largest_prime_factor [n]
  (let [
    sq (int (Math/sqrt n))
    start (if (even? sq) sq (dec sq))]
    (first
      (filter #(prime_factor? n %)
        (range start 1 -2)))))

(time
  (largest_prime_factor 600851475143))
; 6857

; sqrt of 600851475143 is even, but I do the check anyway in largest_prime_factor.
; could check for oddness in the prime_factor?'s and function if i wanted to keep odd_prime? as is but make largest_prime_factor simpler

(time
  (largest_prime_factor 600851475143))
(time
  (largest_prime_factor 600851475143))
(time
  (largest_prime_factor 600851475143))
(time
  (largest_prime_factor 600851475143))
(time
  (largest_prime_factor 600851475143))
(time
  (largest_prime_factor 600851475143))
(time
  (largest_prime_factor 600851475143))
(time
  (largest_prime_factor 600851475143))
(time
  (largest_prime_factor 600851475143))
