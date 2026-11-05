
/tmp/coil-register-effect-gp-partial.o:	file format mach-o arm64

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
      44:      	str	x0, [x16]
      48:      	str	x1, [x16, #0x8]
      4c:      	ldr	x0, [x20]
      50:      	ldur	x1, [x20, #0x4]
      54:      	eor	x0, x21, x0
      58:      	ldr	x2, [x19, #0x8]
      5c:      	add	x0, x0, x1
      60:      	add	x0, x0, x2
      64:      	ldr	x19, [sp, #0x20]
      68:      	ldr	x20, [sp, #0x28]
      6c:      	ldr	x21, [sp, #0x30]
      70:      	ldr	x29, [sp, #0x10]
      74:      	ldr	x30, [sp, #0x18]
      78:      	add	sp, sp, #0x40
      7c:      	ret
