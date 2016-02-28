(ns gilded-rose.core)

(def concert "Backstage passes to a TAFKAL80ETC concert")

(defn mapper-one [item]
  (if (not= "Sulfuras, Hand of Ragnaros" (:name item))
    (merge item {:sell-in (dec (:sell-in item))})
    item))

(defn change-quality [item change]
  (merge item {:quality (+ change (:quality item))}))

(defn mapper-two [item]
  (let [name (:name item)
        quality (:quality item)
        sell-in (:sell-in item)]
    (cond
      (and (neg? sell-in) (= concert name))
        (merge item {:quality 0})
      (or (= name "Aged Brie") (= name concert))
        (if (and (= name concert) (< 4 sell-in 10))
          (change-quality item 2)
          (if (and (= name concert) (<= 0 sell-in 4))
            (change-quality item 3)
            (if (< quality 50)
              (change-quality item 1)
              item)))
      (neg? sell-in)
        (if (or (= "+5 Dexterity Vest" name) (= "Elixir of the Mongoose" name))
          (change-quality item -2)
          item)
      (or (= "+5 Dexterity Vest" name) (= "Elixir of the Mongoose" name))
        (change-quality item -1)
      :else item)))

(defn update-quality [items]
  (map mapper-two (map mapper-one items)))

(defn item [item-name sell-in quality]
  {:name item-name :sell-in sell-in :quality quality})

(defn update-current-inventory[]
  (let [inventory [(item "+5 Dexterity Vest" 10 20)
                   (item "Aged Brie" 2 0)
                   (item "Elixir of the Mongoose" 5 7)
                   (item "Sulfuras, Hand Of Ragnaros" 0 80)
                   (item concert 15 20)]]
    (update-quality inventory)))
