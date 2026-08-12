; Phase 1: dynamic-wind must interact correctly with continuations.
(define trace '())
(define (note x) (set! trace (cons x trace)))
(dynamic-wind (lambda () (note 'before))
              (lambda () (note 'during))
              (lambda () (note 'after)))
(display (reverse trace)) (newline)
; after must run when the thunk escapes
(set! trace '())
(call-with-current-continuation
  (lambda (escape)
    (dynamic-wind (lambda () (note 'in)) (lambda () (escape 'gone)) (lambda () (note 'out)))))
(display (reverse trace)) (newline)

