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
;
; -------
; It seems like number subsitutions have to be 0-9 for a letter, and no letters allowed to map to same value
; so all words with over 10 different letters are disqualified.

(def words (re-seq #"\w+" (slurp "words.txt")))

(def raw-anagrams (filter #(< 1 (count %)) (map last (group-by sort words))))
; this has one triplet

(defn make-pairs [n]
  (vec (set
    (filter #(apply not= %)
      (for [a n b n] (sort [a b]))))))

(def anagrams (mapcat make-pairs raw-anagrams))

(defn digit-anagram? [a b]
  (and (not= a b) (= (sort (str a)) (sort (str b)))))

; this should handle words with multiple of the same letter. right now CENTRE/RECENT (2 1 4 5 0 1), which is ok, but if multiple
; duplicates, it will be ambiguous i think
(defn anagram->code [raw-a raw-b]
  (let [a (str raw-a)
        b (str raw-b)]
    (map #(.indexOf b (str %)) a)))

(def coded-words (apply hash-map (mapcat (fn [n] [(apply anagram->code n) n]) anagrams)))

(def word-codes (map first coded-words))

(def squares (map #(* % %) (range)))

(defn square? [n]
  (let [h (bit-and n 0xF)]
    (when (or (= h 0) (= h 1) (= h 4) (= h 9))
      (let [t (int (Math/sqrt n))]
        (= n (* t t))))))

(defn reverse-digits [n]
  ()) ; quot them out of n and multiply into an output in reverse order


(def anagram-squares (filter #(square? (read-string (apply str (reverse (str %))))) squares))

; (println coded-words)

(assert (square? 9))
(assert (square? 9))
(assert (square? 25))
(assert (square? 16))
(assert (square? 36))
(assert (square? 100))
(assert (square? 1296))
(assert (square? 9216))
(assert (not (square? 9217)))
(assert (not (square? 99)))
(assert (not (square? 101)))
(assert (not (square? 6)))
(assert (not (square? 17)))

(time (doall (map square? (range 1000000))))
(time (doall (map square? (range 1000010))))


(println "//////////////")
