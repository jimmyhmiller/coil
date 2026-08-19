; Phase 2: quasiquote with splicing and nesting — R5RS's own definition is subtle.
(define n 5)
(display `(a b ,n)) (newline)
(display `(a ,@(list 1 2) b)) (newline)
(display `(1 ,@'() 2)) (newline)
(display `#(a ,n)) (newline)
(display '#(1 a)) (newline)
(display (equal? `(a `(b ,(c ,n))) (list 'a (list 'quasiquote (list 'b (list 'unquote (list 'c n))))))) (newline)
(display `(,@(list 1 2) . 3)) (newline)
