;;; coil-test.el --- Running Coil tests from Emacs -*- lexical-binding: t; -*-

;;; Commentary:

;; `coil test' forks a child per test and prints a summary a person can read:
;;
;;   running 2 tests
;;   test math ... ok
;;   assertion failed: (= 1 2)
;;     at t.coil:8
;;   test bad ... FAILED (signal 6)
;;
;;   test result: FAILED. 1 passed; 1 failed
;;
;; That already carries everything a report needs, so this runs it in a
;; compilation buffer rather than reformatting it: `next-error' walks the
;; failures, RET on an `at file:line' jumps to the assertion, and the mode
;; line tracks the run.  What is added on top is the part reading text cannot
;; give you — knowing which test point is inside, and colouring the outcome.

;;; Code:

(require 'compile)
(require 'subr-x)
(require 'coil-mode)

(defcustom coil-test-buffer-name "*coil-test*"
  "Name of the buffer test runs appear in."
  :type 'string
  :group 'coil)

(defface coil-test-success-face
  '((t :inherit success :weight bold))
  "Face for a passing test in the report."
  :group 'coil)

(defface coil-test-failure-face
  '((t :inherit error :weight bold))
  "Face for a failing test in the report."
  :group 'coil)

(defvar coil-test-mode-font-lock-keywords
  `(("^test \\([^ \n]+\\) \\.\\.\\. \\(ok\\)$"
     (1 font-lock-function-name-face) (2 'coil-test-success-face))
    ("^test \\([^ \n]+\\) \\.\\.\\. \\(FAILED[^\n]*\\)$"
     (1 font-lock-function-name-face) (2 'coil-test-failure-face))
    ("^test result: \\(ok\\)[^\n]*$" (1 'coil-test-success-face))
    ("^test result: \\(FAILED\\)[^\n]*$" (1 'coil-test-failure-face))
    ("^\\(assertion failed\\):" (1 'coil-test-failure-face))
    ("^running \\([0-9]+\\) tests?$" (1 font-lock-constant-face)))
  "Highlighting for a `coil test' run.")

(define-compilation-mode coil-test-mode "Coil-Test"
  "Compilation mode for `coil test' output."
  (setq-local compilation-error-regexp-alist '(coil coil-assert))
  (setq-local font-lock-keywords-only nil)
  (font-lock-add-keywords nil coil-test-mode-font-lock-keywords))

(defun coil--test-at-point ()
  "The name of the `deftest' or `defprop' point is inside, or nil."
  (save-excursion
    (let ((bound (point)))
      (goto-char (point-min))
      (let (name)
        (while (re-search-forward
                "^[ \t]*(\\(?:deftest\\|defprop\\)\\_>[ \t\n]+\\([^ \t\n()]+\\)"
                bound t)
          (let ((start (match-beginning 0))
                (candidate (match-string-no-properties 1)))
            (save-excursion
              (goto-char start)
              (condition-case nil
                  (when (>= (progn (forward-sexp) (point)) bound)
                    (setq name candidate))
                (scan-error (setq name candidate))))))
        name))))

(defun coil--run-test (command name)
  "Run COMMAND from the project root, reporting it as NAME."
  (let ((default-directory (coil-project-root))
        (compilation-buffer-name-function
         (lambda (_) coil-test-buffer-name)))
    (compilation-start command #'coil-test-mode)
    (with-current-buffer coil-test-buffer-name
      (setq-local header-line-format name))))

;;;###autoload
(defun coil-test-run-at-point ()
  "Run the test point is inside.
Falls back to every test in the file when point is not inside one."
  (interactive)
  (unless buffer-file-name (user-error "This buffer is not visiting a file"))
  (when (buffer-modified-p) (save-buffer))
  (let ((name (coil--test-at-point)))
    (if (null name)
        (progn (message "Point is not inside a test — running the whole file")
               (coil-test-run-file))
      (coil--run-test
       (format "%s test %s --filter %s"
               (shell-quote-argument coil-program)
               (shell-quote-argument buffer-file-name)
               (shell-quote-argument name))
       (format "test %s" name)))))

;;;###autoload
(defun coil-test-run-file ()
  "Run every test in this file."
  (interactive)
  (unless buffer-file-name (user-error "This buffer is not visiting a file"))
  (when (buffer-modified-p) (save-buffer))
  (coil--run-test
   (format "%s test %s"
           (shell-quote-argument coil-program)
           (shell-quote-argument buffer-file-name))
   (format "tests in %s" (file-name-nondirectory buffer-file-name))))

;;;###autoload
(defun coil-test-run-project (&optional selector)
  "Run the project's test suites.
With a prefix argument, prompt for a SELECTOR to narrow the run."
  (interactive
   (list (when current-prefix-arg (read-string "Test selector: "))))
  (coil--run-test
   (string-join (delq nil (list (shell-quote-argument coil-program)
                                "test"
                                (when (and selector (not (string-empty-p selector)))
                                  (shell-quote-argument selector))))
                " ")
   (format "tests in %s"
           (file-name-nondirectory (directory-file-name (coil-project-root))))))

(provide 'coil-test)
;;; coil-test.el ends here
