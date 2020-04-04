; Using names.txt, a file containing over five-thousand first names, begin by sorting it into alphabetical order. 
; Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

; For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. 
; So, COLIN would obtain a score of 938 × 53 = 49714.

; What is the total of the name scores in the file?

(require '[clojure.string :as str])

(defn clean [input]
  (str/lower-case (re-find #"\w+" input)))

(def names (sort (map clean (str/split (slurp "./names.txt") #","))))

(defn scoreLetter [c]
  (- (int (char c)) 96))

(defn scoreName [idx name]
  (* (inc idx) (reduce + (map scoreLetter name))))

(defn scoreAll [input]
  (reduce + (map-indexed scoreName input)))

(println 
  (scoreAll names))
; 871198282
