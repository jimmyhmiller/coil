(define-syntax closure-transformer
  (lambda (x)
    (syntax-case x ()
      ((_ n)
       (let ((tid (car (syntax->list x)))
             (limit (syntax->datum #'n)))
         (letrec ((choose (lambda (v) v)))
           (datum->syntax tid (choose limit))))))))

(display (closure-transformer 8))
(newline)
