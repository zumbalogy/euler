; The prime factors of 13195 are 5, 7, 13 and 29.
; What is the largest prime factor of the number 600851475143?

(defn prime? [n]
  (if (even? n)
    false
    (not-any? #(zero? (mod n %))
      (range 3 (int (inc (Math/sqrt n))) 2))))

(defn factor [n]
  (quot n (first
    (filter #(let [a (/ n %)] (= a (long a)))
      (range 2 n)))))

(defn largest_prime_factor [n]
  (loop [n (factor n)]
    (if (prime? n)
      n
      (recur (factor n)))))

(println
  (largest_prime_factor 600851475143))
; 6857
