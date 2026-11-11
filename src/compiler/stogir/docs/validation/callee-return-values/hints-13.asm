
/tmp/callee-return-13.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_callee_return_values>:
       0:      	add	x2, x0, #0x3
       4:      	mov	x3, x0
       8:      	eor	x4, x1, #0x7
       c:      	cmp	x0, #0x0
      10:      	b.ne	0x20 <_callee_return_values+0x20>
      14:      	mov	x0, x2
      18:      	mov	x1, x4
      1c:      	ret
      20:      	mov	x0, x1
      24:      	mov	x1, x3
      28:      	ret
