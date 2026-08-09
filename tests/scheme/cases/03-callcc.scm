; Phase 1: full re-entrant call/cc. An escape-only (one-shot, downward)
; implementation passes the first two forms and fails everything after them —
; which is exactly the point: escape-only is NOT R5RS-conformant.

; --- escape: the easy half, works even with a longjmp-style implementation ---
(display (call-with-current-continuation (lambda (k) (+ 1 (k 42))))) (newline)
(display (call-with-current-continuation (lambda (k) 3))) (newline)

; --- re-entrant: the continuation is invoked AFTER its capture already returned.
; A counter bounds the re-entry so the program terminates; each pass through adds
; one, so the printed sequence proves the continuation really was resumed rather
; than the expression merely being re-evaluated.
(define k #f)
(define count 0)
(define result (+ 1 (call-with-current-continuation (lambda (c) (set! k c) 1))))
(display result) (newline)
(set! count (+ count 1))
(if (< count 3) (k (+ count 1)))
(display (list 'reentered count)) (newline)

; --- generator: the classic idiom that cannot be done with escape-only call/cc,
; because `resume` is re-entered long after the `gen` call that captured it
; returned. `return` must be re-set on EVERY call, not just the first: each (g)
; has a different caller, and resuming into a stale `return` jumps back to an
; earlier caller's continuation and loops forever.
(define (make-gen lst)
  (define return #f)
  (define (gen)
    (call-with-current-continuation
      (lambda (r)
        (set! return r)
        (for-each (lambda (x)
                    (call-with-current-continuation
                      (lambda (resume)
                        (set! gen (lambda ()
                                    (call-with-current-continuation
                                      (lambda (r2) (set! return r2) (resume #f)))))
                        (return x))))
                  lst)
        (return 'done))))
  (lambda () (gen)))
(define g (make-gen '(1 2 3)))
; NOT `(list (g) (g) (g) (g))` — R5RS leaves argument evaluation order
; unspecified, and the three reference Schemes genuinely differ (Chez right-to-
; left, Guile left-to-right, Chibi another order). Sequence the calls with let*
; so the test measures the generator, not the host's argument order.
(let* ((a (g)) (b (g)) (c (g)) (d (g)))
  (display (list a b c d)) (newline))
