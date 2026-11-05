
/tmp/coil-register-effect-hfa-wide.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_register_effect>:
       0:      	sub	sp, sp, #0x30
       4:      	str	x29, [sp, #0x10]
       8:      	str	x30, [sp, #0x18]
       c:      	add	x29, sp, #0x10
      10:      	str	x19, [sp, #0x20]
      14:      	str	x20, [sp, #0x28]
      18:      	add	x1, x0, #0x18
      1c:      	str	x2, [x0, #0x18]
      20:      	mov	x30, x3
      24:      	mov	x16, x0
      28:      	str	x16, [sp]
      2c:      	mov	x19, x0
      30:      	mov	x0, x1
      34:      	mov	x20, x2
      38:      	mov	x1, #0x11               ; =17
      3c:      	blr	x30
      40:      	ldr	x16, [sp]
      44:      	str	d0, [x16]
      48:      	str	d1, [x16, #0x8]
      4c:      	str	d2, [x16, #0x10]
      50:      	str	d3, [x16, #0x18]
      54:      	ldr	x0, [x19, #0x18]
      58:      	ldr	x1, [x19]
      5c:      	eor	x2, x20, x0
      60:      	ldr	x3, [x19, #0x8]
      64:      	add	x1, x2, x1
      68:      	ldr	x2, [x19, #0x10]
      6c:      	add	x1, x1, x3
      70:      	add	x1, x1, x2
      74:      	add	x0, x1, x0
      78:      	ldr	x19, [sp, #0x20]
      7c:      	ldr	x20, [sp, #0x28]
      80:      	ldr	x29, [sp, #0x10]
      84:      	ldr	x30, [sp, #0x18]
      88:      	add	sp, sp, #0x30
      8c:      	ret
