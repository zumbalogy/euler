; P is the perimeter of a right angle triangle with integral length sides, {a, b, c}.
; There are three solutions for p = 120.
;
; {20, 48, 52}, {24, 45, 51}, {30, 40, 50}
;
; For which value of p ≤ 1000, is the number of solutions maximised?

(defn solution_count [total]
  (let [output (atom 0)]
    (doseq [a (range 1  (/ total 3))]
      (doseq [b (range a (/ (- total a) 2))]
        (let [c (Math/sqrt (+ (* a a) (* b b)))]
          (when (== total (+ a b c))
            (swap! output inc)))))
  @output))

(defn max_solution_count [limit]
  (let [counts (map solution_count (range limit))]
    (.indexOf counts (apply max counts))))

(println
  (max_solution_count 1001))
; 840
