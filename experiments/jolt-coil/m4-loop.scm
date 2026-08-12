;; Direct Jolt emission for a summing loop/recur expression.
(module jolt-coil-m4-loop)
(import "coil.scheme" :use *)
(import "jolt.coil.expression-runtime" :use *)
(import "coil.scheme.stdproc" :as stdproc)

(define (jolt-zero? n) (= n 0))
(define (jolt-n- a b) (- a b))
(define (jolt-n+ a b) (+ a b))

(display
  (let* ((n 5) (acc 0))
    (let loop1 ((n n) (acc acc))
      (if (jolt-zero? n)
        acc
        (let* ((_a$2 (jolt-n- n 1))
               (_a$3 (jolt-n+ acc n)))
          (loop1 _a$2 _a$3))))))
(newline)
