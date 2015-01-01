; Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

; How many such routes are there through a 20×20 grid?

(defn factorial [input]
  (reduce *' input (range 1 input)))

(defn combination [a b]
  (let [a! (factorial a)
        b! (factorial b)
        a-b! (factorial (- a b))]
    (/ a! (*' b! a-b!))))

(print (combination 40 20))
; 137846528820N
