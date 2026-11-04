
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-word-address/build/word-address-avec/tpde.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_avec_get>:
       0:      	stp	x29, x30, [sp, #-0xc0]!
       4:      	mov	x29, sp
       8:      	bl	0x8 <_gap_avec_get+0x8>
       c:      	ldr	q0, [x0]
      10:      	str	q0, [x29, #0xb0]
      14:      	ldr	q0, [x29, #0xb0]
      18:      	str	q0, [x29, #0xa0]
      1c:      	ldrsw	x0, [x29, #0xa4]
      20:      	ldrsw	x1, [x29, #0xa8]
      24:      	add	x0, x0, x1
      28:      	ldrsw	x1, [x29, #0xac]
      2c:      	add	x0, x0, x1
      30:      	ldp	x29, x30, [sp], #0xc0
      34:      	ret

0000000000000038 <_coil.avec.avec-at__gaps.avec-get.Node>:
      38:      	stp	x29, x30, [sp, #-0xb0]!
      3c:      	mov	x29, sp
      40:      	mov	x9, x0
      44:      	mov	x10, x1
      48:      	str	x9, [x29, #0xa0]
      4c:      	str	x10, [x29, #0xa8]
      50:      	bl	0x50 <_coil.avec.avec-at__gaps.avec-get.Node+0x18>
      54:      	ldr	x0, [x29, #0xa0]
      58:      	ldr	x1, [x29, #0xa8]
      5c:      	bl	0x5c <_coil.avec.avec-at__gaps.avec-get.Node+0x24>
      60:      	ldr	x0, [x0, #0x18]
      64:      	ldr	x1, [x29, #0xa8]
      68:      	and	x1, x1, #0x1f
      6c:      	add	x0, x0, x1, lsl #4
      70:      	ldp	x29, x30, [sp], #0xb0
      74:      	ret

0000000000000078 <_coil.avec.avec--check__gaps.avec-get.Node>:
      78:      	stp	x29, x30, [sp, #-0xa0]!
      7c:      	mov	x29, sp
      80:      	stp	x19, x20, [sp, #0x10]
      84:      	str	x21, [sp, #0x20]
      88:      	mov	x19, x0
      8c:      	mov	x20, x1
      90:      	cmp	x20, #0x0
      94:      	b.ge	0xa0 <_coil.avec.avec--check__gaps.avec-get.Node+0x28>
      98:      	mov	w21, #0x1               ; =1
      9c:      	b	0xb0 <_coil.avec.avec--check__gaps.avec-get.Node+0x38>
      a0:      	ldr	x0, [x19, #0x10]
      a4:      	cmp	x20, x0
      a8:      	cset	x0, ge
      ac:      	mov	x21, x0
      b0:      	cbz	x21, 0xc8 <_coil.avec.avec--check__gaps.avec-get.Node+0x50>
      b4:      	ldr	x19, [x19, #0x10]
      b8:      	mov	x0, x20
      bc:      	mov	x1, x19
      c0:      	bl	0xc0 <_coil.avec.avec--check__gaps.avec-get.Node+0x48>
      c4:      	b	0xc4 <_coil.avec.avec--check__gaps.avec-get.Node+0x4c>
      c8:      	mov	w0, #0x0                ; =0
      cc:      	ldp	x19, x20, [sp, #0x10]
      d0:      	ldr	x21, [sp, #0x20]
      d4:      	ldp	x29, x30, [sp], #0xa0
      d8:      	ret

00000000000000dc <_coil.avec.avec--leaf-for__gaps.avec-get.Node>:
      dc:      	stp	x29, x30, [sp, #-0xc0]!
      e0:      	mov	x29, sp
      e4:      	stp	x19, x20, [sp, #0x10]
      e8:      	stp	x21, x22, [sp, #0x20]
      ec:      	mov	x9, x0
      f0:      	str	x1, [x29, #0xa0]
      f4:      	str	x9, [x29, #0xa8]
      f8:      	bl	0xf8 <_coil.avec.avec--leaf-for__gaps.avec-get.Node+0x1c>
      fc:      	ldr	x1, [x29, #0xa0]
     100:      	cmp	x1, x0
     104:      	b.lt	0x118 <_coil.avec.avec--leaf-for__gaps.avec-get.Node+0x3c>
     108:      	ldr	x0, [x29, #0xa8]
     10c:      	ldr	x2, [x0, #0x8]
     110:      	str	x2, [x29, #0xb0]
     114:      	b	0x160 <_coil.avec.avec--leaf-for__gaps.avec-get.Node+0x84>
     118:      	ldr	x0, [x29, #0xa8]
     11c:      	ldr	x1, [x0]
     120:      	ldr	x0, [x0, #0x18]
     124:      	mov	x19, x0
     128:      	mov	x20, x1
     12c:      	cmp	x19, #0x0
     130:      	b.le	0x15c <_coil.avec.avec--leaf-for__gaps.avec-get.Node+0x80>
     134:      	ldr	x0, [x20, #0x20]
     138:      	ldr	x1, [x29, #0xa0]
     13c:      	asr	x2, x1, x19
     140:      	and	x2, x2, #0x1f
     144:      	add	x0, x0, x2, lsl #3
     148:      	ldr	x21, [x0]
     14c:      	sub	x22, x19, #0x5
     150:      	mov	x19, x22
     154:      	mov	x20, x21
     158:      	b	0x12c <_coil.avec.avec--leaf-for__gaps.avec-get.Node+0x50>
     15c:      	str	x20, [x29, #0xb0]
     160:      	ldr	x0, [x29, #0xb0]
     164:      	ldp	x19, x20, [sp, #0x10]
     168:      	ldp	x21, x22, [sp, #0x20]
     16c:      	ldp	x29, x30, [sp], #0xc0
     170:      	ret

0000000000000174 <_coil.avec.avec--bounds-error>:
     174:      	stp	x29, x30, [sp, #-0x1c0]!
     178:      	mov	x29, sp
     17c:      	str	x0, [x29, #0x1b0]
     180:      	str	x1, [x29, #0x1b8]
     184:      	bl	0x184 <_coil.avec.avec--bounds-error+0x10>
     188:      	str	xzr, [x29, #0xf0]
     18c:      	str	xzr, [x29, #0xf8]
     190:      	str	xzr, [x29, #0x100]
     194:      	str	xzr, [x29, #0x108]
     198:      	str	xzr, [x29, #0x110]
     19c:      	str	xzr, [x29, #0x118]
     1a0:      	str	xzr, [x29, #0x120]
     1a4:      	str	xzr, [x29, #0x128]
     1a8:      	str	xzr, [x29, #0x130]
     1ac:      	ldr	q0, [x29, #0xf0]
     1b0:      	str	q0, [x29, #0xa0]
     1b4:      	ldr	q0, [x29, #0x100]
     1b8:      	str	q0, [x29, #0xb0]
     1bc:      	ldr	q0, [x29, #0x110]
     1c0:      	str	q0, [x29, #0xc0]
     1c4:      	ldr	q0, [x29, #0x120]
     1c8:      	str	q0, [x29, #0xd0]
     1cc:      	ldr	x0, [x29, #0x130]
     1d0:      	str	x0, [x29, #0xe0]
     1d4:      	bl	0x1d4 <_coil.avec.avec--bounds-error+0x60>
     1d8:      	mov	x9, x0
     1dc:      	add	x0, x29, #0xa0
     1e0:      	mov	x1, x9
     1e4:      	bl	0x1e4 <_coil.avec.avec--bounds-error+0x70>
     1e8:      	bl	0x1e8 <_coil.avec.avec--bounds-error+0x74>
     1ec:      	adrp	x1, 0x0 <_gap_avec_get>
     1f0:      	add	x1, x1, #0x0
     1f4:      	str	x1, [x29, #0x140]
     1f8:      	mov	w1, #0xc                ; =12
     1fc:      	str	x1, [x29, #0x148]
     200:      	ldr	x1, [x29, #0x140]
     204:      	ldr	x2, [x29, #0x148]
     208:      	add	x8, x29, #0x150
     20c:      	bl	0x20c <_coil.avec.avec--bounds-error+0x98>
     210:      	add	x0, x29, #0xa0
     214:      	mov	w1, #0x0                ; =0
     218:      	bl	0x218 <_coil.avec.avec--bounds-error+0xa4>
     21c:      	ldr	x0, [x29, #0x1b0]
     220:      	add	x1, x29, #0xa0
     224:      	bl	0x224 <_coil.avec.avec--bounds-error+0xb0>
     228:      	bl	0x228 <_coil.avec.avec--bounds-error+0xb4>
     22c:      	adrp	x1, 0x0 <_gap_avec_get>
     230:      	add	x1, x1, #0x0
     234:      	str	x1, [x29, #0x170]
     238:      	mov	w1, #0x10               ; =16
     23c:      	str	x1, [x29, #0x178]
     240:      	ldr	x1, [x29, #0x170]
     244:      	ldr	x2, [x29, #0x178]
     248:      	add	x8, x29, #0x180
     24c:      	bl	0x24c <_coil.avec.avec--bounds-error+0xd8>
     250:      	add	x0, x29, #0xa0
     254:      	mov	w1, #0x0                ; =0
     258:      	bl	0x258 <_coil.avec.avec--bounds-error+0xe4>
     25c:      	ldr	x0, [x29, #0x1b8]
     260:      	add	x1, x29, #0xa0
     264:      	bl	0x264 <_coil.avec.avec--bounds-error+0xf0>
     268:      	adrp	x0, 0x0 <_gap_avec_get>
     26c:      	add	x0, x0, #0x0
     270:      	str	x0, [x29, #0x1a0]
     274:      	mov	w0, #0x19               ; =25
     278:      	str	x0, [x29, #0x1a8]
     27c:      	ldr	x0, [x29, #0x1a0]
     280:      	ldr	x1, [x29, #0x1a8]
     284:      	bl	0x284 <_coil.avec.avec--bounds-error+0x110>
     288:      	b	0x288 <_coil.avec.avec--bounds-error+0x114>

000000000000028c <_coil.avec.avec--tail-offset__gaps.avec-get.Node>:
     28c:      	mov	x9, x0
     290:      	ldr	x0, [x9, #0x10]
     294:      	cmp	x0, #0x20
     298:      	b.ge	0x2a4 <_coil.avec.avec--tail-offset__gaps.avec-get.Node+0x18>
     29c:      	mov	w2, #0x0                ; =0
     2a0:      	b	0x2b8 <_coil.avec.avec--tail-offset__gaps.avec-get.Node+0x2c>
     2a4:      	ldr	x9, [x9, #0x10]
     2a8:      	sub	x9, x9, #0x1
     2ac:      	asr	x9, x9, #5
     2b0:      	lsl	x9, x9, #5
     2b4:      	mov	x2, x9
     2b8:      	mov	x0, x2
     2bc:      	ret

00000000000002c0 <_coil.panic.begin!>:
     2c0:      	stp	x29, x30, [sp, #-0xd0]!
     2c4:      	mov	x29, sp
     2c8:      	stp	x19, x20, [sp, #0x10]
     2cc:      	bl	0x2cc <_coil.panic.begin!+0xc>
     2d0:      	mov	x19, x0
     2d4:      	str	xzr, [x29, #0xa0]
     2d8:      	ldr	x0, [x19]
     2dc:      	ldr	x1, [x29, #0xa0]
     2e0:      	cmp	x0, x1
     2e4:      	b.ne	0x2f0 <_coil.panic.begin!+0x30>
     2e8:      	mov	w20, #0x0               ; =0
     2ec:      	b	0x2f4 <_coil.panic.begin!+0x34>
     2f0:      	mov	w20, #0x1               ; =1
     2f4:      	cbz	x20, 0x320 <_coil.panic.begin!+0x60>
     2f8:      	adrp	x0, 0x0 <_gap_avec_get>
     2fc:      	add	x0, x0, #0x0
     300:      	str	x0, [x29, #0xb0]
     304:      	mov	w0, #0x29               ; =41
     308:      	str	x0, [x29, #0xb8]
     30c:      	ldr	x0, [x29, #0xb0]
     310:      	ldr	x1, [x29, #0xb8]
     314:      	bl	0x314 <_coil.panic.begin!+0x54>
     318:      	bl	0x318 <_coil.panic.begin!+0x58>
     31c:      	b	0x31c <_coil.panic.begin!+0x5c>
     320:      	mov	w0, #0x1                ; =1
     324:      	str	x0, [x19]
     328:      	adrp	x0, 0x0 <_gap_avec_get>
     32c:      	add	x0, x0, #0x0
     330:      	str	x0, [x29, #0xc0]
     334:      	mov	w0, #0x7                ; =7
     338:      	str	x0, [x29, #0xc8]
     33c:      	ldr	x0, [x29, #0xc0]
     340:      	ldr	x1, [x29, #0xc8]
     344:      	bl	0x344 <_coil.panic.begin!+0x84>
     348:      	mov	w0, #0x0                ; =0
     34c:      	ldp	x19, x20, [sp, #0x10]
     350:      	ldp	x29, x30, [sp], #0xd0
     354:      	ret

0000000000000358 <_coil.io.stderr>:
     358:      	adrp	x0, 0x0 <_gap_avec_get>
     35c:      	add	x0, x0, #0x0
     360:      	ret

0000000000000364 <_inherent$coil.fmt.Formatter$init>:
     364:      	stp	x29, x30, [sp, #-0xb0]!
     368:      	mov	x29, sp
     36c:      	str	x1, [x0]
     370:      	strb	wzr, [x0, #0x8]
     374:      	str	xzr, [x0, #0x10]
     378:      	mov	x9, x0
     37c:      	str	x9, [x29, #0xa0]
     380:      	bl	0x380 <_inherent$coil.fmt.Formatter$init+0x1c>
     384:      	ldr	x0, [x29, #0xa0]
     388:      	ldp	x29, x30, [sp], #0xb0
     38c:      	ret

0000000000000390 <_coil.io.print-str>:
     390:      	stp	x29, x30, [sp, #-0xf0]!
     394:      	mov	x29, sp
     398:      	str	x1, [x29, #0xa0]
     39c:      	str	x2, [x29, #0xa8]
     3a0:      	ldr	x1, [x29, #0xa0]
     3a4:      	ldr	x2, [x29, #0xa8]
     3a8:      	mov	x9, x0
     3ac:      	mov	x0, x1
     3b0:      	mov	x1, x2
     3b4:      	str	x8, [x29, #0xd0]
     3b8:      	str	x9, [x29, #0xd8]
     3bc:      	bl	0x3bc <_coil.io.print-str+0x2c>
     3c0:      	ldr	x1, [x29, #0xa0]
     3c4:      	ldr	x2, [x29, #0xa8]
     3c8:      	mov	x9, x0
     3cc:      	mov	x0, x1
     3d0:      	mov	x1, x2
     3d4:      	str	x9, [x29, #0xe0]
     3d8:      	bl	0x3d8 <_coil.io.print-str+0x48>
     3dc:      	add	x8, x29, #0xb0
     3e0:      	mov	x9, x0
     3e4:      	ldr	x0, [x29, #0xd8]
     3e8:      	ldr	x1, [x29, #0xe0]
     3ec:      	mov	x2, x9
     3f0:      	bl	0x3f0 <_coil.io.print-str+0x60>
     3f4:      	ldr	x0, [x29, #0xd0]
     3f8:      	ldr	q0, [x29, #0xb0]
     3fc:      	str	q0, [x0]
     400:      	ldr	x1, [x29, #0xc0]
     404:      	str	x1, [x0, #0x10]
     408:      	ldp	x29, x30, [sp], #0xf0
     40c:      	ret

0000000000000410 <_inherent$coil.fmt.Formatter$set-alternate!>:
     410:      	strb	w1, [x0, #0x8]
     414:      	mov	w0, #0x0                ; =0
     418:      	ret

000000000000041c <_coil.fmt.Display$i64$display-fmt>:
     41c:      	stp	x29, x30, [sp, #-0xf0]!
     420:      	mov	x29, sp
     424:      	stp	x19, x20, [sp, #0x10]
     428:      	stp	x21, x22, [sp, #0x20]
     42c:      	mov	x19, x0
     430:      	mov	x20, x1
     434:      	cmp	x19, #0x0
     438:      	cset	x21, lt
     43c:      	adrp	x0, 0x0 <_gap_avec_get>
     440:      	add	x0, x0, #0x0
     444:      	str	x0, [x29, #0xa0]
     448:      	str	xzr, [x29, #0xa8]
     44c:      	str	wzr, [x29, #0xb0]
     450:      	cmp	x19, #0x0
     454:      	b.ge	0x468 <_coil.fmt.Display$i64$display-fmt+0x4c>
     458:      	mov	w0, #0x0                ; =0
     45c:      	sub	x0, x0, x19
     460:      	mov	x22, x0
     464:      	b	0x46c <_coil.fmt.Display$i64$display-fmt+0x50>
     468:      	mov	x22, x19
     46c:      	str	x22, [x29, #0xb8]
     470:      	ldr	x0, [x29, #0xa0]
     474:      	ldr	x1, [x29, #0xa8]
     478:      	ldr	q0, [x29, #0xb0]
     47c:      	str	q0, [x29, #0xd0]
     480:      	ldr	x2, [x29, #0xc0]
     484:      	str	x2, [x29, #0xe0]
     488:      	mov	x9, x0
     48c:      	mov	x0, x20
     490:      	mov	x10, x1
     494:      	mov	x1, x21
     498:      	mov	x2, x9
     49c:      	mov	x3, x10
     4a0:      	add	x4, x29, #0xd0
     4a4:      	bl	0x4a4 <_coil.fmt.Display$i64$display-fmt+0x88>
     4a8:      	ldp	x19, x20, [sp, #0x10]
     4ac:      	ldp	x21, x22, [sp, #0x20]
     4b0:      	ldp	x29, x30, [sp], #0xf0
     4b4:      	ret

00000000000004b8 <_coil.panic.finish!>:
     4b8:      	stp	x29, x30, [sp, #-0xb0]!
     4bc:      	mov	x29, sp
     4c0:      	str	x0, [x29, #0xa0]
     4c4:      	str	x1, [x29, #0xa8]
     4c8:      	ldr	x0, [x29, #0xa0]
     4cc:      	ldr	x1, [x29, #0xa8]
     4d0:      	bl	0x4d0 <_coil.panic.finish!+0x18>
     4d4:      	b	0x4d4 <_coil.panic.finish!+0x1c>

00000000000004d8 <_coil.panic.panicking>:
     4d8:      	adrp	x0, 0x0 <_gap_avec_get>
     4dc:      	add	x0, x0, #0x0
     4e0:      	ret

00000000000004e4 <_coil.panic.put!>:
     4e4:      	stp	x29, x30, [sp, #-0xc0]!
     4e8:      	mov	x29, sp
     4ec:      	str	x0, [x29, #0xa0]
     4f0:      	str	x1, [x29, #0xa8]
     4f4:      	ldr	x0, [x29, #0xa0]
     4f8:      	ldr	x1, [x29, #0xa8]
     4fc:      	bl	0x4fc <_coil.panic.put!+0x18>
     500:      	ldr	x1, [x29, #0xa0]
     504:      	ldr	x2, [x29, #0xa8]
     508:      	mov	x9, x0
     50c:      	mov	x0, x1
     510:      	mov	x1, x2
     514:      	str	x9, [x29, #0xb0]
     518:      	bl	0x518 <_coil.panic.put!+0x34>
     51c:      	mov	x9, x0
     520:      	mov	w0, #0x2                ; =2
     524:      	ldr	x1, [x29, #0xb0]
     528:      	mov	x2, x9
     52c:      	bl	0x52c <_coil.panic.put!+0x48>
     530:      	mov	w0, #0x0                ; =0
     534:      	ldp	x29, x30, [sp], #0xc0
     538:      	ret

000000000000053c <_coil.io.write-fd>:
     53c:      	stp	x29, x30, [sp, #-0x110]!
     540:      	mov	x29, sp
     544:      	stp	x19, x20, [sp, #0x10]
     548:      	str	x21, [sp, #0x20]
     54c:      	mov	x19, x8
     550:      	sxtw	x0, w0
     554:      	str	x0, [x29, #0xf0]
     558:      	str	x1, [x29, #0xf8]
     55c:      	str	x2, [x29, #0x100]
     560:      	ldr	x0, [x29, #0xf0]
     564:      	ldr	x1, [x29, #0xf8]
     568:      	ldr	x2, [x29, #0x100]
     56c:      	bl	0x56c <_coil.io.write-fd+0x30>
     570:      	mov	x20, x0
     574:      	cmp	x20, #0x0
     578:      	b.ge	0x59c <_coil.io.write-fd+0x60>
     57c:      	bl	0x57c <_coil.io.write-fd+0x40>
     580:      	mov	x21, x0
     584:      	ldr	x0, [x29, #0xf0]
     588:      	mov	x1, x21
     58c:      	mov	w2, #0x4                ; =4
     590:      	bl	0x590 <_coil.io.write-fd+0x54>
     594:      	cbz	x0, 0x5b0 <_coil.io.write-fd+0x74>
     598:      	b	0x560 <_coil.io.write-fd+0x24>
     59c:      	str	wzr, [x29, #0xa0]
     5a0:      	str	x20, [x29, #0xa8]
     5a4:      	add	x0, x29, #0xa0
     5a8:      	str	x0, [x29, #0xf8]
     5ac:      	b	0x5d4 <_coil.io.write-fd+0x98>
     5b0:      	mov	w0, #0x1                ; =1
     5b4:      	str	w0, [x29, #0xc0]
     5b8:      	mov	w0, #0x1                ; =1
     5bc:      	str	w0, [x29, #0xe0]
     5c0:      	str	x21, [x29, #0xe8]
     5c4:      	ldr	q0, [x29, #0xe0]
     5c8:      	stur	q0, [x29, #0xc8]
     5cc:      	add	x0, x29, #0xc0
     5d0:      	str	x0, [x29, #0xf8]
     5d4:      	ldr	x0, [x29, #0xf8]
     5d8:      	ldr	q0, [x0]
     5dc:      	str	q0, [x19]
     5e0:      	ldr	x1, [x0, #0x10]
     5e4:      	str	x1, [x19, #0x10]
     5e8:      	ldp	x19, x20, [sp, #0x10]
     5ec:      	ldr	x21, [sp, #0x20]
     5f0:      	ldp	x29, x30, [sp], #0x110
     5f4:      	ret

00000000000005f8 <_inherent$coil.fmt.Formatter$clear-spec!>:
     5f8:      	stp	x29, x30, [sp, #-0xe0]!
     5fc:      	mov	x29, sp
     600:      	add	x1, x0, #0x18
     604:      	add	x8, x29, #0xa0
     608:      	str	x0, [x29, #0xd0]
     60c:      	str	x1, [x29, #0xd8]
     610:      	bl	0x610 <_inherent$coil.fmt.Formatter$clear-spec!+0x18>
     614:      	ldr	x0, [x29, #0xd8]
     618:      	ldr	q0, [x29, #0xa0]
     61c:      	str	q0, [x0]
     620:      	ldr	q0, [x29, #0xb0]
     624:      	str	q0, [x0, #0x10]
     628:      	ldr	x1, [x29, #0xc0]
     62c:      	str	x1, [x0, #0x20]
     630:      	ldr	x0, [x29, #0xd0]
     634:      	strb	wzr, [x0, #0x40]
     638:      	mov	w0, #0x0                ; =0
     63c:      	ldp	x29, x30, [sp], #0xe0
     640:      	ret

0000000000000644 <_inherent$slice$data__u8>:
     644:      	stp	x29, x30, [sp, #-0xb0]!
     648:      	mov	x29, sp
     64c:      	str	x0, [x29, #0xa0]
     650:      	str	x1, [x29, #0xa8]
     654:      	ldr	x0, [x29, #0xa0]
     658:      	ldp	x29, x30, [sp], #0xb0
     65c:      	ret

0000000000000660 <_coil.core.Len$slice$len__u8>:
     660:      	stp	x29, x30, [sp, #-0xb0]!
     664:      	mov	x29, sp
     668:      	str	x0, [x29, #0xa0]
     66c:      	str	x1, [x29, #0xa8]
     670:      	ldr	x0, [x29, #0xa8]
     674:      	ldp	x29, x30, [sp], #0xb0
     678:      	ret

000000000000067c <_coil.io.write-all>:
     67c:      	stp	x29, x30, [sp, #-0x1d0]!
     680:      	mov	x29, sp
     684:      	stp	x19, x20, [sp, #0x10]
     688:      	stp	x21, x22, [sp, #0x20]
     68c:      	str	x23, [sp, #0x30]
     690:      	mov	x19, x8
     694:      	mov	x20, x0
     698:      	mov	x21, x1
     69c:      	mov	x22, x2
     6a0:      	cmp	x22, #0x0
     6a4:      	b.gt	0x6b8 <_coil.io.write-all+0x3c>
     6a8:      	str	wzr, [x29, #0xa0]
     6ac:      	str	xzr, [x29, #0xa8]
     6b0:      	add	x23, x29, #0xa0
     6b4:      	b	0x7d4 <_coil.io.write-all+0x158>
     6b8:      	add	x8, x29, #0xc0
     6bc:      	mov	x0, x20
     6c0:      	mov	x1, x21
     6c4:      	mov	x2, x22
     6c8:      	bl	0x6c8 <_coil.io.write-all+0x4c>
     6cc:      	ldr	w0, [x29, #0xc0]
     6d0:      	cmp	x0, #0x0
     6d4:      	b.eq	0x70c <_coil.io.write-all+0x90>
     6d8:      	cmp	x0, #0x1
     6dc:      	b.eq	0x6e8 <_coil.io.write-all+0x6c>
     6e0:      	b	0x6e4 <_coil.io.write-all+0x68>
     6e4:      	b	0x7ec <_coil.io.write-all+0x170>
     6e8:      	ldur	q0, [x29, #0xc8]
     6ec:      	str	q0, [x29, #0xe0]
     6f0:      	mov	w0, #0x1                ; =1
     6f4:      	str	w0, [x29, #0xf0]
     6f8:      	ldr	q0, [x29, #0xe0]
     6fc:      	stur	q0, [x29, #0xf8]
     700:      	add	x0, x29, #0xf0
     704:      	str	x0, [x29, #0x1b0]
     708:      	b	0x7d0 <_coil.io.write-all+0x154>
     70c:      	ldr	x0, [x29, #0xc8]
     710:      	cmp	x0, #0x0
     714:      	str	x0, [x29, #0x1b8]
     718:      	b.gt	0x744 <_coil.io.write-all+0xc8>
     71c:      	mov	w1, #0x1                ; =1
     720:      	str	w1, [x29, #0x110]
     724:      	mov	w1, #0x5                ; =5
     728:      	str	w1, [x29, #0x130]
     72c:      	ldr	q0, [x29, #0x130]
     730:      	mov	w16, #0x118             ; =280
     734:      	str	q0, [x29, x16]
     738:      	add	x1, x29, #0x110
     73c:      	str	x1, [x29, #0x1c0]
     740:      	b	0x7c8 <_coil.io.write-all+0x14c>
     744:      	ldr	x0, [x29, #0x1b8]
     748:      	add	x21, x21, x0
     74c:      	sub	x22, x22, x0
     750:      	add	x8, x29, #0x140
     754:      	mov	x9, x0
     758:      	mov	x0, x20
     75c:      	mov	x1, x21
     760:      	mov	x2, x22
     764:      	bl	0x764 <_coil.io.write-all+0xe8>
     768:      	ldr	w0, [x29, #0x140]
     76c:      	cmp	x0, #0x0
     770:      	b.eq	0x7ac <_coil.io.write-all+0x130>
     774:      	cmp	x0, #0x1
     778:      	b.eq	0x784 <_coil.io.write-all+0x108>
     77c:      	b	0x780 <_coil.io.write-all+0x104>
     780:      	b	0x7e8 <_coil.io.write-all+0x16c>
     784:      	mov	w16, #0x148             ; =328
     788:      	ldr	q0, [x29, x16]
     78c:      	str	q0, [x29, #0x160]
     790:      	mov	w0, #0x1                ; =1
     794:      	str	w0, [x29, #0x170]
     798:      	ldr	q0, [x29, #0x160]
     79c:      	mov	w16, #0x178             ; =376
     7a0:      	str	q0, [x29, x16]
     7a4:      	add	x20, x29, #0x170
     7a8:      	b	0x7c4 <_coil.io.write-all+0x148>
     7ac:      	ldr	x0, [x29, #0x148]
     7b0:      	str	wzr, [x29, #0x190]
     7b4:      	ldr	x1, [x29, #0x1b8]
     7b8:      	add	x1, x1, x0
     7bc:      	str	x1, [x29, #0x198]
     7c0:      	add	x20, x29, #0x190
     7c4:      	str	x20, [x29, #0x1c0]
     7c8:      	ldr	x0, [x29, #0x1c0]
     7cc:      	str	x0, [x29, #0x1b0]
     7d0:      	ldr	x23, [x29, #0x1b0]
     7d4:      	ldr	q0, [x23]
     7d8:      	str	q0, [x19]
     7dc:      	ldr	x0, [x23, #0x10]
     7e0:      	str	x0, [x19, #0x10]
     7e4:      	b	0x7f0 <_coil.io.write-all+0x174>
     7e8:      	brk	#0x1
     7ec:      	brk	#0x1
     7f0:      	ldp	x19, x20, [sp, #0x10]
     7f4:      	ldp	x21, x22, [sp, #0x20]
     7f8:      	ldr	x23, [sp, #0x30]
     7fc:      	ldp	x29, x30, [sp], #0x1d0
     800:      	ret

0000000000000804 <_coil.fmt.fmt--number__coil.fmt.IntDigits>:
     804:      	sub	sp, sp, #0x260
     808:      	stp	x29, x30, [sp]
     80c:      	mov	x29, sp
     810:      	stp	x19, x20, [sp, #0x10]
     814:      	stp	x21, x22, [sp, #0x20]
     818:      	str	x23, [sp, #0x30]
     81c:      	mov	x19, x4
     820:      	str	x2, [x29, #0xa0]
     824:      	str	x3, [x29, #0xa8]
     828:      	mov	x9, x0
     82c:      	str	x1, [x29, #0x158]
     830:      	str	x9, [x29, #0x240]
     834:      	bl	0x834 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x30>
     838:      	mov	x20, x0
     83c:      	add	x8, x29, #0xe0
     840:      	ldr	x0, [x29, #0x240]
     844:      	bl	0x844 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x40>
     848:      	ldr	q0, [x29, #0xe0]
     84c:      	str	q0, [x29, #0xb0]
     850:      	ldr	q0, [x29, #0xf0]
     854:      	str	q0, [x29, #0xc0]
     858:      	ldr	x0, [x29, #0x100]
     85c:      	str	x0, [x29, #0xd0]
     860:      	ldr	x21, [x29, #0xb8]
     864:      	ldr	x0, [x29, #0x158]
     868:      	cbz	x0, 0x88c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x88>
     86c:      	adrp	x0, 0x0 <_gap_avec_get>
     870:      	add	x0, x0, #0x0
     874:      	str	x0, [x29, #0x110]
     878:      	mov	w0, #0x1                ; =1
     87c:      	str	x0, [x29, #0x118]
     880:      	add	x0, x29, #0x110
     884:      	str	x0, [x29, #0x158]
     888:      	b	0x8d4 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0xd0>
     88c:      	ldrb	w0, [x29, #0xd0]
     890:      	cbz	x0, 0x8b4 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0xb0>
     894:      	adrp	x0, 0x0 <_gap_avec_get>
     898:      	add	x0, x0, #0x0
     89c:      	str	x0, [x29, #0x120]
     8a0:      	mov	w0, #0x1                ; =1
     8a4:      	str	x0, [x29, #0x128]
     8a8:      	add	x0, x29, #0x120
     8ac:      	str	x0, [x29, #0x240]
     8b0:      	b	0x8cc <_coil.fmt.fmt--number__coil.fmt.IntDigits+0xc8>
     8b4:      	adrp	x0, 0x0 <_gap_avec_get>
     8b8:      	add	x0, x0, #0x0
     8bc:      	str	x0, [x29, #0x130]
     8c0:      	str	xzr, [x29, #0x138]
     8c4:      	add	x0, x29, #0x130
     8c8:      	str	x0, [x29, #0x240]
     8cc:      	ldr	x0, [x29, #0x240]
     8d0:      	str	x0, [x29, #0x158]
     8d4:      	ldr	x0, [x29, #0xb0]
     8d8:      	cmp	x0, #0x0
     8dc:      	b.ge	0x938 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x134>
     8e0:      	ldr	x0, [x29, #0x158]
     8e4:      	ldr	x1, [x0]
     8e8:      	ldr	x2, [x0, #0x8]
     8ec:      	add	x8, x29, #0x160
     8f0:      	mov	x9, x0
     8f4:      	mov	x0, x20
     8f8:      	bl	0x8f8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0xf4>
     8fc:      	ldr	x0, [x29, #0xa0]
     900:      	ldr	x1, [x29, #0xa8]
     904:      	add	x8, x29, #0x180
     908:      	mov	x9, x0
     90c:      	mov	x0, x20
     910:      	mov	x10, x1
     914:      	mov	x1, x9
     918:      	mov	x2, x10
     91c:      	bl	0x91c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x118>
     920:      	mov	x0, x19
     924:      	mov	x1, x20
     928:      	mov	x2, x21
     92c:      	bl	0x92c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x128>
     930:      	str	x0, [x29, #0x240]
     934:      	b	0xae0 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x2dc>
     938:      	add	x0, x29, #0x140
     93c:      	add	x1, x29, #0x150
     940:      	bl	0x940 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x13c>
     944:      	mov	x9, x0
     948:      	mov	x0, x19
     94c:      	mov	x1, x9
     950:      	mov	x2, x21
     954:      	bl	0x954 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x150>
     958:      	ldr	x0, [x29, #0x158]
     95c:      	ldr	x1, [x0]
     960:      	ldr	x2, [x0, #0x8]
     964:      	mov	x9, x0
     968:      	mov	x0, x1
     96c:      	mov	x1, x2
     970:      	bl	0x970 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x16c>
     974:      	ldr	x1, [x29, #0xa0]
     978:      	ldr	x2, [x29, #0xa8]
     97c:      	mov	x9, x0
     980:      	mov	x0, x1
     984:      	mov	x1, x2
     988:      	str	x9, [x29, #0x248]
     98c:      	bl	0x98c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x188>
     990:      	ldr	x1, [x29, #0x150]
     994:      	add	x0, x0, x1
     998:      	ldr	x1, [x29, #0x248]
     99c:      	add	x1, x1, x0
     9a0:      	ldrb	w0, [x29, #0xd1]
     9a4:      	str	x1, [x29, #0x248]
     9a8:      	cbz	x0, 0xa58 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x254>
     9ac:      	ldr	x0, [x29, #0x158]
     9b0:      	ldr	x2, [x0]
     9b4:      	ldr	x3, [x0, #0x8]
     9b8:      	add	x8, x29, #0x1a0
     9bc:      	mov	x9, x0
     9c0:      	mov	x0, x20
     9c4:      	mov	x10, x1
     9c8:      	mov	x1, x2
     9cc:      	mov	x2, x3
     9d0:      	bl	0x9d0 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1cc>
     9d4:      	ldr	x0, [x29, #0xa0]
     9d8:      	ldr	x1, [x29, #0xa8]
     9dc:      	add	x8, x29, #0x1c0
     9e0:      	mov	x9, x0
     9e4:      	mov	x0, x20
     9e8:      	mov	x10, x1
     9ec:      	mov	x1, x9
     9f0:      	mov	x2, x10
     9f4:      	bl	0x9f4 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1f0>
     9f8:      	ldr	x0, [x29, #0xb0]
     9fc:      	ldr	x1, [x29, #0x248]
     a00:      	sub	x0, x0, x1
     a04:      	mov	w2, #0x0                ; =0
     a08:      	sub	x2, x2, #0x1
     a0c:      	str	x0, [x29, #0x250]
     a10:      	mov	x22, x2
     a14:      	add	x23, x22, #0x1
     a18:      	ldr	x0, [x29, #0x250]
     a1c:      	cmp	x23, x0
     a20:      	b.ge	0xa40 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x23c>
     a24:      	add	x8, x29, #0x1e0
     a28:      	mov	x9, x0
     a2c:      	mov	x0, x20
     a30:      	mov	w1, #0x30               ; =48
     a34:      	bl	0xa34 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x230>
     a38:      	mov	x22, x23
     a3c:      	b	0xa14 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x210>
     a40:      	mov	x0, x19
     a44:      	mov	x1, x20
     a48:      	mov	x2, x21
     a4c:      	bl	0xa4c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x248>
     a50:      	str	x0, [x29, #0x250]
     a54:      	b	0xad8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x2d4>
     a58:      	mov	x0, x20
     a5c:      	add	x1, x29, #0xb0
     a60:      	ldr	x2, [x29, #0x248]
     a64:      	mov	w3, #0x0                ; =0
     a68:      	bl	0xa68 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x264>
     a6c:      	ldr	x0, [x29, #0x158]
     a70:      	ldr	x1, [x0]
     a74:      	ldr	x0, [x0, #0x8]
     a78:      	add	x8, x29, #0x200
     a7c:      	mov	x9, x0
     a80:      	mov	x0, x20
     a84:      	mov	x2, x9
     a88:      	bl	0xa88 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x284>
     a8c:      	ldr	x0, [x29, #0xa0]
     a90:      	ldr	x1, [x29, #0xa8]
     a94:      	add	x8, x29, #0x220
     a98:      	mov	x9, x0
     a9c:      	mov	x0, x20
     aa0:      	mov	x10, x1
     aa4:      	mov	x1, x9
     aa8:      	mov	x2, x10
     aac:      	bl	0xaac <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x2a8>
     ab0:      	mov	x0, x19
     ab4:      	mov	x1, x20
     ab8:      	mov	x2, x21
     abc:      	bl	0xabc <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x2b8>
     ac0:      	mov	x0, x20
     ac4:      	add	x1, x29, #0xb0
     ac8:      	ldr	x2, [x29, #0x248]
     acc:      	mov	w3, #0x0                ; =0
     ad0:      	bl	0xad0 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x2cc>
     ad4:      	str	x0, [x29, #0x250]
     ad8:      	ldr	x0, [x29, #0x250]
     adc:      	str	x0, [x29, #0x240]
     ae0:      	ldr	x0, [x29, #0x240]
     ae4:      	ldp	x19, x20, [sp, #0x10]
     ae8:      	ldp	x21, x22, [sp, #0x20]
     aec:      	ldr	x23, [sp, #0x30]
     af0:      	ldp	x29, x30, [sp]
     af4:      	add	sp, sp, #0x260
     af8:      	ret

0000000000000afc <_coil.panic.finish-stderr!>:
     afc:      	stp	x29, x30, [sp, #-0x120]!
     b00:      	mov	x29, sp
     b04:      	str	x0, [x29, #0xa0]
     b08:      	str	x1, [x29, #0xa8]
     b0c:      	adrp	x0, 0x0 <_gap_avec_get>
     b10:      	add	x0, x0, #0x0
     b14:      	str	x0, [x29, #0xb0]
     b18:      	mov	w0, #0x1                ; =1
     b1c:      	str	x0, [x29, #0xb8]
     b20:      	ldr	x0, [x29, #0xb0]
     b24:      	ldr	x1, [x29, #0xb8]
     b28:      	bl	0xb28 <_coil.panic.finish-stderr!+0x2c>
     b2c:      	bl	0xb2c <_coil.panic.finish-stderr!+0x30>
     b30:      	ldr	q0, [x0]
     b34:      	str	q0, [x29, #0xc0]
     b38:      	ldr	x0, [x29, #0xa0]
     b3c:      	ldr	x1, [x29, #0xa8]
     b40:      	bl	0xb40 <_coil.panic.finish-stderr!+0x44>
     b44:      	cmp	x0, #0x0
     b48:      	b.le	0xb9c <_coil.panic.finish-stderr!+0xa0>
     b4c:      	adrp	x0, 0x0 <_gap_avec_get>
     b50:      	add	x0, x0, #0x0
     b54:      	str	x0, [x29, #0xd0]
     b58:      	mov	w0, #0x5                ; =5
     b5c:      	str	x0, [x29, #0xd8]
     b60:      	ldr	x0, [x29, #0xd0]
     b64:      	ldr	x1, [x29, #0xd8]
     b68:      	bl	0xb68 <_coil.panic.finish-stderr!+0x6c>
     b6c:      	ldr	x0, [x29, #0xa0]
     b70:      	ldr	x1, [x29, #0xa8]
     b74:      	bl	0xb74 <_coil.panic.finish-stderr!+0x78>
     b78:      	adrp	x0, 0x0 <_gap_avec_get>
     b7c:      	add	x0, x0, #0x0
     b80:      	str	x0, [x29, #0xe0]
     b84:      	mov	w0, #0x1                ; =1
     b88:      	str	x0, [x29, #0xe8]
     b8c:      	ldr	x0, [x29, #0xe0]
     b90:      	ldr	x1, [x29, #0xe8]
     b94:      	bl	0xb94 <_coil.panic.finish-stderr!+0x98>
     b98:      	b	0xc20 <_coil.panic.finish-stderr!+0x124>
     b9c:      	ldr	x0, [x29, #0xc0]
     ba0:      	ldr	x1, [x29, #0xc8]
     ba4:      	bl	0xba4 <_coil.panic.finish-stderr!+0xa8>
     ba8:      	cmp	x0, #0x0
     bac:      	b.le	0xc00 <_coil.panic.finish-stderr!+0x104>
     bb0:      	adrp	x0, 0x0 <_gap_avec_get>
     bb4:      	add	x0, x0, #0x0
     bb8:      	str	x0, [x29, #0xf0]
     bbc:      	mov	w0, #0x5                ; =5
     bc0:      	str	x0, [x29, #0xf8]
     bc4:      	ldr	x0, [x29, #0xf0]
     bc8:      	ldr	x1, [x29, #0xf8]
     bcc:      	bl	0xbcc <_coil.panic.finish-stderr!+0xd0>
     bd0:      	ldr	x0, [x29, #0xc0]
     bd4:      	ldr	x1, [x29, #0xc8]
     bd8:      	bl	0xbd8 <_coil.panic.finish-stderr!+0xdc>
     bdc:      	adrp	x0, 0x0 <_gap_avec_get>
     be0:      	add	x0, x0, #0x0
     be4:      	str	x0, [x29, #0x100]
     be8:      	mov	w0, #0x13               ; =19
     bec:      	str	x0, [x29, #0x108]
     bf0:      	ldr	x0, [x29, #0x100]
     bf4:      	ldr	x1, [x29, #0x108]
     bf8:      	bl	0xbf8 <_coil.panic.finish-stderr!+0xfc>
     bfc:      	b	0xc20 <_coil.panic.finish-stderr!+0x124>
     c00:      	adrp	x0, 0x0 <_gap_avec_get>
     c04:      	add	x0, x0, #0x0
     c08:      	str	x0, [x29, #0x110]
     c0c:      	mov	w0, #0x40               ; =64
     c10:      	str	x0, [x29, #0x118]
     c14:      	ldr	x0, [x29, #0x110]
     c18:      	ldr	x1, [x29, #0x118]
     c1c:      	bl	0xc1c <_coil.panic.finish-stderr!+0x120>
     c20:      	bl	0xc20 <_coil.panic.finish-stderr!+0x124>
     c24:      	bl	0xc24 <_coil.panic.finish-stderr!+0x128>
     c28:      	b	0xc28 <_coil.panic.finish-stderr!+0x12c>

0000000000000c2c <_coil.os.errno>:
     c2c:      	stp	x29, x30, [sp, #-0xa0]!
     c30:      	mov	x29, sp
     c34:      	bl	0xc34 <_coil.os.errno+0x8>
     c38:      	ldrsw	x0, [x0]
     c3c:      	ldp	x29, x30, [sp], #0xa0
     c40:      	ret

0000000000000c44 <_coil.io.fd-retry?>:
     c44:      	stp	x29, x30, [sp, #-0xa0]!
     c48:      	mov	x29, sp
     c4c:      	stp	x19, x20, [sp, #0x10]
     c50:      	stp	x21, x22, [sp, #0x20]
     c54:      	mov	x19, x1
     c58:      	sxtw	x20, w0
     c5c:      	sxth	x21, w2
     c60:      	cmp	x19, #0x4
     c64:      	b.ne	0xc70 <_coil.io.fd-retry?+0x2c>
     c68:      	mov	w22, #0x1               ; =1
     c6c:      	b	0xc98 <_coil.io.fd-retry?+0x54>
     c70:      	cmp	x19, #0x23
     c74:      	b.ne	0xc90 <_coil.io.fd-retry?+0x4c>
     c78:      	mov	x0, x20
     c7c:      	mov	x1, x21
     c80:      	mov	x2, #-0x2               ; =-2
     c84:      	bl	0xc84 <_coil.io.fd-retry?+0x40>
     c88:      	mov	x19, x0
     c8c:      	b	0xc94 <_coil.io.fd-retry?+0x50>
     c90:      	mov	w19, #0x0               ; =0
     c94:      	mov	x22, x19
     c98:      	mov	x0, x22
     c9c:      	ldp	x19, x20, [sp, #0x10]
     ca0:      	ldp	x21, x22, [sp, #0x20]
     ca4:      	ldp	x29, x30, [sp], #0xa0
     ca8:      	ret

0000000000000cac <_coil.fmt.plain-format-spec>:
     cac:      	stp	x29, x30, [sp, #-0x140]!
     cb0:      	mov	x29, sp
     cb4:      	str	xzr, [x29, #0xd0]
     cb8:      	str	xzr, [x29, #0xd8]
     cbc:      	str	xzr, [x29, #0xe0]
     cc0:      	str	xzr, [x29, #0xe8]
     cc4:      	str	xzr, [x29, #0xf0]
     cc8:      	ldr	q0, [x29, #0xd0]
     ccc:      	str	q0, [x29, #0xa0]
     cd0:      	ldr	q0, [x29, #0xe0]
     cd4:      	str	q0, [x29, #0xb0]
     cd8:      	ldr	x0, [x29, #0xf0]
     cdc:      	str	x0, [x29, #0xc0]
     ce0:      	mov	x0, #-0x1               ; =-1
     ce4:      	str	x0, [x29, #0xa0]
     ce8:      	mov	x0, #-0x1               ; =-1
     cec:      	str	x0, [x29, #0xa8]
     cf0:      	mov	w0, #0x20               ; =32
     cf4:      	str	w0, [x29, #0xb0]
     cf8:      	str	wzr, [x29, #0x100]
     cfc:      	ldr	x0, [x29, #0x100]
     d00:      	str	x0, [x29, #0xb8]
     d04:      	strb	wzr, [x29, #0xc0]
     d08:      	strb	wzr, [x29, #0xc1]
     d0c:      	ldr	q0, [x29, #0xa0]
     d10:      	str	q0, [x29, #0x110]
     d14:      	ldr	q0, [x29, #0xb0]
     d18:      	str	q0, [x29, #0x120]
     d1c:      	ldr	x0, [x29, #0xc0]
     d20:      	str	x0, [x29, #0x130]
     d24:      	ldr	q0, [x29, #0x110]
     d28:      	str	q0, [x8]
     d2c:      	ldr	q0, [x29, #0x120]
     d30:      	str	q0, [x8, #0x10]
     d34:      	ldr	x0, [x29, #0x130]
     d38:      	str	x0, [x8, #0x20]
     d3c:      	ldp	x29, x30, [sp], #0x140
     d40:      	ret

0000000000000d44 <_coil.io.write-some>:
     d44:      	stp	x29, x30, [sp, #-0xd0]!
     d48:      	mov	x29, sp
     d4c:      	ldr	x3, [x0]
     d50:      	ldr	x0, [x0, #0x8]
     d54:      	mov	x9, x8
     d58:      	add	x8, x29, #0xa0
     d5c:      	str	x9, [x29, #0xc0]
     d60:      	blr	x3
     d64:      	ldr	x0, [x29, #0xc0]
     d68:      	ldr	q0, [x29, #0xa0]
     d6c:      	str	q0, [x0]
     d70:      	ldr	x1, [x29, #0xb0]
     d74:      	str	x1, [x0, #0x10]
     d78:      	ldp	x29, x30, [sp], #0xd0
     d7c:      	ret

0000000000000d80 <_inherent$coil.fmt.Formatter$writer>:
     d80:      	ldr	x0, [x0]
     d84:      	ret

0000000000000d88 <_inherent$coil.fmt.Formatter$take-spec!>:
     d88:      	stp	x29, x30, [sp, #-0x100]!
     d8c:      	mov	x29, sp
     d90:      	stp	x19, x20, [sp, #0x10]
     d94:      	mov	x19, x8
     d98:      	mov	x20, x0
     d9c:      	ldrb	w0, [x20, #0x40]
     da0:      	cbz	x0, 0xdcc <_inherent$coil.fmt.Formatter$take-spec!+0x44>
     da4:      	strb	wzr, [x20, #0x40]
     da8:      	add	x20, x20, #0x18
     dac:      	ldr	q0, [x20]
     db0:      	str	q0, [x29, #0xa0]
     db4:      	ldr	q0, [x20, #0x10]
     db8:      	str	q0, [x29, #0xb0]
     dbc:      	ldr	x0, [x20, #0x20]
     dc0:      	str	x0, [x29, #0xc0]
     dc4:      	add	x20, x29, #0xa0
     dc8:      	b	0xdd8 <_inherent$coil.fmt.Formatter$take-spec!+0x50>
     dcc:      	add	x8, x29, #0xd0
     dd0:      	bl	0xdd0 <_inherent$coil.fmt.Formatter$take-spec!+0x48>
     dd4:      	add	x20, x29, #0xd0
     dd8:      	ldr	q0, [x20]
     ddc:      	str	q0, [x19]
     de0:      	ldr	q0, [x20, #0x10]
     de4:      	str	q0, [x19, #0x10]
     de8:      	ldr	x0, [x20, #0x20]
     dec:      	str	x0, [x19, #0x20]
     df0:      	ldp	x19, x20, [sp, #0x10]
     df4:      	ldp	x29, x30, [sp], #0x100
     df8:      	ret

0000000000000dfc <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits>:
     dfc:      	stp	x29, x30, [sp, #-0x110]!
     e00:      	mov	x29, sp
     e04:      	stp	x19, x20, [sp, #0x10]
     e08:      	mov	x19, x0
     e0c:      	mov	x20, x1
     e10:      	ldr	w0, [x19]
     e14:      	cmp	x0, #0x0
     e18:      	b.eq	0xe34 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x38>
     e1c:      	cmp	x0, #0x1
     e20:      	b.eq	0xe50 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x54>
     e24:      	cmp	x0, #0x2
     e28:      	b.eq	0xe6c <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x70>
     e2c:      	b	0xe30 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x34>
     e30:      	b	0xea4 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xa8>
     e34:      	ldr	x0, [x19, #0x8]
     e38:      	add	x8, x29, #0xa0
     e3c:      	mov	x9, x0
     e40:      	mov	x0, x20
     e44:      	mov	x1, x9
     e48:      	bl	0xe48 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x4c>
     e4c:      	b	0xe9c <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xa0>
     e50:      	ldr	x0, [x19, #0x8]
     e54:      	add	x8, x29, #0xc0
     e58:      	mov	x9, x0
     e5c:      	mov	x0, x20
     e60:      	mov	x1, x9
     e64:      	bl	0xe64 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x68>
     e68:      	b	0xe9c <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xa0>
     e6c:      	add	x19, x19, #0x8
     e70:      	ldr	q0, [x19]
     e74:      	str	q0, [x29, #0xe0]
     e78:      	ldr	x0, [x29, #0xe0]
     e7c:      	ldr	x1, [x29, #0xe8]
     e80:      	add	x8, x29, #0xf0
     e84:      	mov	x9, x0
     e88:      	mov	x0, x20
     e8c:      	mov	x10, x1
     e90:      	mov	x1, x9
     e94:      	mov	x2, x10
     e98:      	bl	0xe98 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x9c>
     e9c:      	mov	w0, #0x0                ; =0
     ea0:      	b	0xea8 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xac>
     ea4:      	brk	#0x1
     ea8:      	ldp	x19, x20, [sp, #0x10]
     eac:      	ldp	x29, x30, [sp], #0x110
     eb0:      	ret

0000000000000eb4 <_coil.fmt.counting-writer>:
     eb4:      	str	xzr, [x1]
     eb8:      	adrp	x2, 0x0 <_gap_avec_get>
     ebc:      	add	x2, x2, #0x0
     ec0:      	str	x2, [x0]
     ec4:      	str	x1, [x0, #0x8]
     ec8:      	ret

0000000000000ecc <_coil.io.write-byte>:
     ecc:      	stp	x29, x30, [sp, #-0xd0]!
     ed0:      	mov	x29, sp
     ed4:      	ubfx	x1, x1, #0, #8
     ed8:      	strb	w1, [x29, #0xa0]
     edc:      	mov	x9, x8
     ee0:      	add	x8, x29, #0xb0
     ee4:      	add	x1, x29, #0xa0
     ee8:      	mov	w2, #0x1                ; =1
     eec:      	str	x9, [x29, #0xa8]
     ef0:      	bl	0xef0 <_coil.io.write-byte+0x24>
     ef4:      	ldr	x0, [x29, #0xa8]
     ef8:      	ldr	q0, [x29, #0xb0]
     efc:      	str	q0, [x0]
     f00:      	ldr	x1, [x29, #0xc0]
     f04:      	str	x1, [x0, #0x10]
     f08:      	ldp	x29, x30, [sp], #0xd0
     f0c:      	ret

0000000000000f10 <_coil.fmt.fmt--pad-before>:
     f10:      	stp	x29, x30, [sp, #-0xb0]!
     f14:      	mov	x29, sp
     f18:      	stp	x19, x20, [sp, #0x10]
     f1c:      	stp	x21, x22, [sp, #0x20]
     f20:      	mov	x19, x0
     f24:      	mov	x20, x1
     f28:      	mov	x21, x3
     f2c:      	ldr	x0, [x20]
     f30:      	sub	x22, x0, x2
     f34:      	cmp	x22, #0x0
     f38:      	b.le	0xfcc <_coil.fmt.fmt--pad-before+0xbc>
     f3c:      	add	x0, x20, #0x18
     f40:      	ldr	x1, [x0]
     f44:      	str	x1, [x29, #0xa0]
     f48:      	ldr	w0, [x29, #0xa0]
     f4c:      	cmp	x0, #0x0
     f50:      	b.eq	0xfac <_coil.fmt.fmt--pad-before+0x9c>
     f54:      	cmp	x0, #0x1
     f58:      	b.eq	0xfa8 <_coil.fmt.fmt--pad-before+0x98>
     f5c:      	cmp	x0, #0x2
     f60:      	b.eq	0xf74 <_coil.fmt.fmt--pad-before+0x64>
     f64:      	cmp	x0, #0x3
     f68:      	b.eq	0xf88 <_coil.fmt.fmt--pad-before+0x78>
     f6c:      	b	0xf70 <_coil.fmt.fmt--pad-before+0x60>
     f70:      	b	0xfc8 <_coil.fmt.fmt--pad-before+0xb8>
     f74:      	mov	x0, x19
     f78:      	mov	x1, x20
     f7c:      	mov	x2, x22
     f80:      	bl	0xf80 <_coil.fmt.fmt--pad-before+0x70>
     f84:      	b	0xfc4 <_coil.fmt.fmt--pad-before+0xb4>
     f88:      	mov	w0, #0x2                ; =2
     f8c:      	sdiv	x1, x22, x0
     f90:      	mov	x0, x19
     f94:      	mov	x9, x1
     f98:      	mov	x1, x20
     f9c:      	mov	x2, x9
     fa0:      	bl	0xfa0 <_coil.fmt.fmt--pad-before+0x90>
     fa4:      	b	0xfc4 <_coil.fmt.fmt--pad-before+0xb4>
     fa8:      	b	0xfc4 <_coil.fmt.fmt--pad-before+0xb4>
     fac:      	cbz	x21, 0xfb4 <_coil.fmt.fmt--pad-before+0xa4>
     fb0:      	b	0xfc4 <_coil.fmt.fmt--pad-before+0xb4>
     fb4:      	mov	x0, x19
     fb8:      	mov	x1, x20
     fbc:      	mov	x2, x22
     fc0:      	bl	0xfc0 <_coil.fmt.fmt--pad-before+0xb0>
     fc4:      	b	0xfcc <_coil.fmt.fmt--pad-before+0xbc>
     fc8:      	brk	#0x1
     fcc:      	mov	w0, #0x0                ; =0
     fd0:      	ldp	x19, x20, [sp, #0x10]
     fd4:      	ldp	x21, x22, [sp, #0x20]
     fd8:      	ldp	x29, x30, [sp], #0xb0
     fdc:      	ret

0000000000000fe0 <_coil.fmt.fmt--pad-after>:
     fe0:      	stp	x29, x30, [sp, #-0xb0]!
     fe4:      	mov	x29, sp
     fe8:      	stp	x19, x20, [sp, #0x10]
     fec:      	stp	x21, x22, [sp, #0x20]
     ff0:      	mov	x19, x0
     ff4:      	mov	x20, x1
     ff8:      	mov	x21, x3
     ffc:      	ldr	x0, [x20]
    1000:      	sub	x22, x0, x2
    1004:      	cmp	x22, #0x0
    1008:      	b.le	0x10a0 <_coil.fmt.fmt--pad-after+0xc0>
    100c:      	add	x0, x20, #0x18
    1010:      	ldr	x1, [x0]
    1014:      	str	x1, [x29, #0xa0]
    1018:      	ldr	w0, [x29, #0xa0]
    101c:      	cmp	x0, #0x0
    1020:      	b.eq	0x1080 <_coil.fmt.fmt--pad-after+0xa0>
    1024:      	cmp	x0, #0x1
    1028:      	b.eq	0x1044 <_coil.fmt.fmt--pad-after+0x64>
    102c:      	cmp	x0, #0x2
    1030:      	b.eq	0x107c <_coil.fmt.fmt--pad-after+0x9c>
    1034:      	cmp	x0, #0x3
    1038:      	b.eq	0x1058 <_coil.fmt.fmt--pad-after+0x78>
    103c:      	b	0x1040 <_coil.fmt.fmt--pad-after+0x60>
    1040:      	b	0x109c <_coil.fmt.fmt--pad-after+0xbc>
    1044:      	mov	x0, x19
    1048:      	mov	x1, x20
    104c:      	mov	x2, x22
    1050:      	bl	0x1050 <_coil.fmt.fmt--pad-after+0x70>
    1054:      	b	0x1098 <_coil.fmt.fmt--pad-after+0xb8>
    1058:      	mov	w0, #0x2                ; =2
    105c:      	sdiv	x1, x22, x0
    1060:      	sub	x0, x22, x1
    1064:      	mov	x9, x0
    1068:      	mov	x0, x19
    106c:      	mov	x1, x20
    1070:      	mov	x2, x9
    1074:      	bl	0x1074 <_coil.fmt.fmt--pad-after+0x94>
    1078:      	b	0x1098 <_coil.fmt.fmt--pad-after+0xb8>
    107c:      	b	0x1098 <_coil.fmt.fmt--pad-after+0xb8>
    1080:      	cbz	x21, 0x1098 <_coil.fmt.fmt--pad-after+0xb8>
    1084:      	mov	x0, x19
    1088:      	mov	x1, x20
    108c:      	mov	x2, x22
    1090:      	bl	0x1090 <_coil.fmt.fmt--pad-after+0xb0>
    1094:      	b	0x1098 <_coil.fmt.fmt--pad-after+0xb8>
    1098:      	b	0x10a0 <_coil.fmt.fmt--pad-after+0xc0>
    109c:      	brk	#0x1
    10a0:      	mov	w0, #0x0                ; =0
    10a4:      	ldp	x19, x20, [sp, #0x10]
    10a8:      	ldp	x21, x22, [sp, #0x20]
    10ac:      	ldp	x29, x30, [sp], #0xb0
    10b0:      	ret

00000000000010b4 <_coil.panic.site-cell>:
    10b4:      	adrp	x0, 0x1000 <_coil.fmt.fmt--pad-after+0x20>
    10b8:      	add	x0, x0, #0x0
    10bc:      	ret

00000000000010c0 <_coil.panic.put-trace!>:
    10c0:      	stp	x29, x30, [sp, #-0xa0]!
    10c4:      	mov	x29, sp
    10c8:      	b	0x10cc <_coil.panic.put-trace!+0xc>
    10cc:      	ldp	x29, x30, [sp], #0xa0
    10d0:      	b	0x10d0 <_coil.panic.put-trace!+0x10>

00000000000010d4 <_coil.os.errno-cell>:
    10d4:      	stp	x29, x30, [sp, #-0xa0]!
    10d8:      	mov	x29, sp
    10dc:      	adrp	x0, 0x1000 <_coil.fmt.fmt--pad-after+0x20>
    10e0:      	add	x0, x0, #0x0
    10e4:      	mov	x1, #-0x2               ; =-2
    10e8:      	bl	0x10e8 <_coil.os.errno-cell+0x14>
    10ec:      	ldp	x29, x30, [sp], #0xa0
    10f0:      	ret

00000000000010f4 <_coil.io.poll-one>:
    10f4:      	stp	x29, x30, [sp, #-0xc0]!
    10f8:      	mov	x29, sp
    10fc:      	stp	x19, x20, [sp, #0x10]
    1100:      	sxtw	x0, w0
    1104:      	sxth	x1, w1
    1108:      	mov	x9, x0
    110c:      	adrp	x0, 0x1000 <_coil.fmt.fmt--pad-after+0x20>
    1110:      	add	x0, x0, #0x0
    1114:      	mov	x10, x1
    1118:      	adrp	x1, 0x1000 <_coil.fmt.fmt--pad-after+0x20>
    111c:      	add	x1, x1, #0x0
    1120:      	str	x9, [x29, #0xa8]
    1124:      	str	x10, [x29, #0xb0]
    1128:      	bl	0x1128 <_coil.io.poll-one+0x34>
    112c:      	mov	x19, x0
    1130:      	ldr	x0, [x29, #0xa8]
    1134:      	str	w0, [x29, #0xa0]
    1138:      	ldr	x0, [x29, #0xb0]
    113c:      	strh	w0, [x29, #0xa4]
    1140:      	strh	wzr, [x29, #0xa6]
    1144:      	cmp	x19, #0x0
    1148:      	b.ne	0x1154 <_coil.io.poll-one+0x60>
    114c:      	mov	w20, #0x0               ; =0
    1150:      	b	0x118c <_coil.io.poll-one+0x98>
    1154:      	add	x0, x29, #0xa0
    1158:      	mov	w1, #0x1                ; =1
    115c:      	mov	x2, #-0x1               ; =-1
    1160:      	blr	x19
    1164:      	sxtw	x0, w0
    1168:      	cmp	x0, #0x0
    116c:      	b.lt	0x1178 <_coil.io.poll-one+0x84>
    1170:      	mov	w19, #0x1               ; =1
    1174:      	b	0x1188 <_coil.io.poll-one+0x94>
    1178:      	bl	0x1178 <_coil.io.poll-one+0x84>
    117c:      	cmp	x0, #0x4
    1180:      	cset	x0, eq
    1184:      	mov	x19, x0
    1188:      	mov	x20, x19
    118c:      	mov	x0, x20
    1190:      	ldp	x19, x20, [sp, #0x10]
    1194:      	ldp	x29, x30, [sp], #0xc0
    1198:      	ret

000000000000119c <_coil.fmt.print-u>:
    119c:      	stp	x29, x30, [sp, #-0xe0]!
    11a0:      	mov	x29, sp
    11a4:      	stp	x19, x20, [sp, #0x10]
    11a8:      	stp	x21, x22, [sp, #0x20]
    11ac:      	mov	x19, x8
    11b0:      	mov	x20, x0
    11b4:      	mov	x21, x1
    11b8:      	cmp	x21, #0x0
    11bc:      	b.ne	0x11d8 <_coil.fmt.print-u+0x3c>
    11c0:      	add	x8, x29, #0xa0
    11c4:      	mov	x0, x20
    11c8:      	mov	w1, #0x30               ; =48
    11cc:      	bl	0x11cc <_coil.fmt.print-u+0x30>
    11d0:      	add	x22, x29, #0xa0
    11d4:      	b	0x11ec <_coil.fmt.print-u+0x50>
    11d8:      	add	x8, x29, #0xc0
    11dc:      	mov	x0, x20
    11e0:      	mov	x1, x21
    11e4:      	bl	0x11e4 <_coil.fmt.print-u+0x48>
    11e8:      	add	x22, x29, #0xc0
    11ec:      	ldr	q0, [x22]
    11f0:      	str	q0, [x19]
    11f4:      	ldr	x0, [x22, #0x10]
    11f8:      	str	x0, [x19, #0x10]
    11fc:      	ldp	x19, x20, [sp, #0x10]
    1200:      	ldp	x21, x22, [sp, #0x20]
    1204:      	ldp	x29, x30, [sp], #0xe0
    1208:      	ret

000000000000120c <_coil.fmt.print-uhex>:
    120c:      	stp	x29, x30, [sp, #-0xe0]!
    1210:      	mov	x29, sp
    1214:      	stp	x19, x20, [sp, #0x10]
    1218:      	stp	x21, x22, [sp, #0x20]
    121c:      	mov	x19, x8
    1220:      	mov	x20, x0
    1224:      	mov	x21, x1
    1228:      	cmp	x21, #0x0
    122c:      	b.ne	0x1248 <_coil.fmt.print-uhex+0x3c>
    1230:      	add	x8, x29, #0xa0
    1234:      	mov	x0, x20
    1238:      	mov	w1, #0x30               ; =48
    123c:      	bl	0x123c <_coil.fmt.print-uhex+0x30>
    1240:      	add	x22, x29, #0xa0
    1244:      	b	0x125c <_coil.fmt.print-uhex+0x50>
    1248:      	add	x8, x29, #0xc0
    124c:      	mov	x0, x20
    1250:      	mov	x1, x21
    1254:      	bl	0x1254 <_coil.fmt.print-uhex+0x48>
    1258:      	add	x22, x29, #0xc0
    125c:      	ldr	q0, [x22]
    1260:      	str	q0, [x19]
    1264:      	ldr	x0, [x22, #0x10]
    1268:      	str	x0, [x19, #0x10]
    126c:      	ldp	x19, x20, [sp, #0x10]
    1270:      	ldp	x21, x22, [sp, #0x20]
    1274:      	ldp	x29, x30, [sp], #0xe0
    1278:      	ret

000000000000127c <_coil.fmt.count--write>:
    127c:      	stp	x29, x30, [sp, #-0xc0]!
    1280:      	mov	x29, sp
    1284:      	ldr	x1, [x0]
    1288:      	add	x1, x1, x2
    128c:      	str	x1, [x0]
    1290:      	str	wzr, [x29, #0xa0]
    1294:      	str	x2, [x29, #0xa8]
    1298:      	ldr	q0, [x29, #0xa0]
    129c:      	str	q0, [x8]
    12a0:      	ldr	x0, [x29, #0xb0]
    12a4:      	str	x0, [x8, #0x10]
    12a8:      	ldp	x29, x30, [sp], #0xc0
    12ac:      	ret

00000000000012b0 <_coil.fmt.fmt--fill>:
    12b0:      	stp	x29, x30, [sp, #-0x120]!
    12b4:      	mov	x29, sp
    12b8:      	stp	x19, x20, [sp, #0x10]
    12bc:      	mov	w3, #0x0                ; =0
    12c0:      	sub	x3, x3, #0x1
    12c4:      	str	x0, [x29, #0xc8]
    12c8:      	str	x1, [x29, #0xf0]
    12cc:      	str	x2, [x29, #0xf8]
    12d0:      	str	x3, [x29, #0x100]
    12d4:      	ldr	x0, [x29, #0x100]
    12d8:      	add	x1, x0, #0x1
    12dc:      	ldr	x2, [x29, #0xf8]
    12e0:      	cmp	x1, x2
    12e4:      	b.ge	0x138c <_coil.fmt.fmt--fill+0xdc>
    12e8:      	ldr	x3, [x29, #0xf0]
    12ec:      	ldr	w4, [x3, #0x10]
    12f0:      	and	x5, x4, #0xff
    12f4:      	ubfx	x5, x5, #0, #32
    12f8:      	ubfx	x5, x5, #0, #8
    12fc:      	add	x8, x29, #0xa0
    1300:      	mov	x9, x0
    1304:      	ldr	x0, [x29, #0xc8]
    1308:      	mov	x10, x1
    130c:      	mov	x1, x5
    1310:      	str	x4, [x29, #0x108]
    1314:      	str	x10, [x29, #0x110]
    1318:      	bl	0x1318 <_coil.fmt.fmt--fill+0x68>
    131c:      	ldr	x19, [x29, #0x108]
    1320:      	lsr	x0, x19, #8
    1324:      	ubfx	x0, x0, #0, #32
    1328:      	str	w0, [x29, #0xc0]
    132c:      	str	wzr, [x29, #0xc4]
    1330:      	ldr	w0, [x29, #0xc0]
    1334:      	ldr	w1, [x29, #0xc4]
    1338:      	cmp	x0, x1
    133c:      	b.ne	0x1348 <_coil.fmt.fmt--fill+0x98>
    1340:      	mov	w20, #0x0               ; =0
    1344:      	b	0x134c <_coil.fmt.fmt--fill+0x9c>
    1348:      	mov	w20, #0x1               ; =1
    134c:      	cbz	x20, 0x1380 <_coil.fmt.fmt--fill+0xd0>
    1350:      	lsr	x0, x19, #8
    1354:      	ubfx	x20, x0, #0, #32
    1358:      	and	x0, x20, #0xff
    135c:      	ubfx	x0, x0, #0, #32
    1360:      	ubfx	x0, x0, #0, #8
    1364:      	add	x8, x29, #0xd0
    1368:      	mov	x9, x0
    136c:      	ldr	x0, [x29, #0xc8]
    1370:      	mov	x1, x9
    1374:      	bl	0x1374 <_coil.fmt.fmt--fill+0xc4>
    1378:      	mov	x19, x20
    137c:      	b	0x1320 <_coil.fmt.fmt--fill+0x70>
    1380:      	ldr	x0, [x29, #0x110]
    1384:      	str	x0, [x29, #0x100]
    1388:      	b	0x12d4 <_coil.fmt.fmt--fill+0x24>
    138c:      	mov	w0, #0x0                ; =0
    1390:      	ldp	x19, x20, [sp, #0x10]
    1394:      	ldp	x29, x30, [sp], #0x120
    1398:      	ret

000000000000139c <_coil.panic.put-trace-stderr!>:
    139c:      	sub	sp, sp, #0x2b0
    13a0:      	stp	x29, x30, [sp]
    13a4:      	mov	x29, sp
    13a8:      	str	x19, [sp, #0x10]
    13ac:      	add	x0, x29, #0xa0
    13b0:      	mov	w1, #0x40               ; =64
    13b4:      	bl	0x13b4 <_coil.panic.put-trace-stderr!+0x18>
    13b8:      	sxtw	x19, w0
    13bc:      	cmp	x19, #0x0
    13c0:      	b.le	0x13f8 <_coil.panic.put-trace-stderr!+0x5c>
    13c4:      	adrp	x0, 0x1000 <_coil.fmt.fmt--pad-after+0x20>
    13c8:      	add	x0, x0, #0x0
    13cc:      	str	x0, [x29, #0x2a0]
    13d0:      	mov	w0, #0xd                ; =13
    13d4:      	str	x0, [x29, #0x2a8]
    13d8:      	ldr	x0, [x29, #0x2a0]
    13dc:      	ldr	x1, [x29, #0x2a8]
    13e0:      	bl	0x13e0 <_coil.panic.put-trace-stderr!+0x44>
    13e4:      	add	x0, x29, #0xa0
    13e8:      	mov	x1, x19
    13ec:      	mov	w2, #0x2                ; =2
    13f0:      	bl	0x13f0 <_coil.panic.put-trace-stderr!+0x54>
    13f4:      	b	0x13f8 <_coil.panic.put-trace-stderr!+0x5c>
    13f8:      	mov	w0, #0x0                ; =0
    13fc:      	ldr	x19, [sp, #0x10]
    1400:      	ldp	x29, x30, [sp]
    1404:      	add	sp, sp, #0x2b0
    1408:      	ret

000000000000140c <_coil.os.dlsym-errno-cell>:
    140c:      	stp	x29, x30, [sp, #-0xa0]!
    1410:      	mov	x29, sp
    1414:      	mov	x9, x0
    1418:      	adrp	x0, 0x1000 <_coil.fmt.fmt--pad-after+0x20>
    141c:      	add	x0, x0, #0x0
    1420:      	mov	x10, x1
    1424:      	mov	x1, x9
    1428:      	mov	x2, x10
    142c:      	bl	0x142c <_coil.os.dlsym-errno-cell+0x20>
    1430:      	blr	x0
    1434:      	ldp	x29, x30, [sp], #0xa0
    1438:      	ret

000000000000143c <_coil.os.dlsym-cached>:
    143c:      	stp	x29, x30, [sp, #-0xb0]!
    1440:      	mov	x29, sp
    1444:      	stp	x19, x20, [sp, #0x10]
    1448:      	stp	x21, x22, [sp, #0x20]
    144c:      	mov	x19, x0
    1450:      	mov	x20, x1
    1454:      	mov	x21, x2
    1458:      	mov	x0, x19
    145c:      	bl	0x145c <_coil.os.dlsym-cached+0x20>
    1460:      	mov	x22, x0
    1464:      	cmp	x22, #0x0
    1468:      	b.ne	0x1494 <_coil.os.dlsym-cached+0x58>
    146c:      	mov	x0, x21
    1470:      	mov	x1, x20
    1474:      	bl	0x1474 <_coil.os.dlsym-cached+0x38>
    1478:      	mov	x9, x0
    147c:      	mov	x0, x19
    1480:      	mov	x1, x9
    1484:      	str	x9, [x29, #0xa0]
    1488:      	bl	0x1488 <_coil.os.dlsym-cached+0x4c>
    148c:      	ldr	x19, [x29, #0xa0]
    1490:      	b	0x1498 <_coil.os.dlsym-cached+0x5c>
    1494:      	mov	x19, x22
    1498:      	mov	x0, x19
    149c:      	ldp	x19, x20, [sp, #0x10]
    14a0:      	ldp	x21, x22, [sp, #0x20]
    14a4:      	ldp	x29, x30, [sp], #0xb0
    14a8:      	ret

00000000000014ac <_coil.fmt.udec-digits>:
    14ac:      	stp	x29, x30, [sp, #-0x130]!
    14b0:      	mov	x29, sp
    14b4:      	stp	x19, x20, [sp, #0x10]
    14b8:      	stp	x21, x22, [sp, #0x20]
    14bc:      	str	x23, [sp, #0x30]
    14c0:      	mov	x19, x8
    14c4:      	mov	x20, x0
    14c8:      	mov	x21, x1
    14cc:      	cmp	x21, #0x0
    14d0:      	b.ne	0x14e4 <_coil.fmt.udec-digits+0x38>
    14d4:      	str	wzr, [x29, #0xa0]
    14d8:      	str	xzr, [x29, #0xa8]
    14dc:      	add	x22, x29, #0xa0
    14e0:      	b	0x1564 <_coil.fmt.udec-digits+0xb8>
    14e4:      	mov	w0, #0xa                ; =10
    14e8:      	udiv	x1, x21, x0
    14ec:      	add	x8, x29, #0xc0
    14f0:      	mov	x0, x20
    14f4:      	bl	0x14f4 <_coil.fmt.udec-digits+0x48>
    14f8:      	ldr	w0, [x29, #0xc0]
    14fc:      	cmp	x0, #0x0
    1500:      	b.eq	0x1534 <_coil.fmt.udec-digits+0x88>
    1504:      	cmp	x0, #0x1
    1508:      	b.eq	0x1514 <_coil.fmt.udec-digits+0x68>
    150c:      	b	0x1510 <_coil.fmt.udec-digits+0x64>
    1510:      	b	0x1578 <_coil.fmt.udec-digits+0xcc>
    1514:      	ldur	q0, [x29, #0xc8]
    1518:      	str	q0, [x29, #0xe0]
    151c:      	mov	w0, #0x1                ; =1
    1520:      	str	w0, [x29, #0xf0]
    1524:      	ldr	q0, [x29, #0xe0]
    1528:      	stur	q0, [x29, #0xf8]
    152c:      	add	x23, x29, #0xf0
    1530:      	b	0x1560 <_coil.fmt.udec-digits+0xb4>
    1534:      	ldr	x0, [x29, #0xc8]
    1538:      	mov	w0, #0xa                ; =10
    153c:      	udiv	x1, x21, x0
    1540:      	msub	x2, x1, x0, x21
    1544:      	add	x2, x2, #0x30
    1548:      	ubfx	x2, x2, #0, #8
    154c:      	add	x8, x29, #0x110
    1550:      	mov	x0, x20
    1554:      	mov	x1, x2
    1558:      	bl	0x1558 <_coil.fmt.udec-digits+0xac>
    155c:      	add	x23, x29, #0x110
    1560:      	mov	x22, x23
    1564:      	ldr	q0, [x22]
    1568:      	str	q0, [x19]
    156c:      	ldr	x0, [x22, #0x10]
    1570:      	str	x0, [x19, #0x10]
    1574:      	b	0x157c <_coil.fmt.udec-digits+0xd0>
    1578:      	brk	#0x1
    157c:      	ldp	x19, x20, [sp, #0x10]
    1580:      	ldp	x21, x22, [sp, #0x20]
    1584:      	ldr	x23, [sp, #0x30]
    1588:      	ldp	x29, x30, [sp], #0x130
    158c:      	ret

0000000000001590 <_coil.fmt.uhex-digits>:
    1590:      	stp	x29, x30, [sp, #-0x140]!
    1594:      	mov	x29, sp
    1598:      	stp	x19, x20, [sp, #0x10]
    159c:      	stp	x21, x22, [sp, #0x20]
    15a0:      	str	x23, [sp, #0x30]
    15a4:      	mov	x19, x8
    15a8:      	mov	x20, x0
    15ac:      	mov	x21, x1
    15b0:      	cmp	x21, #0x0
    15b4:      	b.ne	0x15c8 <_coil.fmt.uhex-digits+0x38>
    15b8:      	str	wzr, [x29, #0xa0]
    15bc:      	str	xzr, [x29, #0xa8]
    15c0:      	add	x22, x29, #0xa0
    15c4:      	b	0x1668 <_coil.fmt.uhex-digits+0xd8>
    15c8:      	mov	w0, #0x10               ; =16
    15cc:      	udiv	x1, x21, x0
    15d0:      	add	x8, x29, #0xc0
    15d4:      	mov	x0, x20
    15d8:      	bl	0x15d8 <_coil.fmt.uhex-digits+0x48>
    15dc:      	ldr	w0, [x29, #0xc0]
    15e0:      	cmp	x0, #0x0
    15e4:      	b.eq	0x1618 <_coil.fmt.uhex-digits+0x88>
    15e8:      	cmp	x0, #0x1
    15ec:      	b.eq	0x15f8 <_coil.fmt.uhex-digits+0x68>
    15f0:      	b	0x15f4 <_coil.fmt.uhex-digits+0x64>
    15f4:      	b	0x167c <_coil.fmt.uhex-digits+0xec>
    15f8:      	ldur	q0, [x29, #0xc8]
    15fc:      	str	q0, [x29, #0xe0]
    1600:      	mov	w0, #0x1                ; =1
    1604:      	str	w0, [x29, #0xf0]
    1608:      	ldr	q0, [x29, #0xe0]
    160c:      	stur	q0, [x29, #0xf8]
    1610:      	add	x23, x29, #0xf0
    1614:      	b	0x1664 <_coil.fmt.uhex-digits+0xd4>
    1618:      	ldr	x0, [x29, #0xc8]
    161c:      	mov	w0, #0x10               ; =16
    1620:      	udiv	x1, x21, x0
    1624:      	msub	x2, x1, x0, x21
    1628:      	cmp	x2, #0xa
    162c:      	str	x2, [x29, #0x130]
    1630:      	b.ge	0x1640 <_coil.fmt.uhex-digits+0xb0>
    1634:      	add	x0, x2, #0x30
    1638:      	mov	x21, x0
    163c:      	b	0x164c <_coil.fmt.uhex-digits+0xbc>
    1640:      	ldr	x0, [x29, #0x130]
    1644:      	add	x0, x0, #0x57
    1648:      	mov	x21, x0
    164c:      	ubfx	x21, x21, #0, #8
    1650:      	add	x8, x29, #0x110
    1654:      	mov	x0, x20
    1658:      	mov	x1, x21
    165c:      	bl	0x165c <_coil.fmt.uhex-digits+0xcc>
    1660:      	add	x23, x29, #0x110
    1664:      	mov	x22, x23
    1668:      	ldr	q0, [x22]
    166c:      	str	q0, [x19]
    1670:      	ldr	x0, [x22, #0x10]
    1674:      	str	x0, [x19, #0x10]
    1678:      	b	0x1680 <_coil.fmt.uhex-digits+0xf0>
    167c:      	brk	#0x1
    1680:      	ldp	x19, x20, [sp, #0x10]
    1684:      	ldp	x21, x22, [sp, #0x20]
    1688:      	ldr	x23, [sp, #0x30]
    168c:      	ldp	x29, x30, [sp], #0x140
    1690:      	ret

0000000000001694 <_coil.atomic.read-ptr__i8>:
    1694:      	ldar	x1, [x0]
    1698:      	mov	x0, x1
    169c:      	ret

00000000000016a0 <_coil.atomic.store-ptr__i8>:
    16a0:      	stlr	x1, [x0]
    16a4:      	mov	w0, #0x0                ; =0
    16a8:      	ret
