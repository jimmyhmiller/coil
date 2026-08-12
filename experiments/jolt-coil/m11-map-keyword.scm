;; Exact normalized Jolt expression for nested get/assoc over keyword maps.
(module jolt-coil-m11-map-keyword)
(import "coil.scheme" :use *)
(import "jolt.coil.core-runtime" :use *)

(display
  (jolt-get
    (let* ((_a$1
             (jolt-hash-map4
               (keyword #f "a") 10
               (keyword #f "b") 20))
           (_a$2 (keyword #f "c"))
           (_a$3
             (jolt-n+
               (jolt-get
                 (jolt-hash-map2 (keyword #f "x") 5)
                 (keyword #f "x"))
               7)))
      (jolt-assoc3 _a$1 _a$2 _a$3))
    (keyword #f "c")))
(newline)
