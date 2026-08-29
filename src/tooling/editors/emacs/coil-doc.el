;;; coil-doc.el --- Documentation, completion and navigation for Coil -*- lexical-binding: t; -*-

;;; Commentary:

;; Everything that answers "what is this name?" — eldoc, completion,
;; documentation lookup, apropos, and jump-to-definition.
;;
;; None of it goes through the REPL.  `coil namespace NS' prints every
;; definition in a namespace with its signature and its doc comment, in about
;; fifteen milliseconds, from any directory, whether or not a session is
;; running.  That is a better source than a live connection would be: it works
;; in a file you just opened, it does not depend on the file compiling, and it
;; covers the whole standard library rather than only what has been loaded.
;;
;; The index is per-namespace and namespace-aware in the Clojure sense: the
;; buffer's own `(import …)' forms decide what is in scope and under which
;; alias, `coil.core' is implicit unless the buffer imports it explicitly, and
;; `:use *' / `:use [names]' / `:as' / `:exclude' / `:rename' are each
;; honoured.  Completing inside a file that imports `coil.str' as `s' offers
;; `s/str-concat', and not `hm-put!' from a namespace nobody imported.

;;; Code:

(require 'cl-lib)
(require 'subr-x)
(require 'xref)
(require 'coil-mode)

(defcustom coil-doc-cache-ttl 300
  "Seconds a namespace's parsed documentation stays cached.
The toolchain's own library only changes when it is rebuilt; a project
namespace changes as you edit it, which is what the timeout is for."
  :type 'number
  :group 'coil)

(defcustom coil-eldoc-show-signature t
  "Whether eldoc reports the signature of the enclosing call."
  :type 'boolean
  :group 'coil)


;;; ---------------------------------------------------------------------------
;;; Running the toolchain

(defun coil--run (&rest args)
  "Run `coil' with ARGS in the project root; return stdout, or nil on failure."
  (let ((default-directory (coil-project-root)))
    (with-temp-buffer
      (let ((status (ignore-errors
                      (apply #'call-process coil-program nil
                             (list (current-buffer) nil) nil args))))
        (when (eq status 0) (buffer-string))))))


;;; ---------------------------------------------------------------------------
;;; Parsing `coil namespace'
;;;
;;; The output is markdown:
;;;
;;;   ## str-concat  *(fn)*
;;;
;;;   ```lisp
;;;   (defn str-concat [(a (dyn Allocator)) …] (-> (Option (slice u8))))
;;;   ```
;;;
;;;   Concatenate into freshly-allocated bytes; `(None)` on OOM. …

(cl-defstruct (coil-def (:constructor coil-def-create) (:copier nil))
  "One definition as the compiler describes it."
  name namespace kind signature doc)

(defvar coil--namespace-cache (make-hash-table :test #'equal)
  "Namespace -> (TIMESTAMP . list of `coil-def').")

(defvar coil--all-namespaces nil
  "Every namespace name the toolchain and the project know about.")

(defvar-local coil--scope-cache nil
  "Cons of the buffer tick the scope was built at and the scope itself.")

(defun coil--parse-namespace-doc (text namespace)
  "Parse the markdown TEXT of `coil namespace NAMESPACE' into `coil-def's."
  (let ((defs nil)
        (start 0))
    (while (string-match
            "^## \\(\\S-+\\)[ \t]+\\*(\\([^)]+\\))\\*[ \t]*$" text start)
      (let* ((name (match-string 1 text))
             (kind (match-string 2 text))
             (body-start (match-end 0))
             (body-end (or (and (string-match "^## \\S-+[ \t]+\\*(" text body-start)
                                (match-beginning 0))
                           (length text)))
             (body (substring text body-start body-end))
             (signature
              (when (string-match "```lisp\n\\(\\(?:.\\|\n\\)*?\\)\n?```" body)
                (string-trim (match-string 1 body))))
             (doc (string-trim
                   (replace-regexp-in-string
                    "```lisp\n\\(?:.\\|\n\\)*?\n?```" "" body))))
        (push (coil-def-create :name name :namespace namespace :kind kind
                               :signature signature
                               :doc (unless (string-empty-p doc) doc))
              defs)
        (setq start body-start)))
    (nreverse defs)))

(defun coil-namespace-definitions (namespace &optional force)
  "Every definition in NAMESPACE, cached for `coil-doc-cache-ttl' seconds.
With FORCE, refresh regardless of the cache."
  (let ((entry (gethash namespace coil--namespace-cache)))
    (if (and entry (not force)
             (< (- (float-time) (car entry)) coil-doc-cache-ttl))
        (cdr entry)
      (let* ((text (coil--run "namespace" namespace))
             (defs (and text (coil--parse-namespace-doc text namespace))))
        (puthash namespace (cons (float-time) defs) coil--namespace-cache)
        defs))))

;;;###autoload
(defun coil-refresh-namespace-cache ()
  "Forget every cached namespace.
Worth doing after a toolchain upgrade, or after adding a definition to a
namespace another buffer imports."
  (interactive)
  (clrhash coil--namespace-cache)
  (setq coil--all-namespaces nil)
  (dolist (buffer (buffer-list))
    (with-current-buffer buffer
      (when (derived-mode-p 'coil-mode) (setq coil--scope-cache nil))))
  (message "Coil namespace cache cleared"))

(defun coil-all-namespaces ()
  "Every namespace the toolchain bundles, plus this project's own."
  (or coil--all-namespaces
      (setq coil--all-namespaces
            (append (split-string (or (coil--run "namespaces") "") "\n" t)
                    (coil--project-namespaces)))))

(defun coil--project-namespaces ()
  "Namespaces declared by `.coil' files under the project root."
  (let ((root (coil-project-root))
        (names nil))
    (dolist (file (ignore-errors
                    (directory-files-recursively root "\\.coil\\'" nil
                                                 (lambda (dir)
                                                   (not (string-prefix-p
                                                         "." (file-name-nondirectory dir)))))))
      (with-temp-buffer
        (ignore-errors
          (insert-file-contents file nil 0 2000)
          (goto-char (point-min))
          (when (re-search-forward "^[ \t]*(module[ \t\n]+\\([^ \t\n()]+\\)" nil t)
            (push (match-string-no-properties 1) names)))))
    (nreverse names)))


;;; ---------------------------------------------------------------------------
;;; What is in scope in this buffer

(cl-defstruct (coil-import (:constructor coil-import-create) (:copier nil))
  "One `(import …)' form, decoded."
  namespace
  alias        ; the `:as' name, or nil
  use          ; t for `:use *', a list of names for `:use [a b]', nil otherwise
  exclude      ; names dropped by `:exclude'
  rename)      ; alist of (original . local) from `:rename'

(defun coil--read-name-vector (text)
  "The names in a `[a b c]' vector at the start of TEXT."
  (when (string-match "\\[\\([^]]*\\)\\]" text)
    (split-string (match-string 1 text) "[ \t\n]+" t)))

(defun coil--parse-import (form)
  "Decode the text of one `(import …)' FORM."
  (when (string-match "(import[ \t\n]+\"\\([^\"]+\\)\"\\(\\(?:.\\|\n\\)*\\)" form)
    (let* ((namespace (match-string 1 form))
           (rest (match-string 2 form))
           (alias (when (string-match ":as[ \t\n]+\\([^] \t\n()]+\\)" rest)
                    (match-string 1 rest)))
           (use (cond ((string-match ":use[ \t\n]+\\*" rest) t)
                      ((string-match ":use[ \t\n]+\\(\\[[^]]*\\]\\)" rest)
                       (coil--read-name-vector (match-string 1 rest)))))
           (exclude (when (string-match ":exclude[ \t\n]+\\(\\[[^]]*\\]\\)" rest)
                      (coil--read-name-vector (match-string 1 rest))))
           ;; `:rename [[a b] [c d]]' — the outer vector holds pairs, so the
           ;; scan has to reach the OUTER closing bracket, not the first one.
           (rename (when (string-match
                          ":rename[ \t\n]+\\[\\(\\(?:[ \t\n]*\\[[^]]*\\]\\)+\\)[ \t\n]*\\]"
                          rest)
                     (let ((pairs nil) (start 0) (text (match-string 1 rest)))
                       (while (string-match "\\[\\([^] \t\n]+\\)[ \t\n]+\\([^] \t\n]+\\)\\]"
                                            text start)
                         (push (cons (match-string 1 text) (match-string 2 text)) pairs)
                         (setq start (match-end 0)))
                       (nreverse pairs)))))
      (coil-import-create :namespace namespace :alias alias :use use
                          :exclude exclude :rename rename))))

(defun coil-buffer-imports ()
  "Every namespace in scope in this buffer, as `coil-import's.
`coil.core' is implicit — every module behaves as if it began with
`(import \"coil.core\" :use *)' — unless the buffer imports it explicitly,
in which case the explicit form replaces the implicit one."
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-min))
      (let (imports)
        (while (re-search-forward "^[ \t]*(import\\_>" nil t)
          (goto-char (match-beginning 0))
          (let ((start (point)))
            (condition-case nil
                (progn (forward-sexp)
                       (when-let ((import (coil--parse-import
                                           (buffer-substring-no-properties
                                            start (point)))))
                         (push import imports)))
              (scan-error (goto-char (line-end-position))))))
        (setq imports (nreverse imports))
        (unless (cl-find "coil.core" imports
                         :key #'coil-import-namespace :test #'equal)
          (push (coil-import-create :namespace "coil.core" :use t) imports))
        imports))))

(defun coil--import-local-names (import)
  "The (LOCAL-NAME . `coil-def') pairs IMPORT contributes."
  (let* ((defs (coil-namespace-definitions (coil-import-namespace import)))
         (use (coil-import-use import))
         (alias (coil-import-alias import))
         (exclude (coil-import-exclude import))
         (rename (coil-import-rename import))
         (result nil))
    (dolist (def defs)
      (let ((name (coil-def-name def)))
        (unless (member name exclude)
          (when (or (eq use t) (and (listp use) (member name use)))
            (push (cons (or (cdr (assoc name rename)) name) def) result))
          (when alias
            (push (cons (concat alias "/" name) def) result)))))
    (nreverse result)))

(defun coil-buffer-scope ()
  "An alist of every name visible in this buffer to its `coil-def'.
Local definitions shadow imported ones, as they do at compile time.

Cached against the buffer's modification tick: eldoc and completion both
ask for this on every keystroke, and it rescans the buffer and walks
several hundred imported definitions to answer."
  (let ((tick (buffer-chars-modified-tick)))
    (unless (and coil--scope-cache (eq (car coil--scope-cache) tick))
      (let ((scope nil))
        (dolist (import (coil-buffer-imports))
          (setq scope (append scope (coil--import-local-names import))))
        (setq coil--scope-cache
              (cons tick (append (coil--buffer-definitions) scope)))))
    (cdr coil--scope-cache)))

(defconst coil--definition-scan-regexp
  "^[ \t]*(\\(defn\\|defcc\\|defstruct\\|defsum\\|deftrait\\|deftest\\|defprop\\|const\\|def\\|extern\\|impl\\)\\_>[ \t\n]+\\([^ \t\n()]+\\)"
  "Matches a top-level definition and captures its head and name.")

(defun coil--buffer-definitions (&optional buffer)
  "The definitions BUFFER makes itself, as (NAME . `coil-def') pairs."
  (with-current-buffer (or buffer (current-buffer))
    (save-excursion
      (save-restriction
        (widen)
        (goto-char (point-min))
        (let ((namespace (coil-buffer-module))
              (result nil))
          (while (re-search-forward coil--definition-scan-regexp nil t)
            (let ((kind (coil--normalize-kind (match-string-no-properties 1)))
                  (name (match-string-no-properties 2))
                  (signature
                   (save-excursion
                     (goto-char (match-beginning 0))
                     (let ((start (point)))
                       (condition-case nil
                           (progn (forward-sexp)
                                  (coil--signature-line
                                   (buffer-substring-no-properties start (point))))
                         (scan-error nil))))))
              (push (cons name (coil-def-create :name name :namespace namespace
                                                :kind kind :signature signature))
                    result)))
          (nreverse result))))))

(defconst coil--kind-names
  '(("defn" . "fn") ("defcc" . "fn") ("defstruct" . "struct")
    ("defsum" . "sum") ("deftrait" . "trait") ("deftest" . "test")
    ("defprop" . "prop") ("const" . "const") ("def" . "const")
    ("extern" . "extern") ("impl" . "impl"))
  "Definition heads mapped to the kind names `coil namespace' prints, so a
local definition and an imported one are described the same way.")

(defun coil--normalize-kind (head)
  "The kind name for a definition whose head is HEAD."
  (or (cdr (assoc head coil--kind-names)) head))

(defun coil--signature-line (form)
  "The head line of FORM — up to the return type — as a one-line signature."
  (let* ((flat (replace-regexp-in-string "[ \t\n]+" " " (string-trim form))))
    (if (string-match "\\`\\((\\(?:defn\\|defcc\\)[^[]*\\[.*?\\][ \t]*(-> [^)]*)\\)" flat)
        (concat (match-string 1 flat) ")")
      (truncate-string-to-width flat 120 nil nil "…"))))


;;; ---------------------------------------------------------------------------
;;; The symbol at point

(defun coil-symbol-at-point ()
  "The Coil name at point, or nil."
  (let ((thing (thing-at-point 'symbol t)))
    (when (and thing (not (string-empty-p thing)))
      (string-trim thing "[~`'#@]+" "[]),]+"))))

(defun coil-enclosing-head ()
  "The head symbol of the call point is inside, or nil."
  (save-excursion
    (let ((state (syntax-ppss)))
      (when (nth 1 state)
        (goto-char (1+ (nth 1 state)))
        (when (looking-at "\\(?:\\sw\\|\\s_\\)+")
          (match-string-no-properties 0))))))

(defun coil-lookup (name)
  "The `coil-def' for NAME in this buffer's scope, or nil.
An explicitly qualified `ns/name' is resolved against that namespace even
when the buffer never imported it, so a name pasted from documentation
still looks up."
  (or (cdr (assoc name (coil-buffer-scope)))
      (when (string-match "\\`\\([^/]+\\)/\\(.+\\)\\'" name)
        (let ((qualifier (match-string 1 name))
              (bare (match-string 2 name)))
          (cl-find bare
                   (coil-namespace-definitions
                    (if (string-match-p "\\." qualifier)
                        qualifier
                      (or (coil--namespace-for-alias qualifier) qualifier)))
                   :key #'coil-def-name :test #'equal)))))

(defun coil--namespace-for-alias (alias)
  "The namespace this buffer imported under ALIAS, or nil."
  (cl-loop for import in (coil-buffer-imports)
           when (equal alias (coil-import-alias import))
           return (coil-import-namespace import)))


;;; ---------------------------------------------------------------------------
;;; eldoc

(defun coil--eldoc-definition ()
  "The definition eldoc should describe.
The name at point when it names one, otherwise the head of the call point
is inside: standing on an argument should still say what you are calling,
which is most of what eldoc is for."
  (or (when-let ((name (coil-symbol-at-point))) (coil-lookup name))
      (when coil-eldoc-show-signature
        (when-let ((head (coil-enclosing-head))) (coil-lookup head)))))

(defun coil-eldoc-function (callback &rest _)
  "Report the signature of the name at point to CALLBACK.
Suitable for `eldoc-documentation-functions'."
  (when-let* ((def (coil--eldoc-definition))
              (signature (coil-def-signature def)))
    (funcall callback
             (concat (propertize (coil-def-name def)
                                 'face 'font-lock-function-name-face)
                     " " (coil--eldoc-arguments signature)
                     (when (coil-def-namespace def)
                       (propertize (concat "  " (coil-def-namespace def))
                                   'face 'font-lock-comment-face)))
             :thing (coil-def-name def)
             :face 'font-lock-function-name-face)
    t))

(defun coil--eldoc-arguments (signature)
  "The part of SIGNATURE after the head and the name.
`(defn str-concat [(a (dyn Allocator)) …] (-> …))' becomes
`[(a (dyn Allocator)) …] (-> …)' — eldoc shows the name itself, so
repeating it and the `defn' would only cost width."
  (if (string-match "\\`([a-z-]+[ \t]+\\S-+[ \t]+\\(\\(?:.\\|\n\\)*\\))\\'"
                    signature)
      (match-string 1 signature)
    signature))


;;; ---------------------------------------------------------------------------
;;; Completion

(defun coil-completion-at-point ()
  "A `completion-at-point-functions' entry for Coil.
Offers the buffer's own definitions, everything its imports bring into
scope under the right local name, and the language's own vocabulary."
  (when-let ((bounds (bounds-of-thing-at-point 'symbol)))
    (let* ((scope (coil-buffer-scope))
           (table (append (mapcar #'car scope)
                          coil-special-forms
                          coil-definition-forms
                          coil-primitive-types
                          coil-constants)))
      (list (car bounds) (cdr bounds)
            (completion-table-dynamic (lambda (_) table))
            :exclusive 'no
            :annotation-function
            (lambda (candidate)
              (when-let ((def (cdr (assoc candidate scope))))
                (concat " " (coil-def-kind def)
                        (when (coil-def-namespace def)
                          (concat " " (coil-def-namespace def))))))
            :company-docsig
            (lambda (candidate)
              (when-let ((def (cdr (assoc candidate scope))))
                (coil-def-signature def)))
            :company-doc-buffer
            (lambda (candidate)
              (when-let ((def (cdr (assoc candidate scope))))
                (coil--doc-buffer def)))))))


;;; ---------------------------------------------------------------------------
;;; Documentation buffers

(defvar coil-doc-buffer-name "*coil-doc*"
  "Name of the buffer a single definition's documentation appears in.")

(defun coil--doc-buffer (def)
  "A buffer rendering DEF."
  (let ((buffer (get-buffer-create coil-doc-buffer-name)))
    (with-current-buffer buffer
      (let ((inhibit-read-only t))
        (erase-buffer)
        (insert (propertize (coil-def-name def) 'face 'bold))
        (when (coil-def-kind def)
          (insert "  " (propertize (concat "(" (coil-def-kind def) ")")
                                   'face 'font-lock-comment-face)))
        (when (coil-def-namespace def)
          (insert "\n" (propertize (coil-def-namespace def)
                                   'face 'font-lock-constant-face)))
        (insert "\n\n")
        (when (coil-def-signature def)
          (insert (propertize (coil-def-signature def)
                              'face 'font-lock-function-name-face)
                  "\n\n"))
        (when (coil-def-doc def)
          (insert (coil-def-doc def) "\n"))
        (goto-char (point-min))
        (view-mode 1)))
    buffer))

;;;###autoload
(defun coil-doc-symbol (name)
  "Show the documentation for NAME, defaulting to the symbol at point."
  (interactive
   (let* ((default (coil-symbol-at-point))
          (scope (mapcar #'car (coil-buffer-scope))))
     (list (completing-read
            (format "Coil doc%s: " (if default (format " (%s)" default) ""))
            scope nil nil nil nil default))))
  (let ((def (coil-lookup name)))
    (unless def
      (user-error "No definition named `%s' in scope — try %s"
                  name (substitute-command-keys "\\[coil-apropos]")))
    (display-buffer (coil--doc-buffer def))))

;;;###autoload
(defun coil-doc-namespace (namespace)
  "Show every definition in NAMESPACE."
  (interactive
   (list (completing-read "Coil namespace: " (coil-all-namespaces) nil nil
                          (coil--namespace-at-point))))
  (let ((text (coil--run "namespace" namespace)))
    (unless text (user-error "No such namespace: %s" namespace))
    (let ((buffer (get-buffer-create (format "*coil-ns: %s*" namespace))))
      (with-current-buffer buffer
        (let ((inhibit-read-only t))
          (erase-buffer)
          (insert text)
          (goto-char (point-min))
          (if (fboundp 'markdown-mode) (markdown-mode) (view-mode 1))))
      (pop-to-buffer buffer))))

(defun coil--namespace-at-point ()
  "A namespace name near point, for defaulting a prompt."
  (let ((name (coil-symbol-at-point)))
    (cond ((and name (string-match-p "\\." name)) name)
          ((and name (coil--namespace-for-alias
                      (car (split-string name "/")))))
          (t (coil-buffer-module)))))

;;;###autoload
(defun coil-apropos (pattern)
  "Search every namespace in scope for definitions matching PATTERN."
  (interactive "sCoil apropos: ")
  (let ((matches nil))
    (dolist (import (coil-buffer-imports))
      (let ((namespace (coil-import-namespace import)))
        (dolist (def (coil-namespace-definitions namespace))
          (when (or (string-match-p (regexp-quote pattern) (coil-def-name def))
                    (and (coil-def-doc def)
                         (string-match-p (regexp-quote pattern) (coil-def-doc def))))
            (push def matches)))))
    (setq matches (nreverse matches))
    (unless matches (user-error "Nothing matches `%s' in scope" pattern))
    (let ((buffer (get-buffer-create "*coil-apropos*")))
      (with-current-buffer buffer
        (let ((inhibit-read-only t))
          (erase-buffer)
          (insert (format "%d match%s for \"%s\"\n\n"
                          (length matches)
                          (if (= 1 (length matches)) "" "es") pattern))
          (dolist (def matches)
            (insert (propertize (coil-def-name def) 'face 'bold)
                    "  " (propertize (coil-def-namespace def)
                                     'face 'font-lock-constant-face)
                    "\n")
            (when (coil-def-signature def)
              (insert "  " (coil-def-signature def) "\n"))
            (when (coil-def-doc def)
              (insert "  " (car (split-string (coil-def-doc def) "\n" t)) "\n"))
            (insert "\n"))
          (goto-char (point-min))
          (view-mode 1)))
      (pop-to-buffer buffer))))

;;;###autoload
(defun coil-guide (topic)
  "Look up TOPIC in the compiler's own language guide (`coil guide')."
  (interactive
   (list (completing-read "Coil guide topic (empty for the cheatsheet): "
                          (coil--guide-topics) nil nil
                          (coil-symbol-at-point))))
  (let* ((text (if (string-empty-p topic)
                   (coil--run "cheatsheet")
                 (or (coil--run "guide" topic)
                     (coil--run "guide" "--search" topic))))
         (buffer (get-buffer-create "*coil-guide*")))
    (unless text (user-error "The guide had nothing for `%s'" topic))
    (with-current-buffer buffer
      (let ((inhibit-read-only t))
        (erase-buffer)
        (insert text)
        (goto-char (point-min))
        (view-mode 1)))
    (pop-to-buffer buffer)))

(defvar coil--guide-topics nil)

(defun coil--guide-topics ()
  "The guide's topic names, scraped from its own index."
  (or coil--guide-topics
      (setq coil--guide-topics
            (let ((text (coil--run "guide")))
              (when text
                (let ((topics nil) (start 0))
                  (while (string-match "^ +\\([a-z][a-z0-9-]+\\)\\(?: +\\|$\\)"
                                       text start)
                    (push (match-string 1 text) topics)
                    (setq start (match-end 0)))
                  (nreverse topics)))))))


;;; ---------------------------------------------------------------------------
;;; xref
;;;
;;; Definitions are found by searching source, not by asking the compiler:
;;; `coil namespace' reports signatures but no file or line, and searching also
;;; works on a file that does not currently compile — which is when you most
;;; want to jump somewhere.  Both the project and the toolchain's own library
;;; are searched, so M-. lands inside the standard library too.

;;;###autoload
(defun coil-xref-backend ()
  "The xref backend for Coil buffers."
  (and (derived-mode-p 'coil-mode 'coil-repl-mode) 'coil))

(cl-defmethod xref-backend-identifier-at-point ((_backend (eql coil)))
  (coil-symbol-at-point))

(cl-defmethod xref-backend-identifier-completion-table ((_backend (eql coil)))
  (mapcar #'car (coil-buffer-scope)))

(cl-defmethod xref-backend-definitions ((_backend (eql coil)) identifier)
  (coil--xref-search (coil--definition-regexp identifier)))

(cl-defmethod xref-backend-references ((_backend (eql coil)) identifier)
  (coil--xref-search (concat "(^|[^A-Za-z0-9_/.-])"
                             (coil--regexp-quote (coil--bare-name identifier))
                             "([^A-Za-z0-9_!?*+<>=/-]|$)")))

(cl-defmethod xref-backend-apropos ((_backend (eql coil)) pattern)
  (coil--xref-search (concat "^[[:space:]]*\\((def[a-z]*|impl|extern)[[:space:]]+[^ ]*"
                             (coil--regexp-quote pattern))))

(defun coil--bare-name (identifier)
  "IDENTIFIER without any namespace alias or `Type::' qualifier."
  (cond ((string-match "\\`[^/]+/\\(.+\\)\\'" identifier) (match-string 1 identifier))
        ((string-match "\\`[^:]+::\\(.+\\)\\'" identifier) (match-string 1 identifier))
        ((string-prefix-p "." identifier) (substring identifier 1))
        (t identifier)))

(defun coil--regexp-quote (text)
  "Quote TEXT for the extended regular expressions grep is given."
  (replace-regexp-in-string "[][(){}.*+?^$|\\\\]" "\\\\\\&" text))

(defun coil--definition-regexp (identifier)
  "An ERE matching the definition of IDENTIFIER.
Field access (`.x'), an alias (`s/len') and an associated function
(`Point::new') all resolve to the underlying name."
  (let ((name (coil--regexp-quote (coil--bare-name identifier))))
    (format (concat "^[[:space:]]*\\("
                    "(defn|defcc|defstruct|defsum|deftrait|deftest|defprop"
                    "|const|def|extern|impl)"
                    "[[:space:]]+%s([[:space:]]|\\)|$)")
            name)))

(defcustom coil-xref-search-stdlib t
  "Whether \\[xref-find-definitions] also searches the toolchain's library."
  :type 'boolean
  :group 'coil)

(defun coil--xref-search (regexp)
  "Find REGEXP (an ERE) in the project and, optionally, the standard library."
  (let* ((roots (delq nil (list (coil-project-root)
                                (and coil-xref-search-stdlib
                                     (coil-stdlib-directory)))))
         (matches nil))
    (dolist (root (delete-dups roots))
      (with-temp-buffer
        (when (eq 0 (ignore-errors
                      (call-process "grep" nil t nil
                                    "-rnE" "--include=*.coil" regexp root)))
          (goto-char (point-min))
          (while (re-search-forward "^\\([^:\n]+\\):\\([0-9]+\\):\\(.*\\)$" nil t)
            (push (xref-make
                   (string-trim (match-string 3))
                   (xref-make-file-location
                    (match-string 1) (string-to-number (match-string 2)) 0))
                  matches)))))
    (nreverse matches)))

(provide 'coil-doc)
;;; coil-doc.el ends here
