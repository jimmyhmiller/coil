; Continuation-aware execution must retain R5RS proper tail recursion.
(display
  (call/cc
    (lambda (done)
      (let loop ((n 200000))
        (if (= n 0) (done 'tail-ok) (loop (- n 1)))))))
(newline)
