; The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

; Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

(defn exp [base power]
  (reduce *' (repeat power base)))

(defn inc_tail [total step]
  (rem (+ total (exp step step)) 10000000000))

(println
  (reduce inc_tail (range 1000)))
; 9110846700N
