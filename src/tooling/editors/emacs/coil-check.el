;;; coil-check.el --- Diagnostics, formatting and building for Coil -*- lexical-binding: t; -*-

;;; Commentary:

;; The parts of the toolchain that operate on files rather than on a session:
;; `coil check' behind flymake, `coil fmt' as a buffer formatter, `coil lint
;; --fix', `coil balance' for a file that no longer reads, and `coil run'.
;;
;; Each of these needs the buffer's CURRENT text, unsaved edits included, so
;; each writes a scratch copy first.  That copy always goes in the same
;; directory as the original: Coil resolves a module by walking source roots
;; upward from the file, so a copy in /tmp would fail every import and report
;; a screen of errors that say nothing about the code.

;;; Code:

(require 'cl-lib)
(require 'subr-x)
(require 'compile)
(require 'flymake)
(require 'coil-mode)

(defcustom coil-check-command "check"
  "The subcommand flymake runs.  `check' typechecks; `lint' also applies
the project's checkers, at some extra cost."
  :type '(choice (const "check") (const "lint") string)
  :group 'coil)


;;; ---------------------------------------------------------------------------
;;; A scratch copy of the buffer, OUTSIDE the project
;;;
;;; These copies used to be written into the buffer's own directory. They are
;;; short-lived, but flymake re-checks on every edit, so in practice a project
;;; is never without one for long: they show up in file trees, in `git status',
;;; in recursive greps, and they outlive a crash or a `kill -9'.
;;;
;;; They do not need to live there. Coil resolves `(import "a.b.c")' from the
;;; project's source roots -- the command already runs with `default-directory'
;;; at `coil-project-root' -- and there is no directory-relative import form,
;;; so a copy under `temporary-file-directory' checks identically.

(defcustom coil-scratch-directory
  (expand-file-name "coil-emacs" temporary-file-directory)
  "Directory for the scratch copies `coil check' and `coil fmt' read.
Deliberately outside the project: see the commentary above.  Set this to
nil to write beside the buffer's own file instead, which is only useful
if a checker of yours resolves something relative to the source file."
  :type '(choice (directory) (const :tag "Beside the buffer's file" nil))
  :group 'coil)

(defun coil--scratch-path (&optional tag)
  "A path for a scratch copy of this buffer.
In `coil-scratch-directory' when that is set, else beside the buffer's
own file."
  (let* ((base (if buffer-file-name
                   (file-name-base buffer-file-name)
                 "scratch"))
         ;; Two buffers can share a base name in different directories, and
         ;; a shared scratch directory would collide them into one file --
         ;; each checking against the other's text.
         (key (if buffer-file-name
                  (substring (secure-hash 'sha1 (file-name-directory
                                                 buffer-file-name))
                             0 8)
                "nofile"))
         (name (format ".coil-%s-%d-%s-%s.coil"
                       (or tag "tmp") (emacs-pid) key base)))
    (if coil-scratch-directory
        (progn
          (make-directory coil-scratch-directory t)
          (expand-file-name name coil-scratch-directory))
      (expand-file-name name
                        (if buffer-file-name
                            (file-name-directory buffer-file-name)
                          (expand-file-name default-directory))))))

(defmacro coil--with-scratch-copy (path-var tag &rest body)
  "Write the buffer to a scratch file, bind PATH-VAR to it, and run BODY.
The file is removed however BODY leaves."
  (declare (indent 2) (debug (symbolp form body)))
  `(let ((,path-var (coil--scratch-path ,tag)))
     (unwind-protect
         (progn
           (write-region (point-min) (point-max) ,path-var nil 'quiet)
           ,@body)
       (when (file-exists-p ,path-var) (delete-file ,path-var)))))


;;; ---------------------------------------------------------------------------
;;; Parsing diagnostics
;;;
;;;   error: in 'main': call to undefined function 'undefined-thing'
;;;     --> bad.coil:5:11
;;;     |
;;;   5 |   (let [x (undefined-thing 1 2)]
;;;     |           ^^^^^^^^^^^^^^^^^^^^^
;;;
;;; The caret run gives the width of the offending region, which is what turns
;;; a diagnostic from a marker on a line into a highlight on the expression.

(cl-defstruct (coil-diagnostic (:constructor coil-diagnostic-create) (:copier nil))
  severity message file line column width)

(defconst coil--diagnostic-regexp
  "^\\(error\\|warning\\|note\\): \\([^\n]*\\)\n[ \t]*--> \\([^:\n]+\\):\\([0-9]+\\):\\([0-9]+\\)"
  "A diagnostic's message line and the source locator beneath it.")

(defun coil-parse-diagnostics (text)
  "Every diagnostic in TEXT, as `coil-diagnostic's."
  (let ((diagnostics nil)
        (start 0))
    (while (string-match coil--diagnostic-regexp text start)
      (let ((severity (match-string 1 text))
            (message (match-string 2 text))
            (file (match-string 3 text))
            (line (string-to-number (match-string 4 text)))
            (column (string-to-number (match-string 5 text)))
            (after (match-end 0)))
        (setq start after)
        ;; The caret run belongs to this diagnostic only if it turns up
        ;; before the next one starts.
        (let* ((next (or (and (string-match coil--diagnostic-regexp text after)
                              (match-beginning 0))
                         (length text)))
               (width (when (string-match "^[ \t]*|[ \t]*\\(\\^+\\)"
                                          (substring text after next))
                        (length (match-string 1 (substring text after next))))))
          (push (coil-diagnostic-create
                 :severity (intern severity) :message message :file file
                 :line line :column column :width (or width 1))
                diagnostics))))
    (nreverse diagnostics)))

(defun coil--diagnostic-region (diagnostic buffer)
  "The (BEG . END) in BUFFER that DIAGNOSTIC covers."
  (with-current-buffer buffer
    (save-excursion
      (save-restriction
        (widen)
        (goto-char (point-min))
        (forward-line (1- (coil-diagnostic-line diagnostic)))
        (let* ((beg (min (point-max)
                         (+ (point) (max 0 (1- (coil-diagnostic-column diagnostic))))))
               (end (min (line-end-position)
                         (+ beg (coil-diagnostic-width diagnostic)))))
          (if (< beg end)
              (cons beg end)
            (cons (line-beginning-position) (line-end-position))))))))


;;; ---------------------------------------------------------------------------
;;; flymake

(defvar-local coil--flymake-process nil)

;;;###autoload
(defun coil-flymake-backend (report-fn &rest _args)
  "A `flymake-diagnostic-functions' backend running `coil check'."
  (unless (executable-find coil-program)
    (error "Cannot find `%s'" coil-program))
  (when (process-live-p coil--flymake-process)
    (kill-process coil--flymake-process))
  (let* ((source (current-buffer))
         (scratch (coil--scratch-path "flymake"))
         ;; `make-process' inherits the caller's `default-directory'; the
         ;; project root is where a Coil.toml and the source roots are.
         (default-directory (coil-project-root)))
    (write-region (point-min) (point-max) scratch nil 'quiet)
    (setq
     coil--flymake-process
     (make-process
      :name "coil-flymake" :noquery t :connection-type 'pipe
      :buffer (generate-new-buffer " *coil-flymake*")
      :command (list coil-program coil-check-command scratch)
      :sentinel
      (lambda (process _event)
        (unless (process-live-p process)
          (unwind-protect
              (when (with-current-buffer source
                      (eq process coil--flymake-process))
                (let ((output (with-current-buffer (process-buffer process)
                                (buffer-string))))
                  (funcall report-fn
                           (coil--flymake-diagnostics output source scratch))))
            (when (file-exists-p scratch) (delete-file scratch))
            (kill-buffer (process-buffer process)))))))))

(defun coil--flymake-diagnostics (output buffer scratch)
  "Turn OUTPUT into flymake diagnostics for BUFFER.
SCRATCH is the copy the compiler actually read; a diagnostic pointing
anywhere else is reported at the top of the buffer with its real location
in the message, rather than silently dropped or mapped onto the wrong line."
  (let ((scratch-name (file-name-nondirectory scratch)))
    (mapcar
     (lambda (diagnostic)
       (let ((type (pcase (coil-diagnostic-severity diagnostic)
                     ('error :error) ('warning :warning) (_ :note))))
         (if (equal (file-name-nondirectory (coil-diagnostic-file diagnostic))
                    scratch-name)
             (let ((region (coil--diagnostic-region diagnostic buffer)))
               (flymake-make-diagnostic buffer (car region) (cdr region)
                                        type (coil-diagnostic-message diagnostic)))
           (flymake-make-diagnostic
            buffer (point-min) (min (point-max) 2) type
            (format "%s:%d: %s"
                    (coil-diagnostic-file diagnostic)
                    (coil-diagnostic-line diagnostic)
                    (coil-diagnostic-message diagnostic))))))
     (coil-parse-diagnostics output))))


;;; ---------------------------------------------------------------------------
;;; Formatting

(defun coil--replace-buffer-with (text)
  "Replace the buffer's contents with TEXT, keeping point and the undo list
as intact as `replace-buffer-contents' can manage."
  (let ((scratch (generate-new-buffer " *coil-formatted*")))
    (unwind-protect
        (progn
          (with-current-buffer scratch (insert text))
          (replace-buffer-contents scratch))
      (kill-buffer scratch))))

;;;###autoload
(defun coil-format-buffer ()
  "Format the buffer with `coil fmt'."
  (interactive)
  (let ((output (generate-new-buffer " *coil-fmt*")))
    (unwind-protect
        (coil--with-scratch-copy scratch "fmt"
          (let ((status (call-process coil-program nil (list output nil) nil
                                      "fmt" scratch)))
            (if (zerop status)
                (let ((formatted (with-current-buffer output (buffer-string))))
                  (if (string-empty-p (string-trim formatted))
                      (message "coil fmt produced nothing — leaving the buffer alone")
                    (coil--replace-buffer-with formatted)
                    (message "Formatted")))
              (message "coil fmt failed — the file probably does not read")
              (display-buffer output))))
      (when (buffer-live-p output) (kill-buffer output)))))

(define-minor-mode coil-format-before-save-mode
  "Run \\[coil-format-buffer] before every save of this buffer.
Turn it on everywhere with `(add-hook \='coil-mode-hook
#\='coil-format-before-save-mode)'."
  :lighter " fmt"
  (if coil-format-before-save-mode
      (add-hook 'before-save-hook #'coil-format-buffer nil t)
    (remove-hook 'before-save-hook #'coil-format-buffer t)))

;;;###autoload
(defun coil-balance-buffer ()
  "Repair unbalanced delimiters with `coil balance'.
For a file that no longer reads — after a bad paste, or a structural edit
that went wrong — where the formatter cannot help because it cannot parse."
  (interactive)
  (let ((output (generate-new-buffer " *coil-balance*")))
    (unwind-protect
        (coil--with-scratch-copy scratch "balance"
          (let ((status (call-process coil-program nil (list output nil) nil
                                      "balance" scratch)))
            (if (zerop status)
                (let ((repaired (with-current-buffer output (buffer-string))))
                  (if (string= repaired (buffer-string))
                      (message "Delimiters already balanced")
                    (coil--replace-buffer-with repaired)
                    (message "Repaired delimiters — check the diff before saving")))
              (message "coil balance could not repair this file")
              (display-buffer output))))
      (when (buffer-live-p output) (kill-buffer output)))))

;;;###autoload
(defun coil-lint-fix ()
  "Apply `coil lint --fix' to this file.
Unlike the others this works on the saved file, because that is what the
fixer rewrites; the buffer is saved first and reloaded after."
  (interactive)
  (unless buffer-file-name
    (user-error "This buffer is not visiting a file"))
  (when (buffer-modified-p) (save-buffer))
  (let ((output (generate-new-buffer " *coil-lint*"))
        (default-directory (coil-project-root)))
    (unwind-protect
        (let ((status (call-process coil-program nil (list output nil) nil
                                    "lint" buffer-file-name "--fix")))
          (revert-buffer t t t)
          (if (zerop status)
              (message "Lint clean")
            (message "coil lint reported findings")
            (display-buffer output)))
      (when (buffer-live-p output) (kill-buffer output)))))


;;; ---------------------------------------------------------------------------
;;; Compiling and running

(defun coil--compile (command name)
  "Run COMMAND from the project root in a compilation buffer called NAME."
  (let ((default-directory (coil-project-root)))
    (compilation-start command nil (lambda (_) name))))

;;;###autoload
(defun coil-check-buffer ()
  "Typecheck this file with `coil check', in a compilation buffer."
  (interactive)
  (unless buffer-file-name (user-error "This buffer is not visiting a file"))
  (when (buffer-modified-p) (save-buffer))
  (coil--compile (format "%s check %s"
                         (shell-quote-argument coil-program)
                         (shell-quote-argument buffer-file-name))
                 "*coil-check*"))

;;;###autoload
(defun coil-run-buffer (&optional arguments)
  "Build and run this file with `coil run'.
With a prefix argument, prompt for extra ARGUMENTS — `-O0' builds several
times faster while iterating."
  (interactive
   (list (when current-prefix-arg (read-string "coil run flags: " "-O0 "))))
  (unless buffer-file-name (user-error "This buffer is not visiting a file"))
  (when (buffer-modified-p) (save-buffer))
  (coil--compile (string-join
                  (delq nil (list (shell-quote-argument coil-program)
                                  "run"
                                  (shell-quote-argument buffer-file-name)
                                  (and arguments (string-trim arguments))))
                  " ")
                 "*coil-run*"))

(provide 'coil-check)
;;; coil-check.el ends here
