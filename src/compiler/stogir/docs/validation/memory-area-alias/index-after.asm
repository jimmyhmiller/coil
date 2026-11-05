
/tmp/coil-alias-index-after.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_indexed_alias>:
       0:      	add	x2, x0, x1
       4:      	add	x1, x1, #0x8
       8:      	eor	x4, x3, x3
       c:      	str	x3, [x2]
      10:      	add	x0, x0, x1
      14:      	mov	x17, #0xdef0            ; =57072
      18:      	movk	x17, #0x9abc, lsl #16
      1c:      	movk	x17, #0x5678, lsl #32
      20:      	movk	x17, #0x1234, lsl #48
      24:      	str	x17, [x0]
      28:      	mov	x0, x4
      2c:      	ret
