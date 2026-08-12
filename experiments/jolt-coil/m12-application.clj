(let [xs      [1 2 3 4]
      squares (map (fn [x] (* x x)) xs)
      total   (reduce + 0 squares)
      result  {:total total
               :label (str "sum=" total)}]
  (println (get result :label))
  (get result :total))
