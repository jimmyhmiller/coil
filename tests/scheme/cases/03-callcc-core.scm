; Public compiled-entry coverage for unlimited, multi-shot continuations.
(display (call-with-current-continuation (lambda (k) (+ 1 (k 42)))))
(newline)
(display (call-with-current-continuation (lambda (k) 3)))
(newline)

(define saved #f)
(define count 0)
(define result
  (+ 1 (call/cc (lambda (k) (set! saved k) 1))))
(display result)
(newline)
(set! count (+ count 1))
(if (< count 3) (saved (+ count 1)))
(display (list 'reentered count))
(newline)
