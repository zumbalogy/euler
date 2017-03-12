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

; https://burningmath.blogspot.com/2013/09/how-to-check-if-number-is-perfect-square.html
; https://stackoverflow.com/questions/295579/fastest-way-to-determine-if-an-integers-square-root-is-an-integer
(defn square? [n]
  (let [h (bit-and n 0xF)
        t (int (Math/sqrt n))]
    (when (or (= h 0) (= h 1) (= h 4) (= h 9))
      (= n (* t t)))))

(defn make-pairs [n]
  (vec (set
    (filter #(apply not= %)
      (for [a n b n] (sort [a b]))))))

(defn sym-freqs [n]
  (sort (map last (frequencies n))))

(defn anagram->code [[a b]]
  (map #(.indexOf (str b) (str %)) (str a)))

(defn transform [n code]
  (let [out (map #(nth (str n) %) code)]
    (when (not= \0 (first out))
      (Integer/parseInt (apply str out)))))

(defn get-sq-anagrams [code]
  (->> (range (Math/sqrt (Math/pow 10 (count code))))
       (drop (int (Math/sqrt (Math/pow 10 (dec (count code))))))
       (map #(* % %))
       (filter #(= (sym-freqs code) (sym-freqs (str %))))
       (map #(list (transform % code) %))
       (filter first)
       (filter (comp square? first))))

(def codes
  (->> (slurp "words.txt")
       (re-seq #"\w+")
       (group-by sort)
       (map last)
       (mapcat make-pairs)
       (map anagram->code)))

(println
  (apply max (flatten (map get-sq-anagrams codes))))
; 18769
