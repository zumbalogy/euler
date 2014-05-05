; The Utopian tree goes through 2 cycles every year. The first cycle of the tree is monsoon season when it doubles height. The 2nd cycle is summer when it grows height by 1 meter. 

; If a new Utopian tree sapling of height 1 meter is planted just before the onset of the monsoon season, find the height of a tree after N cycles.

; Input Format
; The first line of input contains integer T, the number of testcases. 
; T lines follow, each containing integer N, indicating the number of cycles.

; Constraints
; 1 <= T <= 10
; 0 <= N <= 60

; Output Format
; Print the height of the Utopian tree after N cycles.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn foo [x y] (+ x 1))
(defn bar [x y] (* x 2))

(defn tree [n]
    (reduce (fn [acc [f val]] (f acc val)) 
        1 (->> (vec (take n (range))) 
        (interleave (cycle [bar foo])) 
        (partition 2))))

(println (tree 5))
;; 14

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn tree2 [n]
    (loop [year n height 1]
        (if (= year 0) 
            height
            (if (odd? year)
                (recur (- year 1)(* 2 height))
                (recur (- year 1)(+ 1 height))))))

(println (tree2 5))
;; 14


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn tree [n]
    (reduce #(%2 %1) 
        1
        (take n
            (cycle [(partial *' 2) inc]))))

(println (tree 5))
;; 14

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn tree2 [n]
    ((apply comp 
        (take n  
            (interleave 
                (repeat (partial * 2)) 
                (repeat inc)))) 
    1))


(println (tree2 5))
;; 14


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defn growth-rings [cycle-n height]
    (lazy-seq
        (cons height
            (growth-rings (inc cycle-n) 
                (if (even? cycle-n) 
                    (* 2 height) 
                    (inc height))))))

(defn tree2 [n]
    (nth (growth-rings 0 1) n))

(println (tree2 5))
;; 14

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defn tree2 [n]
   (-> (iterate #(inc (* 2 %)) 1)
        (nth (/ (+ n (mod n 2)) 2))
        (#(if (odd? n) (dec %) %))))


(println (tree2 5))
;; 14

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn tree2 [n]
    (let [height (atom 1)]
        (dotimes [cycle-n n]
            (swap! height (if (even? cycle-n) 
                (partial * 2) 
                inc)))
    @height))

(println (tree2 5))
;; 14

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn tree2 [n]
    ((apply comp
        (take n
            (cycle [(partial * 2) inc])))
    1))

(println (tree2 5))
;; 14

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


