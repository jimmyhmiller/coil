; Phase 1: R5RS 3.5 REQUIRES unbounded active tail calls. Each of these must run
; in constant space; an implementation that grows the stack will die here.
(define (loop-if n) (if (= n 0) 'done (loop-if (- n 1))))
(display (loop-if 1000000)) (newline)
(define (evn? n) (if (= n 0) #t (odd? (- n 1))))
(define (odd? n) (if (= n 0) #f (evn? (- n 1))))
(display (evn? 1000000)) (newline)
(display (let loop ((n 0)) (if (= n 1000000) n (loop (+ n 1))))) (newline)
(define (via-cond n) (cond ((= n 0) 'done) (else (via-cond (- n 1)))))
(display (via-cond 1000000)) (newline)
(define (via-and n) (and #t (if (= n 0) 'done (via-and (- n 1)))))
(display (via-and 500000)) (newline)
(define (via-or n) (or #f (if (= n 0) 'done (via-or (- n 1)))))
(display (via-or 500000)) (newline)
