; The classic GC shape: build a complete binary tree, walk it, discard it.
;
; Where the two list cases allocate a flat spine, this allocates a DEEP pointer
; graph — the tracer has to follow both slots of every node, and the recursion
; depth is the tree depth rather than 1. That is the case where a collector's
; mark phase, not its allocation path, is what costs: marking is proportional to
; the number of live edges, and a tree has two per node.
;
; A leaf is '() and an interior node is (cons left right), so a depth-d tree is
; 2^d - 1 pairs. check walks every node and counts it, so the answer is exactly
; the node count plus the leaves it bottoms out on — a value that changes if any
; node is lost, which is what makes the walk a correctness check and not just
; work.
;
; ⚠ Same ceiling as the other two: 30 x (2^14 - 1) = 491,490 pairs, just under the
; 500k threshold, zero collections.
(define (make-tree d)
  (if (< d 1) '() (cons (make-tree (- d 1)) (make-tree (- d 1)))))

(define (check t)
  (if (null? t) 1 (+ 1 (+ (check (car t)) (check (cdr t))))))

(define (rounds k d total)
  (if (< k 1) total (rounds (- k 1) d (+ total (check (make-tree d))))))

;; ⚠ ROUND COUNT IS CHOSEN TO EXCEED THE COLLECTOR'S THRESHOLD.
;;
;; An earlier version used a tenth of these rounds and allocated just under the
;; 500,000-object threshold, so `collections=0` — it measured the allocation path
;; and never ran the collector at all, while being presented as a GC benchmark.
;; Verified with tests/scheme/probe/gcstat.coil, which prints the real counters.
;;
;; A GC benchmark that never collects flatters whoever has the cheaper bump
;; allocator, which is exactly the wrong answer to the question being asked.
(display (rounds 300 14 0))
(newline)
