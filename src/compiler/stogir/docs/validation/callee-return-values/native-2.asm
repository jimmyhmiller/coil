
/tmp/callee-return-2.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_callee_return_values>:
       0:      	and	x2, x0, #0x7
       4:      	mov	x4, x1
       8:      	movz	x3, #0x0, lsl #48
       c:      	b	0x24 <_callee_return_values+0x24>
      10:      	add	x0, x0, x1
      14:      	add	x4, x3, #0x1
      18:      	fmov	d31, x3
      1c:      	mov	x3, x4
      20:      	fmov	x4, d31
      24:      	mov	x5, x0
      28:      	cmp	x3, x2
      2c:      	b.lo	0x10 <_callee_return_values+0x10>
      30:      	mov	x0, x5
      34:      	mov	x1, x4
      38:      	ret
