(display
  (letrec ((even? (lambda (n) (if (= n 0) #t (odd? (- n 1)))))
           (odd? (lambda (n) (if (= n 0) #f (even? (- n 1))))))
    (even? 10)))
(newline)

;; Sequential bindings must be visible to a closure declared by a later let*
;; binding, including when the use is inside another closure in its body. Jolt's
;; extend-type macro generator has exactly this shape.
(display
  ((lambda (x)
     (let* ((forwarded x)
            (emit (lambda ()
                    (let ((inner (lambda () forwarded)))
                      (inner)))))
       (emit)))
   42))
(newline)

;; A middle closure must forward a grandparent binding even when it only
;; appears in the innermost lambda's body.
(display
  (let ((make-outer
          (lambda (x)
            (lambda (y)
              (lambda (z) (+ x (+ y z)))))))
    (((make-outer 10) 20) 12)))
(newline)
