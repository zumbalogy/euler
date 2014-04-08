;; What is the 10 001st prime number? (not including one)


(defn is_prime [input]
  (== (for [x (range 1 (/ input 2))
            :when (== (mod input x) 0)] x) 1 ) )
;; go to sqaure of the input


(def x 4)

(is_prime x)

