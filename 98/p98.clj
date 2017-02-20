; By replacing each of the letters in the word CARE with 1, 2, 9, and 6 respectively, we form a square number: 1296 = 36^2.
; What is remarkable is that, by using the same digital substitutions, the anagram, RACE, also forms a square number: 9216 = 96^2.
;
; We shall call CARE/RACE a square anagram word pair and specify further that leading zeroes are not permitted,
; neither may a different letter have the same digital value as another letter.
;
; Using words.txt, a 16K text file containing nearly 2000 common English words, find all the square anagram word pairs.
; Aa palindromic word is NOT considered to be an anagram of itself.
;
; What is the largest square number formed by any member of such a pair?
;
; NOTE: All anagrams formed must be contained in the given text file.

(defn clean [input]
  (clojure.string/lower-case (re-find #"\w+" input)))

(def file (slurp "words.txt"))

(def raw-words (clojure.string/split file #","))

(def words (map clean words))

(def longest-word (apply max-key count words))
; responsibility, 14 letters

; seems like number subsitutions have to be 0-9 for a letter, and no letters allowed to map to same value
; so all words over length 10 are out
