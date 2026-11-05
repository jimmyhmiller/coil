
/tmp/coil-register-effect-hfa-disjoint.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_register_effect>:
       0:      	sub	sp, sp, #0x40
       4:      	str	x29, [sp, #0x10]
       8:      	str	x30, [sp, #0x18]
       c:      	add	x29, sp, #0x10
      10:      	str	x19, [sp, #0x20]
      14:      	str	x20, [sp, #0x28]
      18:      	str	x21, [sp, #0x30]
      1c:      	add	x19, x0, #0x8
      20:      	str	x2, [x0]
      24:      	eor	x20, x2, x2
      28:      	mov	x30, x3
      2c:      	mov	x16, x19
      30:      	str	x16, [sp]
      34:      	mov	x21, x0
      38:      	mov	x1, #0x11               ; =17
      3c:      	blr	x30
      40:      	ldr	x16, [sp]
      44:      	str	d0, [x16]
      48:      	str	d1, [x16, #0x8]
      4c:      	str	d2, [x16, #0x10]
      50:      	str	d3, [x16, #0x18]
      54:      	ldr	x0, [x21, #0x8]
      58:      	ldr	x1, [x19, #0x8]
      5c:      	add	x0, x20, x0
      60:      	ldr	x2, [x19, #0x10]
      64:      	add	x0, x0, x1
      68:      	ldr	x1, [x19, #0x18]
      6c:      	add	x0, x0, x2
      70:      	add	x0, x0, x1
      74:      	ldr	x19, [sp, #0x20]
      78:      	ldr	x20, [sp, #0x28]
      7c:      	ldr	x21, [sp, #0x30]
      80:      	ldr	x29, [sp, #0x10]
      84:      	ldr	x30, [sp, #0x18]
      88:      	add	sp, sp, #0x40
      8c:      	ret
