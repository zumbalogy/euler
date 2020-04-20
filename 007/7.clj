; What is the 10 001st prime number?

(defn prime? [n]
  ; gives true for 1, false for 2
  (and (odd? n)
       (not-any? #(zero? (rem n %))
                 (range 3
                        (inc (Math/sqrt n))
                        2))))

(println
  (nth (filter prime? (range)) 10000))
; 104743
