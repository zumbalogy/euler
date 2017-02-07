; The sequence of triangle numbers is generated by adding the natural numbers.
; The 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28.

; The first 10: 1, 3, 6, 10, 15, 21, 28, 36, 45, 55
; Listing the factors of the first 8 triangle numbers:
;  1: 1
;  3: 1,3
;  6: 1,2,3,6
; 10: 1,2,5,10
; 15: 1,3,5,15
; 21: 1,3,7,21
; 28: 1,2,4,7,14,28
; 36: 1,2,3,4,6,9,12,18,36

; 28 is the first triangle number to have over 5 divisors.
; What is the first triangle number to have over 500 divisors?

; NOTE: number of divisors of N is related to the prime factorization of N.
; N=24 = 2 2 2 3 = [1,2,3,4,6,8,12,24] = 8 = 2^3,3^1 = (3+1)x(1+1) = 4x2

(defn triangle [x]
  (* (inc x) (/ x 2)))

(defn take-until-sq [x lst]
  (take-while #(<= (* % %) x) lst))

(def primes
  (lazy-seq (concat [2 3]
    (filter
      (fn [x]
        (not-any? #(= 0 (rem x %))
          (take-until-sq x primes)))
      (drop 5 (range))))))

(defn factors [x]
  (loop [n x i-primes primes results []]
    (let [i (first i-primes)]
      (if (zero? (rem n i))
        (if (= n i)
          (conj results n)
          (recur (quot n i) i-primes (conj results i)))
        (recur n (rest i-primes) results)))))

(def factors (memoize factors))

; (let [last-factor (atom [])]
;   (defn tri-factors [x]
;     (if (even? x)
;       (let []
;         (concat (factors (inc x)) (factors (/      x  2))))
;       (let []
;         (concat (factors      x)  (factors (/ (inc x) 2))))))

(let [last-factors (atom [])]
  (defn tri-factors [x]
    (if (even? x)
      (let [new-factors (factors (inc x))
            output (concat new-factors @last-factors)]
        (reset! last-factors new-factors)
        output)
      (let [new-factors (factors (/ (inc x) 2))
            output (concat @last-factors new-factors)]
          (reset! last-factors new-factors)
          output))))

(defn count-factors [x]
  (reduce
    (fn [a [_ b]] (* a (inc b)))
    1
    (frequencies (tri-factors x))))

; (println
;   (second (first (filter #(< 500 (first %)) (pmap (juxt count-factors identity) (range 3 9999999))))))
; 76576500
; the 12375 triangle number, has 576 factors

; (time (nth primes 1475))
; (time (last (map factors (range 3 12376))))
; (time (last (map tri-factors (range 3 12376))))
; (time (last (map count-factors (range 3 12376))))
;
(time (second (first (filter #(< 500 (first %)) (map (juxt count-factors identity) (drop 3 (range)))))))
(println (second (first (filter #(< 500 (first %)) (map (juxt count-factors identity) (drop 3 (range)))))))

; "Elapsed time: 534.908748 msecs"

; "Elapsed time: 347.574188 msecs"

; around 116ms of that is on prime generation, ;;;;;;;@@@ nvmd, less than that




;
