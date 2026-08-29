;;; coil-mode.el --- Major mode for the Coil language -*- lexical-binding: t; -*-

;; Author: Jimmy Miller
;; Keywords: languages, coil, lisp
;; Package-Requires: ((emacs "29.1"))
;; Version: 1.0.0

;;; Commentary:

;; A full editing mode for Coil, the low-level Lisp.  This file owns the
;; *editing* half — syntax, font-lock, indentation that agrees with `coil
;; fmt', imenu, paredit integration and the shared keymap.  The interactive
;; half lives in sibling files that this one autoloads on demand:
;;
;;   coil-repl.el    the `coil repl' connection (comint + a request queue)
;;   coil-eval.el    eval commands, inline result overlays, macroexpansion
;;   coil-doc.el     namespace index -> eldoc, completion, doc, apropos, xref
;;   coil-check.el   flymake (`coil check'), `coil fmt', `coil lint', balance
;;   coil-test.el    the `coil test' runner and its report buffer
;;
;; The quickest setup is one line:
;;
;;   (add-to-list 'load-path "/path/to/coil/src/tooling/editors/emacs")
;;   (require 'coil-mode)
;;   (coil-setup-default)
;;
;; `coil-setup-default' turns on the things a Clojure user expects to be on:
;; paredit, rainbow-delimiters, eldoc, completion, flymake and the xref
;; backend.  Skip it and wire the pieces yourself if you would rather.

;;; Code:

(require 'cl-lib)
(require 'subr-x)
(require 'compile)

;; Set by `lisp-indent-line' around the call to `lisp-indent-function', and
;; declared by `paredit' only once it is loaded.
(defvar calculate-lisp-indent-last-sexp)
(defvar paredit-space-for-delimiter-predicates)

(defgroup coil nil
  "Editing and REPL support for the Coil language."
  :prefix "coil-"
  :link '(url-link "https://github.com/jimmyhmiller/coil")
  :group 'languages)

(defcustom coil-program "coil"
  "The Coil toolchain executable.
Everything — the REPL, docs, formatting, checking, tests — goes through
this one binary."
  :type 'string
  :group 'coil)

(defcustom coil-mode-hook nil
  "Hook run when entering `coil-mode'."
  :type 'hook
  :group 'coil)


;;; ---------------------------------------------------------------------------
;;; The language's vocabulary
;;;
;;; Kept as plain lists so font-lock, completion and indentation all read the
;;; same source of truth.

(defconst coil-definition-forms
  '("defn" "defcc" "defstruct" "defsum" "deftrait" "defprop" "deftest"
    "impl" "const" "def" "extern" "module" "import" "include"
    "export" "export-c" "static-assert" "meta" "derive")
  "Top-level definition and declaration heads.")

(defconst coil-special-forms
  '("if" "do" "let" "match" "loop" "break" "continue" "while" "for" "for-in"
    "when" "when-not" "unless" "cond" "case" "block" "return-from" "defer"
    "set!" "quote" "quasiquote" "comptime" "llvm-ir" "zeroed" "ref" "mut")
  "Control flow and binding forms.")

(defconst coil-primitive-ops
  '("cast" "field" "index" "load" "store!" "sizeof" "alignof" "fnptr-of"
    "gensym" "call-ptr" "alloc-stack" "alloc-static" "alloc-heap")
  "Operations from `coil.primitive', highlighted whether or not qualified.")

(defconst coil-primitive-types
  '("i8" "i16" "i32" "i64" "u8" "u16" "u32" "u64" "f32" "f64"
    "bool" "void" "char" "Self" "Code" "ptr" "slice" "array" "fnptr" "dyn")
  "Built-in type names.")

(defconst coil-constants
  '("true" "false" "nil")
  "Literal constants.")


;;; ---------------------------------------------------------------------------
;;; Syntax table

(defvar coil-mode-syntax-table
  (let ((table (make-syntax-table)))
    ;; Whitespace.  Unlike Clojure, a comma is NOT whitespace in Coil, so it
    ;; stays punctuation and paredit will not silently swallow one.
    (modify-syntax-entry ?\s " " table)
    (modify-syntax-entry ?\t " " table)
    (modify-syntax-entry ?\f " " table)
    (modify-syntax-entry ?\, "." table)

    ;; Comments run to end of line.
    (modify-syntax-entry ?\; "<" table)
    (modify-syntax-entry ?\n ">" table)

    ;; Strings.  `c"…"' is an ordinary string with a `c' stuck on the front,
    ;; so nothing special is needed here — see the font-lock rule.
    (modify-syntax-entry ?\" "\"" table)
    (modify-syntax-entry ?\\ "\\" table)

    ;; All three bracket pairs are real delimiters: () for forms, [] for
    ;; parameter/binding vectors, {} where the language uses them.
    (modify-syntax-entry ?\( "()" table)
    (modify-syntax-entry ?\) ")(" table)
    (modify-syntax-entry ?\[ "(]" table)
    (modify-syntax-entry ?\] ")[" table)
    (modify-syntax-entry ?\{ "(}" table)
    (modify-syntax-entry ?\} "){" table)

    ;; Reader prefixes.  Giving these prefix syntax (') is what makes
    ;; `forward-sexp' treat `~x', `~@xs', "`(…)" and `'sym' as single units,
    ;; which in turn is what keeps paredit from tearing them apart.
    (modify-syntax-entry ?\' "'" table)
    (modify-syntax-entry ?\` "'" table)
    (modify-syntax-entry ?\~ "'" table)
    (modify-syntax-entry ?\# "'" table)
    (modify-syntax-entry ?@ "'" table)

    ;; Symbol constituents.  Coil names are Lisp-liberal: `al-push!',
    ;; `str-parse-int', `primitive/cast', `Type::method', `.field', `<=', `*'.
    (dolist (ch '(?- ?+ ?* ?/ ?= ?< ?> ?! ?? ?_ ?. ?: ?% ?& ?^ ?$))
      (modify-syntax-entry ch "_" table))
    table)
  "Syntax table for `coil-mode'.")


;;; ---------------------------------------------------------------------------
;;; Faces

(defface coil-character-face
  '((t :inherit font-lock-string-face))
  "Face for character literals such as `\\a', `\\newline', `\\u41'."
  :group 'coil)

(defface coil-namespace-face
  '((t :inherit font-lock-type-face))
  "Face for the alias part of a qualified name, e.g. the `primitive' in
`primitive/cast'."
  :group 'coil)

(defface coil-number-face
  '((t :inherit default))
  "Face for numeric literals.  Inherits `default' — set it if you want
numbers to stand out."
  :group 'coil)


;;; ---------------------------------------------------------------------------
;;; Font lock

(defun coil--form-head-regexp (heads &optional name-group)
  "Match `(HEAD' for any string in HEADS.
With NAME-GROUP, also match the name being defined as the second group."
  (concat "(" (regexp-opt heads t) "\\_>"
          (when name-group "[ \t\n]+\\(\\(?:\\sw\\|\\s_\\)+\\)")))

(defconst coil-font-lock-keywords
  `(;; (defn NAME …) — the head, then the name it binds.
    (,(coil--form-head-regexp '("defn" "defcc") t)
     (1 font-lock-keyword-face) (2 font-lock-function-name-face nil t))
    (,(coil--form-head-regexp '("defstruct" "defsum" "deftrait" "impl") t)
     (1 font-lock-keyword-face) (2 font-lock-type-face nil t))
    (,(coil--form-head-regexp '("deftest" "defprop") t)
     (1 font-lock-keyword-face) (2 font-lock-function-name-face nil t))
    (,(coil--form-head-regexp '("const" "def") t)
     (1 font-lock-keyword-face) (2 font-lock-variable-name-face nil t))
    (,(coil--form-head-regexp '("extern") t)
     (1 font-lock-keyword-face) (2 font-lock-function-name-face nil t))
    (,(coil--form-head-regexp '("module") t)
     (1 font-lock-keyword-face) (2 font-lock-constant-face nil t))

    ;; (import "ns" :as alias) — the namespace reads as a name, not a string.
    ("(\\(import\\|include\\)\\_>[ \t\n]*\"\\([^\"\n]*\\)\""
     (1 font-lock-keyword-face) (2 font-lock-constant-face t))
    ("(import\\_>[^()\n]*?:as[ \t]+\\(\\(?:\\sw\\|\\s_\\)+\\)"
     (1 coil-namespace-face))

    ;; The rest of the definition heads, unnamed.
    (,(coil--form-head-regexp coil-definition-forms)
     (1 font-lock-keyword-face))

    ;; Control flow.
    (,(coil--form-head-regexp coil-special-forms)
     (1 font-lock-keyword-face))

    ;; Primitive operations, qualified (primitive/cast) or bare (cast).
    (,(concat "\\_<\\(?:[a-zA-Z0-9_-]+/\\)?"
              (regexp-opt coil-primitive-ops t) "\\_>")
     (1 font-lock-builtin-face))

    ;; Types.
    (,(concat "\\_<" (regexp-opt coil-primitive-types t) "\\_>")
     (1 font-lock-type-face))
    ;; …and anything CamelCase, which is the convention for user types.
    ("\\_<\\([A-Z][A-Za-z0-9]*\\)\\_>" (1 font-lock-type-face))
    ;; Type::associated-fn — the Type half.
    ("\\_<\\([A-Za-z_][A-Za-z0-9_-]*\\)::" (1 font-lock-type-face))

    (,(concat "\\_<" (regexp-opt coil-constants t) "\\_>")
     (1 font-lock-constant-face))

    ;; :keywords — import options, block labels, match `:else'.
    ("\\_<\\(:\\(?:\\sw\\|\\s_\\)+\\)" (1 font-lock-builtin-face))

    ;; The alias half of a qualified call: primitive/cast, alloc/heap, s/len.
    ("\\_<\\([a-zA-Z_][a-zA-Z0-9_-]*\\)/\\(?:\\sw\\|\\s_\\)"
     (1 coil-namespace-face))

    ;; (.field place) — a field read.
    ("(\\(\\.\\(?:\\sw\\|\\s_\\)+\\)" (1 font-lock-property-use-face))

    ;; c"…" — the byte-string prefix.  The string body is already fontified
    ;; syntactically; this just marks the sigil.
    ("\\(?:^\\|[][(){} \t]\\)\\(c\\)\"" (1 font-lock-builtin-face))

    ;; Character literals: \a \newline \u41 \space.
    ("\\\\\\(?:u[0-9a-fA-F]+\\|[A-Za-z][A-Za-z0-9-]*\\|.\\)" 0 'coil-character-face)

    ;; Unquote in a quasiquoted template.
    ("\\(~@?\\)" (1 font-lock-warning-face))

    ;; Numbers: 1  -2  0x1f  0b1010  3.14  1e9
    ("\\_<-?\\(?:0[xX][0-9a-fA-F_]+\\|0[bB][01_]+\\|[0-9][0-9_]*\\(?:\\.[0-9_]+\\)?\\(?:[eE][-+]?[0-9]+\\)?\\)\\_>"
     0 'coil-number-face))
  "Font-lock rules for `coil-mode'.")

(defun coil-font-lock-syntactic-face (state)
  "Face for the string or comment described by STATE.
Coil's convention is that `;;' introduces a doc comment that becomes API
documentation while a single `;' is an ordinary remark, so the two get
different faces."
  (if (nth 3 state)
      font-lock-string-face
    (save-excursion
      (goto-char (nth 8 state))
      (if (looking-at ";;\\(?:[^;]\\|$\\)")
          font-lock-doc-face
        font-lock-comment-face))))


;;; ---------------------------------------------------------------------------
;;; Indentation
;;;
;;; These rules are not invented.  They were read off `coil fmt' output over
;;; the compiler and standard library and then checked back against it: a
;;; freshly formatted file, re-indented by this code, comes back unchanged.
;;; Pressing TAB and running the formatter therefore agree, which is the
;;; difference between a formatter you can leave on and one that fights you.
;;;
;;; Four rules cover it, in the order `coil-indent-function' tries them:
;;;
;;;   1. A vector element lines up one past the `[', except that a `let'
;;;      binding VALUE pushed onto its own line goes two past its own name.
;;;   2. A form with an indent spec puts its body two in from the form —
;;;      `defun' for definitions, an integer for how many arguments stay on
;;;      the head line.
;;;   3. A value that follows a `:keyword' argument goes two in from the
;;;      keyword, and a `cond' result that follows its test goes two in from
;;;      the test.  Both are how the formatter breaks a pair that will not
;;;      fit on one line — unless a COMMENT caused the break, in which case
;;;      nothing was wrapped and the alignment stands.
;;;   4. Anything else aligns under the first argument, as in any Lisp.

(defvar coil-indent-specs
  (let ((table (make-hash-table :test #'equal)))
    (dolist (head '("defn" "defcc" "defstruct" "defsum" "deftrait" "defprop"
                    "deftest" "impl"))
      (puthash head 'defun table))
    (dolist (head '("let" "when" "when-not" "unless" "while" "match" "for"
                    "with-open" "hm-for"))
      (puthash head 1 table))
    (dolist (head '("do" "loop" "comptime" "defer"))
      (puthash head 0 table))
    ;; `for-in' aligning where `for' indents its body is not a typo; neither
    ;; is `block' aligning under its label.  It is what the formatter does.
    (dolist (head '("if" "cond" "case" "for-in" "module" "import"
                    "include" "const" "def" "extern" "export" "export-c"
                    "meta" "derive" "static-assert"))
      (puthash head nil table))
    ;; `block' is deliberately absent: its `:label' is a keyword, so the
    ;; keyword rule already puts its body two columns in from the label,
    ;; which is where the formatter puts it.
    table)
  "How each form head indents: `defun', an integer, or nil to align.
A head that is absent falls back to `defun' if it starts with `def', and
to nil otherwise.  An entry mapped explicitly to nil keeps alignment and
is not caught by that fallback.")

(defconst coil-binding-forms '("let")
  "Forms whose first argument is a vector of NAME VALUE pairs.
Only these get the pair rule inside their vector; a vector that is not
pairs — `for''s `[i 0 n]', a `defn''s parameter list — aligns straight
down instead.")

(defconst coil-clause-forms '("cond")
  "Call forms whose arguments are TEST RESULT pairs.")

(defun coil--indent-spec-for (head)
  "The indent spec for form HEAD."
  (let ((found (gethash head coil-indent-specs 'coil--absent)))
    (cond ((not (eq found 'coil--absent)) found)
          ;; An unregistered `def…' head indents like a definition, so a
          ;; project-local macro such as `defcommand' lays out sensibly
          ;; without anyone having to register it.
          ((string-prefix-p "def" head) 'defun)
          (t nil))))

;;; Scanning a form's elements

(cl-defstruct (coil-scan (:constructor coil-scan-create) (:copier nil))
  "What the elements of a form look like above the line being indented."
  count         ; complete elements before the line, the head included
  last-start    ; where the last of them began
  last-end      ; and where it ended
  keyword)      ; whether that last element was a :keyword

(defun coil--scan-elements (open limit)
  "Describe the elements of the form or vector at OPEN that end before LIMIT."
  (save-excursion
    (goto-char (1+ open))
    (let ((count 0) last-start last-end keyword)
      (condition-case nil
          (while (progn
                   (forward-comment (buffer-size))
                   (and (< (point) limit)
                        (not (memq (char-after) '(?\) ?\] ?\})))))
            (let ((start (point)))
              (forward-sexp)
              (if (> (point) limit)
                  (goto-char limit)
                (setq count (1+ count)
                      last-start start
                      last-end (point)
                      keyword (eq (char-after start) ?:)))))
        (scan-error nil))
      (coil-scan-create :count count :last-start last-start
                        :last-end last-end :keyword keyword))))

(defun coil--comment-line-between-p (start end)
  "Whether a line holding nothing but a comment falls between START and END.
A comment TRAILING the code on START's own line does not count: it did not
force the break, and the formatter still treats the next line as a wrap."
  (when (and start end (< start end))
    (save-excursion
      (goto-char start)
      (forward-line 1)
      (let (found)
        (while (and (not found) (< (line-beginning-position) end))
          (skip-chars-forward " \t" (line-end-position))
          (when (eq (char-after) ?\;) (setq found t))
          (forward-line 1))
        found))))

(defun coil--wrapped-pair-p (scan limit)
  "Whether the line at LIMIT is the second half of a pair the formatter wrapped.
A comment line between the two halves means the break was the comment's
doing rather than a wrap, and the second half stays level with the first."
  (and (coil-scan-last-end scan)
       ;; A comment line at LIMIT is itself the break, not something wrapped.
       (not (save-excursion
              (goto-char limit)
              (skip-chars-forward " \t" (line-end-position))
              (eq (char-after) ?\;)))
       (not (coil--comment-line-between-p (coil-scan-last-end scan) limit))))

(defun coil--column-at (position)
  "The column POSITION sits in."
  (save-excursion (goto-char position) (current-column)))

;;; The four rules

(defun coil--indent-in-bracket (open indent-point)
  "Where a line inside the vector at OPEN goes.
Elements line up one column past the bracket.  A `let' binding whose VALUE
is pushed onto its own line is the exception: the formatter indents it two
further, under its own name rather than beside it —

    (let [idx (load (field box plain_index))
          indexed
            (if (= (primitive/cast i64 idx) 0)
                (None [(slice u8)])
                (hm-get [(slice u8) (slice u8)] (load idx) spelling))]"
  (let ((column (coil--column-at open))
        (scan (coil--scan-elements open indent-point)))
    (if (and (member (coil--bracket-owner open) coil-binding-forms)
             (cl-oddp (coil-scan-count scan))
             (coil--wrapped-pair-p scan indent-point))
        (+ column 1 lisp-body-indent)
      (1+ column))))

(defun coil--bracket-owner (open-bracket)
  "The head of the form whose FIRST argument is the vector at OPEN-BRACKET.
Nil when the bracket is anywhere else — nested inside the vector, in a
later argument, or not in a form at all."
  (save-excursion
    (goto-char open-bracket)
    (let ((form-start (nth 1 (syntax-ppss))))
      (when (and form-start (eq (char-after form-start) ?\())
        (goto-char (1+ form-start))
        (when (looking-at "\\(?:\\sw\\|\\s_\\)+")
          (let ((head (match-string-no-properties 0)))
            (goto-char (match-end 0))
            (skip-chars-forward " \t\n")
            (when (= (point) open-bracket) head)))))))

(defun coil--indent-defform (state)
  "Body indent for a definition form described by STATE.
`lisp-indent-defform' gives up — returns nil, and the caller then aligns
under the first argument — when the head line does not hold the whole
signature.  Coil signatures routinely do not: a `defn' with several
parameters puts one per line, and the body would land under the parameter
vector out at column forty.  A definition's body is two columns in from
the form, however far its signature ran."
  (+ lisp-body-indent (coil--column-at (elt state 1))))

(defun coil--indent-specform (count state indent-point)
  "Indent for a form with COUNT distinguished arguments before its body.
Body forms always land two columns in from the form itself.  Emacs's
`lisp-indent-specform' instead lines later body forms up under the FIRST
one whenever that shared the head's line — so `(loop (a)' would put `(b)'
under `(a)', out at the head's width — and `coil fmt' does not: a body is
a body wherever its first form happened to fit."
  (let ((column (coil--column-at (elt state 1))))
    (if (<= (coil-scan-count (coil--scan-elements (elt state 1) indent-point))
            count)
        ;; Still in the distinguished arguments, and one has been pushed onto
        ;; its own line: set it apart from the body that follows.
        (+ column (* 2 lisp-body-indent))
      (+ column lisp-body-indent))))

(defun coil--head-registered-p (head)
  "Whether HEAD has an explicit entry in `coil-indent-specs'."
  (not (eq (gethash head coil-indent-specs 'coil--absent) 'coil--absent)))

(defun coil--indent-wrapped-value (head open indent-point)
  "Where a keyword argument's wrapped value goes, or nil if this is not one.
`(TypeName :field (long-expression …))' and `(primitive/cast :i64 (read fd
…))' both break the same way when the value will not fit beside its
keyword: onto the next line, two columns in from the keyword, subordinate
to it rather than a sibling of it.

This is only for heads the spec table says nothing about — ordinary calls
and constructors.  In a language form a leading keyword is a label, not
the first of a pair: `(block :done BODY)' puts its body level with
`:done', and reading that as a wrapped value would indent the whole block,
and everything nested inside it, two columns too far."
  (let ((scan (coil--scan-elements open indent-point)))
    (when (coil--wrapped-pair-p scan indent-point)
      (cond
       ((and (coil-scan-keyword scan) (not (coil--head-registered-p head)))
        (+ (coil--column-at (coil-scan-last-start scan)) lisp-body-indent))
))))

(defun coil--indent-clause-form (open indent-point normal-indent)
  "Where a line inside a clause form at OPEN goes.
Arguments alternate test, result, test, result, so counting the complete
elements above says which half comes next: an even count — the head plus
an odd number of arguments — means the last was a test and this line is
its result, which the formatter tucks two columns in.

Both halves anchor to the FIRST ARGUMENT rather than to NORMAL-INDENT,
which is wherever the previous line began.  After a result that had to
wrap, that is two columns too far in, and every test below it would drift
along behind."
  (let* ((scan (coil--scan-elements open indent-point))
         (base (or (coil--first-argument-column open) normal-indent)))
    (if (and (>= (coil-scan-count scan) 2)
             (cl-evenp (coil-scan-count scan))
             (coil--wrapped-pair-p scan indent-point))
        (+ base lisp-body-indent)
      base)))

(defun coil--first-argument-column (open-paren)
  "The column the first argument of the form at OPEN-PAREN starts in.
Nil when the head is the last thing on its line."
  (save-excursion
    (goto-char (1+ open-paren))
    (condition-case nil
        (progn (forward-sexp)
               (skip-chars-forward " \t")
               (unless (eolp) (current-column)))
      (scan-error nil))))

(defun coil--named-constructor-p (open-paren)
  "Whether the form at OPEN-PAREN is a named-constructor call.
Coil has no positional struct constructors, so a struct is built as
`(TypeName :field value …)'.  Those lay out as keyword pairs two columns
in from the form rather than as a call whose arguments line up under the
first one, and a CamelCase head followed by a keyword is what separates
them from `(Circle [radius] …)', an ordinary positional form.  The head
may be namespace-qualified — `(alloc/AllocRequest :type-id …)' — so it is
the segment after the last `/' that has to be capitalised."
  (save-excursion
    (goto-char (1+ open-paren))
    ;; `case-fold-search' defaults to t, which would let [A-Z] match every
    ;; head there is and make a constructor of every call.
    (let ((case-fold-search nil))
      (when (looking-at "\\(?:\\sw\\|\\s_\\)+")
        ;; `split-string' clobbers the match data, so take the end first.
        (let ((head-end (match-end 0))
              (base (car (last (split-string (match-string-no-properties 0)
                                             "/")))))
          (and (string-match-p "\\`[A-Z]" base)
               (progn (goto-char head-end)
                      (forward-comment (buffer-size))
                      (eq (char-after) ?:))))))))

(defun coil--indent-state ()
  "The parser state at point, with the last complete subexpression restored.
`parse-partial-sexp' clears that slot once it has scanned past a comment.
`calculate-lisp-indent' then sees a form with nothing in it yet and offers
one column past the open paren, so a comment in the middle of a body
nudges itself and everything under it out of line — the classic Lisp-mode
symptom where a commented body drifts a column left.  Re-derive the slot
by scanning the form's own elements, which ignore comments."
  (let ((state (copy-sequence (syntax-ppss))))
    (when (and (nth 1 state) (null (nth 2 state)))
      (when-let ((last (coil-scan-last-start
                        (coil--scan-elements (nth 1 state) (point)))))
        (setf (nth 2 state) last)))
    state))

(defun coil-indent-line (&optional indent)
  "Indent the current line as Coil code, optionally to INDENT.
Differs from `lisp-indent-line' in one way, and it matters: a line that
starts with a single `;' is indented as code rather than shoved out to
`comment-column'.  Emacs Lisp's convention is that one semicolon means a
margin comment and two mean a comment about the code; Coil's is the other
way round — `;' is the ordinary comment and `;;' marks documentation — so
the Lisp rule would push nearly every comment in a Coil file to column
forty."
  (let* ((position (- (point-max) (point)))
         (indent (progn (beginning-of-line)
                        (or indent (calculate-lisp-indent (coil--indent-state)))))
         (start (point)))
    (skip-chars-forward " \t")
    (when (consp indent) (setq indent (car indent)))
    (when (and (integerp indent) (/= indent (current-column)))
      (delete-region start (point))
      (indent-to indent))
    (when (> (- (point-max) position) (point))
      (goto-char (- (point-max) position)))))

(defun coil-indent-function (indent-point state)
  "Coil's `lisp-indent-function'.
INDENT-POINT and STATE are as documented for that variable."
  (let ((normal-indent (current-column))
        (open (elt state 1)))
    (goto-char (1+ open))
    (cond
     ;; Inside [] or {} — a parameter list, a `let' binding vector, a match
     ;; pattern.
     ((memq (char-after open) '(?\[ ?\{))
      (coil--indent-in-bracket open indent-point))
     ;; `(  (f x)' — the head is itself a form, so align as data.
     ((and (elt state 2) (not (looking-at "\\sw\\|\\s_")))
      (unless (> (save-excursion (forward-line 1) (point))
                 calculate-lisp-indent-last-sexp)
        (goto-char calculate-lisp-indent-last-sexp)
        (beginning-of-line)
        (parse-partial-sexp (point) calculate-lisp-indent-last-sexp 0 t))
      (backward-prefix-chars)
      (current-column))
     (t
      (let* ((head (buffer-substring-no-properties
                    (point) (progn (forward-sexp 1) (point))))
             (spec (coil--indent-spec-for head)))
        (cond
         ((eq spec 'defun) (coil--indent-defform state))
         ((integerp spec) (coil--indent-specform spec state indent-point))
         ((member head coil-clause-forms)
          (coil--indent-clause-form open indent-point normal-indent))
         ((coil--indent-wrapped-value head open indent-point))
         ((coil--named-constructor-p open)
          (+ (coil--column-at open) lisp-body-indent))
         (t normal-indent)))))))


;;; ---------------------------------------------------------------------------
;;; Buffer facts: project root, module name

(defcustom coil-project-markers '("Coil.toml")
  "Files whose presence marks a directory as a Coil project root."
  :type '(repeat string)
  :group 'coil)

(defun coil-project-root (&optional file)
  "The directory Coil commands should run from for FILE.
Prefers a `Coil.toml', then a compiler checkout (a directory holding both
`src/compiler' and `src/stdlib'), then the enclosing Git repository, and
finally the file's own directory."
  (let ((start (or file buffer-file-name default-directory)))
    (expand-file-name
     (or (cl-some (lambda (marker) (locate-dominating-file start marker))
                  coil-project-markers)
         (locate-dominating-file
          start (lambda (dir)
                  (and (file-directory-p (expand-file-name "src/compiler" dir))
                       (file-directory-p (expand-file-name "src/stdlib" dir)))))
         (locate-dominating-file start ".git")
         (file-name-directory (expand-file-name start))))))

(defun coil-buffer-module ()
  "The namespace declared by this buffer's `(module NAME)', or nil."
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-min))
      (when (re-search-forward "^[ \t]*(module[ \t\n]+\\([^ \t\n()]+\\)" nil t)
        (match-string-no-properties 1)))))

(defvar coil--stdlib-directory 'unset
  "Cache for `coil-stdlib-directory'.")

(defun coil-stdlib-directory ()
  "Where the toolchain's standard-library sources live, or nil.
`coil --version' reports the library it resolved; those are real `.coil'
files, which is what makes \\[xref-find-definitions] work into the stdlib."
  (when (eq coil--stdlib-directory 'unset)
    (setq coil--stdlib-directory
          (with-temp-buffer
            (when (and (executable-find coil-program)
                       (zerop (ignore-errors
                                (call-process coil-program nil t nil "--version"))))
              (goto-char (point-min))
              (when (re-search-forward "^stdlib: [a-z]+: \\(.+\\)$" nil t)
                (let ((dir (string-trim (match-string 1))))
                  (and (file-directory-p dir) dir)))))))
  coil--stdlib-directory)


;;; ---------------------------------------------------------------------------
;;; Compilation-buffer navigation
;;;
;;; Coil's diagnostics are rustc-shaped.  Teaching `compile' about them is what
;;; makes RET on an error in a test run or a build jump to the source.

(defconst coil-compilation-error-regexp
  "^ *--> \\([^:\n ]+\\):\\([0-9]+\\):\\([0-9]+\\)"
  "Matches the `  --> file:line:col' locator under a Coil diagnostic.")

(defconst coil-compilation-assert-regexp
  "^ *at \\([^:\n ]+\\):\\([0-9]+\\)$"
  "Matches the `  at file:line' locator under a failed assertion.")

(with-eval-after-load 'compile
  (dolist (entry `((coil ,coil-compilation-error-regexp 1 2 3 2)
                   (coil-assert ,coil-compilation-assert-regexp 1 2 nil 2)))
    (setf (alist-get (car entry) compilation-error-regexp-alist-alist)
          (cdr entry))
    (cl-pushnew (car entry) compilation-error-regexp-alist)))


;;; ---------------------------------------------------------------------------
;;; paredit

(defun coil-space-for-delimiter-p (endp delimiter)
  "Whether paredit should insert a space before DELIMITER.
Suppresses the space after a reader prefix (`~', \"`\", `~@', `#') and
after the `c' of a `c\"…\"' byte string, so structural editing does not
rewrite valid Coil into something that no longer reads."
  (or endp
      (save-excursion
        (let ((before (char-before)))
          (not (or (memq before '(?~ ?` ?' ?# ?@))
                   (and (eq delimiter ?\")
                        (eq before ?c)
                        (let ((prior (char-before (1- (point)))))
                          (not (and prior
                                    (memq (char-syntax prior) '(?w ?_)))))))))))) 

(with-eval-after-load 'paredit
  (add-to-list 'paredit-space-for-delimiter-predicates
               #'coil-space-for-delimiter-p))


;;; ---------------------------------------------------------------------------
;;; Keymap
;;;
;;; Mostly CIDER's layout, so Clojure muscle memory transfers.  Three
;;; deliberate departures, all because Coil is a compiled language and CIDER
;;; is not:
;;;
;;;   C-c C-i  the type of the expression at point — Coil is statically
;;;            typed, so that is worth a key.
;;;   C-c C-r  `coil run' on this file.  Building and running a file is an
;;;            everyday action here, not a REPL afterthought, so it gets a
;;;            two-key binding; CIDER's eval-region moves to C-c C-x.
;;;   C-c C-v  `coil check' (verify).  CIDER makes C-c C-v a prefix for its
;;;            eval commands; nothing here needs that many, so the letter is
;;;            spent on the one command that wants it.
;;;
;;; `coil-balance-buffer' is intentionally unbound: repairing delimiters is
;;; a once-in-a-while rescue, and M-x plus the menu are enough for it.

(defvar coil-mode-map
  (let ((map (make-sparse-keymap)))
    ;; Connection
    (define-key map (kbd "C-c M-j") #'coil-repl)
    (define-key map (kbd "C-c C-z") #'coil-repl-switch)
    (define-key map (kbd "C-c C-q") #'coil-repl-quit)
    (define-key map (kbd "C-c M-o") #'coil-repl-clear)
    (define-key map (kbd "C-c C-b") #'coil-repl-interrupt)
    (define-key map (kbd "C-c M-r") #'coil-repl-reset)

    ;; Evaluation
    (define-key map (kbd "C-x C-e") #'coil-eval-last-sexp)
    (define-key map (kbd "C-c C-e") #'coil-eval-last-sexp)
    (define-key map (kbd "C-M-x")   #'coil-eval-defun)
    (define-key map (kbd "C-c C-c") #'coil-eval-defun)
    (define-key map (kbd "C-c C-x") #'coil-eval-region)
    (define-key map (kbd "C-c C-k") #'coil-load-buffer)
    (define-key map (kbd "C-c C-p") #'coil-eval-last-sexp-to-buffer)
    (define-key map (kbd "C-c C-w") #'coil-eval-last-sexp-to-comment)
    (define-key map (kbd "C-c C-m") #'coil-macroexpand)
    (define-key map (kbd "C-c C-i") #'coil-type-at-point)

    ;; Documentation
    (define-key map (kbd "C-c C-d C-d") #'coil-doc-symbol)
    (define-key map (kbd "C-c C-d d")   #'coil-doc-symbol)
    (define-key map (kbd "C-c C-d C-a") #'coil-apropos)
    (define-key map (kbd "C-c C-d a")   #'coil-apropos)
    (define-key map (kbd "C-c C-d C-n") #'coil-doc-namespace)
    (define-key map (kbd "C-c C-d n")   #'coil-doc-namespace)
    (define-key map (kbd "C-c C-d C-g") #'coil-guide)
    (define-key map (kbd "C-c C-d g")   #'coil-guide)

    ;; Tests
    (define-key map (kbd "C-c C-t C-t") #'coil-test-run-at-point)
    (define-key map (kbd "C-c C-t t")   #'coil-test-run-at-point)
    (define-key map (kbd "C-c C-t C-n") #'coil-test-run-file)
    (define-key map (kbd "C-c C-t n")   #'coil-test-run-file)
    (define-key map (kbd "C-c C-t C-p") #'coil-test-run-project)
    (define-key map (kbd "C-c C-t p")   #'coil-test-run-project)

    ;; Source hygiene
    (define-key map (kbd "C-c C-f")   #'coil-format-buffer)
    (define-key map (kbd "C-c C-l")   #'coil-lint-fix)
    (define-key map (kbd "C-c C-v")   #'coil-check-buffer)

    ;; Compiling and running
    (define-key map (kbd "C-c C-r")   #'coil-run-buffer)
    map)
  "Keymap for `coil-mode'.")

(easy-menu-define coil-mode-menu coil-mode-map
  "Menu for `coil-mode'."
  '("Coil"
    ["Start REPL"            coil-repl]
    ["Switch to REPL"        coil-repl-switch]
    ["Quit REPL"             coil-repl-quit]
    "--"
    ["Eval last sexp"        coil-eval-last-sexp]
    ["Eval top-level form"   coil-eval-defun]
    ["Eval region"           coil-eval-region]
    ["Load buffer"           coil-load-buffer]
    ["Type of expression"    coil-type-at-point]
    ["Macroexpand"           coil-macroexpand]
    "--"
    ["Documentation"         coil-doc-symbol]
    ["Apropos"               coil-apropos]
    ["Namespace"             coil-doc-namespace]
    ["Language guide"        coil-guide]
    "--"
    ["Run test at point"     coil-test-run-at-point]
    ["Run file tests"        coil-test-run-file]
    ["Run project tests"     coil-test-run-project]
    "--"
    ["Format buffer"         coil-format-buffer]
    ["Lint and fix"          coil-lint-fix]
    ["Check buffer"          coil-check-buffer]
    ["Repair delimiters"     coil-balance-buffer]
    ["Build and run buffer"  coil-run-buffer]))

;; The commands bound above live in the sibling files.  Autoloading them keeps
;; `(require 'coil-mode)' enough to get a working keymap and menu, and keeps a
;; buffer that is only ever edited from paying for the REPL machinery.
(autoload 'coil-repl "coil-repl" "Start or switch to a Coil REPL." t)
(autoload 'coil-repl-switch "coil-repl" "Switch to the Coil REPL." t)
(autoload 'coil-repl-quit "coil-repl" "Shut down the Coil REPL." t)
(autoload 'coil-repl-clear "coil-repl" "Erase the Coil REPL buffer." t)
(autoload 'coil-repl-interrupt "coil-repl" "Interrupt the Coil REPL." t)
(autoload 'coil-repl-reset "coil-repl" "Clear the Coil session." t)
(autoload 'coil-repl-connected-p "coil-repl" "Whether a Coil REPL is running.")
(autoload 'coil-eval-last-sexp "coil-eval" "Evaluate the form before point." t)
(autoload 'coil-eval-defun "coil-eval" "Evaluate the top-level form." t)
(autoload 'coil-eval-region "coil-eval" "Evaluate the region." t)
(autoload 'coil-load-buffer "coil-eval" "Load this buffer into the session." t)
(autoload 'coil-eval-last-sexp-to-buffer "coil-eval" "Evaluate to a buffer." t)
(autoload 'coil-eval-last-sexp-to-comment "coil-eval" "Evaluate to a comment." t)
(autoload 'coil-macroexpand "coil-eval" "Expand the form at point." t)
(autoload 'coil-type-at-point "coil-eval" "Infer the type at point." t)
(autoload 'coil-doc-symbol "coil-doc" "Documentation for a name." t)
(autoload 'coil-apropos "coil-doc" "Search definitions in scope." t)
(autoload 'coil-doc-namespace "coil-doc" "Show a whole namespace." t)
(autoload 'coil-guide "coil-doc" "Look a topic up in the language guide." t)
(autoload 'coil-eldoc-function "coil-doc" "Eldoc for Coil.")
(autoload 'coil-completion-at-point "coil-doc" "Completion for Coil.")
(autoload 'coil-xref-backend "coil-doc" "The xref backend for Coil.")
(autoload 'coil-refresh-namespace-cache "coil-doc" "Forget cached docs." t)
(autoload 'coil-format-buffer "coil-check" "Format with coil fmt." t)
(autoload 'coil-lint-fix "coil-check" "Apply coil lint --fix." t)
(autoload 'coil-check-buffer "coil-check" "Typecheck with coil check." t)
(autoload 'coil-balance-buffer "coil-check" "Repair delimiters." t)
(autoload 'coil-run-buffer "coil-check" "Build and run this file." t)
(autoload 'coil-flymake-backend "coil-check" "Flymake backend for Coil.")
(autoload 'coil-format-before-save-mode "coil-check" "Format on save." t)
(autoload 'coil-test-run-at-point "coil-test" "Run the test at point." t)
(autoload 'coil-test-run-file "coil-test" "Run this file's tests." t)
(autoload 'coil-test-run-project "coil-test" "Run the project's tests." t)


;;; ---------------------------------------------------------------------------
;;; The mode

(defconst coil-imenu-generic-expression
  '(("Fn"     "^(defn\\_>[ \t\n]+\\([^ \t\n()]+\\)" 1)
    ("Type"   "^(\\(?:defstruct\\|defsum\\|deftrait\\)\\_>[ \t\n]+\\([^ \t\n()]+\\)" 1)
    ("Impl"   "^(impl\\_>[ \t\n]+\\([^ \t\n()]+\\)" 1)
    ("Test"   "^(\\(?:deftest\\|defprop\\)\\_>[ \t\n]+\\([^ \t\n()]+\\)" 1)
    ("Extern" "^(extern\\_>[ \t\n]+\\([^ \t\n()]+\\)" 1)
    ("Const"  "^(\\(?:const\\|def\\)\\_>[ \t\n]+\\([^ \t\n()]+\\)" 1))
  "Imenu index for `coil-mode'.")

(defun coil-current-defun-name ()
  "The name of the definition point is inside, for `add-log' and `which-func'."
  (save-excursion
    (when (ignore-errors (beginning-of-defun) t)
      (when (looking-at "([^ \t\n()]+[ \t\n]+\\([^ \t\n()]+\\)")
        (match-string-no-properties 1)))))

;;;###autoload
(define-derived-mode coil-mode prog-mode "Coil"
  "Major mode for editing Coil source.

\\{coil-mode-map}"
  :syntax-table coil-mode-syntax-table
  (setq-local comment-start ";")
  (setq-local comment-add 1)
  (setq-local comment-start-skip ";+[ \t]*")
  (setq-local comment-column 40)
  (setq-local comment-use-syntax t)
  (setq-local parse-sexp-ignore-comments t)
  (setq-local multibyte-syntax-as-symbol t)
  (setq-local open-paren-in-column-0-is-defun-start nil)

  (setq-local indent-line-function #'coil-indent-line)
  (setq-local indent-tabs-mode nil)
  (setq-local lisp-indent-function #'coil-indent-function)
  (setq-local outline-regexp ";;;\\(;* [^ \t\n]\\)\\|(")
  (setq-local outline-level 'lisp-outline-level)

  (setq-local font-lock-defaults
              '(coil-font-lock-keywords
                nil nil nil nil
                (font-lock-mark-block-function . mark-defun)
                (font-lock-syntactic-face-function
                 . coil-font-lock-syntactic-face)))

  (setq-local imenu-generic-expression coil-imenu-generic-expression)
  (setq-local imenu-case-fold-search nil)
  (setq-local add-log-current-defun-function #'coil-current-defun-name)

  (setq-local electric-indent-inhibit nil)
  (setq-local paragraph-start "\f\\|[ \t]*$\\|[ \t]*;+[ \t]*$")
  (setq-local paragraph-separate paragraph-start)
  (setq-local fill-paragraph-function #'lisp-fill-paragraph))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.coil\\'" . coil-mode))


;;; ---------------------------------------------------------------------------
;;; One-line setup

(defcustom coil-setup-features
  '(paredit rainbow-delimiters eldoc completion xref flymake)
  "Which conveniences `coil-setup-default' turns on in `coil-mode' buffers.
Each is enabled only if the package it needs is actually installed."
  :type '(set (const paredit)
              (const rainbow-delimiters)
              (const eldoc)
              (const completion)
              (const xref)
              (const flymake))
  :group 'coil)

(defun coil--setup-buffer ()
  "Enable `coil-setup-features' in the current Coil buffer."
  (when (and (memq 'paredit coil-setup-features) (fboundp 'enable-paredit-mode))
    (enable-paredit-mode))
  (when (and (memq 'rainbow-delimiters coil-setup-features)
             (fboundp 'rainbow-delimiters-mode))
    (rainbow-delimiters-mode 1))
  (when (memq 'eldoc coil-setup-features)
    (add-hook 'eldoc-documentation-functions #'coil-eldoc-function nil t)
    (eldoc-mode 1))
  (when (memq 'completion coil-setup-features)
    (add-hook 'completion-at-point-functions #'coil-completion-at-point nil t))
  (when (memq 'xref coil-setup-features)
    (add-hook 'xref-backend-functions #'coil-xref-backend nil t))
  (when (memq 'flymake coil-setup-features)
    (add-hook 'flymake-diagnostic-functions #'coil-flymake-backend nil t)
    (flymake-mode 1)))

;;;###autoload
(defun coil-setup-default ()
  "Wire up the batteries-included Coil experience.
Adds `coil--setup-buffer' to `coil-mode-hook' and turns the same
structural editing on in the REPL buffer."
  (interactive)
  (add-hook 'coil-mode-hook #'coil--setup-buffer)
  (add-hook 'coil-repl-mode-hook #'coil--setup-repl-buffer))

(defun coil--setup-repl-buffer ()
  "Structural editing and colour in the REPL, matching the source buffer."
  (when (and (memq 'paredit coil-setup-features) (fboundp 'enable-paredit-mode))
    (enable-paredit-mode))
  (when (and (memq 'rainbow-delimiters coil-setup-features)
             (fboundp 'rainbow-delimiters-mode))
    (rainbow-delimiters-mode 1))
  (when (memq 'completion coil-setup-features)
    (add-hook 'completion-at-point-functions #'coil-completion-at-point nil t)))

(provide 'coil-mode)
;;; coil-mode.el ends here
