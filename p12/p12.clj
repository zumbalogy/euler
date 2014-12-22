; The sequence of triangle numbers is generated by adding the natural numbers.
; The 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28.

; The first ten: 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

; Listing the factors of the first seven triangle numbers:
;  1: 1
;  3: 1,3
;  6: 1,2,3,6
; 10: 1,2,5,10
; 15: 1,3,5,15
; 21: 1,3,7,21
; 28: 1,2,4,7,14,28

; 28 is the first triangle number to have over five divisors.
; What is the first triangle number to have over five hundred divisors?

(defn triangle [n]
  (* n (/ (inc n) 2)))

(def triangles
  (map triangle (range)))

(defn sq_range [n]
  (range 1 (inc (Math/sqrt n))))

(defn mods_0? [base n]
  (zero? (mod base n)))

(defn factor_count [n]
  (* 2 (count (filter #(mods_0? n %) (sq_range n)))))

(print
  (first (filter #(< 500 (factor_count %)) triangles)))
; 76576500

