;; Jolt truth, nil, structural equality, empty seq, and missing map lookup.
(module jolt-coil-m13-nil-equality)
(import "coil.scheme" :use *)
(import "jolt.coil.core-runtime" :use *)

(display
  (let* ((_a$3 (if (jolt-truthy? (jolt-nil-value)) 100 1))
         (_a$4
           (if (let* ((_a$1 (jolt-vector2 1 2))
                      (_a$2 (jolt-vector2 1 2)))
                 (jolt=2 _a$1 _a$2))
             10 100))
         (_a$5
           (if (jolt-nil? (jolt-seq (jolt-vector0))) 20 100))
         (_a$6
           (if (jolt-nil?
                 (jolt-get
                   (jolt-hash-map2 (keyword #f "a") 1)
                   (keyword #f "missing")))
             30 100)))
    (jolt-n+4 _a$3 _a$4 _a$5 _a$6)))
(newline)
