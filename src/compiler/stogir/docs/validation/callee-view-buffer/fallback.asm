
/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/.worktrees/inline-callee-views/build/view-buffer/coil-stogir-view-buffer-2.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_view_caller>:
       0:      	sub	sp, sp, #0x20
       4:      	str	x29, [sp]
       8:      	str	x30, [sp, #0x8]
       c:      	mov	x29, sp
      10:      	str	x19, [sp, #0x10]
      14:      	add	x1, x0, #0x7
      18:      	add	x1, x0, x1
      1c:      	mov	x19, x0
      20:      	mov	x0, x1
      24:      	bl	0x24 <_view_caller+0x24>
		0000000000000024:  ARM64_RELOC_BRANCH26	_view_leaf
      28:      	mov	x17, #0x3               ; =3
      2c:      	mul	x0, x0, x17
      30:      	add	x0, x0, #0x7
      34:      	mov	x17, #0x3               ; =3
      38:      	mul	x0, x0, x17
      3c:      	add	x0, x0, #0x7
      40:      	mov	x17, #0x3               ; =3
      44:      	mul	x0, x0, x17
      48:      	add	x0, x0, #0x7
      4c:      	mov	x17, #0x3               ; =3
      50:      	mul	x0, x0, x17
      54:      	add	x0, x0, #0x7
      58:      	mov	x17, #0x3               ; =3
      5c:      	mul	x0, x0, x17
      60:      	add	x0, x0, #0x7
      64:      	mov	x17, #0x3               ; =3
      68:      	mul	x0, x0, x17
      6c:      	add	x0, x0, #0x7
      70:      	add	x0, x0, x19
      74:      	ldr	x19, [sp, #0x10]
      78:      	ldr	x29, [sp]
      7c:      	ldr	x30, [sp, #0x8]
      80:      	add	sp, sp, #0x20
      84:      	ret

0000000000000088 <_view_wrapper>:
      88:      	ldr	x1, [x0]
      8c:      	ldr	x0, [x0, #0x8]
      90:      	add	x0, x1, x0
      94:      	mov	x17, #0x3               ; =3
      98:      	mul	x0, x0, x17
      9c:      	add	x0, x0, #0x7
      a0:      	mov	x17, #0x3               ; =3
      a4:      	mul	x0, x0, x17
      a8:      	add	x0, x0, #0x7
      ac:      	mov	x17, #0x3               ; =3
      b0:      	mul	x0, x0, x17
      b4:      	add	x0, x0, #0x7
      b8:      	mov	x17, #0x3               ; =3
      bc:      	mul	x0, x0, x17
      c0:      	add	x0, x0, #0x7
      c4:      	mov	x17, #0x3               ; =3
      c8:      	mul	x0, x0, x17
      cc:      	add	x0, x0, #0x7
      d0:      	mov	x17, #0x3               ; =3
      d4:      	mul	x0, x0, x17
      d8:      	add	x0, x0, #0x7
      dc:      	mov	x17, #0x3               ; =3
      e0:      	mul	x0, x0, x17
      e4:      	add	x0, x0, #0x7
      e8:      	mov	x17, #0x3               ; =3
      ec:      	mul	x0, x0, x17
      f0:      	add	x0, x0, #0x7
      f4:      	mov	x17, #0x3               ; =3
      f8:      	mul	x0, x0, x17
      fc:      	add	x0, x0, #0x7
     100:      	mov	x17, #0x3               ; =3
     104:      	mul	x0, x0, x17
     108:      	add	x0, x0, #0x7
     10c:      	mov	x17, #0x3               ; =3
     110:      	mul	x0, x0, x17
     114:      	add	x0, x0, #0x7
     118:      	mov	x17, #0x3               ; =3
     11c:      	mul	x0, x0, x17
     120:      	add	x0, x0, #0x7
     124:      	mov	x17, #0x3               ; =3
     128:      	mul	x0, x0, x17
     12c:      	add	x0, x0, #0x7
     130:      	mov	x17, #0x3               ; =3
     134:      	mul	x0, x0, x17
     138:      	add	x0, x0, #0x7
     13c:      	mov	x17, #0x3               ; =3
     140:      	mul	x0, x0, x17
     144:      	add	x0, x0, #0x7
     148:      	mov	x17, #0x3               ; =3
     14c:      	mul	x0, x0, x17
     150:      	add	x0, x0, #0x7
     154:      	mov	x17, #0x3               ; =3
     158:      	mul	x0, x0, x17
     15c:      	add	x0, x0, #0x7
     160:      	mov	x17, #0x3               ; =3
     164:      	mul	x0, x0, x17
     168:      	add	x0, x0, #0x7
     16c:      	ret

0000000000000170 <_view_leaf>:
     170:      	mov	x17, #0x3               ; =3
     174:      	mul	x0, x0, x17
     178:      	add	x0, x0, #0x7
     17c:      	mov	x17, #0x3               ; =3
     180:      	mul	x0, x0, x17
     184:      	add	x0, x0, #0x7
     188:      	mov	x17, #0x3               ; =3
     18c:      	mul	x0, x0, x17
     190:      	add	x0, x0, #0x7
     194:      	mov	x17, #0x3               ; =3
     198:      	mul	x0, x0, x17
     19c:      	add	x0, x0, #0x7
     1a0:      	mov	x17, #0x3               ; =3
     1a4:      	mul	x0, x0, x17
     1a8:      	add	x0, x0, #0x7
     1ac:      	mov	x17, #0x3               ; =3
     1b0:      	mul	x0, x0, x17
     1b4:      	add	x0, x0, #0x7
     1b8:      	mov	x17, #0x3               ; =3
     1bc:      	mul	x0, x0, x17
     1c0:      	add	x0, x0, #0x7
     1c4:      	mov	x17, #0x3               ; =3
     1c8:      	mul	x0, x0, x17
     1cc:      	add	x0, x0, #0x7
     1d0:      	mov	x17, #0x3               ; =3
     1d4:      	mul	x0, x0, x17
     1d8:      	add	x0, x0, #0x7
     1dc:      	mov	x17, #0x3               ; =3
     1e0:      	mul	x0, x0, x17
     1e4:      	add	x0, x0, #0x7
     1e8:      	mov	x17, #0x3               ; =3
     1ec:      	mul	x0, x0, x17
     1f0:      	add	x0, x0, #0x7
     1f4:      	mov	x17, #0x3               ; =3
     1f8:      	mul	x0, x0, x17
     1fc:      	add	x0, x0, #0x7
     200:      	ret
