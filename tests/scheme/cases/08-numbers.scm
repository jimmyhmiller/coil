; Phase 5: the numeric tower. Bignums and exact rationals are REQUIRED by R5RS
; 6.2.3's "practically unlimited size and precision" for exact numbers.
(display (expt 2 100)) (newline)
(display (* 99999999999 99999999999)) (newline)
(display (/ 1 3)) (newline)
(display (+ 1/3 1/6)) (newline)
(display (exact? 1/3)) (newline)
(display (inexact? 0.5)) (newline)
(display (list (quotient 7 2) (remainder 7 2) (modulo -7 2))) (newline)
(display (list (max 1 2 3) (min 1 2 3) (abs -4) (gcd 32 -36) (lcm 32 -36))) (newline)
(display (list (floor 3.7) (ceiling 3.2) (truncate -3.7) (round 2.5) (round 3.5))) (newline)
(display (string->symbol (list->string (map char-downcase (string->list (number->string 255 16)))))) (newline)
(display (string->number "ff" 16)) (newline)
(display (exact->inexact 1/4)) (newline)
