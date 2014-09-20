(require '[clojure.pprint :as pp])

; By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

; 3
; 7 4
; 2 4 6
; 8 5 9 3

; That is, 3 + 7 + 4 + 9 = 23.

; Find the maximum total from top to bottom of the triangle below:

(def array [
           [75]
           [95 64]
           [17 47 82]
           [18 35 87 10]
           [20  4 82 47 65]
           [19  1 23 75  3 34]
           [88  2 77 73  7 63 67]
           [99 65  4 28  6 16 70 92]
           [41 41 26 56 83 40 80 70 33]
           [41 48 72 33 47 32 37 16 94 29]
           [53 71 44 65 25 43 91 52 97 51 14]
           [70 11 33 28 77 73 17 78 39 68 17 57]
           [91 71 52 38 17 14 91 43 58 50 27 29 48]
           [63 66  4 68 89 53 67 30 73 16 69 87 40 31]
           [ 4 62 98 27 23  9 70 98 73 93 38 53 60  4 23]])

(def bigarray (->> (range 1 25)
                   (map (fn [x] (vec (take x (repeatedly #(rand-int 101))))))
                   vec))

;(def bigarray (-> (for [i (range 1 100)]
 ;                   (vec (take i (repeatedly #(rand-int 101)))))
  ;                vec))

;(def bigarray (vec
 ;               (for [i (range 1 100)]
  ;                (vec (take i (repeatedly #(rand-int 101)))))))




(defn build-node [head left-child right-child]
  [head left-child right-child])

(defn build-nodes [bottom top]
  (map build-node top bottom (rest bottom)))

(defn build-tree [array]
  (first (reduce build-nodes (first array) (rest array))))

(def headn #(nth % 0))
(def leftn #(nth % 1))
(def rightn #(nth % 2))

(def built (build-tree (reverse bigarray)))

(defn greatest-path [node]
  (if-not (number? node)
    (+ (headn node)
       (max (greatest-path (leftn node))
            (greatest-path (rightn node))))
    node))

(def greatest-path2 (memoize (fn [node]
  (if-not (number? node)
    (+ (headn node)
       (max (greatest-path (leftn node))
            (greatest-path (rightn node))))
    node))))

(time
  (-> built
      greatest-path))


(time
  (-> built
      greatest-path2))

(-> bigarray
    reverse
    build-tree
    greatest-path
    pp/pprint)

(defn add_cells [top down1 down2]
  (+ top (max down1 down2)))

(defn add_rows [bottom top]
  (map add_cells top bottom (rest bottom)))

(defn reduce_triangle [array]
  (reduce add_rows (first array) (rest array)))

(time (reduce_triangle (reverse bigarray)))
; (1074)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; on one line

(reduce (fn [low high] (map (fn [a b c] (+ a (max b c))) high low (rest low))) (first array) (rest array))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; one line with shorter syntax

(reduce (fn [low high] (map #(+ %1 (max %2 %3)) high low (rest low))) (first array) (rest array))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defn add_rows [top bottom]
  (map #(+ %1 (max %2 %3)) top bottom (rest bottom)))

(defn sum_triangle [array]
  (loop [i (- (count array) 2) running_array (last array)]
    (if (< i 0)
      (print running_array)
      (recur (dec i) (add_rows (nth array i) running_array)))))

(sum_triangle array)

(defn fib-naive [n]
  (if (or (zero? n) (= 1 n))
    1
    (+ (fib-naive (- n 1)) (fib-naive (- n 2)))))

(def fib-memo (memoize (fn [n]
  (if (or (zero? n) (= 1 n))
    1
    (+ (fib-memo (- n 1)) (fib-memo (- n 2)))))))

(prn "fib-memo")
(time (fib-memo 3))
(time (fib-memo 6))
(time (fib-memo 10))
(time (fib-memo 15))
(time (fib-memo 20))
(time (fib-memo 25))
(time (fib-memo 44))

(prn "fib-naive")
(time (fib-naive 3))
(time (fib-naive 6))
(time (fib-naive 10))
(time (fib-naive 15))
(time (fib-naive 20))
(time (fib-naive 25))
(time (fib-naive 44))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; TODO: impliment a solution using zippers



