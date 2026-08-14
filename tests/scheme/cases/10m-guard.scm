(define (caught-value value) 'caught)

(display
  (guard (condition
           ((eq? condition 'wanted) => caught-value)
           (else 'wrong-clause))
    (raise 'wanted)))
(newline)

(display (guard (condition (else 'wrong)) 'ordinary-return))
(newline)

(display
  (guard (condition
           (#t => (lambda (value) 'lambda-receiver)))
    (raise 'anything)))
(newline)

;; A returning continuable handler resumes at the raise expression.
(display
  (with-exception-handler
    (lambda (condition) 'resumed)
    (lambda () (raise-continuable 'notice))))
(newline)
