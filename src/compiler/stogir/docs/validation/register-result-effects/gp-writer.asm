
/tmp/coil-register-effect-gp-writer.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_register_effect>:
       0:      	sub	sp, sp, #0x40
       4:      	str	x29, [sp, #0x10]
       8:      	str	x30, [sp, #0x18]
       c:      	add	x29, sp, #0x10
      10:      	str	x19, [sp, #0x30]
      14:      	str	x20, [sp, #0x38]
      18:      	str	x2, [x0]
      1c:      	mov	x30, x3
      20:      	add	x16, sp, #0x20
      24:      	str	x16, [sp]
      28:      	mov	x19, x0
      2c:      	mov	x20, x2
      30:      	mov	x1, #0x11               ; =17
      34:      	blr	x30
      38:      	ldr	x16, [sp]
      3c:      	str	x0, [x16]
      40:      	str	x1, [x16, #0x8]
      44:      	ldr	x0, [x19]
      48:      	add	x16, sp, #0x20
      4c:      	ldr	x1, [x16]
      50:      	eor	x0, x20, x0
      54:      	add	x16, sp, #0x20
      58:      	ldr	x2, [x16, #0x8]
      5c:      	add	x0, x0, x1
      60:      	add	x0, x0, x2
      64:      	ldr	x19, [sp, #0x30]
      68:      	ldr	x20, [sp, #0x38]
      6c:      	ldr	x29, [sp, #0x10]
      70:      	ldr	x30, [sp, #0x18]
      74:      	add	sp, sp, #0x40
      78:      	ret
