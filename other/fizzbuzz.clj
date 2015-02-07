(defn fb [x]
  (if (= 0 (mod x 15))
    "Fizzbuzz"
    (if (= 0 (mod x 3))
      "Buzz"
      (if (= 0 (mod x 5))
        "Fizz"
        x))))

(defn fb2 [x]
  (cond
    (= 0 (mod x 15)) "Fizzbuzz"
    (= 0 (mod x 3)) "Buzz"
    (= 0 (mod x 5)) "Fizz"
    :else x))

(map fb (vec (range 1 100)))
