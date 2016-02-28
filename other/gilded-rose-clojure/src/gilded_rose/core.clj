(ns gilded-rose.core)

(def brie "Aged Brie")
(def vest "+5 Dexterity Vest")
(def elixir "Elixir of the Mongoose")
(def sulfuras "Sulfuras, Hand of Ragnaros")
(def passes "Backstage passes to a TAFKAL80ETC concert")

(defn change-item [item change]
  (merge item {:quality (+ change (:quality item))
               :sell-in (dec (:sell-in item))}))

(defn handle-concert [item]
  (let [quality (:quality item)
        sell-in (:sell-in item)]
    (change-item item (cond (<=   sell-in 0)  (- quality)
                            (<= 50 quality)   0
                            (<= 1 sell-in 5)  3
                            (<= 6 sell-in 10) 2
                            :else             1))))

(defn mapper [item]
  (let [name (:name item)
        quality (:quality item)
        sell-in (:sell-in item)]
    (cond
      (and (= name brie) (< quality 50))
        (change-item item 1)
      (= name passes)
        (handle-concert item)
      (or (= vest name) (= elixir name))
        (if (> 1 sell-in)
          (change-item item -2)
          (change-item item -1))
      :else item)))

(defn update-quality [items]
  (map mapper items))

(defn item [item-name sell-in quality]
  {:name item-name :sell-in sell-in :quality quality})

(defn update-current-inventory[]
  (let [inventory [(item vest     10 20)
                   (item brie     2  0)
                   (item elixir   5  7)
                   (item sulfuras 0  80)
                   (item passes   15 20)]]
    (update-quality inventory)))
