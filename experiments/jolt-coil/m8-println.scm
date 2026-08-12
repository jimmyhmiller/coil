;; Exact executable Jolt call shape for (println "hello" 42).
(module jolt-coil-m8-println)
(import "coil.scheme" :use *)
(import "jolt.coil.expression-runtime" :use *)
(import "jolt.coil.core-runtime" :use *)
(import "coil.scheme.stdproc" :as stdproc)

(jolt-invoke2 (var-deref "clojure.core" "println") "hello" 42)
