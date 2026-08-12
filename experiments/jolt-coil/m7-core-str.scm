;; Essential Jolt emission for:
;; (str "sum=" (loop [n 5 acc 0]
;;               (if (zero? n) acc (recur (- n 1) (+ acc n)))))
(module jolt-coil-m7-core-str)
(import "coil.scheme" :use *)
(import "jolt.coil.expression-runtime" :use *)
(import "jolt.coil.core-runtime" :use *)
(import "coil.scheme.stdproc" :as stdproc)
(import "coil.primitive" :as primitive)

(display
  (let* ((_a$4 (var-deref "clojure.core" "str"))
         (_a$5 "sum=")
         (_a$6
           (let* ((n 5) (acc 0))
             (let [(mut loop1$slot$n) n
                   (mut loop1$slot$acc) acc]
               (loop
                 (let [n (primitive/load loop1$slot$n)
                       acc (primitive/load loop1$slot$acc)]
                   (if (truthy? (jolt-zero? n))
                     (break acc)
                     (let [loop1$next$n (jolt-n- n (mk-fixnum 1))
                           loop1$next$acc (jolt-n+ acc n)]
                       (primitive/store! loop1$slot$n loop1$next$n)
                       (primitive/store! loop1$slot$acc loop1$next$acc)
                       (continue)))))))))
    (jolt-invoke2 _a$4 _a$5 _a$6)))
(newline)
