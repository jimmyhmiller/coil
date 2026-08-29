;;; coil-eval.el --- Evaluating Coil from a source buffer -*- lexical-binding: t; -*-

;;; Commentary:

;; The commands you actually press: evaluate the form before point, the
;; definition around point, the region, the buffer.  Results come back as an
;; inline overlay next to the expression rather than in the echo area, which
;; is the single thing that makes a Lisp REPL feel attached to the editor
;; instead of beside it.
;;
;; Also here: `coil-type-at-point', which is Coil's own — the language is
;; statically typed, so asking what an expression's type is without running it
;; is a first-class question — and `coil-macroexpand', which drives
;; `coil expand' over the form at point.

;;; Code:

(require 'cl-lib)
(require 'subr-x)
(require 'coil-mode)
(require 'coil-repl)

(defcustom coil-overlay-results t
  "Show evaluation results as an overlay beside the expression.
With nil, results go to the echo area only."
  :type 'boolean
  :group 'coil)

(defcustom coil-overlay-max-length 140
  "Longest result rendered inline.  Anything longer is elided; the whole
value is always available in the echo area and \\[coil-eval-last-sexp-to-buffer]."
  :type 'integer
  :group 'coil)

(defcustom coil-show-error-buffer t
  "Pop up `*coil-error*' with the full diagnostic when an evaluation fails."
  :type 'boolean
  :group 'coil)

(defcustom coil-error-buffer-select nil
  "Whether the error buffer takes focus when it appears."
  :type 'boolean
  :group 'coil)

(defface coil-result-overlay-face
  '((t :inherit font-lock-comment-face :slant italic))
  "Face for an inline evaluation result."
  :group 'coil)

(defface coil-error-overlay-face
  '((t :inherit font-lock-warning-face :slant italic))
  "Face for an inline evaluation error."
  :group 'coil)


;;; ---------------------------------------------------------------------------
;;; Result overlays

(defun coil--remove-result-overlays ()
  "Remove every result overlay in this buffer."
  (remove-hook 'post-command-hook #'coil--remove-result-overlays t)
  (remove-overlays nil nil 'category 'coil-result))

(defun coil--arm-overlay-removal ()
  "Arrange for result overlays to disappear after the NEXT command.
Removing them in this command's own `post-command-hook' would take them
away before they were ever seen."
  (remove-hook 'post-command-hook #'coil--arm-overlay-removal t)
  (add-hook 'post-command-hook #'coil--remove-result-overlays nil t))

(defun coil--elide (text limit)
  "TEXT on one line, no longer than LIMIT characters."
  (let ((flat (replace-regexp-in-string "[ \t]*\n[ \t]*" " ⏎ " (string-trim text))))
    (if (> (length flat) limit)
        (concat (substring flat 0 (max 0 (1- limit))) "…")
      flat)))

(defun coil--show-overlay (text face &optional position)
  "Show TEXT in FACE at the end of the line holding POSITION."
  (when (and coil-overlay-results (not noninteractive))
    (coil--remove-result-overlays)
    (save-excursion
      (when position (goto-char position))
      (end-of-line)
      (let ((overlay (make-overlay (point) (point) nil t t)))
        (overlay-put overlay 'category 'coil-result)
        (overlay-put overlay 'coil-value text)
        (overlay-put
         overlay 'after-string
         (concat (propertize " " 'cursor t)
                 (propertize (concat "=> " (coil--elide text coil-overlay-max-length))
                             'face face)))
        (add-hook 'post-command-hook #'coil--arm-overlay-removal nil t)
        overlay))))


;;; ---------------------------------------------------------------------------
;;; Reporting a result

(defvar coil-error-buffer-name "*coil-error*"
  "Name of the buffer a failed evaluation's diagnostic appears in.")

(defun coil--show-error (result)
  "Put RESULT's diagnostic in `coil-error-buffer-name' and display it."
  (when coil-show-error-buffer
    (let ((buffer (get-buffer-create coil-error-buffer-name)))
      (with-current-buffer buffer
        (let ((inhibit-read-only t))
          (erase-buffer)
          (insert (coil-result-output result) "\n")
          (goto-char (point-min))
          ;; RET on a locator jumps to it — which works for a `:load' error,
          ;; whose location is a real file, and not for an expression error:
          ;; the REPL compiles a probe program around each expression, so
          ;; those report `--> <repl>:LINE:COL', a position inside generated
          ;; source that is not on disk.  Use \[coil-check-buffer] when you
          ;; want a diagnostic you can navigate.
          (compilation-minor-mode 1)))
      (if coil-error-buffer-select
          (pop-to-buffer buffer)
        (display-buffer buffer)))))

(defun coil--report (result &optional position)
  "Render RESULT: overlay at POSITION, echo area, and error buffer."
  (cond
   ((null result) (message "coil: no response from the REPL"))
   ((coil-result-error result)
    (coil--show-overlay (car (split-string (coil-result-output result) "\n" t))
                        'coil-error-overlay-face position)
    (coil--show-error result)
    (message "%s" (car (split-string (coil-result-output result) "\n" t))))
   (t
    (let ((text (if (string-empty-p (coil-result-output result))
                    "nil"
                  (coil-result-output result))))
      (coil--show-overlay text 'coil-result-overlay-face position)
      (message "%s" (coil--elide text (max 60 (- (frame-width) 10))))))))


;;; ---------------------------------------------------------------------------
;;; Finding what to evaluate

(defun coil--last-sexp-bounds ()
  "Bounds of the form ending at point, as a cons."
  (save-excursion
    (let ((end (point)))
      (backward-sexp)
      (cons (point) end))))

(defun coil-toplevel-bounds (&optional position)
  "Bounds of the top-level form containing or preceding POSITION.
Uses the parser state rather than `beginning-of-defun', which assumes an
open paren in column zero and gets a form inside a string or a comment
wrong."
  (save-excursion
    (goto-char (or position (point)))
    (let* ((state (syntax-ppss))
           (depth (nth 0 state))
           (start (if (> depth 0)
                      ;; Inside a form: climb to the outermost open paren.
                      ;; `nth 9' runs outermost first, so that is its CAR —
                      ;; taking the last of it evaluates the innermost form,
                      ;; which is `C-x C-e', not `C-M-x'.
                      (car (nth 9 state))
                    ;; Between forms: take the one that just ended.
                    (condition-case nil
                        (progn (skip-chars-backward " \t\n")
                               (backward-sexp)
                               (backward-prefix-chars)
                               (point))
                      (scan-error nil)))))
      (unless start
        (user-error "Point is not in or after a top-level form"))
      (goto-char start)
      (backward-prefix-chars)
      (setq start (point))
      (cons start (progn (goto-char start) (forward-sexp) (point))))))

(defun coil--text (bounds)
  "The buffer text between BOUNDS."
  (buffer-substring-no-properties (car bounds) (cdr bounds)))


;;; ---------------------------------------------------------------------------
;;; Evaluation commands

(defun coil--eval (text position)
  "Evaluate TEXT and report the result at POSITION.
The reporting buffer is captured now rather than looked up later: the
answer arrives whenever it arrives, and by then point may be somewhere
else entirely."
  (let ((buffer (current-buffer)))
    (coil-eval-async
     text
     (lambda (result)
       (when (buffer-live-p buffer)
         (with-current-buffer buffer (coil--report result position)))))))

;;;###autoload
(defun coil-eval-last-sexp ()
  "Evaluate the form before point and show its value inline."
  (interactive)
  (let ((bounds (coil--last-sexp-bounds)))
    (coil--eval (coil--text bounds) (cdr bounds))))

;;;###autoload
(defun coil-eval-defun ()
  "Evaluate the top-level form around point.
A `defn' or `defstruct' redefines by name in the running session, so this
is the edit-and-reload key."
  (interactive)
  (let ((bounds (coil-toplevel-bounds)))
    (coil--eval (coil--text bounds) (cdr bounds))))

;;;###autoload
(defun coil-eval-region (start end)
  "Evaluate every top-level form between START and END, in order.
Stops at the first failure and reports it, so a broken form in the middle
does not scroll past under the ones that followed it."
  (interactive "r")
  (let ((forms (coil--toplevel-forms-in start end)))
    (unless forms (user-error "No complete form in the region"))
    (coil--eval-sequentially forms end)))

(defun coil--toplevel-forms-in (start end)
  "A list of the complete top-level forms between START and END."
  (save-excursion
    (goto-char start)
    (let (forms)
      (while (and (< (point) end)
                  (progn (skip-chars-forward " \t\n") (< (point) end)))
        (if (looking-at ";")
            (forward-line 1)
          (let ((begin (point)))
            (condition-case nil
                (progn (forward-sexp)
                       (push (buffer-substring-no-properties begin (point)) forms))
              (scan-error (goto-char end))))))
      (nreverse forms))))

(defun coil--eval-sequentially (forms position &optional index total)
  "Evaluate FORMS one after another, reporting at POSITION.
The REPL applies one form at a time and later forms may depend on earlier
ones, so these are chained rather than fired off together."
  (let* ((total (or total (length forms)))
         (index (or index 1))
         (buffer (current-buffer)))
    (if (null forms)
        (message "Loaded %d form%s" total (if (= total 1) "" "s"))
      (coil-eval-async
       (car forms)
       (lambda (result)
         (when (buffer-live-p buffer)
           (with-current-buffer buffer
             (if (coil-result-error result)
                 (progn
                   (message "Form %d of %d failed" index total)
                   (coil--report result position))
               (coil--eval-sequentially (cdr forms) position (1+ index) total)))))))))

;;;###autoload
(defun coil-load-buffer ()
  "Load this buffer into the session.
A file that declares `(module NS)' is loaded as a namespace — the REPL's
own `:load', which imports every name in it — after saving.  Anything else
is replayed form by form."
  (interactive)
  (let ((module (coil-buffer-module)))
    (cond
     ((and module buffer-file-name)
      (when (buffer-modified-p) (save-buffer))
      (let ((position (point))
            (buffer (current-buffer)))
        (coil-eval-async
         (concat ":load " module)
         (lambda (result)
           (if (not (coil-result-error result))
               (message "Loaded %s" module)
             ;; Callbacks run from the REPL's output filter, so the overlay
             ;; has to be placed back in the source buffer explicitly.
             (when (buffer-live-p buffer)
               (with-current-buffer buffer
                 (coil--report result position))))))))
     (t
      (when module
        (message "Buffer is not visiting a file — replaying %s form by form" module))
      (coil-eval-region (point-min) (point-max))))))

;;;###autoload
(defun coil-eval-last-sexp-to-buffer ()
  "Evaluate the form before point and show the whole result in a buffer.
For output too big or too structured to read on one line."
  (interactive)
  (let ((text (coil--text (coil--last-sexp-bounds))))
    (coil-eval-async
     text
     (lambda (result)
       (let ((buffer (get-buffer-create "*coil-result*")))
         (with-current-buffer buffer
           (let ((inhibit-read-only t))
             (erase-buffer)
             (insert ";; " text "\n\n" (coil-result-output result) "\n")
             (goto-char (point-min))
             (coil-mode)
             (view-mode 1)))
         (display-buffer buffer))))))

;;;###autoload
(defun coil-eval-last-sexp-to-comment ()
  "Evaluate the form before point and insert its value as a comment."
  (interactive)
  (let ((buffer (current-buffer))
        (position (point)))
    (coil-eval-async
     (coil--text (coil--last-sexp-bounds))
     (lambda (result)
       (when (buffer-live-p buffer)
         (with-current-buffer buffer
           (save-excursion
             (goto-char position)
             (end-of-line)
             (insert "  ; => "
                     (coil--elide (coil-result-output result) 200)))))))))

;;;###autoload
(defun coil-type-at-point ()
  "Show the inferred type of the form before point, without running it.
Uses the REPL's `:type', which type-checks the expression against the
session's definitions and stops there."
  (interactive)
  (let* ((bounds (coil--last-sexp-bounds))
         (text (coil--text bounds))
         (position (cdr bounds))
         (buffer (current-buffer)))
    (coil-eval-async
     (concat ":type " (replace-regexp-in-string "[ \t\n]+" " " text))
     (lambda (result)
       (when (buffer-live-p buffer)
         (with-current-buffer buffer
           (if (coil-result-error result)
               (coil--report result position)
             (coil--show-overlay (concat ": " (coil-result-output result))
                                 'coil-result-overlay-face position)
             (message "%s : %s" (coil--elide text 40) (coil-result-output result))))))
     t)))


;;; ---------------------------------------------------------------------------
;;; Macroexpansion
;;;
;;; `coil expand' works on whole files, not on a form in isolation, and a macro
;;; can only expand if the module that defines it is in scope.  So the form at
;;; point is expanded in the company of its own file's header — the `(module …)'
;;; line and every `(import …)' — written to a scratch file beside the original
;;; so those imports resolve exactly as they do for the real one.

(defun coil--buffer-header ()
  "This buffer's `(module …)' and `(import …)' forms, as text."
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-min))
      (let (parts)
        (while (re-search-forward "^[ \t]*(\\(?:module\\|import\\|include\\)\\_>" nil t)
          (goto-char (match-beginning 0))
          (let ((start (point)))
            (forward-sexp)
            (push (buffer-substring-no-properties start (point)) parts)))
        (string-join (nreverse parts) "\n")))))

;;;###autoload
(defun coil-macroexpand ()
  "Expand the macros in the top-level form around point.
Runs `coil expand' over that form plus this file's module header."
  (interactive)
  (let* ((bounds (coil-toplevel-bounds))
         (form (coil--text bounds))
         (header (coil--buffer-header))
         (directory (if buffer-file-name
                        (file-name-directory buffer-file-name)
                      default-directory))
         (scratch (expand-file-name
                   (format ".coil-expand-%s.coil" (emacs-pid)) directory)))
    (unwind-protect
        (let ((output (generate-new-buffer " *coil-expand*")))
          (unwind-protect
              (progn
                (with-temp-file scratch
                  (insert header "\n\n" form "\n"))
                (let ((status (call-process coil-program nil output nil
                                            "expand" scratch)))
                  (with-current-buffer output
                    (if (zerop status)
                        (coil--display-expansion (buffer-string) form)
                      (message "coil expand failed")
                      (coil--show-error
                       (coil-result-create :output (buffer-string) :error t))))))
            (kill-buffer output)))
      (when (file-exists-p scratch) (delete-file scratch)))))

(defun coil--display-expansion (expansion original)
  "Show EXPANSION of ORIGINAL in a dedicated buffer.
`coil expand' prints the whole file, so the header is dropped again and
only the expanded form is shown."
  (let ((buffer (get-buffer-create "*coil-macroexpand*")))
    (with-current-buffer buffer
      (let ((inhibit-read-only t))
        (erase-buffer)
        (insert (coil--expansion-body expansion))
        (goto-char (point-min))
        (coil-mode)
        (view-mode 1)
        (setq-local header-line-format
                    (concat "macroexpansion of "
                            (coil--elide original 60)))))
    (display-buffer buffer)))

(defun coil--expansion-body (expansion)
  "EXPANSION with its leading module and import forms removed."
  (with-temp-buffer
    (set-syntax-table coil-mode-syntax-table)
    (insert expansion)
    (goto-char (point-min))
    (let ((last (point-min)))
      (while (progn (skip-chars-forward " \t\n")
                    (looking-at "(\\(?:module\\|import\\|include\\)\\_>"))
        (forward-sexp)
        (setq last (point)))
      (string-trim (buffer-substring-no-properties last (point-max))))))

(provide 'coil-eval)
;;; coil-eval.el ends here
