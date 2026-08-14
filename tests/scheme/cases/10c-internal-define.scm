(define (outer value)
  (define (choose x) x)
  (choose value))

(display (outer 6))
(newline)
