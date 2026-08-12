(define operators '(/ - & ~))

(define (wrap value rest)
  `(result ,value ,@rest))

(display (if (equal? operators '(/ - & ~)) 41 0))
(newline)
