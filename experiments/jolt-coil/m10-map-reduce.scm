;; Executable Jolt shape for:
;; (reduce + 0 (map (fn [x] (* x x)) [1 2 3 4]))
(module jolt-coil-m10-map-reduce)
(import "coil.scheme" :use *)
(import "jolt.coil.expression-runtime" :use *)
(import "jolt.coil.core-runtime" :use *)
(import "coil.scheme.stdproc" :as stdproc)

(display
  (let* ((_a$4 (jolt-add-value))
         (_a$5 0)
         (_a$6
           (let* ((_a$2
                    (let ((jfn$user$$0
                            (lambda (x)
                              (let ((x x)) (jolt-n* x x)))))
                      jfn$user$$0))
                  (_a$3 (jolt-vector4 1 2 3 4)))
             (jolt-map _a$2 _a$3))))
    (jolt-reduce _a$4 _a$5 _a$6)))
(newline)
