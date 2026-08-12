;; Normalized Jolt case-lambda for a two-arity anonymous Clojure function.
(module jolt-coil-m15-multi-arity)
(import "coil.scheme" :use *)
(import "jolt.coil.expression-runtime" :use *)
(import "jolt.coil.core-runtime" :use *)
(import "coil.scheme.stdproc" :as stdproc)

(display
  (jolt-invoke2
    (let ((jfn$user$$0
            (lambda args
              (if (= (length args) 1)
                (apply
                  (lambda (x) (let ((x x)) x))
                  args)
                (if (= (length args) 2)
                  (apply
                    (lambda (x y)
                      (let ((x x) (y y)) (jolt-n+ x y)))
                    args)
                  (jolt-nil-value))))))
      jfn$user$$0)
    20 22))
(newline)
