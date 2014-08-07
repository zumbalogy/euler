; 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

; What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

; 232792560 is correct anser

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn match [x]
  (and (== (mod x 20) 0) (not (== x 0)))
)


(def output (take 1 (for [x (range) :when (match x)] x)))

(print (* 20 (first output)))