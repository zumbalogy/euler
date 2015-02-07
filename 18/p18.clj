; Start at the top of the triangle and move to adjacent numbers on the row below, the max sum is 23.

; 3
; 7 4
; 2 4 6
; 8 5 9 3

; That is, 3 + 7 + 4 + 9 = 23.

; Find the max sum from top to bottom of the triangle.

(def array [
           [75]
           [95 64]
           [17 47 82]
           [18 35 87 10]
           [20  4 82 47 65]
           [19  1 23 75  3 34]
           [88  2 77 73  7 63 67]
           [99 65  4 28  6 16 70 92]
           [41 41 26 56 83 40 80 70 33]
           [41 48 72 33 47 32 37 16 94 29]
           [53 71 44 65 25 43 91 52 97 51 14]
           [70 11 33 28 77 73 17 78 39 68 17 57]
           [91 71 52 38 17 14 91 43 58 50 27 29 48]
           [63 66  4 68 89 53 67 30 73 16 69 87 40 31]
           [ 4 62 98 27 23  9 70 98 73 93 38 53 60  4 23]])


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn rollup [f rows]
  (reduce #(map f %2 %1 (rest %1)) rows))

(print (rollup #(+ %1 (max %2 %3)) (reverse array)))
; (1074)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; TODO: impliment a solution using zippers

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defn add_cells [top down1 down2]
  (+ top (max down1 down2)))

(defn add_rows [bottom top]
  (map add_cells top bottom (rest bottom)))

(defn reduce_triangle [array]
  (reduce add_rows (first array) (rest array)))

(print (reduce_triangle (reverse array)))
; (1074)

