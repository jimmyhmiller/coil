;; Scheme procedure position is an expression, not a symbol-only call target.
;; This deliberately contains no literal lambda in `invoke`; the computed `if`
;; itself must cause closure-call lowering to run.
(define (increment x) (+ x 1))

(define (invoke f x)
  ((if #t f f) x))

(display (invoke increment 41))
(newline)
