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
      (int (Math/pow 2 (dec cell))))))

(defn init-cells [input-grid]
  (reset! cells (mapv init-cell input-grid)))

(defn solution [is-not]
  (when (= 2r111111111 (bit-or is-not (inc is-not)))
    (bit-xor 2r111111111 is-not)))

(defn col-rest [idx]
  (let [offset (mod idx 9)
        foo (quot idx 9)
        all [0 9 18 27 36 45 54 63 72]
        indexes (concat (take foo all)
                        (nthrest all (inc foo)))]
    (map (vec (drop offset @cells)) indexes)))

(defn row-rest [idx]
  (let [offset (* 9 (quot idx 9))
        all (range offset (+ 9 offset))
        foo (- idx offset)
        indexes (concat (take foo all)
                        (nthrest all (inc foo)))]
    (map @cells indexes)))

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
    (mapv (vec (drop offset @cells)) indexes)))

(defn peerify [acc cell]
  (if (= 2r111111111 (bit-or cell (inc cell)))
   (bit-or acc (bit-xor 2r111111111 cell))
   acc))

(defn peers-solution [peers]
  (reduce peerify 0 peers))

(defn cell-calc-inner [rest index]
  (let [is-maybe (bit-xor 2r111111111 (nth @cells index))
        has-to-be (reduce bit-and is-maybe rest)]
    (when (not= 0 has-to-be)
      (if (not= 0 (bit-and has-to-be (dec has-to-be)))
       "backout"
       (do
         (swap! score inc)
         (swap! cells assoc index (bit-xor 2r111111111 has-to-be)))))))

(defn cell-calc [idx]
  (if (solution (nth @cells idx))
    (swap! score inc)
    (let [c-rest (col-rest idx)
          r-rest (row-rest idx)
          g-rest (grid-rest idx)
          sol (peers-solution (concat c-rest r-rest g-rest))]
      (if (= sol 2r111111111)
        "backout"
        (do
          (swap! cells assoc idx sol)
          (let [is-maybe (bit-xor 2r111111111 (nth @cells idx))]
            (if (= 0 (bit-and is-maybe (dec is-maybe)))
              (swap! score inc)
              (when (or (= "backout" (cell-calc-inner c-rest idx))
                        (= "backout" (cell-calc-inner g-rest idx))
                        (= "backout" (cell-calc-inner r-rest idx)))
                "backout"))))))))

(defn single-calc []
  (reset! score 0)
  (loop [i 0]
    (when (< i 81)
      (if (= "backout" (cell-calc i))
        "backout"
        (recur (inc i))))))

(defn repeat-calc []
  (loop [tally @score
         res (single-calc)]
    (if (= "backout" res)
      "backout"
      (when (not= tally @score)
        (recur @score (single-calc))))))

(defn solve [cell-index]
  (let [res (repeat-calc)]
    (when (and (not= @score 81) (not= res "backout"))
      (let [saved-cells @cells
            saved-score @score
            cell (nth @cells cell-index)
            guesses [2r111111110
                     2r111111101
                     2r111111011
                     2r111110111
                     2r111101111
                     2r111011111
                     2r110111111
                     2r101111111
                     2r011111111]]
        (loop [i 0]
          (when (< i (count guesses))
            (let [number-guess (nth guesses i)]
              (if (not= cell (bit-and cell number-guess))
                (recur (inc i))
                (do
                  (swap! cells assoc cell-index number-guess)
                  (solve (inc cell-index))
                  (when (not= 81 @score)
                    (reset! score saved-score)
                    (reset! cells saved-cells)
                    (recur (inc i))))))))))))

(def cell-key {2r011111111 9
               2r101111111 8
               2r110111111 7
               2r111011111 6
               2r111101111 5
               2r111110111 4
               2r111111011 3
               2r111111101 2
               2r111111110 1})

(def FILE (try (slurp "sudoku.txt")
               (catch Exception _ (slurp "096/sudoku.txt"))))

(defn read-row [input-str]
  (map #(Character/digit % 10) input-str))

(def puzzles
  (->> FILE
       clojure.string/split-lines
       (partition 10)
       (map rest)
       (map #(map read-row %))
       (map flatten)))

(defn corner [puzzle]
  (init-cells puzzle)
  (solve 0)
  (->> @cells
       (take 3)
       (map cell-key)
       (apply str)
       read-string))

(println
  (reduce + (map corner puzzles)))
; 24702
