;; Given a histogram (as a list of bar heights), how many units of water could it hold?
;; For example, a histogram [3 0 3] could hold 3 units. [2 0 0 3 0 6] could hold 7.

;;      |
;; |    |
;; |  | |
;; |__|_|

;; would be [3 0 0 2 0 4] and could hold 10 units.


(def histogram [0 1 0 2 1 0 1 3 2 1 2 1])

(defn count-single-water [idx col histo]
  (let [lefts (take idx histo)
        left (if-not (empty? lefts) (apply max lefts) 0)
        rights (drop (inc idx) histo)
        right (if-not (empty? rights) (apply max rights) 0)]
    (max 0 (- (min left right) col))))


(defn count-water [histo]
  (reduce + (map-indexed #(count-single-water %1 %2 histo) histo)))

(println (count-water histogram))
;; 6
