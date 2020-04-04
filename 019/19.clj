; 1 Jan 1900 was a Monday.
; 30 days has September,
; April, June and November.
; All the rest have 31,
; Saving February alone,
; Which has 28, rain or shine.
; And on leap years, 29.

; A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
; How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

(defn tick-date [date month year]
  (let [feb (if (zero? (rem year 4)) 29 28)
        day-counts [31 feb 31 30 31 30 31 31 30 31 30 31]
        current (get day-counts month)]
    (rem (inc date) current)))

(defn tick [{day :day date :date month :month year :year}]
  (let [new-day (rem (inc day) 7)
        new-date (tick-date date month year)
        new-month (rem (if (zero? new-date) (inc month) month) 12)
        new-year (if (and (zero? new-date) (zero? new-month)) (inc year) year)]
    {:day new-day :date new-date :month new-month :year new-year}))

(def start {:day 0 :date 1 :month 0 :year 1900})

(def century
  (filter #(< 1900 (:year %))
    (take-while #(> 2001 (:year %)) (iterate tick start))))

(println
  (count (filter #(and (zero? (:date %)) (= 6 (:day %))) century)))
; 171
