; The natural numbers below 10 that are multiples of 3 or 5 are 3, 5, 6 and 9.
; The sum of these multiples is 23.
; Find the sum of all the multiples of 3 or 5 below 1000.

(defvar output
  (- (+ (reduce #'+ (loop for n from 0 below 1000 by 3 collect n))
        (reduce #'+ (loop for n from 0 below 1000 by 5 collect n)))
     (reduce #'+ (loop for n from 0 below 1000 by 15 collect n))))

(format t "~D~%" output)
; 233168
