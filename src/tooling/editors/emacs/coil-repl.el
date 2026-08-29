;;; coil-repl.el --- The Coil REPL connection -*- lexical-binding: t; -*-

;;; Commentary:

;; The transport layer between an editing buffer and a live `coil repl'
;; session, and the reason everything else in this package can be
;; asynchronous.
;;
;; `coil repl' speaks a line protocol: it prints `coil> ', reads one balanced
;; form, prints whatever that form produced, and prompts again (`....> ' while
;; a form is still open).  There is no request id and no framing, so on its own
;; that is only good enough to type at.  What turns it into something an editor
;; can drive is a REQUEST QUEUE: every send is recorded, output accumulates
;; until the next top-level prompt, and the text in between is handed to that
;; request's callback.  Evaluations from a source buffer can then render as
;; inline overlays, and tooling can ask questions (`:type …') without the user
;; seeing anything at all.
;;
;; Two details make the capture reliable rather than approximate:
;;
;; - The REPL runs on a PTY, not a pipe.  Its own prompts go out through raw
;;   `write' while JIT-compiled code prints through libc stdio, and on a pipe
;;   stdio block-buffers — results then arrive after the prompt that should
;;   follow them, and every capture is off by one.  A PTY line-buffers, so the
;;   ordering is the one you see when you run it by hand.
;;
;; - The PTY's echo is turned off (`stty -echo') before exec'ing the compiler.
;;   Otherwise every byte sent comes straight back and has to be subtracted from
;;   the output again, guessing at where continuation prompts fell.  Comint
;;   already inserts what the user types, so nothing is lost.
;;
;; WHEN THE REPL GROWS A REAL PROTOCOL, this is the only file that changes.
;; `coil-connection' carries a `kind' slot, currently always `inferior', and
;; every caller goes through `coil-eval-async' / `coil-eval-sync'.  A socket
;; backend that returns structured results — a value distinct from stdout, a
;; type alongside it, a diagnostic as data rather than as text starting with
;; "error:" — slots in behind those two functions.  The places that are
;; text-shaped only because the protocol is text-shaped are marked HEURISTIC.

;;; Code:

(require 'comint)
(require 'cl-lib)
(require 'subr-x)
(require 'coil-mode)

(defcustom coil-repl-buffer-name-format "*coil-repl: %s*"
  "Format for REPL buffer names.  %s is the project directory name."
  :type 'string
  :group 'coil)

(defcustom coil-repl-display-eval-input t
  "Whether an evaluation sent from a source buffer is echoed into the REPL.
CIDER shows the result in the source buffer and leaves the REPL alone;
seeing the form that ran is usually worth the line."
  :type 'boolean
  :group 'coil)

(defcustom coil-repl-history-file
  (locate-user-emacs-file "coil-repl-history")
  "Where REPL input history is saved, or nil for no history."
  :type '(choice file (const nil))
  :group 'coil)

(defcustom coil-repl-sync-timeout 10.0
  "Seconds `coil-eval-sync' waits for a result before giving up."
  :type 'number
  :group 'coil)

(defconst coil-repl-prompt-regexp "^\\(?:coil> \\|\\.\\.\\.\\.> \\)"
  "The REPL's prompts: top level, and the continuation of an open form.")

(defconst coil-repl--result-terminator "\\(?:\\`\\|\n\\)coil> \\'"
  "A top-level prompt at the very end of the accumulated output.
Its arrival is what ends the in-flight request.")


;;; ---------------------------------------------------------------------------
;;; Connections

(cl-defstruct (coil-connection (:constructor coil-connection-create)
                               (:copier nil))
  "A live Coil session and the queue of requests outstanding against it."
  ;; `inferior' — `coil repl' under comint.  The seam for a future socket
  ;; backend: give it another kind and teach `coil--send-request' about it.
  (kind 'inferior)
  buffer
  project
  (pending nil)   ; FIFO of `coil-request', oldest first
  (accum "")      ; output seen so far for (car pending)
  (ready nil))

(cl-defstruct (coil-request (:constructor coil-request-create) (:copier nil))
  "One thing asked of the REPL, and what to do with the answer."
  text          ; exactly what was written to the process, sans newline
  callback      ; (lambda (result) …) where result is a `coil-result'
  silent        ; hide the output from the REPL buffer entirely
  banner)       ; the pseudo-request that swallows the startup banner

(cl-defstruct (coil-result (:constructor coil-result-create) (:copier nil))
  "What came back.  Everything but `output' is inferred from the text —
see the HEURISTIC notes — and becomes real data under a structured protocol."
  output        ; the captured text, prompts and trailing newline stripped
  value         ; the part that reads as a value, or nil
  error         ; non-nil when the REPL reported a failure
  request)

(defvar coil--connections nil
  "Alist of (PROJECT-ROOT . `coil-connection').")

(defvar-local coil--connection nil
  "The connection this buffer talks to, overriding project lookup.")

(defun coil-current-connection (&optional no-error)
  "The connection for the current buffer, or nil.
With NO-ERROR nil, signal a clear error rather than returning nil."
  (let ((conn (or coil--connection
                  (cdr (assoc (coil-project-root) coil--connections)))))
    (cond ((and conn (coil-connection-live-p conn)) conn)
          (no-error nil)
          (t (user-error "No Coil REPL for %s — start one with %s"
                         (abbreviate-file-name (coil-project-root))
                         (substitute-command-keys "\\[coil-repl]"))))))

(defun coil-connection-live-p (conn)
  "Whether CONN's process is still running."
  (and conn
       (buffer-live-p (coil-connection-buffer conn))
       (let ((proc (get-buffer-process (coil-connection-buffer conn))))
         (and proc (process-live-p proc)))))

(defun coil-repl-connected-p ()
  "Whether the current buffer has a usable REPL."
  (and (coil-current-connection t) t))

(defun coil--connection-process (conn)
  "CONN's process."
  (get-buffer-process (coil-connection-buffer conn)))


;;; ---------------------------------------------------------------------------
;;; Output capture

(defun coil--strip-continuation-prompts (text)
  "Remove the REPL's `....> ' continuation prompts from TEXT.
They are printed while a multi-line form is still being read, so they land
in the middle of a capture and mean nothing to the caller.  They are
stripped from the REPL DISPLAY too: both paths that send a multi-line form
— an editor evaluation and `coil-repl-return' — put the whole form in the
buffer before sending it, so the prompts would only interleave with output
under text that is already complete."
  (replace-regexp-in-string "^\\(?:\\.\\.\\.\\.> \\)+" "" text))

(defun coil--clean-output (text)
  "Normalise captured TEXT: no carriage returns, no continuation prompts,
no leading or trailing blank lines."
  (string-trim (coil--strip-continuation-prompts
                (replace-regexp-in-string "\r" "" text))))

(defun coil--output-error-p (output)
  "Whether OUTPUT reports a failure.
HEURISTIC: the REPL writes diagnostics as text beginning with `error:',
so that prefix is all there is to go on.  A structured protocol would
carry the distinction rather than requiring it to be recovered."
  (and output
       (string-match-p "\\(?:\\`\\|\n\\)\\(?:error\\|warning: unhandled\\):" output)
       t))

(defun coil--output-value (output)
  "The value part of OUTPUT, or nil.
HEURISTIC: a definition answers `; ok' and an expression answers with its
printed value, but anything the program itself wrote to stdout is mixed in
ahead of it and cannot be separated.  The last non-empty line is the best
available guess, and the whole capture stays available as `output'."
  (cond
   ((null output) nil)
   ((string-empty-p output) nil)
   ((string-prefix-p "; ok" output) "ok")
   ((coil--output-error-p output) nil)
   (t (car (last (split-string output "\n" t))))))

(defun coil--finish-request (conn request text)
  "Complete REQUEST on CONN with the captured TEXT."
  (let* ((output (coil--clean-output text))
         (result (coil-result-create
                  :output output
                  :value (coil--output-value output)
                  :error (coil--output-error-p output)
                  :request request)))
    (when (coil-request-callback request)
      ;; A failing callback must not wedge the queue, so it runs guarded.
      (condition-case err
          (funcall (coil-request-callback request) result)
        (error (message "coil: result handler failed: %S" err))))
    (unless (coil-request-banner request)
      (setf (coil-connection-ready conn) t))))

(defun coil--preoutput-filter (string)
  "Route STRING to the in-flight request, and decide whether to show it.
Installed in `comint-preoutput-filter-functions' in the REPL buffer."
  (let ((conn coil--connection))
    (if (or (null conn) (null (coil-connection-pending conn)))
        string
      (let* ((request (car (coil-connection-pending conn)))
             (accum (concat (coil-connection-accum conn) string)))
        (if (string-match coil-repl--result-terminator accum)
            (let ((captured (substring accum 0 (match-beginning 0))))
              (setf (coil-connection-accum conn) ""
                    (coil-connection-pending conn)
                    (cdr (coil-connection-pending conn)))
              (coil--finish-request conn request captured)
              (if (coil-request-silent request)
                  ""
                (coil--strip-continuation-prompts string)))
          (setf (coil-connection-accum conn) accum)
          (if (coil-request-silent request)
              ""
            (coil--strip-continuation-prompts string)))))))


;;; ---------------------------------------------------------------------------
;;; Sending

(defun coil--send-request (conn request)
  "Queue REQUEST on CONN and write it to the process."
  (cl-ecase (coil-connection-kind conn)
    (inferior
     (let ((proc (coil--connection-process conn)))
       (unless (and proc (process-live-p proc))
         (user-error "The Coil REPL is not running"))
       (with-current-buffer (coil-connection-buffer conn)
         (setf (coil-connection-pending conn)
               (append (coil-connection-pending conn) (list request)))
         (when (and coil-repl-display-eval-input
                    (not (coil-request-silent request)))
           (coil--echo-input proc (coil-request-text request)))
         (comint-send-string proc (concat (coil-request-text request) "\n")))))))

(defun coil--echo-input (proc text)
  "Insert TEXT into PROC's buffer as if it had been typed there.
The PTY's own echo is off, so without this an evaluation sent from a
source buffer would leave the REPL showing output with no visible cause."
  (let ((inhibit-read-only t))
    (save-excursion
      (goto-char (process-mark proc))
      (insert (propertize text 'font-lock-face 'comint-highlight-input
                          'field 'input)
              "\n")
      (set-marker (process-mark proc) (point)))
    (goto-char (process-mark proc))))

(defun coil--normalize-form (text)
  "TEXT trimmed, with the trailing newline the protocol adds itself removed."
  (string-trim-right (string-trim text) "\n+"))

(defun coil-eval-async (text callback &optional silent connection)
  "Evaluate TEXT in the Coil REPL and pass the `coil-result' to CALLBACK.
With SILENT, nothing appears in the REPL buffer — that is the mode for
tooling queries.  CONNECTION defaults to the current buffer's."
  (let ((conn (or connection (coil-current-connection)))
        (form (coil--normalize-form text)))
    (when (string-empty-p form)
      (user-error "Nothing to evaluate"))
    (coil--send-request
     conn (coil-request-create :text form :callback callback :silent silent))
    conn))

(defun coil-eval-sync (text &optional silent connection timeout)
  "Evaluate TEXT and return its `coil-result', blocking up to TIMEOUT seconds.
For tooling that has nothing useful to do until the answer arrives.  User
commands should prefer `coil-eval-async' so Emacs stays responsive."
  (let* ((conn (or connection (coil-current-connection)))
         (deadline (+ (float-time) (or timeout coil-repl-sync-timeout)))
         (box (list nil)))
    (coil-eval-async text (lambda (result) (setcar box result)) silent conn)
    (while (and (null (car box))
                (< (float-time) deadline)
                (coil-connection-live-p conn))
      (accept-process-output (coil--connection-process conn) 0.05))
    (car box)))


;;; ---------------------------------------------------------------------------
;;; The REPL buffer

(defvar coil-repl-mode-map
  (let ((map (make-sparse-keymap)))
    (set-keymap-parent map comint-mode-map)
    (define-key map (kbd "RET")     #'coil-repl-return)
    (define-key map (kbd "C-c C-z") #'coil-repl-switch-back)
    (define-key map (kbd "C-c M-o") #'coil-repl-clear)
    (define-key map (kbd "C-c C-b") #'coil-repl-interrupt)
    (define-key map (kbd "C-c M-r") #'coil-repl-reset)
    (define-key map (kbd "C-c C-q") #'coil-repl-quit)
    (define-key map (kbd "C-c C-d C-d") #'coil-doc-symbol)
    (define-key map (kbd "C-c C-d C-a") #'coil-apropos)
    map)
  "Keymap for `coil-repl-mode'.")

(define-derived-mode coil-repl-mode comint-mode "Coil-REPL"
  "Major mode for the inferior Coil REPL.

\\{coil-repl-mode-map}"
  :syntax-table coil-mode-syntax-table
  (setq-local comint-prompt-regexp coil-repl-prompt-regexp)
  (setq-local comint-prompt-read-only nil)
  (setq-local comint-use-prompt-regexp nil)
  ;; The PTY echo is off, so comint's own insertion is the only copy.
  (setq-local comint-process-echoes nil)
  (setq-local comint-input-sender #'coil-repl--input-sender)
  (setq-local comint-input-ignoredups t)
  (setq-local comint-input-ring-file-name coil-repl-history-file)
  (setq-local indent-line-function #'lisp-indent-line)
  (setq-local lisp-indent-function #'coil-indent-function)
  (setq-local comment-start ";")
  (setq-local font-lock-defaults
              '(coil-font-lock-keywords
                nil nil nil nil
                (font-lock-syntactic-face-function
                 . coil-font-lock-syntactic-face)))
  (add-hook 'comint-preoutput-filter-functions #'coil--preoutput-filter nil t)
  (when coil-repl-history-file
    (comint-read-input-ring t)
    (add-hook 'kill-buffer-hook #'comint-write-input-ring nil t)))

(defun coil-repl--input-sender (proc string)
  "Send STRING typed at the prompt to PROC, recording it as a request.
Comint has already inserted the text, so this only has to enqueue — the
capture machinery is the same one editor evaluations use."
  (let ((conn coil--connection)
        (form (coil--normalize-form string)))
    (if (or (null conn) (string-empty-p form))
        (comint-send-string proc (concat string "\n"))
      (setf (coil-connection-pending conn)
            (append (coil-connection-pending conn)
                    (list (coil-request-create :text form))))
      (comint-send-string proc (concat form "\n")))))

(defun coil-repl-return ()
  "Send the input at the prompt once it is a complete form.
An unbalanced form gets a newline and indentation instead, so a multi-line
definition can be composed in place the way it is in a CIDER REPL."
  (interactive)
  (let* ((start (or (marker-position
                     (process-mark (get-buffer-process (current-buffer))))
                    (point-min)))
         (input (buffer-substring-no-properties start (point-max))))
    (if (coil--balanced-p input)
        (comint-send-input)
      (newline-and-indent))))

(defun coil--balanced-p (text)
  "Whether TEXT is a complete, balanced sequence of Coil forms.
A trailing comment does not make it incomplete — hence the newline, which
closes one — but an open delimiter or an unterminated string does."
  (with-temp-buffer
    (set-syntax-table coil-mode-syntax-table)
    (insert text "\n")
    (let ((state (parse-partial-sexp (point-min) (point-max))))
      (and (zerop (or (nth 0 state) 0))
           (not (nth 3 state))))))


;;; ---------------------------------------------------------------------------
;;; Starting, stopping, and getting to it

(defun coil--repl-command ()
  "The shell command that starts the REPL with echo off on its PTY."
  (format "stty -echo 2>/dev/null; exec %s repl"
          (shell-quote-argument coil-program)))

;;;###autoload
(defun coil-repl (&optional project)
  "Start a Coil REPL for PROJECT (default: this buffer's project), or switch
to the one already running for it."
  (interactive)
  (let* ((root (or project (coil-project-root)))
         (existing (cdr (assoc root coil--connections))))
    (if (coil-connection-live-p existing)
        (progn (pop-to-buffer (coil-connection-buffer existing)) existing)
      (unless (executable-find coil-program)
        (user-error "Cannot find `%s' — set `coil-program'" coil-program))
      (let* ((name (format coil-repl-buffer-name-format
                           (file-name-nondirectory
                            (directory-file-name root))))
             (buffer (get-buffer-create name))
             conn)
        (with-current-buffer buffer
          (setq default-directory (file-name-as-directory root))
          ;; `sh -c' rather than the binary directly: `stty -echo' has to run
          ;; on the PTY before the compiler takes it over.
          (make-comint-in-buffer name buffer "sh" nil "-c" (coil--repl-command))
          (coil-repl-mode)
          (setq conn (coil-connection-create :buffer buffer :project root))
          (setq coil--connection conn)
          ;; The banner and first prompt belong to nobody, so give them an
          ;; owner: without it the capture for the first real request would
          ;; start mid-banner.
          (setf (coil-connection-pending conn)
                (list (coil-request-create
                       :text "" :banner t
                       :callback (lambda (_) (setf (coil-connection-ready conn) t)))))
          (set-process-sentinel (get-buffer-process buffer)
                                #'coil--process-sentinel))
        (setf (alist-get root coil--connections nil nil #'equal) conn)
        (pop-to-buffer buffer)
        conn))))

(defun coil--process-sentinel (proc event)
  "Report PROC's EVENT and release anything waiting on it."
  (let ((buffer (process-buffer proc)))
    (when (buffer-live-p buffer)
      (with-current-buffer buffer
        (let ((conn coil--connection))
          (when conn
            (dolist (request (coil-connection-pending conn))
              (when (coil-request-callback request)
                (ignore-errors
                  (funcall (coil-request-callback request)
                           (coil-result-create
                            :output (format "REPL exited: %s" (string-trim event))
                            :error t :request request)))))
            (setf (coil-connection-pending conn) nil
                  (coil-connection-ready conn) nil))))
      (unless (process-live-p proc)
        (message "Coil REPL: %s" (string-trim event))))))

(defvar coil-repl--last-source nil
  "The buffer \\[coil-repl-switch] was last invoked from.")

(defun coil-repl-switch ()
  "Switch to this project's REPL buffer, starting one if there is none."
  (interactive)
  (let ((source (current-buffer))
        (conn (or (coil-current-connection t) (coil-repl))))
    (pop-to-buffer (coil-connection-buffer conn))
    (setq coil-repl--last-source source)
    (goto-char (point-max))))

(defun coil-repl-switch-back ()
  "Return to the buffer \\[coil-repl-switch] came from."
  (interactive)
  (if (buffer-live-p coil-repl--last-source)
      (pop-to-buffer coil-repl--last-source)
    (user-error "No buffer to switch back to")))

(defun coil-repl-quit ()
  "Shut down this project's REPL."
  (interactive)
  (let ((conn (coil-current-connection t)))
    (unless conn (user-error "No Coil REPL is running"))
    (let ((buffer (coil-connection-buffer conn))
          (root (coil-connection-project conn)))
      (when (coil-connection-live-p conn)
        (comint-send-string (coil--connection-process conn) ":quit\n")
        (sit-for 0.2))
      (setq coil--connections (assoc-delete-all root coil--connections))
      (when (buffer-live-p buffer)
        (let ((proc (get-buffer-process buffer)))
          (when (process-live-p proc) (delete-process proc)))
        (kill-buffer buffer))
      (message "Coil REPL stopped"))))

(defun coil-repl-clear ()
  "Erase the REPL buffer, keeping the current prompt."
  (interactive)
  (let ((conn (coil-current-connection)))
    (with-current-buffer (coil-connection-buffer conn)
      (let ((inhibit-read-only t))
        (comint-clear-buffer)))))

(defun coil-repl-interrupt ()
  "Interrupt whatever the REPL is currently running."
  (interactive)
  (let ((conn (coil-current-connection)))
    (interrupt-process (coil--connection-process conn))
    (message "Interrupt sent")))

(defun coil-repl-reset ()
  "Clear every definition in the session (`:reset')."
  (interactive)
  (when (yes-or-no-p "Discard every definition in this Coil session? ")
    (coil-eval-async
     ":reset"
     (lambda (result)
       (if (coil-result-error result)
           (message "Reset refused: %s" (coil-result-output result))
         (message "Coil session reset"))))))

(provide 'coil-repl)
;;; coil-repl.el ends here
