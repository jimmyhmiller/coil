(set! load-saved (call/cc (lambda (k) k)))
(set! load-count (+ load-count 1))
(if (= load-count 1) (load-saved 7))
