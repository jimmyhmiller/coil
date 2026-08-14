(define (registry-collision! kind class member old new)
  (when (and #t (not (eq? old new)) (not (equal? old new)))
    (display kind)
    (newline)))

(registry-collision! "warning" "class" "member" 1 2)
