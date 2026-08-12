;; Run from the root of the pinned Jolt checkout.
(import (chezscheme))
(load "host/chez/gate-boot.ss")
(load "host/chez/emit-image.ss")

(let-values (((form next)
              (rdr-read-form "(+ 1 2)" 0 (string-length "(+ 1 2)"))))
  (display (ei-compile-form (make-analyze-ctx "user") form #f))
  (newline))

