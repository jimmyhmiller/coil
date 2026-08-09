; Tree recursion, no allocation. Measures call overhead and arithmetic — the
; part of a Scheme that a native compiler should win outright.
(define (fib n) (if (< n 2) n (+ (fib (- n 1)) (fib (- n 2)))))
(display (fib 30))
(newline)
