;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; another one line

((fn [f rows] (reduce (#(map f %2 %1 (rest %1))) rows)) (#(+ %1 (max %2 %3))) (reverse array))

; on one line

(reduce (fn [low high] (map #(+ %1 (max %2 %3)) high low (rest low))) (first array) (rest array))



; old solution

(defn add_rows [top bottom]
  (map #(+ %1 (max %2 %3)) top bottom (rest bottom)))

(defn sum_triangle [array]
  (loop [i (- (count array) 2) running_array (last array)]
    (if (< i 0)
      (print running_array)
      (recur (dec i) (add_rows (nth array i) running_array)))))

(sum_triangle array)








;;;;;;;;;;burr notes;;;;;;;

(require '[clojure.pprint :as pp])

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn fib-naive [n]
  (if (or (zero? n) (= 1 n))
    1
    (+ (fib-naive (- n 1)) (fib-naive (- n 2)))))

(def fib-memo (memoize (fn [n]
  (if (or (zero? n) (= 1 n))
    1
    (+ (fib-memo (- n 1)) (fib-memo (- n 2)))))))

(defpure fib [n]
  (if (or (zero? n) (= 1 n))
    1
    (+ (fib (- n 1)) (fib (- n 2)))))

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
