(define-syntax internal-call
  (lambda (x)
    (syntax-case x ()
      ((_ n)
       (let ((tid (car (syntax->list x)))
             (limit (syntax->datum #'n)))
         (define (down i)
           (let loop ((j i))
             (if (= j 0) 42 (loop (- j 1)))))
         (define (bump i) (+ i 1))
         (define (all xs)
           (map (lambda (i) (bump i)) xs))
         (datum->syntax tid
           `(begin
              (display ,(+ (down limit) (- (car (all (list 0))) 1)))
              (newline))))))))

(internal-call 41)
