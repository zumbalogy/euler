; Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

; How many such routes are there through a 20×20 grid?

(defn factorial [input]
  (reduce *' (range 2 (inc input))))

(defn combination [from takes]
  (/ (factorial from) (*' (factorial takes) (factorial (- from takes))))
)

(print (combination 40 20))
; 137846528820N
