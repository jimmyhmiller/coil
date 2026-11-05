
/tmp/coil-alias-partial-after.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_indexed_alias>:
       0:      	add	x2, x0, x1
       4:      	add	x1, x1, #0x4
       8:      	str	x3, [x2]
       c:      	add	x0, x0, x1
      10:      	mov	w17, #0xdef0            ; =57072
      14:      	movk	w17, #0x9abc, lsl #16
      18:      	str	w17, [x0]
      1c:      	ldr	x0, [x2]
      20:      	eor	x0, x3, x0
      24:      	ret
