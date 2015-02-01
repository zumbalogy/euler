; The following iterative sequence is defined for the set of positive integers:
; n → n/2 (n is even)
; n → 3n + 1 (n is odd)

; Using the rule above and starting with 13, we generate the following sequence:
; 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

; It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms.
; Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

; Which starting number, under one million, produces the longest chain?
; NOTE: Once the chain starts the terms are allowed to go above one million.

(defn collatz_count [n]
  (loop [total 1 n n]
    (if (= 1 n)
      total
      (recur
        (inc total)
        (if (even? n) (quot n 2) (inc (* 3 n)))))))

(defn longest_collatz_under [limit]
  (loop [best 1 best_start 1 current 1]
    (if (= current limit)
      best_start
      (let [current_count (collatz_count current)]
        (if (< best current_count)
          (recur current_count current (inc current))
          (recur best best_start (inc current)))))))

(print
  (longest_collatz_under 1000001))
; 837799
; count of 525
