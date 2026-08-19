; Procedural define-syntax v1 (staged metacompilation):
;   answer    -- datum-level transformer returning a constant
;   add-list  -- internal define inside the transformer body
;   double    -- transformer whose RESULT uses another procedural macro
(define (square x) (* x x))

(define-syntax answer
  (lambda (form)
    (datum->syntax form 42)))

(define-syntax add-list
  (lambda (form)
    (datum->syntax form (cons '+ (cdr (syntax->datum form))))))

; An internal define INSIDE a transformer body: the phase program goes through
; the same internal-definition lowering as any Scheme.
(define-syntax add-list-helper
  (lambda (form)
    (define (rebuild d) (cons '+ (cdr d)))
    (datum->syntax form (rebuild (syntax->datum form)))))

(define-syntax double
  (lambda (form)
    (let ((d (syntax->datum form)))
      (datum->syntax form (list 'add-list (car (cdr d)) (car (cdr d)))))))

; Self-recursion: the transformer's result uses ITSELF; the wrapper re-wraps it
; and the compiler's request re-walk expands to fixpoint within the round.
(define-syntax count-args
  (lambda (form)
    (let ((d (cdr (syntax->datum form))))
      (if (null? d)
          (datum->syntax form 0)
          (datum->syntax form (list '+ 1 (cons 'count-args (cdr d))))))))

(display (answer)) (newline)
(display (add-list 1 2 3)) (newline)
(display (add-list-helper 10 20 30)) (newline)
(display (double 20)) (newline)
(display (square (answer))) (newline)
(display (count-args a b c d e)) (newline)
