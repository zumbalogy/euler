; P is the perimeter of a right angle triangle with integral length sides, {a, b, c}.
; There are three solutions for p = 120.
;
; {20, 48, 52}, {24, 45, 51}, {30, 40, 50}
;
; For which value of p ≤ 1000, is the number of solutions maximised?

(defn make-c [a b]
  (Math/sqrt (+ (* a a) (* b b))))

(defn perimeter-check [p a b]
  (== p (+ a b (make-c a b))))

(defn solutions [total]
  (let [a-range (range 1 (/ total 3))
        get-b-range #(range % (/ (- total %) 2))]
    (mapcat (fn [a]
              (filter #(perimeter-check total a %)
                       (get-b-range a)))
         a-range)))

(defn max-solution-count [limit]
  (let [counts (map (comp count solutions) (range limit))]
    (.indexOf counts (apply max counts))))

(println
  (max-solution-count 1001))
; 840
