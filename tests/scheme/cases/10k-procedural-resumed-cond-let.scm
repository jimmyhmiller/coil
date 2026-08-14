;; Merely having a procedural transformer sends the module through native
;; phase-1 staging. Every other source form must still resume the complete
;; Scheme lowering pipeline after that staging boundary.
(define-syntax unused-transformer
  (lambda (x)
    (syntax-case x ()
      ((_ value) #'value))))

(define (probe)
  (cond ((+ 3 4)
         => (lambda (m)
              (let ((result m))
                result)))
        (else 0)))

(display (probe))
(newline)
