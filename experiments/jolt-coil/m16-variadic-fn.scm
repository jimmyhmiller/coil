;; Normalized Jolt output for:
;; ((fn [x & xs] (reduce + x xs)) 10 20 12)
(module jolt-coil-m16-variadic-fn)
(import "coil.scheme" :use *)
(import "jolt.coil.expression-runtime" :use *)
(import "jolt.coil.core-runtime" :use *)
(import "coil.scheme.stdproc" :as stdproc)

(display
  (jolt-invoke3
    (let ((jfn$user$$0
            (lambda (x . xs)
              (let ((x x) (xs (jolt-rest-seq xs)))
                (jolt-reduce (jolt-add-value) x xs)))))
      (jolt-register-variadic! 1 jfn$user$$0))
    10 20 12))
(newline)
