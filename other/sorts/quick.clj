(defn quick_sort [input]
  (let [pivot (first input)]
    (if (> 2 (count input))
      input
      (concat
        (quick_sort (filter #(> pivot %) input))
        (filter #(= pivot %) input)
        (quick_sort (filter #(< pivot %) input))))))

(println (quick_sort '(1 2 3)))
(println (quick_sort '(3 2 1)))
(println (quick_sort '(1 4 2 3 9 100 0)))
