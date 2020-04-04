; A Pythagorean triplet is a set of three natural numbers, a < b < c, for which

; a^2 + b^2 = c^2
; For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2
; There is only one Pythagorean triplet for which a + b + c = 1000
; Find the product abc

(defn trip [a b]
  (let [c (Math/sqrt (+ (* a a) (* b b)))]
    (when (== 1000 (+ a b c))
      [a b c])))

(defn my-check [a]
  (some #(trip a %) (range a 500)))

(println
  (reduce * (some my-check (range))))
; 31875000
; 200 375 425
