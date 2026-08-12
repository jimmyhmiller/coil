(reduce + 0
  (map (fn [x] (* x x))
    (filter odd? (range 10))))
