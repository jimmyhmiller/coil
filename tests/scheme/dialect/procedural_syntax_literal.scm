(import (chezscheme))

(define-syntax answer
  (lambda (form) #'42))

(display (answer ignored))
(newline)
