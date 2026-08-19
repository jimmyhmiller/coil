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
(define-syntax vector-copy-list
  (syntax-rules () ((_ #(x ...)) (vector->list #(x ...)))))
(display (vector-copy-list #(4 5 6))) (newline)   ; vector patterns and templates
(define-syntax nested-copy
  (syntax-rules () ((_ ((x ...) ...)) (list (list x ...) ...))))
(display (nested-copy ((1 2) (3)))) (newline)     ; doubly nested ellipsis
(define-syntax literal-choice
  (syntax-rules (else) ((_ else value) value) ((_ other value) 0)))
(display (list (literal-choice else 7)            ; literal matches by BINDING, not name:
               (let ((else #t)) (literal-choice else 7))          ; shadowed -> no match
               ((lambda (else) (literal-choice else 7)) #t)       ; shadowed -> no match
               (let ((marker #t))
                 (let-syntax
                   ((same-marker
                      (syntax-rules (marker)
                        ((_ marker) 1)
                        ((_ other) 0))))
                   (same-marker marker))))) (newline)
(define definition-helper (lambda (value) (+ value 1)))
(define-syntax call-definition-helper
  (syntax-rules () ((_ value) (definition-helper value))))
(display (let ((definition-helper (lambda (ignored) 999)))
           (call-definition-helper 41))) (newline) ; free template refs bind at DEFINITION site
