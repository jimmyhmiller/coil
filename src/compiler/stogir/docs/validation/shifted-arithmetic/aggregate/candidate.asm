
/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/.worktrees/shifted-arithmetic/build/shifted-aggregate/candidate.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_aggregate_get>:
       0:      	lsl	x2, x1, #4
       4:      	ldr	x0, [x0]
       8:      	add	x0, x0, x1, lsl #4
       c:      	ldr	x1, [x0]
      10:      	ldr	x0, [x0, #0x8]
      14:      	lsr	w2, w0, #0
      18:      	sxtw	x2, w2
      1c:      	add	x1, x2, x1, asr #32
      20:      	add	x0, x1, x0, asr #32
      24:      	ret
