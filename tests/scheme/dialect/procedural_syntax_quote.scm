(import (chezscheme))

(define-syntax answer
  (lambda (form) #'42))

;; The dialect owns quotation. Merely naming a staged transformer inside quoted
;; Scheme data must not ask the generic staging transport to execute it.
(display (eq? (car '(answer ignored)) 'answer))
(newline)
