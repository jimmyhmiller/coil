
/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/.worktrees/inline-callee-views/build/view-buffer/coil-stogir-view-buffer-1.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_view_caller>:
       0:      	sub	sp, sp, #0x20
       4:      	str	x29, [sp]
       8:      	str	x30, [sp, #0x8]
       c:      	mov	x29, sp
      10:      	str	x19, [sp, #0x10]
      14:      	sub	sp, sp, #0x10
      18:      	mov	x1, sp
      1c:      	add	x2, x0, #0x7
      20:      	str	x0, [x1]
      24:      	str	x2, [x1, #0x8]
      28:      	mov	x19, x0
      2c:      	mov	x0, x1
      30:      	bl	0x30 <_view_caller+0x30>
		0000000000000030:  ARM64_RELOC_BRANCH26	_view_wrapper
      34:      	add	x0, x0, x19
      38:      	sub	sp, x29, #0x0
      3c:      	ldr	x19, [sp, #0x10]
      40:      	ldr	x29, [sp]
      44:      	ldr	x30, [sp, #0x8]
      48:      	add	sp, sp, #0x20
      4c:      	ret

0000000000000050 <_view_wrapper>:
      50:      	ldr	x1, [x0]
      54:      	ldr	x0, [x0, #0x8]
      58:      	add	x0, x1, x0
      5c:      	mov	x17, #0x3               ; =3
      60:      	mul	x0, x0, x17
      64:      	add	x0, x0, #0x7
      68:      	mov	x17, #0x3               ; =3
      6c:      	mul	x0, x0, x17
      70:      	add	x0, x0, #0x7
      74:      	mov	x17, #0x3               ; =3
      78:      	mul	x0, x0, x17
      7c:      	add	x0, x0, #0x7
      80:      	mov	x17, #0x3               ; =3
      84:      	mul	x0, x0, x17
      88:      	add	x0, x0, #0x7
      8c:      	mov	x17, #0x3               ; =3
      90:      	mul	x0, x0, x17
      94:      	add	x0, x0, #0x7
      98:      	mov	x17, #0x3               ; =3
      9c:      	mul	x0, x0, x17
      a0:      	add	x0, x0, #0x7
      a4:      	mov	x17, #0x3               ; =3
      a8:      	mul	x0, x0, x17
      ac:      	add	x0, x0, #0x7
      b0:      	mov	x17, #0x3               ; =3
      b4:      	mul	x0, x0, x17
      b8:      	add	x0, x0, #0x7
      bc:      	mov	x17, #0x3               ; =3
      c0:      	mul	x0, x0, x17
      c4:      	add	x0, x0, #0x7
      c8:      	mov	x17, #0x3               ; =3
      cc:      	mul	x0, x0, x17
      d0:      	add	x0, x0, #0x7
      d4:      	mov	x17, #0x3               ; =3
      d8:      	mul	x0, x0, x17
      dc:      	add	x0, x0, #0x7
      e0:      	mov	x17, #0x3               ; =3
      e4:      	mul	x0, x0, x17
      e8:      	add	x0, x0, #0x7
      ec:      	mov	x17, #0x3               ; =3
      f0:      	mul	x0, x0, x17
      f4:      	add	x0, x0, #0x7
      f8:      	mov	x17, #0x3               ; =3
      fc:      	mul	x0, x0, x17
     100:      	add	x0, x0, #0x7
     104:      	mov	x17, #0x3               ; =3
     108:      	mul	x0, x0, x17
     10c:      	add	x0, x0, #0x7
     110:      	mov	x17, #0x3               ; =3
     114:      	mul	x0, x0, x17
     118:      	add	x0, x0, #0x7
     11c:      	mov	x17, #0x3               ; =3
     120:      	mul	x0, x0, x17
     124:      	add	x0, x0, #0x7
     128:      	mov	x17, #0x3               ; =3
     12c:      	mul	x0, x0, x17
     130:      	add	x0, x0, #0x7
     134:      	ret

0000000000000138 <_view_leaf>:
     138:      	mov	x17, #0x3               ; =3
     13c:      	mul	x0, x0, x17
     140:      	add	x0, x0, #0x7
     144:      	mov	x17, #0x3               ; =3
     148:      	mul	x0, x0, x17
     14c:      	add	x0, x0, #0x7
     150:      	mov	x17, #0x3               ; =3
     154:      	mul	x0, x0, x17
     158:      	add	x0, x0, #0x7
     15c:      	mov	x17, #0x3               ; =3
     160:      	mul	x0, x0, x17
     164:      	add	x0, x0, #0x7
     168:      	mov	x17, #0x3               ; =3
     16c:      	mul	x0, x0, x17
     170:      	add	x0, x0, #0x7
     174:      	mov	x17, #0x3               ; =3
     178:      	mul	x0, x0, x17
     17c:      	add	x0, x0, #0x7
     180:      	mov	x17, #0x3               ; =3
     184:      	mul	x0, x0, x17
     188:      	add	x0, x0, #0x7
     18c:      	mov	x17, #0x3               ; =3
     190:      	mul	x0, x0, x17
     194:      	add	x0, x0, #0x7
     198:      	mov	x17, #0x3               ; =3
     19c:      	mul	x0, x0, x17
     1a0:      	add	x0, x0, #0x7
     1a4:      	mov	x17, #0x3               ; =3
     1a8:      	mul	x0, x0, x17
     1ac:      	add	x0, x0, #0x7
     1b0:      	mov	x17, #0x3               ; =3
     1b4:      	mul	x0, x0, x17
     1b8:      	add	x0, x0, #0x7
     1bc:      	mov	x17, #0x3               ; =3
     1c0:      	mul	x0, x0, x17
     1c4:      	add	x0, x0, #0x7
     1c8:      	ret
