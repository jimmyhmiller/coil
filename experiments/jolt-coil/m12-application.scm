;; One composed Clojure application form: map squares, reduce a total, build a
;; keyword map, format a label through clojure.core/str, print it, and return the
;; numeric result. This is normalized real Jolt output, including fn metadata.
(module jolt-coil-m12-application)
(import "coil.scheme" :use *)
(import "jolt.coil.expression-runtime" :use *)
(import "jolt.coil.core-runtime" :use *)
(import "coil.scheme.stdproc" :as stdproc)

(display
  (begin
    (let* ((_q$0 (jolt-symbol #f "fn*"))
           (_q$1 (jolt-symbol #f "x"))
           (_q$2 (jolt-vector1 _q$1))
           (_q$3 (jolt-symbol #f "*"))
           (_q$4 (jolt-list3 _q$3 _q$1 _q$1))
           (_q$5 (jolt-list3 _q$0 _q$2 _q$4))
           (_q$6 (jolt-vector0)))
      (image-register-fn-form! "jfn$user$$0" _q$5 "user" _q$6))
    (let* ((xs (jolt-vector4 1 2 3 4))
           (squares
             (jolt-map
               (let ((jfn$user$$0
                       (lambda (x)
                         (let ((x x)) (jolt-n* x x)))))
                 jfn$user$$0)
               xs))
           (total (jolt-reduce (jolt-add-value) 0 squares))
           (result
             (jolt-hash-map4
               (keyword #f "total") total
               (keyword #f "label")
               (jolt-invoke2
                 (var-deref "clojure.core" "str") "sum=" total))))
      (begin
        (let* ((_a$2 (var-deref "clojure.core" "println"))
               (_a$3 (jolt-get result (keyword #f "label"))))
          (jolt-invoke1 _a$2 _a$3))
        (jolt-get result (keyword #f "total"))))))
(newline)
