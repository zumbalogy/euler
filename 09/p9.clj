; A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

; a^2 + b^2 = c^2
; For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
; There exists exactly one Pythagorean triplet for which a + b + c = 1000.
; Find the product abc.

(defn first-from [func x]
  (first (remove nil? (map func x))))

(defn trip [a b]
  (let [c (Math/sqrt (+ (* a a) (* b b)))]
    (when (== 1000 (+ a b c))
      [a b c])))

(defn my-check [a]
  (first-from #(trip a %) (range a 500)))

(println
  (reduce * (first-from my-check (range 1 500))))
; # 31875000
; # 200 375 425
