(define-syntax emit-mapped
  (lambda (x)
    (syntax-case x ()
      ((_)
       (datum->syntax
         (car (syntax->list x))
         '(begin
            (define (add1-all xs)
              (map (lambda (x) (+ x 1)) xs))
            (display (car (add1-all (list 41))))
            (newline)))))))

(emit-mapped)
