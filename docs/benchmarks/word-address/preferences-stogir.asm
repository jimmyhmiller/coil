
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-word-address/build/word-address-avec/preferences-stogir.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_avec_get>:
       0:      	sub	sp, sp, #0x10
       4:      	str	x29, [sp]
       8:      	str	x30, [sp, #0x8]
       c:      	mov	x29, sp
      10:      	movz	x17, #0x0, lsl #48
      14:      	cmp	x1, x17
      18:      	b.lt	0x48 <_gap_avec_get+0x48>
      1c:      	add	x2, x0, #0x10
      20:      	ldr	x2, [x2]
      24:      	cmp	x1, x2
      28:      	b.ge	0x48 <_gap_avec_get+0x48>
      2c:      	add	x2, x0, #0x10
      30:      	ldr	x2, [x2]
      34:      	mov	x17, #0x20              ; =32
      38:      	cmp	x2, x17
      3c:      	b.ge	0x64 <_gap_avec_get+0x64>
      40:      	movz	x2, #0x0, lsl #48
      44:      	b	0x78 <_gap_avec_get+0x78>
      48:      	add	x0, x0, #0x10
      4c:      	ldr	x0, [x0]
      50:      	fmov	d31, x0
      54:      	mov	x0, x1
      58:      	fmov	x1, d31
      5c:      	bl	0x5c <_gap_avec_get+0x5c>
      60:      	b	0x60 <_gap_avec_get+0x60>
      64:      	add	x2, x0, #0x10
      68:      	ldr	x2, [x2]
      6c:      	sub	x2, x2, #0x1
      70:      	asr	x2, x2, #5
      74:      	lsl	x2, x2, #5
      78:      	cmp	x1, x2
      7c:      	b.lt	0x8c <_gap_avec_get+0x8c>
      80:      	add	x0, x0, #0x8
      84:      	ldr	x0, [x0]
      88:      	b	0xd0 <_gap_avec_get+0xd0>
      8c:      	orr	x2, x0, xzr
      90:      	add	x0, x0, #0x18
      94:      	ldr	x2, [x2]
      98:      	ldr	x0, [x0]
      9c:      	b	0xc0 <_gap_avec_get+0xc0>
      a0:      	add	x2, x2, #0x20
      a4:      	asr	x3, x1, x0
      a8:      	sub	x0, x0, #0x5
      ac:      	and	x3, x3, #0x1f
      b0:      	ldr	x2, [x2]
      b4:      	lsl	x3, x3, #3
      b8:      	add	x2, x3, x2
      bc:      	ldr	x2, [x2]
      c0:      	movz	x17, #0x0, lsl #48
      c4:      	cmp	x0, x17
      c8:      	b.gt	0xa0 <_gap_avec_get+0xa0>
      cc:      	mov	x0, x2
      d0:      	and	x1, x1, #0x1f
      d4:      	lsl	x1, x1, #4
      d8:      	add	x0, x0, #0x18
      dc:      	ldr	x0, [x0]
      e0:      	add	x0, x1, x0
      e4:      	ldr	x1, [x0]
      e8:      	asr	x1, x1, #32
      ec:      	ldr	x0, [x0, #0x8]
      f0:      	lsr	w2, w0, #0
      f4:      	asr	x0, x0, #32
      f8:      	sxtw	x2, w2
      fc:      	add	x1, x2, x1
     100:      	add	x0, x0, x1
     104:      	ldr	x29, [sp]
     108:      	ldr	x30, [sp, #0x8]
     10c:      	add	sp, sp, #0x10
     110:      	ret
     114:      	udf	#0x0

0000000000000118 <_coil.avec.avec-at__gaps.avec-get.Node>:
     118:      	sub	sp, sp, #0x10
     11c:      	str	x29, [sp]
     120:      	str	x30, [sp, #0x8]
     124:      	mov	x29, sp
     128:      	movz	x17, #0x0, lsl #48
     12c:      	cmp	x1, x17
     130:      	b.lt	0x160 <_coil.avec.avec-at__gaps.avec-get.Node+0x48>
     134:      	add	x2, x0, #0x10
     138:      	ldr	x2, [x2]
     13c:      	cmp	x1, x2
     140:      	b.ge	0x160 <_coil.avec.avec-at__gaps.avec-get.Node+0x48>
     144:      	add	x2, x0, #0x10
     148:      	ldr	x2, [x2]
     14c:      	mov	x17, #0x20              ; =32
     150:      	cmp	x2, x17
     154:      	b.ge	0x17c <_coil.avec.avec-at__gaps.avec-get.Node+0x64>
     158:      	movz	x2, #0x0, lsl #48
     15c:      	b	0x190 <_coil.avec.avec-at__gaps.avec-get.Node+0x78>
     160:      	add	x0, x0, #0x10
     164:      	ldr	x0, [x0]
     168:      	fmov	d31, x0
     16c:      	mov	x0, x1
     170:      	fmov	x1, d31
     174:      	bl	0x174 <_coil.avec.avec-at__gaps.avec-get.Node+0x5c>
     178:      	b	0x178 <_coil.avec.avec-at__gaps.avec-get.Node+0x60>
     17c:      	add	x2, x0, #0x10
     180:      	ldr	x2, [x2]
     184:      	sub	x2, x2, #0x1
     188:      	asr	x2, x2, #5
     18c:      	lsl	x2, x2, #5
     190:      	cmp	x1, x2
     194:      	b.lt	0x1a4 <_coil.avec.avec-at__gaps.avec-get.Node+0x8c>
     198:      	add	x0, x0, #0x8
     19c:      	ldr	x0, [x0]
     1a0:      	b	0x1e8 <_coil.avec.avec-at__gaps.avec-get.Node+0xd0>
     1a4:      	orr	x2, x0, xzr
     1a8:      	add	x0, x0, #0x18
     1ac:      	ldr	x2, [x2]
     1b0:      	ldr	x0, [x0]
     1b4:      	b	0x1d8 <_coil.avec.avec-at__gaps.avec-get.Node+0xc0>
     1b8:      	add	x2, x2, #0x20
     1bc:      	asr	x3, x1, x0
     1c0:      	sub	x0, x0, #0x5
     1c4:      	and	x3, x3, #0x1f
     1c8:      	ldr	x2, [x2]
     1cc:      	lsl	x3, x3, #3
     1d0:      	add	x2, x3, x2
     1d4:      	ldr	x2, [x2]
     1d8:      	movz	x17, #0x0, lsl #48
     1dc:      	cmp	x0, x17
     1e0:      	b.gt	0x1b8 <_coil.avec.avec-at__gaps.avec-get.Node+0xa0>
     1e4:      	mov	x0, x2
     1e8:      	and	x1, x1, #0x1f
     1ec:      	lsl	x1, x1, #4
     1f0:      	add	x0, x0, #0x18
     1f4:      	ldr	x0, [x0]
     1f8:      	add	x0, x1, x0
     1fc:      	ldr	x29, [sp]
     200:      	ldr	x30, [sp, #0x8]
     204:      	add	sp, sp, #0x10
     208:      	ret

000000000000020c <_coil.avec.avec--check__gaps.avec-get.Node>:
     20c:      	sub	sp, sp, #0x10
     210:      	str	x29, [sp]
     214:      	str	x30, [sp, #0x8]
     218:      	mov	x29, sp
     21c:      	movz	x17, #0x0, lsl #48
     220:      	cmp	x1, x17
     224:      	b.lt	0x24c <_coil.avec.avec--check__gaps.avec-get.Node+0x40>
     228:      	add	x2, x0, #0x10
     22c:      	ldr	x2, [x2]
     230:      	cmp	x1, x2
     234:      	b.ge	0x24c <_coil.avec.avec--check__gaps.avec-get.Node+0x40>
     238:      	movz	x0, #0x0, lsl #48
     23c:      	ldr	x29, [sp]
     240:      	ldr	x30, [sp, #0x8]
     244:      	add	sp, sp, #0x10
     248:      	ret
     24c:      	add	x0, x0, #0x10
     250:      	ldr	x0, [x0]
     254:      	fmov	d31, x0
     258:      	mov	x0, x1
     25c:      	fmov	x1, d31
     260:      	bl	0x260 <_coil.avec.avec--check__gaps.avec-get.Node+0x54>
     264:      	b	0x264 <_coil.avec.avec--check__gaps.avec-get.Node+0x58>

0000000000000268 <_coil.avec.avec--leaf-for__gaps.avec-get.Node>:
     268:      	add	x2, x0, #0x10
     26c:      	ldr	x2, [x2]
     270:      	mov	x17, #0x20              ; =32
     274:      	cmp	x2, x17
     278:      	b.ge	0x284 <_coil.avec.avec--leaf-for__gaps.avec-get.Node+0x1c>
     27c:      	movz	x2, #0x0, lsl #48
     280:      	b	0x298 <_coil.avec.avec--leaf-for__gaps.avec-get.Node+0x30>
     284:      	add	x2, x0, #0x10
     288:      	ldr	x2, [x2]
     28c:      	sub	x2, x2, #0x1
     290:      	asr	x2, x2, #5
     294:      	lsl	x2, x2, #5
     298:      	cmp	x1, x2
     29c:      	b.lt	0x2ac <_coil.avec.avec--leaf-for__gaps.avec-get.Node+0x44>
     2a0:      	add	x0, x0, #0x8
     2a4:      	ldr	x0, [x0]
     2a8:      	b	0x2f0 <_coil.avec.avec--leaf-for__gaps.avec-get.Node+0x88>
     2ac:      	orr	x2, x0, xzr
     2b0:      	add	x0, x0, #0x18
     2b4:      	ldr	x2, [x2]
     2b8:      	ldr	x0, [x0]
     2bc:      	b	0x2e0 <_coil.avec.avec--leaf-for__gaps.avec-get.Node+0x78>
     2c0:      	add	x2, x2, #0x20
     2c4:      	asr	x3, x1, x0
     2c8:      	sub	x0, x0, #0x5
     2cc:      	and	x3, x3, #0x1f
     2d0:      	ldr	x2, [x2]
     2d4:      	lsl	x3, x3, #3
     2d8:      	add	x2, x3, x2
     2dc:      	ldr	x2, [x2]
     2e0:      	movz	x17, #0x0, lsl #48
     2e4:      	cmp	x0, x17
     2e8:      	b.gt	0x2c0 <_coil.avec.avec--leaf-for__gaps.avec-get.Node+0x58>
     2ec:      	mov	x0, x2
     2f0:      	ret
     2f4:      	udf	#0x0

00000000000002f8 <_coil.avec.avec--bounds-error>:
     2f8:      	sub	sp, sp, #0x70
     2fc:      	str	x29, [sp]
     300:      	str	x30, [sp, #0x8]
     304:      	mov	x29, sp
     308:      	str	x19, [sp, #0x20]
     30c:      	str	x20, [sp, #0x28]
     310:      	str	x21, [sp, #0x30]
     314:      	str	x22, [sp, #0x38]
     318:      	str	x23, [sp, #0x40]
     31c:      	str	x24, [sp, #0x48]
     320:      	str	x25, [sp, #0x50]
     324:      	str	x26, [sp, #0x58]
     328:      	str	x27, [sp, #0x60]
     32c:      	str	x28, [sp, #0x68]
     330:      	sub	sp, sp, #0x50
     334:      	mov	x19, sp
     338:      	sub	sp, sp, #0x50
     33c:      	mov	x20, sp
     340:      	sub	sp, sp, #0x20
     344:      	mov	x21, sp
     348:      	sub	sp, sp, #0x20
     34c:      	mov	x22, sp
     350:      	mov	x23, x0
     354:      	mov	x24, x1
     358:      	bl	0x358 <_coil.avec.avec--bounds-error+0x60>
     35c:      	movz	x0, #0x0, lsl #48
     360:      	b	0x37c <_coil.avec.avec--bounds-error+0x84>
     364:      	nop
     368:      	add	x1, x0, #0x8
     36c:      	add	x0, x20, x0
     370:      	movz	x17, #0x0, lsl #48
     374:      	str	x17, [x0]
     378:      	mov	x0, x1
     37c:      	mov	x17, #0x48              ; =72
     380:      	cmp	x0, x17
     384:      	b.lo	0x368 <_coil.avec.avec--bounds-error+0x70>
     388:      	movz	x0, #0x0, lsl #48
     38c:      	b	0x3a8 <_coil.avec.avec--bounds-error+0xb0>
     390:      	add	x1, x0, #0x8
     394:      	add	x2, x19, x0
     398:      	add	x0, x20, x0
     39c:      	ldr	x0, [x0]
     3a0:      	str	x0, [x2]
     3a4:      	mov	x0, x1
     3a8:      	mov	x17, #0x48              ; =72
     3ac:      	cmp	x0, x17
     3b0:      	b.lo	0x390 <_coil.avec.avec--bounds-error+0x98>
     3b4:      	orr	x20, x19, xzr
     3b8:      	adrp	x16, 0x0 <_gap_avec_get>
     3bc:      	ldr	x16, [x16]
     3c0:      	orr	x25, x16, xzr
     3c4:      	adrp	x16, 0x0 <_gap_avec_get>
     3c8:      	ldr	x16, [x16]
     3cc:      	orr	x26, x16, xzr
     3d0:      	adrp	x16, 0x0 <_gap_avec_get>
     3d4:      	ldr	x16, [x16]
     3d8:      	orr	x27, x16, xzr
     3dc:      	adrp	x16, 0x0 <_gap_avec_get>
     3e0:      	ldr	x16, [x16]
     3e4:      	orr	x0, x16, xzr
     3e8:      	adrp	x16, 0x0 <_gap_avec_get>
     3ec:      	ldr	x16, [x16]
     3f0:      	orr	x28, x16, xzr
     3f4:      	adrp	x16, 0x0 <_gap_avec_get>
     3f8:      	ldr	x16, [x16]
     3fc:      	orr	x1, x16, xzr
     400:      	add	x2, x20, #0x8
     404:      	add	x3, x20, #0x10
     408:      	add	x4, x20, #0x8
     40c:      	add	x5, x20, #0x8
     410:      	str	x0, [x19]
     414:      	orr	x19, x4, xzr
     418:      	orr	x0, x5, xzr
     41c:      	movz	w17, #0x0, lsl #16
     420:      	strb	w17, [x2]
     424:      	movz	x17, #0x0, lsl #48
     428:      	str	x17, [x3]
     42c:      	str	x1, [x29, #0x10]
     430:      	str	x20, [x29, #0x18]
     434:      	fmov	d31, x0
     438:      	mov	x0, x20
     43c:      	fmov	x20, d31
     440:      	bl	0x440 <_coil.avec.avec--bounds-error+0x148>
     444:      	mov	x8, x21
     448:      	mov	x0, x28
     44c:      	mov	x1, x25
     450:      	mov	x2, #0xc                ; =12
     454:      	bl	0x454 <_coil.avec.avec--bounds-error+0x15c>
     458:      	movz	w17, #0x0, lsl #16
     45c:      	strb	w17, [x19]
     460:      	mov	x0, x23
     464:      	ldr	x1, [x29, #0x18]
     468:      	bl	0x468 <_coil.avec.avec--bounds-error+0x170>
     46c:      	mov	x8, x22
     470:      	ldr	x0, [x29, #0x10]
     474:      	mov	x1, x26
     478:      	mov	x2, #0x10               ; =16
     47c:      	bl	0x47c <_coil.avec.avec--bounds-error+0x184>
     480:      	movz	w17, #0x0, lsl #16
     484:      	strb	w17, [x20]
     488:      	mov	x0, x24
     48c:      	ldr	x1, [x29, #0x18]
     490:      	bl	0x490 <_coil.avec.avec--bounds-error+0x198>
     494:      	mov	x0, x27
     498:      	mov	x1, #0x19               ; =25
     49c:      	bl	0x49c <_coil.avec.avec--bounds-error+0x1a4>
     4a0:      	b	0x4a0 <_coil.avec.avec--bounds-error+0x1a8>

00000000000004a4 <_coil.avec.avec--tail-offset__gaps.avec-get.Node>:
     4a4:      	add	x1, x0, #0x10
     4a8:      	ldr	x1, [x1]
     4ac:      	mov	x17, #0x20              ; =32
     4b0:      	cmp	x1, x17
     4b4:      	b.ge	0x4c0 <_coil.avec.avec--tail-offset__gaps.avec-get.Node+0x1c>
     4b8:      	movz	x0, #0x0, lsl #48
     4bc:      	b	0x4d4 <_coil.avec.avec--tail-offset__gaps.avec-get.Node+0x30>
     4c0:      	add	x0, x0, #0x10
     4c4:      	ldr	x0, [x0]
     4c8:      	sub	x0, x0, #0x1
     4cc:      	asr	x0, x0, #5
     4d0:      	lsl	x0, x0, #5
     4d4:      	ret

00000000000004d8 <_coil.panic.begin!>:
     4d8:      	sub	sp, sp, #0x10
     4dc:      	str	x29, [sp]
     4e0:      	str	x30, [sp, #0x8]
     4e4:      	mov	x29, sp
     4e8:      	adrp	x16, 0x0 <_gap_avec_get>
     4ec:      	ldr	x16, [x16]
     4f0:      	ldr	x0, [x16]
     4f4:      	movz	x17, #0x0, lsl #48
     4f8:      	cmp	x0, x17
     4fc:      	b.ne	0x540 <_coil.panic.begin!+0x68>
     500:      	adrp	x16, 0x0 <_gap_avec_get>
     504:      	ldr	x16, [x16]
     508:      	orr	x0, x16, xzr
     50c:      	adrp	x16, 0x0 <_gap_avec_get>
     510:      	ldr	x16, [x16]
     514:      	mov	x17, #0x1               ; =1
     518:      	str	x17, [x16]
     51c:      	mov	x1, x0
     520:      	mov	x0, #0x2                ; =2
     524:      	mov	x2, #0x7                ; =7
     528:      	bl	0x528 <_coil.panic.begin!+0x50>
     52c:      	movz	x0, #0x0, lsl #48
     530:      	ldr	x29, [sp]
     534:      	ldr	x30, [sp, #0x8]
     538:      	add	sp, sp, #0x10
     53c:      	ret
     540:      	adrp	x16, 0x0 <_gap_avec_get>
     544:      	ldr	x16, [x16]
     548:      	orr	x0, x16, xzr
     54c:      	mov	x1, x0
     550:      	mov	x0, #0x2                ; =2
     554:      	mov	x2, #0x29               ; =41
     558:      	bl	0x558 <_coil.panic.begin!+0x80>
     55c:      	bl	0x55c <_coil.panic.begin!+0x84>
     560:      	b	0x560 <_coil.panic.begin!+0x88>

0000000000000564 <_coil.io.stderr>:
     564:      	adrp	x16, 0x0 <_gap_avec_get>
     568:      	ldr	x16, [x16]
     56c:      	orr	x0, x16, xzr
     570:      	ret

0000000000000574 <_inherent$coil.fmt.Formatter$init>:
     574:      	sub	sp, sp, #0x20
     578:      	str	x29, [sp]
     57c:      	str	x30, [sp, #0x8]
     580:      	mov	x29, sp
     584:      	str	x19, [sp, #0x10]
     588:      	add	x2, x0, #0x8
     58c:      	add	x3, x0, #0x10
     590:      	str	x1, [x0]
     594:      	movz	w17, #0x0, lsl #16
     598:      	strb	w17, [x2]
     59c:      	movz	x17, #0x0, lsl #48
     5a0:      	str	x17, [x3]
     5a4:      	mov	x19, x0
     5a8:      	bl	0x5a8 <_inherent$coil.fmt.Formatter$init+0x34>
     5ac:      	mov	x0, x19
     5b0:      	ldr	x19, [sp, #0x10]
     5b4:      	ldr	x29, [sp]
     5b8:      	ldr	x30, [sp, #0x8]
     5bc:      	add	sp, sp, #0x20
     5c0:      	ret

00000000000005c4 <_coil.io.print-str>:
     5c4:      	sub	sp, sp, #0x20
     5c8:      	str	x29, [sp]
     5cc:      	str	x30, [sp, #0x8]
     5d0:      	mov	x29, sp
     5d4:      	str	x19, [sp, #0x10]
     5d8:      	str	x20, [sp, #0x18]
     5dc:      	sub	sp, sp, #0x20
     5e0:      	mov	x19, sp
     5e4:      	mov	x20, x8
     5e8:      	mov	x8, x19
     5ec:      	bl	0x5ec <_coil.io.print-str+0x28>
     5f0:      	ldr	x0, [x19]
     5f4:      	str	x0, [x20]
     5f8:      	ldr	x0, [x19, #0x8]
     5fc:      	str	x0, [x20, #0x8]
     600:      	ldr	x0, [x19, #0x10]
     604:      	str	x0, [x20, #0x10]
     608:      	sub	sp, x29, #0x0
     60c:      	ldr	x19, [sp, #0x10]
     610:      	ldr	x20, [sp, #0x18]
     614:      	ldr	x29, [sp]
     618:      	ldr	x30, [sp, #0x8]
     61c:      	add	sp, sp, #0x20
     620:      	ret

0000000000000624 <_inherent$coil.fmt.Formatter$set-alternate!>:
     624:      	add	x0, x0, #0x8
     628:      	strb	w1, [x0]
     62c:      	movz	x0, #0x0, lsl #48
     630:      	ret

0000000000000634 <_coil.fmt.Display$i64$display-fmt>:
     634:      	sub	sp, sp, #0x10
     638:      	str	x29, [sp]
     63c:      	str	x30, [sp, #0x8]
     640:      	mov	x29, sp
     644:      	sub	sp, sp, #0x20
     648:      	mov	x2, sp
     64c:      	sub	sp, sp, #0x20
     650:      	mov	x3, sp
     654:      	movz	w17, #0x0, lsl #16
     658:      	str	w17, [x2]
     65c:      	movz	x17, #0x0, lsl #48
     660:      	cmp	x0, x17
     664:      	b.ge	0x674 <_coil.fmt.Display$i64$display-fmt+0x40>
     668:      	movz	x16, #0x0, lsl #48
     66c:      	sub	x4, x16, x0
     670:      	b	0x678 <_coil.fmt.Display$i64$display-fmt+0x44>
     674:      	mov	x4, x0
     678:      	adrp	x16, 0x0 <_gap_avec_get>
     67c:      	ldr	x16, [x16]
     680:      	orr	x5, x16, xzr
     684:      	orr	x6, x3, xzr
     688:      	movz	x17, #0x0, lsl #48
     68c:      	cmp	x0, x17
     690:      	cset	w0, lt
     694:      	add	x7, x2, #0x8
     698:      	uxtb	w0, w0
     69c:      	str	x4, [x7]
     6a0:      	ldr	x4, [x2]
     6a4:      	str	x4, [x3]
     6a8:      	ldr	x4, [x2, #0x8]
     6ac:      	str	x4, [x3, #0x8]
     6b0:      	ldr	x2, [x2, #0x10]
     6b4:      	str	x2, [x3, #0x10]
     6b8:      	mov	x2, x5
     6bc:      	mov	x4, x6
     6c0:      	fmov	s31, w0
     6c4:      	mov	x0, x1
     6c8:      	fmov	w1, s31
     6cc:      	movz	x3, #0x0, lsl #48
     6d0:      	uxtb	w1, w1
     6d4:      	bl	0x6d4 <_coil.fmt.Display$i64$display-fmt+0xa0>
     6d8:      	sub	sp, x29, #0x0
     6dc:      	ldr	x29, [sp]
     6e0:      	ldr	x30, [sp, #0x8]
     6e4:      	add	sp, sp, #0x10
     6e8:      	ret

00000000000006ec <_coil.panic.finish!>:
     6ec:      	sub	sp, sp, #0x10
     6f0:      	str	x29, [sp]
     6f4:      	str	x30, [sp, #0x8]
     6f8:      	mov	x29, sp
     6fc:      	bl	0x6fc <_coil.panic.finish!+0x10>
     700:      	b	0x700 <_coil.panic.finish!+0x14>

0000000000000704 <_coil.panic.panicking>:
     704:      	adrp	x16, 0x0 <_gap_avec_get>
     708:      	ldr	x16, [x16]
     70c:      	orr	x0, x16, xzr
     710:      	ret

0000000000000714 <_coil.panic.put!>:
     714:      	sub	sp, sp, #0x10
     718:      	str	x29, [sp]
     71c:      	str	x30, [sp, #0x8]
     720:      	mov	x29, sp
     724:      	mov	x2, x1
     728:      	mov	x1, x0
     72c:      	mov	x0, #0x2                ; =2
     730:      	bl	0x730 <_coil.panic.put!+0x1c>
     734:      	movz	x0, #0x0, lsl #48
     738:      	ldr	x29, [sp]
     73c:      	ldr	x30, [sp, #0x8]
     740:      	add	sp, sp, #0x10
     744:      	ret

0000000000000748 <_coil.io.write-fd>:
     748:      	sub	sp, sp, #0x60
     74c:      	str	x29, [sp]
     750:      	str	x30, [sp, #0x8]
     754:      	mov	x29, sp
     758:      	str	x19, [sp, #0x10]
     75c:      	str	x20, [sp, #0x18]
     760:      	str	x21, [sp, #0x20]
     764:      	str	x22, [sp, #0x28]
     768:      	str	x23, [sp, #0x30]
     76c:      	str	x24, [sp, #0x38]
     770:      	str	x25, [sp, #0x40]
     774:      	str	x26, [sp, #0x48]
     778:      	str	x27, [sp, #0x50]
     77c:      	adrp	x16, 0x0 <_gap_avec_get>
     780:      	ldr	x16, [x16]
     784:      	orr	x19, x16, xzr
     788:      	sub	sp, sp, #0x20
     78c:      	mov	x20, sp
     790:      	lsr	w0, w0, #0
     794:      	sub	sp, sp, #0x20
     798:      	mov	x21, sp
     79c:      	lsr	w22, w0, #0
     7a0:      	sub	sp, sp, #0x10
     7a4:      	mov	x23, sp
     7a8:      	b	0x7bc <_coil.io.write-fd+0x74>
     7ac:      	nop
     7b0:      	mov	x8, x24
     7b4:      	mov	x1, x25
     7b8:      	mov	x2, x26
     7bc:      	mov	w0, w22
     7c0:      	mov	x24, x8
     7c4:      	mov	x25, x1
     7c8:      	mov	x26, x2
     7cc:      	bl	0x7cc <_coil.io.write-fd+0x84>
     7d0:      	movz	x17, #0x0, lsl #48
     7d4:      	cmp	x0, x17
     7d8:      	b.ge	0x85c <_coil.io.write-fd+0x114>
     7dc:      	mov	x0, x19
     7e0:      	mov	x1, #-0x2               ; =-2
     7e4:      	bl	0x7e4 <_coil.io.write-fd+0x9c>
     7e8:      	ldr	w0, [x0]
     7ec:      	sxtw	x27, w0
     7f0:      	mov	x17, #0x4               ; =4
     7f4:      	cmp	x27, x17
     7f8:      	b.eq	0x7b0 <_coil.io.write-fd+0x68>
     7fc:      	mov	x17, #0x23              ; =35
     800:      	cmp	x27, x17
     804:      	b.ne	0x828 <_coil.io.write-fd+0xe0>
     808:      	mov	w0, w22
     80c:      	mov	x1, #0x4                ; =4
     810:      	mov	x2, #-0x2               ; =-2
     814:      	uxth	w1, w1
     818:      	bl	0x818 <_coil.io.write-fd+0xd0>
     81c:      	movz	x17, #0x0, lsl #48
     820:      	cmp	x0, x17
     824:      	b.ne	0x7b0 <_coil.io.write-fd+0x68>
     828:      	orr	x0, x21, xzr
     82c:      	mov	w17, #0x1               ; =1
     830:      	str	w17, [x21]
     834:      	add	x1, x0, #0x8
     838:      	add	x2, x23, #0x8
     83c:      	mov	w17, #0x1               ; =1
     840:      	str	w17, [x23]
     844:      	str	x27, [x2]
     848:      	ldr	x2, [x23]
     84c:      	str	x2, [x1]
     850:      	ldr	x2, [x23, #0x8]
     854:      	str	x2, [x1, #0x8]
     858:      	b	0x874 <_coil.io.write-fd+0x12c>
     85c:      	orr	x1, x20, xzr
     860:      	movz	w17, #0x0, lsl #16
     864:      	str	w17, [x20]
     868:      	add	x2, x1, #0x8
     86c:      	str	x0, [x2]
     870:      	mov	x0, x1
     874:      	ldr	x1, [x0]
     878:      	str	x1, [x24]
     87c:      	ldr	x1, [x0, #0x8]
     880:      	str	x1, [x24, #0x8]
     884:      	ldr	x0, [x0, #0x10]
     888:      	str	x0, [x24, #0x10]
     88c:      	sub	sp, x29, #0x0
     890:      	ldr	x19, [sp, #0x10]
     894:      	ldr	x20, [sp, #0x18]
     898:      	ldr	x21, [sp, #0x20]
     89c:      	ldr	x22, [sp, #0x28]
     8a0:      	ldr	x23, [sp, #0x30]
     8a4:      	ldr	x24, [sp, #0x38]
     8a8:      	ldr	x25, [sp, #0x40]
     8ac:      	ldr	x26, [sp, #0x48]
     8b0:      	ldr	x27, [sp, #0x50]
     8b4:      	ldr	x29, [sp]
     8b8:      	ldr	x30, [sp, #0x8]
     8bc:      	add	sp, sp, #0x60
     8c0:      	ret

00000000000008c4 <_inherent$coil.fmt.Formatter$clear-spec!>:
     8c4:      	sub	sp, sp, #0x30
     8c8:      	str	x29, [sp]
     8cc:      	str	x30, [sp, #0x8]
     8d0:      	mov	x29, sp
     8d4:      	str	x19, [sp, #0x10]
     8d8:      	str	x20, [sp, #0x18]
     8dc:      	str	x21, [sp, #0x20]
     8e0:      	sub	sp, sp, #0x30
     8e4:      	mov	x19, sp
     8e8:      	add	x20, x0, #0x18
     8ec:      	add	x21, x0, #0x40
     8f0:      	mov	x8, x19
     8f4:      	bl	0x8f4 <_inherent$coil.fmt.Formatter$clear-spec!+0x30>
     8f8:      	ldr	x0, [x19]
     8fc:      	str	x0, [x20]
     900:      	ldr	x0, [x19, #0x8]
     904:      	str	x0, [x20, #0x8]
     908:      	ldr	x0, [x19, #0x10]
     90c:      	str	x0, [x20, #0x10]
     910:      	ldr	x0, [x19, #0x18]
     914:      	str	x0, [x20, #0x18]
     918:      	ldr	x0, [x19, #0x20]
     91c:      	str	x0, [x20, #0x20]
     920:      	movz	w17, #0x0, lsl #16
     924:      	strb	w17, [x21]
     928:      	movz	x0, #0x0, lsl #48
     92c:      	sub	sp, x29, #0x0
     930:      	ldr	x19, [sp, #0x10]
     934:      	ldr	x20, [sp, #0x18]
     938:      	ldr	x21, [sp, #0x20]
     93c:      	ldr	x29, [sp]
     940:      	ldr	x30, [sp, #0x8]
     944:      	add	sp, sp, #0x30
     948:      	ret

000000000000094c <_inherent$slice$data__u8>:
     94c:      	ret

0000000000000950 <_coil.core.Len$slice$len__u8>:
     950:      	mov	x0, x1
     954:      	ret

0000000000000958 <_coil.io.write-all>:
     958:      	sub	sp, sp, #0x70
     95c:      	str	x29, [sp]
     960:      	str	x30, [sp, #0x8]
     964:      	mov	x29, sp
     968:      	str	x19, [sp, #0x20]
     96c:      	str	x20, [sp, #0x28]
     970:      	str	x21, [sp, #0x30]
     974:      	str	x22, [sp, #0x38]
     978:      	str	x23, [sp, #0x40]
     97c:      	str	x24, [sp, #0x48]
     980:      	str	x25, [sp, #0x50]
     984:      	str	x26, [sp, #0x58]
     988:      	str	x27, [sp, #0x60]
     98c:      	str	x28, [sp, #0x68]
     990:      	sub	sp, sp, #0x20
     994:      	mov	x3, sp
     998:      	sub	sp, sp, #0x20
     99c:      	mov	x19, sp
     9a0:      	sub	sp, sp, #0x20
     9a4:      	mov	x20, sp
     9a8:      	sub	sp, sp, #0x20
     9ac:      	mov	x21, sp
     9b0:      	sub	sp, sp, #0x10
     9b4:      	mov	x22, sp
     9b8:      	sub	sp, sp, #0x20
     9bc:      	mov	x23, sp
     9c0:      	sub	sp, sp, #0x20
     9c4:      	mov	x24, sp
     9c8:      	sub	sp, sp, #0x20
     9cc:      	mov	x25, sp
     9d0:      	movz	x17, #0x0, lsl #48
     9d4:      	cmp	x2, x17
     9d8:      	b.gt	0xa50 <_coil.io.write-all+0xf8>
     9dc:      	orr	x0, x3, xzr
     9e0:      	movz	w17, #0x0, lsl #16
     9e4:      	str	w17, [x3]
     9e8:      	add	x1, x0, #0x8
     9ec:      	movz	x17, #0x0, lsl #48
     9f0:      	str	x17, [x1]
     9f4:      	str	x8, [x29, #0x18]
     9f8:      	ldr	x1, [x0]
     9fc:      	ldr	x2, [x29, #0x18]
     a00:      	str	x1, [x2]
     a04:      	ldr	x1, [x0, #0x8]
     a08:      	str	x1, [x2, #0x8]
     a0c:      	ldr	x0, [x0, #0x10]
     a10:      	str	x0, [x2, #0x10]
     a14:      	sub	sp, x29, #0x0
     a18:      	ldr	x19, [sp, #0x20]
     a1c:      	ldr	x20, [sp, #0x28]
     a20:      	ldr	x21, [sp, #0x30]
     a24:      	ldr	x22, [sp, #0x38]
     a28:      	ldr	x23, [sp, #0x40]
     a2c:      	ldr	x24, [sp, #0x48]
     a30:      	ldr	x25, [sp, #0x50]
     a34:      	ldr	x26, [sp, #0x58]
     a38:      	ldr	x27, [sp, #0x60]
     a3c:      	ldr	x28, [sp, #0x68]
     a40:      	ldr	x29, [sp]
     a44:      	ldr	x30, [sp, #0x8]
     a48:      	add	sp, sp, #0x70
     a4c:      	ret
     a50:      	orr	x26, x19, xzr
     a54:      	str	x8, [x29, #0x18]
     a58:      	mov	x8, x19
     a5c:      	str	x0, [x29, #0x10]
     a60:      	mov	x28, x1
     a64:      	mov	x27, x2
     a68:      	bl	0xa68 <_coil.io.write-all+0x110>
     a6c:      	ldr	w0, [x19]
     a70:      	lsr	x16, x0, #0
     a74:      	cmp	x16, #0x1
     a78:      	b.eq	0xa94 <_coil.io.write-all+0x13c>
     a7c:      	b.lo	0xa84 <_coil.io.write-all+0x12c>
     a80:      	b	0xa98 <_coil.io.write-all+0x140>
     a84:      	cmp	x16, #0x0
     a88:      	b.eq	0xa90 <_coil.io.write-all+0x138>
     a8c:      	b	0xa98 <_coil.io.write-all+0x140>
     a90:      	b	0xac4 <_coil.io.write-all+0x16c>
     a94:      	b	0xa9c <_coil.io.write-all+0x144>
     a98:      	b	0xba8 <_coil.io.write-all+0x250>
     a9c:      	orr	x0, x20, xzr
     aa0:      	add	x1, x26, #0x8
     aa4:      	add	x2, x0, #0x8
     aa8:      	ldr	x3, [x1]
     aac:      	ldr	x1, [x1, #0x8]
     ab0:      	mov	w17, #0x1               ; =1
     ab4:      	str	w17, [x20]
     ab8:      	str	x3, [x2]
     abc:      	str	x1, [x2, #0x8]
     ac0:      	b	0x9f8 <_coil.io.write-all+0xa0>
     ac4:      	add	x0, x26, #0x8
     ac8:      	ldr	x0, [x0]
     acc:      	orr	x19, x0, xzr
     ad0:      	movz	x17, #0x0, lsl #48
     ad4:      	cmp	x19, x17
     ad8:      	b.gt	0xb08 <_coil.io.write-all+0x1b0>
     adc:      	orr	x0, x21, xzr
     ae0:      	mov	w17, #0x1               ; =1
     ae4:      	str	w17, [x21]
     ae8:      	add	x1, x0, #0x8
     aec:      	mov	w17, #0x5               ; =5
     af0:      	str	w17, [x22]
     af4:      	ldr	x2, [x22]
     af8:      	str	x2, [x1]
     afc:      	ldr	x2, [x22, #0x8]
     b00:      	str	x2, [x1, #0x8]
     b04:      	b	0xac0 <_coil.io.write-all+0x168>
     b08:      	orr	x20, x23, xzr
     b0c:      	lsr	x0, x19, #0
     b10:      	sub	x1, x27, x19
     b14:      	add	x0, x0, x28
     b18:      	mov	x8, x23
     b1c:      	mov	x2, x1
     b20:      	mov	x1, x0
     b24:      	ldr	x0, [x29, #0x10]
     b28:      	bl	0xb28 <_coil.io.write-all+0x1d0>
     b2c:      	ldr	w0, [x23]
     b30:      	lsr	x16, x0, #0
     b34:      	cmp	x16, #0x1
     b38:      	b.eq	0xb54 <_coil.io.write-all+0x1fc>
     b3c:      	b.lo	0xb44 <_coil.io.write-all+0x1ec>
     b40:      	b	0xb58 <_coil.io.write-all+0x200>
     b44:      	cmp	x16, #0x0
     b48:      	b.eq	0xb50 <_coil.io.write-all+0x1f8>
     b4c:      	b	0xb58 <_coil.io.write-all+0x200>
     b50:      	b	0xb84 <_coil.io.write-all+0x22c>
     b54:      	b	0xb5c <_coil.io.write-all+0x204>
     b58:      	b	0xbb0 <_coil.io.write-all+0x258>
     b5c:      	orr	x0, x24, xzr
     b60:      	add	x1, x20, #0x8
     b64:      	add	x2, x0, #0x8
     b68:      	ldr	x3, [x1]
     b6c:      	ldr	x1, [x1, #0x8]
     b70:      	mov	w17, #0x1               ; =1
     b74:      	str	w17, [x24]
     b78:      	str	x3, [x2]
     b7c:      	str	x1, [x2, #0x8]
     b80:      	b	0xba4 <_coil.io.write-all+0x24c>
     b84:      	orr	x0, x25, xzr
     b88:      	add	x1, x20, #0x8
     b8c:      	add	x2, x0, #0x8
     b90:      	ldr	x1, [x1]
     b94:      	movz	w17, #0x0, lsl #16
     b98:      	str	w17, [x25]
     b9c:      	add	x1, x1, x19
     ba0:      	str	x1, [x2]
     ba4:      	b	0xb04 <_coil.io.write-all+0x1ac>
     ba8:      	brk	#0
     bac:      	b	0xba8 <_coil.io.write-all+0x250>
     bb0:      	brk	#0
     bb4:      	b	0xbb0 <_coil.io.write-all+0x258>

0000000000000bb8 <_coil.fmt.fmt--number__coil.fmt.IntDigits>:
     bb8:      	sub	sp, sp, #0xb0
     bbc:      	str	x29, [sp]
     bc0:      	str	x30, [sp, #0x8]
     bc4:      	mov	x29, sp
     bc8:      	str	x19, [sp, #0x60]
     bcc:      	str	x20, [sp, #0x68]
     bd0:      	str	x21, [sp, #0x70]
     bd4:      	str	x22, [sp, #0x78]
     bd8:      	str	x23, [sp, #0x80]
     bdc:      	str	x24, [sp, #0x88]
     be0:      	str	x25, [sp, #0x90]
     be4:      	str	x26, [sp, #0x98]
     be8:      	str	x27, [sp, #0xa0]
     bec:      	str	x28, [sp, #0xa8]
     bf0:      	sub	sp, sp, #0x30
     bf4:      	mov	x19, sp
     bf8:      	ubfx	x20, x1, #0, #8
     bfc:      	orr	x21, x19, xzr
     c00:      	sub	sp, sp, #0x30
     c04:      	mov	x22, sp
     c08:      	sub	sp, sp, #0x10
     c0c:      	mov	x23, sp
     c10:      	sub	sp, sp, #0x10
     c14:      	mov	x24, sp
     c18:      	sub	sp, sp, #0x10
     c1c:      	mov	x25, sp
     c20:      	sub	sp, sp, #0x10
     c24:      	mov	x26, sp
     c28:      	sub	sp, sp, #0x10
     c2c:      	mov	x27, sp
     c30:      	sub	sp, sp, #0x20
     c34:      	mov	x28, sp
     c38:      	sub	sp, sp, #0x20
     c3c:      	mov	x1, sp
     c40:      	sub	sp, sp, #0x20
     c44:      	mov	x5, sp
     c48:      	sub	sp, sp, #0x20
     c4c:      	mov	x6, sp
     c50:      	sub	sp, sp, #0x20
     c54:      	mov	x7, sp
     c58:      	sub	sp, sp, #0x20
     c5c:      	mov	x8, sp
     c60:      	sub	sp, sp, #0x20
     c64:      	mov	x9, sp
     c68:      	ldr	x10, [x0]
     c6c:      	str	x2, [x29, #0x10]
     c70:      	str	x3, [x29, #0x58]
     c74:      	str	x4, [x29, #0x20]
     c78:      	str	x1, [x29, #0x28]
     c7c:      	str	x5, [x29, #0x30]
     c80:      	str	x6, [x29, #0x38]
     c84:      	str	x7, [x29, #0x40]
     c88:      	str	x8, [x29, #0x48]
     c8c:      	mov	x8, x22
     c90:      	str	x9, [x29, #0x50]
     c94:      	str	x28, [x29, #0x18]
     c98:      	mov	x28, x10
     c9c:      	bl	0xc9c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0xe4>
     ca0:      	ldr	x0, [x22]
     ca4:      	str	x0, [x19]
     ca8:      	ldr	x0, [x22, #0x8]
     cac:      	str	x0, [x19, #0x8]
     cb0:      	ldr	x1, [x22, #0x10]
     cb4:      	str	x1, [x19, #0x10]
     cb8:      	ldr	x1, [x22, #0x18]
     cbc:      	str	x1, [x19, #0x18]
     cc0:      	ldr	x1, [x22, #0x20]
     cc4:      	str	x1, [x19, #0x20]
     cc8:      	movz	x17, #0x0, lsl #48
     ccc:      	cmp	x20, x17
     cd0:      	b.eq	0xedc <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x324>
     cd4:      	orr	x1, x23, xzr
     cd8:      	adrp	x16, 0x0 <_gap_avec_get>
     cdc:      	ldr	x16, [x16]
     ce0:      	orr	x2, x16, xzr
     ce4:      	add	x3, x1, #0x8
     ce8:      	str	x2, [x23]
     cec:      	mov	x17, #0x1               ; =1
     cf0:      	str	x17, [x3]
     cf4:      	mov	x20, x1
     cf8:      	b	0xd20 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x168>
     cfc:      	orr	x1, x25, xzr
     d00:      	adrp	x16, 0x0 <_gap_avec_get>
     d04:      	ldr	x16, [x16]
     d08:      	orr	x2, x16, xzr
     d0c:      	add	x3, x1, #0x8
     d10:      	str	x2, [x25]
     d14:      	movz	x17, #0x0, lsl #48
     d18:      	str	x17, [x3]
     d1c:      	mov	x20, x1
     d20:      	ldr	x1, [x19]
     d24:      	movz	x17, #0x0, lsl #48
     d28:      	cmp	x1, x17
     d2c:      	b.ge	0xf50 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x398>
     d30:      	orr	x1, x20, xzr
     d34:      	add	x2, x20, #0x8
     d38:      	ldr	x1, [x1]
     d3c:      	ldr	x2, [x2]
     d40:      	ldr	x8, [x29, #0x18]
     d44:      	mov	x22, x0
     d48:      	mov	x0, x28
     d4c:      	bl	0xd4c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x194>
     d50:      	ldr	x8, [x29, #0x28]
     d54:      	mov	x0, x28
     d58:      	ldr	x1, [x29, #0x10]
     d5c:      	ldr	x2, [x29, #0x58]
     d60:      	bl	0xd60 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1a8>
     d64:      	ldr	x0, [x29, #0x20]
     d68:      	mov	x1, x28
     d6c:      	mov	x2, x22
     d70:      	bl	0xd70 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1b8>
     d74:      	b	0xdf0 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x238>
     d78:      	orr	x19, x20, xzr
     d7c:      	add	x20, x20, #0x8
     d80:      	mov	x0, x28
     d84:      	mov	x1, x21
     d88:      	mov	x2, x24
     d8c:      	movz	x3, #0x0, lsl #48
     d90:      	uxtb	w3, w3
     d94:      	bl	0xd94 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1dc>
     d98:      	ldr	x0, [x19]
     d9c:      	ldr	x1, [x20]
     da0:      	ldr	x8, [x29, #0x48]
     da4:      	mov	x2, x1
     da8:      	mov	x1, x0
     dac:      	mov	x0, x28
     db0:      	bl	0xdb0 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1f8>
     db4:      	ldr	x8, [x29, #0x50]
     db8:      	mov	x0, x28
     dbc:      	ldr	x1, [x29, #0x10]
     dc0:      	mov	x2, x23
     dc4:      	bl	0xdc4 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x20c>
     dc8:      	ldr	x0, [x29, #0x20]
     dcc:      	mov	x1, x28
     dd0:      	mov	x2, x22
     dd4:      	bl	0xdd4 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x21c>
     dd8:      	mov	x0, x28
     ddc:      	mov	x1, x21
     de0:      	mov	x2, x24
     de4:      	movz	x3, #0x0, lsl #48
     de8:      	uxtb	w3, w3
     dec:      	bl	0xdec <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x234>
     df0:      	sub	sp, x29, #0x0
     df4:      	ldr	x19, [sp, #0x60]
     df8:      	ldr	x20, [sp, #0x68]
     dfc:      	ldr	x21, [sp, #0x70]
     e00:      	ldr	x22, [sp, #0x78]
     e04:      	ldr	x23, [sp, #0x80]
     e08:      	ldr	x24, [sp, #0x88]
     e0c:      	ldr	x25, [sp, #0x90]
     e10:      	ldr	x26, [sp, #0x98]
     e14:      	ldr	x27, [sp, #0xa0]
     e18:      	ldr	x28, [sp, #0xa8]
     e1c:      	ldr	x29, [sp]
     e20:      	ldr	x30, [sp, #0x8]
     e24:      	add	sp, sp, #0xb0
     e28:      	ret
     e2c:      	orr	x0, x26, xzr
     e30:      	add	x1, x20, #0x8
     e34:      	add	x2, x21, #0x21
     e38:      	adrp	x16, 0x0 <_gap_avec_get>
     e3c:      	ldr	x16, [x16]
     e40:      	orr	x3, x16, xzr
     e44:      	movz	x17, #0x0, lsl #48
     e48:      	str	x17, [x27]
     e4c:      	add	x4, x0, #0x8
     e50:      	orr	x23, x1, xzr
     e54:      	orr	x24, x2, xzr
     e58:      	str	x3, [x26]
     e5c:      	str	x27, [x4]
     e60:      	mov	x1, x0
     e64:      	ldr	x0, [x29, #0x20]
     e68:      	mov	x2, x22
     e6c:      	bl	0xe6c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x2b4>
     e70:      	ldr	x0, [x23]
     e74:      	ldr	x1, [x27]
     e78:      	ldrb	w2, [x24]
     e7c:      	ldr	x23, [x29, #0x58]
     e80:      	add	x1, x1, x23
     e84:      	add	x24, x1, x0
     e88:      	movz	x17, #0x0, lsl #48
     e8c:      	cmp	x2, x17
     e90:      	b.eq	0xd78 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1c0>
     e94:      	orr	x0, x20, xzr
     e98:      	add	x1, x20, #0x8
     e9c:      	ldr	x0, [x0]
     ea0:      	ldr	x1, [x1]
     ea4:      	ldr	x8, [x29, #0x30]
     ea8:      	mov	x2, x1
     eac:      	mov	x1, x0
     eb0:      	mov	x0, x28
     eb4:      	bl	0xeb4 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x2fc>
     eb8:      	ldr	x8, [x29, #0x38]
     ebc:      	mov	x0, x28
     ec0:      	ldr	x1, [x29, #0x10]
     ec4:      	mov	x2, x23
     ec8:      	bl	0xec8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x310>
     ecc:      	ldr	x0, [x19]
     ed0:      	sub	x19, x0, x24
     ed4:      	movn	x0, #0x0, lsl #48
     ed8:      	b	0xf30 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x378>
     edc:      	add	x1, x21, #0x20
     ee0:      	ldrb	w1, [x1]
     ee4:      	movz	x17, #0x0, lsl #48
     ee8:      	cmp	x1, x17
     eec:      	b.eq	0xcfc <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x144>
     ef0:      	orr	x1, x24, xzr
     ef4:      	adrp	x16, 0x0 <_gap_avec_get>
     ef8:      	ldr	x16, [x16]
     efc:      	orr	x2, x16, xzr
     f00:      	add	x3, x1, #0x8
     f04:      	str	x2, [x24]
     f08:      	mov	x17, #0x1               ; =1
     f0c:      	str	x17, [x3]
     f10:      	b	0xd1c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x164>
     f14:      	nop
     f18:      	ldr	x8, [x29, #0x40]
     f1c:      	mov	x0, x28
     f20:      	mov	x1, #0x30               ; =48
     f24:      	uxtb	w1, w1
     f28:      	bl	0xf28 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x370>
     f2c:      	mov	x0, x20
     f30:      	add	x20, x0, #0x1
     f34:      	cmp	x20, x19
     f38:      	b.lt	0xf18 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x360>
     f3c:      	ldr	x0, [x29, #0x20]
     f40:      	mov	x1, x28
     f44:      	mov	x2, x22
     f48:      	bl	0xf48 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x390>
     f4c:      	b	0xdf0 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x238>
     f50:      	mov	x22, x0
     f54:      	b	0xe2c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x274>

0000000000000f58 <_coil.panic.finish-stderr!>:
     f58:      	sub	sp, sp, #0x40
     f5c:      	str	x29, [sp]
     f60:      	str	x30, [sp, #0x8]
     f64:      	mov	x29, sp
     f68:      	str	x19, [sp, #0x10]
     f6c:      	str	x20, [sp, #0x18]
     f70:      	str	x21, [sp, #0x20]
     f74:      	str	x22, [sp, #0x28]
     f78:      	str	x23, [sp, #0x30]
     f7c:      	str	x24, [sp, #0x38]
     f80:      	adrp	x16, 0x0 <_gap_avec_get>
     f84:      	ldr	x16, [x16]
     f88:      	orr	x19, x16, xzr
     f8c:      	adrp	x16, 0x0 <_gap_avec_get>
     f90:      	ldr	x16, [x16]
     f94:      	orr	x20, x16, xzr
     f98:      	adrp	x16, 0x0 <_gap_avec_get>
     f9c:      	ldr	x16, [x16]
     fa0:      	add	x21, x16, #0x8
     fa4:      	mov	x22, x0
     fa8:      	mov	x23, x1
     fac:      	mov	x1, x19
     fb0:      	mov	x0, #0x2                ; =2
     fb4:      	mov	x2, #0x1                ; =1
     fb8:      	bl	0xfb8 <_coil.panic.finish-stderr!+0x60>
     fbc:      	adrp	x16, 0x0 <_gap_avec_get>
     fc0:      	ldr	x16, [x16]
     fc4:      	ldr	x24, [x16]
     fc8:      	ldr	x21, [x21]
     fcc:      	movz	x17, #0x0, lsl #48
     fd0:      	cmp	x23, x17
     fd4:      	b.le	0x1014 <_coil.panic.finish-stderr!+0xbc>
     fd8:      	mov	x1, x20
     fdc:      	mov	x0, #0x2                ; =2
     fe0:      	mov	x2, #0x5                ; =5
     fe4:      	bl	0xfe4 <_coil.panic.finish-stderr!+0x8c>
     fe8:      	mov	x1, x22
     fec:      	mov	x2, x23
     ff0:      	mov	x0, #0x2                ; =2
     ff4:      	bl	0xff4 <_coil.panic.finish-stderr!+0x9c>
     ff8:      	mov	x1, x19
     ffc:      	mov	x0, #0x2                ; =2
    1000:      	mov	x2, #0x1                ; =1
    1004:      	bl	0x1004 <_coil.panic.finish-stderr!+0xac>
    1008:      	bl	0x1008 <_coil.panic.finish-stderr!+0xb0>
    100c:      	bl	0x100c <_coil.panic.finish-stderr!+0xb4>
    1010:      	b	0x1010 <_coil.panic.finish-stderr!+0xb8>
    1014:      	movz	x17, #0x0, lsl #48
    1018:      	cmp	x21, x17
    101c:      	b.le	0x1060 <_coil.panic.finish-stderr!+0x108>
    1020:      	adrp	x16, 0x1000 <_coil.panic.finish-stderr!+0xa8>
    1024:      	ldr	x16, [x16]
    1028:      	orr	x19, x16, xzr
    102c:      	mov	x1, x20
    1030:      	mov	x0, #0x2                ; =2
    1034:      	mov	x2, #0x5                ; =5
    1038:      	bl	0x1038 <_coil.panic.finish-stderr!+0xe0>
    103c:      	mov	x1, x24
    1040:      	mov	x2, x21
    1044:      	mov	x0, #0x2                ; =2
    1048:      	bl	0x1048 <_coil.panic.finish-stderr!+0xf0>
    104c:      	mov	x1, x19
    1050:      	mov	x0, #0x2                ; =2
    1054:      	mov	x2, #0x13               ; =19
    1058:      	bl	0x1058 <_coil.panic.finish-stderr!+0x100>
    105c:      	b	0x1008 <_coil.panic.finish-stderr!+0xb0>
    1060:      	adrp	x16, 0x1000 <_coil.panic.finish-stderr!+0xa8>
    1064:      	ldr	x16, [x16]
    1068:      	orr	x0, x16, xzr
    106c:      	mov	x1, x0
    1070:      	mov	x0, #0x2                ; =2
    1074:      	mov	x2, #0x40               ; =64
    1078:      	bl	0x1078 <_coil.panic.finish-stderr!+0x120>
    107c:      	b	0x1008 <_coil.panic.finish-stderr!+0xb0>

0000000000001080 <_coil.os.errno>:
    1080:      	sub	sp, sp, #0x10
    1084:      	str	x29, [sp]
    1088:      	str	x30, [sp, #0x8]
    108c:      	mov	x29, sp
    1090:      	adrp	x16, 0x1000 <_coil.panic.finish-stderr!+0xa8>
    1094:      	ldr	x16, [x16]
    1098:      	orr	x0, x16, xzr
    109c:      	mov	x1, #-0x2               ; =-2
    10a0:      	bl	0x10a0 <_coil.os.errno+0x20>
    10a4:      	ldr	w0, [x0]
    10a8:      	sxtw	x0, w0
    10ac:      	ldr	x29, [sp]
    10b0:      	ldr	x30, [sp, #0x8]
    10b4:      	add	sp, sp, #0x10
    10b8:      	ret

00000000000010bc <_coil.io.fd-retry?>:
    10bc:      	sub	sp, sp, #0x10
    10c0:      	str	x29, [sp]
    10c4:      	str	x30, [sp, #0x8]
    10c8:      	mov	x29, sp
    10cc:      	mov	x17, #0x4               ; =4
    10d0:      	cmp	x1, x17
    10d4:      	b.ne	0x10f4 <_coil.io.fd-retry?+0x38>
    10d8:      	mov	x0, #0x1                ; =1
    10dc:      	b	0x10e4 <_coil.io.fd-retry?+0x28>
    10e0:      	movz	x0, #0x0, lsl #48
    10e4:      	ldr	x29, [sp]
    10e8:      	ldr	x30, [sp, #0x8]
    10ec:      	add	sp, sp, #0x10
    10f0:      	ret
    10f4:      	mov	x17, #0x23              ; =35
    10f8:      	cmp	x1, x17
    10fc:      	b.ne	0x10e0 <_coil.io.fd-retry?+0x24>
    1100:      	lsr	w0, w0, #0
    1104:      	uxth	w2, w2
    1108:      	mov	w1, w2
    110c:      	mov	x2, #-0x2               ; =-2
    1110:      	uxth	w1, w1
    1114:      	bl	0x1114 <_coil.io.fd-retry?+0x58>
    1118:      	b	0x10e4 <_coil.io.fd-retry?+0x28>

000000000000111c <_coil.fmt.plain-format-spec>:
    111c:      	sub	sp, sp, #0x10
    1120:      	str	x29, [sp]
    1124:      	str	x30, [sp, #0x8]
    1128:      	mov	x29, sp
    112c:      	sub	sp, sp, #0x30
    1130:      	mov	x0, sp
    1134:      	sub	sp, sp, #0x10
    1138:      	mov	x1, sp
    113c:      	add	x2, x0, #0x8
    1140:      	add	x3, x0, #0x10
    1144:      	add	x4, x0, #0x18
    1148:      	add	x5, x0, #0x20
    114c:      	add	x6, x0, #0x21
    1150:      	movz	x17, #0x0, lsl #48
    1154:      	str	x17, [x0]
    1158:      	movz	x17, #0x0, lsl #48
    115c:      	str	x17, [x0, #0x8]
    1160:      	movz	x17, #0x0, lsl #48
    1164:      	str	x17, [x0, #0x10]
    1168:      	movz	x17, #0x0, lsl #48
    116c:      	str	x17, [x0, #0x18]
    1170:      	movz	x17, #0x0, lsl #48
    1174:      	str	x17, [x0, #0x20]
    1178:      	movn	x17, #0x0, lsl #48
    117c:      	str	x17, [x0]
    1180:      	movn	x17, #0x0, lsl #48
    1184:      	str	x17, [x2]
    1188:      	mov	w17, #0x20              ; =32
    118c:      	str	w17, [x3]
    1190:      	movz	w17, #0x0, lsl #16
    1194:      	str	w17, [x1]
    1198:      	ldr	x1, [x1]
    119c:      	str	x1, [x4]
    11a0:      	movz	w17, #0x0, lsl #16
    11a4:      	strb	w17, [x5]
    11a8:      	movz	w17, #0x0, lsl #16
    11ac:      	strb	w17, [x6]
    11b0:      	ldr	x2, [x0]
    11b4:      	ldr	x3, [x0, #0x8]
    11b8:      	ldr	x4, [x0, #0x10]
    11bc:      	ldr	x0, [x0, #0x20]
    11c0:      	str	x2, [x8]
    11c4:      	str	x3, [x8, #0x8]
    11c8:      	str	x4, [x8, #0x10]
    11cc:      	str	x1, [x8, #0x18]
    11d0:      	str	x0, [x8, #0x20]
    11d4:      	sub	sp, x29, #0x0
    11d8:      	ldr	x29, [sp]
    11dc:      	ldr	x30, [sp, #0x8]
    11e0:      	add	sp, sp, #0x10
    11e4:      	ret

00000000000011e8 <_coil.io.write-some>:
    11e8:      	sub	sp, sp, #0x20
    11ec:      	str	x29, [sp]
    11f0:      	str	x30, [sp, #0x8]
    11f4:      	mov	x29, sp
    11f8:      	str	x19, [sp, #0x10]
    11fc:      	str	x20, [sp, #0x18]
    1200:      	sub	sp, sp, #0x20
    1204:      	mov	x19, sp
    1208:      	orr	x3, x0, xzr
    120c:      	add	x0, x0, #0x8
    1210:      	ldr	x3, [x3]
    1214:      	ldr	x0, [x0]
    1218:      	mov	x30, x3
    121c:      	mov	x20, x8
    1220:      	mov	x8, x19
    1224:      	blr	x30
    1228:      	ldr	x0, [x19]
    122c:      	str	x0, [x20]
    1230:      	ldr	x0, [x19, #0x8]
    1234:      	str	x0, [x20, #0x8]
    1238:      	ldr	x0, [x19, #0x10]
    123c:      	str	x0, [x20, #0x10]
    1240:      	sub	sp, x29, #0x0
    1244:      	ldr	x19, [sp, #0x10]
    1248:      	ldr	x20, [sp, #0x18]
    124c:      	ldr	x29, [sp]
    1250:      	ldr	x30, [sp, #0x8]
    1254:      	add	sp, sp, #0x20
    1258:      	ret

000000000000125c <_inherent$coil.fmt.Formatter$writer>:
    125c:      	ldr	x0, [x0]
    1260:      	ret

0000000000001264 <_inherent$coil.fmt.Formatter$take-spec!>:
    1264:      	sub	sp, sp, #0x20
    1268:      	str	x29, [sp]
    126c:      	str	x30, [sp, #0x8]
    1270:      	mov	x29, sp
    1274:      	str	x19, [sp, #0x10]
    1278:      	str	x20, [sp, #0x18]
    127c:      	sub	sp, sp, #0x30
    1280:      	mov	x1, sp
    1284:      	add	x2, x0, #0x40
    1288:      	sub	sp, sp, #0x30
    128c:      	mov	x3, sp
    1290:      	ldrb	w2, [x2]
    1294:      	movz	x17, #0x0, lsl #48
    1298:      	cmp	x2, x17
    129c:      	b.eq	0x12e8 <_inherent$coil.fmt.Formatter$take-spec!+0x84>
    12a0:      	orr	x2, x1, xzr
    12a4:      	add	x3, x0, #0x40
    12a8:      	add	x0, x0, #0x18
    12ac:      	movz	w17, #0x0, lsl #16
    12b0:      	strb	w17, [x3]
    12b4:      	ldr	x3, [x0]
    12b8:      	str	x3, [x1]
    12bc:      	ldr	x3, [x0, #0x8]
    12c0:      	str	x3, [x1, #0x8]
    12c4:      	ldr	x3, [x0, #0x10]
    12c8:      	str	x3, [x1, #0x10]
    12cc:      	ldr	x3, [x0, #0x18]
    12d0:      	str	x3, [x1, #0x18]
    12d4:      	ldr	x0, [x0, #0x20]
    12d8:      	str	x0, [x1, #0x20]
    12dc:      	mov	x20, x8
    12e0:      	mov	x0, x2
    12e4:      	b	0x12fc <_inherent$coil.fmt.Formatter$take-spec!+0x98>
    12e8:      	orr	x19, x3, xzr
    12ec:      	mov	x20, x8
    12f0:      	mov	x8, x3
    12f4:      	bl	0x12f4 <_inherent$coil.fmt.Formatter$take-spec!+0x90>
    12f8:      	mov	x0, x19
    12fc:      	ldr	x1, [x0]
    1300:      	str	x1, [x20]
    1304:      	ldr	x1, [x0, #0x8]
    1308:      	str	x1, [x20, #0x8]
    130c:      	ldr	x1, [x0, #0x10]
    1310:      	str	x1, [x20, #0x10]
    1314:      	ldr	x1, [x0, #0x18]
    1318:      	str	x1, [x20, #0x18]
    131c:      	ldr	x0, [x0, #0x20]
    1320:      	str	x0, [x20, #0x20]
    1324:      	sub	sp, x29, #0x0
    1328:      	ldr	x19, [sp, #0x10]
    132c:      	ldr	x20, [sp, #0x18]
    1330:      	ldr	x29, [sp]
    1334:      	ldr	x30, [sp, #0x8]
    1338:      	add	sp, sp, #0x20
    133c:      	ret

0000000000001340 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits>:
    1340:      	sub	sp, sp, #0x10
    1344:      	str	x29, [sp]
    1348:      	str	x30, [sp, #0x8]
    134c:      	mov	x29, sp
    1350:      	sub	sp, sp, #0x20
    1354:      	mov	x2, sp
    1358:      	sub	sp, sp, #0x20
    135c:      	mov	x3, sp
    1360:      	sub	sp, sp, #0x20
    1364:      	mov	x4, sp
    1368:      	ldr	w5, [x0]
    136c:      	lsr	x16, x5, #0
    1370:      	cmp	x16, #0x2
    1374:      	b.hi	0x13a0 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x60>
    1378:      	adr	x17, 0x1388 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x48>
    137c:      	ldrsw	x16, [x17, x16, lsl #2]
    1380:      	add	x16, x17, x16
    1384:      	br	x16
    1388:      	udf	#0xc
    138c:      	udf	#0x10
    1390:      	udf	#0x14
    1394:      	b	0x13a4 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x64>
    1398:      	b	0x13c4 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x84>
    139c:      	b	0x13e4 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xa4>
    13a0:      	b	0x1420 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xe0>
    13a4:      	add	x0, x0, #0x8
    13a8:      	ldr	x0, [x0]
    13ac:      	mov	x8, x2
    13b0:      	fmov	d31, x0
    13b4:      	mov	x0, x1
    13b8:      	fmov	x1, d31
    13bc:      	bl	0x13bc <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x7c>
    13c0:      	b	0x1408 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xc8>
    13c4:      	add	x0, x0, #0x8
    13c8:      	ldr	x0, [x0]
    13cc:      	mov	x8, x3
    13d0:      	fmov	d31, x0
    13d4:      	mov	x0, x1
    13d8:      	fmov	x1, d31
    13dc:      	bl	0x13dc <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x9c>
    13e0:      	b	0x1408 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xc8>
    13e4:      	add	x0, x0, #0x8
    13e8:      	ldr	x2, [x0]
    13ec:      	ldr	x0, [x0, #0x8]
    13f0:      	mov	x8, x4
    13f4:      	fmov	d31, x0
    13f8:      	mov	x0, x1
    13fc:      	mov	x1, x2
    1400:      	fmov	x2, d31
    1404:      	bl	0x1404 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xc4>
    1408:      	movz	x0, #0x0, lsl #48
    140c:      	sub	sp, x29, #0x0
    1410:      	ldr	x29, [sp]
    1414:      	ldr	x30, [sp, #0x8]
    1418:      	add	sp, sp, #0x10
    141c:      	ret
    1420:      	brk	#0
    1424:      	b	0x1420 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xe0>

0000000000001428 <_coil.fmt.counting-writer>:
    1428:      	adrp	x16, 0x1000 <_coil.panic.finish-stderr!+0xa8>
    142c:      	ldr	x16, [x16]
    1430:      	orr	x2, x16, xzr
    1434:      	add	x3, x0, #0x8
    1438:      	movz	x17, #0x0, lsl #48
    143c:      	str	x17, [x1]
    1440:      	str	x2, [x0]
    1444:      	str	x1, [x3]
    1448:      	ret

000000000000144c <_coil.io.write-byte>:
    144c:      	sub	sp, sp, #0x20
    1450:      	str	x29, [sp]
    1454:      	str	x30, [sp, #0x8]
    1458:      	mov	x29, sp
    145c:      	str	x19, [sp, #0x10]
    1460:      	str	x20, [sp, #0x18]
    1464:      	sub	sp, sp, #0x10
    1468:      	mov	x2, sp
    146c:      	orr	x3, x2, xzr
    1470:      	sub	sp, sp, #0x20
    1474:      	mov	x19, sp
    1478:      	strb	w1, [x2]
    147c:      	mov	x1, x3
    1480:      	mov	x20, x8
    1484:      	mov	x8, x19
    1488:      	mov	x2, #0x1                ; =1
    148c:      	bl	0x148c <_coil.io.write-byte+0x40>
    1490:      	ldr	x0, [x19]
    1494:      	str	x0, [x20]
    1498:      	ldr	x0, [x19, #0x8]
    149c:      	str	x0, [x20, #0x8]
    14a0:      	ldr	x0, [x19, #0x10]
    14a4:      	str	x0, [x20, #0x10]
    14a8:      	sub	sp, x29, #0x0
    14ac:      	ldr	x19, [sp, #0x10]
    14b0:      	ldr	x20, [sp, #0x18]
    14b4:      	ldr	x29, [sp]
    14b8:      	ldr	x30, [sp, #0x8]
    14bc:      	add	sp, sp, #0x20
    14c0:      	ret

00000000000014c4 <_coil.fmt.fmt--pad-before>:
    14c4:      	sub	sp, sp, #0x10
    14c8:      	str	x29, [sp]
    14cc:      	str	x30, [sp, #0x8]
    14d0:      	mov	x29, sp
    14d4:      	ldr	x4, [x1]
    14d8:      	sub	x2, x4, x2
    14dc:      	movz	x17, #0x0, lsl #48
    14e0:      	cmp	x2, x17
    14e4:      	b.le	0x1548 <_coil.fmt.fmt--pad-before+0x84>
    14e8:      	add	x4, x1, #0x18
    14ec:      	ldr	x4, [x4]
    14f0:      	lsr	w4, w4, #0
    14f4:      	lsr	x16, x4, #0
    14f8:      	cmp	x16, #0x3
    14fc:      	b.hi	0x1530 <_coil.fmt.fmt--pad-before+0x6c>
    1500:      	adr	x17, 0x1510 <_coil.fmt.fmt--pad-before+0x4c>
    1504:      	ldrsw	x16, [x17, x16, lsl #2]
    1508:      	add	x16, x17, x16
    150c:      	br	x16
    1510:      	udf	#0x10
    1514:      	udf	#0x14
    1518:      	udf	#0x18
    151c:      	udf	#0x1c
    1520:      	b	0x155c <_coil.fmt.fmt--pad-before+0x98>
    1524:      	b	0x1548 <_coil.fmt.fmt--pad-before+0x84>
    1528:      	b	0x1534 <_coil.fmt.fmt--pad-before+0x70>
    152c:      	b	0x153c <_coil.fmt.fmt--pad-before+0x78>
    1530:      	b	0x1574 <_coil.fmt.fmt--pad-before+0xb0>
    1534:      	bl	0x1534 <_coil.fmt.fmt--pad-before+0x70>
    1538:      	b	0x1548 <_coil.fmt.fmt--pad-before+0x84>
    153c:      	mov	x17, #0x2               ; =2
    1540:      	sdiv	x2, x2, x17
    1544:      	bl	0x1544 <_coil.fmt.fmt--pad-before+0x80>
    1548:      	movz	x0, #0x0, lsl #48
    154c:      	ldr	x29, [sp]
    1550:      	ldr	x30, [sp, #0x8]
    1554:      	add	sp, sp, #0x10
    1558:      	ret
    155c:      	ubfx	x3, x3, #0, #8
    1560:      	movz	x17, #0x0, lsl #48
    1564:      	cmp	x3, x17
    1568:      	b.ne	0x1548 <_coil.fmt.fmt--pad-before+0x84>
    156c:      	bl	0x156c <_coil.fmt.fmt--pad-before+0xa8>
    1570:      	b	0x1548 <_coil.fmt.fmt--pad-before+0x84>
    1574:      	brk	#0
    1578:      	b	0x1574 <_coil.fmt.fmt--pad-before+0xb0>

000000000000157c <_coil.fmt.fmt--pad-after>:
    157c:      	sub	sp, sp, #0x10
    1580:      	str	x29, [sp]
    1584:      	str	x30, [sp, #0x8]
    1588:      	mov	x29, sp
    158c:      	ldr	x4, [x1]
    1590:      	sub	x2, x4, x2
    1594:      	movz	x17, #0x0, lsl #48
    1598:      	cmp	x2, x17
    159c:      	b.le	0x1604 <_coil.fmt.fmt--pad-after+0x88>
    15a0:      	add	x4, x1, #0x18
    15a4:      	ldr	x4, [x4]
    15a8:      	lsr	w4, w4, #0
    15ac:      	lsr	x16, x4, #0
    15b0:      	cmp	x16, #0x3
    15b4:      	b.hi	0x15e8 <_coil.fmt.fmt--pad-after+0x6c>
    15b8:      	adr	x17, 0x15c8 <_coil.fmt.fmt--pad-after+0x4c>
    15bc:      	ldrsw	x16, [x17, x16, lsl #2]
    15c0:      	add	x16, x17, x16
    15c4:      	br	x16
    15c8:      	udf	#0x10
    15cc:      	udf	#0x14
    15d0:      	udf	#0x18
    15d4:      	udf	#0x1c
    15d8:      	b	0x1618 <_coil.fmt.fmt--pad-after+0x9c>
    15dc:      	b	0x15ec <_coil.fmt.fmt--pad-after+0x70>
    15e0:      	b	0x1604 <_coil.fmt.fmt--pad-after+0x88>
    15e4:      	b	0x15f4 <_coil.fmt.fmt--pad-after+0x78>
    15e8:      	b	0x1630 <_coil.fmt.fmt--pad-after+0xb4>
    15ec:      	bl	0x15ec <_coil.fmt.fmt--pad-after+0x70>
    15f0:      	b	0x1604 <_coil.fmt.fmt--pad-after+0x88>
    15f4:      	mov	x17, #0x2               ; =2
    15f8:      	sdiv	x3, x2, x17
    15fc:      	sub	x2, x2, x3
    1600:      	bl	0x1600 <_coil.fmt.fmt--pad-after+0x84>
    1604:      	movz	x0, #0x0, lsl #48
    1608:      	ldr	x29, [sp]
    160c:      	ldr	x30, [sp, #0x8]
    1610:      	add	sp, sp, #0x10
    1614:      	ret
    1618:      	ubfx	x3, x3, #0, #8
    161c:      	movz	x17, #0x0, lsl #48
    1620:      	cmp	x3, x17
    1624:      	b.eq	0x1604 <_coil.fmt.fmt--pad-after+0x88>
    1628:      	bl	0x1628 <_coil.fmt.fmt--pad-after+0xac>
    162c:      	b	0x1604 <_coil.fmt.fmt--pad-after+0x88>
    1630:      	brk	#0
    1634:      	b	0x1630 <_coil.fmt.fmt--pad-after+0xb4>

0000000000001638 <_coil.panic.site-cell>:
    1638:      	adrp	x16, 0x1000 <_coil.panic.finish-stderr!+0xa8>
    163c:      	ldr	x16, [x16]
    1640:      	orr	x0, x16, xzr
    1644:      	ret

0000000000001648 <_coil.panic.put-trace!>:
    1648:      	sub	sp, sp, #0x10
    164c:      	str	x29, [sp]
    1650:      	str	x30, [sp, #0x8]
    1654:      	mov	x29, sp
    1658:      	bl	0x1658 <_coil.panic.put-trace!+0x10>
    165c:      	ldr	x29, [sp]
    1660:      	ldr	x30, [sp, #0x8]
    1664:      	add	sp, sp, #0x10
    1668:      	ret

000000000000166c <_coil.os.errno-cell>:
    166c:      	sub	sp, sp, #0x10
    1670:      	str	x29, [sp]
    1674:      	str	x30, [sp, #0x8]
    1678:      	mov	x29, sp
    167c:      	adrp	x16, 0x1000 <_coil.panic.finish-stderr!+0xa8>
    1680:      	ldr	x16, [x16]
    1684:      	orr	x0, x16, xzr
    1688:      	mov	x1, #-0x2               ; =-2
    168c:      	bl	0x168c <_coil.os.errno-cell+0x20>
    1690:      	ldr	x29, [sp]
    1694:      	ldr	x30, [sp, #0x8]
    1698:      	add	sp, sp, #0x10
    169c:      	ret

00000000000016a0 <_coil.io.poll-one>:
    16a0:      	sub	sp, sp, #0x40
    16a4:      	str	x29, [sp]
    16a8:      	str	x30, [sp, #0x8]
    16ac:      	mov	x29, sp
    16b0:      	str	x19, [sp, #0x10]
    16b4:      	str	x20, [sp, #0x18]
    16b8:      	str	x21, [sp, #0x20]
    16bc:      	str	x22, [sp, #0x28]
    16c0:      	str	x23, [sp, #0x30]
    16c4:      	adrp	x16, 0x1000 <_coil.panic.finish-stderr!+0xa8>
    16c8:      	ldr	x16, [x16]
    16cc:      	orr	x19, x16, xzr
    16d0:      	sub	sp, sp, #0x10
    16d4:      	mov	x20, sp
    16d8:      	mov	w21, w0
    16dc:      	mov	x0, x19
    16e0:      	mov	w22, w1
    16e4:      	mov	x23, x2
    16e8:      	bl	0x16e8 <_coil.io.poll-one+0x48>
    16ec:      	movz	x17, #0x0, lsl #48
    16f0:      	cmp	x0, x17
    16f4:      	b.ne	0x1728 <_coil.io.poll-one+0x88>
    16f8:      	adrp	x16, 0x1000 <_coil.panic.finish-stderr!+0xa8>
    16fc:      	ldr	x16, [x16]
    1700:      	orr	x0, x16, xzr
    1704:      	mov	x1, x0
    1708:      	mov	x0, x23
    170c:      	bl	0x170c <_coil.io.poll-one+0x6c>
    1710:      	mov	x1, x0
    1714:      	fmov	d31, x0
    1718:      	mov	x0, x19
    171c:      	fmov	x19, d31
    1720:      	bl	0x1720 <_coil.io.poll-one+0x80>
    1724:      	mov	x0, x19
    1728:      	orr	x1, x20, xzr
    172c:      	lsr	w21, w21, #0
    1730:      	uxth	w22, w22
    1734:      	add	x2, x1, #0x4
    1738:      	add	x3, x1, #0x6
    173c:      	str	w21, [x20]
    1740:      	strh	w22, [x2]
    1744:      	movz	w17, #0x0, lsl #16
    1748:      	strh	w17, [x3]
    174c:      	movz	x17, #0x0, lsl #48
    1750:      	cmp	x0, x17
    1754:      	b.ne	0x17b4 <_coil.io.poll-one+0x114>
    1758:      	movz	x0, #0x0, lsl #48
    175c:      	b	0x178c <_coil.io.poll-one+0xec>
    1760:      	adrp	x16, 0x1000 <_coil.panic.finish-stderr!+0xa8>
    1764:      	ldr	x16, [x16]
    1768:      	orr	x0, x16, xzr
    176c:      	mov	x1, #-0x2               ; =-2
    1770:      	bl	0x1770 <_coil.io.poll-one+0xd0>
    1774:      	ldr	w0, [x0]
    1778:      	sxtw	x0, w0
    177c:      	mov	x17, #0x4               ; =4
    1780:      	cmp	x0, x17
    1784:      	cset	w0, eq
    1788:      	ubfx	x0, x0, #0, #8
    178c:      	sub	sp, x29, #0x0
    1790:      	ldr	x19, [sp, #0x10]
    1794:      	ldr	x20, [sp, #0x18]
    1798:      	ldr	x21, [sp, #0x20]
    179c:      	ldr	x22, [sp, #0x28]
    17a0:      	ldr	x23, [sp, #0x30]
    17a4:      	ldr	x29, [sp]
    17a8:      	ldr	x30, [sp, #0x8]
    17ac:      	add	sp, sp, #0x40
    17b0:      	ret
    17b4:      	mov	x30, x0
    17b8:      	mov	x0, x1
    17bc:      	mov	x1, #0x1                ; =1
    17c0:      	mov	x2, #0xffff             ; =65535
    17c4:      	movk	x2, #0xffff, lsl #16
    17c8:      	blr	x30
    17cc:      	lsr	w0, w0, #0
    17d0:      	sxtw	x0, w0
    17d4:      	movz	x17, #0x0, lsl #48
    17d8:      	cmp	x0, x17
    17dc:      	b.lt	0x1760 <_coil.io.poll-one+0xc0>
    17e0:      	mov	x0, #0x1                ; =1
    17e4:      	b	0x178c <_coil.io.poll-one+0xec>

00000000000017e8 <_coil.fmt.print-u>:
    17e8:      	sub	sp, sp, #0x20
    17ec:      	str	x29, [sp]
    17f0:      	str	x30, [sp, #0x8]
    17f4:      	mov	x29, sp
    17f8:      	str	x19, [sp, #0x10]
    17fc:      	str	x20, [sp, #0x18]
    1800:      	sub	sp, sp, #0x20
    1804:      	mov	x2, sp
    1808:      	sub	sp, sp, #0x20
    180c:      	mov	x3, sp
    1810:      	movz	x17, #0x0, lsl #48
    1814:      	cmp	x1, x17
    1818:      	b.ne	0x1880 <_coil.fmt.print-u+0x98>
    181c:      	orr	x19, x2, xzr
    1820:      	mov	x20, x8
    1824:      	mov	x8, x2
    1828:      	mov	x1, #0x30               ; =48
    182c:      	uxtb	w1, w1
    1830:      	bl	0x1830 <_coil.fmt.print-u+0x48>
    1834:      	mov	x0, x19
    1838:      	b	0x184c <_coil.fmt.print-u+0x64>
    183c:      	orr	x19, x3, xzr
    1840:      	mov	x8, x3
    1844:      	bl	0x1844 <_coil.fmt.print-u+0x5c>
    1848:      	mov	x0, x19
    184c:      	ldr	x1, [x0]
    1850:      	str	x1, [x20]
    1854:      	ldr	x1, [x0, #0x8]
    1858:      	str	x1, [x20, #0x8]
    185c:      	ldr	x0, [x0, #0x10]
    1860:      	str	x0, [x20, #0x10]
    1864:      	sub	sp, x29, #0x0
    1868:      	ldr	x19, [sp, #0x10]
    186c:      	ldr	x20, [sp, #0x18]
    1870:      	ldr	x29, [sp]
    1874:      	ldr	x30, [sp, #0x8]
    1878:      	add	sp, sp, #0x20
    187c:      	ret
    1880:      	mov	x20, x8
    1884:      	b	0x183c <_coil.fmt.print-u+0x54>

0000000000001888 <_coil.fmt.print-uhex>:
    1888:      	sub	sp, sp, #0x20
    188c:      	str	x29, [sp]
    1890:      	str	x30, [sp, #0x8]
    1894:      	mov	x29, sp
    1898:      	str	x19, [sp, #0x10]
    189c:      	str	x20, [sp, #0x18]
    18a0:      	sub	sp, sp, #0x20
    18a4:      	mov	x2, sp
    18a8:      	sub	sp, sp, #0x20
    18ac:      	mov	x3, sp
    18b0:      	movz	x17, #0x0, lsl #48
    18b4:      	cmp	x1, x17
    18b8:      	b.ne	0x1920 <_coil.fmt.print-uhex+0x98>
    18bc:      	orr	x19, x2, xzr
    18c0:      	mov	x20, x8
    18c4:      	mov	x8, x2
    18c8:      	mov	x1, #0x30               ; =48
    18cc:      	uxtb	w1, w1
    18d0:      	bl	0x18d0 <_coil.fmt.print-uhex+0x48>
    18d4:      	mov	x0, x19
    18d8:      	b	0x18ec <_coil.fmt.print-uhex+0x64>
    18dc:      	orr	x19, x3, xzr
    18e0:      	mov	x8, x3
    18e4:      	bl	0x18e4 <_coil.fmt.print-uhex+0x5c>
    18e8:      	mov	x0, x19
    18ec:      	ldr	x1, [x0]
    18f0:      	str	x1, [x20]
    18f4:      	ldr	x1, [x0, #0x8]
    18f8:      	str	x1, [x20, #0x8]
    18fc:      	ldr	x0, [x0, #0x10]
    1900:      	str	x0, [x20, #0x10]
    1904:      	sub	sp, x29, #0x0
    1908:      	ldr	x19, [sp, #0x10]
    190c:      	ldr	x20, [sp, #0x18]
    1910:      	ldr	x29, [sp]
    1914:      	ldr	x30, [sp, #0x8]
    1918:      	add	sp, sp, #0x20
    191c:      	ret
    1920:      	mov	x20, x8
    1924:      	b	0x18dc <_coil.fmt.print-uhex+0x54>

0000000000001928 <_coil.fmt.count--write>:
    1928:      	sub	sp, sp, #0x10
    192c:      	str	x29, [sp]
    1930:      	str	x30, [sp, #0x8]
    1934:      	mov	x29, sp
    1938:      	sub	sp, sp, #0x20
    193c:      	mov	x1, sp
    1940:      	ldr	x3, [x0]
    1944:      	add	x4, x1, #0x8
    1948:      	add	x3, x3, x2
    194c:      	str	x3, [x0]
    1950:      	movz	w17, #0x0, lsl #16
    1954:      	str	w17, [x1]
    1958:      	str	x2, [x4]
    195c:      	ldr	x0, [x1]
    1960:      	str	x0, [x8]
    1964:      	ldr	x0, [x1, #0x8]
    1968:      	str	x0, [x8, #0x8]
    196c:      	ldr	x0, [x1, #0x10]
    1970:      	str	x0, [x8, #0x10]
    1974:      	sub	sp, x29, #0x0
    1978:      	ldr	x29, [sp]
    197c:      	ldr	x30, [sp, #0x8]
    1980:      	add	sp, sp, #0x10
    1984:      	ret

0000000000001988 <_coil.fmt.fmt--fill>:
    1988:      	sub	sp, sp, #0x50
    198c:      	str	x29, [sp]
    1990:      	str	x30, [sp, #0x8]
    1994:      	mov	x29, sp
    1998:      	str	x19, [sp, #0x10]
    199c:      	str	x20, [sp, #0x18]
    19a0:      	str	x21, [sp, #0x20]
    19a4:      	str	x22, [sp, #0x28]
    19a8:      	str	x23, [sp, #0x30]
    19ac:      	str	x24, [sp, #0x38]
    19b0:      	str	x25, [sp, #0x40]
    19b4:      	sub	sp, sp, #0x20
    19b8:      	mov	x19, sp
    19bc:      	add	x1, x1, #0x10
    19c0:      	sub	sp, sp, #0x20
    19c4:      	mov	x20, sp
    19c8:      	orr	x21, x1, xzr
    19cc:      	movn	x1, #0x0, lsl #48
    19d0:      	b	0x1a24 <_coil.fmt.fmt--fill+0x9c>
    19d4:      	nop
    19d8:      	lsr	x0, x0, #8
    19dc:      	lsr	w0, w0, #0
    19e0:      	orr	x23, x0, xzr
    19e4:      	and	x0, x23, #0xff
    19e8:      	uxtb	w0, w0
    19ec:      	mov	x8, x20
    19f0:      	mov	w1, w0
    19f4:      	mov	x0, x24
    19f8:      	uxtb	w1, w1
    19fc:      	bl	0x19fc <_coil.fmt.fmt--fill+0x74>
    1a00:      	mov	x0, x23
    1a04:      	lsr	x1, x0, #8
    1a08:      	lsr	w1, w1, #0
    1a0c:      	movz	x17, #0x0, lsl #48
    1a10:      	cmp	x1, x17
    1a14:      	b.ne	0x19d8 <_coil.fmt.fmt--fill+0x50>
    1a18:      	mov	x0, x24
    1a1c:      	mov	x2, x25
    1a20:      	mov	x1, x22
    1a24:      	add	x22, x1, #0x1
    1a28:      	cmp	x22, x2
    1a2c:      	b.ge	0x1a5c <_coil.fmt.fmt--fill+0xd4>
    1a30:      	ldr	w1, [x21]
    1a34:      	orr	x23, x1, xzr
    1a38:      	and	x1, x23, #0xff
    1a3c:      	uxtb	w1, w1
    1a40:      	mov	x8, x19
    1a44:      	mov	x24, x0
    1a48:      	mov	x25, x2
    1a4c:      	uxtb	w1, w1
    1a50:      	bl	0x1a50 <_coil.fmt.fmt--fill+0xc8>
    1a54:      	mov	x0, x23
    1a58:      	b	0x1a04 <_coil.fmt.fmt--fill+0x7c>
    1a5c:      	movz	x0, #0x0, lsl #48
    1a60:      	sub	sp, x29, #0x0
    1a64:      	ldr	x19, [sp, #0x10]
    1a68:      	ldr	x20, [sp, #0x18]
    1a6c:      	ldr	x21, [sp, #0x20]
    1a70:      	ldr	x22, [sp, #0x28]
    1a74:      	ldr	x23, [sp, #0x30]
    1a78:      	ldr	x24, [sp, #0x38]
    1a7c:      	ldr	x25, [sp, #0x40]
    1a80:      	ldr	x29, [sp]
    1a84:      	ldr	x30, [sp, #0x8]
    1a88:      	add	sp, sp, #0x50
    1a8c:      	ret

0000000000001a90 <_coil.panic.put-trace-stderr!>:
    1a90:      	sub	sp, sp, #0x20
    1a94:      	str	x29, [sp]
    1a98:      	str	x30, [sp, #0x8]
    1a9c:      	mov	x29, sp
    1aa0:      	str	x19, [sp, #0x10]
    1aa4:      	str	x20, [sp, #0x18]
    1aa8:      	sub	sp, sp, #0x200
    1aac:      	mov	x0, sp
    1ab0:      	orr	x19, x0, xzr
    1ab4:      	mov	x0, x19
    1ab8:      	mov	x1, #0x40               ; =64
    1abc:      	bl	0x1abc <_coil.panic.put-trace-stderr!+0x2c>
    1ac0:      	lsr	w0, w0, #0
    1ac4:      	sxtw	x1, w0
    1ac8:      	movz	x17, #0x0, lsl #48
    1acc:      	cmp	x1, x17
    1ad0:      	b.le	0x1b00 <_coil.panic.put-trace-stderr!+0x70>
    1ad4:      	adrp	x16, 0x1000 <_coil.panic.finish-stderr!+0xa8>
    1ad8:      	ldr	x16, [x16]
    1adc:      	orr	x1, x16, xzr
    1ae0:      	lsr	w20, w0, #0
    1ae4:      	mov	x0, #0x2                ; =2
    1ae8:      	mov	x2, #0xd                ; =13
    1aec:      	bl	0x1aec <_coil.panic.put-trace-stderr!+0x5c>
    1af0:      	mov	x0, x19
    1af4:      	mov	w1, w20
    1af8:      	mov	x2, #0x2                ; =2
    1afc:      	bl	0x1afc <_coil.panic.put-trace-stderr!+0x6c>
    1b00:      	movz	x0, #0x0, lsl #48
    1b04:      	sub	sp, x29, #0x0
    1b08:      	ldr	x19, [sp, #0x10]
    1b0c:      	ldr	x20, [sp, #0x18]
    1b10:      	ldr	x29, [sp]
    1b14:      	ldr	x30, [sp, #0x8]
    1b18:      	add	sp, sp, #0x20
    1b1c:      	ret

0000000000001b20 <_coil.os.dlsym-errno-cell>:
    1b20:      	sub	sp, sp, #0x30
    1b24:      	str	x29, [sp]
    1b28:      	str	x30, [sp, #0x8]
    1b2c:      	mov	x29, sp
    1b30:      	str	x19, [sp, #0x10]
    1b34:      	str	x20, [sp, #0x18]
    1b38:      	str	x21, [sp, #0x20]
    1b3c:      	adrp	x16, 0x1000 <_coil.panic.finish-stderr!+0xa8>
    1b40:      	ldr	x16, [x16]
    1b44:      	orr	x19, x16, xzr
    1b48:      	mov	x20, x0
    1b4c:      	mov	x0, x19
    1b50:      	mov	x21, x1
    1b54:      	bl	0x1b54 <_coil.os.dlsym-errno-cell+0x34>
    1b58:      	movz	x17, #0x0, lsl #48
    1b5c:      	cmp	x0, x17
    1b60:      	b.ne	0x1b88 <_coil.os.dlsym-errno-cell+0x68>
    1b64:      	mov	x0, x21
    1b68:      	mov	x1, x20
    1b6c:      	bl	0x1b6c <_coil.os.dlsym-errno-cell+0x4c>
    1b70:      	mov	x1, x0
    1b74:      	fmov	d31, x0
    1b78:      	mov	x0, x19
    1b7c:      	fmov	x19, d31
    1b80:      	bl	0x1b80 <_coil.os.dlsym-errno-cell+0x60>
    1b84:      	mov	x0, x19
    1b88:      	mov	x30, x0
    1b8c:      	blr	x30
    1b90:      	ldr	x19, [sp, #0x10]
    1b94:      	ldr	x20, [sp, #0x18]
    1b98:      	ldr	x21, [sp, #0x20]
    1b9c:      	ldr	x29, [sp]
    1ba0:      	ldr	x30, [sp, #0x8]
    1ba4:      	add	sp, sp, #0x30
    1ba8:      	ret

0000000000001bac <_coil.os.dlsym-cached>:
    1bac:      	sub	sp, sp, #0x30
    1bb0:      	str	x29, [sp]
    1bb4:      	str	x30, [sp, #0x8]
    1bb8:      	mov	x29, sp
    1bbc:      	str	x19, [sp, #0x10]
    1bc0:      	str	x20, [sp, #0x18]
    1bc4:      	str	x21, [sp, #0x20]
    1bc8:      	mov	x19, x0
    1bcc:      	mov	x20, x1
    1bd0:      	mov	x21, x2
    1bd4:      	bl	0x1bd4 <_coil.os.dlsym-cached+0x28>
    1bd8:      	movz	x17, #0x0, lsl #48
    1bdc:      	cmp	x0, x17
    1be0:      	b.ne	0x1c08 <_coil.os.dlsym-cached+0x5c>
    1be4:      	mov	x0, x21
    1be8:      	mov	x1, x20
    1bec:      	bl	0x1bec <_coil.os.dlsym-cached+0x40>
    1bf0:      	mov	x1, x0
    1bf4:      	fmov	d31, x0
    1bf8:      	mov	x0, x19
    1bfc:      	fmov	x19, d31
    1c00:      	bl	0x1c00 <_coil.os.dlsym-cached+0x54>
    1c04:      	mov	x0, x19
    1c08:      	ldr	x19, [sp, #0x10]
    1c0c:      	ldr	x20, [sp, #0x18]
    1c10:      	ldr	x21, [sp, #0x20]
    1c14:      	ldr	x29, [sp]
    1c18:      	ldr	x30, [sp, #0x8]
    1c1c:      	add	sp, sp, #0x30
    1c20:      	ret

0000000000001c24 <_coil.fmt.udec-digits>:
    1c24:      	sub	sp, sp, #0x40
    1c28:      	str	x29, [sp]
    1c2c:      	str	x30, [sp, #0x8]
    1c30:      	mov	x29, sp
    1c34:      	str	x19, [sp, #0x10]
    1c38:      	str	x20, [sp, #0x18]
    1c3c:      	str	x21, [sp, #0x20]
    1c40:      	str	x22, [sp, #0x28]
    1c44:      	str	x23, [sp, #0x30]
    1c48:      	str	x24, [sp, #0x38]
    1c4c:      	sub	sp, sp, #0x20
    1c50:      	mov	x2, sp
    1c54:      	sub	sp, sp, #0x20
    1c58:      	mov	x19, sp
    1c5c:      	sub	sp, sp, #0x20
    1c60:      	mov	x20, sp
    1c64:      	sub	sp, sp, #0x20
    1c68:      	mov	x21, sp
    1c6c:      	movz	x17, #0x0, lsl #48
    1c70:      	cmp	x1, x17
    1c74:      	b.ne	0x1cd8 <_coil.fmt.udec-digits+0xb4>
    1c78:      	orr	x0, x2, xzr
    1c7c:      	movz	w17, #0x0, lsl #16
    1c80:      	str	w17, [x2]
    1c84:      	add	x1, x0, #0x8
    1c88:      	movz	x17, #0x0, lsl #48
    1c8c:      	str	x17, [x1]
    1c90:      	mov	x22, x8
    1c94:      	ldr	x1, [x0]
    1c98:      	str	x1, [x22]
    1c9c:      	ldr	x1, [x0, #0x8]
    1ca0:      	str	x1, [x22, #0x8]
    1ca4:      	ldr	x0, [x0, #0x10]
    1ca8:      	str	x0, [x22, #0x10]
    1cac:      	sub	sp, x29, #0x0
    1cb0:      	ldr	x19, [sp, #0x10]
    1cb4:      	ldr	x20, [sp, #0x18]
    1cb8:      	ldr	x21, [sp, #0x20]
    1cbc:      	ldr	x22, [sp, #0x28]
    1cc0:      	ldr	x23, [sp, #0x30]
    1cc4:      	ldr	x24, [sp, #0x38]
    1cc8:      	ldr	x29, [sp]
    1ccc:      	ldr	x30, [sp, #0x8]
    1cd0:      	add	sp, sp, #0x40
    1cd4:      	ret
    1cd8:      	mov	x17, #0xa               ; =10
    1cdc:      	udiv	x2, x1, x17
    1ce0:      	mov	x22, x8
    1ce4:      	mov	x8, x19
    1ce8:      	mov	x23, x0
    1cec:      	mov	x24, x1
    1cf0:      	mov	x1, x2
    1cf4:      	bl	0x1cf4 <_coil.fmt.udec-digits+0xd0>
    1cf8:      	ldr	w0, [x19]
    1cfc:      	lsr	x16, x0, #0
    1d00:      	cmp	x16, #0x1
    1d04:      	b.eq	0x1d20 <_coil.fmt.udec-digits+0xfc>
    1d08:      	b.lo	0x1d10 <_coil.fmt.udec-digits+0xec>
    1d0c:      	b	0x1d24 <_coil.fmt.udec-digits+0x100>
    1d10:      	cmp	x16, #0x0
    1d14:      	b.eq	0x1d1c <_coil.fmt.udec-digits+0xf8>
    1d18:      	b	0x1d24 <_coil.fmt.udec-digits+0x100>
    1d1c:      	b	0x1d50 <_coil.fmt.udec-digits+0x12c>
    1d20:      	b	0x1d28 <_coil.fmt.udec-digits+0x104>
    1d24:      	b	0x1d84 <_coil.fmt.udec-digits+0x160>
    1d28:      	orr	x0, x20, xzr
    1d2c:      	add	x1, x19, #0x8
    1d30:      	add	x2, x0, #0x8
    1d34:      	ldr	x3, [x1]
    1d38:      	ldr	x1, [x1, #0x8]
    1d3c:      	mov	w17, #0x1               ; =1
    1d40:      	str	w17, [x20]
    1d44:      	str	x3, [x2]
    1d48:      	str	x1, [x2, #0x8]
    1d4c:      	b	0x1d80 <_coil.fmt.udec-digits+0x15c>
    1d50:      	orr	x19, x21, xzr
    1d54:      	mov	x17, #0xa               ; =10
    1d58:      	udiv	x16, x24, x17
    1d5c:      	msub	x0, x16, x17, x24
    1d60:      	add	x0, x0, #0x30
    1d64:      	uxtb	w0, w0
    1d68:      	mov	x8, x21
    1d6c:      	mov	w1, w0
    1d70:      	mov	x0, x23
    1d74:      	uxtb	w1, w1
    1d78:      	bl	0x1d78 <_coil.fmt.udec-digits+0x154>
    1d7c:      	mov	x0, x19
    1d80:      	b	0x1c94 <_coil.fmt.udec-digits+0x70>
    1d84:      	brk	#0
    1d88:      	b	0x1d84 <_coil.fmt.udec-digits+0x160>

0000000000001d8c <_coil.fmt.uhex-digits>:
    1d8c:      	sub	sp, sp, #0x40
    1d90:      	str	x29, [sp]
    1d94:      	str	x30, [sp, #0x8]
    1d98:      	mov	x29, sp
    1d9c:      	str	x19, [sp, #0x10]
    1da0:      	str	x20, [sp, #0x18]
    1da4:      	str	x21, [sp, #0x20]
    1da8:      	str	x22, [sp, #0x28]
    1dac:      	str	x23, [sp, #0x30]
    1db0:      	str	x24, [sp, #0x38]
    1db4:      	sub	sp, sp, #0x20
    1db8:      	mov	x2, sp
    1dbc:      	sub	sp, sp, #0x20
    1dc0:      	mov	x19, sp
    1dc4:      	sub	sp, sp, #0x20
    1dc8:      	mov	x20, sp
    1dcc:      	sub	sp, sp, #0x20
    1dd0:      	mov	x21, sp
    1dd4:      	movz	x17, #0x0, lsl #48
    1dd8:      	cmp	x1, x17
    1ddc:      	b.ne	0x1e40 <_coil.fmt.uhex-digits+0xb4>
    1de0:      	orr	x0, x2, xzr
    1de4:      	movz	w17, #0x0, lsl #16
    1de8:      	str	w17, [x2]
    1dec:      	add	x1, x0, #0x8
    1df0:      	movz	x17, #0x0, lsl #48
    1df4:      	str	x17, [x1]
    1df8:      	mov	x22, x8
    1dfc:      	ldr	x1, [x0]
    1e00:      	str	x1, [x22]
    1e04:      	ldr	x1, [x0, #0x8]
    1e08:      	str	x1, [x22, #0x8]
    1e0c:      	ldr	x0, [x0, #0x10]
    1e10:      	str	x0, [x22, #0x10]
    1e14:      	sub	sp, x29, #0x0
    1e18:      	ldr	x19, [sp, #0x10]
    1e1c:      	ldr	x20, [sp, #0x18]
    1e20:      	ldr	x21, [sp, #0x20]
    1e24:      	ldr	x22, [sp, #0x28]
    1e28:      	ldr	x23, [sp, #0x30]
    1e2c:      	ldr	x24, [sp, #0x38]
    1e30:      	ldr	x29, [sp]
    1e34:      	ldr	x30, [sp, #0x8]
    1e38:      	add	sp, sp, #0x40
    1e3c:      	ret
    1e40:      	mov	x17, #0x10              ; =16
    1e44:      	udiv	x2, x1, x17
    1e48:      	mov	x22, x8
    1e4c:      	mov	x8, x19
    1e50:      	mov	x23, x0
    1e54:      	mov	x24, x1
    1e58:      	mov	x1, x2
    1e5c:      	bl	0x1e5c <_coil.fmt.uhex-digits+0xd0>
    1e60:      	ldr	w0, [x19]
    1e64:      	lsr	x16, x0, #0
    1e68:      	cmp	x16, #0x1
    1e6c:      	b.eq	0x1e88 <_coil.fmt.uhex-digits+0xfc>
    1e70:      	b.lo	0x1e78 <_coil.fmt.uhex-digits+0xec>
    1e74:      	b	0x1e8c <_coil.fmt.uhex-digits+0x100>
    1e78:      	cmp	x16, #0x0
    1e7c:      	b.eq	0x1e84 <_coil.fmt.uhex-digits+0xf8>
    1e80:      	b	0x1e8c <_coil.fmt.uhex-digits+0x100>
    1e84:      	b	0x1ee0 <_coil.fmt.uhex-digits+0x154>
    1e88:      	b	0x1e90 <_coil.fmt.uhex-digits+0x104>
    1e8c:      	b	0x1f00 <_coil.fmt.uhex-digits+0x174>
    1e90:      	orr	x0, x20, xzr
    1e94:      	add	x1, x19, #0x8
    1e98:      	add	x2, x0, #0x8
    1e9c:      	ldr	x3, [x1]
    1ea0:      	ldr	x1, [x1, #0x8]
    1ea4:      	mov	w17, #0x1               ; =1
    1ea8:      	str	w17, [x20]
    1eac:      	str	x3, [x2]
    1eb0:      	str	x1, [x2, #0x8]
    1eb4:      	b	0x1edc <_coil.fmt.uhex-digits+0x150>
    1eb8:      	add	x0, x0, #0x57
    1ebc:      	orr	x19, x21, xzr
    1ec0:      	uxtb	w0, w0
    1ec4:      	mov	x8, x21
    1ec8:      	mov	w1, w0
    1ecc:      	mov	x0, x23
    1ed0:      	uxtb	w1, w1
    1ed4:      	bl	0x1ed4 <_coil.fmt.uhex-digits+0x148>
    1ed8:      	mov	x0, x19
    1edc:      	b	0x1dfc <_coil.fmt.uhex-digits+0x70>
    1ee0:      	mov	x17, #0x10              ; =16
    1ee4:      	udiv	x16, x24, x17
    1ee8:      	msub	x0, x16, x17, x24
    1eec:      	mov	x17, #0xa               ; =10
    1ef0:      	cmp	x0, x17
    1ef4:      	b.ge	0x1eb8 <_coil.fmt.uhex-digits+0x12c>
    1ef8:      	add	x0, x0, #0x30
    1efc:      	b	0x1ebc <_coil.fmt.uhex-digits+0x130>
    1f00:      	brk	#0
    1f04:      	b	0x1f00 <_coil.fmt.uhex-digits+0x174>

0000000000001f08 <_coil.atomic.read-ptr__i8>:
    1f08:      	mov	x16, x0
    1f0c:      	ldar	x0, [x16]
    1f10:      	ret

0000000000001f14 <_coil.atomic.store-ptr__i8>:
    1f14:      	mov	x16, x0
    1f18:      	mov	x17, x1
    1f1c:      	stlr	x17, [x16]
    1f20:      	movz	x0, #0x0, lsl #48
    1f24:      	ret
