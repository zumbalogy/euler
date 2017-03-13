(defn towers
  ([n]
    (towers n 1 2 3 []))
  ([n a b c out]
    (if (= 1 n)
      (conj out [a b])
      (concat
        (towers (dec n) a c b out)
        (concat [[a b]]
          (towers (dec n) c b a out))))))


(assert (= (towers 1) [[1 2]]))
(assert (= (towers 2) [[1 3] [1 2] [3 2]]))
(assert (= (towers 3) [[1 2] [1 3] [2 3] [1 2] [3 1] [3 2] [1 2]]))
