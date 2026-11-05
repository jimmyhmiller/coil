
/tmp/coil-alias-parameter-before.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_area_alias>:
       0:      	sub	sp, sp, #0x40
       4:      	str	x2, [x0]
       8:      	ldr	x2, [x0]
       c:      	mov	x17, #0xdef0            ; =57072
      10:      	movk	x17, #0x9abc, lsl #16
      14:      	movk	x17, #0x5678, lsl #32
      18:      	movk	x17, #0x1234, lsl #48
      1c:      	str	x17, [x1]
      20:      	ldr	x0, [x0]
      24:      	eor	x0, x2, x0
      28:      	add	sp, sp, #0x40
      2c:      	ret
