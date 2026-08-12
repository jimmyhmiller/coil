;; Run from the root of the pinned Jolt checkout:
;;   chezscheme --script /path/to/emit-expression.ss '<clojure-form>'
(import (chezscheme))
(load "host/chez/gate-boot.ss")
(load "host/chez/emit-image.ss")

(let ((args (command-line-arguments)))
  (unless (= (length args) 1)
    (error 'emit-expression "expected exactly one Clojure form"))
  (let ((source (car args)))
    (let-values (((form next)
                  (rdr-read-form source 0 (string-length source))))
      (display (ei-compile-form (make-analyze-ctx "user") form #f))
      (newline))))
