
/tmp/coil-alias-private-after.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_area_alias>:
       0:      	sub	sp, sp, #0x40
       4:      	eor	x1, x2, x2
       8:      	str	x2, [x0]
       c:      	mov	x16, sp
      10:      	mov	x17, #0xdef0            ; =57072
      14:      	movk	x17, #0x9abc, lsl #16
      18:      	movk	x17, #0x5678, lsl #32
      1c:      	movk	x17, #0x1234, lsl #48
      20:      	str	x17, [x16]
      24:      	mov	x0, x1
      28:      	add	sp, sp, #0x40
      2c:      	ret
