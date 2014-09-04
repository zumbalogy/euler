; look for the largest palindome number (9009) that
; is the product of 2 3-digit numbers.

(use '[clojure.string :only (join split)])

(defn is_pal [input]
  (= (str input) (join (reverse (str input)))))

(def best (atom 0))

(defn loop_check [input]
  (loop [x 999]
    (when (< 0 x)
      (if (and
          (is_pal (* x input))
          (< @best (* x input)))
        (reset! best (* x input)))
      (recur (dec x)))))

(loop [x 999]
  (when (< 0 x)
    (loop_check x)
    (recur (dec x))))

(print @best)

; 906609
; from 913 993
