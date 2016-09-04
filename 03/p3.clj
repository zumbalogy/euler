; The prime factors of 13195 are 5, 7, 13 and 29.
; What is the largest prime factor of the number 600851475143?

(defn lpf
  ([a] (lpf a 2))
  ([a b]
    (if (<= a (* b b))
      a
      (if (zero? (rem a b))
        (lpf (quot a b) b)
        (lpf a (inc b))))))

(println
  (lpf 600851475143))
; 6857
