; The natural numbers below 10 that are multiples of 3 or 5 are 3, 5, 6 and 9.
; The sum of these multiples is 23.
; Find the sum of all the multiples of 3 or 5 below 1000.

(defn sum_under [input]
  (* input (/ (inc input) 2)))

(defn sum_steps [step limit]
  (* step (sum_under (int (/ (dec limit) step)))))

(println
  (- (+ (sum_steps 3 1000) (sum_steps 5 1000))
     (sum_steps 15 1000)))
; 233168
