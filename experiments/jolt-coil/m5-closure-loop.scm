;; The essential executable portion of Jolt emission for a loop/recur nested
;; inside a Clojure function. This is the recursive-closure lifting boundary.
(module jolt-coil-m5-closure-loop)
(import "coil.scheme" :use *)
(import "jolt.coil.expression-runtime" :use *)
(import "coil.scheme.stdproc" :as stdproc)
(import "coil.primitive" :as primitive)

(define (jolt-zero? n) (= n 0))
(define (jolt-n- a b) (- a b))
(define (jolt-n+ a b) (+ a b))

(display
  (jolt-invoke1
    (let ((jfn$user$$0
            (lambda (limit)
              (let ((limit limit))
                (let* ((n limit) (acc 0))
                  (let [(mut loop2$slot$n) n
                        (mut loop2$slot$acc) (mk-fixnum 0)]
                    (loop
                      (let [n (primitive/load loop2$slot$n)
                            acc (primitive/load loop2$slot$acc)]
                        (if (truthy? (jolt-zero? n))
                          (break acc)
                          (let [loop2$next$n (jolt-n- n (mk-fixnum 1))
                                loop2$next$acc (jolt-n+ acc n)]
                            (primitive/store! loop2$slot$n loop2$next$n)
                            (primitive/store! loop2$slot$acc loop2$next$acc)
                            (continue)))))))))))
      jfn$user$$0)
    5))
(newline)
