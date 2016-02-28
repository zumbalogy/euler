(ns gilded-rose.core)

(defn mapper-one [item]
  (if (not= "Sulfuras, Hand of Ragnaros" (:name item))
    (merge item {:sell-in (dec (:sell-in item))})
    item))

(defn mapper-two [item]
  (cond
    (and (neg? (:sell-in item)) (= "Backstage passes to a TAFKAL80ETC concert" (:name item)))
      (merge item {:quality 0})
    (or (= (:name item) "Aged Brie") (= (:name item) "Backstage passes to a TAFKAL80ETC concert"))
      (if (and (= (:name item) "Backstage passes to a TAFKAL80ETC concert") (>= (:sell-in item) 5) (< (:sell-in item) 10))
        (merge item {:quality (+ 2 (:quality item))})
        (if (and (= (:name item) "Backstage passes to a TAFKAL80ETC concert") (>= (:sell-in item) 0) (< (:sell-in item) 5))
          (merge item {:quality (+ 3 (:quality item))})
          (if (< (:quality item) 50)
            (merge item {:quality (inc (:quality item))})
            item)))
    (neg? (:sell-in item))
      (if (= "Backstage passes to a TAFKAL80ETC concert" (:name item))
        (merge item {:quality 0})
        (if (or (= "+5 Dexterity Vest" (:name item)) (= "Elixir of the Mongoose" (:name item)))
          (merge item {:quality (- (:quality item) 2)})
          item))
    (or (= "+5 Dexterity Vest" (:name item)) (= "Elixir of the Mongoose" (:name item)))
      (merge item {:quality (dec (:quality item))})
    :else item))

(defn update-quality [items]
  (map mapper-two (map mapper-one items)))

(defn item [item-name sell-in quality]
  {:name item-name :sell-in sell-in :quality quality})

(defn update-current-inventory[]
  (let [inventory [(item "+5 Dexterity Vest" 10 20)
                   (item "Aged Brie" 2 0)
                   (item "Elixir of the Mongoose" 5 7)
                   (item "Sulfuras, Hand Of Ragnaros" 0 80)
                   (item "Backstage passes to a TAFKAL80ETC concert" 15 20)]]
    (update-quality inventory)))
