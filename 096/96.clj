; Su Doku (Japanese for 'number place') is the name of a popular puzzle.
; Its origin is unclear but Leonhard Euler invented a similar, harder,
; puzzle called Latin Squares.
;
; The goal of Su Doku is to replace the blanks (or zeros) in a 9x9 grid in
; such that each row, column, and 3x3 box contains each of the digits 1-9.
;
; A proper Su Doku puzzle has a unique solution and is solvable by logic,
; although it may be necessary to employ "guess and test" methods.
;
; The file sudoku.txt contains 50 Su Doku puzzles ranging in difficulty.
; Find the sum of the 3-digit numbers in the top left corner of each solution.

(def cells (atom []))
(def score (atom 0))

(defn init-cell [cell]
  (if (= cell 0)
    0
    (bit-xor
      2r111111111
      (Math/pow 2 (dec cell)))))

(defn init-cells [input-grid]
  (reset! cells (map init-cell input-grid)))

(defn solution [is-not]
  (when (= 2r111111111 (bit-or is-not (inc is-not)))
    (bit-xor 2r111111111 is-not)))

(defn col-rest [idx]
  (let [offset (mod idx 9)
        foo (quot idx 9)
        all [0 9 18 27 36 45 54 63 72]
        indexes (concat (take foo all)
                        (nthrest all (inc foo)))]
    (mapv (drop offset @cells) indexes)))

(defn row-rest [idx]
  (let [offset (* 9 (quot idx 9))
        all (range offset (+ 9 offset))
        foo (- idx offset)
        indexes (concat (take foo all)
                        (nthrest all (inc foo)))]
    (mapv @cells indexes)))

(defn grid-rest [idx]
  (let [col (mod idx 9)
        row (quot idx 9)
        grid (+ (* 3 (quot row 3))
                (quot col 3))
        offset (+ (* 27 (quot grid 3))
                  (* 3 (mod grid 3)))
        all [0 1 2 9 10 11 18 19 20]
        foo (- idx offset)
        indexes (concat (take foo all)
                        (nthrest all (inc foo)))]
    (mapv (drop offset @cells) indexes)))


(defn peerify [cell]
  (if (= 2r111111111 (bit-or cell (inc cell)))
   (bit-xor 2r111111111 cell)
   cell))

(defn peers-solutions [peers]
  (reduce peerify 0 peers))

(defn cell-calc [index]
  (if (solution (nth cells index))
    (swap! score inc)
    (let [c-rest (col-rest index)
          r-rest (row-rest index)
          g-rest (grid-rest index)
          sol (peers-solution (concat c-rest r-rest g-rest))]
      (if (= sol 2r111111111)
        "backout"
        (let [is-maybe (bit-xor 2r111111111 (nth @cells index))]
          (if (= 0 (bit-and is-maybe (dec is-maybe)))
            (swap! score inc)
            ()))))))



































;






































;

























;
