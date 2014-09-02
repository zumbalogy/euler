; A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

; a^2 + b^2 = c^2
; For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
; There exists exactly one Pythagorean triplet for which a + b + c = 1000.
; Find the product abc.

(defn hit [a b]
  (let [c (Math/sqrt (+ (* a a) (* b b)))]
    (== 1000 (+ a b c))))


; (loop [a 0]
;   (loop [b a]
;     (let [c (+ (* a a) (* b b))])
;     ))



; (loop [x 10]
;   (when (> x 1)
;     (println x)
;     (recur (- x 2))))


;# 200
;# 375
;# 425
;# ==
;# 31_875_000


; a + b + c = 1000

; a + b + sqrt(a**2 + b**2) == 1000

; sqrt(a**2 + b**2) == 1000 - a - b

; a**2 + b**2 == (1000 - a - b) * (1000 - a - b)

; a**2 + b**2 == (1000 - a - b) ** 2


; ;;;;;;;;;;;;;;


; b**2 == ((1000 - a - b) ** 2) - a**2

; b == Math.sqrt(((1000 - a - b) ** 2) - a**2)


