(define-syntax generated-symbol
  (lambda (x)
    (syntax-case x ()
      ((_)
       (let ((tid (car (syntax->list x))))
         (datum->syntax tid
           (string->symbol (apply format #f "field~a" (list 7)))))))))

(define field7 37)
(display (generated-symbol))
(newline)
