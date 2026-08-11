; `eval` must not create a native continuation boundary. The continuation
; captured by the dynamically supplied datum includes the caller's pending
; `set!` and the remainder of this surrounding sequence.
(define saved #f)
(define count 0)
(set! saved
  (eval '(call/cc (lambda (k) k)) (scheme-report-environment 5)))
(set! count (+ count 1))
(if (< count 2) (saved 5))
(display saved)
(display " ")
(display count)
(newline)
