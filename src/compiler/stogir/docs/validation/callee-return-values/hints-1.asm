
/tmp/callee-return-1.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_callee_return_values>:
       0:      	cmp	x0, #0x0
       4:      	b.ne	0x14 <_callee_return_values+0x14>
       8:      	add	x2, x0, #0x3
       c:      	eor	x0, x1, #0x7
      10:      	mov	x1, x2
      14:      	fmov	d31, x0
      18:      	mov	x0, x1
      1c:      	fmov	x1, d31
      20:      	ret
