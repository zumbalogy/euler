
(defn fb [x] 
    (if (= 0 (mod x 15))
        "Fizzbuzz"
        (if (= 0 (mod x 3))
            "Buzz"
            (if (= 0 (mod x 5))
                "Fizz"
                x))))

(map fb (vec (range 1 100)))