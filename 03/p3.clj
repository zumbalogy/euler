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

(time
  (largest_prime_factor 600851475143))
; 6857
; "Elapsed time: 120.797306 msecs"
; cuts it in half to only go though odd candidates in the range at the bottom of largest_prime_factor function


; to find largest prime factor of N
; is n/2 prime? is n/3 prime? is n/4 prime? do this until n.sqrt.

; to be fancier, if n/2 is round number, seing if (n/2)/2 etc (until reduced to a prime or float) might be good. but, if do this, have to factor it all, because n/3...etc might prove larger than n/2..etc, i think.
; for example, 13 might be the largest prime factor of 130. . hmm, maybe you dont have to do whole factor tree, maybe first prime factor you find on that side of things is the biggest always.

; so, on the tree of factors, the first prime right handed factor is the greatest. that makes sense and is how you do it by hand in grade school.

(defn factor [n]
  )
