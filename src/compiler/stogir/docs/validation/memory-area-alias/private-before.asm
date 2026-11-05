
/tmp/coil-alias-private-before.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_area_alias>:
       0:      	sub	sp, sp, #0x40
       4:      	str	x2, [x0]
       8:      	ldr	x1, [x0]
       c:      	mov	x16, sp
      10:      	mov	x17, #0xdef0            ; =57072
      14:      	movk	x17, #0x9abc, lsl #16
      18:      	movk	x17, #0x5678, lsl #32
      1c:      	movk	x17, #0x1234, lsl #48
      20:      	str	x17, [x16]
      24:      	ldr	x0, [x0]
      28:      	eor	x0, x1, x0
      2c:      	add	sp, sp, #0x40
      30:      	ret
