(define (fx+ a b) (+ a b))
(define (fx= a b) (= a b))

(define (jrec-vals r)
  (let* ((n (vector-length r)) (v (make-vector n)))
    (do ((i 0 (fx+ i 1)))
        ((fx= i n) v)
      (vector-set! v i (vector-ref r i)))))

(write (vector->list (jrec-vals (vector 3 4))))
(newline)
