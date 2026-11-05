
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-contained-load-promotion/build/operand-contained-promotion/contained-stogir.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_operand_control>:
       0:      	sxtw	x1, w1
       4:      	cmp	x1, #0x0
       8:      	b.le	0x54 <_gap_operand_control+0x54>
       c:      	lsl	x3, x1, #2
      10:      	cmp	x1, #0x0
      14:      	b.le	0xb0 <_gap_operand_control+0xb0>
      18:      	ldr	x4, [x0, #0x8]
      1c:      	cmp	x1, x4
      20:      	b.ge	0x108 <_gap_operand_control+0x108>
      24:      	add	x4, x0, #0x78
      28:      	ldr	x4, [x4, #0x8]
      2c:      	cmp	x1, x4
      30:      	b.ge	0x19c <_gap_operand_control+0x19c>
      34:      	ldr	x4, [x0, #0x78]
      38:      	add	x4, x3, x4
      3c:      	ldr	w4, [x4]
      40:      	sxtw	x4, w4
      44:      	cmp	x4, #0x0
      48:      	cset	w4, ge
      4c:      	ubfx	x4, x4, #0, #8
      50:      	b	0x1a0 <_gap_operand_control+0x1a0>
      54:      	movz	x0, #0x0, lsl #48
      58:      	movz	x1, #0x0, lsl #48
      5c:      	lsr	w0, w0, #0
      60:      	lsr	x16, x0, #0
      64:      	cmp	x16, #0x1
      68:      	b.eq	0x84 <_gap_operand_control+0x84>
      6c:      	b.lo	0x74 <_gap_operand_control+0x74>
      70:      	b	0x88 <_gap_operand_control+0x88>
      74:      	cmp	x16, #0x0
      78:      	b.eq	0x80 <_gap_operand_control+0x80>
      7c:      	b	0x88 <_gap_operand_control+0x88>
      80:      	b	0x9c <_gap_operand_control+0x9c>
      84:      	b	0x8c <_gap_operand_control+0x8c>
      88:      	b	0x1ac <_gap_operand_control+0x1ac>
      8c:      	lsr	w1, w1, #0
      90:      	sxtw	x1, w1
      94:      	mov	x0, x1
      98:      	b	0xa0 <_gap_operand_control+0xa0>
      9c:      	mov	x0, #-0x8000000000000000 ; =-9223372036854775808
      a0:      	ret
      a4:      	movz	x0, #0x0, lsl #48
      a8:      	movz	x1, #0x0, lsl #48
      ac:      	b	0x5c <_gap_operand_control+0x5c>
      b0:      	cmp	x1, #0x0
      b4:      	b.ge	0x110 <_gap_operand_control+0x110>
      b8:      	add	x4, x0, #0x28
      bc:      	add	x5, x0, #0x50
      c0:      	ldr	x4, [x4, #0x8]
      c4:      	ldr	x5, [x5, #0x8]
      c8:      	cmp	x4, x5
      cc:      	b.ne	0x194 <_gap_operand_control+0x194>
      d0:      	movz	x16, #0x0, lsl #48
      d4:      	sub	x5, x16, x1
      d8:      	cmp	x5, x4
      dc:      	b.gt	0x1a4 <_gap_operand_control+0x1a4>
      e0:      	sub	x4, x5, #0x1
      e4:      	lsl	x4, x4, #2
      e8:      	ldr	x5, [x0, #0x50]
      ec:      	add	x4, x4, x5
      f0:      	ldr	w4, [x4]
      f4:      	sxtw	x4, w4
      f8:      	cmp	x4, #0x0
      fc:      	cset	w4, gt
     100:      	ubfx	x4, x4, #0, #8
     104:      	b	0x1a8 <_gap_operand_control+0x1a8>
     108:      	movz	x4, #0x0, lsl #48
     10c:      	b	0x114 <_gap_operand_control+0x114>
     110:      	movz	x4, #0x0, lsl #48
     114:      	cmp	x4, #0x0
     118:      	b.eq	0x54 <_gap_operand_control+0x54>
     11c:      	sxtw	x2, w2
     120:      	cmp	x2, #0x1
     124:      	b.lt	0xa4 <_gap_operand_control+0xa4>
     128:      	ldr	x4, [x0, #0x78]
     12c:      	add	x3, x3, x4
     130:      	ldr	w3, [x3]
     134:      	sxtw	x3, w3
     138:      	cmp	x2, x3
     13c:      	b.gt	0xa4 <_gap_operand_control+0xa4>
     140:      	asr	x16, x2, #63
     144:      	lsr	x16, x16, #62
     148:      	add	x3, x2, x16
     14c:      	asr	x3, x3, #2
     150:      	asr	x16, x2, #63
     154:      	lsr	x16, x16, #62
     158:      	add	x2, x2, x16
     15c:      	and	x2, x2, #0x3
     160:      	sub	x2, x2, x16
     164:      	ldr	x0, [x0]
     168:      	add	x1, x3, x1
     16c:      	lsl	x2, x2, #2
     170:      	lsl	x1, x1, #4
     174:      	add	x0, x1, x0
     178:      	add	x0, x2, x0
     17c:      	ldr	w0, [x0]
     180:      	sxtw	x0, w0
     184:      	and	x0, x0, #0xffffffff
     188:      	mov	x1, x0
     18c:      	mov	x0, #0x1                ; =1
     190:      	b	0xac <_gap_operand_control+0xac>
     194:      	movz	x4, #0x0, lsl #48
     198:      	b	0x114 <_gap_operand_control+0x114>
     19c:      	movz	x4, #0x0, lsl #48
     1a0:      	b	0x10c <_gap_operand_control+0x10c>
     1a4:      	movz	x4, #0x0, lsl #48
     1a8:      	b	0x198 <_gap_operand_control+0x198>
     1ac:      	brk	#0
     1b0:      	b	0x1ac <_gap_operand_control+0x1ac>

00000000000001b4 <_stogir.graph.operand>:
     1b4:      	sub	sp, sp, #0x10
     1b8:      	mov	x3, sp
     1bc:      	sxtw	x1, w1
     1c0:      	cmp	x1, #0x0
     1c4:      	b.le	0x210 <_stogir.graph.operand+0x5c>
     1c8:      	lsl	x4, x1, #2
     1cc:      	cmp	x1, #0x0
     1d0:      	b.le	0x23c <_stogir.graph.operand+0x88>
     1d4:      	ldr	x5, [x0, #0x8]
     1d8:      	cmp	x1, x5
     1dc:      	b.ge	0x294 <_stogir.graph.operand+0xe0>
     1e0:      	add	x5, x0, #0x78
     1e4:      	ldr	x5, [x5, #0x8]
     1e8:      	cmp	x1, x5
     1ec:      	b.ge	0x328 <_stogir.graph.operand+0x174>
     1f0:      	ldr	x5, [x0, #0x78]
     1f4:      	add	x5, x4, x5
     1f8:      	ldr	w5, [x5]
     1fc:      	sxtw	x5, w5
     200:      	cmp	x5, #0x0
     204:      	cset	w5, ge
     208:      	ubfx	x5, x5, #0, #8
     20c:      	b	0x32c <_stogir.graph.operand+0x178>
     210:      	movz	x0, #0x0, lsl #48
     214:      	movz	x1, #0x0, lsl #48
     218:      	str	x0, [x3]
     21c:      	str	x1, [x3, #0x8]
     220:      	ldr	x0, [sp]
     224:      	ldr	x1, [sp, #0x8]
     228:      	add	sp, sp, #0x10
     22c:      	ret
     230:      	movz	x0, #0x0, lsl #48
     234:      	movz	x1, #0x0, lsl #48
     238:      	b	0x218 <_stogir.graph.operand+0x64>
     23c:      	cmp	x1, #0x0
     240:      	b.ge	0x29c <_stogir.graph.operand+0xe8>
     244:      	add	x5, x0, #0x28
     248:      	add	x6, x0, #0x50
     24c:      	ldr	x5, [x5, #0x8]
     250:      	ldr	x6, [x6, #0x8]
     254:      	cmp	x5, x6
     258:      	b.ne	0x320 <_stogir.graph.operand+0x16c>
     25c:      	movz	x16, #0x0, lsl #48
     260:      	sub	x6, x16, x1
     264:      	cmp	x6, x5
     268:      	b.gt	0x330 <_stogir.graph.operand+0x17c>
     26c:      	sub	x5, x6, #0x1
     270:      	lsl	x5, x5, #2
     274:      	ldr	x6, [x0, #0x50]
     278:      	add	x5, x5, x6
     27c:      	ldr	w5, [x5]
     280:      	sxtw	x5, w5
     284:      	cmp	x5, #0x0
     288:      	cset	w5, gt
     28c:      	ubfx	x5, x5, #0, #8
     290:      	b	0x334 <_stogir.graph.operand+0x180>
     294:      	movz	x5, #0x0, lsl #48
     298:      	b	0x2a0 <_stogir.graph.operand+0xec>
     29c:      	movz	x5, #0x0, lsl #48
     2a0:      	cmp	x5, #0x0
     2a4:      	b.eq	0x210 <_stogir.graph.operand+0x5c>
     2a8:      	sxtw	x2, w2
     2ac:      	cmp	x2, #0x1
     2b0:      	b.lt	0x230 <_stogir.graph.operand+0x7c>
     2b4:      	ldr	x5, [x0, #0x78]
     2b8:      	add	x4, x4, x5
     2bc:      	ldr	w4, [x4]
     2c0:      	sxtw	x4, w4
     2c4:      	cmp	x2, x4
     2c8:      	b.gt	0x230 <_stogir.graph.operand+0x7c>
     2cc:      	asr	x16, x2, #63
     2d0:      	lsr	x16, x16, #62
     2d4:      	add	x4, x2, x16
     2d8:      	asr	x4, x4, #2
     2dc:      	asr	x16, x2, #63
     2e0:      	lsr	x16, x16, #62
     2e4:      	add	x2, x2, x16
     2e8:      	and	x2, x2, #0x3
     2ec:      	sub	x2, x2, x16
     2f0:      	ldr	x0, [x0]
     2f4:      	add	x1, x4, x1
     2f8:      	lsl	x2, x2, #2
     2fc:      	lsl	x1, x1, #4
     300:      	add	x0, x1, x0
     304:      	add	x0, x2, x0
     308:      	ldr	w0, [x0]
     30c:      	sxtw	x0, w0
     310:      	and	x0, x0, #0xffffffff
     314:      	mov	x1, x0
     318:      	mov	x0, #0x1                ; =1
     31c:      	b	0x238 <_stogir.graph.operand+0x84>
     320:      	movz	x5, #0x0, lsl #48
     324:      	b	0x2a0 <_stogir.graph.operand+0xec>
     328:      	movz	x5, #0x0, lsl #48
     32c:      	b	0x298 <_stogir.graph.operand+0xe4>
     330:      	movz	x5, #0x0, lsl #48
     334:      	b	0x324 <_stogir.graph.operand+0x170>

0000000000000338 <_stogir.graph.contains?>:
     338:      	sxtw	x1, w1
     33c:      	cmp	x1, #0x0
     340:      	b.le	0x384 <_stogir.graph.contains?+0x4c>
     344:      	ldr	x2, [x0, #0x8]
     348:      	cmp	x1, x2
     34c:      	b.ge	0x3e4 <_stogir.graph.contains?+0xac>
     350:      	add	x2, x0, #0x78
     354:      	ldr	x2, [x2, #0x8]
     358:      	cmp	x1, x2
     35c:      	b.ge	0x3f4 <_stogir.graph.contains?+0xbc>
     360:      	lsl	x1, x1, #2
     364:      	ldr	x0, [x0, #0x78]
     368:      	add	x0, x1, x0
     36c:      	ldr	w0, [x0]
     370:      	sxtw	x0, w0
     374:      	cmp	x0, #0x0
     378:      	cset	w0, ge
     37c:      	ubfx	x0, x0, #0, #8
     380:      	b	0x3f8 <_stogir.graph.contains?+0xc0>
     384:      	cmp	x1, #0x0
     388:      	b.ge	0x3ec <_stogir.graph.contains?+0xb4>
     38c:      	add	x2, x0, #0x28
     390:      	add	x3, x0, #0x50
     394:      	ldr	x2, [x2, #0x8]
     398:      	ldr	x3, [x3, #0x8]
     39c:      	cmp	x2, x3
     3a0:      	b.ne	0x404 <_stogir.graph.contains?+0xcc>
     3a4:      	movz	x16, #0x0, lsl #48
     3a8:      	sub	x3, x16, x1
     3ac:      	cmp	x3, x2
     3b0:      	b.gt	0x3fc <_stogir.graph.contains?+0xc4>
     3b4:      	movz	x16, #0x0, lsl #48
     3b8:      	sub	x1, x16, x1
     3bc:      	sub	x1, x1, #0x1
     3c0:      	lsl	x1, x1, #2
     3c4:      	ldr	x0, [x0, #0x50]
     3c8:      	add	x0, x1, x0
     3cc:      	ldr	w0, [x0]
     3d0:      	sxtw	x0, w0
     3d4:      	cmp	x0, #0x0
     3d8:      	cset	w0, gt
     3dc:      	ubfx	x0, x0, #0, #8
     3e0:      	b	0x400 <_stogir.graph.contains?+0xc8>
     3e4:      	movz	x0, #0x0, lsl #48
     3e8:      	b	0x3f8 <_stogir.graph.contains?+0xc0>
     3ec:      	movz	x0, #0x0, lsl #48
     3f0:      	b	0x400 <_stogir.graph.contains?+0xc8>
     3f4:      	movz	x0, #0x0, lsl #48
     3f8:      	b	0x400 <_stogir.graph.contains?+0xc8>
     3fc:      	movz	x0, #0x0, lsl #48
     400:      	ret
     404:      	movz	x0, #0x0, lsl #48
     408:      	b	0x400 <_stogir.graph.contains?+0xc8>

000000000000040c <_inherent$coil.arraylist.ArrayList$at__stogir.node.Node>:
     40c:      	lsl	x1, x1, #4
     410:      	ldr	x0, [x0]
     414:      	add	x0, x1, x0
     418:      	ret

000000000000041c <_coil.core.Len$coil.arraylist.ArrayList$len__stogir.node.Node>:
     41c:      	ldr	x0, [x0, #0x8]
     420:      	ret

0000000000000424 <_coil.core.Len$coil.arraylist.ArrayList$len__i32>:
     424:      	ldr	x0, [x0, #0x8]
     428:      	ret

000000000000042c <_inherent$coil.arraylist.ArrayList$slice__stogir.node.Node>:
     42c:      	sub	sp, sp, #0x10
     430:      	mov	x1, sp
     434:      	ldr	x2, [x0]
     438:      	ldr	x0, [x0, #0x8]
     43c:      	str	x2, [x1]
     440:      	str	x0, [x1, #0x8]
     444:      	ldr	x0, [sp]
     448:      	ldr	x1, [sp, #0x8]
     44c:      	add	sp, sp, #0x10
     450:      	ret

0000000000000454 <_inherent$slice$at__stogir.node.Node>:
     454:      	lsl	x1, x2, #4
     458:      	add	x0, x1, x0
     45c:      	ret

0000000000000460 <_inherent$slice$new__stogir.node.Node>:
     460:      	sub	sp, sp, #0x10
     464:      	mov	x2, sp
     468:      	str	x0, [x2]
     46c:      	str	x1, [x2, #0x8]
     470:      	ldr	x0, [sp]
     474:      	ldr	x1, [sp, #0x8]
     478:      	add	sp, sp, #0x10
     47c:      	ret

0000000000000480 <_inherent$slice$data__stogir.node.Node>:
     480:      	ret

0000000000000484 <_coil.slice.element-ref__stogir.node.Node>:
     484:      	ret
