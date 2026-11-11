
/tmp/coil-stogir-static-phi-calls.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_static_phi_calls>:
       0:      	sub	sp, sp, #0x50
       4:      	str	x29, [sp, #0x10]
       8:      	str	x30, [sp, #0x18]
       c:      	add	x29, sp, #0x10
      10:      	str	x19, [sp, #0x40]
      14:      	add	x3, x2, #0xd
      18:      	add	x4, x2, #0x1a
      1c:      	add	x16, sp, #0x20
      20:      	str	x3, [x16]
      24:      	add	x16, sp, #0x30
      28:      	str	x4, [x16]
      2c:      	cmp	x2, #0xd
      30:      	b.ne	0x3c <_static_phi_calls+0x3c>
      34:      	add	x2, sp, #0x20
      38:      	b	0x40 <_static_phi_calls+0x40>
      3c:      	add	x2, sp, #0x30
      40:      	mov	x19, x1
      44:      	mov	x30, x0
      48:      	mov	x0, x2
      4c:      	blr	x30
      50:      	mov	x30, x19
      54:      	add	x16, sp, #0x30
      58:      	str	x16, [sp]
      5c:      	add	x1, sp, #0x30
      60:      	add	x2, sp, #0x30
      64:      	add	x3, sp, #0x30
      68:      	add	x4, sp, #0x20
      6c:      	add	x5, sp, #0x30
      70:      	add	x6, sp, #0x20
      74:      	add	x7, sp, #0x30
      78:      	mov	x19, x0
      7c:      	add	x0, sp, #0x20
      80:      	blr	x30
      84:      	add	x16, sp, #0x30
      88:      	ldr	x1, [x16]
      8c:      	add	x0, x19, x0
      90:      	add	x0, x0, x1
      94:      	ldr	x19, [sp, #0x40]
      98:      	ldr	x29, [sp, #0x10]
      9c:      	ldr	x30, [sp, #0x18]
      a0:      	add	sp, sp, #0x50
      a4:      	ret
