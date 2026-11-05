
/tmp/coil-register-effect-hfa-partial.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_register_effect>:
       0:      	sub	sp, sp, #0x40
       4:      	str	x29, [sp, #0x10]
       8:      	str	x30, [sp, #0x18]
       c:      	add	x29, sp, #0x10
      10:      	str	x19, [sp, #0x20]
      14:      	str	x20, [sp, #0x28]
      18:      	str	x21, [sp, #0x30]
      1c:      	add	x19, x0, #0x4
      20:      	str	x2, [x0]
      24:      	mov	x30, x3
      28:      	mov	x16, x19
      2c:      	str	x16, [sp]
      30:      	mov	x20, x0
      34:      	mov	x21, x2
      38:      	mov	x1, #0x11               ; =17
      3c:      	blr	x30
      40:      	ldr	x16, [sp]
      44:      	str	d0, [x16]
      48:      	str	d1, [x16, #0x8]
      4c:      	str	d2, [x16, #0x10]
      50:      	str	d3, [x16, #0x18]
      54:      	ldr	x0, [x20]
      58:      	ldur	x1, [x20, #0x4]
      5c:      	eor	x0, x21, x0
      60:      	ldr	x2, [x19, #0x8]
      64:      	add	x0, x0, x1
      68:      	ldr	x1, [x19, #0x10]
      6c:      	add	x0, x0, x2
      70:      	ldr	x2, [x19, #0x18]
      74:      	add	x0, x0, x1
      78:      	add	x0, x0, x2
      7c:      	ldr	x19, [sp, #0x20]
      80:      	ldr	x20, [sp, #0x28]
      84:      	ldr	x21, [sp, #0x30]
      88:      	ldr	x29, [sp, #0x10]
      8c:      	ldr	x30, [sp, #0x18]
      90:      	add	sp, sp, #0x40
      94:      	ret
