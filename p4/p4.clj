; look for the largest palindome number (9009) that
; is the product of 2 3-digit numbers.

(use '[clojure.string :only (join split)])

(defn is_pal [input]
  (= (str input) (join (reverse (str input)))))

(defn loop_check [input]
  (loop [x 999]
    (if (< 0 x)
      (if (is_pal (* x input))
        (* x input)
        (recur (dec x))))))

(loop [x 999 best 0]
  (if (< 0 x)
    (let [current (or (loop_check x) 0)]
      (recur (dec x) (max best current)))
    (print best)))

; 906609
; from 913 993
