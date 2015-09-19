; 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

; What is the sum of the digits of the number 2^1000?

(defn big-pow [n pow]
  (reduce *' (repeat pow n)))

(defn sum-digits [n]
  (reduce + (map #(read-string (str %)) (char-array (str n)))))

(println
  (sum-digits (big-pow 2 1000)))
; 1366
