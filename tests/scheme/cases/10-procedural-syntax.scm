(define-syntax answer
  (lambda (form)
    (datum->syntax form 42)))

(display (answer))
(newline)

(define-syntax procedural-first
  (lambda (form)
    (syntax-case form ()
      ((_ value) #'value))))

(display (procedural-first 17))
(newline)

(define-syntax procedural-with
  (lambda (form)
    (syntax-case form ()
      ((_ value)
       (with-syntax ((alias #'value))
         #'alias)))))

(display (procedural-with 29))
(newline)
