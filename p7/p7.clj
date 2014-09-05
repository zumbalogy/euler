;; What is the 10 001st prime number? (not including one)

(defn is_prime [input]
  (if (even? input)
    false
    (= [1]
       (for [x (range 1 (inc (Math/sqrt input)) 2)
               :when (== (mod input x) 0)] x))))
; gives true for 1, false for 2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(last (take 10001 (filter is_prime (range))))
; 104743

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(def prime_count (atom 0))
(def check_num (atom 0))

(while (> 10001 @prime_count)
  (do
    (swap! check_num inc)
    (if (is_prime @check_num)
      (swap! prime_count inc))))

; (print @check_num)
; 104743

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(loop [current 0 prime_count 0]
  (if (= prime_count 10001)
    (print (dec current))
    (recur
      (inc current)
      (if (is_prime current)
        (inc prime_count)
        prime_count))))

; 104743



