
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-iterator-results/build/packed-switch-bench/verifier/before-stogir.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_verify_graph>:
       0:      	sub	sp, sp, #0x30
       4:      	str	x29, [sp]
       8:      	str	x30, [sp, #0x8]
       c:      	mov	x29, sp
      10:      	str	x19, [sp, #0x10]
      14:      	str	x20, [sp, #0x18]
      18:      	str	x21, [sp, #0x20]
      1c:      	sub	sp, sp, #0x20
      20:      	mov	x19, sp
      24:      	sub	sp, sp, #0x1a0
      28:      	mov	x20, sp
      2c:      	mov	x8, x19
      30:      	mov	x21, x0
      34:      	mov	x1, #0x8                ; =8
      38:      	bl	0x38 <_gap_verify_graph+0x38>
		0000000000000038:  ARM64_RELOC_BRANCH26	_stogir.verify.integer-operations-target
      3c:      	ldr	w0, [x19]
      40:      	lsr	x16, x0, #0
      44:      	cmp	x16, #0x1
      48:      	b.eq	0x64 <_gap_verify_graph+0x64>
      4c:      	b.lo	0x54 <_gap_verify_graph+0x54>
      50:      	b	0x68 <_gap_verify_graph+0x68>
      54:      	cmp	x16, #0x0
      58:      	b.eq	0x60 <_gap_verify_graph+0x60>
      5c:      	b	0x68 <_gap_verify_graph+0x68>
      60:      	b	0x74 <_gap_verify_graph+0x74>
      64:      	b	0x6c <_gap_verify_graph+0x6c>
      68:      	b	0xc4 <_gap_verify_graph+0xc4>
      6c:      	movn	x0, #0x0, lsl #48
      70:      	b	0xa4 <_gap_verify_graph+0xa4>
      74:      	movz	x0, #0x0, lsl #48
      78:      	b	0x98 <_gap_verify_graph+0x98>
      7c:      	nop
      80:      	add	x1, x0, #0x8
      84:      	add	x2, x20, x0
      88:      	add	x0, x21, x0
      8c:      	ldr	x0, [x0]
      90:      	str	x0, [x2]
      94:      	mov	x0, x1
      98:      	cmp	x0, #0x1a0
      9c:      	b.lo	0x80 <_gap_verify_graph+0x80>
      a0:      	ldr	x0, [x20, #0x8]
      a4:      	sub	sp, x29, #0x0
      a8:      	ldr	x19, [sp, #0x10]
      ac:      	ldr	x20, [sp, #0x18]
      b0:      	ldr	x21, [sp, #0x20]
      b4:      	ldr	x29, [sp]
      b8:      	ldr	x30, [sp, #0x8]
      bc:      	add	sp, sp, #0x30
      c0:      	ret
      c4:      	brk	#0
      c8:      	b	0xc4 <_gap_verify_graph+0xc4>

00000000000000cc <_stogir.verify.integer-operations-target>:
      cc:      	sub	sp, sp, #0x40
      d0:      	str	x29, [sp]
      d4:      	str	x30, [sp, #0x8]
      d8:      	mov	x29, sp
      dc:      	str	x19, [sp, #0x10]
      e0:      	str	x20, [sp, #0x18]
      e4:      	str	x21, [sp, #0x20]
      e8:      	str	x22, [sp, #0x28]
      ec:      	str	x23, [sp, #0x30]
      f0:      	sub	sp, sp, #0x20
      f4:      	mov	x19, sp
      f8:      	sub	sp, sp, #0x20
      fc:      	mov	x20, sp
     100:      	mov	x21, x8
     104:      	mov	x8, x19
     108:      	mov	x22, x0
     10c:      	mov	w23, w1
     110:      	bl	0x110 <_stogir.verify.integer-operations-target+0x44>
		0000000000000110:  ARM64_RELOC_BRANCH26	_stogir.verify.structure
     114:      	ldr	w0, [x19]
     118:      	lsr	x16, x0, #0
     11c:      	cmp	x16, #0x1
     120:      	b.eq	0x13c <_stogir.verify.integer-operations-target+0x70>
     124:      	b.lo	0x12c <_stogir.verify.integer-operations-target+0x60>
     128:      	b	0x140 <_stogir.verify.integer-operations-target+0x74>
     12c:      	cmp	x16, #0x0
     130:      	b.eq	0x138 <_stogir.verify.integer-operations-target+0x6c>
     134:      	b	0x140 <_stogir.verify.integer-operations-target+0x74>
     138:      	b	0x15c <_stogir.verify.integer-operations-target+0x90>
     13c:      	b	0x144 <_stogir.verify.integer-operations-target+0x78>
     140:      	b	0x1b0 <_stogir.verify.integer-operations-target+0xe4>
     144:      	add	x0, x19, #0x8
     148:      	ldr	x1, [x19, #0x8]
     14c:      	ldr	x0, [x0, #0x8]
     150:      	mov	x2, x0
     154:      	mov	x0, #0x1                ; =1
     158:      	b	0x17c <_stogir.verify.integer-operations-target+0xb0>
     15c:      	lsr	w23, w23, #0
     160:      	mov	x8, x20
     164:      	mov	x0, x22
     168:      	mov	w1, w23
     16c:      	bl	0x16c <_stogir.verify.integer-operations-target+0xa0>
		000000000000016c:  ARM64_RELOC_BRANCH26	_stogir.verify.integer-operations-target-structured
     170:      	ldr	x0, [x20]
     174:      	ldr	x1, [x20, #0x8]
     178:      	ldr	x2, [x20, #0x10]
     17c:      	str	x0, [x21]
     180:      	str	x1, [x21, #0x8]
     184:      	str	x2, [x21, #0x10]
     188:      	sub	sp, x29, #0x0
     18c:      	ldr	x19, [sp, #0x10]
     190:      	ldr	x20, [sp, #0x18]
     194:      	ldr	x21, [sp, #0x20]
     198:      	ldr	x22, [sp, #0x28]
     19c:      	ldr	x23, [sp, #0x30]
     1a0:      	ldr	x29, [sp]
     1a4:      	ldr	x30, [sp, #0x8]
     1a8:      	add	sp, sp, #0x40
     1ac:      	ret
     1b0:      	brk	#0
     1b4:      	b	0x1b0 <_stogir.verify.integer-operations-target+0xe4>

00000000000001b8 <_coil.core.Len$coil.arraylist.ArrayList$len__stogir.node.Node>:
     1b8:      	ldr	x0, [x0, #0x8]
     1bc:      	ret

00000000000001c0 <_stogir.verify.structure>:
     1c0:      	sub	sp, sp, #0x1d0
     1c4:      	str	x29, [sp]
     1c8:      	str	x30, [sp, #0x8]
     1cc:      	mov	x29, sp
     1d0:      	str	x19, [sp, #0x178]
     1d4:      	str	x20, [sp, #0x180]
     1d8:      	str	x21, [sp, #0x188]
     1dc:      	str	x22, [sp, #0x190]
     1e0:      	str	x23, [sp, #0x198]
     1e4:      	str	x24, [sp, #0x1a0]
     1e8:      	str	x25, [sp, #0x1a8]
     1ec:      	str	x26, [sp, #0x1b0]
     1f0:      	str	x27, [sp, #0x1b8]
     1f4:      	str	x28, [sp, #0x1c0]
     1f8:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000001f8:  ARM64_RELOC_PAGE21	l_stogir.298
     1fc:      	ldr	x16, [x16]
		00000000000001fc:  ARM64_RELOC_PAGEOFF12	l_stogir.298
     200:      	orr	x19, x16, xzr
     204:      	sub	sp, sp, #0x10
     208:      	mov	x20, sp
     20c:      	add	x1, x0, #0x78
     210:      	sub	sp, sp, #0x10
     214:      	mov	x21, sp
     218:      	sub	sp, sp, #0x20
     21c:      	mov	x22, sp
     220:      	ldr	x2, [x0, #0x8]
     224:      	ldr	x1, [x1, #0x8]
     228:      	cmp	x2, x1
     22c:      	b.ne	0x264 <_stogir.verify.structure+0xa4>
     230:      	mov	x1, x19
     234:      	movz	x2, #0x0, lsl #48
     238:      	b	0x274 <_stogir.verify.structure+0xb4>
     23c:      	ldr	x0, [x29, #0xf8]
     240:      	ldr	x2, [x29, #0x100]
     244:      	add	x0, x2, x0
     248:      	ldr	x19, [x29, #0xa0]
     24c:      	add	x1, x19, #0x1
     250:      	lsr	w1, w1, #0
     254:      	sxtw	x1, w1
     258:      	ldr	x2, [x29, #0x130]
     25c:      	ldr	x3, [x29, #0x138]
     260:      	b	0x350 <_stogir.verify.structure+0x190>
     264:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000264:  ARM64_RELOC_PAGE21	l_stogir.299
     268:      	ldr	x16, [x16]
		0000000000000268:  ARM64_RELOC_PAGEOFF12	l_stogir.299
     26c:      	orr	x1, x16, xzr
     270:      	mov	x2, #0x2c               ; =44
     274:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000274:  ARM64_RELOC_PAGE21	l_stogir.300
     278:      	ldr	x16, [x16]
		0000000000000278:  ARM64_RELOC_PAGEOFF12	l_stogir.300
     27c:      	orr	x23, x16, xzr
     280:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000280:  ARM64_RELOC_PAGE21	l_stogir.301
     284:      	ldr	x16, [x16]
		0000000000000284:  ARM64_RELOC_PAGEOFF12	l_stogir.301
     288:      	orr	x24, x16, xzr
     28c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000028c:  ARM64_RELOC_PAGE21	l_stogir.302
     290:      	ldr	x16, [x16]
		0000000000000290:  ARM64_RELOC_PAGEOFF12	l_stogir.302
     294:      	orr	x25, x16, xzr
     298:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000298:  ARM64_RELOC_PAGE21	l_stogir.303
     29c:      	ldr	x16, [x16]
		000000000000029c:  ARM64_RELOC_PAGEOFF12	l_stogir.303
     2a0:      	orr	x26, x16, xzr
     2a4:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000002a4:  ARM64_RELOC_PAGE21	l_stogir.304
     2a8:      	ldr	x16, [x16]
		00000000000002a8:  ARM64_RELOC_PAGEOFF12	l_stogir.304
     2ac:      	orr	x27, x16, xzr
     2b0:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000002b0:  ARM64_RELOC_PAGE21	l_stogir.305
     2b4:      	ldr	x16, [x16]
		00000000000002b4:  ARM64_RELOC_PAGEOFF12	l_stogir.305
     2b8:      	orr	x28, x16, xzr
     2bc:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000002bc:  ARM64_RELOC_PAGE21	l_stogir.306
     2c0:      	ldr	x16, [x16]
		00000000000002c0:  ARM64_RELOC_PAGEOFF12	l_stogir.306
     2c4:      	orr	x3, x16, xzr
     2c8:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000002c8:  ARM64_RELOC_PAGE21	l_stogir.307
     2cc:      	ldr	x16, [x16]
		00000000000002cc:  ARM64_RELOC_PAGEOFF12	l_stogir.307
     2d0:      	orr	x4, x16, xzr
     2d4:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000002d4:  ARM64_RELOC_PAGE21	l_stogir.308
     2d8:      	ldr	x16, [x16]
		00000000000002d8:  ARM64_RELOC_PAGEOFF12	l_stogir.308
     2dc:      	orr	x5, x16, xzr
     2e0:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000002e0:  ARM64_RELOC_PAGE21	l_stogir.309
     2e4:      	ldr	x16, [x16]
		00000000000002e4:  ARM64_RELOC_PAGEOFF12	l_stogir.309
     2e8:      	orr	x6, x16, xzr
     2ec:      	add	x7, x0, #0x110
     2f0:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000002f0:  ARM64_RELOC_PAGE21	l_stogir.310
     2f4:      	ldr	x16, [x16]
		00000000000002f4:  ARM64_RELOC_PAGEOFF12	l_stogir.310
     2f8:      	orr	x9, x16, xzr
     2fc:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000002fc:  ARM64_RELOC_PAGE21	l_stogir.310
     300:      	ldr	x16, [x16]
		0000000000000300:  ARM64_RELOC_PAGEOFF12	l_stogir.310
     304:      	orr	x10, x16, xzr
     308:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000308:  ARM64_RELOC_PAGE21	l_stogir.311
     30c:      	ldr	x16, [x16]
		000000000000030c:  ARM64_RELOC_PAGEOFF12	l_stogir.311
     310:      	orr	x11, x16, xzr
     314:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000314:  ARM64_RELOC_PAGE21	l_stogir.312
     318:      	ldr	x16, [x16]
		0000000000000318:  ARM64_RELOC_PAGEOFF12	l_stogir.312
     31c:      	orr	x12, x16, xzr
     320:      	add	x13, x0, #0x78
     324:      	add	x14, x0, #0x28
     328:      	add	x15, x0, #0x50
     32c:      	str	x0, [x29, #0x18]
     330:      	str	x1, [x29, #0x10]
     334:      	mov	x0, x2
     338:      	mov	x1, #0x1                ; =1
     33c:      	movz	x2, #0x0, lsl #48
     340:      	b	0x3f8 <_stogir.verify.structure+0x238>
     344:      	mov	x1, x19
     348:      	ldr	x2, [x29, #0x60]
     34c:      	mov	x3, #0x16               ; =22
     350:      	b	0x38c <_stogir.verify.structure+0x1cc>
     354:      	nop
     358:      	mov	x0, x21
     35c:      	ldr	x21, [x29, #0x90]
     360:      	str	x24, [x29, #0xc8]
     364:      	str	x25, [x29, #0xd0]
     368:      	str	x26, [x29, #0xf0]
     36c:      	str	x27, [x29, #0xc0]
     370:      	str	x28, [x29, #0xb8]
     374:      	str	x19, [x29, #0xb0]
     378:      	ldr	x19, [x29, #0xa0]
     37c:      	str	x22, [x29, #0xa8]
     380:      	mov	x1, x19
     384:      	ldr	x2, [x29, #0x30]
     388:      	mov	x3, #0x23               ; =35
     38c:      	ldr	x8, [x29, #0x88]
     390:      	str	x23, [x29, #0x18]
     394:      	ldr	x19, [x29, #0x28]
     398:      	ldr	x23, [x29, #0x30]
     39c:      	ldr	x24, [x29, #0x60]
     3a0:      	ldr	x25, [x29, #0x68]
     3a4:      	ldr	x26, [x29, #0x70]
     3a8:      	ldr	x27, [x29, #0x78]
     3ac:      	ldr	x28, [x29, #0x80]
     3b0:      	ldr	x4, [x29, #0x40]
     3b4:      	mov	x22, x21
     3b8:      	ldr	x21, [x29, #0x98]
     3bc:      	ldr	x5, [x29, #0x48]
     3c0:      	ldr	x6, [x29, #0x50]
     3c4:      	ldr	x7, [x29, #0x58]
     3c8:      	ldr	x9, [x29, #0xc8]
     3cc:      	ldr	x10, [x29, #0xd0]
     3d0:      	ldr	x11, [x29, #0xf0]
     3d4:      	ldr	x12, [x29, #0xc0]
     3d8:      	ldr	x13, [x29, #0xb8]
     3dc:      	ldr	x14, [x29, #0xb0]
     3e0:      	ldr	x15, [x29, #0xa8]
     3e4:      	str	x2, [x29, #0x10]
     3e8:      	mov	x2, x1
     3ec:      	mov	x1, x0
     3f0:      	mov	x0, x3
     3f4:      	ldr	x3, [x29, #0x38]
     3f8:      	cmp	x0, #0x0
     3fc:      	b.ne	0xed0 <_stogir.verify.structure+0xd10>
     400:      	cmp	x0, #0x0
     404:      	b.ne	0x534 <_stogir.verify.structure+0x374>
     408:      	str	x2, [x29, #0xa0]
     40c:      	str	x8, [x29, #0x88]
     410:      	str	x19, [x29, #0x28]
     414:      	str	x23, [x29, #0x30]
     418:      	ldr	x23, [x29, #0x18]
     41c:      	str	x24, [x29, #0x60]
     420:      	str	x25, [x29, #0x68]
     424:      	str	x26, [x29, #0x70]
     428:      	str	x27, [x29, #0x78]
     42c:      	str	x28, [x29, #0x80]
     430:      	str	x21, [x29, #0x98]
     434:      	mov	x21, x1
     438:      	str	x3, [x29, #0x38]
     43c:      	str	x4, [x29, #0x40]
     440:      	str	x22, [x29, #0x90]
     444:      	str	x5, [x29, #0x48]
     448:      	str	x6, [x29, #0x50]
     44c:      	str	x7, [x29, #0x58]
     450:      	mov	x24, x9
     454:      	mov	x25, x10
     458:      	mov	x26, x11
     45c:      	mov	x27, x12
     460:      	mov	x28, x13
     464:      	mov	x19, x14
     468:      	mov	x22, x15
     46c:      	str	x0, [x29, #0x20]
     470:      	ldr	x0, [x23, #0x8]
     474:      	cmp	x21, x0
     478:      	b.ge	0xee4 <_stogir.verify.structure+0xd24>
     47c:      	lsl	x0, x21, #4
     480:      	lsl	x1, x21, #2
     484:      	ldr	x2, [x23]
     488:      	add	x0, x0, x2
     48c:      	ldr	x2, [x0]
     490:      	ldr	x0, [x0, #0x8]
     494:      	str	x2, [x20]
     498:      	str	x0, [x20, #0x8]
     49c:      	ldr	x0, [x23, #0x78]
     4a0:      	add	x0, x1, x0
     4a4:      	ldr	w0, [x0]
     4a8:      	sxtw	x0, w0
     4ac:      	cmp	x0, #0x0
     4b0:      	b.lt	0x358 <_stogir.verify.structure+0x198>
     4b4:      	mov	x17, #0xffff            ; =65535
     4b8:      	cmp	x0, x17
     4bc:      	b.gt	0xeec <_stogir.verify.structure+0xd2c>
     4c0:      	uxtb	w1, w2
     4c4:      	orr	x2, x1, xzr
     4c8:      	cmp	x2, #0x83
     4cc:      	cset	w3, lt
     4d0:      	uxtb	w16, w3
     4d4:      	cmp	w16, wzr
     4d8:      	b.eq	0xf18 <_stogir.verify.structure+0xd58>
     4dc:      	ldr	w4, [x20]
     4e0:      	ubfx	x4, x4, #8, #8
     4e4:      	lsr	w4, w4, #0
     4e8:      	str	x22, [x29, #0xa8]
     4ec:      	mov	x22, x0
     4f0:      	mov	w0, w4
     4f4:      	str	x19, [x29, #0xb0]
     4f8:      	mov	w19, w1
     4fc:      	str	x28, [x29, #0xb8]
     500:      	mov	x28, x2
     504:      	str	x27, [x29, #0xc0]
     508:      	mov	w27, w3
     50c:      	bl	0x50c <_stogir.verify.structure+0x34c>
		000000000000050c:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
     510:      	cmp	x0, #0x0
     514:      	b.eq	0xf44 <_stogir.verify.structure+0xd84>
     518:      	uxtb	w16, w27
     51c:      	cmp	w16, wzr
     520:      	b.eq	0xd74 <_stogir.verify.structure+0xbb4>
     524:      	add	x0, x28, x24
     528:      	ldrsb	w0, [x0]
     52c:      	sxtb	x0, w0
     530:      	b	0xd78 <_stogir.verify.structure+0xbb8>
     534:      	str	x0, [x29, #0x20]
     538:      	lsr	x0, x0, #0
     53c:      	str	x8, [x29, #0x88]
     540:      	str	x3, [x29, #0x38]
     544:      	str	x4, [x29, #0x40]
     548:      	str	x5, [x29, #0x48]
     54c:      	str	x6, [x29, #0x50]
     550:      	str	x7, [x29, #0x58]
     554:      	str	x2, [x29, #0xa0]
     558:      	mov	x2, x0
     55c:      	ldr	x0, [x29, #0x10]
     560:      	str	x19, [x29, #0x28]
     564:      	str	x23, [x29, #0x30]
     568:      	ldr	x23, [x29, #0x18]
     56c:      	str	x24, [x29, #0x60]
     570:      	mov	x24, x9
     574:      	str	x25, [x29, #0x68]
     578:      	mov	x25, x10
     57c:      	str	x26, [x29, #0x70]
     580:      	mov	x26, x11
     584:      	str	x27, [x29, #0x78]
     588:      	mov	x27, x12
     58c:      	str	x28, [x29, #0x80]
     590:      	mov	x28, x13
     594:      	str	x22, [x29, #0x90]
     598:      	mov	x22, x15
     59c:      	str	x21, [x29, #0x98]
     5a0:      	mov	x21, x1
     5a4:      	mov	x1, x19
     5a8:      	mov	x19, x14
     5ac:      	bl	0x5ac <_stogir.verify.structure+0x3ec>
		00000000000005ac:  ARM64_RELOC_BRANCH26	_memcmp
     5b0:      	lsr	w0, w0, #0
     5b4:      	sxtw	x0, w0
     5b8:      	cmp	x0, #0x0
     5bc:      	b.eq	0x470 <_stogir.verify.structure+0x2b0>
     5c0:      	ldr	x19, [x29, #0xa0]
     5c4:      	ldr	x0, [x29, #0x10]
     5c8:      	ldr	x1, [x29, #0x20]
     5cc:      	ldr	x2, [x29, #0x28]
     5d0:      	movz	x3, #0x0, lsl #48
     5d4:      	bl	0x5d4 <_stogir.verify.structure+0x414>
		00000000000005d4:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
     5d8:      	cmp	x0, #0x0
     5dc:      	b.eq	0x5f4 <_stogir.verify.structure+0x434>
     5e0:      	and	x0, x19, #0xffffffff
     5e4:      	mov	x1, x0
     5e8:      	movz	x0, #0x0, lsl #48
     5ec:      	movz	x2, #0x0, lsl #48
     5f0:      	b	0x600 <_stogir.verify.structure+0x440>
     5f4:      	ldr	x1, [x29, #0x10]
     5f8:      	ldr	x2, [x29, #0x20]
     5fc:      	mov	x0, #0x1                ; =1
     600:      	ldr	x3, [x29, #0x88]
     604:      	str	x0, [x3]
     608:      	str	x1, [x3, #0x8]
     60c:      	str	x2, [x3, #0x10]
     610:      	sub	sp, x29, #0x0
     614:      	ldr	x19, [sp, #0x178]
     618:      	ldr	x20, [sp, #0x180]
     61c:      	ldr	x21, [sp, #0x188]
     620:      	ldr	x22, [sp, #0x190]
     624:      	ldr	x23, [sp, #0x198]
     628:      	ldr	x24, [sp, #0x1a0]
     62c:      	ldr	x25, [sp, #0x1a8]
     630:      	ldr	x26, [sp, #0x1b0]
     634:      	ldr	x27, [sp, #0x1b8]
     638:      	ldr	x28, [sp, #0x1c0]
     63c:      	ldr	x29, [sp]
     640:      	ldr	x30, [sp, #0x8]
     644:      	add	sp, sp, #0x1d0
     648:      	ret
     64c:      	movz	x6, #0x0, lsl #48
     650:      	b	0x698 <_stogir.verify.structure+0x4d8>
     654:      	movz	x7, #0x0, lsl #48
     658:      	b	0x6b4 <_stogir.verify.structure+0x4f4>
     65c:      	mov	x19, x1
     660:      	movz	x1, #0x0, lsl #48
     664:      	cmp	x1, #0x0
     668:      	b.eq	0xf60 <_stogir.verify.structure+0xda0>
     66c:      	cmp	x22, #0x0
     670:      	b.eq	0xdf0 <_stogir.verify.structure+0xc30>
     674:      	mov	x22, x2
     678:      	fmov	d31, x21
     67c:      	mov	x21, x0
     680:      	fmov	x0, d31
     684:      	b	0xe08 <_stogir.verify.structure+0xc48>
     688:      	mov	x0, x1
     68c:      	mov	x1, x22
     690:      	b	0x774 <_stogir.verify.structure+0x5b4>
     694:      	movz	x6, #0x0, lsl #48
     698:      	ldr	x8, [x29, #0xa8]
     69c:      	ldr	x9, [x29, #0x118]
     6a0:      	ldr	x10, [x29, #0x110]
     6a4:      	mov	x7, x6
     6a8:      	ldr	x6, [x29, #0xb0]
     6ac:      	b	0x6b4 <_stogir.verify.structure+0x4f4>
     6b0:      	movz	x7, #0x0, lsl #48
     6b4:      	cmp	x7, #0x0
     6b8:      	b.eq	0x79c <_stogir.verify.structure+0x5dc>
     6bc:      	cmp	x3, #0x1
     6c0:      	b.lt	0x730 <_stogir.verify.structure+0x570>
     6c4:      	ldr	x7, [x23, #0x78]
     6c8:      	add	x7, x26, x7
     6cc:      	ldr	w7, [x7]
     6d0:      	sxtw	x7, w7
     6d4:      	cmp	x3, x7
     6d8:      	b.gt	0x730 <_stogir.verify.structure+0x570>
     6dc:      	ldr	x7, [x23]
     6e0:      	asr	x16, x3, #63
     6e4:      	lsr	x16, x16, #62
     6e8:      	add	x11, x3, x16
     6ec:      	asr	x11, x11, #2
     6f0:      	asr	x16, x3, #63
     6f4:      	lsr	x16, x16, #62
     6f8:      	add	x3, x3, x16
     6fc:      	and	x3, x3, #0x3
     700:      	sub	x3, x3, x16
     704:      	add	x11, x11, x25
     708:      	lsl	x3, x3, #2
     70c:      	lsl	x11, x11, #4
     710:      	add	x7, x11, x7
     714:      	add	x3, x3, x7
     718:      	ldr	w3, [x3]
     71c:      	sxtw	x3, w3
     720:      	and	x3, x3, #0xffffffff
     724:      	mov	x7, x3
     728:      	mov	x3, #0x1                ; =1
     72c:      	b	0x738 <_stogir.verify.structure+0x578>
     730:      	movz	x3, #0x0, lsl #48
     734:      	movz	x7, #0x0, lsl #48
     738:      	b	0x7a4 <_stogir.verify.structure+0x5e4>
     73c:      	sub	x4, x3, #0x1
     740:      	lsr	w4, w4, #0
     744:      	sxtw	x4, w4
     748:      	ldr	w5, [x20]
     74c:      	lsl	x4, x4, #2
     750:      	lsr	w4, w4, #0
     754:      	ubfx	x4, x4, #0, #32
     758:      	lsr	x4, x5, x4
     75c:      	lsr	w4, w4, #0
     760:      	and	x4, x4, #0xf
     764:      	lsr	w4, w4, #0
     768:      	b	0x77c <_stogir.verify.structure+0x5bc>
     76c:      	mov	x0, x19
     770:      	mov	x1, x22
     774:      	b	0x818 <_stogir.verify.structure+0x658>
     778:      	movz	x4, #0x0, lsl #48
     77c:      	uxtb	w16, w19
     780:      	cmp	w16, wzr
     784:      	b.eq	0x990 <_stogir.verify.structure+0x7d0>
     788:      	ldr	x5, [x29, #0xb8]
     78c:      	ldr	x6, [x29, #0xb0]
     790:      	ldr	x8, [x29, #0xa8]
     794:      	ldr	x9, [x29, #0x118]
     798:      	ldr	x10, [x29, #0x110]
     79c:      	movz	x3, #0x0, lsl #48
     7a0:      	movz	x7, #0x0, lsl #48
     7a4:      	ldr	x11, [x29, #0x98]
     7a8:      	str	x3, [x11]
     7ac:      	lsr	w3, w3, #0
     7b0:      	str	x7, [x11, #0x8]
     7b4:      	lsr	x16, x3, #0
     7b8:      	cmp	x16, #0x1
     7bc:      	b.eq	0x7d8 <_stogir.verify.structure+0x618>
     7c0:      	b.lo	0x7c8 <_stogir.verify.structure+0x608>
     7c4:      	b	0x7dc <_stogir.verify.structure+0x61c>
     7c8:      	cmp	x16, #0x0
     7cc:      	b.eq	0x7d4 <_stogir.verify.structure+0x614>
     7d0:      	b	0x7dc <_stogir.verify.structure+0x61c>
     7d4:      	b	0x7e0 <_stogir.verify.structure+0x620>
     7d8:      	b	0x9d8 <_stogir.verify.structure+0x818>
     7dc:      	b	0xec0 <_stogir.verify.structure+0xd00>
     7e0:      	str	x11, [x29, #0x98]
     7e4:      	str	x22, [x29, #0x160]
     7e8:      	str	x20, [x29, #0x150]
     7ec:      	ldr	x20, [x29, #0x108]
     7f0:      	str	w19, [x29, #0x148]
     7f4:      	str	x5, [x29, #0xb8]
     7f8:      	str	w21, [x29, #0x158]
     7fc:      	ldr	x21, [x29, #0x90]
     800:      	str	x6, [x29, #0xb0]
     804:      	str	x8, [x29, #0xa8]
     808:      	str	x9, [x29, #0x118]
     80c:      	str	x10, [x29, #0x110]
     810:      	ldr	x0, [x29, #0x38]
     814:      	mov	x1, #0x17               ; =23
     818:      	add	x2, x24, #0x1
     81c:      	lsr	w2, w2, #0
     820:      	sxtw	x2, w2
     824:      	str	x21, [x29, #0x90]
     828:      	ldr	x21, [x29, #0xf8]
     82c:      	ldr	x22, [x29, #0x160]
     830:      	ldr	w19, [x29, #0xe8]
     834:      	ldr	x24, [x29, #0x100]
     838:      	mov	x3, x26
     83c:      	ldr	x26, [x29, #0xf0]
     840:      	mov	w4, w28
     844:      	ldr	x28, [x29, #0xc0]
     848:      	ldr	w5, [x29, #0x158]
     84c:      	ldr	x6, [x29, #0x118]
     850:      	ldr	x7, [x29, #0x110]
     854:      	mov	x8, x0
     858:      	ldr	x0, [x29, #0x150]
     85c:      	mov	x9, x1
     860:      	mov	x1, x2
     864:      	ldr	w2, [x29, #0x148]
     868:      	cmp	x9, #0x0
     86c:      	b.ne	0xf70 <_stogir.verify.structure+0xdb0>
     870:      	cmp	x9, #0x0
     874:      	b.ne	0x8c0 <_stogir.verify.structure+0x700>
     878:      	str	x21, [x29, #0xf8]
     87c:      	str	x20, [x29, #0x108]
     880:      	str	w19, [x29, #0xe8]
     884:      	str	x24, [x29, #0x100]
     888:      	mov	x24, x1
     88c:      	str	x26, [x29, #0xf0]
     890:      	str	x28, [x29, #0xc0]
     894:      	mov	x20, x0
     898:      	mov	w19, w2
     89c:      	mov	x26, x3
     8a0:      	mov	w28, w4
     8a4:      	mov	w21, w5
     8a8:      	str	x6, [x29, #0x118]
     8ac:      	str	x7, [x29, #0x110]
     8b0:      	str	x8, [x29, #0x120]
     8b4:      	str	x9, [x29, #0x128]
     8b8:      	mov	x0, #0x1                ; =1
     8bc:      	b	0x928 <_stogir.verify.structure+0x768>
     8c0:      	lsr	x10, x9, #0
     8c4:      	str	x6, [x29, #0x118]
     8c8:      	str	x7, [x29, #0x110]
     8cc:      	str	x8, [x29, #0x120]
     8d0:      	str	x9, [x29, #0x128]
     8d4:      	str	w19, [x29, #0xe8]
     8d8:      	mov	w19, w2
     8dc:      	mov	x2, x10
     8e0:      	str	x26, [x29, #0xf0]
     8e4:      	mov	x26, x3
     8e8:      	str	x28, [x29, #0xc0]
     8ec:      	mov	w28, w4
     8f0:      	str	x21, [x29, #0xf8]
     8f4:      	mov	w21, w5
     8f8:      	str	x24, [x29, #0x100]
     8fc:      	mov	x24, x1
     900:      	ldr	x1, [x29, #0x28]
     904:      	str	x20, [x29, #0x108]
     908:      	mov	x20, x0
     90c:      	mov	x0, x8
     910:      	bl	0x910 <_stogir.verify.structure+0x750>
		0000000000000910:  ARM64_RELOC_BRANCH26	_memcmp
     914:      	lsr	w0, w0, #0
     918:      	sxtw	x0, w0
     91c:      	cmp	x0, #0x0
     920:      	cset	w0, eq
     924:      	ubfx	x0, x0, #0, #8
     928:      	ldr	x1, [x29, #0x120]
     92c:      	ldr	x2, [x29, #0x128]
     930:      	b	0x940 <_stogir.verify.structure+0x780>
     934:      	ldr	x1, [x29, #0x120]
     938:      	ldr	x2, [x29, #0x128]
     93c:      	movz	x0, #0x0, lsl #48
     940:      	cmp	x0, #0x0
     944:      	b.eq	0x958 <_stogir.verify.structure+0x798>
     948:      	cmp	x24, x22
     94c:      	cset	w0, le
     950:      	ubfx	x0, x0, #0, #8
     954:      	b	0x95c <_stogir.verify.structure+0x79c>
     958:      	movz	x0, #0x0, lsl #48
     95c:      	cmp	x0, #0x0
     960:      	b.eq	0xfb4 <_stogir.verify.structure+0xdf4>
     964:      	lsr	w0, w24, #0
     968:      	sxtw	x3, w0
     96c:      	uxtb	w16, w27
     970:      	cmp	w16, wzr
     974:      	b.eq	0x778 <_stogir.verify.structure+0x5b8>
     978:      	cmp	x3, #0x0
     97c:      	b.le	0x778 <_stogir.verify.structure+0x5b8>
     980:      	cmp	x3, #0x4
     984:      	b.le	0x73c <_stogir.verify.structure+0x57c>
     988:      	mov	x4, #0x4                ; =4
     98c:      	b	0x748 <_stogir.verify.structure+0x588>
     990:      	uxtb	w16, w28
     994:      	cmp	w16, wzr
     998:      	b.eq	0xfc8 <_stogir.verify.structure+0xe08>
     99c:      	ldr	x5, [x23, #0x8]
     9a0:      	cmp	x25, x5
     9a4:      	b.ge	0xfd0 <_stogir.verify.structure+0xe10>
     9a8:      	ldr	x5, [x29, #0xb8]
     9ac:      	ldr	x6, [x5, #0x8]
     9b0:      	cmp	x25, x6
     9b4:      	b.ge	0x64c <_stogir.verify.structure+0x48c>
     9b8:      	ldr	x6, [x23, #0x78]
     9bc:      	add	x6, x26, x6
     9c0:      	ldr	w6, [x6]
     9c4:      	sxtw	x6, w6
     9c8:      	cmp	x6, #0x0
     9cc:      	cset	w6, ge
     9d0:      	ubfx	x6, x6, #0, #8
     9d4:      	b	0x650 <_stogir.verify.structure+0x490>
     9d8:      	lsr	w3, w4, #0
     9dc:      	ldr	w4, [x11, #0x8]
     9e0:      	orr	x7, x3, xzr
     9e4:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000009e4:  ARM64_RELOC_PAGE21	l_stogir.313
     9e8:      	ldr	x16, [x16]
		00000000000009e8:  ARM64_RELOC_PAGEOFF12	l_stogir.313
     9ec:      	ldr	w12, [x16]
     9f0:      	cmp	x7, x12
     9f4:      	b.ne	0xa54 <_stogir.verify.structure+0x894>
     9f8:      	mov	x12, #0x1               ; =1
     9fc:      	b	0xa6c <_stogir.verify.structure+0x8ac>
     a00:      	uxtb	w16, w21
     a04:      	cmp	w16, wzr
     a08:      	b.eq	0xfd8 <_stogir.verify.structure+0xe18>
     a0c:      	ldr	x6, [x29, #0xb0]
     a10:      	ldr	x7, [x6, #0x8]
     a14:      	ldr	x8, [x29, #0xa8]
     a18:      	ldr	x9, [x8, #0x8]
     a1c:      	cmp	x7, x9
     a20:      	b.ne	0xfec <_stogir.verify.structure+0xe2c>
     a24:      	ldr	x9, [x29, #0x118]
     a28:      	cmp	x9, x7
     a2c:      	b.gt	0xff8 <_stogir.verify.structure+0xe38>
     a30:      	ldr	x7, [x23, #0x50]
     a34:      	ldr	x10, [x29, #0x110]
     a38:      	add	x7, x10, x7
     a3c:      	ldr	w7, [x7]
     a40:      	sxtw	x7, w7
     a44:      	cmp	x7, #0x0
     a48:      	cset	w7, gt
     a4c:      	ubfx	x7, x7, #0, #8
     a50:      	b	0xe54 <_stogir.verify.structure+0xc94>
     a54:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000a54:  ARM64_RELOC_PAGE21	l_stogir.314
     a58:      	ldr	x16, [x16]
		0000000000000a58:  ARM64_RELOC_PAGEOFF12	l_stogir.314
     a5c:      	ldr	w12, [x16]
     a60:      	cmp	x7, x12
     a64:      	cset	w12, eq
     a68:      	ubfx	x12, x12, #0, #8
     a6c:      	cmp	x12, #0x0
     a70:      	b.eq	0x1000 <_stogir.verify.structure+0xe40>
     a74:      	lsr	w4, w4, #0
     a78:      	str	x1, [x29, #0x130]
     a7c:      	mov	w1, w4
     a80:      	str	x2, [x29, #0x138]
     a84:      	str	w0, [x29, #0x140]
     a88:      	mov	x0, x23
     a8c:      	str	x5, [x29, #0xb8]
     a90:      	str	x6, [x29, #0xb0]
     a94:      	str	x8, [x29, #0xa8]
     a98:      	str	x9, [x29, #0x118]
     a9c:      	str	x10, [x29, #0x110]
     aa0:      	str	x11, [x29, #0x98]
     aa4:      	str	w19, [x29, #0x148]
     aa8:      	mov	w19, w3
     aac:      	str	x20, [x29, #0x150]
     ab0:      	mov	w20, w4
     ab4:      	str	w21, [x29, #0x158]
     ab8:      	mov	x21, x7
     abc:      	str	x22, [x29, #0x160]
     ac0:      	mov	x22, x12
     ac4:      	bl	0xac4 <_stogir.verify.structure+0x904>
		0000000000000ac4:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
     ac8:      	cmp	x0, #0x0
     acc:      	cset	w1, eq
     ad0:      	uxtb	w16, w1
     ad4:      	cmp	w16, wzr
     ad8:      	cset	x1, eq
     adc:      	cmp	x1, #0x0
     ae0:      	b.eq	0xb00 <_stogir.verify.structure+0x940>
     ae4:      	ldr	w0, [x0]
     ae8:      	uxtb	w0, w0
     aec:      	cmp	x0, #0x48
     af0:      	b.ne	0xb00 <_stogir.verify.structure+0x940>
     af4:      	ldr	x0, [x29, #0x40]
     af8:      	mov	x2, #0x25               ; =37
     afc:      	b	0xb08 <_stogir.verify.structure+0x948>
     b00:      	ldr	x0, [x29, #0x130]
     b04:      	ldr	x2, [x29, #0x138]
     b08:      	fmov	d31, x0
     b0c:      	mov	x0, x1
     b10:      	fmov	x1, d31
     b14:      	b	0xb24 <_stogir.verify.structure+0x964>
     b18:      	ldr	x1, [x29, #0x130]
     b1c:      	ldr	x2, [x29, #0x138]
     b20:      	movz	x0, #0x0, lsl #48
     b24:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000b24:  ARM64_RELOC_PAGE21	l_stogir.315
     b28:      	ldr	x16, [x16]
		0000000000000b28:  ARM64_RELOC_PAGEOFF12	l_stogir.315
     b2c:      	ldr	w3, [x16]
     b30:      	cmp	x21, x3
     b34:      	b.ne	0x1048 <_stogir.verify.structure+0xe88>
     b38:      	lsr	w20, w20, #0
     b3c:      	ldr	x8, [x29, #0x90]
     b40:      	mov	x21, x0
     b44:      	ldr	x0, [x29, #0x58]
     b48:      	str	x1, [x29, #0x168]
     b4c:      	mov	w1, w20
     b50:      	str	x2, [x29, #0x170]
     b54:      	bl	0xb54 <_stogir.verify.structure+0x994>
		0000000000000b54:  ARM64_RELOC_BRANCH26	_stogir.strings.lookup
     b58:      	ldr	x0, [x29, #0x90]
     b5c:      	ldr	w1, [x0]
     b60:      	lsr	x16, x1, #0
     b64:      	cmp	x16, #0x1
     b68:      	b.eq	0xb84 <_stogir.verify.structure+0x9c4>
     b6c:      	b.lo	0xb74 <_stogir.verify.structure+0x9b4>
     b70:      	b	0xb88 <_stogir.verify.structure+0x9c8>
     b74:      	cmp	x16, #0x0
     b78:      	b.eq	0xb80 <_stogir.verify.structure+0x9c0>
     b7c:      	b	0xb88 <_stogir.verify.structure+0x9c8>
     b80:      	b	0xb8c <_stogir.verify.structure+0x9cc>
     b84:      	b	0xd68 <_stogir.verify.structure+0xba8>
     b88:      	b	0xec8 <_stogir.verify.structure+0xd08>
     b8c:      	ldr	x1, [x29, #0x48]
     b90:      	mov	x2, #0x21               ; =33
     b94:      	b	0xd70 <_stogir.verify.structure+0xbb0>
     b98:      	ldr	x1, [x29, #0x168]
     b9c:      	ldr	x2, [x29, #0x170]
     ba0:      	cmp	x19, #0xf
     ba4:      	b.hs	0x65c <_stogir.verify.structure+0x49c>
     ba8:      	mov	x16, #0x1               ; =1
     bac:      	lsl	x3, x16, x19
     bb0:      	lsr	w3, w3, #0
     bb4:      	mov	x17, #0x5e1c            ; =24092
     bb8:      	and	x3, x3, x17
     bbc:      	lsr	w3, w3, #0
     bc0:      	cmp	x3, #0x0
     bc4:      	cset	w3, eq
     bc8:      	uxtb	w16, w3
     bcc:      	cmp	w16, wzr
     bd0:      	cset	x3, eq
     bd4:      	mov	x19, x1
     bd8:      	mov	x1, x3
     bdc:      	b	0x664 <_stogir.verify.structure+0x4a4>
     be0:      	lsr	w0, w21, #0
     be4:      	lsl	x2, x28, #2
     be8:      	lsr	w19, w19, #0
     bec:      	sxtw	x25, w0
     bf0:      	ldr	x28, [x29, #0xc0]
     bf4:      	add	x0, x2, x28
     bf8:      	cmp	x25, #0x0
     bfc:      	cset	w2, le
     c00:      	lsl	x3, x25, #2
     c04:      	cmp	x25, #0x0
     c08:      	cset	w4, gt
     c0c:      	cmp	x25, #0x0
     c10:      	cset	w5, lt
     c14:      	movz	x16, #0x0, lsl #48
     c18:      	sub	x6, x16, x25
     c1c:      	sub	x7, x6, #0x1
     c20:      	lsl	x7, x7, #2
     c24:      	ldr	x8, [x29, #0xd8]
     c28:      	mov	x9, x1
     c2c:      	mov	x1, #0x1                ; =1
     c30:      	b	0x868 <_stogir.verify.structure+0x6a8>
     c34:      	ldr	x0, [x29, #0x80]
     c38:      	mov	x1, #0x1b               ; =27
     c3c:      	add	x2, x25, #0x1
     c40:      	ldr	x25, [x29, #0xd0]
     c44:      	mov	x3, x1
     c48:      	mov	x1, x0
     c4c:      	mov	x0, x2
     c50:      	mov	x2, x24
     c54:      	ldr	x24, [x29, #0xc8]
     c58:      	cmp	x3, #0x0
     c5c:      	b.ne	0x105c <_stogir.verify.structure+0xe9c>
     c60:      	cmp	x3, #0x0
     c64:      	b.ne	0xc88 <_stogir.verify.structure+0xac8>
     c68:      	str	x24, [x29, #0xc8]
     c6c:      	mov	x24, x2
     c70:      	str	x25, [x29, #0xd0]
     c74:      	mov	x25, x0
     c78:      	str	x1, [x29, #0xd8]
     c7c:      	str	x3, [x29, #0xe0]
     c80:      	mov	x0, #0x1                ; =1
     c84:      	b	0xcc8 <_stogir.verify.structure+0xb08>
     c88:      	lsr	x4, x3, #0
     c8c:      	str	x1, [x29, #0xd8]
     c90:      	str	x3, [x29, #0xe0]
     c94:      	str	x24, [x29, #0xc8]
     c98:      	mov	x24, x2
     c9c:      	mov	x2, x4
     ca0:      	str	x25, [x29, #0xd0]
     ca4:      	mov	x25, x0
     ca8:      	mov	x0, x1
     cac:      	ldr	x1, [x29, #0x28]
     cb0:      	bl	0xcb0 <_stogir.verify.structure+0xaf0>
		0000000000000cb0:  ARM64_RELOC_BRANCH26	_memcmp
     cb4:      	lsr	w0, w0, #0
     cb8:      	sxtw	x0, w0
     cbc:      	cmp	x0, #0x0
     cc0:      	cset	w0, eq
     cc4:      	ubfx	x0, x0, #0, #8
     cc8:      	ldr	x1, [x29, #0xe0]
     ccc:      	b	0xcd8 <_stogir.verify.structure+0xb18>
     cd0:      	ldr	x1, [x29, #0xe0]
     cd4:      	movz	x0, #0x0, lsl #48
     cd8:      	cmp	x0, #0x0
     cdc:      	b.eq	0xcf0 <_stogir.verify.structure+0xb30>
     ce0:      	cmp	x25, x24
     ce4:      	cset	w0, lt
     ce8:      	ubfx	x0, x0, #0, #8
     cec:      	b	0xcf4 <_stogir.verify.structure+0xb34>
     cf0:      	movz	x0, #0x0, lsl #48
     cf4:      	cmp	x0, #0x0
     cf8:      	b.eq	0xbe0 <_stogir.verify.structure+0xa20>
     cfc:      	add	x0, x25, x21
     d00:      	ldr	x2, [x23, #0x78]
     d04:      	lsl	x0, x0, #2
     d08:      	add	x0, x0, x2
     d0c:      	ldr	w0, [x0]
     d10:      	sxtw	x0, w0
     d14:      	cmn	x0, #0x1
     d18:      	b.ne	0xc34 <_stogir.verify.structure+0xa74>
     d1c:      	ldr	x0, [x29, #0xd8]
     d20:      	b	0xc3c <_stogir.verify.structure+0xa7c>
     d24:      	ldr	x0, [x29, #0x10]
     d28:      	ldr	x1, [x29, #0x20]
     d2c:      	add	x2, x22, #0x4
     d30:      	ldr	x3, [x23, #0x8]
     d34:      	asr	x16, x2, #63
     d38:      	lsr	x16, x16, #62
     d3c:      	add	x2, x2, x16
     d40:      	asr	x2, x2, #2
     d44:      	add	x4, x2, x21
     d48:      	cmp	x4, x3
     d4c:      	b.le	0xd58 <_stogir.verify.structure+0xb98>
     d50:      	ldr	x0, [x29, #0x78]
     d54:      	mov	x1, #0x15               ; =21
     d58:      	mov	x3, x1
     d5c:      	mov	x1, x0
     d60:      	mov	x0, #0x1                ; =1
     d64:      	b	0xc58 <_stogir.verify.structure+0xa98>
     d68:      	ldr	x1, [x29, #0x168]
     d6c:      	ldr	x2, [x29, #0x170]
     d70:      	b	0xba0 <_stogir.verify.structure+0x9e0>
     d74:      	mov	x0, #-0x2               ; =-2
     d78:      	lsr	w0, w0, #0
     d7c:      	sxtw	x0, w0
     d80:      	cmp	x0, #0x0
     d84:      	b.lt	0xda4 <_stogir.verify.structure+0xbe4>
     d88:      	uxtb	w16, w27
     d8c:      	cmp	w16, wzr
     d90:      	b.eq	0xe88 <_stogir.verify.structure+0xcc8>
     d94:      	add	x0, x28, x25
     d98:      	ldrsb	w0, [x0]
     d9c:      	sxtb	x0, w0
     da0:      	b	0xe8c <_stogir.verify.structure+0xccc>
     da4:      	uxtb	w16, w27
     da8:      	cmp	w16, wzr
     dac:      	b.eq	0xe58 <_stogir.verify.structure+0xc98>
     db0:      	add	x0, x28, x26
     db4:      	ldrsb	w0, [x0]
     db8:      	sxtb	x0, w0
     dbc:      	b	0xe5c <_stogir.verify.structure+0xc9c>
     dc0:      	mov	x0, #0x1                ; =1
     dc4:      	cmp	x0, #0x0
     dc8:      	b.eq	0x688 <_stogir.verify.structure+0x4c8>
     dcc:      	ldr	x0, [x29, #0x50]
     dd0:      	mov	x1, #0x1a               ; =26
     dd4:      	b	0x690 <_stogir.verify.structure+0x4d0>
     dd8:      	movz	x0, #0x0, lsl #48
     ddc:      	mov	x1, x19
     de0:      	cmp	x0, #0x0
     de4:      	b.eq	0xdc0 <_stogir.verify.structure+0xc00>
     de8:      	movz	x0, #0x0, lsl #48
     dec:      	b	0xdc4 <_stogir.verify.structure+0xc04>
     df0:      	lsr	w20, w20, #0
     df4:      	mov	w1, w20
     df8:      	mov	x21, x0
     dfc:      	mov	x0, x23
     e00:      	mov	x22, x2
     e04:      	bl	0xe04 <_stogir.verify.structure+0xc44>
		0000000000000e04:  ARM64_RELOC_BRANCH26	_stogir.graph.contains?
     e08:      	cmp	x0, #0x0
     e0c:      	b.eq	0xe20 <_stogir.verify.structure+0xc60>
     e10:      	ldr	x20, [x29, #0x108]
     e14:      	mov	x1, x19
     e18:      	mov	x0, #0x1                ; =1
     e1c:      	b	0xde0 <_stogir.verify.structure+0xc20>
     e20:      	sxtw	x20, w20
     e24:      	cmp	x20, #0x0
     e28:      	b.ne	0x1078 <_stogir.verify.structure+0xeb8>
     e2c:      	ldr	x20, [x29, #0x108]
     e30:      	ldr	w0, [x20]
     e34:      	ubfx	x0, x0, #8, #8
     e38:      	lsr	w0, w0, #0
     e3c:      	mov	w1, w0
     e40:      	ldr	w0, [x29, #0xe8]
     e44:      	ldr	w2, [x29, #0x140]
     e48:      	bl	0xe48 <_stogir.verify.structure+0xc88>
		0000000000000e48:  ARM64_RELOC_BRANCH26	_stogir.opcode.optional-reference?
     e4c:      	b	0xddc <_stogir.verify.structure+0xc1c>
     e50:      	movz	x7, #0x0, lsl #48
     e54:      	b	0x658 <_stogir.verify.structure+0x498>
     e58:      	mov	x0, #-0x2               ; =-2
     e5c:      	lsr	w0, w0, #0
     e60:      	sxtw	x0, w0
     e64:      	cmn	x0, #0x1
     e68:      	b.ne	0xd24 <_stogir.verify.structure+0xb64>
     e6c:      	ldr	w0, [x20]
     e70:      	ubfx	x0, x0, #16, #16
     e74:      	cmp	x22, x0
     e78:      	b.eq	0xd24 <_stogir.verify.structure+0xb64>
     e7c:      	ldr	x0, [x29, #0x70]
     e80:      	mov	x1, #0x24               ; =36
     e84:      	b	0xd2c <_stogir.verify.structure+0xb6c>
     e88:      	mov	x0, #-0x2               ; =-2
     e8c:      	lsr	w0, w0, #0
     e90:      	sxtw	x0, w0
     e94:      	cmp	x22, x0
     e98:      	b.eq	0xda4 <_stogir.verify.structure+0xbe4>
     e9c:      	str	x24, [x29, #0xc8]
     ea0:      	str	x25, [x29, #0xd0]
     ea4:      	str	x26, [x29, #0xf0]
     ea8:      	mov	x0, x21
     eac:      	ldr	x21, [x29, #0x90]
     eb0:      	ldr	x1, [x29, #0xa0]
     eb4:      	ldr	x2, [x29, #0x68]
     eb8:      	mov	x3, #0x23               ; =35
     ebc:      	b	0x260 <_stogir.verify.structure+0xa0>
     ec0:      	brk	#0
     ec4:      	b	0xec0 <_stogir.verify.structure+0xd00>
     ec8:      	brk	#0
     ecc:      	b	0xec8 <_stogir.verify.structure+0xd08>
     ed0:      	str	x8, [x29, #0x88]
     ed4:      	str	x19, [x29, #0x28]
     ed8:      	mov	x19, x2
     edc:      	str	x0, [x29, #0x20]
     ee0:      	b	0x5c4 <_stogir.verify.structure+0x404>
     ee4:      	ldr	x19, [x29, #0xa0]
     ee8:      	b	0x5c4 <_stogir.verify.structure+0x404>
     eec:      	mov	x0, x21
     ef0:      	ldr	x21, [x29, #0x90]
     ef4:      	str	x24, [x29, #0xc8]
     ef8:      	str	x25, [x29, #0xd0]
     efc:      	str	x26, [x29, #0xf0]
     f00:      	str	x27, [x29, #0xc0]
     f04:      	str	x28, [x29, #0xb8]
     f08:      	str	x19, [x29, #0xb0]
     f0c:      	ldr	x19, [x29, #0xa0]
     f10:      	str	x22, [x29, #0xa8]
     f14:      	b	0x380 <_stogir.verify.structure+0x1c0>
     f18:      	mov	x0, x21
     f1c:      	ldr	x21, [x29, #0x90]
     f20:      	str	x24, [x29, #0xc8]
     f24:      	str	x25, [x29, #0xd0]
     f28:      	str	x26, [x29, #0xf0]
     f2c:      	str	x27, [x29, #0xc0]
     f30:      	str	x28, [x29, #0xb8]
     f34:      	str	x19, [x29, #0xb0]
     f38:      	ldr	x19, [x29, #0xa0]
     f3c:      	str	x22, [x29, #0xa8]
     f40:      	b	0x344 <_stogir.verify.structure+0x184>
     f44:      	mov	x0, x21
     f48:      	ldr	x19, [x29, #0xa0]
     f4c:      	ldr	x21, [x29, #0x90]
     f50:      	str	x24, [x29, #0xc8]
     f54:      	str	x25, [x29, #0xd0]
     f58:      	str	x26, [x29, #0xf0]
     f5c:      	b	0x344 <_stogir.verify.structure+0x184>
     f60:      	ldr	x20, [x29, #0x108]
     f64:      	mov	x21, x0
     f68:      	mov	x22, x2
     f6c:      	b	0x76c <_stogir.verify.structure+0x5ac>
     f70:      	str	x21, [x29, #0xf8]
     f74:      	str	x20, [x29, #0x108]
     f78:      	str	w19, [x29, #0xe8]
     f7c:      	str	x24, [x29, #0x100]
     f80:      	mov	x24, x1
     f84:      	str	x26, [x29, #0xf0]
     f88:      	str	x28, [x29, #0xc0]
     f8c:      	mov	x20, x0
     f90:      	mov	w19, w2
     f94:      	mov	x26, x3
     f98:      	mov	w28, w4
     f9c:      	mov	w21, w5
     fa0:      	str	x6, [x29, #0x118]
     fa4:      	str	x7, [x29, #0x110]
     fa8:      	str	x8, [x29, #0x120]
     fac:      	str	x9, [x29, #0x128]
     fb0:      	b	0x934 <_stogir.verify.structure+0x774>
     fb4:      	ldr	x20, [x29, #0x108]
     fb8:      	ldr	x21, [x29, #0x90]
     fbc:      	str	x1, [x29, #0x130]
     fc0:      	str	x2, [x29, #0x138]
     fc4:      	b	0x23c <_stogir.verify.structure+0x7c>
     fc8:      	ldr	x5, [x29, #0xb8]
     fcc:      	b	0xa00 <_stogir.verify.structure+0x840>
     fd0:      	ldr	x5, [x29, #0xb8]
     fd4:      	b	0x694 <_stogir.verify.structure+0x4d4>
     fd8:      	ldr	x6, [x29, #0xb0]
     fdc:      	ldr	x8, [x29, #0xa8]
     fe0:      	ldr	x9, [x29, #0x118]
     fe4:      	ldr	x10, [x29, #0x110]
     fe8:      	b	0x6b0 <_stogir.verify.structure+0x4f0>
     fec:      	ldr	x9, [x29, #0x118]
     ff0:      	ldr	x10, [x29, #0x110]
     ff4:      	b	0x654 <_stogir.verify.structure+0x494>
     ff8:      	ldr	x10, [x29, #0x110]
     ffc:      	b	0xe50 <_stogir.verify.structure+0xc90>
    1000:      	str	x11, [x29, #0x98]
    1004:      	str	x22, [x29, #0x160]
    1008:      	mov	x22, x12
    100c:      	str	w0, [x29, #0x140]
    1010:      	str	x20, [x29, #0x150]
    1014:      	mov	w20, w4
    1018:      	str	w19, [x29, #0x148]
    101c:      	mov	w19, w3
    1020:      	str	x5, [x29, #0xb8]
    1024:      	str	w21, [x29, #0x158]
    1028:      	mov	x21, x7
    102c:      	str	x6, [x29, #0xb0]
    1030:      	str	x8, [x29, #0xa8]
    1034:      	str	x9, [x29, #0x118]
    1038:      	str	x10, [x29, #0x110]
    103c:      	str	x1, [x29, #0x130]
    1040:      	str	x2, [x29, #0x138]
    1044:      	b	0xb18 <_stogir.verify.structure+0x958>
    1048:      	mov	x21, x0
    104c:      	ldr	x0, [x29, #0x90]
    1050:      	str	x1, [x29, #0x168]
    1054:      	str	x2, [x29, #0x170]
    1058:      	b	0xb98 <_stogir.verify.structure+0x9d8>
    105c:      	str	x24, [x29, #0xc8]
    1060:      	mov	x24, x2
    1064:      	str	x25, [x29, #0xd0]
    1068:      	mov	x25, x0
    106c:      	str	x1, [x29, #0xd8]
    1070:      	str	x3, [x29, #0xe0]
    1074:      	b	0xcd0 <_stogir.verify.structure+0xb10>
    1078:      	ldr	x20, [x29, #0x108]
    107c:      	b	0xdd8 <_stogir.verify.structure+0xc18>

0000000000001080 <_stogir.verify.integer-operations-target-structured>:
    1080:      	sub	sp, sp, #0x310
    1084:      	str	x29, [sp, #0x10]
    1088:      	str	x30, [sp, #0x18]
    108c:      	add	x29, sp, #0x10
    1090:      	str	x19, [sp, #0x2c0]
    1094:      	str	x20, [sp, #0x2c8]
    1098:      	str	x21, [sp, #0x2d0]
    109c:      	str	x22, [sp, #0x2d8]
    10a0:      	str	x23, [sp, #0x2e0]
    10a4:      	str	x24, [sp, #0x2e8]
    10a8:      	str	x25, [sp, #0x2f0]
    10ac:      	str	x26, [sp, #0x2f8]
    10b0:      	str	x27, [sp, #0x300]
    10b4:      	str	x28, [sp, #0x308]
    10b8:      	adrp	x16, 0x1000 <_stogir.verify.structure+0xe40>
		00000000000010b8:  ARM64_RELOC_PAGE21	l_stogir.316
    10bc:      	ldr	x16, [x16]
		00000000000010bc:  ARM64_RELOC_PAGEOFF12	l_stogir.316
    10c0:      	orr	x19, x16, xzr
    10c4:      	adrp	x16, 0x1000 <_stogir.verify.structure+0xe40>
		00000000000010c4:  ARM64_RELOC_PAGE21	l_stogir.317
    10c8:      	ldr	x16, [x16]
		00000000000010c8:  ARM64_RELOC_PAGEOFF12	l_stogir.317
    10cc:      	orr	x20, x16, xzr
    10d0:      	adrp	x16, 0x1000 <_stogir.verify.structure+0xe40>
		00000000000010d0:  ARM64_RELOC_PAGE21	l_stogir.318
    10d4:      	ldr	x16, [x16]
		00000000000010d4:  ARM64_RELOC_PAGEOFF12	l_stogir.318
    10d8:      	orr	x21, x16, xzr
    10dc:      	adrp	x16, 0x1000 <_stogir.verify.structure+0xe40>
		00000000000010dc:  ARM64_RELOC_PAGE21	l_stogir.319
    10e0:      	ldr	x16, [x16]
		00000000000010e0:  ARM64_RELOC_PAGEOFF12	l_stogir.319
    10e4:      	orr	x22, x16, xzr
    10e8:      	adrp	x16, 0x1000 <_stogir.verify.structure+0xe40>
		00000000000010e8:  ARM64_RELOC_PAGE21	l_stogir.320
    10ec:      	ldr	x16, [x16]
		00000000000010ec:  ARM64_RELOC_PAGEOFF12	l_stogir.320
    10f0:      	orr	x23, x16, xzr
    10f4:      	adrp	x16, 0x1000 <_stogir.verify.structure+0xe40>
		00000000000010f4:  ARM64_RELOC_PAGE21	l_stogir.321
    10f8:      	ldr	x16, [x16]
		00000000000010f8:  ARM64_RELOC_PAGEOFF12	l_stogir.321
    10fc:      	orr	x24, x16, xzr
    1100:      	adrp	x16, 0x1000 <_stogir.verify.structure+0xe40>
		0000000000001100:  ARM64_RELOC_PAGE21	l_stogir.322
    1104:      	ldr	x16, [x16]
		0000000000001104:  ARM64_RELOC_PAGEOFF12	l_stogir.322
    1108:      	orr	x25, x16, xzr
    110c:      	adrp	x16, 0x1000 <_stogir.verify.structure+0xe40>
		000000000000110c:  ARM64_RELOC_PAGE21	l_stogir.323
    1110:      	ldr	x16, [x16]
		0000000000001110:  ARM64_RELOC_PAGEOFF12	l_stogir.323
    1114:      	orr	x26, x16, xzr
    1118:      	adrp	x16, 0x1000 <_stogir.verify.structure+0xe40>
		0000000000001118:  ARM64_RELOC_PAGE21	l_stogir.324
    111c:      	ldr	x16, [x16]
		000000000000111c:  ARM64_RELOC_PAGEOFF12	l_stogir.324
    1120:      	orr	x27, x16, xzr
    1124:      	adrp	x16, 0x1000 <_stogir.verify.structure+0xe40>
		0000000000001124:  ARM64_RELOC_PAGE21	l_stogir.325
    1128:      	ldr	x16, [x16]
		0000000000001128:  ARM64_RELOC_PAGEOFF12	l_stogir.325
    112c:      	orr	x28, x16, xzr
    1130:      	adrp	x16, 0x1000 <_stogir.verify.structure+0xe40>
		0000000000001130:  ARM64_RELOC_PAGE21	l_stogir.326
    1134:      	ldr	x16, [x16]
		0000000000001134:  ARM64_RELOC_PAGEOFF12	l_stogir.326
    1138:      	orr	x2, x16, xzr
    113c:      	adrp	x16, 0x1000 <_stogir.verify.structure+0xe40>
		000000000000113c:  ARM64_RELOC_PAGE21	l_stogir.327
    1140:      	ldr	x16, [x16]
		0000000000001140:  ARM64_RELOC_PAGEOFF12	l_stogir.327
    1144:      	orr	x3, x16, xzr
    1148:      	sub	sp, sp, #0x10
    114c:      	add	x4, sp, #0x10
    1150:      	add	x5, x0, #0x78
    1154:      	add	x6, x0, #0x28
    1158:      	add	x7, x0, #0x50
    115c:      	lsr	w9, w1, #0
    1160:      	lsr	w10, w1, #0
    1164:      	lsr	w1, w1, #0
    1168:      	sub	sp, sp, #0x20
    116c:      	add	x11, sp, #0x10
    1170:      	sub	sp, sp, #0x20
    1174:      	add	x12, sp, #0x10
    1178:      	add	x13, x11, #0x8
    117c:      	sub	sp, sp, #0x10
    1180:      	add	x14, sp, #0x10
    1184:      	add	x15, x12, #0x8
    1188:      	str	x19, [x29, #0x10]
    118c:      	sub	sp, sp, #0x20
    1190:      	add	x19, sp, #0x10
    1194:      	str	x20, [x29, #0x18]
    1198:      	sub	sp, sp, #0x20
    119c:      	add	x20, sp, #0x10
    11a0:      	str	x21, [x29, #0x20]
    11a4:      	sub	sp, sp, #0x20
    11a8:      	add	x21, sp, #0x10
    11ac:      	str	x22, [x29, #0x28]
    11b0:      	add	x22, x20, #0x8
    11b4:      	str	x23, [x29, #0x30]
    11b8:      	sub	sp, sp, #0x20
    11bc:      	add	x23, sp, #0x10
    11c0:      	str	x24, [x29, #0x38]
    11c4:      	sub	sp, sp, #0x20
    11c8:      	add	x24, sp, #0x10
    11cc:      	str	x25, [x29, #0x40]
    11d0:      	add	x25, x23, #0x8
    11d4:      	str	x26, [x29, #0x48]
    11d8:      	sub	sp, sp, #0x20
    11dc:      	add	x26, sp, #0x10
    11e0:      	str	x27, [x29, #0x50]
    11e4:      	add	x27, x24, #0x8
    11e8:      	str	x28, [x29, #0x58]
    11ec:      	sub	sp, sp, #0x20
    11f0:      	add	x28, sp, #0x10
    11f4:      	str	x26, [x29, #0x60]
    11f8:      	add	x26, x26, #0x8
    11fc:      	str	x26, [x29, #0x68]
    1200:      	sub	sp, sp, #0x20
    1204:      	add	x26, sp, #0x10
    1208:      	str	x28, [x29, #0x70]
    120c:      	add	x28, x28, #0x8
    1210:      	str	x28, [x29, #0x78]
    1214:      	sub	sp, sp, #0x20
    1218:      	add	x28, sp, #0x10
    121c:      	str	x26, [x29, #0x80]
    1220:      	add	x26, x26, #0x8
    1224:      	str	x26, [x29, #0x88]
    1228:      	sub	sp, sp, #0x20
    122c:      	add	x26, sp, #0x10
    1230:      	str	x28, [x29, #0x90]
    1234:      	add	x28, x28, #0x8
    1238:      	str	x28, [x29, #0x98]
    123c:      	sub	sp, sp, #0x30
    1240:      	add	x28, sp, #0x10
    1244:      	str	x28, [x29, #0xa0]
    1248:      	add	x28, x26, #0x8
    124c:      	str	x28, [x29, #0xa8]
    1250:      	sub	sp, sp, #0x20
    1254:      	add	x28, sp, #0x10
    1258:      	str	x26, [x29, #0xb0]
    125c:      	sub	sp, sp, #0x10
    1260:      	add	x26, sp, #0x10
    1264:      	str	x26, [x29, #0xb8]
    1268:      	add	x26, x28, #0x8
    126c:      	str	x26, [x29, #0xc0]
    1270:      	sub	sp, sp, #0x10
    1274:      	add	x26, sp, #0x10
    1278:      	str	x26, [x29, #0xc8]
    127c:      	sub	sp, sp, #0x10
    1280:      	add	x26, sp, #0x10
    1284:      	str	x26, [x29, #0xd0]
    1288:      	sub	sp, sp, #0x10
    128c:      	add	x26, sp, #0x10
    1290:      	str	x28, [x29, #0xe0]
    1294:      	str	x26, [x29, #0xd8]
    1298:      	str	x27, [x29, #0xf0]
    129c:      	ldr	x17, [x29, #0x10]
    12a0:      	str	x17, [x29, #0xe8]
    12a4:      	mov	x26, #0x1               ; =1
    12a8:      	movz	x28, #0x0, lsl #48
    12ac:      	movz	x27, #0x0, lsl #48
    12b0:      	cmp	x27, #0x0
    12b4:      	b.ne	0x298c <_stogir.verify.integer-operations-target-structured+0x190c>
    12b8:      	cmp	x27, #0x0
    12bc:      	b.ne	0x1e10 <_stogir.verify.integer-operations-target-structured+0xd90>
    12c0:      	str	x8, [x29, #0x100]
    12c4:      	str	x14, [x29, #0x168]
    12c8:      	str	x19, [x29, #0x158]
    12cc:      	mov	x19, x12
    12d0:      	str	x20, [x29, #0x150]
    12d4:      	mov	x20, x11
    12d8:      	str	x21, [x29, #0x130]
    12dc:      	str	x23, [x29, #0x120]
    12e0:      	str	x24, [x29, #0x110]
    12e4:      	str	x2, [x29, #0x108]
    12e8:      	str	w9, [x29, #0x138]
    12ec:      	mov	x24, x13
    12f0:      	mov	x21, x15
    12f4:      	str	x22, [x29, #0x128]
    12f8:      	str	x25, [x29, #0x118]
    12fc:      	mov	x25, x4
    1300:      	str	w10, [x29, #0x140]
    1304:      	str	w1, [x29, #0x148]
    1308:      	mov	x23, x5
    130c:      	mov	x22, x6
    1310:      	str	x7, [x29, #0x170]
    1314:      	str	x3, [x29, #0x160]
    1318:      	str	x27, [x29, #0xf8]
    131c:      	mov	x27, x0
    1320:      	ldr	x0, [x27, #0x8]
    1324:      	cmp	x26, x0
    1328:      	b.ge	0x1e90 <_stogir.verify.integer-operations-target-structured+0xe10>
    132c:      	lsl	x0, x26, #4
    1330:      	lsl	x1, x26, #2
    1334:      	ldr	x2, [x27]
    1338:      	add	x0, x0, x2
    133c:      	ldr	x2, [x0]
    1340:      	uxtb	w3, w2
    1344:      	ldr	x0, [x0, #0x8]
    1348:      	orr	x4, x3, xzr
    134c:      	str	x2, [x25]
    1350:      	str	x0, [x25, #0x8]
    1354:      	ldr	x0, [x27, #0x78]
    1358:      	add	x0, x1, x0
    135c:      	ldr	w0, [x0]
    1360:      	cmp	x4, #0xe
    1364:      	b.lt	0x1f08 <_stogir.verify.integer-operations-target-structured+0xe88>
    1368:      	cmp	x4, #0x17
    136c:      	cset	w1, le
    1370:      	ubfx	x1, x1, #0, #8
    1374:      	cmp	x4, #0x1a
    1378:      	b.lt	0x1f10 <_stogir.verify.integer-operations-target-structured+0xe90>
    137c:      	cmp	x4, #0x1e
    1380:      	b.gt	0x1f10 <_stogir.verify.integer-operations-target-structured+0xe90>
    1384:      	mov	x2, #0x1                ; =1
    1388:      	cmp	x4, #0x1f
    138c:      	b.ne	0x1f48 <_stogir.verify.integer-operations-target-structured+0xec8>
    1390:      	mov	x5, #0x1                ; =1
    1394:      	lsr	w6, w26, #0
    1398:      	lsr	w0, w0, #0
    139c:      	lsr	w6, w6, #0
    13a0:      	str	w3, [x29, #0x180]
    13a4:      	mov	w3, w0
    13a8:      	str	w0, [x29, #0x188]
    13ac:      	mov	x0, x27
    13b0:      	str	x1, [x29, #0x190]
    13b4:      	mov	w1, w6
    13b8:      	str	x2, [x29, #0x198]
    13bc:      	mov	x2, x25
    13c0:      	str	x5, [x29, #0x1a0]
    13c4:      	str	w6, [x29, #0x1a8]
    13c8:      	str	x26, [x29, #0x178]
    13cc:      	mov	x26, x4
    13d0:      	bl	0x13d0 <_stogir.verify.integer-operations-target-structured+0x350>
		00000000000013d0:  ARM64_RELOC_BRANCH26	_stogir.verify.classifications
    13d4:      	uxtb	w1, w0
    13d8:      	cmp	x1, #0x0
    13dc:      	cset	w1, ne
    13e0:      	cmp	x26, #0x3d
    13e4:      	b.lt	0x1fa8 <_stogir.verify.integer-operations-target-structured+0xf28>
    13e8:      	cmp	x26, #0x3f
    13ec:      	b.gt	0x1fa8 <_stogir.verify.integer-operations-target-structured+0xf28>
    13f0:      	mov	x8, x20
    13f4:      	ldr	w2, [x29, #0x138]
    13f8:      	str	x0, [x29, #0x1b0]
    13fc:      	mov	x0, x27
    1400:      	str	x22, [x29, #0x1b8]
    1404:      	mov	w22, w1
    1408:      	ldr	w1, [x29, #0x1a8]
    140c:      	bl	0x140c <_stogir.verify.integer-operations-target-structured+0x38c>
		000000000000140c:  ARM64_RELOC_BRANCH26	_stogir.vector.validate
    1410:      	ldr	w0, [x20]
    1414:      	lsr	x16, x0, #0
    1418:      	cmp	x16, #0x1
    141c:      	b.eq	0x1438 <_stogir.verify.integer-operations-target-structured+0x3b8>
    1420:      	b.lo	0x1428 <_stogir.verify.integer-operations-target-structured+0x3a8>
    1424:      	b	0x143c <_stogir.verify.integer-operations-target-structured+0x3bc>
    1428:      	cmp	x16, #0x0
    142c:      	b.eq	0x1434 <_stogir.verify.integer-operations-target-structured+0x3b4>
    1430:      	b	0x143c <_stogir.verify.integer-operations-target-structured+0x3bc>
    1434:      	b	0x1fcc <_stogir.verify.integer-operations-target-structured+0xf4c>
    1438:      	b	0x1440 <_stogir.verify.integer-operations-target-structured+0x3c0>
    143c:      	b	0x2974 <_stogir.verify.integer-operations-target-structured+0x18f4>
    1440:      	ldr	x0, [x20, #0x8]
    1444:      	ldr	x1, [x24, #0x8]
    1448:      	mov	x2, x1
    144c:      	mov	x1, x0
    1450:      	mov	x0, x28
    1454:      	mov	x28, x0
    1458:      	mov	x0, x1
    145c:      	mov	x1, x2
    1460:      	cmp	x26, #0x44
    1464:      	b.ne	0x1ff4 <_stogir.verify.integer-operations-target-structured+0xf74>
    1468:      	uxtb	w16, w22
    146c:      	cmp	w16, wzr
    1470:      	b.eq	0x1fe4 <_stogir.verify.integer-operations-target-structured+0xf64>
    1474:      	mov	x2, x1
    1478:      	mov	x1, x0
    147c:      	movz	x0, #0x0, lsl #48
    1480:      	cmp	x0, #0x0
    1484:      	b.eq	0x2998 <_stogir.verify.integer-operations-target-structured+0x1918>
    1488:      	mov	x8, x19
    148c:      	mov	x0, x27
    1490:      	str	x1, [x29, #0x1c0]
    1494:      	ldr	w1, [x29, #0x1a8]
    1498:      	str	x2, [x29, #0x1c8]
    149c:      	bl	0x149c <_stogir.verify.integer-operations-target-structured+0x41c>
		000000000000149c:  ARM64_RELOC_BRANCH26	_stogir.copy.validate
    14a0:      	ldr	w0, [x19]
    14a4:      	lsr	x16, x0, #0
    14a8:      	cmp	x16, #0x1
    14ac:      	b.eq	0x14c8 <_stogir.verify.integer-operations-target-structured+0x448>
    14b0:      	b.lo	0x14b8 <_stogir.verify.integer-operations-target-structured+0x438>
    14b4:      	b	0x14cc <_stogir.verify.integer-operations-target-structured+0x44c>
    14b8:      	cmp	x16, #0x0
    14bc:      	b.eq	0x14c4 <_stogir.verify.integer-operations-target-structured+0x444>
    14c0:      	b	0x14cc <_stogir.verify.integer-operations-target-structured+0x44c>
    14c4:      	b	0x2004 <_stogir.verify.integer-operations-target-structured+0xf84>
    14c8:      	b	0x14d0 <_stogir.verify.integer-operations-target-structured+0x450>
    14cc:      	b	0x201c <_stogir.verify.integer-operations-target-structured+0xf9c>
    14d0:      	ldr	x0, [x19, #0x8]
    14d4:      	ldr	x1, [x21, #0x8]
    14d8:      	mov	x2, x1
    14dc:      	mov	x1, x0
    14e0:      	mov	x0, x28
    14e4:      	mov	x28, x0
    14e8:      	mov	x0, x1
    14ec:      	mov	x1, x2
    14f0:      	cmp	x26, #0x1d
    14f4:      	b.ne	0x2030 <_stogir.verify.integer-operations-target-structured+0xfb0>
    14f8:      	mov	x2, x1
    14fc:      	mov	x1, x0
    1500:      	mov	x0, #0x1                ; =1
    1504:      	cmp	x0, #0x0
    1508:      	b.eq	0x2058 <_stogir.verify.integer-operations-target-structured+0xfd8>
    150c:      	ldr	w0, [x25, #0xc]
    1510:      	sxtw	x0, w0
    1514:      	cmp	x0, #0x0
    1518:      	b.ne	0x2050 <_stogir.verify.integer-operations-target-structured+0xfd0>
    151c:      	movz	x0, #0x0, lsl #48
    1520:      	cmp	x0, #0x0
    1524:      	b.eq	0x29a4 <_stogir.verify.integer-operations-target-structured+0x1924>
    1528:      	ldr	w0, [x25, #0xc]
    152c:      	sxtw	x0, w0
    1530:      	cmp	x0, #0x0
    1534:      	cset	w3, gt
    1538:      	movz	x16, #0x0, lsl #48
    153c:      	sub	x4, x16, x0
    1540:      	sub	x5, x4, #0x1
    1544:      	uxtb	w16, w3
    1548:      	cmp	w16, wzr
    154c:      	b.eq	0x2080 <_stogir.verify.integer-operations-target-structured+0x1000>
    1550:      	ldr	x4, [x27, #0x8]
    1554:      	cmp	x0, x4
    1558:      	b.ge	0x2070 <_stogir.verify.integer-operations-target-structured+0xff0>
    155c:      	ldr	x4, [x23, #0x8]
    1560:      	cmp	x0, x4
    1564:      	b.ge	0x2060 <_stogir.verify.integer-operations-target-structured+0xfe0>
    1568:      	lsl	x4, x0, #2
    156c:      	ldr	x6, [x27, #0x78]
    1570:      	add	x4, x4, x6
    1574:      	ldr	w4, [x4]
    1578:      	sxtw	x4, w4
    157c:      	cmp	x4, #0x0
    1580:      	cset	w4, ge
    1584:      	ubfx	x4, x4, #0, #8
    1588:      	fmov	d31, x1
    158c:      	mov	x1, x4
    1590:      	mov	x4, x2
    1594:      	fmov	x2, d31
    1598:      	ldr	x6, [x29, #0x1b8]
    159c:      	ldr	x8, [x29, #0x170]
    15a0:      	cmp	x1, #0x0
    15a4:      	b.eq	0x2118 <_stogir.verify.integer-operations-target-structured+0x1098>
    15a8:      	uxtb	w16, w3
    15ac:      	cmp	w16, wzr
    15b0:      	b.eq	0x20f4 <_stogir.verify.integer-operations-target-structured+0x1074>
    15b4:      	lsl	x0, x0, #4
    15b8:      	ldr	x1, [x27]
    15bc:      	add	x0, x0, x1
    15c0:      	ldr	x1, [x0]
    15c4:      	ldr	x0, [x0, #0x8]
    15c8:      	fmov	d31, x0
    15cc:      	mov	x0, x1
    15d0:      	fmov	x1, d31
    15d4:      	mov	x3, x2
    15d8:      	mov	x2, x1
    15dc:      	mov	x1, x0
    15e0:      	mov	x0, #0x1                ; =1
    15e4:      	lsr	w0, w0, #0
    15e8:      	lsr	x16, x0, #0
    15ec:      	cmp	x16, #0x1
    15f0:      	b.eq	0x160c <_stogir.verify.integer-operations-target-structured+0x58c>
    15f4:      	b.lo	0x15fc <_stogir.verify.integer-operations-target-structured+0x57c>
    15f8:      	b	0x1610 <_stogir.verify.integer-operations-target-structured+0x590>
    15fc:      	cmp	x16, #0x0
    1600:      	b.eq	0x1608 <_stogir.verify.integer-operations-target-structured+0x588>
    1604:      	b	0x1610 <_stogir.verify.integer-operations-target-structured+0x590>
    1608:      	b	0x1614 <_stogir.verify.integer-operations-target-structured+0x594>
    160c:      	b	0x212c <_stogir.verify.integer-operations-target-structured+0x10ac>
    1610:      	b	0x21f4 <_stogir.verify.integer-operations-target-structured+0x1174>
    1614:      	ldr	x0, [x29, #0x168]
    1618:      	ldr	x5, [x29, #0x160]
    161c:      	ldr	x1, [x29, #0x18]
    1620:      	mov	x2, #0x16               ; =22
    1624:      	cmp	x26, #0x29
    1628:      	b.lt	0x21fc <_stogir.verify.integer-operations-target-structured+0x117c>
    162c:      	cmp	x26, #0x2b
    1630:      	cset	w3, le
    1634:      	ubfx	x3, x3, #0, #8
    1638:      	fmov	d31, x1
    163c:      	mov	x1, x3
    1640:      	mov	x3, x2
    1644:      	fmov	x2, d31
    1648:      	cmp	x26, #0x2c
    164c:      	cset	w4, eq
    1650:      	cmp	x1, #0x0
    1654:      	b.eq	0x220c <_stogir.verify.integer-operations-target-structured+0x118c>
    1658:      	mov	x1, #0x1                ; =1
    165c:      	cmp	x1, #0x0
    1660:      	b.eq	0x29b8 <_stogir.verify.integer-operations-target-structured+0x1938>
    1664:      	uxtb	w16, w4
    1668:      	cmp	w16, wzr
    166c:      	b.eq	0x29e4 <_stogir.verify.integer-operations-target-structured+0x1964>
    1670:      	ldr	w1, [x29, #0x1a8]
    1674:      	str	x6, [x29, #0x1b8]
    1678:      	str	x8, [x29, #0x170]
    167c:      	ldr	x8, [x29, #0x158]
    1680:      	str	x0, [x29, #0x168]
    1684:      	mov	x0, x27
    1688:      	str	x5, [x29, #0x160]
    168c:      	str	x2, [x29, #0x1d0]
    1690:      	str	x3, [x29, #0x1d8]
    1694:      	bl	0x1694 <_stogir.verify.integer-operations-target-structured+0x614>
		0000000000001694:  ARM64_RELOC_BRANCH26	_stogir.checked.validate-projection
    1698:      	ldr	x0, [x29, #0x158]
    169c:      	ldr	x1, [x0]
    16a0:      	ldr	x2, [x29, #0x150]
    16a4:      	str	x1, [x2]
    16a8:      	ldr	x1, [x0, #0x8]
    16ac:      	str	x1, [x2, #0x8]
    16b0:      	ldr	x1, [x0, #0x10]
    16b4:      	str	x1, [x2, #0x10]
    16b8:      	str	x19, [x29, #0x1e0]
    16bc:      	str	x0, [x29, #0x158]
    16c0:      	mov	x19, x2
    16c4:      	ldr	x0, [x29, #0x130]
    16c8:      	ldr	x1, [x29, #0x1d0]
    16cc:      	ldr	x2, [x29, #0x1d8]
    16d0:      	ldr	w3, [x19]
    16d4:      	lsr	x16, x3, #0
    16d8:      	cmp	x16, #0x1
    16dc:      	b.eq	0x16fc <_stogir.verify.integer-operations-target-structured+0x67c>
    16e0:      	b.lo	0x16e8 <_stogir.verify.integer-operations-target-structured+0x668>
    16e4:      	b	0x1700 <_stogir.verify.integer-operations-target-structured+0x680>
    16e8:      	cmp	x16, #0x0
    16ec:      	b.eq	0x16f4 <_stogir.verify.integer-operations-target-structured+0x674>
    16f0:      	b	0x1700 <_stogir.verify.integer-operations-target-structured+0x680>
    16f4:      	ldr	x3, [x29, #0x128]
    16f8:      	b	0x2258 <_stogir.verify.integer-operations-target-structured+0x11d8>
    16fc:      	b	0x1704 <_stogir.verify.integer-operations-target-structured+0x684>
    1700:      	b	0x2278 <_stogir.verify.integer-operations-target-structured+0x11f8>
    1704:      	ldr	x1, [x19, #0x8]
    1708:      	ldr	x3, [x29, #0x128]
    170c:      	ldr	x2, [x3, #0x8]
    1710:      	mov	x4, x2
    1714:      	mov	x2, x1
    1718:      	mov	x1, x28
    171c:      	mov	x28, x1
    1720:      	mov	x1, x2
    1724:      	mov	x2, x4
    1728:      	cmp	x26, #0x7e
    172c:      	b.lt	0x228c <_stogir.verify.integer-operations-target-structured+0x120c>
    1730:      	cmp	x26, #0x82
    1734:      	cset	w4, le
    1738:      	ubfx	x4, x4, #0, #8
    173c:      	fmov	d31, x1
    1740:      	mov	x1, x4
    1744:      	mov	x4, x2
    1748:      	fmov	x2, d31
    174c:      	cmp	x1, #0x0
    1750:      	b.eq	0x2a08 <_stogir.verify.integer-operations-target-structured+0x1988>
    1754:      	ldr	x8, [x29, #0x120]
    1758:      	ldr	w1, [x29, #0x1a8]
    175c:      	str	x0, [x29, #0x130]
    1760:      	mov	x0, x27
    1764:      	str	x3, [x29, #0x128]
    1768:      	str	x2, [x29, #0x1e8]
    176c:      	str	x4, [x29, #0x1f0]
    1770:      	bl	0x1770 <_stogir.verify.integer-operations-target-structured+0x6f0>
		0000000000001770:  ARM64_RELOC_BRANCH26	_stogir.atomic.validate
    1774:      	ldr	x0, [x29, #0x120]
    1778:      	ldr	w1, [x0]
    177c:      	lsr	x16, x1, #0
    1780:      	cmp	x16, #0x1
    1784:      	b.eq	0x17a4 <_stogir.verify.integer-operations-target-structured+0x724>
    1788:      	b.lo	0x1790 <_stogir.verify.integer-operations-target-structured+0x710>
    178c:      	b	0x17a8 <_stogir.verify.integer-operations-target-structured+0x728>
    1790:      	cmp	x16, #0x0
    1794:      	b.eq	0x179c <_stogir.verify.integer-operations-target-structured+0x71c>
    1798:      	b	0x17a8 <_stogir.verify.integer-operations-target-structured+0x728>
    179c:      	ldr	x2, [x29, #0x118]
    17a0:      	b	0x229c <_stogir.verify.integer-operations-target-structured+0x121c>
    17a4:      	b	0x17ac <_stogir.verify.integer-operations-target-structured+0x72c>
    17a8:      	b	0x22b4 <_stogir.verify.integer-operations-target-structured+0x1234>
    17ac:      	ldr	x1, [x0, #0x8]
    17b0:      	ldr	x2, [x29, #0x118]
    17b4:      	ldr	x3, [x2, #0x8]
    17b8:      	mov	x4, x3
    17bc:      	mov	x3, x1
    17c0:      	mov	x1, x28
    17c4:      	mov	x28, x1
    17c8:      	mov	x1, x3
    17cc:      	mov	x3, x4
    17d0:      	cmp	x26, #0x60
    17d4:      	b.ne	0x22c8 <_stogir.verify.integer-operations-target-structured+0x1248>
    17d8:      	mov	x4, x3
    17dc:      	mov	x3, x1
    17e0:      	mov	x1, #0x1                ; =1
    17e4:      	cmp	x1, #0x0
    17e8:      	b.eq	0x2a24 <_stogir.verify.integer-operations-target-structured+0x19a4>
    17ec:      	ldr	x8, [x29, #0x110]
    17f0:      	ldr	w1, [x29, #0x1a8]
    17f4:      	str	x0, [x29, #0x120]
    17f8:      	mov	x0, x27
    17fc:      	str	x2, [x29, #0x118]
    1800:      	str	x3, [x29, #0x1f8]
    1804:      	str	x4, [x29, #0x200]
    1808:      	bl	0x1808 <_stogir.verify.integer-operations-target-structured+0x788>
		0000000000001808:  ARM64_RELOC_BRANCH26	_stogir.terminal.validate
    180c:      	ldr	x0, [x29, #0x110]
    1810:      	ldr	w1, [x0]
    1814:      	lsr	x16, x1, #0
    1818:      	cmp	x16, #0x1
    181c:      	b.eq	0x183c <_stogir.verify.integer-operations-target-structured+0x7bc>
    1820:      	b.lo	0x1828 <_stogir.verify.integer-operations-target-structured+0x7a8>
    1824:      	b	0x1840 <_stogir.verify.integer-operations-target-structured+0x7c0>
    1828:      	cmp	x16, #0x0
    182c:      	b.eq	0x1834 <_stogir.verify.integer-operations-target-structured+0x7b4>
    1830:      	b	0x1840 <_stogir.verify.integer-operations-target-structured+0x7c0>
    1834:      	ldr	x2, [x29, #0xf0]
    1838:      	b	0x22e8 <_stogir.verify.integer-operations-target-structured+0x1268>
    183c:      	b	0x1844 <_stogir.verify.integer-operations-target-structured+0x7c4>
    1840:      	b	0x2300 <_stogir.verify.integer-operations-target-structured+0x1280>
    1844:      	ldr	x1, [x0, #0x8]
    1848:      	ldr	x2, [x29, #0xf0]
    184c:      	ldr	x3, [x2, #0x8]
    1850:      	mov	x4, x3
    1854:      	mov	x3, x1
    1858:      	mov	x1, x28
    185c:      	mov	x28, x1
    1860:      	mov	x1, x3
    1864:      	mov	x3, x4
    1868:      	cmp	x26, #0x75
    186c:      	b.ne	0x2314 <_stogir.verify.integer-operations-target-structured+0x1294>
    1870:      	mov	x4, x3
    1874:      	mov	x3, x1
    1878:      	mov	x1, #0x1                ; =1
    187c:      	cmp	x1, #0x0
    1880:      	b.eq	0x2a40 <_stogir.verify.integer-operations-target-structured+0x19c0>
    1884:      	ldr	x8, [x29, #0x60]
    1888:      	ldr	w1, [x29, #0x1a8]
    188c:      	str	x0, [x29, #0x110]
    1890:      	mov	x0, x27
    1894:      	str	x2, [x29, #0xf0]
    1898:      	str	x3, [x29, #0x208]
    189c:      	str	x4, [x29, #0x210]
    18a0:      	bl	0x18a0 <_stogir.verify.integer-operations-target-structured+0x820>
		00000000000018a0:  ARM64_RELOC_BRANCH26	_stogir.switch.validate
    18a4:      	ldr	x0, [x29, #0x60]
    18a8:      	ldr	w1, [x0]
    18ac:      	lsr	x16, x1, #0
    18b0:      	cmp	x16, #0x1
    18b4:      	b.eq	0x18d4 <_stogir.verify.integer-operations-target-structured+0x854>
    18b8:      	b.lo	0x18c0 <_stogir.verify.integer-operations-target-structured+0x840>
    18bc:      	b	0x18d8 <_stogir.verify.integer-operations-target-structured+0x858>
    18c0:      	cmp	x16, #0x0
    18c4:      	b.eq	0x18cc <_stogir.verify.integer-operations-target-structured+0x84c>
    18c8:      	b	0x18d8 <_stogir.verify.integer-operations-target-structured+0x858>
    18cc:      	ldr	x2, [x29, #0x68]
    18d0:      	b	0x2344 <_stogir.verify.integer-operations-target-structured+0x12c4>
    18d4:      	b	0x18dc <_stogir.verify.integer-operations-target-structured+0x85c>
    18d8:      	b	0x235c <_stogir.verify.integer-operations-target-structured+0x12dc>
    18dc:      	ldr	x1, [x0, #0x8]
    18e0:      	ldr	x2, [x29, #0x68]
    18e4:      	ldr	x3, [x2, #0x8]
    18e8:      	mov	x4, x3
    18ec:      	mov	x3, x1
    18f0:      	mov	x1, x28
    18f4:      	mov	x28, x1
    18f8:      	mov	x1, x3
    18fc:      	mov	x3, x4
    1900:      	cmp	x26, #0x42
    1904:      	b.ne	0x2370 <_stogir.verify.integer-operations-target-structured+0x12f0>
    1908:      	mov	x4, x3
    190c:      	mov	x3, x1
    1910:      	mov	x1, #0x1                ; =1
    1914:      	cmp	x1, #0x0
    1918:      	b.eq	0x2a5c <_stogir.verify.integer-operations-target-structured+0x19dc>
    191c:      	ldr	x8, [x29, #0x70]
    1920:      	ldr	w1, [x29, #0x1a8]
    1924:      	str	x0, [x29, #0x60]
    1928:      	mov	x0, x27
    192c:      	str	x2, [x29, #0x68]
    1930:      	str	x3, [x29, #0x218]
    1934:      	str	x4, [x29, #0x220]
    1938:      	bl	0x1938 <_stogir.verify.integer-operations-target-structured+0x8b8>
		0000000000001938:  ARM64_RELOC_BRANCH26	_stogir.stack.validate
    193c:      	ldr	x0, [x29, #0x70]
    1940:      	ldr	w1, [x0]
    1944:      	lsr	x16, x1, #0
    1948:      	cmp	x16, #0x1
    194c:      	b.eq	0x196c <_stogir.verify.integer-operations-target-structured+0x8ec>
    1950:      	b.lo	0x1958 <_stogir.verify.integer-operations-target-structured+0x8d8>
    1954:      	b	0x1970 <_stogir.verify.integer-operations-target-structured+0x8f0>
    1958:      	cmp	x16, #0x0
    195c:      	b.eq	0x1964 <_stogir.verify.integer-operations-target-structured+0x8e4>
    1960:      	b	0x1970 <_stogir.verify.integer-operations-target-structured+0x8f0>
    1964:      	ldr	x2, [x29, #0x78]
    1968:      	b	0x23c0 <_stogir.verify.integer-operations-target-structured+0x1340>
    196c:      	b	0x1974 <_stogir.verify.integer-operations-target-structured+0x8f4>
    1970:      	b	0x23d8 <_stogir.verify.integer-operations-target-structured+0x1358>
    1974:      	ldr	x1, [x0, #0x8]
    1978:      	ldr	x2, [x29, #0x78]
    197c:      	ldr	x3, [x2, #0x8]
    1980:      	mov	x4, x3
    1984:      	mov	x3, x1
    1988:      	mov	x1, x28
    198c:      	mov	x28, x1
    1990:      	mov	x1, x3
    1994:      	mov	x3, x4
    1998:      	cmp	x26, #0x41
    199c:      	b.ne	0x23ec <_stogir.verify.integer-operations-target-structured+0x136c>
    19a0:      	mov	x4, x3
    19a4:      	mov	x3, x1
    19a8:      	mov	x1, #0x1                ; =1
    19ac:      	cmp	x1, #0x0
    19b0:      	b.eq	0x2a78 <_stogir.verify.integer-operations-target-structured+0x19f8>
    19b4:      	ldr	x8, [x29, #0x80]
    19b8:      	ldr	w1, [x29, #0x1a8]
    19bc:      	str	x0, [x29, #0x70]
    19c0:      	mov	x0, x27
    19c4:      	str	x2, [x29, #0x78]
    19c8:      	ldr	w2, [x29, #0x140]
    19cc:      	str	x3, [x29, #0x228]
    19d0:      	str	x4, [x29, #0x230]
    19d4:      	bl	0x19d4 <_stogir.verify.integer-operations-target-structured+0x954>
		00000000000019d4:  ARM64_RELOC_BRANCH26	_stogir.locals.validate
    19d8:      	ldr	x0, [x29, #0x80]
    19dc:      	ldr	w1, [x0]
    19e0:      	lsr	x16, x1, #0
    19e4:      	cmp	x16, #0x1
    19e8:      	b.eq	0x1a08 <_stogir.verify.integer-operations-target-structured+0x988>
    19ec:      	b.lo	0x19f4 <_stogir.verify.integer-operations-target-structured+0x974>
    19f0:      	b	0x1a0c <_stogir.verify.integer-operations-target-structured+0x98c>
    19f4:      	cmp	x16, #0x0
    19f8:      	b.eq	0x1a00 <_stogir.verify.integer-operations-target-structured+0x980>
    19fc:      	b	0x1a0c <_stogir.verify.integer-operations-target-structured+0x98c>
    1a00:      	ldr	x2, [x29, #0x88]
    1a04:      	b	0x242c <_stogir.verify.integer-operations-target-structured+0x13ac>
    1a08:      	b	0x1a10 <_stogir.verify.integer-operations-target-structured+0x990>
    1a0c:      	b	0x2444 <_stogir.verify.integer-operations-target-structured+0x13c4>
    1a10:      	ldr	x1, [x0, #0x8]
    1a14:      	ldr	x2, [x29, #0x88]
    1a18:      	ldr	x3, [x2, #0x8]
    1a1c:      	mov	x4, x3
    1a20:      	mov	x3, x1
    1a24:      	mov	x1, x28
    1a28:      	mov	x28, x1
    1a2c:      	mov	x1, x3
    1a30:      	mov	x3, x4
    1a34:      	cmp	x26, #0x21
    1a38:      	b.lt	0x2458 <_stogir.verify.integer-operations-target-structured+0x13d8>
    1a3c:      	cmp	x26, #0x27
    1a40:      	cset	w4, le
    1a44:      	ubfx	x4, x4, #0, #8
    1a48:      	fmov	d31, x1
    1a4c:      	mov	x1, x4
    1a50:      	mov	x4, x3
    1a54:      	fmov	x3, d31
    1a58:      	cmp	x1, #0x0
    1a5c:      	b.eq	0x2a94 <_stogir.verify.integer-operations-target-structured+0x1a14>
    1a60:      	ldr	x8, [x29, #0x90]
    1a64:      	ldr	w1, [x29, #0x1a8]
    1a68:      	str	x0, [x29, #0x80]
    1a6c:      	mov	x0, x27
    1a70:      	str	x2, [x29, #0x88]
    1a74:      	ldr	w2, [x29, #0x148]
    1a78:      	str	x3, [x29, #0x238]
    1a7c:      	str	x4, [x29, #0x240]
    1a80:      	bl	0x1a80 <_stogir.verify.integer-operations-target-structured+0xa00>
		0000000000001a80:  ARM64_RELOC_BRANCH26	_stogir.conversion.validate
    1a84:      	ldr	x0, [x29, #0x90]
    1a88:      	ldr	w1, [x0]
    1a8c:      	lsr	x16, x1, #0
    1a90:      	cmp	x16, #0x1
    1a94:      	b.eq	0x1ab4 <_stogir.verify.integer-operations-target-structured+0xa34>
    1a98:      	b.lo	0x1aa0 <_stogir.verify.integer-operations-target-structured+0xa20>
    1a9c:      	b	0x1ab8 <_stogir.verify.integer-operations-target-structured+0xa38>
    1aa0:      	cmp	x16, #0x0
    1aa4:      	b.eq	0x1aac <_stogir.verify.integer-operations-target-structured+0xa2c>
    1aa8:      	b	0x1ab8 <_stogir.verify.integer-operations-target-structured+0xa38>
    1aac:      	ldr	x2, [x29, #0x98]
    1ab0:      	b	0x2468 <_stogir.verify.integer-operations-target-structured+0x13e8>
    1ab4:      	b	0x1abc <_stogir.verify.integer-operations-target-structured+0xa3c>
    1ab8:      	b	0x2480 <_stogir.verify.integer-operations-target-structured+0x1400>
    1abc:      	ldr	x1, [x0, #0x8]
    1ac0:      	ldr	x2, [x29, #0x98]
    1ac4:      	ldr	x3, [x2, #0x8]
    1ac8:      	mov	x4, x3
    1acc:      	mov	x3, x1
    1ad0:      	mov	x1, x28
    1ad4:      	mov	x28, x1
    1ad8:      	mov	x1, x3
    1adc:      	mov	x3, x4
    1ae0:      	cmp	x26, #0x3c
    1ae4:      	b.ne	0x2ab0 <_stogir.verify.integer-operations-target-structured+0x1a30>
    1ae8:      	ldr	x8, [x29, #0xb0]
    1aec:      	str	x0, [x29, #0x90]
    1af0:      	mov	x0, x27
    1af4:      	str	x2, [x29, #0x98]
    1af8:      	str	x1, [x29, #0x248]
    1afc:      	ldr	w1, [x29, #0x1a8]
    1b00:      	str	x3, [x29, #0x250]
    1b04:      	bl	0x1b04 <_stogir.verify.integer-operations-target-structured+0xa84>
		0000000000001b04:  ARM64_RELOC_BRANCH26	_stogir.conditional.validate
    1b08:      	ldr	x0, [x29, #0xb0]
    1b0c:      	ldr	w1, [x0]
    1b10:      	lsr	x16, x1, #0
    1b14:      	cmp	x16, #0x1
    1b18:      	b.eq	0x1b38 <_stogir.verify.integer-operations-target-structured+0xab8>
    1b1c:      	b.lo	0x1b24 <_stogir.verify.integer-operations-target-structured+0xaa4>
    1b20:      	b	0x1b3c <_stogir.verify.integer-operations-target-structured+0xabc>
    1b24:      	cmp	x16, #0x0
    1b28:      	b.eq	0x1b30 <_stogir.verify.integer-operations-target-structured+0xab0>
    1b2c:      	b	0x1b3c <_stogir.verify.integer-operations-target-structured+0xabc>
    1b30:      	ldr	x2, [x29, #0xa8]
    1b34:      	b	0x2494 <_stogir.verify.integer-operations-target-structured+0x1414>
    1b38:      	b	0x1b40 <_stogir.verify.integer-operations-target-structured+0xac0>
    1b3c:      	b	0x24ac <_stogir.verify.integer-operations-target-structured+0x142c>
    1b40:      	ldr	x1, [x0, #0x8]
    1b44:      	ldr	x2, [x29, #0xa8]
    1b48:      	ldr	x3, [x2, #0x8]
    1b4c:      	mov	x4, x3
    1b50:      	mov	x3, x1
    1b54:      	mov	x1, x28
    1b58:      	mov	x28, x1
    1b5c:      	mov	x1, x3
    1b60:      	mov	x3, x4
    1b64:      	cmp	x26, #0x78
    1b68:      	b.ne	0x2acc <_stogir.verify.integer-operations-target-structured+0x1a4c>
    1b6c:      	ldr	w4, [x25]
    1b70:      	ubfx	x4, x4, #8, #8
    1b74:      	cmp	x4, #0x0
    1b78:      	b.ne	0x24dc <_stogir.verify.integer-operations-target-structured+0x145c>
    1b7c:      	ldr	w4, [x25, #0x8]
    1b80:      	sxtw	x4, w4
    1b84:      	cmp	x4, #0x0
    1b88:      	b.ne	0x24c0 <_stogir.verify.integer-operations-target-structured+0x1440>
    1b8c:      	mov	x4, x3
    1b90:      	mov	x3, x1
    1b94:      	movz	x1, #0x0, lsl #48
    1b98:      	cmp	x1, #0x0
    1b9c:      	b.eq	0x24d0 <_stogir.verify.integer-operations-target-structured+0x1450>
    1ba0:      	ldr	x1, [x29, #0x28]
    1ba4:      	mov	x3, #0x1f               ; =31
    1ba8:      	str	x19, [x29, #0x150]
    1bac:      	str	x0, [x29, #0xb0]
    1bb0:      	str	x2, [x29, #0xa8]
    1bb4:      	mov	x0, x1
    1bb8:      	mov	x1, x3
    1bbc:      	add	x2, x28, #0x1
    1bc0:      	lsr	w2, w2, #0
    1bc4:      	sxtw	x2, w2
    1bc8:      	mov	x19, x2
    1bcc:      	mov	x28, x0
    1bd0:      	mov	x0, x1
    1bd4:      	ldr	x1, [x29, #0x1b0]
    1bd8:      	uxth	w1, w1
    1bdc:      	mov	w17, #0x8               ; =8
    1be0:      	uxth	w16, w1
    1be4:      	ubfx	w17, w17, #0, #4
    1be8:      	lsr	w1, w16, w17
    1bec:      	uxth	w1, w1
    1bf0:      	uxtb	w1, w1
    1bf4:      	cmp	x1, #0x0
    1bf8:      	b.eq	0x2ae4 <_stogir.verify.integer-operations-target-structured+0x1a64>
    1bfc:      	ldr	x8, [x29, #0xe0]
    1c00:      	str	x0, [x29, #0x268]
    1c04:      	mov	x0, x27
    1c08:      	str	x20, [x29, #0x270]
    1c0c:      	mov	x20, x1
    1c10:      	ldr	w1, [x29, #0x1a8]
    1c14:      	bl	0x1c14 <_stogir.verify.integer-operations-target-structured+0xb94>
		0000000000001c14:  ARM64_RELOC_BRANCH26	_stogir.floating.validate
    1c18:      	ldr	x0, [x29, #0xe0]
    1c1c:      	ldr	w1, [x0]
    1c20:      	lsr	x16, x1, #0
    1c24:      	cmp	x16, #0x1
    1c28:      	b.eq	0x1c48 <_stogir.verify.integer-operations-target-structured+0xbc8>
    1c2c:      	b.lo	0x1c34 <_stogir.verify.integer-operations-target-structured+0xbb4>
    1c30:      	b	0x1c4c <_stogir.verify.integer-operations-target-structured+0xbcc>
    1c34:      	cmp	x16, #0x0
    1c38:      	b.eq	0x1c40 <_stogir.verify.integer-operations-target-structured+0xbc0>
    1c3c:      	b	0x1c4c <_stogir.verify.integer-operations-target-structured+0xbcc>
    1c40:      	ldr	x2, [x29, #0xc0]
    1c44:      	b	0x25a8 <_stogir.verify.integer-operations-target-structured+0x1528>
    1c48:      	b	0x1c50 <_stogir.verify.integer-operations-target-structured+0xbd0>
    1c4c:      	b	0x25c0 <_stogir.verify.integer-operations-target-structured+0x1540>
    1c50:      	ldr	x1, [x0, #0x8]
    1c54:      	ldr	x2, [x29, #0xc0]
    1c58:      	ldr	x3, [x2, #0x8]
    1c5c:      	mov	x4, x3
    1c60:      	mov	x3, x1
    1c64:      	mov	x1, x19
    1c68:      	mov	x19, x1
    1c6c:      	mov	x1, x3
    1c70:      	mov	x3, x4
    1c74:      	uxtb	w16, w22
    1c78:      	cmp	w16, wzr
    1c7c:      	b.eq	0x25d4 <_stogir.verify.integer-operations-target-structured+0x1554>
    1c80:      	mov	x4, x3
    1c84:      	mov	x3, x1
    1c88:      	movz	x1, #0x0, lsl #48
    1c8c:      	cmp	x1, #0x0
    1c90:      	b.eq	0x2afc <_stogir.verify.integer-operations-target-structured+0x1a7c>
    1c94:      	cmp	x20, #0x0
    1c98:      	b.eq	0x25e4 <_stogir.verify.integer-operations-target-structured+0x1564>
    1c9c:      	movz	x1, #0x0, lsl #48
    1ca0:      	cmp	x1, #0x0
    1ca4:      	b.eq	0x2b08 <_stogir.verify.integer-operations-target-structured+0x1a88>
    1ca8:      	ldr	x20, [x29, #0x190]
    1cac:      	cmp	x20, #0x0
    1cb0:      	b.eq	0x25ec <_stogir.verify.integer-operations-target-structured+0x156c>
    1cb4:      	ldr	x22, [x29, #0x198]
    1cb8:      	mov	x1, #0x1                ; =1
    1cbc:      	mov	x28, x3
    1cc0:      	mov	x3, x4
    1cc4:      	cmp	x1, #0x0
    1cc8:      	b.eq	0x2b14 <_stogir.verify.integer-operations-target-structured+0x1a94>
    1ccc:      	ldr	x16, [x29, #0xd0]
    1cd0:      	str	x16, [sp]
    1cd4:      	ldr	w1, [x29, #0x1a8]
    1cd8:      	str	x0, [x29, #0xe0]
    1cdc:      	mov	x0, x27
    1ce0:      	str	x2, [x29, #0xc0]
    1ce4:      	str	x3, [x29, #0x278]
    1ce8:      	mov	x2, #0x1                ; =1
    1cec:      	bl	0x1cec <_stogir.verify.integer-operations-target-structured+0xc6c>
		0000000000001cec:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    1cf0:      	ldr	x16, [sp]
    1cf4:      	str	x0, [x16]
    1cf8:      	str	x1, [x16, #0x8]
    1cfc:      	ldr	x0, [x29, #0xd0]
    1d00:      	ldr	x1, [x0]
    1d04:      	ldr	x2, [x0, #0x8]
    1d08:      	lsr	w3, w1, #0
    1d0c:      	ldr	x4, [x29, #0xb8]
    1d10:      	str	x1, [x4]
    1d14:      	str	x2, [x4, #0x8]
    1d18:      	lsr	x16, x3, #0
    1d1c:      	cmp	x16, #0x1
    1d20:      	b.eq	0x1d3c <_stogir.verify.integer-operations-target-structured+0xcbc>
    1d24:      	b.lo	0x1d2c <_stogir.verify.integer-operations-target-structured+0xcac>
    1d28:      	b	0x1d40 <_stogir.verify.integer-operations-target-structured+0xcc0>
    1d2c:      	cmp	x16, #0x0
    1d30:      	b.eq	0x1d38 <_stogir.verify.integer-operations-target-structured+0xcb8>
    1d34:      	b	0x1d40 <_stogir.verify.integer-operations-target-structured+0xcc0>
    1d38:      	b	0x1d44 <_stogir.verify.integer-operations-target-structured+0xcc4>
    1d3c:      	b	0x2620 <_stogir.verify.integer-operations-target-structured+0x15a0>
    1d40:      	b	0x295c <_stogir.verify.integer-operations-target-structured+0x18dc>
    1d44:      	str	x4, [x29, #0xb8]
    1d48:      	str	x0, [x29, #0xd0]
    1d4c:      	ldr	x22, [x29, #0xd8]
    1d50:      	str	x21, [x29, #0x280]
    1d54:      	ldr	x0, [x29, #0x40]
    1d58:      	mov	x1, #0x17               ; =23
    1d5c:      	add	x2, x19, #0x1
    1d60:      	lsr	w2, w2, #0
    1d64:      	sxtw	x2, w2
    1d68:      	fmov	d31, x0
    1d6c:      	mov	x0, x2
    1d70:      	mov	x2, x1
    1d74:      	fmov	x1, d31
    1d78:      	ldr	w3, [x29, #0x188]
    1d7c:      	sxtw	x3, w3
    1d80:      	add	x3, x3, #0x4
    1d84:      	asr	x16, x3, #63
    1d88:      	lsr	x16, x16, #62
    1d8c:      	add	x3, x3, x16
    1d90:      	asr	x3, x3, #2
    1d94:      	ldr	x4, [x29, #0x178]
    1d98:      	add	x3, x3, x4
    1d9c:      	ldr	x8, [x29, #0x100]
    1da0:      	mov	x4, x25
    1da4:      	ldr	x11, [x29, #0x270]
    1da8:      	ldr	x12, [x29, #0x1e0]
    1dac:      	ldr	x14, [x29, #0x168]
    1db0:      	ldr	x19, [x29, #0x158]
    1db4:      	ldr	x20, [x29, #0x150]
    1db8:      	ldr	x21, [x29, #0x130]
    1dbc:      	str	x22, [x29, #0xd8]
    1dc0:      	ldr	w9, [x29, #0x138]
    1dc4:      	mov	x13, x24
    1dc8:      	ldr	x24, [x29, #0x110]
    1dcc:      	ldr	x15, [x29, #0x280]
    1dd0:      	ldr	x22, [x29, #0x128]
    1dd4:      	ldr	x25, [x29, #0x118]
    1dd8:      	ldr	w10, [x29, #0x140]
    1ddc:      	mov	x5, x23
    1de0:      	ldr	x23, [x29, #0x120]
    1de4:      	ldr	x6, [x29, #0x1b8]
    1de8:      	ldr	x7, [x29, #0x170]
    1dec:      	mov	x26, x3
    1df0:      	ldr	x3, [x29, #0x160]
    1df4:      	mov	x28, x0
    1df8:      	mov	x0, x27
    1dfc:      	str	x1, [x29, #0xe8]
    1e00:      	ldr	w1, [x29, #0x148]
    1e04:      	mov	x27, x2
    1e08:      	ldr	x2, [x29, #0x108]
    1e0c:      	b	0x12b0 <_stogir.verify.integer-operations-target-structured+0x230>
    1e10:      	str	x8, [x29, #0x100]
    1e14:      	str	x2, [x29, #0x108]
    1e18:      	mov	x2, x27
    1e1c:      	str	x3, [x29, #0x160]
    1e20:      	str	x7, [x29, #0x170]
    1e24:      	str	w9, [x29, #0x138]
    1e28:      	str	w10, [x29, #0x140]
    1e2c:      	str	w1, [x29, #0x148]
    1e30:      	ldr	x1, [x29, #0x10]
    1e34:      	str	x14, [x29, #0x168]
    1e38:      	str	x27, [x29, #0xf8]
    1e3c:      	mov	x27, x0
    1e40:      	ldr	x0, [x29, #0xe8]
    1e44:      	str	x24, [x29, #0x110]
    1e48:      	mov	x24, x13
    1e4c:      	str	x25, [x29, #0x118]
    1e50:      	mov	x25, x4
    1e54:      	str	x23, [x29, #0x120]
    1e58:      	mov	x23, x5
    1e5c:      	str	x22, [x29, #0x128]
    1e60:      	mov	x22, x6
    1e64:      	str	x21, [x29, #0x130]
    1e68:      	mov	x21, x15
    1e6c:      	str	x20, [x29, #0x150]
    1e70:      	mov	x20, x11
    1e74:      	str	x19, [x29, #0x158]
    1e78:      	mov	x19, x12
    1e7c:      	bl	0x1e7c <_stogir.verify.integer-operations-target-structured+0xdfc>
		0000000000001e7c:  ARM64_RELOC_BRANCH26	_memcmp
    1e80:      	lsr	w0, w0, #0
    1e84:      	sxtw	x0, w0
    1e88:      	cmp	x0, #0x0
    1e8c:      	b.eq	0x1320 <_stogir.verify.integer-operations-target-structured+0x2a0>
    1e90:      	ldr	x0, [x29, #0xe8]
    1e94:      	ldr	x1, [x29, #0xf8]
    1e98:      	ldr	x2, [x29, #0x10]
    1e9c:      	movz	x3, #0x0, lsl #48
    1ea0:      	bl	0x1ea0 <_stogir.verify.integer-operations-target-structured+0xe20>
		0000000000001ea0:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
    1ea4:      	cmp	x0, #0x0
    1ea8:      	b.eq	0x297c <_stogir.verify.integer-operations-target-structured+0x18fc>
    1eac:      	and	x0, x28, #0xffffffff
    1eb0:      	mov	x1, x0
    1eb4:      	movz	x0, #0x0, lsl #48
    1eb8:      	movz	x2, #0x0, lsl #48
    1ebc:      	ldr	x3, [x29, #0x100]
    1ec0:      	str	x0, [x3]
    1ec4:      	str	x1, [x3, #0x8]
    1ec8:      	str	x2, [x3, #0x10]
    1ecc:      	sub	sp, x29, #0x10
    1ed0:      	ldr	x19, [sp, #0x2c0]
    1ed4:      	ldr	x20, [sp, #0x2c8]
    1ed8:      	ldr	x21, [sp, #0x2d0]
    1edc:      	ldr	x22, [sp, #0x2d8]
    1ee0:      	ldr	x23, [sp, #0x2e0]
    1ee4:      	ldr	x24, [sp, #0x2e8]
    1ee8:      	ldr	x25, [sp, #0x2f0]
    1eec:      	ldr	x26, [sp, #0x2f8]
    1ef0:      	ldr	x27, [sp, #0x300]
    1ef4:      	ldr	x28, [sp, #0x308]
    1ef8:      	ldr	x29, [sp, #0x10]
    1efc:      	ldr	x30, [sp, #0x18]
    1f00:      	add	sp, sp, #0x310
    1f04:      	ret
    1f08:      	movz	x1, #0x0, lsl #48
    1f0c:      	b	0x1374 <_stogir.verify.integer-operations-target-structured+0x2f4>
    1f10:      	cmp	x4, #0x2e
    1f14:      	b.lt	0x1f28 <_stogir.verify.integer-operations-target-structured+0xea8>
    1f18:      	cmp	x4, #0x35
    1f1c:      	b.gt	0x1f28 <_stogir.verify.integer-operations-target-structured+0xea8>
    1f20:      	mov	x2, #0x1                ; =1
    1f24:      	b	0x1388 <_stogir.verify.integer-operations-target-structured+0x308>
    1f28:      	cmp	x4, #0x3a
    1f2c:      	b.ne	0x1f38 <_stogir.verify.integer-operations-target-structured+0xeb8>
    1f30:      	mov	x2, #0x1                ; =1
    1f34:      	b	0x1f24 <_stogir.verify.integer-operations-target-structured+0xea4>
    1f38:      	cmp	x4, #0x3b
    1f3c:      	cset	w2, eq
    1f40:      	ubfx	x2, x2, #0, #8
    1f44:      	b	0x1f34 <_stogir.verify.integer-operations-target-structured+0xeb4>
    1f48:      	cmp	x4, #0x20
    1f4c:      	b.ne	0x1f58 <_stogir.verify.integer-operations-target-structured+0xed8>
    1f50:      	mov	x5, #0x1                ; =1
    1f54:      	b	0x1394 <_stogir.verify.integer-operations-target-structured+0x314>
    1f58:      	cmp	x4, #0x2d
    1f5c:      	b.ne	0x1f68 <_stogir.verify.integer-operations-target-structured+0xee8>
    1f60:      	mov	x5, #0x1                ; =1
    1f64:      	b	0x1f54 <_stogir.verify.integer-operations-target-structured+0xed4>
    1f68:      	cmp	x4, #0x36
    1f6c:      	b.ne	0x1f78 <_stogir.verify.integer-operations-target-structured+0xef8>
    1f70:      	mov	x5, #0x1                ; =1
    1f74:      	b	0x1f64 <_stogir.verify.integer-operations-target-structured+0xee4>
    1f78:      	cmp	x4, #0x37
    1f7c:      	b.ne	0x1f88 <_stogir.verify.integer-operations-target-structured+0xf08>
    1f80:      	mov	x5, #0x1                ; =1
    1f84:      	b	0x1f74 <_stogir.verify.integer-operations-target-structured+0xef4>
    1f88:      	cmp	x4, #0x38
    1f8c:      	b.ne	0x1f98 <_stogir.verify.integer-operations-target-structured+0xf18>
    1f90:      	mov	x5, #0x1                ; =1
    1f94:      	b	0x1f84 <_stogir.verify.integer-operations-target-structured+0xf04>
    1f98:      	cmp	x4, #0x39
    1f9c:      	cset	w5, eq
    1fa0:      	ubfx	x5, x5, #0, #8
    1fa4:      	b	0x1f94 <_stogir.verify.integer-operations-target-structured+0xf14>
    1fa8:      	uxtb	w16, w1
    1fac:      	cmp	w16, wzr
    1fb0:      	b.ne	0x13f0 <_stogir.verify.integer-operations-target-structured+0x370>
    1fb4:      	str	x0, [x29, #0x1b0]
    1fb8:      	str	x22, [x29, #0x1b8]
    1fbc:      	mov	w22, w1
    1fc0:      	ldr	x0, [x29, #0xe8]
    1fc4:      	ldr	x1, [x29, #0xf8]
    1fc8:      	b	0x1460 <_stogir.verify.integer-operations-target-structured+0x3e0>
    1fcc:      	add	x0, x28, #0x1
    1fd0:      	lsr	w0, w0, #0
    1fd4:      	sxtw	x0, w0
    1fd8:      	ldr	x1, [x29, #0xe8]
    1fdc:      	ldr	x2, [x29, #0xf8]
    1fe0:      	b	0x1454 <_stogir.verify.integer-operations-target-structured+0x3d4>
    1fe4:      	mov	x2, x1
    1fe8:      	mov	x1, x0
    1fec:      	mov	x0, #0x1                ; =1
    1ff0:      	b	0x1480 <_stogir.verify.integer-operations-target-structured+0x400>
    1ff4:      	mov	x2, x1
    1ff8:      	mov	x1, x0
    1ffc:      	movz	x0, #0x0, lsl #48
    2000:      	b	0x1480 <_stogir.verify.integer-operations-target-structured+0x400>
    2004:      	add	x0, x28, #0x1
    2008:      	lsr	w0, w0, #0
    200c:      	sxtw	x0, w0
    2010:      	ldr	x1, [x29, #0x1c0]
    2014:      	ldr	x2, [x29, #0x1c8]
    2018:      	b	0x14e4 <_stogir.verify.integer-operations-target-structured+0x464>
    201c:      	brk	#0
    2020:      	b	0x201c <_stogir.verify.integer-operations-target-structured+0xf9c>
    2024:      	ldr	x0, [x29, #0x1c0]
    2028:      	ldr	x1, [x29, #0x1c8]
    202c:      	b	0x14f0 <_stogir.verify.integer-operations-target-structured+0x470>
    2030:      	cmp	x26, #0x1e
    2034:      	cset	w2, eq
    2038:      	ubfx	x2, x2, #0, #8
    203c:      	fmov	d31, x0
    2040:      	mov	x0, x2
    2044:      	mov	x2, x1
    2048:      	fmov	x1, d31
    204c:      	b	0x1504 <_stogir.verify.integer-operations-target-structured+0x484>
    2050:      	mov	x0, #0x1                ; =1
    2054:      	b	0x1520 <_stogir.verify.integer-operations-target-structured+0x4a0>
    2058:      	movz	x0, #0x0, lsl #48
    205c:      	b	0x1520 <_stogir.verify.integer-operations-target-structured+0x4a0>
    2060:      	mov	x4, x2
    2064:      	mov	x2, x1
    2068:      	movz	x1, #0x0, lsl #48
    206c:      	b	0x1598 <_stogir.verify.integer-operations-target-structured+0x518>
    2070:      	mov	x4, x2
    2074:      	mov	x2, x1
    2078:      	movz	x1, #0x0, lsl #48
    207c:      	b	0x1598 <_stogir.verify.integer-operations-target-structured+0x518>
    2080:      	cmp	x0, #0x0
    2084:      	b.ge	0x2b2c <_stogir.verify.integer-operations-target-structured+0x1aac>
    2088:      	ldr	x6, [x29, #0x1b8]
    208c:      	ldr	x7, [x6, #0x8]
    2090:      	ldr	x8, [x29, #0x170]
    2094:      	ldr	x9, [x8, #0x8]
    2098:      	cmp	x7, x9
    209c:      	b.ne	0x20e4 <_stogir.verify.integer-operations-target-structured+0x1064>
    20a0:      	cmp	x4, x7
    20a4:      	b.gt	0x20dc <_stogir.verify.integer-operations-target-structured+0x105c>
    20a8:      	lsl	x4, x5, #2
    20ac:      	ldr	x7, [x27, #0x50]
    20b0:      	add	x4, x4, x7
    20b4:      	ldr	w4, [x4]
    20b8:      	sxtw	x4, w4
    20bc:      	cmp	x4, #0x0
    20c0:      	cset	w4, gt
    20c4:      	ubfx	x4, x4, #0, #8
    20c8:      	fmov	d31, x1
    20cc:      	mov	x1, x4
    20d0:      	mov	x4, x2
    20d4:      	fmov	x2, d31
    20d8:      	b	0x15a0 <_stogir.verify.integer-operations-target-structured+0x520>
    20dc:      	movz	x4, #0x0, lsl #48
    20e0:      	b	0x20c8 <_stogir.verify.integer-operations-target-structured+0x1048>
    20e4:      	movz	x4, #0x0, lsl #48
    20e8:      	b	0x20c8 <_stogir.verify.integer-operations-target-structured+0x1048>
    20ec:      	movz	x4, #0x0, lsl #48
    20f0:      	b	0x20c8 <_stogir.verify.integer-operations-target-structured+0x1048>
    20f4:      	lsl	x0, x5, #4
    20f8:      	ldr	x1, [x27, #0x28]
    20fc:      	add	x0, x0, x1
    2100:      	ldr	x1, [x0]
    2104:      	ldr	x0, [x0, #0x8]
    2108:      	fmov	d31, x0
    210c:      	mov	x0, x1
    2110:      	fmov	x1, d31
    2114:      	b	0x15d4 <_stogir.verify.integer-operations-target-structured+0x554>
    2118:      	mov	x3, x2
    211c:      	movz	x0, #0x0, lsl #48
    2120:      	movz	x1, #0x0, lsl #48
    2124:      	movz	x2, #0x0, lsl #48
    2128:      	b	0x15e4 <_stogir.verify.integer-operations-target-structured+0x564>
    212c:      	ldr	x0, [x29, #0x168]
    2130:      	str	x1, [x0]
    2134:      	str	x2, [x0, #0x8]
    2138:      	ldr	w1, [x25, #0xc]
    213c:      	sxtw	x1, w1
    2140:      	cmp	x1, #0x0
    2144:      	b.ge	0x216c <_stogir.verify.integer-operations-target-structured+0x10ec>
    2148:      	ldr	x5, [x29, #0x160]
    214c:      	mov	x2, x3
    2150:      	mov	x3, x4
    2154:      	mov	x1, #0x1                ; =1
    2158:      	cmp	x1, #0x0
    215c:      	b.eq	0x21e8 <_stogir.verify.integer-operations-target-structured+0x1168>
    2160:      	ldr	x1, [x29, #0x20]
    2164:      	mov	x2, #0x2d               ; =45
    2168:      	b	0x1624 <_stogir.verify.integer-operations-target-structured+0x5a4>
    216c:      	ldr	w1, [x0]
    2170:      	uxtb	w1, w1
    2174:      	cmp	x1, #0x83
    2178:      	b.ge	0x2b38 <_stogir.verify.integer-operations-target-structured+0x1ab8>
    217c:      	ldr	x5, [x29, #0x160]
    2180:      	add	x1, x1, x5
    2184:      	ldrb	w1, [x1]
    2188:      	uxtb	w1, w1
    218c:      	and	x1, x1, #0x2
    2190:      	uxtb	w1, w1
    2194:      	cmp	x1, #0x0
    2198:      	cset	w1, eq
    219c:      	uxtb	w16, w1
    21a0:      	cmp	w16, wzr
    21a4:      	cset	x1, eq
    21a8:      	cmp	x1, #0x0
    21ac:      	b.ne	0x21e0 <_stogir.verify.integer-operations-target-structured+0x1160>
    21b0:      	ldr	w1, [x0]
    21b4:      	uxtb	w1, w1
    21b8:      	cmp	x1, #0x65
    21bc:      	b.eq	0x21e0 <_stogir.verify.integer-operations-target-structured+0x1160>
    21c0:      	cmp	x1, #0x66
    21c4:      	b.eq	0x21e0 <_stogir.verify.integer-operations-target-structured+0x1160>
    21c8:      	mov	x1, #0x1                ; =1
    21cc:      	mov	x2, x3
    21d0:      	mov	x3, x4
    21d4:      	b	0x2158 <_stogir.verify.integer-operations-target-structured+0x10d8>
    21d8:      	movz	x1, #0x0, lsl #48
    21dc:      	b	0x2188 <_stogir.verify.integer-operations-target-structured+0x1108>
    21e0:      	movz	x1, #0x0, lsl #48
    21e4:      	b	0x21cc <_stogir.verify.integer-operations-target-structured+0x114c>
    21e8:      	mov	x1, x2
    21ec:      	mov	x2, x3
    21f0:      	b	0x2168 <_stogir.verify.integer-operations-target-structured+0x10e8>
    21f4:      	brk	#0
    21f8:      	b	0x21f4 <_stogir.verify.integer-operations-target-structured+0x1174>
    21fc:      	mov	x3, x2
    2200:      	mov	x2, x1
    2204:      	movz	x1, #0x0, lsl #48
    2208:      	b	0x1648 <_stogir.verify.integer-operations-target-structured+0x5c8>
    220c:      	ubfx	x1, x4, #0, #8
    2210:      	b	0x165c <_stogir.verify.integer-operations-target-structured+0x5dc>
    2214:      	ldr	x8, [x29, #0x130]
    2218:      	ldr	w1, [x29, #0x1a8]
    221c:      	str	x0, [x29, #0x158]
    2220:      	mov	x0, x27
    2224:      	str	x19, [x29, #0x1e0]
    2228:      	mov	x19, x2
    222c:      	bl	0x222c <_stogir.verify.integer-operations-target-structured+0x11ac>
		000000000000222c:  ARM64_RELOC_BRANCH26	_stogir.checked.validate
    2230:      	ldr	x0, [x29, #0x130]
    2234:      	ldr	x1, [x0]
    2238:      	str	x1, [x19]
    223c:      	ldr	x1, [x0, #0x8]
    2240:      	str	x1, [x19, #0x8]
    2244:      	ldr	x1, [x0, #0x10]
    2248:      	str	x1, [x19, #0x10]
    224c:      	ldr	x1, [x29, #0x1d0]
    2250:      	ldr	x2, [x29, #0x1d8]
    2254:      	b	0x16d0 <_stogir.verify.integer-operations-target-structured+0x650>
    2258:      	add	x4, x28, #0x1
    225c:      	lsr	w4, w4, #0
    2260:      	sxtw	x4, w4
    2264:      	fmov	d31, x1
    2268:      	mov	x1, x4
    226c:      	mov	x4, x2
    2270:      	fmov	x2, d31
    2274:      	b	0x171c <_stogir.verify.integer-operations-target-structured+0x69c>
    2278:      	brk	#0
    227c:      	b	0x2278 <_stogir.verify.integer-operations-target-structured+0x11f8>
    2280:      	ldr	x1, [x29, #0x1d0]
    2284:      	ldr	x2, [x29, #0x1d8]
    2288:      	b	0x1728 <_stogir.verify.integer-operations-target-structured+0x6a8>
    228c:      	mov	x4, x2
    2290:      	mov	x2, x1
    2294:      	movz	x1, #0x0, lsl #48
    2298:      	b	0x174c <_stogir.verify.integer-operations-target-structured+0x6cc>
    229c:      	add	x1, x28, #0x1
    22a0:      	lsr	w1, w1, #0
    22a4:      	sxtw	x1, w1
    22a8:      	ldr	x3, [x29, #0x1e8]
    22ac:      	ldr	x4, [x29, #0x1f0]
    22b0:      	b	0x17c4 <_stogir.verify.integer-operations-target-structured+0x744>
    22b4:      	brk	#0
    22b8:      	b	0x22b4 <_stogir.verify.integer-operations-target-structured+0x1234>
    22bc:      	ldr	x1, [x29, #0x1e8]
    22c0:      	ldr	x3, [x29, #0x1f0]
    22c4:      	b	0x17d0 <_stogir.verify.integer-operations-target-structured+0x750>
    22c8:      	cmp	x26, #0x79
    22cc:      	cset	w4, eq
    22d0:      	ubfx	x4, x4, #0, #8
    22d4:      	fmov	d31, x1
    22d8:      	mov	x1, x4
    22dc:      	mov	x4, x3
    22e0:      	fmov	x3, d31
    22e4:      	b	0x17e4 <_stogir.verify.integer-operations-target-structured+0x764>
    22e8:      	add	x1, x28, #0x1
    22ec:      	lsr	w1, w1, #0
    22f0:      	sxtw	x1, w1
    22f4:      	ldr	x3, [x29, #0x1f8]
    22f8:      	ldr	x4, [x29, #0x200]
    22fc:      	b	0x185c <_stogir.verify.integer-operations-target-structured+0x7dc>
    2300:      	brk	#0
    2304:      	b	0x2300 <_stogir.verify.integer-operations-target-structured+0x1280>
    2308:      	ldr	x1, [x29, #0x1f8]
    230c:      	ldr	x3, [x29, #0x200]
    2310:      	b	0x1868 <_stogir.verify.integer-operations-target-structured+0x7e8>
    2314:      	cmp	x26, #0x6d
    2318:      	b.lt	0x233c <_stogir.verify.integer-operations-target-structured+0x12bc>
    231c:      	cmp	x26, #0x6f
    2320:      	cset	w4, le
    2324:      	ubfx	x4, x4, #0, #8
    2328:      	fmov	d31, x1
    232c:      	mov	x1, x4
    2330:      	mov	x4, x3
    2334:      	fmov	x3, d31
    2338:      	b	0x187c <_stogir.verify.integer-operations-target-structured+0x7fc>
    233c:      	movz	x4, #0x0, lsl #48
    2340:      	b	0x2328 <_stogir.verify.integer-operations-target-structured+0x12a8>
    2344:      	add	x1, x28, #0x1
    2348:      	lsr	w1, w1, #0
    234c:      	sxtw	x1, w1
    2350:      	ldr	x3, [x29, #0x208]
    2354:      	ldr	x4, [x29, #0x210]
    2358:      	b	0x18f4 <_stogir.verify.integer-operations-target-structured+0x874>
    235c:      	brk	#0
    2360:      	b	0x235c <_stogir.verify.integer-operations-target-structured+0x12dc>
    2364:      	ldr	x1, [x29, #0x208]
    2368:      	ldr	x3, [x29, #0x210]
    236c:      	b	0x1900 <_stogir.verify.integer-operations-target-structured+0x880>
    2370:      	cmp	x26, #0x51
    2374:      	b.ne	0x2390 <_stogir.verify.integer-operations-target-structured+0x1310>
    2378:      	mov	x4, #0x1                ; =1
    237c:      	fmov	d31, x1
    2380:      	mov	x1, x4
    2384:      	mov	x4, x3
    2388:      	fmov	x3, d31
    238c:      	b	0x1914 <_stogir.verify.integer-operations-target-structured+0x894>
    2390:      	cmp	x26, #0x52
    2394:      	b.ne	0x23a0 <_stogir.verify.integer-operations-target-structured+0x1320>
    2398:      	mov	x4, #0x1                ; =1
    239c:      	b	0x237c <_stogir.verify.integer-operations-target-structured+0x12fc>
    23a0:      	cmp	x26, #0x53
    23a4:      	b.ne	0x23b0 <_stogir.verify.integer-operations-target-structured+0x1330>
    23a8:      	mov	x4, #0x1                ; =1
    23ac:      	b	0x239c <_stogir.verify.integer-operations-target-structured+0x131c>
    23b0:      	cmp	x26, #0x54
    23b4:      	cset	w4, eq
    23b8:      	ubfx	x4, x4, #0, #8
    23bc:      	b	0x23ac <_stogir.verify.integer-operations-target-structured+0x132c>
    23c0:      	add	x1, x28, #0x1
    23c4:      	lsr	w1, w1, #0
    23c8:      	sxtw	x1, w1
    23cc:      	ldr	x3, [x29, #0x218]
    23d0:      	ldr	x4, [x29, #0x220]
    23d4:      	b	0x198c <_stogir.verify.integer-operations-target-structured+0x90c>
    23d8:      	brk	#0
    23dc:      	b	0x23d8 <_stogir.verify.integer-operations-target-structured+0x1358>
    23e0:      	ldr	x1, [x29, #0x218]
    23e4:      	ldr	x3, [x29, #0x220]
    23e8:      	b	0x1998 <_stogir.verify.integer-operations-target-structured+0x918>
    23ec:      	cmp	x26, #0x48
    23f0:      	b.ne	0x240c <_stogir.verify.integer-operations-target-structured+0x138c>
    23f4:      	mov	x4, #0x1                ; =1
    23f8:      	fmov	d31, x1
    23fc:      	mov	x1, x4
    2400:      	mov	x4, x3
    2404:      	fmov	x3, d31
    2408:      	b	0x19ac <_stogir.verify.integer-operations-target-structured+0x92c>
    240c:      	cmp	x26, #0x55
    2410:      	b.lt	0x2424 <_stogir.verify.integer-operations-target-structured+0x13a4>
    2414:      	cmp	x26, #0x58
    2418:      	cset	w4, le
    241c:      	ubfx	x4, x4, #0, #8
    2420:      	b	0x23f8 <_stogir.verify.integer-operations-target-structured+0x1378>
    2424:      	movz	x4, #0x0, lsl #48
    2428:      	b	0x2420 <_stogir.verify.integer-operations-target-structured+0x13a0>
    242c:      	add	x1, x28, #0x1
    2430:      	lsr	w1, w1, #0
    2434:      	sxtw	x1, w1
    2438:      	ldr	x3, [x29, #0x228]
    243c:      	ldr	x4, [x29, #0x230]
    2440:      	b	0x1a28 <_stogir.verify.integer-operations-target-structured+0x9a8>
    2444:      	brk	#0
    2448:      	b	0x2444 <_stogir.verify.integer-operations-target-structured+0x13c4>
    244c:      	ldr	x1, [x29, #0x228]
    2450:      	ldr	x3, [x29, #0x230]
    2454:      	b	0x1a34 <_stogir.verify.integer-operations-target-structured+0x9b4>
    2458:      	mov	x4, x3
    245c:      	mov	x3, x1
    2460:      	movz	x1, #0x0, lsl #48
    2464:      	b	0x1a58 <_stogir.verify.integer-operations-target-structured+0x9d8>
    2468:      	add	x1, x28, #0x1
    246c:      	lsr	w1, w1, #0
    2470:      	sxtw	x1, w1
    2474:      	ldr	x3, [x29, #0x238]
    2478:      	ldr	x4, [x29, #0x240]
    247c:      	b	0x1ad4 <_stogir.verify.integer-operations-target-structured+0xa54>
    2480:      	brk	#0
    2484:      	b	0x2480 <_stogir.verify.integer-operations-target-structured+0x1400>
    2488:      	ldr	x1, [x29, #0x238]
    248c:      	ldr	x3, [x29, #0x240]
    2490:      	b	0x1ae0 <_stogir.verify.integer-operations-target-structured+0xa60>
    2494:      	add	x1, x28, #0x1
    2498:      	lsr	w1, w1, #0
    249c:      	sxtw	x1, w1
    24a0:      	ldr	x3, [x29, #0x248]
    24a4:      	ldr	x4, [x29, #0x250]
    24a8:      	b	0x1b58 <_stogir.verify.integer-operations-target-structured+0xad8>
    24ac:      	brk	#0
    24b0:      	b	0x24ac <_stogir.verify.integer-operations-target-structured+0x142c>
    24b4:      	ldr	x1, [x29, #0x248]
    24b8:      	ldr	x3, [x29, #0x250]
    24bc:      	b	0x1b64 <_stogir.verify.integer-operations-target-structured+0xae4>
    24c0:      	mov	x4, x3
    24c4:      	mov	x3, x1
    24c8:      	mov	x1, #0x1                ; =1
    24cc:      	b	0x1b98 <_stogir.verify.integer-operations-target-structured+0xb18>
    24d0:      	mov	x1, x3
    24d4:      	mov	x3, x4
    24d8:      	b	0x1ba8 <_stogir.verify.integer-operations-target-structured+0xb28>
    24dc:      	ldr	w4, [x25, #0x8]
    24e0:      	lsr	w4, w4, #0
    24e4:      	ldr	x8, [x29, #0xa0]
    24e8:      	str	x0, [x29, #0xb0]
    24ec:      	mov	x0, x27
    24f0:      	str	x2, [x29, #0xa8]
    24f4:      	str	x1, [x29, #0x258]
    24f8:      	mov	w1, w4
    24fc:      	str	x3, [x29, #0x260]
    2500:      	bl	0x2500 <_stogir.verify.integer-operations-target-structured+0x1480>
		0000000000002500:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    2504:      	ldr	x0, [x29, #0xa0]
    2508:      	ldr	w1, [x0]
    250c:      	lsr	x16, x1, #0
    2510:      	cmp	x16, #0x1
    2514:      	b.eq	0x2530 <_stogir.verify.integer-operations-target-structured+0x14b0>
    2518:      	b.lo	0x2520 <_stogir.verify.integer-operations-target-structured+0x14a0>
    251c:      	b	0x2534 <_stogir.verify.integer-operations-target-structured+0x14b4>
    2520:      	cmp	x16, #0x0
    2524:      	b.eq	0x252c <_stogir.verify.integer-operations-target-structured+0x14ac>
    2528:      	b	0x2534 <_stogir.verify.integer-operations-target-structured+0x14b4>
    252c:      	b	0x2538 <_stogir.verify.integer-operations-target-structured+0x14b8>
    2530:      	b	0x254c <_stogir.verify.integer-operations-target-structured+0x14cc>
    2534:      	b	0x2590 <_stogir.verify.integer-operations-target-structured+0x1510>
    2538:      	str	x19, [x29, #0x150]
    253c:      	str	x0, [x29, #0xa0]
    2540:      	ldr	x0, [x29, #0x30]
    2544:      	mov	x1, #0x14               ; =20
    2548:      	b	0x1bbc <_stogir.verify.integer-operations-target-structured+0xb3c>
    254c:      	ldr	x1, [x0, #0x8]
    2550:      	str	x0, [x29, #0xa0]
    2554:      	mov	x0, x25
    2558:      	str	x19, [x29, #0x150]
    255c:      	mov	x19, x1
    2560:      	bl	0x2560 <_stogir.verify.integer-operations-target-structured+0x14e0>
		0000000000002560:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    2564:      	lsr	w19, w19, #0
    2568:      	uxtb	w0, w0
    256c:      	ubfx	x1, x19, #8, #8
    2570:      	cmp	x1, x0
    2574:      	b.ne	0x2584 <_stogir.verify.integer-operations-target-structured+0x1504>
    2578:      	ldr	x0, [x29, #0x258]
    257c:      	ldr	x1, [x29, #0x260]
    2580:      	b	0x2548 <_stogir.verify.integer-operations-target-structured+0x14c8>
    2584:      	ldr	x0, [x29, #0x38]
    2588:      	mov	x1, #0x1a               ; =26
    258c:      	b	0x2580 <_stogir.verify.integer-operations-target-structured+0x1500>
    2590:      	brk	#0
    2594:      	b	0x2590 <_stogir.verify.integer-operations-target-structured+0x1510>
    2598:      	mov	x19, x28
    259c:      	ldr	x28, [x29, #0x258]
    25a0:      	ldr	x0, [x29, #0x260]
    25a4:      	b	0x1bd4 <_stogir.verify.integer-operations-target-structured+0xb54>
    25a8:      	add	x1, x19, #0x1
    25ac:      	lsr	w1, w1, #0
    25b0:      	sxtw	x1, w1
    25b4:      	mov	x3, x28
    25b8:      	ldr	x4, [x29, #0x268]
    25bc:      	b	0x1c68 <_stogir.verify.integer-operations-target-structured+0xbe8>
    25c0:      	brk	#0
    25c4:      	b	0x25c0 <_stogir.verify.integer-operations-target-structured+0x1540>
    25c8:      	mov	x1, x28
    25cc:      	ldr	x3, [x29, #0x268]
    25d0:      	b	0x1c74 <_stogir.verify.integer-operations-target-structured+0xbf4>
    25d4:      	mov	x4, x3
    25d8:      	mov	x3, x1
    25dc:      	mov	x1, #0x1                ; =1
    25e0:      	b	0x1c8c <_stogir.verify.integer-operations-target-structured+0xc0c>
    25e4:      	mov	x1, #0x1                ; =1
    25e8:      	b	0x1ca0 <_stogir.verify.integer-operations-target-structured+0xc20>
    25ec:      	ldr	x22, [x29, #0x198]
    25f0:      	cmp	x22, #0x0
    25f4:      	b.eq	0x2600 <_stogir.verify.integer-operations-target-structured+0x1580>
    25f8:      	mov	x1, #0x1                ; =1
    25fc:      	b	0x1cbc <_stogir.verify.integer-operations-target-structured+0xc3c>
    2600:      	ldr	x1, [x29, #0x1a0]
    2604:      	b	0x25fc <_stogir.verify.integer-operations-target-structured+0x157c>
    2608:      	movz	x1, #0x0, lsl #48
    260c:      	b	0x1cbc <_stogir.verify.integer-operations-target-structured+0xc3c>
    2610:      	mov	x28, x3
    2614:      	mov	x3, x4
    2618:      	movz	x1, #0x0, lsl #48
    261c:      	b	0x1cc4 <_stogir.verify.integer-operations-target-structured+0xc44>
    2620:      	ldr	w1, [x4, #0x8]
    2624:      	lsr	w1, w1, #0
    2628:      	str	x0, [x29, #0xd0]
    262c:      	mov	x0, x27
    2630:      	str	x4, [x29, #0xb8]
    2634:      	bl	0x2634 <_stogir.verify.integer-operations-target-structured+0x15b4>
		0000000000002634:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
    2638:      	cmp	x0, #0x0
    263c:      	b.ne	0x2654 <_stogir.verify.integer-operations-target-structured+0x15d4>
    2640:      	ldr	x22, [x29, #0xd8]
    2644:      	str	x21, [x29, #0x280]
    2648:      	ldr	x0, [x29, #0x40]
    264c:      	mov	x1, #0x17               ; =23
    2650:      	b	0x1d5c <_stogir.verify.integer-operations-target-structured+0xcdc>
    2654:      	bl	0x2654 <_stogir.verify.integer-operations-target-structured+0x15d4>
		0000000000002654:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    2658:      	uxtb	w0, w0
    265c:      	str	x21, [x29, #0x280]
    2660:      	mov	w21, w0
    2664:      	mov	x0, x25
    2668:      	bl	0x2668 <_stogir.verify.integer-operations-target-structured+0x15e8>
		0000000000002668:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    266c:      	orr	x1, x21, xzr
    2670:      	uxtb	w0, w0
    2674:      	cmp	x0, #0x6
    2678:      	b.ne	0x27e4 <_stogir.verify.integer-operations-target-structured+0x1764>
    267c:      	cmp	x1, #0x6
    2680:      	b.ne	0x27d4 <_stogir.verify.integer-operations-target-structured+0x1754>
    2684:      	cmp	x26, #0x1a
    2688:      	b.ne	0x27bc <_stogir.verify.integer-operations-target-structured+0x173c>
    268c:      	mov	x2, x28
    2690:      	ldr	x3, [x29, #0x278]
    2694:      	mov	x0, #0x1                ; =1
    2698:      	mov	x26, x0
    269c:      	mov	x28, x2
    26a0:      	mov	x0, x3
    26a4:      	lsr	w21, w21, #0
    26a8:      	str	x0, [x29, #0x290]
    26ac:      	mov	w0, w21
    26b0:      	str	w21, [x29, #0x288]
    26b4:      	mov	x21, x1
    26b8:      	bl	0x26b8 <_stogir.verify.integer-operations-target-structured+0x1638>
		00000000000026b8:  ARM64_RELOC_BRANCH26	_stogir.types.integer?
    26bc:      	cmp	x0, #0x0
    26c0:      	b.eq	0x27f0 <_stogir.verify.integer-operations-target-structured+0x1770>
    26c4:      	ldr	x1, [x29, #0x290]
    26c8:      	movz	x0, #0x0, lsl #48
    26cc:      	cmp	x0, #0x0
    26d0:      	b.eq	0x27fc <_stogir.verify.integer-operations-target-structured+0x177c>
    26d4:      	mov	x2, x1
    26d8:      	mov	x1, x28
    26dc:      	mov	x0, #0x1                ; =1
    26e0:      	cmp	x0, #0x0
    26e4:      	b.eq	0x286c <_stogir.verify.integer-operations-target-structured+0x17ec>
    26e8:      	ldr	x28, [x29, #0x48]
    26ec:      	mov	x0, #0x1c               ; =28
    26f0:      	str	x0, [x29, #0x2a8]
    26f4:      	mov	x0, x25
    26f8:      	bl	0x26f8 <_stogir.verify.integer-operations-target-structured+0x1678>
		00000000000026f8:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    26fc:      	cmp	x20, #0x0
    2700:      	b.eq	0x2878 <_stogir.verify.integer-operations-target-structured+0x17f8>
    2704:      	mov	x2, x28
    2708:      	mov	x1, #0x1                ; =1
    270c:      	uxtb	w0, w0
    2710:      	lsr	w1, w1, #0
    2714:      	sxtw	x1, w1
    2718:      	cmp	x0, x1
    271c:      	b.ne	0x2884 <_stogir.verify.integer-operations-target-structured+0x1804>
    2720:      	mov	x0, x2
    2724:      	ldr	x28, [x29, #0x2a8]
    2728:      	cmp	x20, #0x0
    272c:      	b.eq	0x2890 <_stogir.verify.integer-operations-target-structured+0x1810>
    2730:      	mov	x20, x0
    2734:      	mov	x0, #0x1                ; =1
    2738:      	cmp	x0, #0x0
    273c:      	b.eq	0x2b40 <_stogir.verify.integer-operations-target-structured+0x1ac0>
    2740:      	ldr	x16, [x29, #0xd8]
    2744:      	str	x16, [sp]
    2748:      	mov	x0, x27
    274c:      	ldr	w1, [x29, #0x1a8]
    2750:      	mov	x2, #0x2                ; =2
    2754:      	bl	0x2754 <_stogir.verify.integer-operations-target-structured+0x16d4>
		0000000000002754:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    2758:      	ldr	x16, [sp]
    275c:      	str	x0, [x16]
    2760:      	str	x1, [x16, #0x8]
    2764:      	ldr	x22, [x29, #0xd8]
    2768:      	ldr	x0, [x22]
    276c:      	ldr	x1, [x22, #0x8]
    2770:      	lsr	w2, w0, #0
    2774:      	ldr	x3, [x29, #0xc8]
    2778:      	str	x0, [x3]
    277c:      	str	x1, [x3, #0x8]
    2780:      	lsr	x16, x2, #0
    2784:      	cmp	x16, #0x1
    2788:      	b.eq	0x27a4 <_stogir.verify.integer-operations-target-structured+0x1724>
    278c:      	b.lo	0x2794 <_stogir.verify.integer-operations-target-structured+0x1714>
    2790:      	b	0x27a8 <_stogir.verify.integer-operations-target-structured+0x1728>
    2794:      	cmp	x16, #0x0
    2798:      	b.eq	0x27a0 <_stogir.verify.integer-operations-target-structured+0x1720>
    279c:      	b	0x27a8 <_stogir.verify.integer-operations-target-structured+0x1728>
    27a0:      	b	0x27ac <_stogir.verify.integer-operations-target-structured+0x172c>
    27a4:      	b	0x289c <_stogir.verify.integer-operations-target-structured+0x181c>
    27a8:      	b	0x2948 <_stogir.verify.integer-operations-target-structured+0x18c8>
    27ac:      	str	x3, [x29, #0xc8]
    27b0:      	ldr	x0, [x29, #0x58]
    27b4:      	mov	x1, #0x1d               ; =29
    27b8:      	b	0x2650 <_stogir.verify.integer-operations-target-structured+0x15d0>
    27bc:      	cmp	x26, #0x1b
    27c0:      	cset	w0, eq
    27c4:      	ubfx	x0, x0, #0, #8
    27c8:      	mov	x2, x28
    27cc:      	ldr	x3, [x29, #0x278]
    27d0:      	b	0x2698 <_stogir.verify.integer-operations-target-structured+0x1618>
    27d4:      	mov	x2, x28
    27d8:      	ldr	x3, [x29, #0x278]
    27dc:      	movz	x0, #0x0, lsl #48
    27e0:      	b	0x2698 <_stogir.verify.integer-operations-target-structured+0x1618>
    27e4:      	ldr	x0, [x29, #0x278]
    27e8:      	movz	x26, #0x0, lsl #48
    27ec:      	b	0x26a4 <_stogir.verify.integer-operations-target-structured+0x1624>
    27f0:      	ldr	x1, [x29, #0x290]
    27f4:      	mov	x0, #0x1                ; =1
    27f8:      	b	0x26cc <_stogir.verify.integer-operations-target-structured+0x164c>
    27fc:      	ldr	w2, [x29, #0x180]
    2800:      	lsr	w0, w2, #0
    2804:      	ldr	x2, [x29, #0x1a0]
    2808:      	cmp	x2, #0x0
    280c:      	b.eq	0x2b48 <_stogir.verify.integer-operations-target-structured+0x1ac8>
    2810:      	str	x1, [x29, #0x298]
    2814:      	ldr	w1, [x29, #0x288]
    2818:      	str	w0, [x29, #0x2a0]
    281c:      	bl	0x281c <_stogir.verify.integer-operations-target-structured+0x179c>
		000000000000281c:  ARM64_RELOC_BRANCH26	_stogir.integer-unary.valid-type?
    2820:      	cmp	x0, #0x0
    2824:      	b.ne	0x2838 <_stogir.verify.integer-operations-target-structured+0x17b8>
    2828:      	mov	x0, #0x1                ; =1
    282c:      	mov	x1, x28
    2830:      	ldr	x2, [x29, #0x298]
    2834:      	b	0x26e0 <_stogir.verify.integer-operations-target-structured+0x1660>
    2838:      	cmp	x22, #0x0
    283c:      	b.eq	0x2864 <_stogir.verify.integer-operations-target-structured+0x17e4>
    2840:      	ldr	w0, [x29, #0x2a0]
    2844:      	ldr	w1, [x29, #0x288]
    2848:      	bl	0x2848 <_stogir.verify.integer-operations-target-structured+0x17c8>
		0000000000002848:  ARM64_RELOC_BRANCH26	_stogir.integer-binary.valid-type?
    284c:      	cmp	x0, #0x0
    2850:      	cset	w0, ne
    2854:      	uxtb	w16, w0
    2858:      	cmp	w16, wzr
    285c:      	cset	x0, eq
    2860:      	b	0x282c <_stogir.verify.integer-operations-target-structured+0x17ac>
    2864:      	movz	x0, #0x0, lsl #48
    2868:      	b	0x2860 <_stogir.verify.integer-operations-target-structured+0x17e0>
    286c:      	mov	x28, x1
    2870:      	mov	x0, x2
    2874:      	b	0x26f0 <_stogir.verify.integer-operations-target-structured+0x1670>
    2878:      	mov	x1, x21
    287c:      	mov	x2, x28
    2880:      	b	0x270c <_stogir.verify.integer-operations-target-structured+0x168c>
    2884:      	ldr	x0, [x29, #0x50]
    2888:      	mov	x28, #0x26              ; =38
    288c:      	b	0x2728 <_stogir.verify.integer-operations-target-structured+0x16a8>
    2890:      	mov	x20, x0
    2894:      	mov	x0, x22
    2898:      	b	0x2738 <_stogir.verify.integer-operations-target-structured+0x16b8>
    289c:      	ldr	w0, [x3, #0x8]
    28a0:      	lsr	w0, w0, #0
    28a4:      	mov	w1, w0
    28a8:      	mov	x0, x27
    28ac:      	str	x3, [x29, #0xc8]
    28b0:      	bl	0x28b0 <_stogir.verify.integer-operations-target-structured+0x1830>
		00000000000028b0:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
    28b4:      	cmp	x0, #0x0
    28b8:      	b.ne	0x28c8 <_stogir.verify.integer-operations-target-structured+0x1848>
    28bc:      	ldr	x0, [x29, #0x58]
    28c0:      	mov	x1, #0x1d               ; =29
    28c4:      	b	0x27b8 <_stogir.verify.integer-operations-target-structured+0x1738>
    28c8:      	bl	0x28c8 <_stogir.verify.integer-operations-target-structured+0x1848>
		00000000000028c8:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    28cc:      	uxtb	w0, w0
    28d0:      	cmp	x21, x0
    28d4:      	b.ne	0x2900 <_stogir.verify.integer-operations-target-structured+0x1880>
    28d8:      	mov	x1, x20
    28dc:      	mov	x0, #0x1                ; =1
    28e0:      	cmp	x0, #0x0
    28e4:      	b.eq	0x2934 <_stogir.verify.integer-operations-target-structured+0x18b4>
    28e8:      	movz	x0, #0x0, lsl #48
    28ec:      	cmp	x0, #0x0
    28f0:      	b.eq	0x293c <_stogir.verify.integer-operations-target-structured+0x18bc>
    28f4:      	ldr	x0, [x29, #0x108]
    28f8:      	mov	x1, #0x1d               ; =29
    28fc:      	b	0x28c4 <_stogir.verify.integer-operations-target-structured+0x1844>
    2900:      	cmp	x26, #0x0
    2904:      	b.eq	0x292c <_stogir.verify.integer-operations-target-structured+0x18ac>
    2908:      	cmp	x0, #0x5
    290c:      	b.ne	0x291c <_stogir.verify.integer-operations-target-structured+0x189c>
    2910:      	mov	x0, #0x1                ; =1
    2914:      	mov	x1, x20
    2918:      	b	0x28e0 <_stogir.verify.integer-operations-target-structured+0x1860>
    291c:      	cmp	x0, #0xb
    2920:      	cset	w0, eq
    2924:      	ubfx	x0, x0, #0, #8
    2928:      	b	0x2914 <_stogir.verify.integer-operations-target-structured+0x1894>
    292c:      	movz	x0, #0x0, lsl #48
    2930:      	b	0x2914 <_stogir.verify.integer-operations-target-structured+0x1894>
    2934:      	mov	x0, #0x1                ; =1
    2938:      	b	0x28ec <_stogir.verify.integer-operations-target-structured+0x186c>
    293c:      	mov	x0, x1
    2940:      	mov	x1, x28
    2944:      	b	0x28fc <_stogir.verify.integer-operations-target-structured+0x187c>
    2948:      	brk	#0
    294c:      	b	0x2948 <_stogir.verify.integer-operations-target-structured+0x18c8>
    2950:      	mov	x0, x20
    2954:      	mov	x1, x28
    2958:      	b	0x27b8 <_stogir.verify.integer-operations-target-structured+0x1738>
    295c:      	brk	#0
    2960:      	b	0x295c <_stogir.verify.integer-operations-target-structured+0x18dc>
    2964:      	mov	x0, x19
    2968:      	mov	x1, x28
    296c:      	ldr	x2, [x29, #0x278]
    2970:      	b	0x1d78 <_stogir.verify.integer-operations-target-structured+0xcf8>
    2974:      	brk	#0
    2978:      	b	0x2974 <_stogir.verify.integer-operations-target-structured+0x18f4>
    297c:      	ldr	x1, [x29, #0xe8]
    2980:      	ldr	x2, [x29, #0xf8]
    2984:      	mov	x0, #0x1                ; =1
    2988:      	b	0x1ebc <_stogir.verify.integer-operations-target-structured+0xe3c>
    298c:      	str	x8, [x29, #0x100]
    2990:      	str	x27, [x29, #0xf8]
    2994:      	b	0x1e90 <_stogir.verify.integer-operations-target-structured+0xe10>
    2998:      	str	x1, [x29, #0x1c0]
    299c:      	str	x2, [x29, #0x1c8]
    29a0:      	b	0x2024 <_stogir.verify.integer-operations-target-structured+0xfa4>
    29a4:      	ldr	x0, [x29, #0x168]
    29a8:      	ldr	x6, [x29, #0x1b8]
    29ac:      	ldr	x8, [x29, #0x170]
    29b0:      	ldr	x5, [x29, #0x160]
    29b4:      	b	0x1624 <_stogir.verify.integer-operations-target-structured+0x5a4>
    29b8:      	str	x19, [x29, #0x1e0]
    29bc:      	str	x0, [x29, #0x168]
    29c0:      	ldr	x19, [x29, #0x150]
    29c4:      	ldr	x0, [x29, #0x130]
    29c8:      	str	x6, [x29, #0x1b8]
    29cc:      	str	x8, [x29, #0x170]
    29d0:      	str	x5, [x29, #0x160]
    29d4:      	str	x2, [x29, #0x1d0]
    29d8:      	str	x3, [x29, #0x1d8]
    29dc:      	ldr	x3, [x29, #0x128]
    29e0:      	b	0x2280 <_stogir.verify.integer-operations-target-structured+0x1200>
    29e4:      	str	x0, [x29, #0x168]
    29e8:      	ldr	x0, [x29, #0x158]
    29ec:      	str	x6, [x29, #0x1b8]
    29f0:      	str	x8, [x29, #0x170]
    29f4:      	str	x5, [x29, #0x160]
    29f8:      	str	x2, [x29, #0x1d0]
    29fc:      	ldr	x2, [x29, #0x150]
    2a00:      	str	x3, [x29, #0x1d8]
    2a04:      	b	0x2214 <_stogir.verify.integer-operations-target-structured+0x1194>
    2a08:      	str	x0, [x29, #0x130]
    2a0c:      	ldr	x0, [x29, #0x120]
    2a10:      	str	x3, [x29, #0x128]
    2a14:      	str	x2, [x29, #0x1e8]
    2a18:      	ldr	x2, [x29, #0x118]
    2a1c:      	str	x4, [x29, #0x1f0]
    2a20:      	b	0x22bc <_stogir.verify.integer-operations-target-structured+0x123c>
    2a24:      	str	x0, [x29, #0x120]
    2a28:      	ldr	x0, [x29, #0x110]
    2a2c:      	str	x2, [x29, #0x118]
    2a30:      	ldr	x2, [x29, #0xf0]
    2a34:      	str	x3, [x29, #0x1f8]
    2a38:      	str	x4, [x29, #0x200]
    2a3c:      	b	0x2308 <_stogir.verify.integer-operations-target-structured+0x1288>
    2a40:      	str	x0, [x29, #0x110]
    2a44:      	ldr	x0, [x29, #0x60]
    2a48:      	str	x2, [x29, #0xf0]
    2a4c:      	ldr	x2, [x29, #0x68]
    2a50:      	str	x3, [x29, #0x208]
    2a54:      	str	x4, [x29, #0x210]
    2a58:      	b	0x2364 <_stogir.verify.integer-operations-target-structured+0x12e4>
    2a5c:      	str	x0, [x29, #0x60]
    2a60:      	ldr	x0, [x29, #0x70]
    2a64:      	str	x2, [x29, #0x68]
    2a68:      	ldr	x2, [x29, #0x78]
    2a6c:      	str	x3, [x29, #0x218]
    2a70:      	str	x4, [x29, #0x220]
    2a74:      	b	0x23e0 <_stogir.verify.integer-operations-target-structured+0x1360>
    2a78:      	str	x0, [x29, #0x70]
    2a7c:      	ldr	x0, [x29, #0x80]
    2a80:      	str	x2, [x29, #0x78]
    2a84:      	ldr	x2, [x29, #0x88]
    2a88:      	str	x3, [x29, #0x228]
    2a8c:      	str	x4, [x29, #0x230]
    2a90:      	b	0x244c <_stogir.verify.integer-operations-target-structured+0x13cc>
    2a94:      	str	x0, [x29, #0x80]
    2a98:      	ldr	x0, [x29, #0x90]
    2a9c:      	str	x2, [x29, #0x88]
    2aa0:      	ldr	x2, [x29, #0x98]
    2aa4:      	str	x3, [x29, #0x238]
    2aa8:      	str	x4, [x29, #0x240]
    2aac:      	b	0x2488 <_stogir.verify.integer-operations-target-structured+0x1408>
    2ab0:      	str	x0, [x29, #0x90]
    2ab4:      	ldr	x0, [x29, #0xb0]
    2ab8:      	str	x2, [x29, #0x98]
    2abc:      	ldr	x2, [x29, #0xa8]
    2ac0:      	str	x1, [x29, #0x248]
    2ac4:      	str	x3, [x29, #0x250]
    2ac8:      	b	0x24b4 <_stogir.verify.integer-operations-target-structured+0x1434>
    2acc:      	str	x19, [x29, #0x150]
    2ad0:      	str	x0, [x29, #0xb0]
    2ad4:      	str	x2, [x29, #0xa8]
    2ad8:      	str	x1, [x29, #0x258]
    2adc:      	str	x3, [x29, #0x260]
    2ae0:      	b	0x2598 <_stogir.verify.integer-operations-target-structured+0x1518>
    2ae4:      	str	x20, [x29, #0x270]
    2ae8:      	mov	x20, x1
    2aec:      	ldr	x2, [x29, #0xc0]
    2af0:      	str	x0, [x29, #0x268]
    2af4:      	ldr	x0, [x29, #0xe0]
    2af8:      	b	0x25c8 <_stogir.verify.integer-operations-target-structured+0x1548>
    2afc:      	ldr	x20, [x29, #0x190]
    2b00:      	ldr	x22, [x29, #0x198]
    2b04:      	b	0x2610 <_stogir.verify.integer-operations-target-structured+0x1590>
    2b08:      	ldr	x20, [x29, #0x190]
    2b0c:      	ldr	x22, [x29, #0x198]
    2b10:      	b	0x2608 <_stogir.verify.integer-operations-target-structured+0x1588>
    2b14:      	str	x0, [x29, #0xe0]
    2b18:      	ldr	x22, [x29, #0xd8]
    2b1c:      	str	x21, [x29, #0x280]
    2b20:      	str	x2, [x29, #0xc0]
    2b24:      	str	x3, [x29, #0x278]
    2b28:      	b	0x2964 <_stogir.verify.integer-operations-target-structured+0x18e4>
    2b2c:      	ldr	x6, [x29, #0x1b8]
    2b30:      	ldr	x8, [x29, #0x170]
    2b34:      	b	0x20ec <_stogir.verify.integer-operations-target-structured+0x106c>
    2b38:      	ldr	x5, [x29, #0x160]
    2b3c:      	b	0x21d8 <_stogir.verify.integer-operations-target-structured+0x1158>
    2b40:      	ldr	x22, [x29, #0xd8]
    2b44:      	b	0x2950 <_stogir.verify.integer-operations-target-structured+0x18d0>
    2b48:      	str	w0, [x29, #0x2a0]
    2b4c:      	str	x1, [x29, #0x298]
    2b50:      	b	0x2838 <_stogir.verify.integer-operations-target-structured+0x17b8>

0000000000002b54 <_coil.core.Len$coil.arraylist.ArrayList$len__i32>:
    2b54:      	ldr	x0, [x0, #0x8]
    2b58:      	ret

0000000000002b5c <_coil.core.Eq$slice<u8>$=>:
    2b5c:      	sub	sp, sp, #0x10
    2b60:      	str	x29, [sp]
    2b64:      	str	x30, [sp, #0x8]
    2b68:      	mov	x29, sp
    2b6c:      	cmp	x1, x3
    2b70:      	b.ne	0x2bb0 <_coil.core.Eq$slice<u8>$=+0x54>
    2b74:      	cmp	x1, #0x0
    2b78:      	b.ne	0x2b84 <_coil.core.Eq$slice<u8>$=+0x28>
    2b7c:      	mov	x0, #0x1                ; =1
    2b80:      	b	0x2bac <_coil.core.Eq$slice<u8>$=+0x50>
    2b84:      	lsr	x1, x1, #0
    2b88:      	fmov	d31, x1
    2b8c:      	mov	x1, x2
    2b90:      	fmov	x2, d31
    2b94:      	bl	0x2b94 <_coil.core.Eq$slice<u8>$=+0x38>
		0000000000002b94:  ARM64_RELOC_BRANCH26	_memcmp
    2b98:      	lsr	w0, w0, #0
    2b9c:      	sxtw	x0, w0
    2ba0:      	cmp	x0, #0x0
    2ba4:      	cset	w0, eq
    2ba8:      	ubfx	x0, x0, #0, #8
    2bac:      	b	0x2bb4 <_coil.core.Eq$slice<u8>$=+0x58>
    2bb0:      	movz	x0, #0x0, lsl #48
    2bb4:      	ldr	x29, [sp]
    2bb8:      	ldr	x30, [sp, #0x8]
    2bbc:      	add	sp, sp, #0x10
    2bc0:      	ret

0000000000002bc4 <_stogir.node.opcode>:
    2bc4:      	ldr	w0, [x0]
    2bc8:      	uxtb	w0, w0
    2bcc:      	ret

0000000000002bd0 <_stogir.opcode.valid?>:
    2bd0:      	sxtw	x0, w0
    2bd4:      	cmp	x0, #0x0
    2bd8:      	b.lt	0x2bec <_stogir.opcode.valid?+0x1c>
    2bdc:      	cmp	x0, #0x83
    2be0:      	cset	w0, lt
    2be4:      	ubfx	x0, x0, #0, #8
    2be8:      	b	0x2bf0 <_stogir.opcode.valid?+0x20>
    2bec:      	movz	x0, #0x0, lsl #48
    2bf0:      	ret

0000000000002bf4 <_stogir.node.type-id>:
    2bf4:      	ldr	w0, [x0]
    2bf8:      	ubfx	x0, x0, #8, #8
    2bfc:      	ret

0000000000002c00 <_stogir.types.valid?>:
    2c00:      	sxtw	x0, w0
    2c04:      	cmp	x0, #0x0
    2c08:      	b.lt	0x2c1c <_stogir.types.valid?+0x1c>
    2c0c:      	cmp	x0, #0xd
    2c10:      	b.gt	0x2c1c <_stogir.types.valid?+0x1c>
    2c14:      	mov	x0, #0x1                ; =1
    2c18:      	ret
    2c1c:      	cmp	x0, #0xf
    2c20:      	b.le	0x2c58 <_stogir.types.valid?+0x58>
    2c24:      	cmp	x0, #0x80
    2c28:      	b.ge	0x2c50 <_stogir.types.valid?+0x50>
    2c2c:      	and	x0, x0, #0xf
    2c30:      	lsr	w0, w0, #0
    2c34:      	sxtw	x0, w0
    2c38:      	cmp	x0, #0x1
    2c3c:      	b.lt	0x2c60 <_stogir.types.valid?+0x60>
    2c40:      	cmp	x0, #0xd
    2c44:      	cset	w0, le
    2c48:      	ubfx	x0, x0, #0, #8
    2c4c:      	b	0x2c64 <_stogir.types.valid?+0x64>
    2c50:      	movz	x0, #0x0, lsl #48
    2c54:      	b	0x2c5c <_stogir.types.valid?+0x5c>
    2c58:      	movz	x0, #0x0, lsl #48
    2c5c:      	ret
    2c60:      	movz	x0, #0x0, lsl #48
    2c64:      	b	0x2c54 <_stogir.types.valid?+0x54>

0000000000002c68 <_stogir.opcode.operand-slots>:
    2c68:      	sxtw	x0, w0
    2c6c:      	cmp	x0, #0x0
    2c70:      	b.lt	0x2c9c <_stogir.opcode.operand-slots+0x34>
    2c74:      	cmp	x0, #0x83
    2c78:      	b.ge	0x2c9c <_stogir.opcode.operand-slots+0x34>
    2c7c:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0xf80>
		0000000000002c7c:  ARM64_RELOC_PAGE21	l_stogir.328
    2c80:      	ldr	x16, [x16]
		0000000000002c80:  ARM64_RELOC_PAGEOFF12	l_stogir.328
    2c84:      	orr	x1, x16, xzr
    2c88:      	lsr	x0, x0, #0
    2c8c:      	add	x0, x0, x1
    2c90:      	ldrsb	w0, [x0]
    2c94:      	sxtb	x0, w0
    2c98:      	b	0x2ca0 <_stogir.opcode.operand-slots+0x38>
    2c9c:      	mov	x0, #-0x2               ; =-2
    2ca0:      	ret

0000000000002ca4 <_stogir.opcode.input-count>:
    2ca4:      	sxtw	x0, w0
    2ca8:      	cmp	x0, #0x0
    2cac:      	b.lt	0x2cd8 <_stogir.opcode.input-count+0x34>
    2cb0:      	cmp	x0, #0x83
    2cb4:      	b.ge	0x2cd8 <_stogir.opcode.input-count+0x34>
    2cb8:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0xf80>
		0000000000002cb8:  ARM64_RELOC_PAGE21	l_stogir.329
    2cbc:      	ldr	x16, [x16]
		0000000000002cbc:  ARM64_RELOC_PAGEOFF12	l_stogir.329
    2cc0:      	orr	x1, x16, xzr
    2cc4:      	lsr	x0, x0, #0
    2cc8:      	add	x0, x0, x1
    2ccc:      	ldrsb	w0, [x0]
    2cd0:      	sxtb	x0, w0
    2cd4:      	b	0x2cdc <_stogir.opcode.input-count+0x38>
    2cd8:      	mov	x0, #-0x2               ; =-2
    2cdc:      	ret

0000000000002ce0 <_stogir.node.auxiliary>:
    2ce0:      	ldr	w0, [x0]
    2ce4:      	ubfx	x0, x0, #16, #16
    2ce8:      	ret

0000000000002cec <_stogir.opcode.operand-code>:
    2cec:      	sxtw	x0, w0
    2cf0:      	cmp	x0, #0x0
    2cf4:      	b.lt	0x2d1c <_stogir.opcode.operand-code+0x30>
    2cf8:      	cmp	x0, #0x83
    2cfc:      	b.ge	0x2d1c <_stogir.opcode.operand-code+0x30>
    2d00:      	sxtw	x1, w1
    2d04:      	cmp	x1, #0x0
    2d08:      	b.le	0x2d1c <_stogir.opcode.operand-code+0x30>
    2d0c:      	cmp	x1, #0x4
    2d10:      	b.le	0x2d24 <_stogir.opcode.operand-code+0x38>
    2d14:      	mov	x1, #0x4                ; =4
    2d18:      	b	0x2d30 <_stogir.opcode.operand-code+0x44>
    2d1c:      	movz	x0, #0x0, lsl #48
    2d20:      	ret
    2d24:      	sub	x1, x1, #0x1
    2d28:      	lsr	w1, w1, #0
    2d2c:      	sxtw	x1, w1
    2d30:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0xf80>
		0000000000002d30:  ARM64_RELOC_PAGE21	l_stogir.330
    2d34:      	ldr	x16, [x16]
		0000000000002d34:  ARM64_RELOC_PAGEOFF12	l_stogir.330
    2d38:      	orr	x2, x16, xzr
    2d3c:      	lsl	x0, x0, #2
    2d40:      	add	x0, x0, x2
    2d44:      	lsl	x1, x1, #2
    2d48:      	lsr	w1, w1, #0
    2d4c:      	ldr	w0, [x0]
    2d50:      	ubfx	x1, x1, #0, #32
    2d54:      	lsr	x0, x0, x1
    2d58:      	lsr	w0, w0, #0
    2d5c:      	and	x0, x0, #0xf
    2d60:      	lsr	w0, w0, #0
    2d64:      	b	0x2d20 <_stogir.opcode.operand-code+0x34>

0000000000002d68 <_stogir.graph.operand>:
    2d68:      	sub	sp, sp, #0x10
    2d6c:      	mov	x3, sp
    2d70:      	sxtw	x1, w1
    2d74:      	cmp	x1, #0x0
    2d78:      	b.le	0x2dc4 <_stogir.graph.operand+0x5c>
    2d7c:      	lsl	x4, x1, #2
    2d80:      	cmp	x1, #0x0
    2d84:      	b.le	0x2df0 <_stogir.graph.operand+0x88>
    2d88:      	ldr	x5, [x0, #0x8]
    2d8c:      	cmp	x1, x5
    2d90:      	b.ge	0x2e48 <_stogir.graph.operand+0xe0>
    2d94:      	add	x5, x0, #0x78
    2d98:      	ldr	x5, [x5, #0x8]
    2d9c:      	cmp	x1, x5
    2da0:      	b.ge	0x2edc <_stogir.graph.operand+0x174>
    2da4:      	ldr	x5, [x0, #0x78]
    2da8:      	add	x5, x4, x5
    2dac:      	ldr	w5, [x5]
    2db0:      	sxtw	x5, w5
    2db4:      	cmp	x5, #0x0
    2db8:      	cset	w5, ge
    2dbc:      	ubfx	x5, x5, #0, #8
    2dc0:      	b	0x2ee0 <_stogir.graph.operand+0x178>
    2dc4:      	movz	x0, #0x0, lsl #48
    2dc8:      	movz	x1, #0x0, lsl #48
    2dcc:      	str	x0, [x3]
    2dd0:      	str	x1, [x3, #0x8]
    2dd4:      	ldr	x0, [sp]
    2dd8:      	ldr	x1, [sp, #0x8]
    2ddc:      	add	sp, sp, #0x10
    2de0:      	ret
    2de4:      	movz	x0, #0x0, lsl #48
    2de8:      	movz	x1, #0x0, lsl #48
    2dec:      	b	0x2dcc <_stogir.graph.operand+0x64>
    2df0:      	cmp	x1, #0x0
    2df4:      	b.ge	0x2e50 <_stogir.graph.operand+0xe8>
    2df8:      	add	x5, x0, #0x28
    2dfc:      	add	x6, x0, #0x50
    2e00:      	ldr	x5, [x5, #0x8]
    2e04:      	ldr	x6, [x6, #0x8]
    2e08:      	cmp	x5, x6
    2e0c:      	b.ne	0x2ed4 <_stogir.graph.operand+0x16c>
    2e10:      	movz	x16, #0x0, lsl #48
    2e14:      	sub	x6, x16, x1
    2e18:      	cmp	x6, x5
    2e1c:      	b.gt	0x2ee4 <_stogir.graph.operand+0x17c>
    2e20:      	sub	x5, x6, #0x1
    2e24:      	lsl	x5, x5, #2
    2e28:      	ldr	x6, [x0, #0x50]
    2e2c:      	add	x5, x5, x6
    2e30:      	ldr	w5, [x5]
    2e34:      	sxtw	x5, w5
    2e38:      	cmp	x5, #0x0
    2e3c:      	cset	w5, gt
    2e40:      	ubfx	x5, x5, #0, #8
    2e44:      	b	0x2ee8 <_stogir.graph.operand+0x180>
    2e48:      	movz	x5, #0x0, lsl #48
    2e4c:      	b	0x2e54 <_stogir.graph.operand+0xec>
    2e50:      	movz	x5, #0x0, lsl #48
    2e54:      	cmp	x5, #0x0
    2e58:      	b.eq	0x2dc4 <_stogir.graph.operand+0x5c>
    2e5c:      	sxtw	x2, w2
    2e60:      	cmp	x2, #0x1
    2e64:      	b.lt	0x2de4 <_stogir.graph.operand+0x7c>
    2e68:      	ldr	x5, [x0, #0x78]
    2e6c:      	add	x4, x4, x5
    2e70:      	ldr	w4, [x4]
    2e74:      	sxtw	x4, w4
    2e78:      	cmp	x2, x4
    2e7c:      	b.gt	0x2de4 <_stogir.graph.operand+0x7c>
    2e80:      	asr	x16, x2, #63
    2e84:      	lsr	x16, x16, #62
    2e88:      	add	x4, x2, x16
    2e8c:      	asr	x4, x4, #2
    2e90:      	asr	x16, x2, #63
    2e94:      	lsr	x16, x16, #62
    2e98:      	add	x2, x2, x16
    2e9c:      	and	x2, x2, #0x3
    2ea0:      	sub	x2, x2, x16
    2ea4:      	ldr	x0, [x0]
    2ea8:      	add	x1, x4, x1
    2eac:      	lsl	x2, x2, #2
    2eb0:      	lsl	x1, x1, #4
    2eb4:      	add	x0, x1, x0
    2eb8:      	add	x0, x2, x0
    2ebc:      	ldr	w0, [x0]
    2ec0:      	sxtw	x0, w0
    2ec4:      	and	x0, x0, #0xffffffff
    2ec8:      	mov	x1, x0
    2ecc:      	mov	x0, #0x1                ; =1
    2ed0:      	b	0x2dec <_stogir.graph.operand+0x84>
    2ed4:      	movz	x5, #0x0, lsl #48
    2ed8:      	b	0x2e54 <_stogir.graph.operand+0xec>
    2edc:      	movz	x5, #0x0, lsl #48
    2ee0:      	b	0x2e4c <_stogir.graph.operand+0xe4>
    2ee4:      	movz	x5, #0x0, lsl #48
    2ee8:      	b	0x2ed8 <_stogir.graph.operand+0x170>

0000000000002eec <_stogir.graph.borrow-node>:
    2eec:      	sxtw	x1, w1
    2ef0:      	cmp	x1, #0x0
    2ef4:      	cset	w2, gt
    2ef8:      	movz	x16, #0x0, lsl #48
    2efc:      	sub	x3, x16, x1
    2f00:      	sub	x4, x3, #0x1
    2f04:      	uxtb	w16, w2
    2f08:      	cmp	w16, wzr
    2f0c:      	b.eq	0x2f50 <_stogir.graph.borrow-node+0x64>
    2f10:      	ldr	x3, [x0, #0x8]
    2f14:      	cmp	x1, x3
    2f18:      	b.ge	0x2fa4 <_stogir.graph.borrow-node+0xb8>
    2f1c:      	add	x3, x0, #0x78
    2f20:      	ldr	x3, [x3, #0x8]
    2f24:      	cmp	x1, x3
    2f28:      	b.ge	0x2fec <_stogir.graph.borrow-node+0x100>
    2f2c:      	lsl	x3, x1, #2
    2f30:      	ldr	x5, [x0, #0x78]
    2f34:      	add	x3, x3, x5
    2f38:      	ldr	w3, [x3]
    2f3c:      	sxtw	x3, w3
    2f40:      	cmp	x3, #0x0
    2f44:      	cset	w3, ge
    2f48:      	ubfx	x3, x3, #0, #8
    2f4c:      	b	0x2ff0 <_stogir.graph.borrow-node+0x104>
    2f50:      	cmp	x1, #0x0
    2f54:      	b.ge	0x2fac <_stogir.graph.borrow-node+0xc0>
    2f58:      	add	x5, x0, #0x28
    2f5c:      	add	x6, x0, #0x50
    2f60:      	ldr	x5, [x5, #0x8]
    2f64:      	ldr	x6, [x6, #0x8]
    2f68:      	cmp	x5, x6
    2f6c:      	b.ne	0x2f9c <_stogir.graph.borrow-node+0xb0>
    2f70:      	cmp	x3, x5
    2f74:      	b.gt	0x2ff4 <_stogir.graph.borrow-node+0x108>
    2f78:      	lsl	x3, x4, #2
    2f7c:      	ldr	x5, [x0, #0x50]
    2f80:      	add	x3, x3, x5
    2f84:      	ldr	w3, [x3]
    2f88:      	sxtw	x3, w3
    2f8c:      	cmp	x3, #0x0
    2f90:      	cset	w3, gt
    2f94:      	ubfx	x3, x3, #0, #8
    2f98:      	b	0x2ff8 <_stogir.graph.borrow-node+0x10c>
    2f9c:      	movz	x3, #0x0, lsl #48
    2fa0:      	b	0x2fb0 <_stogir.graph.borrow-node+0xc4>
    2fa4:      	movz	x3, #0x0, lsl #48
    2fa8:      	b	0x2fb0 <_stogir.graph.borrow-node+0xc4>
    2fac:      	movz	x3, #0x0, lsl #48
    2fb0:      	cmp	x3, #0x0
    2fb4:      	b.eq	0x2fe4 <_stogir.graph.borrow-node+0xf8>
    2fb8:      	uxtb	w16, w2
    2fbc:      	cmp	w16, wzr
    2fc0:      	b.eq	0x2fd4 <_stogir.graph.borrow-node+0xe8>
    2fc4:      	lsl	x1, x1, #4
    2fc8:      	ldr	x0, [x0]
    2fcc:      	add	x0, x1, x0
    2fd0:      	b	0x2fe0 <_stogir.graph.borrow-node+0xf4>
    2fd4:      	lsl	x1, x4, #4
    2fd8:      	ldr	x0, [x0, #0x28]
    2fdc:      	add	x0, x1, x0
    2fe0:      	b	0x2fe8 <_stogir.graph.borrow-node+0xfc>
    2fe4:      	movz	x0, #0x0, lsl #48
    2fe8:      	ret
    2fec:      	movz	x3, #0x0, lsl #48
    2ff0:      	b	0x2fa8 <_stogir.graph.borrow-node+0xbc>
    2ff4:      	movz	x3, #0x0, lsl #48
    2ff8:      	b	0x2fa0 <_stogir.graph.borrow-node+0xb4>

0000000000002ffc <_stogir.strings.lookup>:
    2ffc:      	sxtw	x1, w1
    3000:      	cmp	x1, #0x0
    3004:      	b.le	0x3080 <_stogir.strings.lookup+0x84>
    3008:      	add	x2, x0, #0x28
    300c:      	ldr	x2, [x2, #0x8]
    3010:      	cmp	x1, x2
    3014:      	b.gt	0x3080 <_stogir.strings.lookup+0x84>
    3018:      	sub	x1, x1, #0x1
    301c:      	mov	x17, #0x18              ; =24
    3020:      	mul	x1, x1, x17
    3024:      	ldr	x2, [x0, #0x28]
    3028:      	add	x1, x1, x2
    302c:      	ldr	x2, [x1]
    3030:      	ldr	x1, [x1, #0x8]
    3034:      	ldr	x3, [x0, #0x8]
    3038:      	cmp	x2, #0x0
    303c:      	b.lt	0x309c <_stogir.strings.lookup+0xa0>
    3040:      	cmp	x2, x3
    3044:      	b.gt	0x309c <_stogir.strings.lookup+0xa0>
    3048:      	cmp	x1, #0x0
    304c:      	b.lt	0x309c <_stogir.strings.lookup+0xa0>
    3050:      	sub	x3, x3, x2
    3054:      	cmp	x1, x3
    3058:      	b.gt	0x309c <_stogir.strings.lookup+0xa0>
    305c:      	add	x1, x1, x2
    3060:      	lsr	x3, x2, #0
    3064:      	sub	x1, x1, x2
    3068:      	ldr	x0, [x0]
    306c:      	add	x0, x3, x0
    3070:      	mov	x2, x1
    3074:      	mov	x1, x0
    3078:      	mov	x0, #0x1                ; =1
    307c:      	b	0x30a8 <_stogir.strings.lookup+0xac>
    3080:      	movz	x0, #0x0, lsl #48
    3084:      	movz	x1, #0x0, lsl #48
    3088:      	movz	x2, #0x0, lsl #48
    308c:      	str	x0, [x8]
    3090:      	str	x1, [x8, #0x8]
    3094:      	str	x2, [x8, #0x10]
    3098:      	ret
    309c:      	movz	x0, #0x0, lsl #48
    30a0:      	movz	x1, #0x0, lsl #48
    30a4:      	movz	x2, #0x0, lsl #48
    30a8:      	b	0x308c <_stogir.strings.lookup+0x90>

00000000000030ac <_stogir.uses.edge-code?>:
    30ac:      	ubfx	x0, x0, #0, #32
    30b0:      	cmp	x0, #0xf
    30b4:      	b.hs	0x30e8 <_stogir.uses.edge-code?+0x3c>
    30b8:      	mov	x16, #0x1               ; =1
    30bc:      	lsl	x0, x16, x0
    30c0:      	lsr	w0, w0, #0
    30c4:      	mov	x17, #0x5e1c            ; =24092
    30c8:      	and	x0, x0, x17
    30cc:      	lsr	w0, w0, #0
    30d0:      	cmp	x0, #0x0
    30d4:      	cset	w0, eq
    30d8:      	uxtb	w16, w0
    30dc:      	cmp	w16, wzr
    30e0:      	cset	x0, eq
    30e4:      	b	0x30ec <_stogir.uses.edge-code?+0x40>
    30e8:      	movz	x0, #0x0, lsl #48
    30ec:      	ret

00000000000030f0 <_stogir.graph.contains?>:
    30f0:      	sxtw	x1, w1
    30f4:      	cmp	x1, #0x0
    30f8:      	b.le	0x313c <_stogir.graph.contains?+0x4c>
    30fc:      	ldr	x2, [x0, #0x8]
    3100:      	cmp	x1, x2
    3104:      	b.ge	0x319c <_stogir.graph.contains?+0xac>
    3108:      	add	x2, x0, #0x78
    310c:      	ldr	x2, [x2, #0x8]
    3110:      	cmp	x1, x2
    3114:      	b.ge	0x31ac <_stogir.graph.contains?+0xbc>
    3118:      	lsl	x1, x1, #2
    311c:      	ldr	x0, [x0, #0x78]
    3120:      	add	x0, x1, x0
    3124:      	ldr	w0, [x0]
    3128:      	sxtw	x0, w0
    312c:      	cmp	x0, #0x0
    3130:      	cset	w0, ge
    3134:      	ubfx	x0, x0, #0, #8
    3138:      	b	0x31b0 <_stogir.graph.contains?+0xc0>
    313c:      	cmp	x1, #0x0
    3140:      	b.ge	0x31a4 <_stogir.graph.contains?+0xb4>
    3144:      	add	x2, x0, #0x28
    3148:      	add	x3, x0, #0x50
    314c:      	ldr	x2, [x2, #0x8]
    3150:      	ldr	x3, [x3, #0x8]
    3154:      	cmp	x2, x3
    3158:      	b.ne	0x31bc <_stogir.graph.contains?+0xcc>
    315c:      	movz	x16, #0x0, lsl #48
    3160:      	sub	x3, x16, x1
    3164:      	cmp	x3, x2
    3168:      	b.gt	0x31b4 <_stogir.graph.contains?+0xc4>
    316c:      	movz	x16, #0x0, lsl #48
    3170:      	sub	x1, x16, x1
    3174:      	sub	x1, x1, #0x1
    3178:      	lsl	x1, x1, #2
    317c:      	ldr	x0, [x0, #0x50]
    3180:      	add	x0, x1, x0
    3184:      	ldr	w0, [x0]
    3188:      	sxtw	x0, w0
    318c:      	cmp	x0, #0x0
    3190:      	cset	w0, gt
    3194:      	ubfx	x0, x0, #0, #8
    3198:      	b	0x31b8 <_stogir.graph.contains?+0xc8>
    319c:      	movz	x0, #0x0, lsl #48
    31a0:      	b	0x31b0 <_stogir.graph.contains?+0xc0>
    31a4:      	movz	x0, #0x0, lsl #48
    31a8:      	b	0x31b8 <_stogir.graph.contains?+0xc8>
    31ac:      	movz	x0, #0x0, lsl #48
    31b0:      	b	0x31b8 <_stogir.graph.contains?+0xc8>
    31b4:      	movz	x0, #0x0, lsl #48
    31b8:      	ret
    31bc:      	movz	x0, #0x0, lsl #48
    31c0:      	b	0x31b8 <_stogir.graph.contains?+0xc8>

00000000000031c4 <_stogir.opcode.optional-reference?>:
    31c4:      	sxtw	x0, w0
    31c8:      	sxtw	x2, w2
    31cc:      	cmp	x0, #0x0
    31d0:      	b.lt	0x31f4 <_stogir.opcode.optional-reference?+0x30>
    31d4:      	cmp	x0, #0x83
    31d8:      	b.ge	0x31f4 <_stogir.opcode.optional-reference?+0x30>
    31dc:      	cmp	x2, #0x0
    31e0:      	b.le	0x31f4 <_stogir.opcode.optional-reference?+0x30>
    31e4:      	cmp	x2, #0x4
    31e8:      	b.le	0x3258 <_stogir.opcode.optional-reference?+0x94>
    31ec:      	mov	x3, #0x4                ; =4
    31f0:      	b	0x3264 <_stogir.opcode.optional-reference?+0xa0>
    31f4:      	movz	x3, #0x0, lsl #48
    31f8:      	adrp	x16, 0x3000 <_stogir.strings.lookup+0x4>
		00000000000031f8:  ARM64_RELOC_PAGE21	l_stogir.331
    31fc:      	ldr	x16, [x16]
		00000000000031fc:  ARM64_RELOC_PAGEOFF12	l_stogir.331
    3200:      	ldr	w4, [x16]
    3204:      	lsr	w3, w3, #0
    3208:      	cmp	x3, x4
    320c:      	b.ne	0x3220 <_stogir.opcode.optional-reference?+0x5c>
    3210:      	mov	x0, #0x1                ; =1
    3214:      	b	0x321c <_stogir.opcode.optional-reference?+0x58>
    3218:      	movz	x0, #0x0, lsl #48
    321c:      	ret
    3220:      	adrp	x16, 0x3000 <_stogir.strings.lookup+0x4>
		0000000000003220:  ARM64_RELOC_PAGE21	l_stogir.332
    3224:      	ldr	x16, [x16]
		0000000000003224:  ARM64_RELOC_PAGEOFF12	l_stogir.332
    3228:      	ldr	w4, [x16]
    322c:      	cmp	x3, x4
    3230:      	b.ne	0x323c <_stogir.opcode.optional-reference?+0x78>
    3234:      	mov	x0, #0x1                ; =1
    3238:      	b	0x321c <_stogir.opcode.optional-reference?+0x58>
    323c:      	adrp	x16, 0x3000 <_stogir.strings.lookup+0x4>
		000000000000323c:  ARM64_RELOC_PAGE21	l_stogir.333
    3240:      	ldr	x16, [x16]
		0000000000003240:  ARM64_RELOC_PAGEOFF12	l_stogir.333
    3244:      	ldr	w4, [x16]
    3248:      	cmp	x3, x4
    324c:      	b.ne	0x329c <_stogir.opcode.optional-reference?+0xd8>
    3250:      	mov	x0, #0x1                ; =1
    3254:      	b	0x321c <_stogir.opcode.optional-reference?+0x58>
    3258:      	sub	x3, x2, #0x1
    325c:      	lsr	w3, w3, #0
    3260:      	sxtw	x3, w3
    3264:      	adrp	x16, 0x3000 <_stogir.strings.lookup+0x4>
		0000000000003264:  ARM64_RELOC_PAGE21	l_stogir.334
    3268:      	ldr	x16, [x16]
		0000000000003268:  ARM64_RELOC_PAGEOFF12	l_stogir.334
    326c:      	orr	x4, x16, xzr
    3270:      	lsl	x5, x0, #2
    3274:      	add	x4, x5, x4
    3278:      	lsl	x3, x3, #2
    327c:      	lsr	w3, w3, #0
    3280:      	ldr	w4, [x4]
    3284:      	ubfx	x3, x3, #0, #32
    3288:      	lsr	x3, x4, x3
    328c:      	lsr	w3, w3, #0
    3290:      	and	x3, x3, #0xf
    3294:      	lsr	w3, w3, #0
    3298:      	b	0x31f8 <_stogir.opcode.optional-reference?+0x34>
    329c:      	cmp	x0, #0x78
    32a0:      	b.ne	0x3218 <_stogir.opcode.optional-reference?+0x54>
    32a4:      	sxtw	x1, w1
    32a8:      	cmp	x1, #0x0
    32ac:      	b.ne	0x32c0 <_stogir.opcode.optional-reference?+0xfc>
    32b0:      	cmp	x2, #0x2
    32b4:      	cset	w0, eq
    32b8:      	ubfx	x0, x0, #0, #8
    32bc:      	b	0x32c4 <_stogir.opcode.optional-reference?+0x100>
    32c0:      	movz	x0, #0x0, lsl #48
    32c4:      	b	0x321c <_stogir.opcode.optional-reference?+0x58>

00000000000032c8 <_stogir.integer-binary.operation?>:
    32c8:      	sxtw	x0, w0
    32cc:      	cmp	x0, #0x1a
    32d0:      	b.lt	0x32e4 <_stogir.integer-binary.operation?+0x1c>
    32d4:      	cmp	x0, #0x1e
    32d8:      	b.gt	0x32e4 <_stogir.integer-binary.operation?+0x1c>
    32dc:      	mov	x0, #0x1                ; =1
    32e0:      	b	0x3318 <_stogir.integer-binary.operation?+0x50>
    32e4:      	cmp	x0, #0x2e
    32e8:      	b.lt	0x32fc <_stogir.integer-binary.operation?+0x34>
    32ec:      	cmp	x0, #0x35
    32f0:      	b.gt	0x32fc <_stogir.integer-binary.operation?+0x34>
    32f4:      	mov	x0, #0x1                ; =1
    32f8:      	b	0x3318 <_stogir.integer-binary.operation?+0x50>
    32fc:      	cmp	x0, #0x3a
    3300:      	b.ne	0x330c <_stogir.integer-binary.operation?+0x44>
    3304:      	mov	x0, #0x1                ; =1
    3308:      	b	0x3318 <_stogir.integer-binary.operation?+0x50>
    330c:      	cmp	x0, #0x3b
    3310:      	cset	w0, eq
    3314:      	ubfx	x0, x0, #0, #8
    3318:      	ret

000000000000331c <_stogir.integer-unary.operation?>:
    331c:      	sxtw	x0, w0
    3320:      	cmp	x0, #0x1f
    3324:      	b.ne	0x3340 <_stogir.integer-unary.operation?+0x24>
    3328:      	mov	x0, #0x1                ; =1
    332c:      	b	0x333c <_stogir.integer-unary.operation?+0x20>
    3330:      	cmp	x0, #0x39
    3334:      	cset	w0, eq
    3338:      	ubfx	x0, x0, #0, #8
    333c:      	ret
    3340:      	cmp	x0, #0x20
    3344:      	b.ne	0x3350 <_stogir.integer-unary.operation?+0x34>
    3348:      	mov	x0, #0x1                ; =1
    334c:      	b	0x333c <_stogir.integer-unary.operation?+0x20>
    3350:      	cmp	x0, #0x2d
    3354:      	b.ne	0x3360 <_stogir.integer-unary.operation?+0x44>
    3358:      	mov	x0, #0x1                ; =1
    335c:      	b	0x333c <_stogir.integer-unary.operation?+0x20>
    3360:      	cmp	x0, #0x36
    3364:      	b.ne	0x3370 <_stogir.integer-unary.operation?+0x54>
    3368:      	mov	x0, #0x1                ; =1
    336c:      	b	0x333c <_stogir.integer-unary.operation?+0x20>
    3370:      	cmp	x0, #0x37
    3374:      	b.ne	0x3380 <_stogir.integer-unary.operation?+0x64>
    3378:      	mov	x0, #0x1                ; =1
    337c:      	b	0x333c <_stogir.integer-unary.operation?+0x20>
    3380:      	cmp	x0, #0x38
    3384:      	b.ne	0x3330 <_stogir.integer-unary.operation?+0x14>
    3388:      	mov	x0, #0x1                ; =1
    338c:      	b	0x333c <_stogir.integer-unary.operation?+0x20>

0000000000003390 <_stogir.verify.classifications>:
    3390:      	sub	sp, sp, #0xa0
    3394:      	str	x29, [sp, #0x10]
    3398:      	str	x30, [sp, #0x18]
    339c:      	add	x29, sp, #0x10
    33a0:      	str	x19, [sp, #0x50]
    33a4:      	str	x20, [sp, #0x58]
    33a8:      	str	x21, [sp, #0x60]
    33ac:      	str	x22, [sp, #0x68]
    33b0:      	str	x23, [sp, #0x70]
    33b4:      	str	x24, [sp, #0x78]
    33b8:      	str	x25, [sp, #0x80]
    33bc:      	str	x26, [sp, #0x88]
    33c0:      	str	x27, [sp, #0x90]
    33c4:      	str	x28, [sp, #0x98]
    33c8:      	sub	sp, sp, #0x10
    33cc:      	add	x19, sp, #0x10
    33d0:      	sub	sp, sp, #0x10
    33d4:      	add	x20, sp, #0x10
    33d8:      	ldr	w4, [x2]
    33dc:      	orr	x5, x4, xzr
    33e0:      	ubfx	x5, x5, #8, #8
    33e4:      	cmp	x5, #0xf
    33e8:      	b.le	0x3420 <_stogir.verify.classifications+0x90>
    33ec:      	cmp	x5, #0x80
    33f0:      	b.ge	0x3418 <_stogir.verify.classifications+0x88>
    33f4:      	and	x6, x5, #0xf
    33f8:      	lsr	w6, w6, #0
    33fc:      	sxtw	x6, w6
    3400:      	cmp	x6, #0x1
    3404:      	b.lt	0x39b0 <_stogir.verify.classifications+0x620>
    3408:      	cmp	x6, #0xd
    340c:      	cset	w6, le
    3410:      	ubfx	x6, x6, #0, #8
    3414:      	b	0x39b4 <_stogir.verify.classifications+0x624>
    3418:      	movz	x6, #0x0, lsl #48
    341c:      	b	0x3424 <_stogir.verify.classifications+0x94>
    3420:      	movz	x6, #0x0, lsl #48
    3424:      	uxtb	w4, w4
    3428:      	cmp	x4, #0xe
    342c:      	b.lt	0x38c0 <_stogir.verify.classifications+0x530>
    3430:      	cmp	x4, #0x19
    3434:      	b.gt	0x38c0 <_stogir.verify.classifications+0x530>
    3438:      	cmp	x6, #0x0
    343c:      	cset	w7, ne
    3440:      	uxtb	w16, w7
    3444:      	cmp	w16, wzr
    3448:      	cset	x7, eq
    344c:      	cmp	x7, #0x0
    3450:      	cset	w21, ne
    3454:      	uxtb	w16, w21
    3458:      	cmp	w16, wzr
    345c:      	b.eq	0x34d4 <_stogir.verify.classifications+0x144>
    3460:      	ldr	w8, [x2, #0x4]
    3464:      	sxtw	x8, w8
    3468:      	cmp	x8, #0x0
    346c:      	cset	w9, gt
    3470:      	movz	x16, #0x0, lsl #48
    3474:      	sub	x10, x16, x8
    3478:      	sub	x11, x10, #0x1
    347c:      	uxtb	w16, w9
    3480:      	cmp	w16, wzr
    3484:      	b.eq	0x3964 <_stogir.verify.classifications+0x5d4>
    3488:      	ldr	x10, [x0, #0x8]
    348c:      	cmp	x8, x10
    3490:      	b.ge	0x395c <_stogir.verify.classifications+0x5cc>
    3494:      	add	x10, x0, #0x78
    3498:      	ldr	x10, [x10, #0x8]
    349c:      	cmp	x8, x10
    34a0:      	b.ge	0x39e0 <_stogir.verify.classifications+0x650>
    34a4:      	lsl	x10, x8, #2
    34a8:      	ldr	x12, [x0, #0x78]
    34ac:      	add	x10, x10, x12
    34b0:      	ldr	w10, [x10]
    34b4:      	sxtw	x10, w10
    34b8:      	cmp	x10, #0x0
    34bc:      	cset	w10, ge
    34c0:      	ubfx	x10, x10, #0, #8
    34c4:      	b	0x39e4 <_stogir.verify.classifications+0x654>
    34c8:      	ldr	w8, [x8]
    34cc:      	ubfx	x8, x8, #8, #8
    34d0:      	b	0x34d8 <_stogir.verify.classifications+0x148>
    34d4:      	movn	x8, #0x0, lsl #48
    34d8:      	lsr	w8, w8, #0
    34dc:      	sxtw	x8, w8
    34e0:      	cmp	x8, #0xf
    34e4:      	cset	w22, gt
    34e8:      	cmp	x8, #0x80
    34ec:      	cset	w23, lt
    34f0:      	and	x9, x8, #0xf
    34f4:      	lsr	w9, w9, #0
    34f8:      	sxtw	x9, w9
    34fc:      	cmp	x9, #0x1
    3500:      	cset	w24, ge
    3504:      	cmp	x9, #0xd
    3508:      	cset	w9, le
    350c:      	cmp	x7, #0x0
    3510:      	b.eq	0x3560 <_stogir.verify.classifications+0x1d0>
    3514:      	uxtb	w16, w22
    3518:      	cmp	w16, wzr
    351c:      	b.eq	0x39b8 <_stogir.verify.classifications+0x628>
    3520:      	uxtb	w16, w23
    3524:      	cmp	w16, wzr
    3528:      	b.eq	0x39b8 <_stogir.verify.classifications+0x628>
    352c:      	uxtb	w16, w24
    3530:      	cmp	w16, wzr
    3534:      	b.eq	0x39b8 <_stogir.verify.classifications+0x628>
    3538:      	uxtb	w16, w9
    353c:      	cmp	w16, wzr
    3540:      	b.eq	0x39b8 <_stogir.verify.classifications+0x628>
    3544:      	movz	x5, #0x0, lsl #48
    3548:      	b	0x3550 <_stogir.verify.classifications+0x1c0>
    354c:      	mov	x5, #0x1                ; =1
    3550:      	mov	x25, x5
    3554:      	b	0x3564 <_stogir.verify.classifications+0x1d4>
    3558:      	movz	x3, #0x0, lsl #48
    355c:      	b	0x359c <_stogir.verify.classifications+0x20c>
    3560:      	movz	x25, #0x0, lsl #48
    3564:      	sxtw	x26, w3
    3568:      	lsr	w27, w1, #0
    356c:      	cmp	x4, #0x83
    3570:      	cset	w28, lt
    3574:      	adrp	x16, 0x3000 <_stogir.strings.lookup+0x4>
		0000000000003574:  ARM64_RELOC_PAGE21	l_stogir.335
    3578:      	ldr	x16, [x16]
		0000000000003578:  ARM64_RELOC_PAGEOFF12	l_stogir.335
    357c:      	orr	x1, x16, xzr
    3580:      	lsl	x3, x4, #2
    3584:      	ubfx	x4, x9, #0, #8
    3588:      	add	x1, x3, x1
    358c:      	mov	x3, x6
    3590:      	mov	x5, #0x1                ; =1
    3594:      	b	0x3620 <_stogir.verify.classifications+0x290>
    3598:      	movz	x3, #0x0, lsl #48
    359c:      	str	x0, [x29, #0x10]
    35a0:      	str	x2, [x29, #0x18]
    35a4:      	str	w21, [x29, #0x30]
    35a8:      	str	w22, [x29, #0x38]
    35ac:      	mov	x22, x5
    35b0:      	str	x1, [x29, #0x28]
    35b4:      	str	x4, [x29, #0x20]
    35b8:      	mov	x0, x3
    35bc:      	b	0x35f4 <_stogir.verify.classifications+0x264>
    35c0:      	sub	x7, x7, #0x1
    35c4:      	lsr	w7, w7, #0
    35c8:      	sxtw	x7, w7
    35cc:      	ldr	w8, [x1]
    35d0:      	lsl	x7, x7, #2
    35d4:      	lsr	w7, w7, #0
    35d8:      	ubfx	x7, x7, #0, #32
    35dc:      	lsr	x7, x8, x7
    35e0:      	lsr	w7, w7, #0
    35e4:      	and	x7, x7, #0xf
    35e8:      	lsr	w7, w7, #0
    35ec:      	b	0x3660 <_stogir.verify.classifications+0x2d0>
    35f0:      	mov	x0, x21
    35f4:      	add	x1, x22, #0x1
    35f8:      	lsr	w1, w1, #0
    35fc:      	sxtw	x1, w1
    3600:      	ldr	x2, [x29, #0x18]
    3604:      	ldr	w21, [x29, #0x30]
    3608:      	ldr	w22, [x29, #0x38]
    360c:      	ldr	x4, [x29, #0x20]
    3610:      	mov	x3, x0
    3614:      	ldr	x0, [x29, #0x10]
    3618:      	mov	x5, x1
    361c:      	ldr	x1, [x29, #0x28]
    3620:      	cmp	x3, #0x0
    3624:      	b.ne	0x3a28 <_stogir.verify.classifications+0x698>
    3628:      	cmp	x5, x26
    362c:      	b.gt	0x3a30 <_stogir.verify.classifications+0x6a0>
    3630:      	lsr	w6, w5, #0
    3634:      	uxtb	w16, w28
    3638:      	cmp	w16, wzr
    363c:      	b.eq	0x365c <_stogir.verify.classifications+0x2cc>
    3640:      	sxtw	x7, w6
    3644:      	cmp	x7, #0x0
    3648:      	b.le	0x365c <_stogir.verify.classifications+0x2cc>
    364c:      	cmp	x7, #0x4
    3650:      	b.le	0x35c0 <_stogir.verify.classifications+0x230>
    3654:      	mov	x7, #0x4                ; =4
    3658:      	b	0x35cc <_stogir.verify.classifications+0x23c>
    365c:      	movz	x7, #0x0, lsl #48
    3660:      	adrp	x16, 0x3000 <_stogir.strings.lookup+0x4>
		0000000000003660:  ARM64_RELOC_PAGE21	l_stogir.336
    3664:      	ldr	x16, [x16]
		0000000000003664:  ARM64_RELOC_PAGEOFF12	l_stogir.336
    3668:      	ldr	w8, [x16]
    366c:      	lsr	w7, w7, #0
    3670:      	cmp	x7, x8
    3674:      	b.eq	0x36b0 <_stogir.verify.classifications+0x320>
    3678:      	adrp	x16, 0x3000 <_stogir.strings.lookup+0x4>
		0000000000003678:  ARM64_RELOC_PAGE21	l_stogir.337
    367c:      	ldr	x16, [x16]
		000000000000367c:  ARM64_RELOC_PAGEOFF12	l_stogir.337
    3680:      	ldr	w8, [x16]
    3684:      	cmp	x7, x8
    3688:      	b.eq	0x36b0 <_stogir.verify.classifications+0x320>
    368c:      	str	x0, [x29, #0x10]
    3690:      	str	x2, [x29, #0x18]
    3694:      	str	w21, [x29, #0x30]
    3698:      	str	w22, [x29, #0x38]
    369c:      	mov	x22, x5
    36a0:      	str	x1, [x29, #0x28]
    36a4:      	str	x4, [x29, #0x20]
    36a8:      	mov	x0, x3
    36ac:      	b	0x35f4 <_stogir.verify.classifications+0x264>
    36b0:      	cmp	x5, #0x1
    36b4:      	b.ne	0x36f0 <_stogir.verify.classifications+0x360>
    36b8:      	uxtb	w16, w21
    36bc:      	cmp	w16, wzr
    36c0:      	b.eq	0x36f0 <_stogir.verify.classifications+0x360>
    36c4:      	uxtb	w16, w22
    36c8:      	cmp	w16, wzr
    36cc:      	b.eq	0x3598 <_stogir.verify.classifications+0x208>
    36d0:      	uxtb	w16, w23
    36d4:      	cmp	w16, wzr
    36d8:      	b.eq	0x3558 <_stogir.verify.classifications+0x1c8>
    36dc:      	uxtb	w16, w24
    36e0:      	cmp	w16, wzr
    36e4:      	b.eq	0x38f8 <_stogir.verify.classifications+0x568>
    36e8:      	mov	x3, x4
    36ec:      	b	0x38fc <_stogir.verify.classifications+0x56c>
    36f0:      	cmp	x5, #0x1
    36f4:      	b.ne	0x3778 <_stogir.verify.classifications+0x3e8>
    36f8:      	ldr	w6, [x2, #0x4]
    36fc:      	sxtw	x6, w6
    3700:      	str	x0, [x29, #0x10]
    3704:      	str	x2, [x29, #0x18]
    3708:      	str	w21, [x29, #0x30]
    370c:      	mov	x21, x3
    3710:      	str	w22, [x29, #0x38]
    3714:      	mov	x22, x5
    3718:      	str	x1, [x29, #0x28]
    371c:      	str	x4, [x29, #0x20]
    3720:      	mov	x0, x6
    3724:      	lsr	w0, w0, #0
    3728:      	mov	w1, w0
    372c:      	ldr	x0, [x29, #0x10]
    3730:      	bl	0x3730 <_stogir.verify.classifications+0x3a0>
		0000000000003730:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
    3734:      	cmp	x0, #0x0
    3738:      	b.eq	0x35f0 <_stogir.verify.classifications+0x260>
    373c:      	ldr	w0, [x0]
    3740:      	ubfx	x0, x0, #8, #8
    3744:      	cmp	x0, #0xf
    3748:      	b.le	0x35f0 <_stogir.verify.classifications+0x260>
    374c:      	cmp	x0, #0x80
    3750:      	b.ge	0x35f0 <_stogir.verify.classifications+0x260>
    3754:      	and	x0, x0, #0xf
    3758:      	lsr	w0, w0, #0
    375c:      	sxtw	x0, w0
    3760:      	cmp	x0, #0x1
    3764:      	b.lt	0x35f0 <_stogir.verify.classifications+0x260>
    3768:      	cmp	x0, #0xd
    376c:      	b.gt	0x35f0 <_stogir.verify.classifications+0x260>
    3770:      	mov	x0, #0x1                ; =1
    3774:      	b	0x35f4 <_stogir.verify.classifications+0x264>
    3778:      	cmp	x5, #0x2
    377c:      	b.ne	0x37b0 <_stogir.verify.classifications+0x420>
    3780:      	ldr	w6, [x2, #0x8]
    3784:      	sxtw	x6, w6
    3788:      	str	x0, [x29, #0x10]
    378c:      	str	x2, [x29, #0x18]
    3790:      	str	w21, [x29, #0x30]
    3794:      	mov	x21, x3
    3798:      	str	w22, [x29, #0x38]
    379c:      	mov	x22, x5
    37a0:      	str	x1, [x29, #0x28]
    37a4:      	str	x4, [x29, #0x20]
    37a8:      	mov	x0, x6
    37ac:      	b	0x3724 <_stogir.verify.classifications+0x394>
    37b0:      	cmp	x5, #0x3
    37b4:      	b.ne	0x3840 <_stogir.verify.classifications+0x4b0>
    37b8:      	ldr	w6, [x2, #0xc]
    37bc:      	sxtw	x6, w6
    37c0:      	str	x0, [x29, #0x10]
    37c4:      	str	x2, [x29, #0x18]
    37c8:      	str	w21, [x29, #0x30]
    37cc:      	mov	x21, x3
    37d0:      	str	w22, [x29, #0x38]
    37d4:      	mov	x22, x5
    37d8:      	str	x1, [x29, #0x28]
    37dc:      	str	x4, [x29, #0x20]
    37e0:      	mov	x0, x6
    37e4:      	b	0x37ac <_stogir.verify.classifications+0x41c>
    37e8:      	uxtb	w21, w21
    37ec:      	uxtb	w25, w25
    37f0:      	movz	w17, #0x0, lsl #16
    37f4:      	strh	w17, [x19]
    37f8:      	strb	w21, [x19]
    37fc:      	strb	w25, [x19, #0x1]
    3800:      	ldrh	w0, [x19]
    3804:      	sub	sp, x29, #0x10
    3808:      	ldr	x19, [sp, #0x50]
    380c:      	ldr	x20, [sp, #0x58]
    3810:      	ldr	x21, [sp, #0x60]
    3814:      	ldr	x22, [sp, #0x68]
    3818:      	ldr	x23, [sp, #0x70]
    381c:      	ldr	x24, [sp, #0x78]
    3820:      	ldr	x25, [sp, #0x80]
    3824:      	ldr	x26, [sp, #0x88]
    3828:      	ldr	x27, [sp, #0x90]
    382c:      	ldr	x28, [sp, #0x98]
    3830:      	ldr	x29, [sp, #0x10]
    3834:      	ldr	x30, [sp, #0x18]
    3838:      	add	sp, sp, #0xa0
    383c:      	ret
    3840:      	mov	x16, x20
    3844:      	str	x16, [sp]
    3848:      	str	x0, [x29, #0x10]
    384c:      	str	x2, [x29, #0x18]
    3850:      	mov	w2, w6
    3854:      	str	x4, [x29, #0x20]
    3858:      	str	x1, [x29, #0x28]
    385c:      	mov	w1, w27
    3860:      	str	w21, [x29, #0x30]
    3864:      	mov	x21, x3
    3868:      	str	w22, [x29, #0x38]
    386c:      	mov	x22, x5
    3870:      	bl	0x3870 <_stogir.verify.classifications+0x4e0>
		0000000000003870:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    3874:      	ldr	x16, [sp]
    3878:      	str	x0, [x16]
    387c:      	str	x1, [x16, #0x8]
    3880:      	ldr	x0, [x20]
    3884:      	ldr	x1, [x20, #0x8]
    3888:      	lsr	w0, w0, #0
    388c:      	lsr	x16, x0, #0
    3890:      	cmp	x16, #0x1
    3894:      	b.eq	0x38b0 <_stogir.verify.classifications+0x520>
    3898:      	b.lo	0x38a0 <_stogir.verify.classifications+0x510>
    389c:      	b	0x38b4 <_stogir.verify.classifications+0x524>
    38a0:      	cmp	x16, #0x0
    38a4:      	b.eq	0x38ac <_stogir.verify.classifications+0x51c>
    38a8:      	b	0x38b4 <_stogir.verify.classifications+0x524>
    38ac:      	b	0x38b8 <_stogir.verify.classifications+0x528>
    38b0:      	b	0x3900 <_stogir.verify.classifications+0x570>
    38b4:      	b	0x3a20 <_stogir.verify.classifications+0x690>
    38b8:      	movz	x0, #0x0, lsl #48
    38bc:      	b	0x390c <_stogir.verify.classifications+0x57c>
    38c0:      	cmp	x4, #0x1f
    38c4:      	b.eq	0x3438 <_stogir.verify.classifications+0xa8>
    38c8:      	cmp	x4, #0x20
    38cc:      	b.eq	0x3438 <_stogir.verify.classifications+0xa8>
    38d0:      	cmp	x4, #0x1a
    38d4:      	b.lt	0x38e0 <_stogir.verify.classifications+0x550>
    38d8:      	cmp	x4, #0x1d
    38dc:      	b.le	0x3438 <_stogir.verify.classifications+0xa8>
    38e0:      	cmp	x4, #0x3a
    38e4:      	b.eq	0x3438 <_stogir.verify.classifications+0xa8>
    38e8:      	cmp	x4, #0x3b
    38ec:      	b.eq	0x3438 <_stogir.verify.classifications+0xa8>
    38f0:      	movz	x7, #0x0, lsl #48
    38f4:      	b	0x344c <_stogir.verify.classifications+0xbc>
    38f8:      	movz	x3, #0x0, lsl #48
    38fc:      	b	0x355c <_stogir.verify.classifications+0x1cc>
    3900:      	lsr	w1, w1, #0
    3904:      	sxtw	x1, w1
    3908:      	mov	x0, x1
    390c:      	b	0x37e4 <_stogir.verify.classifications+0x454>
    3910:      	movz	x8, #0x0, lsl #48
    3914:      	cmp	x8, #0x0
    3918:      	b.ne	0x34c8 <_stogir.verify.classifications+0x138>
    391c:      	movn	x8, #0x0, lsl #48
    3920:      	b	0x34d0 <_stogir.verify.classifications+0x140>
    3924:      	lsl	x8, x11, #4
    3928:      	ldr	x9, [x0, #0x28]
    392c:      	add	x8, x8, x9
    3930:      	b	0x3914 <_stogir.verify.classifications+0x584>
    3934:      	movz	x10, #0x0, lsl #48
    3938:      	cmp	x10, #0x0
    393c:      	b.eq	0x3910 <_stogir.verify.classifications+0x580>
    3940:      	uxtb	w16, w9
    3944:      	cmp	w16, wzr
    3948:      	b.eq	0x3924 <_stogir.verify.classifications+0x594>
    394c:      	lsl	x8, x8, #4
    3950:      	ldr	x9, [x0]
    3954:      	add	x8, x8, x9
    3958:      	b	0x3930 <_stogir.verify.classifications+0x5a0>
    395c:      	movz	x10, #0x0, lsl #48
    3960:      	b	0x3938 <_stogir.verify.classifications+0x5a8>
    3964:      	cmp	x8, #0x0
    3968:      	b.ge	0x3934 <_stogir.verify.classifications+0x5a4>
    396c:      	add	x12, x0, #0x28
    3970:      	add	x13, x0, #0x50
    3974:      	ldr	x12, [x12, #0x8]
    3978:      	ldr	x13, [x13, #0x8]
    397c:      	cmp	x12, x13
    3980:      	b.ne	0x39d8 <_stogir.verify.classifications+0x648>
    3984:      	cmp	x10, x12
    3988:      	b.gt	0x3a08 <_stogir.verify.classifications+0x678>
    398c:      	lsl	x10, x11, #2
    3990:      	ldr	x12, [x0, #0x50]
    3994:      	add	x10, x10, x12
    3998:      	ldr	w10, [x10]
    399c:      	sxtw	x10, w10
    39a0:      	cmp	x10, #0x0
    39a4:      	cset	w10, gt
    39a8:      	ubfx	x10, x10, #0, #8
    39ac:      	b	0x3a0c <_stogir.verify.classifications+0x67c>
    39b0:      	movz	x6, #0x0, lsl #48
    39b4:      	b	0x341c <_stogir.verify.classifications+0x8c>
    39b8:      	cmp	x4, #0x18
    39bc:      	b.ne	0x39c8 <_stogir.verify.classifications+0x638>
    39c0:      	mov	x5, #0x1                ; =1
    39c4:      	b	0x3550 <_stogir.verify.classifications+0x1c0>
    39c8:      	cmp	x4, #0x19
    39cc:      	b.ne	0x39e8 <_stogir.verify.classifications+0x658>
    39d0:      	mov	x5, #0x1                ; =1
    39d4:      	b	0x3550 <_stogir.verify.classifications+0x1c0>
    39d8:      	movz	x10, #0x0, lsl #48
    39dc:      	b	0x3938 <_stogir.verify.classifications+0x5a8>
    39e0:      	movz	x10, #0x0, lsl #48
    39e4:      	b	0x3960 <_stogir.verify.classifications+0x5d0>
    39e8:      	cmp	x5, #0xc
    39ec:      	b.eq	0x354c <_stogir.verify.classifications+0x1bc>
    39f0:      	cmp	x5, #0xd
    39f4:      	b.eq	0x354c <_stogir.verify.classifications+0x1bc>
    39f8:      	cmp	x8, #0xc
    39fc:      	b.ne	0x3a10 <_stogir.verify.classifications+0x680>
    3a00:      	mov	x5, #0x1                ; =1
    3a04:      	b	0x3a1c <_stogir.verify.classifications+0x68c>
    3a08:      	movz	x10, #0x0, lsl #48
    3a0c:      	b	0x39dc <_stogir.verify.classifications+0x64c>
    3a10:      	cmp	x8, #0xd
    3a14:      	cset	w5, eq
    3a18:      	ubfx	x5, x5, #0, #8
    3a1c:      	b	0x3550 <_stogir.verify.classifications+0x1c0>
    3a20:      	brk	#0
    3a24:      	b	0x3a20 <_stogir.verify.classifications+0x690>
    3a28:      	mov	x21, x3
    3a2c:      	b	0x37e8 <_stogir.verify.classifications+0x458>
    3a30:      	mov	x21, x3
    3a34:      	b	0x37e8 <_stogir.verify.classifications+0x458>

0000000000003a38 <_stogir.vector-lanes.operation?>:
    3a38:      	sxtw	x0, w0
    3a3c:      	cmp	x0, #0x3d
    3a40:      	b.lt	0x3a54 <_stogir.vector-lanes.operation?+0x1c>
    3a44:      	cmp	x0, #0x3f
    3a48:      	cset	w0, le
    3a4c:      	ubfx	x0, x0, #0, #8
    3a50:      	b	0x3a58 <_stogir.vector-lanes.operation?+0x20>
    3a54:      	movz	x0, #0x0, lsl #48
    3a58:      	ret
    3a5c:      	udf	#0x0

0000000000003a60 <_stogir.vector.validate>:
    3a60:      	sub	sp, sp, #0x120
    3a64:      	str	x29, [sp, #0x10]
    3a68:      	str	x30, [sp, #0x18]
    3a6c:      	add	x29, sp, #0x10
    3a70:      	str	x19, [sp, #0xc8]
    3a74:      	str	x20, [sp, #0xd0]
    3a78:      	str	x21, [sp, #0xd8]
    3a7c:      	str	x22, [sp, #0xe0]
    3a80:      	str	x23, [sp, #0xe8]
    3a84:      	str	x24, [sp, #0xf0]
    3a88:      	str	x25, [sp, #0xf8]
    3a8c:      	str	x26, [sp, #0x100]
    3a90:      	str	x27, [sp, #0x108]
    3a94:      	str	x28, [sp, #0x110]
    3a98:      	sub	sp, sp, #0x10
    3a9c:      	add	x19, sp, #0x10
    3aa0:      	sxtw	x3, w1
    3aa4:      	sub	sp, sp, #0x20
    3aa8:      	add	x20, sp, #0x10
    3aac:      	lsl	x4, x3, #2
    3ab0:      	cmp	x3, #0x0
    3ab4:      	cset	w5, gt
    3ab8:      	movz	x16, #0x0, lsl #48
    3abc:      	sub	x6, x16, x3
    3ac0:      	cmp	x3, #0x0
    3ac4:      	cset	w7, lt
    3ac8:      	sub	sp, sp, #0x20
    3acc:      	add	x21, sp, #0x10
    3ad0:      	sub	x9, x6, #0x1
    3ad4:      	sub	sp, sp, #0x20
    3ad8:      	add	x22, sp, #0x10
    3adc:      	lsl	x10, x9, #2
    3ae0:      	sub	sp, sp, #0x20
    3ae4:      	add	x23, sp, #0x10
    3ae8:      	sub	sp, sp, #0x20
    3aec:      	add	x24, sp, #0x10
    3af0:      	sub	sp, sp, #0x20
    3af4:      	add	x25, sp, #0x10
    3af8:      	sub	sp, sp, #0x20
    3afc:      	add	x26, sp, #0x10
    3b00:      	sub	sp, sp, #0x20
    3b04:      	add	x27, sp, #0x10
    3b08:      	sub	sp, sp, #0x20
    3b0c:      	add	x28, sp, #0x10
    3b10:      	sub	sp, sp, #0x30
    3b14:      	add	x11, sp, #0x10
    3b18:      	sub	sp, sp, #0x10
    3b1c:      	add	x12, sp, #0x10
    3b20:      	sub	sp, sp, #0x10
    3b24:      	add	x13, sp, #0x10
    3b28:      	sub	sp, sp, #0x30
    3b2c:      	add	x14, sp, #0x10
    3b30:      	sub	sp, sp, #0x10
    3b34:      	add	x15, sp, #0x10
    3b38:      	str	x21, [x29, #0x10]
    3b3c:      	sub	sp, sp, #0x10
    3b40:      	add	x21, sp, #0x10
    3b44:      	uxtb	w16, w5
    3b48:      	cmp	w16, wzr
    3b4c:      	b.eq	0x47cc <_stogir.vector.validate+0xd6c>
    3b50:      	str	x8, [x29, #0x18]
    3b54:      	ldr	x8, [x0, #0x8]
    3b58:      	cmp	x3, x8
    3b5c:      	b.ge	0x3be8 <_stogir.vector.validate+0x188>
    3b60:      	add	x8, x0, #0x78
    3b64:      	ldr	x8, [x8, #0x8]
    3b68:      	cmp	x3, x8
    3b6c:      	b.ge	0x3d3c <_stogir.vector.validate+0x2dc>
    3b70:      	ldr	x8, [x0, #0x78]
    3b74:      	add	x8, x4, x8
    3b78:      	ldr	w8, [x8]
    3b7c:      	sxtw	x8, w8
    3b80:      	cmp	x8, #0x0
    3b84:      	cset	w8, ge
    3b88:      	ubfx	x8, x8, #0, #8
    3b8c:      	b	0x3d40 <_stogir.vector.validate+0x2e0>
    3b90:      	uxtb	w16, w7
    3b94:      	cmp	w16, wzr
    3b98:      	b.eq	0x47d4 <_stogir.vector.validate+0xd74>
    3b9c:      	add	x8, x0, #0x28
    3ba0:      	str	x11, [x29, #0x20]
    3ba4:      	add	x11, x0, #0x50
    3ba8:      	ldr	x8, [x8, #0x8]
    3bac:      	ldr	x11, [x11, #0x8]
    3bb0:      	cmp	x8, x11
    3bb4:      	b.ne	0x3be0 <_stogir.vector.validate+0x180>
    3bb8:      	cmp	x6, x8
    3bbc:      	b.gt	0x3dd8 <_stogir.vector.validate+0x378>
    3bc0:      	ldr	x8, [x0, #0x50]
    3bc4:      	add	x8, x10, x8
    3bc8:      	ldr	w8, [x8]
    3bcc:      	sxtw	x8, w8
    3bd0:      	cmp	x8, #0x0
    3bd4:      	cset	w8, gt
    3bd8:      	ubfx	x8, x8, #0, #8
    3bdc:      	b	0x3ddc <_stogir.vector.validate+0x37c>
    3be0:      	movz	x8, #0x0, lsl #48
    3be4:      	b	0x3bf8 <_stogir.vector.validate+0x198>
    3be8:      	movz	x8, #0x0, lsl #48
    3bec:      	str	x11, [x29, #0x20]
    3bf0:      	b	0x3bf8 <_stogir.vector.validate+0x198>
    3bf4:      	movz	x8, #0x0, lsl #48
    3bf8:      	lsl	x11, x3, #4
    3bfc:      	lsl	x9, x9, #4
    3c00:      	cmp	x8, #0x0
    3c04:      	b.eq	0x47dc <_stogir.vector.validate+0xd7c>
    3c08:      	uxtb	w16, w5
    3c0c:      	cmp	w16, wzr
    3c10:      	b.eq	0x47e4 <_stogir.vector.validate+0xd84>
    3c14:      	ldr	x8, [x0]
    3c18:      	add	x8, x11, x8
    3c1c:      	str	x12, [x29, #0x28]
    3c20:      	ldr	x12, [x8]
    3c24:      	ldr	x8, [x8, #0x8]
    3c28:      	fmov	d31, x8
    3c2c:      	mov	x8, x12
    3c30:      	fmov	x12, d31
    3c34:      	b	0x3c54 <_stogir.vector.validate+0x1f4>
    3c38:      	ldr	x8, [x0, #0x28]
    3c3c:      	add	x8, x9, x8
    3c40:      	ldr	x12, [x8]
    3c44:      	ldr	x8, [x8, #0x8]
    3c48:      	fmov	d31, x8
    3c4c:      	mov	x8, x12
    3c50:      	fmov	x12, d31
    3c54:      	str	x13, [x29, #0x30]
    3c58:      	mov	x13, x12
    3c5c:      	mov	x12, x8
    3c60:      	mov	x8, #0x1                ; =1
    3c64:      	b	0x3c78 <_stogir.vector.validate+0x218>
    3c68:      	str	x13, [x29, #0x30]
    3c6c:      	movz	x8, #0x0, lsl #48
    3c70:      	movz	x12, #0x0, lsl #48
    3c74:      	movz	x13, #0x0, lsl #48
    3c78:      	lsr	w8, w8, #0
    3c7c:      	lsr	x16, x8, #0
    3c80:      	cmp	x16, #0x1
    3c84:      	b.eq	0x3ca0 <_stogir.vector.validate+0x240>
    3c88:      	b.lo	0x3c90 <_stogir.vector.validate+0x230>
    3c8c:      	b	0x3ca4 <_stogir.vector.validate+0x244>
    3c90:      	cmp	x16, #0x0
    3c94:      	b.eq	0x3c9c <_stogir.vector.validate+0x23c>
    3c98:      	b	0x3ca4 <_stogir.vector.validate+0x244>
    3c9c:      	b	0x3ca8 <_stogir.vector.validate+0x248>
    3ca0:      	b	0x3d0c <_stogir.vector.validate+0x2ac>
    3ca4:      	b	0x3ee0 <_stogir.vector.validate+0x480>
    3ca8:      	adrp	x16, 0x3000 <_stogir.strings.lookup+0x4>
		0000000000003ca8:  ARM64_RELOC_PAGE21	l_stogir.338
    3cac:      	ldr	x16, [x16]
		0000000000003cac:  ARM64_RELOC_PAGEOFF12	l_stogir.338
    3cb0:      	orr	x0, x16, xzr
    3cb4:      	ldr	x19, [x29, #0x18]
    3cb8:      	mov	x1, x0
    3cbc:      	mov	x0, #0x1                ; =1
    3cc0:      	mov	x2, #0x1a               ; =26
    3cc4:      	str	x0, [x19]
    3cc8:      	str	x1, [x19, #0x8]
    3ccc:      	str	x2, [x19, #0x10]
    3cd0:      	sub	sp, x29, #0x10
    3cd4:      	ldr	x19, [sp, #0xc8]
    3cd8:      	ldr	x20, [sp, #0xd0]
    3cdc:      	ldr	x21, [sp, #0xd8]
    3ce0:      	ldr	x22, [sp, #0xe0]
    3ce4:      	ldr	x23, [sp, #0xe8]
    3ce8:      	ldr	x24, [sp, #0xf0]
    3cec:      	ldr	x25, [sp, #0xf8]
    3cf0:      	ldr	x26, [sp, #0x100]
    3cf4:      	ldr	x27, [sp, #0x108]
    3cf8:      	ldr	x28, [sp, #0x110]
    3cfc:      	ldr	x29, [sp, #0x10]
    3d00:      	ldr	x30, [sp, #0x18]
    3d04:      	add	sp, sp, #0x120
    3d08:      	ret
    3d0c:      	str	x12, [x19]
    3d10:      	str	x13, [x19, #0x8]
    3d14:      	cmp	x3, #0x0
    3d18:      	b.gt	0x3d44 <_stogir.vector.validate+0x2e4>
    3d1c:      	adrp	x16, 0x3000 <_stogir.strings.lookup+0x4>
		0000000000003d1c:  ARM64_RELOC_PAGE21	l_stogir.339
    3d20:      	ldr	x16, [x16]
		0000000000003d20:  ARM64_RELOC_PAGEOFF12	l_stogir.339
    3d24:      	orr	x0, x16, xzr
    3d28:      	ldr	x19, [x29, #0x18]
    3d2c:      	mov	x1, x0
    3d30:      	mov	x0, #0x1                ; =1
    3d34:      	mov	x2, #0x3b               ; =59
    3d38:      	b	0x3cc4 <_stogir.vector.validate+0x264>
    3d3c:      	movz	x8, #0x0, lsl #48
    3d40:      	b	0x3bec <_stogir.vector.validate+0x18c>
    3d44:      	lsr	w1, w1, #0
    3d48:      	ldr	w8, [x19]
    3d4c:      	uxtb	w12, w8
    3d50:      	ldr	x13, [x0, #0x78]
    3d54:      	str	w1, [x29, #0x38]
    3d58:      	cmp	x12, #0x44
    3d5c:      	cset	w1, eq
    3d60:      	add	x13, x4, x13
    3d64:      	ldr	w13, [x13]
    3d68:      	cmp	x12, #0x24
    3d6c:      	b.ne	0x3de0 <_stogir.vector.validate+0x380>
    3d70:      	ldr	x19, [x29, #0x18]
    3d74:      	mov	w26, w2
    3d78:      	uxtb	w16, w1
    3d7c:      	cmp	w16, wzr
    3d80:      	b.eq	0x3da0 <_stogir.vector.validate+0x340>
    3d84:      	mov	x8, x20
    3d88:      	ldr	w1, [x29, #0x38]
    3d8c:      	bl	0x3d8c <_stogir.vector.validate+0x32c>
		0000000000003d8c:  ARM64_RELOC_BRANCH26	_stogir.copy.validate
    3d90:      	ldr	x0, [x20]
    3d94:      	ldr	x1, [x20, #0x8]
    3d98:      	ldr	x2, [x20, #0x10]
    3d9c:      	b	0x3dd4 <_stogir.vector.validate+0x374>
    3da0:      	lsr	w26, w26, #0
    3da4:      	ldr	x8, [x29, #0x10]
    3da8:      	ldr	w1, [x29, #0x38]
    3dac:      	mov	w2, w26
    3db0:      	bl	0x3db0 <_stogir.vector.validate+0x350>
		0000000000003db0:  ARM64_RELOC_BRANCH26	_stogir.conversion.validate
    3db4:      	ldr	x0, [x29, #0x10]
    3db8:      	ldr	x1, [x0]
    3dbc:      	ldr	x2, [x0, #0x8]
    3dc0:      	ldr	x0, [x0, #0x10]
    3dc4:      	fmov	d31, x0
    3dc8:      	mov	x0, x1
    3dcc:      	mov	x1, x2
    3dd0:      	fmov	x2, d31
    3dd4:      	b	0x3d38 <_stogir.vector.validate+0x2d8>
    3dd8:      	movz	x8, #0x0, lsl #48
    3ddc:      	b	0x3be4 <_stogir.vector.validate+0x184>
    3de0:      	uxtb	w16, w1
    3de4:      	cmp	w16, wzr
    3de8:      	b.ne	0x47ec <_stogir.vector.validate+0xd8c>
    3dec:      	cmp	x12, #0x3c
    3df0:      	b.ne	0x47f8 <_stogir.vector.validate+0xd98>
    3df4:      	mov	x8, x22
    3df8:      	ldr	w1, [x29, #0x38]
    3dfc:      	ldr	x20, [x29, #0x18]
    3e00:      	bl	0x3e00 <_stogir.vector.validate+0x3a0>
		0000000000003e00:  ARM64_RELOC_BRANCH26	_stogir.conditional.validate
    3e04:      	ldr	x0, [x22]
    3e08:      	ldr	x1, [x22, #0x8]
    3e0c:      	ldr	x2, [x22, #0x10]
    3e10:      	str	x20, [x29, #0x18]
    3e14:      	ldr	x19, [x29, #0x18]
    3e18:      	b	0x3dd4 <_stogir.vector.validate+0x374>
    3e1c:      	cmp	x12, #0x3d
    3e20:      	b.lt	0x3e8c <_stogir.vector.validate+0x42c>
    3e24:      	cmp	x12, #0x3f
    3e28:      	b.gt	0x3e8c <_stogir.vector.validate+0x42c>
    3e2c:      	lsr	w2, w2, #0
    3e30:      	mov	x8, x23
    3e34:      	ldr	w1, [x29, #0x38]
    3e38:      	bl	0x3e38 <_stogir.vector.validate+0x3d8>
		0000000000003e38:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.validate
    3e3c:      	ldr	x0, [x23]
    3e40:      	ldr	x1, [x23, #0x8]
    3e44:      	ldr	x2, [x23, #0x10]
    3e48:      	str	x20, [x29, #0x18]
    3e4c:      	b	0x3e88 <_stogir.vector.validate+0x428>
    3e50:      	lsr	w26, w26, #0
    3e54:      	ldr	x8, [x29, #0x40]
    3e58:      	mov	x0, x20
    3e5c:      	ldr	w1, [x29, #0x38]
    3e60:      	mov	w2, w26
    3e64:      	bl	0x3e64 <_stogir.vector.validate+0x404>
		0000000000003e64:  ARM64_RELOC_BRANCH26	_stogir.locals.validate
    3e68:      	ldr	x0, [x29, #0x40]
    3e6c:      	ldr	x1, [x0]
    3e70:      	ldr	x2, [x0, #0x8]
    3e74:      	ldr	x0, [x0, #0x10]
    3e78:      	fmov	d31, x0
    3e7c:      	mov	x0, x1
    3e80:      	mov	x1, x2
    3e84:      	fmov	x2, d31
    3e88:      	b	0x3e14 <_stogir.vector.validate+0x3b4>
    3e8c:      	mov	x1, sp
    3e90:      	sub	sp, sp, #0x10
    3e94:      	add	x22, sp, #0x10
    3e98:      	uxtb	w16, w5
    3e9c:      	cmp	w16, wzr
    3ea0:      	b.eq	0x3ee8 <_stogir.vector.validate+0x488>
    3ea4:      	ldr	x6, [x0, #0x8]
    3ea8:      	cmp	x3, x6
    3eac:      	b.ge	0x3ffc <_stogir.vector.validate+0x59c>
    3eb0:      	add	x6, x0, #0x78
    3eb4:      	ldr	x6, [x6, #0x8]
    3eb8:      	cmp	x3, x6
    3ebc:      	b.ge	0x410c <_stogir.vector.validate+0x6ac>
    3ec0:      	ldr	x3, [x0, #0x78]
    3ec4:      	add	x3, x4, x3
    3ec8:      	ldr	w3, [x3]
    3ecc:      	sxtw	x3, w3
    3ed0:      	cmp	x3, #0x0
    3ed4:      	cset	w3, ge
    3ed8:      	ubfx	x3, x3, #0, #8
    3edc:      	b	0x4110 <_stogir.vector.validate+0x6b0>
    3ee0:      	brk	#0
    3ee4:      	b	0x3ee0 <_stogir.vector.validate+0x480>
    3ee8:      	uxtb	w16, w7
    3eec:      	cmp	w16, wzr
    3ef0:      	b.eq	0x4004 <_stogir.vector.validate+0x5a4>
    3ef4:      	add	x3, x0, #0x28
    3ef8:      	add	x4, x0, #0x50
    3efc:      	ldr	x3, [x3, #0x8]
    3f00:      	ldr	x4, [x4, #0x8]
    3f04:      	cmp	x3, x4
    3f08:      	b.ne	0x4104 <_stogir.vector.validate+0x6a4>
    3f0c:      	cmp	x6, x3
    3f10:      	b.gt	0x4194 <_stogir.vector.validate+0x734>
    3f14:      	ldr	x3, [x0, #0x50]
    3f18:      	add	x3, x10, x3
    3f1c:      	ldr	w3, [x3]
    3f20:      	sxtw	x3, w3
    3f24:      	cmp	x3, #0x0
    3f28:      	cset	w3, gt
    3f2c:      	ubfx	x3, x3, #0, #8
    3f30:      	b	0x4198 <_stogir.vector.validate+0x738>
    3f34:      	movz	x3, #0x0, lsl #48
    3f38:      	mov	sp, x1
    3f3c:      	cmp	x3, #0x0
    3f40:      	b.eq	0x3f68 <_stogir.vector.validate+0x508>
    3f44:      	lsr	w2, w2, #0
    3f48:      	mov	x8, x24
    3f4c:      	ldr	w1, [x29, #0x38]
    3f50:      	bl	0x3f50 <_stogir.vector.validate+0x4f0>
		0000000000003f50:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.validate
    3f54:      	ldr	x0, [x24]
    3f58:      	ldr	x1, [x24, #0x8]
    3f5c:      	ldr	x2, [x24, #0x10]
    3f60:      	str	x20, [x29, #0x18]
    3f64:      	b	0x3e88 <_stogir.vector.validate+0x428>
    3f68:      	cmp	x12, #0x41
    3f6c:      	cset	w22, eq
    3f70:      	cmp	x12, #0x48
    3f74:      	cset	w23, eq
    3f78:      	cmp	x12, #0x55
    3f7c:      	cset	w24, ge
    3f80:      	cmp	x12, #0x58
    3f84:      	cset	w1, le
    3f88:      	cmp	x12, #0x47
    3f8c:      	b.ne	0x4114 <_stogir.vector.validate+0x6b4>
    3f90:      	str	x20, [x29, #0x18]
    3f94:      	mov	x20, x0
    3f98:      	str	x25, [x29, #0x60]
    3f9c:      	str	x26, [x29, #0x40]
    3fa0:      	mov	w26, w2
    3fa4:      	str	w22, [x29, #0x58]
    3fa8:      	str	w23, [x29, #0x50]
    3fac:      	str	w24, [x29, #0x48]
    3fb0:      	str	w1, [x29, #0x80]
    3fb4:      	mov	x0, x20
    3fb8:      	ldr	w1, [x29, #0x38]
    3fbc:      	bl	0x3fbc <_stogir.vector.validate+0x55c>
		0000000000003fbc:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.node?
    3fc0:      	cmp	x0, #0x0
    3fc4:      	b.eq	0x4144 <_stogir.vector.validate+0x6e4>
    3fc8:      	ldr	x8, [x29, #0x60]
    3fcc:      	mov	x0, x20
    3fd0:      	ldr	w1, [x29, #0x38]
    3fd4:      	bl	0x3fd4 <_stogir.vector.validate+0x574>
		0000000000003fd4:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.validate
    3fd8:      	ldr	x0, [x29, #0x60]
    3fdc:      	ldr	x1, [x0]
    3fe0:      	ldr	x2, [x0, #0x8]
    3fe4:      	ldr	x0, [x0, #0x10]
    3fe8:      	fmov	d31, x0
    3fec:      	mov	x0, x1
    3ff0:      	mov	x1, x2
    3ff4:      	fmov	x2, d31
    3ff8:      	b	0x3e88 <_stogir.vector.validate+0x428>
    3ffc:      	movz	x3, #0x0, lsl #48
    4000:      	b	0x4008 <_stogir.vector.validate+0x5a8>
    4004:      	movz	x3, #0x0, lsl #48
    4008:      	cmp	x3, #0x0
    400c:      	b.eq	0x4068 <_stogir.vector.validate+0x608>
    4010:      	uxtb	w16, w5
    4014:      	cmp	w16, wzr
    4018:      	b.eq	0x403c <_stogir.vector.validate+0x5dc>
    401c:      	ldr	x3, [x0]
    4020:      	add	x3, x11, x3
    4024:      	ldr	x4, [x3]
    4028:      	ldr	x3, [x3, #0x8]
    402c:      	fmov	d31, x3
    4030:      	mov	x3, x4
    4034:      	fmov	x4, d31
    4038:      	b	0x4058 <_stogir.vector.validate+0x5f8>
    403c:      	ldr	x3, [x0, #0x28]
    4040:      	add	x3, x9, x3
    4044:      	ldr	x4, [x3]
    4048:      	ldr	x3, [x3, #0x8]
    404c:      	fmov	d31, x3
    4050:      	mov	x3, x4
    4054:      	fmov	x4, d31
    4058:      	mov	x5, x4
    405c:      	mov	x4, x3
    4060:      	mov	x3, #0x1                ; =1
    4064:      	b	0x4074 <_stogir.vector.validate+0x614>
    4068:      	movz	x3, #0x0, lsl #48
    406c:      	movz	x4, #0x0, lsl #48
    4070:      	movz	x5, #0x0, lsl #48
    4074:      	lsr	w3, w3, #0
    4078:      	lsr	x16, x3, #0
    407c:      	cmp	x16, #0x1
    4080:      	b.eq	0x409c <_stogir.vector.validate+0x63c>
    4084:      	b.lo	0x408c <_stogir.vector.validate+0x62c>
    4088:      	b	0x40a0 <_stogir.vector.validate+0x640>
    408c:      	cmp	x16, #0x0
    4090:      	b.eq	0x4098 <_stogir.vector.validate+0x638>
    4094:      	b	0x40a0 <_stogir.vector.validate+0x640>
    4098:      	b	0x40a4 <_stogir.vector.validate+0x644>
    409c:      	b	0x40ac <_stogir.vector.validate+0x64c>
    40a0:      	b	0x4338 <_stogir.vector.validate+0x8d8>
    40a4:      	movz	x3, #0x0, lsl #48
    40a8:      	b	0x3f38 <_stogir.vector.validate+0x4d8>
    40ac:      	uxtb	w3, w4
    40b0:      	str	x4, [x22]
    40b4:      	str	x5, [x22, #0x8]
    40b8:      	cmp	x3, #0xe
    40bc:      	b.lt	0x3f34 <_stogir.vector.validate+0x4d4>
    40c0:      	cmp	x3, #0x19
    40c4:      	b.gt	0x3f34 <_stogir.vector.validate+0x4d4>
    40c8:      	lsr	w4, w4, #0
    40cc:      	ubfx	x3, x4, #8, #8
    40d0:      	cmp	x3, #0xf
    40d4:      	b.le	0x419c <_stogir.vector.validate+0x73c>
    40d8:      	cmp	x3, #0x80
    40dc:      	b.ge	0x41dc <_stogir.vector.validate+0x77c>
    40e0:      	and	x3, x3, #0xf
    40e4:      	lsr	w3, w3, #0
    40e8:      	sxtw	x3, w3
    40ec:      	cmp	x3, #0x1
    40f0:      	b.lt	0x41e4 <_stogir.vector.validate+0x784>
    40f4:      	cmp	x3, #0xd
    40f8:      	cset	w3, le
    40fc:      	ubfx	x3, x3, #0, #8
    4100:      	b	0x41e8 <_stogir.vector.validate+0x788>
    4104:      	movz	x3, #0x0, lsl #48
    4108:      	b	0x4008 <_stogir.vector.validate+0x5a8>
    410c:      	movz	x3, #0x0, lsl #48
    4110:      	b	0x4000 <_stogir.vector.validate+0x5a0>
    4114:      	cmp	x12, #0x4f
    4118:      	b.ne	0x41a4 <_stogir.vector.validate+0x744>
    411c:      	str	x20, [x29, #0x18]
    4120:      	mov	x20, x0
    4124:      	str	x25, [x29, #0x60]
    4128:      	str	x26, [x29, #0x40]
    412c:      	mov	w26, w2
    4130:      	str	w22, [x29, #0x58]
    4134:      	str	w23, [x29, #0x50]
    4138:      	str	w24, [x29, #0x48]
    413c:      	str	w1, [x29, #0x80]
    4140:      	b	0x3fb4 <_stogir.vector.validate+0x554>
    4144:      	ldr	w0, [x29, #0x58]
    4148:      	uxtb	w16, w0
    414c:      	cmp	w16, wzr
    4150:      	b.ne	0x3e50 <_stogir.vector.validate+0x3f0>
    4154:      	ldr	w0, [x29, #0x50]
    4158:      	uxtb	w16, w0
    415c:      	cmp	w16, wzr
    4160:      	b.ne	0x3e50 <_stogir.vector.validate+0x3f0>
    4164:      	ldr	w0, [x29, #0x48]
    4168:      	uxtb	w16, w0
    416c:      	cmp	w16, wzr
    4170:      	b.eq	0x4184 <_stogir.vector.validate+0x724>
    4174:      	ldr	w0, [x29, #0x80]
    4178:      	uxtb	w16, w0
    417c:      	cmp	w16, wzr
    4180:      	b.ne	0x3e50 <_stogir.vector.validate+0x3f0>
    4184:      	movz	x0, #0x0, lsl #48
    4188:      	movz	x1, #0x0, lsl #48
    418c:      	movz	x2, #0x0, lsl #48
    4190:      	b	0x3e88 <_stogir.vector.validate+0x428>
    4194:      	movz	x3, #0x0, lsl #48
    4198:      	b	0x4108 <_stogir.vector.validate+0x6a8>
    419c:      	movz	x3, #0x0, lsl #48
    41a0:      	b	0x3f38 <_stogir.vector.validate+0x4d8>
    41a4:      	cmp	x12, #0x50
    41a8:      	b.eq	0x4800 <_stogir.vector.validate+0xda0>
    41ac:      	cmp	x12, #0x78
    41b0:      	b.ne	0x41ec <_stogir.vector.validate+0x78c>
    41b4:      	str	x20, [x29, #0x18]
    41b8:      	mov	x20, x0
    41bc:      	str	x25, [x29, #0x60]
    41c0:      	str	x26, [x29, #0x40]
    41c4:      	mov	w26, w2
    41c8:      	str	w22, [x29, #0x58]
    41cc:      	str	w23, [x29, #0x50]
    41d0:      	str	w24, [x29, #0x48]
    41d4:      	str	w1, [x29, #0x80]
    41d8:      	b	0x3fb4 <_stogir.vector.validate+0x554>
    41dc:      	movz	x3, #0x0, lsl #48
    41e0:      	b	0x41a0 <_stogir.vector.validate+0x740>
    41e4:      	movz	x3, #0x0, lsl #48
    41e8:      	b	0x41e0 <_stogir.vector.validate+0x780>
    41ec:      	uxtb	w16, w22
    41f0:      	cmp	w16, wzr
    41f4:      	b.ne	0x4310 <_stogir.vector.validate+0x8b0>
    41f8:      	uxtb	w16, w23
    41fc:      	cmp	w16, wzr
    4200:      	b.ne	0x4310 <_stogir.vector.validate+0x8b0>
    4204:      	uxtb	w16, w24
    4208:      	cmp	w16, wzr
    420c:      	b.eq	0x421c <_stogir.vector.validate+0x7bc>
    4210:      	uxtb	w16, w1
    4214:      	cmp	w16, wzr
    4218:      	b.ne	0x4310 <_stogir.vector.validate+0x8b0>
    421c:      	str	w1, [x29, #0x80]
    4220:      	ldr	w1, [x29, #0x38]
    4224:      	str	x20, [x29, #0x18]
    4228:      	mov	x20, x0
    422c:      	str	x26, [x29, #0x40]
    4230:      	mov	w26, w2
    4234:      	str	w24, [x29, #0x48]
    4238:      	ldr	x24, [x29, #0x20]
    423c:      	str	w23, [x29, #0x50]
    4240:      	ldr	x23, [x29, #0x28]
    4244:      	str	w22, [x29, #0x58]
    4248:      	mov	x22, x12
    424c:      	str	x25, [x29, #0x60]
    4250:      	mov	x25, x14
    4254:      	str	x27, [x29, #0x68]
    4258:      	mov	x27, x15
    425c:      	str	x28, [x29, #0x70]
    4260:      	mov	w28, w8
    4264:      	str	x21, [x29, #0x78]
    4268:      	mov	w21, w13
    426c:      	bl	0x426c <_stogir.vector.validate+0x80c>
		000000000000426c:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.node?
    4270:      	cmp	x0, #0x0
    4274:      	b.ne	0x3fb4 <_stogir.vector.validate+0x554>
    4278:      	sxtw	x21, w21
    427c:      	ubfx	x0, x28, #8, #8
    4280:      	orr	x1, x0, xzr
    4284:      	lsr	w28, w1, #0
    4288:      	cmp	x22, #0x5b
    428c:      	b.eq	0x4340 <_stogir.vector.validate+0x8e0>
    4290:      	cmp	x22, #0x5c
    4294:      	b.eq	0x4340 <_stogir.vector.validate+0x8e0>
    4298:      	cmp	x22, #0x5d
    429c:      	b.ne	0x43d4 <_stogir.vector.validate+0x974>
    42a0:      	mov	x22, x0
    42a4:      	cmp	x21, #0x3
    42a8:      	b.ne	0x43b8 <_stogir.vector.validate+0x958>
    42ac:      	cmp	x22, #0x0
    42b0:      	b.ne	0x43b8 <_stogir.vector.validate+0x958>
    42b4:      	lsr	w26, w26, #0
    42b8:      	ldr	w0, [x19, #0x4]
    42bc:      	ldr	w1, [x19, #0x8]
    42c0:      	lsr	w0, w0, #0
    42c4:      	ldr	w2, [x19, #0xc]
    42c8:      	lsr	w1, w1, #0
    42cc:      	lsr	w2, w2, #0
    42d0:      	ldr	x8, [x29, #0x70]
    42d4:      	mov	w3, w1
    42d8:      	mov	w1, w26
    42dc:      	mov	w4, w2
    42e0:      	mov	w2, w0
    42e4:      	mov	x0, x20
    42e8:      	bl	0x42e8 <_stogir.vector.validate+0x888>
		00000000000042e8:  ARM64_RELOC_BRANCH26	_stogir.vector.store-inputs
    42ec:      	ldr	x0, [x29, #0x70]
    42f0:      	ldr	x1, [x0]
    42f4:      	ldr	x2, [x0, #0x8]
    42f8:      	ldr	x0, [x0, #0x10]
    42fc:      	fmov	d31, x0
    4300:      	mov	x0, x1
    4304:      	mov	x1, x2
    4308:      	fmov	x2, d31
    430c:      	b	0x43d0 <_stogir.vector.validate+0x970>
    4310:      	str	x20, [x29, #0x18]
    4314:      	mov	x20, x0
    4318:      	str	x25, [x29, #0x60]
    431c:      	str	x26, [x29, #0x40]
    4320:      	mov	w26, w2
    4324:      	str	w22, [x29, #0x58]
    4328:      	str	w23, [x29, #0x50]
    432c:      	str	w24, [x29, #0x48]
    4330:      	str	w1, [x29, #0x80]
    4334:      	b	0x3fb4 <_stogir.vector.validate+0x554>
    4338:      	brk	#0
    433c:      	b	0x4338 <_stogir.vector.validate+0x8d8>
    4340:      	cmp	x21, #0x2
    4344:      	b.ne	0x439c <_stogir.vector.validate+0x93c>
    4348:      	lsr	w26, w26, #0
    434c:      	ldr	w0, [x19, #0x4]
    4350:      	ldr	w1, [x19, #0x8]
    4354:      	lsr	w0, w0, #0
    4358:      	lsr	w1, w1, #0
    435c:      	ldr	x8, [x29, #0x68]
    4360:      	mov	w2, w26
    4364:      	mov	w3, w0
    4368:      	mov	x0, x20
    436c:      	mov	w4, w1
    4370:      	mov	w1, w28
    4374:      	bl	0x4374 <_stogir.vector.validate+0x914>
		0000000000004374:  ARM64_RELOC_BRANCH26	_stogir.vector.memory-inputs
    4378:      	ldr	x0, [x29, #0x68]
    437c:      	ldr	x1, [x0]
    4380:      	ldr	x2, [x0, #0x8]
    4384:      	ldr	x0, [x0, #0x10]
    4388:      	fmov	d31, x0
    438c:      	mov	x0, x1
    4390:      	mov	x1, x2
    4394:      	fmov	x2, d31
    4398:      	b	0x3e88 <_stogir.vector.validate+0x428>
    439c:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x5a0>
		000000000000439c:  ARM64_RELOC_PAGE21	l_stogir.340
    43a0:      	ldr	x16, [x16]
		00000000000043a0:  ARM64_RELOC_PAGEOFF12	l_stogir.340
    43a4:      	orr	x0, x16, xzr
    43a8:      	mov	x1, x0
    43ac:      	mov	x0, #0x1                ; =1
    43b0:      	mov	x2, #0x19               ; =25
    43b4:      	b	0x4398 <_stogir.vector.validate+0x938>
    43b8:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x5a0>
		00000000000043b8:  ARM64_RELOC_PAGE21	l_stogir.341
    43bc:      	ldr	x16, [x16]
		00000000000043bc:  ARM64_RELOC_PAGEOFF12	l_stogir.341
    43c0:      	orr	x0, x16, xzr
    43c4:      	mov	x1, x0
    43c8:      	mov	x0, #0x1                ; =1
    43cc:      	mov	x2, #0x1a               ; =26
    43d0:      	b	0x4398 <_stogir.vector.validate+0x938>
    43d4:      	cmp	x22, #0x5e
    43d8:      	b.eq	0x4828 <_stogir.vector.validate+0xdc8>
    43dc:      	cmp	x22, #0x43
    43e0:      	b.ne	0x4468 <_stogir.vector.validate+0xa08>
    43e4:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x5a0>
		00000000000043e4:  ARM64_RELOC_PAGE21	l_stogir.342
    43e8:      	ldr	x16, [x16]
		00000000000043e8:  ARM64_RELOC_PAGEOFF12	l_stogir.342
    43ec:      	orr	x22, x16, xzr
    43f0:      	cmp	x0, #0xf
    43f4:      	b.le	0x4830 <_stogir.vector.validate+0xdd0>
    43f8:      	cmp	x0, #0x80
    43fc:      	b.ge	0x483c <_stogir.vector.validate+0xddc>
    4400:      	and	x1, x0, #0xf
    4404:      	lsr	w1, w1, #0
    4408:      	sxtw	x1, w1
    440c:      	cmp	x1, #0x1
    4410:      	b.lt	0x4848 <_stogir.vector.validate+0xde8>
    4414:      	cmp	x1, #0xd
    4418:      	b.gt	0x4854 <_stogir.vector.validate+0xdf4>
    441c:      	lsr	w26, w26, #0
    4420:      	mov	w1, w26
    4424:      	str	x22, [x29, #0x88]
    4428:      	mov	x22, x0
    442c:      	mov	w0, w28
    4430:      	bl	0x4430 <_stogir.vector.validate+0x9d0>
		0000000000004430:  ARM64_RELOC_BRANCH26	_stogir.types.size
    4434:      	lsr	w0, w0, #0
    4438:      	sxtw	x0, w0
    443c:      	cmp	x0, #0x0
    4440:      	b.le	0x4688 <_stogir.vector.validate+0xc28>
    4444:      	cmp	x21, #0x3
    4448:      	b.lt	0x4688 <_stogir.vector.validate+0xc28>
    444c:      	ldr	x0, [x29, #0x88]
    4450:      	movz	x1, #0x0, lsl #48
    4454:      	b	0x4698 <_stogir.vector.validate+0xc38>
    4458:      	ldr	x1, [x29, #0xa8]
    445c:      	ldr	x2, [x29, #0xb0]
    4460:      	mov	x0, #0x1                ; =1
    4464:      	b	0x43d0 <_stogir.vector.validate+0x970>
    4468:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x5a0>
		0000000000004468:  ARM64_RELOC_PAGE21	l_stogir.343
    446c:      	ldr	x16, [x16]
		000000000000446c:  ARM64_RELOC_PAGEOFF12	l_stogir.343
    4470:      	orr	x0, x16, xzr
    4474:      	mov	x1, x0
    4478:      	mov	x0, #0x1                ; =1
    447c:      	mov	x2, #0x28               ; =40
    4480:      	b	0x4464 <_stogir.vector.validate+0xa04>
    4484:      	ldr	x0, [x25, #0x8]
    4488:      	str	x0, [x27]
    448c:      	ldr	x0, [x24, #0x8]
    4490:      	str	x0, [x27, #0x8]
    4494:      	mov	x0, x27
    4498:      	bl	0x4498 <_stogir.vector.validate+0xa38>
		0000000000004498:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    449c:      	uxtb	w0, w0
    44a0:      	cmp	x0, x22
    44a4:      	b.ne	0x472c <_stogir.vector.validate+0xccc>
    44a8:      	ldr	x0, [x29, #0xa8]
    44ac:      	ldr	x1, [x29, #0xb0]
    44b0:      	b	0x44c8 <_stogir.vector.validate+0xa68>
    44b4:      	nop
    44b8:      	str	x4, [x29, #0x30]
    44bc:      	str	x0, [x29, #0x78]
    44c0:      	ldr	x0, [x29, #0xa0]
    44c4:      	mov	x1, #0x18               ; =24
    44c8:      	add	x2, x19, #0x1
    44cc:      	lsr	w2, w2, #0
    44d0:      	sxtw	x2, w2
    44d4:      	ldr	x19, [x29, #0xa0]
    44d8:      	fmov	d31, x0
    44dc:      	mov	x0, x2
    44e0:      	mov	x2, x1
    44e4:      	fmov	x1, d31
    44e8:      	cmp	x2, #0x0
    44ec:      	b.ne	0x4860 <_stogir.vector.validate+0xe00>
    44f0:      	cmp	x2, #0x0
    44f4:      	b.ne	0x45d8 <_stogir.vector.validate+0xb78>
    44f8:      	str	x19, [x29, #0xa0]
    44fc:      	mov	x19, x0
    4500:      	str	x1, [x29, #0xa8]
    4504:      	str	x2, [x29, #0xb0]
    4508:      	cmp	x19, x21
    450c:      	b.gt	0x460c <_stogir.vector.validate+0xbac>
    4510:      	lsr	w0, w19, #0
    4514:      	ldr	x16, [x29, #0x78]
    4518:      	str	x16, [sp]
    451c:      	ldr	w1, [x29, #0x38]
    4520:      	mov	w2, w0
    4524:      	mov	x0, x20
    4528:      	bl	0x4528 <_stogir.vector.validate+0xac8>
		0000000000004528:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    452c:      	ldr	x16, [sp]
    4530:      	str	x0, [x16]
    4534:      	str	x1, [x16, #0x8]
    4538:      	ldr	x0, [x29, #0x78]
    453c:      	ldr	x1, [x0]
    4540:      	ldr	x2, [x0, #0x8]
    4544:      	lsr	w3, w1, #0
    4548:      	ldr	x4, [x29, #0x30]
    454c:      	str	x1, [x4]
    4550:      	str	x2, [x4, #0x8]
    4554:      	lsr	x16, x3, #0
    4558:      	cmp	x16, #0x1
    455c:      	b.eq	0x4578 <_stogir.vector.validate+0xb18>
    4560:      	b.lo	0x4568 <_stogir.vector.validate+0xb08>
    4564:      	b	0x457c <_stogir.vector.validate+0xb1c>
    4568:      	cmp	x16, #0x0
    456c:      	b.eq	0x4574 <_stogir.vector.validate+0xb14>
    4570:      	b	0x457c <_stogir.vector.validate+0xb1c>
    4574:      	b	0x44b8 <_stogir.vector.validate+0xa58>
    4578:      	b	0x4580 <_stogir.vector.validate+0xb20>
    457c:      	b	0x47b4 <_stogir.vector.validate+0xd54>
    4580:      	ldr	w1, [x4, #0x8]
    4584:      	lsr	w1, w1, #0
    4588:      	mov	x8, x25
    458c:      	str	x0, [x29, #0x78]
    4590:      	mov	x0, x20
    4594:      	str	x4, [x29, #0x30]
    4598:      	bl	0x4598 <_stogir.vector.validate+0xb38>
		0000000000004598:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    459c:      	ldr	w0, [x25]
    45a0:      	lsr	x16, x0, #0
    45a4:      	cmp	x16, #0x1
    45a8:      	b.eq	0x45c4 <_stogir.vector.validate+0xb64>
    45ac:      	b.lo	0x45b4 <_stogir.vector.validate+0xb54>
    45b0:      	b	0x45c8 <_stogir.vector.validate+0xb68>
    45b4:      	cmp	x16, #0x0
    45b8:      	b.eq	0x45c0 <_stogir.vector.validate+0xb60>
    45bc:      	b	0x45c8 <_stogir.vector.validate+0xb68>
    45c0:      	b	0x45cc <_stogir.vector.validate+0xb6c>
    45c4:      	b	0x4484 <_stogir.vector.validate+0xa24>
    45c8:      	b	0x47bc <_stogir.vector.validate+0xd5c>
    45cc:      	ldr	x0, [x29, #0xa0]
    45d0:      	mov	x1, #0x18               ; =24
    45d4:      	b	0x44b0 <_stogir.vector.validate+0xa50>
    45d8:      	lsr	x3, x2, #0
    45dc:      	str	x1, [x29, #0xa8]
    45e0:      	str	x2, [x29, #0xb0]
    45e4:      	mov	x2, x3
    45e8:      	str	x19, [x29, #0xa0]
    45ec:      	mov	x19, x0
    45f0:      	mov	x0, x1
    45f4:      	ldr	x1, [x29, #0x88]
    45f8:      	bl	0x45f8 <_stogir.vector.validate+0xb98>
		00000000000045f8:  ARM64_RELOC_BRANCH26	_memcmp
    45fc:      	lsr	w0, w0, #0
    4600:      	sxtw	x0, w0
    4604:      	cmp	x0, #0x0
    4608:      	b.eq	0x4508 <_stogir.vector.validate+0xaa8>
    460c:      	ldr	x0, [x29, #0xa8]
    4610:      	ldr	x1, [x29, #0xb0]
    4614:      	ldr	x2, [x29, #0x88]
    4618:      	movz	x3, #0x0, lsl #48
    461c:      	bl	0x461c <_stogir.vector.validate+0xbbc>
		000000000000461c:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
    4620:      	cmp	x0, #0x0
    4624:      	b.eq	0x4458 <_stogir.vector.validate+0x9f8>
    4628:      	lsr	w26, w26, #0
    462c:      	mov	w0, w28
    4630:      	mov	w1, w26
    4634:      	bl	0x4634 <_stogir.vector.validate+0xbd4>
		0000000000004634:  ARM64_RELOC_BRANCH26	_stogir.types.size
    4638:      	lsr	w0, w0, #0
    463c:      	sxtw	x0, w0
    4640:      	and	x0, x0, #0xffffffff
    4644:      	mov	x1, x0
    4648:      	movz	x0, #0x0, lsl #48
    464c:      	movz	x2, #0x0, lsl #48
    4650:      	b	0x4464 <_stogir.vector.validate+0xa04>
    4654:      	mov	x0, x1
    4658:      	ldr	x1, [x29, #0x98]
    465c:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x5a0>
		000000000000465c:  ARM64_RELOC_PAGE21	l_stogir.344
    4660:      	ldr	x16, [x16]
		0000000000004660:  ARM64_RELOC_PAGEOFF12	l_stogir.344
    4664:      	orr	x19, x16, xzr
    4668:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x5a0>
		0000000000004668:  ARM64_RELOC_PAGE21	l_stogir.345
    466c:      	ldr	x16, [x16]
		000000000000466c:  ARM64_RELOC_PAGEOFF12	l_stogir.345
    4670:      	orr	x23, x16, xzr
    4674:      	add	x24, x25, #0x8
    4678:      	mov	x2, x1
    467c:      	mov	x1, x0
    4680:      	mov	x0, #0x2                ; =2
    4684:      	b	0x44e8 <_stogir.vector.validate+0xa88>
    4688:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x5a0>
		0000000000004688:  ARM64_RELOC_PAGE21	l_stogir.346
    468c:      	ldr	x16, [x16]
		000000000000468c:  ARM64_RELOC_PAGEOFF12	l_stogir.346
    4690:      	orr	x0, x16, xzr
    4694:      	mov	x1, #0x20               ; =32
    4698:      	ldr	w2, [x19, #0x4]
    469c:      	lsr	w2, w2, #0
    46a0:      	mov	x8, x24
    46a4:      	str	x0, [x29, #0x90]
    46a8:      	mov	x0, x20
    46ac:      	str	x1, [x29, #0x98]
    46b0:      	mov	w1, w2
    46b4:      	bl	0x46b4 <_stogir.vector.validate+0xc54>
		00000000000046b4:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    46b8:      	ldr	w0, [x24]
    46bc:      	lsr	x16, x0, #0
    46c0:      	cmp	x16, #0x1
    46c4:      	b.eq	0x46e0 <_stogir.vector.validate+0xc80>
    46c8:      	b.lo	0x46d0 <_stogir.vector.validate+0xc70>
    46cc:      	b	0x46e4 <_stogir.vector.validate+0xc84>
    46d0:      	cmp	x16, #0x0
    46d4:      	b.eq	0x46dc <_stogir.vector.validate+0xc7c>
    46d8:      	b	0x46e4 <_stogir.vector.validate+0xc84>
    46dc:      	b	0x46e8 <_stogir.vector.validate+0xc88>
    46e0:      	b	0x46fc <_stogir.vector.validate+0xc9c>
    46e4:      	b	0x47c4 <_stogir.vector.validate+0xd64>
    46e8:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x5a0>
		00000000000046e8:  ARM64_RELOC_PAGE21	l_stogir.347
    46ec:      	ldr	x16, [x16]
		00000000000046ec:  ARM64_RELOC_PAGEOFF12	l_stogir.347
    46f0:      	orr	x0, x16, xzr
    46f4:      	mov	x1, #0x19               ; =25
    46f8:      	b	0x465c <_stogir.vector.validate+0xbfc>
    46fc:      	add	x0, x24, #0x8
    4700:      	ldr	x1, [x24, #0x8]
    4704:      	str	x1, [x23]
    4708:      	ldr	x0, [x0, #0x8]
    470c:      	str	x0, [x23, #0x8]
    4710:      	ldr	w0, [x19, #0x4]
    4714:      	sxtw	x0, w0
    4718:      	cmp	x0, #0x0
    471c:      	b.gt	0x4794 <_stogir.vector.validate+0xd34>
    4720:      	ldr	x1, [x29, #0x90]
    4724:      	mov	x0, #0x1                ; =1
    4728:      	b	0x4778 <_stogir.vector.validate+0xd18>
    472c:      	mov	x0, x23
    4730:      	mov	x1, #0x1e               ; =30
    4734:      	b	0x44b0 <_stogir.vector.validate+0xa50>
    4738:      	ldr	w0, [x19, #0x4]
    473c:      	sxtw	x0, w0
    4740:      	ldr	x1, [x20, #0x78]
    4744:      	lsl	x0, x0, #2
    4748:      	add	x0, x0, x1
    474c:      	ldr	w0, [x0]
    4750:      	sxtw	x0, w0
    4754:      	add	x0, x0, #0x1
    4758:      	lsr	w0, w0, #0
    475c:      	sxtw	x0, w0
    4760:      	cmp	x21, x0
    4764:      	cset	w0, eq
    4768:      	uxtb	w16, w0
    476c:      	cmp	w16, wzr
    4770:      	cset	x0, eq
    4774:      	ldr	x1, [x29, #0x90]
    4778:      	cmp	x0, #0x0
    477c:      	b.eq	0x4654 <_stogir.vector.validate+0xbf4>
    4780:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x5a0>
		0000000000004780:  ARM64_RELOC_PAGE21	l_stogir.348
    4784:      	ldr	x16, [x16]
		0000000000004784:  ARM64_RELOC_PAGEOFF12	l_stogir.348
    4788:      	orr	x0, x16, xzr
    478c:      	mov	x1, #0x19               ; =25
    4790:      	b	0x465c <_stogir.vector.validate+0xbfc>
    4794:      	ldr	w0, [x23]
    4798:      	uxtb	w0, w0
    479c:      	cmp	x0, #0x70
    47a0:      	b.eq	0x4738 <_stogir.vector.validate+0xcd8>
    47a4:      	cmp	x0, #0x71
    47a8:      	b.eq	0x4738 <_stogir.vector.validate+0xcd8>
    47ac:      	mov	x0, #0x1                ; =1
    47b0:      	b	0x4774 <_stogir.vector.validate+0xd14>
    47b4:      	brk	#0
    47b8:      	b	0x47b4 <_stogir.vector.validate+0xd54>
    47bc:      	brk	#0
    47c0:      	b	0x47bc <_stogir.vector.validate+0xd5c>
    47c4:      	brk	#0
    47c8:      	b	0x47c4 <_stogir.vector.validate+0xd64>
    47cc:      	str	x8, [x29, #0x18]
    47d0:      	b	0x3b90 <_stogir.vector.validate+0x130>
    47d4:      	str	x11, [x29, #0x20]
    47d8:      	b	0x3bf4 <_stogir.vector.validate+0x194>
    47dc:      	str	x12, [x29, #0x28]
    47e0:      	b	0x3c68 <_stogir.vector.validate+0x208>
    47e4:      	str	x12, [x29, #0x28]
    47e8:      	b	0x3c38 <_stogir.vector.validate+0x1d8>
    47ec:      	ldr	x19, [x29, #0x18]
    47f0:      	mov	w26, w2
    47f4:      	b	0x3d78 <_stogir.vector.validate+0x318>
    47f8:      	ldr	x20, [x29, #0x18]
    47fc:      	b	0x3e1c <_stogir.vector.validate+0x3bc>
    4800:      	str	x20, [x29, #0x18]
    4804:      	mov	x20, x0
    4808:      	str	x25, [x29, #0x60]
    480c:      	str	x26, [x29, #0x40]
    4810:      	mov	w26, w2
    4814:      	str	w22, [x29, #0x58]
    4818:      	str	w23, [x29, #0x50]
    481c:      	str	w24, [x29, #0x48]
    4820:      	str	w1, [x29, #0x80]
    4824:      	b	0x3fb4 <_stogir.vector.validate+0x554>
    4828:      	mov	x22, x0
    482c:      	b	0x42a4 <_stogir.vector.validate+0x844>
    4830:      	str	x22, [x29, #0x88]
    4834:      	mov	x22, x0
    4838:      	b	0x4688 <_stogir.vector.validate+0xc28>
    483c:      	str	x22, [x29, #0x88]
    4840:      	mov	x22, x0
    4844:      	b	0x4688 <_stogir.vector.validate+0xc28>
    4848:      	str	x22, [x29, #0x88]
    484c:      	mov	x22, x0
    4850:      	b	0x4688 <_stogir.vector.validate+0xc28>
    4854:      	str	x22, [x29, #0x88]
    4858:      	mov	x22, x0
    485c:      	b	0x4688 <_stogir.vector.validate+0xc28>
    4860:      	str	x1, [x29, #0xa8]
    4864:      	str	x2, [x29, #0xb0]
    4868:      	b	0x460c <_stogir.vector.validate+0xbac>

000000000000486c <_stogir.copy.validate>:
    486c:      	sub	sp, sp, #0x30
    4870:      	str	x29, [sp]
    4874:      	str	x30, [sp, #0x8]
    4878:      	mov	x29, sp
    487c:      	str	x19, [sp, #0x10]
    4880:      	str	x20, [sp, #0x18]
    4884:      	str	x21, [sp, #0x20]
    4888:      	str	x22, [sp, #0x28]
    488c:      	sub	sp, sp, #0x10
    4890:      	mov	x19, sp
    4894:      	sxtw	x1, w1
    4898:      	lsl	x2, x1, #2
    489c:      	cmp	x1, #0x0
    48a0:      	cset	w3, gt
    48a4:      	movz	x16, #0x0, lsl #48
    48a8:      	sub	x4, x16, x1
    48ac:      	sub	x5, x4, #0x1
    48b0:      	uxtb	w16, w3
    48b4:      	cmp	w16, wzr
    48b8:      	b.eq	0x48f8 <_stogir.copy.validate+0x8c>
    48bc:      	ldr	x4, [x0, #0x8]
    48c0:      	cmp	x1, x4
    48c4:      	b.ge	0x494c <_stogir.copy.validate+0xe0>
    48c8:      	add	x4, x0, #0x78
    48cc:      	ldr	x4, [x4, #0x8]
    48d0:      	cmp	x1, x4
    48d4:      	b.ge	0x4a78 <_stogir.copy.validate+0x20c>
    48d8:      	ldr	x4, [x0, #0x78]
    48dc:      	add	x4, x2, x4
    48e0:      	ldr	w4, [x4]
    48e4:      	sxtw	x4, w4
    48e8:      	cmp	x4, #0x0
    48ec:      	cset	w4, ge
    48f0:      	ubfx	x4, x4, #0, #8
    48f4:      	b	0x4a7c <_stogir.copy.validate+0x210>
    48f8:      	cmp	x1, #0x0
    48fc:      	b.ge	0x4954 <_stogir.copy.validate+0xe8>
    4900:      	add	x6, x0, #0x28
    4904:      	add	x7, x0, #0x50
    4908:      	ldr	x6, [x6, #0x8]
    490c:      	ldr	x7, [x7, #0x8]
    4910:      	cmp	x6, x7
    4914:      	b.ne	0x4944 <_stogir.copy.validate+0xd8>
    4918:      	cmp	x4, x6
    491c:      	b.gt	0x4ac0 <_stogir.copy.validate+0x254>
    4920:      	lsl	x4, x5, #2
    4924:      	ldr	x6, [x0, #0x50]
    4928:      	add	x4, x4, x6
    492c:      	ldr	w4, [x4]
    4930:      	sxtw	x4, w4
    4934:      	cmp	x4, #0x0
    4938:      	cset	w4, gt
    493c:      	ubfx	x4, x4, #0, #8
    4940:      	b	0x4ac4 <_stogir.copy.validate+0x258>
    4944:      	movz	x4, #0x0, lsl #48
    4948:      	b	0x4958 <_stogir.copy.validate+0xec>
    494c:      	movz	x4, #0x0, lsl #48
    4950:      	b	0x4958 <_stogir.copy.validate+0xec>
    4954:      	movz	x4, #0x0, lsl #48
    4958:      	cmp	x4, #0x0
    495c:      	b.eq	0x49c0 <_stogir.copy.validate+0x154>
    4960:      	uxtb	w16, w3
    4964:      	cmp	w16, wzr
    4968:      	b.eq	0x4990 <_stogir.copy.validate+0x124>
    496c:      	lsl	x3, x1, #4
    4970:      	ldr	x4, [x0]
    4974:      	add	x3, x3, x4
    4978:      	ldr	x4, [x3]
    497c:      	ldr	x3, [x3, #0x8]
    4980:      	fmov	d31, x3
    4984:      	mov	x3, x4
    4988:      	fmov	x4, d31
    498c:      	b	0x49b0 <_stogir.copy.validate+0x144>
    4990:      	lsl	x3, x5, #4
    4994:      	ldr	x4, [x0, #0x28]
    4998:      	add	x3, x3, x4
    499c:      	ldr	x4, [x3]
    49a0:      	ldr	x3, [x3, #0x8]
    49a4:      	fmov	d31, x3
    49a8:      	mov	x3, x4
    49ac:      	fmov	x4, d31
    49b0:      	mov	x5, x4
    49b4:      	mov	x4, x3
    49b8:      	mov	x3, #0x1                ; =1
    49bc:      	b	0x49cc <_stogir.copy.validate+0x160>
    49c0:      	movz	x3, #0x0, lsl #48
    49c4:      	movz	x4, #0x0, lsl #48
    49c8:      	movz	x5, #0x0, lsl #48
    49cc:      	lsr	w3, w3, #0
    49d0:      	lsr	x16, x3, #0
    49d4:      	cmp	x16, #0x1
    49d8:      	b.eq	0x49f4 <_stogir.copy.validate+0x188>
    49dc:      	b.lo	0x49e4 <_stogir.copy.validate+0x178>
    49e0:      	b	0x49f8 <_stogir.copy.validate+0x18c>
    49e4:      	cmp	x16, #0x0
    49e8:      	b.eq	0x49f0 <_stogir.copy.validate+0x184>
    49ec:      	b	0x49f8 <_stogir.copy.validate+0x18c>
    49f0:      	b	0x49fc <_stogir.copy.validate+0x190>
    49f4:      	b	0x4a48 <_stogir.copy.validate+0x1dc>
    49f8:      	b	0x4b4c <_stogir.copy.validate+0x2e0>
    49fc:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x5a0>
		00000000000049fc:  ARM64_RELOC_PAGE21	l_stogir.349
    4a00:      	ldr	x16, [x16]
		0000000000004a00:  ARM64_RELOC_PAGEOFF12	l_stogir.349
    4a04:      	orr	x0, x16, xzr
    4a08:      	mov	x21, x8
    4a0c:      	mov	x1, x0
    4a10:      	mov	x0, #0x1                ; =1
    4a14:      	mov	x2, #0x18               ; =24
    4a18:      	str	x0, [x21]
    4a1c:      	str	x1, [x21, #0x8]
    4a20:      	str	x2, [x21, #0x10]
    4a24:      	sub	sp, x29, #0x0
    4a28:      	ldr	x19, [sp, #0x10]
    4a2c:      	ldr	x20, [sp, #0x18]
    4a30:      	ldr	x21, [sp, #0x20]
    4a34:      	ldr	x22, [sp, #0x28]
    4a38:      	ldr	x29, [sp]
    4a3c:      	ldr	x30, [sp, #0x8]
    4a40:      	add	sp, sp, #0x30
    4a44:      	ret
    4a48:      	str	x4, [x19]
    4a4c:      	str	x5, [x19, #0x8]
    4a50:      	cmp	x1, #0x0
    4a54:      	b.gt	0x4a80 <_stogir.copy.validate+0x214>
    4a58:      	mov	x21, x8
    4a5c:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x5a0>
		0000000000004a5c:  ARM64_RELOC_PAGE21	l_stogir.350
    4a60:      	ldr	x16, [x16]
		0000000000004a60:  ARM64_RELOC_PAGEOFF12	l_stogir.350
    4a64:      	orr	x0, x16, xzr
    4a68:      	mov	x1, x0
    4a6c:      	mov	x0, #0x1                ; =1
    4a70:      	mov	x2, #0x21               ; =33
    4a74:      	b	0x4a18 <_stogir.copy.validate+0x1ac>
    4a78:      	movz	x4, #0x0, lsl #48
    4a7c:      	b	0x4950 <_stogir.copy.validate+0xe4>
    4a80:      	uxtb	w1, w4
    4a84:      	cmp	x1, #0x44
    4a88:      	b.ne	0x4cac <_stogir.copy.validate+0x440>
    4a8c:      	ldr	x1, [x0, #0x78]
    4a90:      	add	x1, x2, x1
    4a94:      	ldr	w1, [x1]
    4a98:      	sxtw	x1, w1
    4a9c:      	cmp	x1, #0x2
    4aa0:      	b.ne	0x4cb4 <_stogir.copy.validate+0x448>
    4aa4:      	lsr	w4, w4, #0
    4aa8:      	ubfx	x1, x4, #8, #8
    4aac:      	orr	x20, x1, xzr
    4ab0:      	cmp	x20, #0x0
    4ab4:      	b.ne	0x4ac8 <_stogir.copy.validate+0x25c>
    4ab8:      	mov	x21, x8
    4abc:      	b	0x4a5c <_stogir.copy.validate+0x1f0>
    4ac0:      	movz	x4, #0x0, lsl #48
    4ac4:      	b	0x4948 <_stogir.copy.validate+0xdc>
    4ac8:      	lsr	w1, w1, #0
    4acc:      	mov	x21, x8
    4ad0:      	mov	x22, x0
    4ad4:      	mov	w0, w1
    4ad8:      	bl	0x4ad8 <_stogir.copy.validate+0x26c>
		0000000000004ad8:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
    4adc:      	cmp	x0, #0x0
    4ae0:      	b.eq	0x4a5c <_stogir.copy.validate+0x1f0>
    4ae4:      	ldr	w0, [x19, #0x4]
    4ae8:      	sxtw	x0, w0
    4aec:      	cmp	x0, #0x0
    4af0:      	cset	w1, gt
    4af4:      	movz	x16, #0x0, lsl #48
    4af8:      	sub	x2, x16, x0
    4afc:      	sub	x3, x2, #0x1
    4b00:      	uxtb	w16, w1
    4b04:      	cmp	w16, wzr
    4b08:      	b.eq	0x4b70 <_stogir.copy.validate+0x304>
    4b0c:      	ldr	x2, [x22, #0x8]
    4b10:      	cmp	x0, x2
    4b14:      	b.ge	0x4bbc <_stogir.copy.validate+0x350>
    4b18:      	add	x2, x22, #0x78
    4b1c:      	ldr	x2, [x2, #0x8]
    4b20:      	cmp	x0, x2
    4b24:      	b.ge	0x4c94 <_stogir.copy.validate+0x428>
    4b28:      	lsl	x2, x0, #2
    4b2c:      	ldr	x4, [x22, #0x78]
    4b30:      	add	x2, x2, x4
    4b34:      	ldr	w2, [x2]
    4b38:      	sxtw	x2, w2
    4b3c:      	cmp	x2, #0x0
    4b40:      	cset	w2, ge
    4b44:      	ubfx	x2, x2, #0, #8
    4b48:      	b	0x4c98 <_stogir.copy.validate+0x42c>
    4b4c:      	brk	#0
    4b50:      	b	0x4b4c <_stogir.copy.validate+0x2e0>
    4b54:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x5a0>
		0000000000004b54:  ARM64_RELOC_PAGE21	l_stogir.351
    4b58:      	ldr	x16, [x16]
		0000000000004b58:  ARM64_RELOC_PAGEOFF12	l_stogir.351
    4b5c:      	orr	x0, x16, xzr
    4b60:      	mov	x1, x0
    4b64:      	mov	x0, #0x1                ; =1
    4b68:      	mov	x2, #0x20               ; =32
    4b6c:      	b	0x4a74 <_stogir.copy.validate+0x208>
    4b70:      	cmp	x0, #0x0
    4b74:      	b.ge	0x4bc4 <_stogir.copy.validate+0x358>
    4b78:      	add	x4, x22, #0x28
    4b7c:      	add	x5, x22, #0x50
    4b80:      	ldr	x4, [x4, #0x8]
    4b84:      	ldr	x5, [x5, #0x8]
    4b88:      	cmp	x4, x5
    4b8c:      	b.ne	0x4c8c <_stogir.copy.validate+0x420>
    4b90:      	cmp	x2, x4
    4b94:      	b.gt	0x4c9c <_stogir.copy.validate+0x430>
    4b98:      	lsl	x2, x3, #2
    4b9c:      	ldr	x4, [x22, #0x50]
    4ba0:      	add	x2, x2, x4
    4ba4:      	ldr	w2, [x2]
    4ba8:      	sxtw	x2, w2
    4bac:      	cmp	x2, #0x0
    4bb0:      	cset	w2, gt
    4bb4:      	ubfx	x2, x2, #0, #8
    4bb8:      	b	0x4ca0 <_stogir.copy.validate+0x434>
    4bbc:      	movz	x2, #0x0, lsl #48
    4bc0:      	b	0x4bc8 <_stogir.copy.validate+0x35c>
    4bc4:      	movz	x2, #0x0, lsl #48
    4bc8:      	cmp	x2, #0x0
    4bcc:      	b.eq	0x4c0c <_stogir.copy.validate+0x3a0>
    4bd0:      	uxtb	w16, w1
    4bd4:      	cmp	w16, wzr
    4bd8:      	b.eq	0x4bf0 <_stogir.copy.validate+0x384>
    4bdc:      	lsl	x0, x0, #4
    4be0:      	ldr	x1, [x22]
    4be4:      	add	x0, x0, x1
    4be8:      	ldr	x0, [x0]
    4bec:      	b	0x4c00 <_stogir.copy.validate+0x394>
    4bf0:      	lsl	x0, x3, #4
    4bf4:      	ldr	x1, [x22, #0x28]
    4bf8:      	add	x0, x0, x1
    4bfc:      	ldr	x0, [x0]
    4c00:      	mov	x1, x0
    4c04:      	mov	x0, #0x1                ; =1
    4c08:      	b	0x4c14 <_stogir.copy.validate+0x3a8>
    4c0c:      	movz	x0, #0x0, lsl #48
    4c10:      	movz	x1, #0x0, lsl #48
    4c14:      	lsr	w0, w0, #0
    4c18:      	lsr	x16, x0, #0
    4c1c:      	cmp	x16, #0x1
    4c20:      	b.eq	0x4c3c <_stogir.copy.validate+0x3d0>
    4c24:      	b.lo	0x4c2c <_stogir.copy.validate+0x3c0>
    4c28:      	b	0x4c40 <_stogir.copy.validate+0x3d4>
    4c2c:      	cmp	x16, #0x0
    4c30:      	b.eq	0x4c38 <_stogir.copy.validate+0x3cc>
    4c34:      	b	0x4c40 <_stogir.copy.validate+0x3d4>
    4c38:      	b	0x4c44 <_stogir.copy.validate+0x3d8>
    4c3c:      	b	0x4c60 <_stogir.copy.validate+0x3f4>
    4c40:      	b	0x4ca4 <_stogir.copy.validate+0x438>
    4c44:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x5a0>
		0000000000004c44:  ARM64_RELOC_PAGE21	l_stogir.352
    4c48:      	ldr	x16, [x16]
		0000000000004c48:  ARM64_RELOC_PAGEOFF12	l_stogir.352
    4c4c:      	orr	x0, x16, xzr
    4c50:      	mov	x1, x0
    4c54:      	mov	x0, #0x1                ; =1
    4c58:      	mov	x2, #0x13               ; =19
    4c5c:      	b	0x4b6c <_stogir.copy.validate+0x300>
    4c60:      	lsr	w1, w1, #0
    4c64:      	ldr	w0, [x19]
    4c68:      	ubfx	x1, x1, #8, #8
    4c6c:      	ubfx	x0, x0, #8, #8
    4c70:      	cmp	x1, x0
    4c74:      	b.ne	0x4b54 <_stogir.copy.validate+0x2e8>
    4c78:      	and	x0, x20, #0xffffffff
    4c7c:      	mov	x1, x0
    4c80:      	movz	x0, #0x0, lsl #48
    4c84:      	movz	x2, #0x0, lsl #48
    4c88:      	b	0x4b6c <_stogir.copy.validate+0x300>
    4c8c:      	movz	x2, #0x0, lsl #48
    4c90:      	b	0x4bc8 <_stogir.copy.validate+0x35c>
    4c94:      	movz	x2, #0x0, lsl #48
    4c98:      	b	0x4bc0 <_stogir.copy.validate+0x354>
    4c9c:      	movz	x2, #0x0, lsl #48
    4ca0:      	b	0x4c90 <_stogir.copy.validate+0x424>
    4ca4:      	brk	#0
    4ca8:      	b	0x4ca4 <_stogir.copy.validate+0x438>
    4cac:      	mov	x21, x8
    4cb0:      	b	0x4a5c <_stogir.copy.validate+0x1f0>
    4cb4:      	mov	x21, x8
    4cb8:      	b	0x4a5c <_stogir.copy.validate+0x1f0>

0000000000004cbc <_stogir.graph.lookup>:
    4cbc:      	sxtw	x1, w1
    4cc0:      	cmp	x1, #0x0
    4cc4:      	cset	w2, gt
    4cc8:      	movz	x16, #0x0, lsl #48
    4ccc:      	sub	x3, x16, x1
    4cd0:      	sub	x4, x3, #0x1
    4cd4:      	uxtb	w16, w2
    4cd8:      	cmp	w16, wzr
    4cdc:      	b.eq	0x4d20 <_stogir.graph.lookup+0x64>
    4ce0:      	ldr	x3, [x0, #0x8]
    4ce4:      	cmp	x1, x3
    4ce8:      	b.ge	0x4d74 <_stogir.graph.lookup+0xb8>
    4cec:      	add	x3, x0, #0x78
    4cf0:      	ldr	x3, [x3, #0x8]
    4cf4:      	cmp	x1, x3
    4cf8:      	b.ge	0x4e14 <_stogir.graph.lookup+0x158>
    4cfc:      	lsl	x3, x1, #2
    4d00:      	ldr	x5, [x0, #0x78]
    4d04:      	add	x3, x3, x5
    4d08:      	ldr	w3, [x3]
    4d0c:      	sxtw	x3, w3
    4d10:      	cmp	x3, #0x0
    4d14:      	cset	w3, ge
    4d18:      	ubfx	x3, x3, #0, #8
    4d1c:      	b	0x4e18 <_stogir.graph.lookup+0x15c>
    4d20:      	cmp	x1, #0x0
    4d24:      	b.ge	0x4d7c <_stogir.graph.lookup+0xc0>
    4d28:      	add	x5, x0, #0x28
    4d2c:      	add	x6, x0, #0x50
    4d30:      	ldr	x5, [x5, #0x8]
    4d34:      	ldr	x6, [x6, #0x8]
    4d38:      	cmp	x5, x6
    4d3c:      	b.ne	0x4d6c <_stogir.graph.lookup+0xb0>
    4d40:      	cmp	x3, x5
    4d44:      	b.gt	0x4e1c <_stogir.graph.lookup+0x160>
    4d48:      	lsl	x3, x4, #2
    4d4c:      	ldr	x5, [x0, #0x50]
    4d50:      	add	x3, x3, x5
    4d54:      	ldr	w3, [x3]
    4d58:      	sxtw	x3, w3
    4d5c:      	cmp	x3, #0x0
    4d60:      	cset	w3, gt
    4d64:      	ubfx	x3, x3, #0, #8
    4d68:      	b	0x4e20 <_stogir.graph.lookup+0x164>
    4d6c:      	movz	x3, #0x0, lsl #48
    4d70:      	b	0x4d80 <_stogir.graph.lookup+0xc4>
    4d74:      	movz	x3, #0x0, lsl #48
    4d78:      	b	0x4d80 <_stogir.graph.lookup+0xc4>
    4d7c:      	movz	x3, #0x0, lsl #48
    4d80:      	cmp	x3, #0x0
    4d84:      	b.eq	0x4de8 <_stogir.graph.lookup+0x12c>
    4d88:      	uxtb	w16, w2
    4d8c:      	cmp	w16, wzr
    4d90:      	b.eq	0x4db8 <_stogir.graph.lookup+0xfc>
    4d94:      	lsl	x1, x1, #4
    4d98:      	ldr	x0, [x0]
    4d9c:      	add	x0, x1, x0
    4da0:      	ldr	x1, [x0]
    4da4:      	ldr	x0, [x0, #0x8]
    4da8:      	fmov	d31, x0
    4dac:      	mov	x0, x1
    4db0:      	fmov	x1, d31
    4db4:      	b	0x4dd8 <_stogir.graph.lookup+0x11c>
    4db8:      	lsl	x1, x4, #4
    4dbc:      	ldr	x0, [x0, #0x28]
    4dc0:      	add	x0, x1, x0
    4dc4:      	ldr	x1, [x0]
    4dc8:      	ldr	x0, [x0, #0x8]
    4dcc:      	fmov	d31, x0
    4dd0:      	mov	x0, x1
    4dd4:      	fmov	x1, d31
    4dd8:      	mov	x2, x1
    4ddc:      	mov	x1, x0
    4de0:      	mov	x0, #0x1                ; =1
    4de4:      	b	0x4df4 <_stogir.graph.lookup+0x138>
    4de8:      	movz	x0, #0x0, lsl #48
    4dec:      	movz	x1, #0x0, lsl #48
    4df0:      	movz	x2, #0x0, lsl #48
    4df4:      	str	x0, [x8]
    4df8:      	str	x1, [x8, #0x8]
    4dfc:      	str	x2, [x8, #0x10]
    4e00:      	movz	x17, #0x0, lsl #48
    4e04:      	str	x17, [x8, #0x18]
    4e08:      	movz	x17, #0x0, lsl #48
    4e0c:      	str	x17, [x8, #0x20]
    4e10:      	ret
    4e14:      	movz	x3, #0x0, lsl #48
    4e18:      	b	0x4d78 <_stogir.graph.lookup+0xbc>
    4e1c:      	movz	x3, #0x0, lsl #48
    4e20:      	b	0x4d70 <_stogir.graph.lookup+0xb4>

0000000000004e24 <_stogir.opcode.block-start?>:
    4e24:      	sxtw	x0, w0
    4e28:      	cmp	x0, #0x0
    4e2c:      	b.lt	0x4e54 <_stogir.opcode.block-start?+0x30>
    4e30:      	cmp	x0, #0x83
    4e34:      	b.ge	0x4e54 <_stogir.opcode.block-start?+0x30>
    4e38:      	adrp	x16, 0x4000 <_stogir.vector.validate+0x5a0>
		0000000000004e38:  ARM64_RELOC_PAGE21	l_stogir.353
    4e3c:      	ldr	x16, [x16]
		0000000000004e3c:  ARM64_RELOC_PAGEOFF12	l_stogir.353
    4e40:      	orr	x1, x16, xzr
    4e44:      	lsr	x0, x0, #0
    4e48:      	add	x0, x0, x1
    4e4c:      	ldrb	w0, [x0]
    4e50:      	b	0x4e58 <_stogir.opcode.block-start?+0x34>
    4e54:      	movz	x0, #0x0, lsl #48
    4e58:      	uxtb	w0, w0
    4e5c:      	and	x0, x0, #0x2
    4e60:      	uxtb	w0, w0
    4e64:      	cmp	x0, #0x0
    4e68:      	cset	w0, eq
    4e6c:      	uxtb	w16, w0
    4e70:      	cmp	w16, wzr
    4e74:      	cset	x0, eq
    4e78:      	ret

0000000000004e7c <_stogir.checked.operation?>:
    4e7c:      	sxtw	x0, w0
    4e80:      	cmp	x0, #0x29
    4e84:      	b.lt	0x4e98 <_stogir.checked.operation?+0x1c>
    4e88:      	cmp	x0, #0x2b
    4e8c:      	cset	w0, le
    4e90:      	ubfx	x0, x0, #0, #8
    4e94:      	b	0x4e9c <_stogir.checked.operation?+0x20>
    4e98:      	movz	x0, #0x0, lsl #48
    4e9c:      	ret

0000000000004ea0 <_stogir.checked.validate-projection>:
    4ea0:      	sub	sp, sp, #0x20
    4ea4:      	str	x29, [sp]
    4ea8:      	str	x30, [sp, #0x8]
    4eac:      	mov	x29, sp
    4eb0:      	str	x19, [sp, #0x10]
    4eb4:      	str	x20, [sp, #0x18]
    4eb8:      	sub	sp, sp, #0x20
    4ebc:      	mov	x19, sp
    4ec0:      	sxtw	x1, w1
    4ec4:      	lsl	x2, x1, #2
    4ec8:      	cmp	x1, #0x0
    4ecc:      	cset	w3, gt
    4ed0:      	movz	x16, #0x0, lsl #48
    4ed4:      	sub	x4, x16, x1
    4ed8:      	sub	x5, x4, #0x1
    4edc:      	uxtb	w16, w3
    4ee0:      	cmp	w16, wzr
    4ee4:      	b.eq	0x4f24 <_stogir.checked.validate-projection+0x84>
    4ee8:      	ldr	x4, [x0, #0x8]
    4eec:      	cmp	x1, x4
    4ef0:      	b.ge	0x4f78 <_stogir.checked.validate-projection+0xd8>
    4ef4:      	add	x4, x0, #0x78
    4ef8:      	ldr	x4, [x4, #0x8]
    4efc:      	cmp	x1, x4
    4f00:      	b.ge	0x506c <_stogir.checked.validate-projection+0x1cc>
    4f04:      	ldr	x4, [x0, #0x78]
    4f08:      	add	x4, x2, x4
    4f0c:      	ldr	w4, [x4]
    4f10:      	sxtw	x4, w4
    4f14:      	cmp	x4, #0x0
    4f18:      	cset	w4, ge
    4f1c:      	ubfx	x4, x4, #0, #8
    4f20:      	b	0x5070 <_stogir.checked.validate-projection+0x1d0>
    4f24:      	cmp	x1, #0x0
    4f28:      	b.ge	0x4f80 <_stogir.checked.validate-projection+0xe0>
    4f2c:      	add	x6, x0, #0x28
    4f30:      	add	x7, x0, #0x50
    4f34:      	ldr	x6, [x6, #0x8]
    4f38:      	ldr	x7, [x7, #0x8]
    4f3c:      	cmp	x6, x7
    4f40:      	b.ne	0x4f70 <_stogir.checked.validate-projection+0xd0>
    4f44:      	cmp	x4, x6
    4f48:      	b.gt	0x50cc <_stogir.checked.validate-projection+0x22c>
    4f4c:      	lsl	x4, x5, #2
    4f50:      	ldr	x6, [x0, #0x50]
    4f54:      	add	x4, x4, x6
    4f58:      	ldr	w4, [x4]
    4f5c:      	sxtw	x4, w4
    4f60:      	cmp	x4, #0x0
    4f64:      	cset	w4, gt
    4f68:      	ubfx	x4, x4, #0, #8
    4f6c:      	b	0x50d0 <_stogir.checked.validate-projection+0x230>
    4f70:      	movz	x4, #0x0, lsl #48
    4f74:      	b	0x4f84 <_stogir.checked.validate-projection+0xe4>
    4f78:      	movz	x4, #0x0, lsl #48
    4f7c:      	b	0x4f84 <_stogir.checked.validate-projection+0xe4>
    4f80:      	movz	x4, #0x0, lsl #48
    4f84:      	cmp	x4, #0x0
    4f88:      	b.eq	0x4fc8 <_stogir.checked.validate-projection+0x128>
    4f8c:      	uxtb	w16, w3
    4f90:      	cmp	w16, wzr
    4f94:      	b.eq	0x4fac <_stogir.checked.validate-projection+0x10c>
    4f98:      	lsl	x3, x1, #4
    4f9c:      	ldr	x4, [x0]
    4fa0:      	add	x3, x3, x4
    4fa4:      	ldr	x3, [x3]
    4fa8:      	b	0x4fbc <_stogir.checked.validate-projection+0x11c>
    4fac:      	lsl	x3, x5, #4
    4fb0:      	ldr	x4, [x0, #0x28]
    4fb4:      	add	x3, x3, x4
    4fb8:      	ldr	x3, [x3]
    4fbc:      	mov	x4, x3
    4fc0:      	mov	x3, #0x1                ; =1
    4fc4:      	b	0x4fd0 <_stogir.checked.validate-projection+0x130>
    4fc8:      	movz	x3, #0x0, lsl #48
    4fcc:      	movz	x4, #0x0, lsl #48
    4fd0:      	lsr	w3, w3, #0
    4fd4:      	lsr	x16, x3, #0
    4fd8:      	cmp	x16, #0x1
    4fdc:      	b.eq	0x4ff8 <_stogir.checked.validate-projection+0x158>
    4fe0:      	b.lo	0x4fe8 <_stogir.checked.validate-projection+0x148>
    4fe4:      	b	0x4ffc <_stogir.checked.validate-projection+0x15c>
    4fe8:      	cmp	x16, #0x0
    4fec:      	b.eq	0x4ff4 <_stogir.checked.validate-projection+0x154>
    4ff0:      	b	0x4ffc <_stogir.checked.validate-projection+0x15c>
    4ff4:      	b	0x5000 <_stogir.checked.validate-projection+0x160>
    4ff8:      	b	0x5020 <_stogir.checked.validate-projection+0x180>
    4ffc:      	b	0x50d4 <_stogir.checked.validate-projection+0x234>
    5000:      	adrp	x16, 0x5000 <_stogir.checked.validate-projection+0x160>
		0000000000005000:  ARM64_RELOC_PAGE21	l_stogir.354
    5004:      	ldr	x16, [x16]
		0000000000005004:  ARM64_RELOC_PAGEOFF12	l_stogir.354
    5008:      	orr	x0, x16, xzr
    500c:      	mov	x20, x8
    5010:      	mov	x1, x0
    5014:      	mov	x0, #0x1                ; =1
    5018:      	mov	x2, #0x10               ; =16
    501c:      	b	0x5044 <_stogir.checked.validate-projection+0x1a4>
    5020:      	cmp	x1, #0x0
    5024:      	b.gt	0x5074 <_stogir.checked.validate-projection+0x1d4>
    5028:      	mov	x20, x8
    502c:      	adrp	x16, 0x5000 <_stogir.checked.validate-projection+0x160>
		000000000000502c:  ARM64_RELOC_PAGE21	l_stogir.355
    5030:      	ldr	x16, [x16]
		0000000000005030:  ARM64_RELOC_PAGEOFF12	l_stogir.355
    5034:      	orr	x0, x16, xzr
    5038:      	mov	x1, x0
    503c:      	mov	x0, #0x1                ; =1
    5040:      	mov	x2, #0x1c               ; =28
    5044:      	str	x0, [x20]
    5048:      	str	x1, [x20, #0x8]
    504c:      	str	x2, [x20, #0x10]
    5050:      	sub	sp, x29, #0x0
    5054:      	ldr	x19, [sp, #0x10]
    5058:      	ldr	x20, [sp, #0x18]
    505c:      	ldr	x29, [sp]
    5060:      	ldr	x30, [sp, #0x8]
    5064:      	add	sp, sp, #0x20
    5068:      	ret
    506c:      	movz	x4, #0x0, lsl #48
    5070:      	b	0x4f7c <_stogir.checked.validate-projection+0xdc>
    5074:      	uxtb	w1, w4
    5078:      	cmp	x1, #0x2c
    507c:      	b.ne	0x50dc <_stogir.checked.validate-projection+0x23c>
    5080:      	lsr	w1, w4, #0
    5084:      	ubfx	x1, x1, #8, #8
    5088:      	cmp	x1, #0x1
    508c:      	b.ne	0x50e4 <_stogir.checked.validate-projection+0x244>
    5090:      	ldr	x1, [x0, #0x78]
    5094:      	add	x1, x2, x1
    5098:      	ldr	w1, [x1]
    509c:      	sxtw	x1, w1
    50a0:      	cmp	x1, #0x1
    50a4:      	b.ne	0x50ec <_stogir.checked.validate-projection+0x24c>
    50a8:      	lsr	x1, x4, #32
    50ac:      	lsr	w1, w1, #0
    50b0:      	mov	x20, x8
    50b4:      	mov	x8, x19
    50b8:      	bl	0x50b8 <_stogir.checked.validate-projection+0x218>
		00000000000050b8:  ARM64_RELOC_BRANCH26	_stogir.checked.projection
    50bc:      	ldr	x0, [x19]
    50c0:      	ldr	x1, [x19, #0x8]
    50c4:      	ldr	x2, [x19, #0x10]
    50c8:      	b	0x5044 <_stogir.checked.validate-projection+0x1a4>
    50cc:      	movz	x4, #0x0, lsl #48
    50d0:      	b	0x4f74 <_stogir.checked.validate-projection+0xd4>
    50d4:      	brk	#0
    50d8:      	b	0x50d4 <_stogir.checked.validate-projection+0x234>
    50dc:      	mov	x20, x8
    50e0:      	b	0x502c <_stogir.checked.validate-projection+0x18c>
    50e4:      	mov	x20, x8
    50e8:      	b	0x502c <_stogir.checked.validate-projection+0x18c>
    50ec:      	mov	x20, x8
    50f0:      	b	0x502c <_stogir.checked.validate-projection+0x18c>

00000000000050f4 <_stogir.checked.validate>:
    50f4:      	sub	sp, sp, #0x40
    50f8:      	str	x29, [sp]
    50fc:      	str	x30, [sp, #0x8]
    5100:      	mov	x29, sp
    5104:      	str	x19, [sp, #0x10]
    5108:      	str	x20, [sp, #0x18]
    510c:      	str	x21, [sp, #0x20]
    5110:      	str	x22, [sp, #0x28]
    5114:      	str	x23, [sp, #0x30]
    5118:      	sxtw	x1, w1
    511c:      	lsl	x2, x1, #2
    5120:      	cmp	x1, #0x0
    5124:      	cset	w3, gt
    5128:      	movz	x16, #0x0, lsl #48
    512c:      	sub	x4, x16, x1
    5130:      	sub	x5, x4, #0x1
    5134:      	uxtb	w16, w3
    5138:      	cmp	w16, wzr
    513c:      	b.eq	0x517c <_stogir.checked.validate+0x88>
    5140:      	ldr	x4, [x0, #0x8]
    5144:      	cmp	x1, x4
    5148:      	b.ge	0x51d0 <_stogir.checked.validate+0xdc>
    514c:      	add	x4, x0, #0x78
    5150:      	ldr	x4, [x4, #0x8]
    5154:      	cmp	x1, x4
    5158:      	b.ge	0x52f8 <_stogir.checked.validate+0x204>
    515c:      	ldr	x4, [x0, #0x78]
    5160:      	add	x4, x2, x4
    5164:      	ldr	w4, [x4]
    5168:      	sxtw	x4, w4
    516c:      	cmp	x4, #0x0
    5170:      	cset	w4, ge
    5174:      	ubfx	x4, x4, #0, #8
    5178:      	b	0x52fc <_stogir.checked.validate+0x208>
    517c:      	cmp	x1, #0x0
    5180:      	b.ge	0x51d8 <_stogir.checked.validate+0xe4>
    5184:      	add	x6, x0, #0x28
    5188:      	add	x7, x0, #0x50
    518c:      	ldr	x6, [x6, #0x8]
    5190:      	ldr	x7, [x7, #0x8]
    5194:      	cmp	x6, x7
    5198:      	b.ne	0x51c8 <_stogir.checked.validate+0xd4>
    519c:      	cmp	x4, x6
    51a0:      	b.gt	0x53ac <_stogir.checked.validate+0x2b8>
    51a4:      	lsl	x4, x5, #2
    51a8:      	ldr	x6, [x0, #0x50]
    51ac:      	add	x4, x4, x6
    51b0:      	ldr	w4, [x4]
    51b4:      	sxtw	x4, w4
    51b8:      	cmp	x4, #0x0
    51bc:      	cset	w4, gt
    51c0:      	ubfx	x4, x4, #0, #8
    51c4:      	b	0x53b0 <_stogir.checked.validate+0x2bc>
    51c8:      	movz	x4, #0x0, lsl #48
    51cc:      	b	0x51dc <_stogir.checked.validate+0xe8>
    51d0:      	movz	x4, #0x0, lsl #48
    51d4:      	b	0x51dc <_stogir.checked.validate+0xe8>
    51d8:      	movz	x4, #0x0, lsl #48
    51dc:      	cmp	x4, #0x0
    51e0:      	b.eq	0x5244 <_stogir.checked.validate+0x150>
    51e4:      	uxtb	w16, w3
    51e8:      	cmp	w16, wzr
    51ec:      	b.eq	0x5214 <_stogir.checked.validate+0x120>
    51f0:      	lsl	x3, x1, #4
    51f4:      	ldr	x4, [x0]
    51f8:      	add	x3, x3, x4
    51fc:      	ldr	x4, [x3]
    5200:      	ldr	x3, [x3, #0x8]
    5204:      	fmov	d31, x3
    5208:      	mov	x3, x4
    520c:      	fmov	x4, d31
    5210:      	b	0x5234 <_stogir.checked.validate+0x140>
    5214:      	lsl	x3, x5, #4
    5218:      	ldr	x4, [x0, #0x28]
    521c:      	add	x3, x3, x4
    5220:      	ldr	x4, [x3]
    5224:      	ldr	x3, [x3, #0x8]
    5228:      	fmov	d31, x3
    522c:      	mov	x3, x4
    5230:      	fmov	x4, d31
    5234:      	mov	x5, x4
    5238:      	mov	x4, x3
    523c:      	mov	x3, #0x1                ; =1
    5240:      	b	0x5250 <_stogir.checked.validate+0x15c>
    5244:      	movz	x3, #0x0, lsl #48
    5248:      	movz	x4, #0x0, lsl #48
    524c:      	movz	x5, #0x0, lsl #48
    5250:      	lsr	w3, w3, #0
    5254:      	lsr	x16, x3, #0
    5258:      	cmp	x16, #0x1
    525c:      	b.eq	0x5278 <_stogir.checked.validate+0x184>
    5260:      	b.lo	0x5268 <_stogir.checked.validate+0x174>
    5264:      	b	0x527c <_stogir.checked.validate+0x188>
    5268:      	cmp	x16, #0x0
    526c:      	b.eq	0x5274 <_stogir.checked.validate+0x180>
    5270:      	b	0x527c <_stogir.checked.validate+0x188>
    5274:      	b	0x5280 <_stogir.checked.validate+0x18c>
    5278:      	b	0x52a0 <_stogir.checked.validate+0x1ac>
    527c:      	b	0x5668 <_stogir.checked.validate+0x574>
    5280:      	adrp	x16, 0x5000 <_stogir.checked.validate-projection+0x160>
		0000000000005280:  ARM64_RELOC_PAGE21	l_stogir.356
    5284:      	ldr	x16, [x16]
		0000000000005284:  ARM64_RELOC_PAGEOFF12	l_stogir.356
    5288:      	orr	x0, x16, xzr
    528c:      	mov	x23, x8
    5290:      	mov	x1, x0
    5294:      	mov	x0, #0x1                ; =1
    5298:      	mov	x2, #0x1a               ; =26
    529c:      	b	0x52c4 <_stogir.checked.validate+0x1d0>
    52a0:      	cmp	x1, #0x0
    52a4:      	b.gt	0x5300 <_stogir.checked.validate+0x20c>
    52a8:      	mov	x23, x8
    52ac:      	adrp	x16, 0x5000 <_stogir.checked.validate-projection+0x160>
		00000000000052ac:  ARM64_RELOC_PAGE21	l_stogir.357
    52b0:      	ldr	x16, [x16]
		00000000000052b0:  ARM64_RELOC_PAGEOFF12	l_stogir.357
    52b4:      	orr	x0, x16, xzr
    52b8:      	mov	x1, x0
    52bc:      	mov	x0, #0x1                ; =1
    52c0:      	mov	x2, #0x26               ; =38
    52c4:      	str	x0, [x23]
    52c8:      	str	x1, [x23, #0x8]
    52cc:      	str	x2, [x23, #0x10]
    52d0:      	sub	sp, x29, #0x0
    52d4:      	ldr	x19, [sp, #0x10]
    52d8:      	ldr	x20, [sp, #0x18]
    52dc:      	ldr	x21, [sp, #0x20]
    52e0:      	ldr	x22, [sp, #0x28]
    52e4:      	ldr	x23, [sp, #0x30]
    52e8:      	ldr	x29, [sp]
    52ec:      	ldr	x30, [sp, #0x8]
    52f0:      	add	sp, sp, #0x40
    52f4:      	ret
    52f8:      	movz	x4, #0x0, lsl #48
    52fc:      	b	0x51d4 <_stogir.checked.validate+0xe0>
    5300:      	uxtb	w1, w4
    5304:      	cmp	x1, #0x29
    5308:      	cset	w3, ge
    530c:      	uxtb	w16, w3
    5310:      	cmp	w16, wzr
    5314:      	b.eq	0x5688 <_stogir.checked.validate+0x594>
    5318:      	cmp	x1, #0x2b
    531c:      	cset	w1, le
    5320:      	uxtb	w16, w1
    5324:      	cmp	w16, wzr
    5328:      	b.eq	0x5690 <_stogir.checked.validate+0x59c>
    532c:      	ldr	x6, [x0, #0x78]
    5330:      	add	x2, x2, x6
    5334:      	ldr	w2, [x2]
    5338:      	sxtw	x2, w2
    533c:      	cmp	x2, #0x2
    5340:      	b.ne	0x5698 <_stogir.checked.validate+0x5a4>
    5344:      	adrp	x16, 0x5000 <_stogir.checked.validate-projection+0x160>
		0000000000005344:  ARM64_RELOC_PAGE21	l_stogir.358
    5348:      	ldr	x16, [x16]
		0000000000005348:  ARM64_RELOC_PAGEOFF12	l_stogir.358
    534c:      	orr	x2, x16, xzr
    5350:      	lsr	w6, w4, #0
    5354:      	mov	x19, sp
    5358:      	sub	sp, sp, #0x10
    535c:      	mov	x7, sp
    5360:      	sub	sp, sp, #0x10
    5364:      	mov	x9, sp
    5368:      	ubfx	x6, x6, #8, #8
    536c:      	orr	x20, x6, xzr
    5370:      	uxtb	w16, w3
    5374:      	cmp	w16, wzr
    5378:      	b.eq	0x55f0 <_stogir.checked.validate+0x4fc>
    537c:      	uxtb	w16, w1
    5380:      	cmp	w16, wzr
    5384:      	b.eq	0x55f0 <_stogir.checked.validate+0x4fc>
    5388:      	cmp	x20, #0x1
    538c:      	b.lt	0x55f0 <_stogir.checked.validate+0x4fc>
    5390:      	cmp	x20, #0xb
    5394:      	b.gt	0x55f0 <_stogir.checked.validate+0x4fc>
    5398:      	cmp	x20, #0x1
    539c:      	b.eq	0x55f0 <_stogir.checked.validate+0x4fc>
    53a0:      	mov	x1, x2
    53a4:      	movz	x3, #0x0, lsl #48
    53a8:      	b	0x5600 <_stogir.checked.validate+0x50c>
    53ac:      	movz	x4, #0x0, lsl #48
    53b0:      	b	0x51cc <_stogir.checked.validate+0xd8>
    53b4:      	lsr	x0, x22, #0
    53b8:      	mov	x1, x2
    53bc:      	mov	x2, x0
    53c0:      	mov	x0, x21
    53c4:      	mov	x23, x8
    53c8:      	bl	0x53c8 <_stogir.checked.validate+0x2d4>
		00000000000053c8:  ARM64_RELOC_BRANCH26	_memcmp
    53cc:      	lsr	w0, w0, #0
    53d0:      	sxtw	x0, w0
    53d4:      	cmp	x0, #0x0
    53d8:      	b.eq	0x54e8 <_stogir.checked.validate+0x3f4>
    53dc:      	mov	x1, x21
    53e0:      	mov	x2, x22
    53e4:      	mov	x0, #0x1                ; =1
    53e8:      	mov	sp, x19
    53ec:      	b	0x52c4 <_stogir.checked.validate+0x1d0>
    53f0:      	mov	x1, x11
    53f4:      	mov	x3, #0x28               ; =40
    53f8:      	mov	x21, x1
    53fc:      	mov	x22, x3
    5400:      	mov	x1, x4
    5404:      	cmp	x1, #0x2
    5408:      	b.ge	0x5434 <_stogir.checked.validate+0x340>
    540c:      	add	x3, x1, #0x1
    5410:      	lsl	x1, x1, #2
    5414:      	add	x1, x1, x6
    5418:      	ldr	w1, [x1]
    541c:      	sxtw	x1, w1
    5420:      	and	x1, x1, #0xffffffff
    5424:      	mov	x4, x3
    5428:      	mov	x3, x1
    542c:      	mov	x1, #0x1                ; =1
    5430:      	b	0x5440 <_stogir.checked.validate+0x34c>
    5434:      	mov	x4, x1
    5438:      	movz	x1, #0x0, lsl #48
    543c:      	movz	x3, #0x0, lsl #48
    5440:      	lsr	w1, w1, #0
    5444:      	lsr	x16, x1, #0
    5448:      	cmp	x16, #0x1
    544c:      	b.eq	0x5468 <_stogir.checked.validate+0x374>
    5450:      	b.lo	0x5458 <_stogir.checked.validate+0x364>
    5454:      	b	0x546c <_stogir.checked.validate+0x378>
    5458:      	cmp	x16, #0x0
    545c:      	b.eq	0x5464 <_stogir.checked.validate+0x370>
    5460:      	b	0x546c <_stogir.checked.validate+0x378>
    5464:      	b	0x54d4 <_stogir.checked.validate+0x3e0>
    5468:      	b	0x5470 <_stogir.checked.validate+0x37c>
    546c:      	b	0x5678 <_stogir.checked.validate+0x584>
    5470:      	lsr	w3, w3, #0
    5474:      	sxtw	x3, w3
    5478:      	cmp	x3, #0x0
    547c:      	cset	w1, gt
    5480:      	movz	x16, #0x0, lsl #48
    5484:      	sub	x5, x16, x3
    5488:      	sub	x7, x5, #0x1
    548c:      	uxtb	w16, w1
    5490:      	cmp	w16, wzr
    5494:      	b.eq	0x54fc <_stogir.checked.validate+0x408>
    5498:      	ldr	x5, [x0, #0x8]
    549c:      	cmp	x3, x5
    54a0:      	b.ge	0x5540 <_stogir.checked.validate+0x44c>
    54a4:      	ldr	x5, [x12, #0x8]
    54a8:      	cmp	x3, x5
    54ac:      	b.ge	0x5660 <_stogir.checked.validate+0x56c>
    54b0:      	lsl	x5, x3, #2
    54b4:      	ldr	x9, [x0, #0x78]
    54b8:      	add	x5, x5, x9
    54bc:      	ldr	w5, [x5]
    54c0:      	sxtw	x5, w5
    54c4:      	cmp	x5, #0x0
    54c8:      	cset	w5, ge
    54cc:      	ubfx	x5, x5, #0, #8
    54d0:      	b	0x5664 <_stogir.checked.validate+0x570>
    54d4:      	cmp	x22, #0x0
    54d8:      	b.ne	0x56a0 <_stogir.checked.validate+0x5ac>
    54dc:      	cmp	x22, #0x0
    54e0:      	b.ne	0x53b4 <_stogir.checked.validate+0x2c0>
    54e4:      	mov	x23, x8
    54e8:      	and	x0, x20, #0xffffffff
    54ec:      	mov	x1, x0
    54f0:      	movz	x0, #0x0, lsl #48
    54f4:      	movz	x2, #0x0, lsl #48
    54f8:      	b	0x53e8 <_stogir.checked.validate+0x2f4>
    54fc:      	cmp	x3, #0x0
    5500:      	b.ge	0x5548 <_stogir.checked.validate+0x454>
    5504:      	ldr	x9, [x13, #0x8]
    5508:      	ldr	x15, [x14, #0x8]
    550c:      	cmp	x9, x15
    5510:      	b.ne	0x5658 <_stogir.checked.validate+0x564>
    5514:      	cmp	x5, x9
    5518:      	b.gt	0x5670 <_stogir.checked.validate+0x57c>
    551c:      	lsl	x5, x7, #2
    5520:      	ldr	x9, [x0, #0x50]
    5524:      	add	x5, x5, x9
    5528:      	ldr	w5, [x5]
    552c:      	sxtw	x5, w5
    5530:      	cmp	x5, #0x0
    5534:      	cset	w5, gt
    5538:      	ubfx	x5, x5, #0, #8
    553c:      	b	0x5674 <_stogir.checked.validate+0x580>
    5540:      	movz	x5, #0x0, lsl #48
    5544:      	b	0x554c <_stogir.checked.validate+0x458>
    5548:      	movz	x5, #0x0, lsl #48
    554c:      	cmp	x5, #0x0
    5550:      	b.eq	0x5590 <_stogir.checked.validate+0x49c>
    5554:      	uxtb	w16, w1
    5558:      	cmp	w16, wzr
    555c:      	b.eq	0x5574 <_stogir.checked.validate+0x480>
    5560:      	lsl	x1, x3, #4
    5564:      	ldr	x3, [x0]
    5568:      	add	x1, x1, x3
    556c:      	ldr	x1, [x1]
    5570:      	b	0x5584 <_stogir.checked.validate+0x490>
    5574:      	lsl	x1, x7, #4
    5578:      	ldr	x3, [x0, #0x28]
    557c:      	add	x1, x1, x3
    5580:      	ldr	x1, [x1]
    5584:      	mov	x3, x1
    5588:      	mov	x1, #0x1                ; =1
    558c:      	b	0x5598 <_stogir.checked.validate+0x4a4>
    5590:      	movz	x1, #0x0, lsl #48
    5594:      	movz	x3, #0x0, lsl #48
    5598:      	lsr	w1, w1, #0
    559c:      	lsr	x16, x1, #0
    55a0:      	cmp	x16, #0x1
    55a4:      	b.eq	0x55c0 <_stogir.checked.validate+0x4cc>
    55a8:      	b.lo	0x55b0 <_stogir.checked.validate+0x4bc>
    55ac:      	b	0x55c4 <_stogir.checked.validate+0x4d0>
    55b0:      	cmp	x16, #0x0
    55b4:      	b.eq	0x55bc <_stogir.checked.validate+0x4c8>
    55b8:      	b	0x55c4 <_stogir.checked.validate+0x4d0>
    55bc:      	b	0x55c8 <_stogir.checked.validate+0x4d4>
    55c0:      	b	0x55d4 <_stogir.checked.validate+0x4e0>
    55c4:      	b	0x5680 <_stogir.checked.validate+0x58c>
    55c8:      	mov	x1, x10
    55cc:      	mov	x3, #0x22               ; =34
    55d0:      	b	0x53f8 <_stogir.checked.validate+0x304>
    55d4:      	lsr	w3, w3, #0
    55d8:      	ubfx	x1, x3, #8, #8
    55dc:      	cmp	x1, x20
    55e0:      	b.ne	0x53f0 <_stogir.checked.validate+0x2fc>
    55e4:      	mov	x1, x21
    55e8:      	mov	x3, x22
    55ec:      	b	0x53f8 <_stogir.checked.validate+0x304>
    55f0:      	adrp	x16, 0x5000 <_stogir.checked.validate-projection+0x160>
		00000000000055f0:  ARM64_RELOC_PAGE21	l_stogir.359
    55f4:      	ldr	x16, [x16]
		00000000000055f4:  ARM64_RELOC_PAGEOFF12	l_stogir.359
    55f8:      	orr	x1, x16, xzr
    55fc:      	mov	x3, #0x36               ; =54
    5600:      	orr	x6, x9, xzr
    5604:      	adrp	x16, 0x5000 <_stogir.checked.validate-projection+0x160>
		0000000000005604:  ARM64_RELOC_PAGE21	l_stogir.360
    5608:      	ldr	x16, [x16]
		0000000000005608:  ARM64_RELOC_PAGEOFF12	l_stogir.360
    560c:      	orr	x10, x16, xzr
    5610:      	adrp	x16, 0x5000 <_stogir.checked.validate-projection+0x160>
		0000000000005610:  ARM64_RELOC_PAGE21	l_stogir.361
    5614:      	ldr	x16, [x16]
		0000000000005614:  ARM64_RELOC_PAGEOFF12	l_stogir.361
    5618:      	orr	x11, x16, xzr
    561c:      	add	x12, x0, #0x78
    5620:      	add	x13, x0, #0x28
    5624:      	add	x14, x0, #0x50
    5628:      	lsr	w5, w5, #0
    562c:      	lsr	x4, x4, #32
    5630:      	lsr	w5, w5, #0
    5634:      	lsr	w4, w4, #0
    5638:      	str	w4, [x7]
    563c:      	str	w5, [x7, #0x4]
    5640:      	ldr	x4, [x7]
    5644:      	str	x4, [x9]
    5648:      	mov	x21, x1
    564c:      	mov	x22, x3
    5650:      	movz	x1, #0x0, lsl #48
    5654:      	b	0x5404 <_stogir.checked.validate+0x310>
    5658:      	movz	x5, #0x0, lsl #48
    565c:      	b	0x554c <_stogir.checked.validate+0x458>
    5660:      	movz	x5, #0x0, lsl #48
    5664:      	b	0x5544 <_stogir.checked.validate+0x450>
    5668:      	brk	#0
    566c:      	b	0x5668 <_stogir.checked.validate+0x574>
    5670:      	movz	x5, #0x0, lsl #48
    5674:      	b	0x565c <_stogir.checked.validate+0x568>
    5678:      	brk	#0
    567c:      	b	0x5678 <_stogir.checked.validate+0x584>
    5680:      	brk	#0
    5684:      	b	0x5680 <_stogir.checked.validate+0x58c>
    5688:      	mov	x23, x8
    568c:      	b	0x52ac <_stogir.checked.validate+0x1b8>
    5690:      	mov	x23, x8
    5694:      	b	0x52ac <_stogir.checked.validate+0x1b8>
    5698:      	mov	x23, x8
    569c:      	b	0x52ac <_stogir.checked.validate+0x1b8>
    56a0:      	mov	x23, x8
    56a4:      	b	0x53dc <_stogir.checked.validate+0x2e8>

00000000000056a8 <_stogir.atomic.operation?>:
    56a8:      	sxtw	x0, w0
    56ac:      	cmp	x0, #0x7e
    56b0:      	b.lt	0x56c4 <_stogir.atomic.operation?+0x1c>
    56b4:      	cmp	x0, #0x82
    56b8:      	cset	w0, le
    56bc:      	ubfx	x0, x0, #0, #8
    56c0:      	b	0x56c8 <_stogir.atomic.operation?+0x20>
    56c4:      	movz	x0, #0x0, lsl #48
    56c8:      	ret

00000000000056cc <_stogir.atomic.validate>:
    56cc:      	sub	sp, sp, #0x90
    56d0:      	str	x29, [sp, #0x10]
    56d4:      	str	x30, [sp, #0x18]
    56d8:      	add	x29, sp, #0x10
    56dc:      	str	x19, [sp, #0x40]
    56e0:      	str	x20, [sp, #0x48]
    56e4:      	str	x21, [sp, #0x50]
    56e8:      	str	x22, [sp, #0x58]
    56ec:      	str	x23, [sp, #0x60]
    56f0:      	str	x24, [sp, #0x68]
    56f4:      	str	x25, [sp, #0x70]
    56f8:      	str	x26, [sp, #0x78]
    56fc:      	str	x27, [sp, #0x80]
    5700:      	str	x28, [sp, #0x88]
    5704:      	sub	sp, sp, #0x10
    5708:      	add	x19, sp, #0x10
    570c:      	sxtw	x2, w1
    5710:      	sub	sp, sp, #0x10
    5714:      	add	x3, sp, #0x10
    5718:      	lsl	x4, x2, #2
    571c:      	cmp	x2, #0x0
    5720:      	cset	w5, gt
    5724:      	movz	x16, #0x0, lsl #48
    5728:      	sub	x6, x16, x2
    572c:      	sub	sp, sp, #0x30
    5730:      	add	x20, sp, #0x10
    5734:      	sub	x7, x6, #0x1
    5738:      	sub	sp, sp, #0x10
    573c:      	add	x21, sp, #0x10
    5740:      	sub	sp, sp, #0x10
    5744:      	add	x22, sp, #0x10
    5748:      	uxtb	w16, w5
    574c:      	cmp	w16, wzr
    5750:      	b.eq	0x5790 <_stogir.atomic.validate+0xc4>
    5754:      	ldr	x6, [x0, #0x8]
    5758:      	cmp	x2, x6
    575c:      	b.ge	0x57e4 <_stogir.atomic.validate+0x118>
    5760:      	add	x6, x0, #0x78
    5764:      	ldr	x6, [x6, #0x8]
    5768:      	cmp	x2, x6
    576c:      	b.ge	0x595c <_stogir.atomic.validate+0x290>
    5770:      	ldr	x6, [x0, #0x78]
    5774:      	add	x6, x4, x6
    5778:      	ldr	w6, [x6]
    577c:      	sxtw	x6, w6
    5780:      	cmp	x6, #0x0
    5784:      	cset	w6, ge
    5788:      	ubfx	x6, x6, #0, #8
    578c:      	b	0x5960 <_stogir.atomic.validate+0x294>
    5790:      	cmp	x2, #0x0
    5794:      	b.ge	0x57ec <_stogir.atomic.validate+0x120>
    5798:      	add	x9, x0, #0x28
    579c:      	add	x10, x0, #0x50
    57a0:      	ldr	x9, [x9, #0x8]
    57a4:      	ldr	x10, [x10, #0x8]
    57a8:      	cmp	x9, x10
    57ac:      	b.ne	0x57dc <_stogir.atomic.validate+0x110>
    57b0:      	cmp	x6, x9
    57b4:      	b.gt	0x5a50 <_stogir.atomic.validate+0x384>
    57b8:      	lsl	x6, x7, #2
    57bc:      	ldr	x9, [x0, #0x50]
    57c0:      	add	x6, x6, x9
    57c4:      	ldr	w6, [x6]
    57c8:      	sxtw	x6, w6
    57cc:      	cmp	x6, #0x0
    57d0:      	cset	w6, gt
    57d4:      	ubfx	x6, x6, #0, #8
    57d8:      	b	0x5a54 <_stogir.atomic.validate+0x388>
    57dc:      	movz	x6, #0x0, lsl #48
    57e0:      	b	0x57f0 <_stogir.atomic.validate+0x124>
    57e4:      	movz	x6, #0x0, lsl #48
    57e8:      	b	0x57f0 <_stogir.atomic.validate+0x124>
    57ec:      	movz	x6, #0x0, lsl #48
    57f0:      	cmp	x6, #0x0
    57f4:      	b.eq	0x5858 <_stogir.atomic.validate+0x18c>
    57f8:      	uxtb	w16, w5
    57fc:      	cmp	w16, wzr
    5800:      	b.eq	0x5828 <_stogir.atomic.validate+0x15c>
    5804:      	lsl	x5, x2, #4
    5808:      	ldr	x6, [x0]
    580c:      	add	x5, x5, x6
    5810:      	ldr	x6, [x5]
    5814:      	ldr	x5, [x5, #0x8]
    5818:      	fmov	d31, x5
    581c:      	mov	x5, x6
    5820:      	fmov	x6, d31
    5824:      	b	0x5848 <_stogir.atomic.validate+0x17c>
    5828:      	lsl	x5, x7, #4
    582c:      	ldr	x6, [x0, #0x28]
    5830:      	add	x5, x5, x6
    5834:      	ldr	x6, [x5]
    5838:      	ldr	x5, [x5, #0x8]
    583c:      	fmov	d31, x5
    5840:      	mov	x5, x6
    5844:      	fmov	x6, d31
    5848:      	mov	x7, x6
    584c:      	mov	x6, x5
    5850:      	mov	x5, #0x1                ; =1
    5854:      	b	0x5864 <_stogir.atomic.validate+0x198>
    5858:      	movz	x5, #0x0, lsl #48
    585c:      	movz	x6, #0x0, lsl #48
    5860:      	movz	x7, #0x0, lsl #48
    5864:      	lsr	w5, w5, #0
    5868:      	lsr	x16, x5, #0
    586c:      	cmp	x16, #0x1
    5870:      	b.eq	0x588c <_stogir.atomic.validate+0x1c0>
    5874:      	b.lo	0x587c <_stogir.atomic.validate+0x1b0>
    5878:      	b	0x5890 <_stogir.atomic.validate+0x1c4>
    587c:      	cmp	x16, #0x0
    5880:      	b.eq	0x5888 <_stogir.atomic.validate+0x1bc>
    5884:      	b	0x5890 <_stogir.atomic.validate+0x1c4>
    5888:      	b	0x5894 <_stogir.atomic.validate+0x1c8>
    588c:      	b	0x58f8 <_stogir.atomic.validate+0x22c>
    5890:      	b	0x6138 <_stogir.atomic.validate+0xa6c>
    5894:      	adrp	x16, 0x5000 <_stogir.checked.validate-projection+0x160>
		0000000000005894:  ARM64_RELOC_PAGE21	l_stogir.362
    5898:      	ldr	x16, [x16]
		0000000000005898:  ARM64_RELOC_PAGEOFF12	l_stogir.362
    589c:      	orr	x0, x16, xzr
    58a0:      	mov	x23, x8
    58a4:      	mov	x1, x0
    58a8:      	mov	x0, #0x1                ; =1
    58ac:      	mov	x2, #0x1a               ; =26
    58b0:      	str	x0, [x23]
    58b4:      	str	x1, [x23, #0x8]
    58b8:      	str	x2, [x23, #0x10]
    58bc:      	sub	sp, x29, #0x10
    58c0:      	ldr	x19, [sp, #0x40]
    58c4:      	ldr	x20, [sp, #0x48]
    58c8:      	ldr	x21, [sp, #0x50]
    58cc:      	ldr	x22, [sp, #0x58]
    58d0:      	ldr	x23, [sp, #0x60]
    58d4:      	ldr	x24, [sp, #0x68]
    58d8:      	ldr	x25, [sp, #0x70]
    58dc:      	ldr	x26, [sp, #0x78]
    58e0:      	ldr	x27, [sp, #0x80]
    58e4:      	ldr	x28, [sp, #0x88]
    58e8:      	ldr	x29, [sp, #0x10]
    58ec:      	ldr	x30, [sp, #0x18]
    58f0:      	add	sp, sp, #0x90
    58f4:      	ret
    58f8:      	adrp	x16, 0x5000 <_stogir.checked.validate-projection+0x160>
		00000000000058f8:  ARM64_RELOC_PAGE21	l_stogir.363
    58fc:      	ldr	x16, [x16]
		00000000000058fc:  ARM64_RELOC_PAGEOFF12	l_stogir.363
    5900:      	orr	x23, x16, xzr
    5904:      	uxtb	w5, w6
    5908:      	str	x6, [x19]
    590c:      	orr	x24, x5, xzr
    5910:      	str	x7, [x19, #0x8]
    5914:      	cmp	x2, #0x0
    5918:      	b.le	0x5974 <_stogir.atomic.validate+0x2a8>
    591c:      	cmp	x24, #0x7e
    5920:      	b.lt	0x5974 <_stogir.atomic.validate+0x2a8>
    5924:      	cmp	x24, #0x82
    5928:      	b.gt	0x5974 <_stogir.atomic.validate+0x2a8>
    592c:      	ldr	x2, [x0, #0x78]
    5930:      	add	x2, x4, x2
    5934:      	ldr	w2, [x2]
    5938:      	cmp	x24, #0x83
    593c:      	b.ge	0x60e0 <_stogir.atomic.validate+0xa14>
    5940:      	adrp	x16, 0x5000 <_stogir.checked.validate-projection+0x160>
		0000000000005940:  ARM64_RELOC_PAGE21	l_stogir.364
    5944:      	ldr	x16, [x16]
		0000000000005944:  ARM64_RELOC_PAGEOFF12	l_stogir.364
    5948:      	orr	x4, x16, xzr
    594c:      	add	x4, x24, x4
    5950:      	ldrsb	w4, [x4]
    5954:      	sxtb	x4, w4
    5958:      	b	0x60e4 <_stogir.atomic.validate+0xa18>
    595c:      	movz	x6, #0x0, lsl #48
    5960:      	b	0x57e8 <_stogir.atomic.validate+0x11c>
    5964:      	mov	x1, x19
    5968:      	mov	x2, x20
    596c:      	mov	x0, #0x1                ; =1
    5970:      	b	0x58b0 <_stogir.atomic.validate+0x1e4>
    5974:      	adrp	x16, 0x5000 <_stogir.checked.validate-projection+0x160>
		0000000000005974:  ARM64_RELOC_PAGE21	l_stogir.365
    5978:      	ldr	x16, [x16]
		0000000000005978:  ARM64_RELOC_PAGEOFF12	l_stogir.365
    597c:      	orr	x2, x16, xzr
    5980:      	mov	x4, #0x20               ; =32
    5984:      	ldr	w5, [x19, #0x4]
    5988:      	sxtw	x5, w5
    598c:      	cmp	x5, #0x0
    5990:      	cset	w7, gt
    5994:      	movz	x16, #0x0, lsl #48
    5998:      	sub	x9, x16, x5
    599c:      	sub	x10, x9, #0x1
    59a0:      	uxtb	w16, w7
    59a4:      	cmp	w16, wzr
    59a8:      	b.eq	0x59f8 <_stogir.atomic.validate+0x32c>
    59ac:      	ldr	x9, [x0, #0x8]
    59b0:      	cmp	x5, x9
    59b4:      	b.ge	0x5a98 <_stogir.atomic.validate+0x3cc>
    59b8:      	add	x9, x0, #0x78
    59bc:      	ldr	x9, [x9, #0x8]
    59c0:      	cmp	x5, x9
    59c4:      	b.ge	0x5d7c <_stogir.atomic.validate+0x6b0>
    59c8:      	lsl	x9, x5, #2
    59cc:      	ldr	x11, [x0, #0x78]
    59d0:      	add	x9, x9, x11
    59d4:      	ldr	w9, [x9]
    59d8:      	sxtw	x9, w9
    59dc:      	cmp	x9, #0x0
    59e0:      	cset	w9, ge
    59e4:      	ubfx	x9, x9, #0, #8
    59e8:      	fmov	d31, x2
    59ec:      	mov	x2, x9
    59f0:      	fmov	x9, d31
    59f4:      	b	0x5d84 <_stogir.atomic.validate+0x6b8>
    59f8:      	cmp	x5, #0x0
    59fc:      	b.ge	0x5aa8 <_stogir.atomic.validate+0x3dc>
    5a00:      	add	x11, x0, #0x28
    5a04:      	add	x12, x0, #0x50
    5a08:      	ldr	x11, [x11, #0x8]
    5a0c:      	ldr	x12, [x12, #0x8]
    5a10:      	cmp	x11, x12
    5a14:      	b.ne	0x5d6c <_stogir.atomic.validate+0x6a0>
    5a18:      	cmp	x9, x11
    5a1c:      	b.gt	0x5f78 <_stogir.atomic.validate+0x8ac>
    5a20:      	lsl	x9, x10, #2
    5a24:      	ldr	x11, [x0, #0x50]
    5a28:      	add	x9, x9, x11
    5a2c:      	ldr	w9, [x9]
    5a30:      	sxtw	x9, w9
    5a34:      	cmp	x9, #0x0
    5a38:      	cset	w9, gt
    5a3c:      	ubfx	x9, x9, #0, #8
    5a40:      	fmov	d31, x2
    5a44:      	mov	x2, x9
    5a48:      	fmov	x9, d31
    5a4c:      	b	0x5f80 <_stogir.atomic.validate+0x8b4>
    5a50:      	movz	x6, #0x0, lsl #48
    5a54:      	b	0x57e0 <_stogir.atomic.validate+0x114>
    5a58:      	mov	w0, w27
    5a5c:      	mov	x1, #0x8                ; =8
    5a60:      	bl	0x5a60 <_stogir.atomic.validate+0x394>
		0000000000005a60:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    5a64:      	lsr	w0, w0, #0
    5a68:      	sxtw	x0, w0
    5a6c:      	and	x0, x0, #0xffffffff
    5a70:      	mov	x1, x0
    5a74:      	movz	x0, #0x0, lsl #48
    5a78:      	movz	x2, #0x0, lsl #48
    5a7c:      	b	0x5970 <_stogir.atomic.validate+0x2a4>
    5a80:      	mov	x0, x1
    5a84:      	mov	x1, x2
    5a88:      	mov	x2, x1
    5a8c:      	mov	x1, x0
    5a90:      	mov	x0, x20
    5a94:      	b	0x5c48 <_stogir.atomic.validate+0x57c>
    5a98:      	mov	x9, x4
    5a9c:      	mov	x4, x2
    5aa0:      	movz	x2, #0x0, lsl #48
    5aa4:      	b	0x5ab4 <_stogir.atomic.validate+0x3e8>
    5aa8:      	mov	x9, x4
    5aac:      	mov	x4, x2
    5ab0:      	movz	x2, #0x0, lsl #48
    5ab4:      	cmp	x2, #0x0
    5ab8:      	b.eq	0x5b28 <_stogir.atomic.validate+0x45c>
    5abc:      	uxtb	w16, w7
    5ac0:      	cmp	w16, wzr
    5ac4:      	b.eq	0x5af0 <_stogir.atomic.validate+0x424>
    5ac8:      	lsl	x2, x5, #4
    5acc:      	ldr	x5, [x0]
    5ad0:      	add	x2, x2, x5
    5ad4:      	ldr	x5, [x2]
    5ad8:      	ldr	x2, [x2, #0x8]
    5adc:      	fmov	d31, x2
    5ae0:      	mov	x2, x5
    5ae4:      	mov	x5, x4
    5ae8:      	fmov	x4, d31
    5aec:      	b	0x5b14 <_stogir.atomic.validate+0x448>
    5af0:      	lsl	x2, x10, #4
    5af4:      	ldr	x5, [x0, #0x28]
    5af8:      	add	x2, x2, x5
    5afc:      	ldr	x5, [x2]
    5b00:      	ldr	x2, [x2, #0x8]
    5b04:      	fmov	d31, x2
    5b08:      	mov	x2, x5
    5b0c:      	mov	x5, x4
    5b10:      	fmov	x4, d31
    5b14:      	mov	x7, x5
    5b18:      	mov	x5, x4
    5b1c:      	mov	x4, x2
    5b20:      	mov	x2, #0x1                ; =1
    5b24:      	b	0x5b38 <_stogir.atomic.validate+0x46c>
    5b28:      	mov	x7, x4
    5b2c:      	movz	x2, #0x0, lsl #48
    5b30:      	movz	x4, #0x0, lsl #48
    5b34:      	movz	x5, #0x0, lsl #48
    5b38:      	lsr	w2, w2, #0
    5b3c:      	lsr	x16, x2, #0
    5b40:      	cmp	x16, #0x1
    5b44:      	b.eq	0x5b60 <_stogir.atomic.validate+0x494>
    5b48:      	b.lo	0x5b50 <_stogir.atomic.validate+0x484>
    5b4c:      	b	0x5b64 <_stogir.atomic.validate+0x498>
    5b50:      	cmp	x16, #0x0
    5b54:      	b.eq	0x5b5c <_stogir.atomic.validate+0x490>
    5b58:      	b	0x5b64 <_stogir.atomic.validate+0x498>
    5b5c:      	b	0x5b68 <_stogir.atomic.validate+0x49c>
    5b60:      	b	0x5c6c <_stogir.atomic.validate+0x5a0>
    5b64:      	b	0x6170 <_stogir.atomic.validate+0xaa4>
    5b68:      	adrp	x16, 0x5000 <_stogir.checked.validate-projection+0x160>
		0000000000005b68:  ARM64_RELOC_PAGE21	l_stogir.366
    5b6c:      	ldr	x16, [x16]
		0000000000005b6c:  ARM64_RELOC_PAGEOFF12	l_stogir.366
    5b70:      	orr	x2, x16, xzr
    5b74:      	mov	x3, #0x16               ; =22
    5b78:      	b	0x5b84 <_stogir.atomic.validate+0x4b8>
    5b7c:      	mov	x2, x3
    5b80:      	mov	x3, x4
    5b84:      	cmp	x24, #0x82
    5b88:      	cset	w25, eq
    5b8c:      	lsr	w6, w6, #0
    5b90:      	ubfx	x4, x6, #8, #8
    5b94:      	orr	x26, x4, xzr
    5b98:      	cmp	x26, #0x0
    5b9c:      	cset	w27, eq
    5ba0:      	uxtb	w16, w25
    5ba4:      	cmp	w16, wzr
    5ba8:      	b.eq	0x5bd0 <_stogir.atomic.validate+0x504>
    5bac:      	uxtb	w16, w27
    5bb0:      	cmp	w16, wzr
    5bb4:      	b.eq	0x5e18 <_stogir.atomic.validate+0x74c>
    5bb8:      	mov	x4, x2
    5bbc:      	movz	x2, #0x0, lsl #48
    5bc0:      	b	0x5e20 <_stogir.atomic.validate+0x754>
    5bc4:      	mov	x2, x4
    5bc8:      	mov	x28, x3
    5bcc:      	b	0x5bd4 <_stogir.atomic.validate+0x508>
    5bd0:      	mov	x28, x3
    5bd4:      	uxtb	w16, w25
    5bd8:      	cmp	w16, wzr
    5bdc:      	b.eq	0x5bec <_stogir.atomic.validate+0x520>
    5be0:      	mov	x3, x2
    5be4:      	movz	x2, #0x0, lsl #48
    5be8:      	b	0x5bf4 <_stogir.atomic.validate+0x528>
    5bec:      	mov	x3, x2
    5bf0:      	mov	x2, #0x1                ; =1
    5bf4:      	cmp	x2, #0x0
    5bf8:      	b.eq	0x6188 <_stogir.atomic.validate+0xabc>
    5bfc:      	ldr	w2, [x19, #0x8]
    5c00:      	lsr	w2, w2, #0
    5c04:      	str	x0, [x29, #0x18]
    5c08:      	str	x3, [x29, #0x28]
    5c0c:      	str	x23, [x29, #0x10]
    5c10:      	mov	x23, x8
    5c14:      	str	x26, [x29, #0x20]
    5c18:      	mov	w26, w1
    5c1c:      	mov	w1, w2
    5c20:      	mov	x2, #0x6                ; =6
    5c24:      	bl	0x5c24 <_stogir.atomic.validate+0x558>
		0000000000005c24:  ARM64_RELOC_BRANCH26	_stogir.atomic.ordinary?
    5c28:      	cmp	x0, #0x0
    5c2c:      	b.eq	0x5db0 <_stogir.atomic.validate+0x6e4>
    5c30:      	ldr	x1, [x29, #0x28]
    5c34:      	movz	x0, #0x0, lsl #48
    5c38:      	b	0x5db8 <_stogir.atomic.validate+0x6ec>
    5c3c:      	ldr	x0, [x29, #0x20]
    5c40:      	ldr	x1, [x29, #0x28]
    5c44:      	mov	x2, x28
    5c48:      	cmp	x24, #0x80
    5c4c:      	cset	w19, eq
    5c50:      	uxtb	w16, w19
    5c54:      	cmp	w16, wzr
    5c58:      	b.eq	0x5c94 <_stogir.atomic.validate+0x5c8>
    5c5c:      	mov	x20, x1
    5c60:      	mov	x24, x2
    5c64:      	mov	x1, #0x1                ; =1
    5c68:      	b	0x5cac <_stogir.atomic.validate+0x5e0>
    5c6c:      	str	x4, [x3]
    5c70:      	str	x5, [x3, #0x8]
    5c74:      	ldr	w2, [x19, #0x4]
    5c78:      	sxtw	x2, w2
    5c7c:      	cmp	x2, #0x0
    5c80:      	b.gt	0x5e84 <_stogir.atomic.validate+0x7b8>
    5c84:      	mov	x3, x7
    5c88:      	mov	x4, x9
    5c8c:      	mov	x2, #0x1                ; =1
    5c90:      	b	0x5e68 <_stogir.atomic.validate+0x79c>
    5c94:      	cmp	x24, #0x81
    5c98:      	cset	w3, eq
    5c9c:      	ubfx	x3, x3, #0, #8
    5ca0:      	mov	x20, x1
    5ca4:      	mov	x1, x3
    5ca8:      	mov	x24, x2
    5cac:      	lsr	w27, w0, #0
    5cb0:      	cmp	x1, #0x0
    5cb4:      	b.eq	0x5d34 <_stogir.atomic.validate+0x668>
    5cb8:      	lsr	w26, w26, #0
    5cbc:      	mov	x16, x22
    5cc0:      	str	x16, [sp]
    5cc4:      	ldr	x0, [x29, #0x18]
    5cc8:      	mov	w1, w26
    5ccc:      	mov	x2, #0x4                ; =4
    5cd0:      	bl	0x5cd0 <_stogir.atomic.validate+0x604>
		0000000000005cd0:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    5cd4:      	ldr	x16, [sp]
    5cd8:      	str	x0, [x16]
    5cdc:      	str	x1, [x16, #0x8]
    5ce0:      	ldr	x0, [x22]
    5ce4:      	ldr	x1, [x22, #0x8]
    5ce8:      	lsr	w2, w0, #0
    5cec:      	str	x0, [x21]
    5cf0:      	str	x1, [x21, #0x8]
    5cf4:      	lsr	x16, x2, #0
    5cf8:      	cmp	x16, #0x1
    5cfc:      	b.eq	0x5d18 <_stogir.atomic.validate+0x64c>
    5d00:      	b.lo	0x5d08 <_stogir.atomic.validate+0x63c>
    5d04:      	b	0x5d1c <_stogir.atomic.validate+0x650>
    5d08:      	cmp	x16, #0x0
    5d0c:      	b.eq	0x5d14 <_stogir.atomic.validate+0x648>
    5d10:      	b	0x5d1c <_stogir.atomic.validate+0x650>
    5d14:      	b	0x5d20 <_stogir.atomic.validate+0x654>
    5d18:      	b	0x5fb4 <_stogir.atomic.validate+0x8e8>
    5d1c:      	b	0x6178 <_stogir.atomic.validate+0xaac>
    5d20:      	adrp	x16, 0x5000 <_stogir.checked.validate-projection+0x160>
		0000000000005d20:  ARM64_RELOC_PAGE21	l_stogir.367
    5d24:      	ldr	x16, [x16]
		0000000000005d24:  ARM64_RELOC_PAGEOFF12	l_stogir.367
    5d28:      	orr	x0, x16, xzr
    5d2c:      	mov	x1, #0x1d               ; =29
    5d30:      	b	0x5da4 <_stogir.atomic.validate+0x6d8>
    5d34:      	mov	x19, x20
    5d38:      	mov	x20, x24
    5d3c:      	mov	x0, x19
    5d40:      	mov	x1, x20
    5d44:      	ldr	x2, [x29, #0x10]
    5d48:      	movz	x3, #0x0, lsl #48
    5d4c:      	bl	0x5d4c <_stogir.atomic.validate+0x680>
		0000000000005d4c:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
    5d50:      	cmp	x0, #0x0
    5d54:      	b.eq	0x5964 <_stogir.atomic.validate+0x298>
    5d58:      	uxtb	w16, w25
    5d5c:      	cmp	w16, wzr
    5d60:      	b.eq	0x5a58 <_stogir.atomic.validate+0x38c>
    5d64:      	movz	x0, #0x0, lsl #48
    5d68:      	b	0x5a6c <_stogir.atomic.validate+0x3a0>
    5d6c:      	mov	x9, x4
    5d70:      	mov	x4, x2
    5d74:      	movz	x2, #0x0, lsl #48
    5d78:      	b	0x5ab4 <_stogir.atomic.validate+0x3e8>
    5d7c:      	mov	x9, x2
    5d80:      	movz	x2, #0x0, lsl #48
    5d84:      	fmov	d31, x4
    5d88:      	mov	x4, x9
    5d8c:      	fmov	x9, d31
    5d90:      	b	0x5aa4 <_stogir.atomic.validate+0x3d8>
    5d94:      	adrp	x16, 0x5000 <_stogir.checked.validate-projection+0x160>
		0000000000005d94:  ARM64_RELOC_PAGE21	l_stogir.368
    5d98:      	ldr	x16, [x16]
		0000000000005d98:  ARM64_RELOC_PAGEOFF12	l_stogir.368
    5d9c:      	orr	x0, x16, xzr
    5da0:      	mov	x1, #0x24               ; =36
    5da4:      	mov	x19, x0
    5da8:      	mov	x20, x1
    5dac:      	b	0x5d3c <_stogir.atomic.validate+0x670>
    5db0:      	ldr	x1, [x29, #0x28]
    5db4:      	mov	x0, #0x1                ; =1
    5db8:      	cmp	x0, #0x0
    5dbc:      	b.eq	0x5dd4 <_stogir.atomic.validate+0x708>
    5dc0:      	adrp	x16, 0x5000 <_stogir.checked.validate-projection+0x160>
		0000000000005dc0:  ARM64_RELOC_PAGE21	l_stogir.369
    5dc4:      	ldr	x16, [x16]
		0000000000005dc4:  ARM64_RELOC_PAGEOFF12	l_stogir.369
    5dc8:      	orr	x0, x16, xzr
    5dcc:      	mov	x1, #0x1b               ; =27
    5dd0:      	b	0x5ddc <_stogir.atomic.validate+0x710>
    5dd4:      	mov	x0, x1
    5dd8:      	mov	x1, x28
    5ddc:      	cmp	x24, #0x7f
    5de0:      	b.ne	0x5dfc <_stogir.atomic.validate+0x730>
    5de4:      	uxtb	w16, w27
    5de8:      	cmp	w16, wzr
    5dec:      	b.eq	0x5fe0 <_stogir.atomic.validate+0x914>
    5df0:      	mov	x2, x0
    5df4:      	movz	x0, #0x0, lsl #48
    5df8:      	b	0x5fe8 <_stogir.atomic.validate+0x91c>
    5dfc:      	ldr	x20, [x29, #0x20]
    5e00:      	cmp	x20, #0x2
    5e04:      	b.ge	0x5f40 <_stogir.atomic.validate+0x874>
    5e08:      	mov	x2, x1
    5e0c:      	mov	x1, x0
    5e10:      	mov	x0, #0x1                ; =1
    5e14:      	b	0x5f5c <_stogir.atomic.validate+0x890>
    5e18:      	mov	x4, x2
    5e1c:      	mov	x2, #0x1                ; =1
    5e20:      	cmp	x2, #0x0
    5e24:      	b.eq	0x5bc4 <_stogir.atomic.validate+0x4f8>
    5e28:      	adrp	x16, 0x5000 <_stogir.checked.validate-projection+0x160>
		0000000000005e28:  ARM64_RELOC_PAGE21	l_stogir.370
    5e2c:      	ldr	x16, [x16]
		0000000000005e2c:  ARM64_RELOC_PAGEOFF12	l_stogir.370
    5e30:      	orr	x2, x16, xzr
    5e34:      	mov	x3, #0x19               ; =25
    5e38:      	b	0x5bc8 <_stogir.atomic.validate+0x4fc>
    5e3c:      	mov	x3, x4
    5e40:      	movz	x2, #0x0, lsl #48
    5e44:      	uxtb	w2, w2
    5e48:      	and	x2, x2, #0x4
    5e4c:      	uxtb	w2, w2
    5e50:      	cmp	x2, #0x0
    5e54:      	cset	w2, eq
    5e58:      	uxtb	w16, w2
    5e5c:      	cmp	w16, wzr
    5e60:      	cset	x2, eq
    5e64:      	mov	x4, x9
    5e68:      	cmp	x2, #0x0
    5e6c:      	b.eq	0x5b7c <_stogir.atomic.validate+0x4b0>
    5e70:      	adrp	x16, 0x5000 <_stogir.checked.validate-projection+0x160>
		0000000000005e70:  ARM64_RELOC_PAGE21	l_stogir.371
    5e74:      	ldr	x16, [x16]
		0000000000005e74:  ARM64_RELOC_PAGEOFF12	l_stogir.371
    5e78:      	orr	x2, x16, xzr
    5e7c:      	mov	x3, #0x16               ; =22
    5e80:      	b	0x5b84 <_stogir.atomic.validate+0x4b8>
    5e84:      	ldr	w2, [x3]
    5e88:      	uxtb	w2, w2
    5e8c:      	cmp	x2, #0x83
    5e90:      	b.ge	0x60bc <_stogir.atomic.validate+0x9f0>
    5e94:      	adrp	x16, 0x5000 <_stogir.checked.validate-projection+0x160>
		0000000000005e94:  ARM64_RELOC_PAGE21	l_stogir.372
    5e98:      	ldr	x16, [x16]
		0000000000005e98:  ARM64_RELOC_PAGEOFF12	l_stogir.372
    5e9c:      	orr	x4, x16, xzr
    5ea0:      	add	x2, x2, x4
    5ea4:      	ldrb	w2, [x2]
    5ea8:      	mov	x4, x7
    5eac:      	b	0x60c4 <_stogir.atomic.validate+0x9f8>
    5eb0:      	mov	x1, x28
    5eb4:      	mov	x2, x27
    5eb8:      	movz	x0, #0x0, lsl #48
    5ebc:      	cmp	x0, #0x0
    5ec0:      	b.eq	0x5a80 <_stogir.atomic.validate+0x3b4>
    5ec4:      	adrp	x16, 0x5000 <_stogir.checked.validate-projection+0x160>
		0000000000005ec4:  ARM64_RELOC_PAGE21	l_stogir.373
    5ec8:      	ldr	x16, [x16]
		0000000000005ec8:  ARM64_RELOC_PAGEOFF12	l_stogir.373
    5ecc:      	orr	x0, x16, xzr
    5ed0:      	mov	x1, #0x22               ; =34
    5ed4:      	b	0x5a88 <_stogir.atomic.validate+0x3bc>
    5ed8:      	mov	x1, x28
    5edc:      	mov	x0, #0x1                ; =1
    5ee0:      	mov	x2, x27
    5ee4:      	b	0x5ebc <_stogir.atomic.validate+0x7f0>
    5ee8:      	mov	x28, x0
    5eec:      	mov	x0, #0x1                ; =1
    5ef0:      	cmp	x0, #0x0
    5ef4:      	b.eq	0x5eb0 <_stogir.atomic.validate+0x7e4>
    5ef8:      	lsr	w0, w20, #0
    5efc:      	ldr	w1, [x19, #0xc]
    5f00:      	lsr	w1, w1, #0
    5f04:      	mov	w2, w0
    5f08:      	ldr	x0, [x29, #0x18]
    5f0c:      	bl	0x5f0c <_stogir.atomic.validate+0x840>
		0000000000005f0c:  ARM64_RELOC_BRANCH26	_stogir.atomic.ordinary?
    5f10:      	cmp	x0, #0x0
    5f14:      	b.eq	0x5ed8 <_stogir.atomic.validate+0x80c>
    5f18:      	mov	x1, x28
    5f1c:      	movz	x0, #0x0, lsl #48
    5f20:      	b	0x5ee0 <_stogir.atomic.validate+0x814>
    5f24:      	mov	x0, x1
    5f28:      	mov	x27, x2
    5f2c:      	cmp	x24, #0x7e
    5f30:      	b.ne	0x5ee8 <_stogir.atomic.validate+0x81c>
    5f34:      	mov	x28, x0
    5f38:      	movz	x0, #0x0, lsl #48
    5f3c:      	b	0x5ef0 <_stogir.atomic.validate+0x824>
    5f40:      	cmp	x20, #0x5
    5f44:      	cset	w2, gt
    5f48:      	ubfx	x2, x2, #0, #8
    5f4c:      	fmov	d31, x0
    5f50:      	mov	x0, x2
    5f54:      	mov	x2, x1
    5f58:      	fmov	x1, d31
    5f5c:      	cmp	x0, #0x0
    5f60:      	b.eq	0x5f24 <_stogir.atomic.validate+0x858>
    5f64:      	adrp	x16, 0x5000 <_stogir.checked.validate-projection+0x160>
		0000000000005f64:  ARM64_RELOC_PAGE21	l_stogir.374
    5f68:      	ldr	x16, [x16]
		0000000000005f68:  ARM64_RELOC_PAGEOFF12	l_stogir.374
    5f6c:      	orr	x0, x16, xzr
    5f70:      	mov	x27, #0x25              ; =37
    5f74:      	b	0x5f2c <_stogir.atomic.validate+0x860>
    5f78:      	mov	x9, x2
    5f7c:      	movz	x2, #0x0, lsl #48
    5f80:      	fmov	d31, x4
    5f84:      	mov	x4, x9
    5f88:      	fmov	x9, d31
    5f8c:      	b	0x5d78 <_stogir.atomic.validate+0x6ac>
    5f90:      	ldr	x0, [x20, #0x8]
    5f94:      	lsr	w0, w0, #0
    5f98:      	ubfx	x0, x0, #8, #8
    5f9c:      	mov	x1, x27
    5fa0:      	mov	x2, x28
    5fa4:      	mov	x20, x0
    5fa8:      	mov	x0, x1
    5fac:      	mov	x1, x2
    5fb0:      	b	0x5e00 <_stogir.atomic.validate+0x734>
    5fb4:      	ldr	w0, [x21, #0x8]
    5fb8:      	uxtb	w16, w19
    5fbc:      	cmp	w16, wzr
    5fc0:      	b.eq	0x6110 <_stogir.atomic.validate+0xa44>
    5fc4:      	sxtw	x0, w0
    5fc8:      	cmp	x0, #0x0
    5fcc:      	b.ge	0x6140 <_stogir.atomic.validate+0xa74>
    5fd0:      	mov	x1, x20
    5fd4:      	mov	x2, x24
    5fd8:      	mov	x0, #0x1                ; =1
    5fdc:      	b	0x6154 <_stogir.atomic.validate+0xa88>
    5fe0:      	mov	x2, x0
    5fe4:      	mov	x0, #0x1                ; =1
    5fe8:      	cmp	x0, #0x0
    5fec:      	b.eq	0x6008 <_stogir.atomic.validate+0x93c>
    5ff0:      	adrp	x16, 0x5000 <_stogir.checked.validate-projection+0x160>
		0000000000005ff0:  ARM64_RELOC_PAGE21	l_stogir.375
    5ff4:      	ldr	x16, [x16]
		0000000000005ff4:  ARM64_RELOC_PAGEOFF12	l_stogir.375
    5ff8:      	orr	x0, x16, xzr
    5ffc:      	mov	x27, x0
    6000:      	mov	x28, #0x19              ; =25
    6004:      	b	0x6010 <_stogir.atomic.validate+0x944>
    6008:      	mov	x27, x2
    600c:      	mov	x28, x1
    6010:      	ldr	w0, [x19, #0xc]
    6014:      	lsr	w0, w0, #0
    6018:      	mov	x8, x20
    601c:      	mov	w1, w0
    6020:      	ldr	x0, [x29, #0x18]
    6024:      	bl	0x6024 <_stogir.atomic.validate+0x958>
		0000000000006024:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    6028:      	ldr	w0, [x20]
    602c:      	lsr	x16, x0, #0
    6030:      	cmp	x16, #0x1
    6034:      	b.eq	0x6050 <_stogir.atomic.validate+0x984>
    6038:      	b.lo	0x6040 <_stogir.atomic.validate+0x974>
    603c:      	b	0x6054 <_stogir.atomic.validate+0x988>
    6040:      	cmp	x16, #0x0
    6044:      	b.eq	0x604c <_stogir.atomic.validate+0x980>
    6048:      	b	0x6054 <_stogir.atomic.validate+0x988>
    604c:      	b	0x6058 <_stogir.atomic.validate+0x98c>
    6050:      	b	0x5f90 <_stogir.atomic.validate+0x8c4>
    6054:      	b	0x6180 <_stogir.atomic.validate+0xab4>
    6058:      	adrp	x16, 0x6000 <_stogir.atomic.validate+0x934>
		0000000000006058:  ARM64_RELOC_PAGE21	l_stogir.376
    605c:      	ldr	x16, [x16]
		000000000000605c:  ARM64_RELOC_PAGEOFF12	l_stogir.376
    6060:      	orr	x0, x16, xzr
    6064:      	mov	x1, x0
    6068:      	ldr	x0, [x29, #0x20]
    606c:      	mov	x2, #0x1a               ; =26
    6070:      	b	0x5fa4 <_stogir.atomic.validate+0x8d8>
    6074:      	mov	x2, #0x1                ; =1
    6078:      	cmp	x2, #0x0
    607c:      	b.eq	0x6090 <_stogir.atomic.validate+0x9c4>
    6080:      	mov	x3, x4
    6084:      	mov	x4, x9
    6088:      	mov	x2, #0x1                ; =1
    608c:      	b	0x5e68 <_stogir.atomic.validate+0x79c>
    6090:      	ldr	w2, [x3]
    6094:      	uxtb	w2, w2
    6098:      	cmp	x2, #0x83
    609c:      	b.ge	0x5e3c <_stogir.atomic.validate+0x770>
    60a0:      	adrp	x16, 0x6000 <_stogir.atomic.validate+0x934>
		00000000000060a0:  ARM64_RELOC_PAGE21	l_stogir.372
    60a4:      	ldr	x16, [x16]
		00000000000060a4:  ARM64_RELOC_PAGEOFF12	l_stogir.372
    60a8:      	orr	x3, x16, xzr
    60ac:      	add	x2, x2, x3
    60b0:      	ldrb	w2, [x2]
    60b4:      	mov	x3, x4
    60b8:      	b	0x5e44 <_stogir.atomic.validate+0x778>
    60bc:      	mov	x4, x7
    60c0:      	movz	x2, #0x0, lsl #48
    60c4:      	uxtb	w2, w2
    60c8:      	and	x2, x2, #0x1
    60cc:      	uxtb	w2, w2
    60d0:      	cmp	x2, #0x0
    60d4:      	b.eq	0x6074 <_stogir.atomic.validate+0x9a8>
    60d8:      	movz	x2, #0x0, lsl #48
    60dc:      	b	0x6078 <_stogir.atomic.validate+0x9ac>
    60e0:      	mov	x4, #-0x2               ; =-2
    60e4:      	sxtw	x2, w2
    60e8:      	lsr	w4, w4, #0
    60ec:      	sxtw	x4, w4
    60f0:      	cmp	x2, x4
    60f4:      	b.ne	0x5974 <_stogir.atomic.validate+0x2a8>
    60f8:      	mov	x2, x23
    60fc:      	movz	x4, #0x0, lsl #48
    6100:      	b	0x5984 <_stogir.atomic.validate+0x2b8>
    6104:      	mov	x0, x1
    6108:      	mov	x1, x2
    610c:      	b	0x5da4 <_stogir.atomic.validate+0x6d8>
    6110:      	lsr	w0, w0, #0
    6114:      	mov	w1, w0
    6118:      	ldr	x0, [x29, #0x18]
    611c:      	mov	w2, w27
    6120:      	bl	0x6120 <_stogir.atomic.validate+0xa54>
		0000000000006120:  ARM64_RELOC_BRANCH26	_stogir.atomic.ordinary?
    6124:      	cmp	x0, #0x0
    6128:      	b.eq	0x5d94 <_stogir.atomic.validate+0x6c8>
    612c:      	mov	x0, x20
    6130:      	mov	x1, x24
    6134:      	b	0x5da4 <_stogir.atomic.validate+0x6d8>
    6138:      	brk	#0
    613c:      	b	0x6138 <_stogir.atomic.validate+0xa6c>
    6140:      	cmp	x0, #0x9
    6144:      	cset	w0, gt
    6148:      	ubfx	x0, x0, #0, #8
    614c:      	mov	x1, x20
    6150:      	mov	x2, x24
    6154:      	cmp	x0, #0x0
    6158:      	b.eq	0x6104 <_stogir.atomic.validate+0xa38>
    615c:      	adrp	x16, 0x6000 <_stogir.atomic.validate+0x934>
		000000000000615c:  ARM64_RELOC_PAGE21	l_stogir.377
    6160:      	ldr	x16, [x16]
		0000000000006160:  ARM64_RELOC_PAGEOFF12	l_stogir.377
    6164:      	orr	x0, x16, xzr
    6168:      	mov	x1, #0x1c               ; =28
    616c:      	b	0x610c <_stogir.atomic.validate+0xa40>
    6170:      	brk	#0
    6174:      	b	0x6170 <_stogir.atomic.validate+0xaa4>
    6178:      	brk	#0
    617c:      	b	0x6178 <_stogir.atomic.validate+0xaac>
    6180:      	brk	#0
    6184:      	b	0x6180 <_stogir.atomic.validate+0xab4>
    6188:      	str	x0, [x29, #0x18]
    618c:      	str	x23, [x29, #0x10]
    6190:      	mov	x23, x8
    6194:      	str	x26, [x29, #0x20]
    6198:      	mov	w26, w1
    619c:      	str	x3, [x29, #0x28]
    61a0:      	b	0x5c3c <_stogir.atomic.validate+0x570>

00000000000061a4 <_stogir.terminal.operation?>:
    61a4:      	sxtw	x0, w0
    61a8:      	cmp	x0, #0x60
    61ac:      	b.ne	0x61b8 <_stogir.terminal.operation?+0x14>
    61b0:      	mov	x0, #0x1                ; =1
    61b4:      	b	0x61c4 <_stogir.terminal.operation?+0x20>
    61b8:      	cmp	x0, #0x79
    61bc:      	cset	w0, eq
    61c0:      	ubfx	x0, x0, #0, #8
    61c4:      	ret

00000000000061c8 <_stogir.terminal.validate>:
    61c8:      	sub	sp, sp, #0x20
    61cc:      	str	x29, [sp]
    61d0:      	str	x30, [sp, #0x8]
    61d4:      	mov	x29, sp
    61d8:      	str	x19, [sp, #0x10]
    61dc:      	str	x20, [sp, #0x18]
    61e0:      	sub	sp, sp, #0x10
    61e4:      	mov	x2, sp
    61e8:      	sxtw	x1, w1
    61ec:      	sub	sp, sp, #0x20
    61f0:      	mov	x19, sp
    61f4:      	lsl	x3, x1, #2
    61f8:      	cmp	x1, #0x0
    61fc:      	cset	w4, gt
    6200:      	movz	x16, #0x0, lsl #48
    6204:      	sub	x5, x16, x1
    6208:      	sub	x6, x5, #0x1
    620c:      	uxtb	w16, w4
    6210:      	cmp	w16, wzr
    6214:      	b.eq	0x6254 <_stogir.terminal.validate+0x8c>
    6218:      	ldr	x5, [x0, #0x8]
    621c:      	cmp	x1, x5
    6220:      	b.ge	0x62a8 <_stogir.terminal.validate+0xe0>
    6224:      	add	x5, x0, #0x78
    6228:      	ldr	x5, [x5, #0x8]
    622c:      	cmp	x1, x5
    6230:      	b.ge	0x63cc <_stogir.terminal.validate+0x204>
    6234:      	ldr	x5, [x0, #0x78]
    6238:      	add	x5, x3, x5
    623c:      	ldr	w5, [x5]
    6240:      	sxtw	x5, w5
    6244:      	cmp	x5, #0x0
    6248:      	cset	w5, ge
    624c:      	ubfx	x5, x5, #0, #8
    6250:      	b	0x63d0 <_stogir.terminal.validate+0x208>
    6254:      	cmp	x1, #0x0
    6258:      	b.ge	0x62b0 <_stogir.terminal.validate+0xe8>
    625c:      	add	x7, x0, #0x28
    6260:      	add	x9, x0, #0x50
    6264:      	ldr	x7, [x7, #0x8]
    6268:      	ldr	x9, [x9, #0x8]
    626c:      	cmp	x7, x9
    6270:      	b.ne	0x62a0 <_stogir.terminal.validate+0xd8>
    6274:      	cmp	x5, x7
    6278:      	b.gt	0x640c <_stogir.terminal.validate+0x244>
    627c:      	lsl	x5, x6, #2
    6280:      	ldr	x7, [x0, #0x50]
    6284:      	add	x5, x5, x7
    6288:      	ldr	w5, [x5]
    628c:      	sxtw	x5, w5
    6290:      	cmp	x5, #0x0
    6294:      	cset	w5, gt
    6298:      	ubfx	x5, x5, #0, #8
    629c:      	b	0x6410 <_stogir.terminal.validate+0x248>
    62a0:      	movz	x5, #0x0, lsl #48
    62a4:      	b	0x62b4 <_stogir.terminal.validate+0xec>
    62a8:      	movz	x5, #0x0, lsl #48
    62ac:      	b	0x62b4 <_stogir.terminal.validate+0xec>
    62b0:      	movz	x5, #0x0, lsl #48
    62b4:      	cmp	x5, #0x0
    62b8:      	b.eq	0x631c <_stogir.terminal.validate+0x154>
    62bc:      	uxtb	w16, w4
    62c0:      	cmp	w16, wzr
    62c4:      	b.eq	0x62ec <_stogir.terminal.validate+0x124>
    62c8:      	lsl	x4, x1, #4
    62cc:      	ldr	x5, [x0]
    62d0:      	add	x4, x4, x5
    62d4:      	ldr	x5, [x4]
    62d8:      	ldr	x4, [x4, #0x8]
    62dc:      	fmov	d31, x4
    62e0:      	mov	x4, x5
    62e4:      	fmov	x5, d31
    62e8:      	b	0x630c <_stogir.terminal.validate+0x144>
    62ec:      	lsl	x4, x6, #4
    62f0:      	ldr	x5, [x0, #0x28]
    62f4:      	add	x4, x4, x5
    62f8:      	ldr	x5, [x4]
    62fc:      	ldr	x4, [x4, #0x8]
    6300:      	fmov	d31, x4
    6304:      	mov	x4, x5
    6308:      	fmov	x5, d31
    630c:      	mov	x6, x5
    6310:      	mov	x5, x4
    6314:      	mov	x4, #0x1                ; =1
    6318:      	b	0x6328 <_stogir.terminal.validate+0x160>
    631c:      	movz	x4, #0x0, lsl #48
    6320:      	movz	x5, #0x0, lsl #48
    6324:      	movz	x6, #0x0, lsl #48
    6328:      	lsr	w4, w4, #0
    632c:      	lsr	x16, x4, #0
    6330:      	cmp	x16, #0x1
    6334:      	b.eq	0x6350 <_stogir.terminal.validate+0x188>
    6338:      	b.lo	0x6340 <_stogir.terminal.validate+0x178>
    633c:      	b	0x6354 <_stogir.terminal.validate+0x18c>
    6340:      	cmp	x16, #0x0
    6344:      	b.eq	0x634c <_stogir.terminal.validate+0x184>
    6348:      	b	0x6354 <_stogir.terminal.validate+0x18c>
    634c:      	b	0x6358 <_stogir.terminal.validate+0x190>
    6350:      	b	0x6378 <_stogir.terminal.validate+0x1b0>
    6354:      	b	0x64d0 <_stogir.terminal.validate+0x308>
    6358:      	adrp	x16, 0x6000 <_stogir.atomic.validate+0x934>
		0000000000006358:  ARM64_RELOC_PAGE21	l_stogir.378
    635c:      	ldr	x16, [x16]
		000000000000635c:  ARM64_RELOC_PAGEOFF12	l_stogir.378
    6360:      	orr	x0, x16, xzr
    6364:      	mov	x20, x8
    6368:      	mov	x1, x0
    636c:      	mov	x0, #0x1                ; =1
    6370:      	mov	x2, #0x21               ; =33
    6374:      	b	0x63a4 <_stogir.terminal.validate+0x1dc>
    6378:      	str	x5, [x2]
    637c:      	str	x6, [x2, #0x8]
    6380:      	cmp	x1, #0x0
    6384:      	b.gt	0x63d4 <_stogir.terminal.validate+0x20c>
    6388:      	mov	x20, x8
    638c:      	adrp	x16, 0x6000 <_stogir.atomic.validate+0x934>
		000000000000638c:  ARM64_RELOC_PAGE21	l_stogir.379
    6390:      	ldr	x16, [x16]
		0000000000006390:  ARM64_RELOC_PAGEOFF12	l_stogir.379
    6394:      	orr	x0, x16, xzr
    6398:      	mov	x1, x0
    639c:      	mov	x0, #0x1                ; =1
    63a0:      	mov	x2, #0x1b               ; =27
    63a4:      	str	x0, [x20]
    63a8:      	str	x1, [x20, #0x8]
    63ac:      	str	x2, [x20, #0x10]
    63b0:      	sub	sp, x29, #0x0
    63b4:      	ldr	x19, [sp, #0x10]
    63b8:      	ldr	x20, [sp, #0x18]
    63bc:      	ldr	x29, [sp]
    63c0:      	ldr	x30, [sp, #0x8]
    63c4:      	add	sp, sp, #0x20
    63c8:      	ret
    63cc:      	movz	x5, #0x0, lsl #48
    63d0:      	b	0x62ac <_stogir.terminal.validate+0xe4>
    63d4:      	uxtb	w5, w5
    63d8:      	orr	x1, x5, xzr
    63dc:      	cmp	x1, #0x60
    63e0:      	cset	w4, eq
    63e4:      	cmp	x1, #0x79
    63e8:      	cset	w1, eq
    63ec:      	uxtb	w16, w4
    63f0:      	cmp	w16, wzr
    63f4:      	b.ne	0x6414 <_stogir.terminal.validate+0x24c>
    63f8:      	uxtb	w16, w1
    63fc:      	cmp	w16, wzr
    6400:      	b.ne	0x6414 <_stogir.terminal.validate+0x24c>
    6404:      	mov	x20, x8
    6408:      	b	0x638c <_stogir.terminal.validate+0x1c4>
    640c:      	movz	x5, #0x0, lsl #48
    6410:      	b	0x62a4 <_stogir.terminal.validate+0xdc>
    6414:      	ldr	w6, [x2]
    6418:      	ubfx	x6, x6, #8, #8
    641c:      	cmp	x6, #0x0
    6420:      	b.ne	0x64d8 <_stogir.terminal.validate+0x310>
    6424:      	uxtb	w16, w4
    6428:      	cmp	w16, wzr
    642c:      	mov	x16, #0x1               ; =1
    6430:      	mov	x17, #0x3               ; =3
    6434:      	csel	x4, x16, x17, ne
    6438:      	lsr	w4, w4, #0
    643c:      	sxtw	x4, w4
    6440:      	ldr	x6, [x0, #0x78]
    6444:      	add	x3, x3, x6
    6448:      	ldr	w3, [x3]
    644c:      	sxtw	x3, w3
    6450:      	cmp	x3, x4
    6454:      	b.ne	0x64e0 <_stogir.terminal.validate+0x318>
    6458:      	uxtb	w16, w1
    645c:      	cmp	w16, wzr
    6460:      	b.eq	0x64b4 <_stogir.terminal.validate+0x2ec>
    6464:      	ldr	w3, [x2, #0x8]
    6468:      	sxtw	x3, w3
    646c:      	cmp	x3, #0x0
    6470:      	b.eq	0x64b4 <_stogir.terminal.validate+0x2ec>
    6474:      	mov	x20, x8
    6478:      	b	0x638c <_stogir.terminal.validate+0x1c4>
    647c:      	movz	x1, #0x0, lsl #48
    6480:      	lsr	w3, w3, #0
    6484:      	lsr	w5, w5, #0
    6488:      	lsr	w1, w1, #0
    648c:      	mov	w2, w3
    6490:      	mov	w3, w1
    6494:      	mov	w1, w5
    6498:      	mov	x20, x8
    649c:      	mov	x8, x19
    64a0:      	bl	0x64a0 <_stogir.terminal.validate+0x2d8>
		00000000000064a0:  ARM64_RELOC_BRANCH26	_stogir.terminal.inputs
    64a4:      	ldr	x0, [x19]
    64a8:      	ldr	x1, [x19, #0x8]
    64ac:      	ldr	x2, [x19, #0x10]
    64b0:      	b	0x63a4 <_stogir.terminal.validate+0x1dc>
    64b4:      	ldr	w3, [x2, #0x4]
    64b8:      	uxtb	w16, w1
    64bc:      	cmp	w16, wzr
    64c0:      	b.eq	0x647c <_stogir.terminal.validate+0x2b4>
    64c4:      	ldr	w1, [x2, #0xc]
    64c8:      	sxtw	x1, w1
    64cc:      	b	0x6480 <_stogir.terminal.validate+0x2b8>
    64d0:      	brk	#0
    64d4:      	b	0x64d0 <_stogir.terminal.validate+0x308>
    64d8:      	mov	x20, x8
    64dc:      	b	0x638c <_stogir.terminal.validate+0x1c4>
    64e0:      	mov	x20, x8
    64e4:      	b	0x638c <_stogir.terminal.validate+0x1c4>

00000000000064e8 <_stogir.switch.operation?>:
    64e8:      	sxtw	x0, w0
    64ec:      	cmp	x0, #0x75
    64f0:      	b.ne	0x6504 <_stogir.switch.operation?+0x1c>
    64f4:      	mov	x0, #0x1                ; =1
    64f8:      	b	0x6500 <_stogir.switch.operation?+0x18>
    64fc:      	movz	x0, #0x0, lsl #48
    6500:      	ret
    6504:      	cmp	x0, #0x6d
    6508:      	b.lt	0x64fc <_stogir.switch.operation?+0x14>
    650c:      	cmp	x0, #0x6f
    6510:      	cset	w0, le
    6514:      	ubfx	x0, x0, #0, #8
    6518:      	b	0x6500 <_stogir.switch.operation?+0x18>

000000000000651c <_stogir.switch.validate>:
    651c:      	sub	sp, sp, #0x30
    6520:      	str	x29, [sp]
    6524:      	str	x30, [sp, #0x8]
    6528:      	mov	x29, sp
    652c:      	str	x19, [sp, #0x10]
    6530:      	str	x20, [sp, #0x18]
    6534:      	str	x21, [sp, #0x20]
    6538:      	sub	sp, sp, #0x10
    653c:      	mov	x2, sp
    6540:      	sxtw	x1, w1
    6544:      	sub	sp, sp, #0x20
    6548:      	mov	x19, sp
    654c:      	lsl	x3, x1, #2
    6550:      	cmp	x1, #0x0
    6554:      	cset	w4, gt
    6558:      	movz	x16, #0x0, lsl #48
    655c:      	sub	x5, x16, x1
    6560:      	sub	sp, sp, #0x20
    6564:      	mov	x20, sp
    6568:      	sub	x6, x5, #0x1
    656c:      	uxtb	w16, w4
    6570:      	cmp	w16, wzr
    6574:      	b.eq	0x65b4 <_stogir.switch.validate+0x98>
    6578:      	ldr	x5, [x0, #0x8]
    657c:      	cmp	x1, x5
    6580:      	b.ge	0x6608 <_stogir.switch.validate+0xec>
    6584:      	add	x5, x0, #0x78
    6588:      	ldr	x5, [x5, #0x8]
    658c:      	cmp	x1, x5
    6590:      	b.ge	0x6730 <_stogir.switch.validate+0x214>
    6594:      	ldr	x5, [x0, #0x78]
    6598:      	add	x5, x3, x5
    659c:      	ldr	w5, [x5]
    65a0:      	sxtw	x5, w5
    65a4:      	cmp	x5, #0x0
    65a8:      	cset	w5, ge
    65ac:      	ubfx	x5, x5, #0, #8
    65b0:      	b	0x6734 <_stogir.switch.validate+0x218>
    65b4:      	cmp	x1, #0x0
    65b8:      	b.ge	0x6610 <_stogir.switch.validate+0xf4>
    65bc:      	add	x7, x0, #0x28
    65c0:      	add	x9, x0, #0x50
    65c4:      	ldr	x7, [x7, #0x8]
    65c8:      	ldr	x9, [x9, #0x8]
    65cc:      	cmp	x7, x9
    65d0:      	b.ne	0x6600 <_stogir.switch.validate+0xe4>
    65d4:      	cmp	x5, x7
    65d8:      	b.gt	0x676c <_stogir.switch.validate+0x250>
    65dc:      	lsl	x5, x6, #2
    65e0:      	ldr	x7, [x0, #0x50]
    65e4:      	add	x5, x5, x7
    65e8:      	ldr	w5, [x5]
    65ec:      	sxtw	x5, w5
    65f0:      	cmp	x5, #0x0
    65f4:      	cset	w5, gt
    65f8:      	ubfx	x5, x5, #0, #8
    65fc:      	b	0x6770 <_stogir.switch.validate+0x254>
    6600:      	movz	x5, #0x0, lsl #48
    6604:      	b	0x6614 <_stogir.switch.validate+0xf8>
    6608:      	movz	x5, #0x0, lsl #48
    660c:      	b	0x6614 <_stogir.switch.validate+0xf8>
    6610:      	movz	x5, #0x0, lsl #48
    6614:      	cmp	x5, #0x0
    6618:      	b.eq	0x667c <_stogir.switch.validate+0x160>
    661c:      	uxtb	w16, w4
    6620:      	cmp	w16, wzr
    6624:      	b.eq	0x664c <_stogir.switch.validate+0x130>
    6628:      	lsl	x4, x1, #4
    662c:      	ldr	x5, [x0]
    6630:      	add	x4, x4, x5
    6634:      	ldr	x5, [x4]
    6638:      	ldr	x4, [x4, #0x8]
    663c:      	fmov	d31, x4
    6640:      	mov	x4, x5
    6644:      	fmov	x5, d31
    6648:      	b	0x666c <_stogir.switch.validate+0x150>
    664c:      	lsl	x4, x6, #4
    6650:      	ldr	x5, [x0, #0x28]
    6654:      	add	x4, x4, x5
    6658:      	ldr	x5, [x4]
    665c:      	ldr	x4, [x4, #0x8]
    6660:      	fmov	d31, x4
    6664:      	mov	x4, x5
    6668:      	fmov	x5, d31
    666c:      	mov	x6, x5
    6670:      	mov	x5, x4
    6674:      	mov	x4, #0x1                ; =1
    6678:      	b	0x6688 <_stogir.switch.validate+0x16c>
    667c:      	movz	x4, #0x0, lsl #48
    6680:      	movz	x5, #0x0, lsl #48
    6684:      	movz	x6, #0x0, lsl #48
    6688:      	lsr	w4, w4, #0
    668c:      	lsr	x16, x4, #0
    6690:      	cmp	x16, #0x1
    6694:      	b.eq	0x66b0 <_stogir.switch.validate+0x194>
    6698:      	b.lo	0x66a0 <_stogir.switch.validate+0x184>
    669c:      	b	0x66b4 <_stogir.switch.validate+0x198>
    66a0:      	cmp	x16, #0x0
    66a4:      	b.eq	0x66ac <_stogir.switch.validate+0x190>
    66a8:      	b	0x66b4 <_stogir.switch.validate+0x198>
    66ac:      	b	0x66b8 <_stogir.switch.validate+0x19c>
    66b0:      	b	0x66d8 <_stogir.switch.validate+0x1bc>
    66b4:      	b	0x6838 <_stogir.switch.validate+0x31c>
    66b8:      	adrp	x16, 0x6000 <_stogir.atomic.validate+0x934>
		00000000000066b8:  ARM64_RELOC_PAGE21	l_stogir.380
    66bc:      	ldr	x16, [x16]
		00000000000066bc:  ARM64_RELOC_PAGEOFF12	l_stogir.380
    66c0:      	orr	x0, x16, xzr
    66c4:      	mov	x21, x8
    66c8:      	mov	x1, x0
    66cc:      	mov	x0, #0x1                ; =1
    66d0:      	mov	x2, #0x1a               ; =26
    66d4:      	b	0x6704 <_stogir.switch.validate+0x1e8>
    66d8:      	str	x5, [x2]
    66dc:      	str	x6, [x2, #0x8]
    66e0:      	cmp	x1, #0x0
    66e4:      	b.gt	0x6738 <_stogir.switch.validate+0x21c>
    66e8:      	mov	x21, x8
    66ec:      	adrp	x16, 0x6000 <_stogir.atomic.validate+0x934>
		00000000000066ec:  ARM64_RELOC_PAGE21	l_stogir.381
    66f0:      	ldr	x16, [x16]
		00000000000066f0:  ARM64_RELOC_PAGEOFF12	l_stogir.381
    66f4:      	orr	x0, x16, xzr
    66f8:      	mov	x1, x0
    66fc:      	mov	x0, #0x1                ; =1
    6700:      	mov	x2, #0x20               ; =32
    6704:      	str	x0, [x21]
    6708:      	str	x1, [x21, #0x8]
    670c:      	str	x2, [x21, #0x10]
    6710:      	sub	sp, x29, #0x0
    6714:      	ldr	x19, [sp, #0x10]
    6718:      	ldr	x20, [sp, #0x18]
    671c:      	ldr	x21, [sp, #0x20]
    6720:      	ldr	x29, [sp]
    6724:      	ldr	x30, [sp, #0x8]
    6728:      	add	sp, sp, #0x30
    672c:      	ret
    6730:      	movz	x5, #0x0, lsl #48
    6734:      	b	0x660c <_stogir.switch.validate+0xf0>
    6738:      	uxtb	w5, w5
    673c:      	orr	x1, x5, xzr
    6740:      	cmp	x1, #0x75
    6744:      	cset	w4, eq
    6748:      	uxtb	w16, w4
    674c:      	cmp	w16, wzr
    6750:      	b.ne	0x6774 <_stogir.switch.validate+0x258>
    6754:      	cmp	x1, #0x6d
    6758:      	b.lt	0x6840 <_stogir.switch.validate+0x324>
    675c:      	cmp	x1, #0x6f
    6760:      	b.le	0x6774 <_stogir.switch.validate+0x258>
    6764:      	mov	x21, x8
    6768:      	b	0x66ec <_stogir.switch.validate+0x1d0>
    676c:      	movz	x5, #0x0, lsl #48
    6770:      	b	0x6604 <_stogir.switch.validate+0xe8>
    6774:      	ldr	w6, [x2]
    6778:      	ubfx	x6, x6, #8, #8
    677c:      	cmp	x6, #0x0
    6780:      	b.ne	0x6848 <_stogir.switch.validate+0x32c>
    6784:      	ldr	x6, [x0, #0x78]
    6788:      	add	x3, x3, x6
    678c:      	ldr	w3, [x3]
    6790:      	cmp	x1, #0x6d
    6794:      	b.eq	0x67e8 <_stogir.switch.validate+0x2cc>
    6798:      	cmp	x1, #0x6e
    679c:      	b.eq	0x67e8 <_stogir.switch.validate+0x2cc>
    67a0:      	mov	x1, #0x2                ; =2
    67a4:      	b	0x67ec <_stogir.switch.validate+0x2d0>
    67a8:      	lsr	w5, w5, #0
    67ac:      	ldr	w1, [x2, #0x4]
    67b0:      	ldr	w3, [x2, #0x8]
    67b4:      	lsr	w1, w1, #0
    67b8:      	ldr	w2, [x2, #0xc]
    67bc:      	lsr	w3, w3, #0
    67c0:      	lsr	w2, w2, #0
    67c4:      	mov	x8, x20
    67c8:      	mov	w4, w2
    67cc:      	mov	w2, w1
    67d0:      	mov	w1, w5
    67d4:      	bl	0x67d4 <_stogir.switch.validate+0x2b8>
		00000000000067d4:  ARM64_RELOC_BRANCH26	_stogir.switch.case-inputs
    67d8:      	ldr	x0, [x20]
    67dc:      	ldr	x1, [x20, #0x8]
    67e0:      	ldr	x2, [x20, #0x10]
    67e4:      	b	0x6704 <_stogir.switch.validate+0x1e8>
    67e8:      	mov	x1, #0x3                ; =3
    67ec:      	sxtw	x3, w3
    67f0:      	lsr	w1, w1, #0
    67f4:      	sxtw	x1, w1
    67f8:      	cmp	x3, x1
    67fc:      	b.ne	0x6850 <_stogir.switch.validate+0x334>
    6800:      	uxtb	w16, w4
    6804:      	cmp	w16, wzr
    6808:      	b.eq	0x6858 <_stogir.switch.validate+0x33c>
    680c:      	ldr	w1, [x2, #0x4]
    6810:      	ldr	w2, [x2, #0x8]
    6814:      	lsr	w1, w1, #0
    6818:      	lsr	w2, w2, #0
    681c:      	mov	x21, x8
    6820:      	mov	x8, x19
    6824:      	bl	0x6824 <_stogir.switch.validate+0x308>
		0000000000006824:  ARM64_RELOC_BRANCH26	_stogir.switch.switch-inputs
    6828:      	ldr	x0, [x19]
    682c:      	ldr	x1, [x19, #0x8]
    6830:      	ldr	x2, [x19, #0x10]
    6834:      	b	0x67e4 <_stogir.switch.validate+0x2c8>
    6838:      	brk	#0
    683c:      	b	0x6838 <_stogir.switch.validate+0x31c>
    6840:      	mov	x21, x8
    6844:      	b	0x66ec <_stogir.switch.validate+0x1d0>
    6848:      	mov	x21, x8
    684c:      	b	0x66ec <_stogir.switch.validate+0x1d0>
    6850:      	mov	x21, x8
    6854:      	b	0x66ec <_stogir.switch.validate+0x1d0>
    6858:      	mov	x21, x8
    685c:      	b	0x67a8 <_stogir.switch.validate+0x28c>

0000000000006860 <_stogir.stack.operation?>:
    6860:      	sxtw	x0, w0
    6864:      	cmp	x0, #0x42
    6868:      	b.ne	0x6884 <_stogir.stack.operation?+0x24>
    686c:      	mov	x0, #0x1                ; =1
    6870:      	b	0x6880 <_stogir.stack.operation?+0x20>
    6874:      	cmp	x0, #0x54
    6878:      	cset	w0, eq
    687c:      	ubfx	x0, x0, #0, #8
    6880:      	ret
    6884:      	cmp	x0, #0x51
    6888:      	b.ne	0x6894 <_stogir.stack.operation?+0x34>
    688c:      	mov	x0, #0x1                ; =1
    6890:      	b	0x6880 <_stogir.stack.operation?+0x20>
    6894:      	cmp	x0, #0x52
    6898:      	b.ne	0x68a4 <_stogir.stack.operation?+0x44>
    689c:      	mov	x0, #0x1                ; =1
    68a0:      	b	0x6880 <_stogir.stack.operation?+0x20>
    68a4:      	cmp	x0, #0x53
    68a8:      	b.ne	0x6874 <_stogir.stack.operation?+0x14>
    68ac:      	mov	x0, #0x1                ; =1
    68b0:      	b	0x6880 <_stogir.stack.operation?+0x20>

00000000000068b4 <_stogir.stack.validate>:
    68b4:      	sub	sp, sp, #0x30
    68b8:      	str	x29, [sp]
    68bc:      	str	x30, [sp, #0x8]
    68c0:      	mov	x29, sp
    68c4:      	str	x19, [sp, #0x10]
    68c8:      	str	x20, [sp, #0x18]
    68cc:      	str	x21, [sp, #0x20]
    68d0:      	sub	sp, sp, #0x10
    68d4:      	mov	x2, sp
    68d8:      	sxtw	x1, w1
    68dc:      	sub	sp, sp, #0x20
    68e0:      	mov	x19, sp
    68e4:      	lsl	x3, x1, #2
    68e8:      	cmp	x1, #0x0
    68ec:      	cset	w4, gt
    68f0:      	movz	x16, #0x0, lsl #48
    68f4:      	sub	x5, x16, x1
    68f8:      	cmp	x1, #0x0
    68fc:      	cset	w6, lt
    6900:      	sub	sp, sp, #0x20
    6904:      	mov	x20, sp
    6908:      	sub	x7, x5, #0x1
    690c:      	lsl	x9, x7, #2
    6910:      	uxtb	w16, w4
    6914:      	cmp	w16, wzr
    6918:      	b.eq	0x6958 <_stogir.stack.validate+0xa4>
    691c:      	ldr	x10, [x0, #0x8]
    6920:      	cmp	x1, x10
    6924:      	b.ge	0x69d8 <_stogir.stack.validate+0x124>
    6928:      	add	x10, x0, #0x78
    692c:      	ldr	x10, [x10, #0x8]
    6930:      	cmp	x1, x10
    6934:      	b.ge	0x6b38 <_stogir.stack.validate+0x284>
    6938:      	ldr	x10, [x0, #0x78]
    693c:      	add	x10, x3, x10
    6940:      	ldr	w10, [x10]
    6944:      	sxtw	x10, w10
    6948:      	cmp	x10, #0x0
    694c:      	cset	w10, ge
    6950:      	ubfx	x10, x10, #0, #8
    6954:      	b	0x6b3c <_stogir.stack.validate+0x288>
    6958:      	uxtb	w16, w6
    695c:      	cmp	w16, wzr
    6960:      	b.eq	0x69e0 <_stogir.stack.validate+0x12c>
    6964:      	add	x10, x0, #0x28
    6968:      	add	x11, x0, #0x50
    696c:      	ldr	x10, [x10, #0x8]
    6970:      	ldr	x11, [x11, #0x8]
    6974:      	cmp	x10, x11
    6978:      	b.ne	0x69a4 <_stogir.stack.validate+0xf0>
    697c:      	cmp	x5, x10
    6980:      	b.gt	0x6b40 <_stogir.stack.validate+0x28c>
    6984:      	ldr	x10, [x0, #0x50]
    6988:      	add	x10, x9, x10
    698c:      	ldr	w10, [x10]
    6990:      	sxtw	x10, w10
    6994:      	cmp	x10, #0x0
    6998:      	cset	w10, gt
    699c:      	ubfx	x10, x10, #0, #8
    69a0:      	b	0x6b44 <_stogir.stack.validate+0x290>
    69a4:      	movz	x10, #0x0, lsl #48
    69a8:      	b	0x69e4 <_stogir.stack.validate+0x130>
    69ac:      	uxtb	w16, w10
    69b0:      	cmp	w16, wzr
    69b4:      	b.eq	0x6b68 <_stogir.stack.validate+0x2b4>
    69b8:      	mov	x21, x8
    69bc:      	adrp	x16, 0x6000 <_stogir.atomic.validate+0x934>
		00000000000069bc:  ARM64_RELOC_PAGE21	l_stogir.382
    69c0:      	ldr	x16, [x16]
		00000000000069c0:  ARM64_RELOC_PAGEOFF12	l_stogir.382
    69c4:      	orr	x0, x16, xzr
    69c8:      	mov	x1, x0
    69cc:      	mov	x0, #0x1                ; =1
    69d0:      	mov	x2, #0x19               ; =25
    69d4:      	b	0x6aa4 <_stogir.stack.validate+0x1f0>
    69d8:      	movz	x10, #0x0, lsl #48
    69dc:      	b	0x69e4 <_stogir.stack.validate+0x130>
    69e0:      	movz	x10, #0x0, lsl #48
    69e4:      	lsl	x11, x1, #4
    69e8:      	lsl	x7, x7, #4
    69ec:      	cmp	x10, #0x0
    69f0:      	b.eq	0x6a4c <_stogir.stack.validate+0x198>
    69f4:      	uxtb	w16, w4
    69f8:      	cmp	w16, wzr
    69fc:      	b.eq	0x6a20 <_stogir.stack.validate+0x16c>
    6a00:      	ldr	x10, [x0]
    6a04:      	add	x10, x11, x10
    6a08:      	ldr	x12, [x10]
    6a0c:      	ldr	x10, [x10, #0x8]
    6a10:      	fmov	d31, x10
    6a14:      	mov	x10, x12
    6a18:      	fmov	x12, d31
    6a1c:      	b	0x6a3c <_stogir.stack.validate+0x188>
    6a20:      	ldr	x10, [x0, #0x28]
    6a24:      	add	x10, x7, x10
    6a28:      	ldr	x12, [x10]
    6a2c:      	ldr	x10, [x10, #0x8]
    6a30:      	fmov	d31, x10
    6a34:      	mov	x10, x12
    6a38:      	fmov	x12, d31
    6a3c:      	mov	x13, x12
    6a40:      	mov	x12, x10
    6a44:      	mov	x10, #0x1               ; =1
    6a48:      	b	0x6a58 <_stogir.stack.validate+0x1a4>
    6a4c:      	movz	x10, #0x0, lsl #48
    6a50:      	movz	x12, #0x0, lsl #48
    6a54:      	movz	x13, #0x0, lsl #48
    6a58:      	lsr	w10, w10, #0
    6a5c:      	lsr	x16, x10, #0
    6a60:      	cmp	x16, #0x1
    6a64:      	b.eq	0x6a80 <_stogir.stack.validate+0x1cc>
    6a68:      	b.lo	0x6a70 <_stogir.stack.validate+0x1bc>
    6a6c:      	b	0x6a84 <_stogir.stack.validate+0x1d0>
    6a70:      	cmp	x16, #0x0
    6a74:      	b.eq	0x6a7c <_stogir.stack.validate+0x1c8>
    6a78:      	b	0x6a84 <_stogir.stack.validate+0x1d0>
    6a7c:      	b	0x6a88 <_stogir.stack.validate+0x1d4>
    6a80:      	b	0x6ad0 <_stogir.stack.validate+0x21c>
    6a84:      	b	0x6df8 <_stogir.stack.validate+0x544>
    6a88:      	adrp	x16, 0x6000 <_stogir.atomic.validate+0x934>
		0000000000006a88:  ARM64_RELOC_PAGE21	l_stogir.383
    6a8c:      	ldr	x16, [x16]
		0000000000006a8c:  ARM64_RELOC_PAGEOFF12	l_stogir.383
    6a90:      	orr	x0, x16, xzr
    6a94:      	mov	x21, x8
    6a98:      	mov	x1, x0
    6a9c:      	mov	x0, #0x1                ; =1
    6aa0:      	mov	x2, #0x19               ; =25
    6aa4:      	str	x0, [x21]
    6aa8:      	str	x1, [x21, #0x8]
    6aac:      	str	x2, [x21, #0x10]
    6ab0:      	sub	sp, x29, #0x0
    6ab4:      	ldr	x19, [sp, #0x10]
    6ab8:      	ldr	x20, [sp, #0x18]
    6abc:      	ldr	x21, [sp, #0x20]
    6ac0:      	ldr	x29, [sp]
    6ac4:      	ldr	x30, [sp, #0x8]
    6ac8:      	add	sp, sp, #0x30
    6acc:      	ret
    6ad0:      	cmp	x1, #0x0
    6ad4:      	cset	w10, le
    6ad8:      	uxtb	w14, w12
    6adc:      	str	x12, [x2]
    6ae0:      	orr	x12, x14, xzr
    6ae4:      	str	x13, [x2, #0x8]
    6ae8:      	cmp	x12, #0x42
    6aec:      	b.ne	0x69ac <_stogir.stack.validate+0xf8>
    6af0:      	uxtb	w16, w4
    6af4:      	cmp	w16, wzr
    6af8:      	b.eq	0x6bb4 <_stogir.stack.validate+0x300>
    6afc:      	ldr	x2, [x0, #0x8]
    6b00:      	cmp	x1, x2
    6b04:      	b.ge	0x6c00 <_stogir.stack.validate+0x34c>
    6b08:      	add	x2, x0, #0x78
    6b0c:      	ldr	x2, [x2, #0x8]
    6b10:      	cmp	x1, x2
    6b14:      	b.ge	0x6cf4 <_stogir.stack.validate+0x440>
    6b18:      	ldr	x1, [x0, #0x78]
    6b1c:      	add	x1, x3, x1
    6b20:      	ldr	w1, [x1]
    6b24:      	sxtw	x1, w1
    6b28:      	cmp	x1, #0x0
    6b2c:      	cset	w1, ge
    6b30:      	ubfx	x1, x1, #0, #8
    6b34:      	b	0x6cf8 <_stogir.stack.validate+0x444>
    6b38:      	movz	x10, #0x0, lsl #48
    6b3c:      	b	0x69dc <_stogir.stack.validate+0x128>
    6b40:      	movz	x10, #0x0, lsl #48
    6b44:      	b	0x69a8 <_stogir.stack.validate+0xf4>
    6b48:      	adrp	x16, 0x6000 <_stogir.atomic.validate+0x934>
		0000000000006b48:  ARM64_RELOC_PAGE21	l_stogir.384
    6b4c:      	ldr	x16, [x16]
		0000000000006b4c:  ARM64_RELOC_PAGEOFF12	l_stogir.384
    6b50:      	orr	x0, x16, xzr
    6b54:      	mov	x1, x0
    6b58:      	mov	x0, #0x1                ; =1
    6b5c:      	mov	x2, #0x1e               ; =30
    6b60:      	mov	x21, x8
    6b64:      	b	0x69d4 <_stogir.stack.validate+0x120>
    6b68:      	cmp	x12, #0x51
    6b6c:      	cset	w1, eq
    6b70:      	cmp	x12, #0x53
    6b74:      	cset	w4, eq
    6b78:      	cmp	x12, #0x54
    6b7c:      	cset	w5, eq
    6b80:      	uxtb	w16, w1
    6b84:      	cmp	w16, wzr
    6b88:      	b.ne	0x6cfc <_stogir.stack.validate+0x448>
    6b8c:      	cmp	x12, #0x52
    6b90:      	b.eq	0x6cfc <_stogir.stack.validate+0x448>
    6b94:      	uxtb	w16, w4
    6b98:      	cmp	w16, wzr
    6b9c:      	b.ne	0x6cfc <_stogir.stack.validate+0x448>
    6ba0:      	uxtb	w16, w5
    6ba4:      	cmp	w16, wzr
    6ba8:      	b.ne	0x6cfc <_stogir.stack.validate+0x448>
    6bac:      	mov	x21, x8
    6bb0:      	b	0x69bc <_stogir.stack.validate+0x108>
    6bb4:      	uxtb	w16, w6
    6bb8:      	cmp	w16, wzr
    6bbc:      	b.eq	0x6c08 <_stogir.stack.validate+0x354>
    6bc0:      	add	x1, x0, #0x28
    6bc4:      	add	x2, x0, #0x50
    6bc8:      	ldr	x1, [x1, #0x8]
    6bcc:      	ldr	x2, [x2, #0x8]
    6bd0:      	cmp	x1, x2
    6bd4:      	b.ne	0x6cec <_stogir.stack.validate+0x438>
    6bd8:      	cmp	x5, x1
    6bdc:      	b.gt	0x6d98 <_stogir.stack.validate+0x4e4>
    6be0:      	ldr	x1, [x0, #0x50]
    6be4:      	add	x1, x9, x1
    6be8:      	ldr	w1, [x1]
    6bec:      	sxtw	x1, w1
    6bf0:      	cmp	x1, #0x0
    6bf4:      	cset	w1, gt
    6bf8:      	ubfx	x1, x1, #0, #8
    6bfc:      	b	0x6d9c <_stogir.stack.validate+0x4e8>
    6c00:      	movz	x1, #0x0, lsl #48
    6c04:      	b	0x6c0c <_stogir.stack.validate+0x358>
    6c08:      	movz	x1, #0x0, lsl #48
    6c0c:      	cmp	x1, #0x0
    6c10:      	b.eq	0x6c48 <_stogir.stack.validate+0x394>
    6c14:      	uxtb	w16, w4
    6c18:      	cmp	w16, wzr
    6c1c:      	b.eq	0x6c30 <_stogir.stack.validate+0x37c>
    6c20:      	ldr	x1, [x0]
    6c24:      	add	x1, x11, x1
    6c28:      	ldr	x1, [x1]
    6c2c:      	b	0x6c3c <_stogir.stack.validate+0x388>
    6c30:      	ldr	x1, [x0, #0x28]
    6c34:      	add	x1, x7, x1
    6c38:      	ldr	x1, [x1]
    6c3c:      	mov	x2, x1
    6c40:      	mov	x1, #0x1                ; =1
    6c44:      	b	0x6c50 <_stogir.stack.validate+0x39c>
    6c48:      	movz	x1, #0x0, lsl #48
    6c4c:      	movz	x2, #0x0, lsl #48
    6c50:      	lsr	w1, w1, #0
    6c54:      	lsr	x16, x1, #0
    6c58:      	cmp	x16, #0x1
    6c5c:      	b.eq	0x6c78 <_stogir.stack.validate+0x3c4>
    6c60:      	b.lo	0x6c68 <_stogir.stack.validate+0x3b4>
    6c64:      	b	0x6c7c <_stogir.stack.validate+0x3c8>
    6c68:      	cmp	x16, #0x0
    6c6c:      	b.eq	0x6c74 <_stogir.stack.validate+0x3c0>
    6c70:      	b	0x6c7c <_stogir.stack.validate+0x3c8>
    6c74:      	b	0x6c80 <_stogir.stack.validate+0x3cc>
    6c78:      	b	0x6c9c <_stogir.stack.validate+0x3e8>
    6c7c:      	b	0x6e00 <_stogir.stack.validate+0x54c>
    6c80:      	adrp	x16, 0x6000 <_stogir.atomic.validate+0x934>
		0000000000006c80:  ARM64_RELOC_PAGE21	l_stogir.385
    6c84:      	ldr	x16, [x16]
		0000000000006c84:  ARM64_RELOC_PAGEOFF12	l_stogir.385
    6c88:      	orr	x0, x16, xzr
    6c8c:      	mov	x1, x0
    6c90:      	mov	x0, #0x1                ; =1
    6c94:      	mov	x2, #0x21               ; =33
    6c98:      	b	0x6b60 <_stogir.stack.validate+0x2ac>
    6c9c:      	uxtb	w16, w10
    6ca0:      	cmp	w16, wzr
    6ca4:      	b.ne	0x6b48 <_stogir.stack.validate+0x294>
    6ca8:      	uxtb	w1, w2
    6cac:      	cmp	x1, #0x42
    6cb0:      	b.ne	0x6b48 <_stogir.stack.validate+0x294>
    6cb4:      	lsr	w2, w2, #0
    6cb8:      	ubfx	x1, x2, #8, #8
    6cbc:      	cmp	x1, #0x6
    6cc0:      	b.ne	0x6b48 <_stogir.stack.validate+0x294>
    6cc4:      	ldr	x0, [x0, #0x78]
    6cc8:      	add	x0, x3, x0
    6ccc:      	ldr	w0, [x0]
    6cd0:      	sxtw	x0, w0
    6cd4:      	cmp	x0, #0x0
    6cd8:      	b.ne	0x6b48 <_stogir.stack.validate+0x294>
    6cdc:      	movz	x0, #0x0, lsl #48
    6ce0:      	mov	x1, #0x8                ; =8
    6ce4:      	movz	x2, #0x0, lsl #48
    6ce8:      	b	0x6b60 <_stogir.stack.validate+0x2ac>
    6cec:      	movz	x1, #0x0, lsl #48
    6cf0:      	b	0x6c0c <_stogir.stack.validate+0x358>
    6cf4:      	movz	x1, #0x0, lsl #48
    6cf8:      	b	0x6c04 <_stogir.stack.validate+0x350>
    6cfc:      	ldr	x6, [x0, #0x78]
    6d00:      	add	x3, x3, x6
    6d04:      	ldr	w3, [x3]
    6d08:      	uxtb	w16, w1
    6d0c:      	cmp	w16, wzr
    6d10:      	b.eq	0x6d1c <_stogir.stack.validate+0x468>
    6d14:      	mov	x1, #0x3                ; =3
    6d18:      	b	0x6d30 <_stogir.stack.validate+0x47c>
    6d1c:      	uxtb	w16, w4
    6d20:      	cmp	w16, wzr
    6d24:      	mov	x16, #0x1               ; =1
    6d28:      	mov	x17, #0x2               ; =2
    6d2c:      	csel	x1, x16, x17, ne
    6d30:      	sxtw	x3, w3
    6d34:      	lsr	w1, w1, #0
    6d38:      	sxtw	x1, w1
    6d3c:      	cmp	x3, x1
    6d40:      	b.ne	0x6e08 <_stogir.stack.validate+0x554>
    6d44:      	lsr	w14, w14, #0
    6d48:      	uxtb	w16, w4
    6d4c:      	cmp	w16, wzr
    6d50:      	b.eq	0x6da0 <_stogir.stack.validate+0x4ec>
    6d54:      	mov	x21, x8
    6d58:      	ldr	w1, [x2]
    6d5c:      	ldr	w3, [x2, #0x4]
    6d60:      	ldr	w2, [x2, #0x8]
    6d64:      	lsr	w3, w3, #0
    6d68:      	ubfx	x1, x1, #8, #8
    6d6c:      	lsr	w2, w2, #0
    6d70:      	lsr	w1, w1, #0
    6d74:      	mov	x8, x19
    6d78:      	mov	w4, w2
    6d7c:      	mov	w2, w1
    6d80:      	mov	w1, w14
    6d84:      	bl	0x6d84 <_stogir.stack.validate+0x4d0>
		0000000000006d84:  ARM64_RELOC_BRANCH26	_stogir.stack.validate-scope-inputs
    6d88:      	ldr	x0, [x19]
    6d8c:      	ldr	x1, [x19, #0x8]
    6d90:      	ldr	x2, [x19, #0x10]
    6d94:      	b	0x69d4 <_stogir.stack.validate+0x120>
    6d98:      	movz	x1, #0x0, lsl #48
    6d9c:      	b	0x6cf0 <_stogir.stack.validate+0x43c>
    6da0:      	uxtb	w16, w5
    6da4:      	cmp	w16, wzr
    6da8:      	b.ne	0x6e10 <_stogir.stack.validate+0x55c>
    6dac:      	ldr	w1, [x2]
    6db0:      	ldr	w3, [x2, #0x4]
    6db4:      	ldr	w4, [x2, #0x8]
    6db8:      	lsr	w3, w3, #0
    6dbc:      	ubfx	x1, x1, #8, #8
    6dc0:      	ldr	w2, [x2, #0xc]
    6dc4:      	lsr	w4, w4, #0
    6dc8:      	lsr	w2, w2, #0
    6dcc:      	lsr	w1, w1, #0
    6dd0:      	mov	w5, w2
    6dd4:      	mov	w2, w1
    6dd8:      	mov	w1, w14
    6ddc:      	mov	x21, x8
    6de0:      	mov	x8, x20
    6de4:      	bl	0x6de4 <_stogir.stack.validate+0x530>
		0000000000006de4:  ARM64_RELOC_BRANCH26	_stogir.stack.validate-inputs
    6de8:      	ldr	x0, [x20]
    6dec:      	ldr	x1, [x20, #0x8]
    6df0:      	ldr	x2, [x20, #0x10]
    6df4:      	b	0x6d94 <_stogir.stack.validate+0x4e0>
    6df8:      	brk	#0
    6dfc:      	b	0x6df8 <_stogir.stack.validate+0x544>
    6e00:      	brk	#0
    6e04:      	b	0x6e00 <_stogir.stack.validate+0x54c>
    6e08:      	mov	x21, x8
    6e0c:      	b	0x69bc <_stogir.stack.validate+0x108>
    6e10:      	mov	x21, x8
    6e14:      	b	0x6d58 <_stogir.stack.validate+0x4a4>

0000000000006e18 <_stogir.locals.operation?>:
    6e18:      	sxtw	x0, w0
    6e1c:      	cmp	x0, #0x41
    6e20:      	b.ne	0x6e34 <_stogir.locals.operation?+0x1c>
    6e24:      	mov	x0, #0x1                ; =1
    6e28:      	b	0x6e30 <_stogir.locals.operation?+0x18>
    6e2c:      	movz	x0, #0x0, lsl #48
    6e30:      	ret
    6e34:      	cmp	x0, #0x48
    6e38:      	b.ne	0x6e44 <_stogir.locals.operation?+0x2c>
    6e3c:      	mov	x0, #0x1                ; =1
    6e40:      	b	0x6e30 <_stogir.locals.operation?+0x18>
    6e44:      	cmp	x0, #0x55
    6e48:      	b.lt	0x6e2c <_stogir.locals.operation?+0x14>
    6e4c:      	cmp	x0, #0x58
    6e50:      	cset	w0, le
    6e54:      	ubfx	x0, x0, #0, #8
    6e58:      	b	0x6e30 <_stogir.locals.operation?+0x18>

0000000000006e5c <_stogir.locals.validate>:
    6e5c:      	sub	sp, sp, #0x70
    6e60:      	str	x29, [sp]
    6e64:      	str	x30, [sp, #0x8]
    6e68:      	mov	x29, sp
    6e6c:      	str	x19, [sp, #0x20]
    6e70:      	str	x20, [sp, #0x28]
    6e74:      	str	x21, [sp, #0x30]
    6e78:      	str	x22, [sp, #0x38]
    6e7c:      	str	x23, [sp, #0x40]
    6e80:      	str	x24, [sp, #0x48]
    6e84:      	str	x25, [sp, #0x50]
    6e88:      	str	x26, [sp, #0x58]
    6e8c:      	str	x27, [sp, #0x60]
    6e90:      	str	x28, [sp, #0x68]
    6e94:      	sub	sp, sp, #0x10
    6e98:      	mov	x19, sp
    6e9c:      	sxtw	x1, w1
    6ea0:      	sub	sp, sp, #0x20
    6ea4:      	mov	x20, sp
    6ea8:      	lsl	x3, x1, #2
    6eac:      	cmp	x1, #0x0
    6eb0:      	cset	w4, gt
    6eb4:      	movz	x16, #0x0, lsl #48
    6eb8:      	sub	x5, x16, x1
    6ebc:      	sub	sp, sp, #0x10
    6ec0:      	mov	x21, sp
    6ec4:      	sub	x6, x5, #0x1
    6ec8:      	sub	sp, sp, #0x30
    6ecc:      	mov	x22, sp
    6ed0:      	sub	sp, sp, #0x30
    6ed4:      	mov	x23, sp
    6ed8:      	sub	sp, sp, #0x10
    6edc:      	mov	x24, sp
    6ee0:      	uxtb	w16, w4
    6ee4:      	cmp	w16, wzr
    6ee8:      	b.eq	0x6f28 <_stogir.locals.validate+0xcc>
    6eec:      	ldr	x5, [x0, #0x8]
    6ef0:      	cmp	x1, x5
    6ef4:      	b.ge	0x6fc8 <_stogir.locals.validate+0x16c>
    6ef8:      	add	x5, x0, #0x78
    6efc:      	ldr	x5, [x5, #0x8]
    6f00:      	cmp	x1, x5
    6f04:      	b.ge	0x70fc <_stogir.locals.validate+0x2a0>
    6f08:      	ldr	x5, [x0, #0x78]
    6f0c:      	add	x5, x3, x5
    6f10:      	ldr	w5, [x5]
    6f14:      	sxtw	x5, w5
    6f18:      	cmp	x5, #0x0
    6f1c:      	cset	w5, ge
    6f20:      	ubfx	x5, x5, #0, #8
    6f24:      	b	0x7100 <_stogir.locals.validate+0x2a4>
    6f28:      	cmp	x1, #0x0
    6f2c:      	b.ge	0x6fd0 <_stogir.locals.validate+0x174>
    6f30:      	add	x7, x0, #0x28
    6f34:      	add	x9, x0, #0x50
    6f38:      	ldr	x7, [x7, #0x8]
    6f3c:      	ldr	x9, [x9, #0x8]
    6f40:      	cmp	x7, x9
    6f44:      	b.ne	0x6f74 <_stogir.locals.validate+0x118>
    6f48:      	cmp	x5, x7
    6f4c:      	b.gt	0x7184 <_stogir.locals.validate+0x328>
    6f50:      	lsl	x5, x6, #2
    6f54:      	ldr	x7, [x0, #0x50]
    6f58:      	add	x5, x5, x7
    6f5c:      	ldr	w5, [x5]
    6f60:      	sxtw	x5, w5
    6f64:      	cmp	x5, #0x0
    6f68:      	cset	w5, gt
    6f6c:      	ubfx	x5, x5, #0, #8
    6f70:      	b	0x7188 <_stogir.locals.validate+0x32c>
    6f74:      	movz	x5, #0x0, lsl #48
    6f78:      	b	0x6fd4 <_stogir.locals.validate+0x178>
    6f7c:      	cmp	x5, #0x0
    6f80:      	cset	w5, ne
    6f84:      	uxtb	w16, w5
    6f88:      	cmp	w16, wzr
    6f8c:      	mov	x16, #0x2               ; =2
    6f90:      	mov	x17, #0x3               ; =3
    6f94:      	csel	x5, x16, x17, ne
    6f98:      	lsr	w5, w5, #0
    6f9c:      	sxtw	x5, w5
    6fa0:      	cmp	x1, #0x0
    6fa4:      	b.gt	0x7104 <_stogir.locals.validate+0x2a8>
    6fa8:      	str	x8, [x29, #0x10]
    6fac:      	adrp	x16, 0x6000 <_stogir.atomic.validate+0x934>
		0000000000006fac:  ARM64_RELOC_PAGE21	l_stogir.386
    6fb0:      	ldr	x16, [x16]
		0000000000006fb0:  ARM64_RELOC_PAGEOFF12	l_stogir.386
    6fb4:      	orr	x0, x16, xzr
    6fb8:      	mov	x1, x0
    6fbc:      	mov	x0, #0x1                ; =1
    6fc0:      	mov	x2, #0x17               ; =23
    6fc4:      	b	0x7094 <_stogir.locals.validate+0x238>
    6fc8:      	movz	x5, #0x0, lsl #48
    6fcc:      	b	0x6fd4 <_stogir.locals.validate+0x178>
    6fd0:      	movz	x5, #0x0, lsl #48
    6fd4:      	cmp	x5, #0x0
    6fd8:      	b.eq	0x703c <_stogir.locals.validate+0x1e0>
    6fdc:      	uxtb	w16, w4
    6fe0:      	cmp	w16, wzr
    6fe4:      	b.eq	0x700c <_stogir.locals.validate+0x1b0>
    6fe8:      	lsl	x4, x1, #4
    6fec:      	ldr	x5, [x0]
    6ff0:      	add	x4, x4, x5
    6ff4:      	ldr	x5, [x4]
    6ff8:      	ldr	x4, [x4, #0x8]
    6ffc:      	fmov	d31, x4
    7000:      	mov	x4, x5
    7004:      	fmov	x5, d31
    7008:      	b	0x702c <_stogir.locals.validate+0x1d0>
    700c:      	lsl	x4, x6, #4
    7010:      	ldr	x5, [x0, #0x28]
    7014:      	add	x4, x4, x5
    7018:      	ldr	x5, [x4]
    701c:      	ldr	x4, [x4, #0x8]
    7020:      	fmov	d31, x4
    7024:      	mov	x4, x5
    7028:      	fmov	x5, d31
    702c:      	mov	x6, x5
    7030:      	mov	x5, x4
    7034:      	mov	x4, #0x1                ; =1
    7038:      	b	0x7048 <_stogir.locals.validate+0x1ec>
    703c:      	movz	x4, #0x0, lsl #48
    7040:      	movz	x5, #0x0, lsl #48
    7044:      	movz	x6, #0x0, lsl #48
    7048:      	lsr	w4, w4, #0
    704c:      	lsr	x16, x4, #0
    7050:      	cmp	x16, #0x1
    7054:      	b.eq	0x7070 <_stogir.locals.validate+0x214>
    7058:      	b.lo	0x7060 <_stogir.locals.validate+0x204>
    705c:      	b	0x7074 <_stogir.locals.validate+0x218>
    7060:      	cmp	x16, #0x0
    7064:      	b.eq	0x706c <_stogir.locals.validate+0x210>
    7068:      	b	0x7074 <_stogir.locals.validate+0x218>
    706c:      	b	0x7078 <_stogir.locals.validate+0x21c>
    7070:      	b	0x70e0 <_stogir.locals.validate+0x284>
    7074:      	b	0x72ac <_stogir.locals.validate+0x450>
    7078:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x1a4>
		0000000000007078:  ARM64_RELOC_PAGE21	l_stogir.387
    707c:      	ldr	x16, [x16]
		000000000000707c:  ARM64_RELOC_PAGEOFF12	l_stogir.387
    7080:      	orr	x0, x16, xzr
    7084:      	str	x8, [x29, #0x10]
    7088:      	mov	x1, x0
    708c:      	mov	x0, #0x1                ; =1
    7090:      	mov	x2, #0x17               ; =23
    7094:      	ldr	x3, [x29, #0x10]
    7098:      	str	x0, [x3]
    709c:      	str	x1, [x3, #0x8]
    70a0:      	str	x2, [x3, #0x10]
    70a4:      	sub	sp, x29, #0x0
    70a8:      	ldr	x19, [sp, #0x20]
    70ac:      	ldr	x20, [sp, #0x28]
    70b0:      	ldr	x21, [sp, #0x30]
    70b4:      	ldr	x22, [sp, #0x38]
    70b8:      	ldr	x23, [sp, #0x40]
    70bc:      	ldr	x24, [sp, #0x48]
    70c0:      	ldr	x25, [sp, #0x50]
    70c4:      	ldr	x26, [sp, #0x58]
    70c8:      	ldr	x27, [sp, #0x60]
    70cc:      	ldr	x28, [sp, #0x68]
    70d0:      	ldr	x29, [sp]
    70d4:      	ldr	x30, [sp, #0x8]
    70d8:      	add	sp, sp, #0x70
    70dc:      	ret
    70e0:      	uxtb	w4, w5
    70e4:      	str	x5, [x19]
    70e8:      	str	x6, [x19, #0x8]
    70ec:      	cmp	x4, #0x55
    70f0:      	b.ne	0x7168 <_stogir.locals.validate+0x30c>
    70f4:      	mov	x5, #0x1                ; =1
    70f8:      	b	0x7174 <_stogir.locals.validate+0x318>
    70fc:      	movz	x5, #0x0, lsl #48
    7100:      	b	0x6fcc <_stogir.locals.validate+0x170>
    7104:      	cmp	x4, #0x48
    7108:      	cset	w27, eq
    710c:      	uxtb	w16, w26
    7110:      	cmp	w16, wzr
    7114:      	b.ne	0x718c <_stogir.locals.validate+0x330>
    7118:      	uxtb	w16, w27
    711c:      	cmp	w16, wzr
    7120:      	b.ne	0x718c <_stogir.locals.validate+0x330>
    7124:      	cmp	x4, #0x55
    7128:      	b.lt	0x7694 <_stogir.locals.validate+0x838>
    712c:      	cmp	x4, #0x58
    7130:      	b.le	0x718c <_stogir.locals.validate+0x330>
    7134:      	str	x8, [x29, #0x10]
    7138:      	b	0x6fac <_stogir.locals.validate+0x150>
    713c:      	cmp	x4, #0x58
    7140:      	cset	w6, eq
    7144:      	ubfx	x6, x6, #0, #8
    7148:      	mov	x25, x6
    714c:      	cmp	x4, #0x41
    7150:      	cset	w26, eq
    7154:      	uxtb	w16, w26
    7158:      	cmp	w16, wzr
    715c:      	b.eq	0x6f7c <_stogir.locals.validate+0x120>
    7160:      	mov	x5, #0x1                ; =1
    7164:      	b	0x6fa0 <_stogir.locals.validate+0x144>
    7168:      	cmp	x4, #0x56
    716c:      	cset	w5, eq
    7170:      	ubfx	x5, x5, #0, #8
    7174:      	cmp	x4, #0x57
    7178:      	b.ne	0x713c <_stogir.locals.validate+0x2e0>
    717c:      	mov	x25, #0x1               ; =1
    7180:      	b	0x714c <_stogir.locals.validate+0x2f0>
    7184:      	movz	x5, #0x0, lsl #48
    7188:      	b	0x6f78 <_stogir.locals.validate+0x11c>
    718c:      	lsr	w5, w5, #0
    7190:      	sxtw	x5, w5
    7194:      	ldr	x4, [x0, #0x78]
    7198:      	add	x3, x3, x4
    719c:      	ldr	w3, [x3]
    71a0:      	sxtw	x3, w3
    71a4:      	cmp	x3, x5
    71a8:      	b.ne	0x769c <_stogir.locals.validate+0x840>
    71ac:      	uxtb	w16, w26
    71b0:      	cmp	w16, wzr
    71b4:      	b.ne	0x71d0 <_stogir.locals.validate+0x374>
    71b8:      	uxtb	w16, w27
    71bc:      	cmp	w16, wzr
    71c0:      	b.ne	0x71d0 <_stogir.locals.validate+0x374>
    71c4:      	ldr	w1, [x19, #0x8]
    71c8:      	sxtw	x1, w1
    71cc:      	b	0x71e4 <_stogir.locals.validate+0x388>
    71d0:      	uxtb	w16, w27
    71d4:      	cmp	w16, wzr
    71d8:      	b.ne	0x71e4 <_stogir.locals.validate+0x388>
    71dc:      	ldr	w1, [x19, #0x4]
    71e0:      	sxtw	x1, w1
    71e4:      	lsr	w2, w2, #0
    71e8:      	lsr	w1, w1, #0
    71ec:      	str	x8, [x29, #0x10]
    71f0:      	mov	x8, x20
    71f4:      	mov	x28, x0
    71f8:      	str	x24, [x29, #0x18]
    71fc:      	mov	w24, w2
    7200:      	bl	0x7200 <_stogir.locals.validate+0x3a4>
		0000000000007200:  ARM64_RELOC_BRANCH26	_stogir.locals.shape
    7204:      	ldr	w0, [x20]
    7208:      	lsr	x16, x0, #0
    720c:      	cmp	x16, #0x1
    7210:      	b.eq	0x722c <_stogir.locals.validate+0x3d0>
    7214:      	b.lo	0x721c <_stogir.locals.validate+0x3c0>
    7218:      	b	0x7230 <_stogir.locals.validate+0x3d4>
    721c:      	cmp	x16, #0x0
    7220:      	b.eq	0x7228 <_stogir.locals.validate+0x3cc>
    7224:      	b	0x7230 <_stogir.locals.validate+0x3d4>
    7228:      	b	0x724c <_stogir.locals.validate+0x3f0>
    722c:      	b	0x7234 <_stogir.locals.validate+0x3d8>
    7230:      	b	0x74c4 <_stogir.locals.validate+0x668>
    7234:      	add	x0, x20, #0x8
    7238:      	ldr	x1, [x20, #0x8]
    723c:      	ldr	x0, [x0, #0x8]
    7240:      	mov	x2, x0
    7244:      	mov	x0, #0x1                ; =1
    7248:      	b	0x6fc4 <_stogir.locals.validate+0x168>
    724c:      	ldr	x20, [x20, #0x8]
    7250:      	uxtb	w16, w27
    7254:      	cmp	w16, wzr
    7258:      	b.eq	0x7278 <_stogir.locals.validate+0x41c>
    725c:      	lsr	w20, w20, #0
    7260:      	sxtw	x20, w20
    7264:      	and	x0, x20, #0xffffffff
    7268:      	mov	x1, x0
    726c:      	movz	x0, #0x0, lsl #48
    7270:      	movz	x2, #0x0, lsl #48
    7274:      	b	0x7248 <_stogir.locals.validate+0x3ec>
    7278:      	uxtb	w16, w26
    727c:      	cmp	w16, wzr
    7280:      	b.eq	0x72d0 <_stogir.locals.validate+0x474>
    7284:      	ldr	w0, [x19]
    7288:      	ubfx	x0, x0, #8, #8
    728c:      	cmp	x0, #0x6
    7290:      	b.ne	0x72b4 <_stogir.locals.validate+0x458>
    7294:      	sxtw	x24, w24
    7298:      	and	x0, x24, #0xffffffff
    729c:      	mov	x1, x0
    72a0:      	movz	x0, #0x0, lsl #48
    72a4:      	movz	x2, #0x0, lsl #48
    72a8:      	b	0x72cc <_stogir.locals.validate+0x470>
    72ac:      	brk	#0
    72b0:      	b	0x72ac <_stogir.locals.validate+0x450>
    72b4:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x1a4>
		00000000000072b4:  ARM64_RELOC_PAGE21	l_stogir.388
    72b8:      	ldr	x16, [x16]
		00000000000072b8:  ARM64_RELOC_PAGEOFF12	l_stogir.388
    72bc:      	orr	x0, x16, xzr
    72c0:      	mov	x1, x0
    72c4:      	mov	x0, #0x1                ; =1
    72c8:      	mov	x2, #0x21               ; =33
    72cc:      	b	0x7274 <_stogir.locals.validate+0x418>
    72d0:      	ldr	w0, [x19, #0x4]
    72d4:      	sxtw	x0, w0
    72d8:      	cmp	x0, #0x0
    72dc:      	cset	w1, gt
    72e0:      	movz	x16, #0x0, lsl #48
    72e4:      	sub	x2, x16, x0
    72e8:      	sub	x3, x2, #0x1
    72ec:      	uxtb	w16, w1
    72f0:      	cmp	w16, wzr
    72f4:      	b.eq	0x7404 <_stogir.locals.validate+0x5a8>
    72f8:      	ldr	x2, [x28, #0x8]
    72fc:      	cmp	x0, x2
    7300:      	b.ge	0x73fc <_stogir.locals.validate+0x5a0>
    7304:      	add	x2, x28, #0x78
    7308:      	ldr	x2, [x2, #0x8]
    730c:      	cmp	x0, x2
    7310:      	b.ge	0x74b4 <_stogir.locals.validate+0x658>
    7314:      	lsl	x2, x0, #2
    7318:      	ldr	x4, [x28, #0x78]
    731c:      	add	x2, x2, x4
    7320:      	ldr	w2, [x2]
    7324:      	sxtw	x2, w2
    7328:      	cmp	x2, #0x0
    732c:      	cset	w2, ge
    7330:      	ubfx	x2, x2, #0, #8
    7334:      	b	0x74b8 <_stogir.locals.validate+0x65c>
    7338:      	movz	x0, #0x0, lsl #48
    733c:      	movz	x1, #0x0, lsl #48
    7340:      	movz	x2, #0x0, lsl #48
    7344:      	lsr	w0, w0, #0
    7348:      	lsr	x16, x0, #0
    734c:      	cmp	x16, #0x1
    7350:      	b.eq	0x736c <_stogir.locals.validate+0x510>
    7354:      	b.lo	0x735c <_stogir.locals.validate+0x500>
    7358:      	b	0x7370 <_stogir.locals.validate+0x514>
    735c:      	cmp	x16, #0x0
    7360:      	b.eq	0x7368 <_stogir.locals.validate+0x50c>
    7364:      	b	0x7370 <_stogir.locals.validate+0x514>
    7368:      	b	0x7374 <_stogir.locals.validate+0x518>
    736c:      	b	0x7450 <_stogir.locals.validate+0x5f4>
    7370:      	b	0x7660 <_stogir.locals.validate+0x804>
    7374:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x1a4>
		0000000000007374:  ARM64_RELOC_PAGE21	l_stogir.389
    7378:      	ldr	x16, [x16]
		0000000000007378:  ARM64_RELOC_PAGEOFF12	l_stogir.389
    737c:      	orr	x0, x16, xzr
    7380:      	mov	x1, x0
    7384:      	mov	x0, #0x1                ; =1
    7388:      	mov	x2, #0x1c               ; =28
    738c:      	b	0x72cc <_stogir.locals.validate+0x470>
    7390:      	lsl	x0, x3, #4
    7394:      	ldr	x1, [x28, #0x28]
    7398:      	add	x0, x0, x1
    739c:      	ldr	x1, [x0]
    73a0:      	ldr	x0, [x0, #0x8]
    73a4:      	fmov	d31, x0
    73a8:      	mov	x0, x1
    73ac:      	fmov	x1, d31
    73b0:      	mov	x2, x1
    73b4:      	mov	x1, x0
    73b8:      	mov	x0, #0x1                ; =1
    73bc:      	b	0x7344 <_stogir.locals.validate+0x4e8>
    73c0:      	movz	x2, #0x0, lsl #48
    73c4:      	cmp	x2, #0x0
    73c8:      	b.eq	0x7338 <_stogir.locals.validate+0x4dc>
    73cc:      	uxtb	w16, w1
    73d0:      	cmp	w16, wzr
    73d4:      	b.eq	0x7390 <_stogir.locals.validate+0x534>
    73d8:      	lsl	x0, x0, #4
    73dc:      	ldr	x1, [x28]
    73e0:      	add	x0, x0, x1
    73e4:      	ldr	x1, [x0]
    73e8:      	ldr	x0, [x0, #0x8]
    73ec:      	fmov	d31, x0
    73f0:      	mov	x0, x1
    73f4:      	fmov	x1, d31
    73f8:      	b	0x73b0 <_stogir.locals.validate+0x554>
    73fc:      	movz	x2, #0x0, lsl #48
    7400:      	b	0x73c4 <_stogir.locals.validate+0x568>
    7404:      	cmp	x0, #0x0
    7408:      	b.ge	0x73c0 <_stogir.locals.validate+0x564>
    740c:      	add	x4, x28, #0x28
    7410:      	add	x5, x28, #0x50
    7414:      	ldr	x4, [x4, #0x8]
    7418:      	ldr	x5, [x5, #0x8]
    741c:      	cmp	x4, x5
    7420:      	b.ne	0x74ac <_stogir.locals.validate+0x650>
    7424:      	cmp	x2, x4
    7428:      	b.gt	0x74bc <_stogir.locals.validate+0x660>
    742c:      	lsl	x2, x3, #2
    7430:      	ldr	x4, [x28, #0x50]
    7434:      	add	x2, x2, x4
    7438:      	ldr	w2, [x2]
    743c:      	sxtw	x2, w2
    7440:      	cmp	x2, #0x0
    7444:      	cset	w2, gt
    7448:      	ubfx	x2, x2, #0, #8
    744c:      	b	0x74c0 <_stogir.locals.validate+0x664>
    7450:      	str	x1, [x21]
    7454:      	str	x2, [x21, #0x8]
    7458:      	ldr	w0, [x19, #0x4]
    745c:      	sxtw	x0, w0
    7460:      	cmp	x0, #0x0
    7464:      	b.le	0x7490 <_stogir.locals.validate+0x634>
    7468:      	ldr	w0, [x21]
    746c:      	uxtb	w0, w0
    7470:      	cmp	x0, #0x83
    7474:      	b.ge	0x74cc <_stogir.locals.validate+0x670>
    7478:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x1a4>
		0000000000007478:  ARM64_RELOC_PAGE21	l_stogir.390
    747c:      	ldr	x16, [x16]
		000000000000747c:  ARM64_RELOC_PAGEOFF12	l_stogir.390
    7480:      	orr	x1, x16, xzr
    7484:      	add	x0, x0, x1
    7488:      	ldrb	w0, [x0]
    748c:      	b	0x74d0 <_stogir.locals.validate+0x674>
    7490:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x1a4>
		0000000000007490:  ARM64_RELOC_PAGE21	l_stogir.391
    7494:      	ldr	x16, [x16]
		0000000000007494:  ARM64_RELOC_PAGEOFF12	l_stogir.391
    7498:      	orr	x0, x16, xzr
    749c:      	mov	x1, x0
    74a0:      	mov	x0, #0x1                ; =1
    74a4:      	mov	x2, #0x1c               ; =28
    74a8:      	b	0x738c <_stogir.locals.validate+0x530>
    74ac:      	movz	x2, #0x0, lsl #48
    74b0:      	b	0x73c4 <_stogir.locals.validate+0x568>
    74b4:      	movz	x2, #0x0, lsl #48
    74b8:      	b	0x7400 <_stogir.locals.validate+0x5a4>
    74bc:      	movz	x2, #0x0, lsl #48
    74c0:      	b	0x74b0 <_stogir.locals.validate+0x654>
    74c4:      	brk	#0
    74c8:      	b	0x74c4 <_stogir.locals.validate+0x668>
    74cc:      	movz	x0, #0x0, lsl #48
    74d0:      	uxtb	w0, w0
    74d4:      	and	x0, x0, #0x1
    74d8:      	uxtb	w0, w0
    74dc:      	cmp	x0, #0x0
    74e0:      	b.eq	0x7490 <_stogir.locals.validate+0x634>
    74e4:      	ldr	w0, [x21]
    74e8:      	uxtb	w0, w0
    74ec:      	cmp	x0, #0x83
    74f0:      	b.ge	0x750c <_stogir.locals.validate+0x6b0>
    74f4:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x1a4>
		00000000000074f4:  ARM64_RELOC_PAGE21	l_stogir.390
    74f8:      	ldr	x16, [x16]
		00000000000074f8:  ARM64_RELOC_PAGEOFF12	l_stogir.390
    74fc:      	orr	x1, x16, xzr
    7500:      	add	x0, x0, x1
    7504:      	ldrb	w0, [x0]
    7508:      	b	0x7510 <_stogir.locals.validate+0x6b4>
    750c:      	movz	x0, #0x0, lsl #48
    7510:      	uxtb	w0, w0
    7514:      	and	x0, x0, #0x4
    7518:      	uxtb	w0, w0
    751c:      	cmp	x0, #0x0
    7520:      	b.ne	0x7490 <_stogir.locals.validate+0x634>
    7524:      	cmp	x25, #0x0
    7528:      	b.eq	0x75ec <_stogir.locals.validate+0x790>
    752c:      	ldr	w0, [x19, #0xc]
    7530:      	lsr	w0, w0, #0
    7534:      	mov	x8, x22
    7538:      	mov	w1, w0
    753c:      	mov	x0, x28
    7540:      	bl	0x7540 <_stogir.locals.validate+0x6e4>
		0000000000007540:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    7544:      	ldr	x0, [x22]
    7548:      	str	x0, [x23]
    754c:      	ldr	x0, [x22, #0x8]
    7550:      	str	x0, [x23, #0x8]
    7554:      	ldr	x0, [x22, #0x10]
    7558:      	str	x0, [x23, #0x10]
    755c:      	ldr	x0, [x22, #0x18]
    7560:      	str	x0, [x23, #0x18]
    7564:      	ldr	x0, [x22, #0x20]
    7568:      	str	x0, [x23, #0x20]
    756c:      	b	0x7614 <_stogir.locals.validate+0x7b8>
    7570:      	lsr	w24, w24, #0
    7574:      	add	x0, x23, #0x8
    7578:      	ldr	x1, [x23, #0x8]
    757c:      	ldr	x21, [x29, #0x18]
    7580:      	str	x1, [x21]
    7584:      	lsr	w1, w1, #0
    7588:      	ldr	x0, [x0, #0x8]
    758c:      	str	x0, [x21, #0x8]
    7590:      	ubfx	x0, x1, #8, #8
    7594:      	lsr	w0, w0, #0
    7598:      	mov	w1, w24
    759c:      	bl	0x759c <_stogir.locals.validate+0x740>
		000000000000759c:  ARM64_RELOC_BRANCH26	_stogir.types.size
    75a0:      	lsr	w0, w0, #0
    75a4:      	sxtw	x0, w0
    75a8:      	cmp	x0, #0x0
    75ac:      	b.le	0x75d0 <_stogir.locals.validate+0x774>
    75b0:      	cmp	x0, x20
    75b4:      	b.gt	0x75d0 <_stogir.locals.validate+0x774>
    75b8:      	cmp	x25, #0x0
    75bc:      	b.eq	0x7668 <_stogir.locals.validate+0x80c>
    75c0:      	ldr	w1, [x19]
    75c4:      	ubfx	x1, x1, #8, #8
    75c8:      	cmp	x1, #0x0
    75cc:      	b.eq	0x7668 <_stogir.locals.validate+0x80c>
    75d0:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x1a4>
		00000000000075d0:  ARM64_RELOC_PAGE21	l_stogir.392
    75d4:      	ldr	x16, [x16]
		00000000000075d4:  ARM64_RELOC_PAGEOFF12	l_stogir.392
    75d8:      	orr	x0, x16, xzr
    75dc:      	mov	x1, x0
    75e0:      	mov	x0, #0x1                ; =1
    75e4:      	mov	x2, #0x23               ; =35
    75e8:      	b	0x74a8 <_stogir.locals.validate+0x64c>
    75ec:      	ldr	x0, [x19]
    75f0:      	ldr	x1, [x19, #0x8]
    75f4:      	mov	x17, #0x1               ; =1
    75f8:      	str	x17, [x23]
    75fc:      	str	x0, [x23, #0x8]
    7600:      	str	x1, [x23, #0x10]
    7604:      	movz	x17, #0x0, lsl #48
    7608:      	str	x17, [x23, #0x18]
    760c:      	movz	x17, #0x0, lsl #48
    7610:      	str	x17, [x23, #0x20]
    7614:      	ldr	w0, [x23]
    7618:      	lsr	x16, x0, #0
    761c:      	cmp	x16, #0x1
    7620:      	b.eq	0x763c <_stogir.locals.validate+0x7e0>
    7624:      	b.lo	0x762c <_stogir.locals.validate+0x7d0>
    7628:      	b	0x7640 <_stogir.locals.validate+0x7e4>
    762c:      	cmp	x16, #0x0
    7630:      	b.eq	0x7638 <_stogir.locals.validate+0x7dc>
    7634:      	b	0x7640 <_stogir.locals.validate+0x7e4>
    7638:      	b	0x7644 <_stogir.locals.validate+0x7e8>
    763c:      	b	0x7570 <_stogir.locals.validate+0x714>
    7640:      	b	0x768c <_stogir.locals.validate+0x830>
    7644:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x1a4>
		0000000000007644:  ARM64_RELOC_PAGE21	l_stogir.393
    7648:      	ldr	x16, [x16]
		0000000000007648:  ARM64_RELOC_PAGEOFF12	l_stogir.393
    764c:      	orr	x0, x16, xzr
    7650:      	mov	x1, x0
    7654:      	mov	x0, #0x1                ; =1
    7658:      	mov	x2, #0x19               ; =25
    765c:      	b	0x75e8 <_stogir.locals.validate+0x78c>
    7660:      	brk	#0
    7664:      	b	0x7660 <_stogir.locals.validate+0x804>
    7668:      	ldr	w1, [x21]
    766c:      	uxtb	w1, w1
    7670:      	cmp	x1, #0x48
    7674:      	b.eq	0x75d0 <_stogir.locals.validate+0x774>
    7678:      	and	x0, x0, #0xffffffff
    767c:      	mov	x1, x0
    7680:      	movz	x0, #0x0, lsl #48
    7684:      	movz	x2, #0x0, lsl #48
    7688:      	b	0x75e8 <_stogir.locals.validate+0x78c>
    768c:      	brk	#0
    7690:      	b	0x768c <_stogir.locals.validate+0x830>
    7694:      	str	x8, [x29, #0x10]
    7698:      	b	0x6fac <_stogir.locals.validate+0x150>
    769c:      	str	x8, [x29, #0x10]
    76a0:      	b	0x6fac <_stogir.locals.validate+0x150>

00000000000076a4 <_stogir.conversion.operation?>:
    76a4:      	sxtw	x0, w0
    76a8:      	cmp	x0, #0x21
    76ac:      	b.lt	0x76c0 <_stogir.conversion.operation?+0x1c>
    76b0:      	cmp	x0, #0x27
    76b4:      	cset	w0, le
    76b8:      	ubfx	x0, x0, #0, #8
    76bc:      	b	0x76c4 <_stogir.conversion.operation?+0x20>
    76c0:      	movz	x0, #0x0, lsl #48
    76c4:      	ret

00000000000076c8 <_stogir.conversion.validate>:
    76c8:      	sub	sp, sp, #0x20
    76cc:      	str	x29, [sp]
    76d0:      	str	x30, [sp, #0x8]
    76d4:      	mov	x29, sp
    76d8:      	str	x19, [sp, #0x10]
    76dc:      	str	x20, [sp, #0x18]
    76e0:      	sub	sp, sp, #0x10
    76e4:      	mov	x3, sp
    76e8:      	sxtw	x1, w1
    76ec:      	sub	sp, sp, #0x20
    76f0:      	mov	x19, sp
    76f4:      	lsl	x4, x1, #2
    76f8:      	cmp	x1, #0x0
    76fc:      	cset	w5, gt
    7700:      	movz	x16, #0x0, lsl #48
    7704:      	sub	x6, x16, x1
    7708:      	sub	x7, x6, #0x1
    770c:      	uxtb	w16, w5
    7710:      	cmp	w16, wzr
    7714:      	b.eq	0x7754 <_stogir.conversion.validate+0x8c>
    7718:      	ldr	x6, [x0, #0x8]
    771c:      	cmp	x1, x6
    7720:      	b.ge	0x77a8 <_stogir.conversion.validate+0xe0>
    7724:      	add	x6, x0, #0x78
    7728:      	ldr	x6, [x6, #0x8]
    772c:      	cmp	x1, x6
    7730:      	b.ge	0x78cc <_stogir.conversion.validate+0x204>
    7734:      	ldr	x6, [x0, #0x78]
    7738:      	add	x6, x4, x6
    773c:      	ldr	w6, [x6]
    7740:      	sxtw	x6, w6
    7744:      	cmp	x6, #0x0
    7748:      	cset	w6, ge
    774c:      	ubfx	x6, x6, #0, #8
    7750:      	b	0x78d0 <_stogir.conversion.validate+0x208>
    7754:      	cmp	x1, #0x0
    7758:      	b.ge	0x77b0 <_stogir.conversion.validate+0xe8>
    775c:      	add	x9, x0, #0x28
    7760:      	add	x10, x0, #0x50
    7764:      	ldr	x9, [x9, #0x8]
    7768:      	ldr	x10, [x10, #0x8]
    776c:      	cmp	x9, x10
    7770:      	b.ne	0x77a0 <_stogir.conversion.validate+0xd8>
    7774:      	cmp	x6, x9
    7778:      	b.gt	0x7960 <_stogir.conversion.validate+0x298>
    777c:      	lsl	x6, x7, #2
    7780:      	ldr	x9, [x0, #0x50]
    7784:      	add	x6, x6, x9
    7788:      	ldr	w6, [x6]
    778c:      	sxtw	x6, w6
    7790:      	cmp	x6, #0x0
    7794:      	cset	w6, gt
    7798:      	ubfx	x6, x6, #0, #8
    779c:      	b	0x7964 <_stogir.conversion.validate+0x29c>
    77a0:      	movz	x6, #0x0, lsl #48
    77a4:      	b	0x77b4 <_stogir.conversion.validate+0xec>
    77a8:      	movz	x6, #0x0, lsl #48
    77ac:      	b	0x77b4 <_stogir.conversion.validate+0xec>
    77b0:      	movz	x6, #0x0, lsl #48
    77b4:      	cmp	x6, #0x0
    77b8:      	b.eq	0x781c <_stogir.conversion.validate+0x154>
    77bc:      	uxtb	w16, w5
    77c0:      	cmp	w16, wzr
    77c4:      	b.eq	0x77ec <_stogir.conversion.validate+0x124>
    77c8:      	lsl	x5, x1, #4
    77cc:      	ldr	x6, [x0]
    77d0:      	add	x5, x5, x6
    77d4:      	ldr	x6, [x5]
    77d8:      	ldr	x5, [x5, #0x8]
    77dc:      	fmov	d31, x5
    77e0:      	mov	x5, x6
    77e4:      	fmov	x6, d31
    77e8:      	b	0x780c <_stogir.conversion.validate+0x144>
    77ec:      	lsl	x5, x7, #4
    77f0:      	ldr	x6, [x0, #0x28]
    77f4:      	add	x5, x5, x6
    77f8:      	ldr	x6, [x5]
    77fc:      	ldr	x5, [x5, #0x8]
    7800:      	fmov	d31, x5
    7804:      	mov	x5, x6
    7808:      	fmov	x6, d31
    780c:      	mov	x7, x6
    7810:      	mov	x6, x5
    7814:      	mov	x5, #0x1                ; =1
    7818:      	b	0x7828 <_stogir.conversion.validate+0x160>
    781c:      	movz	x5, #0x0, lsl #48
    7820:      	movz	x6, #0x0, lsl #48
    7824:      	movz	x7, #0x0, lsl #48
    7828:      	lsr	w5, w5, #0
    782c:      	lsr	x16, x5, #0
    7830:      	cmp	x16, #0x1
    7834:      	b.eq	0x7850 <_stogir.conversion.validate+0x188>
    7838:      	b.lo	0x7840 <_stogir.conversion.validate+0x178>
    783c:      	b	0x7854 <_stogir.conversion.validate+0x18c>
    7840:      	cmp	x16, #0x0
    7844:      	b.eq	0x784c <_stogir.conversion.validate+0x184>
    7848:      	b	0x7854 <_stogir.conversion.validate+0x18c>
    784c:      	b	0x7858 <_stogir.conversion.validate+0x190>
    7850:      	b	0x789c <_stogir.conversion.validate+0x1d4>
    7854:      	b	0x79e0 <_stogir.conversion.validate+0x318>
    7858:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x1a4>
		0000000000007858:  ARM64_RELOC_PAGE21	l_stogir.394
    785c:      	ldr	x16, [x16]
		000000000000785c:  ARM64_RELOC_PAGEOFF12	l_stogir.394
    7860:      	orr	x0, x16, xzr
    7864:      	mov	x20, x8
    7868:      	mov	x1, x0
    786c:      	mov	x0, #0x1                ; =1
    7870:      	mov	x2, #0x12               ; =18
    7874:      	str	x0, [x20]
    7878:      	str	x1, [x20, #0x8]
    787c:      	str	x2, [x20, #0x10]
    7880:      	sub	sp, x29, #0x0
    7884:      	ldr	x19, [sp, #0x10]
    7888:      	ldr	x20, [sp, #0x18]
    788c:      	ldr	x29, [sp]
    7890:      	ldr	x30, [sp, #0x8]
    7894:      	add	sp, sp, #0x20
    7898:      	ret
    789c:      	str	x6, [x3]
    78a0:      	str	x7, [x3, #0x8]
    78a4:      	cmp	x1, #0x0
    78a8:      	b.gt	0x78d4 <_stogir.conversion.validate+0x20c>
    78ac:      	mov	x20, x8
    78b0:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x1a4>
		00000000000078b0:  ARM64_RELOC_PAGE21	l_stogir.395
    78b4:      	ldr	x16, [x16]
		00000000000078b4:  ARM64_RELOC_PAGEOFF12	l_stogir.395
    78b8:      	orr	x0, x16, xzr
    78bc:      	mov	x1, x0
    78c0:      	mov	x0, #0x1                ; =1
    78c4:      	mov	x2, #0x1e               ; =30
    78c8:      	b	0x7874 <_stogir.conversion.validate+0x1ac>
    78cc:      	movz	x6, #0x0, lsl #48
    78d0:      	b	0x77ac <_stogir.conversion.validate+0xe4>
    78d4:      	uxtb	w1, w6
    78d8:      	cmp	x1, #0x21
    78dc:      	b.lt	0x7b08 <_stogir.conversion.validate+0x440>
    78e0:      	cmp	x1, #0x27
    78e4:      	b.gt	0x7b10 <_stogir.conversion.validate+0x448>
    78e8:      	ldr	x1, [x0, #0x78]
    78ec:      	add	x4, x4, x1
    78f0:      	ldr	w4, [x4]
    78f4:      	sxtw	x4, w4
    78f8:      	cmp	x4, #0x1
    78fc:      	b.ne	0x7b18 <_stogir.conversion.validate+0x450>
    7900:      	asr	x4, x6, #32
    7904:      	cmp	x4, #0x0
    7908:      	cset	w5, gt
    790c:      	movz	x16, #0x0, lsl #48
    7910:      	sub	x6, x16, x4
    7914:      	sub	x7, x6, #0x1
    7918:      	uxtb	w16, w5
    791c:      	cmp	w16, wzr
    7920:      	b.eq	0x7994 <_stogir.conversion.validate+0x2cc>
    7924:      	ldr	x6, [x0, #0x8]
    7928:      	cmp	x4, x6
    792c:      	b.ge	0x79e8 <_stogir.conversion.validate+0x320>
    7930:      	add	x6, x0, #0x78
    7934:      	ldr	x6, [x6, #0x8]
    7938:      	cmp	x4, x6
    793c:      	b.ge	0x7a98 <_stogir.conversion.validate+0x3d0>
    7940:      	lsl	x6, x4, #2
    7944:      	add	x1, x6, x1
    7948:      	ldr	w1, [x1]
    794c:      	sxtw	x1, w1
    7950:      	cmp	x1, #0x0
    7954:      	cset	w1, ge
    7958:      	ubfx	x1, x1, #0, #8
    795c:      	b	0x7a9c <_stogir.conversion.validate+0x3d4>
    7960:      	movz	x6, #0x0, lsl #48
    7964:      	b	0x77a4 <_stogir.conversion.validate+0xdc>
    7968:      	uxtb	w0, w1
    796c:      	cmp	x0, #0x48
    7970:      	b.ne	0x7aa0 <_stogir.conversion.validate+0x3d8>
    7974:      	mov	x20, x8
    7978:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x1a4>
		0000000000007978:  ARM64_RELOC_PAGE21	l_stogir.396
    797c:      	ldr	x16, [x16]
		000000000000797c:  ARM64_RELOC_PAGEOFF12	l_stogir.396
    7980:      	orr	x0, x16, xzr
    7984:      	mov	x1, x0
    7988:      	mov	x0, #0x1                ; =1
    798c:      	mov	x2, #0x25               ; =37
    7990:      	b	0x78c8 <_stogir.conversion.validate+0x200>
    7994:      	cmp	x4, #0x0
    7998:      	b.ge	0x79f0 <_stogir.conversion.validate+0x328>
    799c:      	add	x1, x0, #0x28
    79a0:      	add	x9, x0, #0x50
    79a4:      	ldr	x1, [x1, #0x8]
    79a8:      	ldr	x9, [x9, #0x8]
    79ac:      	cmp	x1, x9
    79b0:      	b.ne	0x7a90 <_stogir.conversion.validate+0x3c8>
    79b4:      	cmp	x6, x1
    79b8:      	b.gt	0x7af8 <_stogir.conversion.validate+0x430>
    79bc:      	lsl	x1, x7, #2
    79c0:      	ldr	x6, [x0, #0x50]
    79c4:      	add	x1, x1, x6
    79c8:      	ldr	w1, [x1]
    79cc:      	sxtw	x1, w1
    79d0:      	cmp	x1, #0x0
    79d4:      	cset	w1, gt
    79d8:      	ubfx	x1, x1, #0, #8
    79dc:      	b	0x7afc <_stogir.conversion.validate+0x434>
    79e0:      	brk	#0
    79e4:      	b	0x79e0 <_stogir.conversion.validate+0x318>
    79e8:      	movz	x1, #0x0, lsl #48
    79ec:      	b	0x79f4 <_stogir.conversion.validate+0x32c>
    79f0:      	movz	x1, #0x0, lsl #48
    79f4:      	cmp	x1, #0x0
    79f8:      	b.eq	0x7a38 <_stogir.conversion.validate+0x370>
    79fc:      	uxtb	w16, w5
    7a00:      	cmp	w16, wzr
    7a04:      	b.eq	0x7a1c <_stogir.conversion.validate+0x354>
    7a08:      	lsl	x1, x4, #4
    7a0c:      	ldr	x0, [x0]
    7a10:      	add	x0, x1, x0
    7a14:      	ldr	x0, [x0]
    7a18:      	b	0x7a2c <_stogir.conversion.validate+0x364>
    7a1c:      	lsl	x1, x7, #4
    7a20:      	ldr	x0, [x0, #0x28]
    7a24:      	add	x0, x1, x0
    7a28:      	ldr	x0, [x0]
    7a2c:      	mov	x1, x0
    7a30:      	mov	x0, #0x1                ; =1
    7a34:      	b	0x7a40 <_stogir.conversion.validate+0x378>
    7a38:      	movz	x0, #0x0, lsl #48
    7a3c:      	movz	x1, #0x0, lsl #48
    7a40:      	lsr	w0, w0, #0
    7a44:      	lsr	x16, x0, #0
    7a48:      	cmp	x16, #0x1
    7a4c:      	b.eq	0x7a68 <_stogir.conversion.validate+0x3a0>
    7a50:      	b.lo	0x7a58 <_stogir.conversion.validate+0x390>
    7a54:      	b	0x7a6c <_stogir.conversion.validate+0x3a4>
    7a58:      	cmp	x16, #0x0
    7a5c:      	b.eq	0x7a64 <_stogir.conversion.validate+0x39c>
    7a60:      	b	0x7a6c <_stogir.conversion.validate+0x3a4>
    7a64:      	b	0x7a70 <_stogir.conversion.validate+0x3a8>
    7a68:      	b	0x7968 <_stogir.conversion.validate+0x2a0>
    7a6c:      	b	0x7b00 <_stogir.conversion.validate+0x438>
    7a70:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x1a4>
		0000000000007a70:  ARM64_RELOC_PAGE21	l_stogir.397
    7a74:      	ldr	x16, [x16]
		0000000000007a74:  ARM64_RELOC_PAGEOFF12	l_stogir.397
    7a78:      	orr	x0, x16, xzr
    7a7c:      	mov	x20, x8
    7a80:      	mov	x1, x0
    7a84:      	mov	x0, #0x1                ; =1
    7a88:      	mov	x2, #0x19               ; =25
    7a8c:      	b	0x7990 <_stogir.conversion.validate+0x2c8>
    7a90:      	movz	x1, #0x0, lsl #48
    7a94:      	b	0x79f4 <_stogir.conversion.validate+0x32c>
    7a98:      	movz	x1, #0x0, lsl #48
    7a9c:      	b	0x79ec <_stogir.conversion.validate+0x324>
    7aa0:      	cmp	x0, #0x46
    7aa4:      	b.eq	0x7b20 <_stogir.conversion.validate+0x458>
    7aa8:      	lsr	w2, w2, #0
    7aac:      	lsr	w1, w1, #0
    7ab0:      	ldr	w0, [x3]
    7ab4:      	uxtb	w3, w0
    7ab8:      	ubfx	x1, x1, #8, #8
    7abc:      	lsr	w3, w3, #0
    7ac0:      	ubfx	x0, x0, #8, #8
    7ac4:      	lsr	w1, w1, #0
    7ac8:      	lsr	w0, w0, #0
    7acc:      	mov	x20, x8
    7ad0:      	mov	x8, x19
    7ad4:      	fmov	s31, w0
    7ad8:      	mov	w0, w3
    7adc:      	mov	w3, w2
    7ae0:      	fmov	w2, s31
    7ae4:      	bl	0x7ae4 <_stogir.conversion.validate+0x41c>
		0000000000007ae4:  ARM64_RELOC_BRANCH26	_stogir.conversion.policy
    7ae8:      	ldr	x0, [x19]
    7aec:      	ldr	x1, [x19, #0x8]
    7af0:      	ldr	x2, [x19, #0x10]
    7af4:      	b	0x7990 <_stogir.conversion.validate+0x2c8>
    7af8:      	movz	x1, #0x0, lsl #48
    7afc:      	b	0x7a94 <_stogir.conversion.validate+0x3cc>
    7b00:      	brk	#0
    7b04:      	b	0x7b00 <_stogir.conversion.validate+0x438>
    7b08:      	mov	x20, x8
    7b0c:      	b	0x78b0 <_stogir.conversion.validate+0x1e8>
    7b10:      	mov	x20, x8
    7b14:      	b	0x78b0 <_stogir.conversion.validate+0x1e8>
    7b18:      	mov	x20, x8
    7b1c:      	b	0x78b0 <_stogir.conversion.validate+0x1e8>
    7b20:      	mov	x20, x8
    7b24:      	b	0x7978 <_stogir.conversion.validate+0x2b0>

0000000000007b28 <_stogir.conditional.validate>:
    7b28:      	sub	sp, sp, #0x20
    7b2c:      	str	x29, [sp]
    7b30:      	str	x30, [sp, #0x8]
    7b34:      	mov	x29, sp
    7b38:      	str	x19, [sp, #0x10]
    7b3c:      	str	x20, [sp, #0x18]
    7b40:      	sub	sp, sp, #0x20
    7b44:      	mov	x19, sp
    7b48:      	sxtw	x1, w1
    7b4c:      	lsl	x2, x1, #2
    7b50:      	cmp	x1, #0x0
    7b54:      	cset	w3, gt
    7b58:      	movz	x16, #0x0, lsl #48
    7b5c:      	sub	x4, x16, x1
    7b60:      	sub	x5, x4, #0x1
    7b64:      	uxtb	w16, w3
    7b68:      	cmp	w16, wzr
    7b6c:      	b.eq	0x7bac <_stogir.conditional.validate+0x84>
    7b70:      	ldr	x4, [x0, #0x8]
    7b74:      	cmp	x1, x4
    7b78:      	b.ge	0x7c00 <_stogir.conditional.validate+0xd8>
    7b7c:      	add	x4, x0, #0x78
    7b80:      	ldr	x4, [x4, #0x8]
    7b84:      	cmp	x1, x4
    7b88:      	b.ge	0x7d1c <_stogir.conditional.validate+0x1f4>
    7b8c:      	ldr	x4, [x0, #0x78]
    7b90:      	add	x4, x2, x4
    7b94:      	ldr	w4, [x4]
    7b98:      	sxtw	x4, w4
    7b9c:      	cmp	x4, #0x0
    7ba0:      	cset	w4, ge
    7ba4:      	ubfx	x4, x4, #0, #8
    7ba8:      	b	0x7d20 <_stogir.conditional.validate+0x1f8>
    7bac:      	cmp	x1, #0x0
    7bb0:      	b.ge	0x7c08 <_stogir.conditional.validate+0xe0>
    7bb4:      	add	x6, x0, #0x28
    7bb8:      	add	x7, x0, #0x50
    7bbc:      	ldr	x6, [x6, #0x8]
    7bc0:      	ldr	x7, [x7, #0x8]
    7bc4:      	cmp	x6, x7
    7bc8:      	b.ne	0x7bf8 <_stogir.conditional.validate+0xd0>
    7bcc:      	cmp	x4, x6
    7bd0:      	b.gt	0x7d98 <_stogir.conditional.validate+0x270>
    7bd4:      	lsl	x4, x5, #2
    7bd8:      	ldr	x6, [x0, #0x50]
    7bdc:      	add	x4, x4, x6
    7be0:      	ldr	w4, [x4]
    7be4:      	sxtw	x4, w4
    7be8:      	cmp	x4, #0x0
    7bec:      	cset	w4, gt
    7bf0:      	ubfx	x4, x4, #0, #8
    7bf4:      	b	0x7d9c <_stogir.conditional.validate+0x274>
    7bf8:      	movz	x4, #0x0, lsl #48
    7bfc:      	b	0x7c0c <_stogir.conditional.validate+0xe4>
    7c00:      	movz	x4, #0x0, lsl #48
    7c04:      	b	0x7c0c <_stogir.conditional.validate+0xe4>
    7c08:      	movz	x4, #0x0, lsl #48
    7c0c:      	cmp	x4, #0x0
    7c10:      	b.eq	0x7c74 <_stogir.conditional.validate+0x14c>
    7c14:      	uxtb	w16, w3
    7c18:      	cmp	w16, wzr
    7c1c:      	b.eq	0x7c44 <_stogir.conditional.validate+0x11c>
    7c20:      	lsl	x3, x1, #4
    7c24:      	ldr	x4, [x0]
    7c28:      	add	x3, x3, x4
    7c2c:      	ldr	x4, [x3]
    7c30:      	ldr	x3, [x3, #0x8]
    7c34:      	fmov	d31, x3
    7c38:      	mov	x3, x4
    7c3c:      	fmov	x4, d31
    7c40:      	b	0x7c64 <_stogir.conditional.validate+0x13c>
    7c44:      	lsl	x3, x5, #4
    7c48:      	ldr	x4, [x0, #0x28]
    7c4c:      	add	x3, x3, x4
    7c50:      	ldr	x4, [x3]
    7c54:      	ldr	x3, [x3, #0x8]
    7c58:      	fmov	d31, x3
    7c5c:      	mov	x3, x4
    7c60:      	fmov	x4, d31
    7c64:      	mov	x5, x4
    7c68:      	mov	x4, x3
    7c6c:      	mov	x3, #0x1                ; =1
    7c70:      	b	0x7c80 <_stogir.conditional.validate+0x158>
    7c74:      	movz	x3, #0x0, lsl #48
    7c78:      	movz	x4, #0x0, lsl #48
    7c7c:      	movz	x5, #0x0, lsl #48
    7c80:      	lsr	w3, w3, #0
    7c84:      	lsr	x16, x3, #0
    7c88:      	cmp	x16, #0x1
    7c8c:      	b.eq	0x7ca8 <_stogir.conditional.validate+0x180>
    7c90:      	b.lo	0x7c98 <_stogir.conditional.validate+0x170>
    7c94:      	b	0x7cac <_stogir.conditional.validate+0x184>
    7c98:      	cmp	x16, #0x0
    7c9c:      	b.eq	0x7ca4 <_stogir.conditional.validate+0x17c>
    7ca0:      	b	0x7cac <_stogir.conditional.validate+0x184>
    7ca4:      	b	0x7cb0 <_stogir.conditional.validate+0x188>
    7ca8:      	b	0x7cd0 <_stogir.conditional.validate+0x1a8>
    7cac:      	b	0x7da0 <_stogir.conditional.validate+0x278>
    7cb0:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x1a4>
		0000000000007cb0:  ARM64_RELOC_PAGE21	l_stogir.398
    7cb4:      	ldr	x16, [x16]
		0000000000007cb4:  ARM64_RELOC_PAGEOFF12	l_stogir.398
    7cb8:      	orr	x0, x16, xzr
    7cbc:      	mov	x20, x8
    7cc0:      	mov	x1, x0
    7cc4:      	mov	x0, #0x1                ; =1
    7cc8:      	mov	x2, #0x18               ; =24
    7ccc:      	b	0x7cf4 <_stogir.conditional.validate+0x1cc>
    7cd0:      	cmp	x1, #0x0
    7cd4:      	b.gt	0x7d24 <_stogir.conditional.validate+0x1fc>
    7cd8:      	mov	x20, x8
    7cdc:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x1a4>
		0000000000007cdc:  ARM64_RELOC_PAGE21	l_stogir.399
    7ce0:      	ldr	x16, [x16]
		0000000000007ce0:  ARM64_RELOC_PAGEOFF12	l_stogir.399
    7ce4:      	orr	x0, x16, xzr
    7ce8:      	mov	x1, x0
    7cec:      	mov	x0, #0x1                ; =1
    7cf0:      	mov	x2, #0x18               ; =24
    7cf4:      	str	x0, [x20]
    7cf8:      	str	x1, [x20, #0x8]
    7cfc:      	str	x2, [x20, #0x10]
    7d00:      	sub	sp, x29, #0x0
    7d04:      	ldr	x19, [sp, #0x10]
    7d08:      	ldr	x20, [sp, #0x18]
    7d0c:      	ldr	x29, [sp]
    7d10:      	ldr	x30, [sp, #0x8]
    7d14:      	add	sp, sp, #0x20
    7d18:      	ret
    7d1c:      	movz	x4, #0x0, lsl #48
    7d20:      	b	0x7c04 <_stogir.conditional.validate+0xdc>
    7d24:      	uxtb	w1, w4
    7d28:      	cmp	x1, #0x3c
    7d2c:      	b.ne	0x7da8 <_stogir.conditional.validate+0x280>
    7d30:      	ldr	x1, [x0, #0x78]
    7d34:      	add	x1, x2, x1
    7d38:      	ldr	w1, [x1]
    7d3c:      	sxtw	x1, w1
    7d40:      	cmp	x1, #0x3
    7d44:      	b.ne	0x7db0 <_stogir.conditional.validate+0x288>
    7d48:      	lsr	w1, w5, #0
    7d4c:      	lsr	w2, w4, #0
    7d50:      	lsr	x3, x4, #32
    7d54:      	lsr	w1, w1, #0
    7d58:      	lsr	x4, x5, #32
    7d5c:      	lsr	w3, w3, #0
    7d60:      	lsr	w4, w4, #0
    7d64:      	ubfx	x2, x2, #8, #8
    7d68:      	lsr	w2, w2, #0
    7d6c:      	mov	x20, x8
    7d70:      	mov	x8, x19
    7d74:      	fmov	s31, w1
    7d78:      	mov	w1, w2
    7d7c:      	mov	w2, w3
    7d80:      	fmov	w3, s31
    7d84:      	bl	0x7d84 <_stogir.conditional.validate+0x25c>
		0000000000007d84:  ARM64_RELOC_BRANCH26	_stogir.conditional.operands
    7d88:      	ldr	x0, [x19]
    7d8c:      	ldr	x1, [x19, #0x8]
    7d90:      	ldr	x2, [x19, #0x10]
    7d94:      	b	0x7cf4 <_stogir.conditional.validate+0x1cc>
    7d98:      	movz	x4, #0x0, lsl #48
    7d9c:      	b	0x7bfc <_stogir.conditional.validate+0xd4>
    7da0:      	brk	#0
    7da4:      	b	0x7da0 <_stogir.conditional.validate+0x278>
    7da8:      	mov	x20, x8
    7dac:      	b	0x7cdc <_stogir.conditional.validate+0x1b4>
    7db0:      	mov	x20, x8
    7db4:      	b	0x7cdc <_stogir.conditional.validate+0x1b4>

0000000000007db8 <_stogir.floating.validate>:
    7db8:      	sub	sp, sp, #0x20
    7dbc:      	str	x29, [sp]
    7dc0:      	str	x30, [sp, #0x8]
    7dc4:      	mov	x29, sp
    7dc8:      	str	x19, [sp, #0x10]
    7dcc:      	str	x20, [sp, #0x18]
    7dd0:      	sub	sp, sp, #0x10
    7dd4:      	mov	x2, sp
    7dd8:      	sxtw	x1, w1
    7ddc:      	sub	sp, sp, #0x20
    7de0:      	mov	x19, sp
    7de4:      	lsl	x3, x1, #2
    7de8:      	cmp	x1, #0x0
    7dec:      	cset	w4, gt
    7df0:      	movz	x16, #0x0, lsl #48
    7df4:      	sub	x5, x16, x1
    7df8:      	sub	x6, x5, #0x1
    7dfc:      	uxtb	w16, w4
    7e00:      	cmp	w16, wzr
    7e04:      	b.eq	0x7e44 <_stogir.floating.validate+0x8c>
    7e08:      	ldr	x5, [x0, #0x8]
    7e0c:      	cmp	x1, x5
    7e10:      	b.ge	0x7e98 <_stogir.floating.validate+0xe0>
    7e14:      	add	x5, x0, #0x78
    7e18:      	ldr	x5, [x5, #0x8]
    7e1c:      	cmp	x1, x5
    7e20:      	b.ge	0x7fbc <_stogir.floating.validate+0x204>
    7e24:      	ldr	x5, [x0, #0x78]
    7e28:      	add	x5, x3, x5
    7e2c:      	ldr	w5, [x5]
    7e30:      	sxtw	x5, w5
    7e34:      	cmp	x5, #0x0
    7e38:      	cset	w5, ge
    7e3c:      	ubfx	x5, x5, #0, #8
    7e40:      	b	0x7fc0 <_stogir.floating.validate+0x208>
    7e44:      	cmp	x1, #0x0
    7e48:      	b.ge	0x7ea0 <_stogir.floating.validate+0xe8>
    7e4c:      	add	x7, x0, #0x28
    7e50:      	add	x9, x0, #0x50
    7e54:      	ldr	x7, [x7, #0x8]
    7e58:      	ldr	x9, [x9, #0x8]
    7e5c:      	cmp	x7, x9
    7e60:      	b.ne	0x7e90 <_stogir.floating.validate+0xd8>
    7e64:      	cmp	x5, x7
    7e68:      	b.gt	0x8048 <_stogir.floating.validate+0x290>
    7e6c:      	lsl	x5, x6, #2
    7e70:      	ldr	x7, [x0, #0x50]
    7e74:      	add	x5, x5, x7
    7e78:      	ldr	w5, [x5]
    7e7c:      	sxtw	x5, w5
    7e80:      	cmp	x5, #0x0
    7e84:      	cset	w5, gt
    7e88:      	ubfx	x5, x5, #0, #8
    7e8c:      	b	0x804c <_stogir.floating.validate+0x294>
    7e90:      	movz	x5, #0x0, lsl #48
    7e94:      	b	0x7ea4 <_stogir.floating.validate+0xec>
    7e98:      	movz	x5, #0x0, lsl #48
    7e9c:      	b	0x7ea4 <_stogir.floating.validate+0xec>
    7ea0:      	movz	x5, #0x0, lsl #48
    7ea4:      	cmp	x5, #0x0
    7ea8:      	b.eq	0x7f0c <_stogir.floating.validate+0x154>
    7eac:      	uxtb	w16, w4
    7eb0:      	cmp	w16, wzr
    7eb4:      	b.eq	0x7edc <_stogir.floating.validate+0x124>
    7eb8:      	lsl	x4, x1, #4
    7ebc:      	ldr	x5, [x0]
    7ec0:      	add	x4, x4, x5
    7ec4:      	ldr	x5, [x4]
    7ec8:      	ldr	x4, [x4, #0x8]
    7ecc:      	fmov	d31, x4
    7ed0:      	mov	x4, x5
    7ed4:      	fmov	x5, d31
    7ed8:      	b	0x7efc <_stogir.floating.validate+0x144>
    7edc:      	lsl	x4, x6, #4
    7ee0:      	ldr	x5, [x0, #0x28]
    7ee4:      	add	x4, x4, x5
    7ee8:      	ldr	x5, [x4]
    7eec:      	ldr	x4, [x4, #0x8]
    7ef0:      	fmov	d31, x4
    7ef4:      	mov	x4, x5
    7ef8:      	fmov	x5, d31
    7efc:      	mov	x6, x5
    7f00:      	mov	x5, x4
    7f04:      	mov	x4, #0x1                ; =1
    7f08:      	b	0x7f18 <_stogir.floating.validate+0x160>
    7f0c:      	movz	x4, #0x0, lsl #48
    7f10:      	movz	x5, #0x0, lsl #48
    7f14:      	movz	x6, #0x0, lsl #48
    7f18:      	lsr	w4, w4, #0
    7f1c:      	lsr	x16, x4, #0
    7f20:      	cmp	x16, #0x1
    7f24:      	b.eq	0x7f40 <_stogir.floating.validate+0x188>
    7f28:      	b.lo	0x7f30 <_stogir.floating.validate+0x178>
    7f2c:      	b	0x7f44 <_stogir.floating.validate+0x18c>
    7f30:      	cmp	x16, #0x0
    7f34:      	b.eq	0x7f3c <_stogir.floating.validate+0x184>
    7f38:      	b	0x7f44 <_stogir.floating.validate+0x18c>
    7f3c:      	b	0x7f48 <_stogir.floating.validate+0x190>
    7f40:      	b	0x7f8c <_stogir.floating.validate+0x1d4>
    7f44:      	b	0x82e0 <_stogir.floating.validate+0x528>
    7f48:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x1a4>
		0000000000007f48:  ARM64_RELOC_PAGE21	l_stogir.400
    7f4c:      	ldr	x16, [x16]
		0000000000007f4c:  ARM64_RELOC_PAGEOFF12	l_stogir.400
    7f50:      	orr	x0, x16, xzr
    7f54:      	mov	x20, x8
    7f58:      	mov	x1, x0
    7f5c:      	mov	x0, #0x1                ; =1
    7f60:      	mov	x2, #0x1c               ; =28
    7f64:      	str	x0, [x20]
    7f68:      	str	x1, [x20, #0x8]
    7f6c:      	str	x2, [x20, #0x10]
    7f70:      	sub	sp, x29, #0x0
    7f74:      	ldr	x19, [sp, #0x10]
    7f78:      	ldr	x20, [sp, #0x18]
    7f7c:      	ldr	x29, [sp]
    7f80:      	ldr	x30, [sp, #0x8]
    7f84:      	add	sp, sp, #0x20
    7f88:      	ret
    7f8c:      	str	x5, [x2]
    7f90:      	str	x6, [x2, #0x8]
    7f94:      	cmp	x1, #0x0
    7f98:      	b.gt	0x7fc4 <_stogir.floating.validate+0x20c>
    7f9c:      	mov	x20, x8
    7fa0:      	adrp	x16, 0x7000 <_stogir.locals.validate+0x1a4>
		0000000000007fa0:  ARM64_RELOC_PAGE21	l_stogir.401
    7fa4:      	ldr	x16, [x16]
		0000000000007fa4:  ARM64_RELOC_PAGEOFF12	l_stogir.401
    7fa8:      	orr	x0, x16, xzr
    7fac:      	mov	x1, x0
    7fb0:      	mov	x0, #0x1                ; =1
    7fb4:      	mov	x2, #0x1c               ; =28
    7fb8:      	b	0x7f64 <_stogir.floating.validate+0x1ac>
    7fbc:      	movz	x5, #0x0, lsl #48
    7fc0:      	b	0x7e9c <_stogir.floating.validate+0xe4>
    7fc4:      	uxtb	w5, w5
    7fc8:      	orr	x1, x5, xzr
    7fcc:      	cmp	x1, #0xe
    7fd0:      	cset	w4, ge
    7fd4:      	cmp	x1, #0x19
    7fd8:      	cset	w6, le
    7fdc:      	cmp	x1, #0x1f
    7fe0:      	cset	w7, eq
    7fe4:      	cmp	x1, #0x20
    7fe8:      	cset	w9, eq
    7fec:      	uxtb	w16, w4
    7ff0:      	cmp	w16, wzr
    7ff4:      	b.eq	0x8050 <_stogir.floating.validate+0x298>
    7ff8:      	uxtb	w16, w6
    7ffc:      	cmp	w16, wzr
    8000:      	b.eq	0x8050 <_stogir.floating.validate+0x298>
    8004:      	cmp	x1, #0x1d
    8008:      	cset	w1, eq
    800c:      	ldr	x10, [x0, #0x78]
    8010:      	add	x3, x3, x10
    8014:      	ldr	w3, [x3]
    8018:      	uxtb	w16, w7
    801c:      	cmp	w16, wzr
    8020:      	b.ne	0x8090 <_stogir.floating.validate+0x2d8>
    8024:      	uxtb	w16, w9
    8028:      	cmp	w16, wzr
    802c:      	b.ne	0x8090 <_stogir.floating.validate+0x2d8>
    8030:      	uxtb	w16, w1
    8034:      	cmp	w16, wzr
    8038:      	mov	x16, #0x3               ; =3
    803c:      	mov	x17, #0x2               ; =2
    8040:      	csel	x7, x16, x17, ne
    8044:      	b	0x8094 <_stogir.floating.validate+0x2dc>
    8048:      	movz	x5, #0x0, lsl #48
    804c:      	b	0x7e94 <_stogir.floating.validate+0xdc>
    8050:      	uxtb	w16, w7
    8054:      	cmp	w16, wzr
    8058:      	b.ne	0x8004 <_stogir.floating.validate+0x24c>
    805c:      	uxtb	w16, w9
    8060:      	cmp	w16, wzr
    8064:      	b.ne	0x8004 <_stogir.floating.validate+0x24c>
    8068:      	cmp	x1, #0x1a
    806c:      	b.lt	0x8078 <_stogir.floating.validate+0x2c0>
    8070:      	cmp	x1, #0x1d
    8074:      	b.le	0x8004 <_stogir.floating.validate+0x24c>
    8078:      	cmp	x1, #0x3a
    807c:      	b.eq	0x8004 <_stogir.floating.validate+0x24c>
    8080:      	cmp	x1, #0x3b
    8084:      	b.eq	0x8004 <_stogir.floating.validate+0x24c>
    8088:      	mov	x20, x8
    808c:      	b	0x7fa0 <_stogir.floating.validate+0x1e8>
    8090:      	mov	x7, #0x1                ; =1
    8094:      	sxtw	x3, w3
    8098:      	lsr	w7, w7, #0
    809c:      	sxtw	x7, w7
    80a0:      	cmp	x3, x7
    80a4:      	b.ne	0x82f0 <_stogir.floating.validate+0x538>
    80a8:      	ldr	w3, [x2, #0x4]
    80ac:      	sxtw	x3, w3
    80b0:      	cmp	x3, #0x0
    80b4:      	cset	w7, gt
    80b8:      	movz	x16, #0x0, lsl #48
    80bc:      	sub	x9, x16, x3
    80c0:      	sub	x10, x9, #0x1
    80c4:      	uxtb	w16, w7
    80c8:      	cmp	w16, wzr
    80cc:      	b.eq	0x812c <_stogir.floating.validate+0x374>
    80d0:      	ldr	x9, [x0, #0x8]
    80d4:      	cmp	x3, x9
    80d8:      	b.ge	0x8178 <_stogir.floating.validate+0x3c0>
    80dc:      	add	x9, x0, #0x78
    80e0:      	ldr	x9, [x9, #0x8]
    80e4:      	cmp	x3, x9
    80e8:      	b.ge	0x8254 <_stogir.floating.validate+0x49c>
    80ec:      	lsl	x9, x3, #2
    80f0:      	ldr	x11, [x0, #0x78]
    80f4:      	add	x9, x9, x11
    80f8:      	ldr	w9, [x9]
    80fc:      	sxtw	x9, w9
    8100:      	cmp	x9, #0x0
    8104:      	cset	w9, ge
    8108:      	ubfx	x9, x9, #0, #8
    810c:      	b	0x8258 <_stogir.floating.validate+0x4a0>
    8110:      	adrp	x16, 0x8000 <_stogir.floating.validate+0x248>
		0000000000008110:  ARM64_RELOC_PAGE21	l_stogir.402
    8114:      	ldr	x16, [x16]
		0000000000008114:  ARM64_RELOC_PAGEOFF12	l_stogir.402
    8118:      	orr	x0, x16, xzr
    811c:      	mov	x1, x0
    8120:      	mov	x0, #0x1                ; =1
    8124:      	mov	x2, #0x1d               ; =29
    8128:      	b	0x7fb8 <_stogir.floating.validate+0x200>
    812c:      	cmp	x3, #0x0
    8130:      	b.ge	0x8180 <_stogir.floating.validate+0x3c8>
    8134:      	add	x11, x0, #0x28
    8138:      	add	x12, x0, #0x50
    813c:      	ldr	x11, [x11, #0x8]
    8140:      	ldr	x12, [x12, #0x8]
    8144:      	cmp	x11, x12
    8148:      	b.ne	0x824c <_stogir.floating.validate+0x494>
    814c:      	cmp	x9, x11
    8150:      	b.gt	0x82d8 <_stogir.floating.validate+0x520>
    8154:      	lsl	x9, x10, #2
    8158:      	ldr	x11, [x0, #0x50]
    815c:      	add	x9, x9, x11
    8160:      	ldr	w9, [x9]
    8164:      	sxtw	x9, w9
    8168:      	cmp	x9, #0x0
    816c:      	cset	w9, gt
    8170:      	ubfx	x9, x9, #0, #8
    8174:      	b	0x82dc <_stogir.floating.validate+0x524>
    8178:      	movz	x9, #0x0, lsl #48
    817c:      	b	0x8184 <_stogir.floating.validate+0x3cc>
    8180:      	movz	x9, #0x0, lsl #48
    8184:      	cmp	x9, #0x0
    8188:      	b.eq	0x81c8 <_stogir.floating.validate+0x410>
    818c:      	uxtb	w16, w7
    8190:      	cmp	w16, wzr
    8194:      	b.eq	0x81ac <_stogir.floating.validate+0x3f4>
    8198:      	lsl	x3, x3, #4
    819c:      	ldr	x7, [x0]
    81a0:      	add	x3, x3, x7
    81a4:      	ldr	x3, [x3]
    81a8:      	b	0x81bc <_stogir.floating.validate+0x404>
    81ac:      	lsl	x3, x10, #4
    81b0:      	ldr	x7, [x0, #0x28]
    81b4:      	add	x3, x3, x7
    81b8:      	ldr	x3, [x3]
    81bc:      	mov	x7, x3
    81c0:      	mov	x3, #0x1                ; =1
    81c4:      	b	0x81d0 <_stogir.floating.validate+0x418>
    81c8:      	movz	x3, #0x0, lsl #48
    81cc:      	movz	x7, #0x0, lsl #48
    81d0:      	lsr	w3, w3, #0
    81d4:      	lsr	x16, x3, #0
    81d8:      	cmp	x16, #0x1
    81dc:      	b.eq	0x81f8 <_stogir.floating.validate+0x440>
    81e0:      	b.lo	0x81e8 <_stogir.floating.validate+0x430>
    81e4:      	b	0x81fc <_stogir.floating.validate+0x444>
    81e8:      	cmp	x16, #0x0
    81ec:      	b.eq	0x81f4 <_stogir.floating.validate+0x43c>
    81f0:      	b	0x81fc <_stogir.floating.validate+0x444>
    81f4:      	b	0x8200 <_stogir.floating.validate+0x448>
    81f8:      	b	0x8220 <_stogir.floating.validate+0x468>
    81fc:      	b	0x82e8 <_stogir.floating.validate+0x530>
    8200:      	adrp	x16, 0x8000 <_stogir.floating.validate+0x248>
		0000000000008200:  ARM64_RELOC_PAGE21	l_stogir.403
    8204:      	ldr	x16, [x16]
		0000000000008204:  ARM64_RELOC_PAGEOFF12	l_stogir.403
    8208:      	orr	x0, x16, xzr
    820c:      	mov	x20, x8
    8210:      	mov	x1, x0
    8214:      	mov	x0, #0x1                ; =1
    8218:      	mov	x2, #0x18               ; =24
    821c:      	b	0x8128 <_stogir.floating.validate+0x370>
    8220:      	lsr	w7, w7, #0
    8224:      	ldr	w3, [x2]
    8228:      	ubfx	x7, x7, #8, #8
    822c:      	uxtb	w16, w4
    8230:      	cmp	w16, wzr
    8234:      	b.eq	0x82a0 <_stogir.floating.validate+0x4e8>
    8238:      	uxtb	w16, w6
    823c:      	cmp	w16, wzr
    8240:      	b.eq	0x82a0 <_stogir.floating.validate+0x4e8>
    8244:      	mov	x4, #0x1                ; =1
    8248:      	b	0x82a4 <_stogir.floating.validate+0x4ec>
    824c:      	movz	x9, #0x0, lsl #48
    8250:      	b	0x8184 <_stogir.floating.validate+0x3cc>
    8254:      	movz	x9, #0x0, lsl #48
    8258:      	b	0x817c <_stogir.floating.validate+0x3c4>
    825c:      	movz	x1, #0x0, lsl #48
    8260:      	lsr	w3, w3, #0
    8264:      	lsr	w4, w4, #0
    8268:      	lsr	w5, w5, #0
    826c:      	lsr	w7, w7, #0
    8270:      	lsr	w1, w1, #0
    8274:      	mov	w2, w7
    8278:      	mov	x20, x8
    827c:      	mov	x8, x19
    8280:      	fmov	s31, w1
    8284:      	mov	w1, w5
    8288:      	fmov	w5, s31
    828c:      	bl	0x828c <_stogir.floating.validate+0x4d4>
		000000000000828c:  ARM64_RELOC_BRANCH26	_stogir.floating.operands
    8290:      	ldr	x0, [x19]
    8294:      	ldr	x1, [x19, #0x8]
    8298:      	ldr	x2, [x19, #0x10]
    829c:      	b	0x8128 <_stogir.floating.validate+0x370>
    82a0:      	orr	x4, x7, xzr
    82a4:      	lsr	w4, w4, #0
    82a8:      	ubfx	x3, x3, #8, #8
    82ac:      	sxtw	x4, w4
    82b0:      	cmp	x3, x4
    82b4:      	b.ne	0x82f8 <_stogir.floating.validate+0x540>
    82b8:      	ldr	w3, [x2, #0x4]
    82bc:      	ldr	w4, [x2, #0x8]
    82c0:      	uxtb	w16, w1
    82c4:      	cmp	w16, wzr
    82c8:      	b.eq	0x825c <_stogir.floating.validate+0x4a4>
    82cc:      	ldr	w1, [x2, #0xc]
    82d0:      	sxtw	x1, w1
    82d4:      	b	0x8260 <_stogir.floating.validate+0x4a8>
    82d8:      	movz	x9, #0x0, lsl #48
    82dc:      	b	0x8250 <_stogir.floating.validate+0x498>
    82e0:      	brk	#0
    82e4:      	b	0x82e0 <_stogir.floating.validate+0x528>
    82e8:      	brk	#0
    82ec:      	b	0x82e8 <_stogir.floating.validate+0x530>
    82f0:      	mov	x20, x8
    82f4:      	b	0x7fa0 <_stogir.floating.validate+0x1e8>
    82f8:      	mov	x20, x8
    82fc:      	b	0x8110 <_stogir.floating.validate+0x358>

0000000000008300 <_stogir.types.integer?>:
    8300:      	sxtw	x0, w0
    8304:      	cmp	x0, #0x1
    8308:      	b.lt	0x831c <_stogir.types.integer?+0x1c>
    830c:      	cmp	x0, #0xb
    8310:      	cset	w0, le
    8314:      	ubfx	x0, x0, #0, #8
    8318:      	b	0x8320 <_stogir.types.integer?+0x20>
    831c:      	movz	x0, #0x0, lsl #48
    8320:      	ret

0000000000008324 <_stogir.integer-unary.valid-type?>:
    8324:      	sxtw	x0, w0
    8328:      	cmp	x0, #0x2d
    832c:      	cset	w2, eq
    8330:      	cmp	x0, #0x1f
    8334:      	cset	w3, eq
    8338:      	cmp	x0, #0x20
    833c:      	cset	w4, eq
    8340:      	cmp	x0, #0x36
    8344:      	cset	w5, eq
    8348:      	uxtb	w16, w3
    834c:      	cmp	w16, wzr
    8350:      	b.ne	0x8398 <_stogir.integer-unary.valid-type?+0x74>
    8354:      	uxtb	w16, w4
    8358:      	cmp	w16, wzr
    835c:      	b.ne	0x8398 <_stogir.integer-unary.valid-type?+0x74>
    8360:      	uxtb	w16, w2
    8364:      	cmp	w16, wzr
    8368:      	b.ne	0x8398 <_stogir.integer-unary.valid-type?+0x74>
    836c:      	uxtb	w16, w5
    8370:      	cmp	w16, wzr
    8374:      	b.ne	0x8398 <_stogir.integer-unary.valid-type?+0x74>
    8378:      	cmp	x0, #0x37
    837c:      	b.eq	0x8398 <_stogir.integer-unary.valid-type?+0x74>
    8380:      	cmp	x0, #0x38
    8384:      	b.eq	0x8398 <_stogir.integer-unary.valid-type?+0x74>
    8388:      	cmp	x0, #0x39
    838c:      	b.eq	0x8398 <_stogir.integer-unary.valid-type?+0x74>
    8390:      	movz	x0, #0x0, lsl #48
    8394:      	b	0x83d0 <_stogir.integer-unary.valid-type?+0xac>
    8398:      	sxtw	x1, w1
    839c:      	cmp	x1, #0x1
    83a0:      	b.lt	0x83cc <_stogir.integer-unary.valid-type?+0xa8>
    83a4:      	cmp	x1, #0xb
    83a8:      	cset	w0, le
    83ac:      	uxtb	w16, w0
    83b0:      	cmp	w16, wzr
    83b4:      	b.eq	0x83cc <_stogir.integer-unary.valid-type?+0xa8>
    83b8:      	uxtb	w16, w2
    83bc:      	cmp	w16, wzr
    83c0:      	b.eq	0x83dc <_stogir.integer-unary.valid-type?+0xb8>
    83c4:      	mov	x0, #0x1                ; =1
    83c8:      	b	0x83d8 <_stogir.integer-unary.valid-type?+0xb4>
    83cc:      	movz	x0, #0x0, lsl #48
    83d0:      	ret
    83d4:      	mov	x0, #0x1                ; =1
    83d8:      	b	0x83d0 <_stogir.integer-unary.valid-type?+0xac>
    83dc:      	cmp	x1, #0x1
    83e0:      	b.ne	0x83ec <_stogir.integer-unary.valid-type?+0xc8>
    83e4:      	movz	x0, #0x0, lsl #48
    83e8:      	b	0x83d8 <_stogir.integer-unary.valid-type?+0xb4>
    83ec:      	cmp	x1, #0x6
    83f0:      	cset	w2, eq
    83f4:      	uxtb	w16, w3
    83f8:      	cmp	w16, wzr
    83fc:      	b.eq	0x8410 <_stogir.integer-unary.valid-type?+0xec>
    8400:      	uxtb	w16, w2
    8404:      	cmp	w16, wzr
    8408:      	cset	x0, eq
    840c:      	b	0x83d8 <_stogir.integer-unary.valid-type?+0xb4>
    8410:      	uxtb	w16, w4
    8414:      	cmp	w16, wzr
    8418:      	b.eq	0x8434 <_stogir.integer-unary.valid-type?+0x110>
    841c:      	cmp	x1, #0x7
    8420:      	b.lt	0x842c <_stogir.integer-unary.valid-type?+0x108>
    8424:      	ubfx	x0, x0, #0, #8
    8428:      	b	0x8430 <_stogir.integer-unary.valid-type?+0x10c>
    842c:      	movz	x0, #0x0, lsl #48
    8430:      	b	0x83d8 <_stogir.integer-unary.valid-type?+0xb4>
    8434:      	uxtb	w16, w5
    8438:      	cmp	w16, wzr
    843c:      	b.eq	0x83d4 <_stogir.integer-unary.valid-type?+0xb0>
    8440:      	cmp	x1, #0x3
    8444:      	b.ne	0x8460 <_stogir.integer-unary.valid-type?+0x13c>
    8448:      	mov	x0, #0x1                ; =1
    844c:      	b	0x845c <_stogir.integer-unary.valid-type?+0x138>
    8450:      	cmp	x1, #0xb
    8454:      	cset	w0, eq
    8458:      	ubfx	x0, x0, #0, #8
    845c:      	b	0x83d8 <_stogir.integer-unary.valid-type?+0xb4>
    8460:      	cmp	x1, #0x4
    8464:      	b.ne	0x8470 <_stogir.integer-unary.valid-type?+0x14c>
    8468:      	mov	x0, #0x1                ; =1
    846c:      	b	0x845c <_stogir.integer-unary.valid-type?+0x138>
    8470:      	cmp	x1, #0x5
    8474:      	b.ne	0x8480 <_stogir.integer-unary.valid-type?+0x15c>
    8478:      	mov	x0, #0x1                ; =1
    847c:      	b	0x845c <_stogir.integer-unary.valid-type?+0x138>
    8480:      	uxtb	w16, w2
    8484:      	cmp	w16, wzr
    8488:      	b.eq	0x8494 <_stogir.integer-unary.valid-type?+0x170>
    848c:      	mov	x0, #0x1                ; =1
    8490:      	b	0x845c <_stogir.integer-unary.valid-type?+0x138>
    8494:      	cmp	x1, #0x9
    8498:      	b.ne	0x84a4 <_stogir.integer-unary.valid-type?+0x180>
    849c:      	mov	x0, #0x1                ; =1
    84a0:      	b	0x845c <_stogir.integer-unary.valid-type?+0x138>
    84a4:      	cmp	x1, #0xa
    84a8:      	b.ne	0x8450 <_stogir.integer-unary.valid-type?+0x12c>
    84ac:      	mov	x0, #0x1                ; =1
    84b0:      	b	0x845c <_stogir.integer-unary.valid-type?+0x138>

00000000000084b4 <_stogir.integer-binary.valid-type?>:
    84b4:      	sxtw	x0, w0
    84b8:      	cmp	x0, #0x3a
    84bc:      	cset	w2, eq
    84c0:      	cmp	x0, #0x3b
    84c4:      	cset	w3, eq
    84c8:      	cmp	x0, #0x1a
    84cc:      	b.lt	0x8520 <_stogir.integer-binary.valid-type?+0x6c>
    84d0:      	cmp	x0, #0x1e
    84d4:      	b.gt	0x8520 <_stogir.integer-binary.valid-type?+0x6c>
    84d8:      	sxtw	x1, w1
    84dc:      	cmp	x1, #0x1
    84e0:      	b.lt	0x8550 <_stogir.integer-binary.valid-type?+0x9c>
    84e4:      	cmp	x1, #0xb
    84e8:      	b.gt	0x8550 <_stogir.integer-binary.valid-type?+0x9c>
    84ec:      	cmp	x1, #0x1
    84f0:      	b.ne	0x8558 <_stogir.integer-binary.valid-type?+0xa4>
    84f4:      	cmp	x0, #0x2e
    84f8:      	b.eq	0x8560 <_stogir.integer-binary.valid-type?+0xac>
    84fc:      	cmp	x0, #0x2f
    8500:      	b.eq	0x8560 <_stogir.integer-binary.valid-type?+0xac>
    8504:      	cmp	x0, #0x30
    8508:      	b.eq	0x8560 <_stogir.integer-binary.valid-type?+0xac>
    850c:      	uxtb	w16, w2
    8510:      	cmp	w16, wzr
    8514:      	b.eq	0x8568 <_stogir.integer-binary.valid-type?+0xb4>
    8518:      	mov	x0, #0x1                ; =1
    851c:      	b	0x8570 <_stogir.integer-binary.valid-type?+0xbc>
    8520:      	cmp	x0, #0x2e
    8524:      	b.lt	0x8530 <_stogir.integer-binary.valid-type?+0x7c>
    8528:      	cmp	x0, #0x35
    852c:      	b.le	0x84d8 <_stogir.integer-binary.valid-type?+0x24>
    8530:      	uxtb	w16, w2
    8534:      	cmp	w16, wzr
    8538:      	b.ne	0x84d8 <_stogir.integer-binary.valid-type?+0x24>
    853c:      	uxtb	w16, w3
    8540:      	cmp	w16, wzr
    8544:      	b.ne	0x84d8 <_stogir.integer-binary.valid-type?+0x24>
    8548:      	movz	x0, #0x0, lsl #48
    854c:      	b	0x8554 <_stogir.integer-binary.valid-type?+0xa0>
    8550:      	movz	x0, #0x0, lsl #48
    8554:      	ret
    8558:      	mov	x0, #0x1                ; =1
    855c:      	b	0x8554 <_stogir.integer-binary.valid-type?+0xa0>
    8560:      	mov	x0, #0x1                ; =1
    8564:      	b	0x855c <_stogir.integer-binary.valid-type?+0xa8>
    8568:      	ubfx	x3, x3, #0, #8
    856c:      	mov	x0, x3
    8570:      	b	0x8564 <_stogir.integer-binary.valid-type?+0xb0>

0000000000008574 <_coil.core.Len$slice$len__u8>:
    8574:      	mov	x0, x1
    8578:      	ret

000000000000857c <_inherent$slice$data__u8>:
    857c:      	ret

0000000000008580 <_coil.mem.eql__u8>:
    8580:      	sub	sp, sp, #0x10
    8584:      	str	x29, [sp]
    8588:      	str	x30, [sp, #0x8]
    858c:      	mov	x29, sp
    8590:      	cmp	x2, #0x0
    8594:      	b.ne	0x85a0 <_coil.mem.eql__u8+0x20>
    8598:      	mov	x0, #0x1                ; =1
    859c:      	b	0x85bc <_coil.mem.eql__u8+0x3c>
    85a0:      	lsr	x2, x2, #0
    85a4:      	bl	0x85a4 <_coil.mem.eql__u8+0x24>
		00000000000085a4:  ARM64_RELOC_BRANCH26	_memcmp
    85a8:      	lsr	w0, w0, #0
    85ac:      	sxtw	x0, w0
    85b0:      	cmp	x0, #0x0
    85b4:      	cset	w0, eq
    85b8:      	ubfx	x0, x0, #0, #8
    85bc:      	ldr	x29, [sp]
    85c0:      	ldr	x30, [sp, #0x8]
    85c4:      	add	sp, sp, #0x10
    85c8:      	ret

00000000000085cc <_stogir.opcode.count>:
    85cc:      	mov	x0, #0x83               ; =131
    85d0:      	ret

00000000000085d4 <_stogir.types.valid-scalar?>:
    85d4:      	sxtw	x0, w0
    85d8:      	cmp	x0, #0x0
    85dc:      	b.lt	0x85f0 <_stogir.types.valid-scalar?+0x1c>
    85e0:      	cmp	x0, #0xd
    85e4:      	cset	w0, le
    85e8:      	ubfx	x0, x0, #0, #8
    85ec:      	b	0x85f4 <_stogir.types.valid-scalar?+0x20>
    85f0:      	movz	x0, #0x0, lsl #48
    85f4:      	ret

00000000000085f8 <_stogir.types.vector?>:
    85f8:      	sxtw	x0, w0
    85fc:      	cmp	x0, #0xf
    8600:      	b.le	0x863c <_stogir.types.vector?+0x44>
    8604:      	cmp	x0, #0x80
    8608:      	b.ge	0x864c <_stogir.types.vector?+0x54>
    860c:      	and	x1, x0, #0xf
    8610:      	lsr	w1, w1, #0
    8614:      	sxtw	x1, w1
    8618:      	cmp	x1, #0x1
    861c:      	b.lt	0x8644 <_stogir.types.vector?+0x4c>
    8620:      	and	x0, x0, #0xf
    8624:      	lsr	w0, w0, #0
    8628:      	sxtw	x0, w0
    862c:      	cmp	x0, #0xd
    8630:      	cset	w0, le
    8634:      	ubfx	x0, x0, #0, #8
    8638:      	b	0x8648 <_stogir.types.vector?+0x50>
    863c:      	movz	x0, #0x0, lsl #48
    8640:      	b	0x8648 <_stogir.types.vector?+0x50>
    8644:      	movz	x0, #0x0, lsl #48
    8648:      	ret
    864c:      	movz	x0, #0x0, lsl #48
    8650:      	b	0x8648 <_stogir.types.vector?+0x50>

0000000000008654 <_coil.core.Get$slice$get__i8>:
    8654:      	lsr	x1, x2, #0
    8658:      	add	x0, x1, x0
    865c:      	ldrsb	w0, [x0]
    8660:      	sxtb	x0, w0
    8664:      	ret

0000000000008668 <_stogir.opcode.metadata>:
    8668:      	sub	sp, sp, #0x10
    866c:      	mov	x0, sp
    8670:      	adrp	x16, 0x8000 <_stogir.floating.validate+0x248>
		0000000000008670:  ARM64_RELOC_PAGE21	l_stogir.404
    8674:      	ldr	x16, [x16]
		0000000000008674:  ARM64_RELOC_PAGEOFF12	l_stogir.404
    8678:      	orr	x1, x16, xzr
    867c:      	str	x1, [x0]
    8680:      	mov	x17, #0x83              ; =131
    8684:      	str	x17, [x0, #0x8]
    8688:      	ldr	x0, [sp]
    868c:      	ldr	x1, [sp, #0x8]
    8690:      	add	sp, sp, #0x10
    8694:      	ret

0000000000008698 <_coil.core.Get$slice$get__u32>:
    8698:      	lsl	x1, x2, #2
    869c:      	add	x0, x1, x0
    86a0:      	ldr	w0, [x0]
    86a4:      	ret

00000000000086a8 <_inherent$coil.arraylist.ArrayList$at__stogir.node.Node>:
    86a8:      	lsl	x1, x1, #4
    86ac:      	ldr	x0, [x0]
    86b0:      	add	x0, x1, x0
    86b4:      	ret

00000000000086b8 <_coil.core.Len$coil.arraylist.ArrayList$len__stogir.strings.Entry>:
    86b8:      	ldr	x0, [x0, #0x8]
    86bc:      	ret

00000000000086c0 <_coil.core.Len$coil.arraylist.ArrayList$len__u8>:
    86c0:      	ldr	x0, [x0, #0x8]
    86c4:      	ret

00000000000086c8 <_inherent$coil.arraylist.ArrayList$slice__u8>:
    86c8:      	sub	sp, sp, #0x10
    86cc:      	mov	x1, sp
    86d0:      	ldr	x2, [x0]
    86d4:      	ldr	x0, [x0, #0x8]
    86d8:      	str	x2, [x1]
    86dc:      	str	x0, [x1, #0x8]
    86e0:      	ldr	x0, [sp]
    86e4:      	ldr	x1, [sp, #0x8]
    86e8:      	add	sp, sp, #0x10
    86ec:      	ret

00000000000086f0 <_coil.slice.subslice__u8>:
    86f0:      	sub	sp, sp, #0x10
    86f4:      	mov	x1, sp
    86f8:      	lsr	x4, x2, #0
    86fc:      	sub	x2, x3, x2
    8700:      	add	x0, x4, x0
    8704:      	str	x0, [x1]
    8708:      	str	x2, [x1, #0x8]
    870c:      	ldr	x0, [sp]
    8710:      	ldr	x1, [sp, #0x8]
    8714:      	add	sp, sp, #0x10
    8718:      	ret

000000000000871c <_stogir.floating.operation?>:
    871c:      	sxtw	x0, w0
    8720:      	cmp	x0, #0xe
    8724:      	b.lt	0x8738 <_stogir.floating.operation?+0x1c>
    8728:      	cmp	x0, #0x19
    872c:      	b.gt	0x8738 <_stogir.floating.operation?+0x1c>
    8730:      	mov	x0, #0x1                ; =1
    8734:      	b	0x8764 <_stogir.floating.operation?+0x48>
    8738:      	cmp	x0, #0x1f
    873c:      	b.eq	0x8760 <_stogir.floating.operation?+0x44>
    8740:      	cmp	x0, #0x20
    8744:      	b.eq	0x8760 <_stogir.floating.operation?+0x44>
    8748:      	cmp	x0, #0x1a
    874c:      	b.lt	0x8778 <_stogir.floating.operation?+0x5c>
    8750:      	cmp	x0, #0x1d
    8754:      	b.gt	0x8778 <_stogir.floating.operation?+0x5c>
    8758:      	mov	x0, #0x1                ; =1
    875c:      	b	0x8774 <_stogir.floating.operation?+0x58>
    8760:      	mov	x0, #0x1                ; =1
    8764:      	ret
    8768:      	cmp	x0, #0x3b
    876c:      	cset	w0, eq
    8770:      	ubfx	x0, x0, #0, #8
    8774:      	b	0x8764 <_stogir.floating.operation?+0x48>
    8778:      	cmp	x0, #0x3a
    877c:      	b.ne	0x8768 <_stogir.floating.operation?+0x4c>
    8780:      	mov	x0, #0x1                ; =1
    8784:      	b	0x8774 <_stogir.floating.operation?+0x58>

0000000000008788 <_stogir.types.floating?>:
    8788:      	sxtw	x0, w0
    878c:      	cmp	x0, #0xc
    8790:      	b.ne	0x879c <_stogir.types.floating?+0x14>
    8794:      	mov	x0, #0x1                ; =1
    8798:      	b	0x87a8 <_stogir.types.floating?+0x20>
    879c:      	cmp	x0, #0xd
    87a0:      	cset	w0, eq
    87a4:      	ubfx	x0, x0, #0, #8
    87a8:      	ret

00000000000087ac <_stogir.vector-lanes.validate>:
    87ac:      	sub	sp, sp, #0x20
    87b0:      	str	x29, [sp]
    87b4:      	str	x30, [sp, #0x8]
    87b8:      	mov	x29, sp
    87bc:      	str	x19, [sp, #0x10]
    87c0:      	str	x20, [sp, #0x18]
    87c4:      	sub	sp, sp, #0x10
    87c8:      	mov	x3, sp
    87cc:      	sxtw	x1, w1
    87d0:      	sub	sp, sp, #0x20
    87d4:      	mov	x19, sp
    87d8:      	lsl	x4, x1, #2
    87dc:      	cmp	x1, #0x0
    87e0:      	cset	w5, gt
    87e4:      	movz	x16, #0x0, lsl #48
    87e8:      	sub	x6, x16, x1
    87ec:      	sub	x7, x6, #0x1
    87f0:      	uxtb	w16, w5
    87f4:      	cmp	w16, wzr
    87f8:      	b.eq	0x8838 <_stogir.vector-lanes.validate+0x8c>
    87fc:      	ldr	x6, [x0, #0x8]
    8800:      	cmp	x1, x6
    8804:      	b.ge	0x888c <_stogir.vector-lanes.validate+0xe0>
    8808:      	add	x6, x0, #0x78
    880c:      	ldr	x6, [x6, #0x8]
    8810:      	cmp	x1, x6
    8814:      	b.ge	0x89b0 <_stogir.vector-lanes.validate+0x204>
    8818:      	ldr	x6, [x0, #0x78]
    881c:      	add	x6, x4, x6
    8820:      	ldr	w6, [x6]
    8824:      	sxtw	x6, w6
    8828:      	cmp	x6, #0x0
    882c:      	cset	w6, ge
    8830:      	ubfx	x6, x6, #0, #8
    8834:      	b	0x89b4 <_stogir.vector-lanes.validate+0x208>
    8838:      	cmp	x1, #0x0
    883c:      	b.ge	0x8894 <_stogir.vector-lanes.validate+0xe8>
    8840:      	add	x9, x0, #0x28
    8844:      	add	x10, x0, #0x50
    8848:      	ldr	x9, [x9, #0x8]
    884c:      	ldr	x10, [x10, #0x8]
    8850:      	cmp	x9, x10
    8854:      	b.ne	0x8884 <_stogir.vector-lanes.validate+0xd8>
    8858:      	cmp	x6, x9
    885c:      	b.gt	0x89f4 <_stogir.vector-lanes.validate+0x248>
    8860:      	lsl	x6, x7, #2
    8864:      	ldr	x9, [x0, #0x50]
    8868:      	add	x6, x6, x9
    886c:      	ldr	w6, [x6]
    8870:      	sxtw	x6, w6
    8874:      	cmp	x6, #0x0
    8878:      	cset	w6, gt
    887c:      	ubfx	x6, x6, #0, #8
    8880:      	b	0x89f8 <_stogir.vector-lanes.validate+0x24c>
    8884:      	movz	x6, #0x0, lsl #48
    8888:      	b	0x8898 <_stogir.vector-lanes.validate+0xec>
    888c:      	movz	x6, #0x0, lsl #48
    8890:      	b	0x8898 <_stogir.vector-lanes.validate+0xec>
    8894:      	movz	x6, #0x0, lsl #48
    8898:      	cmp	x6, #0x0
    889c:      	b.eq	0x8900 <_stogir.vector-lanes.validate+0x154>
    88a0:      	uxtb	w16, w5
    88a4:      	cmp	w16, wzr
    88a8:      	b.eq	0x88d0 <_stogir.vector-lanes.validate+0x124>
    88ac:      	lsl	x5, x1, #4
    88b0:      	ldr	x6, [x0]
    88b4:      	add	x5, x5, x6
    88b8:      	ldr	x6, [x5]
    88bc:      	ldr	x5, [x5, #0x8]
    88c0:      	fmov	d31, x5
    88c4:      	mov	x5, x6
    88c8:      	fmov	x6, d31
    88cc:      	b	0x88f0 <_stogir.vector-lanes.validate+0x144>
    88d0:      	lsl	x5, x7, #4
    88d4:      	ldr	x6, [x0, #0x28]
    88d8:      	add	x5, x5, x6
    88dc:      	ldr	x6, [x5]
    88e0:      	ldr	x5, [x5, #0x8]
    88e4:      	fmov	d31, x5
    88e8:      	mov	x5, x6
    88ec:      	fmov	x6, d31
    88f0:      	mov	x7, x6
    88f4:      	mov	x6, x5
    88f8:      	mov	x5, #0x1                ; =1
    88fc:      	b	0x890c <_stogir.vector-lanes.validate+0x160>
    8900:      	movz	x5, #0x0, lsl #48
    8904:      	movz	x6, #0x0, lsl #48
    8908:      	movz	x7, #0x0, lsl #48
    890c:      	lsr	w5, w5, #0
    8910:      	lsr	x16, x5, #0
    8914:      	cmp	x16, #0x1
    8918:      	b.eq	0x8934 <_stogir.vector-lanes.validate+0x188>
    891c:      	b.lo	0x8924 <_stogir.vector-lanes.validate+0x178>
    8920:      	b	0x8938 <_stogir.vector-lanes.validate+0x18c>
    8924:      	cmp	x16, #0x0
    8928:      	b.eq	0x8930 <_stogir.vector-lanes.validate+0x184>
    892c:      	b	0x8938 <_stogir.vector-lanes.validate+0x18c>
    8930:      	b	0x893c <_stogir.vector-lanes.validate+0x190>
    8934:      	b	0x895c <_stogir.vector-lanes.validate+0x1b0>
    8938:      	b	0x8ab0 <_stogir.vector-lanes.validate+0x304>
    893c:      	adrp	x16, 0x8000 <_stogir.floating.validate+0x248>
		000000000000893c:  ARM64_RELOC_PAGE21	l_stogir.405
    8940:      	ldr	x16, [x16]
		0000000000008940:  ARM64_RELOC_PAGEOFF12	l_stogir.405
    8944:      	orr	x0, x16, xzr
    8948:      	mov	x20, x8
    894c:      	mov	x1, x0
    8950:      	mov	x0, #0x1                ; =1
    8954:      	mov	x2, #0x1f               ; =31
    8958:      	b	0x8988 <_stogir.vector-lanes.validate+0x1dc>
    895c:      	str	x6, [x3]
    8960:      	str	x7, [x3, #0x8]
    8964:      	cmp	x1, #0x0
    8968:      	b.gt	0x89b8 <_stogir.vector-lanes.validate+0x20c>
    896c:      	mov	x20, x8
    8970:      	adrp	x16, 0x8000 <_stogir.floating.validate+0x248>
		0000000000008970:  ARM64_RELOC_PAGE21	l_stogir.406
    8974:      	ldr	x16, [x16]
		0000000000008974:  ARM64_RELOC_PAGEOFF12	l_stogir.406
    8978:      	orr	x0, x16, xzr
    897c:      	mov	x1, x0
    8980:      	mov	x0, #0x1                ; =1
    8984:      	mov	x2, #0x25               ; =37
    8988:      	str	x0, [x20]
    898c:      	str	x1, [x20, #0x8]
    8990:      	str	x2, [x20, #0x10]
    8994:      	sub	sp, x29, #0x0
    8998:      	ldr	x19, [sp, #0x10]
    899c:      	ldr	x20, [sp, #0x18]
    89a0:      	ldr	x29, [sp]
    89a4:      	ldr	x30, [sp, #0x8]
    89a8:      	add	sp, sp, #0x20
    89ac:      	ret
    89b0:      	movz	x6, #0x0, lsl #48
    89b4:      	b	0x8890 <_stogir.vector-lanes.validate+0xe4>
    89b8:      	uxtb	w6, w6
    89bc:      	orr	x1, x6, xzr
    89c0:      	cmp	x1, #0x3d
    89c4:      	b.lt	0x8ab8 <_stogir.vector-lanes.validate+0x30c>
    89c8:      	cmp	x1, #0x3f
    89cc:      	b.gt	0x8ac0 <_stogir.vector-lanes.validate+0x314>
    89d0:      	cmp	x1, #0x3e
    89d4:      	cset	w5, eq
    89d8:      	ldr	x7, [x0, #0x78]
    89dc:      	add	x4, x4, x7
    89e0:      	ldr	w4, [x4]
    89e4:      	cmp	x1, #0x3d
    89e8:      	b.ne	0x8a50 <_stogir.vector-lanes.validate+0x2a4>
    89ec:      	mov	x7, #0x2                ; =2
    89f0:      	b	0x8a64 <_stogir.vector-lanes.validate+0x2b8>
    89f4:      	movz	x6, #0x0, lsl #48
    89f8:      	b	0x8888 <_stogir.vector-lanes.validate+0xdc>
    89fc:      	movz	x3, #0x0, lsl #48
    8a00:      	lsr	w2, w2, #0
    8a04:      	lsr	w7, w7, #0
    8a08:      	lsr	w1, w1, #0
    8a0c:      	lsr	w6, w6, #0
    8a10:      	lsr	w3, w3, #0
    8a14:      	ubfx	x4, x4, #8, #8
    8a18:      	lsr	w4, w4, #0
    8a1c:      	mov	w5, w1
    8a20:      	mov	w1, w6
    8a24:      	mov	w6, w3
    8a28:      	mov	w3, w2
    8a2c:      	mov	w2, w4
    8a30:      	mov	w4, w7
    8a34:      	mov	x20, x8
    8a38:      	mov	x8, x19
    8a3c:      	bl	0x8a3c <_stogir.vector-lanes.validate+0x290>
		0000000000008a3c:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.operands
    8a40:      	ldr	x0, [x19]
    8a44:      	ldr	x1, [x19, #0x8]
    8a48:      	ldr	x2, [x19, #0x10]
    8a4c:      	b	0x8988 <_stogir.vector-lanes.validate+0x1dc>
    8a50:      	uxtb	w16, w5
    8a54:      	cmp	w16, wzr
    8a58:      	mov	x16, #0x3               ; =3
    8a5c:      	mov	x17, #0x1               ; =1
    8a60:      	csel	x7, x16, x17, ne
    8a64:      	sxtw	x4, w4
    8a68:      	lsr	w7, w7, #0
    8a6c:      	sxtw	x7, w7
    8a70:      	cmp	x4, x7
    8a74:      	b.ne	0x8ac8 <_stogir.vector-lanes.validate+0x31c>
    8a78:      	ldr	w4, [x3]
    8a7c:      	ldr	w7, [x3, #0x4]
    8a80:      	cmp	x1, #0x3f
    8a84:      	b.ne	0x8a90 <_stogir.vector-lanes.validate+0x2e4>
    8a88:      	movz	x1, #0x0, lsl #48
    8a8c:      	b	0x8a98 <_stogir.vector-lanes.validate+0x2ec>
    8a90:      	ldr	w1, [x3, #0x8]
    8a94:      	sxtw	x1, w1
    8a98:      	uxtb	w16, w5
    8a9c:      	cmp	w16, wzr
    8aa0:      	b.eq	0x89fc <_stogir.vector-lanes.validate+0x250>
    8aa4:      	ldr	w3, [x3, #0xc]
    8aa8:      	sxtw	x3, w3
    8aac:      	b	0x8a00 <_stogir.vector-lanes.validate+0x254>
    8ab0:      	brk	#0
    8ab4:      	b	0x8ab0 <_stogir.vector-lanes.validate+0x304>
    8ab8:      	mov	x20, x8
    8abc:      	b	0x8970 <_stogir.vector-lanes.validate+0x1c4>
    8ac0:      	mov	x20, x8
    8ac4:      	b	0x8970 <_stogir.vector-lanes.validate+0x1c4>
    8ac8:      	mov	x20, x8
    8acc:      	b	0x8970 <_stogir.vector-lanes.validate+0x1c4>

0000000000008ad0 <_stogir.vector-comparison.node?>:
    8ad0:      	sxtw	x1, w1
    8ad4:      	cmp	x1, #0x0
    8ad8:      	cset	w2, gt
    8adc:      	movz	x16, #0x0, lsl #48
    8ae0:      	sub	x3, x16, x1
    8ae4:      	sub	x4, x3, #0x1
    8ae8:      	uxtb	w16, w2
    8aec:      	cmp	w16, wzr
    8af0:      	b.eq	0x8b34 <_stogir.vector-comparison.node?+0x64>
    8af4:      	ldr	x3, [x0, #0x8]
    8af8:      	cmp	x1, x3
    8afc:      	b.ge	0x8b88 <_stogir.vector-comparison.node?+0xb8>
    8b00:      	add	x3, x0, #0x78
    8b04:      	ldr	x3, [x3, #0x8]
    8b08:      	cmp	x1, x3
    8b0c:      	b.ge	0x8c70 <_stogir.vector-comparison.node?+0x1a0>
    8b10:      	lsl	x3, x1, #2
    8b14:      	ldr	x5, [x0, #0x78]
    8b18:      	add	x3, x3, x5
    8b1c:      	ldr	w3, [x3]
    8b20:      	sxtw	x3, w3
    8b24:      	cmp	x3, #0x0
    8b28:      	cset	w3, ge
    8b2c:      	ubfx	x3, x3, #0, #8
    8b30:      	b	0x8c74 <_stogir.vector-comparison.node?+0x1a4>
    8b34:      	cmp	x1, #0x0
    8b38:      	b.ge	0x8b90 <_stogir.vector-comparison.node?+0xc0>
    8b3c:      	add	x5, x0, #0x28
    8b40:      	add	x6, x0, #0x50
    8b44:      	ldr	x5, [x5, #0x8]
    8b48:      	ldr	x6, [x6, #0x8]
    8b4c:      	cmp	x5, x6
    8b50:      	b.ne	0x8b80 <_stogir.vector-comparison.node?+0xb0>
    8b54:      	cmp	x3, x5
    8b58:      	b.gt	0x8c78 <_stogir.vector-comparison.node?+0x1a8>
    8b5c:      	lsl	x3, x4, #2
    8b60:      	ldr	x5, [x0, #0x50]
    8b64:      	add	x3, x3, x5
    8b68:      	ldr	w3, [x3]
    8b6c:      	sxtw	x3, w3
    8b70:      	cmp	x3, #0x0
    8b74:      	cset	w3, gt
    8b78:      	ubfx	x3, x3, #0, #8
    8b7c:      	b	0x8c7c <_stogir.vector-comparison.node?+0x1ac>
    8b80:      	movz	x3, #0x0, lsl #48
    8b84:      	b	0x8b94 <_stogir.vector-comparison.node?+0xc4>
    8b88:      	movz	x3, #0x0, lsl #48
    8b8c:      	b	0x8b94 <_stogir.vector-comparison.node?+0xc4>
    8b90:      	movz	x3, #0x0, lsl #48
    8b94:      	cmp	x3, #0x0
    8b98:      	b.eq	0x8bd8 <_stogir.vector-comparison.node?+0x108>
    8b9c:      	uxtb	w16, w2
    8ba0:      	cmp	w16, wzr
    8ba4:      	b.eq	0x8bbc <_stogir.vector-comparison.node?+0xec>
    8ba8:      	lsl	x1, x1, #4
    8bac:      	ldr	x0, [x0]
    8bb0:      	add	x0, x1, x0
    8bb4:      	ldr	x0, [x0]
    8bb8:      	b	0x8bcc <_stogir.vector-comparison.node?+0xfc>
    8bbc:      	lsl	x1, x4, #4
    8bc0:      	ldr	x0, [x0, #0x28]
    8bc4:      	add	x0, x1, x0
    8bc8:      	ldr	x0, [x0]
    8bcc:      	mov	x1, x0
    8bd0:      	mov	x0, #0x1                ; =1
    8bd4:      	b	0x8be0 <_stogir.vector-comparison.node?+0x110>
    8bd8:      	movz	x0, #0x0, lsl #48
    8bdc:      	movz	x1, #0x0, lsl #48
    8be0:      	lsr	w0, w0, #0
    8be4:      	lsr	x16, x0, #0
    8be8:      	cmp	x16, #0x1
    8bec:      	b.eq	0x8c08 <_stogir.vector-comparison.node?+0x138>
    8bf0:      	b.lo	0x8bf8 <_stogir.vector-comparison.node?+0x128>
    8bf4:      	b	0x8c0c <_stogir.vector-comparison.node?+0x13c>
    8bf8:      	cmp	x16, #0x0
    8bfc:      	b.eq	0x8c04 <_stogir.vector-comparison.node?+0x134>
    8c00:      	b	0x8c0c <_stogir.vector-comparison.node?+0x13c>
    8c04:      	b	0x8c10 <_stogir.vector-comparison.node?+0x140>
    8c08:      	b	0x8c20 <_stogir.vector-comparison.node?+0x150>
    8c0c:      	b	0x8c98 <_stogir.vector-comparison.node?+0x1c8>
    8c10:      	movz	x0, #0x0, lsl #48
    8c14:      	b	0x8c1c <_stogir.vector-comparison.node?+0x14c>
    8c18:      	movz	x0, #0x0, lsl #48
    8c1c:      	ret
    8c20:      	uxtb	w0, w1
    8c24:      	cmp	x0, #0xe
    8c28:      	b.lt	0x8c18 <_stogir.vector-comparison.node?+0x148>
    8c2c:      	cmp	x0, #0x19
    8c30:      	b.gt	0x8c18 <_stogir.vector-comparison.node?+0x148>
    8c34:      	lsr	w1, w1, #0
    8c38:      	ubfx	x0, x1, #8, #8
    8c3c:      	cmp	x0, #0xf
    8c40:      	b.le	0x8c80 <_stogir.vector-comparison.node?+0x1b0>
    8c44:      	cmp	x0, #0x80
    8c48:      	b.ge	0x8c88 <_stogir.vector-comparison.node?+0x1b8>
    8c4c:      	and	x0, x0, #0xf
    8c50:      	lsr	w0, w0, #0
    8c54:      	sxtw	x0, w0
    8c58:      	cmp	x0, #0x1
    8c5c:      	b.lt	0x8c90 <_stogir.vector-comparison.node?+0x1c0>
    8c60:      	cmp	x0, #0xd
    8c64:      	cset	w0, le
    8c68:      	ubfx	x0, x0, #0, #8
    8c6c:      	b	0x8c94 <_stogir.vector-comparison.node?+0x1c4>
    8c70:      	movz	x3, #0x0, lsl #48
    8c74:      	b	0x8b8c <_stogir.vector-comparison.node?+0xbc>
    8c78:      	movz	x3, #0x0, lsl #48
    8c7c:      	b	0x8b84 <_stogir.vector-comparison.node?+0xb4>
    8c80:      	movz	x0, #0x0, lsl #48
    8c84:      	b	0x8c1c <_stogir.vector-comparison.node?+0x14c>
    8c88:      	movz	x0, #0x0, lsl #48
    8c8c:      	b	0x8c84 <_stogir.vector-comparison.node?+0x1b4>
    8c90:      	movz	x0, #0x0, lsl #48
    8c94:      	b	0x8c8c <_stogir.vector-comparison.node?+0x1bc>
    8c98:      	brk	#0
    8c9c:      	b	0x8c98 <_stogir.vector-comparison.node?+0x1c8>

0000000000008ca0 <_stogir.vector-comparison.validate>:
    8ca0:      	sub	sp, sp, #0x20
    8ca4:      	str	x29, [sp]
    8ca8:      	str	x30, [sp, #0x8]
    8cac:      	mov	x29, sp
    8cb0:      	str	x19, [sp, #0x10]
    8cb4:      	str	x20, [sp, #0x18]
    8cb8:      	sub	sp, sp, #0x10
    8cbc:      	mov	x3, sp
    8cc0:      	sxtw	x1, w1
    8cc4:      	sub	sp, sp, #0x20
    8cc8:      	mov	x19, sp
    8ccc:      	lsl	x4, x1, #2
    8cd0:      	cmp	x1, #0x0
    8cd4:      	cset	w5, gt
    8cd8:      	movz	x16, #0x0, lsl #48
    8cdc:      	sub	x6, x16, x1
    8ce0:      	cmp	x1, #0x0
    8ce4:      	cset	w7, lt
    8ce8:      	sub	x9, x6, #0x1
    8cec:      	lsl	x10, x9, #2
    8cf0:      	uxtb	w16, w5
    8cf4:      	cmp	w16, wzr
    8cf8:      	b.eq	0x8d38 <_stogir.vector-comparison.validate+0x98>
    8cfc:      	ldr	x11, [x0, #0x8]
    8d00:      	cmp	x1, x11
    8d04:      	b.ge	0x8d8c <_stogir.vector-comparison.validate+0xec>
    8d08:      	add	x11, x0, #0x78
    8d0c:      	ldr	x11, [x11, #0x8]
    8d10:      	cmp	x1, x11
    8d14:      	b.ge	0x8eb0 <_stogir.vector-comparison.validate+0x210>
    8d18:      	ldr	x11, [x0, #0x78]
    8d1c:      	add	x11, x4, x11
    8d20:      	ldr	w11, [x11]
    8d24:      	sxtw	x11, w11
    8d28:      	cmp	x11, #0x0
    8d2c:      	cset	w11, ge
    8d30:      	ubfx	x11, x11, #0, #8
    8d34:      	b	0x8eb4 <_stogir.vector-comparison.validate+0x214>
    8d38:      	uxtb	w16, w7
    8d3c:      	cmp	w16, wzr
    8d40:      	b.eq	0x8d94 <_stogir.vector-comparison.validate+0xf4>
    8d44:      	add	x11, x0, #0x28
    8d48:      	add	x12, x0, #0x50
    8d4c:      	ldr	x11, [x11, #0x8]
    8d50:      	ldr	x12, [x12, #0x8]
    8d54:      	cmp	x11, x12
    8d58:      	b.ne	0x8d84 <_stogir.vector-comparison.validate+0xe4>
    8d5c:      	cmp	x6, x11
    8d60:      	b.gt	0x8f0c <_stogir.vector-comparison.validate+0x26c>
    8d64:      	ldr	x11, [x0, #0x50]
    8d68:      	add	x11, x10, x11
    8d6c:      	ldr	w11, [x11]
    8d70:      	sxtw	x11, w11
    8d74:      	cmp	x11, #0x0
    8d78:      	cset	w11, gt
    8d7c:      	ubfx	x11, x11, #0, #8
    8d80:      	b	0x8f10 <_stogir.vector-comparison.validate+0x270>
    8d84:      	movz	x11, #0x0, lsl #48
    8d88:      	b	0x8d98 <_stogir.vector-comparison.validate+0xf8>
    8d8c:      	movz	x11, #0x0, lsl #48
    8d90:      	b	0x8d98 <_stogir.vector-comparison.validate+0xf8>
    8d94:      	movz	x11, #0x0, lsl #48
    8d98:      	lsl	x12, x1, #4
    8d9c:      	lsl	x9, x9, #4
    8da0:      	cmp	x11, #0x0
    8da4:      	b.eq	0x8e00 <_stogir.vector-comparison.validate+0x160>
    8da8:      	uxtb	w16, w5
    8dac:      	cmp	w16, wzr
    8db0:      	b.eq	0x8dd4 <_stogir.vector-comparison.validate+0x134>
    8db4:      	ldr	x11, [x0]
    8db8:      	add	x11, x12, x11
    8dbc:      	ldr	x13, [x11]
    8dc0:      	ldr	x11, [x11, #0x8]
    8dc4:      	fmov	d31, x11
    8dc8:      	mov	x11, x13
    8dcc:      	fmov	x13, d31
    8dd0:      	b	0x8df0 <_stogir.vector-comparison.validate+0x150>
    8dd4:      	ldr	x11, [x0, #0x28]
    8dd8:      	add	x11, x9, x11
    8ddc:      	ldr	x13, [x11]
    8de0:      	ldr	x11, [x11, #0x8]
    8de4:      	fmov	d31, x11
    8de8:      	mov	x11, x13
    8dec:      	fmov	x13, d31
    8df0:      	mov	x14, x13
    8df4:      	mov	x13, x11
    8df8:      	mov	x11, #0x1               ; =1
    8dfc:      	b	0x8e0c <_stogir.vector-comparison.validate+0x16c>
    8e00:      	movz	x11, #0x0, lsl #48
    8e04:      	movz	x13, #0x0, lsl #48
    8e08:      	movz	x14, #0x0, lsl #48
    8e0c:      	lsr	w11, w11, #0
    8e10:      	lsr	x16, x11, #0
    8e14:      	cmp	x16, #0x1
    8e18:      	b.eq	0x8e34 <_stogir.vector-comparison.validate+0x194>
    8e1c:      	b.lo	0x8e24 <_stogir.vector-comparison.validate+0x184>
    8e20:      	b	0x8e38 <_stogir.vector-comparison.validate+0x198>
    8e24:      	cmp	x16, #0x0
    8e28:      	b.eq	0x8e30 <_stogir.vector-comparison.validate+0x190>
    8e2c:      	b	0x8e38 <_stogir.vector-comparison.validate+0x198>
    8e30:      	b	0x8e3c <_stogir.vector-comparison.validate+0x19c>
    8e34:      	b	0x8e80 <_stogir.vector-comparison.validate+0x1e0>
    8e38:      	b	0x910c <_stogir.vector-comparison.validate+0x46c>
    8e3c:      	adrp	x16, 0x8000 <_stogir.floating.validate+0x248>
		0000000000008e3c:  ARM64_RELOC_PAGE21	l_stogir.407
    8e40:      	ldr	x16, [x16]
		0000000000008e40:  ARM64_RELOC_PAGEOFF12	l_stogir.407
    8e44:      	orr	x0, x16, xzr
    8e48:      	mov	x20, x8
    8e4c:      	mov	x1, x0
    8e50:      	mov	x0, #0x1                ; =1
    8e54:      	mov	x2, #0x25               ; =37
    8e58:      	str	x0, [x20]
    8e5c:      	str	x1, [x20, #0x8]
    8e60:      	str	x2, [x20, #0x10]
    8e64:      	sub	sp, x29, #0x0
    8e68:      	ldr	x19, [sp, #0x10]
    8e6c:      	ldr	x20, [sp, #0x18]
    8e70:      	ldr	x29, [sp]
    8e74:      	ldr	x30, [sp, #0x8]
    8e78:      	add	sp, sp, #0x20
    8e7c:      	ret
    8e80:      	str	x13, [x3]
    8e84:      	str	x14, [x3, #0x8]
    8e88:      	cmp	x1, #0x0
    8e8c:      	b.gt	0x8eb8 <_stogir.vector-comparison.validate+0x218>
    8e90:      	mov	x20, x8
    8e94:      	adrp	x16, 0x8000 <_stogir.floating.validate+0x248>
		0000000000008e94:  ARM64_RELOC_PAGE21	l_stogir.408
    8e98:      	ldr	x16, [x16]
		0000000000008e98:  ARM64_RELOC_PAGEOFF12	l_stogir.408
    8e9c:      	orr	x0, x16, xzr
    8ea0:      	mov	x1, x0
    8ea4:      	mov	x0, #0x1                ; =1
    8ea8:      	mov	x2, #0x2b               ; =43
    8eac:      	b	0x8e58 <_stogir.vector-comparison.validate+0x1b8>
    8eb0:      	movz	x11, #0x0, lsl #48
    8eb4:      	b	0x8d90 <_stogir.vector-comparison.validate+0xf0>
    8eb8:      	mov	x11, sp
    8ebc:      	sub	sp, sp, #0x10
    8ec0:      	mov	x13, sp
    8ec4:      	uxtb	w16, w5
    8ec8:      	cmp	w16, wzr
    8ecc:      	b.eq	0x8f14 <_stogir.vector-comparison.validate+0x274>
    8ed0:      	ldr	x6, [x0, #0x8]
    8ed4:      	cmp	x1, x6
    8ed8:      	b.ge	0x8f68 <_stogir.vector-comparison.validate+0x2c8>
    8edc:      	add	x6, x0, #0x78
    8ee0:      	ldr	x6, [x6, #0x8]
    8ee4:      	cmp	x1, x6
    8ee8:      	b.ge	0x90f4 <_stogir.vector-comparison.validate+0x454>
    8eec:      	ldr	x1, [x0, #0x78]
    8ef0:      	add	x1, x4, x1
    8ef4:      	ldr	w1, [x1]
    8ef8:      	sxtw	x1, w1
    8efc:      	cmp	x1, #0x0
    8f00:      	cset	w1, ge
    8f04:      	ubfx	x1, x1, #0, #8
    8f08:      	b	0x90f8 <_stogir.vector-comparison.validate+0x458>
    8f0c:      	movz	x11, #0x0, lsl #48
    8f10:      	b	0x8d88 <_stogir.vector-comparison.validate+0xe8>
    8f14:      	uxtb	w16, w7
    8f18:      	cmp	w16, wzr
    8f1c:      	b.eq	0x8f70 <_stogir.vector-comparison.validate+0x2d0>
    8f20:      	add	x1, x0, #0x28
    8f24:      	add	x7, x0, #0x50
    8f28:      	ldr	x1, [x1, #0x8]
    8f2c:      	ldr	x7, [x7, #0x8]
    8f30:      	cmp	x1, x7
    8f34:      	b.ne	0x90ec <_stogir.vector-comparison.validate+0x44c>
    8f38:      	cmp	x6, x1
    8f3c:      	b.gt	0x90fc <_stogir.vector-comparison.validate+0x45c>
    8f40:      	ldr	x1, [x0, #0x50]
    8f44:      	add	x1, x10, x1
    8f48:      	ldr	w1, [x1]
    8f4c:      	sxtw	x1, w1
    8f50:      	cmp	x1, #0x0
    8f54:      	cset	w1, gt
    8f58:      	ubfx	x1, x1, #0, #8
    8f5c:      	b	0x9100 <_stogir.vector-comparison.validate+0x460>
    8f60:      	movz	x1, #0x0, lsl #48
    8f64:      	b	0x9014 <_stogir.vector-comparison.validate+0x374>
    8f68:      	movz	x1, #0x0, lsl #48
    8f6c:      	b	0x8f74 <_stogir.vector-comparison.validate+0x2d4>
    8f70:      	movz	x1, #0x0, lsl #48
    8f74:      	cmp	x1, #0x0
    8f78:      	b.eq	0x8fd4 <_stogir.vector-comparison.validate+0x334>
    8f7c:      	uxtb	w16, w5
    8f80:      	cmp	w16, wzr
    8f84:      	b.eq	0x8fa8 <_stogir.vector-comparison.validate+0x308>
    8f88:      	ldr	x1, [x0]
    8f8c:      	add	x1, x12, x1
    8f90:      	ldr	x5, [x1]
    8f94:      	ldr	x1, [x1, #0x8]
    8f98:      	fmov	d31, x1
    8f9c:      	mov	x1, x5
    8fa0:      	fmov	x5, d31
    8fa4:      	b	0x8fc4 <_stogir.vector-comparison.validate+0x324>
    8fa8:      	ldr	x1, [x0, #0x28]
    8fac:      	add	x1, x9, x1
    8fb0:      	ldr	x5, [x1]
    8fb4:      	ldr	x1, [x1, #0x8]
    8fb8:      	fmov	d31, x1
    8fbc:      	mov	x1, x5
    8fc0:      	fmov	x5, d31
    8fc4:      	mov	x6, x5
    8fc8:      	mov	x5, x1
    8fcc:      	mov	x1, #0x1                ; =1
    8fd0:      	b	0x8fe0 <_stogir.vector-comparison.validate+0x340>
    8fd4:      	movz	x1, #0x0, lsl #48
    8fd8:      	movz	x5, #0x0, lsl #48
    8fdc:      	movz	x6, #0x0, lsl #48
    8fe0:      	lsr	w1, w1, #0
    8fe4:      	lsr	x16, x1, #0
    8fe8:      	cmp	x16, #0x1
    8fec:      	b.eq	0x9008 <_stogir.vector-comparison.validate+0x368>
    8ff0:      	b.lo	0x8ff8 <_stogir.vector-comparison.validate+0x358>
    8ff4:      	b	0x900c <_stogir.vector-comparison.validate+0x36c>
    8ff8:      	cmp	x16, #0x0
    8ffc:      	b.eq	0x9004 <_stogir.vector-comparison.validate+0x364>
    9000:      	b	0x900c <_stogir.vector-comparison.validate+0x36c>
    9004:      	b	0x9010 <_stogir.vector-comparison.validate+0x370>
    9008:      	b	0x9094 <_stogir.vector-comparison.validate+0x3f4>
    900c:      	b	0x9124 <_stogir.vector-comparison.validate+0x484>
    9010:      	movz	x1, #0x0, lsl #48
    9014:      	mov	sp, x11
    9018:      	cmp	x1, #0x0
    901c:      	b.eq	0x912c <_stogir.vector-comparison.validate+0x48c>
    9020:      	ldr	x1, [x0, #0x78]
    9024:      	add	x1, x4, x1
    9028:      	ldr	w1, [x1]
    902c:      	sxtw	x1, w1
    9030:      	cmp	x1, #0x2
    9034:      	b.ne	0x9134 <_stogir.vector-comparison.validate+0x494>
    9038:      	lsr	w2, w2, #0
    903c:      	ldr	w1, [x3]
    9040:      	uxtb	w4, w1
    9044:      	ldr	w5, [x3, #0x4]
    9048:      	lsr	w4, w4, #0
    904c:      	ubfx	x1, x1, #8, #8
    9050:      	ldr	w3, [x3, #0x8]
    9054:      	lsr	w5, w5, #0
    9058:      	lsr	w3, w3, #0
    905c:      	lsr	w1, w1, #0
    9060:      	mov	x20, x8
    9064:      	mov	x8, x19
    9068:      	fmov	s31, w1
    906c:      	mov	w1, w4
    9070:      	mov	w4, w5
    9074:      	mov	w5, w3
    9078:      	mov	w3, w2
    907c:      	fmov	w2, s31
    9080:      	bl	0x9080 <_stogir.vector-comparison.validate+0x3e0>
		0000000000009080:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.operands
    9084:      	ldr	x0, [x19]
    9088:      	ldr	x1, [x19, #0x8]
    908c:      	ldr	x2, [x19, #0x10]
    9090:      	b	0x8eac <_stogir.vector-comparison.validate+0x20c>
    9094:      	uxtb	w1, w5
    9098:      	str	x5, [x13]
    909c:      	str	x6, [x13, #0x8]
    90a0:      	cmp	x1, #0xe
    90a4:      	b.lt	0x8f60 <_stogir.vector-comparison.validate+0x2c0>
    90a8:      	cmp	x1, #0x19
    90ac:      	b.gt	0x8f60 <_stogir.vector-comparison.validate+0x2c0>
    90b0:      	lsr	w5, w5, #0
    90b4:      	ubfx	x1, x5, #8, #8
    90b8:      	cmp	x1, #0xf
    90bc:      	b.le	0x9104 <_stogir.vector-comparison.validate+0x464>
    90c0:      	cmp	x1, #0x80
    90c4:      	b.ge	0x9114 <_stogir.vector-comparison.validate+0x474>
    90c8:      	and	x1, x1, #0xf
    90cc:      	lsr	w1, w1, #0
    90d0:      	sxtw	x1, w1
    90d4:      	cmp	x1, #0x1
    90d8:      	b.lt	0x911c <_stogir.vector-comparison.validate+0x47c>
    90dc:      	cmp	x1, #0xd
    90e0:      	cset	w1, le
    90e4:      	ubfx	x1, x1, #0, #8
    90e8:      	b	0x9120 <_stogir.vector-comparison.validate+0x480>
    90ec:      	movz	x1, #0x0, lsl #48
    90f0:      	b	0x8f74 <_stogir.vector-comparison.validate+0x2d4>
    90f4:      	movz	x1, #0x0, lsl #48
    90f8:      	b	0x8f6c <_stogir.vector-comparison.validate+0x2cc>
    90fc:      	movz	x1, #0x0, lsl #48
    9100:      	b	0x90f0 <_stogir.vector-comparison.validate+0x450>
    9104:      	movz	x1, #0x0, lsl #48
    9108:      	b	0x8f64 <_stogir.vector-comparison.validate+0x2c4>
    910c:      	brk	#0
    9110:      	b	0x910c <_stogir.vector-comparison.validate+0x46c>
    9114:      	movz	x1, #0x0, lsl #48
    9118:      	b	0x9108 <_stogir.vector-comparison.validate+0x468>
    911c:      	movz	x1, #0x0, lsl #48
    9120:      	b	0x9118 <_stogir.vector-comparison.validate+0x478>
    9124:      	brk	#0
    9128:      	b	0x9124 <_stogir.vector-comparison.validate+0x484>
    912c:      	mov	x20, x8
    9130:      	b	0x8e94 <_stogir.vector-comparison.validate+0x1f4>
    9134:      	mov	x20, x8
    9138:      	b	0x8e94 <_stogir.vector-comparison.validate+0x1f4>

000000000000913c <_stogir.vector-arithmetic.node?>:
    913c:      	sub	sp, sp, #0x10
    9140:      	str	x29, [sp]
    9144:      	str	x30, [sp, #0x8]
    9148:      	mov	x29, sp
    914c:      	sub	sp, sp, #0x10
    9150:      	mov	x2, sp
    9154:      	sxtw	x1, w1
    9158:      	cmp	x1, #0x0
    915c:      	cset	w3, gt
    9160:      	movz	x16, #0x0, lsl #48
    9164:      	sub	x4, x16, x1
    9168:      	sub	x5, x4, #0x1
    916c:      	uxtb	w16, w3
    9170:      	cmp	w16, wzr
    9174:      	b.eq	0x91b8 <_stogir.vector-arithmetic.node?+0x7c>
    9178:      	ldr	x4, [x0, #0x8]
    917c:      	cmp	x1, x4
    9180:      	b.ge	0x920c <_stogir.vector-arithmetic.node?+0xd0>
    9184:      	add	x4, x0, #0x78
    9188:      	ldr	x4, [x4, #0x8]
    918c:      	cmp	x1, x4
    9190:      	b.ge	0x937c <_stogir.vector-arithmetic.node?+0x240>
    9194:      	lsl	x4, x1, #2
    9198:      	ldr	x6, [x0, #0x78]
    919c:      	add	x4, x4, x6
    91a0:      	ldr	w4, [x4]
    91a4:      	sxtw	x4, w4
    91a8:      	cmp	x4, #0x0
    91ac:      	cset	w4, ge
    91b0:      	ubfx	x4, x4, #0, #8
    91b4:      	b	0x9380 <_stogir.vector-arithmetic.node?+0x244>
    91b8:      	cmp	x1, #0x0
    91bc:      	b.ge	0x9214 <_stogir.vector-arithmetic.node?+0xd8>
    91c0:      	add	x6, x0, #0x28
    91c4:      	add	x7, x0, #0x50
    91c8:      	ldr	x6, [x6, #0x8]
    91cc:      	ldr	x7, [x7, #0x8]
    91d0:      	cmp	x6, x7
    91d4:      	b.ne	0x9204 <_stogir.vector-arithmetic.node?+0xc8>
    91d8:      	cmp	x4, x6
    91dc:      	b.gt	0x938c <_stogir.vector-arithmetic.node?+0x250>
    91e0:      	lsl	x4, x5, #2
    91e4:      	ldr	x6, [x0, #0x50]
    91e8:      	add	x4, x4, x6
    91ec:      	ldr	w4, [x4]
    91f0:      	sxtw	x4, w4
    91f4:      	cmp	x4, #0x0
    91f8:      	cset	w4, gt
    91fc:      	ubfx	x4, x4, #0, #8
    9200:      	b	0x9390 <_stogir.vector-arithmetic.node?+0x254>
    9204:      	movz	x4, #0x0, lsl #48
    9208:      	b	0x9218 <_stogir.vector-arithmetic.node?+0xdc>
    920c:      	movz	x4, #0x0, lsl #48
    9210:      	b	0x9218 <_stogir.vector-arithmetic.node?+0xdc>
    9214:      	movz	x4, #0x0, lsl #48
    9218:      	cmp	x4, #0x0
    921c:      	b.eq	0x9280 <_stogir.vector-arithmetic.node?+0x144>
    9220:      	uxtb	w16, w3
    9224:      	cmp	w16, wzr
    9228:      	b.eq	0x9250 <_stogir.vector-arithmetic.node?+0x114>
    922c:      	lsl	x1, x1, #4
    9230:      	ldr	x0, [x0]
    9234:      	add	x0, x1, x0
    9238:      	ldr	x1, [x0]
    923c:      	ldr	x0, [x0, #0x8]
    9240:      	fmov	d31, x0
    9244:      	mov	x0, x1
    9248:      	fmov	x1, d31
    924c:      	b	0x9270 <_stogir.vector-arithmetic.node?+0x134>
    9250:      	lsl	x1, x5, #4
    9254:      	ldr	x0, [x0, #0x28]
    9258:      	add	x0, x1, x0
    925c:      	ldr	x1, [x0]
    9260:      	ldr	x0, [x0, #0x8]
    9264:      	fmov	d31, x0
    9268:      	mov	x0, x1
    926c:      	fmov	x1, d31
    9270:      	mov	x3, x1
    9274:      	mov	x1, x0
    9278:      	mov	x0, #0x1                ; =1
    927c:      	b	0x928c <_stogir.vector-arithmetic.node?+0x150>
    9280:      	movz	x0, #0x0, lsl #48
    9284:      	movz	x1, #0x0, lsl #48
    9288:      	movz	x3, #0x0, lsl #48
    928c:      	lsr	w0, w0, #0
    9290:      	lsr	x16, x0, #0
    9294:      	cmp	x16, #0x1
    9298:      	b.eq	0x92b4 <_stogir.vector-arithmetic.node?+0x178>
    929c:      	b.lo	0x92a4 <_stogir.vector-arithmetic.node?+0x168>
    92a0:      	b	0x92b8 <_stogir.vector-arithmetic.node?+0x17c>
    92a4:      	cmp	x16, #0x0
    92a8:      	b.eq	0x92b0 <_stogir.vector-arithmetic.node?+0x174>
    92ac:      	b	0x92b8 <_stogir.vector-arithmetic.node?+0x17c>
    92b0:      	b	0x92bc <_stogir.vector-arithmetic.node?+0x180>
    92b4:      	b	0x92dc <_stogir.vector-arithmetic.node?+0x1a0>
    92b8:      	b	0x939c <_stogir.vector-arithmetic.node?+0x260>
    92bc:      	movz	x0, #0x0, lsl #48
    92c0:      	b	0x92c8 <_stogir.vector-arithmetic.node?+0x18c>
    92c4:      	movz	x0, #0x0, lsl #48
    92c8:      	sub	sp, x29, #0x0
    92cc:      	ldr	x29, [sp]
    92d0:      	ldr	x30, [sp, #0x8]
    92d4:      	add	sp, sp, #0x10
    92d8:      	ret
    92dc:      	uxtb	w0, w1
    92e0:      	str	x1, [x2]
    92e4:      	str	x3, [x2, #0x8]
    92e8:      	cmp	x0, #0x1f
    92ec:      	b.eq	0x9340 <_stogir.vector-arithmetic.node?+0x204>
    92f0:      	cmp	x0, #0x20
    92f4:      	b.eq	0x9340 <_stogir.vector-arithmetic.node?+0x204>
    92f8:      	cmp	x0, #0x2d
    92fc:      	b.eq	0x9340 <_stogir.vector-arithmetic.node?+0x204>
    9300:      	cmp	x0, #0x36
    9304:      	b.eq	0x9340 <_stogir.vector-arithmetic.node?+0x204>
    9308:      	cmp	x0, #0x37
    930c:      	b.eq	0x9340 <_stogir.vector-arithmetic.node?+0x204>
    9310:      	cmp	x0, #0x38
    9314:      	b.eq	0x9340 <_stogir.vector-arithmetic.node?+0x204>
    9318:      	cmp	x0, #0x39
    931c:      	b.eq	0x9340 <_stogir.vector-arithmetic.node?+0x204>
    9320:      	cmp	x0, #0x3a
    9324:      	b.eq	0x9340 <_stogir.vector-arithmetic.node?+0x204>
    9328:      	cmp	x0, #0x3b
    932c:      	b.eq	0x9340 <_stogir.vector-arithmetic.node?+0x204>
    9330:      	cmp	x0, #0x31
    9334:      	b.lt	0x93a4 <_stogir.vector-arithmetic.node?+0x268>
    9338:      	cmp	x0, #0x35
    933c:      	b.gt	0x93a4 <_stogir.vector-arithmetic.node?+0x268>
    9340:      	ldr	w0, [x2]
    9344:      	ubfx	x0, x0, #8, #8
    9348:      	cmp	x0, #0xf
    934c:      	b.le	0x92c4 <_stogir.vector-arithmetic.node?+0x188>
    9350:      	cmp	x0, #0x80
    9354:      	b.ge	0x9384 <_stogir.vector-arithmetic.node?+0x248>
    9358:      	and	x0, x0, #0xf
    935c:      	lsr	w0, w0, #0
    9360:      	sxtw	x0, w0
    9364:      	cmp	x0, #0x1
    9368:      	b.lt	0x9394 <_stogir.vector-arithmetic.node?+0x258>
    936c:      	cmp	x0, #0xd
    9370:      	cset	w0, le
    9374:      	ubfx	x0, x0, #0, #8
    9378:      	b	0x9398 <_stogir.vector-arithmetic.node?+0x25c>
    937c:      	movz	x4, #0x0, lsl #48
    9380:      	b	0x9210 <_stogir.vector-arithmetic.node?+0xd4>
    9384:      	movz	x0, #0x0, lsl #48
    9388:      	b	0x92c8 <_stogir.vector-arithmetic.node?+0x18c>
    938c:      	movz	x4, #0x0, lsl #48
    9390:      	b	0x9208 <_stogir.vector-arithmetic.node?+0xcc>
    9394:      	movz	x0, #0x0, lsl #48
    9398:      	b	0x9388 <_stogir.vector-arithmetic.node?+0x24c>
    939c:      	brk	#0
    93a0:      	b	0x939c <_stogir.vector-arithmetic.node?+0x260>
    93a4:      	cmp	x0, #0x1a
    93a8:      	b.eq	0x9340 <_stogir.vector-arithmetic.node?+0x204>
    93ac:      	cmp	x0, #0x1b
    93b0:      	b.eq	0x9340 <_stogir.vector-arithmetic.node?+0x204>
    93b4:      	cmp	x0, #0x1c
    93b8:      	b.eq	0x9340 <_stogir.vector-arithmetic.node?+0x204>
    93bc:      	cmp	x0, #0x1d
    93c0:      	b.eq	0x9340 <_stogir.vector-arithmetic.node?+0x204>
    93c4:      	cmp	x0, #0x1e
    93c8:      	b.eq	0x9340 <_stogir.vector-arithmetic.node?+0x204>
    93cc:      	cmp	x0, #0x2e
    93d0:      	b.eq	0x9340 <_stogir.vector-arithmetic.node?+0x204>
    93d4:      	cmp	x0, #0x2f
    93d8:      	b.eq	0x9340 <_stogir.vector-arithmetic.node?+0x204>
    93dc:      	cmp	x0, #0x30
    93e0:      	b.eq	0x9340 <_stogir.vector-arithmetic.node?+0x204>
    93e4:      	movz	x0, #0x0, lsl #48
    93e8:      	b	0x92c8 <_stogir.vector-arithmetic.node?+0x18c>

00000000000093ec <_stogir.vector-arithmetic.validate>:
    93ec:      	sub	sp, sp, #0x50
    93f0:      	str	x29, [sp]
    93f4:      	str	x30, [sp, #0x8]
    93f8:      	mov	x29, sp
    93fc:      	str	x19, [sp, #0x10]
    9400:      	str	x20, [sp, #0x18]
    9404:      	str	x21, [sp, #0x20]
    9408:      	str	x22, [sp, #0x28]
    940c:      	str	x23, [sp, #0x30]
    9410:      	str	x24, [sp, #0x38]
    9414:      	str	x25, [sp, #0x40]
    9418:      	str	x26, [sp, #0x48]
    941c:      	sub	sp, sp, #0x10
    9420:      	mov	x19, sp
    9424:      	sxtw	x1, w1
    9428:      	sub	sp, sp, #0x20
    942c:      	mov	x20, sp
    9430:      	lsl	x2, x1, #2
    9434:      	cmp	x1, #0x0
    9438:      	cset	w3, gt
    943c:      	movz	x16, #0x0, lsl #48
    9440:      	sub	x4, x16, x1
    9444:      	cmp	x1, #0x0
    9448:      	cset	w5, lt
    944c:      	sub	x6, x4, #0x1
    9450:      	lsl	x7, x6, #2
    9454:      	uxtb	w16, w3
    9458:      	cmp	w16, wzr
    945c:      	b.eq	0x949c <_stogir.vector-arithmetic.validate+0xb0>
    9460:      	ldr	x9, [x0, #0x8]
    9464:      	cmp	x1, x9
    9468:      	b.ge	0x94f0 <_stogir.vector-arithmetic.validate+0x104>
    946c:      	add	x9, x0, #0x78
    9470:      	ldr	x9, [x9, #0x8]
    9474:      	cmp	x1, x9
    9478:      	b.ge	0x962c <_stogir.vector-arithmetic.validate+0x240>
    947c:      	ldr	x9, [x0, #0x78]
    9480:      	add	x9, x2, x9
    9484:      	ldr	w9, [x9]
    9488:      	sxtw	x9, w9
    948c:      	cmp	x9, #0x0
    9490:      	cset	w9, ge
    9494:      	ubfx	x9, x9, #0, #8
    9498:      	b	0x9630 <_stogir.vector-arithmetic.validate+0x244>
    949c:      	uxtb	w16, w5
    94a0:      	cmp	w16, wzr
    94a4:      	b.eq	0x94f8 <_stogir.vector-arithmetic.validate+0x10c>
    94a8:      	add	x9, x0, #0x28
    94ac:      	add	x10, x0, #0x50
    94b0:      	ldr	x9, [x9, #0x8]
    94b4:      	ldr	x10, [x10, #0x8]
    94b8:      	cmp	x9, x10
    94bc:      	b.ne	0x94e8 <_stogir.vector-arithmetic.validate+0xfc>
    94c0:      	cmp	x4, x9
    94c4:      	b.gt	0x9688 <_stogir.vector-arithmetic.validate+0x29c>
    94c8:      	ldr	x9, [x0, #0x50]
    94cc:      	add	x9, x7, x9
    94d0:      	ldr	w9, [x9]
    94d4:      	sxtw	x9, w9
    94d8:      	cmp	x9, #0x0
    94dc:      	cset	w9, gt
    94e0:      	ubfx	x9, x9, #0, #8
    94e4:      	b	0x968c <_stogir.vector-arithmetic.validate+0x2a0>
    94e8:      	movz	x9, #0x0, lsl #48
    94ec:      	b	0x94fc <_stogir.vector-arithmetic.validate+0x110>
    94f0:      	movz	x9, #0x0, lsl #48
    94f4:      	b	0x94fc <_stogir.vector-arithmetic.validate+0x110>
    94f8:      	movz	x9, #0x0, lsl #48
    94fc:      	lsl	x10, x1, #4
    9500:      	lsl	x6, x6, #4
    9504:      	cmp	x9, #0x0
    9508:      	b.eq	0x9564 <_stogir.vector-arithmetic.validate+0x178>
    950c:      	uxtb	w16, w3
    9510:      	cmp	w16, wzr
    9514:      	b.eq	0x9538 <_stogir.vector-arithmetic.validate+0x14c>
    9518:      	ldr	x9, [x0]
    951c:      	add	x9, x10, x9
    9520:      	ldr	x11, [x9]
    9524:      	ldr	x9, [x9, #0x8]
    9528:      	fmov	d31, x9
    952c:      	mov	x9, x11
    9530:      	fmov	x11, d31
    9534:      	b	0x9554 <_stogir.vector-arithmetic.validate+0x168>
    9538:      	ldr	x9, [x0, #0x28]
    953c:      	add	x9, x6, x9
    9540:      	ldr	x11, [x9]
    9544:      	ldr	x9, [x9, #0x8]
    9548:      	fmov	d31, x9
    954c:      	mov	x9, x11
    9550:      	fmov	x11, d31
    9554:      	mov	x12, x11
    9558:      	mov	x11, x9
    955c:      	mov	x9, #0x1                ; =1
    9560:      	b	0x9570 <_stogir.vector-arithmetic.validate+0x184>
    9564:      	movz	x9, #0x0, lsl #48
    9568:      	movz	x11, #0x0, lsl #48
    956c:      	movz	x12, #0x0, lsl #48
    9570:      	lsr	w9, w9, #0
    9574:      	lsr	x16, x9, #0
    9578:      	cmp	x16, #0x1
    957c:      	b.eq	0x9598 <_stogir.vector-arithmetic.validate+0x1ac>
    9580:      	b.lo	0x9588 <_stogir.vector-arithmetic.validate+0x19c>
    9584:      	b	0x959c <_stogir.vector-arithmetic.validate+0x1b0>
    9588:      	cmp	x16, #0x0
    958c:      	b.eq	0x9594 <_stogir.vector-arithmetic.validate+0x1a8>
    9590:      	b	0x959c <_stogir.vector-arithmetic.validate+0x1b0>
    9594:      	b	0x95a0 <_stogir.vector-arithmetic.validate+0x1b4>
    9598:      	b	0x95fc <_stogir.vector-arithmetic.validate+0x210>
    959c:      	b	0x995c <_stogir.vector-arithmetic.validate+0x570>
    95a0:      	adrp	x16, 0x9000 <_stogir.vector-comparison.validate+0x360>
		00000000000095a0:  ARM64_RELOC_PAGE21	l_stogir.409
    95a4:      	ldr	x16, [x16]
		00000000000095a4:  ARM64_RELOC_PAGEOFF12	l_stogir.409
    95a8:      	orr	x0, x16, xzr
    95ac:      	mov	x25, x8
    95b0:      	mov	x1, x0
    95b4:      	mov	x0, #0x1                ; =1
    95b8:      	mov	x2, #0x25               ; =37
    95bc:      	str	x0, [x25]
    95c0:      	str	x1, [x25, #0x8]
    95c4:      	str	x2, [x25, #0x10]
    95c8:      	sub	sp, x29, #0x0
    95cc:      	ldr	x19, [sp, #0x10]
    95d0:      	ldr	x20, [sp, #0x18]
    95d4:      	ldr	x21, [sp, #0x20]
    95d8:      	ldr	x22, [sp, #0x28]
    95dc:      	ldr	x23, [sp, #0x30]
    95e0:      	ldr	x24, [sp, #0x38]
    95e4:      	ldr	x25, [sp, #0x40]
    95e8:      	ldr	x26, [sp, #0x48]
    95ec:      	ldr	x29, [sp]
    95f0:      	ldr	x30, [sp, #0x8]
    95f4:      	add	sp, sp, #0x50
    95f8:      	ret
    95fc:      	str	x11, [x19]
    9600:      	str	x12, [x19, #0x8]
    9604:      	cmp	x1, #0x0
    9608:      	b.gt	0x9634 <_stogir.vector-arithmetic.validate+0x248>
    960c:      	mov	x25, x8
    9610:      	adrp	x16, 0x9000 <_stogir.vector-comparison.validate+0x360>
		0000000000009610:  ARM64_RELOC_PAGE21	l_stogir.410
    9614:      	ldr	x16, [x16]
		0000000000009614:  ARM64_RELOC_PAGEOFF12	l_stogir.410
    9618:      	orr	x0, x16, xzr
    961c:      	mov	x1, x0
    9620:      	mov	x0, #0x1                ; =1
    9624:      	mov	x2, #0x2b               ; =43
    9628:      	b	0x95bc <_stogir.vector-arithmetic.validate+0x1d0>
    962c:      	movz	x9, #0x0, lsl #48
    9630:      	b	0x94f4 <_stogir.vector-arithmetic.validate+0x108>
    9634:      	mov	x9, sp
    9638:      	sub	sp, sp, #0x10
    963c:      	mov	x12, sp
    9640:      	uxtb	w16, w3
    9644:      	cmp	w16, wzr
    9648:      	b.eq	0x9690 <_stogir.vector-arithmetic.validate+0x2a4>
    964c:      	ldr	x4, [x0, #0x8]
    9650:      	cmp	x1, x4
    9654:      	b.ge	0x96dc <_stogir.vector-arithmetic.validate+0x2f0>
    9658:      	add	x4, x0, #0x78
    965c:      	ldr	x4, [x4, #0x8]
    9660:      	cmp	x1, x4
    9664:      	b.ge	0x988c <_stogir.vector-arithmetic.validate+0x4a0>
    9668:      	ldr	x1, [x0, #0x78]
    966c:      	add	x1, x2, x1
    9670:      	ldr	w1, [x1]
    9674:      	sxtw	x1, w1
    9678:      	cmp	x1, #0x0
    967c:      	cset	w1, ge
    9680:      	ubfx	x1, x1, #0, #8
    9684:      	b	0x9890 <_stogir.vector-arithmetic.validate+0x4a4>
    9688:      	movz	x9, #0x0, lsl #48
    968c:      	b	0x94ec <_stogir.vector-arithmetic.validate+0x100>
    9690:      	uxtb	w16, w5
    9694:      	cmp	w16, wzr
    9698:      	b.eq	0x96e4 <_stogir.vector-arithmetic.validate+0x2f8>
    969c:      	add	x1, x0, #0x28
    96a0:      	add	x5, x0, #0x50
    96a4:      	ldr	x1, [x1, #0x8]
    96a8:      	ldr	x5, [x5, #0x8]
    96ac:      	cmp	x1, x5
    96b0:      	b.ne	0x9884 <_stogir.vector-arithmetic.validate+0x498>
    96b4:      	cmp	x4, x1
    96b8:      	b.gt	0x994c <_stogir.vector-arithmetic.validate+0x560>
    96bc:      	ldr	x1, [x0, #0x50]
    96c0:      	add	x1, x7, x1
    96c4:      	ldr	w1, [x1]
    96c8:      	sxtw	x1, w1
    96cc:      	cmp	x1, #0x0
    96d0:      	cset	w1, gt
    96d4:      	ubfx	x1, x1, #0, #8
    96d8:      	b	0x9950 <_stogir.vector-arithmetic.validate+0x564>
    96dc:      	movz	x1, #0x0, lsl #48
    96e0:      	b	0x96e8 <_stogir.vector-arithmetic.validate+0x2fc>
    96e4:      	movz	x1, #0x0, lsl #48
    96e8:      	cmp	x1, #0x0
    96ec:      	b.eq	0x9748 <_stogir.vector-arithmetic.validate+0x35c>
    96f0:      	uxtb	w16, w3
    96f4:      	cmp	w16, wzr
    96f8:      	b.eq	0x971c <_stogir.vector-arithmetic.validate+0x330>
    96fc:      	ldr	x1, [x0]
    9700:      	add	x1, x10, x1
    9704:      	ldr	x3, [x1]
    9708:      	ldr	x1, [x1, #0x8]
    970c:      	fmov	d31, x1
    9710:      	mov	x1, x3
    9714:      	fmov	x3, d31
    9718:      	b	0x9738 <_stogir.vector-arithmetic.validate+0x34c>
    971c:      	ldr	x1, [x0, #0x28]
    9720:      	add	x1, x6, x1
    9724:      	ldr	x3, [x1]
    9728:      	ldr	x1, [x1, #0x8]
    972c:      	fmov	d31, x1
    9730:      	mov	x1, x3
    9734:      	fmov	x3, d31
    9738:      	mov	x4, x3
    973c:      	mov	x3, x1
    9740:      	mov	x1, #0x1                ; =1
    9744:      	b	0x9754 <_stogir.vector-arithmetic.validate+0x368>
    9748:      	movz	x1, #0x0, lsl #48
    974c:      	movz	x3, #0x0, lsl #48
    9750:      	movz	x4, #0x0, lsl #48
    9754:      	lsr	w1, w1, #0
    9758:      	lsr	x16, x1, #0
    975c:      	cmp	x16, #0x1
    9760:      	b.eq	0x977c <_stogir.vector-arithmetic.validate+0x390>
    9764:      	b.lo	0x976c <_stogir.vector-arithmetic.validate+0x380>
    9768:      	b	0x9780 <_stogir.vector-arithmetic.validate+0x394>
    976c:      	cmp	x16, #0x0
    9770:      	b.eq	0x9778 <_stogir.vector-arithmetic.validate+0x38c>
    9774:      	b	0x9780 <_stogir.vector-arithmetic.validate+0x394>
    9778:      	b	0x9784 <_stogir.vector-arithmetic.validate+0x398>
    977c:      	b	0x97e4 <_stogir.vector-arithmetic.validate+0x3f8>
    9780:      	b	0x9964 <_stogir.vector-arithmetic.validate+0x578>
    9784:      	movz	x1, #0x0, lsl #48
    9788:      	b	0x9790 <_stogir.vector-arithmetic.validate+0x3a4>
    978c:      	movz	x1, #0x0, lsl #48
    9790:      	mov	sp, x9
    9794:      	cmp	x1, #0x0
    9798:      	b.eq	0x99b4 <_stogir.vector-arithmetic.validate+0x5c8>
    979c:      	uxtb	w11, w11
    97a0:      	orr	x1, x11, xzr
    97a4:      	ldr	x3, [x0, #0x78]
    97a8:      	lsr	w21, w1, #0
    97ac:      	cmp	x11, #0x1d
    97b0:      	cset	w22, eq
    97b4:      	cmp	x11, #0x1e
    97b8:      	cset	w23, eq
    97bc:      	add	x1, x2, x3
    97c0:      	ldr	w24, [x1]
    97c4:      	mov	x25, x8
    97c8:      	mov	x26, x0
    97cc:      	mov	w0, w21
    97d0:      	bl	0x97d0 <_stogir.vector-arithmetic.validate+0x3e4>
		00000000000097d0:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.unary?
    97d4:      	cmp	x0, #0x0
    97d8:      	b.eq	0x9924 <_stogir.vector-arithmetic.validate+0x538>
    97dc:      	mov	x0, #0x1                ; =1
    97e0:      	b	0x98e4 <_stogir.vector-arithmetic.validate+0x4f8>
    97e4:      	uxtb	w1, w3
    97e8:      	str	x3, [x12]
    97ec:      	str	x4, [x12, #0x8]
    97f0:      	cmp	x1, #0x1f
    97f4:      	b.eq	0x9848 <_stogir.vector-arithmetic.validate+0x45c>
    97f8:      	cmp	x1, #0x20
    97fc:      	b.eq	0x9848 <_stogir.vector-arithmetic.validate+0x45c>
    9800:      	cmp	x1, #0x2d
    9804:      	b.eq	0x9848 <_stogir.vector-arithmetic.validate+0x45c>
    9808:      	cmp	x1, #0x36
    980c:      	b.eq	0x9848 <_stogir.vector-arithmetic.validate+0x45c>
    9810:      	cmp	x1, #0x37
    9814:      	b.eq	0x9848 <_stogir.vector-arithmetic.validate+0x45c>
    9818:      	cmp	x1, #0x38
    981c:      	b.eq	0x9848 <_stogir.vector-arithmetic.validate+0x45c>
    9820:      	cmp	x1, #0x39
    9824:      	b.eq	0x9848 <_stogir.vector-arithmetic.validate+0x45c>
    9828:      	cmp	x1, #0x3a
    982c:      	b.eq	0x9848 <_stogir.vector-arithmetic.validate+0x45c>
    9830:      	cmp	x1, #0x3b
    9834:      	b.eq	0x9848 <_stogir.vector-arithmetic.validate+0x45c>
    9838:      	cmp	x1, #0x31
    983c:      	b.lt	0x996c <_stogir.vector-arithmetic.validate+0x580>
    9840:      	cmp	x1, #0x35
    9844:      	b.gt	0x996c <_stogir.vector-arithmetic.validate+0x580>
    9848:      	ldr	w1, [x12]
    984c:      	ubfx	x1, x1, #8, #8
    9850:      	cmp	x1, #0xf
    9854:      	b.le	0x978c <_stogir.vector-arithmetic.validate+0x3a0>
    9858:      	cmp	x1, #0x80
    985c:      	b.ge	0x9944 <_stogir.vector-arithmetic.validate+0x558>
    9860:      	and	x1, x1, #0xf
    9864:      	lsr	w1, w1, #0
    9868:      	sxtw	x1, w1
    986c:      	cmp	x1, #0x1
    9870:      	b.lt	0x9954 <_stogir.vector-arithmetic.validate+0x568>
    9874:      	cmp	x1, #0xd
    9878:      	cset	w1, le
    987c:      	ubfx	x1, x1, #0, #8
    9880:      	b	0x9958 <_stogir.vector-arithmetic.validate+0x56c>
    9884:      	movz	x1, #0x0, lsl #48
    9888:      	b	0x96e8 <_stogir.vector-arithmetic.validate+0x2fc>
    988c:      	movz	x1, #0x0, lsl #48
    9890:      	b	0x96e0 <_stogir.vector-arithmetic.validate+0x2f4>
    9894:      	ldr	w3, [x19, #0xc]
    9898:      	sxtw	x3, w3
    989c:      	lsr	w1, w1, #0
    98a0:      	lsr	w2, w2, #0
    98a4:      	lsr	w3, w3, #0
    98a8:      	ubfx	x0, x0, #8, #8
    98ac:      	lsr	w0, w0, #0
    98b0:      	mov	x8, x20
    98b4:      	mov	w4, w2
    98b8:      	mov	w2, w0
    98bc:      	mov	x0, x26
    98c0:      	mov	w5, w3
    98c4:      	mov	w3, w1
    98c8:      	mov	w1, w21
    98cc:      	bl	0x98cc <_stogir.vector-arithmetic.validate+0x4e0>
		00000000000098cc:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.operands
    98d0:      	ldr	x0, [x20]
    98d4:      	ldr	x1, [x20, #0x8]
    98d8:      	ldr	x2, [x20, #0x10]
    98dc:      	b	0x9628 <_stogir.vector-arithmetic.validate+0x23c>
    98e0:      	mov	x0, #0x3                ; =3
    98e4:      	sxtw	x24, w24
    98e8:      	lsr	w0, w0, #0
    98ec:      	sxtw	x0, w0
    98f0:      	cmp	x24, x0
    98f4:      	b.ne	0x9610 <_stogir.vector-arithmetic.validate+0x224>
    98f8:      	ldr	w0, [x19]
    98fc:      	ldr	w1, [x19, #0x4]
    9900:      	ldr	w2, [x19, #0x8]
    9904:      	uxtb	w16, w22
    9908:      	cmp	w16, wzr
    990c:      	b.ne	0x9894 <_stogir.vector-arithmetic.validate+0x4a8>
    9910:      	uxtb	w16, w23
    9914:      	cmp	w16, wzr
    9918:      	b.ne	0x9894 <_stogir.vector-arithmetic.validate+0x4a8>
    991c:      	movz	x3, #0x0, lsl #48
    9920:      	b	0x989c <_stogir.vector-arithmetic.validate+0x4b0>
    9924:      	uxtb	w16, w22
    9928:      	cmp	w16, wzr
    992c:      	b.ne	0x98e0 <_stogir.vector-arithmetic.validate+0x4f4>
    9930:      	uxtb	w16, w23
    9934:      	cmp	w16, wzr
    9938:      	b.ne	0x98e0 <_stogir.vector-arithmetic.validate+0x4f4>
    993c:      	mov	x0, #0x2                ; =2
    9940:      	b	0x98e4 <_stogir.vector-arithmetic.validate+0x4f8>
    9944:      	movz	x1, #0x0, lsl #48
    9948:      	b	0x9790 <_stogir.vector-arithmetic.validate+0x3a4>
    994c:      	movz	x1, #0x0, lsl #48
    9950:      	b	0x9888 <_stogir.vector-arithmetic.validate+0x49c>
    9954:      	movz	x1, #0x0, lsl #48
    9958:      	b	0x9948 <_stogir.vector-arithmetic.validate+0x55c>
    995c:      	brk	#0
    9960:      	b	0x995c <_stogir.vector-arithmetic.validate+0x570>
    9964:      	brk	#0
    9968:      	b	0x9964 <_stogir.vector-arithmetic.validate+0x578>
    996c:      	cmp	x1, #0x1a
    9970:      	b.eq	0x9848 <_stogir.vector-arithmetic.validate+0x45c>
    9974:      	cmp	x1, #0x1b
    9978:      	b.eq	0x9848 <_stogir.vector-arithmetic.validate+0x45c>
    997c:      	cmp	x1, #0x1c
    9980:      	b.eq	0x9848 <_stogir.vector-arithmetic.validate+0x45c>
    9984:      	cmp	x1, #0x1d
    9988:      	b.eq	0x9848 <_stogir.vector-arithmetic.validate+0x45c>
    998c:      	cmp	x1, #0x1e
    9990:      	b.eq	0x9848 <_stogir.vector-arithmetic.validate+0x45c>
    9994:      	cmp	x1, #0x2e
    9998:      	b.eq	0x9848 <_stogir.vector-arithmetic.validate+0x45c>
    999c:      	cmp	x1, #0x2f
    99a0:      	b.eq	0x9848 <_stogir.vector-arithmetic.validate+0x45c>
    99a4:      	cmp	x1, #0x30
    99a8:      	b.eq	0x9848 <_stogir.vector-arithmetic.validate+0x45c>
    99ac:      	movz	x1, #0x0, lsl #48
    99b0:      	b	0x9790 <_stogir.vector-arithmetic.validate+0x3a4>
    99b4:      	mov	x25, x8
    99b8:      	b	0x9610 <_stogir.vector-arithmetic.validate+0x224>

00000000000099bc <_stogir.vector.memory-inputs>:
    99bc:      	sub	sp, sp, #0x50
    99c0:      	str	x29, [sp]
    99c4:      	str	x30, [sp, #0x8]
    99c8:      	mov	x29, sp
    99cc:      	str	x19, [sp, #0x10]
    99d0:      	str	x20, [sp, #0x18]
    99d4:      	str	x21, [sp, #0x20]
    99d8:      	str	x22, [sp, #0x28]
    99dc:      	str	x23, [sp, #0x30]
    99e0:      	str	x24, [sp, #0x38]
    99e4:      	str	x25, [sp, #0x40]
    99e8:      	str	x26, [sp, #0x48]
    99ec:      	sub	sp, sp, #0x10
    99f0:      	mov	x19, sp
    99f4:      	sxtw	x5, w1
    99f8:      	sub	sp, sp, #0x10
    99fc:      	mov	x20, sp
    9a00:      	cmp	x5, #0xf
    9a04:      	b.le	0x9f2c <_stogir.vector.memory-inputs+0x570>
    9a08:      	cmp	x5, #0x80
    9a0c:      	b.ge	0x9f34 <_stogir.vector.memory-inputs+0x578>
    9a10:      	and	x6, x5, #0xf
    9a14:      	lsr	w6, w6, #0
    9a18:      	sxtw	x6, w6
    9a1c:      	cmp	x6, #0x1
    9a20:      	b.lt	0x9f3c <_stogir.vector.memory-inputs+0x580>
    9a24:      	and	x5, x5, #0xf
    9a28:      	lsr	w5, w5, #0
    9a2c:      	sxtw	x5, w5
    9a30:      	cmp	x5, #0xd
    9a34:      	b.gt	0x9f44 <_stogir.vector.memory-inputs+0x588>
    9a38:      	lsr	w1, w1, #0
    9a3c:      	lsr	w2, w2, #0
    9a40:      	mov	x21, x8
    9a44:      	mov	x22, x0
    9a48:      	mov	w0, w1
    9a4c:      	mov	w23, w1
    9a50:      	mov	w1, w2
    9a54:      	mov	w24, w2
    9a58:      	mov	w25, w3
    9a5c:      	mov	w26, w4
    9a60:      	bl	0x9a60 <_stogir.vector.memory-inputs+0xa4>
		0000000000009a60:  ARM64_RELOC_BRANCH26	_stogir.types.size
    9a64:      	lsr	w0, w0, #0
    9a68:      	sxtw	x0, w0
    9a6c:      	cmp	x0, #0x0
    9a70:      	b.le	0x9ad8 <_stogir.vector.memory-inputs+0x11c>
    9a74:      	sxtw	x25, w25
    9a78:      	cmp	x25, #0x0
    9a7c:      	cset	w0, gt
    9a80:      	movz	x16, #0x0, lsl #48
    9a84:      	sub	x1, x16, x25
    9a88:      	sub	x2, x1, #0x1
    9a8c:      	uxtb	w16, w0
    9a90:      	cmp	w16, wzr
    9a94:      	b.eq	0x9bfc <_stogir.vector.memory-inputs+0x240>
    9a98:      	ldr	x1, [x22, #0x8]
    9a9c:      	cmp	x25, x1
    9aa0:      	b.ge	0x9bf4 <_stogir.vector.memory-inputs+0x238>
    9aa4:      	add	x1, x22, #0x78
    9aa8:      	ldr	x1, [x1, #0x8]
    9aac:      	cmp	x25, x1
    9ab0:      	b.ge	0x9ca4 <_stogir.vector.memory-inputs+0x2e8>
    9ab4:      	lsl	x1, x25, #2
    9ab8:      	ldr	x3, [x22, #0x78]
    9abc:      	add	x1, x1, x3
    9ac0:      	ldr	w1, [x1]
    9ac4:      	sxtw	x1, w1
    9ac8:      	cmp	x1, #0x0
    9acc:      	cset	w1, ge
    9ad0:      	ubfx	x1, x1, #0, #8
    9ad4:      	b	0x9ca8 <_stogir.vector.memory-inputs+0x2ec>
    9ad8:      	adrp	x16, 0x9000 <_stogir.vector-comparison.validate+0x360>
		0000000000009ad8:  ARM64_RELOC_PAGE21	l_stogir.411
    9adc:      	ldr	x16, [x16]
		0000000000009adc:  ARM64_RELOC_PAGEOFF12	l_stogir.411
    9ae0:      	orr	x0, x16, xzr
    9ae4:      	mov	x1, x0
    9ae8:      	mov	x0, #0x1                ; =1
    9aec:      	mov	x2, #0x32               ; =50
    9af0:      	str	x0, [x21]
    9af4:      	str	x1, [x21, #0x8]
    9af8:      	str	x2, [x21, #0x10]
    9afc:      	sub	sp, x29, #0x0
    9b00:      	ldr	x19, [sp, #0x10]
    9b04:      	ldr	x20, [sp, #0x18]
    9b08:      	ldr	x21, [sp, #0x20]
    9b0c:      	ldr	x22, [sp, #0x28]
    9b10:      	ldr	x23, [sp, #0x30]
    9b14:      	ldr	x24, [sp, #0x38]
    9b18:      	ldr	x25, [sp, #0x40]
    9b1c:      	ldr	x26, [sp, #0x48]
    9b20:      	ldr	x29, [sp]
    9b24:      	ldr	x30, [sp, #0x8]
    9b28:      	add	sp, sp, #0x50
    9b2c:      	ret
    9b30:      	movz	x0, #0x0, lsl #48
    9b34:      	movz	x1, #0x0, lsl #48
    9b38:      	movz	x2, #0x0, lsl #48
    9b3c:      	lsr	w0, w0, #0
    9b40:      	lsr	x16, x0, #0
    9b44:      	cmp	x16, #0x1
    9b48:      	b.eq	0x9b64 <_stogir.vector.memory-inputs+0x1a8>
    9b4c:      	b.lo	0x9b54 <_stogir.vector.memory-inputs+0x198>
    9b50:      	b	0x9b68 <_stogir.vector.memory-inputs+0x1ac>
    9b54:      	cmp	x16, #0x0
    9b58:      	b.eq	0x9b60 <_stogir.vector.memory-inputs+0x1a4>
    9b5c:      	b	0x9b68 <_stogir.vector.memory-inputs+0x1ac>
    9b60:      	b	0x9b6c <_stogir.vector.memory-inputs+0x1b0>
    9b64:      	b	0x9c48 <_stogir.vector.memory-inputs+0x28c>
    9b68:      	b	0x9f14 <_stogir.vector.memory-inputs+0x558>
    9b6c:      	adrp	x16, 0x9000 <_stogir.vector-comparison.validate+0x360>
		0000000000009b6c:  ARM64_RELOC_PAGE21	l_stogir.412
    9b70:      	ldr	x16, [x16]
		0000000000009b70:  ARM64_RELOC_PAGEOFF12	l_stogir.412
    9b74:      	orr	x0, x16, xzr
    9b78:      	mov	x1, x0
    9b7c:      	mov	x0, #0x1                ; =1
    9b80:      	mov	x2, #0x1d               ; =29
    9b84:      	b	0x9af0 <_stogir.vector.memory-inputs+0x134>
    9b88:      	lsl	x0, x2, #4
    9b8c:      	ldr	x1, [x22, #0x28]
    9b90:      	add	x0, x0, x1
    9b94:      	ldr	x1, [x0]
    9b98:      	ldr	x0, [x0, #0x8]
    9b9c:      	fmov	d31, x0
    9ba0:      	mov	x0, x1
    9ba4:      	fmov	x1, d31
    9ba8:      	mov	x2, x1
    9bac:      	mov	x1, x0
    9bb0:      	mov	x0, #0x1                ; =1
    9bb4:      	b	0x9b3c <_stogir.vector.memory-inputs+0x180>
    9bb8:      	movz	x1, #0x0, lsl #48
    9bbc:      	cmp	x1, #0x0
    9bc0:      	b.eq	0x9b30 <_stogir.vector.memory-inputs+0x174>
    9bc4:      	uxtb	w16, w0
    9bc8:      	cmp	w16, wzr
    9bcc:      	b.eq	0x9b88 <_stogir.vector.memory-inputs+0x1cc>
    9bd0:      	lsl	x0, x25, #4
    9bd4:      	ldr	x1, [x22]
    9bd8:      	add	x0, x0, x1
    9bdc:      	ldr	x1, [x0]
    9be0:      	ldr	x0, [x0, #0x8]
    9be4:      	fmov	d31, x0
    9be8:      	mov	x0, x1
    9bec:      	fmov	x1, d31
    9bf0:      	b	0x9ba8 <_stogir.vector.memory-inputs+0x1ec>
    9bf4:      	movz	x1, #0x0, lsl #48
    9bf8:      	b	0x9bbc <_stogir.vector.memory-inputs+0x200>
    9bfc:      	cmp	x25, #0x0
    9c00:      	b.ge	0x9bb8 <_stogir.vector.memory-inputs+0x1fc>
    9c04:      	add	x3, x22, #0x28
    9c08:      	add	x4, x22, #0x50
    9c0c:      	ldr	x3, [x3, #0x8]
    9c10:      	ldr	x4, [x4, #0x8]
    9c14:      	cmp	x3, x4
    9c18:      	b.ne	0x9c9c <_stogir.vector.memory-inputs+0x2e0>
    9c1c:      	cmp	x1, x3
    9c20:      	b.gt	0x9cac <_stogir.vector.memory-inputs+0x2f0>
    9c24:      	lsl	x1, x2, #2
    9c28:      	ldr	x3, [x22, #0x50]
    9c2c:      	add	x1, x1, x3
    9c30:      	ldr	w1, [x1]
    9c34:      	sxtw	x1, w1
    9c38:      	cmp	x1, #0x0
    9c3c:      	cset	w1, gt
    9c40:      	ubfx	x1, x1, #0, #8
    9c44:      	b	0x9cb0 <_stogir.vector.memory-inputs+0x2f4>
    9c48:      	str	x1, [x19]
    9c4c:      	str	x2, [x19, #0x8]
    9c50:      	cmp	x25, #0x0
    9c54:      	b.le	0x9c80 <_stogir.vector.memory-inputs+0x2c4>
    9c58:      	ldr	w0, [x19]
    9c5c:      	uxtb	w0, w0
    9c60:      	cmp	x0, #0x83
    9c64:      	b.ge	0x9cb4 <_stogir.vector.memory-inputs+0x2f8>
    9c68:      	adrp	x16, 0x9000 <_stogir.vector-comparison.validate+0x360>
		0000000000009c68:  ARM64_RELOC_PAGE21	l_stogir.413
    9c6c:      	ldr	x16, [x16]
		0000000000009c6c:  ARM64_RELOC_PAGEOFF12	l_stogir.413
    9c70:      	orr	x1, x16, xzr
    9c74:      	add	x0, x0, x1
    9c78:      	ldrb	w0, [x0]
    9c7c:      	b	0x9cb8 <_stogir.vector.memory-inputs+0x2fc>
    9c80:      	adrp	x16, 0x9000 <_stogir.vector-comparison.validate+0x360>
		0000000000009c80:  ARM64_RELOC_PAGE21	l_stogir.414
    9c84:      	ldr	x16, [x16]
		0000000000009c84:  ARM64_RELOC_PAGEOFF12	l_stogir.414
    9c88:      	orr	x0, x16, xzr
    9c8c:      	mov	x1, x0
    9c90:      	mov	x0, #0x1                ; =1
    9c94:      	mov	x2, #0x2c               ; =44
    9c98:      	b	0x9b84 <_stogir.vector.memory-inputs+0x1c8>
    9c9c:      	movz	x1, #0x0, lsl #48
    9ca0:      	b	0x9bbc <_stogir.vector.memory-inputs+0x200>
    9ca4:      	movz	x1, #0x0, lsl #48
    9ca8:      	b	0x9bf8 <_stogir.vector.memory-inputs+0x23c>
    9cac:      	movz	x1, #0x0, lsl #48
    9cb0:      	b	0x9ca0 <_stogir.vector.memory-inputs+0x2e4>
    9cb4:      	movz	x0, #0x0, lsl #48
    9cb8:      	uxtb	w0, w0
    9cbc:      	and	x0, x0, #0x1
    9cc0:      	uxtb	w0, w0
    9cc4:      	cmp	x0, #0x0
    9cc8:      	b.eq	0x9c80 <_stogir.vector.memory-inputs+0x2c4>
    9ccc:      	ldr	w0, [x19]
    9cd0:      	uxtb	w0, w0
    9cd4:      	cmp	x0, #0x83
    9cd8:      	b.ge	0x9cf4 <_stogir.vector.memory-inputs+0x338>
    9cdc:      	adrp	x16, 0x9000 <_stogir.vector-comparison.validate+0x360>
		0000000000009cdc:  ARM64_RELOC_PAGE21	l_stogir.413
    9ce0:      	ldr	x16, [x16]
		0000000000009ce0:  ARM64_RELOC_PAGEOFF12	l_stogir.413
    9ce4:      	orr	x1, x16, xzr
    9ce8:      	add	x0, x0, x1
    9cec:      	ldrb	w0, [x0]
    9cf0:      	b	0x9cf8 <_stogir.vector.memory-inputs+0x33c>
    9cf4:      	movz	x0, #0x0, lsl #48
    9cf8:      	uxtb	w0, w0
    9cfc:      	and	x0, x0, #0x4
    9d00:      	uxtb	w0, w0
    9d04:      	cmp	x0, #0x0
    9d08:      	b.ne	0x9c80 <_stogir.vector.memory-inputs+0x2c4>
    9d0c:      	sxtw	x26, w26
    9d10:      	cmp	x26, #0x0
    9d14:      	cset	w0, gt
    9d18:      	movz	x16, #0x0, lsl #48
    9d1c:      	sub	x1, x16, x26
    9d20:      	sub	x2, x1, #0x1
    9d24:      	uxtb	w16, w0
    9d28:      	cmp	w16, wzr
    9d2c:      	b.eq	0x9d8c <_stogir.vector.memory-inputs+0x3d0>
    9d30:      	ldr	x1, [x22, #0x8]
    9d34:      	cmp	x26, x1
    9d38:      	b.ge	0x9dd8 <_stogir.vector.memory-inputs+0x41c>
    9d3c:      	add	x1, x22, #0x78
    9d40:      	ldr	x1, [x1, #0x8]
    9d44:      	cmp	x26, x1
    9d48:      	b.ge	0x9f0c <_stogir.vector.memory-inputs+0x550>
    9d4c:      	lsl	x1, x26, #2
    9d50:      	ldr	x3, [x22, #0x78]
    9d54:      	add	x1, x1, x3
    9d58:      	ldr	w1, [x1]
    9d5c:      	sxtw	x1, w1
    9d60:      	cmp	x1, #0x0
    9d64:      	cset	w1, ge
    9d68:      	ubfx	x1, x1, #0, #8
    9d6c:      	b	0x9f10 <_stogir.vector.memory-inputs+0x554>
    9d70:      	adrp	x16, 0x9000 <_stogir.vector-comparison.validate+0x360>
		0000000000009d70:  ARM64_RELOC_PAGE21	l_stogir.415
    9d74:      	ldr	x16, [x16]
		0000000000009d74:  ARM64_RELOC_PAGEOFF12	l_stogir.415
    9d78:      	orr	x0, x16, xzr
    9d7c:      	mov	x1, x0
    9d80:      	mov	x0, #0x1                ; =1
    9d84:      	mov	x2, #0x2b               ; =43
    9d88:      	b	0x9c98 <_stogir.vector.memory-inputs+0x2dc>
    9d8c:      	cmp	x26, #0x0
    9d90:      	b.ge	0x9de0 <_stogir.vector.memory-inputs+0x424>
    9d94:      	add	x3, x22, #0x28
    9d98:      	add	x4, x22, #0x50
    9d9c:      	ldr	x3, [x3, #0x8]
    9da0:      	ldr	x4, [x4, #0x8]
    9da4:      	cmp	x3, x4
    9da8:      	b.ne	0x9f04 <_stogir.vector.memory-inputs+0x548>
    9dac:      	cmp	x1, x3
    9db0:      	b.gt	0x9f1c <_stogir.vector.memory-inputs+0x560>
    9db4:      	lsl	x1, x2, #2
    9db8:      	ldr	x3, [x22, #0x50]
    9dbc:      	add	x1, x1, x3
    9dc0:      	ldr	w1, [x1]
    9dc4:      	sxtw	x1, w1
    9dc8:      	cmp	x1, #0x0
    9dcc:      	cset	w1, gt
    9dd0:      	ubfx	x1, x1, #0, #8
    9dd4:      	b	0x9f20 <_stogir.vector.memory-inputs+0x564>
    9dd8:      	movz	x1, #0x0, lsl #48
    9ddc:      	b	0x9de4 <_stogir.vector.memory-inputs+0x428>
    9de0:      	movz	x1, #0x0, lsl #48
    9de4:      	cmp	x1, #0x0
    9de8:      	b.eq	0x9e4c <_stogir.vector.memory-inputs+0x490>
    9dec:      	uxtb	w16, w0
    9df0:      	cmp	w16, wzr
    9df4:      	b.eq	0x9e1c <_stogir.vector.memory-inputs+0x460>
    9df8:      	lsl	x0, x26, #4
    9dfc:      	ldr	x1, [x22]
    9e00:      	add	x0, x0, x1
    9e04:      	ldr	x1, [x0]
    9e08:      	ldr	x0, [x0, #0x8]
    9e0c:      	fmov	d31, x0
    9e10:      	mov	x0, x1
    9e14:      	fmov	x1, d31
    9e18:      	b	0x9e3c <_stogir.vector.memory-inputs+0x480>
    9e1c:      	lsl	x0, x2, #4
    9e20:      	ldr	x1, [x22, #0x28]
    9e24:      	add	x0, x0, x1
    9e28:      	ldr	x1, [x0]
    9e2c:      	ldr	x0, [x0, #0x8]
    9e30:      	fmov	d31, x0
    9e34:      	mov	x0, x1
    9e38:      	fmov	x1, d31
    9e3c:      	mov	x2, x1
    9e40:      	mov	x1, x0
    9e44:      	mov	x0, #0x1                ; =1
    9e48:      	b	0x9e58 <_stogir.vector.memory-inputs+0x49c>
    9e4c:      	movz	x0, #0x0, lsl #48
    9e50:      	movz	x1, #0x0, lsl #48
    9e54:      	movz	x2, #0x0, lsl #48
    9e58:      	lsr	w0, w0, #0
    9e5c:      	lsr	x16, x0, #0
    9e60:      	cmp	x16, #0x1
    9e64:      	b.eq	0x9e80 <_stogir.vector.memory-inputs+0x4c4>
    9e68:      	b.lo	0x9e70 <_stogir.vector.memory-inputs+0x4b4>
    9e6c:      	b	0x9e84 <_stogir.vector.memory-inputs+0x4c8>
    9e70:      	cmp	x16, #0x0
    9e74:      	b.eq	0x9e7c <_stogir.vector.memory-inputs+0x4c0>
    9e78:      	b	0x9e84 <_stogir.vector.memory-inputs+0x4c8>
    9e7c:      	b	0x9e88 <_stogir.vector.memory-inputs+0x4cc>
    9e80:      	b	0x9ea4 <_stogir.vector.memory-inputs+0x4e8>
    9e84:      	b	0x9f24 <_stogir.vector.memory-inputs+0x568>
    9e88:      	adrp	x16, 0x9000 <_stogir.vector-comparison.validate+0x360>
		0000000000009e88:  ARM64_RELOC_PAGE21	l_stogir.416
    9e8c:      	ldr	x16, [x16]
		0000000000009e8c:  ARM64_RELOC_PAGEOFF12	l_stogir.416
    9e90:      	orr	x0, x16, xzr
    9e94:      	mov	x1, x0
    9e98:      	mov	x0, #0x1                ; =1
    9e9c:      	mov	x2, #0x1d               ; =29
    9ea0:      	b	0x9d88 <_stogir.vector.memory-inputs+0x3cc>
    9ea4:      	lsr	w0, w1, #0
    9ea8:      	str	x1, [x20]
    9eac:      	str	x2, [x20, #0x8]
    9eb0:      	ubfx	x0, x0, #8, #8
    9eb4:      	cmp	x0, #0x6
    9eb8:      	b.ne	0x9d70 <_stogir.vector.memory-inputs+0x3b4>
    9ebc:      	ldr	w0, [x20]
    9ec0:      	uxtb	w0, w0
    9ec4:      	cmp	x0, #0x48
    9ec8:      	b.eq	0x9d70 <_stogir.vector.memory-inputs+0x3b4>
    9ecc:      	cmp	x0, #0x46
    9ed0:      	b.eq	0x9d70 <_stogir.vector.memory-inputs+0x3b4>
    9ed4:      	lsr	w23, w23, #0
    9ed8:      	lsr	w24, w24, #0
    9edc:      	mov	w0, w23
    9ee0:      	mov	w1, w24
    9ee4:      	bl	0x9ee4 <_stogir.vector.memory-inputs+0x528>
		0000000000009ee4:  ARM64_RELOC_BRANCH26	_stogir.types.size
    9ee8:      	lsr	w0, w0, #0
    9eec:      	sxtw	x0, w0
    9ef0:      	and	x0, x0, #0xffffffff
    9ef4:      	mov	x1, x0
    9ef8:      	movz	x0, #0x0, lsl #48
    9efc:      	movz	x2, #0x0, lsl #48
    9f00:      	b	0x9d88 <_stogir.vector.memory-inputs+0x3cc>
    9f04:      	movz	x1, #0x0, lsl #48
    9f08:      	b	0x9de4 <_stogir.vector.memory-inputs+0x428>
    9f0c:      	movz	x1, #0x0, lsl #48
    9f10:      	b	0x9ddc <_stogir.vector.memory-inputs+0x420>
    9f14:      	brk	#0
    9f18:      	b	0x9f14 <_stogir.vector.memory-inputs+0x558>
    9f1c:      	movz	x1, #0x0, lsl #48
    9f20:      	b	0x9f08 <_stogir.vector.memory-inputs+0x54c>
    9f24:      	brk	#0
    9f28:      	b	0x9f24 <_stogir.vector.memory-inputs+0x568>
    9f2c:      	mov	x21, x8
    9f30:      	b	0x9ad8 <_stogir.vector.memory-inputs+0x11c>
    9f34:      	mov	x21, x8
    9f38:      	b	0x9ad8 <_stogir.vector.memory-inputs+0x11c>
    9f3c:      	mov	x21, x8
    9f40:      	b	0x9ad8 <_stogir.vector.memory-inputs+0x11c>
    9f44:      	mov	x21, x8
    9f48:      	b	0x9ad8 <_stogir.vector.memory-inputs+0x11c>

0000000000009f4c <_stogir.vector.store-inputs>:
    9f4c:      	sub	sp, sp, #0x20
    9f50:      	str	x29, [sp]
    9f54:      	str	x30, [sp, #0x8]
    9f58:      	mov	x29, sp
    9f5c:      	str	x19, [sp, #0x10]
    9f60:      	str	x20, [sp, #0x18]
    9f64:      	sub	sp, sp, #0x20
    9f68:      	mov	x19, sp
    9f6c:      	sxtw	x4, w4
    9f70:      	cmp	x4, #0x0
    9f74:      	cset	w5, gt
    9f78:      	movz	x16, #0x0, lsl #48
    9f7c:      	sub	x6, x16, x4
    9f80:      	sub	x7, x6, #0x1
    9f84:      	uxtb	w16, w5
    9f88:      	cmp	w16, wzr
    9f8c:      	b.eq	0x9fd0 <_stogir.vector.store-inputs+0x84>
    9f90:      	ldr	x6, [x0, #0x8]
    9f94:      	cmp	x4, x6
    9f98:      	b.ge	0xa024 <_stogir.vector.store-inputs+0xd8>
    9f9c:      	add	x6, x0, #0x78
    9fa0:      	ldr	x6, [x6, #0x8]
    9fa4:      	cmp	x4, x6
    9fa8:      	b.ge	0xa138 <_stogir.vector.store-inputs+0x1ec>
    9fac:      	lsl	x6, x4, #2
    9fb0:      	ldr	x9, [x0, #0x78]
    9fb4:      	add	x6, x6, x9
    9fb8:      	ldr	w6, [x6]
    9fbc:      	sxtw	x6, w6
    9fc0:      	cmp	x6, #0x0
    9fc4:      	cset	w6, ge
    9fc8:      	ubfx	x6, x6, #0, #8
    9fcc:      	b	0xa13c <_stogir.vector.store-inputs+0x1f0>
    9fd0:      	cmp	x4, #0x0
    9fd4:      	b.ge	0xa02c <_stogir.vector.store-inputs+0xe0>
    9fd8:      	add	x9, x0, #0x28
    9fdc:      	add	x10, x0, #0x50
    9fe0:      	ldr	x9, [x9, #0x8]
    9fe4:      	ldr	x10, [x10, #0x8]
    9fe8:      	cmp	x9, x10
    9fec:      	b.ne	0xa01c <_stogir.vector.store-inputs+0xd0>
    9ff0:      	cmp	x6, x9
    9ff4:      	b.gt	0xa140 <_stogir.vector.store-inputs+0x1f4>
    9ff8:      	lsl	x6, x7, #2
    9ffc:      	ldr	x9, [x0, #0x50]
    a000:      	add	x6, x6, x9
    a004:      	ldr	w6, [x6]
    a008:      	sxtw	x6, w6
    a00c:      	cmp	x6, #0x0
    a010:      	cset	w6, gt
    a014:      	ubfx	x6, x6, #0, #8
    a018:      	b	0xa144 <_stogir.vector.store-inputs+0x1f8>
    a01c:      	movz	x6, #0x0, lsl #48
    a020:      	b	0xa030 <_stogir.vector.store-inputs+0xe4>
    a024:      	movz	x6, #0x0, lsl #48
    a028:      	b	0xa030 <_stogir.vector.store-inputs+0xe4>
    a02c:      	movz	x6, #0x0, lsl #48
    a030:      	cmp	x6, #0x0
    a034:      	b.eq	0xa074 <_stogir.vector.store-inputs+0x128>
    a038:      	uxtb	w16, w5
    a03c:      	cmp	w16, wzr
    a040:      	b.eq	0xa058 <_stogir.vector.store-inputs+0x10c>
    a044:      	lsl	x4, x4, #4
    a048:      	ldr	x5, [x0]
    a04c:      	add	x4, x4, x5
    a050:      	ldr	x4, [x4]
    a054:      	b	0xa068 <_stogir.vector.store-inputs+0x11c>
    a058:      	lsl	x4, x7, #4
    a05c:      	ldr	x5, [x0, #0x28]
    a060:      	add	x4, x4, x5
    a064:      	ldr	x4, [x4]
    a068:      	mov	x5, x4
    a06c:      	mov	x4, #0x1                ; =1
    a070:      	b	0xa07c <_stogir.vector.store-inputs+0x130>
    a074:      	movz	x4, #0x0, lsl #48
    a078:      	movz	x5, #0x0, lsl #48
    a07c:      	lsr	w4, w4, #0
    a080:      	lsr	x16, x4, #0
    a084:      	cmp	x16, #0x1
    a088:      	b.eq	0xa0a4 <_stogir.vector.store-inputs+0x158>
    a08c:      	b.lo	0xa094 <_stogir.vector.store-inputs+0x148>
    a090:      	b	0xa0a8 <_stogir.vector.store-inputs+0x15c>
    a094:      	cmp	x16, #0x0
    a098:      	b.eq	0xa0a0 <_stogir.vector.store-inputs+0x154>
    a09c:      	b	0xa0a8 <_stogir.vector.store-inputs+0x15c>
    a0a0:      	b	0xa0ac <_stogir.vector.store-inputs+0x160>
    a0a4:      	b	0xa0cc <_stogir.vector.store-inputs+0x180>
    a0a8:      	b	0xa148 <_stogir.vector.store-inputs+0x1fc>
    a0ac:      	adrp	x16, 0xa000 <_stogir.vector.store-inputs+0xb4>
		000000000000a0ac:  ARM64_RELOC_PAGE21	l_stogir.417
    a0b0:      	ldr	x16, [x16]
		000000000000a0b0:  ARM64_RELOC_PAGEOFF12	l_stogir.417
    a0b4:      	orr	x0, x16, xzr
    a0b8:      	mov	x20, x8
    a0bc:      	mov	x1, x0
    a0c0:      	mov	x0, #0x1                ; =1
    a0c4:      	mov	x2, #0x1a               ; =26
    a0c8:      	b	0xa110 <_stogir.vector.store-inputs+0x1c4>
    a0cc:      	lsr	w1, w1, #0
    a0d0:      	lsr	w2, w2, #0
    a0d4:      	lsr	w3, w3, #0
    a0d8:      	lsr	w5, w5, #0
    a0dc:      	ubfx	x4, x5, #8, #8
    a0e0:      	lsr	w4, w4, #0
    a0e4:      	mov	x20, x8
    a0e8:      	mov	x8, x19
    a0ec:      	fmov	s31, w1
    a0f0:      	mov	w1, w4
    a0f4:      	mov	w4, w3
    a0f8:      	mov	w3, w2
    a0fc:      	fmov	w2, s31
    a100:      	bl	0xa100 <_stogir.vector.store-inputs+0x1b4>
		000000000000a100:  ARM64_RELOC_BRANCH26	_stogir.vector.memory-inputs
    a104:      	ldr	x0, [x19]
    a108:      	ldr	x1, [x19, #0x8]
    a10c:      	ldr	x2, [x19, #0x10]
    a110:      	str	x0, [x20]
    a114:      	str	x1, [x20, #0x8]
    a118:      	str	x2, [x20, #0x10]
    a11c:      	sub	sp, x29, #0x0
    a120:      	ldr	x19, [sp, #0x10]
    a124:      	ldr	x20, [sp, #0x18]
    a128:      	ldr	x29, [sp]
    a12c:      	ldr	x30, [sp, #0x8]
    a130:      	add	sp, sp, #0x20
    a134:      	ret
    a138:      	movz	x6, #0x0, lsl #48
    a13c:      	b	0xa028 <_stogir.vector.store-inputs+0xdc>
    a140:      	movz	x6, #0x0, lsl #48
    a144:      	b	0xa020 <_stogir.vector.store-inputs+0xd4>
    a148:      	brk	#0
    a14c:      	b	0xa148 <_stogir.vector.store-inputs+0x1fc>

000000000000a150 <_stogir.types.size>:
    a150:      	sub	sp, sp, #0x60
    a154:      	str	x29, [sp]
    a158:      	str	x30, [sp, #0x8]
    a15c:      	mov	x29, sp
    a160:      	str	x19, [sp, #0x10]
    a164:      	str	x20, [sp, #0x18]
    a168:      	str	x21, [sp, #0x20]
    a16c:      	str	x22, [sp, #0x28]
    a170:      	str	x23, [sp, #0x30]
    a174:      	str	x24, [sp, #0x38]
    a178:      	str	x25, [sp, #0x40]
    a17c:      	str	x26, [sp, #0x48]
    a180:      	str	x27, [sp, #0x50]
    a184:      	str	x28, [sp, #0x58]
    a188:      	sxtw	x19, w0
    a18c:      	sxtw	x20, w1
    a190:      	cmp	x19, #0xf
    a194:      	cset	w21, gt
    a198:      	cmp	x19, #0x0
    a19c:      	cset	w22, eq
    a1a0:      	cmp	x20, #0x4
    a1a4:      	cset	w23, eq
    a1a8:      	cmp	x20, #0x8
    a1ac:      	cset	w24, eq
    a1b0:      	uxtb	w16, w21
    a1b4:      	cmp	w16, wzr
    a1b8:      	b.eq	0xa21c <_stogir.types.size+0xcc>
    a1bc:      	cmp	x19, #0x80
    a1c0:      	cset	w25, lt
    a1c4:      	uxtb	w16, w25
    a1c8:      	cmp	w16, wzr
    a1cc:      	b.eq	0xa21c <_stogir.types.size+0xcc>
    a1d0:      	and	x1, x19, #0xf
    a1d4:      	lsr	w1, w1, #0
    a1d8:      	sxtw	x26, w1
    a1dc:      	cmp	x26, #0x1
    a1e0:      	cset	w27, ge
    a1e4:      	uxtb	w16, w27
    a1e8:      	cmp	w16, wzr
    a1ec:      	b.eq	0xa21c <_stogir.types.size+0xcc>
    a1f0:      	cmp	x26, #0xd
    a1f4:      	cset	w28, le
    a1f8:      	uxtb	w16, w28
    a1fc:      	cmp	w16, wzr
    a200:      	b.eq	0xa21c <_stogir.types.size+0xcc>
    a204:      	lsr	w0, w0, #0
    a208:      	bl	0xa208 <_stogir.types.size+0xb8>
		000000000000a208:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
    a20c:      	cmp	x0, #0x0
    a210:      	b.eq	0xa2fc <_stogir.types.size+0x1ac>
    a214:      	mov	x0, x26
    a218:      	b	0xa300 <_stogir.types.size+0x1b0>
    a21c:      	uxtb	w16, w23
    a220:      	cmp	w16, wzr
    a224:      	b.ne	0xa23c <_stogir.types.size+0xec>
    a228:      	uxtb	w16, w24
    a22c:      	cmp	w16, wzr
    a230:      	b.ne	0xa23c <_stogir.types.size+0xec>
    a234:      	movn	x0, #0x0, lsl #48
    a238:      	b	0xa254 <_stogir.types.size+0x104>
    a23c:      	uxtb	w16, w22
    a240:      	cmp	w16, wzr
    a244:      	b.eq	0xa28c <_stogir.types.size+0x13c>
    a248:      	movz	x0, #0x0, lsl #48
    a24c:      	b	0xa254 <_stogir.types.size+0x104>
    a250:      	mov	x0, #0x1                ; =1
    a254:      	ldr	x19, [sp, #0x10]
    a258:      	ldr	x20, [sp, #0x18]
    a25c:      	ldr	x21, [sp, #0x20]
    a260:      	ldr	x22, [sp, #0x28]
    a264:      	ldr	x23, [sp, #0x30]
    a268:      	ldr	x24, [sp, #0x38]
    a26c:      	ldr	x25, [sp, #0x40]
    a270:      	ldr	x26, [sp, #0x48]
    a274:      	ldr	x27, [sp, #0x50]
    a278:      	ldr	x28, [sp, #0x58]
    a27c:      	ldr	x29, [sp]
    a280:      	ldr	x30, [sp, #0x8]
    a284:      	add	sp, sp, #0x60
    a288:      	ret
    a28c:      	cmp	x19, #0x1
    a290:      	b.eq	0xa250 <_stogir.types.size+0x100>
    a294:      	cmp	x19, #0x2
    a298:      	b.eq	0xa250 <_stogir.types.size+0x100>
    a29c:      	cmp	x19, #0x7
    a2a0:      	b.eq	0xa250 <_stogir.types.size+0x100>
    a2a4:      	cmp	x19, #0x8
    a2a8:      	b.eq	0xa250 <_stogir.types.size+0x100>
    a2ac:      	cmp	x19, #0x3
    a2b0:      	b.eq	0xa46c <_stogir.types.size+0x31c>
    a2b4:      	cmp	x19, #0x9
    a2b8:      	b.eq	0xa46c <_stogir.types.size+0x31c>
    a2bc:      	cmp	x19, #0x4
    a2c0:      	b.eq	0xa494 <_stogir.types.size+0x344>
    a2c4:      	cmp	x19, #0xa
    a2c8:      	b.eq	0xa494 <_stogir.types.size+0x344>
    a2cc:      	cmp	x19, #0xd
    a2d0:      	b.eq	0xa494 <_stogir.types.size+0x344>
    a2d4:      	cmp	x19, #0x5
    a2d8:      	b.eq	0xa4a4 <_stogir.types.size+0x354>
    a2dc:      	cmp	x19, #0xb
    a2e0:      	b.eq	0xa4a4 <_stogir.types.size+0x354>
    a2e4:      	cmp	x19, #0xc
    a2e8:      	b.eq	0xa4a4 <_stogir.types.size+0x354>
    a2ec:      	cmp	x19, #0x6
    a2f0:      	b.ne	0xa4b4 <_stogir.types.size+0x364>
    a2f4:      	mov	x0, x20
    a2f8:      	b	0xa4b8 <_stogir.types.size+0x368>
    a2fc:      	movn	x0, #0x0, lsl #48
    a300:      	uxtb	w16, w23
    a304:      	cmp	w16, wzr
    a308:      	b.ne	0xa320 <_stogir.types.size+0x1d0>
    a30c:      	uxtb	w16, w24
    a310:      	cmp	w16, wzr
    a314:      	b.ne	0xa320 <_stogir.types.size+0x1d0>
    a318:      	movn	x0, #0x0, lsl #48
    a31c:      	b	0xa33c <_stogir.types.size+0x1ec>
    a320:      	lsr	w0, w0, #0
    a324:      	sxtw	x0, w0
    a328:      	cmp	x0, #0x0
    a32c:      	b.ne	0xa3fc <_stogir.types.size+0x2ac>
    a330:      	movz	x0, #0x0, lsl #48
    a334:      	b	0xa33c <_stogir.types.size+0x1ec>
    a338:      	mov	x0, #0x1                ; =1
    a33c:      	lsr	w0, w0, #0
    a340:      	sxtw	x0, w0
    a344:      	cmp	x0, #0x0
    a348:      	b.ge	0xa3a4 <_stogir.types.size+0x254>
    a34c:      	movn	x0, #0x0, lsl #48
    a350:      	b	0xa36c <_stogir.types.size+0x21c>
    a354:      	movn	x1, #0x0, lsl #48
    a358:      	lsr	w1, w1, #0
    a35c:      	sxtw	x1, w1
    a360:      	mul	x0, x1, x0
    a364:      	lsr	w0, w0, #0
    a368:      	sxtw	x0, w0
    a36c:      	ldr	x19, [sp, #0x10]
    a370:      	ldr	x20, [sp, #0x18]
    a374:      	ldr	x21, [sp, #0x20]
    a378:      	ldr	x22, [sp, #0x28]
    a37c:      	ldr	x23, [sp, #0x30]
    a380:      	ldr	x24, [sp, #0x38]
    a384:      	ldr	x25, [sp, #0x40]
    a388:      	ldr	x26, [sp, #0x48]
    a38c:      	ldr	x27, [sp, #0x50]
    a390:      	ldr	x28, [sp, #0x58]
    a394:      	ldr	x29, [sp]
    a398:      	ldr	x30, [sp, #0x8]
    a39c:      	add	sp, sp, #0x60
    a3a0:      	ret
    a3a4:      	uxtb	w16, w21
    a3a8:      	cmp	w16, wzr
    a3ac:      	b.eq	0xa474 <_stogir.types.size+0x324>
    a3b0:      	uxtb	w16, w25
    a3b4:      	cmp	w16, wzr
    a3b8:      	b.eq	0xa474 <_stogir.types.size+0x324>
    a3bc:      	uxtb	w16, w27
    a3c0:      	cmp	w16, wzr
    a3c4:      	b.eq	0xa474 <_stogir.types.size+0x324>
    a3c8:      	uxtb	w16, w28
    a3cc:      	cmp	w16, wzr
    a3d0:      	b.eq	0xa474 <_stogir.types.size+0x324>
    a3d4:      	ubfx	x1, x19, #4, #32
    a3d8:      	sxtw	x1, w1
    a3dc:      	sub	x1, x1, #0x1
    a3e0:      	lsr	w1, w1, #0
    a3e4:      	sxtw	x1, w1
    a3e8:      	mov	x16, #0x1               ; =1
    a3ec:      	lsl	x1, x16, x1
    a3f0:      	lsr	w1, w1, #0
    a3f4:      	sxtw	x1, w1
    a3f8:      	b	0xa358 <_stogir.types.size+0x208>
    a3fc:      	cmp	x0, #0x1
    a400:      	b.eq	0xa338 <_stogir.types.size+0x1e8>
    a404:      	cmp	x0, #0x2
    a408:      	b.eq	0xa338 <_stogir.types.size+0x1e8>
    a40c:      	cmp	x0, #0x7
    a410:      	b.eq	0xa338 <_stogir.types.size+0x1e8>
    a414:      	cmp	x0, #0x8
    a418:      	b.eq	0xa338 <_stogir.types.size+0x1e8>
    a41c:      	cmp	x0, #0x3
    a420:      	b.eq	0xa49c <_stogir.types.size+0x34c>
    a424:      	cmp	x0, #0x9
    a428:      	b.eq	0xa49c <_stogir.types.size+0x34c>
    a42c:      	cmp	x0, #0x4
    a430:      	b.eq	0xa4ac <_stogir.types.size+0x35c>
    a434:      	cmp	x0, #0xa
    a438:      	b.eq	0xa4ac <_stogir.types.size+0x35c>
    a43c:      	cmp	x0, #0xd
    a440:      	b.eq	0xa4ac <_stogir.types.size+0x35c>
    a444:      	cmp	x0, #0x5
    a448:      	b.eq	0xa4bc <_stogir.types.size+0x36c>
    a44c:      	cmp	x0, #0xb
    a450:      	b.eq	0xa4bc <_stogir.types.size+0x36c>
    a454:      	cmp	x0, #0xc
    a458:      	b.eq	0xa4bc <_stogir.types.size+0x36c>
    a45c:      	cmp	x0, #0x6
    a460:      	b.ne	0xa4c4 <_stogir.types.size+0x374>
    a464:      	mov	x0, x20
    a468:      	b	0xa4c8 <_stogir.types.size+0x378>
    a46c:      	mov	x0, #0x2                ; =2
    a470:      	b	0xa254 <_stogir.types.size+0x104>
    a474:      	cmp	x19, #0x0
    a478:      	b.lt	0xa354 <_stogir.types.size+0x204>
    a47c:      	cmp	x19, #0xd
    a480:      	b.gt	0xa354 <_stogir.types.size+0x204>
    a484:      	uxtb	w16, w22
    a488:      	cmp	w16, wzr
    a48c:      	cset	x1, eq
    a490:      	b	0xa358 <_stogir.types.size+0x208>
    a494:      	mov	x0, #0x4                ; =4
    a498:      	b	0xa470 <_stogir.types.size+0x320>
    a49c:      	mov	x0, #0x2                ; =2
    a4a0:      	b	0xa33c <_stogir.types.size+0x1ec>
    a4a4:      	mov	x0, #0x8                ; =8
    a4a8:      	b	0xa498 <_stogir.types.size+0x348>
    a4ac:      	mov	x0, #0x4                ; =4
    a4b0:      	b	0xa4a0 <_stogir.types.size+0x350>
    a4b4:      	movn	x0, #0x0, lsl #48
    a4b8:      	b	0xa4a8 <_stogir.types.size+0x358>
    a4bc:      	mov	x0, #0x8                ; =8
    a4c0:      	b	0xa4b0 <_stogir.types.size+0x360>
    a4c4:      	movn	x0, #0x0, lsl #48
    a4c8:      	b	0xa4c0 <_stogir.types.size+0x370>

000000000000a4cc <_stogir.opcode.properties>:
    a4cc:      	sxtw	x0, w0
    a4d0:      	cmp	x0, #0x0
    a4d4:      	b.lt	0xa4fc <_stogir.opcode.properties+0x30>
    a4d8:      	cmp	x0, #0x83
    a4dc:      	b.ge	0xa4fc <_stogir.opcode.properties+0x30>
    a4e0:      	adrp	x16, 0xa000 <_stogir.vector.store-inputs+0xb4>
		000000000000a4e0:  ARM64_RELOC_PAGE21	l_stogir.418
    a4e4:      	ldr	x16, [x16]
		000000000000a4e4:  ARM64_RELOC_PAGEOFF12	l_stogir.418
    a4e8:      	orr	x1, x16, xzr
    a4ec:      	lsr	x0, x0, #0
    a4f0:      	add	x0, x0, x1
    a4f4:      	ldrb	w0, [x0]
    a4f8:      	b	0xa500 <_stogir.opcode.properties+0x34>
    a4fc:      	movz	x0, #0x0, lsl #48
    a500:      	ret

000000000000a504 <_stogir.checked.projection>:
    a504:      	sub	sp, sp, #0x20
    a508:      	str	x29, [sp]
    a50c:      	str	x30, [sp, #0x8]
    a510:      	mov	x29, sp
    a514:      	str	x19, [sp, #0x10]
    a518:      	str	x20, [sp, #0x18]
    a51c:      	sub	sp, sp, #0x10
    a520:      	mov	x2, sp
    a524:      	sxtw	x3, w1
    a528:      	sub	sp, sp, #0x20
    a52c:      	mov	x19, sp
    a530:      	cmp	x3, #0x0
    a534:      	cset	w4, gt
    a538:      	movz	x16, #0x0, lsl #48
    a53c:      	sub	x5, x16, x3
    a540:      	sub	x6, x5, #0x1
    a544:      	uxtb	w16, w4
    a548:      	cmp	w16, wzr
    a54c:      	b.eq	0xa590 <_stogir.checked.projection+0x8c>
    a550:      	ldr	x5, [x0, #0x8]
    a554:      	cmp	x3, x5
    a558:      	b.ge	0xa5e4 <_stogir.checked.projection+0xe0>
    a55c:      	add	x5, x0, #0x78
    a560:      	ldr	x5, [x5, #0x8]
    a564:      	cmp	x3, x5
    a568:      	b.ge	0xa730 <_stogir.checked.projection+0x22c>
    a56c:      	lsl	x5, x3, #2
    a570:      	ldr	x7, [x0, #0x78]
    a574:      	add	x5, x5, x7
    a578:      	ldr	w5, [x5]
    a57c:      	sxtw	x5, w5
    a580:      	cmp	x5, #0x0
    a584:      	cset	w5, ge
    a588:      	ubfx	x5, x5, #0, #8
    a58c:      	b	0xa734 <_stogir.checked.projection+0x230>
    a590:      	cmp	x3, #0x0
    a594:      	b.ge	0xa5ec <_stogir.checked.projection+0xe8>
    a598:      	add	x7, x0, #0x28
    a59c:      	add	x9, x0, #0x50
    a5a0:      	ldr	x7, [x7, #0x8]
    a5a4:      	ldr	x9, [x9, #0x8]
    a5a8:      	cmp	x7, x9
    a5ac:      	b.ne	0xa5dc <_stogir.checked.projection+0xd8>
    a5b0:      	cmp	x5, x7
    a5b4:      	b.gt	0xa768 <_stogir.checked.projection+0x264>
    a5b8:      	lsl	x5, x6, #2
    a5bc:      	ldr	x7, [x0, #0x50]
    a5c0:      	add	x5, x5, x7
    a5c4:      	ldr	w5, [x5]
    a5c8:      	sxtw	x5, w5
    a5cc:      	cmp	x5, #0x0
    a5d0:      	cset	w5, gt
    a5d4:      	ubfx	x5, x5, #0, #8
    a5d8:      	b	0xa76c <_stogir.checked.projection+0x268>
    a5dc:      	movz	x5, #0x0, lsl #48
    a5e0:      	b	0xa5f0 <_stogir.checked.projection+0xec>
    a5e4:      	movz	x5, #0x0, lsl #48
    a5e8:      	b	0xa5f0 <_stogir.checked.projection+0xec>
    a5ec:      	movz	x5, #0x0, lsl #48
    a5f0:      	cmp	x5, #0x0
    a5f4:      	b.eq	0xa658 <_stogir.checked.projection+0x154>
    a5f8:      	uxtb	w16, w4
    a5fc:      	cmp	w16, wzr
    a600:      	b.eq	0xa628 <_stogir.checked.projection+0x124>
    a604:      	lsl	x3, x3, #4
    a608:      	ldr	x4, [x0]
    a60c:      	add	x3, x3, x4
    a610:      	ldr	x4, [x3]
    a614:      	ldr	x3, [x3, #0x8]
    a618:      	fmov	d31, x3
    a61c:      	mov	x3, x4
    a620:      	fmov	x4, d31
    a624:      	b	0xa648 <_stogir.checked.projection+0x144>
    a628:      	lsl	x3, x6, #4
    a62c:      	ldr	x4, [x0, #0x28]
    a630:      	add	x3, x3, x4
    a634:      	ldr	x4, [x3]
    a638:      	ldr	x3, [x3, #0x8]
    a63c:      	fmov	d31, x3
    a640:      	mov	x3, x4
    a644:      	fmov	x4, d31
    a648:      	mov	x5, x4
    a64c:      	mov	x4, x3
    a650:      	mov	x3, #0x1                ; =1
    a654:      	b	0xa664 <_stogir.checked.projection+0x160>
    a658:      	movz	x3, #0x0, lsl #48
    a65c:      	movz	x4, #0x0, lsl #48
    a660:      	movz	x5, #0x0, lsl #48
    a664:      	lsr	w3, w3, #0
    a668:      	lsr	x16, x3, #0
    a66c:      	cmp	x16, #0x1
    a670:      	b.eq	0xa68c <_stogir.checked.projection+0x188>
    a674:      	b.lo	0xa67c <_stogir.checked.projection+0x178>
    a678:      	b	0xa690 <_stogir.checked.projection+0x18c>
    a67c:      	cmp	x16, #0x0
    a680:      	b.eq	0xa688 <_stogir.checked.projection+0x184>
    a684:      	b	0xa690 <_stogir.checked.projection+0x18c>
    a688:      	b	0xa694 <_stogir.checked.projection+0x190>
    a68c:      	b	0xa6f4 <_stogir.checked.projection+0x1f0>
    a690:      	b	0xa770 <_stogir.checked.projection+0x26c>
    a694:      	adrp	x16, 0xa000 <_stogir.vector.store-inputs+0xb4>
		000000000000a694:  ARM64_RELOC_PAGE21	l_stogir.419
    a698:      	ldr	x16, [x16]
		000000000000a698:  ARM64_RELOC_PAGEOFF12	l_stogir.419
    a69c:      	orr	x0, x16, xzr
    a6a0:      	mov	x20, x8
    a6a4:      	mov	x1, x0
    a6a8:      	mov	x0, #0x1                ; =1
    a6ac:      	mov	x2, #0x17               ; =23
    a6b0:      	b	0xa6cc <_stogir.checked.projection+0x1c8>
    a6b4:      	adrp	x16, 0xa000 <_stogir.vector.store-inputs+0xb4>
		000000000000a6b4:  ARM64_RELOC_PAGE21	l_stogir.420
    a6b8:      	ldr	x16, [x16]
		000000000000a6b8:  ARM64_RELOC_PAGEOFF12	l_stogir.420
    a6bc:      	orr	x0, x16, xzr
    a6c0:      	mov	x1, x0
    a6c4:      	mov	x0, #0x1                ; =1
    a6c8:      	mov	x2, #0x20               ; =32
    a6cc:      	str	x0, [x20]
    a6d0:      	str	x1, [x20, #0x8]
    a6d4:      	str	x2, [x20, #0x10]
    a6d8:      	sub	sp, x29, #0x0
    a6dc:      	ldr	x19, [sp, #0x10]
    a6e0:      	ldr	x20, [sp, #0x18]
    a6e4:      	ldr	x29, [sp]
    a6e8:      	ldr	x30, [sp, #0x8]
    a6ec:      	add	sp, sp, #0x20
    a6f0:      	ret
    a6f4:      	uxtb	w3, w4
    a6f8:      	str	x4, [x2]
    a6fc:      	str	x5, [x2, #0x8]
    a700:      	cmp	x3, #0x29
    a704:      	b.lt	0xa778 <_stogir.checked.projection+0x274>
    a708:      	cmp	x3, #0x2b
    a70c:      	b.gt	0xa780 <_stogir.checked.projection+0x27c>
    a710:      	lsr	w1, w1, #0
    a714:      	mov	x20, x8
    a718:      	mov	x8, x19
    a71c:      	bl	0xa71c <_stogir.checked.projection+0x218>
		000000000000a71c:  ARM64_RELOC_BRANCH26	_stogir.checked.validate
    a720:      	ldr	x0, [x19]
    a724:      	ldr	x1, [x19, #0x8]
    a728:      	ldr	x2, [x19, #0x10]
    a72c:      	b	0xa6cc <_stogir.checked.projection+0x1c8>
    a730:      	movz	x5, #0x0, lsl #48
    a734:      	b	0xa5e8 <_stogir.checked.projection+0xe4>
    a738:      	ldr	w0, [x2]
    a73c:      	orr	x1, x0, xzr
    a740:      	ubfx	x1, x1, #8, #8
    a744:      	cmp	x1, #0x0
    a748:      	b.eq	0xa6b4 <_stogir.checked.projection+0x1b0>
    a74c:      	ubfx	x0, x0, #8, #8
    a750:      	cmp	x0, #0xd
    a754:      	b.gt	0xa6b4 <_stogir.checked.projection+0x1b0>
    a758:      	movz	x0, #0x0, lsl #48
    a75c:      	movz	x1, #0x0, lsl #48
    a760:      	movz	x2, #0x0, lsl #48
    a764:      	b	0xa6cc <_stogir.checked.projection+0x1c8>
    a768:      	movz	x5, #0x0, lsl #48
    a76c:      	b	0xa5e0 <_stogir.checked.projection+0xdc>
    a770:      	brk	#0
    a774:      	b	0xa770 <_stogir.checked.projection+0x26c>
    a778:      	mov	x20, x8
    a77c:      	b	0xa738 <_stogir.checked.projection+0x234>
    a780:      	mov	x20, x8
    a784:      	b	0xa738 <_stogir.checked.projection+0x234>

000000000000a788 <_stogir.checked.operands>:
    a788:      	sub	sp, sp, #0x30
    a78c:      	str	x29, [sp]
    a790:      	str	x30, [sp, #0x8]
    a794:      	mov	x29, sp
    a798:      	str	x19, [sp, #0x10]
    a79c:      	str	x20, [sp, #0x18]
    a7a0:      	str	x21, [sp, #0x20]
    a7a4:      	str	x22, [sp, #0x28]
    a7a8:      	adrp	x16, 0xa000 <_stogir.vector.store-inputs+0xb4>
		000000000000a7a8:  ARM64_RELOC_PAGE21	l_stogir.421
    a7ac:      	ldr	x16, [x16]
		000000000000a7ac:  ARM64_RELOC_PAGEOFF12	l_stogir.421
    a7b0:      	orr	x5, x16, xzr
    a7b4:      	sub	sp, sp, #0x10
    a7b8:      	mov	x6, sp
    a7bc:      	sxtw	x1, w1
    a7c0:      	sxtw	x19, w2
    a7c4:      	sub	sp, sp, #0x10
    a7c8:      	mov	x2, sp
    a7cc:      	cmp	x1, #0x29
    a7d0:      	b.lt	0xa810 <_stogir.checked.operands+0x88>
    a7d4:      	cmp	x1, #0x2b
    a7d8:      	b.gt	0xa810 <_stogir.checked.operands+0x88>
    a7dc:      	cmp	x19, #0x1
    a7e0:      	b.lt	0xa810 <_stogir.checked.operands+0x88>
    a7e4:      	cmp	x19, #0xb
    a7e8:      	b.gt	0xa810 <_stogir.checked.operands+0x88>
    a7ec:      	cmp	x19, #0x1
    a7f0:      	b.eq	0xa810 <_stogir.checked.operands+0x88>
    a7f4:      	mov	x1, x5
    a7f8:      	movz	x7, #0x0, lsl #48
    a7fc:      	b	0xa820 <_stogir.checked.operands+0x98>
    a800:      	movz	x4, #0x0, lsl #48
    a804:      	b	0xa874 <_stogir.checked.operands+0xec>
    a808:      	movz	x4, #0x0, lsl #48
    a80c:      	b	0xa888 <_stogir.checked.operands+0x100>
    a810:      	adrp	x16, 0xa000 <_stogir.vector.store-inputs+0xb4>
		000000000000a810:  ARM64_RELOC_PAGE21	l_stogir.422
    a814:      	ldr	x16, [x16]
		000000000000a814:  ARM64_RELOC_PAGEOFF12	l_stogir.422
    a818:      	orr	x1, x16, xzr
    a81c:      	mov	x7, #0x36               ; =54
    a820:      	orr	x9, x2, xzr
    a824:      	adrp	x16, 0xa000 <_stogir.vector.store-inputs+0xb4>
		000000000000a824:  ARM64_RELOC_PAGE21	l_stogir.423
    a828:      	ldr	x16, [x16]
		000000000000a828:  ARM64_RELOC_PAGEOFF12	l_stogir.423
    a82c:      	orr	x10, x16, xzr
    a830:      	adrp	x16, 0xa000 <_stogir.vector.store-inputs+0xb4>
		000000000000a830:  ARM64_RELOC_PAGE21	l_stogir.424
    a834:      	ldr	x16, [x16]
		000000000000a834:  ARM64_RELOC_PAGEOFF12	l_stogir.424
    a838:      	orr	x11, x16, xzr
    a83c:      	lsr	w3, w3, #0
    a840:      	lsr	w4, w4, #0
    a844:      	add	x12, x0, #0x78
    a848:      	add	x13, x0, #0x28
    a84c:      	add	x14, x0, #0x50
    a850:      	str	w3, [x6]
    a854:      	str	w4, [x6, #0x4]
    a858:      	ldr	x3, [x6]
    a85c:      	str	x3, [x2]
    a860:      	mov	x20, x1
    a864:      	mov	x21, x7
    a868:      	movz	x1, #0x0, lsl #48
    a86c:      	b	0xa930 <_stogir.checked.operands+0x1a8>
    a870:      	movz	x4, #0x0, lsl #48
    a874:      	fmov	d31, x3
    a878:      	mov	x3, x4
    a87c:      	fmov	x4, d31
    a880:      	b	0xa894 <_stogir.checked.operands+0x10c>
    a884:      	movz	x4, #0x0, lsl #48
    a888:      	fmov	d31, x3
    a88c:      	mov	x3, x4
    a890:      	fmov	x4, d31
    a894:      	cmp	x3, #0x0
    a898:      	b.eq	0xa8d8 <_stogir.checked.operands+0x150>
    a89c:      	uxtb	w16, w1
    a8a0:      	cmp	w16, wzr
    a8a4:      	b.eq	0xa8bc <_stogir.checked.operands+0x134>
    a8a8:      	lsl	x1, x2, #4
    a8ac:      	ldr	x2, [x0]
    a8b0:      	add	x1, x1, x2
    a8b4:      	ldr	x1, [x1]
    a8b8:      	b	0xa8cc <_stogir.checked.operands+0x144>
    a8bc:      	lsl	x1, x6, #4
    a8c0:      	ldr	x2, [x0, #0x28]
    a8c4:      	add	x1, x1, x2
    a8c8:      	ldr	x1, [x1]
    a8cc:      	mov	x2, x1
    a8d0:      	mov	x1, #0x1                ; =1
    a8d4:      	b	0xa8e0 <_stogir.checked.operands+0x158>
    a8d8:      	movz	x1, #0x0, lsl #48
    a8dc:      	movz	x2, #0x0, lsl #48
    a8e0:      	lsr	w1, w1, #0
    a8e4:      	lsr	x16, x1, #0
    a8e8:      	cmp	x16, #0x1
    a8ec:      	b.eq	0xa908 <_stogir.checked.operands+0x180>
    a8f0:      	b.lo	0xa8f8 <_stogir.checked.operands+0x170>
    a8f4:      	b	0xa90c <_stogir.checked.operands+0x184>
    a8f8:      	cmp	x16, #0x0
    a8fc:      	b.eq	0xa904 <_stogir.checked.operands+0x17c>
    a900:      	b	0xa90c <_stogir.checked.operands+0x184>
    a904:      	b	0xa910 <_stogir.checked.operands+0x188>
    a908:      	b	0xaad0 <_stogir.checked.operands+0x348>
    a90c:      	b	0xaafc <_stogir.checked.operands+0x374>
    a910:      	mov	x1, x10
    a914:      	mov	x2, #0x22               ; =34
    a918:      	b	0xa924 <_stogir.checked.operands+0x19c>
    a91c:      	mov	x1, x11
    a920:      	mov	x2, #0x28               ; =40
    a924:      	mov	x20, x1
    a928:      	mov	x21, x2
    a92c:      	mov	x1, x4
    a930:      	cmp	x1, #0x2
    a934:      	b.ge	0xa960 <_stogir.checked.operands+0x1d8>
    a938:      	add	x2, x1, #0x1
    a93c:      	lsl	x1, x1, #2
    a940:      	add	x1, x1, x9
    a944:      	ldr	w1, [x1]
    a948:      	sxtw	x1, w1
    a94c:      	and	x1, x1, #0xffffffff
    a950:      	mov	x3, x2
    a954:      	mov	x2, x1
    a958:      	mov	x1, #0x1                ; =1
    a95c:      	b	0xa96c <_stogir.checked.operands+0x1e4>
    a960:      	mov	x3, x1
    a964:      	movz	x1, #0x0, lsl #48
    a968:      	movz	x2, #0x0, lsl #48
    a96c:      	lsr	w1, w1, #0
    a970:      	lsr	x16, x1, #0
    a974:      	cmp	x16, #0x1
    a978:      	b.eq	0xa994 <_stogir.checked.operands+0x20c>
    a97c:      	b.lo	0xa984 <_stogir.checked.operands+0x1fc>
    a980:      	b	0xa998 <_stogir.checked.operands+0x210>
    a984:      	cmp	x16, #0x0
    a988:      	b.eq	0xa990 <_stogir.checked.operands+0x208>
    a98c:      	b	0xa998 <_stogir.checked.operands+0x210>
    a990:      	b	0xaa00 <_stogir.checked.operands+0x278>
    a994:      	b	0xa99c <_stogir.checked.operands+0x214>
    a998:      	b	0xaaf4 <_stogir.checked.operands+0x36c>
    a99c:      	lsr	w2, w2, #0
    a9a0:      	sxtw	x2, w2
    a9a4:      	cmp	x2, #0x0
    a9a8:      	cset	w1, gt
    a9ac:      	movz	x16, #0x0, lsl #48
    a9b0:      	sub	x4, x16, x2
    a9b4:      	sub	x6, x4, #0x1
    a9b8:      	uxtb	w16, w1
    a9bc:      	cmp	w16, wzr
    a9c0:      	b.eq	0xaa28 <_stogir.checked.operands+0x2a0>
    a9c4:      	ldr	x4, [x0, #0x8]
    a9c8:      	cmp	x2, x4
    a9cc:      	b.ge	0xa870 <_stogir.checked.operands+0xe8>
    a9d0:      	ldr	x4, [x12, #0x8]
    a9d4:      	cmp	x2, x4
    a9d8:      	b.ge	0xa800 <_stogir.checked.operands+0x78>
    a9dc:      	lsl	x4, x2, #2
    a9e0:      	ldr	x7, [x0, #0x78]
    a9e4:      	add	x4, x4, x7
    a9e8:      	ldr	w4, [x4]
    a9ec:      	sxtw	x4, w4
    a9f0:      	cmp	x4, #0x0
    a9f4:      	cset	w4, ge
    a9f8:      	ubfx	x4, x4, #0, #8
    a9fc:      	b	0xa804 <_stogir.checked.operands+0x7c>
    aa00:      	cmp	x21, #0x0
    aa04:      	b.ne	0xab04 <_stogir.checked.operands+0x37c>
    aa08:      	cmp	x21, #0x0
    aa0c:      	b.ne	0xaa6c <_stogir.checked.operands+0x2e4>
    aa10:      	mov	x22, x8
    aa14:      	and	x0, x19, #0xffffffff
    aa18:      	mov	x1, x0
    aa1c:      	movz	x0, #0x0, lsl #48
    aa20:      	movz	x2, #0x0, lsl #48
    aa24:      	b	0xaaa0 <_stogir.checked.operands+0x318>
    aa28:      	cmp	x2, #0x0
    aa2c:      	b.ge	0xa884 <_stogir.checked.operands+0xfc>
    aa30:      	ldr	x7, [x13, #0x8]
    aa34:      	ldr	x15, [x14, #0x8]
    aa38:      	cmp	x7, x15
    aa3c:      	b.ne	0xa808 <_stogir.checked.operands+0x80>
    aa40:      	cmp	x4, x7
    aa44:      	b.gt	0xaaec <_stogir.checked.operands+0x364>
    aa48:      	lsl	x4, x6, #2
    aa4c:      	ldr	x7, [x0, #0x50]
    aa50:      	add	x4, x4, x7
    aa54:      	ldr	w4, [x4]
    aa58:      	sxtw	x4, w4
    aa5c:      	cmp	x4, #0x0
    aa60:      	cset	w4, gt
    aa64:      	ubfx	x4, x4, #0, #8
    aa68:      	b	0xaaf0 <_stogir.checked.operands+0x368>
    aa6c:      	lsr	x0, x21, #0
    aa70:      	mov	x1, x5
    aa74:      	mov	x2, x0
    aa78:      	mov	x0, x20
    aa7c:      	mov	x22, x8
    aa80:      	bl	0xaa80 <_stogir.checked.operands+0x2f8>
		000000000000aa80:  ARM64_RELOC_BRANCH26	_memcmp
    aa84:      	lsr	w0, w0, #0
    aa88:      	sxtw	x0, w0
    aa8c:      	cmp	x0, #0x0
    aa90:      	b.eq	0xaa14 <_stogir.checked.operands+0x28c>
    aa94:      	mov	x1, x20
    aa98:      	mov	x2, x21
    aa9c:      	mov	x0, #0x1                ; =1
    aaa0:      	str	x0, [x22]
    aaa4:      	str	x1, [x22, #0x8]
    aaa8:      	str	x2, [x22, #0x10]
    aaac:      	sub	sp, x29, #0x0
    aab0:      	ldr	x19, [sp, #0x10]
    aab4:      	ldr	x20, [sp, #0x18]
    aab8:      	ldr	x21, [sp, #0x20]
    aabc:      	ldr	x22, [sp, #0x28]
    aac0:      	ldr	x29, [sp]
    aac4:      	ldr	x30, [sp, #0x8]
    aac8:      	add	sp, sp, #0x30
    aacc:      	ret
    aad0:      	lsr	w2, w2, #0
    aad4:      	ubfx	x1, x2, #8, #8
    aad8:      	cmp	x1, x19
    aadc:      	b.ne	0xa91c <_stogir.checked.operands+0x194>
    aae0:      	mov	x1, x20
    aae4:      	mov	x2, x21
    aae8:      	b	0xa924 <_stogir.checked.operands+0x19c>
    aaec:      	movz	x4, #0x0, lsl #48
    aaf0:      	b	0xa80c <_stogir.checked.operands+0x84>
    aaf4:      	brk	#0
    aaf8:      	b	0xaaf4 <_stogir.checked.operands+0x36c>
    aafc:      	brk	#0
    ab00:      	b	0xaafc <_stogir.checked.operands+0x374>
    ab04:      	mov	x22, x8
    ab08:      	b	0xaa94 <_stogir.checked.operands+0x30c>

000000000000ab0c <_stogir.opcode.control?>:
    ab0c:      	sxtw	x0, w0
    ab10:      	cmp	x0, #0x0
    ab14:      	b.lt	0xab3c <_stogir.opcode.control?+0x30>
    ab18:      	cmp	x0, #0x83
    ab1c:      	b.ge	0xab3c <_stogir.opcode.control?+0x30>
    ab20:      	adrp	x16, 0xa000 <_stogir.vector.store-inputs+0xb4>
		000000000000ab20:  ARM64_RELOC_PAGE21	l_stogir.425
    ab24:      	ldr	x16, [x16]
		000000000000ab24:  ARM64_RELOC_PAGEOFF12	l_stogir.425
    ab28:      	orr	x1, x16, xzr
    ab2c:      	lsr	x0, x0, #0
    ab30:      	add	x0, x0, x1
    ab34:      	ldrb	w0, [x0]
    ab38:      	b	0xab40 <_stogir.opcode.control?+0x34>
    ab3c:      	movz	x0, #0x0, lsl #48
    ab40:      	uxtb	w0, w0
    ab44:      	and	x0, x0, #0x1
    ab48:      	uxtb	w0, w0
    ab4c:      	ret

000000000000ab50 <_stogir.opcode.block-end?>:
    ab50:      	sxtw	x0, w0
    ab54:      	cmp	x0, #0x0
    ab58:      	b.lt	0xab80 <_stogir.opcode.block-end?+0x30>
    ab5c:      	cmp	x0, #0x83
    ab60:      	b.ge	0xab80 <_stogir.opcode.block-end?+0x30>
    ab64:      	adrp	x16, 0xa000 <_stogir.vector.store-inputs+0xb4>
		000000000000ab64:  ARM64_RELOC_PAGE21	l_stogir.426
    ab68:      	ldr	x16, [x16]
		000000000000ab68:  ARM64_RELOC_PAGEOFF12	l_stogir.426
    ab6c:      	orr	x1, x16, xzr
    ab70:      	lsr	x0, x0, #0
    ab74:      	add	x0, x0, x1
    ab78:      	ldrb	w0, [x0]
    ab7c:      	b	0xab84 <_stogir.opcode.block-end?+0x34>
    ab80:      	movz	x0, #0x0, lsl #48
    ab84:      	uxtb	w0, w0
    ab88:      	and	x0, x0, #0x4
    ab8c:      	uxtb	w0, w0
    ab90:      	cmp	x0, #0x0
    ab94:      	cset	w0, eq
    ab98:      	uxtb	w16, w0
    ab9c:      	cmp	w16, wzr
    aba0:      	cset	x0, eq
    aba4:      	ret

000000000000aba8 <_stogir.atomic.ordinary?>:
    aba8:      	sxtw	x1, w1
    abac:      	cmp	x1, #0x0
    abb0:      	cset	w3, gt
    abb4:      	movz	x16, #0x0, lsl #48
    abb8:      	sub	x4, x16, x1
    abbc:      	sub	x5, x4, #0x1
    abc0:      	uxtb	w16, w3
    abc4:      	cmp	w16, wzr
    abc8:      	b.eq	0xac0c <_stogir.atomic.ordinary?+0x64>
    abcc:      	ldr	x4, [x0, #0x8]
    abd0:      	cmp	x1, x4
    abd4:      	b.ge	0xac60 <_stogir.atomic.ordinary?+0xb8>
    abd8:      	add	x4, x0, #0x78
    abdc:      	ldr	x4, [x4, #0x8]
    abe0:      	cmp	x1, x4
    abe4:      	b.ge	0xad20 <_stogir.atomic.ordinary?+0x178>
    abe8:      	lsl	x4, x1, #2
    abec:      	ldr	x6, [x0, #0x78]
    abf0:      	add	x4, x4, x6
    abf4:      	ldr	w4, [x4]
    abf8:      	sxtw	x4, w4
    abfc:      	cmp	x4, #0x0
    ac00:      	cset	w4, ge
    ac04:      	ubfx	x4, x4, #0, #8
    ac08:      	b	0xad24 <_stogir.atomic.ordinary?+0x17c>
    ac0c:      	cmp	x1, #0x0
    ac10:      	b.ge	0xac68 <_stogir.atomic.ordinary?+0xc0>
    ac14:      	add	x6, x0, #0x28
    ac18:      	add	x7, x0, #0x50
    ac1c:      	ldr	x6, [x6, #0x8]
    ac20:      	ldr	x7, [x7, #0x8]
    ac24:      	cmp	x6, x7
    ac28:      	b.ne	0xac58 <_stogir.atomic.ordinary?+0xb0>
    ac2c:      	cmp	x4, x6
    ac30:      	b.gt	0xad40 <_stogir.atomic.ordinary?+0x198>
    ac34:      	lsl	x4, x5, #2
    ac38:      	ldr	x6, [x0, #0x50]
    ac3c:      	add	x4, x4, x6
    ac40:      	ldr	w4, [x4]
    ac44:      	sxtw	x4, w4
    ac48:      	cmp	x4, #0x0
    ac4c:      	cset	w4, gt
    ac50:      	ubfx	x4, x4, #0, #8
    ac54:      	b	0xad44 <_stogir.atomic.ordinary?+0x19c>
    ac58:      	movz	x4, #0x0, lsl #48
    ac5c:      	b	0xac6c <_stogir.atomic.ordinary?+0xc4>
    ac60:      	movz	x4, #0x0, lsl #48
    ac64:      	b	0xac6c <_stogir.atomic.ordinary?+0xc4>
    ac68:      	movz	x4, #0x0, lsl #48
    ac6c:      	cmp	x4, #0x0
    ac70:      	b.eq	0xacb0 <_stogir.atomic.ordinary?+0x108>
    ac74:      	uxtb	w16, w3
    ac78:      	cmp	w16, wzr
    ac7c:      	b.eq	0xac94 <_stogir.atomic.ordinary?+0xec>
    ac80:      	lsl	x1, x1, #4
    ac84:      	ldr	x0, [x0]
    ac88:      	add	x0, x1, x0
    ac8c:      	ldr	x0, [x0]
    ac90:      	b	0xaca4 <_stogir.atomic.ordinary?+0xfc>
    ac94:      	lsl	x1, x5, #4
    ac98:      	ldr	x0, [x0, #0x28]
    ac9c:      	add	x0, x1, x0
    aca0:      	ldr	x0, [x0]
    aca4:      	mov	x1, x0
    aca8:      	mov	x0, #0x1                ; =1
    acac:      	b	0xacb8 <_stogir.atomic.ordinary?+0x110>
    acb0:      	movz	x0, #0x0, lsl #48
    acb4:      	movz	x1, #0x0, lsl #48
    acb8:      	lsr	w0, w0, #0
    acbc:      	lsr	x16, x0, #0
    acc0:      	cmp	x16, #0x1
    acc4:      	b.eq	0xace0 <_stogir.atomic.ordinary?+0x138>
    acc8:      	b.lo	0xacd0 <_stogir.atomic.ordinary?+0x128>
    accc:      	b	0xace4 <_stogir.atomic.ordinary?+0x13c>
    acd0:      	cmp	x16, #0x0
    acd4:      	b.eq	0xacdc <_stogir.atomic.ordinary?+0x134>
    acd8:      	b	0xace4 <_stogir.atomic.ordinary?+0x13c>
    acdc:      	b	0xace8 <_stogir.atomic.ordinary?+0x140>
    ace0:      	b	0xacf8 <_stogir.atomic.ordinary?+0x150>
    ace4:      	b	0xad48 <_stogir.atomic.ordinary?+0x1a0>
    ace8:      	movz	x0, #0x0, lsl #48
    acec:      	b	0xacf4 <_stogir.atomic.ordinary?+0x14c>
    acf0:      	movz	x0, #0x0, lsl #48
    acf4:      	ret
    acf8:      	sxtw	x2, w2
    acfc:      	lsr	w0, w1, #0
    ad00:      	ubfx	x0, x0, #8, #8
    ad04:      	cmp	x0, x2
    ad08:      	b.ne	0xacf0 <_stogir.atomic.ordinary?+0x148>
    ad0c:      	uxtb	w1, w1
    ad10:      	cmp	x1, #0x46
    ad14:      	b.ne	0xad28 <_stogir.atomic.ordinary?+0x180>
    ad18:      	movz	x0, #0x0, lsl #48
    ad1c:      	b	0xad3c <_stogir.atomic.ordinary?+0x194>
    ad20:      	movz	x4, #0x0, lsl #48
    ad24:      	b	0xac64 <_stogir.atomic.ordinary?+0xbc>
    ad28:      	cmp	x1, #0x48
    ad2c:      	cset	w0, eq
    ad30:      	uxtb	w16, w0
    ad34:      	cmp	w16, wzr
    ad38:      	cset	x0, eq
    ad3c:      	b	0xacf4 <_stogir.atomic.ordinary?+0x14c>
    ad40:      	movz	x4, #0x0, lsl #48
    ad44:      	b	0xac5c <_stogir.atomic.ordinary?+0xb4>
    ad48:      	brk	#0
    ad4c:      	b	0xad48 <_stogir.atomic.ordinary?+0x1a0>

000000000000ad50 <_stogir.types.scalar-size>:
    ad50:      	sxtw	x1, w1
    ad54:      	cmp	x1, #0x4
    ad58:      	b.eq	0xad6c <_stogir.types.scalar-size+0x1c>
    ad5c:      	cmp	x1, #0x8
    ad60:      	b.eq	0xad6c <_stogir.types.scalar-size+0x1c>
    ad64:      	movn	x0, #0x0, lsl #48
    ad68:      	b	0xad84 <_stogir.types.scalar-size+0x34>
    ad6c:      	sxtw	x0, w0
    ad70:      	cmp	x0, #0x0
    ad74:      	b.ne	0xad88 <_stogir.types.scalar-size+0x38>
    ad78:      	movz	x0, #0x0, lsl #48
    ad7c:      	b	0xad84 <_stogir.types.scalar-size+0x34>
    ad80:      	mov	x0, #0x1                ; =1
    ad84:      	ret
    ad88:      	cmp	x0, #0x1
    ad8c:      	b.eq	0xad80 <_stogir.types.scalar-size+0x30>
    ad90:      	cmp	x0, #0x2
    ad94:      	b.eq	0xad80 <_stogir.types.scalar-size+0x30>
    ad98:      	cmp	x0, #0x7
    ad9c:      	b.eq	0xad80 <_stogir.types.scalar-size+0x30>
    ada0:      	cmp	x0, #0x8
    ada4:      	b.eq	0xad80 <_stogir.types.scalar-size+0x30>
    ada8:      	cmp	x0, #0x3
    adac:      	b.eq	0xadf8 <_stogir.types.scalar-size+0xa8>
    adb0:      	cmp	x0, #0x9
    adb4:      	b.eq	0xadf8 <_stogir.types.scalar-size+0xa8>
    adb8:      	cmp	x0, #0x4
    adbc:      	b.eq	0xae00 <_stogir.types.scalar-size+0xb0>
    adc0:      	cmp	x0, #0xa
    adc4:      	b.eq	0xae00 <_stogir.types.scalar-size+0xb0>
    adc8:      	cmp	x0, #0xd
    adcc:      	b.eq	0xae00 <_stogir.types.scalar-size+0xb0>
    add0:      	cmp	x0, #0x5
    add4:      	b.eq	0xae08 <_stogir.types.scalar-size+0xb8>
    add8:      	cmp	x0, #0xb
    addc:      	b.eq	0xae08 <_stogir.types.scalar-size+0xb8>
    ade0:      	cmp	x0, #0xc
    ade4:      	b.eq	0xae08 <_stogir.types.scalar-size+0xb8>
    ade8:      	cmp	x0, #0x6
    adec:      	b.ne	0xae10 <_stogir.types.scalar-size+0xc0>
    adf0:      	mov	x0, x1
    adf4:      	b	0xae14 <_stogir.types.scalar-size+0xc4>
    adf8:      	mov	x0, #0x2                ; =2
    adfc:      	b	0xad84 <_stogir.types.scalar-size+0x34>
    ae00:      	mov	x0, #0x4                ; =4
    ae04:      	b	0xadfc <_stogir.types.scalar-size+0xac>
    ae08:      	mov	x0, #0x8                ; =8
    ae0c:      	b	0xae04 <_stogir.types.scalar-size+0xb4>
    ae10:      	movn	x0, #0x0, lsl #48
    ae14:      	b	0xae0c <_stogir.types.scalar-size+0xbc>

000000000000ae18 <_stogir.terminal.inputs>:
    ae18:      	sub	sp, sp, #0x10
    ae1c:      	str	x29, [sp]
    ae20:      	str	x30, [sp, #0x8]
    ae24:      	mov	x29, sp
    ae28:      	sub	sp, sp, #0x10
    ae2c:      	mov	x4, sp
    ae30:      	sxtw	x1, w1
    ae34:      	cmp	x1, #0x60
    ae38:      	cset	w5, eq
    ae3c:      	uxtb	w16, w5
    ae40:      	cmp	w16, wzr
    ae44:      	b.ne	0xae88 <_stogir.terminal.inputs+0x70>
    ae48:      	cmp	x1, #0x79
    ae4c:      	b.eq	0xae88 <_stogir.terminal.inputs+0x70>
    ae50:      	adrp	x16, 0xa000 <_stogir.vector.store-inputs+0xb4>
		000000000000ae50:  ARM64_RELOC_PAGE21	l_stogir.427
    ae54:      	ldr	x16, [x16]
		000000000000ae54:  ARM64_RELOC_PAGEOFF12	l_stogir.427
    ae58:      	orr	x0, x16, xzr
    ae5c:      	mov	x1, x0
    ae60:      	mov	x0, #0x1                ; =1
    ae64:      	mov	x2, #0x25               ; =37
    ae68:      	str	x0, [x8]
    ae6c:      	str	x1, [x8, #0x8]
    ae70:      	str	x2, [x8, #0x10]
    ae74:      	sub	sp, x29, #0x0
    ae78:      	ldr	x29, [sp]
    ae7c:      	ldr	x30, [sp, #0x8]
    ae80:      	add	sp, sp, #0x10
    ae84:      	ret
    ae88:      	sxtw	x3, w3
    ae8c:      	uxtb	w16, w5
    ae90:      	cmp	w16, wzr
    ae94:      	b.eq	0xaea0 <_stogir.terminal.inputs+0x88>
    ae98:      	cmp	x3, #0x0
    ae9c:      	b.ne	0xae50 <_stogir.terminal.inputs+0x38>
    aea0:      	sxtw	x2, w2
    aea4:      	cmp	x2, #0x0
    aea8:      	cset	w1, gt
    aeac:      	movz	x16, #0x0, lsl #48
    aeb0:      	sub	x5, x16, x2
    aeb4:      	sub	x6, x5, #0x1
    aeb8:      	uxtb	w16, w1
    aebc:      	cmp	w16, wzr
    aec0:      	b.eq	0xafd0 <_stogir.terminal.inputs+0x1b8>
    aec4:      	ldr	x5, [x0, #0x8]
    aec8:      	cmp	x2, x5
    aecc:      	b.ge	0xafc8 <_stogir.terminal.inputs+0x1b0>
    aed0:      	add	x5, x0, #0x78
    aed4:      	ldr	x5, [x5, #0x8]
    aed8:      	cmp	x2, x5
    aedc:      	b.ge	0xb074 <_stogir.terminal.inputs+0x25c>
    aee0:      	lsl	x5, x2, #2
    aee4:      	ldr	x7, [x0, #0x78]
    aee8:      	add	x5, x5, x7
    aeec:      	ldr	w5, [x5]
    aef0:      	sxtw	x5, w5
    aef4:      	cmp	x5, #0x0
    aef8:      	cset	w5, ge
    aefc:      	ubfx	x5, x5, #0, #8
    af00:      	b	0xb078 <_stogir.terminal.inputs+0x260>
    af04:      	movz	x1, #0x0, lsl #48
    af08:      	movz	x5, #0x0, lsl #48
    af0c:      	movz	x6, #0x0, lsl #48
    af10:      	lsr	w1, w1, #0
    af14:      	lsr	x16, x1, #0
    af18:      	cmp	x16, #0x1
    af1c:      	b.eq	0xaf38 <_stogir.terminal.inputs+0x120>
    af20:      	b.lo	0xaf28 <_stogir.terminal.inputs+0x110>
    af24:      	b	0xaf3c <_stogir.terminal.inputs+0x124>
    af28:      	cmp	x16, #0x0
    af2c:      	b.eq	0xaf34 <_stogir.terminal.inputs+0x11c>
    af30:      	b	0xaf3c <_stogir.terminal.inputs+0x124>
    af34:      	b	0xaf40 <_stogir.terminal.inputs+0x128>
    af38:      	b	0xb01c <_stogir.terminal.inputs+0x204>
    af3c:      	b	0xb1d0 <_stogir.terminal.inputs+0x3b8>
    af40:      	adrp	x16, 0xa000 <_stogir.vector.store-inputs+0xb4>
		000000000000af40:  ARM64_RELOC_PAGE21	l_stogir.428
    af44:      	ldr	x16, [x16]
		000000000000af44:  ARM64_RELOC_PAGEOFF12	l_stogir.428
    af48:      	orr	x0, x16, xzr
    af4c:      	mov	x1, x0
    af50:      	mov	x0, #0x1                ; =1
    af54:      	mov	x2, #0x1d               ; =29
    af58:      	b	0xae68 <_stogir.terminal.inputs+0x50>
    af5c:      	lsl	x1, x6, #4
    af60:      	ldr	x5, [x0, #0x28]
    af64:      	add	x1, x1, x5
    af68:      	ldr	x5, [x1]
    af6c:      	ldr	x1, [x1, #0x8]
    af70:      	fmov	d31, x1
    af74:      	mov	x1, x5
    af78:      	fmov	x5, d31
    af7c:      	mov	x6, x5
    af80:      	mov	x5, x1
    af84:      	mov	x1, #0x1                ; =1
    af88:      	b	0xaf10 <_stogir.terminal.inputs+0xf8>
    af8c:      	movz	x5, #0x0, lsl #48
    af90:      	cmp	x5, #0x0
    af94:      	b.eq	0xaf04 <_stogir.terminal.inputs+0xec>
    af98:      	uxtb	w16, w1
    af9c:      	cmp	w16, wzr
    afa0:      	b.eq	0xaf5c <_stogir.terminal.inputs+0x144>
    afa4:      	lsl	x1, x2, #4
    afa8:      	ldr	x5, [x0]
    afac:      	add	x1, x1, x5
    afb0:      	ldr	x5, [x1]
    afb4:      	ldr	x1, [x1, #0x8]
    afb8:      	fmov	d31, x1
    afbc:      	mov	x1, x5
    afc0:      	fmov	x5, d31
    afc4:      	b	0xaf7c <_stogir.terminal.inputs+0x164>
    afc8:      	movz	x5, #0x0, lsl #48
    afcc:      	b	0xaf90 <_stogir.terminal.inputs+0x178>
    afd0:      	cmp	x2, #0x0
    afd4:      	b.ge	0xaf8c <_stogir.terminal.inputs+0x174>
    afd8:      	add	x7, x0, #0x28
    afdc:      	add	x9, x0, #0x50
    afe0:      	ldr	x7, [x7, #0x8]
    afe4:      	ldr	x9, [x9, #0x8]
    afe8:      	cmp	x7, x9
    afec:      	b.ne	0xb06c <_stogir.terminal.inputs+0x254>
    aff0:      	cmp	x5, x7
    aff4:      	b.gt	0xb07c <_stogir.terminal.inputs+0x264>
    aff8:      	lsl	x5, x6, #2
    affc:      	ldr	x7, [x0, #0x50]
    b000:      	add	x5, x5, x7
    b004:      	ldr	w5, [x5]
    b008:      	sxtw	x5, w5
    b00c:      	cmp	x5, #0x0
    b010:      	cset	w5, gt
    b014:      	ubfx	x5, x5, #0, #8
    b018:      	b	0xb080 <_stogir.terminal.inputs+0x268>
    b01c:      	str	x5, [x4]
    b020:      	str	x6, [x4, #0x8]
    b024:      	cmp	x2, #0x0
    b028:      	b.le	0xb050 <_stogir.terminal.inputs+0x238>
    b02c:      	uxtb	w5, w5
    b030:      	cmp	x5, #0x83
    b034:      	b.ge	0xb084 <_stogir.terminal.inputs+0x26c>
    b038:      	adrp	x16, 0xb000 <_stogir.terminal.inputs+0x1e8>
		000000000000b038:  ARM64_RELOC_PAGE21	l_stogir.429
    b03c:      	ldr	x16, [x16]
		000000000000b03c:  ARM64_RELOC_PAGEOFF12	l_stogir.429
    b040:      	orr	x1, x16, xzr
    b044:      	add	x1, x5, x1
    b048:      	ldrb	w1, [x1]
    b04c:      	b	0xb088 <_stogir.terminal.inputs+0x270>
    b050:      	adrp	x16, 0xb000 <_stogir.terminal.inputs+0x1e8>
		000000000000b050:  ARM64_RELOC_PAGE21	l_stogir.430
    b054:      	ldr	x16, [x16]
		000000000000b054:  ARM64_RELOC_PAGEOFF12	l_stogir.430
    b058:      	orr	x0, x16, xzr
    b05c:      	mov	x1, x0
    b060:      	mov	x0, #0x1                ; =1
    b064:      	mov	x2, #0x2c               ; =44
    b068:      	b	0xaf58 <_stogir.terminal.inputs+0x140>
    b06c:      	movz	x5, #0x0, lsl #48
    b070:      	b	0xaf90 <_stogir.terminal.inputs+0x178>
    b074:      	movz	x5, #0x0, lsl #48
    b078:      	b	0xafcc <_stogir.terminal.inputs+0x1b4>
    b07c:      	movz	x5, #0x0, lsl #48
    b080:      	b	0xb070 <_stogir.terminal.inputs+0x258>
    b084:      	movz	x1, #0x0, lsl #48
    b088:      	uxtb	w1, w1
    b08c:      	and	x1, x1, #0x1
    b090:      	uxtb	w1, w1
    b094:      	cmp	x1, #0x0
    b098:      	b.eq	0xb050 <_stogir.terminal.inputs+0x238>
    b09c:      	ldr	w1, [x4]
    b0a0:      	uxtb	w1, w1
    b0a4:      	cmp	x1, #0x83
    b0a8:      	b.ge	0xb0c4 <_stogir.terminal.inputs+0x2ac>
    b0ac:      	adrp	x16, 0xb000 <_stogir.terminal.inputs+0x1e8>
		000000000000b0ac:  ARM64_RELOC_PAGE21	l_stogir.429
    b0b0:      	ldr	x16, [x16]
		000000000000b0b0:  ARM64_RELOC_PAGEOFF12	l_stogir.429
    b0b4:      	orr	x2, x16, xzr
    b0b8:      	add	x1, x1, x2
    b0bc:      	ldrb	w1, [x1]
    b0c0:      	b	0xb0c8 <_stogir.terminal.inputs+0x2b0>
    b0c4:      	movz	x1, #0x0, lsl #48
    b0c8:      	uxtb	w1, w1
    b0cc:      	and	x1, x1, #0x4
    b0d0:      	uxtb	w1, w1
    b0d4:      	cmp	x1, #0x0
    b0d8:      	cset	w1, eq
    b0dc:      	uxtb	w16, w1
    b0e0:      	cmp	w16, wzr
    b0e4:      	cset	x1, eq
    b0e8:      	cmp	x1, #0x0
    b0ec:      	b.ne	0xb050 <_stogir.terminal.inputs+0x238>
    b0f0:      	cmp	x3, #0x0
    b0f4:      	b.ne	0xb108 <_stogir.terminal.inputs+0x2f0>
    b0f8:      	movz	x0, #0x0, lsl #48
    b0fc:      	movz	x1, #0x0, lsl #48
    b100:      	movz	x2, #0x0, lsl #48
    b104:      	b	0xb068 <_stogir.terminal.inputs+0x250>
    b108:      	cmp	x3, #0x0
    b10c:      	cset	w1, gt
    b110:      	movz	x16, #0x0, lsl #48
    b114:      	sub	x2, x16, x3
    b118:      	sub	x4, x2, #0x1
    b11c:      	uxtb	w16, w1
    b120:      	cmp	w16, wzr
    b124:      	b.eq	0xb184 <_stogir.terminal.inputs+0x36c>
    b128:      	ldr	x2, [x0, #0x8]
    b12c:      	cmp	x3, x2
    b130:      	b.ge	0xb1d8 <_stogir.terminal.inputs+0x3c0>
    b134:      	add	x2, x0, #0x78
    b138:      	ldr	x2, [x2, #0x8]
    b13c:      	cmp	x3, x2
    b140:      	b.ge	0xb2b0 <_stogir.terminal.inputs+0x498>
    b144:      	lsl	x2, x3, #2
    b148:      	ldr	x5, [x0, #0x78]
    b14c:      	add	x2, x2, x5
    b150:      	ldr	w2, [x2]
    b154:      	sxtw	x2, w2
    b158:      	cmp	x2, #0x0
    b15c:      	cset	w2, ge
    b160:      	ubfx	x2, x2, #0, #8
    b164:      	b	0xb2b4 <_stogir.terminal.inputs+0x49c>
    b168:      	adrp	x16, 0xb000 <_stogir.terminal.inputs+0x1e8>
		000000000000b168:  ARM64_RELOC_PAGE21	l_stogir.431
    b16c:      	ldr	x16, [x16]
		000000000000b16c:  ARM64_RELOC_PAGEOFF12	l_stogir.431
    b170:      	orr	x0, x16, xzr
    b174:      	mov	x1, x0
    b178:      	mov	x0, #0x1                ; =1
    b17c:      	mov	x2, #0x2e               ; =46
    b180:      	b	0xb104 <_stogir.terminal.inputs+0x2ec>
    b184:      	cmp	x3, #0x0
    b188:      	b.ge	0xb1e0 <_stogir.terminal.inputs+0x3c8>
    b18c:      	add	x5, x0, #0x28
    b190:      	add	x6, x0, #0x50
    b194:      	ldr	x5, [x5, #0x8]
    b198:      	ldr	x6, [x6, #0x8]
    b19c:      	cmp	x5, x6
    b1a0:      	b.ne	0xb2a8 <_stogir.terminal.inputs+0x490>
    b1a4:      	cmp	x2, x5
    b1a8:      	b.gt	0xb2b8 <_stogir.terminal.inputs+0x4a0>
    b1ac:      	lsl	x2, x4, #2
    b1b0:      	ldr	x5, [x0, #0x50]
    b1b4:      	add	x2, x2, x5
    b1b8:      	ldr	w2, [x2]
    b1bc:      	sxtw	x2, w2
    b1c0:      	cmp	x2, #0x0
    b1c4:      	cset	w2, gt
    b1c8:      	ubfx	x2, x2, #0, #8
    b1cc:      	b	0xb2bc <_stogir.terminal.inputs+0x4a4>
    b1d0:      	brk	#0
    b1d4:      	b	0xb1d0 <_stogir.terminal.inputs+0x3b8>
    b1d8:      	movz	x2, #0x0, lsl #48
    b1dc:      	b	0xb1e4 <_stogir.terminal.inputs+0x3cc>
    b1e0:      	movz	x2, #0x0, lsl #48
    b1e4:      	cmp	x2, #0x0
    b1e8:      	b.eq	0xb228 <_stogir.terminal.inputs+0x410>
    b1ec:      	uxtb	w16, w1
    b1f0:      	cmp	w16, wzr
    b1f4:      	b.eq	0xb20c <_stogir.terminal.inputs+0x3f4>
    b1f8:      	lsl	x1, x3, #4
    b1fc:      	ldr	x0, [x0]
    b200:      	add	x0, x1, x0
    b204:      	ldr	x0, [x0]
    b208:      	b	0xb21c <_stogir.terminal.inputs+0x404>
    b20c:      	lsl	x1, x4, #4
    b210:      	ldr	x0, [x0, #0x28]
    b214:      	add	x0, x1, x0
    b218:      	ldr	x0, [x0]
    b21c:      	mov	x1, x0
    b220:      	mov	x0, #0x1                ; =1
    b224:      	b	0xb230 <_stogir.terminal.inputs+0x418>
    b228:      	movz	x0, #0x0, lsl #48
    b22c:      	movz	x1, #0x0, lsl #48
    b230:      	lsr	w0, w0, #0
    b234:      	lsr	x16, x0, #0
    b238:      	cmp	x16, #0x1
    b23c:      	b.eq	0xb258 <_stogir.terminal.inputs+0x440>
    b240:      	b.lo	0xb248 <_stogir.terminal.inputs+0x430>
    b244:      	b	0xb25c <_stogir.terminal.inputs+0x444>
    b248:      	cmp	x16, #0x0
    b24c:      	b.eq	0xb254 <_stogir.terminal.inputs+0x43c>
    b250:      	b	0xb25c <_stogir.terminal.inputs+0x444>
    b254:      	b	0xb260 <_stogir.terminal.inputs+0x448>
    b258:      	b	0xb27c <_stogir.terminal.inputs+0x464>
    b25c:      	b	0xb300 <_stogir.terminal.inputs+0x4e8>
    b260:      	adrp	x16, 0xb000 <_stogir.terminal.inputs+0x1e8>
		000000000000b260:  ARM64_RELOC_PAGE21	l_stogir.432
    b264:      	ldr	x16, [x16]
		000000000000b264:  ARM64_RELOC_PAGEOFF12	l_stogir.432
    b268:      	orr	x0, x16, xzr
    b26c:      	mov	x1, x0
    b270:      	mov	x0, #0x1                ; =1
    b274:      	mov	x2, #0x1d               ; =29
    b278:      	b	0xb180 <_stogir.terminal.inputs+0x368>
    b27c:      	cmp	x3, #0x0
    b280:      	b.le	0xb168 <_stogir.terminal.inputs+0x350>
    b284:      	uxtb	w1, w1
    b288:      	cmp	x1, #0x83
    b28c:      	b.ge	0xb2c0 <_stogir.terminal.inputs+0x4a8>
    b290:      	adrp	x16, 0xb000 <_stogir.terminal.inputs+0x1e8>
		000000000000b290:  ARM64_RELOC_PAGE21	l_stogir.429
    b294:      	ldr	x16, [x16]
		000000000000b294:  ARM64_RELOC_PAGEOFF12	l_stogir.429
    b298:      	orr	x0, x16, xzr
    b29c:      	add	x0, x1, x0
    b2a0:      	ldrb	w0, [x0]
    b2a4:      	b	0xb2c4 <_stogir.terminal.inputs+0x4ac>
    b2a8:      	movz	x2, #0x0, lsl #48
    b2ac:      	b	0xb1e4 <_stogir.terminal.inputs+0x3cc>
    b2b0:      	movz	x2, #0x0, lsl #48
    b2b4:      	b	0xb1dc <_stogir.terminal.inputs+0x3c4>
    b2b8:      	movz	x2, #0x0, lsl #48
    b2bc:      	b	0xb2ac <_stogir.terminal.inputs+0x494>
    b2c0:      	movz	x0, #0x0, lsl #48
    b2c4:      	uxtb	w0, w0
    b2c8:      	and	x0, x0, #0x8
    b2cc:      	uxtb	w0, w0
    b2d0:      	cmp	x0, #0x0
    b2d4:      	cset	w0, eq
    b2d8:      	uxtb	w16, w0
    b2dc:      	cmp	w16, wzr
    b2e0:      	cset	x0, eq
    b2e4:      	cmp	x0, #0x0
    b2e8:      	b.eq	0xb168 <_stogir.terminal.inputs+0x350>
    b2ec:      	and	x0, x3, #0xffffffff
    b2f0:      	mov	x1, x0
    b2f4:      	movz	x0, #0x0, lsl #48
    b2f8:      	movz	x2, #0x0, lsl #48
    b2fc:      	b	0xb180 <_stogir.terminal.inputs+0x368>
    b300:      	brk	#0
    b304:      	b	0xb300 <_stogir.terminal.inputs+0x4e8>

000000000000b308 <_stogir.switch.switch-inputs>:
    b308:      	sub	sp, sp, #0x10
    b30c:      	str	x29, [sp]
    b310:      	str	x30, [sp, #0x8]
    b314:      	mov	x29, sp
    b318:      	sub	sp, sp, #0x10
    b31c:      	mov	x3, sp
    b320:      	sxtw	x1, w1
    b324:      	cmp	x1, #0x0
    b328:      	cset	w4, gt
    b32c:      	movz	x16, #0x0, lsl #48
    b330:      	sub	x5, x16, x1
    b334:      	sub	x6, x5, #0x1
    b338:      	uxtb	w16, w4
    b33c:      	cmp	w16, wzr
    b340:      	b.eq	0xb384 <_stogir.switch.switch-inputs+0x7c>
    b344:      	ldr	x5, [x0, #0x8]
    b348:      	cmp	x1, x5
    b34c:      	b.ge	0xb3f4 <_stogir.switch.switch-inputs+0xec>
    b350:      	add	x5, x0, #0x78
    b354:      	ldr	x5, [x5, #0x8]
    b358:      	cmp	x1, x5
    b35c:      	b.ge	0xb510 <_stogir.switch.switch-inputs+0x208>
    b360:      	lsl	x5, x1, #2
    b364:      	ldr	x7, [x0, #0x78]
    b368:      	add	x5, x5, x7
    b36c:      	ldr	w5, [x5]
    b370:      	sxtw	x5, w5
    b374:      	cmp	x5, #0x0
    b378:      	cset	w5, ge
    b37c:      	ubfx	x5, x5, #0, #8
    b380:      	b	0xb514 <_stogir.switch.switch-inputs+0x20c>
    b384:      	cmp	x1, #0x0
    b388:      	b.ge	0xb3fc <_stogir.switch.switch-inputs+0xf4>
    b38c:      	add	x7, x0, #0x28
    b390:      	add	x9, x0, #0x50
    b394:      	ldr	x7, [x7, #0x8]
    b398:      	ldr	x9, [x9, #0x8]
    b39c:      	cmp	x7, x9
    b3a0:      	b.ne	0xb3d0 <_stogir.switch.switch-inputs+0xc8>
    b3a4:      	cmp	x5, x7
    b3a8:      	b.gt	0xb518 <_stogir.switch.switch-inputs+0x210>
    b3ac:      	lsl	x5, x6, #2
    b3b0:      	ldr	x7, [x0, #0x50]
    b3b4:      	add	x5, x5, x7
    b3b8:      	ldr	w5, [x5]
    b3bc:      	sxtw	x5, w5
    b3c0:      	cmp	x5, #0x0
    b3c4:      	cset	w5, gt
    b3c8:      	ubfx	x5, x5, #0, #8
    b3cc:      	b	0xb51c <_stogir.switch.switch-inputs+0x214>
    b3d0:      	movz	x5, #0x0, lsl #48
    b3d4:      	b	0xb400 <_stogir.switch.switch-inputs+0xf8>
    b3d8:      	adrp	x16, 0xb000 <_stogir.terminal.inputs+0x1e8>
		000000000000b3d8:  ARM64_RELOC_PAGE21	l_stogir.433
    b3dc:      	ldr	x16, [x16]
		000000000000b3dc:  ARM64_RELOC_PAGEOFF12	l_stogir.433
    b3e0:      	orr	x0, x16, xzr
    b3e4:      	mov	x1, x0
    b3e8:      	mov	x0, #0x1                ; =1
    b3ec:      	mov	x2, #0x16               ; =22
    b3f0:      	b	0xb4bc <_stogir.switch.switch-inputs+0x1b4>
    b3f4:      	movz	x5, #0x0, lsl #48
    b3f8:      	b	0xb400 <_stogir.switch.switch-inputs+0xf8>
    b3fc:      	movz	x5, #0x0, lsl #48
    b400:      	cmp	x5, #0x0
    b404:      	b.eq	0xb468 <_stogir.switch.switch-inputs+0x160>
    b408:      	uxtb	w16, w4
    b40c:      	cmp	w16, wzr
    b410:      	b.eq	0xb438 <_stogir.switch.switch-inputs+0x130>
    b414:      	lsl	x4, x1, #4
    b418:      	ldr	x5, [x0]
    b41c:      	add	x4, x4, x5
    b420:      	ldr	x5, [x4]
    b424:      	ldr	x4, [x4, #0x8]
    b428:      	fmov	d31, x4
    b42c:      	mov	x4, x5
    b430:      	fmov	x5, d31
    b434:      	b	0xb458 <_stogir.switch.switch-inputs+0x150>
    b438:      	lsl	x4, x6, #4
    b43c:      	ldr	x5, [x0, #0x28]
    b440:      	add	x4, x4, x5
    b444:      	ldr	x5, [x4]
    b448:      	ldr	x4, [x4, #0x8]
    b44c:      	fmov	d31, x4
    b450:      	mov	x4, x5
    b454:      	fmov	x5, d31
    b458:      	mov	x6, x5
    b45c:      	mov	x5, x4
    b460:      	mov	x4, #0x1                ; =1
    b464:      	b	0xb474 <_stogir.switch.switch-inputs+0x16c>
    b468:      	movz	x4, #0x0, lsl #48
    b46c:      	movz	x5, #0x0, lsl #48
    b470:      	movz	x6, #0x0, lsl #48
    b474:      	lsr	w4, w4, #0
    b478:      	lsr	x16, x4, #0
    b47c:      	cmp	x16, #0x1
    b480:      	b.eq	0xb49c <_stogir.switch.switch-inputs+0x194>
    b484:      	b.lo	0xb48c <_stogir.switch.switch-inputs+0x184>
    b488:      	b	0xb4a0 <_stogir.switch.switch-inputs+0x198>
    b48c:      	cmp	x16, #0x0
    b490:      	b.eq	0xb498 <_stogir.switch.switch-inputs+0x190>
    b494:      	b	0xb4a0 <_stogir.switch.switch-inputs+0x198>
    b498:      	b	0xb4a4 <_stogir.switch.switch-inputs+0x19c>
    b49c:      	b	0xb4dc <_stogir.switch.switch-inputs+0x1d4>
    b4a0:      	b	0xb78c <_stogir.switch.switch-inputs+0x484>
    b4a4:      	adrp	x16, 0xb000 <_stogir.terminal.inputs+0x1e8>
		000000000000b4a4:  ARM64_RELOC_PAGE21	l_stogir.434
    b4a8:      	ldr	x16, [x16]
		000000000000b4a8:  ARM64_RELOC_PAGEOFF12	l_stogir.434
    b4ac:      	orr	x0, x16, xzr
    b4b0:      	mov	x1, x0
    b4b4:      	mov	x0, #0x1                ; =1
    b4b8:      	mov	x2, #0x16               ; =22
    b4bc:      	str	x0, [x8]
    b4c0:      	str	x1, [x8, #0x8]
    b4c4:      	str	x2, [x8, #0x10]
    b4c8:      	sub	sp, x29, #0x0
    b4cc:      	ldr	x29, [sp]
    b4d0:      	ldr	x30, [sp, #0x8]
    b4d4:      	add	sp, sp, #0x10
    b4d8:      	ret
    b4dc:      	str	x5, [x3]
    b4e0:      	str	x6, [x3, #0x8]
    b4e4:      	cmp	x1, #0x0
    b4e8:      	b.le	0xb3d8 <_stogir.switch.switch-inputs+0xd0>
    b4ec:      	uxtb	w5, w5
    b4f0:      	cmp	x5, #0x83
    b4f4:      	b.ge	0xb520 <_stogir.switch.switch-inputs+0x218>
    b4f8:      	adrp	x16, 0xb000 <_stogir.terminal.inputs+0x1e8>
		000000000000b4f8:  ARM64_RELOC_PAGE21	l_stogir.435
    b4fc:      	ldr	x16, [x16]
		000000000000b4fc:  ARM64_RELOC_PAGEOFF12	l_stogir.435
    b500:      	orr	x1, x16, xzr
    b504:      	add	x1, x5, x1
    b508:      	ldrb	w1, [x1]
    b50c:      	b	0xb524 <_stogir.switch.switch-inputs+0x21c>
    b510:      	movz	x5, #0x0, lsl #48
    b514:      	b	0xb3f8 <_stogir.switch.switch-inputs+0xf0>
    b518:      	movz	x5, #0x0, lsl #48
    b51c:      	b	0xb3d4 <_stogir.switch.switch-inputs+0xcc>
    b520:      	movz	x1, #0x0, lsl #48
    b524:      	uxtb	w1, w1
    b528:      	and	x1, x1, #0x1
    b52c:      	uxtb	w1, w1
    b530:      	cmp	x1, #0x0
    b534:      	b.eq	0xb3d8 <_stogir.switch.switch-inputs+0xd0>
    b538:      	ldr	w1, [x3]
    b53c:      	uxtb	w1, w1
    b540:      	cmp	x1, #0x83
    b544:      	b.ge	0xb560 <_stogir.switch.switch-inputs+0x258>
    b548:      	adrp	x16, 0xb000 <_stogir.terminal.inputs+0x1e8>
		000000000000b548:  ARM64_RELOC_PAGE21	l_stogir.435
    b54c:      	ldr	x16, [x16]
		000000000000b54c:  ARM64_RELOC_PAGEOFF12	l_stogir.435
    b550:      	orr	x3, x16, xzr
    b554:      	add	x1, x1, x3
    b558:      	ldrb	w1, [x1]
    b55c:      	b	0xb564 <_stogir.switch.switch-inputs+0x25c>
    b560:      	movz	x1, #0x0, lsl #48
    b564:      	uxtb	w1, w1
    b568:      	and	x1, x1, #0x4
    b56c:      	uxtb	w1, w1
    b570:      	cmp	x1, #0x0
    b574:      	cset	w1, eq
    b578:      	uxtb	w16, w1
    b57c:      	cmp	w16, wzr
    b580:      	cset	x1, eq
    b584:      	cmp	x1, #0x0
    b588:      	b.ne	0xb3d8 <_stogir.switch.switch-inputs+0xd0>
    b58c:      	sxtw	x2, w2
    b590:      	mov	x1, sp
    b594:      	cmp	x2, #0x0
    b598:      	cset	w3, gt
    b59c:      	movz	x16, #0x0, lsl #48
    b5a0:      	sub	x4, x16, x2
    b5a4:      	sub	sp, sp, #0x10
    b5a8:      	mov	x5, sp
    b5ac:      	sub	x6, x4, #0x1
    b5b0:      	uxtb	w16, w3
    b5b4:      	cmp	w16, wzr
    b5b8:      	b.eq	0xb624 <_stogir.switch.switch-inputs+0x31c>
    b5bc:      	ldr	x4, [x0, #0x8]
    b5c0:      	cmp	x2, x4
    b5c4:      	b.ge	0xb670 <_stogir.switch.switch-inputs+0x368>
    b5c8:      	add	x4, x0, #0x78
    b5cc:      	ldr	x4, [x4, #0x8]
    b5d0:      	cmp	x2, x4
    b5d4:      	b.ge	0xb784 <_stogir.switch.switch-inputs+0x47c>
    b5d8:      	lsl	x4, x2, #2
    b5dc:      	ldr	x7, [x0, #0x78]
    b5e0:      	add	x4, x4, x7
    b5e4:      	ldr	w4, [x4]
    b5e8:      	sxtw	x4, w4
    b5ec:      	cmp	x4, #0x0
    b5f0:      	cset	w4, ge
    b5f4:      	ubfx	x4, x4, #0, #8
    b5f8:      	b	0xb788 <_stogir.switch.switch-inputs+0x480>
    b5fc:      	adrp	x16, 0xb000 <_stogir.terminal.inputs+0x1e8>
		000000000000b5fc:  ARM64_RELOC_PAGE21	l_stogir.436
    b600:      	ldr	x16, [x16]
		000000000000b600:  ARM64_RELOC_PAGEOFF12	l_stogir.436
    b604:      	orr	x0, x16, xzr
    b608:      	mov	x2, x0
    b60c:      	mov	x0, #0x1                ; =1
    b610:      	mov	x3, #0x20               ; =32
    b614:      	mov	sp, x1
    b618:      	mov	x1, x2
    b61c:      	mov	x2, x3
    b620:      	b	0xb3f0 <_stogir.switch.switch-inputs+0xe8>
    b624:      	cmp	x2, #0x0
    b628:      	b.ge	0xb678 <_stogir.switch.switch-inputs+0x370>
    b62c:      	add	x7, x0, #0x28
    b630:      	add	x9, x0, #0x50
    b634:      	ldr	x7, [x7, #0x8]
    b638:      	ldr	x9, [x9, #0x8]
    b63c:      	cmp	x7, x9
    b640:      	b.ne	0xb77c <_stogir.switch.switch-inputs+0x474>
    b644:      	cmp	x4, x7
    b648:      	b.gt	0xb794 <_stogir.switch.switch-inputs+0x48c>
    b64c:      	lsl	x4, x6, #2
    b650:      	ldr	x7, [x0, #0x50]
    b654:      	add	x4, x4, x7
    b658:      	ldr	w4, [x4]
    b65c:      	sxtw	x4, w4
    b660:      	cmp	x4, #0x0
    b664:      	cset	w4, gt
    b668:      	ubfx	x4, x4, #0, #8
    b66c:      	b	0xb798 <_stogir.switch.switch-inputs+0x490>
    b670:      	movz	x4, #0x0, lsl #48
    b674:      	b	0xb67c <_stogir.switch.switch-inputs+0x374>
    b678:      	movz	x4, #0x0, lsl #48
    b67c:      	cmp	x4, #0x0
    b680:      	b.eq	0xb6e4 <_stogir.switch.switch-inputs+0x3dc>
    b684:      	uxtb	w16, w3
    b688:      	cmp	w16, wzr
    b68c:      	b.eq	0xb6b4 <_stogir.switch.switch-inputs+0x3ac>
    b690:      	lsl	x2, x2, #4
    b694:      	ldr	x0, [x0]
    b698:      	add	x0, x2, x0
    b69c:      	ldr	x2, [x0]
    b6a0:      	ldr	x0, [x0, #0x8]
    b6a4:      	fmov	d31, x0
    b6a8:      	mov	x0, x2
    b6ac:      	fmov	x2, d31
    b6b0:      	b	0xb6d4 <_stogir.switch.switch-inputs+0x3cc>
    b6b4:      	lsl	x2, x6, #4
    b6b8:      	ldr	x0, [x0, #0x28]
    b6bc:      	add	x0, x2, x0
    b6c0:      	ldr	x2, [x0]
    b6c4:      	ldr	x0, [x0, #0x8]
    b6c8:      	fmov	d31, x0
    b6cc:      	mov	x0, x2
    b6d0:      	fmov	x2, d31
    b6d4:      	mov	x3, x2
    b6d8:      	mov	x2, x0
    b6dc:      	mov	x0, #0x1                ; =1
    b6e0:      	b	0xb6f0 <_stogir.switch.switch-inputs+0x3e8>
    b6e4:      	movz	x0, #0x0, lsl #48
    b6e8:      	movz	x2, #0x0, lsl #48
    b6ec:      	movz	x3, #0x0, lsl #48
    b6f0:      	lsr	w0, w0, #0
    b6f4:      	lsr	x16, x0, #0
    b6f8:      	cmp	x16, #0x1
    b6fc:      	b.eq	0xb718 <_stogir.switch.switch-inputs+0x410>
    b700:      	b.lo	0xb708 <_stogir.switch.switch-inputs+0x400>
    b704:      	b	0xb71c <_stogir.switch.switch-inputs+0x414>
    b708:      	cmp	x16, #0x0
    b70c:      	b.eq	0xb714 <_stogir.switch.switch-inputs+0x40c>
    b710:      	b	0xb71c <_stogir.switch.switch-inputs+0x414>
    b714:      	b	0xb720 <_stogir.switch.switch-inputs+0x418>
    b718:      	b	0xb73c <_stogir.switch.switch-inputs+0x434>
    b71c:      	b	0xb79c <_stogir.switch.switch-inputs+0x494>
    b720:      	adrp	x16, 0xb000 <_stogir.terminal.inputs+0x1e8>
		000000000000b720:  ARM64_RELOC_PAGE21	l_stogir.437
    b724:      	ldr	x16, [x16]
		000000000000b724:  ARM64_RELOC_PAGEOFF12	l_stogir.437
    b728:      	orr	x0, x16, xzr
    b72c:      	mov	x2, x0
    b730:      	mov	x0, #0x1                ; =1
    b734:      	mov	x3, #0x17               ; =23
    b738:      	b	0xb614 <_stogir.switch.switch-inputs+0x30c>
    b73c:      	lsr	w0, w2, #0
    b740:      	str	x2, [x5]
    b744:      	str	x3, [x5, #0x8]
    b748:      	ubfx	x0, x0, #8, #8
    b74c:      	cmp	x0, #0x1
    b750:      	b.lt	0xb5fc <_stogir.switch.switch-inputs+0x2f4>
    b754:      	cmp	x0, #0xb
    b758:      	b.gt	0xb5fc <_stogir.switch.switch-inputs+0x2f4>
    b75c:      	uxtb	w2, w2
    b760:      	cmp	x2, #0x48
    b764:      	b.eq	0xb5fc <_stogir.switch.switch-inputs+0x2f4>
    b768:      	and	x0, x0, #0xffffffff
    b76c:      	mov	x2, x0
    b770:      	movz	x0, #0x0, lsl #48
    b774:      	movz	x3, #0x0, lsl #48
    b778:      	b	0xb614 <_stogir.switch.switch-inputs+0x30c>
    b77c:      	movz	x4, #0x0, lsl #48
    b780:      	b	0xb67c <_stogir.switch.switch-inputs+0x374>
    b784:      	movz	x4, #0x0, lsl #48
    b788:      	b	0xb674 <_stogir.switch.switch-inputs+0x36c>
    b78c:      	brk	#0
    b790:      	b	0xb78c <_stogir.switch.switch-inputs+0x484>
    b794:      	movz	x4, #0x0, lsl #48
    b798:      	b	0xb780 <_stogir.switch.switch-inputs+0x478>
    b79c:      	brk	#0
    b7a0:      	b	0xb79c <_stogir.switch.switch-inputs+0x494>

000000000000b7a4 <_stogir.switch.case-inputs>:
    b7a4:      	sub	sp, sp, #0x60
    b7a8:      	str	x29, [sp]
    b7ac:      	str	x30, [sp, #0x8]
    b7b0:      	mov	x29, sp
    b7b4:      	str	x19, [sp, #0x10]
    b7b8:      	str	x20, [sp, #0x18]
    b7bc:      	str	x21, [sp, #0x20]
    b7c0:      	str	x22, [sp, #0x28]
    b7c4:      	str	x23, [sp, #0x30]
    b7c8:      	str	x24, [sp, #0x38]
    b7cc:      	str	x25, [sp, #0x40]
    b7d0:      	str	x26, [sp, #0x48]
    b7d4:      	str	x27, [sp, #0x50]
    b7d8:      	sub	sp, sp, #0x10
    b7dc:      	mov	x5, sp
    b7e0:      	sxtw	x2, w2
    b7e4:      	sub	sp, sp, #0x20
    b7e8:      	mov	x19, sp
    b7ec:      	lsl	x6, x2, #2
    b7f0:      	cmp	x2, #0x0
    b7f4:      	cset	w7, gt
    b7f8:      	movz	x16, #0x0, lsl #48
    b7fc:      	sub	x9, x16, x2
    b800:      	sub	sp, sp, #0x20
    b804:      	mov	x20, sp
    b808:      	sub	x10, x9, #0x1
    b80c:      	sub	sp, sp, #0x20
    b810:      	mov	x21, sp
    b814:      	uxtb	w16, w7
    b818:      	cmp	w16, wzr
    b81c:      	b.eq	0xb85c <_stogir.switch.case-inputs+0xb8>
    b820:      	ldr	x9, [x0, #0x8]
    b824:      	cmp	x2, x9
    b828:      	b.ge	0xb8b0 <_stogir.switch.case-inputs+0x10c>
    b82c:      	add	x9, x0, #0x78
    b830:      	ldr	x9, [x9, #0x8]
    b834:      	cmp	x2, x9
    b838:      	b.ge	0xb9f0 <_stogir.switch.case-inputs+0x24c>
    b83c:      	ldr	x9, [x0, #0x78]
    b840:      	add	x9, x6, x9
    b844:      	ldr	w9, [x9]
    b848:      	sxtw	x9, w9
    b84c:      	cmp	x9, #0x0
    b850:      	cset	w9, ge
    b854:      	ubfx	x9, x9, #0, #8
    b858:      	b	0xb9f4 <_stogir.switch.case-inputs+0x250>
    b85c:      	cmp	x2, #0x0
    b860:      	b.ge	0xb8b8 <_stogir.switch.case-inputs+0x114>
    b864:      	add	x11, x0, #0x28
    b868:      	add	x12, x0, #0x50
    b86c:      	ldr	x11, [x11, #0x8]
    b870:      	ldr	x12, [x12, #0x8]
    b874:      	cmp	x11, x12
    b878:      	b.ne	0xb8a8 <_stogir.switch.case-inputs+0x104>
    b87c:      	cmp	x9, x11
    b880:      	b.gt	0xbab0 <_stogir.switch.case-inputs+0x30c>
    b884:      	lsl	x9, x10, #2
    b888:      	ldr	x11, [x0, #0x50]
    b88c:      	add	x9, x9, x11
    b890:      	ldr	w9, [x9]
    b894:      	sxtw	x9, w9
    b898:      	cmp	x9, #0x0
    b89c:      	cset	w9, gt
    b8a0:      	ubfx	x9, x9, #0, #8
    b8a4:      	b	0xbab4 <_stogir.switch.case-inputs+0x310>
    b8a8:      	movz	x9, #0x0, lsl #48
    b8ac:      	b	0xb8bc <_stogir.switch.case-inputs+0x118>
    b8b0:      	movz	x9, #0x0, lsl #48
    b8b4:      	b	0xb8bc <_stogir.switch.case-inputs+0x118>
    b8b8:      	movz	x9, #0x0, lsl #48
    b8bc:      	cmp	x9, #0x0
    b8c0:      	b.eq	0xb924 <_stogir.switch.case-inputs+0x180>
    b8c4:      	uxtb	w16, w7
    b8c8:      	cmp	w16, wzr
    b8cc:      	b.eq	0xb8f4 <_stogir.switch.case-inputs+0x150>
    b8d0:      	lsl	x7, x2, #4
    b8d4:      	ldr	x9, [x0]
    b8d8:      	add	x7, x7, x9
    b8dc:      	ldr	x9, [x7]
    b8e0:      	ldr	x7, [x7, #0x8]
    b8e4:      	fmov	d31, x7
    b8e8:      	mov	x7, x9
    b8ec:      	fmov	x9, d31
    b8f0:      	b	0xb914 <_stogir.switch.case-inputs+0x170>
    b8f4:      	lsl	x7, x10, #4
    b8f8:      	ldr	x9, [x0, #0x28]
    b8fc:      	add	x7, x7, x9
    b900:      	ldr	x9, [x7]
    b904:      	ldr	x7, [x7, #0x8]
    b908:      	fmov	d31, x7
    b90c:      	mov	x7, x9
    b910:      	fmov	x9, d31
    b914:      	mov	x10, x9
    b918:      	mov	x9, x7
    b91c:      	mov	x7, #0x1                ; =1
    b920:      	b	0xb930 <_stogir.switch.case-inputs+0x18c>
    b924:      	movz	x7, #0x0, lsl #48
    b928:      	movz	x9, #0x0, lsl #48
    b92c:      	movz	x10, #0x0, lsl #48
    b930:      	lsr	w7, w7, #0
    b934:      	lsr	x16, x7, #0
    b938:      	cmp	x16, #0x1
    b93c:      	b.eq	0xb958 <_stogir.switch.case-inputs+0x1b4>
    b940:      	b.lo	0xb948 <_stogir.switch.case-inputs+0x1a4>
    b944:      	b	0xb95c <_stogir.switch.case-inputs+0x1b8>
    b948:      	cmp	x16, #0x0
    b94c:      	b.eq	0xb954 <_stogir.switch.case-inputs+0x1b0>
    b950:      	b	0xb95c <_stogir.switch.case-inputs+0x1b8>
    b954:      	b	0xb960 <_stogir.switch.case-inputs+0x1bc>
    b958:      	b	0xb9c0 <_stogir.switch.case-inputs+0x21c>
    b95c:      	b	0xbab8 <_stogir.switch.case-inputs+0x314>
    b960:      	adrp	x16, 0xb000 <_stogir.terminal.inputs+0x1e8>
		000000000000b960:  ARM64_RELOC_PAGE21	l_stogir.438
    b964:      	ldr	x16, [x16]
		000000000000b964:  ARM64_RELOC_PAGEOFF12	l_stogir.438
    b968:      	orr	x0, x16, xzr
    b96c:      	mov	x23, x8
    b970:      	mov	x1, x0
    b974:      	mov	x0, #0x1                ; =1
    b978:      	mov	x2, #0x1a               ; =26
    b97c:      	str	x0, [x23]
    b980:      	str	x1, [x23, #0x8]
    b984:      	str	x2, [x23, #0x10]
    b988:      	sub	sp, x29, #0x0
    b98c:      	ldr	x19, [sp, #0x10]
    b990:      	ldr	x20, [sp, #0x18]
    b994:      	ldr	x21, [sp, #0x20]
    b998:      	ldr	x22, [sp, #0x28]
    b99c:      	ldr	x23, [sp, #0x30]
    b9a0:      	ldr	x24, [sp, #0x38]
    b9a4:      	ldr	x25, [sp, #0x40]
    b9a8:      	ldr	x26, [sp, #0x48]
    b9ac:      	ldr	x27, [sp, #0x50]
    b9b0:      	ldr	x29, [sp]
    b9b4:      	ldr	x30, [sp, #0x8]
    b9b8:      	add	sp, sp, #0x60
    b9bc:      	ret
    b9c0:      	str	x9, [x5]
    b9c4:      	str	x10, [x5, #0x8]
    b9c8:      	cmp	x2, #0x0
    b9cc:      	b.gt	0xb9f8 <_stogir.switch.case-inputs+0x254>
    b9d0:      	mov	x23, x8
    b9d4:      	adrp	x16, 0xb000 <_stogir.terminal.inputs+0x1e8>
		000000000000b9d4:  ARM64_RELOC_PAGE21	l_stogir.439
    b9d8:      	ldr	x16, [x16]
		000000000000b9d8:  ARM64_RELOC_PAGEOFF12	l_stogir.439
    b9dc:      	orr	x0, x16, xzr
    b9e0:      	mov	x1, x0
    b9e4:      	mov	x0, #0x1                ; =1
    b9e8:      	mov	x2, #0x1f               ; =31
    b9ec:      	b	0xb97c <_stogir.switch.case-inputs+0x1d8>
    b9f0:      	movz	x9, #0x0, lsl #48
    b9f4:      	b	0xb8b4 <_stogir.switch.case-inputs+0x110>
    b9f8:      	ldr	w2, [x5]
    b9fc:      	uxtb	w7, w2
    ba00:      	cmp	x7, #0x75
    ba04:      	b.ne	0xbc1c <_stogir.switch.case-inputs+0x478>
    ba08:      	ubfx	x2, x2, #8, #8
    ba0c:      	cmp	x2, #0x0
    ba10:      	b.ne	0xbc24 <_stogir.switch.case-inputs+0x480>
    ba14:      	ldr	x2, [x0, #0x78]
    ba18:      	add	x2, x6, x2
    ba1c:      	ldr	w2, [x2]
    ba20:      	sxtw	x2, w2
    ba24:      	cmp	x2, #0x2
    ba28:      	b.ne	0xbc2c <_stogir.switch.case-inputs+0x488>
    ba2c:      	sxtw	x22, w1
    ba30:      	cmp	x22, #0x6d
    ba34:      	b.lt	0xbc34 <_stogir.switch.case-inputs+0x490>
    ba38:      	cmp	x22, #0x6f
    ba3c:      	b.gt	0xbc3c <_stogir.switch.case-inputs+0x498>
    ba40:      	ldr	w1, [x5, #0x4]
    ba44:      	ldr	w2, [x5, #0x8]
    ba48:      	lsr	w1, w1, #0
    ba4c:      	lsr	w2, w2, #0
    ba50:      	mov	x23, x8
    ba54:      	mov	x8, x19
    ba58:      	mov	x24, x0
    ba5c:      	mov	w25, w3
    ba60:      	mov	w26, w4
    ba64:      	bl	0xba64 <_stogir.switch.case-inputs+0x2c0>
		000000000000ba64:  ARM64_RELOC_BRANCH26	_stogir.switch.switch-inputs
    ba68:      	ldr	w0, [x19]
    ba6c:      	lsr	x16, x0, #0
    ba70:      	cmp	x16, #0x1
    ba74:      	b.eq	0xba90 <_stogir.switch.case-inputs+0x2ec>
    ba78:      	b.lo	0xba80 <_stogir.switch.case-inputs+0x2dc>
    ba7c:      	b	0xba94 <_stogir.switch.case-inputs+0x2f0>
    ba80:      	cmp	x16, #0x0
    ba84:      	b.eq	0xba8c <_stogir.switch.case-inputs+0x2e8>
    ba88:      	b	0xba94 <_stogir.switch.case-inputs+0x2f0>
    ba8c:      	b	0xbac0 <_stogir.switch.case-inputs+0x31c>
    ba90:      	b	0xba98 <_stogir.switch.case-inputs+0x2f4>
    ba94:      	b	0xbc04 <_stogir.switch.case-inputs+0x460>
    ba98:      	add	x0, x19, #0x8
    ba9c:      	ldr	x1, [x19, #0x8]
    baa0:      	ldr	x0, [x0, #0x8]
    baa4:      	mov	x2, x0
    baa8:      	mov	x0, #0x1                ; =1
    baac:      	b	0xb9ec <_stogir.switch.case-inputs+0x248>
    bab0:      	movz	x9, #0x0, lsl #48
    bab4:      	b	0xb8ac <_stogir.switch.case-inputs+0x108>
    bab8:      	brk	#0
    babc:      	b	0xbab8 <_stogir.switch.case-inputs+0x314>
    bac0:      	ldr	w19, [x19, #0x8]
    bac4:      	sxtw	x0, w19
    bac8:      	and	x27, x0, #0xffffffff
    bacc:      	cmp	x22, #0x6f
    bad0:      	b.ne	0xbae4 <_stogir.switch.case-inputs+0x340>
    bad4:      	mov	x1, x27
    bad8:      	movz	x0, #0x0, lsl #48
    badc:      	movz	x2, #0x0, lsl #48
    bae0:      	b	0xbaac <_stogir.switch.case-inputs+0x308>
    bae4:      	lsr	w25, w25, #0
    bae8:      	lsr	w19, w19, #0
    baec:      	mov	x8, x20
    baf0:      	mov	x0, x24
    baf4:      	mov	w1, w25
    baf8:      	mov	w2, w19
    bafc:      	bl	0xbafc <_stogir.switch.case-inputs+0x358>
		000000000000bafc:  ARM64_RELOC_BRANCH26	_stogir.switch.key
    bb00:      	ldr	w0, [x20]
    bb04:      	lsr	x16, x0, #0
    bb08:      	cmp	x16, #0x1
    bb0c:      	b.eq	0xbb28 <_stogir.switch.case-inputs+0x384>
    bb10:      	b.lo	0xbb18 <_stogir.switch.case-inputs+0x374>
    bb14:      	b	0xbb2c <_stogir.switch.case-inputs+0x388>
    bb18:      	cmp	x16, #0x0
    bb1c:      	b.eq	0xbb24 <_stogir.switch.case-inputs+0x380>
    bb20:      	b	0xbb2c <_stogir.switch.case-inputs+0x388>
    bb24:      	b	0xbb48 <_stogir.switch.case-inputs+0x3a4>
    bb28:      	b	0xbb30 <_stogir.switch.case-inputs+0x38c>
    bb2c:      	b	0xbc0c <_stogir.switch.case-inputs+0x468>
    bb30:      	add	x0, x20, #0x8
    bb34:      	ldr	x1, [x20, #0x8]
    bb38:      	ldr	x0, [x0, #0x8]
    bb3c:      	mov	x2, x0
    bb40:      	mov	x0, #0x1                ; =1
    bb44:      	b	0xbae0 <_stogir.switch.case-inputs+0x33c>
    bb48:      	ldr	x20, [x20, #0x8]
    bb4c:      	cmp	x22, #0x6d
    bb50:      	b.ne	0xbb70 <_stogir.switch.case-inputs+0x3cc>
    bb54:      	sxtw	x25, w25
    bb58:      	mov	x0, x25
    bb5c:      	b	0xbb78 <_stogir.switch.case-inputs+0x3d4>
    bb60:      	mov	x1, x27
    bb64:      	movz	x0, #0x0, lsl #48
    bb68:      	movz	x2, #0x0, lsl #48
    bb6c:      	b	0xbb44 <_stogir.switch.case-inputs+0x3a0>
    bb70:      	sxtw	x26, w26
    bb74:      	mov	x0, x26
    bb78:      	lsr	w19, w19, #0
    bb7c:      	lsr	w0, w0, #0
    bb80:      	mov	x8, x21
    bb84:      	mov	w1, w0
    bb88:      	mov	x0, x24
    bb8c:      	mov	w2, w19
    bb90:      	bl	0xbb90 <_stogir.switch.case-inputs+0x3ec>
		000000000000bb90:  ARM64_RELOC_BRANCH26	_stogir.switch.key
    bb94:      	ldr	w0, [x21]
    bb98:      	lsr	x16, x0, #0
    bb9c:      	cmp	x16, #0x1
    bba0:      	b.eq	0xbbbc <_stogir.switch.case-inputs+0x418>
    bba4:      	b.lo	0xbbac <_stogir.switch.case-inputs+0x408>
    bba8:      	b	0xbbc0 <_stogir.switch.case-inputs+0x41c>
    bbac:      	cmp	x16, #0x0
    bbb0:      	b.eq	0xbbb8 <_stogir.switch.case-inputs+0x414>
    bbb4:      	b	0xbbc0 <_stogir.switch.case-inputs+0x41c>
    bbb8:      	b	0xbbdc <_stogir.switch.case-inputs+0x438>
    bbbc:      	b	0xbbc4 <_stogir.switch.case-inputs+0x420>
    bbc0:      	b	0xbc14 <_stogir.switch.case-inputs+0x470>
    bbc4:      	add	x0, x21, #0x8
    bbc8:      	ldr	x1, [x21, #0x8]
    bbcc:      	ldr	x0, [x0, #0x8]
    bbd0:      	mov	x2, x0
    bbd4:      	mov	x0, #0x1                ; =1
    bbd8:      	b	0xbb6c <_stogir.switch.case-inputs+0x3c8>
    bbdc:      	ldr	x0, [x21, #0x8]
    bbe0:      	cmp	x20, x0
    bbe4:      	b.ls	0xbb60 <_stogir.switch.case-inputs+0x3bc>
    bbe8:      	adrp	x16, 0xb000 <_stogir.terminal.inputs+0x1e8>
		000000000000bbe8:  ARM64_RELOC_PAGE21	l_stogir.440
    bbec:      	ldr	x16, [x16]
		000000000000bbec:  ARM64_RELOC_PAGEOFF12	l_stogir.440
    bbf0:      	orr	x0, x16, xzr
    bbf4:      	mov	x1, x0
    bbf8:      	mov	x0, #0x1                ; =1
    bbfc:      	mov	x2, #0x1a               ; =26
    bc00:      	b	0xbb6c <_stogir.switch.case-inputs+0x3c8>
    bc04:      	brk	#0
    bc08:      	b	0xbc04 <_stogir.switch.case-inputs+0x460>
    bc0c:      	brk	#0
    bc10:      	b	0xbc0c <_stogir.switch.case-inputs+0x468>
    bc14:      	brk	#0
    bc18:      	b	0xbc14 <_stogir.switch.case-inputs+0x470>
    bc1c:      	mov	x23, x8
    bc20:      	b	0xb9d4 <_stogir.switch.case-inputs+0x230>
    bc24:      	mov	x23, x8
    bc28:      	b	0xb9d4 <_stogir.switch.case-inputs+0x230>
    bc2c:      	mov	x23, x8
    bc30:      	b	0xb9d4 <_stogir.switch.case-inputs+0x230>
    bc34:      	mov	x23, x8
    bc38:      	b	0xb9d4 <_stogir.switch.case-inputs+0x230>
    bc3c:      	mov	x23, x8
    bc40:      	b	0xb9d4 <_stogir.switch.case-inputs+0x230>

000000000000bc44 <_stogir.stack.validate-frame-address>:
    bc44:      	sxtw	x1, w1
    bc48:      	lsl	x2, x1, #2
    bc4c:      	cmp	x1, #0x0
    bc50:      	cset	w3, gt
    bc54:      	movz	x16, #0x0, lsl #48
    bc58:      	sub	x4, x16, x1
    bc5c:      	sub	x5, x4, #0x1
    bc60:      	uxtb	w16, w3
    bc64:      	cmp	w16, wzr
    bc68:      	b.eq	0xbca8 <_stogir.stack.validate-frame-address+0x64>
    bc6c:      	ldr	x4, [x0, #0x8]
    bc70:      	cmp	x1, x4
    bc74:      	b.ge	0xbcfc <_stogir.stack.validate-frame-address+0xb8>
    bc78:      	add	x4, x0, #0x78
    bc7c:      	ldr	x4, [x4, #0x8]
    bc80:      	cmp	x1, x4
    bc84:      	b.ge	0xbe14 <_stogir.stack.validate-frame-address+0x1d0>
    bc88:      	ldr	x4, [x0, #0x78]
    bc8c:      	add	x4, x2, x4
    bc90:      	ldr	w4, [x4]
    bc94:      	sxtw	x4, w4
    bc98:      	cmp	x4, #0x0
    bc9c:      	cset	w4, ge
    bca0:      	ubfx	x4, x4, #0, #8
    bca4:      	b	0xbe18 <_stogir.stack.validate-frame-address+0x1d4>
    bca8:      	cmp	x1, #0x0
    bcac:      	b.ge	0xbd04 <_stogir.stack.validate-frame-address+0xc0>
    bcb0:      	add	x6, x0, #0x28
    bcb4:      	add	x7, x0, #0x50
    bcb8:      	ldr	x6, [x6, #0x8]
    bcbc:      	ldr	x7, [x7, #0x8]
    bcc0:      	cmp	x6, x7
    bcc4:      	b.ne	0xbcf4 <_stogir.stack.validate-frame-address+0xb0>
    bcc8:      	cmp	x4, x6
    bccc:      	b.gt	0xbe1c <_stogir.stack.validate-frame-address+0x1d8>
    bcd0:      	lsl	x4, x5, #2
    bcd4:      	ldr	x6, [x0, #0x50]
    bcd8:      	add	x4, x4, x6
    bcdc:      	ldr	w4, [x4]
    bce0:      	sxtw	x4, w4
    bce4:      	cmp	x4, #0x0
    bce8:      	cset	w4, gt
    bcec:      	ubfx	x4, x4, #0, #8
    bcf0:      	b	0xbe20 <_stogir.stack.validate-frame-address+0x1dc>
    bcf4:      	movz	x4, #0x0, lsl #48
    bcf8:      	b	0xbd08 <_stogir.stack.validate-frame-address+0xc4>
    bcfc:      	movz	x4, #0x0, lsl #48
    bd00:      	b	0xbd08 <_stogir.stack.validate-frame-address+0xc4>
    bd04:      	movz	x4, #0x0, lsl #48
    bd08:      	cmp	x4, #0x0
    bd0c:      	b.eq	0xbd4c <_stogir.stack.validate-frame-address+0x108>
    bd10:      	uxtb	w16, w3
    bd14:      	cmp	w16, wzr
    bd18:      	b.eq	0xbd30 <_stogir.stack.validate-frame-address+0xec>
    bd1c:      	lsl	x3, x1, #4
    bd20:      	ldr	x4, [x0]
    bd24:      	add	x3, x3, x4
    bd28:      	ldr	x3, [x3]
    bd2c:      	b	0xbd40 <_stogir.stack.validate-frame-address+0xfc>
    bd30:      	lsl	x3, x5, #4
    bd34:      	ldr	x4, [x0, #0x28]
    bd38:      	add	x3, x3, x4
    bd3c:      	ldr	x3, [x3]
    bd40:      	mov	x4, x3
    bd44:      	mov	x3, #0x1                ; =1
    bd48:      	b	0xbd54 <_stogir.stack.validate-frame-address+0x110>
    bd4c:      	movz	x3, #0x0, lsl #48
    bd50:      	movz	x4, #0x0, lsl #48
    bd54:      	lsr	w3, w3, #0
    bd58:      	lsr	x16, x3, #0
    bd5c:      	cmp	x16, #0x1
    bd60:      	b.eq	0xbd7c <_stogir.stack.validate-frame-address+0x138>
    bd64:      	b.lo	0xbd6c <_stogir.stack.validate-frame-address+0x128>
    bd68:      	b	0xbd80 <_stogir.stack.validate-frame-address+0x13c>
    bd6c:      	cmp	x16, #0x0
    bd70:      	b.eq	0xbd78 <_stogir.stack.validate-frame-address+0x134>
    bd74:      	b	0xbd80 <_stogir.stack.validate-frame-address+0x13c>
    bd78:      	b	0xbd84 <_stogir.stack.validate-frame-address+0x140>
    bd7c:      	b	0xbdc8 <_stogir.stack.validate-frame-address+0x184>
    bd80:      	b	0xbe24 <_stogir.stack.validate-frame-address+0x1e0>
    bd84:      	adrp	x16, 0xb000 <_stogir.terminal.inputs+0x1e8>
		000000000000bd84:  ARM64_RELOC_PAGE21	l_stogir.441
    bd88:      	ldr	x16, [x16]
		000000000000bd88:  ARM64_RELOC_PAGEOFF12	l_stogir.441
    bd8c:      	orr	x0, x16, xzr
    bd90:      	mov	x1, x0
    bd94:      	mov	x0, #0x1                ; =1
    bd98:      	mov	x2, #0x21               ; =33
    bd9c:      	b	0xbdb8 <_stogir.stack.validate-frame-address+0x174>
    bda0:      	adrp	x16, 0xb000 <_stogir.terminal.inputs+0x1e8>
		000000000000bda0:  ARM64_RELOC_PAGE21	l_stogir.442
    bda4:      	ldr	x16, [x16]
		000000000000bda4:  ARM64_RELOC_PAGEOFF12	l_stogir.442
    bda8:      	orr	x0, x16, xzr
    bdac:      	mov	x1, x0
    bdb0:      	mov	x0, #0x1                ; =1
    bdb4:      	mov	x2, #0x1e               ; =30
    bdb8:      	str	x0, [x8]
    bdbc:      	str	x1, [x8, #0x8]
    bdc0:      	str	x2, [x8, #0x10]
    bdc4:      	ret
    bdc8:      	cmp	x1, #0x0
    bdcc:      	b.le	0xbda0 <_stogir.stack.validate-frame-address+0x15c>
    bdd0:      	uxtb	w1, w4
    bdd4:      	cmp	x1, #0x42
    bdd8:      	b.ne	0xbda0 <_stogir.stack.validate-frame-address+0x15c>
    bddc:      	lsr	w4, w4, #0
    bde0:      	ubfx	x1, x4, #8, #8
    bde4:      	cmp	x1, #0x6
    bde8:      	b.ne	0xbda0 <_stogir.stack.validate-frame-address+0x15c>
    bdec:      	ldr	x0, [x0, #0x78]
    bdf0:      	add	x0, x2, x0
    bdf4:      	ldr	w0, [x0]
    bdf8:      	sxtw	x0, w0
    bdfc:      	cmp	x0, #0x0
    be00:      	b.ne	0xbda0 <_stogir.stack.validate-frame-address+0x15c>
    be04:      	movz	x0, #0x0, lsl #48
    be08:      	mov	x1, #0x8                ; =8
    be0c:      	movz	x2, #0x0, lsl #48
    be10:      	b	0xbdb8 <_stogir.stack.validate-frame-address+0x174>
    be14:      	movz	x4, #0x0, lsl #48
    be18:      	b	0xbd00 <_stogir.stack.validate-frame-address+0xbc>
    be1c:      	movz	x4, #0x0, lsl #48
    be20:      	b	0xbcf8 <_stogir.stack.validate-frame-address+0xb4>
    be24:      	brk	#0
    be28:      	b	0xbe24 <_stogir.stack.validate-frame-address+0x1e0>

000000000000be2c <_stogir.stack.validate-scope-inputs>:
    be2c:      	sub	sp, sp, #0x10
    be30:      	str	x29, [sp]
    be34:      	str	x30, [sp, #0x8]
    be38:      	mov	x29, sp
    be3c:      	sub	sp, sp, #0x10
    be40:      	mov	x5, sp
    be44:      	sxtw	x1, w1
    be48:      	sub	sp, sp, #0x10
    be4c:      	mov	x6, sp
    be50:      	cmp	x1, #0x53
    be54:      	cset	w7, eq
    be58:      	uxtb	w16, w7
    be5c:      	cmp	w16, wzr
    be60:      	b.ne	0xbea4 <_stogir.stack.validate-scope-inputs+0x78>
    be64:      	cmp	x1, #0x54
    be68:      	b.eq	0xbea4 <_stogir.stack.validate-scope-inputs+0x78>
    be6c:      	adrp	x16, 0xb000 <_stogir.terminal.inputs+0x1e8>
		000000000000be6c:  ARM64_RELOC_PAGE21	l_stogir.443
    be70:      	ldr	x16, [x16]
		000000000000be70:  ARM64_RELOC_PAGEOFF12	l_stogir.443
    be74:      	orr	x0, x16, xzr
    be78:      	mov	x1, x0
    be7c:      	mov	x0, #0x1                ; =1
    be80:      	mov	x2, #0x22               ; =34
    be84:      	str	x0, [x8]
    be88:      	str	x1, [x8, #0x8]
    be8c:      	str	x2, [x8, #0x10]
    be90:      	sub	sp, x29, #0x0
    be94:      	ldr	x29, [sp]
    be98:      	ldr	x30, [sp, #0x8]
    be9c:      	add	sp, sp, #0x10
    bea0:      	ret
    bea4:      	uxtb	w16, w7
    bea8:      	cmp	w16, wzr
    beac:      	mov	x16, #0x6               ; =6
    beb0:      	movz	x17, #0x0, lsl #48
    beb4:      	csel	x1, x16, x17, ne
    beb8:      	sxtw	x2, w2
    bebc:      	lsr	w1, w1, #0
    bec0:      	sxtw	x1, w1
    bec4:      	cmp	x2, x1
    bec8:      	b.ne	0xbe6c <_stogir.stack.validate-scope-inputs+0x40>
    becc:      	sxtw	x3, w3
    bed0:      	cmp	x3, #0x0
    bed4:      	cset	w1, gt
    bed8:      	movz	x16, #0x0, lsl #48
    bedc:      	sub	x2, x16, x3
    bee0:      	sub	x9, x2, #0x1
    bee4:      	uxtb	w16, w1
    bee8:      	cmp	w16, wzr
    beec:      	b.eq	0xbffc <_stogir.stack.validate-scope-inputs+0x1d0>
    bef0:      	ldr	x2, [x0, #0x8]
    bef4:      	cmp	x3, x2
    bef8:      	b.ge	0xbff4 <_stogir.stack.validate-scope-inputs+0x1c8>
    befc:      	add	x2, x0, #0x78
    bf00:      	ldr	x2, [x2, #0x8]
    bf04:      	cmp	x3, x2
    bf08:      	b.ge	0xc0a4 <_stogir.stack.validate-scope-inputs+0x278>
    bf0c:      	lsl	x2, x3, #2
    bf10:      	ldr	x10, [x0, #0x78]
    bf14:      	add	x2, x2, x10
    bf18:      	ldr	w2, [x2]
    bf1c:      	sxtw	x2, w2
    bf20:      	cmp	x2, #0x0
    bf24:      	cset	w2, ge
    bf28:      	ubfx	x2, x2, #0, #8
    bf2c:      	b	0xc0a8 <_stogir.stack.validate-scope-inputs+0x27c>
    bf30:      	movz	x1, #0x0, lsl #48
    bf34:      	movz	x2, #0x0, lsl #48
    bf38:      	movz	x9, #0x0, lsl #48
    bf3c:      	lsr	w1, w1, #0
    bf40:      	lsr	x16, x1, #0
    bf44:      	cmp	x16, #0x1
    bf48:      	b.eq	0xbf64 <_stogir.stack.validate-scope-inputs+0x138>
    bf4c:      	b.lo	0xbf54 <_stogir.stack.validate-scope-inputs+0x128>
    bf50:      	b	0xbf68 <_stogir.stack.validate-scope-inputs+0x13c>
    bf54:      	cmp	x16, #0x0
    bf58:      	b.eq	0xbf60 <_stogir.stack.validate-scope-inputs+0x134>
    bf5c:      	b	0xbf68 <_stogir.stack.validate-scope-inputs+0x13c>
    bf60:      	b	0xbf6c <_stogir.stack.validate-scope-inputs+0x140>
    bf64:      	b	0xc048 <_stogir.stack.validate-scope-inputs+0x21c>
    bf68:      	b	0xc2a4 <_stogir.stack.validate-scope-inputs+0x478>
    bf6c:      	adrp	x16, 0xb000 <_stogir.terminal.inputs+0x1e8>
		000000000000bf6c:  ARM64_RELOC_PAGE21	l_stogir.444
    bf70:      	ldr	x16, [x16]
		000000000000bf70:  ARM64_RELOC_PAGEOFF12	l_stogir.444
    bf74:      	orr	x0, x16, xzr
    bf78:      	mov	x1, x0
    bf7c:      	mov	x0, #0x1                ; =1
    bf80:      	mov	x2, #0x1b               ; =27
    bf84:      	b	0xbe84 <_stogir.stack.validate-scope-inputs+0x58>
    bf88:      	lsl	x1, x9, #4
    bf8c:      	ldr	x2, [x0, #0x28]
    bf90:      	add	x1, x1, x2
    bf94:      	ldr	x2, [x1]
    bf98:      	ldr	x1, [x1, #0x8]
    bf9c:      	fmov	d31, x1
    bfa0:      	mov	x1, x2
    bfa4:      	fmov	x2, d31
    bfa8:      	mov	x9, x2
    bfac:      	mov	x2, x1
    bfb0:      	mov	x1, #0x1                ; =1
    bfb4:      	b	0xbf3c <_stogir.stack.validate-scope-inputs+0x110>
    bfb8:      	movz	x2, #0x0, lsl #48
    bfbc:      	cmp	x2, #0x0
    bfc0:      	b.eq	0xbf30 <_stogir.stack.validate-scope-inputs+0x104>
    bfc4:      	uxtb	w16, w1
    bfc8:      	cmp	w16, wzr
    bfcc:      	b.eq	0xbf88 <_stogir.stack.validate-scope-inputs+0x15c>
    bfd0:      	lsl	x1, x3, #4
    bfd4:      	ldr	x2, [x0]
    bfd8:      	add	x1, x1, x2
    bfdc:      	ldr	x2, [x1]
    bfe0:      	ldr	x1, [x1, #0x8]
    bfe4:      	fmov	d31, x1
    bfe8:      	mov	x1, x2
    bfec:      	fmov	x2, d31
    bff0:      	b	0xbfa8 <_stogir.stack.validate-scope-inputs+0x17c>
    bff4:      	movz	x2, #0x0, lsl #48
    bff8:      	b	0xbfbc <_stogir.stack.validate-scope-inputs+0x190>
    bffc:      	cmp	x3, #0x0
    c000:      	b.ge	0xbfb8 <_stogir.stack.validate-scope-inputs+0x18c>
    c004:      	add	x10, x0, #0x28
    c008:      	add	x11, x0, #0x50
    c00c:      	ldr	x10, [x10, #0x8]
    c010:      	ldr	x11, [x11, #0x8]
    c014:      	cmp	x10, x11
    c018:      	b.ne	0xc09c <_stogir.stack.validate-scope-inputs+0x270>
    c01c:      	cmp	x2, x10
    c020:      	b.gt	0xc0ac <_stogir.stack.validate-scope-inputs+0x280>
    c024:      	lsl	x2, x9, #2
    c028:      	ldr	x10, [x0, #0x50]
    c02c:      	add	x2, x2, x10
    c030:      	ldr	w2, [x2]
    c034:      	sxtw	x2, w2
    c038:      	cmp	x2, #0x0
    c03c:      	cset	w2, gt
    c040:      	ubfx	x2, x2, #0, #8
    c044:      	b	0xc0b0 <_stogir.stack.validate-scope-inputs+0x284>
    c048:      	str	x2, [x5]
    c04c:      	str	x9, [x5, #0x8]
    c050:      	cmp	x3, #0x0
    c054:      	b.le	0xc080 <_stogir.stack.validate-scope-inputs+0x254>
    c058:      	ldr	w1, [x5]
    c05c:      	uxtb	w1, w1
    c060:      	cmp	x1, #0x83
    c064:      	b.ge	0xc0b4 <_stogir.stack.validate-scope-inputs+0x288>
    c068:      	adrp	x16, 0xc000 <_stogir.stack.validate-scope-inputs+0x1d4>
		000000000000c068:  ARM64_RELOC_PAGE21	l_stogir.445
    c06c:      	ldr	x16, [x16]
		000000000000c06c:  ARM64_RELOC_PAGEOFF12	l_stogir.445
    c070:      	orr	x2, x16, xzr
    c074:      	add	x1, x1, x2
    c078:      	ldrb	w1, [x1]
    c07c:      	b	0xc0b8 <_stogir.stack.validate-scope-inputs+0x28c>
    c080:      	adrp	x16, 0xc000 <_stogir.stack.validate-scope-inputs+0x1d4>
		000000000000c080:  ARM64_RELOC_PAGE21	l_stogir.446
    c084:      	ldr	x16, [x16]
		000000000000c084:  ARM64_RELOC_PAGEOFF12	l_stogir.446
    c088:      	orr	x0, x16, xzr
    c08c:      	mov	x1, x0
    c090:      	mov	x0, #0x1                ; =1
    c094:      	mov	x2, #0x1b               ; =27
    c098:      	b	0xbf84 <_stogir.stack.validate-scope-inputs+0x158>
    c09c:      	movz	x2, #0x0, lsl #48
    c0a0:      	b	0xbfbc <_stogir.stack.validate-scope-inputs+0x190>
    c0a4:      	movz	x2, #0x0, lsl #48
    c0a8:      	b	0xbff8 <_stogir.stack.validate-scope-inputs+0x1cc>
    c0ac:      	movz	x2, #0x0, lsl #48
    c0b0:      	b	0xc0a0 <_stogir.stack.validate-scope-inputs+0x274>
    c0b4:      	movz	x1, #0x0, lsl #48
    c0b8:      	uxtb	w1, w1
    c0bc:      	and	x1, x1, #0x1
    c0c0:      	uxtb	w1, w1
    c0c4:      	cmp	x1, #0x0
    c0c8:      	b.eq	0xc080 <_stogir.stack.validate-scope-inputs+0x254>
    c0cc:      	ldr	w1, [x5]
    c0d0:      	uxtb	w1, w1
    c0d4:      	cmp	x1, #0x83
    c0d8:      	b.ge	0xc0f4 <_stogir.stack.validate-scope-inputs+0x2c8>
    c0dc:      	adrp	x16, 0xc000 <_stogir.stack.validate-scope-inputs+0x1d4>
		000000000000c0dc:  ARM64_RELOC_PAGE21	l_stogir.445
    c0e0:      	ldr	x16, [x16]
		000000000000c0e0:  ARM64_RELOC_PAGEOFF12	l_stogir.445
    c0e4:      	orr	x2, x16, xzr
    c0e8:      	add	x1, x1, x2
    c0ec:      	ldrb	w1, [x1]
    c0f0:      	b	0xc0f8 <_stogir.stack.validate-scope-inputs+0x2cc>
    c0f4:      	movz	x1, #0x0, lsl #48
    c0f8:      	uxtb	w1, w1
    c0fc:      	and	x1, x1, #0x4
    c100:      	uxtb	w1, w1
    c104:      	cmp	x1, #0x0
    c108:      	b.ne	0xc080 <_stogir.stack.validate-scope-inputs+0x254>
    c10c:      	uxtb	w16, w7
    c110:      	cmp	w16, wzr
    c114:      	b.eq	0xc128 <_stogir.stack.validate-scope-inputs+0x2fc>
    c118:      	movz	x0, #0x0, lsl #48
    c11c:      	mov	x1, #0x8                ; =8
    c120:      	movz	x2, #0x0, lsl #48
    c124:      	b	0xc098 <_stogir.stack.validate-scope-inputs+0x26c>
    c128:      	sxtw	x4, w4
    c12c:      	cmp	x4, #0x0
    c130:      	cset	w1, gt
    c134:      	movz	x16, #0x0, lsl #48
    c138:      	sub	x2, x16, x4
    c13c:      	sub	x3, x2, #0x1
    c140:      	uxtb	w16, w1
    c144:      	cmp	w16, wzr
    c148:      	b.eq	0xc258 <_stogir.stack.validate-scope-inputs+0x42c>
    c14c:      	ldr	x2, [x0, #0x8]
    c150:      	cmp	x4, x2
    c154:      	b.ge	0xc250 <_stogir.stack.validate-scope-inputs+0x424>
    c158:      	add	x2, x0, #0x78
    c15c:      	ldr	x2, [x2, #0x8]
    c160:      	cmp	x4, x2
    c164:      	b.ge	0xc308 <_stogir.stack.validate-scope-inputs+0x4dc>
    c168:      	lsl	x2, x4, #2
    c16c:      	ldr	x5, [x0, #0x78]
    c170:      	add	x2, x2, x5
    c174:      	ldr	w2, [x2]
    c178:      	sxtw	x2, w2
    c17c:      	cmp	x2, #0x0
    c180:      	cset	w2, ge
    c184:      	ubfx	x2, x2, #0, #8
    c188:      	b	0xc30c <_stogir.stack.validate-scope-inputs+0x4e0>
    c18c:      	movz	x0, #0x0, lsl #48
    c190:      	movz	x1, #0x0, lsl #48
    c194:      	movz	x2, #0x0, lsl #48
    c198:      	lsr	w0, w0, #0
    c19c:      	lsr	x16, x0, #0
    c1a0:      	cmp	x16, #0x1
    c1a4:      	b.eq	0xc1c0 <_stogir.stack.validate-scope-inputs+0x394>
    c1a8:      	b.lo	0xc1b0 <_stogir.stack.validate-scope-inputs+0x384>
    c1ac:      	b	0xc1c4 <_stogir.stack.validate-scope-inputs+0x398>
    c1b0:      	cmp	x16, #0x0
    c1b4:      	b.eq	0xc1bc <_stogir.stack.validate-scope-inputs+0x390>
    c1b8:      	b	0xc1c4 <_stogir.stack.validate-scope-inputs+0x398>
    c1bc:      	b	0xc1c8 <_stogir.stack.validate-scope-inputs+0x39c>
    c1c0:      	b	0xc2ac <_stogir.stack.validate-scope-inputs+0x480>
    c1c4:      	b	0xc318 <_stogir.stack.validate-scope-inputs+0x4ec>
    c1c8:      	adrp	x16, 0xc000 <_stogir.stack.validate-scope-inputs+0x1d4>
		000000000000c1c8:  ARM64_RELOC_PAGE21	l_stogir.447
    c1cc:      	ldr	x16, [x16]
		000000000000c1cc:  ARM64_RELOC_PAGEOFF12	l_stogir.447
    c1d0:      	orr	x0, x16, xzr
    c1d4:      	mov	x1, x0
    c1d8:      	mov	x0, #0x1                ; =1
    c1dc:      	mov	x2, #0x1b               ; =27
    c1e0:      	b	0xc124 <_stogir.stack.validate-scope-inputs+0x2f8>
    c1e4:      	lsl	x1, x3, #4
    c1e8:      	ldr	x0, [x0, #0x28]
    c1ec:      	add	x0, x1, x0
    c1f0:      	ldr	x1, [x0]
    c1f4:      	ldr	x0, [x0, #0x8]
    c1f8:      	fmov	d31, x0
    c1fc:      	mov	x0, x1
    c200:      	fmov	x1, d31
    c204:      	mov	x2, x1
    c208:      	mov	x1, x0
    c20c:      	mov	x0, #0x1                ; =1
    c210:      	b	0xc198 <_stogir.stack.validate-scope-inputs+0x36c>
    c214:      	movz	x2, #0x0, lsl #48
    c218:      	cmp	x2, #0x0
    c21c:      	b.eq	0xc18c <_stogir.stack.validate-scope-inputs+0x360>
    c220:      	uxtb	w16, w1
    c224:      	cmp	w16, wzr
    c228:      	b.eq	0xc1e4 <_stogir.stack.validate-scope-inputs+0x3b8>
    c22c:      	lsl	x1, x4, #4
    c230:      	ldr	x0, [x0]
    c234:      	add	x0, x1, x0
    c238:      	ldr	x1, [x0]
    c23c:      	ldr	x0, [x0, #0x8]
    c240:      	fmov	d31, x0
    c244:      	mov	x0, x1
    c248:      	fmov	x1, d31
    c24c:      	b	0xc204 <_stogir.stack.validate-scope-inputs+0x3d8>
    c250:      	movz	x2, #0x0, lsl #48
    c254:      	b	0xc218 <_stogir.stack.validate-scope-inputs+0x3ec>
    c258:      	cmp	x4, #0x0
    c25c:      	b.ge	0xc214 <_stogir.stack.validate-scope-inputs+0x3e8>
    c260:      	add	x5, x0, #0x28
    c264:      	add	x7, x0, #0x50
    c268:      	ldr	x5, [x5, #0x8]
    c26c:      	ldr	x7, [x7, #0x8]
    c270:      	cmp	x5, x7
    c274:      	b.ne	0xc300 <_stogir.stack.validate-scope-inputs+0x4d4>
    c278:      	cmp	x2, x5
    c27c:      	b.gt	0xc310 <_stogir.stack.validate-scope-inputs+0x4e4>
    c280:      	lsl	x2, x3, #2
    c284:      	ldr	x5, [x0, #0x50]
    c288:      	add	x2, x2, x5
    c28c:      	ldr	w2, [x2]
    c290:      	sxtw	x2, w2
    c294:      	cmp	x2, #0x0
    c298:      	cset	w2, gt
    c29c:      	ubfx	x2, x2, #0, #8
    c2a0:      	b	0xc314 <_stogir.stack.validate-scope-inputs+0x4e8>
    c2a4:      	brk	#0
    c2a8:      	b	0xc2a4 <_stogir.stack.validate-scope-inputs+0x478>
    c2ac:      	lsr	w0, w1, #0
    c2b0:      	str	x1, [x6]
    c2b4:      	str	x2, [x6, #0x8]
    c2b8:      	ubfx	x0, x0, #8, #8
    c2bc:      	cmp	x0, #0x6
    c2c0:      	b.ne	0xc2e4 <_stogir.stack.validate-scope-inputs+0x4b8>
    c2c4:      	ldr	w0, [x6]
    c2c8:      	uxtb	w0, w0
    c2cc:      	cmp	x0, #0x48
    c2d0:      	b.eq	0xc2e4 <_stogir.stack.validate-scope-inputs+0x4b8>
    c2d4:      	movz	x0, #0x0, lsl #48
    c2d8:      	mov	x1, #0x8                ; =8
    c2dc:      	movz	x2, #0x0, lsl #48
    c2e0:      	b	0xc2fc <_stogir.stack.validate-scope-inputs+0x4d0>
    c2e4:      	adrp	x16, 0xc000 <_stogir.stack.validate-scope-inputs+0x1d4>
		000000000000c2e4:  ARM64_RELOC_PAGE21	l_stogir.448
    c2e8:      	ldr	x16, [x16]
		000000000000c2e8:  ARM64_RELOC_PAGEOFF12	l_stogir.448
    c2ec:      	orr	x0, x16, xzr
    c2f0:      	mov	x1, x0
    c2f4:      	mov	x0, #0x1                ; =1
    c2f8:      	mov	x2, #0x29               ; =41
    c2fc:      	b	0xc1e0 <_stogir.stack.validate-scope-inputs+0x3b4>
    c300:      	movz	x2, #0x0, lsl #48
    c304:      	b	0xc218 <_stogir.stack.validate-scope-inputs+0x3ec>
    c308:      	movz	x2, #0x0, lsl #48
    c30c:      	b	0xc254 <_stogir.stack.validate-scope-inputs+0x428>
    c310:      	movz	x2, #0x0, lsl #48
    c314:      	b	0xc304 <_stogir.stack.validate-scope-inputs+0x4d8>
    c318:      	brk	#0
    c31c:      	b	0xc318 <_stogir.stack.validate-scope-inputs+0x4ec>

000000000000c320 <_stogir.stack.validate-inputs>:
    c320:      	sub	sp, sp, #0x30
    c324:      	str	x29, [sp]
    c328:      	str	x30, [sp, #0x8]
    c32c:      	mov	x29, sp
    c330:      	str	x19, [sp, #0x10]
    c334:      	str	x20, [sp, #0x18]
    c338:      	str	x21, [sp, #0x20]
    c33c:      	sub	sp, sp, #0x10
    c340:      	mov	x6, sp
    c344:      	sxtw	x1, w1
    c348:      	sub	sp, sp, #0x10
    c34c:      	mov	x19, sp
    c350:      	cmp	x1, #0x51
    c354:      	cset	w7, eq
    c358:      	sub	sp, sp, #0x20
    c35c:      	mov	x20, sp
    c360:      	uxtb	w16, w7
    c364:      	cmp	w16, wzr
    c368:      	b.ne	0xc3bc <_stogir.stack.validate-inputs+0x9c>
    c36c:      	cmp	x1, #0x52
    c370:      	b.eq	0xc3bc <_stogir.stack.validate-inputs+0x9c>
    c374:      	mov	x21, x8
    c378:      	adrp	x16, 0xc000 <_stogir.stack.validate-scope-inputs+0x1d4>
		000000000000c378:  ARM64_RELOC_PAGE21	l_stogir.449
    c37c:      	ldr	x16, [x16]
		000000000000c37c:  ARM64_RELOC_PAGEOFF12	l_stogir.449
    c380:      	orr	x0, x16, xzr
    c384:      	mov	x1, x0
    c388:      	mov	x0, #0x1                ; =1
    c38c:      	mov	x2, #0x29               ; =41
    c390:      	str	x0, [x21]
    c394:      	str	x1, [x21, #0x8]
    c398:      	str	x2, [x21, #0x10]
    c39c:      	sub	sp, x29, #0x0
    c3a0:      	ldr	x19, [sp, #0x10]
    c3a4:      	ldr	x20, [sp, #0x18]
    c3a8:      	ldr	x21, [sp, #0x20]
    c3ac:      	ldr	x29, [sp]
    c3b0:      	ldr	x30, [sp, #0x8]
    c3b4:      	add	sp, sp, #0x30
    c3b8:      	ret
    c3bc:      	uxtb	w16, w7
    c3c0:      	cmp	w16, wzr
    c3c4:      	mov	x16, #0x6               ; =6
    c3c8:      	movz	x17, #0x0, lsl #48
    c3cc:      	csel	x1, x16, x17, ne
    c3d0:      	sxtw	x2, w2
    c3d4:      	lsr	w1, w1, #0
    c3d8:      	sxtw	x1, w1
    c3dc:      	cmp	x2, x1
    c3e0:      	b.ne	0xc968 <_stogir.stack.validate-inputs+0x648>
    c3e4:      	sxtw	x5, w5
    c3e8:      	uxtb	w16, w7
    c3ec:      	cmp	w16, wzr
    c3f0:      	b.eq	0xc478 <_stogir.stack.validate-inputs+0x158>
    c3f4:      	cmp	x5, #0x0
    c3f8:      	b.eq	0xc478 <_stogir.stack.validate-inputs+0x158>
    c3fc:      	cmp	x5, #0x0
    c400:      	b.le	0xc604 <_stogir.stack.validate-inputs+0x2e4>
    c404:      	sub	x1, x5, #0x1
    c408:      	and	x1, x1, x5
    c40c:      	cmp	x1, #0x0
    c410:      	cset	w1, eq
    c414:      	ubfx	x1, x1, #0, #8
    c418:      	b	0xc608 <_stogir.stack.validate-inputs+0x2e8>
    c41c:      	movz	x1, #0x0, lsl #48
    c420:      	movz	x2, #0x0, lsl #48
    c424:      	movz	x9, #0x0, lsl #48
    c428:      	lsr	w1, w1, #0
    c42c:      	lsr	x16, x1, #0
    c430:      	cmp	x16, #0x1
    c434:      	b.eq	0xc450 <_stogir.stack.validate-inputs+0x130>
    c438:      	b.lo	0xc440 <_stogir.stack.validate-inputs+0x120>
    c43c:      	b	0xc454 <_stogir.stack.validate-inputs+0x134>
    c440:      	cmp	x16, #0x0
    c444:      	b.eq	0xc44c <_stogir.stack.validate-inputs+0x12c>
    c448:      	b	0xc454 <_stogir.stack.validate-inputs+0x134>
    c44c:      	b	0xc458 <_stogir.stack.validate-inputs+0x138>
    c450:      	b	0xc59c <_stogir.stack.validate-inputs+0x27c>
    c454:      	b	0xc888 <_stogir.stack.validate-inputs+0x568>
    c458:      	adrp	x16, 0xc000 <_stogir.stack.validate-scope-inputs+0x1d4>
		000000000000c458:  ARM64_RELOC_PAGE21	l_stogir.450
    c45c:      	ldr	x16, [x16]
		000000000000c45c:  ARM64_RELOC_PAGEOFF12	l_stogir.450
    c460:      	orr	x0, x16, xzr
    c464:      	mov	x21, x8
    c468:      	mov	x1, x0
    c46c:      	mov	x0, #0x1                ; =1
    c470:      	mov	x2, #0x1f               ; =31
    c474:      	b	0xc390 <_stogir.stack.validate-inputs+0x70>
    c478:      	sxtw	x3, w3
    c47c:      	cmp	x3, #0x0
    c480:      	cset	w1, gt
    c484:      	movz	x16, #0x0, lsl #48
    c488:      	sub	x2, x16, x3
    c48c:      	sub	x9, x2, #0x1
    c490:      	uxtb	w16, w1
    c494:      	cmp	w16, wzr
    c498:      	b.eq	0xc550 <_stogir.stack.validate-inputs+0x230>
    c49c:      	ldr	x2, [x0, #0x8]
    c4a0:      	cmp	x3, x2
    c4a4:      	b.ge	0xc548 <_stogir.stack.validate-inputs+0x228>
    c4a8:      	add	x2, x0, #0x78
    c4ac:      	ldr	x2, [x2, #0x8]
    c4b0:      	cmp	x3, x2
    c4b4:      	b.ge	0xc5d4 <_stogir.stack.validate-inputs+0x2b4>
    c4b8:      	lsl	x2, x3, #2
    c4bc:      	ldr	x10, [x0, #0x78]
    c4c0:      	add	x2, x2, x10
    c4c4:      	ldr	w2, [x2]
    c4c8:      	sxtw	x2, w2
    c4cc:      	cmp	x2, #0x0
    c4d0:      	cset	w2, ge
    c4d4:      	ubfx	x2, x2, #0, #8
    c4d8:      	b	0xc5d8 <_stogir.stack.validate-inputs+0x2b8>
    c4dc:      	lsl	x1, x9, #4
    c4e0:      	ldr	x2, [x0, #0x28]
    c4e4:      	add	x1, x1, x2
    c4e8:      	ldr	x2, [x1]
    c4ec:      	ldr	x1, [x1, #0x8]
    c4f0:      	fmov	d31, x1
    c4f4:      	mov	x1, x2
    c4f8:      	fmov	x2, d31
    c4fc:      	mov	x9, x2
    c500:      	mov	x2, x1
    c504:      	mov	x1, #0x1                ; =1
    c508:      	b	0xc428 <_stogir.stack.validate-inputs+0x108>
    c50c:      	movz	x2, #0x0, lsl #48
    c510:      	cmp	x2, #0x0
    c514:      	b.eq	0xc41c <_stogir.stack.validate-inputs+0xfc>
    c518:      	uxtb	w16, w1
    c51c:      	cmp	w16, wzr
    c520:      	b.eq	0xc4dc <_stogir.stack.validate-inputs+0x1bc>
    c524:      	lsl	x1, x3, #4
    c528:      	ldr	x2, [x0]
    c52c:      	add	x1, x1, x2
    c530:      	ldr	x2, [x1]
    c534:      	ldr	x1, [x1, #0x8]
    c538:      	fmov	d31, x1
    c53c:      	mov	x1, x2
    c540:      	fmov	x2, d31
    c544:      	b	0xc4fc <_stogir.stack.validate-inputs+0x1dc>
    c548:      	movz	x2, #0x0, lsl #48
    c54c:      	b	0xc510 <_stogir.stack.validate-inputs+0x1f0>
    c550:      	cmp	x3, #0x0
    c554:      	b.ge	0xc50c <_stogir.stack.validate-inputs+0x1ec>
    c558:      	add	x10, x0, #0x28
    c55c:      	add	x11, x0, #0x50
    c560:      	ldr	x10, [x10, #0x8]
    c564:      	ldr	x11, [x11, #0x8]
    c568:      	cmp	x10, x11
    c56c:      	b.ne	0xc5cc <_stogir.stack.validate-inputs+0x2ac>
    c570:      	cmp	x2, x10
    c574:      	b.gt	0xc618 <_stogir.stack.validate-inputs+0x2f8>
    c578:      	lsl	x2, x9, #2
    c57c:      	ldr	x10, [x0, #0x50]
    c580:      	add	x2, x2, x10
    c584:      	ldr	w2, [x2]
    c588:      	sxtw	x2, w2
    c58c:      	cmp	x2, #0x0
    c590:      	cset	w2, gt
    c594:      	ubfx	x2, x2, #0, #8
    c598:      	b	0xc61c <_stogir.stack.validate-inputs+0x2fc>
    c59c:      	str	x2, [x6]
    c5a0:      	str	x9, [x6, #0x8]
    c5a4:      	cmp	x3, #0x0
    c5a8:      	b.gt	0xc5dc <_stogir.stack.validate-inputs+0x2bc>
    c5ac:      	mov	x21, x8
    c5b0:      	adrp	x16, 0xc000 <_stogir.stack.validate-scope-inputs+0x1d4>
		000000000000c5b0:  ARM64_RELOC_PAGE21	l_stogir.451
    c5b4:      	ldr	x16, [x16]
		000000000000c5b4:  ARM64_RELOC_PAGEOFF12	l_stogir.451
    c5b8:      	orr	x0, x16, xzr
    c5bc:      	mov	x1, x0
    c5c0:      	mov	x0, #0x1                ; =1
    c5c4:      	mov	x2, #0x1f               ; =31
    c5c8:      	b	0xc474 <_stogir.stack.validate-inputs+0x154>
    c5cc:      	movz	x2, #0x0, lsl #48
    c5d0:      	b	0xc510 <_stogir.stack.validate-inputs+0x1f0>
    c5d4:      	movz	x2, #0x0, lsl #48
    c5d8:      	b	0xc54c <_stogir.stack.validate-inputs+0x22c>
    c5dc:      	ldr	w1, [x6]
    c5e0:      	uxtb	w1, w1
    c5e4:      	cmp	x1, #0x83
    c5e8:      	b.ge	0xc620 <_stogir.stack.validate-inputs+0x300>
    c5ec:      	adrp	x16, 0xc000 <_stogir.stack.validate-scope-inputs+0x1d4>
		000000000000c5ec:  ARM64_RELOC_PAGE21	l_stogir.452
    c5f0:      	ldr	x16, [x16]
		000000000000c5f0:  ARM64_RELOC_PAGEOFF12	l_stogir.452
    c5f4:      	orr	x2, x16, xzr
    c5f8:      	add	x1, x1, x2
    c5fc:      	ldrb	w1, [x1]
    c600:      	b	0xc624 <_stogir.stack.validate-inputs+0x304>
    c604:      	movz	x1, #0x0, lsl #48
    c608:      	cmp	x1, #0x0
    c60c:      	b.ne	0xc478 <_stogir.stack.validate-inputs+0x158>
    c610:      	mov	x21, x8
    c614:      	b	0xc378 <_stogir.stack.validate-inputs+0x58>
    c618:      	movz	x2, #0x0, lsl #48
    c61c:      	b	0xc5d0 <_stogir.stack.validate-inputs+0x2b0>
    c620:      	movz	x1, #0x0, lsl #48
    c624:      	uxtb	w1, w1
    c628:      	and	x1, x1, #0x1
    c62c:      	uxtb	w1, w1
    c630:      	cmp	x1, #0x0
    c634:      	b.eq	0xc970 <_stogir.stack.validate-inputs+0x650>
    c638:      	ldr	w1, [x6]
    c63c:      	uxtb	w1, w1
    c640:      	cmp	x1, #0x83
    c644:      	b.ge	0xc660 <_stogir.stack.validate-inputs+0x340>
    c648:      	adrp	x16, 0xc000 <_stogir.stack.validate-scope-inputs+0x1d4>
		000000000000c648:  ARM64_RELOC_PAGE21	l_stogir.452
    c64c:      	ldr	x16, [x16]
		000000000000c64c:  ARM64_RELOC_PAGEOFF12	l_stogir.452
    c650:      	orr	x2, x16, xzr
    c654:      	add	x1, x1, x2
    c658:      	ldrb	w1, [x1]
    c65c:      	b	0xc664 <_stogir.stack.validate-inputs+0x344>
    c660:      	movz	x1, #0x0, lsl #48
    c664:      	uxtb	w1, w1
    c668:      	and	x1, x1, #0x4
    c66c:      	uxtb	w1, w1
    c670:      	cmp	x1, #0x0
    c674:      	b.ne	0xc978 <_stogir.stack.validate-inputs+0x658>
    c678:      	sxtw	x1, w4
    c67c:      	cmp	x1, #0x0
    c680:      	cset	w2, lt
    c684:      	cmp	x1, #0x0
    c688:      	cset	w3, gt
    c68c:      	movz	x16, #0x0, lsl #48
    c690:      	sub	x6, x16, x1
    c694:      	sub	x9, x6, #0x1
    c698:      	uxtb	w16, w3
    c69c:      	cmp	w16, wzr
    c6a0:      	b.eq	0xc7b4 <_stogir.stack.validate-inputs+0x494>
    c6a4:      	ldr	x6, [x0, #0x8]
    c6a8:      	cmp	x1, x6
    c6ac:      	b.ge	0xc7ac <_stogir.stack.validate-inputs+0x48c>
    c6b0:      	add	x6, x0, #0x78
    c6b4:      	ldr	x6, [x6, #0x8]
    c6b8:      	cmp	x1, x6
    c6bc:      	b.ge	0xc880 <_stogir.stack.validate-inputs+0x560>
    c6c0:      	lsl	x6, x1, #2
    c6c4:      	ldr	x10, [x0, #0x78]
    c6c8:      	add	x6, x6, x10
    c6cc:      	ldr	w6, [x6]
    c6d0:      	sxtw	x6, w6
    c6d4:      	cmp	x6, #0x0
    c6d8:      	cset	w6, ge
    c6dc:      	ubfx	x6, x6, #0, #8
    c6e0:      	b	0xc884 <_stogir.stack.validate-inputs+0x564>
    c6e4:      	movz	x1, #0x0, lsl #48
    c6e8:      	movz	x3, #0x0, lsl #48
    c6ec:      	movz	x6, #0x0, lsl #48
    c6f0:      	lsr	w1, w1, #0
    c6f4:      	lsr	x16, x1, #0
    c6f8:      	cmp	x16, #0x1
    c6fc:      	b.eq	0xc718 <_stogir.stack.validate-inputs+0x3f8>
    c700:      	b.lo	0xc708 <_stogir.stack.validate-inputs+0x3e8>
    c704:      	b	0xc71c <_stogir.stack.validate-inputs+0x3fc>
    c708:      	cmp	x16, #0x0
    c70c:      	b.eq	0xc714 <_stogir.stack.validate-inputs+0x3f4>
    c710:      	b	0xc71c <_stogir.stack.validate-inputs+0x3fc>
    c714:      	b	0xc720 <_stogir.stack.validate-inputs+0x400>
    c718:      	b	0xc804 <_stogir.stack.validate-inputs+0x4e4>
    c71c:      	b	0xc958 <_stogir.stack.validate-inputs+0x638>
    c720:      	adrp	x16, 0xc000 <_stogir.stack.validate-scope-inputs+0x1d4>
		000000000000c720:  ARM64_RELOC_PAGE21	l_stogir.453
    c724:      	ldr	x16, [x16]
		000000000000c724:  ARM64_RELOC_PAGEOFF12	l_stogir.453
    c728:      	orr	x0, x16, xzr
    c72c:      	mov	x21, x8
    c730:      	mov	x1, x0
    c734:      	mov	x0, #0x1                ; =1
    c738:      	mov	x2, #0x18               ; =24
    c73c:      	b	0xc5c8 <_stogir.stack.validate-inputs+0x2a8>
    c740:      	lsl	x1, x9, #4
    c744:      	ldr	x3, [x0, #0x28]
    c748:      	add	x1, x1, x3
    c74c:      	ldr	x3, [x1]
    c750:      	ldr	x1, [x1, #0x8]
    c754:      	fmov	d31, x1
    c758:      	mov	x1, x3
    c75c:      	fmov	x3, d31
    c760:      	mov	x6, x3
    c764:      	mov	x3, x1
    c768:      	mov	x1, #0x1                ; =1
    c76c:      	b	0xc6f0 <_stogir.stack.validate-inputs+0x3d0>
    c770:      	movz	x6, #0x0, lsl #48
    c774:      	cmp	x6, #0x0
    c778:      	b.eq	0xc6e4 <_stogir.stack.validate-inputs+0x3c4>
    c77c:      	uxtb	w16, w3
    c780:      	cmp	w16, wzr
    c784:      	b.eq	0xc740 <_stogir.stack.validate-inputs+0x420>
    c788:      	lsl	x1, x1, #4
    c78c:      	ldr	x3, [x0]
    c790:      	add	x1, x1, x3
    c794:      	ldr	x3, [x1]
    c798:      	ldr	x1, [x1, #0x8]
    c79c:      	fmov	d31, x1
    c7a0:      	mov	x1, x3
    c7a4:      	fmov	x3, d31
    c7a8:      	b	0xc760 <_stogir.stack.validate-inputs+0x440>
    c7ac:      	movz	x6, #0x0, lsl #48
    c7b0:      	b	0xc774 <_stogir.stack.validate-inputs+0x454>
    c7b4:      	uxtb	w16, w2
    c7b8:      	cmp	w16, wzr
    c7bc:      	b.eq	0xc770 <_stogir.stack.validate-inputs+0x450>
    c7c0:      	add	x10, x0, #0x28
    c7c4:      	add	x11, x0, #0x50
    c7c8:      	ldr	x10, [x10, #0x8]
    c7cc:      	ldr	x11, [x11, #0x8]
    c7d0:      	cmp	x10, x11
    c7d4:      	b.ne	0xc878 <_stogir.stack.validate-inputs+0x558>
    c7d8:      	cmp	x6, x10
    c7dc:      	b.gt	0xc890 <_stogir.stack.validate-inputs+0x570>
    c7e0:      	lsl	x6, x9, #2
    c7e4:      	ldr	x10, [x0, #0x50]
    c7e8:      	add	x6, x6, x10
    c7ec:      	ldr	w6, [x6]
    c7f0:      	sxtw	x6, w6
    c7f4:      	cmp	x6, #0x0
    c7f8:      	cset	w6, gt
    c7fc:      	ubfx	x6, x6, #0, #8
    c800:      	b	0xc894 <_stogir.stack.validate-inputs+0x574>
    c804:      	lsr	w1, w3, #0
    c808:      	str	x3, [x19]
    c80c:      	str	x6, [x19, #0x8]
    c810:      	ubfx	x1, x1, #8, #8
    c814:      	cmp	x1, #0x1
    c818:      	b.lt	0xc980 <_stogir.stack.validate-inputs+0x660>
    c81c:      	cmp	x1, #0xb
    c820:      	b.gt	0xc988 <_stogir.stack.validate-inputs+0x668>
    c824:      	ldr	w1, [x19]
    c828:      	uxtb	w3, w1
    c82c:      	cmp	x3, #0x48
    c830:      	b.eq	0xc990 <_stogir.stack.validate-inputs+0x670>
    c834:      	uxtb	w16, w2
    c838:      	cmp	w16, wzr
    c83c:      	b.eq	0xc998 <_stogir.stack.validate-inputs+0x678>
    c840:      	uxtb	w16, w7
    c844:      	cmp	w16, wzr
    c848:      	b.eq	0xc8f4 <_stogir.stack.validate-inputs+0x5d4>
    c84c:      	cmp	x5, #0x10
    c850:      	b.le	0xc8f4 <_stogir.stack.validate-inputs+0x5d4>
    c854:      	mov	x1, x5
    c858:      	b	0xc8f8 <_stogir.stack.validate-inputs+0x5d8>
    c85c:      	adrp	x16, 0xc000 <_stogir.stack.validate-scope-inputs+0x1d4>
		000000000000c85c:  ARM64_RELOC_PAGE21	l_stogir.454
    c860:      	ldr	x16, [x16]
		000000000000c860:  ARM64_RELOC_PAGEOFF12	l_stogir.454
    c864:      	orr	x0, x16, xzr
    c868:      	mov	x1, x0
    c86c:      	mov	x0, #0x1                ; =1
    c870:      	mov	x2, #0x29               ; =41
    c874:      	b	0xc73c <_stogir.stack.validate-inputs+0x41c>
    c878:      	movz	x6, #0x0, lsl #48
    c87c:      	b	0xc774 <_stogir.stack.validate-inputs+0x454>
    c880:      	movz	x6, #0x0, lsl #48
    c884:      	b	0xc7b0 <_stogir.stack.validate-inputs+0x490>
    c888:      	brk	#0
    c88c:      	b	0xc888 <_stogir.stack.validate-inputs+0x568>
    c890:      	movz	x6, #0x0, lsl #48
    c894:      	b	0xc87c <_stogir.stack.validate-inputs+0x55c>
    c898:      	ubfx	x0, x1, #8, #8
    c89c:      	lsr	w0, w0, #0
    c8a0:      	mov	x1, #0x8                ; =8
    c8a4:      	bl	0xc8a4 <_stogir.stack.validate-inputs+0x584>
		000000000000c8a4:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    c8a8:      	lsr	w0, w0, #0
    c8ac:      	sxtw	x0, w0
    c8b0:      	and	x0, x0, #0xffffffff
    c8b4:      	mov	x1, x0
    c8b8:      	movz	x0, #0x0, lsl #48
    c8bc:      	movz	x2, #0x0, lsl #48
    c8c0:      	b	0xc874 <_stogir.stack.validate-inputs+0x554>
    c8c4:      	ldr	w0, [x19]
    c8c8:      	ubfx	x0, x0, #8, #8
    c8cc:      	lsr	w0, w0, #0
    c8d0:      	mov	x1, #0x8                ; =8
    c8d4:      	bl	0xc8d4 <_stogir.stack.validate-inputs+0x5b4>
		000000000000c8d4:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    c8d8:      	lsr	w0, w0, #0
    c8dc:      	sxtw	x0, w0
    c8e0:      	and	x0, x0, #0xffffffff
    c8e4:      	mov	x1, x0
    c8e8:      	movz	x0, #0x0, lsl #48
    c8ec:      	movz	x2, #0x0, lsl #48
    c8f0:      	b	0xc8c0 <_stogir.stack.validate-inputs+0x5a0>
    c8f4:      	mov	x1, #0x10               ; =16
    c8f8:      	lsr	w4, w4, #0
    c8fc:      	mov	x2, x1
    c900:      	mov	w1, w4
    c904:      	mov	x21, x8
    c908:      	mov	x8, x20
    c90c:      	bl	0xc90c <_stogir.stack.validate-inputs+0x5ec>
		000000000000c90c:  ARM64_RELOC_BRANCH26	_stogir.stack.constant-size-aligned
    c910:      	ldr	w0, [x20]
    c914:      	lsr	x16, x0, #0
    c918:      	cmp	x16, #0x1
    c91c:      	b.eq	0xc938 <_stogir.stack.validate-inputs+0x618>
    c920:      	b.lo	0xc928 <_stogir.stack.validate-inputs+0x608>
    c924:      	b	0xc93c <_stogir.stack.validate-inputs+0x61c>
    c928:      	cmp	x16, #0x0
    c92c:      	b.eq	0xc934 <_stogir.stack.validate-inputs+0x614>
    c930:      	b	0xc93c <_stogir.stack.validate-inputs+0x61c>
    c934:      	b	0xc8c4 <_stogir.stack.validate-inputs+0x5a4>
    c938:      	b	0xc940 <_stogir.stack.validate-inputs+0x620>
    c93c:      	b	0xc960 <_stogir.stack.validate-inputs+0x640>
    c940:      	add	x0, x20, #0x8
    c944:      	ldr	x1, [x20, #0x8]
    c948:      	ldr	x0, [x0, #0x8]
    c94c:      	mov	x2, x0
    c950:      	mov	x0, #0x1                ; =1
    c954:      	b	0xc8f0 <_stogir.stack.validate-inputs+0x5d0>
    c958:      	brk	#0
    c95c:      	b	0xc958 <_stogir.stack.validate-inputs+0x638>
    c960:      	brk	#0
    c964:      	b	0xc960 <_stogir.stack.validate-inputs+0x640>
    c968:      	mov	x21, x8
    c96c:      	b	0xc378 <_stogir.stack.validate-inputs+0x58>
    c970:      	mov	x21, x8
    c974:      	b	0xc5b0 <_stogir.stack.validate-inputs+0x290>
    c978:      	mov	x21, x8
    c97c:      	b	0xc5b0 <_stogir.stack.validate-inputs+0x290>
    c980:      	mov	x21, x8
    c984:      	b	0xc85c <_stogir.stack.validate-inputs+0x53c>
    c988:      	mov	x21, x8
    c98c:      	b	0xc85c <_stogir.stack.validate-inputs+0x53c>
    c990:      	mov	x21, x8
    c994:      	b	0xc85c <_stogir.stack.validate-inputs+0x53c>
    c998:      	mov	x21, x8
    c99c:      	b	0xc898 <_stogir.stack.validate-inputs+0x578>

000000000000c9a0 <_stogir.locals.shape>:
    c9a0:      	sub	sp, sp, #0x40
    c9a4:      	str	x29, [sp]
    c9a8:      	str	x30, [sp, #0x8]
    c9ac:      	mov	x29, sp
    c9b0:      	str	x19, [sp, #0x10]
    c9b4:      	str	x20, [sp, #0x18]
    c9b8:      	str	x21, [sp, #0x20]
    c9bc:      	str	x22, [sp, #0x28]
    c9c0:      	str	x23, [sp, #0x30]
    c9c4:      	str	x24, [sp, #0x38]
    c9c8:      	sub	sp, sp, #0x10
    c9cc:      	mov	x19, sp
    c9d0:      	sxtw	x20, w1
    c9d4:      	sub	sp, sp, #0x10
    c9d8:      	mov	x21, sp
    c9dc:      	lsl	x22, x20, #2
    c9e0:      	cmp	x20, #0x0
    c9e4:      	cset	w1, gt
    c9e8:      	movz	x16, #0x0, lsl #48
    c9ec:      	sub	x3, x16, x20
    c9f0:      	sub	x4, x3, #0x1
    c9f4:      	uxtb	w16, w1
    c9f8:      	cmp	w16, wzr
    c9fc:      	b.eq	0xca3c <_stogir.locals.shape+0x9c>
    ca00:      	ldr	x3, [x0, #0x8]
    ca04:      	cmp	x20, x3
    ca08:      	b.ge	0xcaac <_stogir.locals.shape+0x10c>
    ca0c:      	add	x3, x0, #0x78
    ca10:      	ldr	x3, [x3, #0x8]
    ca14:      	cmp	x20, x3
    ca18:      	b.ge	0xcc7c <_stogir.locals.shape+0x2dc>
    ca1c:      	ldr	x3, [x0, #0x78]
    ca20:      	add	x3, x22, x3
    ca24:      	ldr	w3, [x3]
    ca28:      	sxtw	x3, w3
    ca2c:      	cmp	x3, #0x0
    ca30:      	cset	w3, ge
    ca34:      	ubfx	x3, x3, #0, #8
    ca38:      	b	0xcc80 <_stogir.locals.shape+0x2e0>
    ca3c:      	cmp	x20, #0x0
    ca40:      	b.ge	0xcab4 <_stogir.locals.shape+0x114>
    ca44:      	add	x5, x0, #0x28
    ca48:      	add	x6, x0, #0x50
    ca4c:      	ldr	x5, [x5, #0x8]
    ca50:      	ldr	x6, [x6, #0x8]
    ca54:      	cmp	x5, x6
    ca58:      	b.ne	0xca88 <_stogir.locals.shape+0xe8>
    ca5c:      	cmp	x3, x5
    ca60:      	b.gt	0xcce8 <_stogir.locals.shape+0x348>
    ca64:      	lsl	x3, x4, #2
    ca68:      	ldr	x5, [x0, #0x50]
    ca6c:      	add	x3, x3, x5
    ca70:      	ldr	w3, [x3]
    ca74:      	sxtw	x3, w3
    ca78:      	cmp	x3, #0x0
    ca7c:      	cset	w3, gt
    ca80:      	ubfx	x3, x3, #0, #8
    ca84:      	b	0xccec <_stogir.locals.shape+0x34c>
    ca88:      	movz	x3, #0x0, lsl #48
    ca8c:      	b	0xcab8 <_stogir.locals.shape+0x118>
    ca90:      	adrp	x16, 0xc000 <_stogir.stack.validate-scope-inputs+0x1d4>
		000000000000ca90:  ARM64_RELOC_PAGE21	l_stogir.455
    ca94:      	ldr	x16, [x16]
		000000000000ca94:  ARM64_RELOC_PAGEOFF12	l_stogir.455
    ca98:      	orr	x0, x16, xzr
    ca9c:      	mov	x1, x0
    caa0:      	mov	x0, #0x1                ; =1
    caa4:      	mov	x2, #0x1c               ; =28
    caa8:      	b	0xcb78 <_stogir.locals.shape+0x1d8>
    caac:      	movz	x3, #0x0, lsl #48
    cab0:      	b	0xcab8 <_stogir.locals.shape+0x118>
    cab4:      	movz	x3, #0x0, lsl #48
    cab8:      	cmp	x3, #0x0
    cabc:      	b.eq	0xcb20 <_stogir.locals.shape+0x180>
    cac0:      	uxtb	w16, w1
    cac4:      	cmp	w16, wzr
    cac8:      	b.eq	0xcaf0 <_stogir.locals.shape+0x150>
    cacc:      	lsl	x1, x20, #4
    cad0:      	ldr	x3, [x0]
    cad4:      	add	x1, x1, x3
    cad8:      	ldr	x3, [x1]
    cadc:      	ldr	x1, [x1, #0x8]
    cae0:      	fmov	d31, x1
    cae4:      	mov	x1, x3
    cae8:      	fmov	x3, d31
    caec:      	b	0xcb10 <_stogir.locals.shape+0x170>
    caf0:      	lsl	x1, x4, #4
    caf4:      	ldr	x3, [x0, #0x28]
    caf8:      	add	x1, x1, x3
    cafc:      	ldr	x3, [x1]
    cb00:      	ldr	x1, [x1, #0x8]
    cb04:      	fmov	d31, x1
    cb08:      	mov	x1, x3
    cb0c:      	fmov	x3, d31
    cb10:      	mov	x4, x3
    cb14:      	mov	x3, x1
    cb18:      	mov	x1, #0x1                ; =1
    cb1c:      	b	0xcb2c <_stogir.locals.shape+0x18c>
    cb20:      	movz	x1, #0x0, lsl #48
    cb24:      	movz	x3, #0x0, lsl #48
    cb28:      	movz	x4, #0x0, lsl #48
    cb2c:      	lsr	w1, w1, #0
    cb30:      	lsr	x16, x1, #0
    cb34:      	cmp	x16, #0x1
    cb38:      	b.eq	0xcb54 <_stogir.locals.shape+0x1b4>
    cb3c:      	b.lo	0xcb44 <_stogir.locals.shape+0x1a4>
    cb40:      	b	0xcb58 <_stogir.locals.shape+0x1b8>
    cb44:      	cmp	x16, #0x0
    cb48:      	b.eq	0xcb50 <_stogir.locals.shape+0x1b0>
    cb4c:      	b	0xcb58 <_stogir.locals.shape+0x1b8>
    cb50:      	b	0xcb5c <_stogir.locals.shape+0x1bc>
    cb54:      	b	0xcbb0 <_stogir.locals.shape+0x210>
    cb58:      	b	0xcd3c <_stogir.locals.shape+0x39c>
    cb5c:      	adrp	x16, 0xc000 <_stogir.stack.validate-scope-inputs+0x1d4>
		000000000000cb5c:  ARM64_RELOC_PAGE21	l_stogir.456
    cb60:      	ldr	x16, [x16]
		000000000000cb60:  ARM64_RELOC_PAGEOFF12	l_stogir.456
    cb64:      	orr	x0, x16, xzr
    cb68:      	mov	x23, x8
    cb6c:      	mov	x1, x0
    cb70:      	mov	x0, #0x1                ; =1
    cb74:      	mov	x2, #0x16               ; =22
    cb78:      	str	x0, [x23]
    cb7c:      	str	x1, [x23, #0x8]
    cb80:      	str	x2, [x23, #0x10]
    cb84:      	sub	sp, x29, #0x0
    cb88:      	ldr	x19, [sp, #0x10]
    cb8c:      	ldr	x20, [sp, #0x18]
    cb90:      	ldr	x21, [sp, #0x20]
    cb94:      	ldr	x22, [sp, #0x28]
    cb98:      	ldr	x23, [sp, #0x30]
    cb9c:      	ldr	x24, [sp, #0x38]
    cba0:      	ldr	x29, [sp]
    cba4:      	ldr	x30, [sp, #0x8]
    cba8:      	add	sp, sp, #0x40
    cbac:      	ret
    cbb0:      	lsr	w2, w2, #0
    cbb4:      	lsr	w1, w3, #0
    cbb8:      	str	x3, [x19]
    cbbc:      	str	x4, [x19, #0x8]
    cbc0:      	ubfx	x1, x1, #8, #8
    cbc4:      	lsr	w1, w1, #0
    cbc8:      	mov	x23, x8
    cbcc:      	mov	x24, x0
    cbd0:      	mov	w0, w1
    cbd4:      	mov	w1, w2
    cbd8:      	bl	0xcbd8 <_stogir.locals.shape+0x238>
		000000000000cbd8:  ARM64_RELOC_BRANCH26	_stogir.types.size
    cbdc:      	lsr	w0, w0, #0
    cbe0:      	ldr	w1, [x19, #0xc]
    cbe4:      	sxtw	x0, w0
    cbe8:      	sxtw	x1, w1
    cbec:      	cmp	x1, #0x0
    cbf0:      	b.ne	0xcbf8 <_stogir.locals.shape+0x258>
    cbf4:      	mov	x1, x0
    cbf8:      	ldr	w2, [x19, #0x8]
    cbfc:      	sxtw	x2, w2
    cc00:      	cmp	x2, #0x0
    cc04:      	cset	w3, eq
    cc08:      	ubfx	x3, x3, #0, #8
    cc0c:      	cmp	x2, #0x0
    cc10:      	b.le	0xcc84 <_stogir.locals.shape+0x2e4>
    cc14:      	cmp	x2, #0x0
    cc18:      	b.le	0xccf8 <_stogir.locals.shape+0x358>
    cc1c:      	add	x4, x24, #0x110
    cc20:      	add	x5, x4, #0x28
    cc24:      	ldr	x5, [x5, #0x8]
    cc28:      	cmp	x2, x5
    cc2c:      	b.gt	0xccf8 <_stogir.locals.shape+0x358>
    cc30:      	sub	x2, x2, #0x1
    cc34:      	mov	x17, #0x18              ; =24
    cc38:      	mul	x2, x2, x17
    cc3c:      	ldr	x5, [x4, #0x28]
    cc40:      	add	x2, x2, x5
    cc44:      	ldr	x5, [x2]
    cc48:      	ldr	x2, [x2, #0x8]
    cc4c:      	ldr	x4, [x4, #0x8]
    cc50:      	cmp	x5, #0x0
    cc54:      	b.lt	0xcd34 <_stogir.locals.shape+0x394>
    cc58:      	cmp	x5, x4
    cc5c:      	b.gt	0xcd34 <_stogir.locals.shape+0x394>
    cc60:      	cmp	x2, #0x0
    cc64:      	b.lt	0xcd34 <_stogir.locals.shape+0x394>
    cc68:      	sub	x4, x4, x5
    cc6c:      	cmp	x2, x4
    cc70:      	b.gt	0xcd34 <_stogir.locals.shape+0x394>
    cc74:      	mov	x2, #0x1                ; =1
    cc78:      	b	0xcd38 <_stogir.locals.shape+0x398>
    cc7c:      	movz	x3, #0x0, lsl #48
    cc80:      	b	0xcab0 <_stogir.locals.shape+0x110>
    cc84:      	mov	x2, x3
    cc88:      	cmp	x20, #0x0
    cc8c:      	b.le	0xca90 <_stogir.locals.shape+0xf0>
    cc90:      	ldr	w3, [x19]
    cc94:      	uxtb	w3, w3
    cc98:      	cmp	x3, #0x48
    cc9c:      	b.ne	0xca90 <_stogir.locals.shape+0xf0>
    cca0:      	ldr	x3, [x24, #0x78]
    cca4:      	add	x3, x22, x3
    cca8:      	ldr	w3, [x3]
    ccac:      	sxtw	x3, w3
    ccb0:      	cmp	x3, #0x3
    ccb4:      	b.ne	0xca90 <_stogir.locals.shape+0xf0>
    ccb8:      	cmp	x0, #0x0
    ccbc:      	b.le	0xca90 <_stogir.locals.shape+0xf0>
    ccc0:      	cmp	x2, #0x0
    ccc4:      	b.eq	0xca90 <_stogir.locals.shape+0xf0>
    ccc8:      	cmp	x1, #0x0
    cccc:      	b.le	0xcd44 <_stogir.locals.shape+0x3a4>
    ccd0:      	sub	x2, x1, #0x1
    ccd4:      	and	x2, x2, x1
    ccd8:      	cmp	x2, #0x0
    ccdc:      	cset	w2, eq
    cce0:      	ubfx	x2, x2, #0, #8
    cce4:      	b	0xcd48 <_stogir.locals.shape+0x3a8>
    cce8:      	movz	x3, #0x0, lsl #48
    ccec:      	b	0xca8c <_stogir.locals.shape+0xec>
    ccf0:      	mov	x2, #0x1                ; =1
    ccf4:      	b	0xcc88 <_stogir.locals.shape+0x2e8>
    ccf8:      	movz	x2, #0x0, lsl #48
    ccfc:      	lsr	w2, w2, #0
    cd00:      	lsr	x16, x2, #0
    cd04:      	cmp	x16, #0x1
    cd08:      	b.eq	0xcd24 <_stogir.locals.shape+0x384>
    cd0c:      	b.lo	0xcd14 <_stogir.locals.shape+0x374>
    cd10:      	b	0xcd28 <_stogir.locals.shape+0x388>
    cd14:      	cmp	x16, #0x0
    cd18:      	b.eq	0xcd20 <_stogir.locals.shape+0x380>
    cd1c:      	b	0xcd28 <_stogir.locals.shape+0x388>
    cd20:      	b	0xcd2c <_stogir.locals.shape+0x38c>
    cd24:      	b	0xccf0 <_stogir.locals.shape+0x350>
    cd28:      	b	0xce20 <_stogir.locals.shape+0x480>
    cd2c:      	mov	x2, x3
    cd30:      	b	0xccf4 <_stogir.locals.shape+0x354>
    cd34:      	movz	x2, #0x0, lsl #48
    cd38:      	b	0xccfc <_stogir.locals.shape+0x35c>
    cd3c:      	brk	#0
    cd40:      	b	0xcd3c <_stogir.locals.shape+0x39c>
    cd44:      	movz	x2, #0x0, lsl #48
    cd48:      	cmp	x2, #0x0
    cd4c:      	b.eq	0xca90 <_stogir.locals.shape+0xf0>
    cd50:      	ldr	w2, [x19, #0x4]
    cd54:      	sxtw	x2, w2
    cd58:      	cmp	x2, #0x0
    cd5c:      	cset	w3, gt
    cd60:      	movz	x16, #0x0, lsl #48
    cd64:      	sub	x4, x16, x2
    cd68:      	sub	x5, x4, #0x1
    cd6c:      	uxtb	w16, w3
    cd70:      	cmp	w16, wzr
    cd74:      	b.eq	0xcdd4 <_stogir.locals.shape+0x434>
    cd78:      	ldr	x4, [x24, #0x8]
    cd7c:      	cmp	x2, x4
    cd80:      	b.ge	0xce28 <_stogir.locals.shape+0x488>
    cd84:      	add	x4, x24, #0x78
    cd88:      	ldr	x4, [x4, #0x8]
    cd8c:      	cmp	x2, x4
    cd90:      	b.ge	0xcf3c <_stogir.locals.shape+0x59c>
    cd94:      	lsl	x4, x2, #2
    cd98:      	ldr	x6, [x24, #0x78]
    cd9c:      	add	x4, x4, x6
    cda0:      	ldr	w4, [x4]
    cda4:      	sxtw	x4, w4
    cda8:      	cmp	x4, #0x0
    cdac:      	cset	w4, ge
    cdb0:      	ubfx	x4, x4, #0, #8
    cdb4:      	b	0xcf40 <_stogir.locals.shape+0x5a0>
    cdb8:      	adrp	x16, 0xc000 <_stogir.stack.validate-scope-inputs+0x1d4>
		000000000000cdb8:  ARM64_RELOC_PAGE21	l_stogir.457
    cdbc:      	ldr	x16, [x16]
		000000000000cdbc:  ARM64_RELOC_PAGEOFF12	l_stogir.457
    cdc0:      	orr	x0, x16, xzr
    cdc4:      	mov	x1, x0
    cdc8:      	mov	x0, #0x1                ; =1
    cdcc:      	mov	x2, #0x2c               ; =44
    cdd0:      	b	0xcaa8 <_stogir.locals.shape+0x108>
    cdd4:      	cmp	x2, #0x0
    cdd8:      	b.ge	0xce30 <_stogir.locals.shape+0x490>
    cddc:      	add	x6, x24, #0x28
    cde0:      	add	x7, x24, #0x50
    cde4:      	ldr	x6, [x6, #0x8]
    cde8:      	ldr	x7, [x7, #0x8]
    cdec:      	cmp	x6, x7
    cdf0:      	b.ne	0xcf34 <_stogir.locals.shape+0x594>
    cdf4:      	cmp	x4, x6
    cdf8:      	b.gt	0xcf44 <_stogir.locals.shape+0x5a4>
    cdfc:      	lsl	x4, x5, #2
    ce00:      	ldr	x6, [x24, #0x50]
    ce04:      	add	x4, x4, x6
    ce08:      	ldr	w4, [x4]
    ce0c:      	sxtw	x4, w4
    ce10:      	cmp	x4, #0x0
    ce14:      	cset	w4, gt
    ce18:      	ubfx	x4, x4, #0, #8
    ce1c:      	b	0xcf48 <_stogir.locals.shape+0x5a8>
    ce20:      	brk	#0
    ce24:      	b	0xce20 <_stogir.locals.shape+0x480>
    ce28:      	movz	x4, #0x0, lsl #48
    ce2c:      	b	0xce34 <_stogir.locals.shape+0x494>
    ce30:      	movz	x4, #0x0, lsl #48
    ce34:      	cmp	x4, #0x0
    ce38:      	b.eq	0xce9c <_stogir.locals.shape+0x4fc>
    ce3c:      	uxtb	w16, w3
    ce40:      	cmp	w16, wzr
    ce44:      	b.eq	0xce6c <_stogir.locals.shape+0x4cc>
    ce48:      	lsl	x2, x2, #4
    ce4c:      	ldr	x3, [x24]
    ce50:      	add	x2, x2, x3
    ce54:      	ldr	x3, [x2]
    ce58:      	ldr	x2, [x2, #0x8]
    ce5c:      	fmov	d31, x2
    ce60:      	mov	x2, x3
    ce64:      	fmov	x3, d31
    ce68:      	b	0xce8c <_stogir.locals.shape+0x4ec>
    ce6c:      	lsl	x2, x5, #4
    ce70:      	ldr	x3, [x24, #0x28]
    ce74:      	add	x2, x2, x3
    ce78:      	ldr	x3, [x2]
    ce7c:      	ldr	x2, [x2, #0x8]
    ce80:      	fmov	d31, x2
    ce84:      	mov	x2, x3
    ce88:      	fmov	x3, d31
    ce8c:      	mov	x4, x3
    ce90:      	mov	x3, x2
    ce94:      	mov	x2, #0x1                ; =1
    ce98:      	b	0xcea8 <_stogir.locals.shape+0x508>
    ce9c:      	movz	x2, #0x0, lsl #48
    cea0:      	movz	x3, #0x0, lsl #48
    cea4:      	movz	x4, #0x0, lsl #48
    cea8:      	lsr	w2, w2, #0
    ceac:      	lsr	x16, x2, #0
    ceb0:      	cmp	x16, #0x1
    ceb4:      	b.eq	0xced0 <_stogir.locals.shape+0x530>
    ceb8:      	b.lo	0xcec0 <_stogir.locals.shape+0x520>
    cebc:      	b	0xced4 <_stogir.locals.shape+0x534>
    cec0:      	cmp	x16, #0x0
    cec4:      	b.eq	0xcecc <_stogir.locals.shape+0x52c>
    cec8:      	b	0xced4 <_stogir.locals.shape+0x534>
    cecc:      	b	0xced8 <_stogir.locals.shape+0x538>
    ced0:      	b	0xcef4 <_stogir.locals.shape+0x554>
    ced4:      	b	0xcf74 <_stogir.locals.shape+0x5d4>
    ced8:      	adrp	x16, 0xc000 <_stogir.stack.validate-scope-inputs+0x1d4>
		000000000000ced8:  ARM64_RELOC_PAGE21	l_stogir.458
    cedc:      	ldr	x16, [x16]
		000000000000cedc:  ARM64_RELOC_PAGEOFF12	l_stogir.458
    cee0:      	orr	x0, x16, xzr
    cee4:      	mov	x1, x0
    cee8:      	mov	x0, #0x1                ; =1
    ceec:      	mov	x2, #0x1d               ; =29
    cef0:      	b	0xcdd0 <_stogir.locals.shape+0x430>
    cef4:      	str	x3, [x21]
    cef8:      	str	x4, [x21, #0x8]
    cefc:      	ldr	w2, [x19, #0x4]
    cf00:      	sxtw	x2, w2
    cf04:      	cmp	x2, #0x0
    cf08:      	b.le	0xcdb8 <_stogir.locals.shape+0x418>
    cf0c:      	ldr	w2, [x21]
    cf10:      	uxtb	w2, w2
    cf14:      	cmp	x2, #0x83
    cf18:      	b.ge	0xcf4c <_stogir.locals.shape+0x5ac>
    cf1c:      	adrp	x16, 0xc000 <_stogir.stack.validate-scope-inputs+0x1d4>
		000000000000cf1c:  ARM64_RELOC_PAGE21	l_stogir.459
    cf20:      	ldr	x16, [x16]
		000000000000cf20:  ARM64_RELOC_PAGEOFF12	l_stogir.459
    cf24:      	orr	x3, x16, xzr
    cf28:      	add	x2, x2, x3
    cf2c:      	ldrb	w2, [x2]
    cf30:      	b	0xcf50 <_stogir.locals.shape+0x5b0>
    cf34:      	movz	x4, #0x0, lsl #48
    cf38:      	b	0xce34 <_stogir.locals.shape+0x494>
    cf3c:      	movz	x4, #0x0, lsl #48
    cf40:      	b	0xce2c <_stogir.locals.shape+0x48c>
    cf44:      	movz	x4, #0x0, lsl #48
    cf48:      	b	0xcf38 <_stogir.locals.shape+0x598>
    cf4c:      	movz	x2, #0x0, lsl #48
    cf50:      	uxtb	w2, w2
    cf54:      	and	x2, x2, #0x2
    cf58:      	uxtb	w2, w2
    cf5c:      	cmp	x2, #0x0
    cf60:      	b.eq	0xcdb8 <_stogir.locals.shape+0x418>
    cf64:      	mov	x2, x1
    cf68:      	mov	x1, x0
    cf6c:      	movz	x0, #0x0, lsl #48
    cf70:      	b	0xcdd0 <_stogir.locals.shape+0x430>
    cf74:      	brk	#0
    cf78:      	b	0xcf74 <_stogir.locals.shape+0x5d4>

000000000000cf7c <_stogir.conversion.policy>:
    cf7c:      	sub	sp, sp, #0x70
    cf80:      	str	x29, [sp]
    cf84:      	str	x30, [sp, #0x8]
    cf88:      	mov	x29, sp
    cf8c:      	str	x19, [sp, #0x20]
    cf90:      	str	x20, [sp, #0x28]
    cf94:      	str	x21, [sp, #0x30]
    cf98:      	str	x22, [sp, #0x38]
    cf9c:      	str	x23, [sp, #0x40]
    cfa0:      	str	x24, [sp, #0x48]
    cfa4:      	str	x25, [sp, #0x50]
    cfa8:      	str	x26, [sp, #0x58]
    cfac:      	str	x27, [sp, #0x60]
    cfb0:      	str	x28, [sp, #0x68]
    cfb4:      	sxtw	x19, w0
    cfb8:      	sxtw	x20, w1
    cfbc:      	sxtw	x21, w2
    cfc0:      	cmp	x19, #0x24
    cfc4:      	b.ne	0xd014 <_stogir.conversion.policy+0x98>
    cfc8:      	cmp	x20, #0xf
    cfcc:      	b.le	0xd248 <_stogir.conversion.policy+0x2cc>
    cfd0:      	cmp	x20, #0x80
    cfd4:      	b.ge	0xd248 <_stogir.conversion.policy+0x2cc>
    cfd8:      	and	x0, x20, #0xf
    cfdc:      	lsr	w0, w0, #0
    cfe0:      	sxtw	x0, w0
    cfe4:      	cmp	x0, #0x1
    cfe8:      	b.lt	0xd248 <_stogir.conversion.policy+0x2cc>
    cfec:      	and	x0, x20, #0xf
    cff0:      	lsr	w0, w0, #0
    cff4:      	sxtw	x0, w0
    cff8:      	cmp	x0, #0xd
    cffc:      	b.gt	0xd248 <_stogir.conversion.policy+0x2cc>
    d000:      	mov	x0, #0x1                ; =1
    d004:      	b	0xd00c <_stogir.conversion.policy+0x90>
    d008:      	movz	x0, #0x0, lsl #48
    d00c:      	mov	x22, x0
    d010:      	b	0xd018 <_stogir.conversion.policy+0x9c>
    d014:      	movz	x22, #0x0, lsl #48
    d018:      	sxtw	x23, w3
    d01c:      	cmp	x20, #0xd
    d020:      	cset	w24, eq
    d024:      	cmp	x20, #0xc
    d028:      	cset	w25, eq
    d02c:      	cmp	x23, #0x4
    d030:      	cset	w26, eq
    d034:      	cmp	x23, #0x8
    d038:      	cset	w27, eq
    d03c:      	cmp	x22, #0x0
    d040:      	b.eq	0xd53c <_stogir.conversion.policy+0x5c0>
    d044:      	lsr	w1, w1, #0
    d048:      	lsr	w3, w3, #0
    d04c:      	mov	w0, w1
    d050:      	mov	w1, w3
    d054:      	str	x8, [sp, #0x18]
    d058:      	mov	w28, w3
    d05c:      	str	x23, [sp, #0x10]
    d060:      	mov	w23, w2
    d064:      	bl	0xd064 <_stogir.conversion.policy+0xe8>
		000000000000d064:  ARM64_RELOC_BRANCH26	_stogir.types.size
    d068:      	lsr	w0, w0, #0
    d06c:      	sxtw	x0, w0
    d070:      	b	0xd080 <_stogir.conversion.policy+0x104>
    d074:      	mov	x0, #0x1                ; =1
    d078:      	lsr	w0, w0, #0
    d07c:      	sxtw	x0, w0
    d080:      	cmp	x21, #0xd
    d084:      	cset	w1, eq
    d088:      	cmp	x21, #0xc
    d08c:      	cset	w2, eq
    d090:      	cmp	x22, #0x0
    d094:      	b.eq	0xd550 <_stogir.conversion.policy+0x5d4>
    d098:      	lsr	w23, w23, #0
    d09c:      	lsr	w28, w28, #0
    d0a0:      	mov	x22, x0
    d0a4:      	mov	w0, w23
    d0a8:      	mov	w23, w1
    d0ac:      	mov	w1, w28
    d0b0:      	mov	w28, w2
    d0b4:      	bl	0xd0b4 <_stogir.conversion.policy+0x138>
		000000000000d0b4:  ARM64_RELOC_BRANCH26	_stogir.types.size
    d0b8:      	lsr	w0, w0, #0
    d0bc:      	sxtw	x0, w0
    d0c0:      	b	0xd0d0 <_stogir.conversion.policy+0x154>
    d0c4:      	mov	x0, #0x1                ; =1
    d0c8:      	lsr	w0, w0, #0
    d0cc:      	sxtw	x0, w0
    d0d0:      	cmp	x19, #0x21
    d0d4:      	b.lt	0xd1c8 <_stogir.conversion.policy+0x24c>
    d0d8:      	cmp	x19, #0x27
    d0dc:      	cset	w1, le
    d0e0:      	uxtb	w16, w1
    d0e4:      	cmp	w16, wzr
    d0e8:      	b.eq	0xd1c8 <_stogir.conversion.policy+0x24c>
    d0ec:      	lsl	x2, x22, #3
    d0f0:      	lsr	w2, w2, #0
    d0f4:      	sxtw	x2, w2
    d0f8:      	cmp	x2, #0x0
    d0fc:      	b.le	0xd1c8 <_stogir.conversion.policy+0x24c>
    d100:      	lsl	x0, x0, #3
    d104:      	lsr	w0, w0, #0
    d108:      	sxtw	x0, w0
    d10c:      	cmp	x0, #0x0
    d110:      	b.le	0xd1c8 <_stogir.conversion.policy+0x24c>
    d114:      	cmp	x19, #0x26
    d118:      	cset	w3, eq
    d11c:      	cmp	x20, #0x1
    d120:      	cset	w4, ge
    d124:      	cmp	x20, #0xb
    d128:      	cset	w5, le
    d12c:      	cmp	x21, #0x1
    d130:      	cset	w6, ge
    d134:      	cmp	x21, #0xb
    d138:      	cset	w7, le
    d13c:      	cmp	x19, #0x25
    d140:      	b.lt	0xd3c0 <_stogir.conversion.policy+0x444>
    d144:      	uxtb	w16, w1
    d148:      	cmp	w16, wzr
    d14c:      	b.eq	0xd3c0 <_stogir.conversion.policy+0x444>
    d150:      	ubfx	x23, x23, #0, #8
    d154:      	cmp	x19, #0x25
    d158:      	b.ne	0xd45c <_stogir.conversion.policy+0x4e0>
    d15c:      	uxtb	w16, w4
    d160:      	cmp	w16, wzr
    d164:      	b.eq	0xd454 <_stogir.conversion.policy+0x4d8>
    d168:      	uxtb	w16, w5
    d16c:      	cmp	w16, wzr
    d170:      	b.eq	0xd454 <_stogir.conversion.policy+0x4d8>
    d174:      	uxtb	w16, w28
    d178:      	cmp	w16, wzr
    d17c:      	b.eq	0xd4d0 <_stogir.conversion.policy+0x554>
    d180:      	mov	x1, #0x1                ; =1
    d184:      	b	0xd4d4 <_stogir.conversion.policy+0x558>
    d188:      	uxtb	w16, w26
    d18c:      	cmp	w16, wzr
    d190:      	b.ne	0xd228 <_stogir.conversion.policy+0x2ac>
    d194:      	uxtb	w16, w27
    d198:      	cmp	w16, wzr
    d19c:      	b.ne	0xd228 <_stogir.conversion.policy+0x2ac>
    d1a0:      	movn	x0, #0x0, lsl #48
    d1a4:      	b	0xd0c8 <_stogir.conversion.policy+0x14c>
    d1a8:      	uxtb	w16, w26
    d1ac:      	cmp	w16, wzr
    d1b0:      	b.ne	0xd238 <_stogir.conversion.policy+0x2bc>
    d1b4:      	uxtb	w16, w27
    d1b8:      	cmp	w16, wzr
    d1bc:      	b.ne	0xd238 <_stogir.conversion.policy+0x2bc>
    d1c0:      	movn	x0, #0x0, lsl #48
    d1c4:      	b	0xd078 <_stogir.conversion.policy+0xfc>
    d1c8:      	adrp	x16, 0xd000 <_stogir.conversion.policy+0x84>
		000000000000d1c8:  ARM64_RELOC_PAGE21	l_stogir.460
    d1cc:      	ldr	x16, [x16]
		000000000000d1cc:  ARM64_RELOC_PAGEOFF12	l_stogir.460
    d1d0:      	orr	x0, x16, xzr
    d1d4:      	mov	x1, x0
    d1d8:      	mov	x0, #0x1                ; =1
    d1dc:      	mov	x2, #0x22               ; =34
    d1e0:      	ldr	x3, [sp, #0x18]
    d1e4:      	str	x0, [x3]
    d1e8:      	str	x1, [x3, #0x8]
    d1ec:      	str	x2, [x3, #0x10]
    d1f0:      	ldr	x19, [sp, #0x20]
    d1f4:      	ldr	x20, [sp, #0x28]
    d1f8:      	ldr	x21, [sp, #0x30]
    d1fc:      	ldr	x22, [sp, #0x38]
    d200:      	ldr	x23, [sp, #0x40]
    d204:      	ldr	x24, [sp, #0x48]
    d208:      	ldr	x25, [sp, #0x50]
    d20c:      	ldr	x26, [sp, #0x58]
    d210:      	ldr	x27, [sp, #0x60]
    d214:      	ldr	x28, [sp, #0x68]
    d218:      	ldr	x29, [sp]
    d21c:      	ldr	x30, [sp, #0x8]
    d220:      	add	sp, sp, #0x70
    d224:      	ret
    d228:      	cmp	x21, #0x0
    d22c:      	b.ne	0xd290 <_stogir.conversion.policy+0x314>
    d230:      	movz	x0, #0x0, lsl #48
    d234:      	b	0xd0c8 <_stogir.conversion.policy+0x14c>
    d238:      	cmp	x20, #0x0
    d23c:      	b.ne	0xd308 <_stogir.conversion.policy+0x38c>
    d240:      	movz	x0, #0x0, lsl #48
    d244:      	b	0xd078 <_stogir.conversion.policy+0xfc>
    d248:      	cmp	x21, #0xf
    d24c:      	b.le	0xd008 <_stogir.conversion.policy+0x8c>
    d250:      	cmp	x21, #0x80
    d254:      	b.ge	0xd288 <_stogir.conversion.policy+0x30c>
    d258:      	and	x0, x21, #0xf
    d25c:      	lsr	w0, w0, #0
    d260:      	sxtw	x0, w0
    d264:      	cmp	x0, #0x1
    d268:      	b.lt	0xd380 <_stogir.conversion.policy+0x404>
    d26c:      	and	x0, x21, #0xf
    d270:      	lsr	w0, w0, #0
    d274:      	sxtw	x0, w0
    d278:      	cmp	x0, #0xd
    d27c:      	cset	w0, le
    d280:      	ubfx	x0, x0, #0, #8
    d284:      	b	0xd384 <_stogir.conversion.policy+0x408>
    d288:      	movz	x0, #0x0, lsl #48
    d28c:      	b	0xd00c <_stogir.conversion.policy+0x90>
    d290:      	cmp	x21, #0x1
    d294:      	b.eq	0xd0c4 <_stogir.conversion.policy+0x148>
    d298:      	cmp	x21, #0x2
    d29c:      	b.eq	0xd0c4 <_stogir.conversion.policy+0x148>
    d2a0:      	cmp	x21, #0x7
    d2a4:      	b.eq	0xd0c4 <_stogir.conversion.policy+0x148>
    d2a8:      	cmp	x21, #0x8
    d2ac:      	b.eq	0xd0c4 <_stogir.conversion.policy+0x148>
    d2b0:      	cmp	x21, #0x3
    d2b4:      	b.eq	0xd444 <_stogir.conversion.policy+0x4c8>
    d2b8:      	cmp	x21, #0x9
    d2bc:      	b.eq	0xd444 <_stogir.conversion.policy+0x4c8>
    d2c0:      	cmp	x21, #0x4
    d2c4:      	b.eq	0xd4c0 <_stogir.conversion.policy+0x544>
    d2c8:      	cmp	x21, #0xa
    d2cc:      	b.eq	0xd4c0 <_stogir.conversion.policy+0x544>
    d2d0:      	uxtb	w16, w23
    d2d4:      	cmp	w16, wzr
    d2d8:      	b.ne	0xd4c0 <_stogir.conversion.policy+0x544>
    d2dc:      	cmp	x21, #0x5
    d2e0:      	b.eq	0xd51c <_stogir.conversion.policy+0x5a0>
    d2e4:      	cmp	x21, #0xb
    d2e8:      	b.eq	0xd51c <_stogir.conversion.policy+0x5a0>
    d2ec:      	uxtb	w16, w28
    d2f0:      	cmp	w16, wzr
    d2f4:      	b.ne	0xd51c <_stogir.conversion.policy+0x5a0>
    d2f8:      	cmp	x21, #0x6
    d2fc:      	b.ne	0xd52c <_stogir.conversion.policy+0x5b0>
    d300:      	ldr	x0, [sp, #0x10]
    d304:      	b	0xd530 <_stogir.conversion.policy+0x5b4>
    d308:      	cmp	x20, #0x1
    d30c:      	b.eq	0xd074 <_stogir.conversion.policy+0xf8>
    d310:      	cmp	x20, #0x2
    d314:      	b.eq	0xd074 <_stogir.conversion.policy+0xf8>
    d318:      	cmp	x20, #0x7
    d31c:      	b.eq	0xd074 <_stogir.conversion.policy+0xf8>
    d320:      	cmp	x20, #0x8
    d324:      	b.eq	0xd074 <_stogir.conversion.policy+0xf8>
    d328:      	cmp	x20, #0x3
    d32c:      	b.eq	0xd44c <_stogir.conversion.policy+0x4d0>
    d330:      	cmp	x20, #0x9
    d334:      	b.eq	0xd44c <_stogir.conversion.policy+0x4d0>
    d338:      	cmp	x20, #0x4
    d33c:      	b.eq	0xd4c8 <_stogir.conversion.policy+0x54c>
    d340:      	cmp	x20, #0xa
    d344:      	b.eq	0xd4c8 <_stogir.conversion.policy+0x54c>
    d348:      	uxtb	w16, w24
    d34c:      	cmp	w16, wzr
    d350:      	b.ne	0xd4c8 <_stogir.conversion.policy+0x54c>
    d354:      	cmp	x20, #0x5
    d358:      	b.eq	0xd524 <_stogir.conversion.policy+0x5a8>
    d35c:      	cmp	x20, #0xb
    d360:      	b.eq	0xd524 <_stogir.conversion.policy+0x5a8>
    d364:      	uxtb	w16, w25
    d368:      	cmp	w16, wzr
    d36c:      	b.ne	0xd524 <_stogir.conversion.policy+0x5a8>
    d370:      	cmp	x20, #0x6
    d374:      	b.ne	0xd534 <_stogir.conversion.policy+0x5b8>
    d378:      	ldr	x0, [sp, #0x10]
    d37c:      	b	0xd538 <_stogir.conversion.policy+0x5bc>
    d380:      	movz	x0, #0x0, lsl #48
    d384:      	b	0xd28c <_stogir.conversion.policy+0x310>
    d388:      	mov	x1, #0x1                ; =1
    d38c:      	cmp	x1, #0x0
    d390:      	b.ne	0xd1c8 <_stogir.conversion.policy+0x24c>
    d394:      	cmp	x19, #0x23
    d398:      	b.eq	0xd3ac <_stogir.conversion.policy+0x430>
    d39c:      	uxtb	w16, w3
    d3a0:      	cmp	w16, wzr
    d3a4:      	b.ne	0xd3ac <_stogir.conversion.policy+0x430>
    d3a8:      	mov	x0, x2
    d3ac:      	and	x0, x0, #0xffffffff
    d3b0:      	mov	x1, x0
    d3b4:      	movz	x0, #0x0, lsl #48
    d3b8:      	movz	x2, #0x0, lsl #48
    d3bc:      	b	0xd1e0 <_stogir.conversion.policy+0x264>
    d3c0:      	cmp	x19, #0x24
    d3c4:      	b.ne	0xd3e0 <_stogir.conversion.policy+0x464>
    d3c8:      	cmp	x2, x0
    d3cc:      	cset	w1, eq
    d3d0:      	uxtb	w16, w1
    d3d4:      	cmp	w16, wzr
    d3d8:      	cset	x1, eq
    d3dc:      	b	0xd38c <_stogir.conversion.policy+0x410>
    d3e0:      	uxtb	w16, w4
    d3e4:      	cmp	w16, wzr
    d3e8:      	b.eq	0xd388 <_stogir.conversion.policy+0x40c>
    d3ec:      	uxtb	w16, w5
    d3f0:      	cmp	w16, wzr
    d3f4:      	b.eq	0xd388 <_stogir.conversion.policy+0x40c>
    d3f8:      	uxtb	w16, w6
    d3fc:      	cmp	w16, wzr
    d400:      	b.eq	0xd488 <_stogir.conversion.policy+0x50c>
    d404:      	uxtb	w16, w7
    d408:      	cmp	w16, wzr
    d40c:      	b.eq	0xd488 <_stogir.conversion.policy+0x50c>
    d410:      	cmp	x19, #0x23
    d414:      	b.ne	0xd4f8 <_stogir.conversion.policy+0x57c>
    d418:      	cmp	x0, x2
    d41c:      	cset	w1, ge
    d420:      	ubfx	x1, x1, #0, #8
    d424:      	b	0xd504 <_stogir.conversion.policy+0x588>
    d428:      	movz	x1, #0x0, lsl #48
    d42c:      	cmp	x1, #0x0
    d430:      	cset	w1, ne
    d434:      	uxtb	w16, w1
    d438:      	cmp	w16, wzr
    d43c:      	cset	x1, eq
    d440:      	b	0xd38c <_stogir.conversion.policy+0x410>
    d444:      	mov	x0, #0x2                ; =2
    d448:      	b	0xd0c8 <_stogir.conversion.policy+0x14c>
    d44c:      	mov	x0, #0x2                ; =2
    d450:      	b	0xd078 <_stogir.conversion.policy+0xfc>
    d454:      	movz	x1, #0x0, lsl #48
    d458:      	b	0xd42c <_stogir.conversion.policy+0x4b0>
    d45c:      	uxtb	w16, w3
    d460:      	cmp	w16, wzr
    d464:      	b.eq	0xd498 <_stogir.conversion.policy+0x51c>
    d468:      	uxtb	w16, w25
    d46c:      	cmp	w16, wzr
    d470:      	b.ne	0xd4e0 <_stogir.conversion.policy+0x564>
    d474:      	uxtb	w16, w24
    d478:      	cmp	w16, wzr
    d47c:      	b.ne	0xd4e0 <_stogir.conversion.policy+0x564>
    d480:      	movz	x1, #0x0, lsl #48
    d484:      	b	0xd494 <_stogir.conversion.policy+0x518>
    d488:      	mov	x1, #0x1                ; =1
    d48c:      	b	0xd38c <_stogir.conversion.policy+0x410>
    d490:      	movz	x1, #0x0, lsl #48
    d494:      	b	0xd42c <_stogir.conversion.policy+0x4b0>
    d498:      	cmp	x19, #0x27
    d49c:      	b.ne	0xd428 <_stogir.conversion.policy+0x4ac>
    d4a0:      	uxtb	w16, w25
    d4a4:      	cmp	w16, wzr
    d4a8:      	b.ne	0xd508 <_stogir.conversion.policy+0x58c>
    d4ac:      	uxtb	w16, w24
    d4b0:      	cmp	w16, wzr
    d4b4:      	b.ne	0xd508 <_stogir.conversion.policy+0x58c>
    d4b8:      	movz	x1, #0x0, lsl #48
    d4bc:      	b	0xd4dc <_stogir.conversion.policy+0x560>
    d4c0:      	mov	x0, #0x4                ; =4
    d4c4:      	b	0xd448 <_stogir.conversion.policy+0x4cc>
    d4c8:      	mov	x0, #0x4                ; =4
    d4cc:      	b	0xd450 <_stogir.conversion.policy+0x4d4>
    d4d0:      	mov	x1, x23
    d4d4:      	b	0xd458 <_stogir.conversion.policy+0x4dc>
    d4d8:      	mov	x1, x23
    d4dc:      	b	0xd42c <_stogir.conversion.policy+0x4b0>
    d4e0:      	uxtb	w16, w6
    d4e4:      	cmp	w16, wzr
    d4e8:      	b.eq	0xd490 <_stogir.conversion.policy+0x514>
    d4ec:      	ubfx	x7, x7, #0, #8
    d4f0:      	mov	x1, x7
    d4f4:      	b	0xd494 <_stogir.conversion.policy+0x518>
    d4f8:      	cmp	x0, x2
    d4fc:      	cset	w1, le
    d500:      	ubfx	x1, x1, #0, #8
    d504:      	b	0xd48c <_stogir.conversion.policy+0x510>
    d508:      	uxtb	w16, w28
    d50c:      	cmp	w16, wzr
    d510:      	b.eq	0xd4d8 <_stogir.conversion.policy+0x55c>
    d514:      	mov	x1, #0x1                ; =1
    d518:      	b	0xd4dc <_stogir.conversion.policy+0x560>
    d51c:      	mov	x0, #0x8                ; =8
    d520:      	b	0xd4c4 <_stogir.conversion.policy+0x548>
    d524:      	mov	x0, #0x8                ; =8
    d528:      	b	0xd4cc <_stogir.conversion.policy+0x550>
    d52c:      	movn	x0, #0x0, lsl #48
    d530:      	b	0xd520 <_stogir.conversion.policy+0x5a4>
    d534:      	movn	x0, #0x0, lsl #48
    d538:      	b	0xd528 <_stogir.conversion.policy+0x5ac>
    d53c:      	str	x8, [sp, #0x18]
    d540:      	mov	w28, w3
    d544:      	str	x23, [sp, #0x10]
    d548:      	mov	w23, w2
    d54c:      	b	0xd1a8 <_stogir.conversion.policy+0x22c>
    d550:      	mov	x22, x0
    d554:      	mov	w23, w1
    d558:      	mov	w28, w2
    d55c:      	b	0xd188 <_stogir.conversion.policy+0x20c>

000000000000d560 <_stogir.conditional.operands>:
    d560:      	sub	sp, sp, #0x70
    d564:      	str	x29, [sp]
    d568:      	str	x30, [sp, #0x8]
    d56c:      	mov	x29, sp
    d570:      	str	x19, [sp, #0x20]
    d574:      	str	x20, [sp, #0x28]
    d578:      	str	x21, [sp, #0x30]
    d57c:      	str	x22, [sp, #0x38]
    d580:      	str	x23, [sp, #0x40]
    d584:      	str	x24, [sp, #0x48]
    d588:      	str	x25, [sp, #0x50]
    d58c:      	str	x26, [sp, #0x58]
    d590:      	str	x27, [sp, #0x60]
    d594:      	str	x28, [sp, #0x68]
    d598:      	adrp	x16, 0xd000 <_stogir.conversion.policy+0x84>
		000000000000d598:  ARM64_RELOC_PAGE21	l_stogir.461
    d59c:      	ldr	x16, [x16]
		000000000000d59c:  ARM64_RELOC_PAGEOFF12	l_stogir.461
    d5a0:      	orr	x19, x16, xzr
    d5a4:      	sub	sp, sp, #0x10
    d5a8:      	mov	x20, sp
    d5ac:      	sxtw	x21, w1
    d5b0:      	sub	sp, sp, #0x10
    d5b4:      	mov	x22, sp
    d5b8:      	sub	sp, sp, #0x10
    d5bc:      	mov	x23, sp
    d5c0:      	sub	sp, sp, #0x10
    d5c4:      	mov	x24, sp
    d5c8:      	sub	sp, sp, #0x10
    d5cc:      	mov	x25, sp
    d5d0:      	cmp	x21, #0x0
    d5d4:      	b.ne	0xd6bc <_stogir.conditional.operands+0x15c>
    d5d8:      	str	x8, [x29, #0x18]
    d5dc:      	mov	x27, x0
    d5e0:      	mov	w28, w2
    d5e4:      	mov	w26, w4
    d5e8:      	str	x19, [x29, #0x10]
    d5ec:      	mov	w19, w3
    d5f0:      	adrp	x16, 0xd000 <_stogir.conversion.policy+0x84>
		000000000000d5f0:  ARM64_RELOC_PAGE21	l_stogir.462
    d5f4:      	ldr	x16, [x16]
		000000000000d5f4:  ARM64_RELOC_PAGEOFF12	l_stogir.462
    d5f8:      	orr	x0, x16, xzr
    d5fc:      	mov	x1, #0x2b               ; =43
    d600:      	sxtw	x28, w28
    d604:      	cmp	x28, #0x0
    d608:      	cset	w2, gt
    d60c:      	movz	x16, #0x0, lsl #48
    d610:      	sub	x3, x16, x28
    d614:      	sub	x4, x3, #0x1
    d618:      	uxtb	w16, w2
    d61c:      	cmp	w16, wzr
    d620:      	b.eq	0xd670 <_stogir.conditional.operands+0x110>
    d624:      	ldr	x3, [x27, #0x8]
    d628:      	cmp	x28, x3
    d62c:      	b.ge	0xd704 <_stogir.conditional.operands+0x1a4>
    d630:      	add	x3, x27, #0x78
    d634:      	ldr	x3, [x3, #0x8]
    d638:      	cmp	x28, x3
    d63c:      	b.ge	0xdb70 <_stogir.conditional.operands+0x610>
    d640:      	lsl	x3, x28, #2
    d644:      	ldr	x5, [x27, #0x78]
    d648:      	add	x3, x3, x5
    d64c:      	ldr	w3, [x3]
    d650:      	sxtw	x3, w3
    d654:      	cmp	x3, #0x0
    d658:      	cset	w3, ge
    d65c:      	ubfx	x3, x3, #0, #8
    d660:      	fmov	d31, x0
    d664:      	mov	x0, x3
    d668:      	fmov	x3, d31
    d66c:      	b	0xdb78 <_stogir.conditional.operands+0x618>
    d670:      	cmp	x28, #0x0
    d674:      	b.ge	0xd714 <_stogir.conditional.operands+0x1b4>
    d678:      	add	x5, x27, #0x28
    d67c:      	add	x6, x27, #0x50
    d680:      	ldr	x5, [x5, #0x8]
    d684:      	ldr	x6, [x6, #0x8]
    d688:      	cmp	x5, x6
    d68c:      	b.ne	0xd6f4 <_stogir.conditional.operands+0x194>
    d690:      	cmp	x3, x5
    d694:      	b.gt	0xdbd8 <_stogir.conditional.operands+0x678>
    d698:      	lsl	x3, x4, #2
    d69c:      	ldr	x5, [x27, #0x50]
    d6a0:      	add	x3, x3, x5
    d6a4:      	ldr	w3, [x3]
    d6a8:      	sxtw	x3, w3
    d6ac:      	cmp	x3, #0x0
    d6b0:      	cset	w3, gt
    d6b4:      	ubfx	x3, x3, #0, #8
    d6b8:      	b	0xdbdc <_stogir.conditional.operands+0x67c>
    d6bc:      	lsr	w1, w1, #0
    d6c0:      	str	x8, [x29, #0x18]
    d6c4:      	mov	x27, x0
    d6c8:      	mov	w0, w1
    d6cc:      	mov	w28, w2
    d6d0:      	mov	w26, w4
    d6d4:      	str	x19, [x29, #0x10]
    d6d8:      	mov	w19, w3
    d6dc:      	bl	0xd6dc <_stogir.conditional.operands+0x17c>
		000000000000d6dc:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
    d6e0:      	cmp	x0, #0x0
    d6e4:      	b.eq	0xd5f0 <_stogir.conditional.operands+0x90>
    d6e8:      	ldr	x0, [x29, #0x10]
    d6ec:      	movz	x1, #0x0, lsl #48
    d6f0:      	b	0xd600 <_stogir.conditional.operands+0xa0>
    d6f4:      	movz	x3, #0x0, lsl #48
    d6f8:      	b	0xd718 <_stogir.conditional.operands+0x1b8>
    d6fc:      	movz	x9, #0x0, lsl #48
    d700:      	b	0xd804 <_stogir.conditional.operands+0x2a4>
    d704:      	mov	x3, x1
    d708:      	mov	x1, x0
    d70c:      	movz	x0, #0x0, lsl #48
    d710:      	b	0xd728 <_stogir.conditional.operands+0x1c8>
    d714:      	movz	x3, #0x0, lsl #48
    d718:      	fmov	d31, x0
    d71c:      	mov	x0, x3
    d720:      	mov	x3, x1
    d724:      	fmov	x1, d31
    d728:      	cmp	x0, #0x0
    d72c:      	b.eq	0xd794 <_stogir.conditional.operands+0x234>
    d730:      	uxtb	w16, w2
    d734:      	cmp	w16, wzr
    d738:      	b.eq	0xd760 <_stogir.conditional.operands+0x200>
    d73c:      	lsl	x0, x28, #4
    d740:      	ldr	x2, [x27]
    d744:      	add	x0, x0, x2
    d748:      	ldr	x2, [x0]
    d74c:      	ldr	x0, [x0, #0x8]
    d750:      	fmov	d31, x0
    d754:      	mov	x0, x2
    d758:      	fmov	x2, d31
    d75c:      	b	0xd780 <_stogir.conditional.operands+0x220>
    d760:      	lsl	x0, x4, #4
    d764:      	ldr	x2, [x27, #0x28]
    d768:      	add	x0, x0, x2
    d76c:      	ldr	x2, [x0]
    d770:      	ldr	x0, [x0, #0x8]
    d774:      	fmov	d31, x0
    d778:      	mov	x0, x2
    d77c:      	fmov	x2, d31
    d780:      	mov	x4, x3
    d784:      	mov	x3, x1
    d788:      	mov	x1, x0
    d78c:      	mov	x0, #0x1                ; =1
    d790:      	b	0xd7a8 <_stogir.conditional.operands+0x248>
    d794:      	mov	x4, x3
    d798:      	mov	x3, x1
    d79c:      	movz	x0, #0x0, lsl #48
    d7a0:      	movz	x1, #0x0, lsl #48
    d7a4:      	movz	x2, #0x0, lsl #48
    d7a8:      	lsr	w0, w0, #0
    d7ac:      	lsr	x16, x0, #0
    d7b0:      	cmp	x16, #0x1
    d7b4:      	b.eq	0xd7d0 <_stogir.conditional.operands+0x270>
    d7b8:      	b.lo	0xd7c0 <_stogir.conditional.operands+0x260>
    d7bc:      	b	0xd7d4 <_stogir.conditional.operands+0x274>
    d7c0:      	cmp	x16, #0x0
    d7c4:      	b.eq	0xd7cc <_stogir.conditional.operands+0x26c>
    d7c8:      	b	0xd7d4 <_stogir.conditional.operands+0x274>
    d7cc:      	b	0xd7d8 <_stogir.conditional.operands+0x278>
    d7d0:      	b	0xdb4c <_stogir.conditional.operands+0x5ec>
    d7d4:      	b	0xdc04 <_stogir.conditional.operands+0x6a4>
    d7d8:      	adrp	x16, 0xd000 <_stogir.conversion.policy+0x84>
		000000000000d7d8:  ARM64_RELOC_PAGE21	l_stogir.463
    d7dc:      	ldr	x16, [x16]
		000000000000d7dc:  ARM64_RELOC_PAGEOFF12	l_stogir.463
    d7e0:      	orr	x0, x16, xzr
    d7e4:      	mov	x1, #0x16               ; =22
    d7e8:      	b	0xd810 <_stogir.conditional.operands+0x2b0>
    d7ec:      	movz	x9, #0x0, lsl #48
    d7f0:      	fmov	d31, x8
    d7f4:      	mov	x8, x9
    d7f8:      	fmov	x9, d31
    d7fc:      	b	0xd868 <_stogir.conditional.operands+0x308>
    d800:      	movz	x9, #0x0, lsl #48
    d804:      	b	0xd870 <_stogir.conditional.operands+0x310>
    d808:      	mov	x0, x1
    d80c:      	mov	x1, x2
    d810:      	orr	x2, x23, xzr
    d814:      	adrp	x16, 0xd000 <_stogir.conversion.policy+0x84>
		000000000000d814:  ARM64_RELOC_PAGE21	l_stogir.464
    d818:      	ldr	x16, [x16]
		000000000000d818:  ARM64_RELOC_PAGEOFF12	l_stogir.464
    d81c:      	orr	x3, x16, xzr
    d820:      	adrp	x16, 0xd000 <_stogir.conversion.policy+0x84>
		000000000000d820:  ARM64_RELOC_PAGE21	l_stogir.465
    d824:      	ldr	x16, [x16]
		000000000000d824:  ARM64_RELOC_PAGEOFF12	l_stogir.465
    d828:      	orr	x4, x16, xzr
    d82c:      	lsr	w19, w19, #0
    d830:      	lsr	w26, w26, #0
    d834:      	add	x5, x27, #0x78
    d838:      	add	x6, x27, #0x28
    d83c:      	add	x7, x27, #0x50
    d840:      	str	w19, [x22]
    d844:      	str	w26, [x22, #0x4]
    d848:      	ldr	x8, [x22]
    d84c:      	str	x8, [x23]
    d850:      	mov	x8, x1
    d854:      	mov	x1, x0
    d858:      	movz	x0, #0x0, lsl #48
    d85c:      	b	0xd958 <_stogir.conditional.operands+0x3f8>
    d860:      	mov	x9, x8
    d864:      	movz	x8, #0x0, lsl #48
    d868:      	b	0xd87c <_stogir.conditional.operands+0x31c>
    d86c:      	movz	x9, #0x0, lsl #48
    d870:      	fmov	d31, x8
    d874:      	mov	x8, x9
    d878:      	fmov	x9, d31
    d87c:      	cmp	x8, #0x0
    d880:      	b.eq	0xd8e4 <_stogir.conditional.operands+0x384>
    d884:      	uxtb	w16, w1
    d888:      	cmp	w16, wzr
    d88c:      	b.eq	0xd8b4 <_stogir.conditional.operands+0x354>
    d890:      	lsl	x0, x0, #4
    d894:      	ldr	x1, [x27]
    d898:      	add	x0, x0, x1
    d89c:      	ldr	x1, [x0]
    d8a0:      	ldr	x0, [x0, #0x8]
    d8a4:      	fmov	d31, x0
    d8a8:      	mov	x0, x1
    d8ac:      	fmov	x1, d31
    d8b0:      	b	0xd8d4 <_stogir.conditional.operands+0x374>
    d8b4:      	lsl	x0, x10, #4
    d8b8:      	ldr	x1, [x27, #0x28]
    d8bc:      	add	x0, x0, x1
    d8c0:      	ldr	x1, [x0]
    d8c4:      	ldr	x0, [x0, #0x8]
    d8c8:      	fmov	d31, x0
    d8cc:      	mov	x0, x1
    d8d0:      	fmov	x1, d31
    d8d4:      	mov	x8, x1
    d8d8:      	mov	x1, x0
    d8dc:      	mov	x0, #0x1                ; =1
    d8e0:      	b	0xd8f0 <_stogir.conditional.operands+0x390>
    d8e4:      	movz	x0, #0x0, lsl #48
    d8e8:      	movz	x1, #0x0, lsl #48
    d8ec:      	movz	x8, #0x0, lsl #48
    d8f0:      	lsr	w0, w0, #0
    d8f4:      	lsr	x16, x0, #0
    d8f8:      	cmp	x16, #0x1
    d8fc:      	b.eq	0xd918 <_stogir.conditional.operands+0x3b8>
    d900:      	b.lo	0xd908 <_stogir.conditional.operands+0x3a8>
    d904:      	b	0xd91c <_stogir.conditional.operands+0x3bc>
    d908:      	cmp	x16, #0x0
    d90c:      	b.eq	0xd914 <_stogir.conditional.operands+0x3b4>
    d910:      	b	0xd91c <_stogir.conditional.operands+0x3bc>
    d914:      	b	0xd920 <_stogir.conditional.operands+0x3c0>
    d918:      	b	0xdb10 <_stogir.conditional.operands+0x5b0>
    d91c:      	b	0xdbfc <_stogir.conditional.operands+0x69c>
    d920:      	mov	x0, x9
    d924:      	mov	x1, x3
    d928:      	mov	x8, #0x10               ; =16
    d92c:      	b	0xd958 <_stogir.conditional.operands+0x3f8>
    d930:      	and	x0, x21, #0xffffffff
    d934:      	mov	x1, x0
    d938:      	movz	x0, #0x0, lsl #48
    d93c:      	movz	x2, #0x0, lsl #48
    d940:      	b	0xda80 <_stogir.conditional.operands+0x520>
    d944:      	mov	x0, x4
    d948:      	mov	x1, #0x21               ; =33
    d94c:      	mov	x8, x1
    d950:      	mov	x1, x0
    d954:      	mov	x0, x9
    d958:      	cmp	x0, #0x2
    d95c:      	b.ge	0xd990 <_stogir.conditional.operands+0x430>
    d960:      	add	x9, x0, #0x1
    d964:      	lsl	x0, x0, #2
    d968:      	add	x0, x0, x2
    d96c:      	ldr	w0, [x0]
    d970:      	sxtw	x0, w0
    d974:      	and	x0, x0, #0xffffffff
    d978:      	mov	x19, x1
    d97c:      	mov	x1, x0
    d980:      	mov	x20, x8
    d984:      	mov	x8, x9
    d988:      	mov	x0, #0x1                ; =1
    d98c:      	b	0xd9a4 <_stogir.conditional.operands+0x444>
    d990:      	mov	x19, x1
    d994:      	mov	x20, x8
    d998:      	mov	x8, x0
    d99c:      	movz	x0, #0x0, lsl #48
    d9a0:      	movz	x1, #0x0, lsl #48
    d9a4:      	str	x0, [x24]
    d9a8:      	lsr	w0, w0, #0
    d9ac:      	str	x1, [x24, #0x8]
    d9b0:      	lsr	x16, x0, #0
    d9b4:      	cmp	x16, #0x1
    d9b8:      	b.eq	0xd9d4 <_stogir.conditional.operands+0x474>
    d9bc:      	b.lo	0xd9c4 <_stogir.conditional.operands+0x464>
    d9c0:      	b	0xd9d8 <_stogir.conditional.operands+0x478>
    d9c4:      	cmp	x16, #0x0
    d9c8:      	b.eq	0xd9d0 <_stogir.conditional.operands+0x470>
    d9cc:      	b	0xd9d8 <_stogir.conditional.operands+0x478>
    d9d0:      	b	0xda40 <_stogir.conditional.operands+0x4e0>
    d9d4:      	b	0xd9dc <_stogir.conditional.operands+0x47c>
    d9d8:      	b	0xdbf4 <_stogir.conditional.operands+0x694>
    d9dc:      	ldr	w0, [x24, #0x8]
    d9e0:      	sxtw	x0, w0
    d9e4:      	cmp	x0, #0x0
    d9e8:      	cset	w1, gt
    d9ec:      	movz	x16, #0x0, lsl #48
    d9f0:      	sub	x9, x16, x0
    d9f4:      	sub	x10, x9, #0x1
    d9f8:      	uxtb	w16, w1
    d9fc:      	cmp	w16, wzr
    da00:      	b.eq	0xdacc <_stogir.conditional.operands+0x56c>
    da04:      	ldr	x9, [x27, #0x8]
    da08:      	cmp	x0, x9
    da0c:      	b.ge	0xd860 <_stogir.conditional.operands+0x300>
    da10:      	ldr	x9, [x5, #0x8]
    da14:      	cmp	x0, x9
    da18:      	b.ge	0xd7ec <_stogir.conditional.operands+0x28c>
    da1c:      	lsl	x9, x0, #2
    da20:      	ldr	x11, [x27, #0x78]
    da24:      	add	x9, x9, x11
    da28:      	ldr	w9, [x9]
    da2c:      	sxtw	x9, w9
    da30:      	cmp	x9, #0x0
    da34:      	cset	w9, ge
    da38:      	ubfx	x9, x9, #0, #8
    da3c:      	b	0xd7f0 <_stogir.conditional.operands+0x290>
    da40:      	cmp	x20, #0x0
    da44:      	b.ne	0xda74 <_stogir.conditional.operands+0x514>
    da48:      	cmp	x20, #0x0
    da4c:      	b.eq	0xd930 <_stogir.conditional.operands+0x3d0>
    da50:      	lsr	x0, x20, #0
    da54:      	ldr	x1, [x29, #0x10]
    da58:      	mov	x2, x0
    da5c:      	mov	x0, x19
    da60:      	bl	0xda60 <_stogir.conditional.operands+0x500>
		000000000000da60:  ARM64_RELOC_BRANCH26	_memcmp
    da64:      	lsr	w0, w0, #0
    da68:      	sxtw	x0, w0
    da6c:      	cmp	x0, #0x0
    da70:      	b.eq	0xd930 <_stogir.conditional.operands+0x3d0>
    da74:      	mov	x1, x19
    da78:      	mov	x2, x20
    da7c:      	mov	x0, #0x1                ; =1
    da80:      	ldr	x3, [x29, #0x18]
    da84:      	str	x0, [x3]
    da88:      	str	x1, [x3, #0x8]
    da8c:      	str	x2, [x3, #0x10]
    da90:      	sub	sp, x29, #0x0
    da94:      	ldr	x19, [sp, #0x20]
    da98:      	ldr	x20, [sp, #0x28]
    da9c:      	ldr	x21, [sp, #0x30]
    daa0:      	ldr	x22, [sp, #0x38]
    daa4:      	ldr	x23, [sp, #0x40]
    daa8:      	ldr	x24, [sp, #0x48]
    daac:      	ldr	x25, [sp, #0x50]
    dab0:      	ldr	x26, [sp, #0x58]
    dab4:      	ldr	x27, [sp, #0x60]
    dab8:      	ldr	x28, [sp, #0x68]
    dabc:      	ldr	x29, [sp]
    dac0:      	ldr	x30, [sp, #0x8]
    dac4:      	add	sp, sp, #0x70
    dac8:      	ret
    dacc:      	cmp	x0, #0x0
    dad0:      	b.ge	0xd86c <_stogir.conditional.operands+0x30c>
    dad4:      	ldr	x11, [x6, #0x8]
    dad8:      	ldr	x12, [x7, #0x8]
    dadc:      	cmp	x11, x12
    dae0:      	b.ne	0xd800 <_stogir.conditional.operands+0x2a0>
    dae4:      	cmp	x9, x11
    dae8:      	b.gt	0xd6fc <_stogir.conditional.operands+0x19c>
    daec:      	lsl	x9, x10, #2
    daf0:      	ldr	x11, [x27, #0x50]
    daf4:      	add	x9, x9, x11
    daf8:      	ldr	w9, [x9]
    dafc:      	sxtw	x9, w9
    db00:      	cmp	x9, #0x0
    db04:      	cset	w9, gt
    db08:      	ubfx	x9, x9, #0, #8
    db0c:      	b	0xd700 <_stogir.conditional.operands+0x1a0>
    db10:      	uxtb	w0, w1
    db14:      	str	x1, [x25]
    db18:      	str	x8, [x25, #0x8]
    db1c:      	cmp	x0, #0x48
    db20:      	b.eq	0xd944 <_stogir.conditional.operands+0x3e4>
    db24:      	ldr	w0, [x25]
    db28:      	uxtb	w1, w0
    db2c:      	cmp	x1, #0x46
    db30:      	b.eq	0xd944 <_stogir.conditional.operands+0x3e4>
    db34:      	ubfx	x0, x0, #8, #8
    db38:      	cmp	x0, x21
    db3c:      	b.ne	0xd944 <_stogir.conditional.operands+0x3e4>
    db40:      	mov	x0, x19
    db44:      	mov	x1, x20
    db48:      	b	0xd94c <_stogir.conditional.operands+0x3ec>
    db4c:      	uxtb	w0, w1
    db50:      	str	x1, [x20]
    db54:      	str	x2, [x20, #0x8]
    db58:      	cmp	x0, #0x48
    db5c:      	b.ne	0xdbc0 <_stogir.conditional.operands+0x660>
    db60:      	mov	x1, x3
    db64:      	mov	x2, x4
    db68:      	mov	x0, #0x1                ; =1
    db6c:      	b	0xdba4 <_stogir.conditional.operands+0x644>
    db70:      	mov	x3, x0
    db74:      	movz	x0, #0x0, lsl #48
    db78:      	fmov	d31, x1
    db7c:      	mov	x1, x3
    db80:      	fmov	x3, d31
    db84:      	b	0xd710 <_stogir.conditional.operands+0x1b0>
    db88:      	cmp	x0, #0xd
    db8c:      	cset	w0, le
    db90:      	uxtb	w16, w0
    db94:      	cmp	w16, wzr
    db98:      	cset	x0, eq
    db9c:      	mov	x1, x3
    dba0:      	mov	x2, x4
    dba4:      	cmp	x0, #0x0
    dba8:      	b.eq	0xd808 <_stogir.conditional.operands+0x2a8>
    dbac:      	adrp	x16, 0xd000 <_stogir.conversion.policy+0x84>
		000000000000dbac:  ARM64_RELOC_PAGE21	l_stogir.466
    dbb0:      	ldr	x16, [x16]
		000000000000dbb0:  ARM64_RELOC_PAGEOFF12	l_stogir.466
    dbb4:      	orr	x0, x16, xzr
    dbb8:      	mov	x1, #0x2a               ; =42
    dbbc:      	b	0xd810 <_stogir.conditional.operands+0x2b0>
    dbc0:      	ldr	w0, [x20]
    dbc4:      	uxtb	w1, w0
    dbc8:      	cmp	x1, #0x46
    dbcc:      	b.ne	0xdbe0 <_stogir.conditional.operands+0x680>
    dbd0:      	mov	x0, #0x1                ; =1
    dbd4:      	b	0xdb9c <_stogir.conditional.operands+0x63c>
    dbd8:      	movz	x3, #0x0, lsl #48
    dbdc:      	b	0xd6f8 <_stogir.conditional.operands+0x198>
    dbe0:      	ubfx	x0, x0, #8, #8
    dbe4:      	cmp	x0, #0x0
    dbe8:      	b.ne	0xdb88 <_stogir.conditional.operands+0x628>
    dbec:      	mov	x0, #0x1                ; =1
    dbf0:      	b	0xdb9c <_stogir.conditional.operands+0x63c>
    dbf4:      	brk	#0
    dbf8:      	b	0xdbf4 <_stogir.conditional.operands+0x694>
    dbfc:      	brk	#0
    dc00:      	b	0xdbfc <_stogir.conditional.operands+0x69c>
    dc04:      	brk	#0
    dc08:      	b	0xdc04 <_stogir.conditional.operands+0x6a4>

000000000000dc0c <_stogir.floating.unary?>:
    dc0c:      	sxtw	x0, w0
    dc10:      	cmp	x0, #0x1f
    dc14:      	b.ne	0xdc20 <_stogir.floating.unary?+0x14>
    dc18:      	mov	x0, #0x1                ; =1
    dc1c:      	b	0xdc2c <_stogir.floating.unary?+0x20>
    dc20:      	cmp	x0, #0x20
    dc24:      	cset	w0, eq
    dc28:      	ubfx	x0, x0, #0, #8
    dc2c:      	ret

000000000000dc30 <_stogir.floating.comparison?>:
    dc30:      	sxtw	x0, w0
    dc34:      	cmp	x0, #0xe
    dc38:      	b.lt	0xdc4c <_stogir.floating.comparison?+0x1c>
    dc3c:      	cmp	x0, #0x19
    dc40:      	cset	w0, le
    dc44:      	ubfx	x0, x0, #0, #8
    dc48:      	b	0xdc50 <_stogir.floating.comparison?+0x20>
    dc4c:      	movz	x0, #0x0, lsl #48
    dc50:      	ret

000000000000dc54 <_stogir.floating.operands>:
    dc54:      	sub	sp, sp, #0x90
    dc58:      	str	x29, [sp]
    dc5c:      	str	x30, [sp, #0x8]
    dc60:      	mov	x29, sp
    dc64:      	str	x19, [sp, #0x38]
    dc68:      	str	x20, [sp, #0x40]
    dc6c:      	str	x21, [sp, #0x48]
    dc70:      	str	x22, [sp, #0x50]
    dc74:      	str	x23, [sp, #0x58]
    dc78:      	str	x24, [sp, #0x60]
    dc7c:      	str	x25, [sp, #0x68]
    dc80:      	str	x26, [sp, #0x70]
    dc84:      	str	x27, [sp, #0x78]
    dc88:      	str	x28, [sp, #0x80]
    dc8c:      	adrp	x16, 0xd000 <_stogir.conversion.policy+0x84>
		000000000000dc8c:  ARM64_RELOC_PAGE21	l_stogir.467
    dc90:      	ldr	x16, [x16]
		000000000000dc90:  ARM64_RELOC_PAGEOFF12	l_stogir.467
    dc94:      	orr	x19, x16, xzr
    dc98:      	sub	sp, sp, #0x10
    dc9c:      	mov	x6, sp
    dca0:      	sxtw	x20, w1
    dca4:      	sxtw	x21, w2
    dca8:      	sub	sp, sp, #0x10
    dcac:      	mov	x1, sp
    dcb0:      	cmp	x20, #0x1f
    dcb4:      	cset	w2, eq
    dcb8:      	cmp	x20, #0x20
    dcbc:      	cset	w7, eq
    dcc0:      	sub	sp, sp, #0x10
    dcc4:      	mov	x22, sp
    dcc8:      	sub	sp, sp, #0x30
    dccc:      	mov	x23, sp
    dcd0:      	sub	sp, sp, #0x10
    dcd4:      	mov	x24, sp
    dcd8:      	cmp	x20, #0xe
    dcdc:      	b.lt	0xdd18 <_stogir.floating.operands+0xc4>
    dce0:      	cmp	x20, #0x19
    dce4:      	b.gt	0xdd18 <_stogir.floating.operands+0xc4>
    dce8:      	cmp	x21, #0xc
    dcec:      	b.ne	0xdcf8 <_stogir.floating.operands+0xa4>
    dcf0:      	mov	x9, #0x1                ; =1
    dcf4:      	b	0xdd04 <_stogir.floating.operands+0xb0>
    dcf8:      	cmp	x21, #0xd
    dcfc:      	cset	w9, eq
    dd00:      	ubfx	x9, x9, #0, #8
    dd04:      	cmp	x9, #0x0
    dd08:      	b.eq	0xdd50 <_stogir.floating.operands+0xfc>
    dd0c:      	mov	x9, x19
    dd10:      	movz	x10, #0x0, lsl #48
    dd14:      	b	0xdd60 <_stogir.floating.operands+0x10c>
    dd18:      	uxtb	w16, w2
    dd1c:      	cmp	w16, wzr
    dd20:      	b.ne	0xdce8 <_stogir.floating.operands+0x94>
    dd24:      	uxtb	w16, w7
    dd28:      	cmp	w16, wzr
    dd2c:      	b.ne	0xdce8 <_stogir.floating.operands+0x94>
    dd30:      	cmp	x20, #0x1a
    dd34:      	b.lt	0xdd40 <_stogir.floating.operands+0xec>
    dd38:      	cmp	x20, #0x1d
    dd3c:      	b.le	0xdce8 <_stogir.floating.operands+0x94>
    dd40:      	cmp	x20, #0x3a
    dd44:      	b.eq	0xdce8 <_stogir.floating.operands+0x94>
    dd48:      	cmp	x20, #0x3b
    dd4c:      	b.eq	0xdce8 <_stogir.floating.operands+0x94>
    dd50:      	adrp	x16, 0xd000 <_stogir.conversion.policy+0x84>
		000000000000dd50:  ARM64_RELOC_PAGE21	l_stogir.468
    dd54:      	ldr	x16, [x16]
		000000000000dd54:  ARM64_RELOC_PAGEOFF12	l_stogir.468
    dd58:      	orr	x9, x16, xzr
    dd5c:      	mov	x10, #0x22              ; =34
    dd60:      	lsr	w3, w3, #0
    dd64:      	str	w3, [x6]
    dd68:      	uxtb	w16, w2
    dd6c:      	cmp	w16, wzr
    dd70:      	b.eq	0xdd80 <_stogir.floating.operands+0x12c>
    dd74:      	mov	x7, x9
    dd78:      	mov	x2, #0x1                ; =1
    dd7c:      	b	0xdd8c <_stogir.floating.operands+0x138>
    dd80:      	ubfx	x7, x7, #0, #8
    dd84:      	mov	x2, x7
    dd88:      	mov	x7, x9
    dd8c:      	cmp	x2, #0x0
    dd90:      	b.eq	0xddb0 <_stogir.floating.operands+0x15c>
    dd94:      	sxtw	x3, w3
    dd98:      	mov	x2, x3
    dd9c:      	mov	x3, x7
    dda0:      	b	0xddbc <_stogir.floating.operands+0x168>
    dda4:      	mov	x0, x1
    dda8:      	mov	x1, x2
    ddac:      	b	0xde28 <_stogir.floating.operands+0x1d4>
    ddb0:      	sxtw	x4, w4
    ddb4:      	mov	x2, x4
    ddb8:      	mov	x3, x7
    ddbc:      	orr	x25, x1, xzr
    ddc0:      	adrp	x16, 0xd000 <_stogir.conversion.policy+0x84>
		000000000000ddc0:  ARM64_RELOC_PAGE21	l_stogir.469
    ddc4:      	ldr	x16, [x16]
		000000000000ddc4:  ARM64_RELOC_PAGEOFF12	l_stogir.469
    ddc8:      	orr	x26, x16, xzr
    ddcc:      	adrp	x16, 0xd000 <_stogir.conversion.policy+0x84>
		000000000000ddcc:  ARM64_RELOC_PAGE21	l_stogir.470
    ddd0:      	ldr	x16, [x16]
		000000000000ddd0:  ARM64_RELOC_PAGEOFF12	l_stogir.470
    ddd4:      	orr	x27, x16, xzr
    ddd8:      	lsr	w2, w2, #0
    dddc:      	str	w2, [x6, #0x4]
    dde0:      	ldr	x2, [x6]
    dde4:      	str	x2, [x1]
    dde8:      	mov	x2, x3
    ddec:      	mov	x3, x10
    ddf0:      	movz	x1, #0x0, lsl #48
    ddf4:      	b	0xde60 <_stogir.floating.operands+0x20c>
    ddf8:      	and	x0, x21, #0xffffffff
    ddfc:      	mov	x1, x0
    de00:      	movz	x0, #0x0, lsl #48
    de04:      	movz	x2, #0x0, lsl #48
    de08:      	b	0xdff0 <_stogir.floating.operands+0x39c>
    de0c:      	mov	x0, #0x1                ; =1
    de10:      	cmp	x0, #0x0
    de14:      	b.eq	0xe058 <_stogir.floating.operands+0x404>
    de18:      	adrp	x16, 0xd000 <_stogir.conversion.policy+0x84>
		000000000000de18:  ARM64_RELOC_PAGE21	l_stogir.471
    de1c:      	ldr	x16, [x16]
		000000000000de1c:  ARM64_RELOC_PAGEOFF12	l_stogir.471
    de20:      	orr	x0, x16, xzr
    de24:      	mov	x1, #0x21               ; =33
    de28:      	mov	x20, x0
    de2c:      	mov	x22, x1
    de30:      	b	0xdfb0 <_stogir.floating.operands+0x35c>
    de34:      	mov	x0, x27
    de38:      	mov	x1, #0x1e               ; =30
    de3c:      	mov	x8, x19
    de40:      	mov	w5, w25
    de44:      	ldr	x19, [x29, #0x10]
    de48:      	ldr	x25, [x29, #0x20]
    de4c:      	mov	x2, x0
    de50:      	mov	x0, x22
    de54:      	ldr	x22, [x29, #0x18]
    de58:      	mov	x3, x1
    de5c:      	mov	x1, x28
    de60:      	cmp	x1, #0x2
    de64:      	b.ge	0xde98 <_stogir.floating.operands+0x244>
    de68:      	add	x4, x1, #0x1
    de6c:      	lsl	x1, x1, #2
    de70:      	add	x1, x1, x25
    de74:      	ldr	w1, [x1]
    de78:      	sxtw	x1, w1
    de7c:      	and	x1, x1, #0xffffffff
    de80:      	mov	x28, x4
    de84:      	mov	x4, x3
    de88:      	mov	x3, x2
    de8c:      	mov	x2, x1
    de90:      	mov	x1, #0x1                ; =1
    de94:      	b	0xdeac <_stogir.floating.operands+0x258>
    de98:      	mov	x28, x1
    de9c:      	mov	x4, x3
    dea0:      	mov	x3, x2
    dea4:      	movz	x1, #0x0, lsl #48
    dea8:      	movz	x2, #0x0, lsl #48
    deac:      	str	x1, [x22]
    deb0:      	lsr	w1, w1, #0
    deb4:      	str	x2, [x22, #0x8]
    deb8:      	lsr	x16, x1, #0
    debc:      	cmp	x16, #0x1
    dec0:      	b.eq	0xdef4 <_stogir.floating.operands+0x2a0>
    dec4:      	b.lo	0xdecc <_stogir.floating.operands+0x278>
    dec8:      	b	0xdef8 <_stogir.floating.operands+0x2a4>
    decc:      	cmp	x16, #0x0
    ded0:      	b.eq	0xded8 <_stogir.floating.operands+0x284>
    ded4:      	b	0xdef8 <_stogir.floating.operands+0x2a4>
    ded8:      	mov	x22, x0
    dedc:      	mov	w25, w5
    dee0:      	str	x19, [x29, #0x10]
    dee4:      	mov	x19, x8
    dee8:      	str	x3, [x29, #0x28]
    deec:      	str	x4, [x29, #0x30]
    def0:      	b	0xdf68 <_stogir.floating.operands+0x314>
    def4:      	b	0xdefc <_stogir.floating.operands+0x2a8>
    def8:      	b	0xe29c <_stogir.floating.operands+0x648>
    defc:      	ldr	w1, [x22, #0x8]
    df00:      	lsr	w1, w1, #0
    df04:      	str	x3, [x29, #0x28]
    df08:      	str	x4, [x29, #0x30]
    df0c:      	str	x19, [x29, #0x10]
    df10:      	mov	x19, x8
    df14:      	mov	x8, x23
    df18:      	str	x22, [x29, #0x18]
    df1c:      	mov	x22, x0
    df20:      	str	x25, [x29, #0x20]
    df24:      	mov	w25, w5
    df28:      	bl	0xdf28 <_stogir.floating.operands+0x2d4>
		000000000000df28:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    df2c:      	ldr	w0, [x23]
    df30:      	lsr	x16, x0, #0
    df34:      	cmp	x16, #0x1
    df38:      	b.eq	0xdf54 <_stogir.floating.operands+0x300>
    df3c:      	b.lo	0xdf44 <_stogir.floating.operands+0x2f0>
    df40:      	b	0xdf58 <_stogir.floating.operands+0x304>
    df44:      	cmp	x16, #0x0
    df48:      	b.eq	0xdf50 <_stogir.floating.operands+0x2fc>
    df4c:      	b	0xdf58 <_stogir.floating.operands+0x304>
    df50:      	b	0xdf5c <_stogir.floating.operands+0x308>
    df54:      	b	0xe038 <_stogir.floating.operands+0x3e4>
    df58:      	b	0xe2f0 <_stogir.floating.operands+0x69c>
    df5c:      	mov	x0, x26
    df60:      	mov	x1, #0x18               ; =24
    df64:      	b	0xde3c <_stogir.floating.operands+0x1e8>
    df68:      	sxtw	x25, w25
    df6c:      	cmp	x25, #0x0
    df70:      	b.ne	0xdf84 <_stogir.floating.operands+0x330>
    df74:      	ldr	x1, [x29, #0x28]
    df78:      	ldr	x2, [x29, #0x30]
    df7c:      	movz	x0, #0x0, lsl #48
    df80:      	b	0xdf90 <_stogir.floating.operands+0x33c>
    df84:      	ldr	x1, [x29, #0x28]
    df88:      	ldr	x2, [x29, #0x30]
    df8c:      	mov	x0, #0x1                ; =1
    df90:      	cmp	x0, #0x0
    df94:      	b.eq	0xdfa8 <_stogir.floating.operands+0x354>
    df98:      	cmp	x20, #0x1d
    df9c:      	b.ne	0xde0c <_stogir.floating.operands+0x1b8>
    dfa0:      	movz	x0, #0x0, lsl #48
    dfa4:      	b	0xde10 <_stogir.floating.operands+0x1bc>
    dfa8:      	mov	x20, x1
    dfac:      	mov	x22, x2
    dfb0:      	cmp	x22, #0x0
    dfb4:      	b.ne	0xdfe4 <_stogir.floating.operands+0x390>
    dfb8:      	cmp	x22, #0x0
    dfbc:      	b.eq	0xddf8 <_stogir.floating.operands+0x1a4>
    dfc0:      	lsr	x0, x22, #0
    dfc4:      	ldr	x1, [x29, #0x10]
    dfc8:      	mov	x2, x0
    dfcc:      	mov	x0, x20
    dfd0:      	bl	0xdfd0 <_stogir.floating.operands+0x37c>
		000000000000dfd0:  ARM64_RELOC_BRANCH26	_memcmp
    dfd4:      	lsr	w0, w0, #0
    dfd8:      	sxtw	x0, w0
    dfdc:      	cmp	x0, #0x0
    dfe0:      	b.eq	0xddf8 <_stogir.floating.operands+0x1a4>
    dfe4:      	mov	x1, x20
    dfe8:      	mov	x2, x22
    dfec:      	mov	x0, #0x1                ; =1
    dff0:      	str	x0, [x19]
    dff4:      	str	x1, [x19, #0x8]
    dff8:      	str	x2, [x19, #0x10]
    dffc:      	sub	sp, x29, #0x0
    e000:      	ldr	x19, [sp, #0x38]
    e004:      	ldr	x20, [sp, #0x40]
    e008:      	ldr	x21, [sp, #0x48]
    e00c:      	ldr	x22, [sp, #0x50]
    e010:      	ldr	x23, [sp, #0x58]
    e014:      	ldr	x24, [sp, #0x60]
    e018:      	ldr	x25, [sp, #0x68]
    e01c:      	ldr	x26, [sp, #0x70]
    e020:      	ldr	x27, [sp, #0x78]
    e024:      	ldr	x28, [sp, #0x80]
    e028:      	ldr	x29, [sp]
    e02c:      	ldr	x30, [sp, #0x8]
    e030:      	add	sp, sp, #0x90
    e034:      	ret
    e038:      	ldr	x0, [x23, #0x8]
    e03c:      	lsr	w0, w0, #0
    e040:      	ubfx	x0, x0, #8, #8
    e044:      	cmp	x0, x21
    e048:      	b.ne	0xde34 <_stogir.floating.operands+0x1e0>
    e04c:      	ldr	x0, [x29, #0x28]
    e050:      	ldr	x1, [x29, #0x30]
    e054:      	b	0xde3c <_stogir.floating.operands+0x1e8>
    e058:      	cmp	x25, #0x0
    e05c:      	cset	w0, lt
    e060:      	cmp	x25, #0x0
    e064:      	cset	w3, gt
    e068:      	movz	x16, #0x0, lsl #48
    e06c:      	sub	x4, x16, x25
    e070:      	sub	x5, x4, #0x1
    e074:      	uxtb	w16, w3
    e078:      	cmp	w16, wzr
    e07c:      	b.eq	0xe0d0 <_stogir.floating.operands+0x47c>
    e080:      	ldr	x4, [x22, #0x8]
    e084:      	cmp	x25, x4
    e088:      	b.ge	0xe120 <_stogir.floating.operands+0x4cc>
    e08c:      	add	x4, x22, #0x78
    e090:      	ldr	x4, [x4, #0x8]
    e094:      	cmp	x25, x4
    e098:      	b.ge	0xe234 <_stogir.floating.operands+0x5e0>
    e09c:      	lsl	x4, x25, #2
    e0a0:      	ldr	x6, [x22, #0x78]
    e0a4:      	add	x4, x4, x6
    e0a8:      	ldr	w4, [x4]
    e0ac:      	sxtw	x4, w4
    e0b0:      	cmp	x4, #0x0
    e0b4:      	cset	w4, ge
    e0b8:      	ubfx	x4, x4, #0, #8
    e0bc:      	fmov	d31, x1
    e0c0:      	mov	x1, x4
    e0c4:      	mov	x4, x2
    e0c8:      	fmov	x2, d31
    e0cc:      	b	0xe240 <_stogir.floating.operands+0x5ec>
    e0d0:      	uxtb	w16, w0
    e0d4:      	cmp	w16, wzr
    e0d8:      	b.eq	0xe130 <_stogir.floating.operands+0x4dc>
    e0dc:      	add	x6, x22, #0x28
    e0e0:      	add	x7, x22, #0x50
    e0e4:      	ldr	x6, [x6, #0x8]
    e0e8:      	ldr	x7, [x7, #0x8]
    e0ec:      	cmp	x6, x7
    e0f0:      	b.ne	0xe22c <_stogir.floating.operands+0x5d8>
    e0f4:      	cmp	x4, x6
    e0f8:      	b.gt	0xe294 <_stogir.floating.operands+0x640>
    e0fc:      	lsl	x4, x5, #2
    e100:      	ldr	x6, [x22, #0x50]
    e104:      	add	x4, x4, x6
    e108:      	ldr	w4, [x4]
    e10c:      	sxtw	x4, w4
    e110:      	cmp	x4, #0x0
    e114:      	cset	w4, gt
    e118:      	ubfx	x4, x4, #0, #8
    e11c:      	b	0xe298 <_stogir.floating.operands+0x644>
    e120:      	mov	x4, x2
    e124:      	mov	x2, x1
    e128:      	movz	x1, #0x0, lsl #48
    e12c:      	b	0xe144 <_stogir.floating.operands+0x4f0>
    e130:      	movz	x4, #0x0, lsl #48
    e134:      	fmov	d31, x1
    e138:      	mov	x1, x4
    e13c:      	mov	x4, x2
    e140:      	fmov	x2, d31
    e144:      	cmp	x1, #0x0
    e148:      	b.eq	0xe1b0 <_stogir.floating.operands+0x55c>
    e14c:      	uxtb	w16, w3
    e150:      	cmp	w16, wzr
    e154:      	b.eq	0xe17c <_stogir.floating.operands+0x528>
    e158:      	lsl	x1, x25, #4
    e15c:      	ldr	x3, [x22]
    e160:      	add	x1, x1, x3
    e164:      	ldr	x3, [x1]
    e168:      	ldr	x1, [x1, #0x8]
    e16c:      	fmov	d31, x1
    e170:      	mov	x1, x3
    e174:      	fmov	x3, d31
    e178:      	b	0xe19c <_stogir.floating.operands+0x548>
    e17c:      	lsl	x1, x5, #4
    e180:      	ldr	x3, [x22, #0x28]
    e184:      	add	x1, x1, x3
    e188:      	ldr	x3, [x1]
    e18c:      	ldr	x1, [x1, #0x8]
    e190:      	fmov	d31, x1
    e194:      	mov	x1, x3
    e198:      	fmov	x3, d31
    e19c:      	mov	x5, x4
    e1a0:      	mov	x4, x2
    e1a4:      	mov	x2, x1
    e1a8:      	mov	x1, #0x1                ; =1
    e1ac:      	b	0xe1c4 <_stogir.floating.operands+0x570>
    e1b0:      	mov	x5, x4
    e1b4:      	mov	x4, x2
    e1b8:      	movz	x1, #0x0, lsl #48
    e1bc:      	movz	x2, #0x0, lsl #48
    e1c0:      	movz	x3, #0x0, lsl #48
    e1c4:      	lsr	w1, w1, #0
    e1c8:      	lsr	x16, x1, #0
    e1cc:      	cmp	x16, #0x1
    e1d0:      	b.eq	0xe1ec <_stogir.floating.operands+0x598>
    e1d4:      	b.lo	0xe1dc <_stogir.floating.operands+0x588>
    e1d8:      	b	0xe1f0 <_stogir.floating.operands+0x59c>
    e1dc:      	cmp	x16, #0x0
    e1e0:      	b.eq	0xe1e8 <_stogir.floating.operands+0x594>
    e1e4:      	b	0xe1f0 <_stogir.floating.operands+0x59c>
    e1e8:      	b	0xe1f4 <_stogir.floating.operands+0x5a0>
    e1ec:      	b	0xe208 <_stogir.floating.operands+0x5b4>
    e1f0:      	b	0xe2f8 <_stogir.floating.operands+0x6a4>
    e1f4:      	adrp	x16, 0xe000 <_stogir.floating.operands+0x3ac>
		000000000000e1f4:  ARM64_RELOC_PAGE21	l_stogir.472
    e1f8:      	ldr	x16, [x16]
		000000000000e1f8:  ARM64_RELOC_PAGEOFF12	l_stogir.472
    e1fc:      	orr	x0, x16, xzr
    e200:      	mov	x1, #0x16               ; =22
    e204:      	b	0xddac <_stogir.floating.operands+0x158>
    e208:      	str	x2, [x24]
    e20c:      	str	x3, [x24, #0x8]
    e210:      	uxtb	w16, w0
    e214:      	cmp	w16, wzr
    e218:      	b.eq	0xe26c <_stogir.floating.operands+0x618>
    e21c:      	mov	x1, x4
    e220:      	mov	x2, x5
    e224:      	mov	x0, #0x1                ; =1
    e228:      	b	0xe250 <_stogir.floating.operands+0x5fc>
    e22c:      	movz	x4, #0x0, lsl #48
    e230:      	b	0xe134 <_stogir.floating.operands+0x4e0>
    e234:      	mov	x4, x2
    e238:      	mov	x2, x1
    e23c:      	movz	x1, #0x0, lsl #48
    e240:      	b	0xe12c <_stogir.floating.operands+0x4d8>
    e244:      	movz	x0, #0x0, lsl #48
    e248:      	mov	x1, x4
    e24c:      	mov	x2, x5
    e250:      	cmp	x0, #0x0
    e254:      	b.eq	0xdda4 <_stogir.floating.operands+0x150>
    e258:      	adrp	x16, 0xe000 <_stogir.floating.operands+0x3ac>
		000000000000e258:  ARM64_RELOC_PAGE21	l_stogir.473
    e25c:      	ldr	x16, [x16]
		000000000000e25c:  ARM64_RELOC_PAGEOFF12	l_stogir.473
    e260:      	orr	x0, x16, xzr
    e264:      	mov	x1, #0x2d               ; =45
    e268:      	b	0xddac <_stogir.floating.operands+0x158>
    e26c:      	ldr	w0, [x24]
    e270:      	uxtb	w0, w0
    e274:      	cmp	x0, #0x83
    e278:      	b.ge	0xe2a4 <_stogir.floating.operands+0x650>
    e27c:      	adrp	x16, 0xe000 <_stogir.floating.operands+0x3ac>
		000000000000e27c:  ARM64_RELOC_PAGE21	l_stogir.474
    e280:      	ldr	x16, [x16]
		000000000000e280:  ARM64_RELOC_PAGEOFF12	l_stogir.474
    e284:      	orr	x1, x16, xzr
    e288:      	add	x0, x0, x1
    e28c:      	ldrb	w0, [x0]
    e290:      	b	0xe2a8 <_stogir.floating.operands+0x654>
    e294:      	movz	x4, #0x0, lsl #48
    e298:      	b	0xe230 <_stogir.floating.operands+0x5dc>
    e29c:      	brk	#0
    e2a0:      	b	0xe29c <_stogir.floating.operands+0x648>
    e2a4:      	movz	x0, #0x0, lsl #48
    e2a8:      	uxtb	w0, w0
    e2ac:      	and	x0, x0, #0x2
    e2b0:      	uxtb	w0, w0
    e2b4:      	cmp	x0, #0x0
    e2b8:      	cset	w0, eq
    e2bc:      	uxtb	w16, w0
    e2c0:      	cmp	w16, wzr
    e2c4:      	cset	x0, eq
    e2c8:      	cmp	x0, #0x0
    e2cc:      	b.ne	0xe244 <_stogir.floating.operands+0x5f0>
    e2d0:      	ldr	w0, [x24]
    e2d4:      	uxtb	w0, w0
    e2d8:      	cmp	x0, #0x65
    e2dc:      	b.eq	0xe244 <_stogir.floating.operands+0x5f0>
    e2e0:      	cmp	x0, #0x66
    e2e4:      	b.eq	0xe244 <_stogir.floating.operands+0x5f0>
    e2e8:      	mov	x0, #0x1                ; =1
    e2ec:      	b	0xe248 <_stogir.floating.operands+0x5f4>
    e2f0:      	brk	#0
    e2f4:      	b	0xe2f0 <_stogir.floating.operands+0x69c>
    e2f8:      	brk	#0
    e2fc:      	b	0xe2f8 <_stogir.floating.operands+0x6a4>

000000000000e300 <_stogir.types.signed?>:
    e300:      	sxtw	x0, w0
    e304:      	cmp	x0, #0x7
    e308:      	b.lt	0xe31c <_stogir.types.signed?+0x1c>
    e30c:      	cmp	x0, #0xb
    e310:      	cset	w0, le
    e314:      	ubfx	x0, x0, #0, #8
    e318:      	b	0xe320 <_stogir.types.signed?+0x20>
    e31c:      	movz	x0, #0x0, lsl #48
    e320:      	ret

000000000000e324 <_stogir.integer-binary.logical?>:
    e324:      	sxtw	x0, w0
    e328:      	cmp	x0, #0x2e
    e32c:      	b.ne	0xe348 <_stogir.integer-binary.logical?+0x24>
    e330:      	mov	x0, #0x1                ; =1
    e334:      	b	0xe344 <_stogir.integer-binary.logical?+0x20>
    e338:      	cmp	x0, #0x30
    e33c:      	cset	w0, eq
    e340:      	ubfx	x0, x0, #0, #8
    e344:      	ret
    e348:      	cmp	x0, #0x2f
    e34c:      	b.ne	0xe338 <_stogir.integer-binary.logical?+0x14>
    e350:      	mov	x0, #0x1                ; =1
    e354:      	b	0xe344 <_stogir.integer-binary.logical?+0x20>

000000000000e358 <_inherent$slice$data__i8>:
    e358:      	ret

000000000000e35c <_inherent$slice$data__u32>:
    e35c:      	ret

000000000000e360 <_inherent$coil.arraylist.ArrayList$slice__stogir.node.Node>:
    e360:      	sub	sp, sp, #0x10
    e364:      	mov	x1, sp
    e368:      	ldr	x2, [x0]
    e36c:      	ldr	x0, [x0, #0x8]
    e370:      	str	x2, [x1]
    e374:      	str	x0, [x1, #0x8]
    e378:      	ldr	x0, [sp]
    e37c:      	ldr	x1, [sp, #0x8]
    e380:      	add	sp, sp, #0x10
    e384:      	ret

000000000000e388 <_inherent$slice$at__stogir.node.Node>:
    e388:      	lsl	x1, x2, #4
    e38c:      	add	x0, x1, x0
    e390:      	ret

000000000000e394 <_inherent$slice$new__u8>:
    e394:      	sub	sp, sp, #0x10
    e398:      	mov	x2, sp
    e39c:      	str	x0, [x2]
    e3a0:      	str	x1, [x2, #0x8]
    e3a4:      	ldr	x0, [sp]
    e3a8:      	ldr	x1, [sp, #0x8]
    e3ac:      	add	sp, sp, #0x10
    e3b0:      	ret

000000000000e3b4 <_stogir.vector-lanes.operands>:
    e3b4:      	sub	sp, sp, #0xa0
    e3b8:      	str	x29, [sp]
    e3bc:      	str	x30, [sp, #0x8]
    e3c0:      	mov	x29, sp
    e3c4:      	str	x19, [sp, #0x48]
    e3c8:      	str	x20, [sp, #0x50]
    e3cc:      	str	x21, [sp, #0x58]
    e3d0:      	str	x22, [sp, #0x60]
    e3d4:      	str	x23, [sp, #0x68]
    e3d8:      	str	x24, [sp, #0x70]
    e3dc:      	str	x25, [sp, #0x78]
    e3e0:      	str	x26, [sp, #0x80]
    e3e4:      	str	x27, [sp, #0x88]
    e3e8:      	str	x28, [sp, #0x90]
    e3ec:      	sub	sp, sp, #0x10
    e3f0:      	mov	x19, sp
    e3f4:      	sxtw	x4, w4
    e3f8:      	sub	sp, sp, #0x10
    e3fc:      	mov	x20, sp
    e400:      	cmp	x4, #0x0
    e404:      	cset	w7, gt
    e408:      	movz	x16, #0x0, lsl #48
    e40c:      	sub	x9, x16, x4
    e410:      	sub	sp, sp, #0x30
    e414:      	mov	x21, sp
    e418:      	sub	x10, x9, #0x1
    e41c:      	sub	sp, sp, #0x10
    e420:      	mov	x22, sp
    e424:      	uxtb	w16, w7
    e428:      	cmp	w16, wzr
    e42c:      	b.eq	0xe470 <_stogir.vector-lanes.operands+0xbc>
    e430:      	ldr	x9, [x0, #0x8]
    e434:      	cmp	x4, x9
    e438:      	b.ge	0xe4d4 <_stogir.vector-lanes.operands+0x120>
    e43c:      	add	x9, x0, #0x78
    e440:      	ldr	x9, [x9, #0x8]
    e444:      	cmp	x4, x9
    e448:      	b.ge	0xe614 <_stogir.vector-lanes.operands+0x260>
    e44c:      	lsl	x9, x4, #2
    e450:      	ldr	x11, [x0, #0x78]
    e454:      	add	x9, x9, x11
    e458:      	ldr	w9, [x9]
    e45c:      	sxtw	x9, w9
    e460:      	cmp	x9, #0x0
    e464:      	cset	w9, ge
    e468:      	ubfx	x9, x9, #0, #8
    e46c:      	b	0xe618 <_stogir.vector-lanes.operands+0x264>
    e470:      	cmp	x4, #0x0
    e474:      	b.ge	0xe4dc <_stogir.vector-lanes.operands+0x128>
    e478:      	add	x11, x0, #0x28
    e47c:      	add	x12, x0, #0x50
    e480:      	ldr	x11, [x11, #0x8]
    e484:      	ldr	x12, [x12, #0x8]
    e488:      	cmp	x11, x12
    e48c:      	b.ne	0xe4bc <_stogir.vector-lanes.operands+0x108>
    e490:      	cmp	x9, x11
    e494:      	b.gt	0xe7b0 <_stogir.vector-lanes.operands+0x3fc>
    e498:      	lsl	x9, x10, #2
    e49c:      	ldr	x11, [x0, #0x50]
    e4a0:      	add	x9, x9, x11
    e4a4:      	ldr	w9, [x9]
    e4a8:      	sxtw	x9, w9
    e4ac:      	cmp	x9, #0x0
    e4b0:      	cset	w9, gt
    e4b4:      	ubfx	x9, x9, #0, #8
    e4b8:      	b	0xe7b4 <_stogir.vector-lanes.operands+0x400>
    e4bc:      	movz	x9, #0x0, lsl #48
    e4c0:      	b	0xe4e0 <_stogir.vector-lanes.operands+0x12c>
    e4c4:      	mov	x1, x19
    e4c8:      	mov	x2, x20
    e4cc:      	mov	x0, #0x1                ; =1
    e4d0:      	b	0xe5a0 <_stogir.vector-lanes.operands+0x1ec>
    e4d4:      	movz	x9, #0x0, lsl #48
    e4d8:      	b	0xe4e0 <_stogir.vector-lanes.operands+0x12c>
    e4dc:      	movz	x9, #0x0, lsl #48
    e4e0:      	cmp	x9, #0x0
    e4e4:      	b.eq	0xe548 <_stogir.vector-lanes.operands+0x194>
    e4e8:      	uxtb	w16, w7
    e4ec:      	cmp	w16, wzr
    e4f0:      	b.eq	0xe518 <_stogir.vector-lanes.operands+0x164>
    e4f4:      	lsl	x4, x4, #4
    e4f8:      	ldr	x7, [x0]
    e4fc:      	add	x4, x4, x7
    e500:      	ldr	x7, [x4]
    e504:      	ldr	x4, [x4, #0x8]
    e508:      	fmov	d31, x4
    e50c:      	mov	x4, x7
    e510:      	fmov	x7, d31
    e514:      	b	0xe538 <_stogir.vector-lanes.operands+0x184>
    e518:      	lsl	x4, x10, #4
    e51c:      	ldr	x7, [x0, #0x28]
    e520:      	add	x4, x4, x7
    e524:      	ldr	x7, [x4]
    e528:      	ldr	x4, [x4, #0x8]
    e52c:      	fmov	d31, x4
    e530:      	mov	x4, x7
    e534:      	fmov	x7, d31
    e538:      	mov	x9, x7
    e53c:      	mov	x7, x4
    e540:      	mov	x4, #0x1                ; =1
    e544:      	b	0xe554 <_stogir.vector-lanes.operands+0x1a0>
    e548:      	movz	x4, #0x0, lsl #48
    e54c:      	movz	x7, #0x0, lsl #48
    e550:      	movz	x9, #0x0, lsl #48
    e554:      	lsr	w4, w4, #0
    e558:      	lsr	x16, x4, #0
    e55c:      	cmp	x16, #0x1
    e560:      	b.eq	0xe57c <_stogir.vector-lanes.operands+0x1c8>
    e564:      	b.lo	0xe56c <_stogir.vector-lanes.operands+0x1b8>
    e568:      	b	0xe580 <_stogir.vector-lanes.operands+0x1cc>
    e56c:      	cmp	x16, #0x0
    e570:      	b.eq	0xe578 <_stogir.vector-lanes.operands+0x1c4>
    e574:      	b	0xe580 <_stogir.vector-lanes.operands+0x1cc>
    e578:      	b	0xe584 <_stogir.vector-lanes.operands+0x1d0>
    e57c:      	b	0xe5ec <_stogir.vector-lanes.operands+0x238>
    e580:      	b	0xecb8 <_stogir.vector-lanes.operands+0x904>
    e584:      	adrp	x16, 0xe000 <_stogir.floating.operands+0x3ac>
		000000000000e584:  ARM64_RELOC_PAGE21	l_stogir.475
    e588:      	ldr	x16, [x16]
		000000000000e588:  ARM64_RELOC_PAGEOFF12	l_stogir.475
    e58c:      	orr	x0, x16, xzr
    e590:      	str	x8, [x29, #0x28]
    e594:      	mov	x1, x0
    e598:      	mov	x0, #0x1                ; =1
    e59c:      	mov	x2, #0x1b               ; =27
    e5a0:      	ldr	x3, [x29, #0x28]
    e5a4:      	str	x0, [x3]
    e5a8:      	str	x1, [x3, #0x8]
    e5ac:      	str	x2, [x3, #0x10]
    e5b0:      	sub	sp, x29, #0x0
    e5b4:      	ldr	x19, [sp, #0x48]
    e5b8:      	ldr	x20, [sp, #0x50]
    e5bc:      	ldr	x21, [sp, #0x58]
    e5c0:      	ldr	x22, [sp, #0x60]
    e5c4:      	ldr	x23, [sp, #0x68]
    e5c8:      	ldr	x24, [sp, #0x70]
    e5cc:      	ldr	x25, [sp, #0x78]
    e5d0:      	ldr	x26, [sp, #0x80]
    e5d4:      	ldr	x27, [sp, #0x88]
    e5d8:      	ldr	x28, [sp, #0x90]
    e5dc:      	ldr	x29, [sp]
    e5e0:      	ldr	x30, [sp, #0x8]
    e5e4:      	add	sp, sp, #0xa0
    e5e8:      	ret
    e5ec:      	sxtw	x23, w1
    e5f0:      	sxtw	x1, w2
    e5f4:      	str	x7, [x19]
    e5f8:      	str	x9, [x19, #0x8]
    e5fc:      	cmp	x23, #0x3d
    e600:      	b.ne	0xe61c <_stogir.vector-lanes.operands+0x268>
    e604:      	ldr	w4, [x19]
    e608:      	ubfx	x4, x4, #8, #8
    e60c:      	mov	x24, x4
    e610:      	b	0xe620 <_stogir.vector-lanes.operands+0x26c>
    e614:      	movz	x9, #0x0, lsl #48
    e618:      	b	0xe4d8 <_stogir.vector-lanes.operands+0x124>
    e61c:      	mov	x24, x1
    e620:      	cmp	x23, #0x3d
    e624:      	b.eq	0xe630 <_stogir.vector-lanes.operands+0x27c>
    e628:      	ldr	w1, [x19]
    e62c:      	ubfx	x1, x1, #8, #8
    e630:      	adrp	x16, 0xe000 <_stogir.floating.operands+0x3ac>
		000000000000e630:  ARM64_RELOC_PAGE21	l_stogir.476
    e634:      	ldr	x16, [x16]
		000000000000e634:  ARM64_RELOC_PAGEOFF12	l_stogir.476
    e638:      	orr	x25, x16, xzr
    e63c:      	lsr	w26, w24, #0
    e640:      	sxtw	x27, w26
    e644:      	cmp	x23, #0x3d
    e648:      	b.lt	0xe694 <_stogir.vector-lanes.operands+0x2e0>
    e64c:      	cmp	x23, #0x3f
    e650:      	b.gt	0xe694 <_stogir.vector-lanes.operands+0x2e0>
    e654:      	cmp	x27, #0xf
    e658:      	b.le	0xe694 <_stogir.vector-lanes.operands+0x2e0>
    e65c:      	cmp	x27, #0x80
    e660:      	b.ge	0xe694 <_stogir.vector-lanes.operands+0x2e0>
    e664:      	and	x4, x27, #0xf
    e668:      	lsr	w4, w4, #0
    e66c:      	sxtw	x4, w4
    e670:      	cmp	x4, #0x1
    e674:      	b.lt	0xe694 <_stogir.vector-lanes.operands+0x2e0>
    e678:      	cmp	x4, #0xd
    e67c:      	b.gt	0xe694 <_stogir.vector-lanes.operands+0x2e0>
    e680:      	sxtw	x4, w3
    e684:      	cmp	x4, #0x4
    e688:      	b.eq	0xed30 <_stogir.vector-lanes.operands+0x97c>
    e68c:      	cmp	x4, #0x8
    e690:      	b.eq	0xed30 <_stogir.vector-lanes.operands+0x97c>
    e694:      	adrp	x16, 0xe000 <_stogir.floating.operands+0x3ac>
		000000000000e694:  ARM64_RELOC_PAGE21	l_stogir.477
    e698:      	ldr	x16, [x16]
		000000000000e698:  ARM64_RELOC_PAGEOFF12	l_stogir.477
    e69c:      	orr	x4, x16, xzr
    e6a0:      	mov	x28, x4
    e6a4:      	mov	x4, #0x36               ; =54
    e6a8:      	sxtw	x5, w5
    e6ac:      	sxtw	x7, w6
    e6b0:      	cmp	x7, #0x0
    e6b4:      	cset	w7, eq
    e6b8:      	cmp	x23, #0x3f
    e6bc:      	b.ne	0xed80 <_stogir.vector-lanes.operands+0x9cc>
    e6c0:      	lsr	w1, w1, #0
    e6c4:      	lsr	w3, w3, #0
    e6c8:      	mov	w0, w26
    e6cc:      	mov	w2, w3
    e6d0:      	mov	x19, x8
    e6d4:      	mov	x20, x4
    e6d8:      	mov	x21, x5
    e6dc:      	mov	w22, w7
    e6e0:      	bl	0xe6e0 <_stogir.vector-lanes.operands+0x32c>
		000000000000e6e0:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.compatible?
    e6e4:      	cmp	x0, #0x0
    e6e8:      	b.eq	0xe80c <_stogir.vector-lanes.operands+0x458>
    e6ec:      	mov	x1, x28
    e6f0:      	movz	x0, #0x0, lsl #48
    e6f4:      	b	0xe814 <_stogir.vector-lanes.operands+0x460>
    e6f8:      	cmp	x23, #0x3d
    e6fc:      	b.ne	0xed88 <_stogir.vector-lanes.operands+0x9d4>
    e700:      	lsr	w2, w2, #0
    e704:      	lsr	w3, w3, #0
    e708:      	str	x1, [x29, #0x28]
    e70c:      	mov	w1, w2
    e710:      	mov	w2, w3
    e714:      	str	x4, [x29, #0x30]
    e718:      	str	w7, [x29, #0x40]
    e71c:      	str	x25, [x29, #0x10]
    e720:      	mov	x25, x0
    e724:      	mov	w0, w26
    e728:      	str	w26, [x29, #0x18]
    e72c:      	mov	w26, w3
    e730:      	str	x28, [x29, #0x20]
    e734:      	mov	w28, w6
    e738:      	str	x24, [x29, #0x38]
    e73c:      	mov	x24, x5
    e740:      	bl	0xe740 <_stogir.vector-lanes.operands+0x38c>
		000000000000e740:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.compatible?
    e744:      	cmp	x0, #0x0
    e748:      	b.ne	0xe824 <_stogir.vector-lanes.operands+0x470>
    e74c:      	adrp	x16, 0xe000 <_stogir.floating.operands+0x3ac>
		000000000000e74c:  ARM64_RELOC_PAGE21	l_stogir.478
    e750:      	ldr	x16, [x16]
		000000000000e750:  ARM64_RELOC_PAGEOFF12	l_stogir.478
    e754:      	orr	x0, x16, xzr
    e758:      	mov	x1, #0x26               ; =38
    e75c:      	b	0xe82c <_stogir.vector-lanes.operands+0x478>
    e760:      	mov	x0, x1
    e764:      	mov	x1, x20
    e768:      	str	x24, [x29, #0x38]
    e76c:      	str	x19, [x29, #0x28]
    e770:      	str	x25, [x29, #0x10]
    e774:      	mov	x19, x0
    e778:      	mov	x20, x1
    e77c:      	mov	x0, x19
    e780:      	mov	x1, x20
    e784:      	ldr	x2, [x29, #0x10]
    e788:      	movz	x3, #0x0, lsl #48
    e78c:      	bl	0xe78c <_stogir.vector-lanes.operands+0x3d8>
		000000000000e78c:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
    e790:      	cmp	x0, #0x0
    e794:      	b.eq	0xe4c4 <_stogir.vector-lanes.operands+0x110>
    e798:      	ldr	x0, [x29, #0x38]
    e79c:      	and	x0, x0, #0xffffffff
    e7a0:      	mov	x1, x0
    e7a4:      	movz	x0, #0x0, lsl #48
    e7a8:      	movz	x2, #0x0, lsl #48
    e7ac:      	b	0xe4d0 <_stogir.vector-lanes.operands+0x11c>
    e7b0:      	movz	x9, #0x0, lsl #48
    e7b4:      	b	0xe4c0 <_stogir.vector-lanes.operands+0x10c>
    e7b8:      	ldr	w0, [x29, #0x40]
    e7bc:      	uxtb	w16, w0
    e7c0:      	cmp	w16, wzr
    e7c4:      	b.eq	0xec14 <_stogir.vector-lanes.operands+0x860>
    e7c8:      	mov	x0, x19
    e7cc:      	mov	x1, x20
    e7d0:      	mov	x19, x0
    e7d4:      	mov	x20, x1
    e7d8:      	b	0xe77c <_stogir.vector-lanes.operands+0x3c8>
    e7dc:      	cmp	x21, #0x0
    e7e0:      	b.ne	0xeb08 <_stogir.vector-lanes.operands+0x754>
    e7e4:      	uxtb	w16, w22
    e7e8:      	cmp	w16, wzr
    e7ec:      	cset	x0, eq
    e7f0:      	cmp	x0, #0x0
    e7f4:      	b.eq	0xe760 <_stogir.vector-lanes.operands+0x3ac>
    e7f8:      	adrp	x16, 0xe000 <_stogir.floating.operands+0x3ac>
		000000000000e7f8:  ARM64_RELOC_PAGE21	l_stogir.479
    e7fc:      	ldr	x16, [x16]
		000000000000e7fc:  ARM64_RELOC_PAGEOFF12	l_stogir.479
    e800:      	orr	x0, x16, xzr
    e804:      	mov	x1, #0x24               ; =36
    e808:      	b	0xe768 <_stogir.vector-lanes.operands+0x3b4>
    e80c:      	mov	x1, x28
    e810:      	mov	x0, #0x1                ; =1
    e814:      	cmp	x0, #0x0
    e818:      	b.eq	0xe7dc <_stogir.vector-lanes.operands+0x428>
    e81c:      	mov	x0, #0x1                ; =1
    e820:      	b	0xe7f0 <_stogir.vector-lanes.operands+0x43c>
    e824:      	ldr	x0, [x29, #0x20]
    e828:      	ldr	x1, [x29, #0x30]
    e82c:      	cmp	x23, #0x3e
    e830:      	b.ne	0xe868 <_stogir.vector-lanes.operands+0x4b4>
    e834:      	ldr	w2, [x19]
    e838:      	ubfx	x2, x2, #8, #8
    e83c:      	cmp	x2, x27
    e840:      	b.ne	0xe850 <_stogir.vector-lanes.operands+0x49c>
    e844:      	mov	x2, x0
    e848:      	movz	x0, #0x0, lsl #48
    e84c:      	b	0xe858 <_stogir.vector-lanes.operands+0x4a4>
    e850:      	mov	x2, x0
    e854:      	mov	x0, #0x1                ; =1
    e858:      	fmov	d31, x1
    e85c:      	mov	x1, x2
    e860:      	fmov	x2, d31
    e864:      	b	0xe874 <_stogir.vector-lanes.operands+0x4c0>
    e868:      	mov	x2, x1
    e86c:      	mov	x1, x0
    e870:      	movz	x0, #0x0, lsl #48
    e874:      	cmp	x0, #0x0
    e878:      	b.eq	0xe890 <_stogir.vector-lanes.operands+0x4dc>
    e87c:      	adrp	x16, 0xe000 <_stogir.floating.operands+0x3ac>
		000000000000e87c:  ARM64_RELOC_PAGE21	l_stogir.480
    e880:      	ldr	x16, [x16]
		000000000000e880:  ARM64_RELOC_PAGEOFF12	l_stogir.480
    e884:      	orr	x0, x16, xzr
    e888:      	mov	x1, #0x27               ; =39
    e88c:      	b	0xe898 <_stogir.vector-lanes.operands+0x4e4>
    e890:      	mov	x0, x1
    e894:      	mov	x1, x2
    e898:      	cmp	x24, #0x0
    e89c:      	cset	w2, lt
    e8a0:      	cmp	x24, #0x0
    e8a4:      	cset	w3, gt
    e8a8:      	movz	x16, #0x0, lsl #48
    e8ac:      	sub	x4, x16, x24
    e8b0:      	sub	x5, x4, #0x1
    e8b4:      	uxtb	w16, w3
    e8b8:      	cmp	w16, wzr
    e8bc:      	b.eq	0xe90c <_stogir.vector-lanes.operands+0x558>
    e8c0:      	ldr	x4, [x25, #0x8]
    e8c4:      	cmp	x24, x4
    e8c8:      	b.ge	0xe9cc <_stogir.vector-lanes.operands+0x618>
    e8cc:      	add	x4, x25, #0x78
    e8d0:      	ldr	x4, [x4, #0x8]
    e8d4:      	cmp	x24, x4
    e8d8:      	b.ge	0xeaf0 <_stogir.vector-lanes.operands+0x73c>
    e8dc:      	lsl	x4, x24, #2
    e8e0:      	ldr	x6, [x25, #0x78]
    e8e4:      	add	x4, x4, x6
    e8e8:      	ldr	w4, [x4]
    e8ec:      	sxtw	x4, w4
    e8f0:      	cmp	x4, #0x0
    e8f4:      	cset	w4, ge
    e8f8:      	ubfx	x4, x4, #0, #8
    e8fc:      	fmov	d31, x0
    e900:      	mov	x0, x4
    e904:      	fmov	x4, d31
    e908:      	b	0xeaf8 <_stogir.vector-lanes.operands+0x744>
    e90c:      	uxtb	w16, w2
    e910:      	cmp	w16, wzr
    e914:      	b.eq	0xe9dc <_stogir.vector-lanes.operands+0x628>
    e918:      	add	x6, x25, #0x28
    e91c:      	add	x7, x25, #0x50
    e920:      	ldr	x6, [x6, #0x8]
    e924:      	ldr	x7, [x7, #0x8]
    e928:      	cmp	x6, x7
    e92c:      	b.ne	0xeae8 <_stogir.vector-lanes.operands+0x734>
    e930:      	cmp	x4, x6
    e934:      	b.gt	0xec28 <_stogir.vector-lanes.operands+0x874>
    e938:      	lsl	x4, x5, #2
    e93c:      	ldr	x6, [x25, #0x50]
    e940:      	add	x4, x4, x6
    e944:      	ldr	w4, [x4]
    e948:      	sxtw	x4, w4
    e94c:      	cmp	x4, #0x0
    e950:      	cset	w4, gt
    e954:      	ubfx	x4, x4, #0, #8
    e958:      	b	0xec2c <_stogir.vector-lanes.operands+0x878>
    e95c:      	mov	x0, x1
    e960:      	mov	x1, x2
    e964:      	mov	x19, x0
    e968:      	mov	x20, x1
    e96c:      	cmp	x23, #0x3e
    e970:      	b.ne	0xe7b8 <_stogir.vector-lanes.operands+0x404>
    e974:      	lsr	w28, w28, #0
    e978:      	mov	x8, x21
    e97c:      	mov	x0, x25
    e980:      	mov	w1, w28
    e984:      	bl	0xe984 <_stogir.vector-lanes.operands+0x5d0>
		000000000000e984:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    e988:      	ldr	w0, [x21]
    e98c:      	lsr	x16, x0, #0
    e990:      	cmp	x16, #0x1
    e994:      	b.eq	0xe9b0 <_stogir.vector-lanes.operands+0x5fc>
    e998:      	b.lo	0xe9a0 <_stogir.vector-lanes.operands+0x5ec>
    e99c:      	b	0xe9b4 <_stogir.vector-lanes.operands+0x600>
    e9a0:      	cmp	x16, #0x0
    e9a4:      	b.eq	0xe9ac <_stogir.vector-lanes.operands+0x5f8>
    e9a8:      	b	0xe9b4 <_stogir.vector-lanes.operands+0x600>
    e9ac:      	b	0xe9b8 <_stogir.vector-lanes.operands+0x604>
    e9b0:      	b	0xec30 <_stogir.vector-lanes.operands+0x87c>
    e9b4:      	b	0xed78 <_stogir.vector-lanes.operands+0x9c4>
    e9b8:      	adrp	x16, 0xe000 <_stogir.floating.operands+0x3ac>
		000000000000e9b8:  ARM64_RELOC_PAGE21	l_stogir.481
    e9bc:      	ldr	x16, [x16]
		000000000000e9bc:  ARM64_RELOC_PAGEOFF12	l_stogir.481
    e9c0:      	orr	x0, x16, xzr
    e9c4:      	mov	x1, #0x20               ; =32
    e9c8:      	b	0xeb18 <_stogir.vector-lanes.operands+0x764>
    e9cc:      	mov	x4, x1
    e9d0:      	mov	x1, x0
    e9d4:      	movz	x0, #0x0, lsl #48
    e9d8:      	b	0xe9f0 <_stogir.vector-lanes.operands+0x63c>
    e9dc:      	movz	x4, #0x0, lsl #48
    e9e0:      	fmov	d31, x0
    e9e4:      	mov	x0, x4
    e9e8:      	mov	x4, x1
    e9ec:      	fmov	x1, d31
    e9f0:      	cmp	x0, #0x0
    e9f4:      	b.eq	0xea5c <_stogir.vector-lanes.operands+0x6a8>
    e9f8:      	uxtb	w16, w3
    e9fc:      	cmp	w16, wzr
    ea00:      	b.eq	0xea28 <_stogir.vector-lanes.operands+0x674>
    ea04:      	lsl	x0, x24, #4
    ea08:      	ldr	x3, [x25]
    ea0c:      	add	x0, x0, x3
    ea10:      	ldr	x3, [x0]
    ea14:      	ldr	x0, [x0, #0x8]
    ea18:      	fmov	d31, x0
    ea1c:      	mov	x0, x3
    ea20:      	fmov	x3, d31
    ea24:      	b	0xea48 <_stogir.vector-lanes.operands+0x694>
    ea28:      	lsl	x0, x5, #4
    ea2c:      	ldr	x3, [x25, #0x28]
    ea30:      	add	x0, x0, x3
    ea34:      	ldr	x3, [x0]
    ea38:      	ldr	x0, [x0, #0x8]
    ea3c:      	fmov	d31, x0
    ea40:      	mov	x0, x3
    ea44:      	fmov	x3, d31
    ea48:      	mov	x5, x4
    ea4c:      	mov	x4, x1
    ea50:      	mov	x1, x0
    ea54:      	mov	x0, #0x1                ; =1
    ea58:      	b	0xea70 <_stogir.vector-lanes.operands+0x6bc>
    ea5c:      	mov	x5, x4
    ea60:      	mov	x4, x1
    ea64:      	movz	x0, #0x0, lsl #48
    ea68:      	movz	x1, #0x0, lsl #48
    ea6c:      	movz	x3, #0x0, lsl #48
    ea70:      	lsr	w0, w0, #0
    ea74:      	lsr	x16, x0, #0
    ea78:      	cmp	x16, #0x1
    ea7c:      	b.eq	0xea98 <_stogir.vector-lanes.operands+0x6e4>
    ea80:      	b.lo	0xea88 <_stogir.vector-lanes.operands+0x6d4>
    ea84:      	b	0xea9c <_stogir.vector-lanes.operands+0x6e8>
    ea88:      	cmp	x16, #0x0
    ea8c:      	b.eq	0xea94 <_stogir.vector-lanes.operands+0x6e0>
    ea90:      	b	0xea9c <_stogir.vector-lanes.operands+0x6e8>
    ea94:      	b	0xeaa0 <_stogir.vector-lanes.operands+0x6ec>
    ea98:      	b	0xeab8 <_stogir.vector-lanes.operands+0x704>
    ea9c:      	b	0xed70 <_stogir.vector-lanes.operands+0x9bc>
    eaa0:      	adrp	x16, 0xe000 <_stogir.floating.operands+0x3ac>
		000000000000eaa0:  ARM64_RELOC_PAGE21	l_stogir.482
    eaa4:      	ldr	x16, [x16]
		000000000000eaa4:  ARM64_RELOC_PAGEOFF12	l_stogir.482
    eaa8:      	orr	x0, x16, xzr
    eaac:      	mov	x19, x0
    eab0:      	mov	x20, #0x19              ; =25
    eab4:      	b	0xe96c <_stogir.vector-lanes.operands+0x5b8>
    eab8:      	lsr	w0, w1, #0
    eabc:      	str	x1, [x20]
    eac0:      	str	x3, [x20, #0x8]
    eac4:      	ubfx	x0, x0, #8, #8
    eac8:      	cmp	x0, #0x1
    eacc:      	b.lt	0xebf8 <_stogir.vector-lanes.operands+0x844>
    ead0:      	cmp	x0, #0xb
    ead4:      	cset	w0, le
    ead8:      	ubfx	x0, x0, #0, #8
    eadc:      	mov	x1, x4
    eae0:      	mov	x3, x5
    eae4:      	b	0xec04 <_stogir.vector-lanes.operands+0x850>
    eae8:      	movz	x4, #0x0, lsl #48
    eaec:      	b	0xe9e0 <_stogir.vector-lanes.operands+0x62c>
    eaf0:      	mov	x4, x0
    eaf4:      	movz	x0, #0x0, lsl #48
    eaf8:      	fmov	d31, x1
    eafc:      	mov	x1, x4
    eb00:      	fmov	x4, d31
    eb04:      	b	0xe9d8 <_stogir.vector-lanes.operands+0x624>
    eb08:      	mov	x0, #0x1                ; =1
    eb0c:      	b	0xe7f0 <_stogir.vector-lanes.operands+0x43c>
    eb10:      	mov	x0, x1
    eb14:      	mov	x1, x20
    eb18:      	b	0xe7d0 <_stogir.vector-lanes.operands+0x41c>
    eb1c:      	mov	x1, x0
    eb20:      	mov	x2, x19
    eb24:      	movz	x0, #0x0, lsl #48
    eb28:      	cmp	x0, #0x0
    eb2c:      	b.eq	0xe95c <_stogir.vector-lanes.operands+0x5a8>
    eb30:      	adrp	x16, 0xe000 <_stogir.floating.operands+0x3ac>
		000000000000eb30:  ARM64_RELOC_PAGE21	l_stogir.483
    eb34:      	ldr	x16, [x16]
		000000000000eb34:  ARM64_RELOC_PAGEOFF12	l_stogir.483
    eb38:      	orr	x0, x16, xzr
    eb3c:      	mov	x1, #0x28               ; =40
    eb40:      	b	0xe964 <_stogir.vector-lanes.operands+0x5b0>
    eb44:      	mov	x1, x24
    eb48:      	movz	x0, #0x0, lsl #48
    eb4c:      	mov	x2, x19
    eb50:      	b	0xeb28 <_stogir.vector-lanes.operands+0x774>
    eb54:      	mov	x0, x1
    eb58:      	mov	x19, x3
    eb5c:      	uxtb	w16, w2
    eb60:      	cmp	w16, wzr
    eb64:      	b.eq	0xeb1c <_stogir.vector-lanes.operands+0x768>
    eb68:      	ldr	w1, [x20]
    eb6c:      	uxtb	w2, w1
    eb70:      	ubfx	x1, x1, #8, #8
    eb74:      	cmp	x2, x1
    eb78:      	b.ne	0xec60 <_stogir.vector-lanes.operands+0x8ac>
    eb7c:      	mov	x24, x0
    eb80:      	mov	x0, #0x1                ; =1
    eb84:      	b	0xec74 <_stogir.vector-lanes.operands+0x8c0>
    eb88:      	cmp	x0, #0x46
    eb8c:      	cset	w0, eq
    eb90:      	uxtb	w16, w0
    eb94:      	cmp	w16, wzr
    eb98:      	cset	x0, eq
    eb9c:      	cmp	x0, #0x0
    eba0:      	cset	w0, ne
    eba4:      	uxtb	w16, w0
    eba8:      	cmp	w16, wzr
    ebac:      	cset	x0, eq
    ebb0:      	cmp	x0, #0x0
    ebb4:      	b.eq	0xeb54 <_stogir.vector-lanes.operands+0x7a0>
    ebb8:      	adrp	x16, 0xe000 <_stogir.floating.operands+0x3ac>
		000000000000ebb8:  ARM64_RELOC_PAGE21	l_stogir.484
    ebbc:      	ldr	x16, [x16]
		000000000000ebbc:  ARM64_RELOC_PAGEOFF12	l_stogir.484
    ebc0:      	orr	x0, x16, xzr
    ebc4:      	mov	x19, #0x2b              ; =43
    ebc8:      	b	0xeb5c <_stogir.vector-lanes.operands+0x7a8>
    ebcc:      	mov	x0, #0x1                ; =1
    ebd0:      	cmp	x0, #0x0
    ebd4:      	b.eq	0xebe0 <_stogir.vector-lanes.operands+0x82c>
    ebd8:      	mov	x0, #0x1                ; =1
    ebdc:      	b	0xebb0 <_stogir.vector-lanes.operands+0x7fc>
    ebe0:      	ldr	w0, [x20]
    ebe4:      	uxtb	w0, w0
    ebe8:      	cmp	x0, #0x48
    ebec:      	b.ne	0xeb88 <_stogir.vector-lanes.operands+0x7d4>
    ebf0:      	movz	x0, #0x0, lsl #48
    ebf4:      	b	0xeb9c <_stogir.vector-lanes.operands+0x7e8>
    ebf8:      	mov	x1, x4
    ebfc:      	mov	x3, x5
    ec00:      	movz	x0, #0x0, lsl #48
    ec04:      	cmp	x0, #0x0
    ec08:      	b.eq	0xebcc <_stogir.vector-lanes.operands+0x818>
    ec0c:      	movz	x0, #0x0, lsl #48
    ec10:      	b	0xebd0 <_stogir.vector-lanes.operands+0x81c>
    ec14:      	adrp	x16, 0xe000 <_stogir.floating.operands+0x3ac>
		000000000000ec14:  ARM64_RELOC_PAGE21	l_stogir.485
    ec18:      	ldr	x16, [x16]
		000000000000ec18:  ARM64_RELOC_PAGEOFF12	l_stogir.485
    ec1c:      	orr	x0, x16, xzr
    ec20:      	mov	x1, #0x20               ; =32
    ec24:      	b	0xe7d0 <_stogir.vector-lanes.operands+0x41c>
    ec28:      	movz	x4, #0x0, lsl #48
    ec2c:      	b	0xeaec <_stogir.vector-lanes.operands+0x738>
    ec30:      	orr	x23, x22, xzr
    ec34:      	add	x0, x21, #0x8
    ec38:      	ldr	x1, [x21, #0x8]
    ec3c:      	str	x1, [x22]
    ec40:      	ldr	x0, [x0, #0x8]
    ec44:      	str	x0, [x22, #0x8]
    ec48:      	mov	x0, x23
    ec4c:      	bl	0xec4c <_stogir.vector-lanes.operands+0x898>
		000000000000ec4c:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.ordinary?
    ec50:      	cmp	x0, #0x0
    ec54:      	b.eq	0xed18 <_stogir.vector-lanes.operands+0x964>
    ec58:      	movz	x0, #0x0, lsl #48
    ec5c:      	b	0xed1c <_stogir.vector-lanes.operands+0x968>
    ec60:      	cmp	x2, #0x49
    ec64:      	cset	w1, eq
    ec68:      	ubfx	x1, x1, #0, #8
    ec6c:      	mov	x24, x0
    ec70:      	mov	x0, x1
    ec74:      	cmp	x0, #0x0
    ec78:      	b.eq	0xeb44 <_stogir.vector-lanes.operands+0x790>
    ec7c:      	ldr	w0, [x20, #0x8]
    ec80:      	ubfx	x27, x0, #0, #32
    ec84:      	ldr	w20, [x20, #0xc]
    ec88:      	ldr	w0, [x29, #0x18]
    ec8c:      	bl	0xec8c <_stogir.vector-lanes.operands+0x8d8>
		000000000000ec8c:  ARM64_RELOC_BRANCH26	_stogir.types.lanes
    ec90:      	ubfx	x20, x20, #0, #32
    ec94:      	lsr	w0, w0, #0
    ec98:      	lsl	x1, x20, #32
    ec9c:      	sxtw	x0, w0
    eca0:      	orr	x1, x1, x27
    eca4:      	cmp	x1, x0
    eca8:      	cset	w0, hs
    ecac:      	ubfx	x0, x0, #0, #8
    ecb0:      	mov	x1, x24
    ecb4:      	b	0xeb4c <_stogir.vector-lanes.operands+0x798>
    ecb8:      	brk	#0
    ecbc:      	b	0xecb8 <_stogir.vector-lanes.operands+0x904>
    ecc0:      	lsr	w26, w26, #0
    ecc4:      	mov	x0, x23
    ecc8:      	bl	0xecc8 <_stogir.vector-lanes.operands+0x914>
		000000000000ecc8:  ARM64_RELOC_BRANCH26	_stogir.node.type-id
    eccc:      	uxtb	w0, w0
    ecd0:      	lsr	w0, w0, #0
    ecd4:      	mov	w1, w0
    ecd8:      	ldr	w0, [x29, #0x18]
    ecdc:      	mov	w2, w26
    ece0:      	bl	0xece0 <_stogir.vector-lanes.operands+0x92c>
		000000000000ece0:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.compatible?
    ece4:      	cmp	x0, #0x0
    ece8:      	cset	w0, ne
    ecec:      	uxtb	w16, w0
    ecf0:      	cmp	w16, wzr
    ecf4:      	cset	x0, eq
    ecf8:      	mov	x1, x19
    ecfc:      	cmp	x0, #0x0
    ed00:      	b.eq	0xeb10 <_stogir.vector-lanes.operands+0x75c>
    ed04:      	adrp	x16, 0xe000 <_stogir.floating.operands+0x3ac>
		000000000000ed04:  ARM64_RELOC_PAGE21	l_stogir.486
    ed08:      	ldr	x16, [x16]
		000000000000ed08:  ARM64_RELOC_PAGEOFF12	l_stogir.486
    ed0c:      	orr	x0, x16, xzr
    ed10:      	mov	x1, #0x27               ; =39
    ed14:      	b	0xeb18 <_stogir.vector-lanes.operands+0x764>
    ed18:      	mov	x0, #0x1                ; =1
    ed1c:      	cmp	x0, #0x0
    ed20:      	b.eq	0xecc0 <_stogir.vector-lanes.operands+0x90c>
    ed24:      	mov	x1, x19
    ed28:      	mov	x0, #0x1                ; =1
    ed2c:      	b	0xecfc <_stogir.vector-lanes.operands+0x948>
    ed30:      	ldr	w4, [x19]
    ed34:      	uxtb	w4, w4
    ed38:      	cmp	x4, #0x48
    ed3c:      	b.ne	0xed48 <_stogir.vector-lanes.operands+0x994>
    ed40:      	movz	x4, #0x0, lsl #48
    ed44:      	b	0xed5c <_stogir.vector-lanes.operands+0x9a8>
    ed48:      	cmp	x4, #0x46
    ed4c:      	cset	w4, eq
    ed50:      	uxtb	w16, w4
    ed54:      	cmp	w16, wzr
    ed58:      	cset	x4, eq
    ed5c:      	cmp	x4, #0x0
    ed60:      	b.eq	0xe694 <_stogir.vector-lanes.operands+0x2e0>
    ed64:      	mov	x28, x25
    ed68:      	movz	x4, #0x0, lsl #48
    ed6c:      	b	0xe6a8 <_stogir.vector-lanes.operands+0x2f4>
    ed70:      	brk	#0
    ed74:      	b	0xed70 <_stogir.vector-lanes.operands+0x9bc>
    ed78:      	brk	#0
    ed7c:      	b	0xed78 <_stogir.vector-lanes.operands+0x9c4>
    ed80:      	mov	x1, x8
    ed84:      	b	0xe6f8 <_stogir.vector-lanes.operands+0x344>
    ed88:      	str	x24, [x29, #0x38]
    ed8c:      	str	x1, [x29, #0x28]
    ed90:      	mov	x24, x5
    ed94:      	str	x25, [x29, #0x10]
    ed98:      	mov	x25, x0
    ed9c:      	str	w26, [x29, #0x18]
    eda0:      	mov	w26, w3
    eda4:      	str	w7, [x29, #0x40]
    eda8:      	str	x28, [x29, #0x20]
    edac:      	mov	w28, w6
    edb0:      	str	x4, [x29, #0x30]
    edb4:      	b	0xe824 <_stogir.vector-lanes.operands+0x470>

000000000000edb8 <_stogir.vector-comparison.operation?>:
    edb8:      	sxtw	x0, w0
    edbc:      	cmp	x0, #0xe
    edc0:      	b.lt	0xedd4 <_stogir.vector-comparison.operation?+0x1c>
    edc4:      	cmp	x0, #0x19
    edc8:      	cset	w0, le
    edcc:      	ubfx	x0, x0, #0, #8
    edd0:      	b	0xedd8 <_stogir.vector-comparison.operation?+0x20>
    edd4:      	movz	x0, #0x0, lsl #48
    edd8:      	ret

000000000000eddc <_stogir.vector-comparison.operands>:
    eddc:      	sub	sp, sp, #0x60
    ede0:      	str	x29, [sp]
    ede4:      	str	x30, [sp, #0x8]
    ede8:      	mov	x29, sp
    edec:      	str	x19, [sp, #0x10]
    edf0:      	str	x20, [sp, #0x18]
    edf4:      	str	x21, [sp, #0x20]
    edf8:      	str	x22, [sp, #0x28]
    edfc:      	str	x23, [sp, #0x30]
    ee00:      	str	x24, [sp, #0x38]
    ee04:      	str	x25, [sp, #0x40]
    ee08:      	str	x26, [sp, #0x48]
    ee0c:      	str	x27, [sp, #0x50]
    ee10:      	sub	sp, sp, #0x10
    ee14:      	mov	x19, sp
    ee18:      	sxtw	x4, w4
    ee1c:      	sub	sp, sp, #0x10
    ee20:      	mov	x20, sp
    ee24:      	cmp	x4, #0x0
    ee28:      	cset	w6, gt
    ee2c:      	movz	x16, #0x0, lsl #48
    ee30:      	sub	x7, x16, x4
    ee34:      	sub	x9, x7, #0x1
    ee38:      	uxtb	w16, w6
    ee3c:      	cmp	w16, wzr
    ee40:      	b.eq	0xee84 <_stogir.vector-comparison.operands+0xa8>
    ee44:      	ldr	x7, [x0, #0x8]
    ee48:      	cmp	x4, x7
    ee4c:      	b.ge	0xeed8 <_stogir.vector-comparison.operands+0xfc>
    ee50:      	add	x7, x0, #0x78
    ee54:      	ldr	x7, [x7, #0x8]
    ee58:      	cmp	x4, x7
    ee5c:      	b.ge	0xf054 <_stogir.vector-comparison.operands+0x278>
    ee60:      	lsl	x7, x4, #2
    ee64:      	ldr	x10, [x0, #0x78]
    ee68:      	add	x7, x7, x10
    ee6c:      	ldr	w7, [x7]
    ee70:      	sxtw	x7, w7
    ee74:      	cmp	x7, #0x0
    ee78:      	cset	w7, ge
    ee7c:      	ubfx	x7, x7, #0, #8
    ee80:      	b	0xf058 <_stogir.vector-comparison.operands+0x27c>
    ee84:      	cmp	x4, #0x0
    ee88:      	b.ge	0xeee0 <_stogir.vector-comparison.operands+0x104>
    ee8c:      	add	x10, x0, #0x28
    ee90:      	add	x11, x0, #0x50
    ee94:      	ldr	x10, [x10, #0x8]
    ee98:      	ldr	x11, [x11, #0x8]
    ee9c:      	cmp	x10, x11
    eea0:      	b.ne	0xeed0 <_stogir.vector-comparison.operands+0xf4>
    eea4:      	cmp	x7, x10
    eea8:      	b.gt	0xf0e8 <_stogir.vector-comparison.operands+0x30c>
    eeac:      	lsl	x7, x9, #2
    eeb0:      	ldr	x10, [x0, #0x50]
    eeb4:      	add	x7, x7, x10
    eeb8:      	ldr	w7, [x7]
    eebc:      	sxtw	x7, w7
    eec0:      	cmp	x7, #0x0
    eec4:      	cset	w7, gt
    eec8:      	ubfx	x7, x7, #0, #8
    eecc:      	b	0xf0ec <_stogir.vector-comparison.operands+0x310>
    eed0:      	movz	x7, #0x0, lsl #48
    eed4:      	b	0xeee4 <_stogir.vector-comparison.operands+0x108>
    eed8:      	movz	x7, #0x0, lsl #48
    eedc:      	b	0xeee4 <_stogir.vector-comparison.operands+0x108>
    eee0:      	movz	x7, #0x0, lsl #48
    eee4:      	cmp	x7, #0x0
    eee8:      	b.eq	0xef4c <_stogir.vector-comparison.operands+0x170>
    eeec:      	uxtb	w16, w6
    eef0:      	cmp	w16, wzr
    eef4:      	b.eq	0xef1c <_stogir.vector-comparison.operands+0x140>
    eef8:      	lsl	x4, x4, #4
    eefc:      	ldr	x6, [x0]
    ef00:      	add	x4, x4, x6
    ef04:      	ldr	x6, [x4]
    ef08:      	ldr	x4, [x4, #0x8]
    ef0c:      	fmov	d31, x4
    ef10:      	mov	x4, x6
    ef14:      	fmov	x6, d31
    ef18:      	b	0xef3c <_stogir.vector-comparison.operands+0x160>
    ef1c:      	lsl	x4, x9, #4
    ef20:      	ldr	x6, [x0, #0x28]
    ef24:      	add	x4, x4, x6
    ef28:      	ldr	x6, [x4]
    ef2c:      	ldr	x4, [x4, #0x8]
    ef30:      	fmov	d31, x4
    ef34:      	mov	x4, x6
    ef38:      	fmov	x6, d31
    ef3c:      	mov	x7, x6
    ef40:      	mov	x6, x4
    ef44:      	mov	x4, #0x1                ; =1
    ef48:      	b	0xef58 <_stogir.vector-comparison.operands+0x17c>
    ef4c:      	movz	x4, #0x0, lsl #48
    ef50:      	movz	x6, #0x0, lsl #48
    ef54:      	movz	x7, #0x0, lsl #48
    ef58:      	adrp	x16, 0xe000 <_stogir.floating.operands+0x3ac>
		000000000000ef58:  ARM64_RELOC_PAGE21	l_stogir.487
    ef5c:      	ldr	x16, [x16]
		000000000000ef5c:  ARM64_RELOC_PAGEOFF12	l_stogir.487
    ef60:      	orr	x9, x16, xzr
    ef64:      	lsr	w4, w4, #0
    ef68:      	lsr	x16, x4, #0
    ef6c:      	cmp	x16, #0x1
    ef70:      	b.eq	0xef8c <_stogir.vector-comparison.operands+0x1b0>
    ef74:      	b.lo	0xef7c <_stogir.vector-comparison.operands+0x1a0>
    ef78:      	b	0xef90 <_stogir.vector-comparison.operands+0x1b4>
    ef7c:      	cmp	x16, #0x0
    ef80:      	b.eq	0xef88 <_stogir.vector-comparison.operands+0x1ac>
    ef84:      	b	0xef90 <_stogir.vector-comparison.operands+0x1b4>
    ef88:      	b	0xef94 <_stogir.vector-comparison.operands+0x1b8>
    ef8c:      	b	0xefe8 <_stogir.vector-comparison.operands+0x20c>
    ef90:      	b	0xf23c <_stogir.vector-comparison.operands+0x460>
    ef94:      	mov	x25, x8
    ef98:      	mov	x1, x9
    ef9c:      	mov	x0, #0x1                ; =1
    efa0:      	mov	x2, #0x21               ; =33
    efa4:      	str	x0, [x25]
    efa8:      	str	x1, [x25, #0x8]
    efac:      	str	x2, [x25, #0x10]
    efb0:      	sub	sp, x29, #0x0
    efb4:      	ldr	x19, [sp, #0x10]
    efb8:      	ldr	x20, [sp, #0x18]
    efbc:      	ldr	x21, [sp, #0x20]
    efc0:      	ldr	x22, [sp, #0x28]
    efc4:      	ldr	x23, [sp, #0x30]
    efc8:      	ldr	x24, [sp, #0x38]
    efcc:      	ldr	x25, [sp, #0x40]
    efd0:      	ldr	x26, [sp, #0x48]
    efd4:      	ldr	x27, [sp, #0x50]
    efd8:      	ldr	x29, [sp]
    efdc:      	ldr	x30, [sp, #0x8]
    efe0:      	add	sp, sp, #0x60
    efe4:      	ret
    efe8:      	sxtw	x5, w5
    efec:      	str	x6, [x19]
    eff0:      	cmp	x5, #0x0
    eff4:      	cset	w4, gt
    eff8:      	movz	x16, #0x0, lsl #48
    effc:      	sub	x6, x16, x5
    f000:      	str	x7, [x19, #0x8]
    f004:      	sub	x7, x6, #0x1
    f008:      	uxtb	w16, w4
    f00c:      	cmp	w16, wzr
    f010:      	b.eq	0xf09c <_stogir.vector-comparison.operands+0x2c0>
    f014:      	ldr	x6, [x0, #0x8]
    f018:      	cmp	x5, x6
    f01c:      	b.ge	0xf0f0 <_stogir.vector-comparison.operands+0x314>
    f020:      	add	x6, x0, #0x78
    f024:      	ldr	x6, [x6, #0x8]
    f028:      	cmp	x5, x6
    f02c:      	b.ge	0xf1bc <_stogir.vector-comparison.operands+0x3e0>
    f030:      	lsl	x6, x5, #2
    f034:      	ldr	x10, [x0, #0x78]
    f038:      	add	x6, x6, x10
    f03c:      	ldr	w6, [x6]
    f040:      	sxtw	x6, w6
    f044:      	cmp	x6, #0x0
    f048:      	cset	w6, ge
    f04c:      	ubfx	x6, x6, #0, #8
    f050:      	b	0xf1c0 <_stogir.vector-comparison.operands+0x3e4>
    f054:      	movz	x7, #0x0, lsl #48
    f058:      	b	0xeedc <_stogir.vector-comparison.operands+0x100>
    f05c:      	sxtw	x0, w3
    f060:      	str	x4, [x20]
    f064:      	str	x5, [x20, #0x8]
    f068:      	ldr	w4, [x19]
    f06c:      	cmp	x0, #0x4
    f070:      	b.eq	0xf1c4 <_stogir.vector-comparison.operands+0x3e8>
    f074:      	cmp	x0, #0x8
    f078:      	b.eq	0xf1c4 <_stogir.vector-comparison.operands+0x3e8>
    f07c:      	mov	x25, x8
    f080:      	adrp	x16, 0xf000 <_stogir.vector-comparison.operands+0x224>
		000000000000f080:  ARM64_RELOC_PAGE21	l_stogir.488
    f084:      	ldr	x16, [x16]
		000000000000f084:  ARM64_RELOC_PAGEOFF12	l_stogir.488
    f088:      	orr	x0, x16, xzr
    f08c:      	mov	x1, x0
    f090:      	mov	x0, #0x1                ; =1
    f094:      	mov	x2, #0x33               ; =51
    f098:      	b	0xefa4 <_stogir.vector-comparison.operands+0x1c8>
    f09c:      	cmp	x5, #0x0
    f0a0:      	b.ge	0xf0f8 <_stogir.vector-comparison.operands+0x31c>
    f0a4:      	add	x10, x0, #0x28
    f0a8:      	add	x11, x0, #0x50
    f0ac:      	ldr	x10, [x10, #0x8]
    f0b0:      	ldr	x11, [x11, #0x8]
    f0b4:      	cmp	x10, x11
    f0b8:      	b.ne	0xf1b4 <_stogir.vector-comparison.operands+0x3d8>
    f0bc:      	cmp	x6, x10
    f0c0:      	b.gt	0xf234 <_stogir.vector-comparison.operands+0x458>
    f0c4:      	lsl	x6, x7, #2
    f0c8:      	ldr	x10, [x0, #0x50]
    f0cc:      	add	x6, x6, x10
    f0d0:      	ldr	w6, [x6]
    f0d4:      	sxtw	x6, w6
    f0d8:      	cmp	x6, #0x0
    f0dc:      	cset	w6, gt
    f0e0:      	ubfx	x6, x6, #0, #8
    f0e4:      	b	0xf238 <_stogir.vector-comparison.operands+0x45c>
    f0e8:      	movz	x7, #0x0, lsl #48
    f0ec:      	b	0xeed4 <_stogir.vector-comparison.operands+0xf8>
    f0f0:      	movz	x6, #0x0, lsl #48
    f0f4:      	b	0xf0fc <_stogir.vector-comparison.operands+0x320>
    f0f8:      	movz	x6, #0x0, lsl #48
    f0fc:      	cmp	x6, #0x0
    f100:      	b.eq	0xf164 <_stogir.vector-comparison.operands+0x388>
    f104:      	uxtb	w16, w4
    f108:      	cmp	w16, wzr
    f10c:      	b.eq	0xf134 <_stogir.vector-comparison.operands+0x358>
    f110:      	lsl	x4, x5, #4
    f114:      	ldr	x0, [x0]
    f118:      	add	x0, x4, x0
    f11c:      	ldr	x4, [x0]
    f120:      	ldr	x0, [x0, #0x8]
    f124:      	fmov	d31, x0
    f128:      	mov	x0, x4
    f12c:      	fmov	x4, d31
    f130:      	b	0xf154 <_stogir.vector-comparison.operands+0x378>
    f134:      	lsl	x4, x7, #4
    f138:      	ldr	x0, [x0, #0x28]
    f13c:      	add	x0, x4, x0
    f140:      	ldr	x4, [x0]
    f144:      	ldr	x0, [x0, #0x8]
    f148:      	fmov	d31, x0
    f14c:      	mov	x0, x4
    f150:      	fmov	x4, d31
    f154:      	mov	x5, x4
    f158:      	mov	x4, x0
    f15c:      	mov	x0, #0x1                ; =1
    f160:      	b	0xf170 <_stogir.vector-comparison.operands+0x394>
    f164:      	movz	x0, #0x0, lsl #48
    f168:      	movz	x4, #0x0, lsl #48
    f16c:      	movz	x5, #0x0, lsl #48
    f170:      	lsr	w0, w0, #0
    f174:      	lsr	x16, x0, #0
    f178:      	cmp	x16, #0x1
    f17c:      	b.eq	0xf198 <_stogir.vector-comparison.operands+0x3bc>
    f180:      	b.lo	0xf188 <_stogir.vector-comparison.operands+0x3ac>
    f184:      	b	0xf19c <_stogir.vector-comparison.operands+0x3c0>
    f188:      	cmp	x16, #0x0
    f18c:      	b.eq	0xf194 <_stogir.vector-comparison.operands+0x3b8>
    f190:      	b	0xf19c <_stogir.vector-comparison.operands+0x3c0>
    f194:      	b	0xf1a0 <_stogir.vector-comparison.operands+0x3c4>
    f198:      	b	0xf05c <_stogir.vector-comparison.operands+0x280>
    f19c:      	b	0xf244 <_stogir.vector-comparison.operands+0x468>
    f1a0:      	mov	x25, x8
    f1a4:      	mov	x1, x9
    f1a8:      	mov	x0, #0x1                ; =1
    f1ac:      	mov	x2, #0x21               ; =33
    f1b0:      	b	0xf098 <_stogir.vector-comparison.operands+0x2bc>
    f1b4:      	movz	x6, #0x0, lsl #48
    f1b8:      	b	0xf0fc <_stogir.vector-comparison.operands+0x320>
    f1bc:      	movz	x6, #0x0, lsl #48
    f1c0:      	b	0xf0f4 <_stogir.vector-comparison.operands+0x318>
    f1c4:      	sxtw	x21, w1
    f1c8:      	cmp	x21, #0xe
    f1cc:      	b.lt	0xf3b4 <_stogir.vector-comparison.operands+0x5d8>
    f1d0:      	cmp	x21, #0x19
    f1d4:      	b.gt	0xf3bc <_stogir.vector-comparison.operands+0x5e0>
    f1d8:      	ubfx	x0, x4, #8, #8
    f1dc:      	orr	x22, x0, xzr
    f1e0:      	cmp	x22, #0xf
    f1e4:      	b.le	0xf3c4 <_stogir.vector-comparison.operands+0x5e8>
    f1e8:      	cmp	x22, #0x80
    f1ec:      	b.ge	0xf3cc <_stogir.vector-comparison.operands+0x5f0>
    f1f0:      	and	x1, x22, #0xf
    f1f4:      	lsr	w1, w1, #0
    f1f8:      	sxtw	x23, w1
    f1fc:      	cmp	x23, #0x1
    f200:      	b.lt	0xf3d4 <_stogir.vector-comparison.operands+0x5f8>
    f204:      	cmp	x23, #0xd
    f208:      	b.gt	0xf3dc <_stogir.vector-comparison.operands+0x600>
    f20c:      	lsr	w24, w0, #0
    f210:      	mov	w0, w24
    f214:      	mov	x25, x8
    f218:      	mov	w26, w2
    f21c:      	mov	w27, w3
    f220:      	bl	0xf220 <_stogir.vector-comparison.operands+0x444>
		000000000000f220:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
    f224:      	cmp	x0, #0x0
    f228:      	b.eq	0xf24c <_stogir.vector-comparison.operands+0x470>
    f22c:      	mov	x0, x23
    f230:      	b	0xf250 <_stogir.vector-comparison.operands+0x474>
    f234:      	movz	x6, #0x0, lsl #48
    f238:      	b	0xf1b8 <_stogir.vector-comparison.operands+0x3dc>
    f23c:      	brk	#0
    f240:      	b	0xf23c <_stogir.vector-comparison.operands+0x460>
    f244:      	brk	#0
    f248:      	b	0xf244 <_stogir.vector-comparison.operands+0x468>
    f24c:      	movn	x0, #0x0, lsl #48
    f250:      	lsr	w0, w0, #0
    f254:      	sxtw	x0, w0
    f258:      	cmp	x0, #0xc
    f25c:      	b.eq	0xf2a4 <_stogir.vector-comparison.operands+0x4c8>
    f260:      	cmp	x0, #0xd
    f264:      	b.eq	0xf2a4 <_stogir.vector-comparison.operands+0x4c8>
    f268:      	mov	w0, w24
    f26c:      	bl	0xf26c <_stogir.vector-comparison.operands+0x490>
		000000000000f26c:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
    f270:      	cmp	x0, #0x0
    f274:      	b.eq	0xf280 <_stogir.vector-comparison.operands+0x4a4>
    f278:      	mov	x0, x23
    f27c:      	b	0xf284 <_stogir.vector-comparison.operands+0x4a8>
    f280:      	movn	x0, #0x0, lsl #48
    f284:      	lsr	w0, w0, #0
    f288:      	sxtw	x0, w0
    f28c:      	cmp	x0, #0x1
    f290:      	b.lt	0xf080 <_stogir.vector-comparison.operands+0x2a4>
    f294:      	cmp	x0, #0xb
    f298:      	b.gt	0xf080 <_stogir.vector-comparison.operands+0x2a4>
    f29c:      	cmp	x21, #0x17
    f2a0:      	b.gt	0xf080 <_stogir.vector-comparison.operands+0x2a4>
    f2a4:      	ldr	w0, [x19]
    f2a8:      	orr	x1, x0, xzr
    f2ac:      	ldr	w2, [x20]
    f2b0:      	orr	x3, x2, xzr
    f2b4:      	ubfx	x1, x1, #8, #8
    f2b8:      	ubfx	x3, x3, #8, #8
    f2bc:      	cmp	x1, x3
    f2c0:      	b.ne	0xf080 <_stogir.vector-comparison.operands+0x2a4>
    f2c4:      	uxtb	w0, w0
    f2c8:      	cmp	x0, #0x48
    f2cc:      	b.eq	0xf080 <_stogir.vector-comparison.operands+0x2a4>
    f2d0:      	cmp	x0, #0x46
    f2d4:      	b.eq	0xf080 <_stogir.vector-comparison.operands+0x2a4>
    f2d8:      	uxtb	w2, w2
    f2dc:      	cmp	x2, #0x48
    f2e0:      	b.eq	0xf080 <_stogir.vector-comparison.operands+0x2a4>
    f2e4:      	cmp	x2, #0x46
    f2e8:      	b.eq	0xf080 <_stogir.vector-comparison.operands+0x2a4>
    f2ec:      	lsr	w26, w26, #0
    f2f0:      	mov	w0, w26
    f2f4:      	bl	0xf2f4 <_stogir.vector-comparison.operands+0x518>
		000000000000f2f4:  ARM64_RELOC_BRANCH26	_stogir.types.vector?
    f2f8:      	cmp	x0, #0x0
    f2fc:      	b.eq	0xf080 <_stogir.vector-comparison.operands+0x2a4>
    f300:      	lsr	w26, w26, #0
    f304:      	mov	w0, w26
    f308:      	bl	0xf308 <_stogir.vector-comparison.operands+0x52c>
		000000000000f308:  ARM64_RELOC_BRANCH26	_stogir.types.base-type
    f30c:      	lsr	w0, w0, #0
    f310:      	lsr	w0, w0, #0
    f314:      	bl	0xf314 <_stogir.vector-comparison.operands+0x538>
		000000000000f314:  ARM64_RELOC_BRANCH26	_stogir.types.integer?
    f318:      	cmp	x0, #0x0
    f31c:      	b.eq	0xf080 <_stogir.vector-comparison.operands+0x2a4>
    f320:      	lsr	w26, w26, #0
    f324:      	mov	w0, w26
    f328:      	bl	0xf328 <_stogir.vector-comparison.operands+0x54c>
		000000000000f328:  ARM64_RELOC_BRANCH26	_stogir.types.lanes
    f32c:      	lsr	w19, w0, #0
    f330:      	mov	w0, w24
    f334:      	bl	0xf334 <_stogir.vector-comparison.operands+0x558>
		000000000000f334:  ARM64_RELOC_BRANCH26	_stogir.types.lanes
    f338:      	sxtw	x19, w19
    f33c:      	lsr	w0, w0, #0
    f340:      	sxtw	x0, w0
    f344:      	cmp	x19, x0
    f348:      	b.ne	0xf080 <_stogir.vector-comparison.operands+0x2a4>
    f34c:      	lsr	w26, w26, #0
    f350:      	lsr	w27, w27, #0
    f354:      	mov	w0, w26
    f358:      	bl	0xf358 <_stogir.vector-comparison.operands+0x57c>
		000000000000f358:  ARM64_RELOC_BRANCH26	_stogir.types.base-type
    f35c:      	lsr	w0, w0, #0
    f360:      	lsr	w0, w0, #0
    f364:      	mov	w1, w27
    f368:      	bl	0xf368 <_stogir.vector-comparison.operands+0x58c>
		000000000000f368:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    f36c:      	mov	x19, x0
    f370:      	mov	w0, w24
    f374:      	bl	0xf374 <_stogir.vector-comparison.operands+0x598>
		000000000000f374:  ARM64_RELOC_BRANCH26	_stogir.types.base-type
    f378:      	lsr	w0, w0, #0
    f37c:      	lsr	w0, w0, #0
    f380:      	mov	w1, w27
    f384:      	bl	0xf384 <_stogir.vector-comparison.operands+0x5a8>
		000000000000f384:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    f388:      	lsr	w19, w19, #0
    f38c:      	lsr	w0, w0, #0
    f390:      	sxtw	x19, w19
    f394:      	sxtw	x0, w0
    f398:      	cmp	x19, x0
    f39c:      	b.ne	0xf080 <_stogir.vector-comparison.operands+0x2a4>
    f3a0:      	and	x0, x22, #0xffffffff
    f3a4:      	mov	x1, x0
    f3a8:      	movz	x0, #0x0, lsl #48
    f3ac:      	movz	x2, #0x0, lsl #48
    f3b0:      	b	0xf098 <_stogir.vector-comparison.operands+0x2bc>
    f3b4:      	mov	x25, x8
    f3b8:      	b	0xf080 <_stogir.vector-comparison.operands+0x2a4>
    f3bc:      	mov	x25, x8
    f3c0:      	b	0xf080 <_stogir.vector-comparison.operands+0x2a4>
    f3c4:      	mov	x25, x8
    f3c8:      	b	0xf080 <_stogir.vector-comparison.operands+0x2a4>
    f3cc:      	mov	x25, x8
    f3d0:      	b	0xf080 <_stogir.vector-comparison.operands+0x2a4>
    f3d4:      	mov	x25, x8
    f3d8:      	b	0xf080 <_stogir.vector-comparison.operands+0x2a4>
    f3dc:      	mov	x25, x8
    f3e0:      	b	0xf080 <_stogir.vector-comparison.operands+0x2a4>

000000000000f3e4 <_stogir.vector-arithmetic.operation?>:
    f3e4:      	sxtw	x0, w0
    f3e8:      	cmp	x0, #0x1f
    f3ec:      	b.eq	0xf448 <_stogir.vector-arithmetic.operation?+0x64>
    f3f0:      	cmp	x0, #0x20
    f3f4:      	b.eq	0xf448 <_stogir.vector-arithmetic.operation?+0x64>
    f3f8:      	cmp	x0, #0x2d
    f3fc:      	b.eq	0xf448 <_stogir.vector-arithmetic.operation?+0x64>
    f400:      	cmp	x0, #0x36
    f404:      	b.eq	0xf448 <_stogir.vector-arithmetic.operation?+0x64>
    f408:      	cmp	x0, #0x37
    f40c:      	b.eq	0xf448 <_stogir.vector-arithmetic.operation?+0x64>
    f410:      	cmp	x0, #0x38
    f414:      	b.eq	0xf448 <_stogir.vector-arithmetic.operation?+0x64>
    f418:      	cmp	x0, #0x39
    f41c:      	b.eq	0xf448 <_stogir.vector-arithmetic.operation?+0x64>
    f420:      	cmp	x0, #0x3a
    f424:      	b.eq	0xf450 <_stogir.vector-arithmetic.operation?+0x6c>
    f428:      	cmp	x0, #0x3b
    f42c:      	b.eq	0xf450 <_stogir.vector-arithmetic.operation?+0x6c>
    f430:      	cmp	x0, #0x31
    f434:      	b.lt	0xf468 <_stogir.vector-arithmetic.operation?+0x84>
    f438:      	cmp	x0, #0x35
    f43c:      	b.gt	0xf468 <_stogir.vector-arithmetic.operation?+0x84>
    f440:      	mov	x0, #0x1                ; =1
    f444:      	b	0xf464 <_stogir.vector-arithmetic.operation?+0x80>
    f448:      	mov	x0, #0x1                ; =1
    f44c:      	ret
    f450:      	mov	x0, #0x1                ; =1
    f454:      	b	0xf44c <_stogir.vector-arithmetic.operation?+0x68>
    f458:      	cmp	x0, #0x30
    f45c:      	cset	w0, eq
    f460:      	ubfx	x0, x0, #0, #8
    f464:      	b	0xf454 <_stogir.vector-arithmetic.operation?+0x70>
    f468:      	cmp	x0, #0x1a
    f46c:      	b.ne	0xf478 <_stogir.vector-arithmetic.operation?+0x94>
    f470:      	mov	x0, #0x1                ; =1
    f474:      	b	0xf464 <_stogir.vector-arithmetic.operation?+0x80>
    f478:      	cmp	x0, #0x1b
    f47c:      	b.ne	0xf488 <_stogir.vector-arithmetic.operation?+0xa4>
    f480:      	mov	x0, #0x1                ; =1
    f484:      	b	0xf464 <_stogir.vector-arithmetic.operation?+0x80>
    f488:      	cmp	x0, #0x1c
    f48c:      	b.ne	0xf498 <_stogir.vector-arithmetic.operation?+0xb4>
    f490:      	mov	x0, #0x1                ; =1
    f494:      	b	0xf464 <_stogir.vector-arithmetic.operation?+0x80>
    f498:      	cmp	x0, #0x1d
    f49c:      	b.ne	0xf4a8 <_stogir.vector-arithmetic.operation?+0xc4>
    f4a0:      	mov	x0, #0x1                ; =1
    f4a4:      	b	0xf464 <_stogir.vector-arithmetic.operation?+0x80>
    f4a8:      	cmp	x0, #0x1e
    f4ac:      	b.ne	0xf4b8 <_stogir.vector-arithmetic.operation?+0xd4>
    f4b0:      	mov	x0, #0x1                ; =1
    f4b4:      	b	0xf464 <_stogir.vector-arithmetic.operation?+0x80>
    f4b8:      	cmp	x0, #0x2e
    f4bc:      	b.ne	0xf4c8 <_stogir.vector-arithmetic.operation?+0xe4>
    f4c0:      	mov	x0, #0x1                ; =1
    f4c4:      	b	0xf464 <_stogir.vector-arithmetic.operation?+0x80>
    f4c8:      	cmp	x0, #0x2f
    f4cc:      	b.ne	0xf458 <_stogir.vector-arithmetic.operation?+0x74>
    f4d0:      	mov	x0, #0x1                ; =1
    f4d4:      	b	0xf464 <_stogir.vector-arithmetic.operation?+0x80>

000000000000f4d8 <_stogir.vector-arithmetic.unary?>:
    f4d8:      	sxtw	x0, w0
    f4dc:      	cmp	x0, #0x1f
    f4e0:      	b.ne	0xf4fc <_stogir.vector-arithmetic.unary?+0x24>
    f4e4:      	mov	x0, #0x1                ; =1
    f4e8:      	b	0xf4f8 <_stogir.vector-arithmetic.unary?+0x20>
    f4ec:      	cmp	x0, #0x39
    f4f0:      	cset	w0, eq
    f4f4:      	ubfx	x0, x0, #0, #8
    f4f8:      	ret
    f4fc:      	cmp	x0, #0x20
    f500:      	b.ne	0xf50c <_stogir.vector-arithmetic.unary?+0x34>
    f504:      	mov	x0, #0x1                ; =1
    f508:      	b	0xf4f8 <_stogir.vector-arithmetic.unary?+0x20>
    f50c:      	cmp	x0, #0x2d
    f510:      	b.ne	0xf51c <_stogir.vector-arithmetic.unary?+0x44>
    f514:      	mov	x0, #0x1                ; =1
    f518:      	b	0xf4f8 <_stogir.vector-arithmetic.unary?+0x20>
    f51c:      	cmp	x0, #0x36
    f520:      	b.ne	0xf52c <_stogir.vector-arithmetic.unary?+0x54>
    f524:      	mov	x0, #0x1                ; =1
    f528:      	b	0xf4f8 <_stogir.vector-arithmetic.unary?+0x20>
    f52c:      	cmp	x0, #0x37
    f530:      	b.ne	0xf53c <_stogir.vector-arithmetic.unary?+0x64>
    f534:      	mov	x0, #0x1                ; =1
    f538:      	b	0xf4f8 <_stogir.vector-arithmetic.unary?+0x20>
    f53c:      	cmp	x0, #0x38
    f540:      	b.ne	0xf4ec <_stogir.vector-arithmetic.unary?+0x14>
    f544:      	mov	x0, #0x1                ; =1
    f548:      	b	0xf4f8 <_stogir.vector-arithmetic.unary?+0x20>

000000000000f54c <_stogir.vector-arithmetic.operands>:
    f54c:      	sub	sp, sp, #0xe0
    f550:      	str	x29, [sp]
    f554:      	str	x30, [sp, #0x8]
    f558:      	mov	x29, sp
    f55c:      	str	x19, [sp, #0x88]
    f560:      	str	x20, [sp, #0x90]
    f564:      	str	x21, [sp, #0x98]
    f568:      	str	x22, [sp, #0xa0]
    f56c:      	str	x23, [sp, #0xa8]
    f570:      	str	x24, [sp, #0xb0]
    f574:      	str	x25, [sp, #0xb8]
    f578:      	str	x26, [sp, #0xc0]
    f57c:      	str	x27, [sp, #0xc8]
    f580:      	str	x28, [sp, #0xd0]
    f584:      	adrp	x16, 0xf000 <_stogir.vector-comparison.operands+0x224>
		000000000000f584:  ARM64_RELOC_PAGE21	l_stogir.489
    f588:      	ldr	x16, [x16]
		000000000000f588:  ARM64_RELOC_PAGEOFF12	l_stogir.489
    f58c:      	orr	x19, x16, xzr
    f590:      	sub	sp, sp, #0x10
    f594:      	mov	x20, sp
    f598:      	lsr	w1, w1, #0
    f59c:      	lsr	w2, w2, #0
    f5a0:      	sub	sp, sp, #0x10
    f5a4:      	mov	x21, sp
    f5a8:      	mov	x22, x8
    f5ac:      	mov	x23, x0
    f5b0:      	mov	w0, w1
    f5b4:      	mov	w24, w1
    f5b8:      	mov	w1, w2
    f5bc:      	mov	w25, w2
    f5c0:      	mov	w26, w3
    f5c4:      	mov	w27, w4
    f5c8:      	mov	w28, w5
    f5cc:      	bl	0xf5cc <_stogir.vector-arithmetic.operands+0x80>
		000000000000f5cc:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.valid-type?
    f5d0:      	cmp	x0, #0x0
    f5d4:      	b.eq	0xf5e4 <_stogir.vector-arithmetic.operands+0x98>
    f5d8:      	mov	x0, x19
    f5dc:      	movz	x1, #0x0, lsl #48
    f5e0:      	b	0xf5f4 <_stogir.vector-arithmetic.operands+0xa8>
    f5e4:      	adrp	x16, 0xf000 <_stogir.vector-comparison.operands+0x224>
		000000000000f5e4:  ARM64_RELOC_PAGE21	l_stogir.490
    f5e8:      	ldr	x16, [x16]
		000000000000f5e8:  ARM64_RELOC_PAGEOFF12	l_stogir.490
    f5ec:      	orr	x0, x16, xzr
    f5f0:      	mov	x1, #0x37               ; =55
    f5f4:      	sxtw	x24, w24
    f5f8:      	sxtw	x25, w25
    f5fc:      	sxtw	x26, w26
    f600:      	sxtw	x27, w27
    f604:      	adrp	x16, 0xf000 <_stogir.vector-comparison.operands+0x224>
		000000000000f604:  ARM64_RELOC_PAGE21	l_stogir.491
    f608:      	ldr	x16, [x16]
		000000000000f608:  ARM64_RELOC_PAGEOFF12	l_stogir.491
    f60c:      	orr	x2, x16, xzr
    f610:      	adrp	x16, 0xf000 <_stogir.vector-comparison.operands+0x224>
		000000000000f610:  ARM64_RELOC_PAGE21	l_stogir.492
    f614:      	ldr	x16, [x16]
		000000000000f614:  ARM64_RELOC_PAGEOFF12	l_stogir.492
    f618:      	orr	x3, x16, xzr
    f61c:      	add	x4, x23, #0x78
    f620:      	add	x5, x23, #0x28
    f624:      	add	x6, x23, #0x50
    f628:      	cmp	x24, #0x1f
    f62c:      	cset	w7, eq
    f630:      	cmp	x24, #0x20
    f634:      	cset	w8, eq
    f638:      	cmp	x24, #0x2d
    f63c:      	cset	w9, eq
    f640:      	cmp	x24, #0x36
    f644:      	cset	w10, eq
    f648:      	cmp	x24, #0x37
    f64c:      	cset	w11, eq
    f650:      	cmp	x24, #0x38
    f654:      	cset	w12, eq
    f658:      	cmp	x24, #0x39
    f65c:      	cset	w13, eq
    f660:      	cmp	x24, #0x31
    f664:      	cset	w14, ge
    f668:      	cmp	x24, #0x35
    f66c:      	cset	w15, le
    f670:      	ubfx	x13, x13, #0, #8
    f674:      	str	x1, [x29, #0x10]
    f678:      	mov	x1, x0
    f67c:      	movz	x0, #0x0, lsl #48
    f680:      	b	0xf788 <_stogir.vector-arithmetic.operands+0x23c>
    f684:      	movz	x3, #0x0, lsl #48
    f688:      	b	0xf698 <_stogir.vector-arithmetic.operands+0x14c>
    f68c:      	movz	x3, #0x0, lsl #48
    f690:      	b	0xf6a0 <_stogir.vector-arithmetic.operands+0x154>
    f694:      	movz	x3, #0x0, lsl #48
    f698:      	b	0xf6ac <_stogir.vector-arithmetic.operands+0x160>
    f69c:      	movz	x3, #0x0, lsl #48
    f6a0:      	str	x5, [x29, #0x80]
    f6a4:      	b	0xf6ac <_stogir.vector-arithmetic.operands+0x160>
    f6a8:      	movz	x3, #0x0, lsl #48
    f6ac:      	cmp	x3, #0x0
    f6b0:      	b.eq	0xf714 <_stogir.vector-arithmetic.operands+0x1c8>
    f6b4:      	uxtb	w16, w2
    f6b8:      	cmp	w16, wzr
    f6bc:      	b.eq	0xf6e4 <_stogir.vector-arithmetic.operands+0x198>
    f6c0:      	lsl	x1, x1, #4
    f6c4:      	ldr	x2, [x23]
    f6c8:      	add	x1, x1, x2
    f6cc:      	ldr	x2, [x1]
    f6d0:      	ldr	x1, [x1, #0x8]
    f6d4:      	fmov	d31, x1
    f6d8:      	mov	x1, x2
    f6dc:      	fmov	x2, d31
    f6e0:      	b	0xf704 <_stogir.vector-arithmetic.operands+0x1b8>
    f6e4:      	lsl	x1, x7, #4
    f6e8:      	ldr	x2, [x23, #0x28]
    f6ec:      	add	x1, x1, x2
    f6f0:      	ldr	x2, [x1]
    f6f4:      	ldr	x1, [x1, #0x8]
    f6f8:      	fmov	d31, x1
    f6fc:      	mov	x1, x2
    f700:      	fmov	x2, d31
    f704:      	mov	x3, x2
    f708:      	mov	x2, x1
    f70c:      	mov	x1, #0x1                ; =1
    f710:      	b	0xf720 <_stogir.vector-arithmetic.operands+0x1d4>
    f714:      	movz	x1, #0x0, lsl #48
    f718:      	movz	x2, #0x0, lsl #48
    f71c:      	movz	x3, #0x0, lsl #48
    f720:      	lsr	w1, w1, #0
    f724:      	lsr	x16, x1, #0
    f728:      	cmp	x16, #0x1
    f72c:      	b.eq	0xf748 <_stogir.vector-arithmetic.operands+0x1fc>
    f730:      	b.lo	0xf738 <_stogir.vector-arithmetic.operands+0x1ec>
    f734:      	b	0xf74c <_stogir.vector-arithmetic.operands+0x200>
    f738:      	cmp	x16, #0x0
    f73c:      	b.eq	0xf744 <_stogir.vector-arithmetic.operands+0x1f8>
    f740:      	b	0xf74c <_stogir.vector-arithmetic.operands+0x200>
    f744:      	b	0xf750 <_stogir.vector-arithmetic.operands+0x204>
    f748:      	b	0xf900 <_stogir.vector-arithmetic.operands+0x3b4>
    f74c:      	b	0xfbac <_stogir.vector-arithmetic.operands+0x660>
    f750:      	ldr	x1, [x29, #0x60]
    f754:      	mov	x2, #0x21               ; =33
    f758:      	b	0xf764 <_stogir.vector-arithmetic.operands+0x218>
    f75c:      	ldr	x1, [x29, #0x68]
    f760:      	mov	x2, #0x32               ; =50
    f764:      	add	x0, x0, #0x1
    f768:      	lsr	w0, w0, #0
    f76c:      	sxtw	x0, w0
    f770:      	ldr	x3, [x29, #0x68]
    f774:      	ldr	w7, [x29, #0x70]
    f778:      	ldr	x4, [x29, #0x78]
    f77c:      	ldr	x5, [x29, #0x80]
    f780:      	str	x2, [x29, #0x10]
    f784:      	ldr	x2, [x29, #0x60]
    f788:      	uxtb	w16, w7
    f78c:      	cmp	w16, wzr
    f790:      	b.eq	0xf828 <_stogir.vector-arithmetic.operands+0x2dc>
    f794:      	str	x1, [x29, #0x40]
    f798:      	ldr	x17, [x29, #0x10]
    f79c:      	str	x17, [x29, #0x48]
    f7a0:      	mov	x1, #0x1                ; =1
    f7a4:      	b	0xf7dc <_stogir.vector-arithmetic.operands+0x290>
    f7a8:      	str	x13, [x29, #0x18]
    f7ac:      	ldr	x17, [x29, #0x18]
    f7b0:      	str	x17, [x29, #0x20]
    f7b4:      	ldr	x17, [x29, #0x20]
    f7b8:      	str	x17, [x29, #0x28]
    f7bc:      	ldr	x17, [x29, #0x28]
    f7c0:      	str	x17, [x29, #0x30]
    f7c4:      	ldr	x17, [x29, #0x30]
    f7c8:      	str	x17, [x29, #0x38]
    f7cc:      	str	x1, [x29, #0x40]
    f7d0:      	ldr	x1, [x29, #0x38]
    f7d4:      	ldr	x17, [x29, #0x10]
    f7d8:      	str	x17, [x29, #0x48]
    f7dc:      	cmp	x1, #0x0
    f7e0:      	b.eq	0xf7fc <_stogir.vector-arithmetic.operands+0x2b0>
    f7e4:      	ldr	x17, [x29, #0x40]
    f7e8:      	str	x17, [x29, #0x50]
    f7ec:      	ldr	x17, [x29, #0x48]
    f7f0:      	str	x17, [x29, #0x58]
    f7f4:      	mov	x1, #0x1                ; =1
    f7f8:      	b	0xf810 <_stogir.vector-arithmetic.operands+0x2c4>
    f7fc:      	ldr	x17, [x29, #0x40]
    f800:      	str	x17, [x29, #0x50]
    f804:      	ldr	x17, [x29, #0x48]
    f808:      	str	x17, [x29, #0x58]
    f80c:      	mov	x1, #0x2                ; =2
    f810:      	cmp	x0, x1
    f814:      	b.ge	0xf9a4 <_stogir.vector-arithmetic.operands+0x458>
    f818:      	cmp	x0, #0x0
    f81c:      	b.ne	0xf840 <_stogir.vector-arithmetic.operands+0x2f4>
    f820:      	mov	x1, x26
    f824:      	b	0xf844 <_stogir.vector-arithmetic.operands+0x2f8>
    f828:      	uxtb	w16, w8
    f82c:      	cmp	w16, wzr
    f830:      	b.eq	0xf974 <_stogir.vector-arithmetic.operands+0x428>
    f834:      	mov	x16, #0x1               ; =1
    f838:      	str	x16, [x29, #0x38]
    f83c:      	b	0xf7cc <_stogir.vector-arithmetic.operands+0x280>
    f840:      	mov	x1, x27
    f844:      	lsr	w1, w1, #0
    f848:      	sxtw	x1, w1
    f84c:      	str	x2, [x29, #0x60]
    f850:      	cmp	x1, #0x0
    f854:      	cset	w2, gt
    f858:      	str	x3, [x29, #0x68]
    f85c:      	movz	x16, #0x0, lsl #48
    f860:      	sub	x3, x16, x1
    f864:      	str	w7, [x29, #0x70]
    f868:      	sub	x7, x3, #0x1
    f86c:      	uxtb	w16, w2
    f870:      	cmp	w16, wzr
    f874:      	b.eq	0xfd84 <_stogir.vector-arithmetic.operands+0x838>
    f878:      	ldr	x3, [x23, #0x8]
    f87c:      	cmp	x1, x3
    f880:      	b.ge	0xfd8c <_stogir.vector-arithmetic.operands+0x840>
    f884:      	ldr	x3, [x4, #0x8]
    f888:      	cmp	x1, x3
    f88c:      	b.ge	0xfd94 <_stogir.vector-arithmetic.operands+0x848>
    f890:      	lsl	x3, x1, #2
    f894:      	str	x4, [x29, #0x78]
    f898:      	ldr	x4, [x23, #0x78]
    f89c:      	add	x3, x3, x4
    f8a0:      	ldr	w3, [x3]
    f8a4:      	sxtw	x3, w3
    f8a8:      	cmp	x3, #0x0
    f8ac:      	cset	w3, ge
    f8b0:      	ubfx	x3, x3, #0, #8
    f8b4:      	b	0xf690 <_stogir.vector-arithmetic.operands+0x144>
    f8b8:      	cmp	x1, #0x0
    f8bc:      	b.ge	0xfd9c <_stogir.vector-arithmetic.operands+0x850>
    f8c0:      	ldr	x4, [x5, #0x8]
    f8c4:      	str	x5, [x29, #0x80]
    f8c8:      	ldr	x5, [x6, #0x8]
    f8cc:      	cmp	x4, x5
    f8d0:      	b.ne	0xf694 <_stogir.vector-arithmetic.operands+0x148>
    f8d4:      	cmp	x3, x4
    f8d8:      	b.gt	0xf684 <_stogir.vector-arithmetic.operands+0x138>
    f8dc:      	lsl	x3, x7, #2
    f8e0:      	ldr	x4, [x23, #0x50]
    f8e4:      	add	x3, x3, x4
    f8e8:      	ldr	w3, [x3]
    f8ec:      	sxtw	x3, w3
    f8f0:      	cmp	x3, #0x0
    f8f4:      	cset	w3, gt
    f8f8:      	ubfx	x3, x3, #0, #8
    f8fc:      	b	0xf688 <_stogir.vector-arithmetic.operands+0x13c>
    f900:      	lsr	w1, w2, #0
    f904:      	str	x2, [x20]
    f908:      	str	x3, [x20, #0x8]
    f90c:      	ubfx	x1, x1, #8, #8
    f910:      	cmp	x1, x25
    f914:      	b.eq	0xf950 <_stogir.vector-arithmetic.operands+0x404>
    f918:      	cmp	x0, #0x1
    f91c:      	b.ne	0xf75c <_stogir.vector-arithmetic.operands+0x210>
    f920:      	uxtb	w16, w14
    f924:      	cmp	w16, wzr
    f928:      	b.eq	0xf75c <_stogir.vector-arithmetic.operands+0x210>
    f92c:      	uxtb	w16, w15
    f930:      	cmp	w16, wzr
    f934:      	b.eq	0xf75c <_stogir.vector-arithmetic.operands+0x210>
    f938:      	ldr	w1, [x20]
    f93c:      	ubfx	x1, x1, #8, #8
    f940:      	cmp	x1, #0x1
    f944:      	b.lt	0xf75c <_stogir.vector-arithmetic.operands+0x210>
    f948:      	cmp	x1, #0xb
    f94c:      	b.gt	0xf75c <_stogir.vector-arithmetic.operands+0x210>
    f950:      	ldr	w1, [x20]
    f954:      	uxtb	w1, w1
    f958:      	cmp	x1, #0x48
    f95c:      	b.eq	0xf75c <_stogir.vector-arithmetic.operands+0x210>
    f960:      	cmp	x1, #0x46
    f964:      	b.eq	0xf75c <_stogir.vector-arithmetic.operands+0x210>
    f968:      	ldr	x1, [x29, #0x50]
    f96c:      	ldr	x2, [x29, #0x58]
    f970:      	b	0xf764 <_stogir.vector-arithmetic.operands+0x218>
    f974:      	uxtb	w16, w9
    f978:      	cmp	w16, wzr
    f97c:      	b.eq	0xf98c <_stogir.vector-arithmetic.operands+0x440>
    f980:      	mov	x16, #0x1               ; =1
    f984:      	str	x16, [x29, #0x30]
    f988:      	b	0xf7c4 <_stogir.vector-arithmetic.operands+0x278>
    f98c:      	uxtb	w16, w10
    f990:      	cmp	w16, wzr
    f994:      	b.eq	0xf9c0 <_stogir.vector-arithmetic.operands+0x474>
    f998:      	mov	x16, #0x1               ; =1
    f99c:      	str	x16, [x29, #0x28]
    f9a0:      	b	0xf7bc <_stogir.vector-arithmetic.operands+0x270>
    f9a4:      	sxtw	x28, w28
    f9a8:      	cmp	x28, #0x0
    f9ac:      	b.ne	0xf9d8 <_stogir.vector-arithmetic.operands+0x48c>
    f9b0:      	ldr	x1, [x29, #0x50]
    f9b4:      	ldr	x2, [x29, #0x58]
    f9b8:      	movz	x0, #0x0, lsl #48
    f9bc:      	b	0xf9e4 <_stogir.vector-arithmetic.operands+0x498>
    f9c0:      	uxtb	w16, w11
    f9c4:      	cmp	w16, wzr
    f9c8:      	b.eq	0xfab0 <_stogir.vector-arithmetic.operands+0x564>
    f9cc:      	mov	x16, #0x1               ; =1
    f9d0:      	str	x16, [x29, #0x20]
    f9d4:      	b	0xf7b4 <_stogir.vector-arithmetic.operands+0x268>
    f9d8:      	ldr	x1, [x29, #0x50]
    f9dc:      	ldr	x2, [x29, #0x58]
    f9e0:      	mov	x0, #0x1                ; =1
    f9e4:      	cmp	x0, #0x0
    f9e8:      	b.eq	0xf9fc <_stogir.vector-arithmetic.operands+0x4b0>
    f9ec:      	cmp	x24, #0x1d
    f9f0:      	b.ne	0xfb38 <_stogir.vector-arithmetic.operands+0x5ec>
    f9f4:      	mov	x0, #0x1                ; =1
    f9f8:      	b	0xfb44 <_stogir.vector-arithmetic.operands+0x5f8>
    f9fc:      	mov	x20, x1
    fa00:      	mov	x21, x2
    fa04:      	mov	x0, x20
    fa08:      	mov	x1, x21
    fa0c:      	mov	x2, x19
    fa10:      	movz	x3, #0x0, lsl #48
    fa14:      	bl	0xfa14 <_stogir.vector-arithmetic.operands+0x4c8>
		000000000000fa14:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
    fa18:      	cmp	x0, #0x0
    fa1c:      	b.eq	0xfa34 <_stogir.vector-arithmetic.operands+0x4e8>
    fa20:      	and	x0, x25, #0xffffffff
    fa24:      	mov	x1, x0
    fa28:      	movz	x0, #0x0, lsl #48
    fa2c:      	movz	x2, #0x0, lsl #48
    fa30:      	b	0xfa40 <_stogir.vector-arithmetic.operands+0x4f4>
    fa34:      	mov	x1, x20
    fa38:      	mov	x2, x21
    fa3c:      	mov	x0, #0x1                ; =1
    fa40:      	str	x0, [x22]
    fa44:      	str	x1, [x22, #0x8]
    fa48:      	str	x2, [x22, #0x10]
    fa4c:      	sub	sp, x29, #0x0
    fa50:      	ldr	x19, [sp, #0x88]
    fa54:      	ldr	x20, [sp, #0x90]
    fa58:      	ldr	x21, [sp, #0x98]
    fa5c:      	ldr	x22, [sp, #0xa0]
    fa60:      	ldr	x23, [sp, #0xa8]
    fa64:      	ldr	x24, [sp, #0xb0]
    fa68:      	ldr	x25, [sp, #0xb8]
    fa6c:      	ldr	x26, [sp, #0xc0]
    fa70:      	ldr	x27, [sp, #0xc8]
    fa74:      	ldr	x28, [sp, #0xd0]
    fa78:      	ldr	x29, [sp]
    fa7c:      	ldr	x30, [sp, #0x8]
    fa80:      	add	sp, sp, #0xe0
    fa84:      	ret
    fa88:      	mov	x0, #0x1                ; =1
    fa8c:      	cmp	x0, #0x0
    fa90:      	b.eq	0xfac8 <_stogir.vector-arithmetic.operands+0x57c>
    fa94:      	adrp	x16, 0xf000 <_stogir.vector-comparison.operands+0x224>
		000000000000fa94:  ARM64_RELOC_PAGE21	l_stogir.493
    fa98:      	ldr	x16, [x16]
		000000000000fa98:  ARM64_RELOC_PAGEOFF12	l_stogir.493
    fa9c:      	orr	x0, x16, xzr
    faa0:      	mov	x1, #0x23               ; =35
    faa4:      	mov	x20, x0
    faa8:      	mov	x21, x1
    faac:      	b	0xfa04 <_stogir.vector-arithmetic.operands+0x4b8>
    fab0:      	uxtb	w16, w12
    fab4:      	cmp	w16, wzr
    fab8:      	b.eq	0xf7a8 <_stogir.vector-arithmetic.operands+0x25c>
    fabc:      	mov	x16, #0x1               ; =1
    fac0:      	str	x16, [x29, #0x18]
    fac4:      	b	0xf7ac <_stogir.vector-arithmetic.operands+0x260>
    fac8:      	cmp	x28, #0x0
    facc:      	cset	w0, gt
    fad0:      	movz	x16, #0x0, lsl #48
    fad4:      	sub	x3, x16, x28
    fad8:      	sub	x4, x3, #0x1
    fadc:      	uxtb	w16, w0
    fae0:      	cmp	w16, wzr
    fae4:      	b.eq	0xfb60 <_stogir.vector-arithmetic.operands+0x614>
    fae8:      	ldr	x3, [x23, #0x8]
    faec:      	cmp	x28, x3
    faf0:      	b.ge	0xfbb4 <_stogir.vector-arithmetic.operands+0x668>
    faf4:      	add	x3, x23, #0x78
    faf8:      	ldr	x3, [x3, #0x8]
    fafc:      	cmp	x28, x3
    fb00:      	b.ge	0xfcc8 <_stogir.vector-arithmetic.operands+0x77c>
    fb04:      	lsl	x3, x28, #2
    fb08:      	ldr	x5, [x23, #0x78]
    fb0c:      	add	x3, x3, x5
    fb10:      	ldr	w3, [x3]
    fb14:      	sxtw	x3, w3
    fb18:      	cmp	x3, #0x0
    fb1c:      	cset	w3, ge
    fb20:      	ubfx	x3, x3, #0, #8
    fb24:      	fmov	d31, x1
    fb28:      	mov	x1, x3
    fb2c:      	mov	x3, x2
    fb30:      	fmov	x2, d31
    fb34:      	b	0xfcd4 <_stogir.vector-arithmetic.operands+0x788>
    fb38:      	cmp	x24, #0x1e
    fb3c:      	cset	w0, eq
    fb40:      	ubfx	x0, x0, #0, #8
    fb44:      	cmp	x0, #0x0
    fb48:      	b.eq	0xfa88 <_stogir.vector-arithmetic.operands+0x53c>
    fb4c:      	movz	x0, #0x0, lsl #48
    fb50:      	b	0xfa8c <_stogir.vector-arithmetic.operands+0x540>
    fb54:      	mov	x0, x1
    fb58:      	mov	x1, x2
    fb5c:      	b	0xfaa4 <_stogir.vector-arithmetic.operands+0x558>
    fb60:      	cmp	x28, #0x0
    fb64:      	b.ge	0xfbc4 <_stogir.vector-arithmetic.operands+0x678>
    fb68:      	add	x5, x23, #0x28
    fb6c:      	add	x6, x23, #0x50
    fb70:      	ldr	x5, [x5, #0x8]
    fb74:      	ldr	x6, [x6, #0x8]
    fb78:      	cmp	x5, x6
    fb7c:      	b.ne	0xfcc0 <_stogir.vector-arithmetic.operands+0x774>
    fb80:      	cmp	x3, x5
    fb84:      	b.gt	0xfd28 <_stogir.vector-arithmetic.operands+0x7dc>
    fb88:      	lsl	x3, x4, #2
    fb8c:      	ldr	x5, [x23, #0x50]
    fb90:      	add	x3, x3, x5
    fb94:      	ldr	w3, [x3]
    fb98:      	sxtw	x3, w3
    fb9c:      	cmp	x3, #0x0
    fba0:      	cset	w3, gt
    fba4:      	ubfx	x3, x3, #0, #8
    fba8:      	b	0xfd2c <_stogir.vector-arithmetic.operands+0x7e0>
    fbac:      	brk	#0
    fbb0:      	b	0xfbac <_stogir.vector-arithmetic.operands+0x660>
    fbb4:      	mov	x3, x2
    fbb8:      	mov	x2, x1
    fbbc:      	movz	x1, #0x0, lsl #48
    fbc0:      	b	0xfbd8 <_stogir.vector-arithmetic.operands+0x68c>
    fbc4:      	movz	x3, #0x0, lsl #48
    fbc8:      	fmov	d31, x1
    fbcc:      	mov	x1, x3
    fbd0:      	mov	x3, x2
    fbd4:      	fmov	x2, d31
    fbd8:      	cmp	x1, #0x0
    fbdc:      	b.eq	0xfc48 <_stogir.vector-arithmetic.operands+0x6fc>
    fbe0:      	uxtb	w16, w0
    fbe4:      	cmp	w16, wzr
    fbe8:      	b.eq	0xfc10 <_stogir.vector-arithmetic.operands+0x6c4>
    fbec:      	lsl	x0, x28, #4
    fbf0:      	ldr	x1, [x23]
    fbf4:      	add	x0, x0, x1
    fbf8:      	ldr	x1, [x0]
    fbfc:      	ldr	x0, [x0, #0x8]
    fc00:      	fmov	d31, x0
    fc04:      	mov	x0, x1
    fc08:      	fmov	x1, d31
    fc0c:      	b	0xfc30 <_stogir.vector-arithmetic.operands+0x6e4>
    fc10:      	lsl	x0, x4, #4
    fc14:      	ldr	x1, [x23, #0x28]
    fc18:      	add	x0, x0, x1
    fc1c:      	ldr	x1, [x0]
    fc20:      	ldr	x0, [x0, #0x8]
    fc24:      	fmov	d31, x0
    fc28:      	mov	x0, x1
    fc2c:      	fmov	x1, d31
    fc30:      	mov	x4, x3
    fc34:      	mov	x3, x2
    fc38:      	mov	x2, x1
    fc3c:      	mov	x1, x0
    fc40:      	mov	x0, #0x1                ; =1
    fc44:      	b	0xfc5c <_stogir.vector-arithmetic.operands+0x710>
    fc48:      	mov	x4, x3
    fc4c:      	mov	x3, x2
    fc50:      	movz	x0, #0x0, lsl #48
    fc54:      	movz	x1, #0x0, lsl #48
    fc58:      	movz	x2, #0x0, lsl #48
    fc5c:      	lsr	w0, w0, #0
    fc60:      	lsr	x16, x0, #0
    fc64:      	cmp	x16, #0x1
    fc68:      	b.eq	0xfc84 <_stogir.vector-arithmetic.operands+0x738>
    fc6c:      	b.lo	0xfc74 <_stogir.vector-arithmetic.operands+0x728>
    fc70:      	b	0xfc88 <_stogir.vector-arithmetic.operands+0x73c>
    fc74:      	cmp	x16, #0x0
    fc78:      	b.eq	0xfc80 <_stogir.vector-arithmetic.operands+0x734>
    fc7c:      	b	0xfc88 <_stogir.vector-arithmetic.operands+0x73c>
    fc80:      	b	0xfc8c <_stogir.vector-arithmetic.operands+0x740>
    fc84:      	b	0xfca0 <_stogir.vector-arithmetic.operands+0x754>
    fc88:      	b	0xfd7c <_stogir.vector-arithmetic.operands+0x830>
    fc8c:      	adrp	x16, 0xf000 <_stogir.vector-comparison.operands+0x224>
		000000000000fc8c:  ARM64_RELOC_PAGE21	l_stogir.494
    fc90:      	ldr	x16, [x16]
		000000000000fc90:  ARM64_RELOC_PAGEOFF12	l_stogir.494
    fc94:      	orr	x0, x16, xzr
    fc98:      	mov	x1, #0x1d               ; =29
    fc9c:      	b	0xfb5c <_stogir.vector-arithmetic.operands+0x610>
    fca0:      	str	x1, [x21]
    fca4:      	str	x2, [x21, #0x8]
    fca8:      	cmp	x28, #0x0
    fcac:      	b.gt	0xfd00 <_stogir.vector-arithmetic.operands+0x7b4>
    fcb0:      	mov	x1, x3
    fcb4:      	mov	x2, x4
    fcb8:      	mov	x0, #0x1                ; =1
    fcbc:      	b	0xfce4 <_stogir.vector-arithmetic.operands+0x798>
    fcc0:      	movz	x3, #0x0, lsl #48
    fcc4:      	b	0xfbc8 <_stogir.vector-arithmetic.operands+0x67c>
    fcc8:      	mov	x3, x2
    fccc:      	mov	x2, x1
    fcd0:      	movz	x1, #0x0, lsl #48
    fcd4:      	b	0xfbc0 <_stogir.vector-arithmetic.operands+0x674>
    fcd8:      	movz	x0, #0x0, lsl #48
    fcdc:      	mov	x1, x3
    fce0:      	mov	x2, x4
    fce4:      	cmp	x0, #0x0
    fce8:      	b.eq	0xfb54 <_stogir.vector-arithmetic.operands+0x608>
    fcec:      	adrp	x16, 0xf000 <_stogir.vector-comparison.operands+0x224>
		000000000000fcec:  ARM64_RELOC_PAGE21	l_stogir.495
    fcf0:      	ldr	x16, [x16]
		000000000000fcf0:  ARM64_RELOC_PAGEOFF12	l_stogir.495
    fcf4:      	orr	x0, x16, xzr
    fcf8:      	mov	x1, #0x34               ; =52
    fcfc:      	b	0xfb5c <_stogir.vector-arithmetic.operands+0x610>
    fd00:      	ldr	w0, [x21]
    fd04:      	uxtb	w0, w0
    fd08:      	cmp	x0, #0x83
    fd0c:      	b.ge	0xfd30 <_stogir.vector-arithmetic.operands+0x7e4>
    fd10:      	adrp	x16, 0xf000 <_stogir.vector-comparison.operands+0x224>
		000000000000fd10:  ARM64_RELOC_PAGE21	l_stogir.496
    fd14:      	ldr	x16, [x16]
		000000000000fd14:  ARM64_RELOC_PAGEOFF12	l_stogir.496
    fd18:      	orr	x1, x16, xzr
    fd1c:      	add	x0, x0, x1
    fd20:      	ldrb	w0, [x0]
    fd24:      	b	0xfd34 <_stogir.vector-arithmetic.operands+0x7e8>
    fd28:      	movz	x3, #0x0, lsl #48
    fd2c:      	b	0xfcc4 <_stogir.vector-arithmetic.operands+0x778>
    fd30:      	movz	x0, #0x0, lsl #48
    fd34:      	uxtb	w0, w0
    fd38:      	and	x0, x0, #0x2
    fd3c:      	uxtb	w0, w0
    fd40:      	cmp	x0, #0x0
    fd44:      	cset	w0, eq
    fd48:      	uxtb	w16, w0
    fd4c:      	cmp	w16, wzr
    fd50:      	cset	x0, eq
    fd54:      	cmp	x0, #0x0
    fd58:      	b.ne	0xfcd8 <_stogir.vector-arithmetic.operands+0x78c>
    fd5c:      	ldr	w0, [x21]
    fd60:      	uxtb	w0, w0
    fd64:      	cmp	x0, #0x65
    fd68:      	b.eq	0xfcd8 <_stogir.vector-arithmetic.operands+0x78c>
    fd6c:      	cmp	x0, #0x66
    fd70:      	b.eq	0xfcd8 <_stogir.vector-arithmetic.operands+0x78c>
    fd74:      	mov	x0, #0x1                ; =1
    fd78:      	b	0xfcdc <_stogir.vector-arithmetic.operands+0x790>
    fd7c:      	brk	#0
    fd80:      	b	0xfd7c <_stogir.vector-arithmetic.operands+0x830>
    fd84:      	str	x4, [x29, #0x78]
    fd88:      	b	0xf8b8 <_stogir.vector-arithmetic.operands+0x36c>
    fd8c:      	str	x4, [x29, #0x78]
    fd90:      	b	0xf69c <_stogir.vector-arithmetic.operands+0x150>
    fd94:      	str	x4, [x29, #0x78]
    fd98:      	b	0xf68c <_stogir.vector-arithmetic.operands+0x140>
    fd9c:      	str	x5, [x29, #0x80]
    fda0:      	b	0xf6a8 <_stogir.vector-arithmetic.operands+0x15c>

000000000000fda4 <_stogir.types.base-type>:
    fda4:      	sub	sp, sp, #0x20
    fda8:      	str	x29, [sp]
    fdac:      	str	x30, [sp, #0x8]
    fdb0:      	mov	x29, sp
    fdb4:      	str	x19, [sp, #0x10]
    fdb8:      	lsr	w0, w0, #0
    fdbc:      	mov	w19, w0
    fdc0:      	bl	0xfdc0 <_stogir.types.base-type+0x1c>
		000000000000fdc0:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
    fdc4:      	cmp	x0, #0x0
    fdc8:      	b.eq	0xfde0 <_stogir.types.base-type+0x3c>
    fdcc:      	sxtw	x19, w19
    fdd0:      	and	x0, x19, #0xf
    fdd4:      	lsr	w0, w0, #0
    fdd8:      	sxtw	x0, w0
    fddc:      	b	0xfde4 <_stogir.types.base-type+0x40>
    fde0:      	movn	x0, #0x0, lsl #48
    fde4:      	ldr	x19, [sp, #0x10]
    fde8:      	ldr	x29, [sp]
    fdec:      	ldr	x30, [sp, #0x8]
    fdf0:      	add	sp, sp, #0x20
    fdf4:      	ret

000000000000fdf8 <_stogir.types.lanes>:
    fdf8:      	sxtw	x0, w0
    fdfc:      	cmp	x0, #0xf
    fe00:      	b.le	0xfe50 <_stogir.types.lanes+0x58>
    fe04:      	cmp	x0, #0x80
    fe08:      	b.ge	0xfe50 <_stogir.types.lanes+0x58>
    fe0c:      	and	x1, x0, #0xf
    fe10:      	lsr	w1, w1, #0
    fe14:      	sxtw	x1, w1
    fe18:      	cmp	x1, #0x1
    fe1c:      	b.lt	0xfe50 <_stogir.types.lanes+0x58>
    fe20:      	cmp	x1, #0xd
    fe24:      	b.gt	0xfe50 <_stogir.types.lanes+0x58>
    fe28:      	ubfx	x0, x0, #4, #32
    fe2c:      	sxtw	x0, w0
    fe30:      	sub	x0, x0, #0x1
    fe34:      	lsr	w0, w0, #0
    fe38:      	sxtw	x0, w0
    fe3c:      	mov	x16, #0x1               ; =1
    fe40:      	lsl	x0, x16, x0
    fe44:      	lsr	w0, w0, #0
    fe48:      	sxtw	x0, w0
    fe4c:      	b	0xfe7c <_stogir.types.lanes+0x84>
    fe50:      	cmp	x0, #0x0
    fe54:      	b.lt	0xfe78 <_stogir.types.lanes+0x80>
    fe58:      	cmp	x0, #0xd
    fe5c:      	b.gt	0xfe78 <_stogir.types.lanes+0x80>
    fe60:      	cmp	x0, #0x0
    fe64:      	cset	w0, eq
    fe68:      	uxtb	w16, w0
    fe6c:      	cmp	w16, wzr
    fe70:      	cset	x0, eq
    fe74:      	b	0xfe7c <_stogir.types.lanes+0x84>
    fe78:      	movn	x0, #0x0, lsl #48
    fe7c:      	ret

000000000000fe80 <_coil.core.Get$slice$get__u8>:
    fe80:      	lsr	x1, x2, #0
    fe84:      	add	x0, x1, x0
    fe88:      	ldrb	w0, [x0]
    fe8c:      	ret

000000000000fe90 <_stogir.checked.valid-type?>:
    fe90:      	sxtw	x0, w0
    fe94:      	cmp	x0, #0x1
    fe98:      	b.lt	0xfebc <_stogir.checked.valid-type?+0x2c>
    fe9c:      	cmp	x0, #0xb
    fea0:      	b.gt	0xfebc <_stogir.checked.valid-type?+0x2c>
    fea4:      	cmp	x0, #0x1
    fea8:      	cset	w0, eq
    feac:      	uxtb	w16, w0
    feb0:      	cmp	w16, wzr
    feb4:      	cset	x0, eq
    feb8:      	b	0xfec0 <_stogir.checked.valid-type?+0x30>
    febc:      	movz	x0, #0x0, lsl #48
    fec0:      	ret

000000000000fec4 <_coil.core.Iterable$slice$iter__i32>:
    fec4:      	str	x0, [x8]
    fec8:      	str	x1, [x8, #0x8]
    fecc:      	movz	x17, #0x0, lsl #48
    fed0:      	str	x17, [x8, #0x10]
    fed4:      	ret

000000000000fed8 <_coil.core.Iterator$coil.slice.SliceIter$next__i32>:
    fed8:      	sub	sp, sp, #0x10
    fedc:      	mov	x1, sp
    fee0:      	ldr	x2, [x0, #0x10]
    fee4:      	ldr	x3, [x0]
    fee8:      	ldr	x4, [x0, #0x8]
    feec:      	cmp	x2, x4
    fef0:      	b.ge	0xff1c <_coil.core.Iterator$coil.slice.SliceIter$next__i32+0x44>
    fef4:      	add	x4, x2, #0x1
    fef8:      	lsl	x2, x2, #2
    fefc:      	add	x2, x2, x3
    ff00:      	str	x4, [x0, #0x10]
    ff04:      	ldr	w0, [x2]
    ff08:      	sxtw	x0, w0
    ff0c:      	and	x0, x0, #0xffffffff
    ff10:      	mov	x2, x0
    ff14:      	mov	x0, #0x1                ; =1
    ff18:      	b	0xff24 <_coil.core.Iterator$coil.slice.SliceIter$next__i32+0x4c>
    ff1c:      	movz	x0, #0x0, lsl #48
    ff20:      	movz	x2, #0x0, lsl #48
    ff24:      	str	x0, [x1]
    ff28:      	str	x2, [x1, #0x8]
    ff2c:      	ldr	x0, [sp]
    ff30:      	ldr	x1, [sp, #0x8]
    ff34:      	add	sp, sp, #0x10
    ff38:      	ret

000000000000ff3c <_stogir.terminal.previous-input>:
    ff3c:      	sxtw	x1, w1
    ff40:      	cmp	x1, #0x0
    ff44:      	b.ne	0xff64 <_stogir.terminal.previous-input+0x28>
    ff48:      	movz	x0, #0x0, lsl #48
    ff4c:      	movz	x1, #0x0, lsl #48
    ff50:      	movz	x2, #0x0, lsl #48
    ff54:      	str	x0, [x8]
    ff58:      	str	x1, [x8, #0x8]
    ff5c:      	str	x2, [x8, #0x10]
    ff60:      	ret
    ff64:      	cmp	x1, #0x0
    ff68:      	cset	w2, gt
    ff6c:      	movz	x16, #0x0, lsl #48
    ff70:      	sub	x3, x16, x1
    ff74:      	sub	x4, x3, #0x1
    ff78:      	uxtb	w16, w2
    ff7c:      	cmp	w16, wzr
    ff80:      	b.eq	0xffe0 <_stogir.terminal.previous-input+0xa4>
    ff84:      	ldr	x3, [x0, #0x8]
    ff88:      	cmp	x1, x3
    ff8c:      	b.ge	0x1002c <_stogir.terminal.previous-input+0xf0>
    ff90:      	add	x3, x0, #0x78
    ff94:      	ldr	x3, [x3, #0x8]
    ff98:      	cmp	x1, x3
    ff9c:      	b.ge	0x10104 <_stogir.terminal.previous-input+0x1c8>
    ffa0:      	lsl	x3, x1, #2
    ffa4:      	ldr	x5, [x0, #0x78]
    ffa8:      	add	x3, x3, x5
    ffac:      	ldr	w3, [x3]
    ffb0:      	sxtw	x3, w3
    ffb4:      	cmp	x3, #0x0
    ffb8:      	cset	w3, ge
    ffbc:      	ubfx	x3, x3, #0, #8
    ffc0:      	b	0x10108 <_stogir.terminal.previous-input+0x1cc>
    ffc4:      	adrp	x16, 0xf000 <_stogir.vector-comparison.operands+0x224>
		000000000000ffc4:  ARM64_RELOC_PAGE21	l_stogir.497
    ffc8:      	ldr	x16, [x16]
		000000000000ffc8:  ARM64_RELOC_PAGEOFF12	l_stogir.497
    ffcc:      	orr	x0, x16, xzr
    ffd0:      	mov	x1, x0
    ffd4:      	mov	x0, #0x1                ; =1
    ffd8:      	mov	x2, #0x2e               ; =46
    ffdc:      	b	0xff54 <_stogir.terminal.previous-input+0x18>
    ffe0:      	cmp	x1, #0x0
    ffe4:      	b.ge	0x10034 <_stogir.terminal.previous-input+0xf8>
    ffe8:      	add	x5, x0, #0x28
    ffec:      	add	x6, x0, #0x50
    fff0:      	ldr	x5, [x5, #0x8]
    fff4:      	ldr	x6, [x6, #0x8]
    fff8:      	cmp	x5, x6
    fffc:      	b.ne	0x100fc <_stogir.terminal.previous-input+0x1c0>
   10000:      	cmp	x3, x5
   10004:      	b.gt	0x1010c <_stogir.terminal.previous-input+0x1d0>
   10008:      	lsl	x3, x4, #2
   1000c:      	ldr	x5, [x0, #0x50]
   10010:      	add	x3, x3, x5
   10014:      	ldr	w3, [x3]
   10018:      	sxtw	x3, w3
   1001c:      	cmp	x3, #0x0
   10020:      	cset	w3, gt
   10024:      	ubfx	x3, x3, #0, #8
   10028:      	b	0x10110 <_stogir.terminal.previous-input+0x1d4>
   1002c:      	movz	x3, #0x0, lsl #48
   10030:      	b	0x10038 <_stogir.terminal.previous-input+0xfc>
   10034:      	movz	x3, #0x0, lsl #48
   10038:      	cmp	x3, #0x0
   1003c:      	b.eq	0x1007c <_stogir.terminal.previous-input+0x140>
   10040:      	uxtb	w16, w2
   10044:      	cmp	w16, wzr
   10048:      	b.eq	0x10060 <_stogir.terminal.previous-input+0x124>
   1004c:      	lsl	x2, x1, #4
   10050:      	ldr	x0, [x0]
   10054:      	add	x0, x2, x0
   10058:      	ldr	x0, [x0]
   1005c:      	b	0x10070 <_stogir.terminal.previous-input+0x134>
   10060:      	lsl	x2, x4, #4
   10064:      	ldr	x0, [x0, #0x28]
   10068:      	add	x0, x2, x0
   1006c:      	ldr	x0, [x0]
   10070:      	mov	x2, x0
   10074:      	mov	x0, #0x1                ; =1
   10078:      	b	0x10084 <_stogir.terminal.previous-input+0x148>
   1007c:      	movz	x0, #0x0, lsl #48
   10080:      	movz	x2, #0x0, lsl #48
   10084:      	lsr	w0, w0, #0
   10088:      	lsr	x16, x0, #0
   1008c:      	cmp	x16, #0x1
   10090:      	b.eq	0x100ac <_stogir.terminal.previous-input+0x170>
   10094:      	b.lo	0x1009c <_stogir.terminal.previous-input+0x160>
   10098:      	b	0x100b0 <_stogir.terminal.previous-input+0x174>
   1009c:      	cmp	x16, #0x0
   100a0:      	b.eq	0x100a8 <_stogir.terminal.previous-input+0x16c>
   100a4:      	b	0x100b0 <_stogir.terminal.previous-input+0x174>
   100a8:      	b	0x100b4 <_stogir.terminal.previous-input+0x178>
   100ac:      	b	0x100d0 <_stogir.terminal.previous-input+0x194>
   100b0:      	b	0x10154 <_stogir.terminal.previous-input+0x218>
   100b4:      	adrp	x16, 0x10000 <_stogir.terminal.previous-input+0xc4>
		00000000000100b4:  ARM64_RELOC_PAGE21	l_stogir.498
   100b8:      	ldr	x16, [x16]
		00000000000100b8:  ARM64_RELOC_PAGEOFF12	l_stogir.498
   100bc:      	orr	x0, x16, xzr
   100c0:      	mov	x1, x0
   100c4:      	mov	x0, #0x1                ; =1
   100c8:      	mov	x2, #0x1d               ; =29
   100cc:      	b	0xffdc <_stogir.terminal.previous-input+0xa0>
   100d0:      	cmp	x1, #0x0
   100d4:      	b.le	0xffc4 <_stogir.terminal.previous-input+0x88>
   100d8:      	uxtb	w2, w2
   100dc:      	cmp	x2, #0x83
   100e0:      	b.ge	0x10114 <_stogir.terminal.previous-input+0x1d8>
   100e4:      	adrp	x16, 0x10000 <_stogir.terminal.previous-input+0xc4>
		00000000000100e4:  ARM64_RELOC_PAGE21	l_stogir.499
   100e8:      	ldr	x16, [x16]
		00000000000100e8:  ARM64_RELOC_PAGEOFF12	l_stogir.499
   100ec:      	orr	x0, x16, xzr
   100f0:      	add	x0, x2, x0
   100f4:      	ldrb	w0, [x0]
   100f8:      	b	0x10118 <_stogir.terminal.previous-input+0x1dc>
   100fc:      	movz	x3, #0x0, lsl #48
   10100:      	b	0x10038 <_stogir.terminal.previous-input+0xfc>
   10104:      	movz	x3, #0x0, lsl #48
   10108:      	b	0x10030 <_stogir.terminal.previous-input+0xf4>
   1010c:      	movz	x3, #0x0, lsl #48
   10110:      	b	0x10100 <_stogir.terminal.previous-input+0x1c4>
   10114:      	movz	x0, #0x0, lsl #48
   10118:      	uxtb	w0, w0
   1011c:      	and	x0, x0, #0x8
   10120:      	uxtb	w0, w0
   10124:      	cmp	x0, #0x0
   10128:      	cset	w0, eq
   1012c:      	uxtb	w16, w0
   10130:      	cmp	w16, wzr
   10134:      	cset	x0, eq
   10138:      	cmp	x0, #0x0
   1013c:      	b.eq	0xffc4 <_stogir.terminal.previous-input+0x88>
   10140:      	and	x0, x1, #0xffffffff
   10144:      	mov	x1, x0
   10148:      	movz	x0, #0x0, lsl #48
   1014c:      	movz	x2, #0x0, lsl #48
   10150:      	b	0xffdc <_stogir.terminal.previous-input+0xa0>
   10154:      	brk	#0
   10158:      	b	0x10154 <_stogir.terminal.previous-input+0x218>

000000000001015c <_stogir.switch.selector-type>:
   1015c:      	sxtw	x1, w1
   10160:      	cmp	x1, #0x0
   10164:      	cset	w2, gt
   10168:      	movz	x16, #0x0, lsl #48
   1016c:      	sub	x3, x16, x1
   10170:      	sub	x4, x3, #0x1
   10174:      	uxtb	w16, w2
   10178:      	cmp	w16, wzr
   1017c:      	b.eq	0x101c0 <_stogir.switch.selector-type+0x64>
   10180:      	ldr	x3, [x0, #0x8]
   10184:      	cmp	x1, x3
   10188:      	b.ge	0x10214 <_stogir.switch.selector-type+0xb8>
   1018c:      	add	x3, x0, #0x78
   10190:      	ldr	x3, [x3, #0x8]
   10194:      	cmp	x1, x3
   10198:      	b.ge	0x10318 <_stogir.switch.selector-type+0x1bc>
   1019c:      	lsl	x3, x1, #2
   101a0:      	ldr	x5, [x0, #0x78]
   101a4:      	add	x3, x3, x5
   101a8:      	ldr	w3, [x3]
   101ac:      	sxtw	x3, w3
   101b0:      	cmp	x3, #0x0
   101b4:      	cset	w3, ge
   101b8:      	ubfx	x3, x3, #0, #8
   101bc:      	b	0x1031c <_stogir.switch.selector-type+0x1c0>
   101c0:      	cmp	x1, #0x0
   101c4:      	b.ge	0x1021c <_stogir.switch.selector-type+0xc0>
   101c8:      	add	x5, x0, #0x28
   101cc:      	add	x6, x0, #0x50
   101d0:      	ldr	x5, [x5, #0x8]
   101d4:      	ldr	x6, [x6, #0x8]
   101d8:      	cmp	x5, x6
   101dc:      	b.ne	0x1020c <_stogir.switch.selector-type+0xb0>
   101e0:      	cmp	x3, x5
   101e4:      	b.gt	0x10320 <_stogir.switch.selector-type+0x1c4>
   101e8:      	lsl	x3, x4, #2
   101ec:      	ldr	x5, [x0, #0x50]
   101f0:      	add	x3, x3, x5
   101f4:      	ldr	w3, [x3]
   101f8:      	sxtw	x3, w3
   101fc:      	cmp	x3, #0x0
   10200:      	cset	w3, gt
   10204:      	ubfx	x3, x3, #0, #8
   10208:      	b	0x10324 <_stogir.switch.selector-type+0x1c8>
   1020c:      	movz	x3, #0x0, lsl #48
   10210:      	b	0x10220 <_stogir.switch.selector-type+0xc4>
   10214:      	movz	x3, #0x0, lsl #48
   10218:      	b	0x10220 <_stogir.switch.selector-type+0xc4>
   1021c:      	movz	x3, #0x0, lsl #48
   10220:      	cmp	x3, #0x0
   10224:      	b.eq	0x10264 <_stogir.switch.selector-type+0x108>
   10228:      	uxtb	w16, w2
   1022c:      	cmp	w16, wzr
   10230:      	b.eq	0x10248 <_stogir.switch.selector-type+0xec>
   10234:      	lsl	x1, x1, #4
   10238:      	ldr	x0, [x0]
   1023c:      	add	x0, x1, x0
   10240:      	ldr	x0, [x0]
   10244:      	b	0x10258 <_stogir.switch.selector-type+0xfc>
   10248:      	lsl	x1, x4, #4
   1024c:      	ldr	x0, [x0, #0x28]
   10250:      	add	x0, x1, x0
   10254:      	ldr	x0, [x0]
   10258:      	mov	x1, x0
   1025c:      	mov	x0, #0x1                ; =1
   10260:      	b	0x1026c <_stogir.switch.selector-type+0x110>
   10264:      	movz	x0, #0x0, lsl #48
   10268:      	movz	x1, #0x0, lsl #48
   1026c:      	lsr	w0, w0, #0
   10270:      	lsr	x16, x0, #0
   10274:      	cmp	x16, #0x1
   10278:      	b.eq	0x10294 <_stogir.switch.selector-type+0x138>
   1027c:      	b.lo	0x10284 <_stogir.switch.selector-type+0x128>
   10280:      	b	0x10298 <_stogir.switch.selector-type+0x13c>
   10284:      	cmp	x16, #0x0
   10288:      	b.eq	0x10290 <_stogir.switch.selector-type+0x134>
   1028c:      	b	0x10298 <_stogir.switch.selector-type+0x13c>
   10290:      	b	0x1029c <_stogir.switch.selector-type+0x140>
   10294:      	b	0x102e0 <_stogir.switch.selector-type+0x184>
   10298:      	b	0x10328 <_stogir.switch.selector-type+0x1cc>
   1029c:      	adrp	x16, 0x10000 <_stogir.terminal.previous-input+0xc4>
		000000000001029c:  ARM64_RELOC_PAGE21	l_stogir.500
   102a0:      	ldr	x16, [x16]
		00000000000102a0:  ARM64_RELOC_PAGEOFF12	l_stogir.500
   102a4:      	orr	x0, x16, xzr
   102a8:      	mov	x1, x0
   102ac:      	mov	x0, #0x1                ; =1
   102b0:      	mov	x2, #0x17               ; =23
   102b4:      	b	0x102d0 <_stogir.switch.selector-type+0x174>
   102b8:      	adrp	x16, 0x10000 <_stogir.terminal.previous-input+0xc4>
		00000000000102b8:  ARM64_RELOC_PAGE21	l_stogir.501
   102bc:      	ldr	x16, [x16]
		00000000000102bc:  ARM64_RELOC_PAGEOFF12	l_stogir.501
   102c0:      	orr	x0, x16, xzr
   102c4:      	mov	x1, x0
   102c8:      	mov	x0, #0x1                ; =1
   102cc:      	mov	x2, #0x20               ; =32
   102d0:      	str	x0, [x8]
   102d4:      	str	x1, [x8, #0x8]
   102d8:      	str	x2, [x8, #0x10]
   102dc:      	ret
   102e0:      	lsr	w0, w1, #0
   102e4:      	ubfx	x0, x0, #8, #8
   102e8:      	cmp	x0, #0x1
   102ec:      	b.lt	0x102b8 <_stogir.switch.selector-type+0x15c>
   102f0:      	cmp	x0, #0xb
   102f4:      	b.gt	0x102b8 <_stogir.switch.selector-type+0x15c>
   102f8:      	uxtb	w1, w1
   102fc:      	cmp	x1, #0x48
   10300:      	b.eq	0x102b8 <_stogir.switch.selector-type+0x15c>
   10304:      	and	x0, x0, #0xffffffff
   10308:      	mov	x1, x0
   1030c:      	movz	x0, #0x0, lsl #48
   10310:      	movz	x2, #0x0, lsl #48
   10314:      	b	0x102d0 <_stogir.switch.selector-type+0x174>
   10318:      	movz	x3, #0x0, lsl #48
   1031c:      	b	0x10218 <_stogir.switch.selector-type+0xbc>
   10320:      	movz	x3, #0x0, lsl #48
   10324:      	b	0x10210 <_stogir.switch.selector-type+0xb4>
   10328:      	brk	#0
   1032c:      	b	0x10328 <_stogir.switch.selector-type+0x1cc>

0000000000010330 <_stogir.switch.key>:
   10330:      	sub	sp, sp, #0x40
   10334:      	str	x29, [sp]
   10338:      	str	x30, [sp, #0x8]
   1033c:      	mov	x29, sp
   10340:      	str	x19, [sp, #0x10]
   10344:      	str	x20, [sp, #0x18]
   10348:      	str	x21, [sp, #0x20]
   1034c:      	str	x22, [sp, #0x28]
   10350:      	str	x23, [sp, #0x30]
   10354:      	str	x24, [sp, #0x38]
   10358:      	sub	sp, sp, #0x10
   1035c:      	mov	x3, sp
   10360:      	sxtw	x2, w2
   10364:      	cmp	x2, #0x1
   10368:      	b.lt	0x103e4 <_stogir.switch.key+0xb4>
   1036c:      	cmp	x2, #0xb
   10370:      	cset	w4, le
   10374:      	uxtb	w16, w4
   10378:      	cmp	w16, wzr
   1037c:      	b.eq	0x103e4 <_stogir.switch.key+0xb4>
   10380:      	sxtw	x1, w1
   10384:      	cmp	x1, #0x0
   10388:      	cset	w5, gt
   1038c:      	movz	x16, #0x0, lsl #48
   10390:      	sub	x6, x16, x1
   10394:      	sub	x7, x6, #0x1
   10398:      	uxtb	w16, w5
   1039c:      	cmp	w16, wzr
   103a0:      	b.eq	0x10478 <_stogir.switch.key+0x148>
   103a4:      	ldr	x6, [x0, #0x8]
   103a8:      	cmp	x1, x6
   103ac:      	b.ge	0x104c4 <_stogir.switch.key+0x194>
   103b0:      	add	x6, x0, #0x78
   103b4:      	ldr	x6, [x6, #0x8]
   103b8:      	cmp	x1, x6
   103bc:      	b.ge	0x10638 <_stogir.switch.key+0x308>
   103c0:      	lsl	x6, x1, #2
   103c4:      	ldr	x9, [x0, #0x78]
   103c8:      	add	x6, x6, x9
   103cc:      	ldr	w6, [x6]
   103d0:      	sxtw	x6, w6
   103d4:      	cmp	x6, #0x0
   103d8:      	cset	w6, ge
   103dc:      	ubfx	x6, x6, #0, #8
   103e0:      	b	0x1063c <_stogir.switch.key+0x30c>
   103e4:      	adrp	x16, 0x10000 <_stogir.terminal.previous-input+0xc4>
		00000000000103e4:  ARM64_RELOC_PAGE21	l_stogir.502
   103e8:      	ldr	x16, [x16]
		00000000000103e8:  ARM64_RELOC_PAGEOFF12	l_stogir.502
   103ec:      	orr	x0, x16, xzr
   103f0:      	mov	x1, x0
   103f4:      	mov	x0, #0x1                ; =1
   103f8:      	mov	x2, #0x24               ; =36
   103fc:      	str	x0, [x8]
   10400:      	str	x1, [x8, #0x8]
   10404:      	str	x2, [x8, #0x10]
   10408:      	sub	sp, x29, #0x0
   1040c:      	ldr	x19, [sp, #0x10]
   10410:      	ldr	x20, [sp, #0x18]
   10414:      	ldr	x21, [sp, #0x20]
   10418:      	ldr	x22, [sp, #0x28]
   1041c:      	ldr	x23, [sp, #0x30]
   10420:      	ldr	x24, [sp, #0x38]
   10424:      	ldr	x29, [sp]
   10428:      	ldr	x30, [sp, #0x8]
   1042c:      	add	sp, sp, #0x40
   10430:      	ret
   10434:      	mov	x23, #0x1               ; =1
   10438:      	cmp	x1, #0x0
   1043c:      	b.ge	0x1045c <_stogir.switch.key+0x12c>
   10440:      	ldr	w1, [x3]
   10444:      	uxtb	w24, w1
   10448:      	ubfx	x1, x1, #8, #8
   1044c:      	cmp	x24, x1
   10450:      	b.eq	0x106e0 <_stogir.switch.key+0x3b0>
   10454:      	cmp	x24, #0x49
   10458:      	b.eq	0x106e0 <_stogir.switch.key+0x3b0>
   1045c:      	adrp	x16, 0x10000 <_stogir.terminal.previous-input+0xc4>
		000000000001045c:  ARM64_RELOC_PAGE21	l_stogir.503
   10460:      	ldr	x16, [x16]
		0000000000010460:  ARM64_RELOC_PAGEOFF12	l_stogir.503
   10464:      	orr	x0, x16, xzr
   10468:      	mov	x1, x0
   1046c:      	mov	x0, #0x1                ; =1
   10470:      	mov	x2, #0x30               ; =48
   10474:      	b	0x103fc <_stogir.switch.key+0xcc>
   10478:      	cmp	x1, #0x0
   1047c:      	b.ge	0x104cc <_stogir.switch.key+0x19c>
   10480:      	add	x9, x0, #0x28
   10484:      	add	x10, x0, #0x50
   10488:      	ldr	x9, [x9, #0x8]
   1048c:      	ldr	x10, [x10, #0x8]
   10490:      	cmp	x9, x10
   10494:      	b.ne	0x10630 <_stogir.switch.key+0x300>
   10498:      	cmp	x6, x9
   1049c:      	b.gt	0x106d8 <_stogir.switch.key+0x3a8>
   104a0:      	lsl	x6, x7, #2
   104a4:      	ldr	x9, [x0, #0x50]
   104a8:      	add	x6, x6, x9
   104ac:      	ldr	w6, [x6]
   104b0:      	sxtw	x6, w6
   104b4:      	cmp	x6, #0x0
   104b8:      	cset	w6, gt
   104bc:      	ubfx	x6, x6, #0, #8
   104c0:      	b	0x106dc <_stogir.switch.key+0x3ac>
   104c4:      	movz	x6, #0x0, lsl #48
   104c8:      	b	0x104d0 <_stogir.switch.key+0x1a0>
   104cc:      	movz	x6, #0x0, lsl #48
   104d0:      	cmp	x6, #0x0
   104d4:      	b.eq	0x10538 <_stogir.switch.key+0x208>
   104d8:      	uxtb	w16, w5
   104dc:      	cmp	w16, wzr
   104e0:      	b.eq	0x10508 <_stogir.switch.key+0x1d8>
   104e4:      	lsl	x5, x1, #4
   104e8:      	ldr	x0, [x0]
   104ec:      	add	x0, x5, x0
   104f0:      	ldr	x5, [x0]
   104f4:      	ldr	x0, [x0, #0x8]
   104f8:      	fmov	d31, x0
   104fc:      	mov	x0, x5
   10500:      	fmov	x5, d31
   10504:      	b	0x10528 <_stogir.switch.key+0x1f8>
   10508:      	lsl	x5, x7, #4
   1050c:      	ldr	x0, [x0, #0x28]
   10510:      	add	x0, x5, x0
   10514:      	ldr	x5, [x0]
   10518:      	ldr	x0, [x0, #0x8]
   1051c:      	fmov	d31, x0
   10520:      	mov	x0, x5
   10524:      	fmov	x5, d31
   10528:      	mov	x6, x5
   1052c:      	mov	x5, x0
   10530:      	mov	x0, #0x1                ; =1
   10534:      	b	0x10544 <_stogir.switch.key+0x214>
   10538:      	movz	x0, #0x0, lsl #48
   1053c:      	movz	x5, #0x0, lsl #48
   10540:      	movz	x6, #0x0, lsl #48
   10544:      	lsr	w0, w0, #0
   10548:      	lsr	x16, x0, #0
   1054c:      	cmp	x16, #0x1
   10550:      	b.eq	0x1056c <_stogir.switch.key+0x23c>
   10554:      	b.lo	0x1055c <_stogir.switch.key+0x22c>
   10558:      	b	0x10570 <_stogir.switch.key+0x240>
   1055c:      	cmp	x16, #0x0
   10560:      	b.eq	0x10568 <_stogir.switch.key+0x238>
   10564:      	b	0x10570 <_stogir.switch.key+0x240>
   10568:      	b	0x10574 <_stogir.switch.key+0x244>
   1056c:      	b	0x10590 <_stogir.switch.key+0x260>
   10570:      	b	0x1078c <_stogir.switch.key+0x45c>
   10574:      	adrp	x16, 0x10000 <_stogir.terminal.previous-input+0xc4>
		0000000000010574:  ARM64_RELOC_PAGE21	l_stogir.504
   10578:      	ldr	x16, [x16]
		0000000000010578:  ARM64_RELOC_PAGEOFF12	l_stogir.504
   1057c:      	orr	x0, x16, xzr
   10580:      	mov	x1, x0
   10584:      	mov	x0, #0x1                ; =1
   10588:      	mov	x2, #0x1c               ; =28
   1058c:      	b	0x10474 <_stogir.switch.key+0x144>
   10590:      	cmp	x2, #0x1
   10594:      	cset	w0, eq
   10598:      	cmp	x2, #0x0
   1059c:      	cset	w7, eq
   105a0:      	cmp	x2, #0x2
   105a4:      	cset	w9, eq
   105a8:      	cmp	x2, #0x7
   105ac:      	cset	w10, eq
   105b0:      	cmp	x2, #0x8
   105b4:      	cset	w11, eq
   105b8:      	cmp	x2, #0x3
   105bc:      	cset	w12, eq
   105c0:      	cmp	x2, #0x9
   105c4:      	cset	w13, eq
   105c8:      	cmp	x2, #0x4
   105cc:      	cset	w14, eq
   105d0:      	cmp	x2, #0xa
   105d4:      	cset	w15, eq
   105d8:      	cmp	x2, #0xd
   105dc:      	cset	w19, eq
   105e0:      	cmp	x2, #0x5
   105e4:      	cset	w20, eq
   105e8:      	cmp	x2, #0xb
   105ec:      	cset	w21, eq
   105f0:      	cmp	x2, #0xc
   105f4:      	cset	w22, eq
   105f8:      	cmp	x2, #0x6
   105fc:      	cset	w23, eq
   10600:      	str	x5, [x3]
   10604:      	uxtb	w16, w23
   10608:      	cmp	w16, wzr
   1060c:      	mov	x16, #0x8               ; =8
   10610:      	movn	x17, #0x0, lsl #48
   10614:      	csel	x5, x16, x17, ne
   10618:      	str	x6, [x3, #0x8]
   1061c:      	uxtb	w16, w7
   10620:      	cmp	w16, wzr
   10624:      	b.eq	0x10640 <_stogir.switch.key+0x310>
   10628:      	movz	x23, #0x0, lsl #48
   1062c:      	b	0x10438 <_stogir.switch.key+0x108>
   10630:      	movz	x6, #0x0, lsl #48
   10634:      	b	0x104d0 <_stogir.switch.key+0x1a0>
   10638:      	movz	x6, #0x0, lsl #48
   1063c:      	b	0x104c8 <_stogir.switch.key+0x198>
   10640:      	uxtb	w16, w0
   10644:      	cmp	w16, wzr
   10648:      	b.ne	0x10434 <_stogir.switch.key+0x104>
   1064c:      	uxtb	w16, w9
   10650:      	cmp	w16, wzr
   10654:      	b.ne	0x10434 <_stogir.switch.key+0x104>
   10658:      	uxtb	w16, w10
   1065c:      	cmp	w16, wzr
   10660:      	b.ne	0x10434 <_stogir.switch.key+0x104>
   10664:      	uxtb	w16, w11
   10668:      	cmp	w16, wzr
   1066c:      	b.ne	0x10434 <_stogir.switch.key+0x104>
   10670:      	uxtb	w16, w12
   10674:      	cmp	w16, wzr
   10678:      	b.ne	0x10784 <_stogir.switch.key+0x454>
   1067c:      	uxtb	w16, w13
   10680:      	cmp	w16, wzr
   10684:      	b.ne	0x10784 <_stogir.switch.key+0x454>
   10688:      	uxtb	w16, w14
   1068c:      	cmp	w16, wzr
   10690:      	b.ne	0x1085c <_stogir.switch.key+0x52c>
   10694:      	uxtb	w16, w15
   10698:      	cmp	w16, wzr
   1069c:      	b.ne	0x1085c <_stogir.switch.key+0x52c>
   106a0:      	uxtb	w16, w19
   106a4:      	cmp	w16, wzr
   106a8:      	b.ne	0x1085c <_stogir.switch.key+0x52c>
   106ac:      	uxtb	w16, w20
   106b0:      	cmp	w16, wzr
   106b4:      	b.ne	0x10864 <_stogir.switch.key+0x534>
   106b8:      	uxtb	w16, w21
   106bc:      	cmp	w16, wzr
   106c0:      	b.ne	0x10864 <_stogir.switch.key+0x534>
   106c4:      	uxtb	w16, w22
   106c8:      	cmp	w16, wzr
   106cc:      	b.ne	0x10864 <_stogir.switch.key+0x534>
   106d0:      	mov	x23, x5
   106d4:      	b	0x10868 <_stogir.switch.key+0x538>
   106d8:      	movz	x6, #0x0, lsl #48
   106dc:      	b	0x10634 <_stogir.switch.key+0x304>
   106e0:      	ldr	w1, [x3]
   106e4:      	ubfx	x1, x1, #8, #8
   106e8:      	cmp	x1, x2
   106ec:      	b.ne	0x1045c <_stogir.switch.key+0x12c>
   106f0:      	lsr	w23, w23, #0
   106f4:      	lsr	w1, w6, #0
   106f8:      	sxtw	x23, w23
   106fc:      	ubfx	x1, x1, #0, #32
   10700:      	lsr	x3, x6, #32
   10704:      	lsl	x6, x23, #3
   10708:      	ubfx	x3, x3, #0, #32
   1070c:      	lsr	w6, w6, #0
   10710:      	lsl	x3, x3, #32
   10714:      	sxtw	x6, w6
   10718:      	orr	x1, x3, x1
   1071c:      	cmp	x6, #0x40
   10720:      	b.ge	0x10730 <_stogir.switch.key+0x400>
   10724:      	lsr	x3, x1, x6
   10728:      	cmp	x3, #0x0
   1072c:      	b.ne	0x1045c <_stogir.switch.key+0x12c>
   10730:      	uxtb	w16, w0
   10734:      	cmp	w16, wzr
   10738:      	b.eq	0x10744 <_stogir.switch.key+0x414>
   1073c:      	cmp	x1, #0x1
   10740:      	b.hi	0x1045c <_stogir.switch.key+0x12c>
   10744:      	cmp	x2, #0x7
   10748:      	b.lt	0x1076c <_stogir.switch.key+0x43c>
   1074c:      	uxtb	w16, w4
   10750:      	cmp	w16, wzr
   10754:      	b.eq	0x1076c <_stogir.switch.key+0x43c>
   10758:      	uxtb	w16, w7
   1075c:      	cmp	w16, wzr
   10760:      	b.eq	0x107c4 <_stogir.switch.key+0x494>
   10764:      	movz	x0, #0x0, lsl #48
   10768:      	b	0x10798 <_stogir.switch.key+0x468>
   1076c:      	movz	x0, #0x0, lsl #48
   10770:      	eor	x0, x0, x1
   10774:      	mov	x1, x0
   10778:      	movz	x0, #0x0, lsl #48
   1077c:      	movz	x2, #0x0, lsl #48
   10780:      	b	0x10474 <_stogir.switch.key+0x144>
   10784:      	mov	x23, #0x2               ; =2
   10788:      	b	0x10438 <_stogir.switch.key+0x108>
   1078c:      	brk	#0
   10790:      	b	0x1078c <_stogir.switch.key+0x45c>
   10794:      	mov	x0, #0x1                ; =1
   10798:      	lsr	w0, w0, #0
   1079c:      	sxtw	x0, w0
   107a0:      	lsl	x0, x0, #3
   107a4:      	lsr	w0, w0, #0
   107a8:      	sxtw	x0, w0
   107ac:      	sub	x0, x0, #0x1
   107b0:      	lsr	w0, w0, #0
   107b4:      	sxtw	x0, w0
   107b8:      	mov	x16, #0x1               ; =1
   107bc:      	lsl	x0, x16, x0
   107c0:      	b	0x10770 <_stogir.switch.key+0x440>
   107c4:      	uxtb	w16, w0
   107c8:      	cmp	w16, wzr
   107cc:      	b.ne	0x10794 <_stogir.switch.key+0x464>
   107d0:      	uxtb	w16, w9
   107d4:      	cmp	w16, wzr
   107d8:      	b.ne	0x10794 <_stogir.switch.key+0x464>
   107dc:      	uxtb	w16, w10
   107e0:      	cmp	w16, wzr
   107e4:      	b.ne	0x10794 <_stogir.switch.key+0x464>
   107e8:      	uxtb	w16, w11
   107ec:      	cmp	w16, wzr
   107f0:      	b.ne	0x10794 <_stogir.switch.key+0x464>
   107f4:      	uxtb	w16, w12
   107f8:      	cmp	w16, wzr
   107fc:      	b.ne	0x1086c <_stogir.switch.key+0x53c>
   10800:      	uxtb	w16, w13
   10804:      	cmp	w16, wzr
   10808:      	b.ne	0x1086c <_stogir.switch.key+0x53c>
   1080c:      	uxtb	w16, w14
   10810:      	cmp	w16, wzr
   10814:      	b.ne	0x10874 <_stogir.switch.key+0x544>
   10818:      	uxtb	w16, w15
   1081c:      	cmp	w16, wzr
   10820:      	b.ne	0x10874 <_stogir.switch.key+0x544>
   10824:      	uxtb	w16, w19
   10828:      	cmp	w16, wzr
   1082c:      	b.ne	0x10874 <_stogir.switch.key+0x544>
   10830:      	uxtb	w16, w20
   10834:      	cmp	w16, wzr
   10838:      	b.ne	0x1087c <_stogir.switch.key+0x54c>
   1083c:      	uxtb	w16, w21
   10840:      	cmp	w16, wzr
   10844:      	b.ne	0x1087c <_stogir.switch.key+0x54c>
   10848:      	uxtb	w16, w22
   1084c:      	cmp	w16, wzr
   10850:      	b.ne	0x1087c <_stogir.switch.key+0x54c>
   10854:      	mov	x0, x5
   10858:      	b	0x10880 <_stogir.switch.key+0x550>
   1085c:      	mov	x23, #0x4               ; =4
   10860:      	b	0x10788 <_stogir.switch.key+0x458>
   10864:      	mov	x23, #0x8               ; =8
   10868:      	b	0x10860 <_stogir.switch.key+0x530>
   1086c:      	mov	x0, #0x2                ; =2
   10870:      	b	0x10798 <_stogir.switch.key+0x468>
   10874:      	mov	x0, #0x4                ; =4
   10878:      	b	0x10870 <_stogir.switch.key+0x540>
   1087c:      	mov	x0, #0x8                ; =8
   10880:      	b	0x10878 <_stogir.switch.key+0x548>

0000000000010884 <_stogir.frame.valid-alignment?>:
   10884:      	cmp	x0, #0x0
   10888:      	b.le	0x108a4 <_stogir.frame.valid-alignment?+0x20>
   1088c:      	sub	x1, x0, #0x1
   10890:      	and	x0, x1, x0
   10894:      	cmp	x0, #0x0
   10898:      	cset	w0, eq
   1089c:      	ubfx	x0, x0, #0, #8
   108a0:      	b	0x108a8 <_stogir.frame.valid-alignment?+0x24>
   108a4:      	movz	x0, #0x0, lsl #48
   108a8:      	ret

00000000000108ac <_stogir.stack.constant-size-aligned>:
   108ac:      	sub	sp, sp, #0x10
   108b0:      	str	x29, [sp]
   108b4:      	str	x30, [sp, #0x8]
   108b8:      	mov	x29, sp
   108bc:      	sub	sp, sp, #0x10
   108c0:      	mov	x3, sp
   108c4:      	cmp	x2, #0x10
   108c8:      	b.lt	0x10948 <_stogir.stack.constant-size-aligned+0x9c>
   108cc:      	cmp	x2, #0x0
   108d0:      	b.le	0x10948 <_stogir.stack.constant-size-aligned+0x9c>
   108d4:      	sub	x4, x2, #0x1
   108d8:      	and	x4, x4, x2
   108dc:      	cmp	x4, #0x0
   108e0:      	b.ne	0x10948 <_stogir.stack.constant-size-aligned+0x9c>
   108e4:      	sxtw	x1, w1
   108e8:      	cmp	x1, #0x0
   108ec:      	cset	w4, gt
   108f0:      	movz	x16, #0x0, lsl #48
   108f4:      	sub	x5, x16, x1
   108f8:      	sub	x6, x5, #0x1
   108fc:      	uxtb	w16, w4
   10900:      	cmp	w16, wzr
   10904:      	b.eq	0x109e8 <_stogir.stack.constant-size-aligned+0x13c>
   10908:      	ldr	x5, [x0, #0x8]
   1090c:      	cmp	x1, x5
   10910:      	b.ge	0x10a34 <_stogir.stack.constant-size-aligned+0x188>
   10914:      	add	x5, x0, #0x78
   10918:      	ldr	x5, [x5, #0x8]
   1091c:      	cmp	x1, x5
   10920:      	b.ge	0x10b28 <_stogir.stack.constant-size-aligned+0x27c>
   10924:      	lsl	x5, x1, #2
   10928:      	ldr	x7, [x0, #0x78]
   1092c:      	add	x5, x5, x7
   10930:      	ldr	w5, [x5]
   10934:      	sxtw	x5, w5
   10938:      	cmp	x5, #0x0
   1093c:      	cset	w5, ge
   10940:      	ubfx	x5, x5, #0, #8
   10944:      	b	0x10b2c <_stogir.stack.constant-size-aligned+0x280>
   10948:      	adrp	x16, 0x10000 <_stogir.terminal.previous-input+0xc4>
		0000000000010948:  ARM64_RELOC_PAGE21	l_stogir.505
   1094c:      	ldr	x16, [x16]
		000000000001094c:  ARM64_RELOC_PAGEOFF12	l_stogir.505
   10950:      	orr	x0, x16, xzr
   10954:      	mov	x1, x0
   10958:      	mov	x0, #0x1                ; =1
   1095c:      	mov	x2, #0x20               ; =32
   10960:      	str	x0, [x8]
   10964:      	str	x1, [x8, #0x8]
   10968:      	str	x2, [x8, #0x10]
   1096c:      	sub	sp, x29, #0x0
   10970:      	ldr	x29, [sp]
   10974:      	ldr	x30, [sp, #0x8]
   10978:      	add	sp, sp, #0x10
   1097c:      	ret
   10980:      	mov	x4, #0x1                ; =1
   10984:      	ldr	w5, [x3, #0x8]
   10988:      	ldr	w6, [x3, #0xc]
   1098c:      	cmp	x1, #0x0
   10990:      	b.ge	0x109cc <_stogir.stack.constant-size-aligned+0x120>
   10994:      	cmp	x0, #0x1
   10998:      	b.lt	0x109cc <_stogir.stack.constant-size-aligned+0x120>
   1099c:      	cmp	x0, #0xb
   109a0:      	cset	w1, le
   109a4:      	uxtb	w16, w1
   109a8:      	cmp	w16, wzr
   109ac:      	b.eq	0x109cc <_stogir.stack.constant-size-aligned+0x120>
   109b0:      	ldr	w3, [x3]
   109b4:      	uxtb	w7, w3
   109b8:      	ubfx	x3, x3, #8, #8
   109bc:      	cmp	x7, x3
   109c0:      	b.eq	0x10bb8 <_stogir.stack.constant-size-aligned+0x30c>
   109c4:      	cmp	x7, #0x49
   109c8:      	b.eq	0x10bb8 <_stogir.stack.constant-size-aligned+0x30c>
   109cc:      	adrp	x16, 0x10000 <_stogir.terminal.previous-input+0xc4>
		00000000000109cc:  ARM64_RELOC_PAGE21	l_stogir.506
   109d0:      	ldr	x16, [x16]
		00000000000109d0:  ARM64_RELOC_PAGEOFF12	l_stogir.506
   109d4:      	orr	x0, x16, xzr
   109d8:      	mov	x1, x0
   109dc:      	mov	x0, #0x1                ; =1
   109e0:      	mov	x2, #0x30               ; =48
   109e4:      	b	0x10960 <_stogir.stack.constant-size-aligned+0xb4>
   109e8:      	cmp	x1, #0x0
   109ec:      	b.ge	0x10a3c <_stogir.stack.constant-size-aligned+0x190>
   109f0:      	add	x7, x0, #0x28
   109f4:      	add	x9, x0, #0x50
   109f8:      	ldr	x7, [x7, #0x8]
   109fc:      	ldr	x9, [x9, #0x8]
   10a00:      	cmp	x7, x9
   10a04:      	b.ne	0x10b20 <_stogir.stack.constant-size-aligned+0x274>
   10a08:      	cmp	x5, x7
   10a0c:      	b.gt	0x10bb0 <_stogir.stack.constant-size-aligned+0x304>
   10a10:      	lsl	x5, x6, #2
   10a14:      	ldr	x7, [x0, #0x50]
   10a18:      	add	x5, x5, x7
   10a1c:      	ldr	w5, [x5]
   10a20:      	sxtw	x5, w5
   10a24:      	cmp	x5, #0x0
   10a28:      	cset	w5, gt
   10a2c:      	ubfx	x5, x5, #0, #8
   10a30:      	b	0x10bb4 <_stogir.stack.constant-size-aligned+0x308>
   10a34:      	movz	x5, #0x0, lsl #48
   10a38:      	b	0x10a40 <_stogir.stack.constant-size-aligned+0x194>
   10a3c:      	movz	x5, #0x0, lsl #48
   10a40:      	cmp	x5, #0x0
   10a44:      	b.eq	0x10aa8 <_stogir.stack.constant-size-aligned+0x1fc>
   10a48:      	uxtb	w16, w4
   10a4c:      	cmp	w16, wzr
   10a50:      	b.eq	0x10a78 <_stogir.stack.constant-size-aligned+0x1cc>
   10a54:      	lsl	x4, x1, #4
   10a58:      	ldr	x0, [x0]
   10a5c:      	add	x0, x4, x0
   10a60:      	ldr	x4, [x0]
   10a64:      	ldr	x0, [x0, #0x8]
   10a68:      	fmov	d31, x0
   10a6c:      	mov	x0, x4
   10a70:      	fmov	x4, d31
   10a74:      	b	0x10a98 <_stogir.stack.constant-size-aligned+0x1ec>
   10a78:      	lsl	x4, x6, #4
   10a7c:      	ldr	x0, [x0, #0x28]
   10a80:      	add	x0, x4, x0
   10a84:      	ldr	x4, [x0]
   10a88:      	ldr	x0, [x0, #0x8]
   10a8c:      	fmov	d31, x0
   10a90:      	mov	x0, x4
   10a94:      	fmov	x4, d31
   10a98:      	mov	x5, x4
   10a9c:      	mov	x4, x0
   10aa0:      	mov	x0, #0x1                ; =1
   10aa4:      	b	0x10ab4 <_stogir.stack.constant-size-aligned+0x208>
   10aa8:      	movz	x0, #0x0, lsl #48
   10aac:      	movz	x4, #0x0, lsl #48
   10ab0:      	movz	x5, #0x0, lsl #48
   10ab4:      	lsr	w0, w0, #0
   10ab8:      	lsr	x16, x0, #0
   10abc:      	cmp	x16, #0x1
   10ac0:      	b.eq	0x10adc <_stogir.stack.constant-size-aligned+0x230>
   10ac4:      	b.lo	0x10acc <_stogir.stack.constant-size-aligned+0x220>
   10ac8:      	b	0x10ae0 <_stogir.stack.constant-size-aligned+0x234>
   10acc:      	cmp	x16, #0x0
   10ad0:      	b.eq	0x10ad8 <_stogir.stack.constant-size-aligned+0x22c>
   10ad4:      	b	0x10ae0 <_stogir.stack.constant-size-aligned+0x234>
   10ad8:      	b	0x10ae4 <_stogir.stack.constant-size-aligned+0x238>
   10adc:      	b	0x10b00 <_stogir.stack.constant-size-aligned+0x254>
   10ae0:      	b	0x10c78 <_stogir.stack.constant-size-aligned+0x3cc>
   10ae4:      	adrp	x16, 0x10000 <_stogir.terminal.previous-input+0xc4>
		0000000000010ae4:  ARM64_RELOC_PAGE21	l_stogir.507
   10ae8:      	ldr	x16, [x16]
		0000000000010ae8:  ARM64_RELOC_PAGEOFF12	l_stogir.507
   10aec:      	orr	x0, x16, xzr
   10af0:      	mov	x1, x0
   10af4:      	mov	x0, #0x1                ; =1
   10af8:      	mov	x2, #0x18               ; =24
   10afc:      	b	0x109e4 <_stogir.stack.constant-size-aligned+0x138>
   10b00:      	lsr	w0, w4, #0
   10b04:      	str	x4, [x3]
   10b08:      	str	x5, [x3, #0x8]
   10b0c:      	ubfx	x0, x0, #8, #8
   10b10:      	cmp	x0, #0x0
   10b14:      	b.ne	0x10b30 <_stogir.stack.constant-size-aligned+0x284>
   10b18:      	movz	x4, #0x0, lsl #48
   10b1c:      	b	0x10984 <_stogir.stack.constant-size-aligned+0xd8>
   10b20:      	movz	x5, #0x0, lsl #48
   10b24:      	b	0x10a40 <_stogir.stack.constant-size-aligned+0x194>
   10b28:      	movz	x5, #0x0, lsl #48
   10b2c:      	b	0x10a38 <_stogir.stack.constant-size-aligned+0x18c>
   10b30:      	cmp	x0, #0x1
   10b34:      	b.eq	0x10980 <_stogir.stack.constant-size-aligned+0xd4>
   10b38:      	cmp	x0, #0x2
   10b3c:      	b.eq	0x10980 <_stogir.stack.constant-size-aligned+0xd4>
   10b40:      	cmp	x0, #0x7
   10b44:      	b.eq	0x10980 <_stogir.stack.constant-size-aligned+0xd4>
   10b48:      	cmp	x0, #0x8
   10b4c:      	b.eq	0x10980 <_stogir.stack.constant-size-aligned+0xd4>
   10b50:      	cmp	x0, #0x3
   10b54:      	b.eq	0x10c70 <_stogir.stack.constant-size-aligned+0x3c4>
   10b58:      	cmp	x0, #0x9
   10b5c:      	b.eq	0x10c70 <_stogir.stack.constant-size-aligned+0x3c4>
   10b60:      	cmp	x0, #0x4
   10b64:      	b.eq	0x10c80 <_stogir.stack.constant-size-aligned+0x3d4>
   10b68:      	cmp	x0, #0xa
   10b6c:      	b.eq	0x10c80 <_stogir.stack.constant-size-aligned+0x3d4>
   10b70:      	cmp	x0, #0xd
   10b74:      	b.eq	0x10c80 <_stogir.stack.constant-size-aligned+0x3d4>
   10b78:      	cmp	x0, #0x5
   10b7c:      	b.eq	0x10c88 <_stogir.stack.constant-size-aligned+0x3dc>
   10b80:      	cmp	x0, #0xb
   10b84:      	b.eq	0x10c88 <_stogir.stack.constant-size-aligned+0x3dc>
   10b88:      	cmp	x0, #0xc
   10b8c:      	b.eq	0x10c88 <_stogir.stack.constant-size-aligned+0x3dc>
   10b90:      	cmp	x0, #0x6
   10b94:      	cset	w4, eq
   10b98:      	uxtb	w16, w4
   10b9c:      	cmp	w16, wzr
   10ba0:      	mov	x16, #0x8               ; =8
   10ba4:      	movn	x17, #0x0, lsl #48
   10ba8:      	csel	x4, x16, x17, ne
   10bac:      	b	0x10c8c <_stogir.stack.constant-size-aligned+0x3e0>
   10bb0:      	movz	x5, #0x0, lsl #48
   10bb4:      	b	0x10b24 <_stogir.stack.constant-size-aligned+0x278>
   10bb8:      	lsr	w4, w4, #0
   10bbc:      	sxtw	x4, w4
   10bc0:      	cmp	x4, #0x0
   10bc4:      	b.le	0x109cc <_stogir.stack.constant-size-aligned+0x120>
   10bc8:      	ubfx	x5, x5, #0, #32
   10bcc:      	ubfx	x6, x6, #0, #32
   10bd0:      	lsl	x3, x6, #32
   10bd4:      	orr	x3, x3, x5
   10bd8:      	cmp	x4, #0x8
   10bdc:      	b.ge	0x10bf8 <_stogir.stack.constant-size-aligned+0x34c>
   10be0:      	lsl	x5, x4, #3
   10be4:      	lsr	w5, w5, #0
   10be8:      	sxtw	x5, w5
   10bec:      	lsr	x5, x3, x5
   10bf0:      	cmp	x5, #0x0
   10bf4:      	b.ne	0x109cc <_stogir.stack.constant-size-aligned+0x120>
   10bf8:      	cmp	x0, #0x7
   10bfc:      	b.lt	0x10c38 <_stogir.stack.constant-size-aligned+0x38c>
   10c00:      	uxtb	w16, w1
   10c04:      	cmp	w16, wzr
   10c08:      	b.eq	0x10c38 <_stogir.stack.constant-size-aligned+0x38c>
   10c0c:      	lsl	x0, x4, #3
   10c10:      	lsr	w0, w0, #0
   10c14:      	sxtw	x0, w0
   10c18:      	sub	x0, x0, #0x1
   10c1c:      	lsr	w0, w0, #0
   10c20:      	sxtw	x0, w0
   10c24:      	mov	x16, #0x1               ; =1
   10c28:      	lsl	x0, x16, x0
   10c2c:      	and	x0, x0, x3
   10c30:      	cmp	x0, #0x0
   10c34:      	b.ne	0x109cc <_stogir.stack.constant-size-aligned+0x120>
   10c38:      	sub	x0, x2, #0x1
   10c3c:      	mov	x16, #0x7fffffffffffffff ; =9223372036854775807
   10c40:      	sub	x0, x16, x0
   10c44:      	cmp	x3, x0
   10c48:      	b.hi	0x109cc <_stogir.stack.constant-size-aligned+0x120>
   10c4c:      	sub	x0, x2, #0x1
   10c50:      	movz	x16, #0x0, lsl #48
   10c54:      	sub	x1, x16, x2
   10c58:      	add	x0, x0, x3
   10c5c:      	and	x0, x1, x0
   10c60:      	mov	x1, x0
   10c64:      	movz	x0, #0x0, lsl #48
   10c68:      	movz	x2, #0x0, lsl #48
   10c6c:      	b	0x109e4 <_stogir.stack.constant-size-aligned+0x138>
   10c70:      	mov	x4, #0x2                ; =2
   10c74:      	b	0x10984 <_stogir.stack.constant-size-aligned+0xd8>
   10c78:      	brk	#0
   10c7c:      	b	0x10c78 <_stogir.stack.constant-size-aligned+0x3cc>
   10c80:      	mov	x4, #0x4                ; =4
   10c84:      	b	0x10c74 <_stogir.stack.constant-size-aligned+0x3c8>
   10c88:      	mov	x4, #0x8                ; =8
   10c8c:      	b	0x10c84 <_stogir.stack.constant-size-aligned+0x3d8>

0000000000010c90 <_stogir.numeric-conversion.operation?>:
   10c90:      	sxtw	x0, w0
   10c94:      	cmp	x0, #0x25
   10c98:      	b.lt	0x10cac <_stogir.numeric-conversion.operation?+0x1c>
   10c9c:      	cmp	x0, #0x27
   10ca0:      	cset	w0, le
   10ca4:      	ubfx	x0, x0, #0, #8
   10ca8:      	b	0x10cb0 <_stogir.numeric-conversion.operation?+0x20>
   10cac:      	movz	x0, #0x0, lsl #48
   10cb0:      	ret

0000000000010cb4 <_stogir.numeric-conversion.valid-types?>:
   10cb4:      	sxtw	x0, w0
   10cb8:      	sxtw	x1, w1
   10cbc:      	sxtw	x2, w2
   10cc0:      	cmp	x2, #0xc
   10cc4:      	cset	w3, eq
   10cc8:      	cmp	x2, #0xd
   10ccc:      	cset	w4, eq
   10cd0:      	ubfx	x4, x4, #0, #8
   10cd4:      	cmp	x0, #0x25
   10cd8:      	b.ne	0x10d00 <_stogir.numeric-conversion.valid-types?+0x4c>
   10cdc:      	cmp	x1, #0x1
   10ce0:      	b.lt	0x10d68 <_stogir.numeric-conversion.valid-types?+0xb4>
   10ce4:      	cmp	x1, #0xb
   10ce8:      	b.gt	0x10d68 <_stogir.numeric-conversion.valid-types?+0xb4>
   10cec:      	uxtb	w16, w3
   10cf0:      	cmp	w16, wzr
   10cf4:      	b.eq	0x10d78 <_stogir.numeric-conversion.valid-types?+0xc4>
   10cf8:      	mov	x0, #0x1                ; =1
   10cfc:      	b	0x10d7c <_stogir.numeric-conversion.valid-types?+0xc8>
   10d00:      	cmp	x1, #0xc
   10d04:      	cset	w5, eq
   10d08:      	cmp	x1, #0xd
   10d0c:      	cset	w1, eq
   10d10:      	cmp	x0, #0x26
   10d14:      	b.ne	0x10d38 <_stogir.numeric-conversion.valid-types?+0x84>
   10d18:      	uxtb	w16, w5
   10d1c:      	cmp	w16, wzr
   10d20:      	b.ne	0x10d88 <_stogir.numeric-conversion.valid-types?+0xd4>
   10d24:      	uxtb	w16, w1
   10d28:      	cmp	w16, wzr
   10d2c:      	b.ne	0x10d88 <_stogir.numeric-conversion.valid-types?+0xd4>
   10d30:      	movz	x0, #0x0, lsl #48
   10d34:      	b	0x10d64 <_stogir.numeric-conversion.valid-types?+0xb0>
   10d38:      	cmp	x0, #0x27
   10d3c:      	b.ne	0x10d70 <_stogir.numeric-conversion.valid-types?+0xbc>
   10d40:      	uxtb	w16, w5
   10d44:      	cmp	w16, wzr
   10d48:      	b.ne	0x10da0 <_stogir.numeric-conversion.valid-types?+0xec>
   10d4c:      	uxtb	w16, w1
   10d50:      	cmp	w16, wzr
   10d54:      	b.ne	0x10da0 <_stogir.numeric-conversion.valid-types?+0xec>
   10d58:      	movz	x0, #0x0, lsl #48
   10d5c:      	b	0x10d84 <_stogir.numeric-conversion.valid-types?+0xd0>
   10d60:      	movz	x0, #0x0, lsl #48
   10d64:      	b	0x10d74 <_stogir.numeric-conversion.valid-types?+0xc0>
   10d68:      	movz	x0, #0x0, lsl #48
   10d6c:      	b	0x10d74 <_stogir.numeric-conversion.valid-types?+0xc0>
   10d70:      	movz	x0, #0x0, lsl #48
   10d74:      	ret
   10d78:      	mov	x0, x4
   10d7c:      	b	0x10d6c <_stogir.numeric-conversion.valid-types?+0xb8>
   10d80:      	mov	x0, x4
   10d84:      	b	0x10d74 <_stogir.numeric-conversion.valid-types?+0xc0>
   10d88:      	cmp	x2, #0x1
   10d8c:      	b.lt	0x10d60 <_stogir.numeric-conversion.valid-types?+0xac>
   10d90:      	cmp	x2, #0xb
   10d94:      	cset	w0, le
   10d98:      	ubfx	x0, x0, #0, #8
   10d9c:      	b	0x10d64 <_stogir.numeric-conversion.valid-types?+0xb0>
   10da0:      	uxtb	w16, w3
   10da4:      	cmp	w16, wzr
   10da8:      	b.eq	0x10d80 <_stogir.numeric-conversion.valid-types?+0xcc>
   10dac:      	mov	x0, #0x1                ; =1
   10db0:      	b	0x10d84 <_stogir.numeric-conversion.valid-types?+0xd0>

0000000000010db4 <_inherent$slice$new__stogir.node.Node>:
   10db4:      	sub	sp, sp, #0x10
   10db8:      	mov	x2, sp
   10dbc:      	str	x0, [x2]
   10dc0:      	str	x1, [x2, #0x8]
   10dc4:      	ldr	x0, [sp]
   10dc8:      	ldr	x1, [sp, #0x8]
   10dcc:      	add	sp, sp, #0x10
   10dd0:      	ret

0000000000010dd4 <_inherent$slice$data__stogir.node.Node>:
   10dd4:      	ret

0000000000010dd8 <_coil.slice.element-ref__stogir.node.Node>:
   10dd8:      	ret

0000000000010ddc <_stogir.vector-lanes.ordinary?>:
   10ddc:      	ldr	w0, [x0]
   10de0:      	uxtb	w0, w0
   10de4:      	cmp	x0, #0x48
   10de8:      	b.ne	0x10df4 <_stogir.vector-lanes.ordinary?+0x18>
   10dec:      	movz	x0, #0x0, lsl #48
   10df0:      	b	0x10e08 <_stogir.vector-lanes.ordinary?+0x2c>
   10df4:      	cmp	x0, #0x46
   10df8:      	cset	w0, eq
   10dfc:      	uxtb	w16, w0
   10e00:      	cmp	w16, wzr
   10e04:      	cset	x0, eq
   10e08:      	ret

0000000000010e0c <_stogir.vector-lanes.compatible?>:
   10e0c:      	sub	sp, sp, #0x30
   10e10:      	str	x29, [sp]
   10e14:      	str	x30, [sp, #0x8]
   10e18:      	mov	x29, sp
   10e1c:      	str	x19, [sp, #0x10]
   10e20:      	str	x20, [sp, #0x18]
   10e24:      	str	x21, [sp, #0x20]
   10e28:      	lsr	w3, w0, #0
   10e2c:      	sxtw	x19, w0
   10e30:      	mov	w0, w3
   10e34:      	mov	w20, w1
   10e38:      	mov	w21, w2
   10e3c:      	bl	0x10e3c <_stogir.vector-lanes.compatible?+0x30>
		0000000000010e3c:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
   10e40:      	and	x1, x19, #0xf
   10e44:      	lsr	w1, w1, #0
   10e48:      	sxtw	x1, w1
   10e4c:      	cmp	x0, #0x0
   10e50:      	b.eq	0x10e5c <_stogir.vector-lanes.compatible?+0x50>
   10e54:      	mov	x0, x1
   10e58:      	b	0x10e60 <_stogir.vector-lanes.compatible?+0x54>
   10e5c:      	movn	x0, #0x0, lsl #48
   10e60:      	cmp	x19, #0xf
   10e64:      	b.le	0x10eb4 <_stogir.vector-lanes.compatible?+0xa8>
   10e68:      	cmp	x19, #0x80
   10e6c:      	b.ge	0x10eb4 <_stogir.vector-lanes.compatible?+0xa8>
   10e70:      	cmp	x1, #0x1
   10e74:      	b.lt	0x10eb4 <_stogir.vector-lanes.compatible?+0xa8>
   10e78:      	cmp	x1, #0xd
   10e7c:      	b.gt	0x10eb4 <_stogir.vector-lanes.compatible?+0xa8>
   10e80:      	sxtw	x21, w21
   10e84:      	cmp	x21, #0x4
   10e88:      	cset	w1, eq
   10e8c:      	cmp	x21, #0x8
   10e90:      	cset	w2, eq
   10e94:      	uxtb	w16, w1
   10e98:      	cmp	w16, wzr
   10e9c:      	b.ne	0x10edc <_stogir.vector-lanes.compatible?+0xd0>
   10ea0:      	uxtb	w16, w2
   10ea4:      	cmp	w16, wzr
   10ea8:      	b.ne	0x10edc <_stogir.vector-lanes.compatible?+0xd0>
   10eac:      	movz	x0, #0x0, lsl #48
   10eb0:      	b	0x10ed8 <_stogir.vector-lanes.compatible?+0xcc>
   10eb4:      	movz	x0, #0x0, lsl #48
   10eb8:      	ldr	x19, [sp, #0x10]
   10ebc:      	ldr	x20, [sp, #0x18]
   10ec0:      	ldr	x21, [sp, #0x20]
   10ec4:      	ldr	x29, [sp]
   10ec8:      	ldr	x30, [sp, #0x8]
   10ecc:      	add	sp, sp, #0x30
   10ed0:      	ret
   10ed4:      	movz	x0, #0x0, lsl #48
   10ed8:      	b	0x10eb8 <_stogir.vector-lanes.compatible?+0xac>
   10edc:      	sxtw	x20, w20
   10ee0:      	cmp	x20, #0x0
   10ee4:      	b.lt	0x10ed4 <_stogir.vector-lanes.compatible?+0xc8>
   10ee8:      	cmp	x20, #0xd
   10eec:      	b.gt	0x10ed4 <_stogir.vector-lanes.compatible?+0xc8>
   10ef0:      	cmp	x20, #0x0
   10ef4:      	b.le	0x10f10 <_stogir.vector-lanes.compatible?+0x104>
   10ef8:      	lsr	w0, w0, #0
   10efc:      	sxtw	x0, w0
   10f00:      	cmp	x0, x20
   10f04:      	b.ne	0x10f18 <_stogir.vector-lanes.compatible?+0x10c>
   10f08:      	mov	x0, #0x1                ; =1
   10f0c:      	b	0x10f14 <_stogir.vector-lanes.compatible?+0x108>
   10f10:      	movz	x0, #0x0, lsl #48
   10f14:      	b	0x10ed8 <_stogir.vector-lanes.compatible?+0xcc>
   10f18:      	cmp	x0, #0x1
   10f1c:      	b.lt	0x10f58 <_stogir.vector-lanes.compatible?+0x14c>
   10f20:      	cmp	x0, #0xb
   10f24:      	b.gt	0x10f58 <_stogir.vector-lanes.compatible?+0x14c>
   10f28:      	cmp	x20, #0x1
   10f2c:      	b.lt	0x10f60 <_stogir.vector-lanes.compatible?+0x154>
   10f30:      	cmp	x20, #0xb
   10f34:      	b.gt	0x10f60 <_stogir.vector-lanes.compatible?+0x154>
   10f38:      	uxtb	w16, w1
   10f3c:      	cmp	w16, wzr
   10f40:      	b.ne	0x10f8c <_stogir.vector-lanes.compatible?+0x180>
   10f44:      	uxtb	w16, w2
   10f48:      	cmp	w16, wzr
   10f4c:      	b.ne	0x10f8c <_stogir.vector-lanes.compatible?+0x180>
   10f50:      	movn	x0, #0x0, lsl #48
   10f54:      	b	0x10fa0 <_stogir.vector-lanes.compatible?+0x194>
   10f58:      	movz	x0, #0x0, lsl #48
   10f5c:      	b	0x10f0c <_stogir.vector-lanes.compatible?+0x100>
   10f60:      	movz	x0, #0x0, lsl #48
   10f64:      	b	0x10f5c <_stogir.vector-lanes.compatible?+0x150>
   10f68:      	mov	x1, #0x1                ; =1
   10f6c:      	lsr	w0, w0, #0
   10f70:      	sxtw	x0, w0
   10f74:      	lsr	w1, w1, #0
   10f78:      	sxtw	x1, w1
   10f7c:      	cmp	x0, x1
   10f80:      	cset	w0, eq
   10f84:      	ubfx	x0, x0, #0, #8
   10f88:      	b	0x10f64 <_stogir.vector-lanes.compatible?+0x158>
   10f8c:      	cmp	x0, #0x0
   10f90:      	b.ne	0x11040 <_stogir.vector-lanes.compatible?+0x234>
   10f94:      	movz	x0, #0x0, lsl #48
   10f98:      	b	0x10fa0 <_stogir.vector-lanes.compatible?+0x194>
   10f9c:      	mov	x0, #0x1                ; =1
   10fa0:      	uxtb	w16, w1
   10fa4:      	cmp	w16, wzr
   10fa8:      	b.ne	0x10fc0 <_stogir.vector-lanes.compatible?+0x1b4>
   10fac:      	uxtb	w16, w2
   10fb0:      	cmp	w16, wzr
   10fb4:      	b.ne	0x10fc0 <_stogir.vector-lanes.compatible?+0x1b4>
   10fb8:      	movn	x1, #0x0, lsl #48
   10fbc:      	b	0x10f6c <_stogir.vector-lanes.compatible?+0x160>
   10fc0:      	cmp	x20, #0x0
   10fc4:      	b.ne	0x10fd0 <_stogir.vector-lanes.compatible?+0x1c4>
   10fc8:      	movz	x1, #0x0, lsl #48
   10fcc:      	b	0x10f6c <_stogir.vector-lanes.compatible?+0x160>
   10fd0:      	cmp	x20, #0x1
   10fd4:      	b.eq	0x10f68 <_stogir.vector-lanes.compatible?+0x15c>
   10fd8:      	cmp	x20, #0x2
   10fdc:      	b.eq	0x10f68 <_stogir.vector-lanes.compatible?+0x15c>
   10fe0:      	cmp	x20, #0x7
   10fe4:      	b.eq	0x10f68 <_stogir.vector-lanes.compatible?+0x15c>
   10fe8:      	cmp	x20, #0x8
   10fec:      	b.eq	0x10f68 <_stogir.vector-lanes.compatible?+0x15c>
   10ff0:      	cmp	x20, #0x3
   10ff4:      	b.eq	0x110b0 <_stogir.vector-lanes.compatible?+0x2a4>
   10ff8:      	cmp	x20, #0x9
   10ffc:      	b.eq	0x110b0 <_stogir.vector-lanes.compatible?+0x2a4>
   11000:      	cmp	x20, #0x4
   11004:      	b.eq	0x110c0 <_stogir.vector-lanes.compatible?+0x2b4>
   11008:      	cmp	x20, #0xa
   1100c:      	b.eq	0x110c0 <_stogir.vector-lanes.compatible?+0x2b4>
   11010:      	cmp	x20, #0xd
   11014:      	b.eq	0x110c0 <_stogir.vector-lanes.compatible?+0x2b4>
   11018:      	cmp	x20, #0x5
   1101c:      	b.eq	0x110d0 <_stogir.vector-lanes.compatible?+0x2c4>
   11020:      	cmp	x20, #0xb
   11024:      	b.eq	0x110d0 <_stogir.vector-lanes.compatible?+0x2c4>
   11028:      	cmp	x20, #0xc
   1102c:      	b.eq	0x110d0 <_stogir.vector-lanes.compatible?+0x2c4>
   11030:      	cmp	x20, #0x6
   11034:      	b.ne	0x110e0 <_stogir.vector-lanes.compatible?+0x2d4>
   11038:      	mov	x1, x21
   1103c:      	b	0x110e4 <_stogir.vector-lanes.compatible?+0x2d8>
   11040:      	cmp	x0, #0x1
   11044:      	b.eq	0x10f9c <_stogir.vector-lanes.compatible?+0x190>
   11048:      	cmp	x0, #0x2
   1104c:      	b.eq	0x10f9c <_stogir.vector-lanes.compatible?+0x190>
   11050:      	cmp	x0, #0x7
   11054:      	b.eq	0x10f9c <_stogir.vector-lanes.compatible?+0x190>
   11058:      	cmp	x0, #0x8
   1105c:      	b.eq	0x10f9c <_stogir.vector-lanes.compatible?+0x190>
   11060:      	cmp	x0, #0x3
   11064:      	b.eq	0x110b8 <_stogir.vector-lanes.compatible?+0x2ac>
   11068:      	cmp	x0, #0x9
   1106c:      	b.eq	0x110b8 <_stogir.vector-lanes.compatible?+0x2ac>
   11070:      	cmp	x0, #0x4
   11074:      	b.eq	0x110c8 <_stogir.vector-lanes.compatible?+0x2bc>
   11078:      	cmp	x0, #0xa
   1107c:      	b.eq	0x110c8 <_stogir.vector-lanes.compatible?+0x2bc>
   11080:      	cmp	x0, #0xd
   11084:      	b.eq	0x110c8 <_stogir.vector-lanes.compatible?+0x2bc>
   11088:      	cmp	x0, #0x5
   1108c:      	b.eq	0x110d8 <_stogir.vector-lanes.compatible?+0x2cc>
   11090:      	cmp	x0, #0xb
   11094:      	b.eq	0x110d8 <_stogir.vector-lanes.compatible?+0x2cc>
   11098:      	cmp	x0, #0xc
   1109c:      	b.eq	0x110d8 <_stogir.vector-lanes.compatible?+0x2cc>
   110a0:      	cmp	x0, #0x6
   110a4:      	b.ne	0x110e8 <_stogir.vector-lanes.compatible?+0x2dc>
   110a8:      	mov	x0, x21
   110ac:      	b	0x110ec <_stogir.vector-lanes.compatible?+0x2e0>
   110b0:      	mov	x1, #0x2                ; =2
   110b4:      	b	0x10f6c <_stogir.vector-lanes.compatible?+0x160>
   110b8:      	mov	x0, #0x2                ; =2
   110bc:      	b	0x10fa0 <_stogir.vector-lanes.compatible?+0x194>
   110c0:      	mov	x1, #0x4                ; =4
   110c4:      	b	0x110b4 <_stogir.vector-lanes.compatible?+0x2a8>
   110c8:      	mov	x0, #0x4                ; =4
   110cc:      	b	0x110bc <_stogir.vector-lanes.compatible?+0x2b0>
   110d0:      	mov	x1, #0x8                ; =8
   110d4:      	b	0x110c4 <_stogir.vector-lanes.compatible?+0x2b8>
   110d8:      	mov	x0, #0x8                ; =8
   110dc:      	b	0x110cc <_stogir.vector-lanes.compatible?+0x2c0>
   110e0:      	movn	x1, #0x0, lsl #48
   110e4:      	b	0x110d4 <_stogir.vector-lanes.compatible?+0x2c8>
   110e8:      	movn	x0, #0x0, lsl #48
   110ec:      	b	0x110dc <_stogir.vector-lanes.compatible?+0x2d0>

00000000000110f0 <_stogir.symbols.numeric?>:
   110f0:      	ldr	w0, [x0]
   110f4:      	uxtb	w1, w0
   110f8:      	ubfx	x0, x0, #8, #8
   110fc:      	cmp	x1, x0
   11100:      	b.ne	0x1110c <_stogir.symbols.numeric?+0x1c>
   11104:      	mov	x0, #0x1                ; =1
   11108:      	b	0x11118 <_stogir.symbols.numeric?+0x28>
   1110c:      	cmp	x1, #0x49
   11110:      	cset	w0, eq
   11114:      	ubfx	x0, x0, #0, #8
   11118:      	ret

000000000001111c <_stogir.node.constant-bits>:
   1111c:      	ldr	w1, [x0, #0x8]
   11120:      	ubfx	x1, x1, #0, #32
   11124:      	ldr	w0, [x0, #0xc]
   11128:      	ubfx	x0, x0, #0, #32
   1112c:      	lsl	x0, x0, #32
   11130:      	orr	x0, x0, x1
   11134:      	ret

0000000000011138 <_stogir.vector-comparison.valid-type?>:
   11138:      	sub	sp, sp, #0x30
   1113c:      	str	x29, [sp]
   11140:      	str	x30, [sp, #0x8]
   11144:      	mov	x29, sp
   11148:      	str	x19, [sp, #0x10]
   1114c:      	str	x20, [sp, #0x18]
   11150:      	str	x21, [sp, #0x20]
   11154:      	sxtw	x19, w0
   11158:      	cmp	x19, #0xe
   1115c:      	b.lt	0x111b4 <_stogir.vector-comparison.valid-type?+0x7c>
   11160:      	cmp	x19, #0x19
   11164:      	b.gt	0x111b4 <_stogir.vector-comparison.valid-type?+0x7c>
   11168:      	sxtw	x0, w1
   1116c:      	cmp	x0, #0xf
   11170:      	b.le	0x111d4 <_stogir.vector-comparison.valid-type?+0x9c>
   11174:      	cmp	x0, #0x80
   11178:      	b.ge	0x111d4 <_stogir.vector-comparison.valid-type?+0x9c>
   1117c:      	and	x0, x0, #0xf
   11180:      	lsr	w0, w0, #0
   11184:      	sxtw	x20, w0
   11188:      	cmp	x20, #0x1
   1118c:      	b.lt	0x111d4 <_stogir.vector-comparison.valid-type?+0x9c>
   11190:      	cmp	x20, #0xd
   11194:      	b.gt	0x111d4 <_stogir.vector-comparison.valid-type?+0x9c>
   11198:      	lsr	w21, w1, #0
   1119c:      	mov	w0, w21
   111a0:      	bl	0x111a0 <_stogir.vector-comparison.valid-type?+0x68>
		00000000000111a0:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
   111a4:      	cmp	x0, #0x0
   111a8:      	b.eq	0x111e4 <_stogir.vector-comparison.valid-type?+0xac>
   111ac:      	mov	x0, x20
   111b0:      	b	0x111e8 <_stogir.vector-comparison.valid-type?+0xb0>
   111b4:      	movz	x0, #0x0, lsl #48
   111b8:      	ldr	x19, [sp, #0x10]
   111bc:      	ldr	x20, [sp, #0x18]
   111c0:      	ldr	x21, [sp, #0x20]
   111c4:      	ldr	x29, [sp]
   111c8:      	ldr	x30, [sp, #0x8]
   111cc:      	add	sp, sp, #0x30
   111d0:      	ret
   111d4:      	movz	x0, #0x0, lsl #48
   111d8:      	b	0x111b8 <_stogir.vector-comparison.valid-type?+0x80>
   111dc:      	mov	x0, #0x1                ; =1
   111e0:      	b	0x111d8 <_stogir.vector-comparison.valid-type?+0xa0>
   111e4:      	movn	x0, #0x0, lsl #48
   111e8:      	lsr	w0, w0, #0
   111ec:      	sxtw	x0, w0
   111f0:      	cmp	x0, #0xc
   111f4:      	b.eq	0x111dc <_stogir.vector-comparison.valid-type?+0xa4>
   111f8:      	cmp	x0, #0xd
   111fc:      	b.eq	0x111dc <_stogir.vector-comparison.valid-type?+0xa4>
   11200:      	mov	w0, w21
   11204:      	bl	0x11204 <_stogir.vector-comparison.valid-type?+0xcc>
		0000000000011204:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
   11208:      	cmp	x0, #0x0
   1120c:      	b.eq	0x11220 <_stogir.vector-comparison.valid-type?+0xe8>
   11210:      	mov	x0, x20
   11214:      	b	0x11224 <_stogir.vector-comparison.valid-type?+0xec>
   11218:      	movz	x0, #0x0, lsl #48
   1121c:      	b	0x111e0 <_stogir.vector-comparison.valid-type?+0xa8>
   11220:      	movn	x0, #0x0, lsl #48
   11224:      	lsr	w0, w0, #0
   11228:      	sxtw	x0, w0
   1122c:      	cmp	x0, #0x1
   11230:      	b.lt	0x11218 <_stogir.vector-comparison.valid-type?+0xe0>
   11234:      	cmp	x0, #0xb
   11238:      	b.gt	0x11218 <_stogir.vector-comparison.valid-type?+0xe0>
   1123c:      	cmp	x19, #0x17
   11240:      	cset	w0, le
   11244:      	ubfx	x0, x0, #0, #8
   11248:      	b	0x1121c <_stogir.vector-comparison.valid-type?+0xe4>

000000000001124c <_stogir.vector-arithmetic.extrema?>:
   1124c:      	sxtw	x0, w0
   11250:      	cmp	x0, #0x3a
   11254:      	b.ne	0x11260 <_stogir.vector-arithmetic.extrema?+0x14>
   11258:      	mov	x0, #0x1                ; =1
   1125c:      	b	0x1126c <_stogir.vector-arithmetic.extrema?+0x20>
   11260:      	cmp	x0, #0x3b
   11264:      	cset	w0, eq
   11268:      	ubfx	x0, x0, #0, #8
   1126c:      	ret

0000000000011270 <_stogir.vector-arithmetic.shift?>:
   11270:      	sxtw	x0, w0
   11274:      	cmp	x0, #0x31
   11278:      	b.lt	0x1128c <_stogir.vector-arithmetic.shift?+0x1c>
   1127c:      	cmp	x0, #0x35
   11280:      	cset	w0, le
   11284:      	ubfx	x0, x0, #0, #8
   11288:      	b	0x11290 <_stogir.vector-arithmetic.shift?+0x20>
   1128c:      	movz	x0, #0x0, lsl #48
   11290:      	ret

0000000000011294 <_stogir.vector-arithmetic.valid-type?>:
   11294:      	sub	sp, sp, #0x30
   11298:      	str	x29, [sp]
   1129c:      	str	x30, [sp, #0x8]
   112a0:      	mov	x29, sp
   112a4:      	str	x19, [sp, #0x10]
   112a8:      	str	x20, [sp, #0x18]
   112ac:      	str	x21, [sp, #0x20]
   112b0:      	str	x22, [sp, #0x28]
   112b4:      	lsr	w2, w1, #0
   112b8:      	sxtw	x19, w1
   112bc:      	mov	w20, w0
   112c0:      	mov	w0, w2
   112c4:      	bl	0x112c4 <_stogir.vector-arithmetic.valid-type?+0x30>
		00000000000112c4:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
   112c8:      	and	x1, x19, #0xf
   112cc:      	lsr	w1, w1, #0
   112d0:      	sxtw	x1, w1
   112d4:      	cmp	x0, #0x0
   112d8:      	b.eq	0x112e4 <_stogir.vector-arithmetic.valid-type?+0x50>
   112dc:      	mov	x0, x1
   112e0:      	b	0x112e8 <_stogir.vector-arithmetic.valid-type?+0x54>
   112e4:      	movn	x0, #0x0, lsl #48
   112e8:      	cmp	x19, #0xf
   112ec:      	b.le	0x114a4 <_stogir.vector-arithmetic.valid-type?+0x210>
   112f0:      	cmp	x19, #0x80
   112f4:      	b.ge	0x114a4 <_stogir.vector-arithmetic.valid-type?+0x210>
   112f8:      	cmp	x1, #0x1
   112fc:      	b.lt	0x114a4 <_stogir.vector-arithmetic.valid-type?+0x210>
   11300:      	cmp	x1, #0xd
   11304:      	b.gt	0x114a4 <_stogir.vector-arithmetic.valid-type?+0x210>
   11308:      	sxtw	x1, w20
   1130c:      	cmp	x1, #0x1f
   11310:      	cset	w2, eq
   11314:      	cmp	x1, #0x20
   11318:      	cset	w3, eq
   1131c:      	cmp	x1, #0x2e
   11320:      	cset	w4, eq
   11324:      	cmp	x1, #0x2f
   11328:      	cset	w5, eq
   1132c:      	cmp	x1, #0x30
   11330:      	cset	w6, eq
   11334:      	cmp	x1, #0x1e
   11338:      	cset	w19, eq
   1133c:      	cmp	x1, #0x2d
   11340:      	cset	w7, eq
   11344:      	cmp	x1, #0x36
   11348:      	cset	w8, eq
   1134c:      	cmp	x1, #0x37
   11350:      	cset	w9, eq
   11354:      	cmp	x1, #0x38
   11358:      	cset	w10, eq
   1135c:      	cmp	x1, #0x39
   11360:      	cset	w11, eq
   11364:      	cmp	x1, #0x31
   11368:      	cset	w12, ge
   1136c:      	cmp	x1, #0x35
   11370:      	cset	w13, le
   11374:      	uxtb	w16, w2
   11378:      	cmp	w16, wzr
   1137c:      	b.ne	0x113f0 <_stogir.vector-arithmetic.valid-type?+0x15c>
   11380:      	uxtb	w16, w3
   11384:      	cmp	w16, wzr
   11388:      	b.ne	0x113f0 <_stogir.vector-arithmetic.valid-type?+0x15c>
   1138c:      	uxtb	w16, w7
   11390:      	cmp	w16, wzr
   11394:      	b.ne	0x113f0 <_stogir.vector-arithmetic.valid-type?+0x15c>
   11398:      	uxtb	w16, w8
   1139c:      	cmp	w16, wzr
   113a0:      	b.ne	0x113f0 <_stogir.vector-arithmetic.valid-type?+0x15c>
   113a4:      	uxtb	w16, w9
   113a8:      	cmp	w16, wzr
   113ac:      	b.ne	0x113f0 <_stogir.vector-arithmetic.valid-type?+0x15c>
   113b0:      	uxtb	w16, w10
   113b4:      	cmp	w16, wzr
   113b8:      	b.ne	0x113f0 <_stogir.vector-arithmetic.valid-type?+0x15c>
   113bc:      	uxtb	w16, w11
   113c0:      	cmp	w16, wzr
   113c4:      	b.ne	0x113f0 <_stogir.vector-arithmetic.valid-type?+0x15c>
   113c8:      	cmp	x1, #0x3a
   113cc:      	b.eq	0x113f0 <_stogir.vector-arithmetic.valid-type?+0x15c>
   113d0:      	cmp	x1, #0x3b
   113d4:      	b.eq	0x113f0 <_stogir.vector-arithmetic.valid-type?+0x15c>
   113d8:      	uxtb	w16, w12
   113dc:      	cmp	w16, wzr
   113e0:      	b.eq	0x1168c <_stogir.vector-arithmetic.valid-type?+0x3f8>
   113e4:      	uxtb	w16, w13
   113e8:      	cmp	w16, wzr
   113ec:      	b.eq	0x1168c <_stogir.vector-arithmetic.valid-type?+0x3f8>
   113f0:      	lsr	w0, w0, #0
   113f4:      	sxtw	x1, w0
   113f8:      	cmp	x1, #0x1
   113fc:      	cset	w21, eq
   11400:      	cmp	x1, #0x1
   11404:      	cset	w14, ge
   11408:      	cmp	x1, #0xb
   1140c:      	cset	w15, le
   11410:      	uxtb	w16, w2
   11414:      	cmp	w16, wzr
   11418:      	b.ne	0x114d4 <_stogir.vector-arithmetic.valid-type?+0x240>
   1141c:      	uxtb	w16, w3
   11420:      	cmp	w16, wzr
   11424:      	b.ne	0x114d4 <_stogir.vector-arithmetic.valid-type?+0x240>
   11428:      	uxtb	w16, w7
   1142c:      	cmp	w16, wzr
   11430:      	b.ne	0x114d4 <_stogir.vector-arithmetic.valid-type?+0x240>
   11434:      	uxtb	w16, w8
   11438:      	cmp	w16, wzr
   1143c:      	b.ne	0x114d4 <_stogir.vector-arithmetic.valid-type?+0x240>
   11440:      	uxtb	w16, w9
   11444:      	cmp	w16, wzr
   11448:      	b.ne	0x114d4 <_stogir.vector-arithmetic.valid-type?+0x240>
   1144c:      	uxtb	w16, w10
   11450:      	cmp	w16, wzr
   11454:      	b.ne	0x114d4 <_stogir.vector-arithmetic.valid-type?+0x240>
   11458:      	uxtb	w16, w11
   1145c:      	cmp	w16, wzr
   11460:      	b.ne	0x114d4 <_stogir.vector-arithmetic.valid-type?+0x240>
   11464:      	uxtb	w16, w12
   11468:      	cmp	w16, wzr
   1146c:      	b.eq	0x1161c <_stogir.vector-arithmetic.valid-type?+0x388>
   11470:      	uxtb	w16, w13
   11474:      	cmp	w16, wzr
   11478:      	b.eq	0x1161c <_stogir.vector-arithmetic.valid-type?+0x388>
   1147c:      	uxtb	w16, w14
   11480:      	cmp	w16, wzr
   11484:      	b.eq	0x11674 <_stogir.vector-arithmetic.valid-type?+0x3e0>
   11488:      	uxtb	w16, w15
   1148c:      	cmp	w16, wzr
   11490:      	b.eq	0x11674 <_stogir.vector-arithmetic.valid-type?+0x3e0>
   11494:      	uxtb	w16, w21
   11498:      	cmp	w16, wzr
   1149c:      	cset	x0, eq
   114a0:      	b	0x11678 <_stogir.vector-arithmetic.valid-type?+0x3e4>
   114a4:      	movz	x0, #0x0, lsl #48
   114a8:      	ldr	x19, [sp, #0x10]
   114ac:      	ldr	x20, [sp, #0x18]
   114b0:      	ldr	x21, [sp, #0x20]
   114b4:      	ldr	x22, [sp, #0x28]
   114b8:      	ldr	x29, [sp]
   114bc:      	ldr	x30, [sp, #0x8]
   114c0:      	add	sp, sp, #0x30
   114c4:      	ret
   114c8:      	ubfx	x3, x3, #0, #8
   114cc:      	mov	x0, x3
   114d0:      	b	0x114a8 <_stogir.vector-arithmetic.valid-type?+0x214>
   114d4:      	uxtb	w16, w2
   114d8:      	cmp	w16, wzr
   114dc:      	b.ne	0x11528 <_stogir.vector-arithmetic.valid-type?+0x294>
   114e0:      	uxtb	w16, w3
   114e4:      	cmp	w16, wzr
   114e8:      	b.ne	0x11528 <_stogir.vector-arithmetic.valid-type?+0x294>
   114ec:      	uxtb	w16, w7
   114f0:      	cmp	w16, wzr
   114f4:      	b.ne	0x11528 <_stogir.vector-arithmetic.valid-type?+0x294>
   114f8:      	uxtb	w16, w8
   114fc:      	cmp	w16, wzr
   11500:      	b.ne	0x11528 <_stogir.vector-arithmetic.valid-type?+0x294>
   11504:      	uxtb	w16, w9
   11508:      	cmp	w16, wzr
   1150c:      	b.ne	0x11528 <_stogir.vector-arithmetic.valid-type?+0x294>
   11510:      	uxtb	w16, w10
   11514:      	cmp	w16, wzr
   11518:      	b.ne	0x11528 <_stogir.vector-arithmetic.valid-type?+0x294>
   1151c:      	uxtb	w16, w11
   11520:      	cmp	w16, wzr
   11524:      	b.eq	0x11588 <_stogir.vector-arithmetic.valid-type?+0x2f4>
   11528:      	uxtb	w16, w14
   1152c:      	cmp	w16, wzr
   11530:      	b.eq	0x11588 <_stogir.vector-arithmetic.valid-type?+0x2f4>
   11534:      	uxtb	w16, w15
   11538:      	cmp	w16, wzr
   1153c:      	b.eq	0x11588 <_stogir.vector-arithmetic.valid-type?+0x2f4>
   11540:      	uxtb	w16, w7
   11544:      	cmp	w16, wzr
   11548:      	b.ne	0x115b4 <_stogir.vector-arithmetic.valid-type?+0x320>
   1154c:      	uxtb	w16, w21
   11550:      	cmp	w16, wzr
   11554:      	b.ne	0x11588 <_stogir.vector-arithmetic.valid-type?+0x2f4>
   11558:      	cmp	x1, #0x6
   1155c:      	cset	w0, eq
   11560:      	uxtb	w16, w2
   11564:      	cmp	w16, wzr
   11568:      	b.eq	0x115bc <_stogir.vector-arithmetic.valid-type?+0x328>
   1156c:      	uxtb	w16, w0
   11570:      	cmp	w16, wzr
   11574:      	cset	x0, eq
   11578:      	b	0x11580 <_stogir.vector-arithmetic.valid-type?+0x2ec>
   1157c:      	mov	x0, #0x1                ; =1
   11580:      	cmp	x0, #0x0
   11584:      	b.ne	0x115b4 <_stogir.vector-arithmetic.valid-type?+0x320>
   11588:      	cmp	x1, #0xc
   1158c:      	b.eq	0x115a0 <_stogir.vector-arithmetic.valid-type?+0x30c>
   11590:      	cmp	x1, #0xd
   11594:      	b.eq	0x115a0 <_stogir.vector-arithmetic.valid-type?+0x30c>
   11598:      	movz	x0, #0x0, lsl #48
   1159c:      	b	0x114d0 <_stogir.vector-arithmetic.valid-type?+0x23c>
   115a0:      	uxtb	w16, w2
   115a4:      	cmp	w16, wzr
   115a8:      	b.eq	0x114c8 <_stogir.vector-arithmetic.valid-type?+0x234>
   115ac:      	mov	x0, #0x1                ; =1
   115b0:      	b	0x114d0 <_stogir.vector-arithmetic.valid-type?+0x23c>
   115b4:      	mov	x0, #0x1                ; =1
   115b8:      	b	0x114d0 <_stogir.vector-arithmetic.valid-type?+0x23c>
   115bc:      	uxtb	w16, w3
   115c0:      	cmp	w16, wzr
   115c4:      	b.eq	0x115e4 <_stogir.vector-arithmetic.valid-type?+0x350>
   115c8:      	cmp	x1, #0x7
   115cc:      	b.lt	0x115dc <_stogir.vector-arithmetic.valid-type?+0x348>
   115d0:      	ubfx	x15, x15, #0, #8
   115d4:      	mov	x0, x15
   115d8:      	b	0x115e0 <_stogir.vector-arithmetic.valid-type?+0x34c>
   115dc:      	movz	x0, #0x0, lsl #48
   115e0:      	b	0x11580 <_stogir.vector-arithmetic.valid-type?+0x2ec>
   115e4:      	uxtb	w16, w8
   115e8:      	cmp	w16, wzr
   115ec:      	b.eq	0x1157c <_stogir.vector-arithmetic.valid-type?+0x2e8>
   115f0:      	cmp	x1, #0x3
   115f4:      	b.ne	0x11664 <_stogir.vector-arithmetic.valid-type?+0x3d0>
   115f8:      	mov	x0, #0x1                ; =1
   115fc:      	b	0x11618 <_stogir.vector-arithmetic.valid-type?+0x384>
   11600:      	mov	w0, w22
   11604:      	bl	0x11604 <_stogir.vector-arithmetic.valid-type?+0x370>
		0000000000011604:  ARM64_RELOC_BRANCH26	_stogir.types.integer?
   11608:      	b	0x114d0 <_stogir.vector-arithmetic.valid-type?+0x23c>
   1160c:      	cmp	x1, #0xb
   11610:      	cset	w0, eq
   11614:      	ubfx	x0, x0, #0, #8
   11618:      	b	0x11580 <_stogir.vector-arithmetic.valid-type?+0x2ec>
   1161c:      	lsr	w22, w0, #0
   11620:      	uxtb	w16, w4
   11624:      	cmp	w16, wzr
   11628:      	b.ne	0x11600 <_stogir.vector-arithmetic.valid-type?+0x36c>
   1162c:      	uxtb	w16, w5
   11630:      	cmp	w16, wzr
   11634:      	b.ne	0x11600 <_stogir.vector-arithmetic.valid-type?+0x36c>
   11638:      	uxtb	w16, w6
   1163c:      	cmp	w16, wzr
   11640:      	b.ne	0x11600 <_stogir.vector-arithmetic.valid-type?+0x36c>
   11644:      	mov	w0, w22
   11648:      	bl	0x11648 <_stogir.vector-arithmetic.valid-type?+0x3b4>
		0000000000011648:  ARM64_RELOC_BRANCH26	_stogir.types.floating?
   1164c:      	cmp	x0, #0x0
   11650:      	b.eq	0x11710 <_stogir.vector-arithmetic.valid-type?+0x47c>
   11654:      	uxtb	w16, w19
   11658:      	cmp	w16, wzr
   1165c:      	cset	x0, eq
   11660:      	b	0x116fc <_stogir.vector-arithmetic.valid-type?+0x468>
   11664:      	cmp	x1, #0x4
   11668:      	b.ne	0x1167c <_stogir.vector-arithmetic.valid-type?+0x3e8>
   1166c:      	mov	x0, #0x1                ; =1
   11670:      	b	0x11618 <_stogir.vector-arithmetic.valid-type?+0x384>
   11674:      	movz	x0, #0x0, lsl #48
   11678:      	b	0x11608 <_stogir.vector-arithmetic.valid-type?+0x374>
   1167c:      	cmp	x1, #0x5
   11680:      	b.ne	0x116e4 <_stogir.vector-arithmetic.valid-type?+0x450>
   11684:      	mov	x0, #0x1                ; =1
   11688:      	b	0x11618 <_stogir.vector-arithmetic.valid-type?+0x384>
   1168c:      	cmp	x1, #0x1a
   11690:      	b.eq	0x113f0 <_stogir.vector-arithmetic.valid-type?+0x15c>
   11694:      	cmp	x1, #0x1b
   11698:      	b.eq	0x113f0 <_stogir.vector-arithmetic.valid-type?+0x15c>
   1169c:      	cmp	x1, #0x1c
   116a0:      	b.eq	0x113f0 <_stogir.vector-arithmetic.valid-type?+0x15c>
   116a4:      	cmp	x1, #0x1d
   116a8:      	b.eq	0x113f0 <_stogir.vector-arithmetic.valid-type?+0x15c>
   116ac:      	uxtb	w16, w19
   116b0:      	cmp	w16, wzr
   116b4:      	b.ne	0x113f0 <_stogir.vector-arithmetic.valid-type?+0x15c>
   116b8:      	uxtb	w16, w4
   116bc:      	cmp	w16, wzr
   116c0:      	b.ne	0x113f0 <_stogir.vector-arithmetic.valid-type?+0x15c>
   116c4:      	uxtb	w16, w5
   116c8:      	cmp	w16, wzr
   116cc:      	b.ne	0x113f0 <_stogir.vector-arithmetic.valid-type?+0x15c>
   116d0:      	uxtb	w16, w6
   116d4:      	cmp	w16, wzr
   116d8:      	b.ne	0x113f0 <_stogir.vector-arithmetic.valid-type?+0x15c>
   116dc:      	movz	x0, #0x0, lsl #48
   116e0:      	b	0x114d0 <_stogir.vector-arithmetic.valid-type?+0x23c>
   116e4:      	uxtb	w16, w0
   116e8:      	cmp	w16, wzr
   116ec:      	b.eq	0x11700 <_stogir.vector-arithmetic.valid-type?+0x46c>
   116f0:      	mov	x0, #0x1                ; =1
   116f4:      	b	0x11618 <_stogir.vector-arithmetic.valid-type?+0x384>
   116f8:      	movz	x0, #0x0, lsl #48
   116fc:      	b	0x11608 <_stogir.vector-arithmetic.valid-type?+0x374>
   11700:      	cmp	x1, #0x9
   11704:      	b.ne	0x1173c <_stogir.vector-arithmetic.valid-type?+0x4a8>
   11708:      	mov	x0, #0x1                ; =1
   1170c:      	b	0x11618 <_stogir.vector-arithmetic.valid-type?+0x384>
   11710:      	mov	w0, w22
   11714:      	bl	0x11714 <_stogir.vector-arithmetic.valid-type?+0x480>
		0000000000011714:  ARM64_RELOC_BRANCH26	_stogir.types.integer?
   11718:      	cmp	x0, #0x0
   1171c:      	b.eq	0x116f8 <_stogir.vector-arithmetic.valid-type?+0x464>
   11720:      	uxtb	w16, w21
   11724:      	cmp	w16, wzr
   11728:      	b.eq	0x1174c <_stogir.vector-arithmetic.valid-type?+0x4b8>
   1172c:      	lsr	w20, w20, #0
   11730:      	mov	w0, w20
   11734:      	bl	0x11734 <_stogir.vector-arithmetic.valid-type?+0x4a0>
		0000000000011734:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.extrema?
   11738:      	b	0x11750 <_stogir.vector-arithmetic.valid-type?+0x4bc>
   1173c:      	cmp	x1, #0xa
   11740:      	b.ne	0x1160c <_stogir.vector-arithmetic.valid-type?+0x378>
   11744:      	mov	x0, #0x1                ; =1
   11748:      	b	0x11618 <_stogir.vector-arithmetic.valid-type?+0x384>
   1174c:      	mov	x0, #0x1                ; =1
   11750:      	b	0x116fc <_stogir.vector-arithmetic.valid-type?+0x468>

0000000000011754 <_coil.core.Len$slice$len__i32>:
   11754:      	mov	x0, x1
   11758:      	ret

000000000001175c <_inherent$slice$data__i32>:
   1175c:      	ret

0000000000011760 <_stogir.opcode.terminator?>:
   11760:      	sxtw	x0, w0
   11764:      	cmp	x0, #0x0
   11768:      	b.lt	0x11790 <_stogir.opcode.terminator?+0x30>
   1176c:      	cmp	x0, #0x83
   11770:      	b.ge	0x11790 <_stogir.opcode.terminator?+0x30>
   11774:      	adrp	x16, 0x11000 <_stogir.vector-lanes.compatible?+0x1f4>
		0000000000011774:  ARM64_RELOC_PAGE21	l_stogir.508
   11778:      	ldr	x16, [x16]
		0000000000011778:  ARM64_RELOC_PAGEOFF12	l_stogir.508
   1177c:      	orr	x1, x16, xzr
   11780:      	lsr	x0, x0, #0
   11784:      	add	x0, x0, x1
   11788:      	ldrb	w0, [x0]
   1178c:      	b	0x11794 <_stogir.opcode.terminator?+0x34>
   11790:      	movz	x0, #0x0, lsl #48
   11794:      	uxtb	w0, w0
   11798:      	and	x0, x0, #0x8
   1179c:      	uxtb	w0, w0
   117a0:      	cmp	x0, #0x0
   117a4:      	cset	w0, eq
   117a8:      	uxtb	w16, w0
   117ac:      	cmp	w16, wzr
   117b0:      	cset	x0, eq
   117b4:      	ret

00000000000117b8 <_stogir.switch.sign-mask>:
   117b8:      	sxtw	x0, w0
   117bc:      	cmp	x0, #0x7
   117c0:      	b.lt	0x117dc <_stogir.switch.sign-mask+0x24>
   117c4:      	cmp	x0, #0xb
   117c8:      	b.gt	0x117dc <_stogir.switch.sign-mask+0x24>
   117cc:      	cmp	x0, #0x0
   117d0:      	b.ne	0x11814 <_stogir.switch.sign-mask+0x5c>
   117d4:      	movz	x0, #0x0, lsl #48
   117d8:      	b	0x117e8 <_stogir.switch.sign-mask+0x30>
   117dc:      	movz	x0, #0x0, lsl #48
   117e0:      	ret
   117e4:      	mov	x0, #0x1                ; =1
   117e8:      	lsr	w0, w0, #0
   117ec:      	sxtw	x0, w0
   117f0:      	lsl	x0, x0, #3
   117f4:      	lsr	w0, w0, #0
   117f8:      	sxtw	x0, w0
   117fc:      	sub	x0, x0, #0x1
   11800:      	lsr	w0, w0, #0
   11804:      	sxtw	x0, w0
   11808:      	mov	x16, #0x1               ; =1
   1180c:      	lsl	x0, x16, x0
   11810:      	b	0x117e0 <_stogir.switch.sign-mask+0x28>
   11814:      	cmp	x0, #0x1
   11818:      	b.eq	0x117e4 <_stogir.switch.sign-mask+0x2c>
   1181c:      	cmp	x0, #0x2
   11820:      	b.eq	0x117e4 <_stogir.switch.sign-mask+0x2c>
   11824:      	cmp	x0, #0x7
   11828:      	b.eq	0x117e4 <_stogir.switch.sign-mask+0x2c>
   1182c:      	cmp	x0, #0x8
   11830:      	b.eq	0x117e4 <_stogir.switch.sign-mask+0x2c>
   11834:      	cmp	x0, #0x3
   11838:      	b.eq	0x11894 <_stogir.switch.sign-mask+0xdc>
   1183c:      	cmp	x0, #0x9
   11840:      	b.eq	0x11894 <_stogir.switch.sign-mask+0xdc>
   11844:      	cmp	x0, #0x4
   11848:      	b.eq	0x1189c <_stogir.switch.sign-mask+0xe4>
   1184c:      	cmp	x0, #0xa
   11850:      	b.eq	0x1189c <_stogir.switch.sign-mask+0xe4>
   11854:      	cmp	x0, #0xd
   11858:      	b.eq	0x1189c <_stogir.switch.sign-mask+0xe4>
   1185c:      	cmp	x0, #0x5
   11860:      	b.eq	0x118a4 <_stogir.switch.sign-mask+0xec>
   11864:      	cmp	x0, #0xb
   11868:      	b.eq	0x118a4 <_stogir.switch.sign-mask+0xec>
   1186c:      	cmp	x0, #0xc
   11870:      	b.eq	0x118a4 <_stogir.switch.sign-mask+0xec>
   11874:      	cmp	x0, #0x6
   11878:      	cset	w0, eq
   1187c:      	uxtb	w16, w0
   11880:      	cmp	w16, wzr
   11884:      	mov	x16, #0x8               ; =8
   11888:      	movn	x17, #0x0, lsl #48
   1188c:      	csel	x0, x16, x17, ne
   11890:      	b	0x118a8 <_stogir.switch.sign-mask+0xf0>
   11894:      	mov	x0, #0x2                ; =2
   11898:      	b	0x117e8 <_stogir.switch.sign-mask+0x30>
   1189c:      	mov	x0, #0x4                ; =4
   118a0:      	b	0x11898 <_stogir.switch.sign-mask+0xe0>
   118a4:      	mov	x0, #0x8                ; =8
   118a8:      	b	0x118a0 <_stogir.switch.sign-mask+0xe8>
