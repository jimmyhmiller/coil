(define-syntax nested-quasiquote
  (lambda (x)
    (syntax-case x ()
      ((_ max-n)
       (let ((tid (car (syntax->list x)))
             (mn (syntax->datum #'max-n)))
         (define (range lo hi)
           (let loop ((i hi) (acc '()))
             (if (< i lo) acc (loop (- i 1) (cons i acc)))))
         (define (sym fmt . args)
           (string->symbol (apply format #f fmt args)))
         (define (pred k) (sym "jrec~a?" k))
         (define (mut k i) (sym "jrec~a-f~a-set!" k i))
         (define (set-branch k)
           `((,(pred k) r)
             (case i
               ,@(map (lambda (i) `((,i) (,(mut k i) r v)))
                      (range 0 (- k 1)))
               (else (error 'jrec-field-set! "index out of range" i)))))
         (define fieldset-def
           `(define (jrec-field-set! r i v)
              (cond ,@(map set-branch (range 1 mn))
                    ((jrec*? r) (vector-set! (jrec*-vals r) i v))
                    (else (error 'jrec-field-set! "not a fielded record" r)))))
         ;; Conversion itself traverses the complete generated definition. The
         ;; focused fixture does not install it because its jrec dependencies
         ;; intentionally live only in Jolt's runtime module.
         (datum->syntax tid fieldset-def)
         (datum->syntax tid '(begin (display 42) (newline))))))))

(nested-quasiquote 8)
