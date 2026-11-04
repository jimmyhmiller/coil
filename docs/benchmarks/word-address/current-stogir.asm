
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-word-address/build/word-address-avec/current-stogir.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_avec_get>:
       0:      	sub	sp, sp, #0x10
       4:      	str	x29, [sp]
       8:      	str	x30, [sp, #0x8]
       c:      	mov	x29, sp
      10:      	movz	x17, #0x0, lsl #48
      14:      	cmp	x1, x17
      18:      	b.lt	0x40 <_gap_avec_get+0x40>
      1c:      	ldr	x2, [x0, #0x10]
      20:      	cmp	x1, x2
      24:      	b.ge	0x40 <_gap_avec_get+0x40>
      28:      	ldr	x2, [x0, #0x10]
      2c:      	mov	x17, #0x20              ; =32
      30:      	cmp	x2, x17
      34:      	b.ge	0x58 <_gap_avec_get+0x58>
      38:      	movz	x2, #0x0, lsl #48
      3c:      	b	0x68 <_gap_avec_get+0x68>
      40:      	ldr	x0, [x0, #0x10]
      44:      	fmov	d31, x0
      48:      	mov	x0, x1
      4c:      	fmov	x1, d31
      50:      	bl	0x50 <_gap_avec_get+0x50>
      54:      	b	0x54 <_gap_avec_get+0x54>
      58:      	ldr	x2, [x0, #0x10]
      5c:      	sub	x2, x2, #0x1
      60:      	asr	x2, x2, #5
      64:      	lsl	x2, x2, #5
      68:      	cmp	x1, x2
      6c:      	b.lt	0x78 <_gap_avec_get+0x78>
      70:      	ldr	x0, [x0, #0x8]
      74:      	b	0xb4 <_gap_avec_get+0xb4>
      78:      	ldr	x2, [x0]
      7c:      	ldr	x0, [x0, #0x18]
      80:      	b	0xa4 <_gap_avec_get+0xa4>
      84:      	nop
      88:      	asr	x3, x1, x0
      8c:      	sub	x0, x0, #0x5
      90:      	and	x3, x3, #0x1f
      94:      	ldr	x2, [x2, #0x20]
      98:      	lsl	x3, x3, #3
      9c:      	add	x2, x3, x2
      a0:      	ldr	x2, [x2]
      a4:      	movz	x17, #0x0, lsl #48
      a8:      	cmp	x0, x17
      ac:      	b.gt	0x88 <_gap_avec_get+0x88>
      b0:      	mov	x0, x2
      b4:      	and	x1, x1, #0x1f
      b8:      	lsl	x1, x1, #4
      bc:      	ldr	x0, [x0, #0x18]
      c0:      	add	x0, x1, x0
      c4:      	ldr	x1, [x0]
      c8:      	asr	x1, x1, #32
      cc:      	ldr	x0, [x0, #0x8]
      d0:      	lsr	w2, w0, #0
      d4:      	asr	x0, x0, #32
      d8:      	sxtw	x2, w2
      dc:      	add	x1, x2, x1
      e0:      	add	x0, x0, x1
      e4:      	ldr	x29, [sp]
      e8:      	ldr	x30, [sp, #0x8]
      ec:      	add	sp, sp, #0x10
      f0:      	ret
      f4:      	udf	#0x0

00000000000000f8 <_coil.avec.avec-at__gaps.avec-get.Node>:
      f8:      	sub	sp, sp, #0x10
      fc:      	str	x29, [sp]
     100:      	str	x30, [sp, #0x8]
     104:      	mov	x29, sp
     108:      	movz	x17, #0x0, lsl #48
     10c:      	cmp	x1, x17
     110:      	b.lt	0x138 <_coil.avec.avec-at__gaps.avec-get.Node+0x40>
     114:      	ldr	x2, [x0, #0x10]
     118:      	cmp	x1, x2
     11c:      	b.ge	0x138 <_coil.avec.avec-at__gaps.avec-get.Node+0x40>
     120:      	ldr	x2, [x0, #0x10]
     124:      	mov	x17, #0x20              ; =32
     128:      	cmp	x2, x17
     12c:      	b.ge	0x150 <_coil.avec.avec-at__gaps.avec-get.Node+0x58>
     130:      	movz	x2, #0x0, lsl #48
     134:      	b	0x160 <_coil.avec.avec-at__gaps.avec-get.Node+0x68>
     138:      	ldr	x0, [x0, #0x10]
     13c:      	fmov	d31, x0
     140:      	mov	x0, x1
     144:      	fmov	x1, d31
     148:      	bl	0x148 <_coil.avec.avec-at__gaps.avec-get.Node+0x50>
     14c:      	b	0x14c <_coil.avec.avec-at__gaps.avec-get.Node+0x54>
     150:      	ldr	x2, [x0, #0x10]
     154:      	sub	x2, x2, #0x1
     158:      	asr	x2, x2, #5
     15c:      	lsl	x2, x2, #5
     160:      	cmp	x1, x2
     164:      	b.lt	0x170 <_coil.avec.avec-at__gaps.avec-get.Node+0x78>
     168:      	ldr	x0, [x0, #0x8]
     16c:      	b	0x1ac <_coil.avec.avec-at__gaps.avec-get.Node+0xb4>
     170:      	ldr	x2, [x0]
     174:      	ldr	x0, [x0, #0x18]
     178:      	b	0x19c <_coil.avec.avec-at__gaps.avec-get.Node+0xa4>
     17c:      	nop
     180:      	asr	x3, x1, x0
     184:      	sub	x0, x0, #0x5
     188:      	and	x3, x3, #0x1f
     18c:      	ldr	x2, [x2, #0x20]
     190:      	lsl	x3, x3, #3
     194:      	add	x2, x3, x2
     198:      	ldr	x2, [x2]
     19c:      	movz	x17, #0x0, lsl #48
     1a0:      	cmp	x0, x17
     1a4:      	b.gt	0x180 <_coil.avec.avec-at__gaps.avec-get.Node+0x88>
     1a8:      	mov	x0, x2
     1ac:      	and	x1, x1, #0x1f
     1b0:      	lsl	x1, x1, #4
     1b4:      	ldr	x0, [x0, #0x18]
     1b8:      	add	x0, x1, x0
     1bc:      	ldr	x29, [sp]
     1c0:      	ldr	x30, [sp, #0x8]
     1c4:      	add	sp, sp, #0x10
     1c8:      	ret

00000000000001cc <_coil.avec.avec--check__gaps.avec-get.Node>:
     1cc:      	sub	sp, sp, #0x10
     1d0:      	str	x29, [sp]
     1d4:      	str	x30, [sp, #0x8]
     1d8:      	mov	x29, sp
     1dc:      	movz	x17, #0x0, lsl #48
     1e0:      	cmp	x1, x17
     1e4:      	b.lt	0x208 <_coil.avec.avec--check__gaps.avec-get.Node+0x3c>
     1e8:      	ldr	x2, [x0, #0x10]
     1ec:      	cmp	x1, x2
     1f0:      	b.ge	0x208 <_coil.avec.avec--check__gaps.avec-get.Node+0x3c>
     1f4:      	movz	x0, #0x0, lsl #48
     1f8:      	ldr	x29, [sp]
     1fc:      	ldr	x30, [sp, #0x8]
     200:      	add	sp, sp, #0x10
     204:      	ret
     208:      	ldr	x0, [x0, #0x10]
     20c:      	fmov	d31, x0
     210:      	mov	x0, x1
     214:      	fmov	x1, d31
     218:      	bl	0x218 <_coil.avec.avec--check__gaps.avec-get.Node+0x4c>
     21c:      	b	0x21c <_coil.avec.avec--check__gaps.avec-get.Node+0x50>

0000000000000220 <_coil.avec.avec--leaf-for__gaps.avec-get.Node>:
     220:      	ldr	x2, [x0, #0x10]
     224:      	mov	x17, #0x20              ; =32
     228:      	cmp	x2, x17
     22c:      	b.ge	0x238 <_coil.avec.avec--leaf-for__gaps.avec-get.Node+0x18>
     230:      	movz	x2, #0x0, lsl #48
     234:      	b	0x248 <_coil.avec.avec--leaf-for__gaps.avec-get.Node+0x28>
     238:      	ldr	x2, [x0, #0x10]
     23c:      	sub	x2, x2, #0x1
     240:      	asr	x2, x2, #5
     244:      	lsl	x2, x2, #5
     248:      	cmp	x1, x2
     24c:      	b.lt	0x258 <_coil.avec.avec--leaf-for__gaps.avec-get.Node+0x38>
     250:      	ldr	x0, [x0, #0x8]
     254:      	b	0x294 <_coil.avec.avec--leaf-for__gaps.avec-get.Node+0x74>
     258:      	ldr	x2, [x0]
     25c:      	ldr	x0, [x0, #0x18]
     260:      	b	0x284 <_coil.avec.avec--leaf-for__gaps.avec-get.Node+0x64>
     264:      	nop
     268:      	asr	x3, x1, x0
     26c:      	sub	x0, x0, #0x5
     270:      	and	x3, x3, #0x1f
     274:      	ldr	x2, [x2, #0x20]
     278:      	lsl	x3, x3, #3
     27c:      	add	x2, x3, x2
     280:      	ldr	x2, [x2]
     284:      	movz	x17, #0x0, lsl #48
     288:      	cmp	x0, x17
     28c:      	b.gt	0x268 <_coil.avec.avec--leaf-for__gaps.avec-get.Node+0x48>
     290:      	mov	x0, x2
     294:      	ret

0000000000000298 <_coil.avec.avec--bounds-error>:
     298:      	sub	sp, sp, #0x70
     29c:      	str	x29, [sp]
     2a0:      	str	x30, [sp, #0x8]
     2a4:      	mov	x29, sp
     2a8:      	str	x19, [sp, #0x18]
     2ac:      	str	x20, [sp, #0x20]
     2b0:      	str	x21, [sp, #0x28]
     2b4:      	str	x22, [sp, #0x30]
     2b8:      	str	x23, [sp, #0x38]
     2bc:      	str	x24, [sp, #0x40]
     2c0:      	str	x25, [sp, #0x48]
     2c4:      	str	x26, [sp, #0x50]
     2c8:      	str	x27, [sp, #0x58]
     2cc:      	str	x28, [sp, #0x60]
     2d0:      	sub	sp, sp, #0x50
     2d4:      	mov	x19, sp
     2d8:      	sub	sp, sp, #0x50
     2dc:      	mov	x20, sp
     2e0:      	sub	sp, sp, #0x20
     2e4:      	mov	x21, sp
     2e8:      	sub	sp, sp, #0x20
     2ec:      	mov	x22, sp
     2f0:      	mov	x23, x0
     2f4:      	mov	x24, x1
     2f8:      	bl	0x2f8 <_coil.avec.avec--bounds-error+0x60>
     2fc:      	movz	x0, #0x0, lsl #48
     300:      	b	0x31c <_coil.avec.avec--bounds-error+0x84>
     304:      	nop
     308:      	add	x1, x0, #0x8
     30c:      	add	x0, x20, x0
     310:      	movz	x17, #0x0, lsl #48
     314:      	str	x17, [x0]
     318:      	mov	x0, x1
     31c:      	mov	x17, #0x48              ; =72
     320:      	cmp	x0, x17
     324:      	b.lo	0x308 <_coil.avec.avec--bounds-error+0x70>
     328:      	movz	x0, #0x0, lsl #48
     32c:      	b	0x348 <_coil.avec.avec--bounds-error+0xb0>
     330:      	add	x1, x0, #0x8
     334:      	add	x2, x19, x0
     338:      	add	x0, x20, x0
     33c:      	ldr	x0, [x0]
     340:      	str	x0, [x2]
     344:      	mov	x0, x1
     348:      	mov	x17, #0x48              ; =72
     34c:      	cmp	x0, x17
     350:      	b.lo	0x330 <_coil.avec.avec--bounds-error+0x98>
     354:      	orr	x20, x19, xzr
     358:      	adrp	x16, 0x0 <_gap_avec_get>
     35c:      	ldr	x16, [x16]
     360:      	orr	x25, x16, xzr
     364:      	adrp	x16, 0x0 <_gap_avec_get>
     368:      	ldr	x16, [x16]
     36c:      	orr	x26, x16, xzr
     370:      	adrp	x16, 0x0 <_gap_avec_get>
     374:      	ldr	x16, [x16]
     378:      	orr	x27, x16, xzr
     37c:      	adrp	x16, 0x0 <_gap_avec_get>
     380:      	ldr	x16, [x16]
     384:      	orr	x0, x16, xzr
     388:      	adrp	x16, 0x0 <_gap_avec_get>
     38c:      	ldr	x16, [x16]
     390:      	orr	x28, x16, xzr
     394:      	adrp	x16, 0x0 <_gap_avec_get>
     398:      	ldr	x16, [x16]
     39c:      	orr	x1, x16, xzr
     3a0:      	str	x0, [x19]
     3a4:      	movz	w17, #0x0, lsl #16
     3a8:      	strb	w17, [x19, #0x8]
     3ac:      	movz	x17, #0x0, lsl #48
     3b0:      	str	x17, [x19, #0x10]
     3b4:      	mov	x0, x20
     3b8:      	str	x1, [x29, #0x10]
     3bc:      	bl	0x3bc <_coil.avec.avec--bounds-error+0x124>
     3c0:      	mov	x8, x21
     3c4:      	mov	x0, x28
     3c8:      	mov	x1, x25
     3cc:      	mov	x2, #0xc                ; =12
     3d0:      	bl	0x3d0 <_coil.avec.avec--bounds-error+0x138>
     3d4:      	movz	w17, #0x0, lsl #16
     3d8:      	strb	w17, [x19, #0x8]
     3dc:      	mov	x0, x23
     3e0:      	mov	x1, x20
     3e4:      	bl	0x3e4 <_coil.avec.avec--bounds-error+0x14c>
     3e8:      	mov	x8, x22
     3ec:      	ldr	x0, [x29, #0x10]
     3f0:      	mov	x1, x26
     3f4:      	mov	x2, #0x10               ; =16
     3f8:      	bl	0x3f8 <_coil.avec.avec--bounds-error+0x160>
     3fc:      	movz	w17, #0x0, lsl #16
     400:      	strb	w17, [x19, #0x8]
     404:      	mov	x0, x24
     408:      	mov	x1, x20
     40c:      	bl	0x40c <_coil.avec.avec--bounds-error+0x174>
     410:      	mov	x0, x27
     414:      	mov	x1, #0x19               ; =25
     418:      	bl	0x418 <_coil.avec.avec--bounds-error+0x180>
     41c:      	b	0x41c <_coil.avec.avec--bounds-error+0x184>

0000000000000420 <_coil.avec.avec--tail-offset__gaps.avec-get.Node>:
     420:      	ldr	x1, [x0, #0x10]
     424:      	mov	x17, #0x20              ; =32
     428:      	cmp	x1, x17
     42c:      	b.ge	0x438 <_coil.avec.avec--tail-offset__gaps.avec-get.Node+0x18>
     430:      	movz	x0, #0x0, lsl #48
     434:      	b	0x448 <_coil.avec.avec--tail-offset__gaps.avec-get.Node+0x28>
     438:      	ldr	x0, [x0, #0x10]
     43c:      	sub	x0, x0, #0x1
     440:      	asr	x0, x0, #5
     444:      	lsl	x0, x0, #5
     448:      	ret

000000000000044c <_coil.panic.begin!>:
     44c:      	sub	sp, sp, #0x10
     450:      	str	x29, [sp]
     454:      	str	x30, [sp, #0x8]
     458:      	mov	x29, sp
     45c:      	adrp	x16, 0x0 <_gap_avec_get>
     460:      	ldr	x16, [x16]
     464:      	ldr	x0, [x16]
     468:      	movz	x17, #0x0, lsl #48
     46c:      	cmp	x0, x17
     470:      	b.ne	0x4b4 <_coil.panic.begin!+0x68>
     474:      	adrp	x16, 0x0 <_gap_avec_get>
     478:      	ldr	x16, [x16]
     47c:      	orr	x0, x16, xzr
     480:      	adrp	x16, 0x0 <_gap_avec_get>
     484:      	ldr	x16, [x16]
     488:      	mov	x17, #0x1               ; =1
     48c:      	str	x17, [x16]
     490:      	mov	x1, x0
     494:      	mov	x0, #0x2                ; =2
     498:      	mov	x2, #0x7                ; =7
     49c:      	bl	0x49c <_coil.panic.begin!+0x50>
     4a0:      	movz	x0, #0x0, lsl #48
     4a4:      	ldr	x29, [sp]
     4a8:      	ldr	x30, [sp, #0x8]
     4ac:      	add	sp, sp, #0x10
     4b0:      	ret
     4b4:      	adrp	x16, 0x0 <_gap_avec_get>
     4b8:      	ldr	x16, [x16]
     4bc:      	orr	x0, x16, xzr
     4c0:      	mov	x1, x0
     4c4:      	mov	x0, #0x2                ; =2
     4c8:      	mov	x2, #0x29               ; =41
     4cc:      	bl	0x4cc <_coil.panic.begin!+0x80>
     4d0:      	bl	0x4d0 <_coil.panic.begin!+0x84>
     4d4:      	b	0x4d4 <_coil.panic.begin!+0x88>

00000000000004d8 <_coil.io.stderr>:
     4d8:      	adrp	x16, 0x0 <_gap_avec_get>
     4dc:      	ldr	x16, [x16]
     4e0:      	orr	x0, x16, xzr
     4e4:      	ret

00000000000004e8 <_inherent$coil.fmt.Formatter$init>:
     4e8:      	sub	sp, sp, #0x20
     4ec:      	str	x29, [sp]
     4f0:      	str	x30, [sp, #0x8]
     4f4:      	mov	x29, sp
     4f8:      	str	x19, [sp, #0x10]
     4fc:      	str	x1, [x0]
     500:      	movz	w17, #0x0, lsl #16
     504:      	strb	w17, [x0, #0x8]
     508:      	movz	x17, #0x0, lsl #48
     50c:      	str	x17, [x0, #0x10]
     510:      	mov	x19, x0
     514:      	bl	0x514 <_inherent$coil.fmt.Formatter$init+0x2c>
     518:      	mov	x0, x19
     51c:      	ldr	x19, [sp, #0x10]
     520:      	ldr	x29, [sp]
     524:      	ldr	x30, [sp, #0x8]
     528:      	add	sp, sp, #0x20
     52c:      	ret

0000000000000530 <_coil.io.print-str>:
     530:      	sub	sp, sp, #0x20
     534:      	str	x29, [sp]
     538:      	str	x30, [sp, #0x8]
     53c:      	mov	x29, sp
     540:      	str	x19, [sp, #0x10]
     544:      	str	x20, [sp, #0x18]
     548:      	sub	sp, sp, #0x20
     54c:      	mov	x19, sp
     550:      	mov	x20, x8
     554:      	mov	x8, x19
     558:      	bl	0x558 <_coil.io.print-str+0x28>
     55c:      	ldr	x0, [x19]
     560:      	str	x0, [x20]
     564:      	ldr	x0, [x19, #0x8]
     568:      	str	x0, [x20, #0x8]
     56c:      	ldr	x0, [x19, #0x10]
     570:      	str	x0, [x20, #0x10]
     574:      	sub	sp, x29, #0x0
     578:      	ldr	x19, [sp, #0x10]
     57c:      	ldr	x20, [sp, #0x18]
     580:      	ldr	x29, [sp]
     584:      	ldr	x30, [sp, #0x8]
     588:      	add	sp, sp, #0x20
     58c:      	ret

0000000000000590 <_inherent$coil.fmt.Formatter$set-alternate!>:
     590:      	strb	w1, [x0, #0x8]
     594:      	movz	x0, #0x0, lsl #48
     598:      	ret

000000000000059c <_coil.fmt.Display$i64$display-fmt>:
     59c:      	sub	sp, sp, #0x10
     5a0:      	str	x29, [sp]
     5a4:      	str	x30, [sp, #0x8]
     5a8:      	mov	x29, sp
     5ac:      	sub	sp, sp, #0x20
     5b0:      	mov	x2, sp
     5b4:      	sub	sp, sp, #0x20
     5b8:      	mov	x3, sp
     5bc:      	movz	w17, #0x0, lsl #16
     5c0:      	str	w17, [x2]
     5c4:      	movz	x17, #0x0, lsl #48
     5c8:      	cmp	x0, x17
     5cc:      	b.ge	0x5dc <_coil.fmt.Display$i64$display-fmt+0x40>
     5d0:      	movz	x16, #0x0, lsl #48
     5d4:      	sub	x4, x16, x0
     5d8:      	b	0x5e0 <_coil.fmt.Display$i64$display-fmt+0x44>
     5dc:      	mov	x4, x0
     5e0:      	adrp	x16, 0x0 <_gap_avec_get>
     5e4:      	ldr	x16, [x16]
     5e8:      	orr	x5, x16, xzr
     5ec:      	orr	x6, x3, xzr
     5f0:      	movz	x17, #0x0, lsl #48
     5f4:      	cmp	x0, x17
     5f8:      	cset	w0, lt
     5fc:      	uxtb	w0, w0
     600:      	str	x4, [x2, #0x8]
     604:      	ldr	x4, [x2]
     608:      	str	x4, [x3]
     60c:      	ldr	x4, [x2, #0x8]
     610:      	str	x4, [x3, #0x8]
     614:      	ldr	x2, [x2, #0x10]
     618:      	str	x2, [x3, #0x10]
     61c:      	mov	x2, x5
     620:      	mov	x4, x6
     624:      	fmov	s31, w0
     628:      	mov	x0, x1
     62c:      	fmov	w1, s31
     630:      	movz	x3, #0x0, lsl #48
     634:      	uxtb	w1, w1
     638:      	bl	0x638 <_coil.fmt.Display$i64$display-fmt+0x9c>
     63c:      	sub	sp, x29, #0x0
     640:      	ldr	x29, [sp]
     644:      	ldr	x30, [sp, #0x8]
     648:      	add	sp, sp, #0x10
     64c:      	ret

0000000000000650 <_coil.panic.finish!>:
     650:      	sub	sp, sp, #0x10
     654:      	str	x29, [sp]
     658:      	str	x30, [sp, #0x8]
     65c:      	mov	x29, sp
     660:      	bl	0x660 <_coil.panic.finish!+0x10>
     664:      	b	0x664 <_coil.panic.finish!+0x14>

0000000000000668 <_coil.panic.panicking>:
     668:      	adrp	x16, 0x0 <_gap_avec_get>
     66c:      	ldr	x16, [x16]
     670:      	orr	x0, x16, xzr
     674:      	ret

0000000000000678 <_coil.panic.put!>:
     678:      	sub	sp, sp, #0x10
     67c:      	str	x29, [sp]
     680:      	str	x30, [sp, #0x8]
     684:      	mov	x29, sp
     688:      	mov	x2, x1
     68c:      	mov	x1, x0
     690:      	mov	x0, #0x2                ; =2
     694:      	bl	0x694 <_coil.panic.put!+0x1c>
     698:      	movz	x0, #0x0, lsl #48
     69c:      	ldr	x29, [sp]
     6a0:      	ldr	x30, [sp, #0x8]
     6a4:      	add	sp, sp, #0x10
     6a8:      	ret
     6ac:      	udf	#0x0

00000000000006b0 <_coil.io.write-fd>:
     6b0:      	sub	sp, sp, #0x60
     6b4:      	str	x29, [sp]
     6b8:      	str	x30, [sp, #0x8]
     6bc:      	mov	x29, sp
     6c0:      	str	x19, [sp, #0x10]
     6c4:      	str	x20, [sp, #0x18]
     6c8:      	str	x21, [sp, #0x20]
     6cc:      	str	x22, [sp, #0x28]
     6d0:      	str	x23, [sp, #0x30]
     6d4:      	str	x24, [sp, #0x38]
     6d8:      	str	x25, [sp, #0x40]
     6dc:      	str	x26, [sp, #0x48]
     6e0:      	str	x27, [sp, #0x50]
     6e4:      	adrp	x16, 0x0 <_gap_avec_get>
     6e8:      	ldr	x16, [x16]
     6ec:      	orr	x19, x16, xzr
     6f0:      	sub	sp, sp, #0x20
     6f4:      	mov	x20, sp
     6f8:      	lsr	w0, w0, #0
     6fc:      	sub	sp, sp, #0x20
     700:      	mov	x21, sp
     704:      	lsr	w22, w0, #0
     708:      	sub	sp, sp, #0x10
     70c:      	mov	x23, sp
     710:      	b	0x724 <_coil.io.write-fd+0x74>
     714:      	nop
     718:      	mov	x8, x24
     71c:      	mov	x1, x25
     720:      	mov	x2, x26
     724:      	mov	w0, w22
     728:      	mov	x24, x8
     72c:      	mov	x25, x1
     730:      	mov	x26, x2
     734:      	bl	0x734 <_coil.io.write-fd+0x84>
     738:      	movz	x17, #0x0, lsl #48
     73c:      	cmp	x0, x17
     740:      	b.ge	0x7c0 <_coil.io.write-fd+0x110>
     744:      	mov	x0, x19
     748:      	mov	x1, #-0x2               ; =-2
     74c:      	bl	0x74c <_coil.io.write-fd+0x9c>
     750:      	ldr	w0, [x0]
     754:      	sxtw	x27, w0
     758:      	mov	x17, #0x4               ; =4
     75c:      	cmp	x27, x17
     760:      	b.eq	0x718 <_coil.io.write-fd+0x68>
     764:      	mov	x17, #0x23              ; =35
     768:      	cmp	x27, x17
     76c:      	b.ne	0x790 <_coil.io.write-fd+0xe0>
     770:      	mov	w0, w22
     774:      	mov	x1, #0x4                ; =4
     778:      	mov	x2, #-0x2               ; =-2
     77c:      	uxth	w1, w1
     780:      	bl	0x780 <_coil.io.write-fd+0xd0>
     784:      	movz	x17, #0x0, lsl #48
     788:      	cmp	x0, x17
     78c:      	b.ne	0x718 <_coil.io.write-fd+0x68>
     790:      	orr	x0, x21, xzr
     794:      	mov	w17, #0x1               ; =1
     798:      	str	w17, [x21]
     79c:      	add	x1, x0, #0x8
     7a0:      	mov	w17, #0x1               ; =1
     7a4:      	str	w17, [x23]
     7a8:      	str	x27, [x23, #0x8]
     7ac:      	ldr	x2, [x23]
     7b0:      	str	x2, [x21, #0x8]
     7b4:      	ldr	x2, [x23, #0x8]
     7b8:      	str	x2, [x1, #0x8]
     7bc:      	b	0x7d4 <_coil.io.write-fd+0x124>
     7c0:      	orr	x1, x20, xzr
     7c4:      	movz	w17, #0x0, lsl #16
     7c8:      	str	w17, [x20]
     7cc:      	str	x0, [x20, #0x8]
     7d0:      	mov	x0, x1
     7d4:      	ldr	x1, [x0]
     7d8:      	str	x1, [x24]
     7dc:      	ldr	x1, [x0, #0x8]
     7e0:      	str	x1, [x24, #0x8]
     7e4:      	ldr	x0, [x0, #0x10]
     7e8:      	str	x0, [x24, #0x10]
     7ec:      	sub	sp, x29, #0x0
     7f0:      	ldr	x19, [sp, #0x10]
     7f4:      	ldr	x20, [sp, #0x18]
     7f8:      	ldr	x21, [sp, #0x20]
     7fc:      	ldr	x22, [sp, #0x28]
     800:      	ldr	x23, [sp, #0x30]
     804:      	ldr	x24, [sp, #0x38]
     808:      	ldr	x25, [sp, #0x40]
     80c:      	ldr	x26, [sp, #0x48]
     810:      	ldr	x27, [sp, #0x50]
     814:      	ldr	x29, [sp]
     818:      	ldr	x30, [sp, #0x8]
     81c:      	add	sp, sp, #0x60
     820:      	ret

0000000000000824 <_inherent$coil.fmt.Formatter$clear-spec!>:
     824:      	sub	sp, sp, #0x30
     828:      	str	x29, [sp]
     82c:      	str	x30, [sp, #0x8]
     830:      	mov	x29, sp
     834:      	str	x19, [sp, #0x10]
     838:      	str	x20, [sp, #0x18]
     83c:      	str	x21, [sp, #0x20]
     840:      	sub	sp, sp, #0x30
     844:      	mov	x19, sp
     848:      	add	x20, x0, #0x18
     84c:      	mov	x8, x19
     850:      	mov	x21, x0
     854:      	bl	0x854 <_inherent$coil.fmt.Formatter$clear-spec!+0x30>
     858:      	ldr	x0, [x19]
     85c:      	str	x0, [x21, #0x18]
     860:      	ldr	x0, [x19, #0x8]
     864:      	str	x0, [x20, #0x8]
     868:      	ldr	x0, [x19, #0x10]
     86c:      	str	x0, [x20, #0x10]
     870:      	ldr	x0, [x19, #0x18]
     874:      	str	x0, [x20, #0x18]
     878:      	ldr	x0, [x19, #0x20]
     87c:      	str	x0, [x20, #0x20]
     880:      	movz	w17, #0x0, lsl #16
     884:      	strb	w17, [x21, #0x40]
     888:      	movz	x0, #0x0, lsl #48
     88c:      	sub	sp, x29, #0x0
     890:      	ldr	x19, [sp, #0x10]
     894:      	ldr	x20, [sp, #0x18]
     898:      	ldr	x21, [sp, #0x20]
     89c:      	ldr	x29, [sp]
     8a0:      	ldr	x30, [sp, #0x8]
     8a4:      	add	sp, sp, #0x30
     8a8:      	ret

00000000000008ac <_inherent$slice$data__u8>:
     8ac:      	ret

00000000000008b0 <_coil.core.Len$slice$len__u8>:
     8b0:      	mov	x0, x1
     8b4:      	ret

00000000000008b8 <_coil.io.write-all>:
     8b8:      	sub	sp, sp, #0x70
     8bc:      	str	x29, [sp]
     8c0:      	str	x30, [sp, #0x8]
     8c4:      	mov	x29, sp
     8c8:      	str	x19, [sp, #0x18]
     8cc:      	str	x20, [sp, #0x20]
     8d0:      	str	x21, [sp, #0x28]
     8d4:      	str	x22, [sp, #0x30]
     8d8:      	str	x23, [sp, #0x38]
     8dc:      	str	x24, [sp, #0x40]
     8e0:      	str	x25, [sp, #0x48]
     8e4:      	str	x26, [sp, #0x50]
     8e8:      	str	x27, [sp, #0x58]
     8ec:      	str	x28, [sp, #0x60]
     8f0:      	sub	sp, sp, #0x20
     8f4:      	mov	x3, sp
     8f8:      	sub	sp, sp, #0x20
     8fc:      	mov	x19, sp
     900:      	sub	sp, sp, #0x20
     904:      	mov	x20, sp
     908:      	sub	sp, sp, #0x20
     90c:      	mov	x21, sp
     910:      	sub	sp, sp, #0x10
     914:      	mov	x22, sp
     918:      	sub	sp, sp, #0x20
     91c:      	mov	x23, sp
     920:      	sub	sp, sp, #0x20
     924:      	mov	x24, sp
     928:      	sub	sp, sp, #0x20
     92c:      	mov	x25, sp
     930:      	movz	x17, #0x0, lsl #48
     934:      	cmp	x2, x17
     938:      	b.gt	0x9a8 <_coil.io.write-all+0xf0>
     93c:      	orr	x0, x3, xzr
     940:      	movz	w17, #0x0, lsl #16
     944:      	str	w17, [x3]
     948:      	movz	x17, #0x0, lsl #48
     94c:      	str	x17, [x3, #0x8]
     950:      	mov	x26, x8
     954:      	ldr	x1, [x0]
     958:      	str	x1, [x26]
     95c:      	ldr	x1, [x0, #0x8]
     960:      	str	x1, [x26, #0x8]
     964:      	ldr	x0, [x0, #0x10]
     968:      	str	x0, [x26, #0x10]
     96c:      	sub	sp, x29, #0x0
     970:      	ldr	x19, [sp, #0x18]
     974:      	ldr	x20, [sp, #0x20]
     978:      	ldr	x21, [sp, #0x28]
     97c:      	ldr	x22, [sp, #0x30]
     980:      	ldr	x23, [sp, #0x38]
     984:      	ldr	x24, [sp, #0x40]
     988:      	ldr	x25, [sp, #0x48]
     98c:      	ldr	x26, [sp, #0x50]
     990:      	ldr	x27, [sp, #0x58]
     994:      	ldr	x28, [sp, #0x60]
     998:      	ldr	x29, [sp]
     99c:      	ldr	x30, [sp, #0x8]
     9a0:      	add	sp, sp, #0x70
     9a4:      	ret
     9a8:      	mov	x26, x8
     9ac:      	mov	x8, x19
     9b0:      	str	x0, [x29, #0x10]
     9b4:      	mov	x28, x1
     9b8:      	mov	x27, x2
     9bc:      	bl	0x9bc <_coil.io.write-all+0x104>
     9c0:      	ldr	w0, [x19]
     9c4:      	lsr	x16, x0, #0
     9c8:      	cmp	x16, #0x1
     9cc:      	b.eq	0x9e8 <_coil.io.write-all+0x130>
     9d0:      	b.lo	0x9d8 <_coil.io.write-all+0x120>
     9d4:      	b	0x9ec <_coil.io.write-all+0x134>
     9d8:      	cmp	x16, #0x0
     9dc:      	b.eq	0x9e4 <_coil.io.write-all+0x12c>
     9e0:      	b	0x9ec <_coil.io.write-all+0x134>
     9e4:      	b	0xa18 <_coil.io.write-all+0x160>
     9e8:      	b	0x9f0 <_coil.io.write-all+0x138>
     9ec:      	b	0xaec <_coil.io.write-all+0x234>
     9f0:      	orr	x0, x20, xzr
     9f4:      	add	x1, x19, #0x8
     9f8:      	add	x2, x0, #0x8
     9fc:      	ldr	x3, [x19, #0x8]
     a00:      	ldr	x1, [x1, #0x8]
     a04:      	mov	w17, #0x1               ; =1
     a08:      	str	w17, [x20]
     a0c:      	str	x3, [x20, #0x8]
     a10:      	str	x1, [x2, #0x8]
     a14:      	b	0x954 <_coil.io.write-all+0x9c>
     a18:      	ldr	x0, [x19, #0x8]
     a1c:      	orr	x19, x0, xzr
     a20:      	movz	x17, #0x0, lsl #48
     a24:      	cmp	x19, x17
     a28:      	b.gt	0xa58 <_coil.io.write-all+0x1a0>
     a2c:      	orr	x0, x21, xzr
     a30:      	mov	w17, #0x1               ; =1
     a34:      	str	w17, [x21]
     a38:      	add	x1, x0, #0x8
     a3c:      	mov	w17, #0x5               ; =5
     a40:      	str	w17, [x22]
     a44:      	ldr	x2, [x22]
     a48:      	str	x2, [x21, #0x8]
     a4c:      	ldr	x2, [x22, #0x8]
     a50:      	str	x2, [x1, #0x8]
     a54:      	b	0xa14 <_coil.io.write-all+0x15c>
     a58:      	lsr	x0, x19, #0
     a5c:      	sub	x1, x27, x19
     a60:      	add	x0, x0, x28
     a64:      	mov	x8, x23
     a68:      	mov	x2, x1
     a6c:      	mov	x1, x0
     a70:      	ldr	x0, [x29, #0x10]
     a74:      	bl	0xa74 <_coil.io.write-all+0x1bc>
     a78:      	ldr	w0, [x23]
     a7c:      	lsr	x16, x0, #0
     a80:      	cmp	x16, #0x1
     a84:      	b.eq	0xaa0 <_coil.io.write-all+0x1e8>
     a88:      	b.lo	0xa90 <_coil.io.write-all+0x1d8>
     a8c:      	b	0xaa4 <_coil.io.write-all+0x1ec>
     a90:      	cmp	x16, #0x0
     a94:      	b.eq	0xa9c <_coil.io.write-all+0x1e4>
     a98:      	b	0xaa4 <_coil.io.write-all+0x1ec>
     a9c:      	b	0xad0 <_coil.io.write-all+0x218>
     aa0:      	b	0xaa8 <_coil.io.write-all+0x1f0>
     aa4:      	b	0xaf4 <_coil.io.write-all+0x23c>
     aa8:      	orr	x0, x24, xzr
     aac:      	add	x1, x23, #0x8
     ab0:      	add	x2, x0, #0x8
     ab4:      	ldr	x3, [x23, #0x8]
     ab8:      	ldr	x1, [x1, #0x8]
     abc:      	mov	w17, #0x1               ; =1
     ac0:      	str	w17, [x24]
     ac4:      	str	x3, [x24, #0x8]
     ac8:      	str	x1, [x2, #0x8]
     acc:      	b	0xae8 <_coil.io.write-all+0x230>
     ad0:      	orr	x0, x25, xzr
     ad4:      	ldr	x1, [x23, #0x8]
     ad8:      	movz	w17, #0x0, lsl #16
     adc:      	str	w17, [x25]
     ae0:      	add	x1, x1, x19
     ae4:      	str	x1, [x25, #0x8]
     ae8:      	b	0xa54 <_coil.io.write-all+0x19c>
     aec:      	brk	#0
     af0:      	b	0xaec <_coil.io.write-all+0x234>
     af4:      	brk	#0
     af8:      	b	0xaf4 <_coil.io.write-all+0x23c>
     afc:      	udf	#0x0

0000000000000b00 <_coil.fmt.fmt--number__coil.fmt.IntDigits>:
     b00:      	sub	sp, sp, #0xb0
     b04:      	str	x29, [sp]
     b08:      	str	x30, [sp, #0x8]
     b0c:      	mov	x29, sp
     b10:      	str	x19, [sp, #0x60]
     b14:      	str	x20, [sp, #0x68]
     b18:      	str	x21, [sp, #0x70]
     b1c:      	str	x22, [sp, #0x78]
     b20:      	str	x23, [sp, #0x80]
     b24:      	str	x24, [sp, #0x88]
     b28:      	str	x25, [sp, #0x90]
     b2c:      	str	x26, [sp, #0x98]
     b30:      	str	x27, [sp, #0xa0]
     b34:      	str	x28, [sp, #0xa8]
     b38:      	sub	sp, sp, #0x30
     b3c:      	mov	x19, sp
     b40:      	ubfx	x20, x1, #0, #8
     b44:      	orr	x21, x19, xzr
     b48:      	sub	sp, sp, #0x30
     b4c:      	mov	x22, sp
     b50:      	sub	sp, sp, #0x10
     b54:      	mov	x23, sp
     b58:      	sub	sp, sp, #0x10
     b5c:      	mov	x24, sp
     b60:      	sub	sp, sp, #0x10
     b64:      	mov	x25, sp
     b68:      	sub	sp, sp, #0x10
     b6c:      	mov	x26, sp
     b70:      	sub	sp, sp, #0x10
     b74:      	mov	x27, sp
     b78:      	sub	sp, sp, #0x20
     b7c:      	mov	x28, sp
     b80:      	sub	sp, sp, #0x20
     b84:      	mov	x1, sp
     b88:      	sub	sp, sp, #0x20
     b8c:      	mov	x5, sp
     b90:      	sub	sp, sp, #0x20
     b94:      	mov	x6, sp
     b98:      	sub	sp, sp, #0x20
     b9c:      	mov	x7, sp
     ba0:      	sub	sp, sp, #0x20
     ba4:      	mov	x8, sp
     ba8:      	sub	sp, sp, #0x20
     bac:      	mov	x9, sp
     bb0:      	ldr	x10, [x0]
     bb4:      	str	x2, [x29, #0x10]
     bb8:      	str	x4, [x29, #0x20]
     bbc:      	str	x1, [x29, #0x28]
     bc0:      	str	x5, [x29, #0x30]
     bc4:      	str	x6, [x29, #0x38]
     bc8:      	str	x7, [x29, #0x40]
     bcc:      	str	x8, [x29, #0x48]
     bd0:      	mov	x8, x22
     bd4:      	str	x9, [x29, #0x50]
     bd8:      	str	x21, [x29, #0x18]
     bdc:      	mov	x21, x3
     be0:      	str	x28, [x29, #0x58]
     be4:      	mov	x28, x10
     be8:      	bl	0xbe8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0xe8>
     bec:      	ldr	x0, [x22]
     bf0:      	str	x0, [x19]
     bf4:      	ldr	x0, [x22, #0x8]
     bf8:      	str	x0, [x19, #0x8]
     bfc:      	ldr	x1, [x22, #0x10]
     c00:      	str	x1, [x19, #0x10]
     c04:      	ldr	x1, [x22, #0x18]
     c08:      	str	x1, [x19, #0x18]
     c0c:      	ldr	x1, [x22, #0x20]
     c10:      	str	x1, [x19, #0x20]
     c14:      	movz	x17, #0x0, lsl #48
     c18:      	cmp	x20, x17
     c1c:      	b.eq	0xdf0 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x2f0>
     c20:      	orr	x1, x23, xzr
     c24:      	adrp	x16, 0x0 <_gap_avec_get>
     c28:      	ldr	x16, [x16]
     c2c:      	orr	x2, x16, xzr
     c30:      	str	x2, [x23]
     c34:      	mov	x17, #0x1               ; =1
     c38:      	str	x17, [x23, #0x8]
     c3c:      	mov	x20, x1
     c40:      	b	0xc64 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x164>
     c44:      	orr	x1, x25, xzr
     c48:      	adrp	x16, 0x0 <_gap_avec_get>
     c4c:      	ldr	x16, [x16]
     c50:      	orr	x2, x16, xzr
     c54:      	str	x2, [x25]
     c58:      	movz	x17, #0x0, lsl #48
     c5c:      	str	x17, [x25, #0x8]
     c60:      	mov	x20, x1
     c64:      	ldr	x1, [x19]
     c68:      	movz	x17, #0x0, lsl #48
     c6c:      	cmp	x1, x17
     c70:      	b.ge	0xe58 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x358>
     c74:      	ldr	x1, [x20]
     c78:      	ldr	x2, [x20, #0x8]
     c7c:      	ldr	x8, [x29, #0x58]
     c80:      	mov	x22, x0
     c84:      	mov	x0, x28
     c88:      	bl	0xc88 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x188>
     c8c:      	ldr	x8, [x29, #0x28]
     c90:      	mov	x0, x28
     c94:      	ldr	x1, [x29, #0x10]
     c98:      	mov	x2, x21
     c9c:      	bl	0xc9c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x19c>
     ca0:      	ldr	x0, [x29, #0x20]
     ca4:      	mov	x1, x28
     ca8:      	mov	x2, x22
     cac:      	bl	0xcac <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1ac>
     cb0:      	b	0xd24 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x224>
     cb4:      	mov	x0, x28
     cb8:      	ldr	x1, [x29, #0x18]
     cbc:      	mov	x2, x23
     cc0:      	movz	x3, #0x0, lsl #48
     cc4:      	uxtb	w3, w3
     cc8:      	bl	0xcc8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1c8>
     ccc:      	ldr	x0, [x20]
     cd0:      	ldr	x1, [x20, #0x8]
     cd4:      	ldr	x8, [x29, #0x48]
     cd8:      	mov	x2, x1
     cdc:      	mov	x1, x0
     ce0:      	mov	x0, x28
     ce4:      	bl	0xce4 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1e4>
     ce8:      	ldr	x8, [x29, #0x50]
     cec:      	mov	x0, x28
     cf0:      	ldr	x1, [x29, #0x10]
     cf4:      	mov	x2, x21
     cf8:      	bl	0xcf8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1f8>
     cfc:      	ldr	x0, [x29, #0x20]
     d00:      	mov	x1, x28
     d04:      	mov	x2, x22
     d08:      	bl	0xd08 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x208>
     d0c:      	mov	x0, x28
     d10:      	ldr	x1, [x29, #0x18]
     d14:      	mov	x2, x23
     d18:      	movz	x3, #0x0, lsl #48
     d1c:      	uxtb	w3, w3
     d20:      	bl	0xd20 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x220>
     d24:      	sub	sp, x29, #0x0
     d28:      	ldr	x19, [sp, #0x60]
     d2c:      	ldr	x20, [sp, #0x68]
     d30:      	ldr	x21, [sp, #0x70]
     d34:      	ldr	x22, [sp, #0x78]
     d38:      	ldr	x23, [sp, #0x80]
     d3c:      	ldr	x24, [sp, #0x88]
     d40:      	ldr	x25, [sp, #0x90]
     d44:      	ldr	x26, [sp, #0x98]
     d48:      	ldr	x27, [sp, #0xa0]
     d4c:      	ldr	x28, [sp, #0xa8]
     d50:      	ldr	x29, [sp]
     d54:      	ldr	x30, [sp, #0x8]
     d58:      	add	sp, sp, #0xb0
     d5c:      	ret
     d60:      	orr	x0, x26, xzr
     d64:      	adrp	x16, 0x0 <_gap_avec_get>
     d68:      	ldr	x16, [x16]
     d6c:      	orr	x1, x16, xzr
     d70:      	movz	x17, #0x0, lsl #48
     d74:      	str	x17, [x27]
     d78:      	str	x1, [x26]
     d7c:      	str	x27, [x26, #0x8]
     d80:      	mov	x1, x0
     d84:      	ldr	x0, [x29, #0x20]
     d88:      	mov	x2, x22
     d8c:      	bl	0xd8c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x28c>
     d90:      	ldr	x0, [x20, #0x8]
     d94:      	ldr	x1, [x27]
     d98:      	ldrb	w2, [x19, #0x21]
     d9c:      	add	x1, x1, x21
     da0:      	add	x23, x1, x0
     da4:      	movz	x17, #0x0, lsl #48
     da8:      	cmp	x2, x17
     dac:      	b.eq	0xcb4 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1b4>
     db0:      	ldr	x0, [x20]
     db4:      	ldr	x1, [x20, #0x8]
     db8:      	ldr	x8, [x29, #0x30]
     dbc:      	mov	x2, x1
     dc0:      	mov	x1, x0
     dc4:      	mov	x0, x28
     dc8:      	bl	0xdc8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x2c8>
     dcc:      	ldr	x8, [x29, #0x38]
     dd0:      	mov	x0, x28
     dd4:      	ldr	x1, [x29, #0x10]
     dd8:      	mov	x2, x21
     ddc:      	bl	0xddc <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x2dc>
     de0:      	ldr	x0, [x19]
     de4:      	sub	x19, x0, x23
     de8:      	movn	x0, #0x0, lsl #48
     dec:      	b	0xe38 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x338>
     df0:      	ldrb	w1, [x19, #0x20]
     df4:      	movz	x17, #0x0, lsl #48
     df8:      	cmp	x1, x17
     dfc:      	b.eq	0xc44 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x144>
     e00:      	orr	x1, x24, xzr
     e04:      	adrp	x16, 0x0 <_gap_avec_get>
     e08:      	ldr	x16, [x16]
     e0c:      	orr	x2, x16, xzr
     e10:      	str	x2, [x24]
     e14:      	mov	x17, #0x1               ; =1
     e18:      	str	x17, [x24, #0x8]
     e1c:      	b	0xc60 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x160>
     e20:      	ldr	x8, [x29, #0x40]
     e24:      	mov	x0, x28
     e28:      	mov	x1, #0x30               ; =48
     e2c:      	uxtb	w1, w1
     e30:      	bl	0xe30 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x330>
     e34:      	mov	x0, x20
     e38:      	add	x20, x0, #0x1
     e3c:      	cmp	x20, x19
     e40:      	b.lt	0xe20 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x320>
     e44:      	ldr	x0, [x29, #0x20]
     e48:      	mov	x1, x28
     e4c:      	mov	x2, x22
     e50:      	bl	0xe50 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x350>
     e54:      	b	0xd24 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x224>
     e58:      	mov	x22, x0
     e5c:      	b	0xd60 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x260>

0000000000000e60 <_coil.panic.finish-stderr!>:
     e60:      	sub	sp, sp, #0x40
     e64:      	str	x29, [sp]
     e68:      	str	x30, [sp, #0x8]
     e6c:      	mov	x29, sp
     e70:      	str	x19, [sp, #0x10]
     e74:      	str	x20, [sp, #0x18]
     e78:      	str	x21, [sp, #0x20]
     e7c:      	str	x22, [sp, #0x28]
     e80:      	str	x23, [sp, #0x30]
     e84:      	str	x24, [sp, #0x38]
     e88:      	adrp	x16, 0x0 <_gap_avec_get>
     e8c:      	ldr	x16, [x16]
     e90:      	orr	x19, x16, xzr
     e94:      	adrp	x16, 0x0 <_gap_avec_get>
     e98:      	ldr	x16, [x16]
     e9c:      	orr	x20, x16, xzr
     ea0:      	adrp	x16, 0x0 <_gap_avec_get>
     ea4:      	ldr	x16, [x16]
     ea8:      	add	x21, x16, #0x8
     eac:      	mov	x22, x0
     eb0:      	mov	x23, x1
     eb4:      	mov	x1, x19
     eb8:      	mov	x0, #0x2                ; =2
     ebc:      	mov	x2, #0x1                ; =1
     ec0:      	bl	0xec0 <_coil.panic.finish-stderr!+0x60>
     ec4:      	adrp	x16, 0x0 <_gap_avec_get>
     ec8:      	ldr	x16, [x16]
     ecc:      	ldr	x24, [x16]
     ed0:      	ldr	x21, [x21]
     ed4:      	movz	x17, #0x0, lsl #48
     ed8:      	cmp	x23, x17
     edc:      	b.le	0xf1c <_coil.panic.finish-stderr!+0xbc>
     ee0:      	mov	x1, x20
     ee4:      	mov	x0, #0x2                ; =2
     ee8:      	mov	x2, #0x5                ; =5
     eec:      	bl	0xeec <_coil.panic.finish-stderr!+0x8c>
     ef0:      	mov	x1, x22
     ef4:      	mov	x2, x23
     ef8:      	mov	x0, #0x2                ; =2
     efc:      	bl	0xefc <_coil.panic.finish-stderr!+0x9c>
     f00:      	mov	x1, x19
     f04:      	mov	x0, #0x2                ; =2
     f08:      	mov	x2, #0x1                ; =1
     f0c:      	bl	0xf0c <_coil.panic.finish-stderr!+0xac>
     f10:      	bl	0xf10 <_coil.panic.finish-stderr!+0xb0>
     f14:      	bl	0xf14 <_coil.panic.finish-stderr!+0xb4>
     f18:      	b	0xf18 <_coil.panic.finish-stderr!+0xb8>
     f1c:      	movz	x17, #0x0, lsl #48
     f20:      	cmp	x21, x17
     f24:      	b.le	0xf68 <_coil.panic.finish-stderr!+0x108>
     f28:      	adrp	x16, 0x0 <_gap_avec_get>
     f2c:      	ldr	x16, [x16]
     f30:      	orr	x19, x16, xzr
     f34:      	mov	x1, x20
     f38:      	mov	x0, #0x2                ; =2
     f3c:      	mov	x2, #0x5                ; =5
     f40:      	bl	0xf40 <_coil.panic.finish-stderr!+0xe0>
     f44:      	mov	x1, x24
     f48:      	mov	x2, x21
     f4c:      	mov	x0, #0x2                ; =2
     f50:      	bl	0xf50 <_coil.panic.finish-stderr!+0xf0>
     f54:      	mov	x1, x19
     f58:      	mov	x0, #0x2                ; =2
     f5c:      	mov	x2, #0x13               ; =19
     f60:      	bl	0xf60 <_coil.panic.finish-stderr!+0x100>
     f64:      	b	0xf10 <_coil.panic.finish-stderr!+0xb0>
     f68:      	adrp	x16, 0x0 <_gap_avec_get>
     f6c:      	ldr	x16, [x16]
     f70:      	orr	x0, x16, xzr
     f74:      	mov	x1, x0
     f78:      	mov	x0, #0x2                ; =2
     f7c:      	mov	x2, #0x40               ; =64
     f80:      	bl	0xf80 <_coil.panic.finish-stderr!+0x120>
     f84:      	b	0xf10 <_coil.panic.finish-stderr!+0xb0>

0000000000000f88 <_coil.os.errno>:
     f88:      	sub	sp, sp, #0x10
     f8c:      	str	x29, [sp]
     f90:      	str	x30, [sp, #0x8]
     f94:      	mov	x29, sp
     f98:      	adrp	x16, 0x0 <_gap_avec_get>
     f9c:      	ldr	x16, [x16]
     fa0:      	orr	x0, x16, xzr
     fa4:      	mov	x1, #-0x2               ; =-2
     fa8:      	bl	0xfa8 <_coil.os.errno+0x20>
     fac:      	ldr	w0, [x0]
     fb0:      	sxtw	x0, w0
     fb4:      	ldr	x29, [sp]
     fb8:      	ldr	x30, [sp, #0x8]
     fbc:      	add	sp, sp, #0x10
     fc0:      	ret

0000000000000fc4 <_coil.io.fd-retry?>:
     fc4:      	sub	sp, sp, #0x10
     fc8:      	str	x29, [sp]
     fcc:      	str	x30, [sp, #0x8]
     fd0:      	mov	x29, sp
     fd4:      	mov	x17, #0x4               ; =4
     fd8:      	cmp	x1, x17
     fdc:      	b.ne	0xffc <_coil.io.fd-retry?+0x38>
     fe0:      	mov	x0, #0x1                ; =1
     fe4:      	b	0xfec <_coil.io.fd-retry?+0x28>
     fe8:      	movz	x0, #0x0, lsl #48
     fec:      	ldr	x29, [sp]
     ff0:      	ldr	x30, [sp, #0x8]
     ff4:      	add	sp, sp, #0x10
     ff8:      	ret
     ffc:      	mov	x17, #0x23              ; =35
    1000:      	cmp	x1, x17
    1004:      	b.ne	0xfe8 <_coil.io.fd-retry?+0x24>
    1008:      	lsr	w0, w0, #0
    100c:      	uxth	w2, w2
    1010:      	mov	w1, w2
    1014:      	mov	x2, #-0x2               ; =-2
    1018:      	uxth	w1, w1
    101c:      	bl	0x101c <_coil.io.fd-retry?+0x58>
    1020:      	b	0xfec <_coil.io.fd-retry?+0x28>

0000000000001024 <_coil.fmt.plain-format-spec>:
    1024:      	sub	sp, sp, #0x10
    1028:      	str	x29, [sp]
    102c:      	str	x30, [sp, #0x8]
    1030:      	mov	x29, sp
    1034:      	sub	sp, sp, #0x30
    1038:      	mov	x0, sp
    103c:      	sub	sp, sp, #0x10
    1040:      	mov	x1, sp
    1044:      	movz	x17, #0x0, lsl #48
    1048:      	str	x17, [x0]
    104c:      	movz	x17, #0x0, lsl #48
    1050:      	str	x17, [x0, #0x8]
    1054:      	movz	x17, #0x0, lsl #48
    1058:      	str	x17, [x0, #0x10]
    105c:      	movz	x17, #0x0, lsl #48
    1060:      	str	x17, [x0, #0x18]
    1064:      	movz	x17, #0x0, lsl #48
    1068:      	str	x17, [x0, #0x20]
    106c:      	movn	x17, #0x0, lsl #48
    1070:      	str	x17, [x0]
    1074:      	movn	x17, #0x0, lsl #48
    1078:      	str	x17, [x0, #0x8]
    107c:      	mov	w17, #0x20              ; =32
    1080:      	str	w17, [x0, #0x10]
    1084:      	movz	w17, #0x0, lsl #16
    1088:      	str	w17, [x1]
    108c:      	ldr	x1, [x1]
    1090:      	str	x1, [x0, #0x18]
    1094:      	movz	w17, #0x0, lsl #16
    1098:      	strb	w17, [x0, #0x20]
    109c:      	movz	w17, #0x0, lsl #16
    10a0:      	strb	w17, [x0, #0x21]
    10a4:      	ldr	x2, [x0]
    10a8:      	ldr	x3, [x0, #0x8]
    10ac:      	ldr	x4, [x0, #0x10]
    10b0:      	ldr	x0, [x0, #0x20]
    10b4:      	str	x2, [x8]
    10b8:      	str	x3, [x8, #0x8]
    10bc:      	str	x4, [x8, #0x10]
    10c0:      	str	x1, [x8, #0x18]
    10c4:      	str	x0, [x8, #0x20]
    10c8:      	sub	sp, x29, #0x0
    10cc:      	ldr	x29, [sp]
    10d0:      	ldr	x30, [sp, #0x8]
    10d4:      	add	sp, sp, #0x10
    10d8:      	ret

00000000000010dc <_coil.io.write-some>:
    10dc:      	sub	sp, sp, #0x20
    10e0:      	str	x29, [sp]
    10e4:      	str	x30, [sp, #0x8]
    10e8:      	mov	x29, sp
    10ec:      	str	x19, [sp, #0x10]
    10f0:      	str	x20, [sp, #0x18]
    10f4:      	sub	sp, sp, #0x20
    10f8:      	mov	x19, sp
    10fc:      	ldr	x3, [x0]
    1100:      	ldr	x0, [x0, #0x8]
    1104:      	mov	x30, x3
    1108:      	mov	x20, x8
    110c:      	mov	x8, x19
    1110:      	blr	x30
    1114:      	ldr	x0, [x19]
    1118:      	str	x0, [x20]
    111c:      	ldr	x0, [x19, #0x8]
    1120:      	str	x0, [x20, #0x8]
    1124:      	ldr	x0, [x19, #0x10]
    1128:      	str	x0, [x20, #0x10]
    112c:      	sub	sp, x29, #0x0
    1130:      	ldr	x19, [sp, #0x10]
    1134:      	ldr	x20, [sp, #0x18]
    1138:      	ldr	x29, [sp]
    113c:      	ldr	x30, [sp, #0x8]
    1140:      	add	sp, sp, #0x20
    1144:      	ret

0000000000001148 <_inherent$coil.fmt.Formatter$writer>:
    1148:      	ldr	x0, [x0]
    114c:      	ret

0000000000001150 <_inherent$coil.fmt.Formatter$take-spec!>:
    1150:      	sub	sp, sp, #0x20
    1154:      	str	x29, [sp]
    1158:      	str	x30, [sp, #0x8]
    115c:      	mov	x29, sp
    1160:      	str	x19, [sp, #0x10]
    1164:      	str	x20, [sp, #0x18]
    1168:      	sub	sp, sp, #0x30
    116c:      	mov	x1, sp
    1170:      	sub	sp, sp, #0x30
    1174:      	mov	x2, sp
    1178:      	ldrb	w3, [x0, #0x40]
    117c:      	movz	x17, #0x0, lsl #48
    1180:      	cmp	x3, x17
    1184:      	b.eq	0x11cc <_inherent$coil.fmt.Formatter$take-spec!+0x7c>
    1188:      	orr	x2, x1, xzr
    118c:      	add	x3, x0, #0x18
    1190:      	movz	w17, #0x0, lsl #16
    1194:      	strb	w17, [x0, #0x40]
    1198:      	ldr	x0, [x0, #0x18]
    119c:      	str	x0, [x1]
    11a0:      	ldr	x0, [x3, #0x8]
    11a4:      	str	x0, [x1, #0x8]
    11a8:      	ldr	x0, [x3, #0x10]
    11ac:      	str	x0, [x1, #0x10]
    11b0:      	ldr	x0, [x3, #0x18]
    11b4:      	str	x0, [x1, #0x18]
    11b8:      	ldr	x0, [x3, #0x20]
    11bc:      	str	x0, [x1, #0x20]
    11c0:      	mov	x20, x8
    11c4:      	mov	x0, x2
    11c8:      	b	0x11e0 <_inherent$coil.fmt.Formatter$take-spec!+0x90>
    11cc:      	orr	x19, x2, xzr
    11d0:      	mov	x20, x8
    11d4:      	mov	x8, x2
    11d8:      	bl	0x11d8 <_inherent$coil.fmt.Formatter$take-spec!+0x88>
    11dc:      	mov	x0, x19
    11e0:      	ldr	x1, [x0]
    11e4:      	str	x1, [x20]
    11e8:      	ldr	x1, [x0, #0x8]
    11ec:      	str	x1, [x20, #0x8]
    11f0:      	ldr	x1, [x0, #0x10]
    11f4:      	str	x1, [x20, #0x10]
    11f8:      	ldr	x1, [x0, #0x18]
    11fc:      	str	x1, [x20, #0x18]
    1200:      	ldr	x0, [x0, #0x20]
    1204:      	str	x0, [x20, #0x20]
    1208:      	sub	sp, x29, #0x0
    120c:      	ldr	x19, [sp, #0x10]
    1210:      	ldr	x20, [sp, #0x18]
    1214:      	ldr	x29, [sp]
    1218:      	ldr	x30, [sp, #0x8]
    121c:      	add	sp, sp, #0x20
    1220:      	ret

0000000000001224 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits>:
    1224:      	sub	sp, sp, #0x10
    1228:      	str	x29, [sp]
    122c:      	str	x30, [sp, #0x8]
    1230:      	mov	x29, sp
    1234:      	sub	sp, sp, #0x20
    1238:      	mov	x2, sp
    123c:      	sub	sp, sp, #0x20
    1240:      	mov	x3, sp
    1244:      	sub	sp, sp, #0x20
    1248:      	mov	x4, sp
    124c:      	ldr	w5, [x0]
    1250:      	lsr	x16, x5, #0
    1254:      	cmp	x16, #0x2
    1258:      	b.hi	0x1284 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x60>
    125c:      	adr	x17, 0x126c <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x48>
    1260:      	ldrsw	x16, [x17, x16, lsl #2]
    1264:      	add	x16, x17, x16
    1268:      	br	x16
    126c:      	udf	#0xc
    1270:      	udf	#0x10
    1274:      	udf	#0x14
    1278:      	b	0x1288 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x64>
    127c:      	b	0x12a4 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x80>
    1280:      	b	0x12c0 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x9c>
    1284:      	b	0x12f8 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xd4>
    1288:      	ldr	x0, [x0, #0x8]
    128c:      	mov	x8, x2
    1290:      	fmov	d31, x0
    1294:      	mov	x0, x1
    1298:      	fmov	x1, d31
    129c:      	bl	0x129c <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x78>
    12a0:      	b	0x12e0 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xbc>
    12a4:      	ldr	x0, [x0, #0x8]
    12a8:      	mov	x8, x3
    12ac:      	fmov	d31, x0
    12b0:      	mov	x0, x1
    12b4:      	fmov	x1, d31
    12b8:      	bl	0x12b8 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x94>
    12bc:      	b	0x12e0 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xbc>
    12c0:      	add	x2, x0, #0x8
    12c4:      	ldr	x0, [x0, #0x8]
    12c8:      	ldr	x2, [x2, #0x8]
    12cc:      	mov	x8, x4
    12d0:      	fmov	d31, x0
    12d4:      	mov	x0, x1
    12d8:      	fmov	x1, d31
    12dc:      	bl	0x12dc <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xb8>
    12e0:      	movz	x0, #0x0, lsl #48
    12e4:      	sub	sp, x29, #0x0
    12e8:      	ldr	x29, [sp]
    12ec:      	ldr	x30, [sp, #0x8]
    12f0:      	add	sp, sp, #0x10
    12f4:      	ret
    12f8:      	brk	#0
    12fc:      	b	0x12f8 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xd4>

0000000000001300 <_coil.fmt.counting-writer>:
    1300:      	adrp	x16, 0x1000 <_coil.io.fd-retry?+0x3c>
    1304:      	ldr	x16, [x16]
    1308:      	orr	x2, x16, xzr
    130c:      	movz	x17, #0x0, lsl #48
    1310:      	str	x17, [x1]
    1314:      	str	x2, [x0]
    1318:      	str	x1, [x0, #0x8]
    131c:      	ret

0000000000001320 <_coil.io.write-byte>:
    1320:      	sub	sp, sp, #0x20
    1324:      	str	x29, [sp]
    1328:      	str	x30, [sp, #0x8]
    132c:      	mov	x29, sp
    1330:      	str	x19, [sp, #0x10]
    1334:      	str	x20, [sp, #0x18]
    1338:      	sub	sp, sp, #0x10
    133c:      	mov	x2, sp
    1340:      	orr	x3, x2, xzr
    1344:      	sub	sp, sp, #0x20
    1348:      	mov	x19, sp
    134c:      	strb	w1, [x2]
    1350:      	mov	x1, x3
    1354:      	mov	x20, x8
    1358:      	mov	x8, x19
    135c:      	mov	x2, #0x1                ; =1
    1360:      	bl	0x1360 <_coil.io.write-byte+0x40>
    1364:      	ldr	x0, [x19]
    1368:      	str	x0, [x20]
    136c:      	ldr	x0, [x19, #0x8]
    1370:      	str	x0, [x20, #0x8]
    1374:      	ldr	x0, [x19, #0x10]
    1378:      	str	x0, [x20, #0x10]
    137c:      	sub	sp, x29, #0x0
    1380:      	ldr	x19, [sp, #0x10]
    1384:      	ldr	x20, [sp, #0x18]
    1388:      	ldr	x29, [sp]
    138c:      	ldr	x30, [sp, #0x8]
    1390:      	add	sp, sp, #0x20
    1394:      	ret

0000000000001398 <_coil.fmt.fmt--pad-before>:
    1398:      	sub	sp, sp, #0x10
    139c:      	str	x29, [sp]
    13a0:      	str	x30, [sp, #0x8]
    13a4:      	mov	x29, sp
    13a8:      	ldr	x4, [x1]
    13ac:      	sub	x2, x4, x2
    13b0:      	movz	x17, #0x0, lsl #48
    13b4:      	cmp	x2, x17
    13b8:      	b.le	0x1418 <_coil.fmt.fmt--pad-before+0x80>
    13bc:      	ldr	x4, [x1, #0x18]
    13c0:      	lsr	w4, w4, #0
    13c4:      	lsr	x16, x4, #0
    13c8:      	cmp	x16, #0x3
    13cc:      	b.hi	0x1400 <_coil.fmt.fmt--pad-before+0x68>
    13d0:      	adr	x17, 0x13e0 <_coil.fmt.fmt--pad-before+0x48>
    13d4:      	ldrsw	x16, [x17, x16, lsl #2]
    13d8:      	add	x16, x17, x16
    13dc:      	br	x16
    13e0:      	udf	#0x10
    13e4:      	udf	#0x14
    13e8:      	udf	#0x18
    13ec:      	udf	#0x1c
    13f0:      	b	0x142c <_coil.fmt.fmt--pad-before+0x94>
    13f4:      	b	0x1418 <_coil.fmt.fmt--pad-before+0x80>
    13f8:      	b	0x1404 <_coil.fmt.fmt--pad-before+0x6c>
    13fc:      	b	0x140c <_coil.fmt.fmt--pad-before+0x74>
    1400:      	b	0x1444 <_coil.fmt.fmt--pad-before+0xac>
    1404:      	bl	0x1404 <_coil.fmt.fmt--pad-before+0x6c>
    1408:      	b	0x1418 <_coil.fmt.fmt--pad-before+0x80>
    140c:      	mov	x17, #0x2               ; =2
    1410:      	sdiv	x2, x2, x17
    1414:      	bl	0x1414 <_coil.fmt.fmt--pad-before+0x7c>
    1418:      	movz	x0, #0x0, lsl #48
    141c:      	ldr	x29, [sp]
    1420:      	ldr	x30, [sp, #0x8]
    1424:      	add	sp, sp, #0x10
    1428:      	ret
    142c:      	ubfx	x3, x3, #0, #8
    1430:      	movz	x17, #0x0, lsl #48
    1434:      	cmp	x3, x17
    1438:      	b.ne	0x1418 <_coil.fmt.fmt--pad-before+0x80>
    143c:      	bl	0x143c <_coil.fmt.fmt--pad-before+0xa4>
    1440:      	b	0x1418 <_coil.fmt.fmt--pad-before+0x80>
    1444:      	brk	#0
    1448:      	b	0x1444 <_coil.fmt.fmt--pad-before+0xac>

000000000000144c <_coil.fmt.fmt--pad-after>:
    144c:      	sub	sp, sp, #0x10
    1450:      	str	x29, [sp]
    1454:      	str	x30, [sp, #0x8]
    1458:      	mov	x29, sp
    145c:      	ldr	x4, [x1]
    1460:      	sub	x2, x4, x2
    1464:      	movz	x17, #0x0, lsl #48
    1468:      	cmp	x2, x17
    146c:      	b.le	0x14d0 <_coil.fmt.fmt--pad-after+0x84>
    1470:      	ldr	x4, [x1, #0x18]
    1474:      	lsr	w4, w4, #0
    1478:      	lsr	x16, x4, #0
    147c:      	cmp	x16, #0x3
    1480:      	b.hi	0x14b4 <_coil.fmt.fmt--pad-after+0x68>
    1484:      	adr	x17, 0x1494 <_coil.fmt.fmt--pad-after+0x48>
    1488:      	ldrsw	x16, [x17, x16, lsl #2]
    148c:      	add	x16, x17, x16
    1490:      	br	x16
    1494:      	udf	#0x10
    1498:      	udf	#0x14
    149c:      	udf	#0x18
    14a0:      	udf	#0x1c
    14a4:      	b	0x14e4 <_coil.fmt.fmt--pad-after+0x98>
    14a8:      	b	0x14b8 <_coil.fmt.fmt--pad-after+0x6c>
    14ac:      	b	0x14d0 <_coil.fmt.fmt--pad-after+0x84>
    14b0:      	b	0x14c0 <_coil.fmt.fmt--pad-after+0x74>
    14b4:      	b	0x14fc <_coil.fmt.fmt--pad-after+0xb0>
    14b8:      	bl	0x14b8 <_coil.fmt.fmt--pad-after+0x6c>
    14bc:      	b	0x14d0 <_coil.fmt.fmt--pad-after+0x84>
    14c0:      	mov	x17, #0x2               ; =2
    14c4:      	sdiv	x3, x2, x17
    14c8:      	sub	x2, x2, x3
    14cc:      	bl	0x14cc <_coil.fmt.fmt--pad-after+0x80>
    14d0:      	movz	x0, #0x0, lsl #48
    14d4:      	ldr	x29, [sp]
    14d8:      	ldr	x30, [sp, #0x8]
    14dc:      	add	sp, sp, #0x10
    14e0:      	ret
    14e4:      	ubfx	x3, x3, #0, #8
    14e8:      	movz	x17, #0x0, lsl #48
    14ec:      	cmp	x3, x17
    14f0:      	b.eq	0x14d0 <_coil.fmt.fmt--pad-after+0x84>
    14f4:      	bl	0x14f4 <_coil.fmt.fmt--pad-after+0xa8>
    14f8:      	b	0x14d0 <_coil.fmt.fmt--pad-after+0x84>
    14fc:      	brk	#0
    1500:      	b	0x14fc <_coil.fmt.fmt--pad-after+0xb0>

0000000000001504 <_coil.panic.site-cell>:
    1504:      	adrp	x16, 0x1000 <_coil.io.fd-retry?+0x3c>
    1508:      	ldr	x16, [x16]
    150c:      	orr	x0, x16, xzr
    1510:      	ret

0000000000001514 <_coil.panic.put-trace!>:
    1514:      	sub	sp, sp, #0x10
    1518:      	str	x29, [sp]
    151c:      	str	x30, [sp, #0x8]
    1520:      	mov	x29, sp
    1524:      	bl	0x1524 <_coil.panic.put-trace!+0x10>
    1528:      	ldr	x29, [sp]
    152c:      	ldr	x30, [sp, #0x8]
    1530:      	add	sp, sp, #0x10
    1534:      	ret

0000000000001538 <_coil.os.errno-cell>:
    1538:      	sub	sp, sp, #0x10
    153c:      	str	x29, [sp]
    1540:      	str	x30, [sp, #0x8]
    1544:      	mov	x29, sp
    1548:      	adrp	x16, 0x1000 <_coil.io.fd-retry?+0x3c>
    154c:      	ldr	x16, [x16]
    1550:      	orr	x0, x16, xzr
    1554:      	mov	x1, #-0x2               ; =-2
    1558:      	bl	0x1558 <_coil.os.errno-cell+0x20>
    155c:      	ldr	x29, [sp]
    1560:      	ldr	x30, [sp, #0x8]
    1564:      	add	sp, sp, #0x10
    1568:      	ret

000000000000156c <_coil.io.poll-one>:
    156c:      	sub	sp, sp, #0x40
    1570:      	str	x29, [sp]
    1574:      	str	x30, [sp, #0x8]
    1578:      	mov	x29, sp
    157c:      	str	x19, [sp, #0x10]
    1580:      	str	x20, [sp, #0x18]
    1584:      	str	x21, [sp, #0x20]
    1588:      	str	x22, [sp, #0x28]
    158c:      	str	x23, [sp, #0x30]
    1590:      	adrp	x16, 0x1000 <_coil.io.fd-retry?+0x3c>
    1594:      	ldr	x16, [x16]
    1598:      	orr	x19, x16, xzr
    159c:      	sub	sp, sp, #0x10
    15a0:      	mov	x20, sp
    15a4:      	mov	w21, w0
    15a8:      	mov	x0, x19
    15ac:      	mov	w22, w1
    15b0:      	mov	x23, x2
    15b4:      	bl	0x15b4 <_coil.io.poll-one+0x48>
    15b8:      	movz	x17, #0x0, lsl #48
    15bc:      	cmp	x0, x17
    15c0:      	b.ne	0x15f4 <_coil.io.poll-one+0x88>
    15c4:      	adrp	x16, 0x1000 <_coil.io.fd-retry?+0x3c>
    15c8:      	ldr	x16, [x16]
    15cc:      	orr	x0, x16, xzr
    15d0:      	mov	x1, x0
    15d4:      	mov	x0, x23
    15d8:      	bl	0x15d8 <_coil.io.poll-one+0x6c>
    15dc:      	mov	x1, x0
    15e0:      	fmov	d31, x0
    15e4:      	mov	x0, x19
    15e8:      	fmov	x19, d31
    15ec:      	bl	0x15ec <_coil.io.poll-one+0x80>
    15f0:      	mov	x0, x19
    15f4:      	orr	x1, x20, xzr
    15f8:      	lsr	w21, w21, #0
    15fc:      	uxth	w22, w22
    1600:      	str	w21, [x20]
    1604:      	strh	w22, [x20, #0x4]
    1608:      	movz	w17, #0x0, lsl #16
    160c:      	strh	w17, [x20, #0x6]
    1610:      	movz	x17, #0x0, lsl #48
    1614:      	cmp	x0, x17
    1618:      	b.ne	0x1678 <_coil.io.poll-one+0x10c>
    161c:      	movz	x0, #0x0, lsl #48
    1620:      	b	0x1650 <_coil.io.poll-one+0xe4>
    1624:      	adrp	x16, 0x1000 <_coil.io.fd-retry?+0x3c>
    1628:      	ldr	x16, [x16]
    162c:      	orr	x0, x16, xzr
    1630:      	mov	x1, #-0x2               ; =-2
    1634:      	bl	0x1634 <_coil.io.poll-one+0xc8>
    1638:      	ldr	w0, [x0]
    163c:      	sxtw	x0, w0
    1640:      	mov	x17, #0x4               ; =4
    1644:      	cmp	x0, x17
    1648:      	cset	w0, eq
    164c:      	ubfx	x0, x0, #0, #8
    1650:      	sub	sp, x29, #0x0
    1654:      	ldr	x19, [sp, #0x10]
    1658:      	ldr	x20, [sp, #0x18]
    165c:      	ldr	x21, [sp, #0x20]
    1660:      	ldr	x22, [sp, #0x28]
    1664:      	ldr	x23, [sp, #0x30]
    1668:      	ldr	x29, [sp]
    166c:      	ldr	x30, [sp, #0x8]
    1670:      	add	sp, sp, #0x40
    1674:      	ret
    1678:      	mov	x30, x0
    167c:      	mov	x0, x1
    1680:      	mov	x1, #0x1                ; =1
    1684:      	mov	x2, #0xffff             ; =65535
    1688:      	movk	x2, #0xffff, lsl #16
    168c:      	blr	x30
    1690:      	lsr	w0, w0, #0
    1694:      	sxtw	x0, w0
    1698:      	movz	x17, #0x0, lsl #48
    169c:      	cmp	x0, x17
    16a0:      	b.lt	0x1624 <_coil.io.poll-one+0xb8>
    16a4:      	mov	x0, #0x1                ; =1
    16a8:      	b	0x1650 <_coil.io.poll-one+0xe4>

00000000000016ac <_coil.fmt.print-u>:
    16ac:      	sub	sp, sp, #0x20
    16b0:      	str	x29, [sp]
    16b4:      	str	x30, [sp, #0x8]
    16b8:      	mov	x29, sp
    16bc:      	str	x19, [sp, #0x10]
    16c0:      	str	x20, [sp, #0x18]
    16c4:      	sub	sp, sp, #0x20
    16c8:      	mov	x2, sp
    16cc:      	sub	sp, sp, #0x20
    16d0:      	mov	x3, sp
    16d4:      	movz	x17, #0x0, lsl #48
    16d8:      	cmp	x1, x17
    16dc:      	b.ne	0x1744 <_coil.fmt.print-u+0x98>
    16e0:      	orr	x19, x2, xzr
    16e4:      	mov	x20, x8
    16e8:      	mov	x8, x2
    16ec:      	mov	x1, #0x30               ; =48
    16f0:      	uxtb	w1, w1
    16f4:      	bl	0x16f4 <_coil.fmt.print-u+0x48>
    16f8:      	mov	x0, x19
    16fc:      	b	0x1710 <_coil.fmt.print-u+0x64>
    1700:      	orr	x19, x3, xzr
    1704:      	mov	x8, x3
    1708:      	bl	0x1708 <_coil.fmt.print-u+0x5c>
    170c:      	mov	x0, x19
    1710:      	ldr	x1, [x0]
    1714:      	str	x1, [x20]
    1718:      	ldr	x1, [x0, #0x8]
    171c:      	str	x1, [x20, #0x8]
    1720:      	ldr	x0, [x0, #0x10]
    1724:      	str	x0, [x20, #0x10]
    1728:      	sub	sp, x29, #0x0
    172c:      	ldr	x19, [sp, #0x10]
    1730:      	ldr	x20, [sp, #0x18]
    1734:      	ldr	x29, [sp]
    1738:      	ldr	x30, [sp, #0x8]
    173c:      	add	sp, sp, #0x20
    1740:      	ret
    1744:      	mov	x20, x8
    1748:      	b	0x1700 <_coil.fmt.print-u+0x54>

000000000000174c <_coil.fmt.print-uhex>:
    174c:      	sub	sp, sp, #0x20
    1750:      	str	x29, [sp]
    1754:      	str	x30, [sp, #0x8]
    1758:      	mov	x29, sp
    175c:      	str	x19, [sp, #0x10]
    1760:      	str	x20, [sp, #0x18]
    1764:      	sub	sp, sp, #0x20
    1768:      	mov	x2, sp
    176c:      	sub	sp, sp, #0x20
    1770:      	mov	x3, sp
    1774:      	movz	x17, #0x0, lsl #48
    1778:      	cmp	x1, x17
    177c:      	b.ne	0x17e4 <_coil.fmt.print-uhex+0x98>
    1780:      	orr	x19, x2, xzr
    1784:      	mov	x20, x8
    1788:      	mov	x8, x2
    178c:      	mov	x1, #0x30               ; =48
    1790:      	uxtb	w1, w1
    1794:      	bl	0x1794 <_coil.fmt.print-uhex+0x48>
    1798:      	mov	x0, x19
    179c:      	b	0x17b0 <_coil.fmt.print-uhex+0x64>
    17a0:      	orr	x19, x3, xzr
    17a4:      	mov	x8, x3
    17a8:      	bl	0x17a8 <_coil.fmt.print-uhex+0x5c>
    17ac:      	mov	x0, x19
    17b0:      	ldr	x1, [x0]
    17b4:      	str	x1, [x20]
    17b8:      	ldr	x1, [x0, #0x8]
    17bc:      	str	x1, [x20, #0x8]
    17c0:      	ldr	x0, [x0, #0x10]
    17c4:      	str	x0, [x20, #0x10]
    17c8:      	sub	sp, x29, #0x0
    17cc:      	ldr	x19, [sp, #0x10]
    17d0:      	ldr	x20, [sp, #0x18]
    17d4:      	ldr	x29, [sp]
    17d8:      	ldr	x30, [sp, #0x8]
    17dc:      	add	sp, sp, #0x20
    17e0:      	ret
    17e4:      	mov	x20, x8
    17e8:      	b	0x17a0 <_coil.fmt.print-uhex+0x54>

00000000000017ec <_coil.fmt.count--write>:
    17ec:      	sub	sp, sp, #0x10
    17f0:      	str	x29, [sp]
    17f4:      	str	x30, [sp, #0x8]
    17f8:      	mov	x29, sp
    17fc:      	sub	sp, sp, #0x20
    1800:      	mov	x1, sp
    1804:      	ldr	x3, [x0]
    1808:      	add	x3, x3, x2
    180c:      	str	x3, [x0]
    1810:      	movz	w17, #0x0, lsl #16
    1814:      	str	w17, [x1]
    1818:      	str	x2, [x1, #0x8]
    181c:      	ldr	x0, [x1]
    1820:      	str	x0, [x8]
    1824:      	ldr	x0, [x1, #0x8]
    1828:      	str	x0, [x8, #0x8]
    182c:      	ldr	x0, [x1, #0x10]
    1830:      	str	x0, [x8, #0x10]
    1834:      	sub	sp, x29, #0x0
    1838:      	ldr	x29, [sp]
    183c:      	ldr	x30, [sp, #0x8]
    1840:      	add	sp, sp, #0x10
    1844:      	ret

0000000000001848 <_coil.fmt.fmt--fill>:
    1848:      	sub	sp, sp, #0x50
    184c:      	str	x29, [sp]
    1850:      	str	x30, [sp, #0x8]
    1854:      	mov	x29, sp
    1858:      	str	x19, [sp, #0x10]
    185c:      	str	x20, [sp, #0x18]
    1860:      	str	x21, [sp, #0x20]
    1864:      	str	x22, [sp, #0x28]
    1868:      	str	x23, [sp, #0x30]
    186c:      	str	x24, [sp, #0x38]
    1870:      	str	x25, [sp, #0x40]
    1874:      	sub	sp, sp, #0x20
    1878:      	mov	x19, sp
    187c:      	sub	sp, sp, #0x20
    1880:      	mov	x20, sp
    1884:      	movn	x3, #0x0, lsl #48
    1888:      	b	0x18e0 <_coil.fmt.fmt--fill+0x98>
    188c:      	nop
    1890:      	lsr	x0, x0, #8
    1894:      	lsr	w0, w0, #0
    1898:      	orr	x22, x0, xzr
    189c:      	and	x0, x22, #0xff
    18a0:      	uxtb	w0, w0
    18a4:      	mov	x8, x20
    18a8:      	mov	w1, w0
    18ac:      	mov	x0, x23
    18b0:      	uxtb	w1, w1
    18b4:      	bl	0x18b4 <_coil.fmt.fmt--fill+0x6c>
    18b8:      	mov	x0, x22
    18bc:      	lsr	x1, x0, #8
    18c0:      	lsr	w1, w1, #0
    18c4:      	movz	x17, #0x0, lsl #48
    18c8:      	cmp	x1, x17
    18cc:      	b.ne	0x1890 <_coil.fmt.fmt--fill+0x48>
    18d0:      	mov	x0, x23
    18d4:      	mov	x1, x24
    18d8:      	mov	x2, x25
    18dc:      	mov	x3, x21
    18e0:      	add	x21, x3, #0x1
    18e4:      	cmp	x21, x2
    18e8:      	b.ge	0x1920 <_coil.fmt.fmt--fill+0xd8>
    18ec:      	ldr	w3, [x1, #0x10]
    18f0:      	orr	x22, x3, xzr
    18f4:      	and	x3, x22, #0xff
    18f8:      	uxtb	w3, w3
    18fc:      	mov	x8, x19
    1900:      	mov	x23, x0
    1904:      	mov	x24, x1
    1908:      	mov	w1, w3
    190c:      	mov	x25, x2
    1910:      	uxtb	w1, w1
    1914:      	bl	0x1914 <_coil.fmt.fmt--fill+0xcc>
    1918:      	mov	x0, x22
    191c:      	b	0x18bc <_coil.fmt.fmt--fill+0x74>
    1920:      	movz	x0, #0x0, lsl #48
    1924:      	sub	sp, x29, #0x0
    1928:      	ldr	x19, [sp, #0x10]
    192c:      	ldr	x20, [sp, #0x18]
    1930:      	ldr	x21, [sp, #0x20]
    1934:      	ldr	x22, [sp, #0x28]
    1938:      	ldr	x23, [sp, #0x30]
    193c:      	ldr	x24, [sp, #0x38]
    1940:      	ldr	x25, [sp, #0x40]
    1944:      	ldr	x29, [sp]
    1948:      	ldr	x30, [sp, #0x8]
    194c:      	add	sp, sp, #0x50
    1950:      	ret

0000000000001954 <_coil.panic.put-trace-stderr!>:
    1954:      	sub	sp, sp, #0x20
    1958:      	str	x29, [sp]
    195c:      	str	x30, [sp, #0x8]
    1960:      	mov	x29, sp
    1964:      	str	x19, [sp, #0x10]
    1968:      	str	x20, [sp, #0x18]
    196c:      	sub	sp, sp, #0x200
    1970:      	mov	x0, sp
    1974:      	orr	x19, x0, xzr
    1978:      	mov	x0, x19
    197c:      	mov	x1, #0x40               ; =64
    1980:      	bl	0x1980 <_coil.panic.put-trace-stderr!+0x2c>
    1984:      	lsr	w0, w0, #0
    1988:      	sxtw	x1, w0
    198c:      	movz	x17, #0x0, lsl #48
    1990:      	cmp	x1, x17
    1994:      	b.le	0x19c4 <_coil.panic.put-trace-stderr!+0x70>
    1998:      	adrp	x16, 0x1000 <_coil.io.fd-retry?+0x3c>
    199c:      	ldr	x16, [x16]
    19a0:      	orr	x1, x16, xzr
    19a4:      	lsr	w20, w0, #0
    19a8:      	mov	x0, #0x2                ; =2
    19ac:      	mov	x2, #0xd                ; =13
    19b0:      	bl	0x19b0 <_coil.panic.put-trace-stderr!+0x5c>
    19b4:      	mov	x0, x19
    19b8:      	mov	w1, w20
    19bc:      	mov	x2, #0x2                ; =2
    19c0:      	bl	0x19c0 <_coil.panic.put-trace-stderr!+0x6c>
    19c4:      	movz	x0, #0x0, lsl #48
    19c8:      	sub	sp, x29, #0x0
    19cc:      	ldr	x19, [sp, #0x10]
    19d0:      	ldr	x20, [sp, #0x18]
    19d4:      	ldr	x29, [sp]
    19d8:      	ldr	x30, [sp, #0x8]
    19dc:      	add	sp, sp, #0x20
    19e0:      	ret

00000000000019e4 <_coil.os.dlsym-errno-cell>:
    19e4:      	sub	sp, sp, #0x30
    19e8:      	str	x29, [sp]
    19ec:      	str	x30, [sp, #0x8]
    19f0:      	mov	x29, sp
    19f4:      	str	x19, [sp, #0x10]
    19f8:      	str	x20, [sp, #0x18]
    19fc:      	str	x21, [sp, #0x20]
    1a00:      	adrp	x16, 0x1000 <_coil.io.fd-retry?+0x3c>
    1a04:      	ldr	x16, [x16]
    1a08:      	orr	x19, x16, xzr
    1a0c:      	mov	x20, x0
    1a10:      	mov	x0, x19
    1a14:      	mov	x21, x1
    1a18:      	bl	0x1a18 <_coil.os.dlsym-errno-cell+0x34>
    1a1c:      	movz	x17, #0x0, lsl #48
    1a20:      	cmp	x0, x17
    1a24:      	b.ne	0x1a4c <_coil.os.dlsym-errno-cell+0x68>
    1a28:      	mov	x0, x21
    1a2c:      	mov	x1, x20
    1a30:      	bl	0x1a30 <_coil.os.dlsym-errno-cell+0x4c>
    1a34:      	mov	x1, x0
    1a38:      	fmov	d31, x0
    1a3c:      	mov	x0, x19
    1a40:      	fmov	x19, d31
    1a44:      	bl	0x1a44 <_coil.os.dlsym-errno-cell+0x60>
    1a48:      	mov	x0, x19
    1a4c:      	mov	x30, x0
    1a50:      	blr	x30
    1a54:      	ldr	x19, [sp, #0x10]
    1a58:      	ldr	x20, [sp, #0x18]
    1a5c:      	ldr	x21, [sp, #0x20]
    1a60:      	ldr	x29, [sp]
    1a64:      	ldr	x30, [sp, #0x8]
    1a68:      	add	sp, sp, #0x30
    1a6c:      	ret

0000000000001a70 <_coil.os.dlsym-cached>:
    1a70:      	sub	sp, sp, #0x30
    1a74:      	str	x29, [sp]
    1a78:      	str	x30, [sp, #0x8]
    1a7c:      	mov	x29, sp
    1a80:      	str	x19, [sp, #0x10]
    1a84:      	str	x20, [sp, #0x18]
    1a88:      	str	x21, [sp, #0x20]
    1a8c:      	mov	x19, x0
    1a90:      	mov	x20, x1
    1a94:      	mov	x21, x2
    1a98:      	bl	0x1a98 <_coil.os.dlsym-cached+0x28>
    1a9c:      	movz	x17, #0x0, lsl #48
    1aa0:      	cmp	x0, x17
    1aa4:      	b.ne	0x1acc <_coil.os.dlsym-cached+0x5c>
    1aa8:      	mov	x0, x21
    1aac:      	mov	x1, x20
    1ab0:      	bl	0x1ab0 <_coil.os.dlsym-cached+0x40>
    1ab4:      	mov	x1, x0
    1ab8:      	fmov	d31, x0
    1abc:      	mov	x0, x19
    1ac0:      	fmov	x19, d31
    1ac4:      	bl	0x1ac4 <_coil.os.dlsym-cached+0x54>
    1ac8:      	mov	x0, x19
    1acc:      	ldr	x19, [sp, #0x10]
    1ad0:      	ldr	x20, [sp, #0x18]
    1ad4:      	ldr	x21, [sp, #0x20]
    1ad8:      	ldr	x29, [sp]
    1adc:      	ldr	x30, [sp, #0x8]
    1ae0:      	add	sp, sp, #0x30
    1ae4:      	ret

0000000000001ae8 <_coil.fmt.udec-digits>:
    1ae8:      	sub	sp, sp, #0x40
    1aec:      	str	x29, [sp]
    1af0:      	str	x30, [sp, #0x8]
    1af4:      	mov	x29, sp
    1af8:      	str	x19, [sp, #0x10]
    1afc:      	str	x20, [sp, #0x18]
    1b00:      	str	x21, [sp, #0x20]
    1b04:      	str	x22, [sp, #0x28]
    1b08:      	str	x23, [sp, #0x30]
    1b0c:      	str	x24, [sp, #0x38]
    1b10:      	sub	sp, sp, #0x20
    1b14:      	mov	x2, sp
    1b18:      	sub	sp, sp, #0x20
    1b1c:      	mov	x19, sp
    1b20:      	sub	sp, sp, #0x20
    1b24:      	mov	x20, sp
    1b28:      	sub	sp, sp, #0x20
    1b2c:      	mov	x21, sp
    1b30:      	movz	x17, #0x0, lsl #48
    1b34:      	cmp	x1, x17
    1b38:      	b.ne	0x1b98 <_coil.fmt.udec-digits+0xb0>
    1b3c:      	orr	x0, x2, xzr
    1b40:      	movz	w17, #0x0, lsl #16
    1b44:      	str	w17, [x2]
    1b48:      	movz	x17, #0x0, lsl #48
    1b4c:      	str	x17, [x2, #0x8]
    1b50:      	mov	x22, x8
    1b54:      	ldr	x1, [x0]
    1b58:      	str	x1, [x22]
    1b5c:      	ldr	x1, [x0, #0x8]
    1b60:      	str	x1, [x22, #0x8]
    1b64:      	ldr	x0, [x0, #0x10]
    1b68:      	str	x0, [x22, #0x10]
    1b6c:      	sub	sp, x29, #0x0
    1b70:      	ldr	x19, [sp, #0x10]
    1b74:      	ldr	x20, [sp, #0x18]
    1b78:      	ldr	x21, [sp, #0x20]
    1b7c:      	ldr	x22, [sp, #0x28]
    1b80:      	ldr	x23, [sp, #0x30]
    1b84:      	ldr	x24, [sp, #0x38]
    1b88:      	ldr	x29, [sp]
    1b8c:      	ldr	x30, [sp, #0x8]
    1b90:      	add	sp, sp, #0x40
    1b94:      	ret
    1b98:      	mov	x17, #0xa               ; =10
    1b9c:      	udiv	x2, x1, x17
    1ba0:      	mov	x22, x8
    1ba4:      	mov	x8, x19
    1ba8:      	mov	x23, x0
    1bac:      	mov	x24, x1
    1bb0:      	mov	x1, x2
    1bb4:      	bl	0x1bb4 <_coil.fmt.udec-digits+0xcc>
    1bb8:      	ldr	w0, [x19]
    1bbc:      	lsr	x16, x0, #0
    1bc0:      	cmp	x16, #0x1
    1bc4:      	b.eq	0x1be0 <_coil.fmt.udec-digits+0xf8>
    1bc8:      	b.lo	0x1bd0 <_coil.fmt.udec-digits+0xe8>
    1bcc:      	b	0x1be4 <_coil.fmt.udec-digits+0xfc>
    1bd0:      	cmp	x16, #0x0
    1bd4:      	b.eq	0x1bdc <_coil.fmt.udec-digits+0xf4>
    1bd8:      	b	0x1be4 <_coil.fmt.udec-digits+0xfc>
    1bdc:      	b	0x1c10 <_coil.fmt.udec-digits+0x128>
    1be0:      	b	0x1be8 <_coil.fmt.udec-digits+0x100>
    1be4:      	b	0x1c44 <_coil.fmt.udec-digits+0x15c>
    1be8:      	orr	x0, x20, xzr
    1bec:      	add	x1, x19, #0x8
    1bf0:      	add	x2, x0, #0x8
    1bf4:      	ldr	x3, [x19, #0x8]
    1bf8:      	ldr	x1, [x1, #0x8]
    1bfc:      	mov	w17, #0x1               ; =1
    1c00:      	str	w17, [x20]
    1c04:      	str	x3, [x20, #0x8]
    1c08:      	str	x1, [x2, #0x8]
    1c0c:      	b	0x1c40 <_coil.fmt.udec-digits+0x158>
    1c10:      	orr	x19, x21, xzr
    1c14:      	mov	x17, #0xa               ; =10
    1c18:      	udiv	x16, x24, x17
    1c1c:      	msub	x0, x16, x17, x24
    1c20:      	add	x0, x0, #0x30
    1c24:      	uxtb	w0, w0
    1c28:      	mov	x8, x21
    1c2c:      	mov	w1, w0
    1c30:      	mov	x0, x23
    1c34:      	uxtb	w1, w1
    1c38:      	bl	0x1c38 <_coil.fmt.udec-digits+0x150>
    1c3c:      	mov	x0, x19
    1c40:      	b	0x1b54 <_coil.fmt.udec-digits+0x6c>
    1c44:      	brk	#0
    1c48:      	b	0x1c44 <_coil.fmt.udec-digits+0x15c>

0000000000001c4c <_coil.fmt.uhex-digits>:
    1c4c:      	sub	sp, sp, #0x40
    1c50:      	str	x29, [sp]
    1c54:      	str	x30, [sp, #0x8]
    1c58:      	mov	x29, sp
    1c5c:      	str	x19, [sp, #0x10]
    1c60:      	str	x20, [sp, #0x18]
    1c64:      	str	x21, [sp, #0x20]
    1c68:      	str	x22, [sp, #0x28]
    1c6c:      	str	x23, [sp, #0x30]
    1c70:      	str	x24, [sp, #0x38]
    1c74:      	sub	sp, sp, #0x20
    1c78:      	mov	x2, sp
    1c7c:      	sub	sp, sp, #0x20
    1c80:      	mov	x19, sp
    1c84:      	sub	sp, sp, #0x20
    1c88:      	mov	x20, sp
    1c8c:      	sub	sp, sp, #0x20
    1c90:      	mov	x21, sp
    1c94:      	movz	x17, #0x0, lsl #48
    1c98:      	cmp	x1, x17
    1c9c:      	b.ne	0x1cfc <_coil.fmt.uhex-digits+0xb0>
    1ca0:      	orr	x0, x2, xzr
    1ca4:      	movz	w17, #0x0, lsl #16
    1ca8:      	str	w17, [x2]
    1cac:      	movz	x17, #0x0, lsl #48
    1cb0:      	str	x17, [x2, #0x8]
    1cb4:      	mov	x22, x8
    1cb8:      	ldr	x1, [x0]
    1cbc:      	str	x1, [x22]
    1cc0:      	ldr	x1, [x0, #0x8]
    1cc4:      	str	x1, [x22, #0x8]
    1cc8:      	ldr	x0, [x0, #0x10]
    1ccc:      	str	x0, [x22, #0x10]
    1cd0:      	sub	sp, x29, #0x0
    1cd4:      	ldr	x19, [sp, #0x10]
    1cd8:      	ldr	x20, [sp, #0x18]
    1cdc:      	ldr	x21, [sp, #0x20]
    1ce0:      	ldr	x22, [sp, #0x28]
    1ce4:      	ldr	x23, [sp, #0x30]
    1ce8:      	ldr	x24, [sp, #0x38]
    1cec:      	ldr	x29, [sp]
    1cf0:      	ldr	x30, [sp, #0x8]
    1cf4:      	add	sp, sp, #0x40
    1cf8:      	ret
    1cfc:      	mov	x17, #0x10              ; =16
    1d00:      	udiv	x2, x1, x17
    1d04:      	mov	x22, x8
    1d08:      	mov	x8, x19
    1d0c:      	mov	x23, x0
    1d10:      	mov	x24, x1
    1d14:      	mov	x1, x2
    1d18:      	bl	0x1d18 <_coil.fmt.uhex-digits+0xcc>
    1d1c:      	ldr	w0, [x19]
    1d20:      	lsr	x16, x0, #0
    1d24:      	cmp	x16, #0x1
    1d28:      	b.eq	0x1d44 <_coil.fmt.uhex-digits+0xf8>
    1d2c:      	b.lo	0x1d34 <_coil.fmt.uhex-digits+0xe8>
    1d30:      	b	0x1d48 <_coil.fmt.uhex-digits+0xfc>
    1d34:      	cmp	x16, #0x0
    1d38:      	b.eq	0x1d40 <_coil.fmt.uhex-digits+0xf4>
    1d3c:      	b	0x1d48 <_coil.fmt.uhex-digits+0xfc>
    1d40:      	b	0x1d9c <_coil.fmt.uhex-digits+0x150>
    1d44:      	b	0x1d4c <_coil.fmt.uhex-digits+0x100>
    1d48:      	b	0x1dbc <_coil.fmt.uhex-digits+0x170>
    1d4c:      	orr	x0, x20, xzr
    1d50:      	add	x1, x19, #0x8
    1d54:      	add	x2, x0, #0x8
    1d58:      	ldr	x3, [x19, #0x8]
    1d5c:      	ldr	x1, [x1, #0x8]
    1d60:      	mov	w17, #0x1               ; =1
    1d64:      	str	w17, [x20]
    1d68:      	str	x3, [x20, #0x8]
    1d6c:      	str	x1, [x2, #0x8]
    1d70:      	b	0x1d98 <_coil.fmt.uhex-digits+0x14c>
    1d74:      	add	x0, x0, #0x57
    1d78:      	orr	x19, x21, xzr
    1d7c:      	uxtb	w0, w0
    1d80:      	mov	x8, x21
    1d84:      	mov	w1, w0
    1d88:      	mov	x0, x23
    1d8c:      	uxtb	w1, w1
    1d90:      	bl	0x1d90 <_coil.fmt.uhex-digits+0x144>
    1d94:      	mov	x0, x19
    1d98:      	b	0x1cb8 <_coil.fmt.uhex-digits+0x6c>
    1d9c:      	mov	x17, #0x10              ; =16
    1da0:      	udiv	x16, x24, x17
    1da4:      	msub	x0, x16, x17, x24
    1da8:      	mov	x17, #0xa               ; =10
    1dac:      	cmp	x0, x17
    1db0:      	b.ge	0x1d74 <_coil.fmt.uhex-digits+0x128>
    1db4:      	add	x0, x0, #0x30
    1db8:      	b	0x1d78 <_coil.fmt.uhex-digits+0x12c>
    1dbc:      	brk	#0
    1dc0:      	b	0x1dbc <_coil.fmt.uhex-digits+0x170>

0000000000001dc4 <_coil.atomic.read-ptr__i8>:
    1dc4:      	mov	x16, x0
    1dc8:      	ldar	x0, [x16]
    1dcc:      	ret

0000000000001dd0 <_coil.atomic.store-ptr__i8>:
    1dd0:      	mov	x16, x0
    1dd4:      	mov	x17, x1
    1dd8:      	stlr	x17, [x16]
    1ddc:      	movz	x0, #0x0, lsl #48
    1de0:      	ret
