; 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

; What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn match [x]
  (let [y (* 20 x)]
  (and
    (= (mod y 19) 0)
    (= (mod y 18) 0)
    (= (mod y 17) 0)
    (= (mod y 16) 0)
    (= (mod y 15) 0)
    (= (mod y 14) 0)
    (= (mod y 13) 0)
    (= (mod y 12) 0)
    (= (mod y 11) 0)
    (not (= y 0))))
)


(def output (take 1 (for [x (range) :when (match x)] x)))

(print (* 20 (first output)))

; 232792560

(time (take 1 (for [x (range) :when (match x)] x)))
; "Elapsed time: 0.245 msecs"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defn gdc [a b]
  (if (= b 0) 
    a 
    (gdc b (mod a b)))
)

(defn lcm [a b]
  (/ (* a b) (gdc a b))
)

(time (reduce lcm (range 11 21)))
; "Elapsed time: 0.189 msecs"

; 232792560