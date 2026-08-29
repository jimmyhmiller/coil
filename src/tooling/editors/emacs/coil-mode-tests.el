;;; coil-mode-tests.el --- Tests for coil-mode -*- lexical-binding: t; -*-

;;; Commentary:

;; Run them with:
;;
;;   emacs --batch -L . -l coil-mode-tests.el -f ert-run-tests-batch-and-exit
;;
;; The interesting one is `coil-test-indent-agrees-with-formatter'.  The
;; indentation rules in coil-mode.el were derived from `coil fmt' output, and
;; that test is what keeps them derived: it formats real source, re-indents it
;; in Emacs, and fails if the two disagree beyond a small budget.  Change an
;; indent spec on a hunch and it says so.
;;
;; The budget is not zero because the formatter has two stable answers for a
;; couple of shapes — `(block :label …)' is stable both level with its label
;; and two columns in, and `cond' PACKS pairs onto a line, which is a reflow an
;; indenter cannot and should not reproduce.  Tests that need the toolchain
;; skip themselves when `coil' is not on PATH.

;;; Code:

(require 'ert)
(require 'coil-mode)
(require 'coil-doc)
(require 'coil-check)
(require 'coil-eval)
(require 'coil-repl)
(require 'coil-test)

(defmacro coil-test-with-buffer (text &rest body)
  "Run BODY in a `coil-mode' buffer holding TEXT, point where `|' was."
  (declare (indent 1) (debug (form body)))
  `(with-temp-buffer
     (insert ,text)
     (coil-mode)
     (goto-char (point-min))
     (when (search-forward "|" nil t) (delete-char -1))
     ,@body))

(defun coil-test--reindent (text)
  "TEXT re-indented from scratch by `coil-mode'."
  (with-temp-buffer
    (insert text)
    (coil-mode)
    ;; Strip existing indentation so the rules have to produce it, not
    ;; merely agree that what is already there is fine.
    (goto-char (point-min))
    (while (not (eobp))
      (unless (nth 3 (syntax-ppss (line-beginning-position)))
        (delete-horizontal-space))
      (forward-line 1))
    (indent-region (point-min) (point-max))
    (buffer-string)))

(defun coil-test--available-p ()
  "Whether the toolchain is on PATH."
  (and (executable-find coil-program) t))


;;; Indentation

(ert-deftest coil-test-indent-definition-body ()
  "A definition's body is two columns in, however long its signature ran."
  (should (equal (coil-test--reindent "\
(defn wide [(a i64)
            (b i64)] (-> i64)
(+ a b))")
                 "\
(defn wide [(a i64)
            (b i64)] (-> i64)
  (+ a b))")))

(ert-deftest coil-test-indent-let-binding-value ()
  "A binding value pushed onto its own line goes under its own name."
  (should (equal (coil-test--reindent "\
(defn f [] (-> i64)
(let [idx 0
indexed
(g idx)]
indexed))")
                 "\
(defn f [] (-> i64)
  (let [idx 0
        indexed
          (g idx)]
    indexed))")))

(ert-deftest coil-test-indent-body-forms-ignore-the-head-line ()
  "A second body form goes under the first's FORM, not under the first form.
`lisp-indent-specform' would line it up beneath `(if …)'."
  (should (equal (coil-test--reindent "\
(defn f [] (-> i64)
(loop (if a b c)
(g 1)))")
                 "\
(defn f [] (-> i64)
  (loop (if a b c)
    (g 1)))")))

(ert-deftest coil-test-indent-named-constructor ()
  "Constructor fields sit two in from the form, not under the first field."
  (should (equal (coil-test--reindent "\
(defn f [] (-> i64)
(Thing :a 1
:b 2))")
                 "\
(defn f [] (-> i64)
  (Thing :a 1
    :b 2))")))

(ert-deftest coil-test-indent-qualified-named-constructor ()
  "A namespace-qualified constructor head counts as CamelCase."
  (should (equal (coil-test--reindent "\
(defn f [] (-> i64)
(alloc/AllocRequest :count 1
:bytes 8))")
                 "\
(defn f [] (-> i64)
  (alloc/AllocRequest :count 1
    :bytes 8))")))

(ert-deftest coil-test-indent-plain-call-aligns ()
  "An ordinary call still aligns its arguments under the first one."
  (should (equal (coil-test--reindent "\
(defn f [] (-> i64)
(some-function 1
2))")
                 "\
(defn f [] (-> i64)
  (some-function 1
                 2))")))

(ert-deftest coil-test-indent-cond-clauses ()
  "A wrapped `cond' result tucks in; the test after it does not drift."
  (should (equal (coil-test--reindent "\
(defn f [] (-> i64)
(cond (a-very-long-test-expression x)
(result-expression x)
:else 0))")
                 "\
(defn f [] (-> i64)
  (cond (a-very-long-test-expression x)
          (result-expression x)
        :else 0))")))

(ert-deftest coil-test-indent-keyword-value-wraps ()
  "A keyword argument's value tucks under the keyword."
  (should (equal (coil-test--reindent "\
(defn f [] (-> i64)
(primitive/cast :i64
(read fd buf n)))")
                 "\
(defn f [] (-> i64)
  (primitive/cast :i64
                    (read fd buf n)))")))

(ert-deftest coil-test-indent-block-label-is-not-a-pair ()
  "A `block' label is a label; its body goes two in from the label."
  (should (equal (coil-test--reindent "\
(defn f [] (-> i64)
(block :done
(g 1)))")
                 "\
(defn f [] (-> i64)
  (block :done
           (g 1)))")))

(ert-deftest coil-test-indent-single-semicolon-is-code ()
  "A `;' comment indents with the code, not out at `comment-column'."
  (should (equal (coil-test--reindent "\
(defn f [] (-> i64)
; why
(g 1))")
                 "\
(defn f [] (-> i64)
  ; why
  (g 1))")))

(ert-deftest coil-test-indent-survives-a-comment-in-the-body ()
  "Code after a comment stays level with the code before it.
`parse-partial-sexp' forgets the last complete sexp across a comment,
which without `coil--indent-state' pulls the rest of the body a column
left."
  (should (equal (coil-test--reindent "\
(defn f [] (-> i64)
(g 1)
; note
; more note
(g 2))")
                 "\
(defn f [] (-> i64)
  (g 1)
  ; note
  ; more note
  (g 2))")))

(defvar coil-test-indent-corpus
  '("src/stdlib/str.coil" "src/stdlib/arraylist.coil" "src/stdlib/hashmap.coil"
    "src/stdlib/json.coil" "src/stdlib/fs.coil" "src/compiler/ast.coil"
    "src/compiler/diag.coil")
  "Files, relative to a compiler checkout, to check indentation against.")

(defcustom coil-test-indent-budget 0.02
  "How much of the corpus may disagree with `coil fmt' before failing.
Not zero: the formatter has two stable answers for `(block :label …)',
and it PACKS `cond' pairs onto a line, which is a reflow rather than an
indentation."
  :type 'number
  :group 'coil)

(ert-deftest coil-test-indent-agrees-with-formatter ()
  "Formatted source, re-indented by Emacs, comes back essentially unchanged."
  (skip-unless (coil-test--available-p))
  (let ((root (or (getenv "COIL_CHECKOUT")
                  (locate-dominating-file default-directory "src/stdlib"))))
    (skip-unless root)
    (let ((total 0) (differing 0) (examples nil))
      (dolist (relative coil-test-indent-corpus)
        (let ((path (expand-file-name relative root)))
          (when (file-exists-p path)
            (let ((formatted (with-temp-buffer
                               (call-process coil-program nil t nil "fmt" path)
                               (buffer-string))))
              (let ((lines (split-string formatted "\n"))
                    (indented (split-string
                               (with-temp-buffer
                                 (insert formatted)
                                 (coil-mode)
                                 (indent-region (point-min) (point-max))
                                 (buffer-string))
                               "\n")))
                (cl-loop for a in lines for b in indented for n from 1
                         do (cl-incf total)
                         unless (equal a b)
                         do (cl-incf differing)
                         and when (< (length examples) 5)
                         do (push (format "%s:%d\n  fmt:   %s\n  emacs: %s"
                                          relative n a b)
                                  examples)))))))
      (should (> total 0))
      (let ((rate (/ (float differing) total)))
        (unless (<= rate coil-test-indent-budget)
          (ert-fail (format "%d/%d lines (%.2f%%) disagree with coil fmt:\n%s"
                            differing total (* 100 rate)
                            (string-join (nreverse examples) "\n"))))))))


;;; Imports and scope

(ert-deftest coil-test-parses-import-options ()
  (coil-test-with-buffer "\
(module scope)
(import \"coil.primitive\" :as primitive)
(import \"coil.str\" :use *)
(import \"coil.arraylist\" :use [al-new al-push!])
(import \"coil.slice\" :use * :exclude [slice-get])
(import \"coil.io\" :as io :use * :rename [[write io-write] [read io-read]])
"
    (let ((imports (coil-buffer-imports)))
      (should (equal (coil-buffer-module) "scope"))
      ;; coil.core is implicit in every module.
      (should (cl-find "coil.core" imports :key #'coil-import-namespace
                       :test #'equal))
      (let ((str (cl-find "coil.str" imports :key #'coil-import-namespace
                          :test #'equal)))
        (should (eq (coil-import-use str) t)))
      (let ((al (cl-find "coil.arraylist" imports :key #'coil-import-namespace
                         :test #'equal)))
        (should (equal (coil-import-use al) '("al-new" "al-push!"))))
      (let ((slice (cl-find "coil.slice" imports :key #'coil-import-namespace
                            :test #'equal)))
        (should (equal (coil-import-exclude slice) '("slice-get"))))
      (let ((io (cl-find "coil.io" imports :key #'coil-import-namespace
                         :test #'equal)))
        (should (equal (coil-import-alias io) "io"))
        (should (equal (coil-import-rename io)
                       '(("write" . "io-write") ("read" . "io-read"))))))))

(ert-deftest coil-test-explicit-core-import-replaces-the-implicit-one ()
  (coil-test-with-buffer "(module m)\n(import \"coil.core\" :use [print])\n"
    (let ((core (cl-remove-if-not
                 (lambda (i) (equal (coil-import-namespace i) "coil.core"))
                 (coil-buffer-imports))))
      (should (= 1 (length core)))
      (should (equal (coil-import-use (car core)) '("print"))))))

(ert-deftest coil-test-scope-honours-use-exclude-and-alias ()
  (skip-unless (coil-test--available-p))
  (coil-test-with-buffer "\
(module scope)
(import \"coil.str\" :use *)
(import \"coil.arraylist\" :use [al-new])
(import \"coil.slice\" :use * :exclude [slice-get])
(import \"coil.primitive\" :as primitive)

(defstruct Point [(x i64) (y i64)])
"
    (let ((scope (coil-buffer-scope)))
      (should (assoc "str-concat" scope))       ; :use *
      (should (assoc "al-new" scope))           ; named in :use
      (should-not (assoc "al-elem" scope))      ; not named
      (should-not (assoc "slice-get" scope))    ; excluded
      (should (assoc "primitive/cast" scope))   ; alias-qualified
      (should (assoc "Point" scope))            ; defined here
      (should (equal (coil-def-kind (cdr (assoc "Point" scope))) "struct")))))

(ert-deftest coil-test-lookup-resolves-an-explicit-namespace ()
  (skip-unless (coil-test--available-p))
  (coil-test-with-buffer "(module m)\n"
    (let ((def (coil-lookup "coil.str/str-concat")))
      (should def)
      (should (equal (coil-def-name def) "str-concat"))
      (should (string-match-p "slice u8" (coil-def-signature def))))))


;;; Diagnostics

(ert-deftest coil-test-parses-a-diagnostic ()
  (let ((diagnostics
         (coil-parse-diagnostics "\
error: in 'main': call to undefined function 'undefined-thing'
  --> bad.coil:5:11
  |
5 |   (let [x (undefined-thing 1 2)]
  |           ^^^^^^^^^^^^^^^^^^^^^

1 error
")))
    (should (= 1 (length diagnostics)))
    (let ((d (car diagnostics)))
      (should (eq (coil-diagnostic-severity d) 'error))
      (should (equal (coil-diagnostic-file d) "bad.coil"))
      (should (= (coil-diagnostic-line d) 5))
      (should (= (coil-diagnostic-column d) 11))
      (should (= (coil-diagnostic-width d) 21)))))

(ert-deftest coil-test-parses-several-diagnostics ()
  (let ((diagnostics
         (coil-parse-diagnostics "\
error: first problem
  --> a.coil:1:1
  |
1 | (x)
  | ^^^

warning: second problem
  --> b.coil:20:3
  |
20 |   (y)
   |   ^

2 errors
")))
    (should (= 2 (length diagnostics)))
    (should (eq (coil-diagnostic-severity (nth 1 diagnostics)) 'warning))
    (should (= (coil-diagnostic-line (nth 1 diagnostics)) 20))))


;;; Navigating source

(ert-deftest coil-test-finds-the-enclosing-top-level-form ()
  (coil-test-with-buffer "\
(module m)

(defn f [] (-> i64)
  (g |1))
"
    (let ((bounds (coil-toplevel-bounds)))
      (should (string-prefix-p "(defn f" (coil--text bounds)))
      (should (string-suffix-p "(g 1))" (coil--text bounds))))))

(ert-deftest coil-test-finds-the-preceding-top-level-form ()
  (coil-test-with-buffer "\
(module m)

(defn f [] (-> i64) 1)
|
(defn g [] (-> i64) 2)
"
    (should (equal (coil--text (coil-toplevel-bounds))
                   "(defn f [] (-> i64) 1)"))))

(ert-deftest coil-test-finds-the-test-at-point ()
  (coil-test-with-buffer "\
(module m)

(deftest alpha
  (assert (= 1 1)))

(deftest beta
  (assert| (= 2 2)))
"
    (should (equal (coil--test-at-point) "beta"))))

(ert-deftest coil-test-recognises-a-balanced-form ()
  (should (coil--balanced-p "(a (b c))"))
  (should (coil--balanced-p "(a \"unbalanced ( in a string\")"))
  (should (coil--balanced-p "(a) ; trailing comment"))
  (should-not (coil--balanced-p "(a (b c)"))
  (should-not (coil--balanced-p "(a \"open string"))
  (should-not (coil--balanced-p "(a [b)")))


;;; Reader syntax

(ert-deftest coil-test-reader-prefixes-are-part-of-the-form ()
  "`~x' and `~@xs' move as one sexp, which is what keeps paredit honest."
  (coil-test-with-buffer "(f `(a ~b ~@cs))|"
    (backward-sexp)
    (should (equal (buffer-substring-no-properties (point) (point-max))
                   "(f `(a ~b ~@cs))"))))

(ert-deftest coil-test-brackets-are-delimiters ()
  (coil-test-with-buffer "(defn f [(a i64) (b i64)] (-> i64) 1)|"
    (goto-char (point-min))
    (search-forward "[")
    (backward-char)
    (forward-sexp)
    (should (equal (char-before) ?\]))))

(ert-deftest coil-test-a-comma-is-not-whitespace ()
  "Unlike Clojure, Coil's reader does not treat a comma as whitespace, so
neither does the syntax table."
  (coil-test-with-buffer "(f 1, 2)|"
    (should (equal (char-syntax ?,) ?.))))


;;; ---------------------------------------------------------------------------
;;; Scratch copies

(ert-deftest coil-test-scratch-copies-stay-out-of-the-project ()
  "A scratch copy must not be written into the buffer's own directory.
`coil check' runs on every edit, so a scratch file beside the source shows
up in file trees, in `git status' and in recursive greps, and it outlives a
crash.  It does not need to be there: Coil resolves imports from the
project's source roots, and the checker already runs with
`default-directory' at `coil-project-root'."
  (let* ((dir (file-name-as-directory (make-temp-file "coil-scratch-test" t)))
         (file (expand-file-name "thing.coil" dir)))
    (unwind-protect
        (progn
          (write-region "(module t)\n" nil file nil 'quiet)
          (with-current-buffer (find-file-noselect file)
            (should-not (equal (file-name-directory (coil--scratch-path "flymake"))
                               (file-name-directory file)))
            (should (equal (file-name-directory (coil--scratch-path "flymake"))
                           (file-name-as-directory
                            (expand-file-name coil-scratch-directory))))
            ;; Still a .coil file: the compiler dispatches on the extension.
            (should (equal (file-name-extension (coil--scratch-path "fmt")) "coil"))
            (set-buffer-modified-p nil)
            (kill-buffer)))
      (delete-directory dir t))))

(ert-deftest coil-test-scratch-copies-of-same-named-files-do-not-collide ()
  "Two buffers sharing a base name must not share one scratch path.
They land in a single shared directory now, so a name built from the base
alone would have each checking against the other's text."
  (let* ((root (file-name-as-directory (make-temp-file "coil-collide" t)))
         (a (expand-file-name "a/main.coil" root))
         (b (expand-file-name "b/main.coil" root)))
    (unwind-protect
        (progn
          (make-directory (file-name-directory a) t)
          (make-directory (file-name-directory b) t)
          (write-region "(module a)\n" nil a nil 'quiet)
          (write-region "(module b)\n" nil b nil 'quiet)
          (let ((pa (with-current-buffer (find-file-noselect a)
                      (prog1 (coil--scratch-path "flymake")
                        (set-buffer-modified-p nil) (kill-buffer))))
                (pb (with-current-buffer (find-file-noselect b)
                      (prog1 (coil--scratch-path "flymake")
                        (set-buffer-modified-p nil) (kill-buffer)))))
            (should-not (equal pa pb))))
      (delete-directory root t))))

(provide 'coil-mode-tests)
;;; coil-mode-tests.el ends here
