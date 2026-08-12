;; Jolt set construction, membership, order-independent equality, conj, disj.
(module jolt-coil-m17-sets)
(import "coil.scheme" :use *)
(import "jolt.coil.expression-runtime" :use *)
(import "jolt.coil.core-runtime" :use *)
(import "coil.scheme.stdproc" :as stdproc)

(display
  (let* ((_a$6
           (if (jolt-contains? (jolt-hash-set3 1 2 3) 2) 1 100))
         (_a$7
           (if (let* ((_a$1 (jolt-hash-set2 1 2))
                      (_a$2 (jolt-hash-set2 2 1)))
                 (jolt=2 _a$1 _a$2))
             10 100))
         (_a$8
           (if (jolt-contains?
                 (let* ((_a$3 (var-deref "clojure.core" "disj"))
                        (_a$4 (jolt-conj2 (jolt-hash-set2 1 2) 3))
                        (_a$5 2))
                   (jolt-invoke2 _a$3 _a$4 _a$5))
                 2)
             100 20)))
    (jolt-n+3 _a$6 _a$7 _a$8)))
(newline)
