;; Host-backed errors and generated record type checks must flow through the
;; same R6RS handler stack as source `raise`.  Jolt deliberately probes record
;; predicates with malformed instances under `guard`; an unchecked accessor
;; used to turn that recoverable type error into a native segmentation fault.
(define-record-type guarded-record
  (fields value)
  (nongenerative guarded-record-v1))

(define-record-type other-record
  (fields value)
  (nongenerative other-record-v1))

(display
  (guard (condition (else 'caught-error))
    (error 'fixture "expected error" 17)))
(newline)

(display
  (guard (condition (else 'caught-accessor))
    (guarded-record-value (make-other-record 42))))
(newline)
