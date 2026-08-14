(define-syntax internal-range
  (lambda (x)
    (syntax-case x ()
      ((_ n)
       (let ((tid (car (syntax->list x)))
             (limit (syntax->datum #'n)))
         (define (choose value) value)
         (datum->syntax tid (choose limit)))))))

(display (internal-range 6))
(newline)
