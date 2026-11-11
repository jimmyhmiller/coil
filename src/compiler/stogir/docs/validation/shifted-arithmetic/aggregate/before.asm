
/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/.worktrees/shifted-arithmetic/build/shifted-aggregate/before.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_aggregate_get>:
       0:      	lsl	x1, x1, #4
       4:      	ldr	x0, [x0]
       8:      	add	x0, x1, x0
       c:      	ldr	x1, [x0]
      10:      	asr	x1, x1, #32
      14:      	ldr	x0, [x0, #0x8]
      18:      	lsr	w2, w0, #0
      1c:      	asr	x0, x0, #32
      20:      	sxtw	x2, w2
      24:      	add	x1, x2, x1
      28:      	add	x0, x0, x1
      2c:      	ret
