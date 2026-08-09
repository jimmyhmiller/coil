; Phase 2: derived forms. R5RS 7.3 defines these via syntax-rules; whether we
; hand-desugar or macro-expand, the observable behavior must match.
(display (let ((a 1) (b 2)) (+ a b))) (newline)
(display (let* ((a 1) (b (+ a 1))) (list a b))) (newline)
(display (letrec ((e? (lambda (n) (if (= n 0) #t (o? (- n 1)))))
                  (o? (lambda (n) (if (= n 0) #f (e? (- n 1))))))
           (e? 88))) (newline)
(display (do ((i 0 (+ i 1)) (acc '() (cons i acc))) ((= i 5) (reverse acc)))) (newline)
(display (cond ((assv 1 '((1 a) (2 b))) => cadr) (else 'none))) (newline)
(display (cond (#f 'no) (else 'yes))) (newline)
; NOTE: `(case "a" (("a") ...))` is deliberately NOT tested here — R5RS says case
; dispatches with eqv?, so a string literal must NOT match, but Chez returns
; `matched` while Guile and Chibi return `not-matched`. See 10-divergences.scm.
(display (case 3 ((1 2) 'low) ((3 4) 'mid) (else 'high))) (newline)
(display (list (and) (or) (and 1 2) (or #f 2) (and #f 1))) (newline)
(define p (delay (begin 'forced 42)))
(display (list (force p) (force p))) (newline)
