; Consider the following two triangles. Triangle ABC contains the origin. Triangle XYZ does not.

; A(-340,495), B(-153,-910), C(835,-947)
; X(-175,41), Y(-421,-714), Z(574,-645)

; In triangles.txt, how many triangles (of 1000) contain the origin?

(defn origin-ray-intersects [[[x1 y1] [x2 y2]]]
  (and (or (<= y1 0 y2)
           (<= y2 0 y1))
       (< 0 (+ x1
               (* (/ (- 0 y1)
                     (- y2 y1))
                  (- x2 x1))))))

(defn tri_has_o [tri]
  (odd? (count (filter origin-ray-intersects tri))))

(defn make-triangles [line]
  (->> (clojure.string/split line #",")
       (map read-string)
       (partition 2)
       cycle
       (take 4)
       (partition 2 1)))

(def triangles
  (->> (slurp "triangles.txt")
       clojure.string/split-lines
       (map make-triangles)))

(println
  (count (filter tri_has_o triangles)))
; 228
