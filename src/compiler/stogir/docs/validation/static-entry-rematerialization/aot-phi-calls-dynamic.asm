
/tmp/coil-stogir-static-phi-calls-dynamic.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_static_phi_calls>:
       0:      	sub	sp, sp, #0x50
       4:      	str	x29, [sp, #0x10]
       8:      	str	x30, [sp, #0x18]
       c:      	add	x29, sp, #0x10
      10:      	str	x19, [sp, #0x40]
      14:      	str	x20, [sp, #0x48]
      18:      	add	x3, x2, #0xd
      1c:      	add	x4, x2, #0x1a
      20:      	sub	sp, sp, #0x10
      24:      	add	x19, sp, #0x10
      28:      	add	x16, x29, #0x10
      2c:      	str	x3, [x16]
      30:      	str	x3, [x19]
      34:      	add	x16, x29, #0x20
      38:      	str	x4, [x16]
      3c:      	cmp	x2, #0xd
      40:      	b.ne	0x4c <_static_phi_calls+0x4c>
      44:      	add	x2, x29, #0x10
      48:      	b	0x50 <_static_phi_calls+0x50>
      4c:      	add	x2, x29, #0x20
      50:      	mov	x20, x1
      54:      	mov	x30, x0
      58:      	mov	x0, x2
      5c:      	blr	x30
      60:      	mov	x30, x20
      64:      	add	x16, x29, #0x20
      68:      	str	x16, [sp]
      6c:      	add	x1, x29, #0x20
      70:      	mov	x2, x19
      74:      	add	x3, x29, #0x20
      78:      	add	x4, x29, #0x10
      7c:      	add	x5, x29, #0x20
      80:      	add	x6, x29, #0x10
      84:      	add	x7, x29, #0x20
      88:      	mov	x19, x0
      8c:      	add	x0, x29, #0x10
      90:      	blr	x30
      94:      	add	x16, x29, #0x20
      98:      	ldr	x1, [x16]
      9c:      	add	x0, x19, x0
      a0:      	add	x0, x0, x1
      a4:      	sub	sp, x29, #0x10
      a8:      	ldr	x19, [sp, #0x40]
      ac:      	ldr	x20, [sp, #0x48]
      b0:      	ldr	x29, [sp, #0x10]
      b4:      	ldr	x30, [sp, #0x18]
      b8:      	add	sp, sp, #0x50
      bc:      	ret
