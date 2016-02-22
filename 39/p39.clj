; P is the perimeter of a right angle triangle with integral length sides, {a, b, c}.
; There are three solutions for p = 120.

; {20, 48, 52}, {24, 45, 51}, {30, 40, 50}

; For which value of p ≤ 1000, is the number of solutions maximised?

(defn make-c [a b]
  (Math/sqrt (+ (* a a) (* b b))))

(defn valid-tri? [p a b]
  (== p (+ a b (make-c a b))))

(defn tris-of-p-a [p a]
  (let [b-range (range a (/ (- p a) 2))]
    (filter #(valid-tri? p a %) b-range)))

(defn tris-of-perimeter [p]
  (let [a-range (range 1 (/ p 3))]
    (count (mapcat #(tris-of-p-a p %) a-range))))

(defn max-tri-count [limit]
  (let [counts (map tris-of-perimeter (range limit))]
    (.indexOf counts (apply max counts))))

(println
  (max-tri-count 1001))
; 840
