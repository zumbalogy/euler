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

(defn foo [x y] (+ x 1))
(defn bar [x y] (* x 2))

(defn tree [n]
    (reduce (fn [acc [f val]] (f acc val)) 
        1 (->> (vec (take n (range))) 
        (interleave (cycle [bar foo])) 
        (partition 2))))

(println (tree 5))
;; 14

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn tree2 [n]
    (loop [year n height 1]
        (if (= year 0) 
            height
            (if (odd? year)
                (recur (- year 1)(* 2 height))
                (recur (- year 1)(+ 1 height))))))

(println (tree2 5))
;; 14

