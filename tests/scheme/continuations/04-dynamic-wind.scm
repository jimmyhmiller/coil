(define trace '())
(define saved #f)
(define (note x) (set! trace (cons x trace)))

(dynamic-wind (lambda () (note 'before))
              (lambda () (note 'during))
              (lambda () (note 'after)))
(display (reverse trace))
(newline)

; Leaving a dynamic extent through a continuation runs its after thunk.
(set! trace '())
(call-with-current-continuation
  (lambda (escape)
    (dynamic-wind (lambda () (note 'in))
                  (lambda () (escape 'gone))
                  (lambda () (note 'out)))))
(display (reverse trace))
(newline)

; Re-entering a saved dynamic extent runs its before thunk again.
(set! trace '())
(define visits 0)
(call-with-current-continuation
  (lambda (done)
    (dynamic-wind
      (lambda () (note 'enter))
      (lambda ()
        (call-with-current-continuation
          (lambda (k) (set! saved k) (note 'body)))
        (set! visits (+ visits 1))
        (if (< visits 2) (done 'leave)))
      (lambda () (note 'exit)))))
(if (< visits 2) (let ((resume saved)) (resume 'again)))
(display (reverse trace))
(newline)
