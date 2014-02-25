;; The prime factors of 13195 are 5, 7, 13 and 29.

;; What is the largest prime factor of the number 600851475143 ?


(+ 1 2 3)



(mod 11 5)


(set (range 0 1000 5))
(range 0 100 5)

(def start 13195)

(def up_to (range 1 start))

;(for [x (flatten foo) :while (<= x 5)] x)

(mod start 29)

(== (mod start 29) 0)

(for [x up_to :when (== (mod start x) 0)] x)

;; just go over the output of the above and make sure there (same method) has the highest value (or reduction of) zero, then return that one





