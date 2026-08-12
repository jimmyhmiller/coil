;; Minimal Jolt expression ABI over Coil's Scheme dialect. These names and call
;; shapes are emitted by Jolt; there is no textual translation in this fixture.
(module jolt-coil-m1-fixed-arity)
(import "coil.scheme" :use *)
(import "jolt.coil.expression-runtime" :use *)
(import "coil.scheme.stdproc" :as stdproc)
(import "coil.primitive" :as primitive)

(define (jolt-n+ a b) (+ a b))
(define (jolt-n* a b) (* a b))
(define (jolt-symbol ns name) (string->symbol name))
(define (image-register-fn-form! name form ns free-names) #f)

;; Jolt emission for ((fn [x] (+ x 1)) 41).
(display
  (begin
    (let* ((_q$0 (jolt-symbol #f "fn*"))
           (_q$1 (jolt-symbol #f "x"))
           (_q$2 (vector _q$1))
           (_q$3 (jolt-symbol #f "+"))
           (_q$4 (list _q$3 _q$1 1))
           (_q$5 (list _q$0 _q$2 _q$4))
           (_q$6 (vector)))
      (image-register-fn-form! "jfn$user$$0" _q$5 "user" _q$6))
    (jolt-invoke1
      (let ((jfn$user$$0
               (lambda (x)
                   (let ((x x))
                     (jolt-n+ x 1)))))
        jfn$user$$0)
      41)))
(newline)

;; Jolt emission for ((fn [x y] (* (+ x 1) y)) 5 7).
(display
  (begin
    (let* ((_q$0 (jolt-symbol #f "fn*"))
           (_q$1 (jolt-symbol #f "x"))
           (_q$2 (jolt-symbol #f "y"))
           (_q$3 (vector _q$1 _q$2))
           (_q$4 (jolt-symbol #f "*"))
           (_q$5 (jolt-symbol #f "+"))
           (_q$6 (list _q$5 _q$1 1))
           (_q$7 (list _q$4 _q$6 _q$2))
           (_q$8 (list _q$0 _q$3 _q$7))
           (_q$9 (vector)))
      (image-register-fn-form! "jfn$user$$0" _q$8 "user" _q$9))
    (jolt-invoke2
      (let ((jfn$user$$0
                 (lambda (x y)
                   (let ((x x) (y y))
                     (jolt-n* (jolt-n+ x 1) y)))))
        jfn$user$$0)
      5
      7)))
(newline)
