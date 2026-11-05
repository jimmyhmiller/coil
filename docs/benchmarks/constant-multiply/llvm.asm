
/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/.worktrees/wide-record-promotion/build/wide-record-scan/llvm.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <ltmp0>:
       0:      	cmp	x1, #0x1
       4:      	b.lt	0x38 <ltmp0+0x38>
       8:      	ldr	x8, [x0]
       c:      	add	x8, x8, #0x8
      10:      	ldpsw	x9, x10, [x8, #-0x4]
      14:      	add	x11, x2, x2, lsl #5
      18:      	ldr	x12, [x8, #0x8]
      1c:      	subs	x1, x1, #0x1
      20:      	add	x8, x8, #0x20
      24:      	add	x9, x11, x9
      28:      	add	x10, x10, x12
      2c:      	add	x9, x9, x10
      30:      	eor	x2, x9, x2, lsr #7
      34:      	b.ne	0x10 <ltmp0+0x10>
      38:      	mov	x0, x2
      3c:      	ret
