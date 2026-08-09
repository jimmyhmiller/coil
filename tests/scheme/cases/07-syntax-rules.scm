; Phase 4: hygienic macros. Each of these is a classic conformance trap.
(define-syntax swap!
  (syntax-rules () ((_ a b) (let ((tmp a)) (set! a b) (set! b tmp)))))
(define tmp 1) (define other 2)
(swap! tmp other)
(display (list tmp other)) (newline)     ; hygiene: template tmp must not capture
(define-syntax my-or
  (syntax-rules () ((_) #f) ((_ e) e) ((_ e r ...) (let ((t e)) (if t t (my-or r ...))))))
(define t 'outer)
(display (my-or #f t)) (newline)         ; must be outer, not #f
(define-syntax my-let
  (syntax-rules () ((_ ((n v) ...) body ...) ((lambda (n ...) body ...) v ...))))
(display (my-let ((a 1) (b 2)) (+ a b))) (newline)   ; nested ellipsis
(define-syntax tail-pattern
  (syntax-rules () ((_ a ... last) (list 'last last))))
(display (tail-pattern 1 2 3)) (newline)  ; ellipsis with trailing fixed pattern
