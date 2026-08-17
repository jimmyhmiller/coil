; syntax-case v1: fixed patterns, literals, nesting, with-syntax, #' templates.
(define-syntax first-arg
  (lambda (form)
    (syntax-case form ()
      ((_ value) #'value))))

(define-syntax swap
  (lambda (form)
    (syntax-case form ()
      ((_ a b) #'(b a)))))

(define-syntax pick
  (lambda (form)
    (syntax-case form (left right)
      ((_ left a b) #'a)
      ((_ right a b) #'b))))

(define-syntax nested-second
  (lambda (form)
    (syntax-case form ()
      ((_ (a b c)) #'b))))

(define-syntax alias
  (lambda (form)
    (syntax-case form ()
      ((_ value)
       (with-syntax ((renamed #'value))
         #'renamed)))))

(define (add-one x) (+ x 1))

(display (first-arg 17)) (newline)
(display (swap 41 add-one)) (newline)
(display (pick left 1 2)) (newline)
(display (pick right 1 2)) (newline)
(display (nested-second (10 20 30))) (newline)
(display (alias 29)) (newline)
