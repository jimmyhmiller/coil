;; Exact normalized Jolt expression for:
;; (let [xs (conj [1 2 3] 4)]
;;   (loop [i 0 acc 0]
;;     (if (= i (count xs)) acc
;;       (recur (+ i 1) (+ acc (nth xs i))))))
(module jolt-coil-m9-vector-loop)
(import "coil.scheme" :use *)
(import "jolt.coil.core-runtime" :use *)
(import "coil.primitive" :as primitive)

(display
  (let* ((xs (jolt-conj2 (jolt-vector3 1 2 3) 4)))
    (let* ((i 0) (acc 0))
      (let [(mut loop1$slot$i$cell) i (mut loop1$slot$acc$cell) acc]
        (loop
          (let [i (primitive/load loop1$slot$i$cell)
                acc (primitive/load loop1$slot$acc$cell)]
            (if (truthy? (jolt=2 i (jolt-count xs)))
              (break acc)
              (let [loop1$next$i$value (jolt-n+ i (mk-fixnum 1))
                    loop1$next$acc$value (jolt-n+ acc (jolt-nth xs i))]
                (primitive/store! loop1$slot$i$cell loop1$next$i$value)
                (primitive/store! loop1$slot$acc$cell loop1$next$acc$value)
                (continue)))))))))
(newline)
