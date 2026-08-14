(define-syntax host-name-shadow
  (lambda (x)
    (syntax-case x ()
      ((_)
       (let ((tid (car (syntax->list x))))
         (define (mut k i)
           (format #f "field~a-~a" k i))
         (datum->syntax tid
           `(begin
              (display ,(mut 2 1))
              (newline))))))))

(host-name-shadow)
