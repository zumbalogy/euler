; Find the largest palindome number (9009) that
; is the product of 2 3-digit numbers.

(use '[clojure.string :only [join split]])

(defn is-pal [input]
  (= (str input) (join (reverse (str input)))))

(defn loop-check [input]
  (some->> (reverse (range 100 1000))
           (filter #(is-pal (* % input)))
           first
           (* input)))

(println
  (apply max (remove nil? (map loop-check (range 99 1000)))))
; 906609
; from 913 993
