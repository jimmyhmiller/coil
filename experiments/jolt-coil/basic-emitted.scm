;; Runtime shim for the first Jolt backend primitive. Jolt's generic addition
;; has Clojure numeric semantics; R5RS + agrees for this fixnum-only bootstrap
;; case. This wrapper must be replaced, not extended as the numeric tower port.
(define (jolt-n+ . xs) (apply + xs))

;; Emitted by Jolt 865a79f4ba71abf1954b59cadaed94cb8b56816f for
;; the Clojure form (+ 1 2). check.sh verifies the emission before running this.
(display (jolt-n+ 1 2))
(newline)

