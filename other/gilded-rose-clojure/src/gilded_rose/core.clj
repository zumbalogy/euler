(ns gilded-rose.core)

(defn change-quality [item change]
  (merge item {:quality (+ change (:quality item))
               :sell-in (dec (:sell-in item))}))

(defn handle-concert [item]
  (let [quality (:quality item)
        sell-in (:sell-in item)]
    (cond
      (> 1 sell-in)
        (merge item {:quality 0})
      (<= 0 sell-in 5)
        (change-quality item 3)
      (<= 6 sell-in 10)
        (change-quality item 2)
      (< quality 50)
        (change-quality item 1)
      :else item)))

(defn mapper [item]
  (let [name (:name item)
        quality (:quality item)
        sell-in (:sell-in item)]
    (cond
      (and (= name "Aged Brie") (< quality 50))
        (change-quality item 1)
      (= name "Backstage passes to a TAFKAL80ETC concert")
        (handle-concert item)
      (or (= "+5 Dexterity Vest" name) (= "Elixir of the Mongoose" name))
        (if (> 1 sell-in)
          (change-quality item -2)
          (change-quality item -1))
      :else item)))

(defn update-quality [items]
  (map mapper items))

(defn item [item-name sell-in quality]
  {:name item-name :sell-in sell-in :quality quality})

(defn update-current-inventory[]
  (let [inventory [(item "+5 Dexterity Vest" 10 20)
                   (item "Aged Brie" 2 0)
                   (item "Elixir of the Mongoose" 5 7)
                   (item "Sulfuras, Hand Of Ragnaros" 0 80)
                   (item "Backstage passes to a TAFKAL80ETC concert" 15 20)]]
    (update-quality inventory)))
