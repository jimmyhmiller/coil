;; Jolt Scheme emission adapted structurally for Coil's expression kernel.
;; Run from the pinned Jolt checkout with one Clojure form as the argument.
(import (chezscheme))
(load "host/chez/gate-boot.ss")
(load "host/chez/emit-image.ss")

(define seed-mode? #f)

(define (contains-symbol? tree wanted)
  (cond
    ((symbol? tree) (eq? tree wanted))
    ((pair? tree)
     (or (contains-symbol? (car tree) wanted)
         (contains-symbol? (cdr tree) wanted)))
    ((vector? tree)
     (let loop ((i 0))
       (and (< i (vector-length tree))
            (or (contains-symbol? (vector-ref tree i) wanted)
                (loop (+ i 1))))))
    (else #f)))

(define (single-binding form)
  (and (pair? (cdr form))
       (pair? (cadr form))
       (null? (cdadr form))
       (pair? (caadr form))
       (= (length (caadr form)) 2)
       (caadr form)))

;; Jolt sometimes puts a self-contained recursive helper inside a second,
;; identically named letrec* binding. The inner binding owns every reference;
;; the outer cell is only an identity wrapper and can disappear.
(define (self-contained-helper? init name)
  (and (pair? init)
       (or (eq? (car init) 'letrec) (eq? (car init) 'letrec*))
       (let ((binding (single-binding init)))
         (and binding
              (eq? (car binding) name)
              (= (length (cddr init)) 1)
              (eq? (caddr init) name)))))

(define (keyword-constant-binding? binding)
  (and (list? binding)
       (= (length binding) 2)
       (symbol? (car binding))
       (let ((name (symbol->string (car binding))))
         (and (>= (string-length name) 4)
              (string=? (substring name 0 4) "_kc$")))
       (pair? (cadr binding))
       (eq? (car (cadr binding)) 'keyword)))

(define (keyword-constant-bindings? bindings)
  (and (list? bindings)
       (not (null? bindings))
       (let loop ((xs bindings))
         (or (null? xs)
             (and (keyword-constant-binding? (car xs))
                  (loop (cdr xs)))))))

(define (direct-self-calls-only? tree name)
  (cond
    ((symbol? tree) (not (eq? tree name)))
    ((not (pair? tree)) #t)
    ((eq? (car tree) 'quote) #t)
    ((eq? (car tree) name)
     (let loop ((xs (cdr tree)))
       (or (null? xs)
           (and (pair? xs)
                (direct-self-calls-only? (car xs) name)
                (loop (cdr xs))))))
    ((list? tree)
     (let loop ((xs tree))
       (or (null? xs)
           (and (direct-self-calls-only? (car xs) name)
                (loop (cdr xs))))))
    (else
     (and (direct-self-calls-only? (car tree) name)
          (direct-self-calls-only? (cdr tree) name)))))

(define (explicit-jolt-list items)
  (if (null? items) '(jolt-list0)
      `(jolt-cons ,(car items) ,(explicit-jolt-list (cdr items)))))

(define (rewrite-self-calls tree name self)
  (cond
    ((vector? tree)
     (list->vector
       (map (lambda (item) (rewrite-self-calls item name self))
            (vector->list tree))))
    ((not (pair? tree)) tree)
    ((eq? (car tree) 'quote) tree)
    ((eq? (car tree) name)
     (let* ((args (map (lambda (arg) (rewrite-self-calls arg name self))
                       (cdr tree)))
            (arity (+ 1 (length args))))
       (if (<= arity 6)
           (cons (string->symbol
                   (string-append "jolt-invoke" (number->string arity)))
                 (cons self (cons self args)))
           `(jolt-invoke-list ,self ,(explicit-jolt-list (cons self args))))))
    ((list? tree)
     (map (lambda (item) (rewrite-self-calls item name self)) tree))
    (else
     (cons (rewrite-self-calls (car tree) name self)
           (rewrite-self-calls (cdr tree) name self)))))

(define (self-parameter-lowering name init body)
  (and (pair? init)
       (eq? (car init) 'lambda)
       (pair? (cdr init))
       (or (list? (cadr init)) (symbol? (cadr init)))
       (direct-self-calls-only? (cddr init) name)
       (let* ((formals (cadr init))
              (lambda-body (cddr init))
              (self (string->symbol
                      (string-append (symbol->string name) "$self")))
              (impl (string->symbol
                      (string-append (symbol->string name) "$impl")))
              (impl-formals (cons self formals))
              (wrapper-call
                (if (list? formals)
                    `(jolt-invoke ,impl ,impl ,@formals)
                    `(jolt-invoke-list ,impl (jolt-cons ,impl ,formals)))))
         `(let ((,impl
                  (lambda ,impl-formals
                    ,@(map (lambda (expr)
                             (rewrite-self-calls expr name self))
                           lambda-body))))
            (let ((,name
                    (lambda ,formals ,wrapper-call)))
              ,@body)))))

;; Jolt lowers Clojure `loop`/`recur` to a named let. Its recur arguments are
;; first named by a let* so they are evaluated left-to-right, then passed to the
;; loop in tail position. For the canonical single-if shape, turn that recursive
;; closure into Scheme `do`; Coil then compiles it as native loop control.
(define (substitute-temporaries tree env)
  (cond
    ((symbol? tree)
     (let ((entry (assq tree env)))
       (if entry (cdr entry) tree)))
    ((not (pair? tree)) tree)
    ((eq? (car tree) 'quote) tree)
    (else
     (cons (substitute-temporaries (car tree) env)
           (substitute-temporaries (cdr tree) env)))))

(define (recur-arguments expr loop-name env)
  (cond
    ((and (pair? expr) (eq? (car expr) loop-name))
     (map (lambda (arg) (substitute-temporaries arg env)) (cdr expr)))
    ((and (pair? expr)
          (eq? (car expr) 'let*)
          (= (length expr) 3)
          (list? (cadr expr)))
     (let loop ((bindings (cadr expr)) (extended env))
       (if (null? bindings)
           (recur-arguments (caddr expr) loop-name extended)
           (let ((binding (car bindings)))
             (and (= (length binding) 2)
                  (loop (cdr bindings)
                        (cons (cons (car binding)
                                    (substitute-temporaries (cadr binding) extended))
                              extended)))))))
    (else #f)))

;; Expressions moved beneath a host Coil binding vector are intentionally opaque
;; to the Scheme literal pass. Lift the literals Jolt currently emits in recur
;; tests and steps before constructing that target-only region.
(define (host-value form)
  (cond
    ((integer? form) `(mk-fixnum ,form))
    ((eq? form #t) '(s-true))
    ((eq? form #f) '(s-false))
    ((string? form) `(string-from-slice ,form))
    ((and (pair? form)
          (eq? (car form) 'string-from-slice)
          (= (length form) 2))
     form)
    ((pair? form) (map host-value form))
    (else form)))

(define (recur-step args slots temps)
  (and (= (length args) (length slots))
       `(let ,(list->vector
                (apply append
                  (map (lambda (temp arg)
                         (list temp (host-value (normalize arg))))
                       temps args)))
          ,@(map (lambda (slot temp) `(primitive/store! ,slot ,temp))
                 slots temps)
          (continue))))

;; Compile the tail-control tree of a named let. Every recur becomes simultaneous
;; slot updates plus `continue`; every ordinary tail value becomes `break`.
;; Jolt has already validated that recur appears only in tail position, so this
;; structural walk can preserve arbitrary mixtures of terminal and recursive
;; branches without needing to predict one canonical if shape.
(define (tail-loop-action expr loop-name slots temps)
  (let ((args (recur-arguments expr loop-name '())))
    (if args
        (recur-step args slots temps)
        (if (not (pair? expr))
            `(break ,(host-value (normalize expr)))
            (cond
              ((and (eq? (car expr) 'if) (= (length expr) 4))
               `(if (truthy? ,(host-value (normalize (cadr expr))))
                    ,(tail-loop-action (caddr expr) loop-name slots temps)
                    ,(tail-loop-action (cadddr expr) loop-name slots temps)))
              ((and (or (eq? (car expr) 'let) (eq? (car expr) 'let*))
                    (= (length expr) 3)
                    (list? (cadr expr)))
               `(,(car expr)
                  ,(map (lambda (binding)
                          (list (car binding) (normalize (cadr binding))))
                        (cadr expr))
                  ,(tail-loop-action (caddr expr) loop-name slots temps)))
              ((and (eq? (car expr) 'begin) (> (length expr) 1))
               (let* ((parts (cdr expr))
                      (backward (reverse parts))
                      (prefix (reverse (cdr backward))))
                 `(begin ,@(map normalize prefix)
                         ,(tail-loop-action (car backward)
                                            loop-name slots temps))))
              (else `(break ,(host-value (normalize expr)))))))))

(define (jolt-tail-loop form)
  (let* ((name (cadr form))
         (bindings (caddr form))
         (body (cdddr form)))
    (and (= (length body) 1)
         (contains-symbol? body name)
         (let* ((slots
                  (map (lambda (binding)
                         (string->symbol
                           (string-append (symbol->string name) "$slot$"
                                          (symbol->string (car binding)) "$cell")))
                       bindings))
                (temps
                  (map (lambda (binding)
                         (string->symbol
                           (string-append (symbol->string name) "$next$"
                                          (symbol->string (car binding)) "$value")))
                       bindings))
                (initial
                  (list->vector
                    (apply append
                      (map (lambda (slot binding)
                             (list `(mut ,slot)
                                   (host-value (normalize (cadr binding)))))
                           slots bindings))))
                (aliases
                  (list->vector
                    (apply append
                      (map (lambda (binding slot)
                             (list (car binding) `(primitive/load ,slot)))
                           bindings slots))))
                (action (tail-loop-action (car body) name slots temps)))
           `(let ,initial
              (loop (let ,aliases ,action)))))))

(define (formal-fixed-count formals)
  (cond
    ((null? formals) 0)
    ((symbol? formals) 0)
    ((pair? formals) (+ 1 (formal-fixed-count (cdr formals))))
    (else 0)))

(define (case-lambda-bindings formals index)
  (cond
    ((null? formals) '())
    ((symbol? formals) `((,formals (list-tail args ,index))))
    ((pair? formals)
     (cons `(,(car formals) (list-ref args ,index))
           (case-lambda-bindings (cdr formals) (+ index 1))))
    (else '())))

(define (case-lambda-dispatch clauses)
  (if (null? clauses)
      '(jolt-nil-value)
      (let* ((clause (car clauses))
             (formals (car clause))
             (body (cdr clause))
             (fixed (formal-fixed-count formals))
             (test (if (list? formals)
                       `(= (length args) ,fixed)
                       `(>= (length args) ,fixed))))
        `(if ,test
             (let ,(case-lambda-bindings formals 0)
               ,@(map normalize body))
             ,(case-lambda-dispatch (cdr clauses))))))

(define (normalize-pair form)
  (if (pair? form)
      (cons (normalize (car form)) (normalize-pair (cdr form)))
      (if (null? form) '() (normalize form))))

(define (jolt-cons-list forms)
  (if (null? forms)
      '(jolt-list0)
      `(jolt-cons ,(normalize (car forms)) ,(jolt-cons-list (cdr forms)))))

(define (jolt-cons-prefix forms tail)
  (if (null? forms)
      (normalize tail)
      `(jolt-cons ,(normalize (car forms))
                  ,(jolt-cons-prefix (cdr forms) tail))))

(define (normalize-guard form)
  (let* ((spec (cadr form))
         (raw-name (car spec))
         (clause (cadr spec)))
    (and (eq? (car clause) 'else)
         `(jolt-guard
            (lambda () ,@(map normalize (cddr form)))
            (lambda (,raw-name) ,@(map normalize (cdr clause)))))))

(define (normalize form)
  (cond
    ((eq? form 'jolt-add) '(jolt-add-value))
    ((eq? form 'jolt-odd?) '(jolt-odd-value))
    ((eq? form 'jolt-vector) '(jolt-vector-value))
    ((eq? form 'jolt-list) '(jolt-list-value))
    ((eq? form 'jolt-concat) '(jolt-concat-value))
    ((eq? form 'jolt-conj) '(jolt-conj-value))
    ((eq? form 'jolt=) '(jolt-equal-value))
    ((eq? form 'jolt-map) '(jolt-map-value))
    ((eq? form 'jolt-hash-set) '(jolt-hash-set-value))
    ((eq? form 'jolt-identity) '(jolt-identity-value))
    ((eq? form 'jolt-into) '(jolt-into-value))
    ((eq? form 'jolt-filter) '(jolt-filter-value))
    ((eq? form 'jolt-seq) '(jolt-seq-value))
    ((eq? form 'jolt-first) '(jolt-first-value))
    ((eq? form 'jolt-rest) '(jolt-rest-value))
    ((eq? form 'jolt-hash-map-fn) '(jolt-hash-map-fn-value))
    ((eq? form 'jolt-assoc) '(jolt-assoc-value))
    ((eq? form 'jolt-get) '(jolt-get-value))
    ((eq? form 'jolt-sub) '(jolt-sub-value))
    ((eq? form 'jolt-mul) '(jolt-mul-value))
    ((eq? form 'jolt-inc) '(jolt-inc-value))
    ((eq? form 'jolt-dec) '(jolt-dec-value))
    ((eq? form 'jolt-lt) '(jolt-lt-value))
    ((eq? form 'jolt-le) '(jolt-le-value))
    ((eq? form 'jolt-gt) '(jolt-gt-value))
    ((eq? form 'jolt-ge) '(jolt-ge-value))
    ((eq? form 'jolt-nil) '(jolt-nil-value))
    ((eq? form '+inf.0) '(mk-flonum-bits 9218868437227405312))
    ((eq? form '-inf.0) '(mk-flonum-bits -4503599627370496))
    ((eq? form '+nan.0) '(mk-flonum-bits 9221120237041090560))
    ((and (flonum? form) (infinite? form))
     (if (> form 0.0)
         '(mk-flonum-bits 9218868437227405312)
         '(mk-flonum-bits -4503599627370496)))
    ((and (flonum? form) (nan? form))
     '(mk-flonum-bits 9221120237041090560))
    ;; Jolt strings are runtime values. Make their allocation explicit because
    ;; strings moved into lambda-lifter-generated definitions otherwise appear
    ;; after Coil's ordinary Scheme literal walk.
    ((and seed-mode? (string? form)) `(string-from-slice ,form))
    ((not (pair? form)) form)
    ;; Literal allocation is already in the opaque, fixed-point form expected
    ;; by Coil's Scheme pass. Adapter rewrites can revisit subtrees, so preserve
    ;; it rather than wrapping its raw slice a second time.
    ((and (eq? (car form) 'string-from-slice)
          (= (length form) 2)
          (string? (cadr form)))
     form)
    ((and (eq? (car form) 'jolt-n+)
          (not (= (length (cdr form)) 2)))
     (cons (string->symbol
             (string-append "jolt-n+" (number->string (length (cdr form)))))
           (map normalize (cdr form))))
    ((and (eq? (car form) 'jolt-get) (= (length form) 4))
     `(jolt-get3 ,@(map normalize (cdr form))))
    ((and (eq? (car form) 'jolt-nth) (= (length form) 4))
     `(jolt-nth3 ,@(map normalize (cdr form))))
    ((and (eq? (car form) 'jolt-reduce) (= (length form) 3))
     `(jolt-reduce2 ,@(map normalize (cdr form))))
    ((eq? (car form) 'jolt-hash-map-fn)
     (let ((args (map normalize (cdr form))))
       (if (<= (length args) 8)
           (cons (string->symbol
                   (string-append "jolt-hash-map" (number->string (length args))))
                 args)
           `(jolt-hash-map-from-list ,(explicit-jolt-list args)))))
    ((or (eq? (car form) 'jolt-sub) (eq? (car form) 'jolt-mul))
     `(jolt-invoke-list ,(if (eq? (car form) 'jolt-sub)
                             '(jolt-sub-value)
                             '(jolt-mul-value))
                        ,(explicit-jolt-list (map normalize (cdr form)))))
    ((or (eq? (car form) 'jolt-identity)
         (or (eq? (car form) 'jolt-into)
             (or (eq? (car form) 'jolt-filter)
                 (or (eq? (car form) 'jolt-seq)
                     (or (eq? (car form) 'jolt-first)
                         (or (eq? (car form) 'jolt-rest)
                             (or (eq? (car form) 'jolt-assoc)
                                 (eq? (car form) 'jolt-get))))))))
     (cons (car form) (map normalize (cdr form))))
    ((eq? (car form) 'case-lambda)
     `(lambda args ,(case-lambda-dispatch (cdr form))))
    ((eq? (car form) 'jolt-invoke)
     (let* ((parts (cdr form))
            (f (car parts))
            (args (cdr parts))
            (arity (length args)))
       (if (<= arity 6)
           (cons (string->symbol
                   (string-append "jolt-invoke" (number->string arity)))
                 (map normalize parts))
           `(jolt-invoke-list ,(normalize f) ,(jolt-cons-list args)))))
    ((eq? (car form) 'jolt-apply)
     (let* ((f (cadr form))
            (args (cddr form))
            (backward (reverse args))
            (tail (car backward))
            (prefix (reverse (cdr backward))))
       `(jolt-invoke-list ,(normalize f)
                          ,(jolt-cons-prefix prefix tail))))
    ((eq? (car form) 'jolt-map)
     (if (= (length (cdr form)) 2)
         `(jolt-map ,@(map normalize (cdr form)))
         (cons (string->symbol
                 (string-append "jolt-map"
                   (number->string (- (length (cdr form)) 1))))
               (map normalize (cdr form)))))
    ((and seed-mode? (eq? (car form) 'guard))
     `(begin ,@(map normalize (cddr form))))
    ((and (eq? (car form) 'guard)
          (= (length form) 3))
     (or (normalize-guard form) (normalize-pair form)))
    ;; Imported variadic Scheme procedures cannot use Coil's module-local
    ;; call-site collection. Make Jolt's vector constructor ABI explicit in the
    ;; same fixed-arity style as jolt-invokeN.
    ((eq? (car form) 'jolt-vector)
     (cons (string->symbol
             (string-append "jolt-vector" (number->string (length (cdr form)))))
           (map normalize (cdr form))))
    ((eq? (car form) 'jolt-list)
     (cons (string->symbol
             (string-append "jolt-list" (number->string (length (cdr form)))))
           (map normalize (cdr form))))
    ((eq? (car form) 'jolt-concat)
     (let ((arity (length (cdr form))))
       (cond ((= arity 0) '(jolt-concat0))
             ((= arity 2) `(jolt-concat ,@(map normalize (cdr form))))
             ((= arity 3) `(jolt-concat3 ,@(map normalize (cdr form))))
             (else `(jolt-invoke-list (jolt-concat-value)
                                      ,(explicit-jolt-list
                                         (map normalize (cdr form))))))))
    ((eq? (car form) 'jolt-hash-map)
     (let ((args (map normalize (cdr form))))
       (if (<= (length args) 8)
           (cons (string->symbol
                   (string-append "jolt-hash-map" (number->string (length args))))
                 args)
           `(jolt-hash-map-from-list ,(explicit-jolt-list args)))))
    ((eq? (car form) 'jolt-hash-set)
     (let ((args (map normalize (cdr form))))
       (if (<= (length args) 4)
           (cons (string->symbol
                   (string-append "jolt-hash-set" (number->string (length args))))
                 args)
           `(jolt-hash-set-from-list ,(explicit-jolt-list args)))))
    ;; The seed hoists keyword literals into compiler-generated `_kc$` lets.
    ;; Keywords are pure interned values and these names are globally fresh, so
    ;; substituting exactly this generated binding class preserves semantics
    ;; while avoiding deep closure-capture pressure in compiler functions.
    ((and (eq? (car form) 'let)
          (pair? (cdr form))
          (keyword-constant-bindings? (cadr form)))
     (let ((env (map (lambda (binding)
                       (cons (car binding) (cadr binding)))
                     (cadr form))))
       (normalize
         `(begin ,@(map (lambda (body)
                          (substitute-temporaries body env))
                        (cddr form))))))
    ;; Jolt uses letrec* for compiler-generated local helpers. Its initializers
    ;; are lambdas (and therefore do not observe intermediate assignments), so
    ;; the ordinary letrec cell lowering has the same behavior while avoiding a
    ;; malformed expansion in Coil's generic R5RS letrec* macro.
    ((and (eq? (car form) 'letrec*)
          (>= (length form) 3)
          (list? (cadr form)))
     (normalize `(letrec ,(cadr form) ,@(cddr form))))
    ;; Jolt wraps an anonymous fn in letrec even though its globally unique
    ;; binding is not recursive. Coil can use an ordinary lexical let there.
    ((and (eq? (car form) 'letrec) (single-binding form))
     (let* ((binding (single-binding form))
            (name (car binding))
            (init (cadr binding))
            (normalized-init (normalize init)))
       ;; Normalization can eliminate the recursive reference entirely (most
       ;; notably when a named Jolt recur loop becomes a native Coil loop).
       ;; Decide whether the cell is still needed from the expression we will
       ;; actually emit, not from the pre-lowering Jolt initializer.
       (if (and (contains-symbol? normalized-init name)
                (not (self-contained-helper? init name)))
           (let ((lowered
                   (self-parameter-lowering name normalized-init (cddr form))))
             (if lowered (normalize lowered) (normalize-pair form)))
           `(let ((,name ,normalized-init))
              ,@(map normalize (cddr form))))))
    ;; Every Jolt fn body is a named let so `recur` has a target. When no recur
    ;; exists, eliminate only that redundant loop. Recursive loops remain intact
    ;; and are the next closure-lifter milestone.
    ((and (eq? (car form) 'let)
          (pair? (cdr form))
          (symbol? (cadr form))
          (pair? (cddr form))
          (list? (caddr form)))
     (let ((name (cadr form))
           (bindings (caddr form))
           (body (cdddr form)))
       (if (contains-symbol? body name)
           (or (jolt-tail-loop form) (normalize-pair form))
           `(let ,(map (lambda (binding)
                         (list (car binding) (normalize (cadr binding))))
                       bindings)
              ,@(map normalize body)))))
    (else (normalize-pair form))))

;; Chez writes vectors as `#(...)`; Coil's source vector spelling is `[...]`.
;; The normalized target deliberately contains host binding vectors, so use a
;; tiny structural writer rather than a textual parenthesis substitution.
(define (write-coil form)
  (cond
    ((vector? form)
     (display "[")
     (let loop ((i 0))
       (unless (= i (vector-length form))
         (when (> i 0) (display " "))
         (write-coil (vector-ref form i))
         (loop (+ i 1))))
     (display "]"))
    ((pair? form)
     (display "(")
     (let loop ((xs form) (first? #t))
       (cond
         ((null? xs) (display ")"))
         ((pair? xs)
          (unless first? (display " "))
          (write-coil (car xs))
          (loop (cdr xs) #f))
         (else
          (display " . ")
          (write-coil xs)
          (display ")")))))
    (else (write form))))

(define (write-seed-prefix path limit)
  (set! seed-mode? #t)
  (call-with-input-file path
    (lambda (port)
      (let loop ((i 0))
        (unless (= i limit)
          (let ((form (read port)))
            (when (eof-object? form)
              (error 'emit-coil-expression "seed ended before requested prefix"))
            (write-coil (normalize form))
            (newline)
            (loop (+ i 1))))))))

(let ((args (command-line-arguments)))
  (cond
    ((= (length args) 1)
     (let ((source (car args)))
       (let-values (((form next)
                     (rdr-read-form source 0 (string-length source))))
         (let* ((emitted (ei-compile-form (make-analyze-ctx "user") form #f))
                (scheme-form (read (open-input-string emitted))))
           (write-coil (normalize scheme-form))
           (newline)))))
    ((and (= (length args) 3) (string=? (car args) "--seed-prefix"))
     (write-seed-prefix (cadr args) (string->number (caddr args))))
    (else
     (error 'emit-coil-expression
       "expected a Clojure form or --seed-prefix FILE COUNT"))))
