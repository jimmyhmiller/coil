; dynamic-wind must interact correctly with continuations.
(define trace '())
(define (note x) (set! trace (cons x trace)))
(dynamic-wind (lambda () (note 'before))
              (lambda () (note 'during))
              (lambda () (note 'after)))
(display (reverse trace)) (newline)

; Escaping from `before` happens before the dynamic extent is active, so neither
; the body nor `after` runs.
(set! trace '())
(call/cc
  (lambda (escape)
    (dynamic-wind
      (lambda () (note 'before) (escape 'left))
      (lambda () (note 'body))
      (lambda () (note 'after)))))
(display (reverse trace)) (newline)

; Nested extents exit inner-to-outer and re-enter outer-to-inner. Re-entering a
; continuation captured in the inner body must repeat both pairs in that order.
(set! trace '())
(define nested-k #f)
(define nested-first #t)
(dynamic-wind
  (lambda () (note 'outer-before))
  (lambda ()
    (dynamic-wind
      (lambda () (note 'inner-before))
      (lambda ()
        (call/cc (lambda (k) (set! nested-k k) 'initial))
        (note 'nested-body))
      (lambda () (note 'inner-after))))
  (lambda () (note 'outer-after)))
(note 'nested-outside)
(if nested-first (begin (set! nested-first #f) (nested-k 'again)))
(note 'nested-done)
(display (reverse trace)) (newline)

; A continuation invoked by an `after` thunk re-enters the extent. The machine
; must run `before` before resuming the saved body and must not treat the first
; `after` as though the extent were still active.
(set! trace '())
(define resume-inside #f)
(define resume-once #t)
(dynamic-wind
  (lambda () (note 'before))
  (lambda ()
    (call/cc (lambda (k) (set! resume-inside k) 'initial))
    (note 'body))
  (lambda ()
    (note 'after)
    (if resume-once
        (begin (set! resume-once #f) (resume-inside 'again)))))
(display (reverse trace)) (newline)

; Re-enter a dynamic extent after its original invocation has returned. The
; entering `before` and the later ordinary-return `after` must both run again.
(set! trace '())
(define saved #f)
(define first #t)
(dynamic-wind
  (lambda () (note 'before))
  (lambda ()
    (call/cc (lambda (k) (set! saved k) 'initial))
    (note 'body))
  (lambda () (note 'after)))
(note 'outside)
(if first (begin (set! first #f) (saved 'again)))
(note 'done)
(display (reverse trace)) (newline)
; after must run when the thunk escapes
(set! trace '())
(call-with-current-continuation
  (lambda (escape)
    (dynamic-wind (lambda () (note 'in)) (lambda () (escape 'gone)) (lambda () (note 'out)))))
(display (reverse trace)) (newline)
