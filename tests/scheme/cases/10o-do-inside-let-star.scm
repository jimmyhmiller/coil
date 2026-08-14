(define (copy-count n)
  (let* ((v (make-vector n)))
    (do ((i 0 (+ i 1)))
        ((= i n) v)
      (vector-set! v i i))))

(write (vector->list (copy-count 3)))
(newline)
