; syntax-case ellipsis + fenders (staged metacompilation).
; my-list: the simplest segment — bind the rest, splice it back.
(define-syntax my-list
  (lambda (form)
    (syntax-case form ()
      ((_ x ...) #'(list x ...)))))

; my-let: the R5RS nested-column case — one ellipsis gathers TWO columns and
; the template re-emits them in different positions.
(define-syntax my-let2
  (lambda (form)
    (syntax-case form ()
      ((_ ((n v) ...) body ...) #'((lambda (n ...) body ...) v ...)))))

; prefix/segment/tail: fixed parts around the ellipsis.
(define-syntax mid-args
  (lambda (form)
    (syntax-case form ()
      ((_ first mid ... last) #'(list last (list mid ...) first)))))

; recursive procedural my-or, the classic — needs ellipsis AND recursion.
(define-syntax my-or2
  (lambda (form)
    (syntax-case form ()
      ((_) #'#f)
      ((_ e) #'e)
      ((_ e r ...) #'(let ((t e)) (if t t (my-or2 r ...)))))))

; fenders: a clause guarded by a phase-time predicate on the syntax.
(define-syntax small-const
  (lambda (form)
    (syntax-case form ()
      ((_ n) (< (syntax->datum #'n) 100) #'n)
      ((_ n) #'0))))

(display (my-list 1 2 3)) (newline)
(display (my-let2 ((a 1) (b 2)) (+ a b))) (newline)
(display (mid-args 1 2 3 4 5)) (newline)
(define t 'outer)
(display (my-or2 #f t)) (newline)
(display (my-or2)) (newline)
(display (small-const 42)) (newline)
(display (small-const 4200)) (newline)
