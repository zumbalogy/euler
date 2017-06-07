; Consider the following two triangles. Triangle ABC contains the origin. Triangle XYZ does not.

; A(-340,495), B(-153,-910), C(835,-947)
; X(-175,41), Y(-421,-714), Z(574,-645)

; In triangles.txt, how many triangles (of 1000) contain the origin?

(defn o-ray-intersects? [[[x1 y1] [x2 y2]]]
  (and (or (< y1 0 y2)
           (> y1 0 y2))
       (-> (/ (- y1) (- y2 y1))
           (* (- x2 x1))
           (+ x1)
           pos?)))

(defn has-o? [shape]
  (odd? (count (filter o-ray-intersects? shape))))

(defn make-shape [[x1 y1 :as points]]
  (->> (concat points [x1 y1])
       (partition 2)
       (partition 2 1)))

(def triangles
  (->> (slurp "triangles.txt")
       clojure.string/split-lines
       (map #(clojure.string/split % #","))
       (map #(map read-string %))
       (map make-shape)))

(println
  (count (filter has-o? triangles)))
; 228
