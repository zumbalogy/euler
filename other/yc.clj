; http://blog.klipse.tech/lambda/2016/08/07/almost-y-combinator-clojure.html

(((fn [f]
    (f f))
  (fn [func]
    (fn [n]
      (if (zero? n)
        1
        (* n ((func func) (dec n)))))))
 6)

; max

(defn my-max [lst]
  (let [a (first lst)
        b (nth lst 1)
        higher (if (> a b) a b)]
    (if (= 2 (count lst))
      higher
      (my-max (cons higher (rest (rest lst)))))))

(my-max [1 2 4 2 1])

(defn max-weird [func]
  (fn [lst]
    (let [a (first lst)
          b (nth lst 1)
          higher (if (> a b) a b)]
      (if (= 2 (count lst))
        higher
        ((func func)
          (cons higher (rest (rest lst))))))))

(def max-yc
  ((fn [f] (f f))
      (fn [func]
        (fn [lst]
          (let [a (first lst)
                b (nth lst 1)
                higher (if (> a b) a b)]
            (if (= 2 (count lst))
              higher
              ((func func)
                (cons higher (rest (rest lst))))))))))

(max-yc [1 2 3 5 4 3])

(def my-fact
  ((fn [f] (f f))
    (fn [func]
      (fn [n]
        (if (= 1 n)
          1
          (* n ((func func) (dec n))))))))

(my-fact 3)


(defn yc [proc]
  ((fn [f] (f f))
    (fn [func]
      (partial proc func))))

(defn yc [f]
  (#(% %) #(partial f %)))

(defn yc [f]
  (#(partial f %) #(partial f %)))

(def my-fact2
  (yc (fn [f n]
    (if (= 1 n)
      1
      (* n ((f f) (dec n)))))))

(my-fact2 3)


(def factorial-no-names
  ((fn [func]
     (fn [n]
       (if (zero? n)
         1
         (* n ((func func) (dec n))))))
   (fn [func]
     (fn [n]
       (if (zero? n)
         1
         (* n ((func func) (dec n))))))))

(factorial-no-names 13)

; https://rosettacode.org/wiki/Y_combinator#Clojure

(defn Y [f]
  ((fn [x] (x x))
   (fn [x]
     (f (fn [& args]
          (apply (x x) args))))))
 
(def fac
     (fn [f]
       (fn [n]
         (if (zero? n) 1 (* n (f (dec n)))))))
 
(def fib
     (fn [f]
       (fn [n]
         (condp = n
           0 0
           1 1
           (+ (f (dec n))
              (f (dec (dec n))))))))
              



