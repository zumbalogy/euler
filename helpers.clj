; currently not in use, just a list of things that i think might be convenient.

; (defn first-where [func x]
;   (first (filter func x)))

; better name would be ffilter

; some kinda serves this porpose if you want the change
; (defn first-from [func x]
;   ; (first (remove nil? (map func x))))
;   (some func x))


; ((comp first (filter even?)) [1 2 3])
; also works

; i wish == would not error when one side was nil, so maybe a === could do that

; != would maybe be a little nicer than not=

; + operator for conj, maybe += for atoms?

; for this project, a prime? fn would be nice

; this can only be implimented in cljs at moment as i understand, but regex being a function on strings, so
; (#"wo" "hello world") turns into (re-find #"wo" "hello world"), which returns the string it matches or nil

; i sometimes worry that with -> or ->>, i sometimes will maybe want to switch between threading first or last
; maybe if there was a ~> or something, that whenever it hit a symbor or raw number or something, it would switch
; to that

; (~> 0
;     (- 6)
;     :last
;     (- 18))

; would return 24
; or
;
; (~> 0
;     (- %% 6)
;     (- 18 %%))

; or maybe better, a x-> where you chain things, but every other one is a name. so like

; (x-> a 5
;   b inc
;   c (+ a))
;
; would return 11. but maybe thats kinda tangly. but it would be nice for commeting things out and logging them and such

; i guess as-> provides some this functionality.
; also i guess "let" is pretty much this, though let is lazy and non returning of last item

; sinstead of something like this:
; #(<= (digit-count %) (digit-count n))
; which could also be written as
; #(apply <= (map digit-count [% n]))
; maybe
; #(apply-jump <= digital-count % n)
; but thats kind of funny. maybe call it apply-with or apply-by but at least for an equality compariston it might be useful to have
; something like
;
; (defn eq-by [func & args]
;   (apply = (map func args)))

; having a *pwd* alias of (.getParent (clojure.java.io/file *file*)) would maybe be nice
