
/tmp/coil-stogir-static-stack.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_static_stack>:
       0:      	mov	x16, sp
       4:      	mov	x17, #0x2080            ; =8320
       8:      	sub	sp, sp, x17
       c:      	mov	x17, sp
      10:      	and	x17, x17, #0xffffffffffffffc0
      14:      	mov	sp, x17
      18:      	str	x29, [sp]
      1c:      	str	x30, [sp, #0x8]
      20:      	mov	x29, sp
      24:      	str	x16, [sp, #0x10]
      28:      	add	x0, x0, #0xd
      2c:      	add	x16, x29, #0x40
      30:      	str	x0, [x16]
      34:      	add	x16, x29, #0x40
      38:      	ldr	x0, [x16]
      3c:      	sub	sp, x29, #0x0
      40:      	ldr	x17, [sp, #0x10]
      44:      	ldr	x29, [sp]
      48:      	ldr	x30, [sp, #0x8]
      4c:      	mov	sp, x17
      50:      	ret
