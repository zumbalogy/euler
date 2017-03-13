(defn towers
  ([n]
    (towers n 1 2 3))
  ([n a b c]
    (if (= 1 n)
      [[a b]]
      (concat
        (towers (dec n) a c b)
        [[a b]]
        (towers (dec n) c b a)))))

(println (towers 1))
(println (towers 2))
(println (towers 3))

(time (towers 8))
(time (towers 16))
(time (towers 18))

(assert (= (towers 1) [[1 2]]))
(assert (= (towers 2) [[1 3] [1 2] [3 2]]))
(assert (= (towers 3) [[1 2] [1 3] [2 3] [1 2] [3 1] [3 2] [1 2]]))


;                                                             1.2
;                             1.3                             1.2                             3.2
;             1.2             1.3             2.3             1.2             3.1             3.2             1.2
;     1.3     1.2     3.2     1.3     2.1     2.3     1.3     1.2     3.2     3.1     2.1     3.2     1.3     1.2     3.2
; 1.2 1.3 2.3 1.2 3.1 3.2 1.2 1.3 2.3 2.1 3.1 2.3 1.2 1.3 2.3 1.2 3.1 3.2 1.2 3.1 2.3 2.1 3.1 3.2 1.2 1.3 2.3 1.2 3.1 3.2 1.2
