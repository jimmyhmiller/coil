;; A nontrivial expression emitted by Jolt and structurally normalized by
;; emit-coil-expression.ss: nested closures, lexical bindings, a conditional,
;; comparison, and arithmetic. The expected result is 144.
(module jolt-coil-m2-nested)
(import "coil.scheme" :use *)
(import "jolt.coil.expression-runtime" :use *)
(import "coil.scheme.stdproc" :as stdproc)

(define (jolt-n+ a b) (+ a b))
(define (jolt-n* a b) (* a b))
(define (jolt-n> a b) (> a b))
(define (jolt-symbol ns name) (string->symbol name))
(define (jolt-vector . xs) (list->vector xs))
(define (jolt-list . xs) xs)
(define (image-register-fn-form! name form ns free-names) #f)

(display
  (begin
    (let* ((_q$0 (jolt-symbol #f "fn*"))
           (_q$1 (jolt-symbol #f "y"))
           (_q$2 (jolt-vector _q$1))
           (_q$3 (jolt-symbol #f "if"))
           (_q$4 (jolt-symbol #f ">"))
           (_q$5 (jolt-list _q$4 _q$1 10))
           (_q$6 (jolt-symbol #f "*"))
           (_q$7 (jolt-list _q$6 _q$1 _q$1))
           (_q$8 (jolt-symbol #f "+"))
           (_q$9 (jolt-list _q$8 _q$1 1))
           (_q$10 (jolt-list _q$3 _q$5 _q$7 _q$9))
           (_q$11 (jolt-list _q$0 _q$2 _q$10))
           (_q$12 (jolt-vector))
           (_q$13 (jolt-symbol #f "x"))
           (_q$14 (jolt-vector _q$13))
           (_q$15 (jolt-symbol #f "fn"))
           (_q$16 (jolt-list _q$15 _q$2 _q$10))
           (_q$17 (jolt-list _q$8 _q$13 3))
           (_q$18 (jolt-list _q$16 _q$17))
           (_q$19 (jolt-list _q$0 _q$14 _q$18)))
      (image-register-fn-form! "jfn$user$$1" _q$11 "user" _q$12)
      (image-register-fn-form! "jfn$user$$0" _q$19 "user" _q$12))
    (jolt-invoke1
      (let ((jfn$user$$0
              (lambda (x)
                (let ((x x))
                  (let* ((_a$3
                           (let ((jfn$user$$1
                                   (lambda (y)
                                     (let ((y y))
                                       (if (jolt-n> y 10)
                                         (jolt-n* y y)
                                         (jolt-n+ y 1))))))
                             jfn$user$$1))
                         (_a$4 (jolt-n+ x 3)))
                    (jolt-invoke1 _a$3 _a$4))))))
        jfn$user$$0)
      9)))
(newline)
