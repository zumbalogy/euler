; Three distinct points plotted randomly on a Cartesian plane, for which -1000 ≤ x, y ≤ 1000, form a triangle.

; Consider the following two triangles:

; A(-340,495), B(-153,-910), C(835,-947)
; X(-175,41), Y(-421,-714), Z(574,-645)

; It can be verified that triangle ABC contains the origin, whereas triangle XYZ does not.

; Using triangles.txt, a 27K text file containing co-ordinates of one thousand "random" triangles,
; find the number of triangles which contain the origin.

(defn same_side_as_origin [[x1 y1] [x2 y2] [x3 y3]]
  (let [dy (- y1 y2)
        dx (if (= x1 x2) 0.001 (- x1 x2))
        m (/ dy dx)
        b (- y1 (* m x1))]
    (= (> 0 b)
       (> y3 (+ b (* m x3))))))

(defn tri_has_o [[p1 p2 p3]]
  (and
    (same_side_as_origin p1 p2 p3)
    (same_side_as_origin p2 p3 p1)
    (same_side_as_origin p3 p1 p2)))

(defn line_to_tri [line]
  (partition 2
    (map read-string (clojure.string/split line #","))))

(def triangles
  (->> "triangles.txt"
    slurp
    clojure.string/split-lines
    (map line_to_tri)))

(println
  (count (filter tri_has_o triangles)))
; 228
