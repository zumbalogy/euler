(defn qs [input]
  (let [pivot (first input)]
    (if (> 2 (count input))
      input
      (concat
        (qs (filter #(> pivot %) input))
        (filter #(= pivot %) input)
        (qs (filter #(< pivot %) input))))))

(println (qs '(1 2 3)))
(println (qs '(3 2 1)))
(println (qs '(1 4 2 3 9 100 0)))
(println (qs [27 234 39 27 1 4 2 9 36 8 3 0]))
