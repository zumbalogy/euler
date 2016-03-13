; Find the largest palindome number (9009) that
; is the product of 2 3-digit numbers.

(require '[clojure.string :as string])

(defn to-pal [n]
  (Integer. (str n (string/reverse (str n)))))

(defn pal-prod [n]
  (some #(and (== 0 (mod n %)) (< (/ n %) 1000)) (range 100 1000)))

(println (to-pal
  (first (filter #(pal-prod (to-pal %)) (reverse (range 1 1000))))))
; 906609
; from 913 993
