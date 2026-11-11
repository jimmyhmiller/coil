
/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/.worktrees/shifted-arithmetic/build/shifted-aggregate/llvm.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <ltmp0>:
       0:      	ldr	x8, [x0]
       4:      	add	x8, x8, x1, lsl #4
       8:      	ldrsw	x9, [x8, #0x4]
       c:      	ldr	x8, [x8, #0x8]
      10:      	add	x9, x9, x8, asr #32
      14:      	add	x0, x9, w8, sxtw
      18:      	ret
