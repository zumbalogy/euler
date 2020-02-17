; Find the unique positive integer whose square has the form 1_2_3_4_5_6_7_8_9_0,
; where each “_” is a single digit.

(defn pfind [start stop step find-fn]
  (let [cores 8
        out (promise)
        chunk (quot (- stop start) cores)]
    (doall
      (for [core (range cores)]
        (future
          (let [a' (+ start (* core chunk))
                a (- a' (mod a' step))
                z (+ a (* (inc core) chunk))]
            (loop [i a]
              (if (find-fn i)
                (deliver out i)
                (when (<= i z)
                  (recur (+ i step)))))))))
   @out))

(defn check [x]
  (re-matches #"1.2.3.4.5.6.7.8.9.0" (str (* x x))))

(def start (int (Math/sqrt 1020304050607080900)))
; 1010101010

(def stop (int (Math/sqrt 1929394959697989990)))
; 1389026623

(println
  (pfind start stop 10 check))
; 1389019170

(shutdown-agents)
