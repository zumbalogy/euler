; Find the largest palindome number (9009) that
; is the product of 2 3-digit numbers.

(defn to-pal [n]
  (Integer. (str n (clojure.string/reverse (str n)))))

(defn valid-prod? [a b]
  (and (== 0 (rem a b))
       (> 1000 (/ a b))))

(defn has-valid [n]
  (some #(valid-prod? n %) (range 100 1000)))

(println
  (->> (reverse (range 1 1000))
       (filter #(has-valid (to-pal %)))
       first
       to-pal))
; 906609
; from 913 993
