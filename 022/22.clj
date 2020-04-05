; Sort names.txt, a file with over five-thousand first names, alphabetically.
; Work out the alphabetical value for each name, multiply the value by its
; alphabetical position in the list to obtain a name score.

; For example, when the list is sorted into alphabetical order,
; COLIN is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list.
; So, COLIN would obtain a score of 938 × 53 = 49714.

; What is the total of the name scores in the file?

(require '[clojure.string :as str])

(def FILE (try (slurp "names.txt")
               (catch Exception _ (slurp "022/names.txt"))))

(defn clean [input]
  (str/lower-case (re-find #"\w+" input)))

(def names (sort (map clean (str/split FILE #","))))

(defn score-letter [c]
  (- (int (char c)) 96))

(defn score-name [idx name]
  (* (inc idx) (reduce + (map score-letter name))))

(defn score-all [input]
  (reduce + (map-indexed score-name input)))

(println
  (score-all names))
; 871198282
