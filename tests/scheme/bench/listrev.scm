; Allocation-heavy with a RETAINED intermediate: build a list, reverse it onto a
; fresh accumulator, then fold the reversal.
;
; Different from listsum in the way that matters to a collector. Here the input
; list is still live while the reversed copy is being built, so at the midpoint of
; every round BOTH lists are reachable — the live set peaks at 2n rather than n.
; A copying collector pays in proportion to that surviving set; a mark-sweep pays
; to mark it and then to sweep the whole heap looking for the rest.
;
; ⚠ Same ceiling as listsum, and for the same reason: 30 rounds x (8000 + 8000)
; = 480k pairs, under the 500k threshold, zero collections. Past it our answer is
; wrong rather than slow.
(define (build n acc)
  (if (< n 1) acc (build (- n 1) (cons n acc))))

(define (rev l acc)
  (if (null? l) acc (rev (cdr l) (cons (car l) acc))))

(define (sum l acc)
  (if (null? l) acc (sum (cdr l) (+ acc (car l)))))

(define (rounds k n total)
  (if (< k 1) total
      (rounds (- k 1) n (+ total (sum (rev (build n '()) '()) 0)))))

;; ⚠ ROUND COUNT IS CHOSEN TO EXCEED THE COLLECTOR'S THRESHOLD.
;;
;; An earlier version used a tenth of these rounds and allocated just under the
;; 500,000-object threshold, so `collections=0` — it measured the allocation path
;; and never ran the collector at all, while being presented as a GC benchmark.
;; Verified with tests/scheme/probe/gcstat.coil, which prints the real counters.
;;
;; A GC benchmark that never collects flatters whoever has the cheaper bump
;; allocator, which is exactly the wrong answer to the question being asked.
(display (rounds 300 8000 0))
(newline)
