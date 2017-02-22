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

; todo, maybe this shuld all be one threaded macro until words or anagrams

(defn clean [input]
  (clojure.string/lower-case (re-find #"\w+" input)))

; (def words (-> (slurp "words.txt")
;   ))

(def file (slurp "words.txt"))

(def raw-words (clojure.string/split file #","))

(def words (map clean raw-words))

(def raw-anagrams (filter #(< 1 (count %)) (map last (group-by sort words))))
; this has one triplet

(defn make-pairs [n]
  (vec (set
    (filter #(apply not= %)
      (for [a n b n] (sort [a b]))))))

(def anagrams (mapcat make-pairs raw-anagrams))

(def squares (map #(* % %) (range)))

(def digit-count (comp count str))

(defn digit-anagram? [a b]
  (and (not= a b) (= (sort (str a)) (sort (str b)))))

(defn sq-match [n]
  (first (filter #(digit-anagram? n %)
    (take-while #(<= (digit-count %) (digit-count n))
      squares))))

(def anagram-squares (filter last (map (juxt identity sq-match) squares)))

(defn anagram-map [raw-a raw-b]
  (let [a (str raw-a)
        b (str raw-b)]
    (map #(.indexOf b (str %)) a)))

; try pmapping and partition-pmapping
(def coded-squares (map (fn [n] [(apply anagram-map n) n]) anagram-squares))

(def coded-words (apply hash-map (mapcat (fn [n] [(apply anagram-map n) n]) anagrams)))

(def word-codes (map first coded-words))

(println coded-words)

; only need to take first half of squares with a ceritan digit, since sorted pairs, or, dont need to do the or with the reverse
(def word-sq-matches
  (keep
    (fn [n]
      (println (count n) n)
      (first (filter #(or (= n (first %)) (= n (reverse (first %))))
        (take-while #(do  (println n %) (>= (count n) (count (first %))))
          coded-squares))))
    word-codes))
    
(time
  (apply max (map (comp last last) word-sq-matches)))
