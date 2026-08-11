(define-syntax loaded-inc
  (syntax-rules () ((_ value) (+ value 1))))
(define loaded-base (loaded-inc 39))
(define (loaded-add n) (+ loaded-base n))
(set! loaded-base (loaded-add 1))
