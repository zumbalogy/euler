; The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

; Find the sum of all the primes below two million.

(defn primes-until [n]
  (let [bs (boolean-array n true)]
    (doseq [i (range 2 (Math/sqrt n))]
      (when (nth bs i)
        (doseq [x (range (* i i) n i)]
          (aset-boolean bs x false))))
      (drop 2 (keep-indexed #(when %2 %1) bs))))

(println
  (reduce + (primes-until 2000000)))
; 142913828922
; Note: half the time (about 500ms for me) is spent doing the keep-indexed
