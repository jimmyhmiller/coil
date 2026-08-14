(define-syntax matched-answer
  (lambda (form)
    (syntax-case form ()
      ((_ value) (datum->syntax form 23)))))

(display (matched-answer hello))
(newline)
