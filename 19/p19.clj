; 1 Jan 1900 was a Monday.
; 30 days has September,
; April, June and November.
; All the rest have 31,
; Saving February alone,
; Which has 28, rain or shine.
; And on leap years, 29.

; A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
; How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

(def start {:date 1 :day 0 :month 0 :year 1900})

(defn tick-date [date month year]
  (let [month-day-count [31 (if (= 0 (mod year 4)) 29 28) 31 30 31 30 31 31 30 31 30 31]]
    (mod (inc date) (get month-day-count month))))

(defn tick [{date :date day :day month :month year :year}]
  (let [new-date (tick-date date month year)
        new-day (mod (inc day) 7)
        new-month (mod (if (= 0 new-date) (inc month) month) 12)
        new-year (if (and (= 0 new-date) (= 0 new-month)) (inc year) year)]
    {:date new-date :day new-day :month new-month :year new-year}))

(def century
  (filter #(< 1900 (:year %)) (take-while #(> 2001 (:year %)) (iterate tick start))))

(println
  (count (filter #(and (= 0 (:date %)) (= 6 (:day %))) century)))
; 171
