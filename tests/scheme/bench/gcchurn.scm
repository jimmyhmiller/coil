; The case the other three deliberately avoid: enough allocation to force the
; collector to actually run.
;
; listsum, listrev and bintree are all sized to stay just under our 500,000-object
; collection threshold, so they measure the ALLOCATION path with zero collections
; — bump a cursor, never reclaim. That is a real measurement but a partial one,
; and quoting it as a GC comparison would be dishonest: the whole reason Chez's
; generational moving collector is the interesting opponent is what happens when
; memory has to come back.
;
; This case allocates 200 x 12,000 = 2.4M pairs, which crosses the threshold
; several times over. The live set at any moment is one round's list, so almost
; everything is garbage by the time a collection runs — the shape most favourable
; to a generational collector, whose minor collection copies only survivors and
; therefore does work proportional to what LIVES rather than to what died.
;
; The answer is a deterministic function of the input, so it also serves as a
; correctness check on collection: if the collector reclaims something still
; reachable, the fold reads a freed cell and the total comes out wrong (or the
; program does not finish) rather than merely slow.
;
; ⚠⚠ THERE IS DELIBERATELY NO gcchurn.coil, AND THAT ABSENCE IS THE RESULT.
;
; We cannot run this case at all. Our collector frees values that are still
; reachable, because the shadow stack it traces is never populated: heap.coil
; documents a "GC transform" that emits `gc-root` around managed values, but no
; such transform is registered for `coil.scheme` — the only registered transform
; is the dialect rewriter, and it emits no roots. `mark-roots` therefore walks an
; empty root set and the sweep reclaims the entire live heap.
;
; Reduced to the smallest demonstration, in ordinary Coil against heap.coil
; directly — build 1000 pairs, hold them in a live local, collect, re-sum:
;
;     before collect: 1000
;     after  collect: 16058419951059495
;     gc-live=0 gc-collections=1
;
; `gc-live=0` is the whole story: the collector found nothing live while a local
; variable still referenced all 1000 pairs. In this benchmark the corrupted cells
; chain back through the free list, so the fold does not merely return a wrong
; total — it does not terminate. A 200 x 12,000 run was killed at 120 s having
; produced nothing.
;
; So the honest report for this row is a dash, not a number. The other three
; cases are sized to stay under the 500,000-object threshold precisely so they
; never collect, which is what makes THEIR numbers meaningful — and also what
; makes them an allocation benchmark rather than a GC benchmark. Comparing our
; mark-sweep against Chez's generational collector is the measurement this suite
; cannot yet make, and printing a fabricated number here would hide that.
(define (build n acc)
  (if (< n 1) acc (build (- n 1) (cons n acc))))

(define (sum l acc)
  (if (null? l) acc (sum (cdr l) (+ acc (car l)))))

(define (rounds k n total)
  (if (< k 1) total (rounds (- k 1) n (+ total (sum (build n '()) 0)))))

(display (rounds 200 12000 0))
(newline)
