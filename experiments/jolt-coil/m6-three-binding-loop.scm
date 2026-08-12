;; Jolt loop/recur with three simultaneous bindings. sum(1..4) + product(1..4)
;; is 10 + 24 = 34.
(module jolt-coil-m6-three-binding-loop)
(import "coil.scheme" :use *)
(import "coil.primitive" :as primitive)

(define (jolt-zero? n) (= n 0))
(define (jolt-n- a b) (- a b))
(define (jolt-n+ a b) (+ a b))
(define (jolt-n* a b) (* a b))

(display
  (let* ((n 4) (sum 0) (product 1))
    (let [(mut loop1$slot$n) n
          (mut loop1$slot$sum) sum
          (mut loop1$slot$product) product]
      (loop
        (let [n (primitive/load loop1$slot$n)
              sum (primitive/load loop1$slot$sum)
              product (primitive/load loop1$slot$product)]
          (if (truthy? (jolt-zero? n))
            (break (jolt-n+ sum product))
            (let [loop1$next$n (jolt-n- n (mk-fixnum 1))
                  loop1$next$sum (jolt-n+ sum n)
                  loop1$next$product (jolt-n* product n)]
              (primitive/store! loop1$slot$n loop1$next$n)
              (primitive/store! loop1$slot$sum loop1$next$sum)
              (primitive/store! loop1$slot$product loop1$next$product)
              (continue))))))))
(newline)
