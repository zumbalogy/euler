; return the index of an element in a sorted, uniq, list

(defn b-search
  ([x lst]
   (b-search x lst 0))
  ([x lst i]
   (if (= x (first lst))
     i
     (if (> 2 (count lst))
       -1
       (let [mid-i (quot (dec (count lst)) 2)
             mid (nth lst mid-i)]
        (if (= mid x)
          (+ i mid-i)
          (if (< mid x)
            (b-search x (drop (inc mid-i) lst) (+ i 1 mid-i))
            (b-search x (take (inc mid-i) lst) i))))))))

(assert (= -1 (b-search 3 [])))
(assert (= -1 (b-search 3 [1])))
(assert (= -1 (b-search 3 [1 2])))
(assert (= -1 (b-search 3 [1 2 4 5])))

(assert (= 0 (b-search 1 [1])))
(assert (= 0 (b-search 1 [1 3])))
(assert (= 0 (b-search 1 [1 3 5])))
(assert (= 0 (b-search 1 [1 3 5 6 7 8 9 11 12])))

(assert (= 1 (b-search 3 [1 3])))
(assert (= 1 (b-search 3 [1 3 5])))
(assert (= 1 (b-search 3 [1 3 5 6 7 8 9 12])))
(assert (= 1 (b-search 3 [1 3 5 6 7 8 9 11 12])))

(assert (= 2 (b-search 3 [0 1 3])))
(assert (= 2 (b-search 3 [0 1 3 5])))
(assert (= 2 (b-search 3 [0 1 3 5 6 7 8 9 12])))
(assert (= 2 (b-search 3 [0 1 3 5 6 7 8 9 11 12])))

(let [lst [1 2 3 4 5 6 7 8 9 10]]
  (assert (= (dec (count lst))
             (b-search (last lst) lst))))

(let [lst [1 2 3 4 5 6 7 8 9 10 11]]
  (assert (= (dec (count lst))
             (b-search (last lst) lst))))

(println "good")
