; The prime factors of 13195 are 5, 7, 13 and 29.
; What is the largest prime factor of the number 600851475143?

(defn prime? [n]
  (if (even? n)
    false
    (not-any? #(zero? (mod n %))
      (range 3 (int (inc (Math/sqrt n))) 2))))

(defn prime_factor? [a b]
  (and
    (zero? (mod a b))
    (prime? b)))

(defn largest_prime_factor [n]
  (first
    (filter #(prime_factor? n %)
      (range (int (Math/sqrt n)) 1 -1))))

(println
  (largest_prime_factor 600851475143))
; 6857
