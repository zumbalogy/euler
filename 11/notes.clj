; What is the greatest product of four adjacent numbers in the same direction (up down left right diagonally) in the 20×20 grid?

(def grid [[ 8  2 22 97 38 15  0 40  0 75  4  5  7 78 52 12 50 77 91  8]
           [49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48  4 56 62  0]
           [81 49 31 73 55 79 14 29 93 71 40 67 53 88 30  3 49 13 36 65]
           [52 70 95 23  4 60 11 42 69 24 68 56  1 32 56 71 37  2 36 91]
           [22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80]
           [24 47 32 60 99  3 45  2 44 75 33 53 78 36 84 20 35 17 12 50]
           [32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70]
           [67 26 20 68  2 62 12 20 95 63 94 39 63  8 40 91 66 49 94 21]
           [24 55 58  5 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72]
           [21 36 23  9 75  0 76 44 20 45 35 14  0 61 33 97 34 31 33 95]
           [78 17 53 28 22 75 31 67 15 94  3 80  4 62 16 14  9 53 56 92]
           [16 39  5 42 96 35 31 47 55 58 88 24  0 17 54 24 36 29 85 57]
           [86 56  0 48 35 71 89  7  5 44 44 37 44 60 21 58 51 54 17 58]
           [19 80 81 68  5 94 47 69 28 73 92 13 86 52 17 77  4 89 55 40]
           [ 4 52  8 83 97 35 99 16  7 97 57 32 16 26 26 79 33 27 98 66]
           [88 36 68 87 57 62 20 72  3 46 33 67 46 55 12 32 63 93 53 69]
           [ 4 42 16 73 38 25 39 11 24 94 72 18  8 46 29 32 40 62 76 36]
           [20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74  4 36 16]
           [20 73 35 29 78 31 90  1 74 31 49 71 48 86 81 16 23 57  5 54]
           [ 1 70 54 71 83 51 54 69 16 92 33 48 61 43 52  1 89 19 67 48]])

(defn diagonal [grid]
  (apply map vector
    (map-indexed #(drop %1 %2) grid)))

(defn products [row]
  (map #(apply * %)
    (partition 4 1 row)))

(defn diag_products [grid]
  (map #(apply * %)
    (mapcat diagonal (partition 4 1 grid))))

(def grid_products
  (concat
    (map products grid)
    (map products (apply map vector grid))
    (diag_products grid)
    (diag_products (reverse grid))))

(time
  (reduce max (flatten grid_products)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; logic/code from friend

(defn diagonals [cols]
  (apply map vector
    (map-indexed #(drop %1 %2) cols)))

(def runs
  (concat
    (mapcat #(partition 4 1 %) grid)
    (mapcat #(partition 4 1 %) (apply map vector grid))
    (mapcat diagonals (partition 4 1 grid))
    (mapcat diagonals (partition 4 1 (reverse grid)))))

(time
  (reduce max (map #(apply * %) runs)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn products [input]
  (map #(apply * %)
    (partition 4 1 (keep identity input))))

(def adjacents
  (apply concat grid
    (for [i (range 20)]
      (conj []
        (for [x (range 20)] (get (get grid       x)       i))
        (for [x (range 20)] (get (get grid       x)  (+ x i)))
        (for [x (range 20)] (get (get grid       x)  (- x i)))
        (for [x (range 20)] (get (get grid (- 19 x)) (+ x i)))
        (for [x (range 20)] (get (get grid (- 19 x)) (- x i)))))))

(time
  (reduce max (flatten (map products adjacents))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn diagonal [grid]
  (apply map vector
    (map-indexed #(drop %1 %2) grid)))

(defn diagonals [grid]
  (mapcat diagonal
    (partition 4 1 grid)))

(defn products [row]
  (map #(apply * %)
    (partition 4 1 row)))

(def grid_products
  (map products
    (concat
      grid
      (apply map vector grid)
      (diagonals grid)
      (diagonals (reverse grid)))))

(time
  (reduce max (flatten grid_products)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn products [input]
  (map #(apply * %) (partition 4 1 input)))

(def adjacents
  (apply map list
    (for [x (range 20) y (range 20)]
      [(get-in grid [x y])
       (get-in grid [y x])
       (get-in grid [y (+ y x)] 0) ; zeros as default values, so that any off-map stuff gets killed
       (get-in grid [(- 19 y) (- y x)] 0)])))

; or can filter out ones with nils. this way is more explicit i guess, though needs a bit more code.
; i am unsure as to what one to prefer. what is better?:
; 1) requiring more understanding of this code,
; 2) requiring more understaing of clojure
; 3) requiring more understanding of the problem/domain
; 4) requiring more understanding of computer science stuff?

; this is kind of a case of (1|2) vs 3. maybe 'understanding' could be swapped out for
; entwining. as in, in general, i can marry this code more to clojure, more to my other code,
; more to cs, etc.

; in this situation, one does not seem more perfomant or maintainable or testable than the other


(defn products [input]
  (->> (partition 4 1 input)
       (filter #(every? identity %))
       (map #(apply * %))))

(def adjacents
  (apply map list
    (for [x (range 20) y (range 20)]
      [(get-in grid [x y])
       (get-in grid [y x])
       (get-in grid [y (+ y x)])
       (get-in grid [(- 19 y) (- y x)])])))
