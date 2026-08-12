;; Jolt emission for (apply + [1 2 3]). This exercises a first-class Clojure
;; core function, a persistent-vector-shaped argument, and dynamic application.
(module jolt-coil-m3-apply)
(import "coil.scheme" :use *)
(import "jolt.coil.core-runtime" :use *)

(define (jolt-vector3 a b c) (vector a b c))
(define (jolt-apply f xs) (apply f (vector->list xs)))

(display
  (let* ((_a$1 (jolt-add-value))
         (_a$2 (jolt-vector3 1 2 3)))
    (jolt-apply _a$1 _a$2)))
(newline)
