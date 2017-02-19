; The Fibonacci sequence is defined by the recurrence relation:
;
; Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
; Hence the first 12 terms will be:
; 1 1 2 3 5 8 13 21 34 55 89 144
;
; The 12th term, 114, is the first term to contain three digits.
;
; What is the first term in the Fibonacci sequence to contain 1000 digits?

(defn fibs [a b]
  (lazy-seq (cons a (fibs b (+' a b)))))

(def indexed-fib-counts
  (map-indexed (fn [i f] [i (count (str f))]) (fibs 1 1)))

(println
  (inc (ffirst (filter #(= 1000 (second %)) indexed-fib-counts))))
; 4782
; inc because project euler not indexing from 0
