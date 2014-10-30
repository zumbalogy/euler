(defn flip [array]
  (if (< (first array) (last array))
    array
    (concat
      [(last array)]
      (drop-last (rest array))
      [(first array)])))

(defn comb [array width]
  (loop [idx 0 out array]
    (if (> idx (- (count array) width))
      out
      (recur
        (inc idx)
        (concat
          (take (dec idx) out)
          (flip (drop (dec idx) (take (+ width idx) out)))
          (drop (+ width idx) out))))))

(defn combsort [array]
  )
