(define (choose x)
  (cond ((= x 1) 10)
        ((= x 2) 20)
        (else 30)))

(define (main)
  (if (= (choose 2) 20) 0 1))
