
/tmp/coil-alias-unknown-before.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_indexed_alias>:
       0:      	add	x1, x0, x1
       4:      	add	x0, x0, x2
       8:      	str	x3, [x1]
       c:      	ldr	x2, [x1]
      10:      	mov	x17, #0xdef0            ; =57072
      14:      	movk	x17, #0x9abc, lsl #16
      18:      	movk	x17, #0x5678, lsl #32
      1c:      	movk	x17, #0x1234, lsl #48
      20:      	str	x17, [x0]
      24:      	ldr	x0, [x1]
      28:      	eor	x0, x2, x0
      2c:      	ret
