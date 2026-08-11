; Exact-bignum multiplication and decimal conversion. Recomputing factorial
; keeps the timed work in the numeric tower; only the final result is printed.
(define (factorial n acc)
  (if (< n 2) acc (factorial (- n 1) (* acc n))))

(define (rounds k result)
  (if (< k 1) result (rounds (- k 1) (factorial 1000 1))))

(display (string-length (number->string (rounds 300 1))))
(newline)
