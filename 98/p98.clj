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

(defn make-pairs [n]
  (vec (set
    (filter #(apply not= %)
      (for [a n b n] (sort [a b]))))))

(defn anagram->code [a b]
  (map #(.indexOf (str b) (str %)) (str a)))

; https://burningmath.blogspot.com/2013/09/how-to-check-if-number-is-perfect-square.html
; https://stackoverflow.com/questions/295579/fastest-way-to-determine-if-an-integers-square-root-is-an-integer
(defn square? [n]
  (let [h (bit-and n 0xF)
        t (int (Math/sqrt n))]
    (when (or (= h 0) (= h 1) (= h 4) (= h 9))
      (= n (* t t)))))

(defn transform [n code]
  (let [digits (map #(Character/digit % 10) (str n))
        out (map #(nth digits %) code)]
    (when (and (every? identity out)
               (not= (apply str out) (str n))
               (pos? (first out)))
      (read-string (apply str out))))) ; might be faster to try/catch or maybe dont use read-string

(defn sym-freqs [n]
  (sort (map last (frequencies (str n)))))

(defn digit-count [n]
  (inc (int (Math/log10 n))))

(defn get-sq-anagrams [[code words]]
  (->>
      ;  (range (int (Math/sqrt (Math/pow 10 (dec (count code))))) (Math/sqrt (Math/pow 10 (count code))))
      ;  (range 1 (Math/sqrt (Math/pow 10 (count code))))
      (range (Math/sqrt (Math/pow 10 (count code))))
      (drop (int (Math/sqrt (Math/pow 10 (dec (count code))))))
       (map #(* % %))
      ;  (drop-while #(> (count code) (digit-count %)))
      ;  (take-while #(= (count code) (digit-count %)))
       (filter #(= (sym-freqs (first words)) (sym-freqs %)))
       (map #(list (transform % code) %))
       (filter first)
       (filter (comp square? first))))

(def words (re-seq #"\w+" (slurp "words.txt")))

(def raw-anagrams (filter #(< 1 (count %)) (map last (group-by sort words))))
; this has one triplet

(def anagrams (mapcat make-pairs raw-anagrams))

(def coded-words (apply hash-map (mapcat (fn [n] [(apply anagram->code n) n]) anagrams)))

(time
  (apply max (flatten (map get-sq-anagrams coded-words))))
; 18769
(println
  (apply max (flatten (map get-sq-anagrams coded-words))))
