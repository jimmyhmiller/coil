; Allocation-heavy: build a fresh list of n integers and fold it, repeatedly.
;
; Every round allocates n pairs that are dead by the end of the round, so this is
; the pure nursery-churn workload a generational collector is built for: Chez
; bump-allocates into a nursery and a minor collection copies only what survives,
; which here is nothing. Ours bump-allocates too, but reclaims by a whole-heap
; mark-sweep, so the cost of getting the memory back is proportional to the heap
; rather than to the survivors.
;
; ⚠ The round count is held low deliberately. Our collector frees values that are
; still live (see README: the shadow stack is never populated), so a run that
; crosses the collection threshold returns a WRONG ANSWER instead of a slow one.
; 40 x 12000 = 480k pairs stays under the 500k threshold and collects zero times,
; which is the only regime in which our number here means anything at all.
(define (build n acc)
  (if (< n 1) acc (build (- n 1) (cons n acc))))

(define (sum l acc)
  (if (null? l) acc (sum (cdr l) (+ acc (car l)))))

(define (rounds k n total)
  (if (< k 1) total (rounds (- k 1) n (+ total (sum (build n '()) 0)))))

;; ⚠ ROUND COUNT IS CHOSEN TO EXCEED THE COLLECTOR'S THRESHOLD.
;;
;; An earlier version used a tenth of these rounds and allocated just under the
;; 500,000-object threshold, so `collections=0` — it measured the allocation path
;; and never ran the collector at all, while being presented as a GC benchmark.
;; Verified with tests/scheme/probe/gcstat.coil, which prints the real counters.
;;
;; A GC benchmark that never collects flatters whoever has the cheaper bump
;; allocator, which is exactly the wrong answer to the question being asked.
(display (rounds 400 12000 0))
(newline)
