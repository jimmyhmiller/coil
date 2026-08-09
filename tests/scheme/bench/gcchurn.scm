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
; ── HISTORY: THIS CASE ONCE HAD NO .coil DRIVER, AND THE ABSENCE WAS THE RESULT
;
; It could not be run at all. The collector freed values that were still
; reachable, because the shadow stack it traces was never populated: heap.coil
; documented a "GC transform" emitting `gc-root` around managed values, and no
; such transform existed. `mark-roots` walked an empty root set and the sweep
; reclaimed the entire live heap. Reduced to its smallest form — build 1000
; pairs, hold them in a live local, collect, re-sum:
;
;     before collect: 1000
;     after  collect: 16058419951059495
;     gc-live=0 gc-collections=1
;
; `gc-live=0` was the whole story: nothing live, while a local still referenced
; all 1000 pairs. Here the corrupted cells chained through the free list, so the
; fold did not merely return a wrong total — it did not terminate. A 200 x 12,000
; run was killed at 120 s having produced nothing.
;
; FIXED by src/apps/scheme/rooting.coil, which frames every Scheme procedure and
; roots what must survive an allocation. gcchurn.coil now exists and agrees with
; Chez (14401200000). The dash in the benchmark table was a real finding about the
; collector rather than a property of this program — it is kept here because the
; failure it describes is the one this whole case was built to expose.
;
; This remains the case the other three cannot make. They are sized so the live
; set never crosses the 500,000-object threshold, which is what makes THEIR
; numbers an allocation measurement rather than a GC one. Here the live set is a
; single round's list, so nearly everything is garbage when a collection runs —
; the shape most favourable to Chez's generational collector, whose minor
; collection copies only survivors and does work proportional to what LIVES,
; and least favourable to our mark-sweep, which walks every slab to rebuild the
; free list and does work proportional to the HEAP.
(define (build n acc)
  (if (< n 1) acc (build (- n 1) (cons n acc))))

(define (sum l acc)
  (if (null? l) acc (sum (cdr l) (+ acc (car l)))))

(define (rounds k n total)
  (if (< k 1) total (rounds (- k 1) n (+ total (sum (build n '()) 0)))))

(display (rounds 200 12000 0))
(newline)
