;; Exact normalized Jolt shape for:
;; (do (defn twice [x] (* x 2)) (twice 21))
(module jolt-coil-m14-vars-defn)
(import "coil.scheme" :use *)
(import "jolt.coil.expression-runtime" :use *)
(import "jolt.coil.core-runtime" :use *)
(import "coil.scheme.stdproc" :as stdproc)

(display
  (begin
    (def-var-with-meta!
      "user" "twice"
      (let ((twice
              (lambda (x)
                (let ((x x)) (jolt-n* x 2)))))
        twice)
      (jolt-hash-map6
        (keyword #f "arglists")
        (jolt-list1 (jolt-vector1 (jolt-symbol #f "x")))
        (keyword #f "line") 1
        (keyword #f "column") 5))
    (jolt-invoke1 (var-deref "user" "twice") 21)))
(newline)
