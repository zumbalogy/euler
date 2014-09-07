; Three distinct points are plotted at random on a Cartesian plane, for which -1000 ≤ x, y ≤ 1000, such that a triangle is formed.

; Consider the following two triangles:

; A(-340,495), B(-153,-910), C(835,-947)

; X(-175,41), Y(-421,-714), Z(574,-645)

; It can be verified that triangle ABC contains the origin, whereas triangle XYZ does not.

; Using triangles.txt (right click and 'Save Link/Target As...'), a 27K text file containing the co-ordinates of one thousand "random" triangles, find the number of triangles for which the interior contains the origin.

; NOTE: The first two examples in the file represent the triangles in the example given above.

(defn same_side_as_origin [[x1 y1] [x2 y2] [x3 y3]]
  (let [ m (/ (- y2 y1) (- x2 x1))
         b (- y1 (* m x1))
         xrelation (+ b (* m x3))]
    (if (> 0 b)
      (> y3 xrelation)
      (< y3 xrelation))))
; would have to decide what you want to do when origin is the y-intercept (b)
