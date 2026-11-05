
/tmp/coil-alias-partial-before.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_indexed_alias>:
       0:      	add	x2, x0, x1
       4:      	add	x1, x1, #0x4
       8:      	str	x3, [x2]
       c:      	add	x0, x0, x1
      10:      	ldr	x1, [x2]
      14:      	mov	w17, #0xdef0            ; =57072
      18:      	movk	w17, #0x9abc, lsl #16
      1c:      	str	w17, [x0]
      20:      	ldr	x0, [x2]
      24:      	eor	x0, x1, x0
      28:      	ret
