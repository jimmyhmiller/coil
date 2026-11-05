
/tmp/coil-register-effect-gp-constant.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_register_effect>:
       0:      	sub	sp, sp, #0x40
       4:      	str	x29, [sp, #0x10]
       8:      	str	x30, [sp, #0x18]
       c:      	add	x29, sp, #0x10
      10:      	str	x19, [sp, #0x30]
      14:      	eor	x19, x2, x2
      18:      	str	x2, [x0]
      1c:      	mov	x30, x3
      20:      	mov	x1, #0x11               ; =17
      24:      	blr	x30
      28:      	add	x0, x19, x0
      2c:      	add	x0, x0, x1
      30:      	ldr	x19, [sp, #0x30]
      34:      	ldr	x29, [sp, #0x10]
      38:      	ldr	x30, [sp, #0x18]
      3c:      	add	sp, sp, #0x40
      40:      	ret
