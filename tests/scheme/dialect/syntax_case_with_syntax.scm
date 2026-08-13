(import (chezscheme))

(define-syntax choose-host-call
  (lambda (x)
    (syntax-case x (quote)
      ((_ name (quote args))
       (with-syntax
           ((left #'(list name (quote args)))
            (right #'(list (quote fallback) name)))
         #'(if #t left right))))))

(display (choose-host-call 'selected '(a b)))
(newline)
