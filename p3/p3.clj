;; The prime factors of 13195 are 5, 7, 13 and 29.

;; What is the largest prime factor of the number 600851475143 ?

(defn is_prime [input]
  (= 1 (for [x (range 1 (inc (Math/sqrt input))) :when (== (mod input x) 0)] x)))

(def start (bigint 600851475143))

(def up_to (range 1 start 2))

(print
  (last
    (filter (zero? (partial start mod)) start)
  )
)
;; 6857



(take 5 (filter #(zero? (mod start %)) (range 1 start)))


(take 5 (filter #(zero? (mod start %)) (range (/ start 3) 1 -1)))



(take 5 (range (/ start 3) 1 -1))

(= 0 (mod (first (take 5 (range (/ start 3) 1 -1))) 2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(def foo (range (/ start 3) 1 -1))


(first (filter #(= 0 (mod start %)) foo))



(defn is-prime? [n]
   (zero? (count (filter #(zero? (rem n %)) (range 3 n 2))))
)


(first (filter #(and (zero? (mod start %)) (is-prime? %)) foo))

