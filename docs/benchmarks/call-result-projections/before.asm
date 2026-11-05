
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-call-result-projections/build/projections-verifier/before.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_verify_graph>:
       0:      	sub	sp, sp, #0x1e0
       4:      	str	x29, [sp]
       8:      	str	x30, [sp, #0x8]
       c:      	mov	x29, sp
      10:      	str	x19, [sp, #0x1d0]
      14:      	add	x8, sp, #0x10
      18:      	mov	x19, x0
      1c:      	mov	x1, #0x8                ; =8
      20:      	bl	0x20 <_gap_verify_graph+0x20>
		0000000000000020:  ARM64_RELOC_BRANCH26	_stogir.verify.integer-operations-target
      24:      	add	x16, sp, #0x10
      28:      	ldr	w0, [x16]
      2c:      	lsr	x16, x0, #0
      30:      	cmp	x16, #0x1
      34:      	b.eq	0x50 <_gap_verify_graph+0x50>
      38:      	b.lo	0x40 <_gap_verify_graph+0x40>
      3c:      	b	0x54 <_gap_verify_graph+0x54>
      40:      	cmp	x16, #0x0
      44:      	b.eq	0x4c <_gap_verify_graph+0x4c>
      48:      	b	0x54 <_gap_verify_graph+0x54>
      4c:      	b	0x60 <_gap_verify_graph+0x60>
      50:      	b	0x58 <_gap_verify_graph+0x58>
      54:      	b	0x8c <_gap_verify_graph+0x8c>
      58:      	movn	x0, #0x0, lsl #48
      5c:      	b	0x78 <_gap_verify_graph+0x78>
      60:      	add	x0, sp, #0x30
      64:      	mov	x1, x19
      68:      	mov	x2, #0x1a0              ; =416
      6c:      	bl	0x6c <_gap_verify_graph+0x6c>
		000000000000006c:  ARM64_RELOC_BRANCH26	_memmove
      70:      	add	x16, sp, #0x30
      74:      	ldr	x0, [x16, #0x8]
      78:      	ldr	x19, [sp, #0x1d0]
      7c:      	ldr	x29, [sp]
      80:      	ldr	x30, [sp, #0x8]
      84:      	add	sp, sp, #0x1e0
      88:      	ret
      8c:      	brk	#0
      90:      	b	0x8c <_gap_verify_graph+0x8c>

0000000000000094 <_stogir.verify.integer-operations-target>:
      94:      	sub	sp, sp, #0x70
      98:      	str	x29, [sp]
      9c:      	str	x30, [sp, #0x8]
      a0:      	mov	x29, sp
      a4:      	str	x19, [sp, #0x50]
      a8:      	str	x20, [sp, #0x58]
      ac:      	str	x21, [sp, #0x60]
      b0:      	mov	x19, x8
      b4:      	add	x8, sp, #0x10
      b8:      	mov	x20, x0
      bc:      	mov	w21, w1
      c0:      	bl	0xc0 <_stogir.verify.integer-operations-target+0x2c>
		00000000000000c0:  ARM64_RELOC_BRANCH26	_stogir.verify.structure
      c4:      	add	x16, sp, #0x10
      c8:      	ldr	w0, [x16]
      cc:      	lsr	x16, x0, #0
      d0:      	cmp	x16, #0x1
      d4:      	b.eq	0xf0 <_stogir.verify.integer-operations-target+0x5c>
      d8:      	b.lo	0xe0 <_stogir.verify.integer-operations-target+0x4c>
      dc:      	b	0xf4 <_stogir.verify.integer-operations-target+0x60>
      e0:      	cmp	x16, #0x0
      e4:      	b.eq	0xec <_stogir.verify.integer-operations-target+0x58>
      e8:      	b	0xf4 <_stogir.verify.integer-operations-target+0x60>
      ec:      	b	0x118 <_stogir.verify.integer-operations-target+0x84>
      f0:      	b	0xf8 <_stogir.verify.integer-operations-target+0x64>
      f4:      	b	0x168 <_stogir.verify.integer-operations-target+0xd4>
      f8:      	add	x16, sp, #0x10
      fc:      	orr	x0, x16, xzr
     100:      	add	x0, x0, #0x8
     104:      	add	x16, sp, #0x10
     108:      	ldr	x1, [x16, #0x8]
     10c:      	ldr	x0, [x0, #0x8]
     110:      	mov	x2, #0x1                ; =1
     114:      	b	0x140 <_stogir.verify.integer-operations-target+0xac>
     118:      	add	x8, sp, #0x30
     11c:      	mov	x0, x20
     120:      	mov	w1, w21
     124:      	bl	0x124 <_stogir.verify.integer-operations-target+0x90>
		0000000000000124:  ARM64_RELOC_BRANCH26	_stogir.verify.integer-operations-target-structured
     128:      	add	x16, sp, #0x30
     12c:      	ldr	x2, [x16]
     130:      	add	x16, sp, #0x30
     134:      	ldr	x1, [x16, #0x8]
     138:      	add	x16, sp, #0x30
     13c:      	ldr	x0, [x16, #0x10]
     140:      	str	x2, [x19]
     144:      	str	x1, [x19, #0x8]
     148:      	str	x0, [x19, #0x10]
     14c:      	ldr	x19, [sp, #0x50]
     150:      	ldr	x20, [sp, #0x58]
     154:      	ldr	x21, [sp, #0x60]
     158:      	ldr	x29, [sp]
     15c:      	ldr	x30, [sp, #0x8]
     160:      	add	sp, sp, #0x70
     164:      	ret
     168:      	brk	#0
     16c:      	b	0x168 <_stogir.verify.integer-operations-target+0xd4>

0000000000000170 <_stogir.verify.structure>:
     170:      	sub	sp, sp, #0x1a0
     174:      	str	x29, [sp, #0x10]
     178:      	str	x30, [sp, #0x18]
     17c:      	add	x29, sp, #0x10
     180:      	str	x19, [sp, #0x150]
     184:      	str	x20, [sp, #0x158]
     188:      	str	x21, [sp, #0x160]
     18c:      	str	x22, [sp, #0x168]
     190:      	str	x23, [sp, #0x170]
     194:      	str	x24, [sp, #0x178]
     198:      	str	x25, [sp, #0x180]
     19c:      	str	x26, [sp, #0x188]
     1a0:      	str	x27, [sp, #0x190]
     1a4:      	str	x28, [sp, #0x198]
     1a8:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000001a8:  ARM64_RELOC_PAGE21	l_stogir.311
     1ac:      	ldr	x16, [x16]
		00000000000001ac:  ARM64_RELOC_PAGEOFF12	l_stogir.311
     1b0:      	orr	x19, x16, xzr
     1b4:      	add	x1, x0, #0x78
     1b8:      	ldr	x2, [x0, #0x8]
     1bc:      	ldr	x1, [x1, #0x8]
     1c0:      	cmp	x2, x1
     1c4:      	b.ne	0x1f0 <_stogir.verify.structure+0x80>
     1c8:      	mov	x20, x19
     1cc:      	movz	x21, #0x0, lsl #48
     1d0:      	b	0x200 <_stogir.verify.structure+0x90>
     1d4:      	ldr	x1, [sp, #0x128]
     1d8:      	ldr	x6, [sp, #0x130]
     1dc:      	add	x6, x1, x6
     1e0:      	ldr	x19, [sp, #0xd8]
     1e4:      	add	x1, x19, #0x1
     1e8:      	sxtw	x19, w1
     1ec:      	b	0x2d8 <_stogir.verify.structure+0x168>
     1f0:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000001f0:  ARM64_RELOC_PAGE21	l_stogir.312
     1f4:      	ldr	x16, [x16]
		00000000000001f4:  ARM64_RELOC_PAGEOFF12	l_stogir.312
     1f8:      	orr	x20, x16, xzr
     1fc:      	mov	x21, #0x2c              ; =44
     200:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000200:  ARM64_RELOC_PAGE21	l_stogir.313
     204:      	ldr	x16, [x16]
		0000000000000204:  ARM64_RELOC_PAGEOFF12	l_stogir.313
     208:      	orr	x22, x16, xzr
     20c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000020c:  ARM64_RELOC_PAGE21	l_stogir.314
     210:      	ldr	x16, [x16]
		0000000000000210:  ARM64_RELOC_PAGEOFF12	l_stogir.314
     214:      	orr	x23, x16, xzr
     218:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000218:  ARM64_RELOC_PAGE21	l_stogir.315
     21c:      	ldr	x16, [x16]
		000000000000021c:  ARM64_RELOC_PAGEOFF12	l_stogir.315
     220:      	orr	x24, x16, xzr
     224:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000224:  ARM64_RELOC_PAGE21	l_stogir.316
     228:      	ldr	x16, [x16]
		0000000000000228:  ARM64_RELOC_PAGEOFF12	l_stogir.316
     22c:      	orr	x25, x16, xzr
     230:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000230:  ARM64_RELOC_PAGE21	l_stogir.317
     234:      	ldr	x16, [x16]
		0000000000000234:  ARM64_RELOC_PAGEOFF12	l_stogir.317
     238:      	orr	x26, x16, xzr
     23c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000023c:  ARM64_RELOC_PAGE21	l_stogir.318
     240:      	ldr	x16, [x16]
		0000000000000240:  ARM64_RELOC_PAGEOFF12	l_stogir.318
     244:      	orr	x27, x16, xzr
     248:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000248:  ARM64_RELOC_PAGE21	l_stogir.319
     24c:      	ldr	x16, [x16]
		000000000000024c:  ARM64_RELOC_PAGEOFF12	l_stogir.319
     250:      	orr	x28, x16, xzr
     254:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000254:  ARM64_RELOC_PAGE21	l_stogir.320
     258:      	ldr	x16, [x16]
		0000000000000258:  ARM64_RELOC_PAGEOFF12	l_stogir.320
     25c:      	orr	x1, x16, xzr
     260:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000260:  ARM64_RELOC_PAGE21	l_stogir.321
     264:      	ldr	x16, [x16]
		0000000000000264:  ARM64_RELOC_PAGEOFF12	l_stogir.321
     268:      	orr	x2, x16, xzr
     26c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000026c:  ARM64_RELOC_PAGE21	l_stogir.322
     270:      	ldr	x16, [x16]
		0000000000000270:  ARM64_RELOC_PAGEOFF12	l_stogir.322
     274:      	orr	x3, x16, xzr
     278:      	add	x4, x0, #0x110
     27c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000027c:  ARM64_RELOC_PAGE21	l_stogir.323
     280:      	ldr	x16, [x16]
		0000000000000280:  ARM64_RELOC_PAGEOFF12	l_stogir.323
     284:      	orr	x5, x16, xzr
     288:      	add	x6, x0, #0x78
     28c:      	add	x7, x0, #0x28
     290:      	add	x9, x0, #0x50
     294:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000294:  ARM64_RELOC_PAGE21	l_stogir.323
     298:      	ldr	x16, [x16]
		0000000000000298:  ARM64_RELOC_PAGEOFF12	l_stogir.323
     29c:      	orr	x10, x16, xzr
     2a0:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000002a0:  ARM64_RELOC_PAGE21	l_stogir.324
     2a4:      	ldr	x16, [x16]
		00000000000002a4:  ARM64_RELOC_PAGEOFF12	l_stogir.324
     2a8:      	orr	x11, x16, xzr
     2ac:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000002ac:  ARM64_RELOC_PAGE21	l_stogir.324
     2b0:      	ldr	x16, [x16]
		00000000000002b0:  ARM64_RELOC_PAGEOFF12	l_stogir.324
     2b4:      	orr	x12, x16, xzr
     2b8:      	add	x13, x4, #0x28
     2bc:      	mov	x14, #0x1               ; =1
     2c0:      	movz	x15, #0x0, lsl #48
     2c4:      	b	0x3b4 <_stogir.verify.structure+0x244>
     2c8:      	ldr	x17, [sp, #0x70]
     2cc:      	str	x17, [sp, #0xb8]
     2d0:      	mov	x16, #0x16              ; =22
     2d4:      	str	x16, [sp, #0x120]
     2d8:      	b	0x34c <_stogir.verify.structure+0x1dc>
     2dc:      	nop
     2e0:      	str	x8, [sp, #0xb0]
     2e4:      	str	x19, [sp, #0x50]
     2e8:      	mov	x19, x15
     2ec:      	str	x22, [sp, #0x68]
     2f0:      	str	x23, [sp, #0x70]
     2f4:      	ldr	x23, [sp, #0x38]
     2f8:      	str	x24, [sp, #0x88]
     2fc:      	str	x25, [sp, #0x90]
     300:      	str	x26, [sp, #0x98]
     304:      	str	x27, [sp, #0xa0]
     308:      	str	x28, [sp, #0xa8]
     30c:      	str	x2, [sp, #0x78]
     310:      	str	x3, [sp, #0x80]
     314:      	mov	x3, x4
     318:      	str	x5, [sp, #0xf8]
     31c:      	mov	x0, x13
     320:      	mov	x2, x6
     324:      	mov	x6, x14
     328:      	mov	x4, x7
     32c:      	mov	x5, x9
     330:      	str	x10, [sp, #0xf0]
     334:      	str	x11, [sp, #0x110]
     338:      	str	x12, [sp, #0x118]
     33c:      	ldr	x17, [sp, #0x68]
     340:      	str	x17, [sp, #0xb8]
     344:      	mov	x16, #0x23              ; =35
     348:      	str	x16, [sp, #0x120]
     34c:      	ldr	x8, [sp, #0xb0]
     350:      	ldr	x22, [sp, #0x68]
     354:      	ldr	x24, [sp, #0x88]
     358:      	ldr	x25, [sp, #0x90]
     35c:      	ldr	x26, [sp, #0x98]
     360:      	ldr	x27, [sp, #0xa0]
     364:      	ldr	x28, [sp, #0xa8]
     368:      	ldr	x1, [sp, #0x30]
     36c:      	mov	x13, x0
     370:      	mov	x0, x23
     374:      	ldr	x23, [sp, #0x70]
     378:      	mov	x7, x4
     37c:      	mov	x4, x3
     380:      	ldr	x3, [sp, #0x80]
     384:      	mov	x9, x5
     388:      	ldr	x5, [sp, #0xf8]
     38c:      	ldr	x10, [sp, #0xf0]
     390:      	ldr	x11, [sp, #0x110]
     394:      	ldr	x12, [sp, #0x118]
     398:      	mov	x14, x6
     39c:      	mov	x6, x2
     3a0:      	ldr	x2, [sp, #0x78]
     3a4:      	mov	x15, x19
     3a8:      	ldr	x19, [sp, #0x50]
     3ac:      	ldr	x20, [sp, #0xb8]
     3b0:      	ldr	x21, [sp, #0x120]
     3b4:      	cmp	x21, #0x0
     3b8:      	b.ne	0xbc8 <_stogir.verify.structure+0xa58>
     3bc:      	str	x1, [sp, #0x30]
     3c0:      	ldr	x1, [x0, #0x8]
     3c4:      	cmp	x14, x1
     3c8:      	b.ge	0xbe0 <_stogir.verify.structure+0xa70>
     3cc:      	ldr	x1, [x0]
     3d0:      	add	x1, x1, x14, lsl #4
     3d4:      	ldr	x1, [x1]
     3d8:      	str	x0, [sp, #0x38]
     3dc:      	ldr	x0, [x0, #0x78]
     3e0:      	add	x0, x0, x14, lsl #2
     3e4:      	ldr	w0, [x0]
     3e8:      	sxtw	x0, w0
     3ec:      	cmp	x0, #0x0
     3f0:      	b.lt	0x2e0 <_stogir.verify.structure+0x170>
     3f4:      	mov	x17, #0xffff            ; =65535
     3f8:      	cmp	x0, x17
     3fc:      	b.gt	0xbf8 <_stogir.verify.structure+0xa88>
     400:      	str	x0, [sp, #0x40]
     404:      	uxtb	w0, w1
     408:      	str	w0, [sp, #0x48]
     40c:      	str	x19, [sp, #0x50]
     410:      	cmp	x0, #0x83
     414:      	cset	w19, lt
     418:      	uxtb	w16, w19
     41c:      	cmp	w16, wzr
     420:      	b.eq	0xc58 <_stogir.verify.structure+0xae8>
     424:      	ubfx	x1, x1, #0, #32
     428:      	str	x0, [sp, #0x58]
     42c:      	ubfx	x0, x1, #8, #8
     430:      	str	w0, [sp, #0x60]
     434:      	str	x8, [sp, #0xb0]
     438:      	str	x2, [sp, #0x78]
     43c:      	str	x3, [sp, #0x80]
     440:      	str	x4, [sp, #0xe0]
     444:      	str	x5, [sp, #0xf8]
     448:      	str	x6, [sp, #0xd0]
     44c:      	str	x7, [sp, #0xc8]
     450:      	str	x9, [sp, #0xc0]
     454:      	str	x10, [sp, #0xf0]
     458:      	str	x13, [sp, #0xe8]
     45c:      	str	x15, [sp, #0xd8]
     460:      	str	x22, [sp, #0x68]
     464:      	ldr	x22, [sp, #0x58]
     468:      	str	x23, [sp, #0x70]
     46c:      	ldr	x23, [sp, #0x38]
     470:      	str	x24, [sp, #0x88]
     474:      	ldr	x24, [sp, #0x40]
     478:      	str	x25, [sp, #0x90]
     47c:      	mov	x25, x1
     480:      	str	x26, [sp, #0x98]
     484:      	mov	x26, x14
     488:      	str	x27, [sp, #0xa0]
     48c:      	ldr	w27, [sp, #0x48]
     490:      	str	x28, [sp, #0xa8]
     494:      	mov	x28, x12
     498:      	str	x20, [sp, #0xb8]
     49c:      	mov	x20, x11
     4a0:      	bl	0x4a0 <_stogir.verify.structure+0x330>
		00000000000004a0:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
     4a4:      	cmp	x0, #0x0
     4a8:      	b.eq	0xcb4 <_stogir.verify.structure+0xb44>
     4ac:      	add	x0, x22, x20
     4b0:      	ldrsb	w0, [x0]
     4b4:      	sxtb	x0, w0
     4b8:      	cmp	x0, #0x0
     4bc:      	b.lt	0x8f8 <_stogir.verify.structure+0x788>
     4c0:      	uxtb	w16, w19
     4c4:      	cmp	w16, wzr
     4c8:      	b.eq	0x9c8 <_stogir.verify.structure+0x858>
     4cc:      	add	x0, x22, x28
     4d0:      	ldrsb	w0, [x0]
     4d4:      	sxtb	w0, w0
     4d8:      	b	0x9cc <_stogir.verify.structure+0x85c>
     4dc:      	ldr	x0, [sp, #0xb8]
     4e0:      	ldr	x1, [sp, #0x120]
     4e4:      	ldr	x2, [sp, #0x50]
     4e8:      	movz	x3, #0x0, lsl #48
     4ec:      	bl	0x4ec <_stogir.verify.structure+0x37c>
		00000000000004ec:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
     4f0:      	cmp	x0, #0x0
     4f4:      	b.eq	0xcdc <_stogir.verify.structure+0xb6c>
     4f8:      	and	x0, x19, #0xffffffff
     4fc:      	movz	x1, #0x0, lsl #48
     500:      	movz	x16, #0x0, lsl #48
     504:      	str	x16, [sp, #0x120]
     508:      	b	0x510 <_stogir.verify.structure+0x3a0>
     50c:      	mov	x1, #0x1                ; =1
     510:      	ldr	x2, [sp, #0xb0]
     514:      	str	x1, [x2]
     518:      	str	x0, [x2, #0x8]
     51c:      	ldr	x0, [sp, #0x120]
     520:      	str	x0, [x2, #0x10]
     524:      	ldr	x19, [sp, #0x150]
     528:      	ldr	x20, [sp, #0x158]
     52c:      	ldr	x21, [sp, #0x160]
     530:      	ldr	x22, [sp, #0x168]
     534:      	ldr	x23, [sp, #0x170]
     538:      	ldr	x24, [sp, #0x178]
     53c:      	ldr	x25, [sp, #0x180]
     540:      	ldr	x26, [sp, #0x188]
     544:      	ldr	x27, [sp, #0x190]
     548:      	ldr	x28, [sp, #0x198]
     54c:      	ldr	x29, [sp, #0x10]
     550:      	ldr	x30, [sp, #0x18]
     554:      	add	sp, sp, #0x1a0
     558:      	ret
     55c:      	mov	w12, w8
     560:      	lsl	w12, w12, #2
     564:      	ubfx	x12, x12, #0, #32
     568:      	lsr	x11, x11, x12
     56c:      	and	w11, w11, #0xf
     570:      	b	0x58c <_stogir.verify.structure+0x41c>
     574:      	movz	x1, #0x0, lsl #48
     578:      	cmp	x1, #0x0
     57c:      	b.eq	0xa10 <_stogir.verify.structure+0x8a0>
     580:      	ldr	w1, [sp, #0x148]
     584:      	b	0x664 <_stogir.verify.structure+0x4f4>
     588:      	movz	w11, #0x0, lsl #16
     58c:      	b	0x594 <_stogir.verify.structure+0x424>
     590:      	movz	w11, #0x0, lsl #16
     594:      	add	x16, sp, #0x20
     598:      	str	x16, [sp]
     59c:      	str	w0, [sp, #0x100]
     5a0:      	str	x2, [sp, #0xf8]
     5a4:      	mov	w2, w6
     5a8:      	str	x4, [sp, #0xf0]
     5ac:      	str	x1, [sp, #0x108]
     5b0:      	mov	w1, w0
     5b4:      	mov	x0, x23
     5b8:      	str	x5, [sp, #0x138]
     5bc:      	str	x20, [sp, #0x110]
     5c0:      	mov	x20, x3
     5c4:      	str	x24, [sp, #0x40]
     5c8:      	mov	w24, w11
     5cc:      	str	x28, [sp, #0x118]
     5d0:      	mov	x28, x7
     5d4:      	str	x21, [sp, #0x120]
     5d8:      	mov	w21, w8
     5dc:      	str	x25, [sp, #0x128]
     5e0:      	mov	w25, w9
     5e4:      	str	x26, [sp, #0x130]
     5e8:      	mov	w26, w10
     5ec:      	bl	0x5ec <_stogir.verify.structure+0x47c>
		00000000000005ec:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
     5f0:      	ldr	x16, [sp]
     5f4:      	str	x0, [x16]
     5f8:      	str	x1, [x16, #0x8]
     5fc:      	add	x16, sp, #0x20
     600:      	ldr	x0, [x16]
     604:      	add	x16, sp, #0x20
     608:      	ldr	x1, [x16, #0x8]
     60c:      	ubfx	x0, x0, #0, #32
     610:      	lsr	x16, x0, #0
     614:      	cmp	x16, #0x1
     618:      	b.eq	0x634 <_stogir.verify.structure+0x4c4>
     61c:      	b.lo	0x624 <_stogir.verify.structure+0x4b4>
     620:      	b	0x638 <_stogir.verify.structure+0x4c8>
     624:      	cmp	x16, #0x0
     628:      	b.eq	0x630 <_stogir.verify.structure+0x4c0>
     62c:      	b	0x638 <_stogir.verify.structure+0x4c8>
     630:      	b	0x63c <_stogir.verify.structure+0x4cc>
     634:      	b	0x728 <_stogir.verify.structure+0x5b8>
     638:      	b	0xb3c <_stogir.verify.structure+0x9cc>
     63c:      	ldr	x3, [sp, #0xe0]
     640:      	ldr	x0, [sp, #0xe8]
     644:      	ldr	x2, [sp, #0xd0]
     648:      	ldr	x4, [sp, #0xc8]
     64c:      	ldr	x5, [sp, #0xc0]
     650:      	mov	w1, w22
     654:      	ldr	x17, [sp, #0xa8]
     658:      	str	x17, [sp, #0xb8]
     65c:      	mov	x16, #0x17              ; =23
     660:      	str	x16, [sp, #0x120]
     664:      	ldr	x6, [sp, #0x138]
     668:      	add	x6, x6, #0x1
     66c:      	sxtw	x6, w6
     670:      	ldr	x26, [sp, #0x130]
     674:      	ldr	x24, [sp, #0x40]
     678:      	ldr	x25, [sp, #0x128]
     67c:      	str	x3, [sp, #0xe0]
     680:      	str	x0, [sp, #0xe8]
     684:      	ldr	w0, [sp, #0x100]
     688:      	str	x2, [sp, #0xd0]
     68c:      	ldr	x2, [sp, #0xf8]
     690:      	str	x4, [sp, #0xc8]
     694:      	str	x5, [sp, #0xc0]
     698:      	mov	w22, w1
     69c:      	ldr	x1, [sp, #0x108]
     6a0:      	ldr	x4, [sp, #0xf0]
     6a4:      	mov	x3, x20
     6a8:      	ldr	x20, [sp, #0x110]
     6ac:      	ldr	x28, [sp, #0x118]
     6b0:      	mov	x5, x6
     6b4:      	ldr	x21, [sp, #0x120]
     6b8:      	cmp	x21, #0x0
     6bc:      	b.ne	0x6d0 <_stogir.verify.structure+0x560>
     6c0:      	cmp	x5, x24
     6c4:      	cset	w6, le
     6c8:      	ubfx	x6, x6, #0, #8
     6cc:      	b	0x6d4 <_stogir.verify.structure+0x564>
     6d0:      	movz	x6, #0x0, lsl #48
     6d4:      	cmp	x6, #0x0
     6d8:      	b.eq	0xce4 <_stogir.verify.structure+0xb74>
     6dc:      	orr	w6, w5, wzr
     6e0:      	sxtw	x7, w6
     6e4:      	sub	w8, w6, #0x1
     6e8:      	cmp	x7, #0x0
     6ec:      	cset	w9, gt
     6f0:      	cmp	x7, #0x4
     6f4:      	cset	w10, gt
     6f8:      	uxtb	w16, w19
     6fc:      	cmp	w16, wzr
     700:      	b.eq	0x590 <_stogir.verify.structure+0x420>
     704:      	ldr	w11, [x1]
     708:      	uxtb	w16, w9
     70c:      	cmp	w16, wzr
     710:      	b.eq	0x588 <_stogir.verify.structure+0x418>
     714:      	uxtb	w16, w10
     718:      	cmp	w16, wzr
     71c:      	b.eq	0x55c <_stogir.verify.structure+0x3ec>
     720:      	mov	w12, #0x4               ; =4
     724:      	b	0x560 <_stogir.verify.structure+0x3f0>
     728:      	ubfx	x24, x24, #0, #32
     72c:      	adrp	x16, 0x0 <_gap_verify_graph>
		000000000000072c:  ARM64_RELOC_PAGE21	l_stogir.325
     730:      	ldr	x16, [x16]
		0000000000000730:  ARM64_RELOC_PAGEOFF12	l_stogir.325
     734:      	ldr	w0, [x16]
     738:      	cmp	x24, x0
     73c:      	b.ne	0x750 <_stogir.verify.structure+0x5e0>
     740:      	mov	x0, #0x1                ; =1
     744:      	b	0x768 <_stogir.verify.structure+0x5f8>
     748:      	movz	x1, #0x0, lsl #48
     74c:      	b	0x7c4 <_stogir.verify.structure+0x654>
     750:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000750:  ARM64_RELOC_PAGE21	l_stogir.326
     754:      	ldr	x16, [x16]
		0000000000000754:  ARM64_RELOC_PAGEOFF12	l_stogir.326
     758:      	ldr	w0, [x16]
     75c:      	cmp	x24, x0
     760:      	cset	w0, eq
     764:      	ubfx	x0, x0, #0, #8
     768:      	cmp	x0, #0x0
     76c:      	b.eq	0xd18 <_stogir.verify.structure+0xba8>
     770:      	str	x28, [sp, #0x140]
     774:      	mov	x28, x0
     778:      	mov	x0, x23
     77c:      	str	w22, [sp, #0x148]
     780:      	mov	w22, w1
     784:      	bl	0x784 <_stogir.verify.structure+0x614>
		0000000000000784:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
     788:      	cmp	x0, #0x0
     78c:      	cset	w1, eq
     790:      	uxtb	w16, w1
     794:      	cmp	w16, wzr
     798:      	cset	x1, eq
     79c:      	cmp	x1, #0x0
     7a0:      	b.eq	0x7c4 <_stogir.verify.structure+0x654>
     7a4:      	ldr	w0, [x0]
     7a8:      	uxtb	w0, w0
     7ac:      	cmp	x0, #0x48
     7b0:      	b.ne	0x7c4 <_stogir.verify.structure+0x654>
     7b4:      	ldr	x17, [sp, #0x30]
     7b8:      	str	x17, [sp, #0xb8]
     7bc:      	mov	x16, #0x25              ; =37
     7c0:      	str	x16, [sp, #0x120]
     7c4:      	sxtw	x22, w22
     7c8:      	adrp	x16, 0x0 <_gap_verify_graph>
		00000000000007c8:  ARM64_RELOC_PAGE21	l_stogir.327
     7cc:      	ldr	x16, [x16]
		00000000000007cc:  ARM64_RELOC_PAGEOFF12	l_stogir.327
     7d0:      	ldr	w0, [x16]
     7d4:      	cmp	x24, x0
     7d8:      	b.ne	0xd2c <_stogir.verify.structure+0xbbc>
     7dc:      	cmp	x22, #0x0
     7e0:      	b.gt	0x960 <_stogir.verify.structure+0x7f0>
     7e4:      	ldr	x3, [sp, #0xe0]
     7e8:      	ldr	x0, [sp, #0xe8]
     7ec:      	movz	w2, #0x0, lsl #16
     7f0:      	ubfx	x2, x2, #0, #32
     7f4:      	lsr	x16, x2, #0
     7f8:      	cmp	x16, #0x1
     7fc:      	b.eq	0x818 <_stogir.verify.structure+0x6a8>
     800:      	b.lo	0x808 <_stogir.verify.structure+0x698>
     804:      	b	0x81c <_stogir.verify.structure+0x6ac>
     808:      	cmp	x16, #0x0
     80c:      	b.eq	0x814 <_stogir.verify.structure+0x6a4>
     810:      	b	0x81c <_stogir.verify.structure+0x6ac>
     814:      	b	0x820 <_stogir.verify.structure+0x6b0>
     818:      	b	0x830 <_stogir.verify.structure+0x6c0>
     81c:      	b	0xbc0 <_stogir.verify.structure+0xa50>
     820:      	ldr	x17, [sp, #0x78]
     824:      	str	x17, [sp, #0xb8]
     828:      	mov	x16, #0x21              ; =33
     82c:      	str	x16, [sp, #0x120]
     830:      	cmp	x24, #0xf
     834:      	b.hs	0xd38 <_stogir.verify.structure+0xbc8>
     838:      	mov	x16, #0x1               ; =1
     83c:      	lsl	x2, x16, x24
     840:      	mov	w17, #0x5e1c            ; =24092
     844:      	and	w2, w2, w17
     848:      	ubfx	x2, x2, #0, #32
     84c:      	cmp	x2, #0x0
     850:      	b.eq	0xd4c <_stogir.verify.structure+0xbdc>
     854:      	cmp	x28, #0x0
     858:      	b.eq	0xa58 <_stogir.verify.structure+0x8e8>
     85c:      	ldr	x2, [sp, #0xd0]
     860:      	ldr	x4, [sp, #0xc8]
     864:      	ldr	x5, [sp, #0xc0]
     868:      	b	0x578 <_stogir.verify.structure+0x408>
     86c:      	orr	w0, w26, wzr
     870:      	ldr	w1, [sp, #0x60]
     874:      	cmp	x22, #0x78
     878:      	cset	w27, eq
     87c:      	ldr	x2, [sp, #0xf8]
     880:      	add	x3, x2, x22, lsl #2
     884:      	ldr	x4, [sp, #0xf0]
     888:      	add	x5, x4, x22, lsl #2
     88c:      	cmp	x1, #0x0
     890:      	cset	w22, eq
     894:      	orr	x1, x3, xzr
     898:      	orr	x3, x5, xzr
     89c:      	mov	x5, #0x1                ; =1
     8a0:      	b	0x6b8 <_stogir.verify.structure+0x548>
     8a4:      	nop
     8a8:      	movz	x1, #0x0, lsl #48
     8ac:      	cmp	x1, #0x0
     8b0:      	b.eq	0x86c <_stogir.verify.structure+0x6fc>
     8b4:      	add	x1, x0, x26
     8b8:      	ldr	x2, [x23, #0x78]
     8bc:      	add	x1, x2, x1, lsl #2
     8c0:      	ldr	w1, [x1]
     8c4:      	sxtw	x1, w1
     8c8:      	cmn	x1, #0x1
     8cc:      	b.eq	0x8dc <_stogir.verify.structure+0x76c>
     8d0:      	ldr	x17, [sp, #0xa0]
     8d4:      	str	x17, [sp, #0xb8]
     8d8:      	mov	x21, #0x1b              ; =27
     8dc:      	add	x0, x0, #0x1
     8e0:      	cmp	x21, #0x0
     8e4:      	b.ne	0x8a8 <_stogir.verify.structure+0x738>
     8e8:      	cmp	x0, x25
     8ec:      	cset	w1, lt
     8f0:      	ubfx	x1, x1, #0, #8
     8f4:      	b	0x8ac <_stogir.verify.structure+0x73c>
     8f8:      	mov	w0, w27
     8fc:      	bl	0x8fc <_stogir.verify.structure+0x78c>
		00000000000008fc:  ARM64_RELOC_BRANCH26	_stogir.opcode.input-count
     900:      	sxtw	x0, w0
     904:      	cmn	x0, #0x1
     908:      	b.ne	0x924 <_stogir.verify.structure+0x7b4>
     90c:      	ubfx	x0, x25, #16, #16
     910:      	cmp	x24, x0
     914:      	b.eq	0x924 <_stogir.verify.structure+0x7b4>
     918:      	ldr	x17, [sp, #0x90]
     91c:      	str	x17, [sp, #0xb8]
     920:      	mov	x21, #0x24              ; =36
     924:      	add	x0, x24, #0x4
     928:      	ldr	x1, [x23, #0x8]
     92c:      	asr	x16, x0, #63
     930:      	lsr	x16, x16, #62
     934:      	add	x0, x0, x16
     938:      	asr	x0, x0, #2
     93c:      	orr	x25, x0, xzr
     940:      	add	x0, x25, x26
     944:      	cmp	x0, x1
     948:      	b.le	0x958 <_stogir.verify.structure+0x7e8>
     94c:      	ldr	x17, [sp, #0x98]
     950:      	str	x17, [sp, #0xb8]
     954:      	mov	x21, #0x15              ; =21
     958:      	mov	x0, #0x1                ; =1
     95c:      	b	0x8e0 <_stogir.verify.structure+0x770>
     960:      	ldr	x0, [sp, #0xe8]
     964:      	ldr	x2, [x0, #0x8]
     968:      	cmp	x22, x2
     96c:      	b.gt	0xd60 <_stogir.verify.structure+0xbf0>
     970:      	sub	x2, x22, #0x1
     974:      	ldr	x3, [sp, #0xe0]
     978:      	ldr	x4, [x3, #0x28]
     97c:      	mov	x17, #0x18              ; =24
     980:      	mul	x2, x2, x17
     984:      	add	x2, x2, x4
     988:      	ldr	x4, [x2]
     98c:      	ldr	x2, [x2, #0x8]
     990:      	ldr	x5, [x3, #0x8]
     994:      	cmp	x4, #0x0
     998:      	b.lt	0x9c0 <_stogir.verify.structure+0x850>
     99c:      	cmp	x4, x5
     9a0:      	b.gt	0x9c0 <_stogir.verify.structure+0x850>
     9a4:      	cmp	x2, #0x0
     9a8:      	b.lt	0x9c0 <_stogir.verify.structure+0x850>
     9ac:      	sub	x4, x5, x4
     9b0:      	cmp	x2, x4
     9b4:      	b.gt	0x9c0 <_stogir.verify.structure+0x850>
     9b8:      	mov	w2, #0x1                ; =1
     9bc:      	b	0x9c4 <_stogir.verify.structure+0x854>
     9c0:      	movz	w2, #0x0, lsl #16
     9c4:      	b	0x7f0 <_stogir.verify.structure+0x680>
     9c8:      	mov	w0, #-0x2               ; =-2
     9cc:      	sxtw	x0, w0
     9d0:      	cmp	x24, x0
     9d4:      	b.eq	0x8f8 <_stogir.verify.structure+0x788>
     9d8:      	ldr	x3, [sp, #0xe0]
     9dc:      	ldr	x0, [sp, #0xe8]
     9e0:      	ldr	x2, [sp, #0xd0]
     9e4:      	ldr	x4, [sp, #0xc8]
     9e8:      	ldr	x5, [sp, #0xc0]
     9ec:      	str	x20, [sp, #0x110]
     9f0:      	str	x28, [sp, #0x118]
     9f4:      	mov	x6, x26
     9f8:      	ldr	x19, [sp, #0xd8]
     9fc:      	ldr	x17, [sp, #0x88]
     a00:      	str	x17, [sp, #0xb8]
     a04:      	mov	x16, #0x23              ; =35
     a08:      	str	x16, [sp, #0x120]
     a0c:      	b	0x1ec <_stogir.verify.structure+0x7c>
     a10:      	cmp	x22, #0x0
     a14:      	b.ne	0xd68 <_stogir.verify.structure+0xbf8>
     a18:      	uxtb	w16, w19
     a1c:      	cmp	w16, wzr
     a20:      	b.eq	0xb44 <_stogir.verify.structure+0x9d4>
     a24:      	ldr	w1, [x20]
     a28:      	uxtb	w16, w25
     a2c:      	cmp	w16, wzr
     a30:      	b.eq	0xb84 <_stogir.verify.structure+0xa14>
     a34:      	uxtb	w16, w26
     a38:      	cmp	w16, wzr
     a3c:      	b.eq	0xa44 <_stogir.verify.structure+0x8d4>
     a40:      	mov	w21, #0x4               ; =4
     a44:      	lsl	w6, w21, #2
     a48:      	ubfx	x6, x6, #0, #32
     a4c:      	lsr	x1, x1, x6
     a50:      	and	w1, w1, #0xf
     a54:      	b	0xb88 <_stogir.verify.structure+0xa18>
     a58:      	cmp	x22, #0x0
     a5c:      	b.le	0xd70 <_stogir.verify.structure+0xc00>
     a60:      	ldr	x1, [x23, #0x8]
     a64:      	cmp	x22, x1
     a68:      	b.ge	0xd78 <_stogir.verify.structure+0xc08>
     a6c:      	ldr	x2, [sp, #0xd0]
     a70:      	ldr	x1, [x2, #0x8]
     a74:      	cmp	x22, x1
     a78:      	b.ge	0xb94 <_stogir.verify.structure+0xa24>
     a7c:      	ldr	x1, [x23, #0x78]
     a80:      	add	x1, x1, x22, lsl #2
     a84:      	ldr	w1, [x1]
     a88:      	sxtw	x1, w1
     a8c:      	cmp	x1, #0x0
     a90:      	cset	w1, ge
     a94:      	ubfx	x1, x1, #0, #8
     a98:      	b	0xb98 <_stogir.verify.structure+0xa28>
     a9c:      	uxtb	w16, w27
     aa0:      	cmp	w16, wzr
     aa4:      	b.eq	0xd80 <_stogir.verify.structure+0xc10>
     aa8:      	ldr	w1, [sp, #0x148]
     aac:      	uxtb	w16, w1
     ab0:      	cmp	w16, wzr
     ab4:      	b.eq	0xac4 <_stogir.verify.structure+0x954>
     ab8:      	ldr	x6, [sp, #0x140]
     abc:      	cmp	x6, #0x2
     ac0:      	b.eq	0x584 <_stogir.verify.structure+0x414>
     ac4:      	ldr	x17, [sp, #0x80]
     ac8:      	str	x17, [sp, #0xb8]
     acc:      	mov	x16, #0x1a              ; =26
     ad0:      	str	x16, [sp, #0x120]
     ad4:      	b	0x584 <_stogir.verify.structure+0x414>
     ad8:      	movz	x1, #0x0, lsl #48
     adc:      	ldr	x4, [sp, #0xc8]
     ae0:      	ldr	x5, [sp, #0xc0]
     ae4:      	b	0x578 <_stogir.verify.structure+0x408>
     ae8:      	cmp	x22, #0x0
     aec:      	b.ge	0xd88 <_stogir.verify.structure+0xc18>
     af0:      	ldr	x4, [sp, #0xc8]
     af4:      	ldr	x1, [x4, #0x8]
     af8:      	ldr	x5, [sp, #0xc0]
     afc:      	ldr	x6, [x5, #0x8]
     b00:      	cmp	x1, x6
     b04:      	b.ne	0xb8c <_stogir.verify.structure+0xa1c>
     b08:      	movz	x16, #0x0, lsl #48
     b0c:      	sub	x6, x16, x22
     b10:      	cmp	x6, x1
     b14:      	b.gt	0xbb8 <_stogir.verify.structure+0xa48>
     b18:      	sub	x1, x6, #0x1
     b1c:      	ldr	x6, [x23, #0x50]
     b20:      	add	x1, x6, x1, lsl #2
     b24:      	ldr	w1, [x1]
     b28:      	sxtw	x1, w1
     b2c:      	cmp	x1, #0x0
     b30:      	cset	w1, gt
     b34:      	ubfx	x1, x1, #0, #8
     b38:      	b	0xbbc <_stogir.verify.structure+0xa4c>
     b3c:      	brk	#0
     b40:      	b	0xb3c <_stogir.verify.structure+0x9cc>
     b44:      	movz	w1, #0x0, lsl #16
     b48:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000b48:  ARM64_RELOC_PAGE21	l_stogir.328
     b4c:      	ldr	x16, [x16]
		0000000000000b4c:  ARM64_RELOC_PAGEOFF12	l_stogir.328
     b50:      	ldr	w6, [x16]
     b54:      	ubfx	x1, x1, #0, #32
     b58:      	cmp	x1, x6
     b5c:      	b.ne	0xb68 <_stogir.verify.structure+0x9f8>
     b60:      	ldr	w1, [sp, #0x148]
     b64:      	b	0x584 <_stogir.verify.structure+0x414>
     b68:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000b68:  ARM64_RELOC_PAGE21	l_stogir.329
     b6c:      	ldr	x16, [x16]
		0000000000000b6c:  ARM64_RELOC_PAGEOFF12	l_stogir.329
     b70:      	ldr	w6, [x16]
     b74:      	cmp	x1, x6
     b78:      	b.ne	0xb9c <_stogir.verify.structure+0xa2c>
     b7c:      	ldr	w1, [sp, #0x148]
     b80:      	b	0x584 <_stogir.verify.structure+0x414>
     b84:      	movz	w1, #0x0, lsl #16
     b88:      	b	0xb48 <_stogir.verify.structure+0x9d8>
     b8c:      	movz	x1, #0x0, lsl #48
     b90:      	b	0x578 <_stogir.verify.structure+0x408>
     b94:      	movz	x1, #0x0, lsl #48
     b98:      	b	0xadc <_stogir.verify.structure+0x96c>
     b9c:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000b9c:  ARM64_RELOC_PAGE21	l_stogir.330
     ba0:      	ldr	x16, [x16]
		0000000000000ba0:  ARM64_RELOC_PAGEOFF12	l_stogir.330
     ba4:      	ldr	w6, [x16]
     ba8:      	cmp	x1, x6
     bac:      	b.ne	0xa9c <_stogir.verify.structure+0x92c>
     bb0:      	ldr	w1, [sp, #0x148]
     bb4:      	b	0x584 <_stogir.verify.structure+0x414>
     bb8:      	movz	x1, #0x0, lsl #48
     bbc:      	b	0xb90 <_stogir.verify.structure+0xa20>
     bc0:      	brk	#0
     bc4:      	b	0xbc0 <_stogir.verify.structure+0xa50>
     bc8:      	str	x8, [sp, #0xb0]
     bcc:      	str	x19, [sp, #0x50]
     bd0:      	mov	x19, x15
     bd4:      	str	x20, [sp, #0xb8]
     bd8:      	str	x21, [sp, #0x120]
     bdc:      	b	0x4dc <_stogir.verify.structure+0x36c>
     be0:      	str	x8, [sp, #0xb0]
     be4:      	str	x19, [sp, #0x50]
     be8:      	mov	x19, x15
     bec:      	str	x20, [sp, #0xb8]
     bf0:      	str	x21, [sp, #0x120]
     bf4:      	b	0x4dc <_stogir.verify.structure+0x36c>
     bf8:      	str	x8, [sp, #0xb0]
     bfc:      	str	x19, [sp, #0x50]
     c00:      	mov	x19, x15
     c04:      	str	x22, [sp, #0x68]
     c08:      	str	x23, [sp, #0x70]
     c0c:      	ldr	x23, [sp, #0x38]
     c10:      	str	x24, [sp, #0x88]
     c14:      	str	x25, [sp, #0x90]
     c18:      	str	x26, [sp, #0x98]
     c1c:      	str	x27, [sp, #0xa0]
     c20:      	str	x28, [sp, #0xa8]
     c24:      	str	x2, [sp, #0x78]
     c28:      	str	x3, [sp, #0x80]
     c2c:      	mov	x3, x4
     c30:      	str	x5, [sp, #0xf8]
     c34:      	mov	x0, x13
     c38:      	mov	x2, x6
     c3c:      	mov	x6, x14
     c40:      	mov	x4, x7
     c44:      	mov	x5, x9
     c48:      	str	x10, [sp, #0xf0]
     c4c:      	str	x11, [sp, #0x110]
     c50:      	str	x12, [sp, #0x118]
     c54:      	b	0x33c <_stogir.verify.structure+0x1cc>
     c58:      	mov	x19, x15
     c5c:      	str	x8, [sp, #0xb0]
     c60:      	str	x22, [sp, #0x68]
     c64:      	str	x23, [sp, #0x70]
     c68:      	ldr	x23, [sp, #0x38]
     c6c:      	str	x24, [sp, #0x88]
     c70:      	str	x25, [sp, #0x90]
     c74:      	str	x26, [sp, #0x98]
     c78:      	str	x27, [sp, #0xa0]
     c7c:      	str	x28, [sp, #0xa8]
     c80:      	str	x2, [sp, #0x78]
     c84:      	str	x3, [sp, #0x80]
     c88:      	mov	x3, x4
     c8c:      	str	x5, [sp, #0xf8]
     c90:      	mov	x0, x13
     c94:      	mov	x2, x6
     c98:      	mov	x6, x14
     c9c:      	mov	x4, x7
     ca0:      	mov	x5, x9
     ca4:      	str	x10, [sp, #0xf0]
     ca8:      	str	x11, [sp, #0x110]
     cac:      	str	x12, [sp, #0x118]
     cb0:      	b	0x2c8 <_stogir.verify.structure+0x158>
     cb4:      	mov	x6, x26
     cb8:      	ldr	x19, [sp, #0xd8]
     cbc:      	ldr	x3, [sp, #0xe0]
     cc0:      	ldr	x0, [sp, #0xe8]
     cc4:      	ldr	x2, [sp, #0xd0]
     cc8:      	ldr	x4, [sp, #0xc8]
     ccc:      	ldr	x5, [sp, #0xc0]
     cd0:      	str	x20, [sp, #0x110]
     cd4:      	str	x28, [sp, #0x118]
     cd8:      	b	0x2c8 <_stogir.verify.structure+0x158>
     cdc:      	ldr	x0, [sp, #0xb8]
     ce0:      	b	0x50c <_stogir.verify.structure+0x39c>
     ce4:      	str	x26, [sp, #0x130]
     ce8:      	str	x25, [sp, #0x128]
     cec:      	ldr	x3, [sp, #0xe0]
     cf0:      	str	x21, [sp, #0x120]
     cf4:      	str	x2, [sp, #0xf8]
     cf8:      	ldr	x0, [sp, #0xe8]
     cfc:      	ldr	x2, [sp, #0xd0]
     d00:      	ldr	x5, [sp, #0xc0]
     d04:      	str	x4, [sp, #0xf0]
     d08:      	ldr	x4, [sp, #0xc8]
     d0c:      	str	x20, [sp, #0x110]
     d10:      	str	x28, [sp, #0x118]
     d14:      	b	0x1d4 <_stogir.verify.structure+0x64>
     d18:      	str	x28, [sp, #0x140]
     d1c:      	mov	x28, x0
     d20:      	str	w22, [sp, #0x148]
     d24:      	mov	w22, w1
     d28:      	b	0x748 <_stogir.verify.structure+0x5d8>
     d2c:      	ldr	x3, [sp, #0xe0]
     d30:      	ldr	x0, [sp, #0xe8]
     d34:      	b	0x830 <_stogir.verify.structure+0x6c0>
     d38:      	ldr	x2, [sp, #0xd0]
     d3c:      	ldr	x4, [sp, #0xc8]
     d40:      	ldr	x5, [sp, #0xc0]
     d44:      	ldr	w1, [sp, #0x148]
     d48:      	b	0x584 <_stogir.verify.structure+0x414>
     d4c:      	ldr	x2, [sp, #0xd0]
     d50:      	ldr	x4, [sp, #0xc8]
     d54:      	ldr	x5, [sp, #0xc0]
     d58:      	ldr	w1, [sp, #0x148]
     d5c:      	b	0x584 <_stogir.verify.structure+0x414>
     d60:      	ldr	x3, [sp, #0xe0]
     d64:      	b	0x7ec <_stogir.verify.structure+0x67c>
     d68:      	ldr	w1, [sp, #0x148]
     d6c:      	b	0xac4 <_stogir.verify.structure+0x954>
     d70:      	ldr	x2, [sp, #0xd0]
     d74:      	b	0xae8 <_stogir.verify.structure+0x978>
     d78:      	ldr	x2, [sp, #0xd0]
     d7c:      	b	0xad8 <_stogir.verify.structure+0x968>
     d80:      	ldr	w1, [sp, #0x148]
     d84:      	b	0xac4 <_stogir.verify.structure+0x954>
     d88:      	ldr	x4, [sp, #0xc8]
     d8c:      	ldr	x5, [sp, #0xc0]
     d90:      	b	0x574 <_stogir.verify.structure+0x404>

0000000000000d94 <_stogir.verify.integer-operations-target-structured>:
     d94:      	sub	sp, sp, #0x3b0
     d98:      	str	x29, [sp, #0x10]
     d9c:      	str	x30, [sp, #0x18]
     da0:      	add	x29, sp, #0x10
     da4:      	str	x19, [sp, #0x358]
     da8:      	str	x20, [sp, #0x360]
     dac:      	str	x21, [sp, #0x368]
     db0:      	str	x22, [sp, #0x370]
     db4:      	str	x23, [sp, #0x378]
     db8:      	str	x24, [sp, #0x380]
     dbc:      	str	x25, [sp, #0x388]
     dc0:      	str	x26, [sp, #0x390]
     dc4:      	str	x27, [sp, #0x398]
     dc8:      	str	x28, [sp, #0x3a0]
     dcc:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000dcc:  ARM64_RELOC_PAGE21	l_stogir.331
     dd0:      	ldr	x16, [x16]
		0000000000000dd0:  ARM64_RELOC_PAGEOFF12	l_stogir.331
     dd4:      	orr	x19, x16, xzr
     dd8:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000dd8:  ARM64_RELOC_PAGE21	l_stogir.332
     ddc:      	ldr	x16, [x16]
		0000000000000ddc:  ARM64_RELOC_PAGEOFF12	l_stogir.332
     de0:      	orr	x20, x16, xzr
     de4:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000de4:  ARM64_RELOC_PAGE21	l_stogir.333
     de8:      	ldr	x16, [x16]
		0000000000000de8:  ARM64_RELOC_PAGEOFF12	l_stogir.333
     dec:      	orr	x21, x16, xzr
     df0:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000df0:  ARM64_RELOC_PAGE21	l_stogir.334
     df4:      	ldr	x16, [x16]
		0000000000000df4:  ARM64_RELOC_PAGEOFF12	l_stogir.334
     df8:      	orr	x22, x16, xzr
     dfc:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000dfc:  ARM64_RELOC_PAGE21	l_stogir.335
     e00:      	ldr	x16, [x16]
		0000000000000e00:  ARM64_RELOC_PAGEOFF12	l_stogir.335
     e04:      	orr	x23, x16, xzr
     e08:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000e08:  ARM64_RELOC_PAGE21	l_stogir.336
     e0c:      	ldr	x16, [x16]
		0000000000000e0c:  ARM64_RELOC_PAGEOFF12	l_stogir.336
     e10:      	orr	x24, x16, xzr
     e14:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000e14:  ARM64_RELOC_PAGE21	l_stogir.337
     e18:      	ldr	x16, [x16]
		0000000000000e18:  ARM64_RELOC_PAGEOFF12	l_stogir.337
     e1c:      	orr	x25, x16, xzr
     e20:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000e20:  ARM64_RELOC_PAGE21	l_stogir.338
     e24:      	ldr	x16, [x16]
		0000000000000e24:  ARM64_RELOC_PAGEOFF12	l_stogir.338
     e28:      	orr	x26, x16, xzr
     e2c:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000e2c:  ARM64_RELOC_PAGE21	l_stogir.339
     e30:      	ldr	x16, [x16]
		0000000000000e30:  ARM64_RELOC_PAGEOFF12	l_stogir.339
     e34:      	orr	x27, x16, xzr
     e38:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000e38:  ARM64_RELOC_PAGE21	l_stogir.340
     e3c:      	ldr	x16, [x16]
		0000000000000e3c:  ARM64_RELOC_PAGEOFF12	l_stogir.340
     e40:      	orr	x28, x16, xzr
     e44:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000e44:  ARM64_RELOC_PAGE21	l_stogir.341
     e48:      	ldr	x16, [x16]
		0000000000000e48:  ARM64_RELOC_PAGEOFF12	l_stogir.341
     e4c:      	orr	x2, x16, xzr
     e50:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000e50:  ARM64_RELOC_PAGE21	l_stogir.342
     e54:      	ldr	x16, [x16]
		0000000000000e54:  ARM64_RELOC_PAGEOFF12	l_stogir.342
     e58:      	orr	x3, x16, xzr
     e5c:      	adrp	x16, 0x0 <_gap_verify_graph>
		0000000000000e5c:  ARM64_RELOC_PAGE21	l_stogir.343
     e60:      	ldr	x16, [x16]
		0000000000000e60:  ARM64_RELOC_PAGEOFF12	l_stogir.343
     e64:      	orr	x4, x16, xzr
     e68:      	add	x5, x0, #0x78
     e6c:      	add	x6, x0, #0x28
     e70:      	add	x7, x0, #0x50
     e74:      	orr	w9, w1, wzr
     e78:      	orr	w10, w1, wzr
     e7c:      	add	x16, sp, #0x20
     e80:      	orr	x11, x16, xzr
     e84:      	add	x16, sp, #0x30
     e88:      	orr	x12, x16, xzr
     e8c:      	add	x12, x12, #0x8
     e90:      	add	x16, sp, #0x50
     e94:      	orr	x13, x16, xzr
     e98:      	add	x13, x13, #0x8
     e9c:      	add	x16, sp, #0xe0
     ea0:      	orr	x14, x16, xzr
     ea4:      	add	x14, x14, #0x8
     ea8:      	add	x16, sp, #0x100
     eac:      	orr	x15, x16, xzr
     eb0:      	add	x15, x15, #0x8
     eb4:      	str	w1, [sp, #0x230]
     eb8:      	add	x16, sp, #0x120
     ebc:      	orr	x1, x16, xzr
     ec0:      	add	x1, x1, #0x8
     ec4:      	str	x1, [sp, #0x238]
     ec8:      	add	x16, sp, #0x140
     ecc:      	orr	x1, x16, xzr
     ed0:      	add	x1, x1, #0x8
     ed4:      	str	x1, [sp, #0x240]
     ed8:      	add	x16, sp, #0x160
     edc:      	orr	x1, x16, xzr
     ee0:      	add	x1, x1, #0x8
     ee4:      	str	x1, [sp, #0x248]
     ee8:      	add	x16, sp, #0x180
     eec:      	orr	x1, x16, xzr
     ef0:      	add	x1, x1, #0x8
     ef4:      	str	x1, [sp, #0x250]
     ef8:      	add	x16, sp, #0x1a0
     efc:      	orr	x1, x16, xzr
     f00:      	add	x1, x1, #0x8
     f04:      	str	x1, [sp, #0x258]
     f08:      	add	x16, sp, #0x1f0
     f0c:      	orr	x1, x16, xzr
     f10:      	add	x1, x1, #0x8
     f14:      	str	x20, [sp, #0x260]
     f18:      	str	x21, [sp, #0x268]
     f1c:      	str	x22, [sp, #0x270]
     f20:      	mov	x20, #0x1               ; =1
     f24:      	movz	x21, #0x0, lsl #48
     f28:      	movz	x22, #0x0, lsl #48
     f2c:      	cmp	x22, #0x0
     f30:      	b.ne	0x1ed8 <_stogir.verify.integer-operations-target-structured+0x1144>
     f34:      	str	x1, [sp, #0x278]
     f38:      	ldr	x1, [x0, #0x8]
     f3c:      	cmp	x20, x1
     f40:      	b.ge	0x1ee0 <_stogir.verify.integer-operations-target-structured+0x114c>
     f44:      	ldr	x1, [x0]
     f48:      	add	x1, x1, x20, lsl #4
     f4c:      	str	x2, [sp, #0x280]
     f50:      	ldr	x2, [x1]
     f54:      	str	x23, [sp, #0x288]
     f58:      	uxtb	w23, w2
     f5c:      	ldr	x1, [x1, #0x8]
     f60:      	str	x24, [sp, #0x290]
     f64:      	orr	x24, x23, xzr
     f68:      	add	x16, sp, #0x20
     f6c:      	str	x2, [x16]
     f70:      	add	x16, sp, #0x20
     f74:      	str	x1, [x16, #0x8]
     f78:      	ldr	x1, [x0, #0x78]
     f7c:      	add	x1, x1, x20, lsl #2
     f80:      	ldr	w1, [x1]
     f84:      	cmp	x24, #0x83
     f88:      	b.ge	0x1764 <_stogir.verify.integer-operations-target-structured+0x9d0>
     f8c:      	add	x2, x3, x24, lsl #1
     f90:      	ldrh	w2, [x2]
     f94:      	cmp	x24, #0xe
     f98:      	b.lt	0x1ee8 <_stogir.verify.integer-operations-target-structured+0x1154>
     f9c:      	str	x0, [sp, #0x298]
     fa0:      	cmp	x24, #0x17
     fa4:      	cset	w0, le
     fa8:      	ubfx	x0, x0, #0, #8
     fac:      	str	x0, [sp, #0x2a0]
     fb0:      	orr	w0, w20, wzr
     fb4:      	str	w1, [sp, #0x2a8]
     fb8:      	and	w1, w2, #0x4
     fbc:      	ubfx	x1, x1, #0, #32
     fc0:      	str	x8, [sp, #0x2d8]
     fc4:      	str	x3, [sp, #0x2c0]
     fc8:      	ldr	w3, [sp, #0x2a8]
     fcc:      	str	x5, [sp, #0x318]
     fd0:      	str	x6, [sp, #0x310]
     fd4:      	str	x7, [sp, #0x308]
     fd8:      	str	w9, [sp, #0x2e8]
     fdc:      	str	w10, [sp, #0x2f0]
     fe0:      	str	x11, [sp, #0x2f8]
     fe4:      	str	x15, [sp, #0x328]
     fe8:      	str	w0, [sp, #0x320]
     fec:      	str	x25, [sp, #0x2b0]
     ff0:      	mov	x25, x14
     ff4:      	str	x26, [sp, #0x2b8]
     ff8:      	mov	w26, w2
     ffc:      	mov	x2, x11
    1000:      	str	x27, [sp, #0x2c8]
    1004:      	mov	x27, x4
    1008:      	str	x28, [sp, #0x2d0]
    100c:      	mov	x28, x1
    1010:      	mov	w1, w0
    1014:      	ldr	x0, [sp, #0x298]
    1018:      	str	x20, [sp, #0x2e0]
    101c:      	mov	x20, x13
    1020:      	str	w23, [sp, #0x300]
    1024:      	mov	x23, x12
    1028:      	bl	0x1028 <_stogir.verify.integer-operations-target-structured+0x294>
		0000000000001028:  ARM64_RELOC_BRANCH26	_stogir.verify.classifications
    102c:      	uxtb	w1, w0
    1030:      	cmp	x1, #0x0
    1034:      	cset	w1, ne
    1038:      	cmp	x28, #0x0
    103c:      	b.ne	0x1774 <_stogir.verify.integer-operations-target-structured+0x9e0>
    1040:      	uxtb	w16, w1
    1044:      	cmp	w16, wzr
    1048:      	b.ne	0x1774 <_stogir.verify.integer-operations-target-structured+0x9e0>
    104c:      	str	x0, [sp, #0x330]
    1050:      	mov	w28, w1
    1054:      	cmp	x24, #0x44
    1058:      	b.ne	0x17e8 <_stogir.verify.integer-operations-target-structured+0xa54>
    105c:      	uxtb	w16, w28
    1060:      	cmp	w16, wzr
    1064:      	b.eq	0x17e0 <_stogir.verify.integer-operations-target-structured+0xa4c>
    1068:      	movz	x0, #0x0, lsl #48
    106c:      	cmp	x0, #0x0
    1070:      	b.eq	0x10c4 <_stogir.verify.integer-operations-target-structured+0x330>
    1074:      	add	x8, sp, #0x50
    1078:      	ldr	x0, [sp, #0x298]
    107c:      	ldr	w1, [sp, #0x320]
    1080:      	bl	0x1080 <_stogir.verify.integer-operations-target-structured+0x2ec>
		0000000000001080:  ARM64_RELOC_BRANCH26	_stogir.copy.validate
    1084:      	add	x16, sp, #0x50
    1088:      	ldr	w0, [x16]
    108c:      	lsr	x16, x0, #0
    1090:      	cmp	x16, #0x1
    1094:      	b.eq	0x10b0 <_stogir.verify.integer-operations-target-structured+0x31c>
    1098:      	b.lo	0x10a0 <_stogir.verify.integer-operations-target-structured+0x30c>
    109c:      	b	0x10b4 <_stogir.verify.integer-operations-target-structured+0x320>
    10a0:      	cmp	x16, #0x0
    10a4:      	b.eq	0x10ac <_stogir.verify.integer-operations-target-structured+0x318>
    10a8:      	b	0x10b4 <_stogir.verify.integer-operations-target-structured+0x320>
    10ac:      	b	0x17f0 <_stogir.verify.integer-operations-target-structured+0xa5c>
    10b0:      	b	0x10b8 <_stogir.verify.integer-operations-target-structured+0x324>
    10b4:      	b	0x17fc <_stogir.verify.integer-operations-target-structured+0xa68>
    10b8:      	add	x16, sp, #0x50
    10bc:      	ldr	x19, [x16, #0x8]
    10c0:      	ldr	x22, [x20, #0x8]
    10c4:      	cmp	x24, #0x1d
    10c8:      	b.ne	0x1804 <_stogir.verify.integer-operations-target-structured+0xa70>
    10cc:      	mov	x0, #0x1                ; =1
    10d0:      	cmp	x0, #0x0
    10d4:      	b.eq	0x181c <_stogir.verify.integer-operations-target-structured+0xa88>
    10d8:      	add	x16, sp, #0x20
    10dc:      	ldr	w0, [x16, #0xc]
    10e0:      	sxtw	x0, w0
    10e4:      	cmp	x0, #0x0
    10e8:      	b.ne	0x1814 <_stogir.verify.integer-operations-target-structured+0xa80>
    10ec:      	movz	x0, #0x0, lsl #48
    10f0:      	cmp	x0, #0x0
    10f4:      	b.eq	0x114c <_stogir.verify.integer-operations-target-structured+0x3b8>
    10f8:      	add	x16, sp, #0x20
    10fc:      	ldr	w0, [x16, #0xc]
    1100:      	add	x8, sp, #0x70
    1104:      	mov	w1, w0
    1108:      	ldr	x0, [sp, #0x298]
    110c:      	bl	0x110c <_stogir.verify.integer-operations-target-structured+0x378>
		000000000000110c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    1110:      	add	x16, sp, #0x70
    1114:      	ldr	w0, [x16]
    1118:      	lsr	x16, x0, #0
    111c:      	cmp	x16, #0x1
    1120:      	b.eq	0x113c <_stogir.verify.integer-operations-target-structured+0x3a8>
    1124:      	b.lo	0x112c <_stogir.verify.integer-operations-target-structured+0x398>
    1128:      	b	0x1140 <_stogir.verify.integer-operations-target-structured+0x3ac>
    112c:      	cmp	x16, #0x0
    1130:      	b.eq	0x1138 <_stogir.verify.integer-operations-target-structured+0x3a4>
    1134:      	b	0x1140 <_stogir.verify.integer-operations-target-structured+0x3ac>
    1138:      	b	0x1144 <_stogir.verify.integer-operations-target-structured+0x3b0>
    113c:      	b	0x1824 <_stogir.verify.integer-operations-target-structured+0xa90>
    1140:      	b	0x18c0 <_stogir.verify.integer-operations-target-structured+0xb2c>
    1144:      	ldr	x19, [sp, #0x260]
    1148:      	mov	x22, #0x16              ; =22
    114c:      	and	w0, w26, #0x8
    1150:      	ubfx	x0, x0, #0, #32
    1154:      	cmp	x0, #0x0
    1158:      	b.ne	0x18c8 <_stogir.verify.integer-operations-target-structured+0xb34>
    115c:      	movz	x0, #0x0, lsl #48
    1160:      	cmp	x24, #0x2c
    1164:      	cset	w1, eq
    1168:      	cmp	x0, #0x0
    116c:      	b.eq	0x18d0 <_stogir.verify.integer-operations-target-structured+0xb3c>
    1170:      	mov	x0, #0x1                ; =1
    1174:      	cmp	x0, #0x0
    1178:      	b.eq	0x11e8 <_stogir.verify.integer-operations-target-structured+0x454>
    117c:      	uxtb	w16, w1
    1180:      	cmp	w16, wzr
    1184:      	b.eq	0x18d8 <_stogir.verify.integer-operations-target-structured+0xb44>
    1188:      	add	x8, sp, #0xa0
    118c:      	ldr	x0, [sp, #0x298]
    1190:      	ldr	w1, [sp, #0x320]
    1194:      	bl	0x1194 <_stogir.verify.integer-operations-target-structured+0x400>
		0000000000001194:  ARM64_RELOC_BRANCH26	_stogir.checked.validate-projection
    1198:      	add	x16, sp, #0xa0
    119c:      	ldr	x0, [x16]
    11a0:      	add	x16, sp, #0xa0
    11a4:      	ldr	x1, [x16, #0x8]
    11a8:      	add	x16, sp, #0xa0
    11ac:      	ldr	x2, [x16, #0x10]
    11b0:      	ubfx	x0, x0, #0, #32
    11b4:      	lsr	x16, x0, #0
    11b8:      	cmp	x16, #0x1
    11bc:      	b.eq	0x11d8 <_stogir.verify.integer-operations-target-structured+0x444>
    11c0:      	b.lo	0x11c8 <_stogir.verify.integer-operations-target-structured+0x434>
    11c4:      	b	0x11dc <_stogir.verify.integer-operations-target-structured+0x448>
    11c8:      	cmp	x16, #0x0
    11cc:      	b.eq	0x11d4 <_stogir.verify.integer-operations-target-structured+0x440>
    11d0:      	b	0x11dc <_stogir.verify.integer-operations-target-structured+0x448>
    11d4:      	b	0x1904 <_stogir.verify.integer-operations-target-structured+0xb70>
    11d8:      	b	0x11e0 <_stogir.verify.integer-operations-target-structured+0x44c>
    11dc:      	b	0x1910 <_stogir.verify.integer-operations-target-structured+0xb7c>
    11e0:      	mov	x19, x1
    11e4:      	mov	x22, x2
    11e8:      	and	w0, w26, #0x10
    11ec:      	ubfx	x0, x0, #0, #32
    11f0:      	cmp	x0, #0x0
    11f4:      	b.ne	0x1918 <_stogir.verify.integer-operations-target-structured+0xb84>
    11f8:      	movz	x0, #0x0, lsl #48
    11fc:      	cmp	x0, #0x0
    1200:      	b.eq	0x1254 <_stogir.verify.integer-operations-target-structured+0x4c0>
    1204:      	add	x8, sp, #0xe0
    1208:      	ldr	x0, [sp, #0x298]
    120c:      	ldr	w1, [sp, #0x320]
    1210:      	bl	0x1210 <_stogir.verify.integer-operations-target-structured+0x47c>
		0000000000001210:  ARM64_RELOC_BRANCH26	_stogir.atomic.validate
    1214:      	add	x16, sp, #0xe0
    1218:      	ldr	w0, [x16]
    121c:      	lsr	x16, x0, #0
    1220:      	cmp	x16, #0x1
    1224:      	b.eq	0x1240 <_stogir.verify.integer-operations-target-structured+0x4ac>
    1228:      	b.lo	0x1230 <_stogir.verify.integer-operations-target-structured+0x49c>
    122c:      	b	0x1244 <_stogir.verify.integer-operations-target-structured+0x4b0>
    1230:      	cmp	x16, #0x0
    1234:      	b.eq	0x123c <_stogir.verify.integer-operations-target-structured+0x4a8>
    1238:      	b	0x1244 <_stogir.verify.integer-operations-target-structured+0x4b0>
    123c:      	b	0x1920 <_stogir.verify.integer-operations-target-structured+0xb8c>
    1240:      	b	0x1248 <_stogir.verify.integer-operations-target-structured+0x4b4>
    1244:      	b	0x192c <_stogir.verify.integer-operations-target-structured+0xb98>
    1248:      	add	x16, sp, #0xe0
    124c:      	ldr	x19, [x16, #0x8]
    1250:      	ldr	x22, [x25, #0x8]
    1254:      	and	w0, w26, #0x20
    1258:      	ubfx	x0, x0, #0, #32
    125c:      	cmp	x0, #0x0
    1260:      	b.ne	0x1934 <_stogir.verify.integer-operations-target-structured+0xba0>
    1264:      	movz	x0, #0x0, lsl #48
    1268:      	cmp	x0, #0x0
    126c:      	b.eq	0x1ef0 <_stogir.verify.integer-operations-target-structured+0x115c>
    1270:      	add	x8, sp, #0x100
    1274:      	ldr	x0, [sp, #0x298]
    1278:      	ldr	w1, [sp, #0x320]
    127c:      	bl	0x127c <_stogir.verify.integer-operations-target-structured+0x4e8>
		000000000000127c:  ARM64_RELOC_BRANCH26	_stogir.terminal.validate
    1280:      	add	x16, sp, #0x100
    1284:      	ldr	w0, [x16]
    1288:      	lsr	x16, x0, #0
    128c:      	cmp	x16, #0x1
    1290:      	b.eq	0x12b0 <_stogir.verify.integer-operations-target-structured+0x51c>
    1294:      	b.lo	0x129c <_stogir.verify.integer-operations-target-structured+0x508>
    1298:      	b	0x12b4 <_stogir.verify.integer-operations-target-structured+0x520>
    129c:      	cmp	x16, #0x0
    12a0:      	b.eq	0x12a8 <_stogir.verify.integer-operations-target-structured+0x514>
    12a4:      	b	0x12b4 <_stogir.verify.integer-operations-target-structured+0x520>
    12a8:      	ldr	x0, [sp, #0x328]
    12ac:      	b	0x193c <_stogir.verify.integer-operations-target-structured+0xba8>
    12b0:      	b	0x12b8 <_stogir.verify.integer-operations-target-structured+0x524>
    12b4:      	b	0x1948 <_stogir.verify.integer-operations-target-structured+0xbb4>
    12b8:      	add	x16, sp, #0x100
    12bc:      	ldr	x19, [x16, #0x8]
    12c0:      	ldr	x0, [sp, #0x328]
    12c4:      	ldr	x22, [x0, #0x8]
    12c8:      	and	w1, w26, #0x40
    12cc:      	ubfx	x1, x1, #0, #32
    12d0:      	cmp	x1, #0x0
    12d4:      	b.ne	0x1950 <_stogir.verify.integer-operations-target-structured+0xbbc>
    12d8:      	movz	x1, #0x0, lsl #48
    12dc:      	cmp	x1, #0x0
    12e0:      	b.eq	0x1ef8 <_stogir.verify.integer-operations-target-structured+0x1164>
    12e4:      	add	x8, sp, #0x120
    12e8:      	ldr	w1, [sp, #0x320]
    12ec:      	str	x0, [sp, #0x328]
    12f0:      	ldr	x0, [sp, #0x298]
    12f4:      	bl	0x12f4 <_stogir.verify.integer-operations-target-structured+0x560>
		00000000000012f4:  ARM64_RELOC_BRANCH26	_stogir.switch.validate
    12f8:      	add	x16, sp, #0x120
    12fc:      	ldr	w0, [x16]
    1300:      	lsr	x16, x0, #0
    1304:      	cmp	x16, #0x1
    1308:      	b.eq	0x1328 <_stogir.verify.integer-operations-target-structured+0x594>
    130c:      	b.lo	0x1314 <_stogir.verify.integer-operations-target-structured+0x580>
    1310:      	b	0x132c <_stogir.verify.integer-operations-target-structured+0x598>
    1314:      	cmp	x16, #0x0
    1318:      	b.eq	0x1320 <_stogir.verify.integer-operations-target-structured+0x58c>
    131c:      	b	0x132c <_stogir.verify.integer-operations-target-structured+0x598>
    1320:      	ldr	x0, [sp, #0x238]
    1324:      	b	0x1958 <_stogir.verify.integer-operations-target-structured+0xbc4>
    1328:      	b	0x1330 <_stogir.verify.integer-operations-target-structured+0x59c>
    132c:      	b	0x1964 <_stogir.verify.integer-operations-target-structured+0xbd0>
    1330:      	add	x16, sp, #0x120
    1334:      	ldr	x19, [x16, #0x8]
    1338:      	ldr	x0, [sp, #0x238]
    133c:      	ldr	x22, [x0, #0x8]
    1340:      	and	w1, w26, #0x80
    1344:      	ubfx	x1, x1, #0, #32
    1348:      	cmp	x1, #0x0
    134c:      	b.ne	0x196c <_stogir.verify.integer-operations-target-structured+0xbd8>
    1350:      	movz	x1, #0x0, lsl #48
    1354:      	cmp	x1, #0x0
    1358:      	b.eq	0x1f04 <_stogir.verify.integer-operations-target-structured+0x1170>
    135c:      	add	x8, sp, #0x140
    1360:      	ldr	w1, [sp, #0x320]
    1364:      	str	x0, [sp, #0x238]
    1368:      	ldr	x0, [sp, #0x298]
    136c:      	bl	0x136c <_stogir.verify.integer-operations-target-structured+0x5d8>
		000000000000136c:  ARM64_RELOC_BRANCH26	_stogir.stack.validate
    1370:      	add	x16, sp, #0x140
    1374:      	ldr	w0, [x16]
    1378:      	lsr	x16, x0, #0
    137c:      	cmp	x16, #0x1
    1380:      	b.eq	0x13a0 <_stogir.verify.integer-operations-target-structured+0x60c>
    1384:      	b.lo	0x138c <_stogir.verify.integer-operations-target-structured+0x5f8>
    1388:      	b	0x13a4 <_stogir.verify.integer-operations-target-structured+0x610>
    138c:      	cmp	x16, #0x0
    1390:      	b.eq	0x1398 <_stogir.verify.integer-operations-target-structured+0x604>
    1394:      	b	0x13a4 <_stogir.verify.integer-operations-target-structured+0x610>
    1398:      	ldr	x0, [sp, #0x240]
    139c:      	b	0x1974 <_stogir.verify.integer-operations-target-structured+0xbe0>
    13a0:      	b	0x13a8 <_stogir.verify.integer-operations-target-structured+0x614>
    13a4:      	b	0x1980 <_stogir.verify.integer-operations-target-structured+0xbec>
    13a8:      	add	x16, sp, #0x140
    13ac:      	ldr	x19, [x16, #0x8]
    13b0:      	ldr	x0, [sp, #0x240]
    13b4:      	ldr	x22, [x0, #0x8]
    13b8:      	and	w1, w26, #0x100
    13bc:      	ubfx	x1, x1, #0, #32
    13c0:      	cmp	x1, #0x0
    13c4:      	b.ne	0x1988 <_stogir.verify.integer-operations-target-structured+0xbf4>
    13c8:      	movz	x1, #0x0, lsl #48
    13cc:      	cmp	x1, #0x0
    13d0:      	b.eq	0x1f10 <_stogir.verify.integer-operations-target-structured+0x117c>
    13d4:      	add	x8, sp, #0x160
    13d8:      	ldr	w1, [sp, #0x320]
    13dc:      	ldr	w2, [sp, #0x2f0]
    13e0:      	str	x0, [sp, #0x240]
    13e4:      	ldr	x0, [sp, #0x298]
    13e8:      	bl	0x13e8 <_stogir.verify.integer-operations-target-structured+0x654>
		00000000000013e8:  ARM64_RELOC_BRANCH26	_stogir.locals.validate
    13ec:      	add	x16, sp, #0x160
    13f0:      	ldr	w0, [x16]
    13f4:      	lsr	x16, x0, #0
    13f8:      	cmp	x16, #0x1
    13fc:      	b.eq	0x141c <_stogir.verify.integer-operations-target-structured+0x688>
    1400:      	b.lo	0x1408 <_stogir.verify.integer-operations-target-structured+0x674>
    1404:      	b	0x1420 <_stogir.verify.integer-operations-target-structured+0x68c>
    1408:      	cmp	x16, #0x0
    140c:      	b.eq	0x1414 <_stogir.verify.integer-operations-target-structured+0x680>
    1410:      	b	0x1420 <_stogir.verify.integer-operations-target-structured+0x68c>
    1414:      	ldr	x0, [sp, #0x248]
    1418:      	b	0x1990 <_stogir.verify.integer-operations-target-structured+0xbfc>
    141c:      	b	0x1424 <_stogir.verify.integer-operations-target-structured+0x690>
    1420:      	b	0x199c <_stogir.verify.integer-operations-target-structured+0xc08>
    1424:      	add	x16, sp, #0x160
    1428:      	ldr	x19, [x16, #0x8]
    142c:      	ldr	x0, [sp, #0x248]
    1430:      	ldr	x22, [x0, #0x8]
    1434:      	and	w1, w26, #0x200
    1438:      	ubfx	x1, x1, #0, #32
    143c:      	cmp	x1, #0x0
    1440:      	b.ne	0x19a4 <_stogir.verify.integer-operations-target-structured+0xc10>
    1444:      	movz	x1, #0x0, lsl #48
    1448:      	cmp	x1, #0x0
    144c:      	b.eq	0x1f1c <_stogir.verify.integer-operations-target-structured+0x1188>
    1450:      	add	x8, sp, #0x180
    1454:      	ldr	w1, [sp, #0x320]
    1458:      	ldr	w2, [sp, #0x230]
    145c:      	str	x0, [sp, #0x248]
    1460:      	ldr	x0, [sp, #0x298]
    1464:      	bl	0x1464 <_stogir.verify.integer-operations-target-structured+0x6d0>
		0000000000001464:  ARM64_RELOC_BRANCH26	_stogir.conversion.validate
    1468:      	add	x16, sp, #0x180
    146c:      	ldr	w0, [x16]
    1470:      	lsr	x16, x0, #0
    1474:      	cmp	x16, #0x1
    1478:      	b.eq	0x1498 <_stogir.verify.integer-operations-target-structured+0x704>
    147c:      	b.lo	0x1484 <_stogir.verify.integer-operations-target-structured+0x6f0>
    1480:      	b	0x149c <_stogir.verify.integer-operations-target-structured+0x708>
    1484:      	cmp	x16, #0x0
    1488:      	b.eq	0x1490 <_stogir.verify.integer-operations-target-structured+0x6fc>
    148c:      	b	0x149c <_stogir.verify.integer-operations-target-structured+0x708>
    1490:      	ldr	x0, [sp, #0x250]
    1494:      	b	0x19ac <_stogir.verify.integer-operations-target-structured+0xc18>
    1498:      	b	0x14a0 <_stogir.verify.integer-operations-target-structured+0x70c>
    149c:      	b	0x19b8 <_stogir.verify.integer-operations-target-structured+0xc24>
    14a0:      	add	x16, sp, #0x180
    14a4:      	ldr	x19, [x16, #0x8]
    14a8:      	ldr	x0, [sp, #0x250]
    14ac:      	ldr	x22, [x0, #0x8]
    14b0:      	cmp	x24, #0x3c
    14b4:      	b.ne	0x1f28 <_stogir.verify.integer-operations-target-structured+0x1194>
    14b8:      	add	x8, sp, #0x1a0
    14bc:      	ldr	w1, [sp, #0x320]
    14c0:      	str	x0, [sp, #0x250]
    14c4:      	ldr	x0, [sp, #0x298]
    14c8:      	bl	0x14c8 <_stogir.verify.integer-operations-target-structured+0x734>
		00000000000014c8:  ARM64_RELOC_BRANCH26	_stogir.conditional.validate
    14cc:      	add	x16, sp, #0x1a0
    14d0:      	ldr	w0, [x16]
    14d4:      	lsr	x16, x0, #0
    14d8:      	cmp	x16, #0x1
    14dc:      	b.eq	0x14fc <_stogir.verify.integer-operations-target-structured+0x768>
    14e0:      	b.lo	0x14e8 <_stogir.verify.integer-operations-target-structured+0x754>
    14e4:      	b	0x1500 <_stogir.verify.integer-operations-target-structured+0x76c>
    14e8:      	cmp	x16, #0x0
    14ec:      	b.eq	0x14f4 <_stogir.verify.integer-operations-target-structured+0x760>
    14f0:      	b	0x1500 <_stogir.verify.integer-operations-target-structured+0x76c>
    14f4:      	ldr	x0, [sp, #0x258]
    14f8:      	b	0x19c0 <_stogir.verify.integer-operations-target-structured+0xc2c>
    14fc:      	b	0x1504 <_stogir.verify.integer-operations-target-structured+0x770>
    1500:      	b	0x19cc <_stogir.verify.integer-operations-target-structured+0xc38>
    1504:      	add	x16, sp, #0x1a0
    1508:      	ldr	x19, [x16, #0x8]
    150c:      	ldr	x0, [sp, #0x258]
    1510:      	ldr	x22, [x0, #0x8]
    1514:      	cmp	x24, #0x78
    1518:      	b.ne	0x1f34 <_stogir.verify.integer-operations-target-structured+0x11a0>
    151c:      	add	x16, sp, #0x20
    1520:      	ldr	w1, [x16]
    1524:      	ubfx	x1, x1, #8, #8
    1528:      	cmp	x1, #0x0
    152c:      	b.ne	0x19d4 <_stogir.verify.integer-operations-target-structured+0xc40>
    1530:      	add	x16, sp, #0x20
    1534:      	ldr	w1, [x16, #0x8]
    1538:      	sxtw	x1, w1
    153c:      	cmp	x1, #0x0
    1540:      	b.eq	0x154c <_stogir.verify.integer-operations-target-structured+0x7b8>
    1544:      	ldr	x19, [sp, #0x270]
    1548:      	mov	x22, #0x1f              ; =31
    154c:      	str	x0, [sp, #0x258]
    1550:      	add	x0, x21, #0x1
    1554:      	sxtw	x21, w0
    1558:      	ldr	x0, [sp, #0x330]
    155c:      	uxth	w0, w0
    1560:      	mov	w17, #0x8               ; =8
    1564:      	uxth	w16, w0
    1568:      	ubfx	w17, w17, #0, #4
    156c:      	lsr	w0, w16, w17
    1570:      	uxth	w0, w0
    1574:      	uxtb	w0, w0
    1578:      	cmp	x0, #0x0
    157c:      	b.eq	0x1f3c <_stogir.verify.integer-operations-target-structured+0x11a8>
    1580:      	add	x8, sp, #0x1f0
    1584:      	ldr	w1, [sp, #0x320]
    1588:      	str	x20, [sp, #0x338]
    158c:      	mov	x20, x0
    1590:      	ldr	x0, [sp, #0x298]
    1594:      	bl	0x1594 <_stogir.verify.integer-operations-target-structured+0x800>
		0000000000001594:  ARM64_RELOC_BRANCH26	_stogir.floating.validate
    1598:      	add	x16, sp, #0x1f0
    159c:      	ldr	w0, [x16]
    15a0:      	lsr	x16, x0, #0
    15a4:      	cmp	x16, #0x1
    15a8:      	b.eq	0x15c8 <_stogir.verify.integer-operations-target-structured+0x834>
    15ac:      	b.lo	0x15b4 <_stogir.verify.integer-operations-target-structured+0x820>
    15b0:      	b	0x15cc <_stogir.verify.integer-operations-target-structured+0x838>
    15b4:      	cmp	x16, #0x0
    15b8:      	b.eq	0x15c0 <_stogir.verify.integer-operations-target-structured+0x82c>
    15bc:      	b	0x15cc <_stogir.verify.integer-operations-target-structured+0x838>
    15c0:      	ldr	x0, [sp, #0x278]
    15c4:      	b	0x1a64 <_stogir.verify.integer-operations-target-structured+0xcd0>
    15c8:      	b	0x15d0 <_stogir.verify.integer-operations-target-structured+0x83c>
    15cc:      	b	0x1a70 <_stogir.verify.integer-operations-target-structured+0xcdc>
    15d0:      	add	x16, sp, #0x1f0
    15d4:      	ldr	x19, [x16, #0x8]
    15d8:      	ldr	x0, [sp, #0x278]
    15dc:      	ldr	x22, [x0, #0x8]
    15e0:      	uxtb	w16, w28
    15e4:      	cmp	w16, wzr
    15e8:      	b.eq	0x1a78 <_stogir.verify.integer-operations-target-structured+0xce4>
    15ec:      	movz	x1, #0x0, lsl #48
    15f0:      	and	w2, w26, #0x1
    15f4:      	and	w3, w26, #0x2
    15f8:      	ubfx	x2, x2, #0, #32
    15fc:      	ubfx	x3, x3, #0, #32
    1600:      	cmp	x2, #0x0
    1604:      	cset	w2, eq
    1608:      	cmp	x3, #0x0
    160c:      	cset	w3, eq
    1610:      	uxtb	w16, w2
    1614:      	cmp	w16, wzr
    1618:      	cset	x26, eq
    161c:      	uxtb	w16, w3
    1620:      	cmp	w16, wzr
    1624:      	cset	x28, eq
    1628:      	cmp	x1, #0x0
    162c:      	b.eq	0x1f4c <_stogir.verify.integer-operations-target-structured+0x11b8>
    1630:      	cmp	x20, #0x0
    1634:      	b.eq	0x1a80 <_stogir.verify.integer-operations-target-structured+0xcec>
    1638:      	movz	x1, #0x0, lsl #48
    163c:      	cmp	x1, #0x0
    1640:      	b.eq	0x1f54 <_stogir.verify.integer-operations-target-structured+0x11c0>
    1644:      	ldr	x20, [sp, #0x2a0]
    1648:      	cmp	x20, #0x0
    164c:      	b.eq	0x1a88 <_stogir.verify.integer-operations-target-structured+0xcf4>
    1650:      	mov	x1, #0x1                ; =1
    1654:      	cmp	x1, #0x0
    1658:      	b.eq	0x1f5c <_stogir.verify.integer-operations-target-structured+0x11c8>
    165c:      	add	x16, sp, #0x210
    1660:      	str	x16, [sp]
    1664:      	ldr	w1, [sp, #0x320]
    1668:      	str	x0, [sp, #0x278]
    166c:      	ldr	x0, [sp, #0x298]
    1670:      	mov	x2, #0x1                ; =1
    1674:      	bl	0x1674 <_stogir.verify.integer-operations-target-structured+0x8e0>
		0000000000001674:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    1678:      	ldr	x16, [sp]
    167c:      	str	x0, [x16]
    1680:      	str	x1, [x16, #0x8]
    1684:      	add	x16, sp, #0x210
    1688:      	ldr	x0, [x16]
    168c:      	add	x16, sp, #0x210
    1690:      	ldr	x1, [x16, #0x8]
    1694:      	ubfx	x0, x0, #0, #32
    1698:      	lsr	x16, x0, #0
    169c:      	cmp	x16, #0x1
    16a0:      	b.eq	0x16bc <_stogir.verify.integer-operations-target-structured+0x928>
    16a4:      	b.lo	0x16ac <_stogir.verify.integer-operations-target-structured+0x918>
    16a8:      	b	0x16c0 <_stogir.verify.integer-operations-target-structured+0x92c>
    16ac:      	cmp	x16, #0x0
    16b0:      	b.eq	0x16b8 <_stogir.verify.integer-operations-target-structured+0x924>
    16b4:      	b	0x16c0 <_stogir.verify.integer-operations-target-structured+0x92c>
    16b8:      	b	0x16c4 <_stogir.verify.integer-operations-target-structured+0x930>
    16bc:      	b	0x1ab0 <_stogir.verify.integer-operations-target-structured+0xd1c>
    16c0:      	b	0x1e64 <_stogir.verify.integer-operations-target-structured+0x10d0>
    16c4:      	str	x23, [sp, #0x340]
    16c8:      	str	x25, [sp, #0x348]
    16cc:      	str	x27, [sp, #0x350]
    16d0:      	ldr	x19, [sp, #0x2b0]
    16d4:      	mov	x22, #0x17              ; =23
    16d8:      	add	x0, x21, #0x1
    16dc:      	sxtw	x21, w0
    16e0:      	ldr	w0, [sp, #0x2a8]
    16e4:      	sxtw	x0, w0
    16e8:      	add	x0, x0, #0x4
    16ec:      	asr	x16, x0, #63
    16f0:      	lsr	x16, x16, #62
    16f4:      	add	x0, x0, x16
    16f8:      	asr	x0, x0, #2
    16fc:      	ldr	x1, [sp, #0x2e0]
    1700:      	add	x1, x0, x1
    1704:      	ldr	x8, [sp, #0x2d8]
    1708:      	ldr	x0, [sp, #0x298]
    170c:      	ldr	x11, [sp, #0x2f8]
    1710:      	ldr	x23, [sp, #0x288]
    1714:      	ldr	x24, [sp, #0x290]
    1718:      	ldr	x25, [sp, #0x2b0]
    171c:      	ldr	x26, [sp, #0x2b8]
    1720:      	ldr	x27, [sp, #0x2c8]
    1724:      	ldr	x28, [sp, #0x2d0]
    1728:      	ldr	x2, [sp, #0x280]
    172c:      	ldr	w9, [sp, #0x2e8]
    1730:      	ldr	x12, [sp, #0x340]
    1734:      	ldr	x13, [sp, #0x338]
    1738:      	ldr	x14, [sp, #0x348]
    173c:      	ldr	x15, [sp, #0x328]
    1740:      	ldr	w10, [sp, #0x2f0]
    1744:      	ldr	x3, [sp, #0x2c0]
    1748:      	ldr	x4, [sp, #0x350]
    174c:      	ldr	x5, [sp, #0x318]
    1750:      	ldr	x6, [sp, #0x310]
    1754:      	ldr	x7, [sp, #0x308]
    1758:      	mov	x20, x1
    175c:      	ldr	x1, [sp, #0x278]
    1760:      	b	0xf2c <_stogir.verify.integer-operations-target-structured+0x198>
    1764:      	movz	w2, #0x0, lsl #16
    1768:      	b	0xf94 <_stogir.verify.integer-operations-target-structured+0x200>
    176c:      	movz	x0, #0x0, lsl #48
    1770:      	b	0xfac <_stogir.verify.integer-operations-target-structured+0x218>
    1774:      	add	x8, sp, #0x30
    1778:      	ldr	w2, [sp, #0x2e8]
    177c:      	str	x0, [sp, #0x330]
    1780:      	ldr	x0, [sp, #0x298]
    1784:      	mov	w28, w1
    1788:      	ldr	w1, [sp, #0x320]
    178c:      	bl	0x178c <_stogir.verify.integer-operations-target-structured+0x9f8>
		000000000000178c:  ARM64_RELOC_BRANCH26	_stogir.vector.validate
    1790:      	add	x16, sp, #0x30
    1794:      	ldr	w0, [x16]
    1798:      	lsr	x16, x0, #0
    179c:      	cmp	x16, #0x1
    17a0:      	b.eq	0x17bc <_stogir.verify.integer-operations-target-structured+0xa28>
    17a4:      	b.lo	0x17ac <_stogir.verify.integer-operations-target-structured+0xa18>
    17a8:      	b	0x17c0 <_stogir.verify.integer-operations-target-structured+0xa2c>
    17ac:      	cmp	x16, #0x0
    17b0:      	b.eq	0x17b8 <_stogir.verify.integer-operations-target-structured+0xa24>
    17b4:      	b	0x17c0 <_stogir.verify.integer-operations-target-structured+0xa2c>
    17b8:      	b	0x17d4 <_stogir.verify.integer-operations-target-structured+0xa40>
    17bc:      	b	0x17c4 <_stogir.verify.integer-operations-target-structured+0xa30>
    17c0:      	b	0x1e6c <_stogir.verify.integer-operations-target-structured+0x10d8>
    17c4:      	add	x16, sp, #0x30
    17c8:      	ldr	x19, [x16, #0x8]
    17cc:      	ldr	x22, [x23, #0x8]
    17d0:      	b	0x1054 <_stogir.verify.integer-operations-target-structured+0x2c0>
    17d4:      	add	x0, x21, #0x1
    17d8:      	sxtw	x21, w0
    17dc:      	b	0x17d0 <_stogir.verify.integer-operations-target-structured+0xa3c>
    17e0:      	mov	x0, #0x1                ; =1
    17e4:      	b	0x106c <_stogir.verify.integer-operations-target-structured+0x2d8>
    17e8:      	movz	x0, #0x0, lsl #48
    17ec:      	b	0x106c <_stogir.verify.integer-operations-target-structured+0x2d8>
    17f0:      	add	x0, x21, #0x1
    17f4:      	sxtw	x21, w0
    17f8:      	b	0x10c4 <_stogir.verify.integer-operations-target-structured+0x330>
    17fc:      	brk	#0
    1800:      	b	0x17fc <_stogir.verify.integer-operations-target-structured+0xa68>
    1804:      	cmp	x24, #0x1e
    1808:      	cset	w0, eq
    180c:      	ubfx	x0, x0, #0, #8
    1810:      	b	0x10d0 <_stogir.verify.integer-operations-target-structured+0x33c>
    1814:      	mov	x0, #0x1                ; =1
    1818:      	b	0x10f0 <_stogir.verify.integer-operations-target-structured+0x35c>
    181c:      	movz	x0, #0x0, lsl #48
    1820:      	b	0x10f0 <_stogir.verify.integer-operations-target-structured+0x35c>
    1824:      	add	x16, sp, #0x70
    1828:      	ldr	x0, [x16, #0x8]
    182c:      	add	x16, sp, #0x20
    1830:      	ldr	w1, [x16, #0xc]
    1834:      	sxtw	x1, w1
    1838:      	cmp	x1, #0x0
    183c:      	b.ge	0x1858 <_stogir.verify.integer-operations-target-structured+0xac4>
    1840:      	mov	x0, #0x1                ; =1
    1844:      	cmp	x0, #0x0
    1848:      	b.eq	0x1854 <_stogir.verify.integer-operations-target-structured+0xac0>
    184c:      	ldr	x19, [sp, #0x268]
    1850:      	mov	x22, #0x2d              ; =45
    1854:      	b	0x114c <_stogir.verify.integer-operations-target-structured+0x3b8>
    1858:      	uxtb	w0, w0
    185c:      	cmp	x0, #0x83
    1860:      	b.ge	0x18b0 <_stogir.verify.integer-operations-target-structured+0xb1c>
    1864:      	add	x1, x0, x27
    1868:      	ldrb	w1, [x1]
    186c:      	uxtb	w16, w1
    1870:      	and	w1, w16, #0x2
    1874:      	uxtb	w1, w1
    1878:      	ubfx	x1, x1, #0, #8
    187c:      	cmp	x1, #0x0
    1880:      	cset	w1, eq
    1884:      	uxtb	w16, w1
    1888:      	cmp	w16, wzr
    188c:      	cset	x1, eq
    1890:      	cmp	x1, #0x0
    1894:      	b.ne	0x18b8 <_stogir.verify.integer-operations-target-structured+0xb24>
    1898:      	cmp	x0, #0x65
    189c:      	b.eq	0x18b8 <_stogir.verify.integer-operations-target-structured+0xb24>
    18a0:      	cmp	x0, #0x66
    18a4:      	b.eq	0x18b8 <_stogir.verify.integer-operations-target-structured+0xb24>
    18a8:      	mov	x0, #0x1                ; =1
    18ac:      	b	0x1844 <_stogir.verify.integer-operations-target-structured+0xab0>
    18b0:      	movz	w1, #0x0, lsl #16
    18b4:      	b	0x186c <_stogir.verify.integer-operations-target-structured+0xad8>
    18b8:      	movz	x0, #0x0, lsl #48
    18bc:      	b	0x18ac <_stogir.verify.integer-operations-target-structured+0xb18>
    18c0:      	brk	#0
    18c4:      	b	0x18c0 <_stogir.verify.integer-operations-target-structured+0xb2c>
    18c8:      	mov	x0, #0x1                ; =1
    18cc:      	b	0x1160 <_stogir.verify.integer-operations-target-structured+0x3cc>
    18d0:      	ubfx	x0, x1, #0, #8
    18d4:      	b	0x1174 <_stogir.verify.integer-operations-target-structured+0x3e0>
    18d8:      	add	x8, sp, #0xc0
    18dc:      	ldr	x0, [sp, #0x298]
    18e0:      	ldr	w1, [sp, #0x320]
    18e4:      	bl	0x18e4 <_stogir.verify.integer-operations-target-structured+0xb50>
		00000000000018e4:  ARM64_RELOC_BRANCH26	_stogir.checked.validate
    18e8:      	add	x16, sp, #0xc0
    18ec:      	ldr	x0, [x16]
    18f0:      	add	x16, sp, #0xc0
    18f4:      	ldr	x1, [x16, #0x8]
    18f8:      	add	x16, sp, #0xc0
    18fc:      	ldr	x2, [x16, #0x10]
    1900:      	b	0x11b0 <_stogir.verify.integer-operations-target-structured+0x41c>
    1904:      	add	x0, x21, #0x1
    1908:      	sxtw	x21, w0
    190c:      	b	0x11e8 <_stogir.verify.integer-operations-target-structured+0x454>
    1910:      	brk	#0
    1914:      	b	0x1910 <_stogir.verify.integer-operations-target-structured+0xb7c>
    1918:      	mov	x0, #0x1                ; =1
    191c:      	b	0x11fc <_stogir.verify.integer-operations-target-structured+0x468>
    1920:      	add	x0, x21, #0x1
    1924:      	sxtw	x21, w0
    1928:      	b	0x1254 <_stogir.verify.integer-operations-target-structured+0x4c0>
    192c:      	brk	#0
    1930:      	b	0x192c <_stogir.verify.integer-operations-target-structured+0xb98>
    1934:      	mov	x0, #0x1                ; =1
    1938:      	b	0x1268 <_stogir.verify.integer-operations-target-structured+0x4d4>
    193c:      	add	x1, x21, #0x1
    1940:      	sxtw	x21, w1
    1944:      	b	0x12c8 <_stogir.verify.integer-operations-target-structured+0x534>
    1948:      	brk	#0
    194c:      	b	0x1948 <_stogir.verify.integer-operations-target-structured+0xbb4>
    1950:      	mov	x1, #0x1                ; =1
    1954:      	b	0x12dc <_stogir.verify.integer-operations-target-structured+0x548>
    1958:      	add	x1, x21, #0x1
    195c:      	sxtw	x21, w1
    1960:      	b	0x1340 <_stogir.verify.integer-operations-target-structured+0x5ac>
    1964:      	brk	#0
    1968:      	b	0x1964 <_stogir.verify.integer-operations-target-structured+0xbd0>
    196c:      	mov	x1, #0x1                ; =1
    1970:      	b	0x1354 <_stogir.verify.integer-operations-target-structured+0x5c0>
    1974:      	add	x1, x21, #0x1
    1978:      	sxtw	x21, w1
    197c:      	b	0x13b8 <_stogir.verify.integer-operations-target-structured+0x624>
    1980:      	brk	#0
    1984:      	b	0x1980 <_stogir.verify.integer-operations-target-structured+0xbec>
    1988:      	mov	x1, #0x1                ; =1
    198c:      	b	0x13cc <_stogir.verify.integer-operations-target-structured+0x638>
    1990:      	add	x1, x21, #0x1
    1994:      	sxtw	x21, w1
    1998:      	b	0x1434 <_stogir.verify.integer-operations-target-structured+0x6a0>
    199c:      	brk	#0
    19a0:      	b	0x199c <_stogir.verify.integer-operations-target-structured+0xc08>
    19a4:      	mov	x1, #0x1                ; =1
    19a8:      	b	0x1448 <_stogir.verify.integer-operations-target-structured+0x6b4>
    19ac:      	add	x1, x21, #0x1
    19b0:      	sxtw	x21, w1
    19b4:      	b	0x14b0 <_stogir.verify.integer-operations-target-structured+0x71c>
    19b8:      	brk	#0
    19bc:      	b	0x19b8 <_stogir.verify.integer-operations-target-structured+0xc24>
    19c0:      	add	x1, x21, #0x1
    19c4:      	sxtw	x21, w1
    19c8:      	b	0x1514 <_stogir.verify.integer-operations-target-structured+0x780>
    19cc:      	brk	#0
    19d0:      	b	0x19cc <_stogir.verify.integer-operations-target-structured+0xc38>
    19d4:      	add	x16, sp, #0x20
    19d8:      	ldr	w1, [x16, #0x8]
    19dc:      	add	x8, sp, #0x1c0
    19e0:      	str	x0, [sp, #0x258]
    19e4:      	ldr	x0, [sp, #0x298]
    19e8:      	bl	0x19e8 <_stogir.verify.integer-operations-target-structured+0xc54>
		00000000000019e8:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    19ec:      	add	x16, sp, #0x1c0
    19f0:      	ldr	w0, [x16]
    19f4:      	lsr	x16, x0, #0
    19f8:      	cmp	x16, #0x1
    19fc:      	b.eq	0x1a18 <_stogir.verify.integer-operations-target-structured+0xc84>
    1a00:      	b.lo	0x1a08 <_stogir.verify.integer-operations-target-structured+0xc74>
    1a04:      	b	0x1a1c <_stogir.verify.integer-operations-target-structured+0xc88>
    1a08:      	cmp	x16, #0x0
    1a0c:      	b.eq	0x1a14 <_stogir.verify.integer-operations-target-structured+0xc80>
    1a10:      	b	0x1a1c <_stogir.verify.integer-operations-target-structured+0xc88>
    1a14:      	b	0x1a20 <_stogir.verify.integer-operations-target-structured+0xc8c>
    1a18:      	b	0x1a2c <_stogir.verify.integer-operations-target-structured+0xc98>
    1a1c:      	b	0x1a5c <_stogir.verify.integer-operations-target-structured+0xcc8>
    1a20:      	ldr	x19, [sp, #0x288]
    1a24:      	mov	x22, #0x14              ; =20
    1a28:      	b	0x1550 <_stogir.verify.integer-operations-target-structured+0x7bc>
    1a2c:      	add	x16, sp, #0x1c0
    1a30:      	ldr	x0, [x16, #0x8]
    1a34:      	add	x16, sp, #0x20
    1a38:      	ldr	w1, [x16]
    1a3c:      	ubfx	x0, x0, #0, #32
    1a40:      	ubfx	x1, x1, #8, #8
    1a44:      	ubfx	x0, x0, #8, #8
    1a48:      	cmp	x0, x1
    1a4c:      	b.eq	0x1a58 <_stogir.verify.integer-operations-target-structured+0xcc4>
    1a50:      	ldr	x19, [sp, #0x290]
    1a54:      	mov	x22, #0x1a              ; =26
    1a58:      	b	0x1a28 <_stogir.verify.integer-operations-target-structured+0xc94>
    1a5c:      	brk	#0
    1a60:      	b	0x1a5c <_stogir.verify.integer-operations-target-structured+0xcc8>
    1a64:      	add	x1, x21, #0x1
    1a68:      	sxtw	x21, w1
    1a6c:      	b	0x15e0 <_stogir.verify.integer-operations-target-structured+0x84c>
    1a70:      	brk	#0
    1a74:      	b	0x1a70 <_stogir.verify.integer-operations-target-structured+0xcdc>
    1a78:      	mov	x1, #0x1                ; =1
    1a7c:      	b	0x15f0 <_stogir.verify.integer-operations-target-structured+0x85c>
    1a80:      	mov	x1, #0x1                ; =1
    1a84:      	b	0x163c <_stogir.verify.integer-operations-target-structured+0x8a8>
    1a88:      	cmp	x26, #0x0
    1a8c:      	b.eq	0x1a98 <_stogir.verify.integer-operations-target-structured+0xd04>
    1a90:      	mov	x1, #0x1                ; =1
    1a94:      	b	0x1654 <_stogir.verify.integer-operations-target-structured+0x8c0>
    1a98:      	mov	x1, x28
    1a9c:      	b	0x1a94 <_stogir.verify.integer-operations-target-structured+0xd00>
    1aa0:      	movz	x1, #0x0, lsl #48
    1aa4:      	b	0x1654 <_stogir.verify.integer-operations-target-structured+0x8c0>
    1aa8:      	movz	x1, #0x0, lsl #48
    1aac:      	b	0x1654 <_stogir.verify.integer-operations-target-structured+0x8c0>
    1ab0:      	sxtw	x1, w1
    1ab4:      	cmp	x1, #0x0
    1ab8:      	cset	w0, gt
    1abc:      	movz	x16, #0x0, lsl #48
    1ac0:      	sub	x2, x16, x1
    1ac4:      	sub	x3, x2, #0x1
    1ac8:      	uxtb	w16, w0
    1acc:      	cmp	w16, wzr
    1ad0:      	b.eq	0x1f70 <_stogir.verify.integer-operations-target-structured+0x11dc>
    1ad4:      	ldr	x4, [sp, #0x298]
    1ad8:      	ldr	x2, [x4, #0x8]
    1adc:      	cmp	x1, x2
    1ae0:      	b.ge	0x1f7c <_stogir.verify.integer-operations-target-structured+0x11e8>
    1ae4:      	ldr	x5, [sp, #0x318]
    1ae8:      	ldr	x2, [x5, #0x8]
    1aec:      	cmp	x1, x2
    1af0:      	b.ge	0x1b64 <_stogir.verify.integer-operations-target-structured+0xdd0>
    1af4:      	ldr	x2, [x4, #0x78]
    1af8:      	add	x2, x2, x1, lsl #2
    1afc:      	ldr	w2, [x2]
    1b00:      	sxtw	x2, w2
    1b04:      	cmp	x2, #0x0
    1b08:      	cset	w2, ge
    1b0c:      	ubfx	x2, x2, #0, #8
    1b10:      	ldr	x6, [sp, #0x310]
    1b14:      	ldr	x8, [sp, #0x308]
    1b18:      	cmp	x2, #0x0
    1b1c:      	b.eq	0x1be0 <_stogir.verify.integer-operations-target-structured+0xe4c>
    1b20:      	uxtb	w16, w0
    1b24:      	cmp	w16, wzr
    1b28:      	b.eq	0x1bd4 <_stogir.verify.integer-operations-target-structured+0xe40>
    1b2c:      	ldr	x0, [x4]
    1b30:      	add	x0, x0, x1, lsl #4
    1b34:      	cmp	x0, #0x0
    1b38:      	b.ne	0x1be8 <_stogir.verify.integer-operations-target-structured+0xe54>
    1b3c:      	str	x4, [sp, #0x298]
    1b40:      	str	x23, [sp, #0x340]
    1b44:      	str	x25, [sp, #0x348]
    1b48:      	str	x27, [sp, #0x350]
    1b4c:      	str	x5, [sp, #0x318]
    1b50:      	str	x6, [sp, #0x310]
    1b54:      	str	x8, [sp, #0x308]
    1b58:      	ldr	x19, [sp, #0x2b0]
    1b5c:      	mov	x22, #0x17              ; =23
    1b60:      	b	0x16d8 <_stogir.verify.integer-operations-target-structured+0x944>
    1b64:      	movz	x2, #0x0, lsl #48
    1b68:      	b	0x1b10 <_stogir.verify.integer-operations-target-structured+0xd7c>
    1b6c:      	movz	x2, #0x0, lsl #48
    1b70:      	b	0x1b10 <_stogir.verify.integer-operations-target-structured+0xd7c>
    1b74:      	cmp	x1, #0x0
    1b78:      	b.ge	0x1f84 <_stogir.verify.integer-operations-target-structured+0x11f0>
    1b7c:      	ldr	x6, [sp, #0x310]
    1b80:      	ldr	x7, [x6, #0x8]
    1b84:      	ldr	x8, [sp, #0x308]
    1b88:      	ldr	x9, [x8, #0x8]
    1b8c:      	cmp	x7, x9
    1b90:      	b.ne	0x1bc4 <_stogir.verify.integer-operations-target-structured+0xe30>
    1b94:      	cmp	x2, x7
    1b98:      	b.gt	0x1bbc <_stogir.verify.integer-operations-target-structured+0xe28>
    1b9c:      	ldr	x2, [x4, #0x50]
    1ba0:      	add	x2, x2, x3, lsl #2
    1ba4:      	ldr	w2, [x2]
    1ba8:      	sxtw	x2, w2
    1bac:      	cmp	x2, #0x0
    1bb0:      	cset	w2, gt
    1bb4:      	ubfx	x2, x2, #0, #8
    1bb8:      	b	0x1b18 <_stogir.verify.integer-operations-target-structured+0xd84>
    1bbc:      	movz	x2, #0x0, lsl #48
    1bc0:      	b	0x1bb8 <_stogir.verify.integer-operations-target-structured+0xe24>
    1bc4:      	movz	x2, #0x0, lsl #48
    1bc8:      	b	0x1bb8 <_stogir.verify.integer-operations-target-structured+0xe24>
    1bcc:      	movz	x2, #0x0, lsl #48
    1bd0:      	b	0x1bb8 <_stogir.verify.integer-operations-target-structured+0xe24>
    1bd4:      	ldr	x0, [x4, #0x28]
    1bd8:      	add	x0, x0, x3, lsl #4
    1bdc:      	b	0x1b34 <_stogir.verify.integer-operations-target-structured+0xda0>
    1be0:      	movz	x0, #0x0, lsl #48
    1be4:      	b	0x1b34 <_stogir.verify.integer-operations-target-structured+0xda0>
    1be8:      	ldr	w0, [x0]
    1bec:      	add	x16, sp, #0x20
    1bf0:      	ldr	w1, [x16]
    1bf4:      	ubfx	x0, x0, #8, #8
    1bf8:      	orr	x2, x0, xzr
    1bfc:      	ubfx	x1, x1, #8, #8
    1c00:      	cmp	x1, #0x6
    1c04:      	b.ne	0x1d60 <_stogir.verify.integer-operations-target-structured+0xfcc>
    1c08:      	cmp	x2, #0x6
    1c0c:      	b.ne	0x1d58 <_stogir.verify.integer-operations-target-structured+0xfc4>
    1c10:      	cmp	x24, #0x1a
    1c14:      	b.ne	0x1d48 <_stogir.verify.integer-operations-target-structured+0xfb4>
    1c18:      	mov	x1, #0x1                ; =1
    1c1c:      	cmp	x2, #0x1
    1c20:      	cset	w3, ge
    1c24:      	uxtb	w16, w3
    1c28:      	cmp	w16, wzr
    1c2c:      	b.eq	0x1f90 <_stogir.verify.integer-operations-target-structured+0x11fc>
    1c30:      	cmp	x2, #0xb
    1c34:      	cset	w7, le
    1c38:      	uxtb	w16, w7
    1c3c:      	cmp	w16, wzr
    1c40:      	b.eq	0x1fb8 <_stogir.verify.integer-operations-target-structured+0x1224>
    1c44:      	cmp	x28, #0x0
    1c48:      	b.eq	0x1fe0 <_stogir.verify.integer-operations-target-structured+0x124c>
    1c4c:      	ldr	w9, [sp, #0x300]
    1c50:      	str	x4, [sp, #0x298]
    1c54:      	str	x5, [sp, #0x318]
    1c58:      	str	x6, [sp, #0x310]
    1c5c:      	str	x8, [sp, #0x308]
    1c60:      	mov	w28, w7
    1c64:      	str	x23, [sp, #0x340]
    1c68:      	mov	x23, x2
    1c6c:      	str	x25, [sp, #0x348]
    1c70:      	mov	x25, x1
    1c74:      	mov	w1, w0
    1c78:      	mov	w0, w9
    1c7c:      	str	x27, [sp, #0x350]
    1c80:      	mov	w27, w3
    1c84:      	bl	0x1c84 <_stogir.verify.integer-operations-target-structured+0xef0>
		0000000000001c84:  ARM64_RELOC_BRANCH26	_stogir.integer-unary.valid-type?
    1c88:      	cmp	x0, #0x0
    1c8c:      	b.ne	0x1d68 <_stogir.verify.integer-operations-target-structured+0xfd4>
    1c90:      	ldr	x19, [sp, #0x2b8]
    1c94:      	mov	x22, #0x1c              ; =28
    1c98:      	add	x16, sp, #0x20
    1c9c:      	ldr	w0, [x16]
    1ca0:      	cmp	x20, #0x0
    1ca4:      	b.eq	0x1e00 <_stogir.verify.integer-operations-target-structured+0x106c>
    1ca8:      	mov	x1, #0x1                ; =1
    1cac:      	ubfx	x0, x0, #8, #8
    1cb0:      	sxtw	x1, w1
    1cb4:      	cmp	x0, x1
    1cb8:      	b.eq	0x1cc4 <_stogir.verify.integer-operations-target-structured+0xf30>
    1cbc:      	ldr	x19, [sp, #0x2c8]
    1cc0:      	mov	x22, #0x26              ; =38
    1cc4:      	cmp	x20, #0x0
    1cc8:      	b.eq	0x1cd0 <_stogir.verify.integer-operations-target-structured+0xf3c>
    1ccc:      	mov	x26, #0x1               ; =1
    1cd0:      	cmp	x26, #0x0
    1cd4:      	b.eq	0x1d44 <_stogir.verify.integer-operations-target-structured+0xfb0>
    1cd8:      	add	x16, sp, #0x220
    1cdc:      	str	x16, [sp]
    1ce0:      	ldr	x0, [sp, #0x298]
    1ce4:      	ldr	w1, [sp, #0x320]
    1ce8:      	mov	x2, #0x2                ; =2
    1cec:      	bl	0x1cec <_stogir.verify.integer-operations-target-structured+0xf58>
		0000000000001cec:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    1cf0:      	ldr	x16, [sp]
    1cf4:      	str	x0, [x16]
    1cf8:      	str	x1, [x16, #0x8]
    1cfc:      	add	x16, sp, #0x220
    1d00:      	ldr	x0, [x16]
    1d04:      	add	x16, sp, #0x220
    1d08:      	ldr	x1, [x16, #0x8]
    1d0c:      	ubfx	x0, x0, #0, #32
    1d10:      	lsr	x16, x0, #0
    1d14:      	cmp	x16, #0x1
    1d18:      	b.eq	0x1d34 <_stogir.verify.integer-operations-target-structured+0xfa0>
    1d1c:      	b.lo	0x1d24 <_stogir.verify.integer-operations-target-structured+0xf90>
    1d20:      	b	0x1d38 <_stogir.verify.integer-operations-target-structured+0xfa4>
    1d24:      	cmp	x16, #0x0
    1d28:      	b.eq	0x1d30 <_stogir.verify.integer-operations-target-structured+0xf9c>
    1d2c:      	b	0x1d38 <_stogir.verify.integer-operations-target-structured+0xfa4>
    1d30:      	b	0x1d3c <_stogir.verify.integer-operations-target-structured+0xfa8>
    1d34:      	b	0x1e08 <_stogir.verify.integer-operations-target-structured+0x1074>
    1d38:      	b	0x1e5c <_stogir.verify.integer-operations-target-structured+0x10c8>
    1d3c:      	ldr	x19, [sp, #0x2d0]
    1d40:      	mov	x22, #0x1d              ; =29
    1d44:      	b	0x1b60 <_stogir.verify.integer-operations-target-structured+0xdcc>
    1d48:      	cmp	x24, #0x1b
    1d4c:      	cset	w1, eq
    1d50:      	ubfx	x1, x1, #0, #8
    1d54:      	b	0x1c1c <_stogir.verify.integer-operations-target-structured+0xe88>
    1d58:      	movz	x1, #0x0, lsl #48
    1d5c:      	b	0x1c1c <_stogir.verify.integer-operations-target-structured+0xe88>
    1d60:      	movz	x1, #0x0, lsl #48
    1d64:      	b	0x1c1c <_stogir.verify.integer-operations-target-structured+0xe88>
    1d68:      	cmp	x26, #0x0
    1d6c:      	b.eq	0x1c98 <_stogir.verify.integer-operations-target-structured+0xf04>
    1d70:      	cmp	x24, #0x3a
    1d74:      	cset	w0, eq
    1d78:      	cmp	x24, #0x1a
    1d7c:      	b.lt	0x1dd8 <_stogir.verify.integer-operations-target-structured+0x1044>
    1d80:      	cmp	x24, #0x1e
    1d84:      	b.gt	0x1dd8 <_stogir.verify.integer-operations-target-structured+0x1044>
    1d88:      	uxtb	w16, w27
    1d8c:      	cmp	w16, wzr
    1d90:      	b.eq	0x1c90 <_stogir.verify.integer-operations-target-structured+0xefc>
    1d94:      	uxtb	w16, w28
    1d98:      	cmp	w16, wzr
    1d9c:      	b.eq	0x1c90 <_stogir.verify.integer-operations-target-structured+0xefc>
    1da0:      	cmp	x23, #0x1
    1da4:      	b.ne	0x1c98 <_stogir.verify.integer-operations-target-structured+0xf04>
    1da8:      	cmp	x24, #0x2e
    1dac:      	b.eq	0x1c98 <_stogir.verify.integer-operations-target-structured+0xf04>
    1db0:      	cmp	x24, #0x2f
    1db4:      	b.eq	0x1c98 <_stogir.verify.integer-operations-target-structured+0xf04>
    1db8:      	cmp	x24, #0x30
    1dbc:      	b.eq	0x1c98 <_stogir.verify.integer-operations-target-structured+0xf04>
    1dc0:      	uxtb	w16, w0
    1dc4:      	cmp	w16, wzr
    1dc8:      	b.ne	0x1c98 <_stogir.verify.integer-operations-target-structured+0xf04>
    1dcc:      	cmp	x24, #0x3b
    1dd0:      	b.ne	0x1c90 <_stogir.verify.integer-operations-target-structured+0xefc>
    1dd4:      	b	0x1c98 <_stogir.verify.integer-operations-target-structured+0xf04>
    1dd8:      	cmp	x24, #0x2e
    1ddc:      	b.lt	0x1de8 <_stogir.verify.integer-operations-target-structured+0x1054>
    1de0:      	cmp	x24, #0x35
    1de4:      	b.le	0x1d88 <_stogir.verify.integer-operations-target-structured+0xff4>
    1de8:      	uxtb	w16, w0
    1dec:      	cmp	w16, wzr
    1df0:      	b.ne	0x1d88 <_stogir.verify.integer-operations-target-structured+0xff4>
    1df4:      	cmp	x24, #0x3b
    1df8:      	b.eq	0x1d88 <_stogir.verify.integer-operations-target-structured+0xff4>
    1dfc:      	b	0x1c90 <_stogir.verify.integer-operations-target-structured+0xefc>
    1e00:      	mov	x1, x23
    1e04:      	b	0x1cac <_stogir.verify.integer-operations-target-structured+0xf18>
    1e08:      	ldr	x0, [sp, #0x298]
    1e0c:      	bl	0x1e0c <_stogir.verify.integer-operations-target-structured+0x1078>
		0000000000001e0c:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
    1e10:      	cmp	x0, #0x0
    1e14:      	b.ne	0x1e24 <_stogir.verify.integer-operations-target-structured+0x1090>
    1e18:      	ldr	x19, [sp, #0x2d0]
    1e1c:      	mov	x22, #0x1d              ; =29
    1e20:      	b	0x1d44 <_stogir.verify.integer-operations-target-structured+0xfb0>
    1e24:      	ldr	w0, [x0]
    1e28:      	ubfx	x0, x0, #8, #8
    1e2c:      	cmp	x23, x0
    1e30:      	b.eq	0x1e4c <_stogir.verify.integer-operations-target-structured+0x10b8>
    1e34:      	cmp	x25, #0x0
    1e38:      	b.eq	0x1e50 <_stogir.verify.integer-operations-target-structured+0x10bc>
    1e3c:      	cmp	x0, #0x5
    1e40:      	b.eq	0x1e4c <_stogir.verify.integer-operations-target-structured+0x10b8>
    1e44:      	cmp	x0, #0xb
    1e48:      	b.ne	0x1e50 <_stogir.verify.integer-operations-target-structured+0x10bc>
    1e4c:      	b	0x1e20 <_stogir.verify.integer-operations-target-structured+0x108c>
    1e50:      	ldr	x19, [sp, #0x280]
    1e54:      	mov	x22, #0x1d              ; =29
    1e58:      	b	0x1e4c <_stogir.verify.integer-operations-target-structured+0x10b8>
    1e5c:      	brk	#0
    1e60:      	b	0x1e5c <_stogir.verify.integer-operations-target-structured+0x10c8>
    1e64:      	brk	#0
    1e68:      	b	0x1e64 <_stogir.verify.integer-operations-target-structured+0x10d0>
    1e6c:      	brk	#0
    1e70:      	b	0x1e6c <_stogir.verify.integer-operations-target-structured+0x10d8>
    1e74:      	cmp	x22, #0x0
    1e78:      	b.ne	0x1ed0 <_stogir.verify.integer-operations-target-structured+0x113c>
    1e7c:      	and	x19, x21, #0xffffffff
    1e80:      	movz	x0, #0x0, lsl #48
    1e84:      	movz	x22, #0x0, lsl #48
    1e88:      	ldr	x1, [sp, #0x2d8]
    1e8c:      	str	x0, [x1]
    1e90:      	str	x19, [x1, #0x8]
    1e94:      	str	x22, [x1, #0x10]
    1e98:      	ldr	x19, [sp, #0x358]
    1e9c:      	ldr	x20, [sp, #0x360]
    1ea0:      	ldr	x21, [sp, #0x368]
    1ea4:      	ldr	x22, [sp, #0x370]
    1ea8:      	ldr	x23, [sp, #0x378]
    1eac:      	ldr	x24, [sp, #0x380]
    1eb0:      	ldr	x25, [sp, #0x388]
    1eb4:      	ldr	x26, [sp, #0x390]
    1eb8:      	ldr	x27, [sp, #0x398]
    1ebc:      	ldr	x28, [sp, #0x3a0]
    1ec0:      	ldr	x29, [sp, #0x10]
    1ec4:      	ldr	x30, [sp, #0x18]
    1ec8:      	add	sp, sp, #0x3b0
    1ecc:      	ret
    1ed0:      	mov	x0, #0x1                ; =1
    1ed4:      	b	0x1e88 <_stogir.verify.integer-operations-target-structured+0x10f4>
    1ed8:      	str	x8, [sp, #0x2d8]
    1edc:      	b	0x1e74 <_stogir.verify.integer-operations-target-structured+0x10e0>
    1ee0:      	str	x8, [sp, #0x2d8]
    1ee4:      	b	0x1e74 <_stogir.verify.integer-operations-target-structured+0x10e0>
    1ee8:      	str	x0, [sp, #0x298]
    1eec:      	b	0x176c <_stogir.verify.integer-operations-target-structured+0x9d8>
    1ef0:      	ldr	x0, [sp, #0x328]
    1ef4:      	b	0x12c8 <_stogir.verify.integer-operations-target-structured+0x534>
    1ef8:      	str	x0, [sp, #0x328]
    1efc:      	ldr	x0, [sp, #0x238]
    1f00:      	b	0x1340 <_stogir.verify.integer-operations-target-structured+0x5ac>
    1f04:      	str	x0, [sp, #0x238]
    1f08:      	ldr	x0, [sp, #0x240]
    1f0c:      	b	0x13b8 <_stogir.verify.integer-operations-target-structured+0x624>
    1f10:      	str	x0, [sp, #0x240]
    1f14:      	ldr	x0, [sp, #0x248]
    1f18:      	b	0x1434 <_stogir.verify.integer-operations-target-structured+0x6a0>
    1f1c:      	str	x0, [sp, #0x248]
    1f20:      	ldr	x0, [sp, #0x250]
    1f24:      	b	0x14b0 <_stogir.verify.integer-operations-target-structured+0x71c>
    1f28:      	str	x0, [sp, #0x250]
    1f2c:      	ldr	x0, [sp, #0x258]
    1f30:      	b	0x1514 <_stogir.verify.integer-operations-target-structured+0x780>
    1f34:      	str	x0, [sp, #0x258]
    1f38:      	b	0x1558 <_stogir.verify.integer-operations-target-structured+0x7c4>
    1f3c:      	str	x20, [sp, #0x338]
    1f40:      	mov	x20, x0
    1f44:      	ldr	x0, [sp, #0x278]
    1f48:      	b	0x15e0 <_stogir.verify.integer-operations-target-structured+0x84c>
    1f4c:      	ldr	x20, [sp, #0x2a0]
    1f50:      	b	0x1aa8 <_stogir.verify.integer-operations-target-structured+0xd14>
    1f54:      	ldr	x20, [sp, #0x2a0]
    1f58:      	b	0x1aa0 <_stogir.verify.integer-operations-target-structured+0xd0c>
    1f5c:      	str	x23, [sp, #0x340]
    1f60:      	str	x25, [sp, #0x348]
    1f64:      	str	x0, [sp, #0x278]
    1f68:      	str	x27, [sp, #0x350]
    1f6c:      	b	0x16e0 <_stogir.verify.integer-operations-target-structured+0x94c>
    1f70:      	ldr	x4, [sp, #0x298]
    1f74:      	ldr	x5, [sp, #0x318]
    1f78:      	b	0x1b74 <_stogir.verify.integer-operations-target-structured+0xde0>
    1f7c:      	ldr	x5, [sp, #0x318]
    1f80:      	b	0x1b6c <_stogir.verify.integer-operations-target-structured+0xdd8>
    1f84:      	ldr	x6, [sp, #0x310]
    1f88:      	ldr	x8, [sp, #0x308]
    1f8c:      	b	0x1bcc <_stogir.verify.integer-operations-target-structured+0xe38>
    1f90:      	str	x4, [sp, #0x298]
    1f94:      	str	x23, [sp, #0x340]
    1f98:      	str	x25, [sp, #0x348]
    1f9c:      	mov	x25, x1
    1fa0:      	mov	x23, x2
    1fa4:      	str	x27, [sp, #0x350]
    1fa8:      	str	x5, [sp, #0x318]
    1fac:      	str	x6, [sp, #0x310]
    1fb0:      	str	x8, [sp, #0x308]
    1fb4:      	b	0x1c90 <_stogir.verify.integer-operations-target-structured+0xefc>
    1fb8:      	str	x4, [sp, #0x298]
    1fbc:      	str	x23, [sp, #0x340]
    1fc0:      	str	x25, [sp, #0x348]
    1fc4:      	mov	x25, x1
    1fc8:      	mov	x23, x2
    1fcc:      	str	x27, [sp, #0x350]
    1fd0:      	str	x5, [sp, #0x318]
    1fd4:      	str	x6, [sp, #0x310]
    1fd8:      	str	x8, [sp, #0x308]
    1fdc:      	b	0x1c90 <_stogir.verify.integer-operations-target-structured+0xefc>
    1fe0:      	str	x4, [sp, #0x298]
    1fe4:      	str	x23, [sp, #0x340]
    1fe8:      	str	x25, [sp, #0x348]
    1fec:      	mov	x25, x1
    1ff0:      	mov	x23, x2
    1ff4:      	mov	w28, w7
    1ff8:      	str	x27, [sp, #0x350]
    1ffc:      	mov	w27, w3
    2000:      	str	x5, [sp, #0x318]
    2004:      	str	x6, [sp, #0x310]
    2008:      	str	x8, [sp, #0x308]
    200c:      	b	0x1d68 <_stogir.verify.integer-operations-target-structured+0xfd4>

0000000000002010 <_coil.core.Eq$slice<u8>$=>:
    2010:      	sub	sp, sp, #0x10
    2014:      	str	x29, [sp]
    2018:      	str	x30, [sp, #0x8]
    201c:      	mov	x29, sp
    2020:      	cmp	x1, x3
    2024:      	b.ne	0x2060 <_coil.core.Eq$slice<u8>$=+0x50>
    2028:      	cmp	x1, #0x0
    202c:      	b.ne	0x2038 <_coil.core.Eq$slice<u8>$=+0x28>
    2030:      	mov	x0, #0x1                ; =1
    2034:      	b	0x205c <_coil.core.Eq$slice<u8>$=+0x4c>
    2038:      	lsr	x1, x1, #0
    203c:      	fmov	d31, x1
    2040:      	mov	x1, x2
    2044:      	fmov	x2, d31
    2048:      	bl	0x2048 <_coil.core.Eq$slice<u8>$=+0x38>
		0000000000002048:  ARM64_RELOC_BRANCH26	_memcmp
    204c:      	sxtw	x0, w0
    2050:      	cmp	x0, #0x0
    2054:      	cset	w0, eq
    2058:      	ubfx	x0, x0, #0, #8
    205c:      	b	0x2064 <_coil.core.Eq$slice<u8>$=+0x54>
    2060:      	movz	x0, #0x0, lsl #48
    2064:      	ldr	x29, [sp]
    2068:      	ldr	x30, [sp, #0x8]
    206c:      	add	sp, sp, #0x10
    2070:      	ret

0000000000002074 <_stogir.types.valid?>:
    2074:      	sxtw	x1, w0
    2078:      	cmp	x1, #0x0
    207c:      	b.lt	0x2090 <_stogir.types.valid?+0x1c>
    2080:      	cmp	x1, #0xd
    2084:      	b.gt	0x2090 <_stogir.types.valid?+0x1c>
    2088:      	mov	x0, #0x1                ; =1
    208c:      	b	0x20cc <_stogir.types.valid?+0x58>
    2090:      	cmp	x1, #0xf
    2094:      	b.le	0x20c8 <_stogir.types.valid?+0x54>
    2098:      	cmp	x1, #0x80
    209c:      	b.ge	0x20c0 <_stogir.types.valid?+0x4c>
    20a0:      	and	w0, w0, #0xf
    20a4:      	ubfx	x0, x0, #0, #32
    20a8:      	cmp	x0, #0x1
    20ac:      	b.lt	0x20d0 <_stogir.types.valid?+0x5c>
    20b0:      	cmp	x0, #0xd
    20b4:      	cset	w0, le
    20b8:      	ubfx	x0, x0, #0, #8
    20bc:      	b	0x20d4 <_stogir.types.valid?+0x60>
    20c0:      	movz	x0, #0x0, lsl #48
    20c4:      	b	0x20cc <_stogir.types.valid?+0x58>
    20c8:      	movz	x0, #0x0, lsl #48
    20cc:      	ret
    20d0:      	movz	x0, #0x0, lsl #48
    20d4:      	b	0x20c4 <_stogir.types.valid?+0x50>

00000000000020d8 <_stogir.opcode.input-count>:
    20d8:      	sxtw	x0, w0
    20dc:      	cmp	x0, #0x0
    20e0:      	b.lt	0x2108 <_stogir.opcode.input-count+0x30>
    20e4:      	cmp	x0, #0x83
    20e8:      	b.ge	0x2108 <_stogir.opcode.input-count+0x30>
    20ec:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0x126c>
		00000000000020ec:  ARM64_RELOC_PAGE21	l_stogir.344
    20f0:      	ldr	x16, [x16]
		00000000000020f0:  ARM64_RELOC_PAGEOFF12	l_stogir.344
    20f4:      	orr	x1, x16, xzr
    20f8:      	add	x0, x1, x0
    20fc:      	ldrsb	w0, [x0]
    2100:      	sxtb	x0, w0
    2104:      	b	0x210c <_stogir.opcode.input-count+0x34>
    2108:      	mov	x0, #-0x2               ; =-2
    210c:      	ret

0000000000002110 <_stogir.graph.operand>:
    2110:      	sub	sp, sp, #0x10
    2114:      	mov	x3, sp
    2118:      	sxtw	x1, w1
    211c:      	cmp	x1, #0x0
    2120:      	b.le	0x2164 <_stogir.graph.operand+0x54>
    2124:      	lsl	x4, x1, #2
    2128:      	ldr	x5, [x0, #0x8]
    212c:      	cmp	x1, x5
    2130:      	b.ge	0x2198 <_stogir.graph.operand+0x88>
    2134:      	add	x5, x0, #0x78
    2138:      	ldr	x5, [x5, #0x8]
    213c:      	cmp	x1, x5
    2140:      	b.ge	0x2190 <_stogir.graph.operand+0x80>
    2144:      	ldr	x5, [x0, #0x78]
    2148:      	add	x5, x4, x5
    214c:      	ldr	w5, [x5]
    2150:      	sxtw	x5, w5
    2154:      	cmp	x5, #0x0
    2158:      	cset	w5, ge
    215c:      	ubfx	x5, x5, #0, #8
    2160:      	b	0x2194 <_stogir.graph.operand+0x84>
    2164:      	movz	x1, #0x0, lsl #48
    2168:      	movz	x0, #0x0, lsl #48
    216c:      	str	x1, [x3]
    2170:      	str	x0, [x3, #0x8]
    2174:      	ldr	x0, [sp]
    2178:      	ldr	x1, [sp, #0x8]
    217c:      	add	sp, sp, #0x10
    2180:      	ret
    2184:      	movz	x1, #0x0, lsl #48
    2188:      	movz	x0, #0x0, lsl #48
    218c:      	b	0x216c <_stogir.graph.operand+0x5c>
    2190:      	movz	x5, #0x0, lsl #48
    2194:      	b	0x219c <_stogir.graph.operand+0x8c>
    2198:      	movz	x5, #0x0, lsl #48
    219c:      	cmp	x5, #0x0
    21a0:      	b.eq	0x2164 <_stogir.graph.operand+0x54>
    21a4:      	sxtw	x2, w2
    21a8:      	cmp	x2, #0x1
    21ac:      	b.lt	0x2184 <_stogir.graph.operand+0x74>
    21b0:      	ldr	x5, [x0, #0x78]
    21b4:      	add	x4, x4, x5
    21b8:      	ldr	w4, [x4]
    21bc:      	sxtw	x4, w4
    21c0:      	cmp	x2, x4
    21c4:      	b.gt	0x2184 <_stogir.graph.operand+0x74>
    21c8:      	asr	x16, x2, #63
    21cc:      	lsr	x16, x16, #62
    21d0:      	add	x4, x2, x16
    21d4:      	asr	x4, x4, #2
    21d8:      	asr	x16, x2, #63
    21dc:      	lsr	x16, x16, #62
    21e0:      	add	x2, x2, x16
    21e4:      	and	x2, x2, #0x3
    21e8:      	sub	x2, x2, x16
    21ec:      	ldr	x0, [x0]
    21f0:      	add	x1, x4, x1
    21f4:      	add	x0, x0, x1, lsl #4
    21f8:      	add	x0, x0, x2, lsl #2
    21fc:      	ldr	w0, [x0]
    2200:      	sxtw	x0, w0
    2204:      	and	x0, x0, #0xffffffff
    2208:      	mov	x1, #0x1                ; =1
    220c:      	b	0x218c <_stogir.graph.operand+0x7c>

0000000000002210 <_stogir.graph.borrow-node>:
    2210:      	sxtw	x1, w1
    2214:      	cmp	x1, #0x0
    2218:      	cset	w2, gt
    221c:      	movz	x16, #0x0, lsl #48
    2220:      	sub	x3, x16, x1
    2224:      	sub	x4, x3, #0x1
    2228:      	uxtb	w16, w2
    222c:      	cmp	w16, wzr
    2230:      	b.eq	0x2270 <_stogir.graph.borrow-node+0x60>
    2234:      	ldr	x3, [x0, #0x8]
    2238:      	cmp	x1, x3
    223c:      	b.ge	0x22c0 <_stogir.graph.borrow-node+0xb0>
    2240:      	add	x3, x0, #0x78
    2244:      	ldr	x3, [x3, #0x8]
    2248:      	cmp	x1, x3
    224c:      	b.ge	0x2300 <_stogir.graph.borrow-node+0xf0>
    2250:      	ldr	x3, [x0, #0x78]
    2254:      	add	x3, x3, x1, lsl #2
    2258:      	ldr	w3, [x3]
    225c:      	sxtw	x3, w3
    2260:      	cmp	x3, #0x0
    2264:      	cset	w3, ge
    2268:      	ubfx	x3, x3, #0, #8
    226c:      	b	0x2304 <_stogir.graph.borrow-node+0xf4>
    2270:      	cmp	x1, #0x0
    2274:      	b.ge	0x22c8 <_stogir.graph.borrow-node+0xb8>
    2278:      	add	x5, x0, #0x28
    227c:      	add	x6, x0, #0x50
    2280:      	ldr	x5, [x5, #0x8]
    2284:      	ldr	x6, [x6, #0x8]
    2288:      	cmp	x5, x6
    228c:      	b.ne	0x22b8 <_stogir.graph.borrow-node+0xa8>
    2290:      	cmp	x3, x5
    2294:      	b.gt	0x2308 <_stogir.graph.borrow-node+0xf8>
    2298:      	ldr	x3, [x0, #0x50]
    229c:      	add	x3, x3, x4, lsl #2
    22a0:      	ldr	w3, [x3]
    22a4:      	sxtw	x3, w3
    22a8:      	cmp	x3, #0x0
    22ac:      	cset	w3, gt
    22b0:      	ubfx	x3, x3, #0, #8
    22b4:      	b	0x230c <_stogir.graph.borrow-node+0xfc>
    22b8:      	movz	x3, #0x0, lsl #48
    22bc:      	b	0x22cc <_stogir.graph.borrow-node+0xbc>
    22c0:      	movz	x3, #0x0, lsl #48
    22c4:      	b	0x22cc <_stogir.graph.borrow-node+0xbc>
    22c8:      	movz	x3, #0x0, lsl #48
    22cc:      	cmp	x3, #0x0
    22d0:      	b.eq	0x22f8 <_stogir.graph.borrow-node+0xe8>
    22d4:      	uxtb	w16, w2
    22d8:      	cmp	w16, wzr
    22dc:      	b.eq	0x22ec <_stogir.graph.borrow-node+0xdc>
    22e0:      	ldr	x0, [x0]
    22e4:      	add	x0, x0, x1, lsl #4
    22e8:      	b	0x22f4 <_stogir.graph.borrow-node+0xe4>
    22ec:      	ldr	x0, [x0, #0x28]
    22f0:      	add	x0, x0, x4, lsl #4
    22f4:      	b	0x22fc <_stogir.graph.borrow-node+0xec>
    22f8:      	movz	x0, #0x0, lsl #48
    22fc:      	ret
    2300:      	movz	x3, #0x0, lsl #48
    2304:      	b	0x22c4 <_stogir.graph.borrow-node+0xb4>
    2308:      	movz	x3, #0x0, lsl #48
    230c:      	b	0x22bc <_stogir.graph.borrow-node+0xac>

0000000000002310 <_stogir.verify.classifications>:
    2310:      	sub	sp, sp, #0x70
    2314:      	str	x29, [sp]
    2318:      	str	x30, [sp, #0x8]
    231c:      	mov	x29, sp
    2320:      	str	x19, [sp, #0x20]
    2324:      	str	x20, [sp, #0x28]
    2328:      	str	x21, [sp, #0x30]
    232c:      	str	x22, [sp, #0x38]
    2330:      	str	x23, [sp, #0x40]
    2334:      	str	x24, [sp, #0x48]
    2338:      	str	x25, [sp, #0x50]
    233c:      	str	x26, [sp, #0x58]
    2340:      	str	x27, [sp, #0x60]
    2344:      	str	x28, [sp, #0x68]
    2348:      	ldr	w4, [x2]
    234c:      	orr	x5, x4, xzr
    2350:      	ubfx	x5, x5, #8, #8
    2354:      	orr	x19, x5, xzr
    2358:      	cmp	x19, #0xf
    235c:      	b.le	0x2390 <_stogir.verify.classifications+0x80>
    2360:      	cmp	x19, #0x80
    2364:      	b.ge	0x2388 <_stogir.verify.classifications+0x78>
    2368:      	and	w5, w5, #0xf
    236c:      	ubfx	x5, x5, #0, #32
    2370:      	cmp	x5, #0x1
    2374:      	b.lt	0x286c <_stogir.verify.classifications+0x55c>
    2378:      	cmp	x5, #0xd
    237c:      	cset	w5, le
    2380:      	ubfx	x20, x5, #0, #8
    2384:      	b	0x2870 <_stogir.verify.classifications+0x560>
    2388:      	movz	x20, #0x0, lsl #48
    238c:      	b	0x2394 <_stogir.verify.classifications+0x84>
    2390:      	movz	x20, #0x0, lsl #48
    2394:      	uxtb	w21, w4
    2398:      	orr	x4, x21, xzr
    239c:      	mov	x22, x0
    23a0:      	mov	w0, w4
    23a4:      	mov	w23, w1
    23a8:      	mov	x24, x2
    23ac:      	mov	w25, w3
    23b0:      	bl	0x23b0 <_stogir.verify.classifications+0xa0>
		00000000000023b0:  ARM64_RELOC_BRANCH26	_stogir.floating.operation?
    23b4:      	cmp	x0, #0x0
    23b8:      	b.eq	0x23d4 <_stogir.verify.classifications+0xc4>
    23bc:      	cmp	x20, #0x0
    23c0:      	cset	w0, ne
    23c4:      	uxtb	w16, w0
    23c8:      	cmp	w16, wzr
    23cc:      	cset	x26, eq
    23d0:      	b	0x23d8 <_stogir.verify.classifications+0xc8>
    23d4:      	movz	x26, #0x0, lsl #48
    23d8:      	cmp	x26, #0x0
    23dc:      	cset	w27, ne
    23e0:      	uxtb	w16, w27
    23e4:      	cmp	w16, wzr
    23e8:      	b.eq	0x241c <_stogir.verify.classifications+0x10c>
    23ec:      	ldr	w0, [x24, #0x4]
    23f0:      	mov	w1, w0
    23f4:      	mov	x0, x22
    23f8:      	bl	0x23f8 <_stogir.verify.classifications+0xe8>
		00000000000023f8:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
    23fc:      	cmp	x0, #0x0
    2400:      	b.ne	0x240c <_stogir.verify.classifications+0xfc>
    2404:      	movn	w28, #0x0, lsl #16
    2408:      	b	0x2418 <_stogir.verify.classifications+0x108>
    240c:      	ldr	w0, [x0]
    2410:      	ubfx	x0, x0, #8, #8
    2414:      	orr	x28, x0, xzr
    2418:      	b	0x2420 <_stogir.verify.classifications+0x110>
    241c:      	movn	w28, #0x0, lsl #16
    2420:      	sxtw	x0, w28
    2424:      	cmp	x26, #0x0
    2428:      	b.eq	0x28c8 <_stogir.verify.classifications+0x5b8>
    242c:      	mov	x26, x0
    2430:      	mov	w0, w28
    2434:      	bl	0x2434 <_stogir.verify.classifications+0x124>
		0000000000002434:  ARM64_RELOC_BRANCH26	_stogir.types.vector?
    2438:      	cmp	x0, #0x0
    243c:      	b.eq	0x285c <_stogir.verify.classifications+0x54c>
    2440:      	movz	x0, #0x0, lsl #48
    2444:      	b	0x244c <_stogir.verify.classifications+0x13c>
    2448:      	mov	x0, #0x1                ; =1
    244c:      	b	0x2464 <_stogir.verify.classifications+0x154>
    2450:      	movz	x19, #0x0, lsl #48
    2454:      	b	0x24e0 <_stogir.verify.classifications+0x1d0>
    2458:      	movz	x20, #0x0, lsl #48
    245c:      	b	0x24e8 <_stogir.verify.classifications+0x1d8>
    2460:      	movz	x0, #0x0, lsl #48
    2464:      	sxtw	x25, w25
    2468:      	cmp	x26, #0xf
    246c:      	cset	w1, gt
    2470:      	cmp	x26, #0x80
    2474:      	cset	w2, lt
    2478:      	cmp	x21, #0x83
    247c:      	cset	w3, lt
    2480:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0x126c>
		0000000000002480:  ARM64_RELOC_PAGE21	l_stogir.345
    2484:      	ldr	x16, [x16]
		0000000000002484:  ARM64_RELOC_PAGEOFF12	l_stogir.345
    2488:      	orr	x4, x16, xzr
    248c:      	add	x5, x22, #0x78
    2490:      	add	x6, x22, #0x28
    2494:      	add	x7, x22, #0x50
    2498:      	sxtw	x23, w23
    249c:      	add	x8, x22, #0x78
    24a0:      	and	w9, w28, #0xf
    24a4:      	add	x4, x4, x21, lsl #2
    24a8:      	cmp	x23, #0x0
    24ac:      	cset	w10, le
    24b0:      	lsl	x11, x23, #2
    24b4:      	ubfx	x9, x9, #0, #32
    24b8:      	cmp	x9, #0x1
    24bc:      	cset	w12, ge
    24c0:      	cmp	x9, #0xd
    24c4:      	cset	w9, le
    24c8:      	ubfx	x9, x9, #0, #8
    24cc:      	mov	x13, #0x1               ; =1
    24d0:      	b	0x2588 <_stogir.verify.classifications+0x278>
    24d4:      	movz	x19, #0x0, lsl #48
    24d8:      	b	0x2508 <_stogir.verify.classifications+0x1f8>
    24dc:      	movz	x19, #0x0, lsl #48
    24e0:      	b	0x2510 <_stogir.verify.classifications+0x200>
    24e4:      	movz	x20, #0x0, lsl #48
    24e8:      	b	0x2580 <_stogir.verify.classifications+0x270>
    24ec:      	sub	w14, w14, #0x1
    24f0:      	lsl	w14, w14, #2
    24f4:      	ubfx	x14, x14, #0, #32
    24f8:      	lsr	x14, x19, x14
    24fc:      	and	w14, w14, #0xf
    2500:      	b	0x25cc <_stogir.verify.classifications+0x2bc>
    2504:      	movz	x19, #0x0, lsl #48
    2508:      	b	0x2510 <_stogir.verify.classifications+0x200>
    250c:      	movz	x19, #0x0, lsl #48
    2510:      	cmp	x19, #0x0
    2514:      	b.eq	0x253c <_stogir.verify.classifications+0x22c>
    2518:      	uxtb	w16, w15
    251c:      	cmp	w16, wzr
    2520:      	b.eq	0x2530 <_stogir.verify.classifications+0x220>
    2524:      	ldr	x15, [x22]
    2528:      	add	x14, x15, x14, lsl #4
    252c:      	b	0x2538 <_stogir.verify.classifications+0x228>
    2530:      	ldr	x14, [x22, #0x28]
    2534:      	add	x14, x14, x21, lsl #4
    2538:      	b	0x2540 <_stogir.verify.classifications+0x230>
    253c:      	movz	x14, #0x0, lsl #48
    2540:      	cmp	x14, #0x0
    2544:      	b.eq	0x2580 <_stogir.verify.classifications+0x270>
    2548:      	ldr	w14, [x14]
    254c:      	ubfx	x14, x14, #8, #8
    2550:      	orr	x15, x14, xzr
    2554:      	cmp	x15, #0xf
    2558:      	b.le	0x2580 <_stogir.verify.classifications+0x270>
    255c:      	cmp	x15, #0x80
    2560:      	b.ge	0x2580 <_stogir.verify.classifications+0x270>
    2564:      	and	w14, w14, #0xf
    2568:      	ubfx	x14, x14, #0, #32
    256c:      	cmp	x14, #0x1
    2570:      	b.lt	0x2580 <_stogir.verify.classifications+0x270>
    2574:      	cmp	x14, #0xd
    2578:      	b.gt	0x2580 <_stogir.verify.classifications+0x270>
    257c:      	mov	x20, #0x1               ; =1
    2580:      	add	x13, x13, #0x1
    2584:      	sxtw	x13, w13
    2588:      	cmp	x20, #0x0
    258c:      	b.ne	0x2708 <_stogir.verify.classifications+0x3f8>
    2590:      	cmp	x13, x25
    2594:      	b.gt	0x2708 <_stogir.verify.classifications+0x3f8>
    2598:      	orr	w14, w13, wzr
    259c:      	sxtw	x15, w14
    25a0:      	uxtb	w16, w3
    25a4:      	cmp	w16, wzr
    25a8:      	b.eq	0x25d0 <_stogir.verify.classifications+0x2c0>
    25ac:      	ldr	w19, [x4]
    25b0:      	cmp	x15, #0x0
    25b4:      	b.le	0x25c8 <_stogir.verify.classifications+0x2b8>
    25b8:      	cmp	x15, #0x4
    25bc:      	b.le	0x24ec <_stogir.verify.classifications+0x1dc>
    25c0:      	mov	w14, #0x4               ; =4
    25c4:      	b	0x24f0 <_stogir.verify.classifications+0x1e0>
    25c8:      	movz	w14, #0x0, lsl #16
    25cc:      	b	0x25d4 <_stogir.verify.classifications+0x2c4>
    25d0:      	movz	w14, #0x0, lsl #16
    25d4:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0x126c>
		00000000000025d4:  ARM64_RELOC_PAGE21	l_stogir.346
    25d8:      	ldr	x16, [x16]
		00000000000025d8:  ARM64_RELOC_PAGEOFF12	l_stogir.346
    25dc:      	ldr	w19, [x16]
    25e0:      	ubfx	x14, x14, #0, #32
    25e4:      	cmp	x14, x19
    25e8:      	b.eq	0x2600 <_stogir.verify.classifications+0x2f0>
    25ec:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0x126c>
		00000000000025ec:  ARM64_RELOC_PAGE21	l_stogir.347
    25f0:      	ldr	x16, [x16]
		00000000000025f0:  ARM64_RELOC_PAGEOFF12	l_stogir.347
    25f4:      	ldr	w19, [x16]
    25f8:      	cmp	x14, x19
    25fc:      	b.ne	0x2580 <_stogir.verify.classifications+0x270>
    2600:      	cmp	x13, #0x1
    2604:      	b.ne	0x2640 <_stogir.verify.classifications+0x330>
    2608:      	uxtb	w16, w27
    260c:      	cmp	w16, wzr
    2610:      	b.eq	0x2640 <_stogir.verify.classifications+0x330>
    2614:      	uxtb	w16, w1
    2618:      	cmp	w16, wzr
    261c:      	b.eq	0x24e4 <_stogir.verify.classifications+0x1d4>
    2620:      	uxtb	w16, w2
    2624:      	cmp	w16, wzr
    2628:      	b.eq	0x2458 <_stogir.verify.classifications+0x148>
    262c:      	uxtb	w16, w12
    2630:      	cmp	w16, wzr
    2634:      	b.eq	0x2810 <_stogir.verify.classifications+0x500>
    2638:      	mov	x20, x9
    263c:      	b	0x2814 <_stogir.verify.classifications+0x504>
    2640:      	cmp	x13, #0x1
    2644:      	b.ne	0x26a8 <_stogir.verify.classifications+0x398>
    2648:      	ldr	w14, [x24, #0x4]
    264c:      	sxtw	x14, w14
    2650:      	cmp	x14, #0x0
    2654:      	cset	w15, gt
    2658:      	movz	x16, #0x0, lsl #48
    265c:      	sub	x19, x16, x14
    2660:      	sub	x21, x19, #0x1
    2664:      	uxtb	w16, w15
    2668:      	cmp	w16, wzr
    266c:      	b.eq	0x26b8 <_stogir.verify.classifications+0x3a8>
    2670:      	ldr	x19, [x22, #0x8]
    2674:      	cmp	x14, x19
    2678:      	b.ge	0x2504 <_stogir.verify.classifications+0x1f4>
    267c:      	ldr	x19, [x5, #0x8]
    2680:      	cmp	x14, x19
    2684:      	b.ge	0x24d4 <_stogir.verify.classifications+0x1c4>
    2688:      	ldr	x19, [x22, #0x78]
    268c:      	add	x19, x19, x14, lsl #2
    2690:      	ldr	w19, [x19]
    2694:      	sxtw	x19, w19
    2698:      	cmp	x19, #0x0
    269c:      	cset	w19, ge
    26a0:      	ubfx	x19, x19, #0, #8
    26a4:      	b	0x24d8 <_stogir.verify.classifications+0x1c8>
    26a8:      	cmp	x13, #0x2
    26ac:      	b.ne	0x26f8 <_stogir.verify.classifications+0x3e8>
    26b0:      	ldr	w14, [x24, #0x8]
    26b4:      	b	0x264c <_stogir.verify.classifications+0x33c>
    26b8:      	cmp	x14, #0x0
    26bc:      	b.ge	0x250c <_stogir.verify.classifications+0x1fc>
    26c0:      	ldr	x26, [x6, #0x8]
    26c4:      	ldr	x28, [x7, #0x8]
    26c8:      	cmp	x26, x28
    26cc:      	b.ne	0x24dc <_stogir.verify.classifications+0x1cc>
    26d0:      	cmp	x19, x26
    26d4:      	b.gt	0x2450 <_stogir.verify.classifications+0x140>
    26d8:      	ldr	x19, [x22, #0x50]
    26dc:      	add	x19, x19, x21, lsl #2
    26e0:      	ldr	w19, [x19]
    26e4:      	sxtw	x19, w19
    26e8:      	cmp	x19, #0x0
    26ec:      	cset	w19, gt
    26f0:      	ubfx	x19, x19, #0, #8
    26f4:      	b	0x2454 <_stogir.verify.classifications+0x144>
    26f8:      	cmp	x13, #0x3
    26fc:      	b.ne	0x276c <_stogir.verify.classifications+0x45c>
    2700:      	ldr	w14, [x24, #0xc]
    2704:      	b	0x26b4 <_stogir.verify.classifications+0x3a4>
    2708:      	uxtb	w20, w20
    270c:      	uxtb	w0, w0
    2710:      	add	x16, sp, #0x10
    2714:      	movz	w17, #0x0, lsl #16
    2718:      	strh	w17, [x16]
    271c:      	add	x16, sp, #0x10
    2720:      	strb	w20, [x16]
    2724:      	add	x16, sp, #0x10
    2728:      	strb	w0, [x16, #0x1]
    272c:      	add	x16, sp, #0x10
    2730:      	ldrh	w0, [x16]
    2734:      	ldr	x19, [sp, #0x20]
    2738:      	ldr	x20, [sp, #0x28]
    273c:      	ldr	x21, [sp, #0x30]
    2740:      	ldr	x22, [sp, #0x38]
    2744:      	ldr	x23, [sp, #0x40]
    2748:      	ldr	x24, [sp, #0x48]
    274c:      	ldr	x25, [sp, #0x50]
    2750:      	ldr	x26, [sp, #0x58]
    2754:      	ldr	x27, [sp, #0x60]
    2758:      	ldr	x28, [sp, #0x68]
    275c:      	ldr	x29, [sp]
    2760:      	ldr	x30, [sp, #0x8]
    2764:      	add	sp, sp, #0x70
    2768:      	ret
    276c:      	uxtb	w16, w10
    2770:      	cmp	w16, wzr
    2774:      	b.ne	0x281c <_stogir.verify.classifications+0x50c>
    2778:      	ldr	x14, [x22, #0x8]
    277c:      	cmp	x23, x14
    2780:      	b.ge	0x281c <_stogir.verify.classifications+0x50c>
    2784:      	ldr	x14, [x8, #0x8]
    2788:      	cmp	x23, x14
    278c:      	b.ge	0x281c <_stogir.verify.classifications+0x50c>
    2790:      	ldr	x14, [x22, #0x78]
    2794:      	add	x14, x11, x14
    2798:      	ldr	w14, [x14]
    279c:      	sxtw	x14, w14
    27a0:      	cmp	x14, #0x0
    27a4:      	b.lt	0x281c <_stogir.verify.classifications+0x50c>
    27a8:      	cmp	x15, #0x1
    27ac:      	b.lt	0x28a4 <_stogir.verify.classifications+0x594>
    27b0:      	ldr	x14, [x22, #0x78]
    27b4:      	add	x14, x11, x14
    27b8:      	ldr	w14, [x14]
    27bc:      	sxtw	x14, w14
    27c0:      	cmp	x15, x14
    27c4:      	b.gt	0x28a4 <_stogir.verify.classifications+0x594>
    27c8:      	ldr	x14, [x22]
    27cc:      	asr	x16, x15, #63
    27d0:      	lsr	x16, x16, #62
    27d4:      	add	x19, x15, x16
    27d8:      	asr	x19, x19, #2
    27dc:      	asr	x16, x15, #63
    27e0:      	lsr	x16, x16, #62
    27e4:      	add	x15, x15, x16
    27e8:      	and	x15, x15, #0x3
    27ec:      	sub	x15, x15, x16
    27f0:      	add	x19, x19, x23
    27f4:      	add	x14, x14, x19, lsl #4
    27f8:      	add	x14, x14, x15, lsl #2
    27fc:      	ldr	w14, [x14]
    2800:      	movn	w17, #0x0, lsl #16
    2804:      	and	w14, w14, w17
    2808:      	mov	w15, #0x1               ; =1
    280c:      	b	0x28ac <_stogir.verify.classifications+0x59c>
    2810:      	movz	x20, #0x0, lsl #48
    2814:      	b	0x245c <_stogir.verify.classifications+0x14c>
    2818:      	b	0x2704 <_stogir.verify.classifications+0x3f4>
    281c:      	movz	w15, #0x0, lsl #16
    2820:      	movz	w14, #0x0, lsl #16
    2824:      	ubfx	x15, x15, #0, #32
    2828:      	lsr	x16, x15, #0
    282c:      	cmp	x16, #0x1
    2830:      	b.eq	0x284c <_stogir.verify.classifications+0x53c>
    2834:      	b.lo	0x283c <_stogir.verify.classifications+0x52c>
    2838:      	b	0x2850 <_stogir.verify.classifications+0x540>
    283c:      	cmp	x16, #0x0
    2840:      	b.eq	0x2848 <_stogir.verify.classifications+0x538>
    2844:      	b	0x2850 <_stogir.verify.classifications+0x540>
    2848:      	b	0x2854 <_stogir.verify.classifications+0x544>
    284c:      	b	0x2818 <_stogir.verify.classifications+0x508>
    2850:      	b	0x28c0 <_stogir.verify.classifications+0x5b0>
    2854:      	movz	w14, #0x0, lsl #16
    2858:      	b	0x2818 <_stogir.verify.classifications+0x508>
    285c:      	cmp	x21, #0x18
    2860:      	b.ne	0x2874 <_stogir.verify.classifications+0x564>
    2864:      	mov	x0, #0x1                ; =1
    2868:      	b	0x244c <_stogir.verify.classifications+0x13c>
    286c:      	movz	x20, #0x0, lsl #48
    2870:      	b	0x238c <_stogir.verify.classifications+0x7c>
    2874:      	cmp	x21, #0x19
    2878:      	b.ne	0x2884 <_stogir.verify.classifications+0x574>
    287c:      	mov	x0, #0x1                ; =1
    2880:      	b	0x244c <_stogir.verify.classifications+0x13c>
    2884:      	cmp	x19, #0xc
    2888:      	b.eq	0x2448 <_stogir.verify.classifications+0x138>
    288c:      	cmp	x19, #0xd
    2890:      	b.eq	0x2448 <_stogir.verify.classifications+0x138>
    2894:      	cmp	x26, #0xc
    2898:      	b.ne	0x28b0 <_stogir.verify.classifications+0x5a0>
    289c:      	mov	x0, #0x1                ; =1
    28a0:      	b	0x28bc <_stogir.verify.classifications+0x5ac>
    28a4:      	movz	w15, #0x0, lsl #16
    28a8:      	movz	w14, #0x0, lsl #16
    28ac:      	b	0x2824 <_stogir.verify.classifications+0x514>
    28b0:      	cmp	x26, #0xd
    28b4:      	cset	w0, eq
    28b8:      	ubfx	x0, x0, #0, #8
    28bc:      	b	0x244c <_stogir.verify.classifications+0x13c>
    28c0:      	brk	#0
    28c4:      	b	0x28c0 <_stogir.verify.classifications+0x5b0>
    28c8:      	mov	x26, x0
    28cc:      	b	0x2460 <_stogir.verify.classifications+0x150>

00000000000028d0 <_stogir.vector.validate>:
    28d0:      	sub	sp, sp, #0x210
    28d4:      	str	x29, [sp]
    28d8:      	str	x30, [sp, #0x8]
    28dc:      	mov	x29, sp
    28e0:      	str	x19, [sp, #0x1c0]
    28e4:      	str	x20, [sp, #0x1c8]
    28e8:      	str	x21, [sp, #0x1d0]
    28ec:      	str	x22, [sp, #0x1d8]
    28f0:      	str	x23, [sp, #0x1e0]
    28f4:      	str	x24, [sp, #0x1e8]
    28f8:      	str	x25, [sp, #0x1f0]
    28fc:      	str	x26, [sp, #0x1f8]
    2900:      	str	x27, [sp, #0x200]
    2904:      	str	x28, [sp, #0x208]
    2908:      	orr	w19, w1, wzr
    290c:      	mov	x20, x8
    2910:      	add	x8, sp, #0x10
    2914:      	mov	x21, x0
    2918:      	mov	w22, w1
    291c:      	mov	w1, w19
    2920:      	mov	w23, w2
    2924:      	bl	0x2924 <_stogir.vector.validate+0x54>
		0000000000002924:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    2928:      	add	x16, sp, #0x10
    292c:      	ldr	w0, [x16]
    2930:      	lsr	x16, x0, #0
    2934:      	cmp	x16, #0x1
    2938:      	b.eq	0x2954 <_stogir.vector.validate+0x84>
    293c:      	b.lo	0x2944 <_stogir.vector.validate+0x74>
    2940:      	b	0x2958 <_stogir.vector.validate+0x88>
    2944:      	cmp	x16, #0x0
    2948:      	b.eq	0x2950 <_stogir.vector.validate+0x80>
    294c:      	b	0x2958 <_stogir.vector.validate+0x88>
    2950:      	b	0x295c <_stogir.vector.validate+0x8c>
    2954:      	b	0x29ec <_stogir.vector.validate+0x11c>
    2958:      	b	0x2c00 <_stogir.vector.validate+0x330>
    295c:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0x126c>
		000000000000295c:  ARM64_RELOC_PAGE21	l_stogir.348
    2960:      	ldr	x16, [x16]
		0000000000002960:  ARM64_RELOC_PAGEOFF12	l_stogir.348
    2964:      	orr	x19, x16, xzr
    2968:      	str	x20, [sp, #0x1a8]
    296c:      	mov	x0, #0x1                ; =1
    2970:      	mov	x25, #0x1a              ; =26
    2974:      	b	0x29a4 <_stogir.vector.validate+0xd4>
    2978:      	add	x8, sp, #0x70
    297c:      	mov	x0, x21
    2980:      	ldr	w1, [sp, #0x1a0]
    2984:      	mov	w2, w23
    2988:      	bl	0x2988 <_stogir.vector.validate+0xb8>
		0000000000002988:  ARM64_RELOC_BRANCH26	_stogir.conversion.validate
    298c:      	add	x16, sp, #0x70
    2990:      	ldr	x0, [x16]
    2994:      	add	x16, sp, #0x70
    2998:      	ldr	x19, [x16, #0x8]
    299c:      	add	x16, sp, #0x70
    29a0:      	ldr	x25, [x16, #0x10]
    29a4:      	ldr	x1, [sp, #0x1a8]
    29a8:      	str	x0, [x1]
    29ac:      	str	x19, [x1, #0x8]
    29b0:      	str	x25, [x1, #0x10]
    29b4:      	ldr	x19, [sp, #0x1c0]
    29b8:      	ldr	x20, [sp, #0x1c8]
    29bc:      	ldr	x21, [sp, #0x1d0]
    29c0:      	ldr	x22, [sp, #0x1d8]
    29c4:      	ldr	x23, [sp, #0x1e0]
    29c8:      	ldr	x24, [sp, #0x1e8]
    29cc:      	ldr	x25, [sp, #0x1f0]
    29d0:      	ldr	x26, [sp, #0x1f8]
    29d4:      	ldr	x27, [sp, #0x200]
    29d8:      	ldr	x28, [sp, #0x208]
    29dc:      	ldr	x29, [sp]
    29e0:      	ldr	x30, [sp, #0x8]
    29e4:      	add	sp, sp, #0x210
    29e8:      	ret
    29ec:      	sxtw	x22, w22
    29f0:      	add	x16, sp, #0x10
    29f4:      	orr	x0, x16, xzr
    29f8:      	cmp	x22, #0x0
    29fc:      	cset	w24, le
    2a00:      	add	x0, x0, #0x8
    2a04:      	add	x16, sp, #0x10
    2a08:      	ldr	x25, [x16, #0x8]
    2a0c:      	add	x16, sp, #0x40
    2a10:      	str	x25, [x16]
    2a14:      	ldr	x0, [x0, #0x8]
    2a18:      	add	x16, sp, #0x40
    2a1c:      	str	x0, [x16, #0x8]
    2a20:      	uxtb	w16, w24
    2a24:      	cmp	w16, wzr
    2a28:      	b.eq	0x2a48 <_stogir.vector.validate+0x178>
    2a2c:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0x126c>
		0000000000002a2c:  ARM64_RELOC_PAGE21	l_stogir.349
    2a30:      	ldr	x16, [x16]
		0000000000002a30:  ARM64_RELOC_PAGEOFF12	l_stogir.349
    2a34:      	orr	x19, x16, xzr
    2a38:      	str	x20, [sp, #0x1a8]
    2a3c:      	mov	x0, #0x1                ; =1
    2a40:      	mov	x25, #0x3b              ; =59
    2a44:      	b	0x29a4 <_stogir.vector.validate+0xd4>
    2a48:      	lsl	x26, x22, #2
    2a4c:      	uxtb	w0, w25
    2a50:      	orr	x27, x0, xzr
    2a54:      	ldr	x0, [x21, #0x78]
    2a58:      	cmp	x27, #0x44
    2a5c:      	cset	w1, eq
    2a60:      	add	x0, x0, x22, lsl #2
    2a64:      	ldr	w28, [x0]
    2a68:      	cmp	x27, #0x24
    2a6c:      	b.ne	0x2ab0 <_stogir.vector.validate+0x1e0>
    2a70:      	str	x20, [sp, #0x1a8]
    2a74:      	str	w19, [sp, #0x1a0]
    2a78:      	uxtb	w16, w1
    2a7c:      	cmp	w16, wzr
    2a80:      	b.eq	0x2978 <_stogir.vector.validate+0xa8>
    2a84:      	add	x8, sp, #0x50
    2a88:      	mov	x0, x21
    2a8c:      	ldr	w1, [sp, #0x1a0]
    2a90:      	bl	0x2a90 <_stogir.vector.validate+0x1c0>
		0000000000002a90:  ARM64_RELOC_BRANCH26	_stogir.copy.validate
    2a94:      	add	x16, sp, #0x50
    2a98:      	ldr	x0, [x16]
    2a9c:      	add	x16, sp, #0x50
    2aa0:      	ldr	x19, [x16, #0x8]
    2aa4:      	add	x16, sp, #0x50
    2aa8:      	ldr	x25, [x16, #0x10]
    2aac:      	b	0x29a4 <_stogir.vector.validate+0xd4>
    2ab0:      	uxtb	w16, w1
    2ab4:      	cmp	w16, wzr
    2ab8:      	b.ne	0x32e0 <_stogir.vector.validate+0xa10>
    2abc:      	cmp	x27, #0x3c
    2ac0:      	b.ne	0x2b74 <_stogir.vector.validate+0x2a4>
    2ac4:      	add	x8, sp, #0x90
    2ac8:      	mov	x0, x21
    2acc:      	mov	w1, w19
    2ad0:      	bl	0x2ad0 <_stogir.vector.validate+0x200>
		0000000000002ad0:  ARM64_RELOC_BRANCH26	_stogir.conditional.validate
    2ad4:      	add	x16, sp, #0x90
    2ad8:      	ldr	x0, [x16]
    2adc:      	add	x16, sp, #0x90
    2ae0:      	ldr	x19, [x16, #0x8]
    2ae4:      	add	x16, sp, #0x90
    2ae8:      	ldr	x25, [x16, #0x10]
    2aec:      	str	x20, [sp, #0x1a8]
    2af0:      	b	0x2b70 <_stogir.vector.validate+0x2a0>
    2af4:      	cmp	x27, #0x41
    2af8:      	cset	w0, eq
    2afc:      	cmp	x27, #0x48
    2b00:      	cset	w1, eq
    2b04:      	cmp	x27, #0x55
    2b08:      	cset	w2, ge
    2b0c:      	cmp	x27, #0x58
    2b10:      	cset	w3, le
    2b14:      	cmp	x27, #0x47
    2b18:      	b.ne	0x2c08 <_stogir.vector.validate+0x338>
    2b1c:      	str	x20, [sp, #0x1a8]
    2b20:      	str	w19, [sp, #0x1a0]
    2b24:      	mov	w19, w0
    2b28:      	mov	w20, w1
    2b2c:      	str	w2, [sp, #0x1b0]
    2b30:      	str	w3, [sp, #0x1b8]
    2b34:      	mov	x0, x21
    2b38:      	ldr	w1, [sp, #0x1a0]
    2b3c:      	bl	0x2b3c <_stogir.vector.validate+0x26c>
		0000000000002b3c:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.node?
    2b40:      	cmp	x0, #0x0
    2b44:      	b.eq	0x2c2c <_stogir.vector.validate+0x35c>
    2b48:      	add	x8, sp, #0xf0
    2b4c:      	mov	x0, x21
    2b50:      	ldr	w1, [sp, #0x1a0]
    2b54:      	bl	0x2b54 <_stogir.vector.validate+0x284>
		0000000000002b54:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.validate
    2b58:      	add	x16, sp, #0xf0
    2b5c:      	ldr	x0, [x16]
    2b60:      	add	x16, sp, #0xf0
    2b64:      	ldr	x19, [x16, #0x8]
    2b68:      	add	x16, sp, #0xf0
    2b6c:      	ldr	x25, [x16, #0x10]
    2b70:      	b	0x29a4 <_stogir.vector.validate+0xd4>
    2b74:      	cmp	x27, #0x3d
    2b78:      	b.lt	0x2bb8 <_stogir.vector.validate+0x2e8>
    2b7c:      	cmp	x27, #0x3f
    2b80:      	b.gt	0x2bb8 <_stogir.vector.validate+0x2e8>
    2b84:      	add	x8, sp, #0xb0
    2b88:      	mov	x0, x21
    2b8c:      	mov	w1, w19
    2b90:      	mov	w2, w23
    2b94:      	bl	0x2b94 <_stogir.vector.validate+0x2c4>
		0000000000002b94:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.validate
    2b98:      	add	x16, sp, #0xb0
    2b9c:      	ldr	x0, [x16]
    2ba0:      	add	x16, sp, #0xb0
    2ba4:      	ldr	x19, [x16, #0x8]
    2ba8:      	add	x16, sp, #0xb0
    2bac:      	ldr	x25, [x16, #0x10]
    2bb0:      	str	x20, [sp, #0x1a8]
    2bb4:      	b	0x2b70 <_stogir.vector.validate+0x2a0>
    2bb8:      	mov	x0, x21
    2bbc:      	mov	w1, w19
    2bc0:      	bl	0x2bc0 <_stogir.vector.validate+0x2f0>
		0000000000002bc0:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.node?
    2bc4:      	cmp	x0, #0x0
    2bc8:      	b.eq	0x2af4 <_stogir.vector.validate+0x224>
    2bcc:      	add	x8, sp, #0xd0
    2bd0:      	mov	x0, x21
    2bd4:      	mov	w1, w19
    2bd8:      	mov	w2, w23
    2bdc:      	bl	0x2bdc <_stogir.vector.validate+0x30c>
		0000000000002bdc:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.validate
    2be0:      	add	x16, sp, #0xd0
    2be4:      	ldr	x0, [x16]
    2be8:      	add	x16, sp, #0xd0
    2bec:      	ldr	x19, [x16, #0x8]
    2bf0:      	add	x16, sp, #0xd0
    2bf4:      	ldr	x25, [x16, #0x10]
    2bf8:      	str	x20, [sp, #0x1a8]
    2bfc:      	b	0x2b70 <_stogir.vector.validate+0x2a0>
    2c00:      	brk	#0
    2c04:      	b	0x2c00 <_stogir.vector.validate+0x330>
    2c08:      	cmp	x27, #0x4f
    2c0c:      	b.ne	0x2ca4 <_stogir.vector.validate+0x3d4>
    2c10:      	str	x20, [sp, #0x1a8]
    2c14:      	str	w19, [sp, #0x1a0]
    2c18:      	mov	w19, w0
    2c1c:      	mov	w20, w1
    2c20:      	str	w2, [sp, #0x1b0]
    2c24:      	str	w3, [sp, #0x1b8]
    2c28:      	b	0x2b34 <_stogir.vector.validate+0x264>
    2c2c:      	uxtb	w16, w19
    2c30:      	cmp	w16, wzr
    2c34:      	b.ne	0x2c74 <_stogir.vector.validate+0x3a4>
    2c38:      	uxtb	w16, w20
    2c3c:      	cmp	w16, wzr
    2c40:      	b.ne	0x2c74 <_stogir.vector.validate+0x3a4>
    2c44:      	ldr	w0, [sp, #0x1b0]
    2c48:      	uxtb	w16, w0
    2c4c:      	cmp	w16, wzr
    2c50:      	b.eq	0x2c64 <_stogir.vector.validate+0x394>
    2c54:      	ldr	w0, [sp, #0x1b8]
    2c58:      	uxtb	w16, w0
    2c5c:      	cmp	w16, wzr
    2c60:      	b.ne	0x2c74 <_stogir.vector.validate+0x3a4>
    2c64:      	movz	x0, #0x0, lsl #48
    2c68:      	movz	x19, #0x0, lsl #48
    2c6c:      	movz	x25, #0x0, lsl #48
    2c70:      	b	0x2ca0 <_stogir.vector.validate+0x3d0>
    2c74:      	add	x8, sp, #0x110
    2c78:      	mov	x0, x21
    2c7c:      	ldr	w1, [sp, #0x1a0]
    2c80:      	mov	w2, w23
    2c84:      	bl	0x2c84 <_stogir.vector.validate+0x3b4>
		0000000000002c84:  ARM64_RELOC_BRANCH26	_stogir.locals.validate
    2c88:      	add	x16, sp, #0x110
    2c8c:      	ldr	x0, [x16]
    2c90:      	add	x16, sp, #0x110
    2c94:      	ldr	x19, [x16, #0x8]
    2c98:      	add	x16, sp, #0x110
    2c9c:      	ldr	x25, [x16, #0x10]
    2ca0:      	b	0x2b70 <_stogir.vector.validate+0x2a0>
    2ca4:      	cmp	x27, #0x50
    2ca8:      	b.eq	0x32ec <_stogir.vector.validate+0xa1c>
    2cac:      	cmp	x27, #0x78
    2cb0:      	b.ne	0x2cd0 <_stogir.vector.validate+0x400>
    2cb4:      	str	x20, [sp, #0x1a8]
    2cb8:      	str	w19, [sp, #0x1a0]
    2cbc:      	mov	w19, w0
    2cc0:      	mov	w20, w1
    2cc4:      	str	w2, [sp, #0x1b0]
    2cc8:      	str	w3, [sp, #0x1b8]
    2ccc:      	b	0x2b34 <_stogir.vector.validate+0x264>
    2cd0:      	uxtb	w16, w0
    2cd4:      	cmp	w16, wzr
    2cd8:      	b.ne	0x2dc0 <_stogir.vector.validate+0x4f0>
    2cdc:      	uxtb	w16, w1
    2ce0:      	cmp	w16, wzr
    2ce4:      	b.ne	0x2dc0 <_stogir.vector.validate+0x4f0>
    2ce8:      	uxtb	w16, w2
    2cec:      	cmp	w16, wzr
    2cf0:      	b.eq	0x2d00 <_stogir.vector.validate+0x430>
    2cf4:      	uxtb	w16, w3
    2cf8:      	cmp	w16, wzr
    2cfc:      	b.ne	0x2dc0 <_stogir.vector.validate+0x4f0>
    2d00:      	str	w2, [sp, #0x1b0]
    2d04:      	str	w3, [sp, #0x1b8]
    2d08:      	str	w19, [sp, #0x1a0]
    2d0c:      	str	x20, [sp, #0x1a8]
    2d10:      	mov	w20, w1
    2d14:      	mov	w1, w19
    2d18:      	mov	w19, w0
    2d1c:      	mov	x0, x21
    2d20:      	bl	0x2d20 <_stogir.vector.validate+0x450>
		0000000000002d20:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.node?
    2d24:      	cmp	x0, #0x0
    2d28:      	b.ne	0x2b34 <_stogir.vector.validate+0x264>
    2d2c:      	sxtw	x28, w28
    2d30:      	ubfx	x25, x25, #0, #32
    2d34:      	ubfx	x0, x25, #8, #8
    2d38:      	orr	x1, x0, xzr
    2d3c:      	orr	w20, w1, wzr
    2d40:      	cmp	x27, #0x5b
    2d44:      	b.eq	0x2df4 <_stogir.vector.validate+0x524>
    2d48:      	cmp	x27, #0x5c
    2d4c:      	b.eq	0x2df4 <_stogir.vector.validate+0x524>
    2d50:      	orr	x25, x0, xzr
    2d54:      	cmp	x27, #0x5d
    2d58:      	b.ne	0x2e5c <_stogir.vector.validate+0x58c>
    2d5c:      	mov	x27, x25
    2d60:      	cmp	x28, #0x3
    2d64:      	b.ne	0x2e44 <_stogir.vector.validate+0x574>
    2d68:      	cmp	x27, #0x0
    2d6c:      	b.ne	0x2e44 <_stogir.vector.validate+0x574>
    2d70:      	add	x16, sp, #0x40
    2d74:      	ldr	w0, [x16, #0x4]
    2d78:      	add	x16, sp, #0x40
    2d7c:      	ldr	w1, [x16, #0x8]
    2d80:      	add	x16, sp, #0x40
    2d84:      	ldr	w2, [x16, #0xc]
    2d88:      	add	x8, sp, #0x150
    2d8c:      	mov	w3, w1
    2d90:      	mov	w1, w23
    2d94:      	mov	w4, w2
    2d98:      	mov	w2, w0
    2d9c:      	mov	x0, x21
    2da0:      	bl	0x2da0 <_stogir.vector.validate+0x4d0>
		0000000000002da0:  ARM64_RELOC_BRANCH26	_stogir.vector.store-inputs
    2da4:      	add	x16, sp, #0x150
    2da8:      	ldr	x0, [x16]
    2dac:      	add	x16, sp, #0x150
    2db0:      	ldr	x19, [x16, #0x8]
    2db4:      	add	x16, sp, #0x150
    2db8:      	ldr	x25, [x16, #0x10]
    2dbc:      	b	0x2e58 <_stogir.vector.validate+0x588>
    2dc0:      	str	x20, [sp, #0x1a8]
    2dc4:      	str	w19, [sp, #0x1a0]
    2dc8:      	mov	w19, w0
    2dcc:      	mov	w20, w1
    2dd0:      	str	w2, [sp, #0x1b0]
    2dd4:      	str	w3, [sp, #0x1b8]
    2dd8:      	b	0x2b34 <_stogir.vector.validate+0x264>
    2ddc:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0x126c>
		0000000000002ddc:  ARM64_RELOC_PAGE21	l_stogir.350
    2de0:      	ldr	x16, [x16]
		0000000000002de0:  ARM64_RELOC_PAGEOFF12	l_stogir.350
    2de4:      	orr	x19, x16, xzr
    2de8:      	mov	x0, #0x1                ; =1
    2dec:      	mov	x25, #0x19              ; =25
    2df0:      	b	0x2b70 <_stogir.vector.validate+0x2a0>
    2df4:      	cmp	x28, #0x2
    2df8:      	b.ne	0x2ddc <_stogir.vector.validate+0x50c>
    2dfc:      	add	x16, sp, #0x40
    2e00:      	ldr	w0, [x16, #0x4]
    2e04:      	add	x16, sp, #0x40
    2e08:      	ldr	w1, [x16, #0x8]
    2e0c:      	add	x8, sp, #0x130
    2e10:      	mov	w2, w23
    2e14:      	mov	w3, w0
    2e18:      	mov	x0, x21
    2e1c:      	mov	w4, w1
    2e20:      	mov	w1, w20
    2e24:      	bl	0x2e24 <_stogir.vector.validate+0x554>
		0000000000002e24:  ARM64_RELOC_BRANCH26	_stogir.vector.memory-inputs
    2e28:      	add	x16, sp, #0x130
    2e2c:      	ldr	x0, [x16]
    2e30:      	add	x16, sp, #0x130
    2e34:      	ldr	x19, [x16, #0x8]
    2e38:      	add	x16, sp, #0x130
    2e3c:      	ldr	x25, [x16, #0x10]
    2e40:      	b	0x2df0 <_stogir.vector.validate+0x520>
    2e44:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0x126c>
		0000000000002e44:  ARM64_RELOC_PAGE21	l_stogir.351
    2e48:      	ldr	x16, [x16]
		0000000000002e48:  ARM64_RELOC_PAGEOFF12	l_stogir.351
    2e4c:      	orr	x19, x16, xzr
    2e50:      	mov	x0, #0x1                ; =1
    2e54:      	mov	x25, #0x1a              ; =26
    2e58:      	b	0x2df0 <_stogir.vector.validate+0x520>
    2e5c:      	cmp	x27, #0x5e
    2e60:      	b.eq	0x3308 <_stogir.vector.validate+0xa38>
    2e64:      	cmp	x27, #0x43
    2e68:      	b.ne	0x2ed4 <_stogir.vector.validate+0x604>
    2e6c:      	cmp	x25, #0xf
    2e70:      	b.le	0x31fc <_stogir.vector.validate+0x92c>
    2e74:      	cmp	x25, #0x80
    2e78:      	b.ge	0x31fc <_stogir.vector.validate+0x92c>
    2e7c:      	and	w0, w1, #0xf
    2e80:      	ubfx	x0, x0, #0, #32
    2e84:      	cmp	x0, #0x1
    2e88:      	b.lt	0x31fc <_stogir.vector.validate+0x92c>
    2e8c:      	cmp	x0, #0xd
    2e90:      	b.gt	0x31fc <_stogir.vector.validate+0x92c>
    2e94:      	mov	w0, w20
    2e98:      	mov	w1, w23
    2e9c:      	bl	0x2e9c <_stogir.vector.validate+0x5cc>
		0000000000002e9c:  ARM64_RELOC_BRANCH26	_stogir.types.size
    2ea0:      	sxtw	x0, w0
    2ea4:      	cmp	x0, #0x0
    2ea8:      	b.le	0x31fc <_stogir.vector.validate+0x92c>
    2eac:      	cmp	x28, #0x3
    2eb0:      	b.lt	0x31fc <_stogir.vector.validate+0x92c>
    2eb4:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0x126c>
		0000000000002eb4:  ARM64_RELOC_PAGE21	l_stogir.352
    2eb8:      	ldr	x16, [x16]
		0000000000002eb8:  ARM64_RELOC_PAGEOFF12	l_stogir.352
    2ebc:      	orr	x19, x16, xzr
    2ec0:      	mov	x27, x25
    2ec4:      	movz	x25, #0x0, lsl #48
    2ec8:      	b	0x3210 <_stogir.vector.validate+0x940>
    2ecc:      	mov	x0, #0x1                ; =1
    2ed0:      	b	0x2e58 <_stogir.vector.validate+0x588>
    2ed4:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0x126c>
		0000000000002ed4:  ARM64_RELOC_PAGE21	l_stogir.353
    2ed8:      	ldr	x16, [x16]
		0000000000002ed8:  ARM64_RELOC_PAGEOFF12	l_stogir.353
    2edc:      	orr	x19, x16, xzr
    2ee0:      	mov	x0, #0x1                ; =1
    2ee4:      	mov	x25, #0x28              ; =40
    2ee8:      	b	0x2ed0 <_stogir.vector.validate+0x600>
    2eec:      	add	x16, sp, #0x40
    2ef0:      	ldr	w0, [x16, #0x4]
    2ef4:      	sxtw	x0, w0
    2ef8:      	ldr	x1, [x21, #0x78]
    2efc:      	add	x0, x1, x0, lsl #2
    2f00:      	ldr	w0, [x0]
    2f04:      	add	w0, w0, #0x1
    2f08:      	sxtw	x0, w0
    2f0c:      	cmp	x28, x0
    2f10:      	cset	w0, eq
    2f14:      	uxtb	w16, w0
    2f18:      	cmp	w16, wzr
    2f1c:      	cset	x0, eq
    2f20:      	cmp	x0, #0x0
    2f24:      	b.eq	0x2f38 <_stogir.vector.validate+0x668>
    2f28:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0x126c>
		0000000000002f28:  ARM64_RELOC_PAGE21	l_stogir.354
    2f2c:      	ldr	x16, [x16]
		0000000000002f2c:  ARM64_RELOC_PAGEOFF12	l_stogir.354
    2f30:      	orr	x19, x16, xzr
    2f34:      	mov	x25, #0x19              ; =25
    2f38:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0x126c>
		0000000000002f38:  ARM64_RELOC_PAGE21	l_stogir.355
    2f3c:      	ldr	x16, [x16]
		0000000000002f3c:  ARM64_RELOC_PAGEOFF12	l_stogir.355
    2f40:      	orr	x0, x16, xzr
    2f44:      	adrp	x16, 0x2000 <_stogir.verify.integer-operations-target-structured+0x126c>
		0000000000002f44:  ARM64_RELOC_PAGE21	l_stogir.356
    2f48:      	ldr	x16, [x16]
		0000000000002f48:  ARM64_RELOC_PAGEOFF12	l_stogir.356
    2f4c:      	orr	x1, x16, xzr
    2f50:      	add	x2, x21, #0x78
    2f54:      	add	x3, x21, #0x28
    2f58:      	add	x4, x21, #0x50
    2f5c:      	add	x5, x21, #0x78
    2f60:      	mov	x6, #0x2                ; =2
    2f64:      	b	0x2fd8 <_stogir.vector.validate+0x708>
    2f68:      	ubfx	x7, x7, #0, #32
    2f6c:      	ubfx	x7, x7, #8, #8
    2f70:      	cmp	x7, x27
    2f74:      	b.eq	0x2f80 <_stogir.vector.validate+0x6b0>
    2f78:      	mov	x19, x1
    2f7c:      	mov	x25, #0x1e              ; =30
    2f80:      	b	0x2fd0 <_stogir.vector.validate+0x700>
    2f84:      	movz	w8, #0x0, lsl #16
    2f88:      	movz	w7, #0x0, lsl #16
    2f8c:      	b	0x2f98 <_stogir.vector.validate+0x6c8>
    2f90:      	movz	w8, #0x0, lsl #16
    2f94:      	movz	w7, #0x0, lsl #16
    2f98:      	ubfx	x8, x8, #0, #32
    2f9c:      	lsr	x16, x8, #0
    2fa0:      	cmp	x16, #0x1
    2fa4:      	b.eq	0x2fc0 <_stogir.vector.validate+0x6f0>
    2fa8:      	b.lo	0x2fb0 <_stogir.vector.validate+0x6e0>
    2fac:      	b	0x2fc4 <_stogir.vector.validate+0x6f4>
    2fb0:      	cmp	x16, #0x0
    2fb4:      	b.eq	0x2fbc <_stogir.vector.validate+0x6ec>
    2fb8:      	b	0x2fc4 <_stogir.vector.validate+0x6f4>
    2fbc:      	b	0x2fc8 <_stogir.vector.validate+0x6f8>
    2fc0:      	b	0x302c <_stogir.vector.validate+0x75c>
    2fc4:      	b	0x32c8 <_stogir.vector.validate+0x9f8>
    2fc8:      	mov	x19, x0
    2fcc:      	mov	x25, #0x18              ; =24
    2fd0:      	add	x6, x6, #0x1
    2fd4:      	sxtw	x6, w6
    2fd8:      	cmp	x25, #0x0
    2fdc:      	b.ne	0x314c <_stogir.vector.validate+0x87c>
    2fe0:      	cmp	x6, x28
    2fe4:      	b.gt	0x314c <_stogir.vector.validate+0x87c>
    2fe8:      	uxtb	w16, w24
    2fec:      	cmp	w16, wzr
    2ff0:      	b.ne	0x2f90 <_stogir.vector.validate+0x6c0>
    2ff4:      	ldr	x7, [x21, #0x8]
    2ff8:      	cmp	x22, x7
    2ffc:      	b.ge	0x3090 <_stogir.vector.validate+0x7c0>
    3000:      	ldr	x7, [x5, #0x8]
    3004:      	cmp	x22, x7
    3008:      	b.ge	0x3088 <_stogir.vector.validate+0x7b8>
    300c:      	ldr	x7, [x21, #0x78]
    3010:      	add	x7, x26, x7
    3014:      	ldr	w7, [x7]
    3018:      	sxtw	x7, w7
    301c:      	cmp	x7, #0x0
    3020:      	cset	w7, ge
    3024:      	ubfx	x7, x7, #0, #8
    3028:      	b	0x308c <_stogir.vector.validate+0x7bc>
    302c:      	sxtw	x7, w7
    3030:      	cmp	x7, #0x0
    3034:      	cset	w8, gt
    3038:      	movz	x16, #0x0, lsl #48
    303c:      	sub	x9, x16, x7
    3040:      	sub	x10, x9, #0x1
    3044:      	uxtb	w16, w8
    3048:      	cmp	w16, wzr
    304c:      	b.eq	0x310c <_stogir.vector.validate+0x83c>
    3050:      	ldr	x9, [x21, #0x8]
    3054:      	cmp	x7, x9
    3058:      	b.ge	0x3174 <_stogir.vector.validate+0x8a4>
    305c:      	ldr	x9, [x2, #0x8]
    3060:      	cmp	x7, x9
    3064:      	b.ge	0x3278 <_stogir.vector.validate+0x9a8>
    3068:      	ldr	x9, [x21, #0x78]
    306c:      	add	x9, x9, x7, lsl #2
    3070:      	ldr	w9, [x9]
    3074:      	sxtw	x9, w9
    3078:      	cmp	x9, #0x0
    307c:      	cset	w9, ge
    3080:      	ubfx	x9, x9, #0, #8
    3084:      	b	0x327c <_stogir.vector.validate+0x9ac>
    3088:      	movz	x7, #0x0, lsl #48
    308c:      	b	0x3094 <_stogir.vector.validate+0x7c4>
    3090:      	movz	x7, #0x0, lsl #48
    3094:      	cmp	x7, #0x0
    3098:      	b.eq	0x2f90 <_stogir.vector.validate+0x6c0>
    309c:      	orr	w7, w6, wzr
    30a0:      	sxtw	x7, w7
    30a4:      	cmp	x7, #0x1
    30a8:      	b.lt	0x2f84 <_stogir.vector.validate+0x6b4>
    30ac:      	ldr	x8, [x21, #0x78]
    30b0:      	add	x8, x26, x8
    30b4:      	ldr	w8, [x8]
    30b8:      	sxtw	x8, w8
    30bc:      	cmp	x7, x8
    30c0:      	b.gt	0x2f84 <_stogir.vector.validate+0x6b4>
    30c4:      	ldr	x8, [x21]
    30c8:      	asr	x16, x7, #63
    30cc:      	lsr	x16, x16, #62
    30d0:      	add	x9, x7, x16
    30d4:      	asr	x9, x9, #2
    30d8:      	asr	x16, x7, #63
    30dc:      	lsr	x16, x16, #62
    30e0:      	add	x7, x7, x16
    30e4:      	and	x7, x7, #0x3
    30e8:      	sub	x7, x7, x16
    30ec:      	add	x9, x9, x22
    30f0:      	add	x8, x8, x9, lsl #4
    30f4:      	add	x7, x8, x7, lsl #2
    30f8:      	ldr	w7, [x7]
    30fc:      	movn	w17, #0x0, lsl #16
    3100:      	and	w7, w7, w17
    3104:      	mov	w8, #0x1                ; =1
    3108:      	b	0x2f8c <_stogir.vector.validate+0x6bc>
    310c:      	cmp	x7, #0x0
    3110:      	b.ge	0x317c <_stogir.vector.validate+0x8ac>
    3114:      	ldr	x11, [x3, #0x8]
    3118:      	ldr	x12, [x4, #0x8]
    311c:      	cmp	x11, x12
    3120:      	b.ne	0x3270 <_stogir.vector.validate+0x9a0>
    3124:      	cmp	x9, x11
    3128:      	b.gt	0x32a4 <_stogir.vector.validate+0x9d4>
    312c:      	ldr	x9, [x21, #0x50]
    3130:      	add	x9, x9, x10, lsl #2
    3134:      	ldr	w9, [x9]
    3138:      	sxtw	x9, w9
    313c:      	cmp	x9, #0x0
    3140:      	cset	w9, gt
    3144:      	ubfx	x9, x9, #0, #8
    3148:      	b	0x32a8 <_stogir.vector.validate+0x9d8>
    314c:      	cmp	x25, #0x0
    3150:      	b.ne	0x2ecc <_stogir.vector.validate+0x5fc>
    3154:      	mov	w0, w20
    3158:      	mov	w1, w23
    315c:      	bl	0x315c <_stogir.vector.validate+0x88c>
		000000000000315c:  ARM64_RELOC_BRANCH26	_stogir.types.size
    3160:      	sxtw	x0, w0
    3164:      	and	x19, x0, #0xffffffff
    3168:      	movz	x0, #0x0, lsl #48
    316c:      	movz	x25, #0x0, lsl #48
    3170:      	b	0x2ed0 <_stogir.vector.validate+0x600>
    3174:      	movz	x9, #0x0, lsl #48
    3178:      	b	0x3180 <_stogir.vector.validate+0x8b0>
    317c:      	movz	x9, #0x0, lsl #48
    3180:      	cmp	x9, #0x0
    3184:      	b.eq	0x31b8 <_stogir.vector.validate+0x8e8>
    3188:      	uxtb	w16, w8
    318c:      	cmp	w16, wzr
    3190:      	b.eq	0x31a4 <_stogir.vector.validate+0x8d4>
    3194:      	ldr	x8, [x21]
    3198:      	add	x7, x8, x7, lsl #4
    319c:      	ldr	x7, [x7]
    31a0:      	b	0x31b0 <_stogir.vector.validate+0x8e0>
    31a4:      	ldr	x7, [x21, #0x28]
    31a8:      	add	x7, x7, x10, lsl #4
    31ac:      	ldr	x7, [x7]
    31b0:      	mov	w8, #0x1                ; =1
    31b4:      	b	0x31c0 <_stogir.vector.validate+0x8f0>
    31b8:      	movz	w8, #0x0, lsl #16
    31bc:      	movz	x7, #0x0, lsl #48
    31c0:      	ubfx	x8, x8, #0, #32
    31c4:      	lsr	x16, x8, #0
    31c8:      	cmp	x16, #0x1
    31cc:      	b.eq	0x31e8 <_stogir.vector.validate+0x918>
    31d0:      	b.lo	0x31d8 <_stogir.vector.validate+0x908>
    31d4:      	b	0x31ec <_stogir.vector.validate+0x91c>
    31d8:      	cmp	x16, #0x0
    31dc:      	b.eq	0x31e4 <_stogir.vector.validate+0x914>
    31e0:      	b	0x31ec <_stogir.vector.validate+0x91c>
    31e4:      	b	0x31f0 <_stogir.vector.validate+0x920>
    31e8:      	b	0x2f68 <_stogir.vector.validate+0x698>
    31ec:      	b	0x32d0 <_stogir.vector.validate+0xa00>
    31f0:      	mov	x19, x0
    31f4:      	mov	x25, #0x18              ; =24
    31f8:      	b	0x2f80 <_stogir.vector.validate+0x6b0>
    31fc:      	adrp	x16, 0x3000 <_stogir.vector.validate+0x730>
		00000000000031fc:  ARM64_RELOC_PAGE21	l_stogir.357
    3200:      	ldr	x16, [x16]
		0000000000003200:  ARM64_RELOC_PAGEOFF12	l_stogir.357
    3204:      	orr	x19, x16, xzr
    3208:      	mov	x27, x25
    320c:      	mov	x25, #0x20              ; =32
    3210:      	add	x16, sp, #0x40
    3214:      	ldr	w0, [x16, #0x4]
    3218:      	add	x8, sp, #0x170
    321c:      	mov	w1, w0
    3220:      	mov	x0, x21
    3224:      	bl	0x3224 <_stogir.vector.validate+0x954>
		0000000000003224:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    3228:      	add	x16, sp, #0x170
    322c:      	ldr	w0, [x16]
    3230:      	lsr	x16, x0, #0
    3234:      	cmp	x16, #0x1
    3238:      	b.eq	0x3254 <_stogir.vector.validate+0x984>
    323c:      	b.lo	0x3244 <_stogir.vector.validate+0x974>
    3240:      	b	0x3258 <_stogir.vector.validate+0x988>
    3244:      	cmp	x16, #0x0
    3248:      	b.eq	0x3250 <_stogir.vector.validate+0x980>
    324c:      	b	0x3258 <_stogir.vector.validate+0x988>
    3250:      	b	0x325c <_stogir.vector.validate+0x98c>
    3254:      	b	0x3280 <_stogir.vector.validate+0x9b0>
    3258:      	b	0x32d8 <_stogir.vector.validate+0xa08>
    325c:      	adrp	x16, 0x3000 <_stogir.vector.validate+0x730>
		000000000000325c:  ARM64_RELOC_PAGE21	l_stogir.358
    3260:      	ldr	x16, [x16]
		0000000000003260:  ARM64_RELOC_PAGEOFF12	l_stogir.358
    3264:      	orr	x19, x16, xzr
    3268:      	mov	x25, #0x19              ; =25
    326c:      	b	0x2f38 <_stogir.vector.validate+0x668>
    3270:      	movz	x9, #0x0, lsl #48
    3274:      	b	0x3180 <_stogir.vector.validate+0x8b0>
    3278:      	movz	x9, #0x0, lsl #48
    327c:      	b	0x3178 <_stogir.vector.validate+0x8a8>
    3280:      	add	x16, sp, #0x170
    3284:      	ldr	x0, [x16, #0x8]
    3288:      	add	x16, sp, #0x40
    328c:      	ldr	w1, [x16, #0x4]
    3290:      	sxtw	x1, w1
    3294:      	cmp	x1, #0x0
    3298:      	b.gt	0x32ac <_stogir.vector.validate+0x9dc>
    329c:      	mov	x0, #0x1                ; =1
    32a0:      	b	0x2f20 <_stogir.vector.validate+0x650>
    32a4:      	movz	x9, #0x0, lsl #48
    32a8:      	b	0x3274 <_stogir.vector.validate+0x9a4>
    32ac:      	uxtb	w0, w0
    32b0:      	cmp	x0, #0x70
    32b4:      	b.eq	0x2eec <_stogir.vector.validate+0x61c>
    32b8:      	cmp	x0, #0x71
    32bc:      	b.eq	0x2eec <_stogir.vector.validate+0x61c>
    32c0:      	mov	x0, #0x1                ; =1
    32c4:      	b	0x2f20 <_stogir.vector.validate+0x650>
    32c8:      	brk	#0
    32cc:      	b	0x32c8 <_stogir.vector.validate+0x9f8>
    32d0:      	brk	#0
    32d4:      	b	0x32d0 <_stogir.vector.validate+0xa00>
    32d8:      	brk	#0
    32dc:      	b	0x32d8 <_stogir.vector.validate+0xa08>
    32e0:      	str	x20, [sp, #0x1a8]
    32e4:      	str	w19, [sp, #0x1a0]
    32e8:      	b	0x2a78 <_stogir.vector.validate+0x1a8>
    32ec:      	str	x20, [sp, #0x1a8]
    32f0:      	str	w19, [sp, #0x1a0]
    32f4:      	mov	w19, w0
    32f8:      	mov	w20, w1
    32fc:      	str	w2, [sp, #0x1b0]
    3300:      	str	w3, [sp, #0x1b8]
    3304:      	b	0x2b34 <_stogir.vector.validate+0x264>
    3308:      	mov	x27, x25
    330c:      	b	0x2d60 <_stogir.vector.validate+0x490>

0000000000003310 <_stogir.copy.validate>:
    3310:      	sub	sp, sp, #0x10
    3314:      	sxtw	x1, w1
    3318:      	lsl	x2, x1, #2
    331c:      	cmp	x1, #0x0
    3320:      	cset	w3, gt
    3324:      	movz	x16, #0x0, lsl #48
    3328:      	sub	x4, x16, x1
    332c:      	sub	x5, x4, #0x1
    3330:      	uxtb	w16, w3
    3334:      	cmp	w16, wzr
    3338:      	b.eq	0x3378 <_stogir.copy.validate+0x68>
    333c:      	ldr	x4, [x0, #0x8]
    3340:      	cmp	x1, x4
    3344:      	b.ge	0x33e0 <_stogir.copy.validate+0xd0>
    3348:      	add	x4, x0, #0x78
    334c:      	ldr	x4, [x4, #0x8]
    3350:      	cmp	x1, x4
    3354:      	b.ge	0x3578 <_stogir.copy.validate+0x268>
    3358:      	ldr	x4, [x0, #0x78]
    335c:      	add	x4, x2, x4
    3360:      	ldr	w4, [x4]
    3364:      	sxtw	x4, w4
    3368:      	cmp	x4, #0x0
    336c:      	cset	w4, ge
    3370:      	ubfx	x4, x4, #0, #8
    3374:      	b	0x357c <_stogir.copy.validate+0x26c>
    3378:      	cmp	x1, #0x0
    337c:      	b.ge	0x33e8 <_stogir.copy.validate+0xd8>
    3380:      	add	x6, x0, #0x28
    3384:      	add	x7, x0, #0x50
    3388:      	ldr	x6, [x6, #0x8]
    338c:      	ldr	x7, [x7, #0x8]
    3390:      	cmp	x6, x7
    3394:      	b.ne	0x33c0 <_stogir.copy.validate+0xb0>
    3398:      	cmp	x4, x6
    339c:      	b.gt	0x3580 <_stogir.copy.validate+0x270>
    33a0:      	ldr	x4, [x0, #0x50]
    33a4:      	add	x4, x4, x5, lsl #2
    33a8:      	ldr	w4, [x4]
    33ac:      	sxtw	x4, w4
    33b0:      	cmp	x4, #0x0
    33b4:      	cset	w4, gt
    33b8:      	ubfx	x4, x4, #0, #8
    33bc:      	b	0x3584 <_stogir.copy.validate+0x274>
    33c0:      	movz	x4, #0x0, lsl #48
    33c4:      	b	0x33ec <_stogir.copy.validate+0xdc>
    33c8:      	adrp	x16, 0x3000 <_stogir.vector.validate+0x730>
		00000000000033c8:  ARM64_RELOC_PAGE21	l_stogir.359
    33cc:      	ldr	x16, [x16]
		00000000000033cc:  ARM64_RELOC_PAGEOFF12	l_stogir.359
    33d0:      	orr	x0, x16, xzr
    33d4:      	mov	x1, #0x1                ; =1
    33d8:      	mov	x2, #0x21               ; =33
    33dc:      	b	0x347c <_stogir.copy.validate+0x16c>
    33e0:      	movz	x4, #0x0, lsl #48
    33e4:      	b	0x33ec <_stogir.copy.validate+0xdc>
    33e8:      	movz	x4, #0x0, lsl #48
    33ec:      	cmp	x4, #0x0
    33f0:      	b.eq	0x342c <_stogir.copy.validate+0x11c>
    33f4:      	uxtb	w16, w3
    33f8:      	cmp	w16, wzr
    33fc:      	b.eq	0x3414 <_stogir.copy.validate+0x104>
    3400:      	ldr	x3, [x0]
    3404:      	add	x3, x3, x1, lsl #4
    3408:      	ldr	x4, [x3]
    340c:      	ldr	x3, [x3, #0x8]
    3410:      	b	0x3424 <_stogir.copy.validate+0x114>
    3414:      	ldr	x3, [x0, #0x28]
    3418:      	add	x3, x3, x5, lsl #4
    341c:      	ldr	x4, [x3]
    3420:      	ldr	x3, [x3, #0x8]
    3424:      	mov	w5, #0x1                ; =1
    3428:      	b	0x3438 <_stogir.copy.validate+0x128>
    342c:      	movz	w5, #0x0, lsl #16
    3430:      	movz	x4, #0x0, lsl #48
    3434:      	movz	x3, #0x0, lsl #48
    3438:      	ubfx	x5, x5, #0, #32
    343c:      	lsr	x16, x5, #0
    3440:      	cmp	x16, #0x1
    3444:      	b.eq	0x3460 <_stogir.copy.validate+0x150>
    3448:      	b.lo	0x3450 <_stogir.copy.validate+0x140>
    344c:      	b	0x3464 <_stogir.copy.validate+0x154>
    3450:      	cmp	x16, #0x0
    3454:      	b.eq	0x345c <_stogir.copy.validate+0x14c>
    3458:      	b	0x3464 <_stogir.copy.validate+0x154>
    345c:      	b	0x3468 <_stogir.copy.validate+0x158>
    3460:      	b	0x3490 <_stogir.copy.validate+0x180>
    3464:      	b	0x3588 <_stogir.copy.validate+0x278>
    3468:      	adrp	x16, 0x3000 <_stogir.vector.validate+0x730>
		0000000000003468:  ARM64_RELOC_PAGE21	l_stogir.360
    346c:      	ldr	x16, [x16]
		000000000000346c:  ARM64_RELOC_PAGEOFF12	l_stogir.360
    3470:      	orr	x0, x16, xzr
    3474:      	mov	x1, #0x1                ; =1
    3478:      	mov	x2, #0x18               ; =24
    347c:      	str	x1, [x8]
    3480:      	str	x0, [x8, #0x8]
    3484:      	str	x2, [x8, #0x10]
    3488:      	add	sp, sp, #0x10
    348c:      	ret
    3490:      	mov	x16, sp
    3494:      	str	x4, [x16]
    3498:      	mov	x16, sp
    349c:      	str	x3, [x16, #0x8]
    34a0:      	cmp	x1, #0x0
    34a4:      	b.le	0x33c8 <_stogir.copy.validate+0xb8>
    34a8:      	uxtb	w1, w4
    34ac:      	cmp	x1, #0x44
    34b0:      	b.ne	0x33c8 <_stogir.copy.validate+0xb8>
    34b4:      	ldr	x1, [x0, #0x78]
    34b8:      	add	x1, x2, x1
    34bc:      	ldr	w1, [x1]
    34c0:      	sxtw	x1, w1
    34c4:      	cmp	x1, #0x2
    34c8:      	b.ne	0x33c8 <_stogir.copy.validate+0xb8>
    34cc:      	ubfx	x4, x4, #0, #32
    34d0:      	ubfx	x1, x4, #8, #8
    34d4:      	orr	x2, x1, xzr
    34d8:      	cmp	x2, #0x0
    34dc:      	b.eq	0x33c8 <_stogir.copy.validate+0xb8>
    34e0:      	cmp	x2, #0xd
    34e4:      	b.le	0x3510 <_stogir.copy.validate+0x200>
    34e8:      	cmp	x2, #0xf
    34ec:      	b.le	0x33c8 <_stogir.copy.validate+0xb8>
    34f0:      	cmp	x2, #0x80
    34f4:      	b.ge	0x33c8 <_stogir.copy.validate+0xb8>
    34f8:      	and	w1, w1, #0xf
    34fc:      	ubfx	x1, x1, #0, #32
    3500:      	cmp	x1, #0x1
    3504:      	b.lt	0x33c8 <_stogir.copy.validate+0xb8>
    3508:      	cmp	x1, #0xd
    350c:      	b.gt	0x33c8 <_stogir.copy.validate+0xb8>
    3510:      	mov	x16, sp
    3514:      	ldr	w1, [x16, #0x4]
    3518:      	sxtw	x1, w1
    351c:      	cmp	x1, #0x0
    3520:      	cset	w3, gt
    3524:      	movz	x16, #0x0, lsl #48
    3528:      	sub	x4, x16, x1
    352c:      	sub	x5, x4, #0x1
    3530:      	uxtb	w16, w3
    3534:      	cmp	w16, wzr
    3538:      	b.eq	0x35a8 <_stogir.copy.validate+0x298>
    353c:      	ldr	x4, [x0, #0x8]
    3540:      	cmp	x1, x4
    3544:      	b.ge	0x35f0 <_stogir.copy.validate+0x2e0>
    3548:      	add	x4, x0, #0x78
    354c:      	ldr	x4, [x4, #0x8]
    3550:      	cmp	x1, x4
    3554:      	b.ge	0x36b8 <_stogir.copy.validate+0x3a8>
    3558:      	ldr	x4, [x0, #0x78]
    355c:      	add	x4, x4, x1, lsl #2
    3560:      	ldr	w4, [x4]
    3564:      	sxtw	x4, w4
    3568:      	cmp	x4, #0x0
    356c:      	cset	w4, ge
    3570:      	ubfx	x4, x4, #0, #8
    3574:      	b	0x36bc <_stogir.copy.validate+0x3ac>
    3578:      	movz	x4, #0x0, lsl #48
    357c:      	b	0x33e4 <_stogir.copy.validate+0xd4>
    3580:      	movz	x4, #0x0, lsl #48
    3584:      	b	0x33c4 <_stogir.copy.validate+0xb4>
    3588:      	brk	#0
    358c:      	b	0x3588 <_stogir.copy.validate+0x278>
    3590:      	adrp	x16, 0x3000 <_stogir.vector.validate+0x730>
		0000000000003590:  ARM64_RELOC_PAGE21	l_stogir.361
    3594:      	ldr	x16, [x16]
		0000000000003594:  ARM64_RELOC_PAGEOFF12	l_stogir.361
    3598:      	orr	x0, x16, xzr
    359c:      	mov	x1, #0x1                ; =1
    35a0:      	mov	x2, #0x20               ; =32
    35a4:      	b	0x33dc <_stogir.copy.validate+0xcc>
    35a8:      	cmp	x1, #0x0
    35ac:      	b.ge	0x35f8 <_stogir.copy.validate+0x2e8>
    35b0:      	add	x6, x0, #0x28
    35b4:      	add	x7, x0, #0x50
    35b8:      	ldr	x6, [x6, #0x8]
    35bc:      	ldr	x7, [x7, #0x8]
    35c0:      	cmp	x6, x7
    35c4:      	b.ne	0x36b0 <_stogir.copy.validate+0x3a0>
    35c8:      	cmp	x4, x6
    35cc:      	b.gt	0x36c0 <_stogir.copy.validate+0x3b0>
    35d0:      	ldr	x4, [x0, #0x50]
    35d4:      	add	x4, x4, x5, lsl #2
    35d8:      	ldr	w4, [x4]
    35dc:      	sxtw	x4, w4
    35e0:      	cmp	x4, #0x0
    35e4:      	cset	w4, gt
    35e8:      	ubfx	x4, x4, #0, #8
    35ec:      	b	0x36c4 <_stogir.copy.validate+0x3b4>
    35f0:      	movz	x4, #0x0, lsl #48
    35f4:      	b	0x35fc <_stogir.copy.validate+0x2ec>
    35f8:      	movz	x4, #0x0, lsl #48
    35fc:      	cmp	x4, #0x0
    3600:      	b.eq	0x3634 <_stogir.copy.validate+0x324>
    3604:      	uxtb	w16, w3
    3608:      	cmp	w16, wzr
    360c:      	b.eq	0x3620 <_stogir.copy.validate+0x310>
    3610:      	ldr	x0, [x0]
    3614:      	add	x0, x0, x1, lsl #4
    3618:      	ldr	x0, [x0]
    361c:      	b	0x362c <_stogir.copy.validate+0x31c>
    3620:      	ldr	x0, [x0, #0x28]
    3624:      	add	x0, x0, x5, lsl #4
    3628:      	ldr	x0, [x0]
    362c:      	mov	w1, #0x1                ; =1
    3630:      	b	0x363c <_stogir.copy.validate+0x32c>
    3634:      	movz	w1, #0x0, lsl #16
    3638:      	movz	x0, #0x0, lsl #48
    363c:      	ubfx	x1, x1, #0, #32
    3640:      	lsr	x16, x1, #0
    3644:      	cmp	x16, #0x1
    3648:      	b.eq	0x3664 <_stogir.copy.validate+0x354>
    364c:      	b.lo	0x3654 <_stogir.copy.validate+0x344>
    3650:      	b	0x3668 <_stogir.copy.validate+0x358>
    3654:      	cmp	x16, #0x0
    3658:      	b.eq	0x3660 <_stogir.copy.validate+0x350>
    365c:      	b	0x3668 <_stogir.copy.validate+0x358>
    3660:      	b	0x366c <_stogir.copy.validate+0x35c>
    3664:      	b	0x3684 <_stogir.copy.validate+0x374>
    3668:      	b	0x36c8 <_stogir.copy.validate+0x3b8>
    366c:      	adrp	x16, 0x3000 <_stogir.vector.validate+0x730>
		000000000000366c:  ARM64_RELOC_PAGE21	l_stogir.362
    3670:      	ldr	x16, [x16]
		0000000000003670:  ARM64_RELOC_PAGEOFF12	l_stogir.362
    3674:      	orr	x0, x16, xzr
    3678:      	mov	x1, #0x1                ; =1
    367c:      	mov	x2, #0x13               ; =19
    3680:      	b	0x35a4 <_stogir.copy.validate+0x294>
    3684:      	mov	x16, sp
    3688:      	ldr	w1, [x16]
    368c:      	ubfx	x0, x0, #0, #32
    3690:      	ubfx	x0, x0, #8, #8
    3694:      	ubfx	x1, x1, #8, #8
    3698:      	cmp	x0, x1
    369c:      	b.ne	0x3590 <_stogir.copy.validate+0x280>
    36a0:      	and	x0, x2, #0xffffffff
    36a4:      	movz	x1, #0x0, lsl #48
    36a8:      	movz	x2, #0x0, lsl #48
    36ac:      	b	0x35a4 <_stogir.copy.validate+0x294>
    36b0:      	movz	x4, #0x0, lsl #48
    36b4:      	b	0x35fc <_stogir.copy.validate+0x2ec>
    36b8:      	movz	x4, #0x0, lsl #48
    36bc:      	b	0x35f4 <_stogir.copy.validate+0x2e4>
    36c0:      	movz	x4, #0x0, lsl #48
    36c4:      	b	0x36b4 <_stogir.copy.validate+0x3a4>
    36c8:      	brk	#0
    36cc:      	b	0x36c8 <_stogir.copy.validate+0x3b8>

00000000000036d0 <_stogir.graph.lookup>:
    36d0:      	sxtw	x1, w1
    36d4:      	cmp	x1, #0x0
    36d8:      	cset	w2, gt
    36dc:      	movz	x16, #0x0, lsl #48
    36e0:      	sub	x3, x16, x1
    36e4:      	sub	x4, x3, #0x1
    36e8:      	uxtb	w16, w2
    36ec:      	cmp	w16, wzr
    36f0:      	b.eq	0x3730 <_stogir.graph.lookup+0x60>
    36f4:      	ldr	x3, [x0, #0x8]
    36f8:      	cmp	x1, x3
    36fc:      	b.ge	0x3780 <_stogir.graph.lookup+0xb0>
    3700:      	add	x3, x0, #0x78
    3704:      	ldr	x3, [x3, #0x8]
    3708:      	cmp	x1, x3
    370c:      	b.ge	0x37f8 <_stogir.graph.lookup+0x128>
    3710:      	ldr	x3, [x0, #0x78]
    3714:      	add	x3, x3, x1, lsl #2
    3718:      	ldr	w3, [x3]
    371c:      	sxtw	x3, w3
    3720:      	cmp	x3, #0x0
    3724:      	cset	w3, ge
    3728:      	ubfx	x3, x3, #0, #8
    372c:      	b	0x37fc <_stogir.graph.lookup+0x12c>
    3730:      	cmp	x1, #0x0
    3734:      	b.ge	0x3788 <_stogir.graph.lookup+0xb8>
    3738:      	add	x5, x0, #0x28
    373c:      	add	x6, x0, #0x50
    3740:      	ldr	x5, [x5, #0x8]
    3744:      	ldr	x6, [x6, #0x8]
    3748:      	cmp	x5, x6
    374c:      	b.ne	0x3778 <_stogir.graph.lookup+0xa8>
    3750:      	cmp	x3, x5
    3754:      	b.gt	0x3800 <_stogir.graph.lookup+0x130>
    3758:      	ldr	x3, [x0, #0x50]
    375c:      	add	x3, x3, x4, lsl #2
    3760:      	ldr	w3, [x3]
    3764:      	sxtw	x3, w3
    3768:      	cmp	x3, #0x0
    376c:      	cset	w3, gt
    3770:      	ubfx	x3, x3, #0, #8
    3774:      	b	0x3804 <_stogir.graph.lookup+0x134>
    3778:      	movz	x3, #0x0, lsl #48
    377c:      	b	0x378c <_stogir.graph.lookup+0xbc>
    3780:      	movz	x3, #0x0, lsl #48
    3784:      	b	0x378c <_stogir.graph.lookup+0xbc>
    3788:      	movz	x3, #0x0, lsl #48
    378c:      	cmp	x3, #0x0
    3790:      	b.eq	0x37cc <_stogir.graph.lookup+0xfc>
    3794:      	uxtb	w16, w2
    3798:      	cmp	w16, wzr
    379c:      	b.eq	0x37b4 <_stogir.graph.lookup+0xe4>
    37a0:      	ldr	x0, [x0]
    37a4:      	add	x0, x0, x1, lsl #4
    37a8:      	ldr	x1, [x0]
    37ac:      	ldr	x0, [x0, #0x8]
    37b0:      	b	0x37c4 <_stogir.graph.lookup+0xf4>
    37b4:      	ldr	x0, [x0, #0x28]
    37b8:      	add	x0, x0, x4, lsl #4
    37bc:      	ldr	x1, [x0]
    37c0:      	ldr	x0, [x0, #0x8]
    37c4:      	mov	x2, #0x1                ; =1
    37c8:      	b	0x37d8 <_stogir.graph.lookup+0x108>
    37cc:      	movz	x2, #0x0, lsl #48
    37d0:      	movz	x1, #0x0, lsl #48
    37d4:      	movz	x0, #0x0, lsl #48
    37d8:      	str	x2, [x8]
    37dc:      	str	x1, [x8, #0x8]
    37e0:      	str	x0, [x8, #0x10]
    37e4:      	movz	x17, #0x0, lsl #48
    37e8:      	str	x17, [x8, #0x18]
    37ec:      	movz	x17, #0x0, lsl #48
    37f0:      	str	x17, [x8, #0x20]
    37f4:      	ret
    37f8:      	movz	x3, #0x0, lsl #48
    37fc:      	b	0x3784 <_stogir.graph.lookup+0xb4>
    3800:      	movz	x3, #0x0, lsl #48
    3804:      	b	0x377c <_stogir.graph.lookup+0xac>

0000000000003808 <_stogir.checked.validate-projection>:
    3808:      	sub	sp, sp, #0x40
    380c:      	str	x29, [sp]
    3810:      	str	x30, [sp, #0x8]
    3814:      	mov	x29, sp
    3818:      	str	x19, [sp, #0x30]
    381c:      	sxtw	x1, w1
    3820:      	lsl	x2, x1, #2
    3824:      	cmp	x1, #0x0
    3828:      	cset	w3, gt
    382c:      	movz	x16, #0x0, lsl #48
    3830:      	sub	x4, x16, x1
    3834:      	sub	x5, x4, #0x1
    3838:      	uxtb	w16, w3
    383c:      	cmp	w16, wzr
    3840:      	b.eq	0x3880 <_stogir.checked.validate-projection+0x78>
    3844:      	ldr	x4, [x0, #0x8]
    3848:      	cmp	x1, x4
    384c:      	b.ge	0x38d0 <_stogir.checked.validate-projection+0xc8>
    3850:      	add	x4, x0, #0x78
    3854:      	ldr	x4, [x4, #0x8]
    3858:      	cmp	x1, x4
    385c:      	b.ge	0x39a8 <_stogir.checked.validate-projection+0x1a0>
    3860:      	ldr	x4, [x0, #0x78]
    3864:      	add	x4, x2, x4
    3868:      	ldr	w4, [x4]
    386c:      	sxtw	x4, w4
    3870:      	cmp	x4, #0x0
    3874:      	cset	w4, ge
    3878:      	ubfx	x4, x4, #0, #8
    387c:      	b	0x39ac <_stogir.checked.validate-projection+0x1a4>
    3880:      	cmp	x1, #0x0
    3884:      	b.ge	0x38d8 <_stogir.checked.validate-projection+0xd0>
    3888:      	add	x6, x0, #0x28
    388c:      	add	x7, x0, #0x50
    3890:      	ldr	x6, [x6, #0x8]
    3894:      	ldr	x7, [x7, #0x8]
    3898:      	cmp	x6, x7
    389c:      	b.ne	0x38c8 <_stogir.checked.validate-projection+0xc0>
    38a0:      	cmp	x4, x6
    38a4:      	b.gt	0x3a14 <_stogir.checked.validate-projection+0x20c>
    38a8:      	ldr	x4, [x0, #0x50]
    38ac:      	add	x4, x4, x5, lsl #2
    38b0:      	ldr	w4, [x4]
    38b4:      	sxtw	x4, w4
    38b8:      	cmp	x4, #0x0
    38bc:      	cset	w4, gt
    38c0:      	ubfx	x4, x4, #0, #8
    38c4:      	b	0x3a18 <_stogir.checked.validate-projection+0x210>
    38c8:      	movz	x4, #0x0, lsl #48
    38cc:      	b	0x38dc <_stogir.checked.validate-projection+0xd4>
    38d0:      	movz	x4, #0x0, lsl #48
    38d4:      	b	0x38dc <_stogir.checked.validate-projection+0xd4>
    38d8:      	movz	x4, #0x0, lsl #48
    38dc:      	cmp	x4, #0x0
    38e0:      	b.eq	0x3914 <_stogir.checked.validate-projection+0x10c>
    38e4:      	uxtb	w16, w3
    38e8:      	cmp	w16, wzr
    38ec:      	b.eq	0x3900 <_stogir.checked.validate-projection+0xf8>
    38f0:      	ldr	x3, [x0]
    38f4:      	add	x3, x3, x1, lsl #4
    38f8:      	ldr	x3, [x3]
    38fc:      	b	0x390c <_stogir.checked.validate-projection+0x104>
    3900:      	ldr	x3, [x0, #0x28]
    3904:      	add	x3, x3, x5, lsl #4
    3908:      	ldr	x3, [x3]
    390c:      	mov	w4, #0x1                ; =1
    3910:      	b	0x391c <_stogir.checked.validate-projection+0x114>
    3914:      	movz	w4, #0x0, lsl #16
    3918:      	movz	x3, #0x0, lsl #48
    391c:      	ubfx	x4, x4, #0, #32
    3920:      	lsr	x16, x4, #0
    3924:      	cmp	x16, #0x1
    3928:      	b.eq	0x3944 <_stogir.checked.validate-projection+0x13c>
    392c:      	b.lo	0x3934 <_stogir.checked.validate-projection+0x12c>
    3930:      	b	0x3948 <_stogir.checked.validate-projection+0x140>
    3934:      	cmp	x16, #0x0
    3938:      	b.eq	0x3940 <_stogir.checked.validate-projection+0x138>
    393c:      	b	0x3948 <_stogir.checked.validate-projection+0x140>
    3940:      	b	0x394c <_stogir.checked.validate-projection+0x144>
    3944:      	b	0x3968 <_stogir.checked.validate-projection+0x160>
    3948:      	b	0x3a1c <_stogir.checked.validate-projection+0x214>
    394c:      	adrp	x16, 0x3000 <_stogir.vector.validate+0x730>
		000000000000394c:  ARM64_RELOC_PAGE21	l_stogir.363
    3950:      	ldr	x16, [x16]
		0000000000003950:  ARM64_RELOC_PAGEOFF12	l_stogir.363
    3954:      	orr	x0, x16, xzr
    3958:      	mov	x19, x8
    395c:      	mov	x1, #0x1                ; =1
    3960:      	mov	x2, #0x10               ; =16
    3964:      	b	0x3988 <_stogir.checked.validate-projection+0x180>
    3968:      	cmp	x1, #0x0
    396c:      	b.gt	0x39b0 <_stogir.checked.validate-projection+0x1a8>
    3970:      	mov	x19, x8
    3974:      	adrp	x16, 0x3000 <_stogir.vector.validate+0x730>
		0000000000003974:  ARM64_RELOC_PAGE21	l_stogir.364
    3978:      	ldr	x16, [x16]
		0000000000003978:  ARM64_RELOC_PAGEOFF12	l_stogir.364
    397c:      	orr	x0, x16, xzr
    3980:      	mov	x1, #0x1                ; =1
    3984:      	mov	x2, #0x1c               ; =28
    3988:      	str	x1, [x19]
    398c:      	str	x0, [x19, #0x8]
    3990:      	str	x2, [x19, #0x10]
    3994:      	ldr	x19, [sp, #0x30]
    3998:      	ldr	x29, [sp]
    399c:      	ldr	x30, [sp, #0x8]
    39a0:      	add	sp, sp, #0x40
    39a4:      	ret
    39a8:      	movz	x4, #0x0, lsl #48
    39ac:      	b	0x38d4 <_stogir.checked.validate-projection+0xcc>
    39b0:      	uxtb	w1, w3
    39b4:      	cmp	x1, #0x2c
    39b8:      	b.ne	0x3a24 <_stogir.checked.validate-projection+0x21c>
    39bc:      	orr	w1, w3, wzr
    39c0:      	ubfx	x1, x1, #0, #32
    39c4:      	ubfx	x1, x1, #8, #8
    39c8:      	cmp	x1, #0x1
    39cc:      	b.ne	0x3a2c <_stogir.checked.validate-projection+0x224>
    39d0:      	ldr	x1, [x0, #0x78]
    39d4:      	add	x1, x2, x1
    39d8:      	ldr	w1, [x1]
    39dc:      	sxtw	x1, w1
    39e0:      	cmp	x1, #0x1
    39e4:      	b.ne	0x3a34 <_stogir.checked.validate-projection+0x22c>
    39e8:      	lsr	x1, x3, #32
    39ec:      	mov	x19, x8
    39f0:      	add	x8, sp, #0x10
    39f4:      	bl	0x39f4 <_stogir.checked.validate-projection+0x1ec>
		00000000000039f4:  ARM64_RELOC_BRANCH26	_stogir.checked.projection
    39f8:      	add	x16, sp, #0x10
    39fc:      	ldr	x1, [x16]
    3a00:      	add	x16, sp, #0x10
    3a04:      	ldr	x0, [x16, #0x8]
    3a08:      	add	x16, sp, #0x10
    3a0c:      	ldr	x2, [x16, #0x10]
    3a10:      	b	0x3988 <_stogir.checked.validate-projection+0x180>
    3a14:      	movz	x4, #0x0, lsl #48
    3a18:      	b	0x38cc <_stogir.checked.validate-projection+0xc4>
    3a1c:      	brk	#0
    3a20:      	b	0x3a1c <_stogir.checked.validate-projection+0x214>
    3a24:      	mov	x19, x8
    3a28:      	b	0x3974 <_stogir.checked.validate-projection+0x16c>
    3a2c:      	mov	x19, x8
    3a30:      	b	0x3974 <_stogir.checked.validate-projection+0x16c>
    3a34:      	mov	x19, x8
    3a38:      	b	0x3974 <_stogir.checked.validate-projection+0x16c>

0000000000003a3c <_stogir.checked.validate>:
    3a3c:      	sub	sp, sp, #0x30
    3a40:      	str	x29, [sp]
    3a44:      	str	x30, [sp, #0x8]
    3a48:      	mov	x29, sp
    3a4c:      	str	x19, [sp, #0x10]
    3a50:      	str	x20, [sp, #0x18]
    3a54:      	str	x21, [sp, #0x20]
    3a58:      	sxtw	x1, w1
    3a5c:      	lsl	x2, x1, #2
    3a60:      	cmp	x1, #0x0
    3a64:      	cset	w3, gt
    3a68:      	movz	x16, #0x0, lsl #48
    3a6c:      	sub	x4, x16, x1
    3a70:      	sub	x5, x4, #0x1
    3a74:      	uxtb	w16, w3
    3a78:      	cmp	w16, wzr
    3a7c:      	b.eq	0x3abc <_stogir.checked.validate+0x80>
    3a80:      	ldr	x4, [x0, #0x8]
    3a84:      	cmp	x1, x4
    3a88:      	b.ge	0x3b0c <_stogir.checked.validate+0xd0>
    3a8c:      	add	x4, x0, #0x78
    3a90:      	ldr	x4, [x4, #0x8]
    3a94:      	cmp	x1, x4
    3a98:      	b.ge	0x3c70 <_stogir.checked.validate+0x234>
    3a9c:      	ldr	x4, [x0, #0x78]
    3aa0:      	add	x4, x2, x4
    3aa4:      	ldr	w4, [x4]
    3aa8:      	sxtw	x4, w4
    3aac:      	cmp	x4, #0x0
    3ab0:      	cset	w4, ge
    3ab4:      	ubfx	x4, x4, #0, #8
    3ab8:      	b	0x3c74 <_stogir.checked.validate+0x238>
    3abc:      	cmp	x1, #0x0
    3ac0:      	b.ge	0x3b14 <_stogir.checked.validate+0xd8>
    3ac4:      	add	x6, x0, #0x28
    3ac8:      	add	x7, x0, #0x50
    3acc:      	ldr	x6, [x6, #0x8]
    3ad0:      	ldr	x7, [x7, #0x8]
    3ad4:      	cmp	x6, x7
    3ad8:      	b.ne	0x3b04 <_stogir.checked.validate+0xc8>
    3adc:      	cmp	x4, x6
    3ae0:      	b.gt	0x3c78 <_stogir.checked.validate+0x23c>
    3ae4:      	ldr	x4, [x0, #0x50]
    3ae8:      	add	x4, x4, x5, lsl #2
    3aec:      	ldr	w4, [x4]
    3af0:      	sxtw	x4, w4
    3af4:      	cmp	x4, #0x0
    3af8:      	cset	w4, gt
    3afc:      	ubfx	x4, x4, #0, #8
    3b00:      	b	0x3c7c <_stogir.checked.validate+0x240>
    3b04:      	movz	x4, #0x0, lsl #48
    3b08:      	b	0x3b18 <_stogir.checked.validate+0xdc>
    3b0c:      	movz	x4, #0x0, lsl #48
    3b10:      	b	0x3b18 <_stogir.checked.validate+0xdc>
    3b14:      	movz	x4, #0x0, lsl #48
    3b18:      	cmp	x4, #0x0
    3b1c:      	b.eq	0x3b58 <_stogir.checked.validate+0x11c>
    3b20:      	uxtb	w16, w3
    3b24:      	cmp	w16, wzr
    3b28:      	b.eq	0x3b40 <_stogir.checked.validate+0x104>
    3b2c:      	ldr	x3, [x0]
    3b30:      	add	x3, x3, x1, lsl #4
    3b34:      	ldr	x4, [x3]
    3b38:      	ldr	x3, [x3, #0x8]
    3b3c:      	b	0x3b50 <_stogir.checked.validate+0x114>
    3b40:      	ldr	x3, [x0, #0x28]
    3b44:      	add	x3, x3, x5, lsl #4
    3b48:      	ldr	x4, [x3]
    3b4c:      	ldr	x3, [x3, #0x8]
    3b50:      	mov	w5, #0x1                ; =1
    3b54:      	b	0x3b64 <_stogir.checked.validate+0x128>
    3b58:      	movz	w5, #0x0, lsl #16
    3b5c:      	movz	x4, #0x0, lsl #48
    3b60:      	movz	x3, #0x0, lsl #48
    3b64:      	ubfx	x5, x5, #0, #32
    3b68:      	lsr	x16, x5, #0
    3b6c:      	cmp	x16, #0x1
    3b70:      	b.eq	0x3b8c <_stogir.checked.validate+0x150>
    3b74:      	b.lo	0x3b7c <_stogir.checked.validate+0x140>
    3b78:      	b	0x3b90 <_stogir.checked.validate+0x154>
    3b7c:      	cmp	x16, #0x0
    3b80:      	b.eq	0x3b88 <_stogir.checked.validate+0x14c>
    3b84:      	b	0x3b90 <_stogir.checked.validate+0x154>
    3b88:      	b	0x3b94 <_stogir.checked.validate+0x158>
    3b8c:      	b	0x3bec <_stogir.checked.validate+0x1b0>
    3b90:      	b	0x3ea4 <_stogir.checked.validate+0x468>
    3b94:      	adrp	x16, 0x3000 <_stogir.vector.validate+0x730>
		0000000000003b94:  ARM64_RELOC_PAGE21	l_stogir.365
    3b98:      	ldr	x16, [x16]
		0000000000003b98:  ARM64_RELOC_PAGEOFF12	l_stogir.365
    3b9c:      	orr	x1, x16, xzr
    3ba0:      	mov	x0, #0x1                ; =1
    3ba4:      	mov	x9, #0x1a               ; =26
    3ba8:      	b	0x3bc0 <_stogir.checked.validate+0x184>
    3bac:      	adrp	x16, 0x3000 <_stogir.vector.validate+0x730>
		0000000000003bac:  ARM64_RELOC_PAGE21	l_stogir.366
    3bb0:      	ldr	x16, [x16]
		0000000000003bb0:  ARM64_RELOC_PAGEOFF12	l_stogir.366
    3bb4:      	orr	x1, x16, xzr
    3bb8:      	mov	x0, #0x1                ; =1
    3bbc:      	mov	x9, #0x26               ; =38
    3bc0:      	str	x0, [x8]
    3bc4:      	str	x1, [x8, #0x8]
    3bc8:      	str	x9, [x8, #0x10]
    3bcc:      	sub	sp, x29, #0x0
    3bd0:      	ldr	x19, [sp, #0x10]
    3bd4:      	ldr	x20, [sp, #0x18]
    3bd8:      	ldr	x21, [sp, #0x20]
    3bdc:      	ldr	x29, [sp]
    3be0:      	ldr	x30, [sp, #0x8]
    3be4:      	add	sp, sp, #0x30
    3be8:      	ret
    3bec:      	cmp	x1, #0x0
    3bf0:      	b.le	0x3bac <_stogir.checked.validate+0x170>
    3bf4:      	uxtb	w1, w4
    3bf8:      	cmp	x1, #0x29
    3bfc:      	b.lt	0x3bac <_stogir.checked.validate+0x170>
    3c00:      	cmp	x1, #0x2b
    3c04:      	b.gt	0x3bac <_stogir.checked.validate+0x170>
    3c08:      	ldr	x1, [x0, #0x78]
    3c0c:      	add	x1, x2, x1
    3c10:      	ldr	w1, [x1]
    3c14:      	sxtw	x1, w1
    3c18:      	cmp	x1, #0x2
    3c1c:      	b.ne	0x3bac <_stogir.checked.validate+0x170>
    3c20:      	orr	w1, w4, wzr
    3c24:      	mov	x2, sp
    3c28:      	ubfx	x1, x1, #0, #32
    3c2c:      	sub	sp, sp, #0x10
    3c30:      	mov	x5, sp
    3c34:      	sub	sp, sp, #0x10
    3c38:      	mov	x6, sp
    3c3c:      	ubfx	x1, x1, #8, #8
    3c40:      	orr	x7, x1, xzr
    3c44:      	cmp	x7, #0x1
    3c48:      	b.lt	0x3e40 <_stogir.checked.validate+0x404>
    3c4c:      	cmp	x7, #0xb
    3c50:      	b.gt	0x3e40 <_stogir.checked.validate+0x404>
    3c54:      	cmp	x7, #0x1
    3c58:      	b.eq	0x3e40 <_stogir.checked.validate+0x404>
    3c5c:      	adrp	x16, 0x3000 <_stogir.vector.validate+0x730>
		0000000000003c5c:  ARM64_RELOC_PAGE21	l_stogir.367
    3c60:      	ldr	x16, [x16]
		0000000000003c60:  ARM64_RELOC_PAGEOFF12	l_stogir.367
    3c64:      	orr	x1, x16, xzr
    3c68:      	movz	x9, #0x0, lsl #48
    3c6c:      	b	0x3e50 <_stogir.checked.validate+0x414>
    3c70:      	movz	x4, #0x0, lsl #48
    3c74:      	b	0x3b10 <_stogir.checked.validate+0xd4>
    3c78:      	movz	x4, #0x0, lsl #48
    3c7c:      	b	0x3b08 <_stogir.checked.validate+0xcc>
    3c80:      	mov	x0, #0x1                ; =1
    3c84:      	mov	sp, x2
    3c88:      	b	0x3bc0 <_stogir.checked.validate+0x184>
    3c8c:      	movz	w5, #0x0, lsl #16
    3c90:      	movz	x4, #0x0, lsl #48
    3c94:      	ubfx	x5, x5, #0, #32
    3c98:      	lsr	x16, x5, #0
    3c9c:      	cmp	x16, #0x1
    3ca0:      	b.eq	0x3cbc <_stogir.checked.validate+0x280>
    3ca4:      	b.lo	0x3cac <_stogir.checked.validate+0x270>
    3ca8:      	b	0x3cc0 <_stogir.checked.validate+0x284>
    3cac:      	cmp	x16, #0x0
    3cb0:      	b.eq	0x3cb8 <_stogir.checked.validate+0x27c>
    3cb4:      	b	0x3cc0 <_stogir.checked.validate+0x284>
    3cb8:      	b	0x3cc4 <_stogir.checked.validate+0x288>
    3cbc:      	b	0x3e24 <_stogir.checked.validate+0x3e8>
    3cc0:      	b	0x3ebc <_stogir.checked.validate+0x480>
    3cc4:      	mov	x1, x11
    3cc8:      	mov	x9, #0x22               ; =34
    3ccc:      	cmp	x3, #0x2
    3cd0:      	b.ge	0x3cf4 <_stogir.checked.validate+0x2b8>
    3cd4:      	add	x4, x3, #0x1
    3cd8:      	add	x3, x10, x3, lsl #2
    3cdc:      	ldr	w3, [x3]
    3ce0:      	movn	w17, #0x0, lsl #16
    3ce4:      	and	w5, w3, w17
    3ce8:      	mov	x3, x4
    3cec:      	mov	w4, #0x1                ; =1
    3cf0:      	b	0x3cfc <_stogir.checked.validate+0x2c0>
    3cf4:      	movz	w4, #0x0, lsl #16
    3cf8:      	movz	w5, #0x0, lsl #16
    3cfc:      	ubfx	x4, x4, #0, #32
    3d00:      	lsr	x16, x4, #0
    3d04:      	cmp	x16, #0x1
    3d08:      	b.eq	0x3d24 <_stogir.checked.validate+0x2e8>
    3d0c:      	b.lo	0x3d14 <_stogir.checked.validate+0x2d8>
    3d10:      	b	0x3d28 <_stogir.checked.validate+0x2ec>
    3d14:      	cmp	x16, #0x0
    3d18:      	b.eq	0x3d20 <_stogir.checked.validate+0x2e4>
    3d1c:      	b	0x3d28 <_stogir.checked.validate+0x2ec>
    3d20:      	b	0x3d88 <_stogir.checked.validate+0x34c>
    3d24:      	b	0x3d2c <_stogir.checked.validate+0x2f0>
    3d28:      	b	0x3eb4 <_stogir.checked.validate+0x478>
    3d2c:      	sxtw	x5, w5
    3d30:      	cmp	x5, #0x0
    3d34:      	cset	w4, gt
    3d38:      	movz	x16, #0x0, lsl #48
    3d3c:      	sub	x6, x16, x5
    3d40:      	sub	x19, x6, #0x1
    3d44:      	uxtb	w16, w4
    3d48:      	cmp	w16, wzr
    3d4c:      	b.eq	0x3de4 <_stogir.checked.validate+0x3a8>
    3d50:      	ldr	x6, [x0, #0x8]
    3d54:      	cmp	x5, x6
    3d58:      	b.ge	0x3ddc <_stogir.checked.validate+0x3a0>
    3d5c:      	ldr	x6, [x13, #0x8]
    3d60:      	cmp	x5, x6
    3d64:      	b.ge	0x3e9c <_stogir.checked.validate+0x460>
    3d68:      	ldr	x6, [x0, #0x78]
    3d6c:      	add	x6, x6, x5, lsl #2
    3d70:      	ldr	w6, [x6]
    3d74:      	sxtw	x6, w6
    3d78:      	cmp	x6, #0x0
    3d7c:      	cset	w6, ge
    3d80:      	ubfx	x6, x6, #0, #8
    3d84:      	b	0x3ea0 <_stogir.checked.validate+0x464>
    3d88:      	cmp	x9, #0x0
    3d8c:      	b.ne	0x3c80 <_stogir.checked.validate+0x244>
    3d90:      	and	x1, x7, #0xffffffff
    3d94:      	movz	x0, #0x0, lsl #48
    3d98:      	movz	x9, #0x0, lsl #48
    3d9c:      	b	0x3c84 <_stogir.checked.validate+0x248>
    3da0:      	ldr	x4, [x0, #0x28]
    3da4:      	add	x4, x4, x19, lsl #4
    3da8:      	ldr	x4, [x4]
    3dac:      	mov	w5, #0x1                ; =1
    3db0:      	b	0x3c94 <_stogir.checked.validate+0x258>
    3db4:      	movz	x6, #0x0, lsl #48
    3db8:      	cmp	x6, #0x0
    3dbc:      	b.eq	0x3c8c <_stogir.checked.validate+0x250>
    3dc0:      	uxtb	w16, w4
    3dc4:      	cmp	w16, wzr
    3dc8:      	b.eq	0x3da0 <_stogir.checked.validate+0x364>
    3dcc:      	ldr	x4, [x0]
    3dd0:      	add	x4, x4, x5, lsl #4
    3dd4:      	ldr	x4, [x4]
    3dd8:      	b	0x3dac <_stogir.checked.validate+0x370>
    3ddc:      	movz	x6, #0x0, lsl #48
    3de0:      	b	0x3db8 <_stogir.checked.validate+0x37c>
    3de4:      	cmp	x5, #0x0
    3de8:      	b.ge	0x3db4 <_stogir.checked.validate+0x378>
    3dec:      	ldr	x20, [x14, #0x8]
    3df0:      	ldr	x21, [x15, #0x8]
    3df4:      	cmp	x20, x21
    3df8:      	b.ne	0x3e94 <_stogir.checked.validate+0x458>
    3dfc:      	cmp	x6, x20
    3e00:      	b.gt	0x3eac <_stogir.checked.validate+0x470>
    3e04:      	ldr	x6, [x0, #0x50]
    3e08:      	add	x6, x6, x19, lsl #2
    3e0c:      	ldr	w6, [x6]
    3e10:      	sxtw	x6, w6
    3e14:      	cmp	x6, #0x0
    3e18:      	cset	w6, gt
    3e1c:      	ubfx	x6, x6, #0, #8
    3e20:      	b	0x3eb0 <_stogir.checked.validate+0x474>
    3e24:      	ubfx	x4, x4, #0, #32
    3e28:      	ubfx	x4, x4, #8, #8
    3e2c:      	cmp	x4, x7
    3e30:      	b.eq	0x3e3c <_stogir.checked.validate+0x400>
    3e34:      	mov	x1, x12
    3e38:      	mov	x9, #0x28               ; =40
    3e3c:      	b	0x3ccc <_stogir.checked.validate+0x290>
    3e40:      	adrp	x16, 0x3000 <_stogir.vector.validate+0x730>
		0000000000003e40:  ARM64_RELOC_PAGE21	l_stogir.368
    3e44:      	ldr	x16, [x16]
		0000000000003e44:  ARM64_RELOC_PAGEOFF12	l_stogir.368
    3e48:      	orr	x1, x16, xzr
    3e4c:      	mov	x9, #0x36               ; =54
    3e50:      	orr	x10, x6, xzr
    3e54:      	adrp	x16, 0x3000 <_stogir.vector.validate+0x730>
		0000000000003e54:  ARM64_RELOC_PAGE21	l_stogir.369
    3e58:      	ldr	x16, [x16]
		0000000000003e58:  ARM64_RELOC_PAGEOFF12	l_stogir.369
    3e5c:      	orr	x11, x16, xzr
    3e60:      	adrp	x16, 0x3000 <_stogir.vector.validate+0x730>
		0000000000003e60:  ARM64_RELOC_PAGE21	l_stogir.370
    3e64:      	ldr	x16, [x16]
		0000000000003e64:  ARM64_RELOC_PAGEOFF12	l_stogir.370
    3e68:      	orr	x12, x16, xzr
    3e6c:      	add	x13, x0, #0x78
    3e70:      	add	x14, x0, #0x28
    3e74:      	add	x15, x0, #0x50
    3e78:      	lsr	x4, x4, #32
    3e7c:      	str	w4, [x5]
    3e80:      	str	w3, [x5, #0x4]
    3e84:      	ldr	x3, [x5]
    3e88:      	str	x3, [x6]
    3e8c:      	movz	x3, #0x0, lsl #48
    3e90:      	b	0x3ccc <_stogir.checked.validate+0x290>
    3e94:      	movz	x6, #0x0, lsl #48
    3e98:      	b	0x3db8 <_stogir.checked.validate+0x37c>
    3e9c:      	movz	x6, #0x0, lsl #48
    3ea0:      	b	0x3de0 <_stogir.checked.validate+0x3a4>
    3ea4:      	brk	#0
    3ea8:      	b	0x3ea4 <_stogir.checked.validate+0x468>
    3eac:      	movz	x6, #0x0, lsl #48
    3eb0:      	b	0x3e98 <_stogir.checked.validate+0x45c>
    3eb4:      	brk	#0
    3eb8:      	b	0x3eb4 <_stogir.checked.validate+0x478>
    3ebc:      	brk	#0
    3ec0:      	b	0x3ebc <_stogir.checked.validate+0x480>

0000000000003ec4 <_stogir.atomic.validate>:
    3ec4:      	sub	sp, sp, #0xf0
    3ec8:      	str	x29, [sp, #0x10]
    3ecc:      	str	x30, [sp, #0x18]
    3ed0:      	add	x29, sp, #0x10
    3ed4:      	str	x19, [sp, #0xa0]
    3ed8:      	str	x20, [sp, #0xa8]
    3edc:      	str	x21, [sp, #0xb0]
    3ee0:      	str	x22, [sp, #0xb8]
    3ee4:      	str	x23, [sp, #0xc0]
    3ee8:      	str	x24, [sp, #0xc8]
    3eec:      	str	x25, [sp, #0xd0]
    3ef0:      	str	x26, [sp, #0xd8]
    3ef4:      	str	x27, [sp, #0xe0]
    3ef8:      	sxtw	x2, w1
    3efc:      	lsl	x3, x2, #2
    3f00:      	cmp	x2, #0x0
    3f04:      	cset	w4, gt
    3f08:      	movz	x16, #0x0, lsl #48
    3f0c:      	sub	x5, x16, x2
    3f10:      	sub	x6, x5, #0x1
    3f14:      	uxtb	w16, w4
    3f18:      	cmp	w16, wzr
    3f1c:      	b.eq	0x3f5c <_stogir.atomic.validate+0x98>
    3f20:      	ldr	x5, [x0, #0x8]
    3f24:      	cmp	x2, x5
    3f28:      	b.ge	0x3fac <_stogir.atomic.validate+0xe8>
    3f2c:      	add	x5, x0, #0x78
    3f30:      	ldr	x5, [x5, #0x8]
    3f34:      	cmp	x2, x5
    3f38:      	b.ge	0x40ec <_stogir.atomic.validate+0x228>
    3f3c:      	ldr	x5, [x0, #0x78]
    3f40:      	add	x5, x3, x5
    3f44:      	ldr	w5, [x5]
    3f48:      	sxtw	x5, w5
    3f4c:      	cmp	x5, #0x0
    3f50:      	cset	w5, ge
    3f54:      	ubfx	x5, x5, #0, #8
    3f58:      	b	0x40f0 <_stogir.atomic.validate+0x22c>
    3f5c:      	cmp	x2, #0x0
    3f60:      	b.ge	0x3fb4 <_stogir.atomic.validate+0xf0>
    3f64:      	add	x7, x0, #0x28
    3f68:      	add	x9, x0, #0x50
    3f6c:      	ldr	x7, [x7, #0x8]
    3f70:      	ldr	x9, [x9, #0x8]
    3f74:      	cmp	x7, x9
    3f78:      	b.ne	0x3fa4 <_stogir.atomic.validate+0xe0>
    3f7c:      	cmp	x5, x7
    3f80:      	b.gt	0x4174 <_stogir.atomic.validate+0x2b0>
    3f84:      	ldr	x5, [x0, #0x50]
    3f88:      	add	x5, x5, x6, lsl #2
    3f8c:      	ldr	w5, [x5]
    3f90:      	sxtw	x5, w5
    3f94:      	cmp	x5, #0x0
    3f98:      	cset	w5, gt
    3f9c:      	ubfx	x5, x5, #0, #8
    3fa0:      	b	0x4178 <_stogir.atomic.validate+0x2b4>
    3fa4:      	movz	x5, #0x0, lsl #48
    3fa8:      	b	0x3fb8 <_stogir.atomic.validate+0xf4>
    3fac:      	movz	x5, #0x0, lsl #48
    3fb0:      	b	0x3fb8 <_stogir.atomic.validate+0xf4>
    3fb4:      	movz	x5, #0x0, lsl #48
    3fb8:      	cmp	x5, #0x0
    3fbc:      	b.eq	0x3ff8 <_stogir.atomic.validate+0x134>
    3fc0:      	uxtb	w16, w4
    3fc4:      	cmp	w16, wzr
    3fc8:      	b.eq	0x3fe0 <_stogir.atomic.validate+0x11c>
    3fcc:      	ldr	x4, [x0]
    3fd0:      	add	x4, x4, x2, lsl #4
    3fd4:      	ldr	x19, [x4]
    3fd8:      	ldr	x4, [x4, #0x8]
    3fdc:      	b	0x3ff0 <_stogir.atomic.validate+0x12c>
    3fe0:      	ldr	x4, [x0, #0x28]
    3fe4:      	add	x4, x4, x6, lsl #4
    3fe8:      	ldr	x19, [x4]
    3fec:      	ldr	x4, [x4, #0x8]
    3ff0:      	mov	w5, #0x1                ; =1
    3ff4:      	b	0x4004 <_stogir.atomic.validate+0x140>
    3ff8:      	movz	w5, #0x0, lsl #16
    3ffc:      	movz	x19, #0x0, lsl #48
    4000:      	movz	x4, #0x0, lsl #48
    4004:      	ubfx	x5, x5, #0, #32
    4008:      	lsr	x16, x5, #0
    400c:      	cmp	x16, #0x1
    4010:      	b.eq	0x402c <_stogir.atomic.validate+0x168>
    4014:      	b.lo	0x401c <_stogir.atomic.validate+0x158>
    4018:      	b	0x4030 <_stogir.atomic.validate+0x16c>
    401c:      	cmp	x16, #0x0
    4020:      	b.eq	0x4028 <_stogir.atomic.validate+0x164>
    4024:      	b	0x4030 <_stogir.atomic.validate+0x16c>
    4028:      	b	0x4034 <_stogir.atomic.validate+0x170>
    402c:      	b	0x408c <_stogir.atomic.validate+0x1c8>
    4030:      	b	0x4638 <_stogir.atomic.validate+0x774>
    4034:      	adrp	x16, 0x4000 <_stogir.atomic.validate+0x13c>
		0000000000004034:  ARM64_RELOC_PAGE21	l_stogir.371
    4038:      	ldr	x16, [x16]
		0000000000004038:  ARM64_RELOC_PAGEOFF12	l_stogir.371
    403c:      	orr	x20, x16, xzr
    4040:      	mov	x23, x8
    4044:      	mov	x0, #0x1                ; =1
    4048:      	mov	x22, #0x1a              ; =26
    404c:      	str	x0, [x23]
    4050:      	str	x20, [x23, #0x8]
    4054:      	str	x22, [x23, #0x10]
    4058:      	ldr	x19, [sp, #0xa0]
    405c:      	ldr	x20, [sp, #0xa8]
    4060:      	ldr	x21, [sp, #0xb0]
    4064:      	ldr	x22, [sp, #0xb8]
    4068:      	ldr	x23, [sp, #0xc0]
    406c:      	ldr	x24, [sp, #0xc8]
    4070:      	ldr	x25, [sp, #0xd0]
    4074:      	ldr	x26, [sp, #0xd8]
    4078:      	ldr	x27, [sp, #0xe0]
    407c:      	ldr	x29, [sp, #0x10]
    4080:      	ldr	x30, [sp, #0x18]
    4084:      	add	sp, sp, #0xf0
    4088:      	ret
    408c:      	uxtb	w5, w19
    4090:      	add	x16, sp, #0x20
    4094:      	str	x19, [x16]
    4098:      	orr	x21, x5, xzr
    409c:      	add	x16, sp, #0x20
    40a0:      	str	x4, [x16, #0x8]
    40a4:      	cmp	x2, #0x0
    40a8:      	b.le	0x40fc <_stogir.atomic.validate+0x238>
    40ac:      	cmp	x21, #0x7e
    40b0:      	b.lt	0x40fc <_stogir.atomic.validate+0x238>
    40b4:      	cmp	x21, #0x82
    40b8:      	b.gt	0x40fc <_stogir.atomic.validate+0x238>
    40bc:      	ldr	x2, [x0, #0x78]
    40c0:      	add	x2, x3, x2
    40c4:      	ldr	w2, [x2]
    40c8:      	cmp	x21, #0x83
    40cc:      	b.ge	0x4568 <_stogir.atomic.validate+0x6a4>
    40d0:      	adrp	x16, 0x4000 <_stogir.atomic.validate+0x13c>
		00000000000040d0:  ARM64_RELOC_PAGE21	l_stogir.372
    40d4:      	ldr	x16, [x16]
		00000000000040d4:  ARM64_RELOC_PAGEOFF12	l_stogir.372
    40d8:      	orr	x3, x16, xzr
    40dc:      	add	x3, x21, x3
    40e0:      	ldrsb	w3, [x3]
    40e4:      	sxtb	w3, w3
    40e8:      	b	0x456c <_stogir.atomic.validate+0x6a8>
    40ec:      	movz	x5, #0x0, lsl #48
    40f0:      	b	0x3fb0 <_stogir.atomic.validate+0xec>
    40f4:      	mov	x0, #0x1                ; =1
    40f8:      	b	0x404c <_stogir.atomic.validate+0x188>
    40fc:      	adrp	x16, 0x4000 <_stogir.atomic.validate+0x13c>
		00000000000040fc:  ARM64_RELOC_PAGE21	l_stogir.373
    4100:      	ldr	x16, [x16]
		0000000000004100:  ARM64_RELOC_PAGEOFF12	l_stogir.373
    4104:      	orr	x20, x16, xzr
    4108:      	mov	x22, #0x20              ; =32
    410c:      	add	x16, sp, #0x20
    4110:      	ldr	w2, [x16, #0x4]
    4114:      	mov	x23, x8
    4118:      	add	x8, sp, #0x30
    411c:      	mov	x24, x0
    4120:      	mov	w25, w1
    4124:      	mov	w1, w2
    4128:      	bl	0x4128 <_stogir.atomic.validate+0x264>
		0000000000004128:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    412c:      	add	x16, sp, #0x30
    4130:      	ldr	w0, [x16]
    4134:      	lsr	x16, x0, #0
    4138:      	cmp	x16, #0x1
    413c:      	b.eq	0x4158 <_stogir.atomic.validate+0x294>
    4140:      	b.lo	0x4148 <_stogir.atomic.validate+0x284>
    4144:      	b	0x415c <_stogir.atomic.validate+0x298>
    4148:      	cmp	x16, #0x0
    414c:      	b.eq	0x4154 <_stogir.atomic.validate+0x290>
    4150:      	b	0x415c <_stogir.atomic.validate+0x298>
    4154:      	b	0x4160 <_stogir.atomic.validate+0x29c>
    4158:      	b	0x4224 <_stogir.atomic.validate+0x360>
    415c:      	b	0x4640 <_stogir.atomic.validate+0x77c>
    4160:      	adrp	x16, 0x4000 <_stogir.atomic.validate+0x13c>
		0000000000004160:  ARM64_RELOC_PAGE21	l_stogir.374
    4164:      	ldr	x16, [x16]
		0000000000004164:  ARM64_RELOC_PAGEOFF12	l_stogir.374
    4168:      	orr	x20, x16, xzr
    416c:      	mov	x22, #0x16              ; =22
    4170:      	b	0x4198 <_stogir.atomic.validate+0x2d4>
    4174:      	movz	x5, #0x0, lsl #48
    4178:      	b	0x3fa8 <_stogir.atomic.validate+0xe4>
    417c:      	mov	x0, #0x1                ; =1
    4180:      	cmp	x0, #0x0
    4184:      	b.eq	0x4198 <_stogir.atomic.validate+0x2d4>
    4188:      	adrp	x16, 0x4000 <_stogir.atomic.validate+0x13c>
		0000000000004188:  ARM64_RELOC_PAGE21	l_stogir.375
    418c:      	ldr	x16, [x16]
		000000000000418c:  ARM64_RELOC_PAGEOFF12	l_stogir.375
    4190:      	orr	x20, x16, xzr
    4194:      	mov	x22, #0x16              ; =22
    4198:      	cmp	x21, #0x82
    419c:      	cset	w26, eq
    41a0:      	ubfx	x19, x19, #0, #32
    41a4:      	ubfx	x0, x19, #8, #8
    41a8:      	orr	x19, x0, xzr
    41ac:      	cmp	x19, #0x0
    41b0:      	cset	w27, eq
    41b4:      	uxtb	w16, w26
    41b8:      	cmp	w16, wzr
    41bc:      	b.eq	0x41dc <_stogir.atomic.validate+0x318>
    41c0:      	uxtb	w16, w27
    41c4:      	cmp	w16, wzr
    41c8:      	b.ne	0x41dc <_stogir.atomic.validate+0x318>
    41cc:      	adrp	x16, 0x4000 <_stogir.atomic.validate+0x13c>
		00000000000041cc:  ARM64_RELOC_PAGE21	l_stogir.376
    41d0:      	ldr	x16, [x16]
		00000000000041d0:  ARM64_RELOC_PAGEOFF12	l_stogir.376
    41d4:      	orr	x20, x16, xzr
    41d8:      	mov	x22, #0x19              ; =25
    41dc:      	uxtb	w16, w26
    41e0:      	cmp	w16, wzr
    41e4:      	b.eq	0x41f0 <_stogir.atomic.validate+0x32c>
    41e8:      	movz	x0, #0x0, lsl #48
    41ec:      	b	0x41f4 <_stogir.atomic.validate+0x330>
    41f0:      	mov	x0, #0x1                ; =1
    41f4:      	cmp	x0, #0x0
    41f8:      	b.eq	0x4264 <_stogir.atomic.validate+0x3a0>
    41fc:      	add	x16, sp, #0x20
    4200:      	ldr	w0, [x16, #0x8]
    4204:      	mov	w1, w0
    4208:      	mov	x0, x24
    420c:      	mov	x2, #0x6                ; =6
    4210:      	bl	0x4210 <_stogir.atomic.validate+0x34c>
		0000000000004210:  ARM64_RELOC_BRANCH26	_stogir.atomic.ordinary?
    4214:      	cmp	x0, #0x0
    4218:      	b.eq	0x433c <_stogir.atomic.validate+0x478>
    421c:      	movz	x0, #0x0, lsl #48
    4220:      	b	0x4340 <_stogir.atomic.validate+0x47c>
    4224:      	add	x16, sp, #0x30
    4228:      	ldr	x0, [x16, #0x8]
    422c:      	add	x16, sp, #0x20
    4230:      	ldr	w1, [x16, #0x4]
    4234:      	sxtw	x1, w1
    4238:      	cmp	x1, #0x0
    423c:      	b.gt	0x43dc <_stogir.atomic.validate+0x518>
    4240:      	mov	x0, #0x1                ; =1
    4244:      	b	0x4180 <_stogir.atomic.validate+0x2bc>
    4248:      	movz	x0, #0x0, lsl #48
    424c:      	cmp	x0, #0x0
    4250:      	b.eq	0x4264 <_stogir.atomic.validate+0x3a0>
    4254:      	adrp	x16, 0x4000 <_stogir.atomic.validate+0x13c>
		0000000000004254:  ARM64_RELOC_PAGE21	l_stogir.377
    4258:      	ldr	x16, [x16]
		0000000000004258:  ARM64_RELOC_PAGEOFF12	l_stogir.377
    425c:      	orr	x20, x16, xzr
    4260:      	mov	x22, #0x22              ; =34
    4264:      	cmp	x21, #0x80
    4268:      	cset	w27, eq
    426c:      	uxtb	w16, w27
    4270:      	cmp	w16, wzr
    4274:      	b.eq	0x4280 <_stogir.atomic.validate+0x3bc>
    4278:      	mov	x0, #0x1                ; =1
    427c:      	b	0x428c <_stogir.atomic.validate+0x3c8>
    4280:      	cmp	x21, #0x81
    4284:      	cset	w0, eq
    4288:      	ubfx	x0, x0, #0, #8
    428c:      	cmp	x0, #0x0
    4290:      	b.eq	0x4308 <_stogir.atomic.validate+0x444>
    4294:      	add	x16, sp, #0x90
    4298:      	str	x16, [sp]
    429c:      	mov	x0, x24
    42a0:      	mov	w1, w25
    42a4:      	mov	x2, #0x4                ; =4
    42a8:      	bl	0x42a8 <_stogir.atomic.validate+0x3e4>
		00000000000042a8:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    42ac:      	ldr	x16, [sp]
    42b0:      	str	x0, [x16]
    42b4:      	str	x1, [x16, #0x8]
    42b8:      	add	x16, sp, #0x90
    42bc:      	ldr	x0, [x16]
    42c0:      	add	x16, sp, #0x90
    42c4:      	ldr	x1, [x16, #0x8]
    42c8:      	ubfx	x0, x0, #0, #32
    42cc:      	lsr	x16, x0, #0
    42d0:      	cmp	x16, #0x1
    42d4:      	b.eq	0x42f0 <_stogir.atomic.validate+0x42c>
    42d8:      	b.lo	0x42e0 <_stogir.atomic.validate+0x41c>
    42dc:      	b	0x42f4 <_stogir.atomic.validate+0x430>
    42e0:      	cmp	x16, #0x0
    42e4:      	b.eq	0x42ec <_stogir.atomic.validate+0x428>
    42e8:      	b	0x42f4 <_stogir.atomic.validate+0x430>
    42ec:      	b	0x42f8 <_stogir.atomic.validate+0x434>
    42f0:      	b	0x44b4 <_stogir.atomic.validate+0x5f0>
    42f4:      	b	0x4650 <_stogir.atomic.validate+0x78c>
    42f8:      	adrp	x16, 0x4000 <_stogir.atomic.validate+0x13c>
		00000000000042f8:  ARM64_RELOC_PAGE21	l_stogir.378
    42fc:      	ldr	x16, [x16]
		00000000000042fc:  ARM64_RELOC_PAGEOFF12	l_stogir.378
    4300:      	orr	x20, x16, xzr
    4304:      	mov	x22, #0x1d              ; =29
    4308:      	cmp	x22, #0x0
    430c:      	b.ne	0x40f4 <_stogir.atomic.validate+0x230>
    4310:      	uxtb	w16, w26
    4314:      	cmp	w16, wzr
    4318:      	b.eq	0x44a0 <_stogir.atomic.validate+0x5dc>
    431c:      	movz	x0, #0x0, lsl #48
    4320:      	b	0x432c <_stogir.atomic.validate+0x468>
    4324:      	mov	w0, #0x1                ; =1
    4328:      	sxtw	x0, w0
    432c:      	and	x20, x0, #0xffffffff
    4330:      	movz	x0, #0x0, lsl #48
    4334:      	movz	x22, #0x0, lsl #48
    4338:      	b	0x40f8 <_stogir.atomic.validate+0x234>
    433c:      	mov	x0, #0x1                ; =1
    4340:      	cmp	x0, #0x0
    4344:      	b.eq	0x4358 <_stogir.atomic.validate+0x494>
    4348:      	adrp	x16, 0x4000 <_stogir.atomic.validate+0x13c>
		0000000000004348:  ARM64_RELOC_PAGE21	l_stogir.379
    434c:      	ldr	x16, [x16]
		000000000000434c:  ARM64_RELOC_PAGEOFF12	l_stogir.379
    4350:      	orr	x20, x16, xzr
    4354:      	mov	x22, #0x1b              ; =27
    4358:      	cmp	x21, #0x7f
    435c:      	b.ne	0x4420 <_stogir.atomic.validate+0x55c>
    4360:      	uxtb	w16, w27
    4364:      	cmp	w16, wzr
    4368:      	b.ne	0x437c <_stogir.atomic.validate+0x4b8>
    436c:      	adrp	x16, 0x4000 <_stogir.atomic.validate+0x13c>
		000000000000436c:  ARM64_RELOC_PAGE21	l_stogir.380
    4370:      	ldr	x16, [x16]
		0000000000004370:  ARM64_RELOC_PAGEOFF12	l_stogir.380
    4374:      	orr	x20, x16, xzr
    4378:      	mov	x22, #0x19              ; =25
    437c:      	add	x16, sp, #0x20
    4380:      	ldr	w0, [x16, #0xc]
    4384:      	add	x8, sp, #0x60
    4388:      	mov	w1, w0
    438c:      	mov	x0, x24
    4390:      	bl	0x4390 <_stogir.atomic.validate+0x4cc>
		0000000000004390:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    4394:      	add	x16, sp, #0x60
    4398:      	ldr	w0, [x16]
    439c:      	lsr	x16, x0, #0
    43a0:      	cmp	x16, #0x1
    43a4:      	b.eq	0x43c0 <_stogir.atomic.validate+0x4fc>
    43a8:      	b.lo	0x43b0 <_stogir.atomic.validate+0x4ec>
    43ac:      	b	0x43c4 <_stogir.atomic.validate+0x500>
    43b0:      	cmp	x16, #0x0
    43b4:      	b.eq	0x43bc <_stogir.atomic.validate+0x4f8>
    43b8:      	b	0x43c4 <_stogir.atomic.validate+0x500>
    43bc:      	b	0x43c8 <_stogir.atomic.validate+0x504>
    43c0:      	b	0x440c <_stogir.atomic.validate+0x548>
    43c4:      	b	0x4658 <_stogir.atomic.validate+0x794>
    43c8:      	adrp	x16, 0x4000 <_stogir.atomic.validate+0x13c>
		00000000000043c8:  ARM64_RELOC_PAGE21	l_stogir.381
    43cc:      	ldr	x16, [x16]
		00000000000043cc:  ARM64_RELOC_PAGEOFF12	l_stogir.381
    43d0:      	orr	x20, x16, xzr
    43d4:      	mov	x22, #0x1a              ; =26
    43d8:      	b	0x4420 <_stogir.atomic.validate+0x55c>
    43dc:      	uxtb	w0, w0
    43e0:      	cmp	x0, #0x83
    43e4:      	cset	w1, lt
    43e8:      	uxtb	w16, w1
    43ec:      	cmp	w16, wzr
    43f0:      	b.eq	0x4528 <_stogir.atomic.validate+0x664>
    43f4:      	adrp	x16, 0x4000 <_stogir.atomic.validate+0x13c>
		00000000000043f4:  ARM64_RELOC_PAGE21	l_stogir.382
    43f8:      	ldr	x16, [x16]
		00000000000043f8:  ARM64_RELOC_PAGEOFF12	l_stogir.382
    43fc:      	orr	x2, x16, xzr
    4400:      	add	x2, x0, x2
    4404:      	ldrb	w2, [x2]
    4408:      	b	0x452c <_stogir.atomic.validate+0x668>
    440c:      	add	x16, sp, #0x60
    4410:      	ldr	x0, [x16, #0x8]
    4414:      	ubfx	x0, x0, #0, #32
    4418:      	ubfx	x0, x0, #8, #8
    441c:      	orr	x19, x0, xzr
    4420:      	cmp	x19, #0x2
    4424:      	b.ge	0x446c <_stogir.atomic.validate+0x5a8>
    4428:      	mov	x0, #0x1                ; =1
    442c:      	b	0x4478 <_stogir.atomic.validate+0x5b4>
    4430:      	mov	x0, #0x1                ; =1
    4434:      	b	0x424c <_stogir.atomic.validate+0x388>
    4438:      	mov	x0, #0x1                ; =1
    443c:      	cmp	x0, #0x0
    4440:      	b.eq	0x4248 <_stogir.atomic.validate+0x384>
    4444:      	orr	w0, w19, wzr
    4448:      	add	x16, sp, #0x20
    444c:      	ldr	w1, [x16, #0xc]
    4450:      	mov	w2, w0
    4454:      	mov	x0, x24
    4458:      	bl	0x4458 <_stogir.atomic.validate+0x594>
		0000000000004458:  ARM64_RELOC_BRANCH26	_stogir.atomic.ordinary?
    445c:      	cmp	x0, #0x0
    4460:      	b.eq	0x4430 <_stogir.atomic.validate+0x56c>
    4464:      	movz	x0, #0x0, lsl #48
    4468:      	b	0x4434 <_stogir.atomic.validate+0x570>
    446c:      	cmp	x19, #0x5
    4470:      	cset	w0, gt
    4474:      	ubfx	x0, x0, #0, #8
    4478:      	cmp	x0, #0x0
    447c:      	b.eq	0x4490 <_stogir.atomic.validate+0x5cc>
    4480:      	adrp	x16, 0x4000 <_stogir.atomic.validate+0x13c>
		0000000000004480:  ARM64_RELOC_PAGE21	l_stogir.383
    4484:      	ldr	x16, [x16]
		0000000000004484:  ARM64_RELOC_PAGEOFF12	l_stogir.383
    4488:      	orr	x20, x16, xzr
    448c:      	mov	x22, #0x25              ; =37
    4490:      	cmp	x21, #0x7e
    4494:      	b.ne	0x4438 <_stogir.atomic.validate+0x574>
    4498:      	movz	x0, #0x0, lsl #48
    449c:      	b	0x443c <_stogir.atomic.validate+0x578>
    44a0:      	sxtw	x19, w19
    44a4:      	cmp	x19, #0x0
    44a8:      	b.ne	0x4590 <_stogir.atomic.validate+0x6cc>
    44ac:      	movz	w0, #0x0, lsl #16
    44b0:      	b	0x4328 <_stogir.atomic.validate+0x464>
    44b4:      	uxtb	w16, w27
    44b8:      	cmp	w16, wzr
    44bc:      	b.eq	0x44d4 <_stogir.atomic.validate+0x610>
    44c0:      	sxtw	x1, w1
    44c4:      	cmp	x1, #0x0
    44c8:      	b.ge	0x4610 <_stogir.atomic.validate+0x74c>
    44cc:      	mov	x0, #0x1                ; =1
    44d0:      	b	0x461c <_stogir.atomic.validate+0x758>
    44d4:      	mov	x0, x24
    44d8:      	mov	w2, w19
    44dc:      	bl	0x44dc <_stogir.atomic.validate+0x618>
		00000000000044dc:  ARM64_RELOC_BRANCH26	_stogir.atomic.ordinary?
    44e0:      	cmp	x0, #0x0
    44e4:      	b.ne	0x44f8 <_stogir.atomic.validate+0x634>
    44e8:      	adrp	x16, 0x4000 <_stogir.atomic.validate+0x13c>
		00000000000044e8:  ARM64_RELOC_PAGE21	l_stogir.384
    44ec:      	ldr	x16, [x16]
		00000000000044ec:  ARM64_RELOC_PAGEOFF12	l_stogir.384
    44f0:      	orr	x20, x16, xzr
    44f4:      	mov	x22, #0x24              ; =36
    44f8:      	b	0x4308 <_stogir.atomic.validate+0x444>
    44fc:      	movz	w0, #0x0, lsl #16
    4500:      	uxtb	w16, w0
    4504:      	and	w0, w16, #0x4
    4508:      	uxtb	w0, w0
    450c:      	ubfx	x0, x0, #0, #8
    4510:      	cmp	x0, #0x0
    4514:      	cset	w0, eq
    4518:      	uxtb	w16, w0
    451c:      	cmp	w16, wzr
    4520:      	cset	x0, eq
    4524:      	b	0x4180 <_stogir.atomic.validate+0x2bc>
    4528:      	movz	w2, #0x0, lsl #16
    452c:      	uxtb	w16, w2
    4530:      	and	w2, w16, #0x1
    4534:      	uxtb	w2, w2
    4538:      	ubfx	x2, x2, #0, #8
    453c:      	cmp	x2, #0x0
    4540:      	b.eq	0x417c <_stogir.atomic.validate+0x2b8>
    4544:      	uxtb	w16, w1
    4548:      	cmp	w16, wzr
    454c:      	b.eq	0x44fc <_stogir.atomic.validate+0x638>
    4550:      	adrp	x16, 0x4000 <_stogir.atomic.validate+0x13c>
		0000000000004550:  ARM64_RELOC_PAGE21	l_stogir.382
    4554:      	ldr	x16, [x16]
		0000000000004554:  ARM64_RELOC_PAGEOFF12	l_stogir.382
    4558:      	orr	x1, x16, xzr
    455c:      	add	x0, x0, x1
    4560:      	ldrb	w0, [x0]
    4564:      	b	0x4500 <_stogir.atomic.validate+0x63c>
    4568:      	mov	w3, #-0x2               ; =-2
    456c:      	sxtw	x2, w2
    4570:      	sxtw	x3, w3
    4574:      	cmp	x2, x3
    4578:      	b.ne	0x40fc <_stogir.atomic.validate+0x238>
    457c:      	adrp	x16, 0x4000 <_stogir.atomic.validate+0x13c>
		000000000000457c:  ARM64_RELOC_PAGE21	l_stogir.385
    4580:      	ldr	x16, [x16]
		0000000000004580:  ARM64_RELOC_PAGEOFF12	l_stogir.385
    4584:      	orr	x20, x16, xzr
    4588:      	movz	x22, #0x0, lsl #48
    458c:      	b	0x410c <_stogir.atomic.validate+0x248>
    4590:      	cmp	x19, #0x1
    4594:      	b.eq	0x4324 <_stogir.atomic.validate+0x460>
    4598:      	cmp	x19, #0x2
    459c:      	b.eq	0x4324 <_stogir.atomic.validate+0x460>
    45a0:      	cmp	x19, #0x7
    45a4:      	b.eq	0x4324 <_stogir.atomic.validate+0x460>
    45a8:      	cmp	x19, #0x8
    45ac:      	b.eq	0x4324 <_stogir.atomic.validate+0x460>
    45b0:      	cmp	x19, #0x3
    45b4:      	b.eq	0x4648 <_stogir.atomic.validate+0x784>
    45b8:      	cmp	x19, #0x9
    45bc:      	b.eq	0x4648 <_stogir.atomic.validate+0x784>
    45c0:      	cmp	x19, #0x4
    45c4:      	b.eq	0x4660 <_stogir.atomic.validate+0x79c>
    45c8:      	cmp	x19, #0xa
    45cc:      	b.eq	0x4660 <_stogir.atomic.validate+0x79c>
    45d0:      	cmp	x19, #0xd
    45d4:      	b.eq	0x4660 <_stogir.atomic.validate+0x79c>
    45d8:      	cmp	x19, #0x5
    45dc:      	b.eq	0x4668 <_stogir.atomic.validate+0x7a4>
    45e0:      	cmp	x19, #0xb
    45e4:      	b.eq	0x4668 <_stogir.atomic.validate+0x7a4>
    45e8:      	cmp	x19, #0xc
    45ec:      	b.eq	0x4668 <_stogir.atomic.validate+0x7a4>
    45f0:      	cmp	x19, #0x6
    45f4:      	cset	w0, eq
    45f8:      	uxtb	w16, w0
    45fc:      	cmp	w16, wzr
    4600:      	mov	w16, #0x8               ; =8
    4604:      	movn	w17, #0x0, lsl #16
    4608:      	csel	w0, w16, w17, ne
    460c:      	b	0x466c <_stogir.atomic.validate+0x7a8>
    4610:      	cmp	x1, #0x9
    4614:      	cset	w0, gt
    4618:      	ubfx	x0, x0, #0, #8
    461c:      	cmp	x0, #0x0
    4620:      	b.eq	0x4634 <_stogir.atomic.validate+0x770>
    4624:      	adrp	x16, 0x4000 <_stogir.atomic.validate+0x13c>
		0000000000004624:  ARM64_RELOC_PAGE21	l_stogir.386
    4628:      	ldr	x16, [x16]
		0000000000004628:  ARM64_RELOC_PAGEOFF12	l_stogir.386
    462c:      	orr	x20, x16, xzr
    4630:      	mov	x22, #0x1c              ; =28
    4634:      	b	0x44f8 <_stogir.atomic.validate+0x634>
    4638:      	brk	#0
    463c:      	b	0x4638 <_stogir.atomic.validate+0x774>
    4640:      	brk	#0
    4644:      	b	0x4640 <_stogir.atomic.validate+0x77c>
    4648:      	mov	w0, #0x2                ; =2
    464c:      	b	0x4328 <_stogir.atomic.validate+0x464>
    4650:      	brk	#0
    4654:      	b	0x4650 <_stogir.atomic.validate+0x78c>
    4658:      	brk	#0
    465c:      	b	0x4658 <_stogir.atomic.validate+0x794>
    4660:      	mov	w0, #0x4                ; =4
    4664:      	b	0x464c <_stogir.atomic.validate+0x788>
    4668:      	mov	w0, #0x8                ; =8
    466c:      	b	0x4664 <_stogir.atomic.validate+0x7a0>

0000000000004670 <_stogir.terminal.validate>:
    4670:      	sub	sp, sp, #0x50
    4674:      	str	x29, [sp]
    4678:      	str	x30, [sp, #0x8]
    467c:      	mov	x29, sp
    4680:      	str	x19, [sp, #0x40]
    4684:      	sxtw	x1, w1
    4688:      	lsl	x2, x1, #2
    468c:      	cmp	x1, #0x0
    4690:      	cset	w3, gt
    4694:      	movz	x16, #0x0, lsl #48
    4698:      	sub	x4, x16, x1
    469c:      	sub	x5, x4, #0x1
    46a0:      	uxtb	w16, w3
    46a4:      	cmp	w16, wzr
    46a8:      	b.eq	0x46e8 <_stogir.terminal.validate+0x78>
    46ac:      	ldr	x4, [x0, #0x8]
    46b0:      	cmp	x1, x4
    46b4:      	b.ge	0x4738 <_stogir.terminal.validate+0xc8>
    46b8:      	add	x4, x0, #0x78
    46bc:      	ldr	x4, [x4, #0x8]
    46c0:      	cmp	x1, x4
    46c4:      	b.ge	0x482c <_stogir.terminal.validate+0x1bc>
    46c8:      	ldr	x4, [x0, #0x78]
    46cc:      	add	x4, x2, x4
    46d0:      	ldr	w4, [x4]
    46d4:      	sxtw	x4, w4
    46d8:      	cmp	x4, #0x0
    46dc:      	cset	w4, ge
    46e0:      	ubfx	x4, x4, #0, #8
    46e4:      	b	0x4830 <_stogir.terminal.validate+0x1c0>
    46e8:      	cmp	x1, #0x0
    46ec:      	b.ge	0x4740 <_stogir.terminal.validate+0xd0>
    46f0:      	add	x6, x0, #0x28
    46f4:      	add	x7, x0, #0x50
    46f8:      	ldr	x6, [x6, #0x8]
    46fc:      	ldr	x7, [x7, #0x8]
    4700:      	cmp	x6, x7
    4704:      	b.ne	0x4730 <_stogir.terminal.validate+0xc0>
    4708:      	cmp	x4, x6
    470c:      	b.gt	0x486c <_stogir.terminal.validate+0x1fc>
    4710:      	ldr	x4, [x0, #0x50]
    4714:      	add	x4, x4, x5, lsl #2
    4718:      	ldr	w4, [x4]
    471c:      	sxtw	x4, w4
    4720:      	cmp	x4, #0x0
    4724:      	cset	w4, gt
    4728:      	ubfx	x4, x4, #0, #8
    472c:      	b	0x4870 <_stogir.terminal.validate+0x200>
    4730:      	movz	x4, #0x0, lsl #48
    4734:      	b	0x4744 <_stogir.terminal.validate+0xd4>
    4738:      	movz	x4, #0x0, lsl #48
    473c:      	b	0x4744 <_stogir.terminal.validate+0xd4>
    4740:      	movz	x4, #0x0, lsl #48
    4744:      	cmp	x4, #0x0
    4748:      	b.eq	0x4784 <_stogir.terminal.validate+0x114>
    474c:      	uxtb	w16, w3
    4750:      	cmp	w16, wzr
    4754:      	b.eq	0x476c <_stogir.terminal.validate+0xfc>
    4758:      	ldr	x3, [x0]
    475c:      	add	x3, x3, x1, lsl #4
    4760:      	ldr	x4, [x3]
    4764:      	ldr	x3, [x3, #0x8]
    4768:      	b	0x477c <_stogir.terminal.validate+0x10c>
    476c:      	ldr	x3, [x0, #0x28]
    4770:      	add	x3, x3, x5, lsl #4
    4774:      	ldr	x4, [x3]
    4778:      	ldr	x3, [x3, #0x8]
    477c:      	mov	w5, #0x1                ; =1
    4780:      	b	0x4790 <_stogir.terminal.validate+0x120>
    4784:      	movz	w5, #0x0, lsl #16
    4788:      	movz	x4, #0x0, lsl #48
    478c:      	movz	x3, #0x0, lsl #48
    4790:      	ubfx	x5, x5, #0, #32
    4794:      	lsr	x16, x5, #0
    4798:      	cmp	x16, #0x1
    479c:      	b.eq	0x47b8 <_stogir.terminal.validate+0x148>
    47a0:      	b.lo	0x47a8 <_stogir.terminal.validate+0x138>
    47a4:      	b	0x47bc <_stogir.terminal.validate+0x14c>
    47a8:      	cmp	x16, #0x0
    47ac:      	b.eq	0x47b4 <_stogir.terminal.validate+0x144>
    47b0:      	b	0x47bc <_stogir.terminal.validate+0x14c>
    47b4:      	b	0x47c0 <_stogir.terminal.validate+0x150>
    47b8:      	b	0x47dc <_stogir.terminal.validate+0x16c>
    47bc:      	b	0x4934 <_stogir.terminal.validate+0x2c4>
    47c0:      	adrp	x16, 0x4000 <_stogir.atomic.validate+0x13c>
		00000000000047c0:  ARM64_RELOC_PAGE21	l_stogir.387
    47c4:      	ldr	x16, [x16]
		00000000000047c4:  ARM64_RELOC_PAGEOFF12	l_stogir.387
    47c8:      	orr	x0, x16, xzr
    47cc:      	mov	x19, x8
    47d0:      	mov	x1, #0x1                ; =1
    47d4:      	mov	x2, #0x21               ; =33
    47d8:      	b	0x480c <_stogir.terminal.validate+0x19c>
    47dc:      	add	x16, sp, #0x10
    47e0:      	str	x4, [x16]
    47e4:      	add	x16, sp, #0x10
    47e8:      	str	x3, [x16, #0x8]
    47ec:      	cmp	x1, #0x0
    47f0:      	b.gt	0x4834 <_stogir.terminal.validate+0x1c4>
    47f4:      	mov	x19, x8
    47f8:      	adrp	x16, 0x4000 <_stogir.atomic.validate+0x13c>
		00000000000047f8:  ARM64_RELOC_PAGE21	l_stogir.388
    47fc:      	ldr	x16, [x16]
		00000000000047fc:  ARM64_RELOC_PAGEOFF12	l_stogir.388
    4800:      	orr	x0, x16, xzr
    4804:      	mov	x1, #0x1                ; =1
    4808:      	mov	x2, #0x1b               ; =27
    480c:      	str	x1, [x19]
    4810:      	str	x0, [x19, #0x8]
    4814:      	str	x2, [x19, #0x10]
    4818:      	ldr	x19, [sp, #0x40]
    481c:      	ldr	x29, [sp]
    4820:      	ldr	x30, [sp, #0x8]
    4824:      	add	sp, sp, #0x50
    4828:      	ret
    482c:      	movz	x4, #0x0, lsl #48
    4830:      	b	0x473c <_stogir.terminal.validate+0xcc>
    4834:      	uxtb	w4, w4
    4838:      	orr	x1, x4, xzr
    483c:      	cmp	x1, #0x60
    4840:      	cset	w3, eq
    4844:      	cmp	x1, #0x79
    4848:      	cset	w1, eq
    484c:      	uxtb	w16, w3
    4850:      	cmp	w16, wzr
    4854:      	b.ne	0x4874 <_stogir.terminal.validate+0x204>
    4858:      	uxtb	w16, w1
    485c:      	cmp	w16, wzr
    4860:      	b.ne	0x4874 <_stogir.terminal.validate+0x204>
    4864:      	mov	x19, x8
    4868:      	b	0x47f8 <_stogir.terminal.validate+0x188>
    486c:      	movz	x4, #0x0, lsl #48
    4870:      	b	0x4734 <_stogir.terminal.validate+0xc4>
    4874:      	add	x16, sp, #0x10
    4878:      	ldr	w5, [x16]
    487c:      	ubfx	x5, x5, #8, #8
    4880:      	cmp	x5, #0x0
    4884:      	b.ne	0x493c <_stogir.terminal.validate+0x2cc>
    4888:      	uxtb	w16, w3
    488c:      	cmp	w16, wzr
    4890:      	mov	w16, #0x1               ; =1
    4894:      	mov	w17, #0x3               ; =3
    4898:      	csel	w3, w16, w17, ne
    489c:      	sxtw	x3, w3
    48a0:      	ldr	x5, [x0, #0x78]
    48a4:      	add	x2, x2, x5
    48a8:      	ldr	w2, [x2]
    48ac:      	sxtw	x2, w2
    48b0:      	cmp	x2, x3
    48b4:      	b.ne	0x4944 <_stogir.terminal.validate+0x2d4>
    48b8:      	uxtb	w16, w1
    48bc:      	cmp	w16, wzr
    48c0:      	b.eq	0x4914 <_stogir.terminal.validate+0x2a4>
    48c4:      	add	x16, sp, #0x10
    48c8:      	ldr	w2, [x16, #0x8]
    48cc:      	sxtw	x2, w2
    48d0:      	cmp	x2, #0x0
    48d4:      	b.eq	0x4914 <_stogir.terminal.validate+0x2a4>
    48d8:      	mov	x19, x8
    48dc:      	b	0x47f8 <_stogir.terminal.validate+0x188>
    48e0:      	movz	w1, #0x0, lsl #16
    48e4:      	mov	w3, w1
    48e8:      	mov	w1, w4
    48ec:      	mov	x19, x8
    48f0:      	add	x8, sp, #0x20
    48f4:      	bl	0x48f4 <_stogir.terminal.validate+0x284>
		00000000000048f4:  ARM64_RELOC_BRANCH26	_stogir.terminal.inputs
    48f8:      	add	x16, sp, #0x20
    48fc:      	ldr	x1, [x16]
    4900:      	add	x16, sp, #0x20
    4904:      	ldr	x0, [x16, #0x8]
    4908:      	add	x16, sp, #0x20
    490c:      	ldr	x2, [x16, #0x10]
    4910:      	b	0x480c <_stogir.terminal.validate+0x19c>
    4914:      	add	x16, sp, #0x10
    4918:      	ldr	w2, [x16, #0x4]
    491c:      	uxtb	w16, w1
    4920:      	cmp	w16, wzr
    4924:      	b.eq	0x48e0 <_stogir.terminal.validate+0x270>
    4928:      	add	x16, sp, #0x10
    492c:      	ldr	w1, [x16, #0xc]
    4930:      	b	0x48e4 <_stogir.terminal.validate+0x274>
    4934:      	brk	#0
    4938:      	b	0x4934 <_stogir.terminal.validate+0x2c4>
    493c:      	mov	x19, x8
    4940:      	b	0x47f8 <_stogir.terminal.validate+0x188>
    4944:      	mov	x19, x8
    4948:      	b	0x47f8 <_stogir.terminal.validate+0x188>

000000000000494c <_stogir.switch.validate>:
    494c:      	sub	sp, sp, #0x70
    4950:      	str	x29, [sp]
    4954:      	str	x30, [sp, #0x8]
    4958:      	mov	x29, sp
    495c:      	str	x19, [sp, #0x60]
    4960:      	sxtw	x1, w1
    4964:      	lsl	x2, x1, #2
    4968:      	cmp	x1, #0x0
    496c:      	cset	w3, gt
    4970:      	movz	x16, #0x0, lsl #48
    4974:      	sub	x4, x16, x1
    4978:      	sub	x5, x4, #0x1
    497c:      	uxtb	w16, w3
    4980:      	cmp	w16, wzr
    4984:      	b.eq	0x49c4 <_stogir.switch.validate+0x78>
    4988:      	ldr	x4, [x0, #0x8]
    498c:      	cmp	x1, x4
    4990:      	b.ge	0x4a14 <_stogir.switch.validate+0xc8>
    4994:      	add	x4, x0, #0x78
    4998:      	ldr	x4, [x4, #0x8]
    499c:      	cmp	x1, x4
    49a0:      	b.ge	0x4b08 <_stogir.switch.validate+0x1bc>
    49a4:      	ldr	x4, [x0, #0x78]
    49a8:      	add	x4, x2, x4
    49ac:      	ldr	w4, [x4]
    49b0:      	sxtw	x4, w4
    49b4:      	cmp	x4, #0x0
    49b8:      	cset	w4, ge
    49bc:      	ubfx	x4, x4, #0, #8
    49c0:      	b	0x4b0c <_stogir.switch.validate+0x1c0>
    49c4:      	cmp	x1, #0x0
    49c8:      	b.ge	0x4a1c <_stogir.switch.validate+0xd0>
    49cc:      	add	x6, x0, #0x28
    49d0:      	add	x7, x0, #0x50
    49d4:      	ldr	x6, [x6, #0x8]
    49d8:      	ldr	x7, [x7, #0x8]
    49dc:      	cmp	x6, x7
    49e0:      	b.ne	0x4a0c <_stogir.switch.validate+0xc0>
    49e4:      	cmp	x4, x6
    49e8:      	b.gt	0x4b44 <_stogir.switch.validate+0x1f8>
    49ec:      	ldr	x4, [x0, #0x50]
    49f0:      	add	x4, x4, x5, lsl #2
    49f4:      	ldr	w4, [x4]
    49f8:      	sxtw	x4, w4
    49fc:      	cmp	x4, #0x0
    4a00:      	cset	w4, gt
    4a04:      	ubfx	x4, x4, #0, #8
    4a08:      	b	0x4b48 <_stogir.switch.validate+0x1fc>
    4a0c:      	movz	x4, #0x0, lsl #48
    4a10:      	b	0x4a20 <_stogir.switch.validate+0xd4>
    4a14:      	movz	x4, #0x0, lsl #48
    4a18:      	b	0x4a20 <_stogir.switch.validate+0xd4>
    4a1c:      	movz	x4, #0x0, lsl #48
    4a20:      	cmp	x4, #0x0
    4a24:      	b.eq	0x4a60 <_stogir.switch.validate+0x114>
    4a28:      	uxtb	w16, w3
    4a2c:      	cmp	w16, wzr
    4a30:      	b.eq	0x4a48 <_stogir.switch.validate+0xfc>
    4a34:      	ldr	x3, [x0]
    4a38:      	add	x3, x3, x1, lsl #4
    4a3c:      	ldr	x4, [x3]
    4a40:      	ldr	x3, [x3, #0x8]
    4a44:      	b	0x4a58 <_stogir.switch.validate+0x10c>
    4a48:      	ldr	x3, [x0, #0x28]
    4a4c:      	add	x3, x3, x5, lsl #4
    4a50:      	ldr	x4, [x3]
    4a54:      	ldr	x3, [x3, #0x8]
    4a58:      	mov	w5, #0x1                ; =1
    4a5c:      	b	0x4a6c <_stogir.switch.validate+0x120>
    4a60:      	movz	w5, #0x0, lsl #16
    4a64:      	movz	x4, #0x0, lsl #48
    4a68:      	movz	x3, #0x0, lsl #48
    4a6c:      	ubfx	x5, x5, #0, #32
    4a70:      	lsr	x16, x5, #0
    4a74:      	cmp	x16, #0x1
    4a78:      	b.eq	0x4a94 <_stogir.switch.validate+0x148>
    4a7c:      	b.lo	0x4a84 <_stogir.switch.validate+0x138>
    4a80:      	b	0x4a98 <_stogir.switch.validate+0x14c>
    4a84:      	cmp	x16, #0x0
    4a88:      	b.eq	0x4a90 <_stogir.switch.validate+0x144>
    4a8c:      	b	0x4a98 <_stogir.switch.validate+0x14c>
    4a90:      	b	0x4a9c <_stogir.switch.validate+0x150>
    4a94:      	b	0x4ab8 <_stogir.switch.validate+0x16c>
    4a98:      	b	0x4c2c <_stogir.switch.validate+0x2e0>
    4a9c:      	adrp	x16, 0x4000 <_stogir.atomic.validate+0x13c>
		0000000000004a9c:  ARM64_RELOC_PAGE21	l_stogir.389
    4aa0:      	ldr	x16, [x16]
		0000000000004aa0:  ARM64_RELOC_PAGEOFF12	l_stogir.389
    4aa4:      	orr	x0, x16, xzr
    4aa8:      	mov	x19, x8
    4aac:      	mov	x1, #0x1                ; =1
    4ab0:      	mov	x2, #0x1a               ; =26
    4ab4:      	b	0x4ae8 <_stogir.switch.validate+0x19c>
    4ab8:      	add	x16, sp, #0x10
    4abc:      	str	x4, [x16]
    4ac0:      	add	x16, sp, #0x10
    4ac4:      	str	x3, [x16, #0x8]
    4ac8:      	cmp	x1, #0x0
    4acc:      	b.gt	0x4b10 <_stogir.switch.validate+0x1c4>
    4ad0:      	mov	x19, x8
    4ad4:      	adrp	x16, 0x4000 <_stogir.atomic.validate+0x13c>
		0000000000004ad4:  ARM64_RELOC_PAGE21	l_stogir.390
    4ad8:      	ldr	x16, [x16]
		0000000000004ad8:  ARM64_RELOC_PAGEOFF12	l_stogir.390
    4adc:      	orr	x0, x16, xzr
    4ae0:      	mov	x1, #0x1                ; =1
    4ae4:      	mov	x2, #0x20               ; =32
    4ae8:      	str	x1, [x19]
    4aec:      	str	x0, [x19, #0x8]
    4af0:      	str	x2, [x19, #0x10]
    4af4:      	ldr	x19, [sp, #0x60]
    4af8:      	ldr	x29, [sp]
    4afc:      	ldr	x30, [sp, #0x8]
    4b00:      	add	sp, sp, #0x70
    4b04:      	ret
    4b08:      	movz	x4, #0x0, lsl #48
    4b0c:      	b	0x4a18 <_stogir.switch.validate+0xcc>
    4b10:      	uxtb	w4, w4
    4b14:      	orr	x1, x4, xzr
    4b18:      	cmp	x1, #0x75
    4b1c:      	cset	w3, eq
    4b20:      	uxtb	w16, w3
    4b24:      	cmp	w16, wzr
    4b28:      	b.ne	0x4b4c <_stogir.switch.validate+0x200>
    4b2c:      	cmp	x1, #0x6d
    4b30:      	b.lt	0x4c34 <_stogir.switch.validate+0x2e8>
    4b34:      	cmp	x1, #0x6f
    4b38:      	b.le	0x4b4c <_stogir.switch.validate+0x200>
    4b3c:      	mov	x19, x8
    4b40:      	b	0x4ad4 <_stogir.switch.validate+0x188>
    4b44:      	movz	x4, #0x0, lsl #48
    4b48:      	b	0x4a10 <_stogir.switch.validate+0xc4>
    4b4c:      	add	x16, sp, #0x10
    4b50:      	ldr	w5, [x16]
    4b54:      	ubfx	x5, x5, #8, #8
    4b58:      	cmp	x5, #0x0
    4b5c:      	b.ne	0x4c3c <_stogir.switch.validate+0x2f0>
    4b60:      	ldr	x5, [x0, #0x78]
    4b64:      	add	x2, x2, x5
    4b68:      	ldr	w2, [x2]
    4b6c:      	cmp	x1, #0x6d
    4b70:      	b.eq	0x4bd4 <_stogir.switch.validate+0x288>
    4b74:      	cmp	x1, #0x6e
    4b78:      	b.eq	0x4bd4 <_stogir.switch.validate+0x288>
    4b7c:      	mov	w1, #0x2                ; =2
    4b80:      	b	0x4bd8 <_stogir.switch.validate+0x28c>
    4b84:      	add	x16, sp, #0x10
    4b88:      	ldr	w1, [x16, #0x4]
    4b8c:      	add	x16, sp, #0x10
    4b90:      	ldr	w2, [x16, #0x8]
    4b94:      	add	x16, sp, #0x10
    4b98:      	ldr	w3, [x16, #0xc]
    4b9c:      	add	x8, sp, #0x40
    4ba0:      	fmov	s31, w1
    4ba4:      	mov	w1, w4
    4ba8:      	mov	w4, w3
    4bac:      	mov	w3, w2
    4bb0:      	fmov	w2, s31
    4bb4:      	bl	0x4bb4 <_stogir.switch.validate+0x268>
		0000000000004bb4:  ARM64_RELOC_BRANCH26	_stogir.switch.case-inputs
    4bb8:      	add	x16, sp, #0x40
    4bbc:      	ldr	x1, [x16]
    4bc0:      	add	x16, sp, #0x40
    4bc4:      	ldr	x0, [x16, #0x8]
    4bc8:      	add	x16, sp, #0x40
    4bcc:      	ldr	x2, [x16, #0x10]
    4bd0:      	b	0x4ae8 <_stogir.switch.validate+0x19c>
    4bd4:      	mov	w1, #0x3                ; =3
    4bd8:      	sxtw	x2, w2
    4bdc:      	sxtw	x1, w1
    4be0:      	cmp	x2, x1
    4be4:      	b.ne	0x4c44 <_stogir.switch.validate+0x2f8>
    4be8:      	uxtb	w16, w3
    4bec:      	cmp	w16, wzr
    4bf0:      	b.eq	0x4c4c <_stogir.switch.validate+0x300>
    4bf4:      	add	x16, sp, #0x10
    4bf8:      	ldr	w1, [x16, #0x4]
    4bfc:      	add	x16, sp, #0x10
    4c00:      	ldr	w2, [x16, #0x8]
    4c04:      	mov	x19, x8
    4c08:      	add	x8, sp, #0x20
    4c0c:      	bl	0x4c0c <_stogir.switch.validate+0x2c0>
		0000000000004c0c:  ARM64_RELOC_BRANCH26	_stogir.switch.switch-inputs
    4c10:      	add	x16, sp, #0x20
    4c14:      	ldr	x1, [x16]
    4c18:      	add	x16, sp, #0x20
    4c1c:      	ldr	x0, [x16, #0x8]
    4c20:      	add	x16, sp, #0x20
    4c24:      	ldr	x2, [x16, #0x10]
    4c28:      	b	0x4bd0 <_stogir.switch.validate+0x284>
    4c2c:      	brk	#0
    4c30:      	b	0x4c2c <_stogir.switch.validate+0x2e0>
    4c34:      	mov	x19, x8
    4c38:      	b	0x4ad4 <_stogir.switch.validate+0x188>
    4c3c:      	mov	x19, x8
    4c40:      	b	0x4ad4 <_stogir.switch.validate+0x188>
    4c44:      	mov	x19, x8
    4c48:      	b	0x4ad4 <_stogir.switch.validate+0x188>
    4c4c:      	mov	x19, x8
    4c50:      	b	0x4b84 <_stogir.switch.validate+0x238>

0000000000004c54 <_stogir.stack.validate>:
    4c54:      	sub	sp, sp, #0x90
    4c58:      	str	x29, [sp]
    4c5c:      	str	x30, [sp, #0x8]
    4c60:      	mov	x29, sp
    4c64:      	str	x19, [sp, #0x60]
    4c68:      	str	x20, [sp, #0x68]
    4c6c:      	str	x21, [sp, #0x70]
    4c70:      	str	x22, [sp, #0x78]
    4c74:      	str	x23, [sp, #0x80]
    4c78:      	sxtw	x1, w1
    4c7c:      	lsl	x2, x1, #2
    4c80:      	cmp	x1, #0x0
    4c84:      	cset	w3, gt
    4c88:      	movz	x16, #0x0, lsl #48
    4c8c:      	sub	x4, x16, x1
    4c90:      	cmp	x1, #0x0
    4c94:      	cset	w5, lt
    4c98:      	sub	x6, x4, #0x1
    4c9c:      	lsl	x7, x6, #2
    4ca0:      	uxtb	w16, w3
    4ca4:      	cmp	w16, wzr
    4ca8:      	b.eq	0x4ce8 <_stogir.stack.validate+0x94>
    4cac:      	ldr	x9, [x0, #0x8]
    4cb0:      	cmp	x1, x9
    4cb4:      	b.ge	0x4d64 <_stogir.stack.validate+0x110>
    4cb8:      	add	x9, x0, #0x78
    4cbc:      	ldr	x9, [x9, #0x8]
    4cc0:      	cmp	x1, x9
    4cc4:      	b.ge	0x4eac <_stogir.stack.validate+0x258>
    4cc8:      	ldr	x9, [x0, #0x78]
    4ccc:      	add	x9, x2, x9
    4cd0:      	ldr	w9, [x9]
    4cd4:      	sxtw	x9, w9
    4cd8:      	cmp	x9, #0x0
    4cdc:      	cset	w9, ge
    4ce0:      	ubfx	x9, x9, #0, #8
    4ce4:      	b	0x4eb0 <_stogir.stack.validate+0x25c>
    4ce8:      	uxtb	w16, w5
    4cec:      	cmp	w16, wzr
    4cf0:      	b.eq	0x4d6c <_stogir.stack.validate+0x118>
    4cf4:      	add	x9, x0, #0x28
    4cf8:      	add	x10, x0, #0x50
    4cfc:      	ldr	x9, [x9, #0x8]
    4d00:      	ldr	x10, [x10, #0x8]
    4d04:      	cmp	x9, x10
    4d08:      	b.ne	0x4d34 <_stogir.stack.validate+0xe0>
    4d0c:      	cmp	x4, x9
    4d10:      	b.gt	0x4eb4 <_stogir.stack.validate+0x260>
    4d14:      	ldr	x9, [x0, #0x50]
    4d18:      	add	x9, x7, x9
    4d1c:      	ldr	w9, [x9]
    4d20:      	sxtw	x9, w9
    4d24:      	cmp	x9, #0x0
    4d28:      	cset	w9, gt
    4d2c:      	ubfx	x9, x9, #0, #8
    4d30:      	b	0x4eb8 <_stogir.stack.validate+0x264>
    4d34:      	movz	x9, #0x0, lsl #48
    4d38:      	b	0x4d70 <_stogir.stack.validate+0x11c>
    4d3c:      	uxtb	w16, w12
    4d40:      	cmp	w16, wzr
    4d44:      	b.eq	0x4ed8 <_stogir.stack.validate+0x284>
    4d48:      	mov	x22, x8
    4d4c:      	adrp	x16, 0x4000 <_stogir.atomic.validate+0x13c>
		0000000000004d4c:  ARM64_RELOC_PAGE21	l_stogir.391
    4d50:      	ldr	x16, [x16]
		0000000000004d50:  ARM64_RELOC_PAGEOFF12	l_stogir.391
    4d54:      	orr	x0, x16, xzr
    4d58:      	mov	x1, #0x1                ; =1
    4d5c:      	mov	x2, #0x19               ; =25
    4d60:      	b	0x4e0c <_stogir.stack.validate+0x1b8>
    4d64:      	movz	x9, #0x0, lsl #48
    4d68:      	b	0x4d70 <_stogir.stack.validate+0x11c>
    4d6c:      	movz	x9, #0x0, lsl #48
    4d70:      	lsl	x10, x1, #4
    4d74:      	lsl	x6, x6, #4
    4d78:      	cmp	x9, #0x0
    4d7c:      	b.eq	0x4db8 <_stogir.stack.validate+0x164>
    4d80:      	uxtb	w16, w3
    4d84:      	cmp	w16, wzr
    4d88:      	b.eq	0x4da0 <_stogir.stack.validate+0x14c>
    4d8c:      	ldr	x9, [x0]
    4d90:      	add	x9, x10, x9
    4d94:      	ldr	x11, [x9]
    4d98:      	ldr	x9, [x9, #0x8]
    4d9c:      	b	0x4db0 <_stogir.stack.validate+0x15c>
    4da0:      	ldr	x9, [x0, #0x28]
    4da4:      	add	x9, x6, x9
    4da8:      	ldr	x11, [x9]
    4dac:      	ldr	x9, [x9, #0x8]
    4db0:      	mov	w12, #0x1               ; =1
    4db4:      	b	0x4dc4 <_stogir.stack.validate+0x170>
    4db8:      	movz	w12, #0x0, lsl #16
    4dbc:      	movz	x11, #0x0, lsl #48
    4dc0:      	movz	x9, #0x0, lsl #48
    4dc4:      	ubfx	x12, x12, #0, #32
    4dc8:      	lsr	x16, x12, #0
    4dcc:      	cmp	x16, #0x1
    4dd0:      	b.eq	0x4dec <_stogir.stack.validate+0x198>
    4dd4:      	b.lo	0x4ddc <_stogir.stack.validate+0x188>
    4dd8:      	b	0x4df0 <_stogir.stack.validate+0x19c>
    4ddc:      	cmp	x16, #0x0
    4de0:      	b.eq	0x4de8 <_stogir.stack.validate+0x194>
    4de4:      	b	0x4df0 <_stogir.stack.validate+0x19c>
    4de8:      	b	0x4df4 <_stogir.stack.validate+0x1a0>
    4dec:      	b	0x4e3c <_stogir.stack.validate+0x1e8>
    4df0:      	b	0x5200 <_stogir.stack.validate+0x5ac>
    4df4:      	adrp	x16, 0x4000 <_stogir.atomic.validate+0x13c>
		0000000000004df4:  ARM64_RELOC_PAGE21	l_stogir.392
    4df8:      	ldr	x16, [x16]
		0000000000004df8:  ARM64_RELOC_PAGEOFF12	l_stogir.392
    4dfc:      	orr	x0, x16, xzr
    4e00:      	mov	x22, x8
    4e04:      	mov	x1, #0x1                ; =1
    4e08:      	mov	x2, #0x19               ; =25
    4e0c:      	str	x1, [x22]
    4e10:      	str	x0, [x22, #0x8]
    4e14:      	str	x2, [x22, #0x10]
    4e18:      	ldr	x19, [sp, #0x60]
    4e1c:      	ldr	x20, [sp, #0x68]
    4e20:      	ldr	x21, [sp, #0x70]
    4e24:      	ldr	x22, [sp, #0x78]
    4e28:      	ldr	x23, [sp, #0x80]
    4e2c:      	ldr	x29, [sp]
    4e30:      	ldr	x30, [sp, #0x8]
    4e34:      	add	sp, sp, #0x90
    4e38:      	ret
    4e3c:      	cmp	x1, #0x0
    4e40:      	cset	w12, le
    4e44:      	uxtb	w19, w11
    4e48:      	add	x16, sp, #0x10
    4e4c:      	str	x11, [x16]
    4e50:      	orr	x11, x19, xzr
    4e54:      	add	x16, sp, #0x10
    4e58:      	str	x9, [x16, #0x8]
    4e5c:      	cmp	x11, #0x42
    4e60:      	b.ne	0x4d3c <_stogir.stack.validate+0xe8>
    4e64:      	uxtb	w16, w3
    4e68:      	cmp	w16, wzr
    4e6c:      	b.eq	0x4f24 <_stogir.stack.validate+0x2d0>
    4e70:      	ldr	x4, [x0, #0x8]
    4e74:      	cmp	x1, x4
    4e78:      	b.ge	0x4f70 <_stogir.stack.validate+0x31c>
    4e7c:      	add	x4, x0, #0x78
    4e80:      	ldr	x4, [x4, #0x8]
    4e84:      	cmp	x1, x4
    4e88:      	b.ge	0x505c <_stogir.stack.validate+0x408>
    4e8c:      	ldr	x1, [x0, #0x78]
    4e90:      	add	x1, x2, x1
    4e94:      	ldr	w1, [x1]
    4e98:      	sxtw	x1, w1
    4e9c:      	cmp	x1, #0x0
    4ea0:      	cset	w1, ge
    4ea4:      	ubfx	x1, x1, #0, #8
    4ea8:      	b	0x5060 <_stogir.stack.validate+0x40c>
    4eac:      	movz	x9, #0x0, lsl #48
    4eb0:      	b	0x4d68 <_stogir.stack.validate+0x114>
    4eb4:      	movz	x9, #0x0, lsl #48
    4eb8:      	b	0x4d38 <_stogir.stack.validate+0xe4>
    4ebc:      	adrp	x16, 0x4000 <_stogir.atomic.validate+0x13c>
		0000000000004ebc:  ARM64_RELOC_PAGE21	l_stogir.393
    4ec0:      	ldr	x16, [x16]
		0000000000004ec0:  ARM64_RELOC_PAGEOFF12	l_stogir.393
    4ec4:      	orr	x0, x16, xzr
    4ec8:      	mov	x1, #0x1                ; =1
    4ecc:      	mov	x2, #0x1e               ; =30
    4ed0:      	mov	x22, x8
    4ed4:      	b	0x4d60 <_stogir.stack.validate+0x10c>
    4ed8:      	cmp	x11, #0x51
    4edc:      	cset	w1, eq
    4ee0:      	cmp	x11, #0x53
    4ee4:      	cset	w20, eq
    4ee8:      	cmp	x11, #0x54
    4eec:      	cset	w21, eq
    4ef0:      	uxtb	w16, w1
    4ef4:      	cmp	w16, wzr
    4ef8:      	b.ne	0x5064 <_stogir.stack.validate+0x410>
    4efc:      	cmp	x11, #0x52
    4f00:      	b.eq	0x5064 <_stogir.stack.validate+0x410>
    4f04:      	uxtb	w16, w20
    4f08:      	cmp	w16, wzr
    4f0c:      	b.ne	0x5064 <_stogir.stack.validate+0x410>
    4f10:      	uxtb	w16, w21
    4f14:      	cmp	w16, wzr
    4f18:      	b.ne	0x5064 <_stogir.stack.validate+0x410>
    4f1c:      	mov	x22, x8
    4f20:      	b	0x4d4c <_stogir.stack.validate+0xf8>
    4f24:      	uxtb	w16, w5
    4f28:      	cmp	w16, wzr
    4f2c:      	b.eq	0x4f78 <_stogir.stack.validate+0x324>
    4f30:      	add	x1, x0, #0x28
    4f34:      	add	x5, x0, #0x50
    4f38:      	ldr	x1, [x1, #0x8]
    4f3c:      	ldr	x5, [x5, #0x8]
    4f40:      	cmp	x1, x5
    4f44:      	b.ne	0x5054 <_stogir.stack.validate+0x400>
    4f48:      	cmp	x4, x1
    4f4c:      	b.gt	0x51a4 <_stogir.stack.validate+0x550>
    4f50:      	ldr	x1, [x0, #0x50]
    4f54:      	add	x1, x7, x1
    4f58:      	ldr	w1, [x1]
    4f5c:      	sxtw	x1, w1
    4f60:      	cmp	x1, #0x0
    4f64:      	cset	w1, gt
    4f68:      	ubfx	x1, x1, #0, #8
    4f6c:      	b	0x51a8 <_stogir.stack.validate+0x554>
    4f70:      	movz	x1, #0x0, lsl #48
    4f74:      	b	0x4f7c <_stogir.stack.validate+0x328>
    4f78:      	movz	x1, #0x0, lsl #48
    4f7c:      	cmp	x1, #0x0
    4f80:      	b.eq	0x4fb4 <_stogir.stack.validate+0x360>
    4f84:      	uxtb	w16, w3
    4f88:      	cmp	w16, wzr
    4f8c:      	b.eq	0x4fa0 <_stogir.stack.validate+0x34c>
    4f90:      	ldr	x1, [x0]
    4f94:      	add	x1, x10, x1
    4f98:      	ldr	x1, [x1]
    4f9c:      	b	0x4fac <_stogir.stack.validate+0x358>
    4fa0:      	ldr	x1, [x0, #0x28]
    4fa4:      	add	x1, x6, x1
    4fa8:      	ldr	x1, [x1]
    4fac:      	mov	w3, #0x1                ; =1
    4fb0:      	b	0x4fbc <_stogir.stack.validate+0x368>
    4fb4:      	movz	w3, #0x0, lsl #16
    4fb8:      	movz	x1, #0x0, lsl #48
    4fbc:      	ubfx	x3, x3, #0, #32
    4fc0:      	lsr	x16, x3, #0
    4fc4:      	cmp	x16, #0x1
    4fc8:      	b.eq	0x4fe4 <_stogir.stack.validate+0x390>
    4fcc:      	b.lo	0x4fd4 <_stogir.stack.validate+0x380>
    4fd0:      	b	0x4fe8 <_stogir.stack.validate+0x394>
    4fd4:      	cmp	x16, #0x0
    4fd8:      	b.eq	0x4fe0 <_stogir.stack.validate+0x38c>
    4fdc:      	b	0x4fe8 <_stogir.stack.validate+0x394>
    4fe0:      	b	0x4fec <_stogir.stack.validate+0x398>
    4fe4:      	b	0x5004 <_stogir.stack.validate+0x3b0>
    4fe8:      	b	0x5208 <_stogir.stack.validate+0x5b4>
    4fec:      	adrp	x16, 0x4000 <_stogir.atomic.validate+0x13c>
		0000000000004fec:  ARM64_RELOC_PAGE21	l_stogir.394
    4ff0:      	ldr	x16, [x16]
		0000000000004ff0:  ARM64_RELOC_PAGEOFF12	l_stogir.394
    4ff4:      	orr	x0, x16, xzr
    4ff8:      	mov	x1, #0x1                ; =1
    4ffc:      	mov	x2, #0x21               ; =33
    5000:      	b	0x4ed0 <_stogir.stack.validate+0x27c>
    5004:      	uxtb	w16, w12
    5008:      	cmp	w16, wzr
    500c:      	b.ne	0x4ebc <_stogir.stack.validate+0x268>
    5010:      	uxtb	w3, w1
    5014:      	cmp	x3, #0x42
    5018:      	b.ne	0x4ebc <_stogir.stack.validate+0x268>
    501c:      	ubfx	x1, x1, #0, #32
    5020:      	ubfx	x1, x1, #8, #8
    5024:      	cmp	x1, #0x6
    5028:      	b.ne	0x4ebc <_stogir.stack.validate+0x268>
    502c:      	ldr	x0, [x0, #0x78]
    5030:      	add	x0, x2, x0
    5034:      	ldr	w0, [x0]
    5038:      	sxtw	x0, w0
    503c:      	cmp	x0, #0x0
    5040:      	b.ne	0x4ebc <_stogir.stack.validate+0x268>
    5044:      	movz	x1, #0x0, lsl #48
    5048:      	mov	x0, #0x8                ; =8
    504c:      	movz	x2, #0x0, lsl #48
    5050:      	b	0x4ed0 <_stogir.stack.validate+0x27c>
    5054:      	movz	x1, #0x0, lsl #48
    5058:      	b	0x4f7c <_stogir.stack.validate+0x328>
    505c:      	movz	x1, #0x0, lsl #48
    5060:      	b	0x4f74 <_stogir.stack.validate+0x320>
    5064:      	ldr	x3, [x0, #0x78]
    5068:      	add	x2, x2, x3
    506c:      	ldr	w2, [x2]
    5070:      	uxtb	w16, w1
    5074:      	cmp	w16, wzr
    5078:      	b.eq	0x50d8 <_stogir.stack.validate+0x484>
    507c:      	mov	w1, #0x3                ; =3
    5080:      	b	0x50ec <_stogir.stack.validate+0x498>
    5084:      	add	x16, sp, #0x10
    5088:      	ldr	w0, [x16]
    508c:      	add	x16, sp, #0x10
    5090:      	ldr	w1, [x16, #0x4]
    5094:      	add	x16, sp, #0x10
    5098:      	ldr	w2, [x16, #0x8]
    509c:      	ubfx	x0, x0, #8, #8
    50a0:      	add	x8, sp, #0x20
    50a4:      	mov	w3, w1
    50a8:      	mov	w1, w19
    50ac:      	mov	w4, w2
    50b0:      	mov	w2, w0
    50b4:      	mov	x0, x23
    50b8:      	bl	0x50b8 <_stogir.stack.validate+0x464>
		00000000000050b8:  ARM64_RELOC_BRANCH26	_stogir.stack.validate-scope-inputs
    50bc:      	add	x16, sp, #0x20
    50c0:      	ldr	x1, [x16]
    50c4:      	add	x16, sp, #0x20
    50c8:      	ldr	x0, [x16, #0x8]
    50cc:      	add	x16, sp, #0x20
    50d0:      	ldr	x2, [x16, #0x10]
    50d4:      	b	0x4d60 <_stogir.stack.validate+0x10c>
    50d8:      	uxtb	w16, w20
    50dc:      	cmp	w16, wzr
    50e0:      	mov	w16, #0x1               ; =1
    50e4:      	mov	w17, #0x2               ; =2
    50e8:      	csel	w1, w16, w17, ne
    50ec:      	sxtw	x2, w2
    50f0:      	sxtw	x1, w1
    50f4:      	cmp	x2, x1
    50f8:      	b.ne	0x5210 <_stogir.stack.validate+0x5bc>
    50fc:      	add	x16, sp, #0x10
    5100:      	ldr	w1, [x16]
    5104:      	orr	x2, x1, xzr
    5108:      	ubfx	x2, x2, #16, #16
    510c:      	uxth	w16, w2
    5110:      	and	w2, w16, #0x8000
    5114:      	uxth	w2, w2
    5118:      	ubfx	x2, x2, #0, #16
    511c:      	cmp	x2, #0x0
    5120:      	b.ne	0x51ac <_stogir.stack.validate+0x558>
    5124:      	mov	x22, x8
    5128:      	mov	x23, x0
    512c:      	uxtb	w16, w20
    5130:      	cmp	w16, wzr
    5134:      	b.ne	0x5084 <_stogir.stack.validate+0x430>
    5138:      	uxtb	w16, w21
    513c:      	cmp	w16, wzr
    5140:      	b.ne	0x5084 <_stogir.stack.validate+0x430>
    5144:      	add	x16, sp, #0x10
    5148:      	ldr	w0, [x16]
    514c:      	add	x16, sp, #0x10
    5150:      	ldr	w1, [x16, #0x4]
    5154:      	add	x16, sp, #0x10
    5158:      	ldr	w2, [x16, #0x8]
    515c:      	ubfx	x0, x0, #8, #8
    5160:      	add	x16, sp, #0x10
    5164:      	ldr	w3, [x16, #0xc]
    5168:      	add	x8, sp, #0x40
    516c:      	mov	w4, w2
    5170:      	mov	w2, w0
    5174:      	mov	x0, x23
    5178:      	mov	w5, w3
    517c:      	mov	w3, w1
    5180:      	mov	w1, w19
    5184:      	bl	0x5184 <_stogir.stack.validate+0x530>
		0000000000005184:  ARM64_RELOC_BRANCH26	_stogir.stack.validate-inputs
    5188:      	add	x16, sp, #0x40
    518c:      	ldr	x1, [x16]
    5190:      	add	x16, sp, #0x40
    5194:      	ldr	x0, [x16, #0x8]
    5198:      	add	x16, sp, #0x40
    519c:      	ldr	x2, [x16, #0x10]
    51a0:      	b	0x50d4 <_stogir.stack.validate+0x480>
    51a4:      	movz	x1, #0x0, lsl #48
    51a8:      	b	0x5058 <_stogir.stack.validate+0x404>
    51ac:      	uxtb	w2, w1
    51b0:      	cmp	x2, #0x51
    51b4:      	b.ne	0x5218 <_stogir.stack.validate+0x5c4>
    51b8:      	ubfx	x1, x1, #16, #16
    51bc:      	cmp	x1, #0x8, lsl #12       ; =0x8000
    51c0:      	b.ne	0x5220 <_stogir.stack.validate+0x5cc>
    51c4:      	add	x16, sp, #0x10
    51c8:      	ldr	w1, [x16, #0x4]
    51cc:      	add	x16, sp, #0x10
    51d0:      	ldr	w2, [x16, #0x8]
    51d4:      	mov	x22, x8
    51d8:      	mov	x23, x0
    51dc:      	bl	0x51dc <_stogir.stack.validate+0x588>
		00000000000051dc:  ARM64_RELOC_BRANCH26	_stogir.stack.valid-frame-object-inputs?
    51e0:      	cmp	x0, #0x0
    51e4:      	b.ne	0x512c <_stogir.stack.validate+0x4d8>
    51e8:      	adrp	x16, 0x5000 <_stogir.stack.validate+0x3ac>
		00000000000051e8:  ARM64_RELOC_PAGE21	l_stogir.395
    51ec:      	ldr	x16, [x16]
		00000000000051ec:  ARM64_RELOC_PAGEOFF12	l_stogir.395
    51f0:      	orr	x0, x16, xzr
    51f4:      	mov	x1, #0x1                ; =1
    51f8:      	mov	x2, #0x26               ; =38
    51fc:      	b	0x50d4 <_stogir.stack.validate+0x480>
    5200:      	brk	#0
    5204:      	b	0x5200 <_stogir.stack.validate+0x5ac>
    5208:      	brk	#0
    520c:      	b	0x5208 <_stogir.stack.validate+0x5b4>
    5210:      	mov	x22, x8
    5214:      	b	0x4d4c <_stogir.stack.validate+0xf8>
    5218:      	mov	x22, x8
    521c:      	b	0x51e8 <_stogir.stack.validate+0x594>
    5220:      	mov	x22, x8
    5224:      	b	0x51e8 <_stogir.stack.validate+0x594>

0000000000005228 <_stogir.locals.validate>:
    5228:      	sub	sp, sp, #0xb0
    522c:      	str	x29, [sp]
    5230:      	str	x30, [sp, #0x8]
    5234:      	mov	x29, sp
    5238:      	str	x19, [sp, #0x70]
    523c:      	str	x20, [sp, #0x78]
    5240:      	str	x21, [sp, #0x80]
    5244:      	str	x22, [sp, #0x88]
    5248:      	str	x23, [sp, #0x90]
    524c:      	str	x24, [sp, #0x98]
    5250:      	str	x25, [sp, #0xa0]
    5254:      	sxtw	x1, w1
    5258:      	lsl	x3, x1, #2
    525c:      	cmp	x1, #0x0
    5260:      	cset	w4, gt
    5264:      	movz	x16, #0x0, lsl #48
    5268:      	sub	x5, x16, x1
    526c:      	sub	x6, x5, #0x1
    5270:      	uxtb	w16, w4
    5274:      	cmp	w16, wzr
    5278:      	b.eq	0x52b8 <_stogir.locals.validate+0x90>
    527c:      	ldr	x5, [x0, #0x8]
    5280:      	cmp	x1, x5
    5284:      	b.ge	0x5348 <_stogir.locals.validate+0x120>
    5288:      	add	x5, x0, #0x78
    528c:      	ldr	x5, [x5, #0x8]
    5290:      	cmp	x1, x5
    5294:      	b.ge	0x5444 <_stogir.locals.validate+0x21c>
    5298:      	ldr	x5, [x0, #0x78]
    529c:      	add	x5, x3, x5
    52a0:      	ldr	w5, [x5]
    52a4:      	sxtw	x5, w5
    52a8:      	cmp	x5, #0x0
    52ac:      	cset	w5, ge
    52b0:      	ubfx	x5, x5, #0, #8
    52b4:      	b	0x5448 <_stogir.locals.validate+0x220>
    52b8:      	cmp	x1, #0x0
    52bc:      	b.ge	0x5350 <_stogir.locals.validate+0x128>
    52c0:      	add	x7, x0, #0x28
    52c4:      	add	x9, x0, #0x50
    52c8:      	ldr	x7, [x7, #0x8]
    52cc:      	ldr	x9, [x9, #0x8]
    52d0:      	cmp	x7, x9
    52d4:      	b.ne	0x5300 <_stogir.locals.validate+0xd8>
    52d8:      	cmp	x5, x7
    52dc:      	b.gt	0x54c8 <_stogir.locals.validate+0x2a0>
    52e0:      	ldr	x5, [x0, #0x50]
    52e4:      	add	x5, x5, x6, lsl #2
    52e8:      	ldr	w5, [x5]
    52ec:      	sxtw	x5, w5
    52f0:      	cmp	x5, #0x0
    52f4:      	cset	w5, gt
    52f8:      	ubfx	x5, x5, #0, #8
    52fc:      	b	0x54cc <_stogir.locals.validate+0x2a4>
    5300:      	movz	x5, #0x0, lsl #48
    5304:      	b	0x5354 <_stogir.locals.validate+0x12c>
    5308:      	cmp	x4, #0x0
    530c:      	cset	w4, ne
    5310:      	uxtb	w16, w4
    5314:      	cmp	w16, wzr
    5318:      	mov	w16, #0x2               ; =2
    531c:      	mov	w17, #0x3               ; =3
    5320:      	csel	w4, w16, w17, ne
    5324:      	cmp	x1, #0x0
    5328:      	b.gt	0x544c <_stogir.locals.validate+0x224>
    532c:      	mov	x23, x8
    5330:      	adrp	x16, 0x5000 <_stogir.stack.validate+0x3ac>
		0000000000005330:  ARM64_RELOC_PAGE21	l_stogir.396
    5334:      	ldr	x16, [x16]
		0000000000005334:  ARM64_RELOC_PAGEOFF12	l_stogir.396
    5338:      	orr	x0, x16, xzr
    533c:      	mov	x2, #0x1                ; =1
    5340:      	mov	x1, #0x17               ; =23
    5344:      	b	0x53e8 <_stogir.locals.validate+0x1c0>
    5348:      	movz	x5, #0x0, lsl #48
    534c:      	b	0x5354 <_stogir.locals.validate+0x12c>
    5350:      	movz	x5, #0x0, lsl #48
    5354:      	cmp	x5, #0x0
    5358:      	b.eq	0x5394 <_stogir.locals.validate+0x16c>
    535c:      	uxtb	w16, w4
    5360:      	cmp	w16, wzr
    5364:      	b.eq	0x537c <_stogir.locals.validate+0x154>
    5368:      	ldr	x4, [x0]
    536c:      	add	x4, x4, x1, lsl #4
    5370:      	ldr	x5, [x4]
    5374:      	ldr	x4, [x4, #0x8]
    5378:      	b	0x538c <_stogir.locals.validate+0x164>
    537c:      	ldr	x4, [x0, #0x28]
    5380:      	add	x4, x4, x6, lsl #4
    5384:      	ldr	x5, [x4]
    5388:      	ldr	x4, [x4, #0x8]
    538c:      	mov	w6, #0x1                ; =1
    5390:      	b	0x53a0 <_stogir.locals.validate+0x178>
    5394:      	movz	w6, #0x0, lsl #16
    5398:      	movz	x5, #0x0, lsl #48
    539c:      	movz	x4, #0x0, lsl #48
    53a0:      	ubfx	x6, x6, #0, #32
    53a4:      	lsr	x16, x6, #0
    53a8:      	cmp	x16, #0x1
    53ac:      	b.eq	0x53c8 <_stogir.locals.validate+0x1a0>
    53b0:      	b.lo	0x53b8 <_stogir.locals.validate+0x190>
    53b4:      	b	0x53cc <_stogir.locals.validate+0x1a4>
    53b8:      	cmp	x16, #0x0
    53bc:      	b.eq	0x53c4 <_stogir.locals.validate+0x19c>
    53c0:      	b	0x53cc <_stogir.locals.validate+0x1a4>
    53c4:      	b	0x53d0 <_stogir.locals.validate+0x1a8>
    53c8:      	b	0x5420 <_stogir.locals.validate+0x1f8>
    53cc:      	b	0x55f0 <_stogir.locals.validate+0x3c8>
    53d0:      	adrp	x16, 0x5000 <_stogir.stack.validate+0x3ac>
		00000000000053d0:  ARM64_RELOC_PAGE21	l_stogir.397
    53d4:      	ldr	x16, [x16]
		00000000000053d4:  ARM64_RELOC_PAGEOFF12	l_stogir.397
    53d8:      	orr	x0, x16, xzr
    53dc:      	mov	x23, x8
    53e0:      	mov	x2, #0x1                ; =1
    53e4:      	mov	x1, #0x17               ; =23
    53e8:      	str	x2, [x23]
    53ec:      	str	x0, [x23, #0x8]
    53f0:      	str	x1, [x23, #0x10]
    53f4:      	ldr	x19, [sp, #0x70]
    53f8:      	ldr	x20, [sp, #0x78]
    53fc:      	ldr	x21, [sp, #0x80]
    5400:      	ldr	x22, [sp, #0x88]
    5404:      	ldr	x23, [sp, #0x90]
    5408:      	ldr	x24, [sp, #0x98]
    540c:      	ldr	x25, [sp, #0xa0]
    5410:      	ldr	x29, [sp]
    5414:      	ldr	x30, [sp, #0x8]
    5418:      	add	sp, sp, #0xb0
    541c:      	ret
    5420:      	uxtb	w6, w5
    5424:      	add	x16, sp, #0x10
    5428:      	str	x5, [x16]
    542c:      	add	x16, sp, #0x10
    5430:      	str	x4, [x16, #0x8]
    5434:      	cmp	x6, #0x55
    5438:      	b.ne	0x54ac <_stogir.locals.validate+0x284>
    543c:      	mov	x4, #0x1                ; =1
    5440:      	b	0x54b8 <_stogir.locals.validate+0x290>
    5444:      	movz	x5, #0x0, lsl #48
    5448:      	b	0x534c <_stogir.locals.validate+0x124>
    544c:      	cmp	x6, #0x48
    5450:      	cset	w21, eq
    5454:      	uxtb	w16, w20
    5458:      	cmp	w16, wzr
    545c:      	b.ne	0x54d0 <_stogir.locals.validate+0x2a8>
    5460:      	uxtb	w16, w21
    5464:      	cmp	w16, wzr
    5468:      	b.ne	0x54d0 <_stogir.locals.validate+0x2a8>
    546c:      	cmp	x6, #0x55
    5470:      	b.lt	0x5950 <_stogir.locals.validate+0x728>
    5474:      	cmp	x6, #0x58
    5478:      	b.le	0x54d0 <_stogir.locals.validate+0x2a8>
    547c:      	mov	x23, x8
    5480:      	b	0x5330 <_stogir.locals.validate+0x108>
    5484:      	cmp	x6, #0x58
    5488:      	cset	w5, eq
    548c:      	ubfx	x19, x5, #0, #8
    5490:      	cmp	x6, #0x41
    5494:      	cset	w20, eq
    5498:      	uxtb	w16, w20
    549c:      	cmp	w16, wzr
    54a0:      	b.eq	0x5308 <_stogir.locals.validate+0xe0>
    54a4:      	mov	w4, #0x1                ; =1
    54a8:      	b	0x5324 <_stogir.locals.validate+0xfc>
    54ac:      	cmp	x6, #0x56
    54b0:      	cset	w4, eq
    54b4:      	ubfx	x4, x4, #0, #8
    54b8:      	cmp	x6, #0x57
    54bc:      	b.ne	0x5484 <_stogir.locals.validate+0x25c>
    54c0:      	mov	x19, #0x1               ; =1
    54c4:      	b	0x5490 <_stogir.locals.validate+0x268>
    54c8:      	movz	x5, #0x0, lsl #48
    54cc:      	b	0x5304 <_stogir.locals.validate+0xdc>
    54d0:      	sxtw	x4, w4
    54d4:      	ldr	x5, [x0, #0x78]
    54d8:      	add	x3, x3, x5
    54dc:      	ldr	w3, [x3]
    54e0:      	sxtw	x3, w3
    54e4:      	cmp	x3, x4
    54e8:      	b.ne	0x5958 <_stogir.locals.validate+0x730>
    54ec:      	uxtb	w16, w20
    54f0:      	cmp	w16, wzr
    54f4:      	b.ne	0x5514 <_stogir.locals.validate+0x2ec>
    54f8:      	uxtb	w16, w21
    54fc:      	cmp	w16, wzr
    5500:      	b.ne	0x5514 <_stogir.locals.validate+0x2ec>
    5504:      	add	x16, sp, #0x10
    5508:      	ldr	w1, [x16, #0x8]
    550c:      	sxtw	x1, w1
    5510:      	b	0x552c <_stogir.locals.validate+0x304>
    5514:      	uxtb	w16, w21
    5518:      	cmp	w16, wzr
    551c:      	b.ne	0x552c <_stogir.locals.validate+0x304>
    5520:      	add	x16, sp, #0x10
    5524:      	ldr	w1, [x16, #0x4]
    5528:      	sxtw	x1, w1
    552c:      	add	x16, sp, #0x20
    5530:      	orr	x22, x16, xzr
    5534:      	mov	x23, x8
    5538:      	add	x8, sp, #0x20
    553c:      	mov	x24, x0
    5540:      	mov	w25, w2
    5544:      	bl	0x5544 <_stogir.locals.validate+0x31c>
		0000000000005544:  ARM64_RELOC_BRANCH26	_stogir.locals.shape
    5548:      	add	x16, sp, #0x20
    554c:      	ldr	w0, [x16]
    5550:      	lsr	x16, x0, #0
    5554:      	cmp	x16, #0x1
    5558:      	b.eq	0x5574 <_stogir.locals.validate+0x34c>
    555c:      	b.lo	0x5564 <_stogir.locals.validate+0x33c>
    5560:      	b	0x5578 <_stogir.locals.validate+0x350>
    5564:      	cmp	x16, #0x0
    5568:      	b.eq	0x5570 <_stogir.locals.validate+0x348>
    556c:      	b	0x5578 <_stogir.locals.validate+0x350>
    5570:      	b	0x5594 <_stogir.locals.validate+0x36c>
    5574:      	b	0x557c <_stogir.locals.validate+0x354>
    5578:      	b	0x57c8 <_stogir.locals.validate+0x5a0>
    557c:      	add	x1, x22, #0x8
    5580:      	add	x16, sp, #0x20
    5584:      	ldr	x0, [x16, #0x8]
    5588:      	ldr	x1, [x1, #0x8]
    558c:      	mov	x2, #0x1                ; =1
    5590:      	b	0x5344 <_stogir.locals.validate+0x11c>
    5594:      	add	x16, sp, #0x20
    5598:      	ldr	x22, [x16, #0x8]
    559c:      	uxtb	w16, w21
    55a0:      	cmp	w16, wzr
    55a4:      	b.eq	0x55bc <_stogir.locals.validate+0x394>
    55a8:      	sxtw	x22, w22
    55ac:      	and	x0, x22, #0xffffffff
    55b0:      	movz	x2, #0x0, lsl #48
    55b4:      	movz	x1, #0x0, lsl #48
    55b8:      	b	0x5590 <_stogir.locals.validate+0x368>
    55bc:      	uxtb	w16, w20
    55c0:      	cmp	w16, wzr
    55c4:      	b.eq	0x5610 <_stogir.locals.validate+0x3e8>
    55c8:      	add	x16, sp, #0x10
    55cc:      	ldr	w0, [x16]
    55d0:      	ubfx	x0, x0, #8, #8
    55d4:      	cmp	x0, #0x6
    55d8:      	b.ne	0x55f8 <_stogir.locals.validate+0x3d0>
    55dc:      	sxtw	x25, w25
    55e0:      	and	x0, x25, #0xffffffff
    55e4:      	movz	x2, #0x0, lsl #48
    55e8:      	movz	x1, #0x0, lsl #48
    55ec:      	b	0x560c <_stogir.locals.validate+0x3e4>
    55f0:      	brk	#0
    55f4:      	b	0x55f0 <_stogir.locals.validate+0x3c8>
    55f8:      	adrp	x16, 0x5000 <_stogir.stack.validate+0x3ac>
		00000000000055f8:  ARM64_RELOC_PAGE21	l_stogir.398
    55fc:      	ldr	x16, [x16]
		00000000000055fc:  ARM64_RELOC_PAGEOFF12	l_stogir.398
    5600:      	orr	x0, x16, xzr
    5604:      	mov	x2, #0x1                ; =1
    5608:      	mov	x1, #0x21               ; =33
    560c:      	b	0x55b8 <_stogir.locals.validate+0x390>
    5610:      	add	x16, sp, #0x10
    5614:      	ldr	w0, [x16, #0x4]
    5618:      	sxtw	x0, w0
    561c:      	cmp	x0, #0x0
    5620:      	cset	w1, gt
    5624:      	movz	x16, #0x0, lsl #48
    5628:      	sub	x2, x16, x0
    562c:      	sub	x3, x2, #0x1
    5630:      	uxtb	w16, w1
    5634:      	cmp	w16, wzr
    5638:      	b.eq	0x570c <_stogir.locals.validate+0x4e4>
    563c:      	ldr	x2, [x24, #0x8]
    5640:      	cmp	x0, x2
    5644:      	b.ge	0x5704 <_stogir.locals.validate+0x4dc>
    5648:      	add	x2, x24, #0x78
    564c:      	ldr	x2, [x2, #0x8]
    5650:      	cmp	x0, x2
    5654:      	b.ge	0x57b8 <_stogir.locals.validate+0x590>
    5658:      	ldr	x2, [x24, #0x78]
    565c:      	add	x2, x2, x0, lsl #2
    5660:      	ldr	w2, [x2]
    5664:      	sxtw	x2, w2
    5668:      	cmp	x2, #0x0
    566c:      	cset	w2, ge
    5670:      	ubfx	x2, x2, #0, #8
    5674:      	b	0x57bc <_stogir.locals.validate+0x594>
    5678:      	movz	w1, #0x0, lsl #16
    567c:      	movz	x0, #0x0, lsl #48
    5680:      	ubfx	x1, x1, #0, #32
    5684:      	lsr	x16, x1, #0
    5688:      	cmp	x16, #0x1
    568c:      	b.eq	0x56a8 <_stogir.locals.validate+0x480>
    5690:      	b.lo	0x5698 <_stogir.locals.validate+0x470>
    5694:      	b	0x56ac <_stogir.locals.validate+0x484>
    5698:      	cmp	x16, #0x0
    569c:      	b.eq	0x56a4 <_stogir.locals.validate+0x47c>
    56a0:      	b	0x56ac <_stogir.locals.validate+0x484>
    56a4:      	b	0x56b0 <_stogir.locals.validate+0x488>
    56a8:      	b	0x5754 <_stogir.locals.validate+0x52c>
    56ac:      	b	0x5924 <_stogir.locals.validate+0x6fc>
    56b0:      	adrp	x16, 0x5000 <_stogir.stack.validate+0x3ac>
		00000000000056b0:  ARM64_RELOC_PAGE21	l_stogir.399
    56b4:      	ldr	x16, [x16]
		00000000000056b4:  ARM64_RELOC_PAGEOFF12	l_stogir.399
    56b8:      	orr	x0, x16, xzr
    56bc:      	mov	x2, #0x1                ; =1
    56c0:      	mov	x1, #0x1c               ; =28
    56c4:      	b	0x560c <_stogir.locals.validate+0x3e4>
    56c8:      	ldr	x0, [x24, #0x28]
    56cc:      	add	x0, x0, x3, lsl #4
    56d0:      	ldr	x0, [x0]
    56d4:      	mov	w1, #0x1                ; =1
    56d8:      	b	0x5680 <_stogir.locals.validate+0x458>
    56dc:      	movz	x2, #0x0, lsl #48
    56e0:      	cmp	x2, #0x0
    56e4:      	b.eq	0x5678 <_stogir.locals.validate+0x450>
    56e8:      	uxtb	w16, w1
    56ec:      	cmp	w16, wzr
    56f0:      	b.eq	0x56c8 <_stogir.locals.validate+0x4a0>
    56f4:      	ldr	x1, [x24]
    56f8:      	add	x0, x1, x0, lsl #4
    56fc:      	ldr	x0, [x0]
    5700:      	b	0x56d4 <_stogir.locals.validate+0x4ac>
    5704:      	movz	x2, #0x0, lsl #48
    5708:      	b	0x56e0 <_stogir.locals.validate+0x4b8>
    570c:      	cmp	x0, #0x0
    5710:      	b.ge	0x56dc <_stogir.locals.validate+0x4b4>
    5714:      	add	x4, x24, #0x28
    5718:      	add	x5, x24, #0x50
    571c:      	ldr	x4, [x4, #0x8]
    5720:      	ldr	x5, [x5, #0x8]
    5724:      	cmp	x4, x5
    5728:      	b.ne	0x57b0 <_stogir.locals.validate+0x588>
    572c:      	cmp	x2, x4
    5730:      	b.gt	0x57c0 <_stogir.locals.validate+0x598>
    5734:      	ldr	x2, [x24, #0x50]
    5738:      	add	x2, x2, x3, lsl #2
    573c:      	ldr	w2, [x2]
    5740:      	sxtw	x2, w2
    5744:      	cmp	x2, #0x0
    5748:      	cset	w2, gt
    574c:      	ubfx	x2, x2, #0, #8
    5750:      	b	0x57c4 <_stogir.locals.validate+0x59c>
    5754:      	add	x16, sp, #0x10
    5758:      	ldr	w1, [x16, #0x4]
    575c:      	sxtw	x1, w1
    5760:      	cmp	x1, #0x0
    5764:      	b.le	0x5798 <_stogir.locals.validate+0x570>
    5768:      	uxtb	w0, w0
    576c:      	cmp	x0, #0x83
    5770:      	cset	w1, lt
    5774:      	uxtb	w16, w1
    5778:      	cmp	w16, wzr
    577c:      	b.eq	0x57d0 <_stogir.locals.validate+0x5a8>
    5780:      	adrp	x16, 0x5000 <_stogir.stack.validate+0x3ac>
		0000000000005780:  ARM64_RELOC_PAGE21	l_stogir.400
    5784:      	ldr	x16, [x16]
		0000000000005784:  ARM64_RELOC_PAGEOFF12	l_stogir.400
    5788:      	orr	x2, x16, xzr
    578c:      	add	x2, x0, x2
    5790:      	ldrb	w2, [x2]
    5794:      	b	0x57d4 <_stogir.locals.validate+0x5ac>
    5798:      	adrp	x16, 0x5000 <_stogir.stack.validate+0x3ac>
		0000000000005798:  ARM64_RELOC_PAGE21	l_stogir.401
    579c:      	ldr	x16, [x16]
		000000000000579c:  ARM64_RELOC_PAGEOFF12	l_stogir.401
    57a0:      	orr	x0, x16, xzr
    57a4:      	mov	x2, #0x1                ; =1
    57a8:      	mov	x1, #0x1c               ; =28
    57ac:      	b	0x56c4 <_stogir.locals.validate+0x49c>
    57b0:      	movz	x2, #0x0, lsl #48
    57b4:      	b	0x56e0 <_stogir.locals.validate+0x4b8>
    57b8:      	movz	x2, #0x0, lsl #48
    57bc:      	b	0x5708 <_stogir.locals.validate+0x4e0>
    57c0:      	movz	x2, #0x0, lsl #48
    57c4:      	b	0x57b4 <_stogir.locals.validate+0x58c>
    57c8:      	brk	#0
    57cc:      	b	0x57c8 <_stogir.locals.validate+0x5a0>
    57d0:      	movz	w2, #0x0, lsl #16
    57d4:      	uxtb	w16, w2
    57d8:      	and	w2, w16, #0x1
    57dc:      	uxtb	w2, w2
    57e0:      	ubfx	x2, x2, #0, #8
    57e4:      	cmp	x2, #0x0
    57e8:      	b.eq	0x5798 <_stogir.locals.validate+0x570>
    57ec:      	uxtb	w16, w1
    57f0:      	cmp	w16, wzr
    57f4:      	b.eq	0x5810 <_stogir.locals.validate+0x5e8>
    57f8:      	adrp	x16, 0x5000 <_stogir.stack.validate+0x3ac>
		00000000000057f8:  ARM64_RELOC_PAGE21	l_stogir.400
    57fc:      	ldr	x16, [x16]
		00000000000057fc:  ARM64_RELOC_PAGEOFF12	l_stogir.400
    5800:      	orr	x1, x16, xzr
    5804:      	add	x0, x0, x1
    5808:      	ldrb	w0, [x0]
    580c:      	b	0x5814 <_stogir.locals.validate+0x5ec>
    5810:      	movz	w0, #0x0, lsl #16
    5814:      	uxtb	w16, w0
    5818:      	and	w0, w16, #0x4
    581c:      	uxtb	w0, w0
    5820:      	ubfx	x0, x0, #0, #8
    5824:      	cmp	x0, #0x0
    5828:      	cset	w0, eq
    582c:      	uxtb	w16, w0
    5830:      	cmp	w16, wzr
    5834:      	cset	x0, eq
    5838:      	cmp	x0, #0x0
    583c:      	b.ne	0x5798 <_stogir.locals.validate+0x570>
    5840:      	cmp	x19, #0x0
    5844:      	b.eq	0x58d0 <_stogir.locals.validate+0x6a8>
    5848:      	add	x16, sp, #0x10
    584c:      	ldr	w0, [x16, #0xc]
    5850:      	add	x8, sp, #0x40
    5854:      	mov	w1, w0
    5858:      	mov	x0, x24
    585c:      	bl	0x585c <_stogir.locals.validate+0x634>
		000000000000585c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    5860:      	add	x16, sp, #0x40
    5864:      	ldr	x0, [x16]
    5868:      	add	x16, sp, #0x40
    586c:      	ldr	x20, [x16, #0x8]
    5870:      	b	0x58dc <_stogir.locals.validate+0x6b4>
    5874:      	orr	w0, w20, wzr
    5878:      	ubfx	x0, x0, #0, #32
    587c:      	ubfx	x0, x0, #8, #8
    5880:      	mov	w1, w25
    5884:      	bl	0x5884 <_stogir.locals.validate+0x65c>
		0000000000005884:  ARM64_RELOC_BRANCH26	_stogir.types.size
    5888:      	sxtw	x0, w0
    588c:      	cmp	x0, #0x0
    5890:      	b.le	0x58b8 <_stogir.locals.validate+0x690>
    5894:      	cmp	x0, x22
    5898:      	b.gt	0x58b8 <_stogir.locals.validate+0x690>
    589c:      	cmp	x19, #0x0
    58a0:      	b.eq	0x592c <_stogir.locals.validate+0x704>
    58a4:      	add	x16, sp, #0x10
    58a8:      	ldr	w1, [x16]
    58ac:      	ubfx	x1, x1, #8, #8
    58b0:      	cmp	x1, #0x0
    58b4:      	b.eq	0x592c <_stogir.locals.validate+0x704>
    58b8:      	adrp	x16, 0x5000 <_stogir.stack.validate+0x3ac>
		00000000000058b8:  ARM64_RELOC_PAGE21	l_stogir.402
    58bc:      	ldr	x16, [x16]
		00000000000058bc:  ARM64_RELOC_PAGEOFF12	l_stogir.402
    58c0:      	orr	x0, x16, xzr
    58c4:      	mov	x2, #0x1                ; =1
    58c8:      	mov	x1, #0x23               ; =35
    58cc:      	b	0x57ac <_stogir.locals.validate+0x584>
    58d0:      	add	x16, sp, #0x10
    58d4:      	ldr	x20, [x16]
    58d8:      	mov	x0, #0x1                ; =1
    58dc:      	ubfx	x0, x0, #0, #32
    58e0:      	lsr	x16, x0, #0
    58e4:      	cmp	x16, #0x1
    58e8:      	b.eq	0x5904 <_stogir.locals.validate+0x6dc>
    58ec:      	b.lo	0x58f4 <_stogir.locals.validate+0x6cc>
    58f0:      	b	0x5908 <_stogir.locals.validate+0x6e0>
    58f4:      	cmp	x16, #0x0
    58f8:      	b.eq	0x5900 <_stogir.locals.validate+0x6d8>
    58fc:      	b	0x5908 <_stogir.locals.validate+0x6e0>
    5900:      	b	0x590c <_stogir.locals.validate+0x6e4>
    5904:      	b	0x5874 <_stogir.locals.validate+0x64c>
    5908:      	b	0x5948 <_stogir.locals.validate+0x720>
    590c:      	adrp	x16, 0x5000 <_stogir.stack.validate+0x3ac>
		000000000000590c:  ARM64_RELOC_PAGE21	l_stogir.403
    5910:      	ldr	x16, [x16]
		0000000000005910:  ARM64_RELOC_PAGEOFF12	l_stogir.403
    5914:      	orr	x0, x16, xzr
    5918:      	mov	x2, #0x1                ; =1
    591c:      	mov	x1, #0x19               ; =25
    5920:      	b	0x58cc <_stogir.locals.validate+0x6a4>
    5924:      	brk	#0
    5928:      	b	0x5924 <_stogir.locals.validate+0x6fc>
    592c:      	uxtb	w20, w20
    5930:      	cmp	x20, #0x48
    5934:      	b.eq	0x58b8 <_stogir.locals.validate+0x690>
    5938:      	and	x0, x0, #0xffffffff
    593c:      	movz	x2, #0x0, lsl #48
    5940:      	movz	x1, #0x0, lsl #48
    5944:      	b	0x58cc <_stogir.locals.validate+0x6a4>
    5948:      	brk	#0
    594c:      	b	0x5948 <_stogir.locals.validate+0x720>
    5950:      	mov	x23, x8
    5954:      	b	0x5330 <_stogir.locals.validate+0x108>
    5958:      	mov	x23, x8
    595c:      	b	0x5330 <_stogir.locals.validate+0x108>

0000000000005960 <_stogir.conversion.validate>:
    5960:      	sub	sp, sp, #0x40
    5964:      	str	x29, [sp]
    5968:      	str	x30, [sp, #0x8]
    596c:      	mov	x29, sp
    5970:      	str	x19, [sp, #0x30]
    5974:      	sxtw	x1, w1
    5978:      	lsl	x3, x1, #2
    597c:      	cmp	x1, #0x0
    5980:      	cset	w4, gt
    5984:      	movz	x16, #0x0, lsl #48
    5988:      	sub	x5, x16, x1
    598c:      	sub	x6, x5, #0x1
    5990:      	uxtb	w16, w4
    5994:      	cmp	w16, wzr
    5998:      	b.eq	0x59d8 <_stogir.conversion.validate+0x78>
    599c:      	ldr	x5, [x0, #0x8]
    59a0:      	cmp	x1, x5
    59a4:      	b.ge	0x5a28 <_stogir.conversion.validate+0xc8>
    59a8:      	add	x5, x0, #0x78
    59ac:      	ldr	x5, [x5, #0x8]
    59b0:      	cmp	x1, x5
    59b4:      	b.ge	0x5b00 <_stogir.conversion.validate+0x1a0>
    59b8:      	ldr	x5, [x0, #0x78]
    59bc:      	add	x5, x3, x5
    59c0:      	ldr	w5, [x5]
    59c4:      	sxtw	x5, w5
    59c8:      	cmp	x5, #0x0
    59cc:      	cset	w5, ge
    59d0:      	ubfx	x5, x5, #0, #8
    59d4:      	b	0x5b04 <_stogir.conversion.validate+0x1a4>
    59d8:      	cmp	x1, #0x0
    59dc:      	b.ge	0x5a30 <_stogir.conversion.validate+0xd0>
    59e0:      	add	x7, x0, #0x28
    59e4:      	add	x9, x0, #0x50
    59e8:      	ldr	x7, [x7, #0x8]
    59ec:      	ldr	x9, [x9, #0x8]
    59f0:      	cmp	x7, x9
    59f4:      	b.ne	0x5a20 <_stogir.conversion.validate+0xc0>
    59f8:      	cmp	x5, x7
    59fc:      	b.gt	0x5b94 <_stogir.conversion.validate+0x234>
    5a00:      	ldr	x5, [x0, #0x50]
    5a04:      	add	x5, x5, x6, lsl #2
    5a08:      	ldr	w5, [x5]
    5a0c:      	sxtw	x5, w5
    5a10:      	cmp	x5, #0x0
    5a14:      	cset	w5, gt
    5a18:      	ubfx	x5, x5, #0, #8
    5a1c:      	b	0x5b98 <_stogir.conversion.validate+0x238>
    5a20:      	movz	x5, #0x0, lsl #48
    5a24:      	b	0x5a34 <_stogir.conversion.validate+0xd4>
    5a28:      	movz	x5, #0x0, lsl #48
    5a2c:      	b	0x5a34 <_stogir.conversion.validate+0xd4>
    5a30:      	movz	x5, #0x0, lsl #48
    5a34:      	cmp	x5, #0x0
    5a38:      	b.eq	0x5a6c <_stogir.conversion.validate+0x10c>
    5a3c:      	uxtb	w16, w4
    5a40:      	cmp	w16, wzr
    5a44:      	b.eq	0x5a58 <_stogir.conversion.validate+0xf8>
    5a48:      	ldr	x4, [x0]
    5a4c:      	add	x4, x4, x1, lsl #4
    5a50:      	ldr	x4, [x4]
    5a54:      	b	0x5a64 <_stogir.conversion.validate+0x104>
    5a58:      	ldr	x4, [x0, #0x28]
    5a5c:      	add	x4, x4, x6, lsl #4
    5a60:      	ldr	x4, [x4]
    5a64:      	mov	w5, #0x1                ; =1
    5a68:      	b	0x5a74 <_stogir.conversion.validate+0x114>
    5a6c:      	movz	w5, #0x0, lsl #16
    5a70:      	movz	x4, #0x0, lsl #48
    5a74:      	ubfx	x5, x5, #0, #32
    5a78:      	lsr	x16, x5, #0
    5a7c:      	cmp	x16, #0x1
    5a80:      	b.eq	0x5a9c <_stogir.conversion.validate+0x13c>
    5a84:      	b.lo	0x5a8c <_stogir.conversion.validate+0x12c>
    5a88:      	b	0x5aa0 <_stogir.conversion.validate+0x140>
    5a8c:      	cmp	x16, #0x0
    5a90:      	b.eq	0x5a98 <_stogir.conversion.validate+0x138>
    5a94:      	b	0x5aa0 <_stogir.conversion.validate+0x140>
    5a98:      	b	0x5aa4 <_stogir.conversion.validate+0x144>
    5a9c:      	b	0x5adc <_stogir.conversion.validate+0x17c>
    5aa0:      	b	0x5c0c <_stogir.conversion.validate+0x2ac>
    5aa4:      	adrp	x16, 0x5000 <_stogir.stack.validate+0x3ac>
		0000000000005aa4:  ARM64_RELOC_PAGE21	l_stogir.404
    5aa8:      	ldr	x16, [x16]
		0000000000005aa8:  ARM64_RELOC_PAGEOFF12	l_stogir.404
    5aac:      	orr	x0, x16, xzr
    5ab0:      	mov	x19, x8
    5ab4:      	mov	x1, #0x1                ; =1
    5ab8:      	mov	x2, #0x12               ; =18
    5abc:      	str	x1, [x19]
    5ac0:      	str	x0, [x19, #0x8]
    5ac4:      	str	x2, [x19, #0x10]
    5ac8:      	ldr	x19, [sp, #0x30]
    5acc:      	ldr	x29, [sp]
    5ad0:      	ldr	x30, [sp, #0x8]
    5ad4:      	add	sp, sp, #0x40
    5ad8:      	ret
    5adc:      	cmp	x1, #0x0
    5ae0:      	b.gt	0x5b08 <_stogir.conversion.validate+0x1a8>
    5ae4:      	mov	x19, x8
    5ae8:      	adrp	x16, 0x5000 <_stogir.stack.validate+0x3ac>
		0000000000005ae8:  ARM64_RELOC_PAGE21	l_stogir.405
    5aec:      	ldr	x16, [x16]
		0000000000005aec:  ARM64_RELOC_PAGEOFF12	l_stogir.405
    5af0:      	orr	x0, x16, xzr
    5af4:      	mov	x1, #0x1                ; =1
    5af8:      	mov	x2, #0x1e               ; =30
    5afc:      	b	0x5abc <_stogir.conversion.validate+0x15c>
    5b00:      	movz	x5, #0x0, lsl #48
    5b04:      	b	0x5a2c <_stogir.conversion.validate+0xcc>
    5b08:      	uxtb	w1, w4
    5b0c:      	orr	x5, x1, xzr
    5b10:      	cmp	x5, #0x21
    5b14:      	b.lt	0x5d24 <_stogir.conversion.validate+0x3c4>
    5b18:      	cmp	x5, #0x27
    5b1c:      	b.gt	0x5d2c <_stogir.conversion.validate+0x3cc>
    5b20:      	ldr	x5, [x0, #0x78]
    5b24:      	add	x3, x3, x5
    5b28:      	ldr	w3, [x3]
    5b2c:      	sxtw	x3, w3
    5b30:      	cmp	x3, #0x1
    5b34:      	b.ne	0x5d34 <_stogir.conversion.validate+0x3d4>
    5b38:      	asr	x3, x4, #32
    5b3c:      	cmp	x3, #0x0
    5b40:      	cset	w6, gt
    5b44:      	movz	x16, #0x0, lsl #48
    5b48:      	sub	x7, x16, x3
    5b4c:      	sub	x9, x7, #0x1
    5b50:      	uxtb	w16, w6
    5b54:      	cmp	w16, wzr
    5b58:      	b.eq	0x5bc4 <_stogir.conversion.validate+0x264>
    5b5c:      	ldr	x7, [x0, #0x8]
    5b60:      	cmp	x3, x7
    5b64:      	b.ge	0x5c14 <_stogir.conversion.validate+0x2b4>
    5b68:      	add	x7, x0, #0x78
    5b6c:      	ldr	x7, [x7, #0x8]
    5b70:      	cmp	x3, x7
    5b74:      	b.ge	0x5cb4 <_stogir.conversion.validate+0x354>
    5b78:      	add	x5, x5, x3, lsl #2
    5b7c:      	ldr	w5, [x5]
    5b80:      	sxtw	x5, w5
    5b84:      	cmp	x5, #0x0
    5b88:      	cset	w5, ge
    5b8c:      	ubfx	x5, x5, #0, #8
    5b90:      	b	0x5cb8 <_stogir.conversion.validate+0x358>
    5b94:      	movz	x5, #0x0, lsl #48
    5b98:      	b	0x5a24 <_stogir.conversion.validate+0xc4>
    5b9c:      	uxtb	w3, w0
    5ba0:      	cmp	x3, #0x48
    5ba4:      	b.ne	0x5cbc <_stogir.conversion.validate+0x35c>
    5ba8:      	mov	x19, x8
    5bac:      	adrp	x16, 0x5000 <_stogir.stack.validate+0x3ac>
		0000000000005bac:  ARM64_RELOC_PAGE21	l_stogir.406
    5bb0:      	ldr	x16, [x16]
		0000000000005bb0:  ARM64_RELOC_PAGEOFF12	l_stogir.406
    5bb4:      	orr	x0, x16, xzr
    5bb8:      	mov	x1, #0x1                ; =1
    5bbc:      	mov	x2, #0x25               ; =37
    5bc0:      	b	0x5afc <_stogir.conversion.validate+0x19c>
    5bc4:      	cmp	x3, #0x0
    5bc8:      	b.ge	0x5c1c <_stogir.conversion.validate+0x2bc>
    5bcc:      	add	x5, x0, #0x28
    5bd0:      	add	x10, x0, #0x50
    5bd4:      	ldr	x5, [x5, #0x8]
    5bd8:      	ldr	x10, [x10, #0x8]
    5bdc:      	cmp	x5, x10
    5be0:      	b.ne	0x5cac <_stogir.conversion.validate+0x34c>
    5be4:      	cmp	x7, x5
    5be8:      	b.gt	0x5d14 <_stogir.conversion.validate+0x3b4>
    5bec:      	ldr	x5, [x0, #0x50]
    5bf0:      	add	x5, x5, x9, lsl #2
    5bf4:      	ldr	w5, [x5]
    5bf8:      	sxtw	x5, w5
    5bfc:      	cmp	x5, #0x0
    5c00:      	cset	w5, gt
    5c04:      	ubfx	x5, x5, #0, #8
    5c08:      	b	0x5d18 <_stogir.conversion.validate+0x3b8>
    5c0c:      	brk	#0
    5c10:      	b	0x5c0c <_stogir.conversion.validate+0x2ac>
    5c14:      	movz	x5, #0x0, lsl #48
    5c18:      	b	0x5c20 <_stogir.conversion.validate+0x2c0>
    5c1c:      	movz	x5, #0x0, lsl #48
    5c20:      	cmp	x5, #0x0
    5c24:      	b.eq	0x5c58 <_stogir.conversion.validate+0x2f8>
    5c28:      	uxtb	w16, w6
    5c2c:      	cmp	w16, wzr
    5c30:      	b.eq	0x5c44 <_stogir.conversion.validate+0x2e4>
    5c34:      	ldr	x0, [x0]
    5c38:      	add	x0, x0, x3, lsl #4
    5c3c:      	ldr	x0, [x0]
    5c40:      	b	0x5c50 <_stogir.conversion.validate+0x2f0>
    5c44:      	ldr	x0, [x0, #0x28]
    5c48:      	add	x0, x0, x9, lsl #4
    5c4c:      	ldr	x0, [x0]
    5c50:      	mov	w3, #0x1                ; =1
    5c54:      	b	0x5c60 <_stogir.conversion.validate+0x300>
    5c58:      	movz	w3, #0x0, lsl #16
    5c5c:      	movz	x0, #0x0, lsl #48
    5c60:      	ubfx	x3, x3, #0, #32
    5c64:      	lsr	x16, x3, #0
    5c68:      	cmp	x16, #0x1
    5c6c:      	b.eq	0x5c88 <_stogir.conversion.validate+0x328>
    5c70:      	b.lo	0x5c78 <_stogir.conversion.validate+0x318>
    5c74:      	b	0x5c8c <_stogir.conversion.validate+0x32c>
    5c78:      	cmp	x16, #0x0
    5c7c:      	b.eq	0x5c84 <_stogir.conversion.validate+0x324>
    5c80:      	b	0x5c8c <_stogir.conversion.validate+0x32c>
    5c84:      	b	0x5c90 <_stogir.conversion.validate+0x330>
    5c88:      	b	0x5b9c <_stogir.conversion.validate+0x23c>
    5c8c:      	b	0x5d1c <_stogir.conversion.validate+0x3bc>
    5c90:      	adrp	x16, 0x5000 <_stogir.stack.validate+0x3ac>
		0000000000005c90:  ARM64_RELOC_PAGE21	l_stogir.407
    5c94:      	ldr	x16, [x16]
		0000000000005c94:  ARM64_RELOC_PAGEOFF12	l_stogir.407
    5c98:      	orr	x0, x16, xzr
    5c9c:      	mov	x19, x8
    5ca0:      	mov	x1, #0x1                ; =1
    5ca4:      	mov	x2, #0x19               ; =25
    5ca8:      	b	0x5bc0 <_stogir.conversion.validate+0x260>
    5cac:      	movz	x5, #0x0, lsl #48
    5cb0:      	b	0x5c20 <_stogir.conversion.validate+0x2c0>
    5cb4:      	movz	x5, #0x0, lsl #48
    5cb8:      	b	0x5c18 <_stogir.conversion.validate+0x2b8>
    5cbc:      	cmp	x3, #0x46
    5cc0:      	b.eq	0x5d3c <_stogir.conversion.validate+0x3dc>
    5cc4:      	ubfx	x4, x4, #0, #32
    5cc8:      	ubfx	x0, x0, #0, #32
    5ccc:      	ubfx	x3, x4, #8, #8
    5cd0:      	ubfx	x0, x0, #8, #8
    5cd4:      	mov	x19, x8
    5cd8:      	add	x8, sp, #0x10
    5cdc:      	fmov	s31, w0
    5ce0:      	mov	w0, w1
    5ce4:      	fmov	w1, s31
    5ce8:      	fmov	s31, w2
    5cec:      	mov	w2, w3
    5cf0:      	fmov	w3, s31
    5cf4:      	bl	0x5cf4 <_stogir.conversion.validate+0x394>
		0000000000005cf4:  ARM64_RELOC_BRANCH26	_stogir.conversion.policy
    5cf8:      	add	x16, sp, #0x10
    5cfc:      	ldr	x1, [x16]
    5d00:      	add	x16, sp, #0x10
    5d04:      	ldr	x0, [x16, #0x8]
    5d08:      	add	x16, sp, #0x10
    5d0c:      	ldr	x2, [x16, #0x10]
    5d10:      	b	0x5bc0 <_stogir.conversion.validate+0x260>
    5d14:      	movz	x5, #0x0, lsl #48
    5d18:      	b	0x5cb0 <_stogir.conversion.validate+0x350>
    5d1c:      	brk	#0
    5d20:      	b	0x5d1c <_stogir.conversion.validate+0x3bc>
    5d24:      	mov	x19, x8
    5d28:      	b	0x5ae8 <_stogir.conversion.validate+0x188>
    5d2c:      	mov	x19, x8
    5d30:      	b	0x5ae8 <_stogir.conversion.validate+0x188>
    5d34:      	mov	x19, x8
    5d38:      	b	0x5ae8 <_stogir.conversion.validate+0x188>
    5d3c:      	mov	x19, x8
    5d40:      	b	0x5bac <_stogir.conversion.validate+0x24c>

0000000000005d44 <_stogir.conditional.validate>:
    5d44:      	sub	sp, sp, #0x40
    5d48:      	str	x29, [sp]
    5d4c:      	str	x30, [sp, #0x8]
    5d50:      	mov	x29, sp
    5d54:      	str	x19, [sp, #0x30]
    5d58:      	sxtw	x1, w1
    5d5c:      	lsl	x2, x1, #2
    5d60:      	cmp	x1, #0x0
    5d64:      	cset	w3, gt
    5d68:      	movz	x16, #0x0, lsl #48
    5d6c:      	sub	x4, x16, x1
    5d70:      	sub	x5, x4, #0x1
    5d74:      	uxtb	w16, w3
    5d78:      	cmp	w16, wzr
    5d7c:      	b.eq	0x5dbc <_stogir.conditional.validate+0x78>
    5d80:      	ldr	x4, [x0, #0x8]
    5d84:      	cmp	x1, x4
    5d88:      	b.ge	0x5e0c <_stogir.conditional.validate+0xc8>
    5d8c:      	add	x4, x0, #0x78
    5d90:      	ldr	x4, [x4, #0x8]
    5d94:      	cmp	x1, x4
    5d98:      	b.ge	0x5ef0 <_stogir.conditional.validate+0x1ac>
    5d9c:      	ldr	x4, [x0, #0x78]
    5da0:      	add	x4, x2, x4
    5da4:      	ldr	w4, [x4]
    5da8:      	sxtw	x4, w4
    5dac:      	cmp	x4, #0x0
    5db0:      	cset	w4, ge
    5db4:      	ubfx	x4, x4, #0, #8
    5db8:      	b	0x5ef4 <_stogir.conditional.validate+0x1b0>
    5dbc:      	cmp	x1, #0x0
    5dc0:      	b.ge	0x5e14 <_stogir.conditional.validate+0xd0>
    5dc4:      	add	x6, x0, #0x28
    5dc8:      	add	x7, x0, #0x50
    5dcc:      	ldr	x6, [x6, #0x8]
    5dd0:      	ldr	x7, [x7, #0x8]
    5dd4:      	cmp	x6, x7
    5dd8:      	b.ne	0x5e04 <_stogir.conditional.validate+0xc0>
    5ddc:      	cmp	x4, x6
    5de0:      	b.gt	0x5f70 <_stogir.conditional.validate+0x22c>
    5de4:      	ldr	x4, [x0, #0x50]
    5de8:      	add	x4, x4, x5, lsl #2
    5dec:      	ldr	w4, [x4]
    5df0:      	sxtw	x4, w4
    5df4:      	cmp	x4, #0x0
    5df8:      	cset	w4, gt
    5dfc:      	ubfx	x4, x4, #0, #8
    5e00:      	b	0x5f74 <_stogir.conditional.validate+0x230>
    5e04:      	movz	x4, #0x0, lsl #48
    5e08:      	b	0x5e18 <_stogir.conditional.validate+0xd4>
    5e0c:      	movz	x4, #0x0, lsl #48
    5e10:      	b	0x5e18 <_stogir.conditional.validate+0xd4>
    5e14:      	movz	x4, #0x0, lsl #48
    5e18:      	cmp	x4, #0x0
    5e1c:      	b.eq	0x5e58 <_stogir.conditional.validate+0x114>
    5e20:      	uxtb	w16, w3
    5e24:      	cmp	w16, wzr
    5e28:      	b.eq	0x5e40 <_stogir.conditional.validate+0xfc>
    5e2c:      	ldr	x3, [x0]
    5e30:      	add	x3, x3, x1, lsl #4
    5e34:      	ldr	x4, [x3]
    5e38:      	ldr	x3, [x3, #0x8]
    5e3c:      	b	0x5e50 <_stogir.conditional.validate+0x10c>
    5e40:      	ldr	x3, [x0, #0x28]
    5e44:      	add	x3, x3, x5, lsl #4
    5e48:      	ldr	x4, [x3]
    5e4c:      	ldr	x3, [x3, #0x8]
    5e50:      	mov	w5, #0x1                ; =1
    5e54:      	b	0x5e64 <_stogir.conditional.validate+0x120>
    5e58:      	movz	w5, #0x0, lsl #16
    5e5c:      	movz	x4, #0x0, lsl #48
    5e60:      	movz	x3, #0x0, lsl #48
    5e64:      	ubfx	x5, x5, #0, #32
    5e68:      	lsr	x16, x5, #0
    5e6c:      	cmp	x16, #0x1
    5e70:      	b.eq	0x5e8c <_stogir.conditional.validate+0x148>
    5e74:      	b.lo	0x5e7c <_stogir.conditional.validate+0x138>
    5e78:      	b	0x5e90 <_stogir.conditional.validate+0x14c>
    5e7c:      	cmp	x16, #0x0
    5e80:      	b.eq	0x5e88 <_stogir.conditional.validate+0x144>
    5e84:      	b	0x5e90 <_stogir.conditional.validate+0x14c>
    5e88:      	b	0x5e94 <_stogir.conditional.validate+0x150>
    5e8c:      	b	0x5eb0 <_stogir.conditional.validate+0x16c>
    5e90:      	b	0x5f78 <_stogir.conditional.validate+0x234>
    5e94:      	adrp	x16, 0x5000 <_stogir.stack.validate+0x3ac>
		0000000000005e94:  ARM64_RELOC_PAGE21	l_stogir.408
    5e98:      	ldr	x16, [x16]
		0000000000005e98:  ARM64_RELOC_PAGEOFF12	l_stogir.408
    5e9c:      	orr	x0, x16, xzr
    5ea0:      	mov	x19, x8
    5ea4:      	mov	x1, #0x1                ; =1
    5ea8:      	mov	x2, #0x18               ; =24
    5eac:      	b	0x5ed0 <_stogir.conditional.validate+0x18c>
    5eb0:      	cmp	x1, #0x0
    5eb4:      	b.gt	0x5ef8 <_stogir.conditional.validate+0x1b4>
    5eb8:      	mov	x19, x8
    5ebc:      	adrp	x16, 0x5000 <_stogir.stack.validate+0x3ac>
		0000000000005ebc:  ARM64_RELOC_PAGE21	l_stogir.409
    5ec0:      	ldr	x16, [x16]
		0000000000005ec0:  ARM64_RELOC_PAGEOFF12	l_stogir.409
    5ec4:      	orr	x0, x16, xzr
    5ec8:      	mov	x1, #0x1                ; =1
    5ecc:      	mov	x2, #0x18               ; =24
    5ed0:      	str	x1, [x19]
    5ed4:      	str	x0, [x19, #0x8]
    5ed8:      	str	x2, [x19, #0x10]
    5edc:      	ldr	x19, [sp, #0x30]
    5ee0:      	ldr	x29, [sp]
    5ee4:      	ldr	x30, [sp, #0x8]
    5ee8:      	add	sp, sp, #0x40
    5eec:      	ret
    5ef0:      	movz	x4, #0x0, lsl #48
    5ef4:      	b	0x5e10 <_stogir.conditional.validate+0xcc>
    5ef8:      	uxtb	w1, w4
    5efc:      	cmp	x1, #0x3c
    5f00:      	b.ne	0x5f80 <_stogir.conditional.validate+0x23c>
    5f04:      	ldr	x1, [x0, #0x78]
    5f08:      	add	x1, x2, x1
    5f0c:      	ldr	w1, [x1]
    5f10:      	sxtw	x1, w1
    5f14:      	cmp	x1, #0x3
    5f18:      	b.ne	0x5f88 <_stogir.conditional.validate+0x244>
    5f1c:      	orr	w1, w3, wzr
    5f20:      	orr	w2, w4, wzr
    5f24:      	lsr	x4, x4, #32
    5f28:      	lsr	x3, x3, #32
    5f2c:      	ubfx	x2, x2, #0, #32
    5f30:      	ubfx	x2, x2, #8, #8
    5f34:      	mov	x19, x8
    5f38:      	add	x8, sp, #0x10
    5f3c:      	fmov	s31, w1
    5f40:      	mov	w1, w2
    5f44:      	mov	w2, w4
    5f48:      	mov	w4, w3
    5f4c:      	fmov	w3, s31
    5f50:      	bl	0x5f50 <_stogir.conditional.validate+0x20c>
		0000000000005f50:  ARM64_RELOC_BRANCH26	_stogir.conditional.operands
    5f54:      	add	x16, sp, #0x10
    5f58:      	ldr	x1, [x16]
    5f5c:      	add	x16, sp, #0x10
    5f60:      	ldr	x0, [x16, #0x8]
    5f64:      	add	x16, sp, #0x10
    5f68:      	ldr	x2, [x16, #0x10]
    5f6c:      	b	0x5ed0 <_stogir.conditional.validate+0x18c>
    5f70:      	movz	x4, #0x0, lsl #48
    5f74:      	b	0x5e08 <_stogir.conditional.validate+0xc4>
    5f78:      	brk	#0
    5f7c:      	b	0x5f78 <_stogir.conditional.validate+0x234>
    5f80:      	mov	x19, x8
    5f84:      	b	0x5ebc <_stogir.conditional.validate+0x178>
    5f88:      	mov	x19, x8
    5f8c:      	b	0x5ebc <_stogir.conditional.validate+0x178>

0000000000005f90 <_stogir.floating.validate>:
    5f90:      	sub	sp, sp, #0x50
    5f94:      	str	x29, [sp]
    5f98:      	str	x30, [sp, #0x8]
    5f9c:      	mov	x29, sp
    5fa0:      	str	x19, [sp, #0x40]
    5fa4:      	sxtw	x1, w1
    5fa8:      	lsl	x2, x1, #2
    5fac:      	cmp	x1, #0x0
    5fb0:      	cset	w3, gt
    5fb4:      	movz	x16, #0x0, lsl #48
    5fb8:      	sub	x4, x16, x1
    5fbc:      	sub	x5, x4, #0x1
    5fc0:      	uxtb	w16, w3
    5fc4:      	cmp	w16, wzr
    5fc8:      	b.eq	0x6008 <_stogir.floating.validate+0x78>
    5fcc:      	ldr	x4, [x0, #0x8]
    5fd0:      	cmp	x1, x4
    5fd4:      	b.ge	0x6058 <_stogir.floating.validate+0xc8>
    5fd8:      	add	x4, x0, #0x78
    5fdc:      	ldr	x4, [x4, #0x8]
    5fe0:      	cmp	x1, x4
    5fe4:      	b.ge	0x614c <_stogir.floating.validate+0x1bc>
    5fe8:      	ldr	x4, [x0, #0x78]
    5fec:      	add	x4, x2, x4
    5ff0:      	ldr	w4, [x4]
    5ff4:      	sxtw	x4, w4
    5ff8:      	cmp	x4, #0x0
    5ffc:      	cset	w4, ge
    6000:      	ubfx	x4, x4, #0, #8
    6004:      	b	0x6150 <_stogir.floating.validate+0x1c0>
    6008:      	cmp	x1, #0x0
    600c:      	b.ge	0x6060 <_stogir.floating.validate+0xd0>
    6010:      	add	x6, x0, #0x28
    6014:      	add	x7, x0, #0x50
    6018:      	ldr	x6, [x6, #0x8]
    601c:      	ldr	x7, [x7, #0x8]
    6020:      	cmp	x6, x7
    6024:      	b.ne	0x6050 <_stogir.floating.validate+0xc0>
    6028:      	cmp	x4, x6
    602c:      	b.gt	0x61d8 <_stogir.floating.validate+0x248>
    6030:      	ldr	x4, [x0, #0x50]
    6034:      	add	x4, x4, x5, lsl #2
    6038:      	ldr	w4, [x4]
    603c:      	sxtw	x4, w4
    6040:      	cmp	x4, #0x0
    6044:      	cset	w4, gt
    6048:      	ubfx	x4, x4, #0, #8
    604c:      	b	0x61dc <_stogir.floating.validate+0x24c>
    6050:      	movz	x4, #0x0, lsl #48
    6054:      	b	0x6064 <_stogir.floating.validate+0xd4>
    6058:      	movz	x4, #0x0, lsl #48
    605c:      	b	0x6064 <_stogir.floating.validate+0xd4>
    6060:      	movz	x4, #0x0, lsl #48
    6064:      	cmp	x4, #0x0
    6068:      	b.eq	0x60a4 <_stogir.floating.validate+0x114>
    606c:      	uxtb	w16, w3
    6070:      	cmp	w16, wzr
    6074:      	b.eq	0x608c <_stogir.floating.validate+0xfc>
    6078:      	ldr	x3, [x0]
    607c:      	add	x3, x3, x1, lsl #4
    6080:      	ldr	x4, [x3]
    6084:      	ldr	x3, [x3, #0x8]
    6088:      	b	0x609c <_stogir.floating.validate+0x10c>
    608c:      	ldr	x3, [x0, #0x28]
    6090:      	add	x3, x3, x5, lsl #4
    6094:      	ldr	x4, [x3]
    6098:      	ldr	x3, [x3, #0x8]
    609c:      	mov	w5, #0x1                ; =1
    60a0:      	b	0x60b0 <_stogir.floating.validate+0x120>
    60a4:      	movz	w5, #0x0, lsl #16
    60a8:      	movz	x4, #0x0, lsl #48
    60ac:      	movz	x3, #0x0, lsl #48
    60b0:      	ubfx	x5, x5, #0, #32
    60b4:      	lsr	x16, x5, #0
    60b8:      	cmp	x16, #0x1
    60bc:      	b.eq	0x60d8 <_stogir.floating.validate+0x148>
    60c0:      	b.lo	0x60c8 <_stogir.floating.validate+0x138>
    60c4:      	b	0x60dc <_stogir.floating.validate+0x14c>
    60c8:      	cmp	x16, #0x0
    60cc:      	b.eq	0x60d4 <_stogir.floating.validate+0x144>
    60d0:      	b	0x60dc <_stogir.floating.validate+0x14c>
    60d4:      	b	0x60e0 <_stogir.floating.validate+0x150>
    60d8:      	b	0x6118 <_stogir.floating.validate+0x188>
    60dc:      	b	0x6454 <_stogir.floating.validate+0x4c4>
    60e0:      	adrp	x16, 0x6000 <_stogir.floating.validate+0x70>
		00000000000060e0:  ARM64_RELOC_PAGE21	l_stogir.410
    60e4:      	ldr	x16, [x16]
		00000000000060e4:  ARM64_RELOC_PAGEOFF12	l_stogir.410
    60e8:      	orr	x0, x16, xzr
    60ec:      	mov	x19, x8
    60f0:      	mov	x1, #0x1                ; =1
    60f4:      	mov	x2, #0x1c               ; =28
    60f8:      	str	x1, [x19]
    60fc:      	str	x0, [x19, #0x8]
    6100:      	str	x2, [x19, #0x10]
    6104:      	ldr	x19, [sp, #0x40]
    6108:      	ldr	x29, [sp]
    610c:      	ldr	x30, [sp, #0x8]
    6110:      	add	sp, sp, #0x50
    6114:      	ret
    6118:      	add	x16, sp, #0x10
    611c:      	str	x4, [x16]
    6120:      	add	x16, sp, #0x10
    6124:      	str	x3, [x16, #0x8]
    6128:      	cmp	x1, #0x0
    612c:      	b.gt	0x6154 <_stogir.floating.validate+0x1c4>
    6130:      	mov	x19, x8
    6134:      	adrp	x16, 0x6000 <_stogir.floating.validate+0x70>
		0000000000006134:  ARM64_RELOC_PAGE21	l_stogir.411
    6138:      	ldr	x16, [x16]
		0000000000006138:  ARM64_RELOC_PAGEOFF12	l_stogir.411
    613c:      	orr	x0, x16, xzr
    6140:      	mov	x1, #0x1                ; =1
    6144:      	mov	x2, #0x1c               ; =28
    6148:      	b	0x60f8 <_stogir.floating.validate+0x168>
    614c:      	movz	x4, #0x0, lsl #48
    6150:      	b	0x605c <_stogir.floating.validate+0xcc>
    6154:      	uxtb	w4, w4
    6158:      	orr	x1, x4, xzr
    615c:      	cmp	x1, #0xe
    6160:      	cset	w3, ge
    6164:      	cmp	x1, #0x19
    6168:      	cset	w5, le
    616c:      	cmp	x1, #0x1f
    6170:      	cset	w6, eq
    6174:      	cmp	x1, #0x20
    6178:      	cset	w7, eq
    617c:      	uxtb	w16, w3
    6180:      	cmp	w16, wzr
    6184:      	b.eq	0x61e0 <_stogir.floating.validate+0x250>
    6188:      	uxtb	w16, w5
    618c:      	cmp	w16, wzr
    6190:      	b.eq	0x61e0 <_stogir.floating.validate+0x250>
    6194:      	cmp	x1, #0x1d
    6198:      	cset	w1, eq
    619c:      	ldr	x9, [x0, #0x78]
    61a0:      	add	x2, x2, x9
    61a4:      	ldr	w2, [x2]
    61a8:      	uxtb	w16, w6
    61ac:      	cmp	w16, wzr
    61b0:      	b.ne	0x6220 <_stogir.floating.validate+0x290>
    61b4:      	uxtb	w16, w7
    61b8:      	cmp	w16, wzr
    61bc:      	b.ne	0x6220 <_stogir.floating.validate+0x290>
    61c0:      	uxtb	w16, w1
    61c4:      	cmp	w16, wzr
    61c8:      	mov	w16, #0x3               ; =3
    61cc:      	mov	w17, #0x2               ; =2
    61d0:      	csel	w6, w16, w17, ne
    61d4:      	b	0x6224 <_stogir.floating.validate+0x294>
    61d8:      	movz	x4, #0x0, lsl #48
    61dc:      	b	0x6054 <_stogir.floating.validate+0xc4>
    61e0:      	uxtb	w16, w6
    61e4:      	cmp	w16, wzr
    61e8:      	b.ne	0x6194 <_stogir.floating.validate+0x204>
    61ec:      	uxtb	w16, w7
    61f0:      	cmp	w16, wzr
    61f4:      	b.ne	0x6194 <_stogir.floating.validate+0x204>
    61f8:      	cmp	x1, #0x1a
    61fc:      	b.lt	0x6208 <_stogir.floating.validate+0x278>
    6200:      	cmp	x1, #0x1d
    6204:      	b.le	0x6194 <_stogir.floating.validate+0x204>
    6208:      	cmp	x1, #0x3a
    620c:      	b.eq	0x6194 <_stogir.floating.validate+0x204>
    6210:      	cmp	x1, #0x3b
    6214:      	b.eq	0x6194 <_stogir.floating.validate+0x204>
    6218:      	mov	x19, x8
    621c:      	b	0x6134 <_stogir.floating.validate+0x1a4>
    6220:      	mov	w6, #0x1                ; =1
    6224:      	sxtw	x2, w2
    6228:      	sxtw	x6, w6
    622c:      	cmp	x2, x6
    6230:      	b.ne	0x6464 <_stogir.floating.validate+0x4d4>
    6234:      	add	x16, sp, #0x10
    6238:      	ldr	w2, [x16, #0x4]
    623c:      	sxtw	x2, w2
    6240:      	cmp	x2, #0x0
    6244:      	cset	w6, gt
    6248:      	movz	x16, #0x0, lsl #48
    624c:      	sub	x7, x16, x2
    6250:      	sub	x9, x7, #0x1
    6254:      	uxtb	w16, w6
    6258:      	cmp	w16, wzr
    625c:      	b.eq	0x62b4 <_stogir.floating.validate+0x324>
    6260:      	ldr	x7, [x0, #0x8]
    6264:      	cmp	x2, x7
    6268:      	b.ge	0x62fc <_stogir.floating.validate+0x36c>
    626c:      	add	x7, x0, #0x78
    6270:      	ldr	x7, [x7, #0x8]
    6274:      	cmp	x2, x7
    6278:      	b.ge	0x63cc <_stogir.floating.validate+0x43c>
    627c:      	ldr	x7, [x0, #0x78]
    6280:      	add	x7, x7, x2, lsl #2
    6284:      	ldr	w7, [x7]
    6288:      	sxtw	x7, w7
    628c:      	cmp	x7, #0x0
    6290:      	cset	w7, ge
    6294:      	ubfx	x7, x7, #0, #8
    6298:      	b	0x63d0 <_stogir.floating.validate+0x440>
    629c:      	adrp	x16, 0x6000 <_stogir.floating.validate+0x70>
		000000000000629c:  ARM64_RELOC_PAGE21	l_stogir.412
    62a0:      	ldr	x16, [x16]
		00000000000062a0:  ARM64_RELOC_PAGEOFF12	l_stogir.412
    62a4:      	orr	x0, x16, xzr
    62a8:      	mov	x1, #0x1                ; =1
    62ac:      	mov	x2, #0x1d               ; =29
    62b0:      	b	0x6148 <_stogir.floating.validate+0x1b8>
    62b4:      	cmp	x2, #0x0
    62b8:      	b.ge	0x6304 <_stogir.floating.validate+0x374>
    62bc:      	add	x10, x0, #0x28
    62c0:      	add	x11, x0, #0x50
    62c4:      	ldr	x10, [x10, #0x8]
    62c8:      	ldr	x11, [x11, #0x8]
    62cc:      	cmp	x10, x11
    62d0:      	b.ne	0x63c4 <_stogir.floating.validate+0x434>
    62d4:      	cmp	x7, x10
    62d8:      	b.gt	0x644c <_stogir.floating.validate+0x4bc>
    62dc:      	ldr	x7, [x0, #0x50]
    62e0:      	add	x7, x7, x9, lsl #2
    62e4:      	ldr	w7, [x7]
    62e8:      	sxtw	x7, w7
    62ec:      	cmp	x7, #0x0
    62f0:      	cset	w7, gt
    62f4:      	ubfx	x7, x7, #0, #8
    62f8:      	b	0x6450 <_stogir.floating.validate+0x4c0>
    62fc:      	movz	x7, #0x0, lsl #48
    6300:      	b	0x6308 <_stogir.floating.validate+0x378>
    6304:      	movz	x7, #0x0, lsl #48
    6308:      	cmp	x7, #0x0
    630c:      	b.eq	0x6340 <_stogir.floating.validate+0x3b0>
    6310:      	uxtb	w16, w6
    6314:      	cmp	w16, wzr
    6318:      	b.eq	0x632c <_stogir.floating.validate+0x39c>
    631c:      	ldr	x6, [x0]
    6320:      	add	x2, x6, x2, lsl #4
    6324:      	ldr	x2, [x2]
    6328:      	b	0x6338 <_stogir.floating.validate+0x3a8>
    632c:      	ldr	x2, [x0, #0x28]
    6330:      	add	x2, x2, x9, lsl #4
    6334:      	ldr	x2, [x2]
    6338:      	mov	w6, #0x1                ; =1
    633c:      	b	0x6348 <_stogir.floating.validate+0x3b8>
    6340:      	movz	w6, #0x0, lsl #16
    6344:      	movz	x2, #0x0, lsl #48
    6348:      	ubfx	x6, x6, #0, #32
    634c:      	lsr	x16, x6, #0
    6350:      	cmp	x16, #0x1
    6354:      	b.eq	0x6370 <_stogir.floating.validate+0x3e0>
    6358:      	b.lo	0x6360 <_stogir.floating.validate+0x3d0>
    635c:      	b	0x6374 <_stogir.floating.validate+0x3e4>
    6360:      	cmp	x16, #0x0
    6364:      	b.eq	0x636c <_stogir.floating.validate+0x3dc>
    6368:      	b	0x6374 <_stogir.floating.validate+0x3e4>
    636c:      	b	0x6378 <_stogir.floating.validate+0x3e8>
    6370:      	b	0x6394 <_stogir.floating.validate+0x404>
    6374:      	b	0x645c <_stogir.floating.validate+0x4cc>
    6378:      	adrp	x16, 0x6000 <_stogir.floating.validate+0x70>
		0000000000006378:  ARM64_RELOC_PAGE21	l_stogir.413
    637c:      	ldr	x16, [x16]
		000000000000637c:  ARM64_RELOC_PAGEOFF12	l_stogir.413
    6380:      	orr	x0, x16, xzr
    6384:      	mov	x19, x8
    6388:      	mov	x1, #0x1                ; =1
    638c:      	mov	x2, #0x18               ; =24
    6390:      	b	0x62b0 <_stogir.floating.validate+0x320>
    6394:      	add	x16, sp, #0x10
    6398:      	ldr	w6, [x16]
    639c:      	ubfx	x2, x2, #0, #32
    63a0:      	ubfx	x2, x2, #8, #8
    63a4:      	uxtb	w16, w3
    63a8:      	cmp	w16, wzr
    63ac:      	b.eq	0x6410 <_stogir.floating.validate+0x480>
    63b0:      	uxtb	w16, w5
    63b4:      	cmp	w16, wzr
    63b8:      	b.eq	0x6410 <_stogir.floating.validate+0x480>
    63bc:      	mov	w3, #0x1                ; =1
    63c0:      	b	0x6414 <_stogir.floating.validate+0x484>
    63c4:      	movz	x7, #0x0, lsl #48
    63c8:      	b	0x6308 <_stogir.floating.validate+0x378>
    63cc:      	movz	x7, #0x0, lsl #48
    63d0:      	b	0x6300 <_stogir.floating.validate+0x370>
    63d4:      	movz	w1, #0x0, lsl #16
    63d8:      	mov	x19, x8
    63dc:      	add	x8, sp, #0x20
    63e0:      	fmov	s31, w1
    63e4:      	mov	w1, w4
    63e8:      	mov	w4, w5
    63ec:      	fmov	w5, s31
    63f0:      	bl	0x63f0 <_stogir.floating.validate+0x460>
		00000000000063f0:  ARM64_RELOC_BRANCH26	_stogir.floating.operands
    63f4:      	add	x16, sp, #0x20
    63f8:      	ldr	x1, [x16]
    63fc:      	add	x16, sp, #0x20
    6400:      	ldr	x0, [x16, #0x8]
    6404:      	add	x16, sp, #0x20
    6408:      	ldr	x2, [x16, #0x10]
    640c:      	b	0x62b0 <_stogir.floating.validate+0x320>
    6410:      	orr	x3, x2, xzr
    6414:      	sxtw	x3, w3
    6418:      	ubfx	x5, x6, #8, #8
    641c:      	cmp	x5, x3
    6420:      	b.ne	0x646c <_stogir.floating.validate+0x4dc>
    6424:      	add	x16, sp, #0x10
    6428:      	ldr	w3, [x16, #0x4]
    642c:      	add	x16, sp, #0x10
    6430:      	ldr	w5, [x16, #0x8]
    6434:      	uxtb	w16, w1
    6438:      	cmp	w16, wzr
    643c:      	b.eq	0x63d4 <_stogir.floating.validate+0x444>
    6440:      	add	x16, sp, #0x10
    6444:      	ldr	w1, [x16, #0xc]
    6448:      	b	0x63d8 <_stogir.floating.validate+0x448>
    644c:      	movz	x7, #0x0, lsl #48
    6450:      	b	0x63c8 <_stogir.floating.validate+0x438>
    6454:      	brk	#0
    6458:      	b	0x6454 <_stogir.floating.validate+0x4c4>
    645c:      	brk	#0
    6460:      	b	0x645c <_stogir.floating.validate+0x4cc>
    6464:      	mov	x19, x8
    6468:      	b	0x6134 <_stogir.floating.validate+0x1a4>
    646c:      	mov	x19, x8
    6470:      	b	0x629c <_stogir.floating.validate+0x30c>

0000000000006474 <_stogir.integer-unary.valid-type?>:
    6474:      	sxtw	x0, w0
    6478:      	cmp	x0, #0x2d
    647c:      	cset	w2, eq
    6480:      	cmp	x0, #0x1f
    6484:      	cset	w3, eq
    6488:      	cmp	x0, #0x20
    648c:      	cset	w4, eq
    6490:      	cmp	x0, #0x36
    6494:      	cset	w5, eq
    6498:      	uxtb	w16, w3
    649c:      	cmp	w16, wzr
    64a0:      	b.ne	0x64e8 <_stogir.integer-unary.valid-type?+0x74>
    64a4:      	uxtb	w16, w4
    64a8:      	cmp	w16, wzr
    64ac:      	b.ne	0x64e8 <_stogir.integer-unary.valid-type?+0x74>
    64b0:      	uxtb	w16, w2
    64b4:      	cmp	w16, wzr
    64b8:      	b.ne	0x64e8 <_stogir.integer-unary.valid-type?+0x74>
    64bc:      	uxtb	w16, w5
    64c0:      	cmp	w16, wzr
    64c4:      	b.ne	0x64e8 <_stogir.integer-unary.valid-type?+0x74>
    64c8:      	cmp	x0, #0x37
    64cc:      	b.eq	0x64e8 <_stogir.integer-unary.valid-type?+0x74>
    64d0:      	cmp	x0, #0x38
    64d4:      	b.eq	0x64e8 <_stogir.integer-unary.valid-type?+0x74>
    64d8:      	cmp	x0, #0x39
    64dc:      	b.eq	0x64e8 <_stogir.integer-unary.valid-type?+0x74>
    64e0:      	movz	x0, #0x0, lsl #48
    64e4:      	b	0x6520 <_stogir.integer-unary.valid-type?+0xac>
    64e8:      	sxtw	x1, w1
    64ec:      	cmp	x1, #0x1
    64f0:      	b.lt	0x651c <_stogir.integer-unary.valid-type?+0xa8>
    64f4:      	cmp	x1, #0xb
    64f8:      	cset	w0, le
    64fc:      	uxtb	w16, w0
    6500:      	cmp	w16, wzr
    6504:      	b.eq	0x651c <_stogir.integer-unary.valid-type?+0xa8>
    6508:      	uxtb	w16, w2
    650c:      	cmp	w16, wzr
    6510:      	b.eq	0x652c <_stogir.integer-unary.valid-type?+0xb8>
    6514:      	mov	x0, #0x1                ; =1
    6518:      	b	0x6528 <_stogir.integer-unary.valid-type?+0xb4>
    651c:      	movz	x0, #0x0, lsl #48
    6520:      	ret
    6524:      	mov	x0, #0x1                ; =1
    6528:      	b	0x6520 <_stogir.integer-unary.valid-type?+0xac>
    652c:      	cmp	x1, #0x1
    6530:      	b.ne	0x653c <_stogir.integer-unary.valid-type?+0xc8>
    6534:      	movz	x0, #0x0, lsl #48
    6538:      	b	0x6528 <_stogir.integer-unary.valid-type?+0xb4>
    653c:      	cmp	x1, #0x6
    6540:      	cset	w2, eq
    6544:      	uxtb	w16, w3
    6548:      	cmp	w16, wzr
    654c:      	b.eq	0x6560 <_stogir.integer-unary.valid-type?+0xec>
    6550:      	uxtb	w16, w2
    6554:      	cmp	w16, wzr
    6558:      	cset	x0, eq
    655c:      	b	0x6528 <_stogir.integer-unary.valid-type?+0xb4>
    6560:      	uxtb	w16, w4
    6564:      	cmp	w16, wzr
    6568:      	b.eq	0x6584 <_stogir.integer-unary.valid-type?+0x110>
    656c:      	cmp	x1, #0x7
    6570:      	b.lt	0x657c <_stogir.integer-unary.valid-type?+0x108>
    6574:      	ubfx	x0, x0, #0, #8
    6578:      	b	0x6580 <_stogir.integer-unary.valid-type?+0x10c>
    657c:      	movz	x0, #0x0, lsl #48
    6580:      	b	0x6528 <_stogir.integer-unary.valid-type?+0xb4>
    6584:      	uxtb	w16, w5
    6588:      	cmp	w16, wzr
    658c:      	b.eq	0x6524 <_stogir.integer-unary.valid-type?+0xb0>
    6590:      	cmp	x1, #0x3
    6594:      	b.ne	0x65b0 <_stogir.integer-unary.valid-type?+0x13c>
    6598:      	mov	x0, #0x1                ; =1
    659c:      	b	0x65ac <_stogir.integer-unary.valid-type?+0x138>
    65a0:      	cmp	x1, #0xb
    65a4:      	cset	w0, eq
    65a8:      	ubfx	x0, x0, #0, #8
    65ac:      	b	0x6528 <_stogir.integer-unary.valid-type?+0xb4>
    65b0:      	cmp	x1, #0x4
    65b4:      	b.ne	0x65c0 <_stogir.integer-unary.valid-type?+0x14c>
    65b8:      	mov	x0, #0x1                ; =1
    65bc:      	b	0x65ac <_stogir.integer-unary.valid-type?+0x138>
    65c0:      	cmp	x1, #0x5
    65c4:      	b.ne	0x65d0 <_stogir.integer-unary.valid-type?+0x15c>
    65c8:      	mov	x0, #0x1                ; =1
    65cc:      	b	0x65ac <_stogir.integer-unary.valid-type?+0x138>
    65d0:      	uxtb	w16, w2
    65d4:      	cmp	w16, wzr
    65d8:      	b.eq	0x65e4 <_stogir.integer-unary.valid-type?+0x170>
    65dc:      	mov	x0, #0x1                ; =1
    65e0:      	b	0x65ac <_stogir.integer-unary.valid-type?+0x138>
    65e4:      	cmp	x1, #0x9
    65e8:      	b.ne	0x65f4 <_stogir.integer-unary.valid-type?+0x180>
    65ec:      	mov	x0, #0x1                ; =1
    65f0:      	b	0x65ac <_stogir.integer-unary.valid-type?+0x138>
    65f4:      	cmp	x1, #0xa
    65f8:      	b.ne	0x65a0 <_stogir.integer-unary.valid-type?+0x12c>
    65fc:      	mov	x0, #0x1                ; =1
    6600:      	b	0x65ac <_stogir.integer-unary.valid-type?+0x138>

0000000000006604 <_stogir.types.vector?>:
    6604:      	sxtw	x1, w0
    6608:      	cmp	x1, #0xf
    660c:      	b.le	0x6638 <_stogir.types.vector?+0x34>
    6610:      	cmp	x1, #0x80
    6614:      	b.ge	0x6648 <_stogir.types.vector?+0x44>
    6618:      	and	w0, w0, #0xf
    661c:      	ubfx	x0, x0, #0, #32
    6620:      	cmp	x0, #0x1
    6624:      	b.lt	0x6640 <_stogir.types.vector?+0x3c>
    6628:      	cmp	x0, #0xd
    662c:      	cset	w0, le
    6630:      	ubfx	x0, x0, #0, #8
    6634:      	b	0x6644 <_stogir.types.vector?+0x40>
    6638:      	movz	x0, #0x0, lsl #48
    663c:      	b	0x6644 <_stogir.types.vector?+0x40>
    6640:      	movz	x0, #0x0, lsl #48
    6644:      	ret
    6648:      	movz	x0, #0x0, lsl #48
    664c:      	b	0x6644 <_stogir.types.vector?+0x40>

0000000000006650 <_stogir.floating.operation?>:
    6650:      	sxtw	x0, w0
    6654:      	cmp	x0, #0xe
    6658:      	b.lt	0x666c <_stogir.floating.operation?+0x1c>
    665c:      	cmp	x0, #0x19
    6660:      	b.gt	0x666c <_stogir.floating.operation?+0x1c>
    6664:      	mov	x0, #0x1                ; =1
    6668:      	b	0x6698 <_stogir.floating.operation?+0x48>
    666c:      	cmp	x0, #0x1f
    6670:      	b.eq	0x6694 <_stogir.floating.operation?+0x44>
    6674:      	cmp	x0, #0x20
    6678:      	b.eq	0x6694 <_stogir.floating.operation?+0x44>
    667c:      	cmp	x0, #0x1a
    6680:      	b.lt	0x66ac <_stogir.floating.operation?+0x5c>
    6684:      	cmp	x0, #0x1d
    6688:      	b.gt	0x66ac <_stogir.floating.operation?+0x5c>
    668c:      	mov	x0, #0x1                ; =1
    6690:      	b	0x66a8 <_stogir.floating.operation?+0x58>
    6694:      	mov	x0, #0x1                ; =1
    6698:      	ret
    669c:      	cmp	x0, #0x3b
    66a0:      	cset	w0, eq
    66a4:      	ubfx	x0, x0, #0, #8
    66a8:      	b	0x6698 <_stogir.floating.operation?+0x48>
    66ac:      	cmp	x0, #0x3a
    66b0:      	b.ne	0x669c <_stogir.floating.operation?+0x4c>
    66b4:      	mov	x0, #0x1                ; =1
    66b8:      	b	0x66a8 <_stogir.floating.operation?+0x58>

00000000000066bc <_stogir.vector-lanes.validate>:
    66bc:      	sub	sp, sp, #0x50
    66c0:      	str	x29, [sp]
    66c4:      	str	x30, [sp, #0x8]
    66c8:      	mov	x29, sp
    66cc:      	str	x19, [sp, #0x40]
    66d0:      	sxtw	x1, w1
    66d4:      	lsl	x3, x1, #2
    66d8:      	cmp	x1, #0x0
    66dc:      	cset	w4, gt
    66e0:      	movz	x16, #0x0, lsl #48
    66e4:      	sub	x5, x16, x1
    66e8:      	sub	x6, x5, #0x1
    66ec:      	uxtb	w16, w4
    66f0:      	cmp	w16, wzr
    66f4:      	b.eq	0x6734 <_stogir.vector-lanes.validate+0x78>
    66f8:      	ldr	x5, [x0, #0x8]
    66fc:      	cmp	x1, x5
    6700:      	b.ge	0x6784 <_stogir.vector-lanes.validate+0xc8>
    6704:      	add	x5, x0, #0x78
    6708:      	ldr	x5, [x5, #0x8]
    670c:      	cmp	x1, x5
    6710:      	b.ge	0x6878 <_stogir.vector-lanes.validate+0x1bc>
    6714:      	ldr	x5, [x0, #0x78]
    6718:      	add	x5, x3, x5
    671c:      	ldr	w5, [x5]
    6720:      	sxtw	x5, w5
    6724:      	cmp	x5, #0x0
    6728:      	cset	w5, ge
    672c:      	ubfx	x5, x5, #0, #8
    6730:      	b	0x687c <_stogir.vector-lanes.validate+0x1c0>
    6734:      	cmp	x1, #0x0
    6738:      	b.ge	0x678c <_stogir.vector-lanes.validate+0xd0>
    673c:      	add	x7, x0, #0x28
    6740:      	add	x9, x0, #0x50
    6744:      	ldr	x7, [x7, #0x8]
    6748:      	ldr	x9, [x9, #0x8]
    674c:      	cmp	x7, x9
    6750:      	b.ne	0x677c <_stogir.vector-lanes.validate+0xc0>
    6754:      	cmp	x5, x7
    6758:      	b.gt	0x68bc <_stogir.vector-lanes.validate+0x200>
    675c:      	ldr	x5, [x0, #0x50]
    6760:      	add	x5, x5, x6, lsl #2
    6764:      	ldr	w5, [x5]
    6768:      	sxtw	x5, w5
    676c:      	cmp	x5, #0x0
    6770:      	cset	w5, gt
    6774:      	ubfx	x5, x5, #0, #8
    6778:      	b	0x68c0 <_stogir.vector-lanes.validate+0x204>
    677c:      	movz	x5, #0x0, lsl #48
    6780:      	b	0x6790 <_stogir.vector-lanes.validate+0xd4>
    6784:      	movz	x5, #0x0, lsl #48
    6788:      	b	0x6790 <_stogir.vector-lanes.validate+0xd4>
    678c:      	movz	x5, #0x0, lsl #48
    6790:      	cmp	x5, #0x0
    6794:      	b.eq	0x67d0 <_stogir.vector-lanes.validate+0x114>
    6798:      	uxtb	w16, w4
    679c:      	cmp	w16, wzr
    67a0:      	b.eq	0x67b8 <_stogir.vector-lanes.validate+0xfc>
    67a4:      	ldr	x4, [x0]
    67a8:      	add	x4, x4, x1, lsl #4
    67ac:      	ldr	x5, [x4]
    67b0:      	ldr	x4, [x4, #0x8]
    67b4:      	b	0x67c8 <_stogir.vector-lanes.validate+0x10c>
    67b8:      	ldr	x4, [x0, #0x28]
    67bc:      	add	x4, x4, x6, lsl #4
    67c0:      	ldr	x5, [x4]
    67c4:      	ldr	x4, [x4, #0x8]
    67c8:      	mov	w6, #0x1                ; =1
    67cc:      	b	0x67dc <_stogir.vector-lanes.validate+0x120>
    67d0:      	movz	w6, #0x0, lsl #16
    67d4:      	movz	x5, #0x0, lsl #48
    67d8:      	movz	x4, #0x0, lsl #48
    67dc:      	ubfx	x6, x6, #0, #32
    67e0:      	lsr	x16, x6, #0
    67e4:      	cmp	x16, #0x1
    67e8:      	b.eq	0x6804 <_stogir.vector-lanes.validate+0x148>
    67ec:      	b.lo	0x67f4 <_stogir.vector-lanes.validate+0x138>
    67f0:      	b	0x6808 <_stogir.vector-lanes.validate+0x14c>
    67f4:      	cmp	x16, #0x0
    67f8:      	b.eq	0x6800 <_stogir.vector-lanes.validate+0x144>
    67fc:      	b	0x6808 <_stogir.vector-lanes.validate+0x14c>
    6800:      	b	0x680c <_stogir.vector-lanes.validate+0x150>
    6804:      	b	0x6828 <_stogir.vector-lanes.validate+0x16c>
    6808:      	b	0x697c <_stogir.vector-lanes.validate+0x2c0>
    680c:      	adrp	x16, 0x6000 <_stogir.floating.validate+0x70>
		000000000000680c:  ARM64_RELOC_PAGE21	l_stogir.414
    6810:      	ldr	x16, [x16]
		0000000000006810:  ARM64_RELOC_PAGEOFF12	l_stogir.414
    6814:      	orr	x0, x16, xzr
    6818:      	mov	x19, x8
    681c:      	mov	x1, #0x1                ; =1
    6820:      	mov	x2, #0x1f               ; =31
    6824:      	b	0x6858 <_stogir.vector-lanes.validate+0x19c>
    6828:      	add	x16, sp, #0x10
    682c:      	str	x5, [x16]
    6830:      	add	x16, sp, #0x10
    6834:      	str	x4, [x16, #0x8]
    6838:      	cmp	x1, #0x0
    683c:      	b.gt	0x6880 <_stogir.vector-lanes.validate+0x1c4>
    6840:      	mov	x19, x8
    6844:      	adrp	x16, 0x6000 <_stogir.floating.validate+0x70>
		0000000000006844:  ARM64_RELOC_PAGE21	l_stogir.415
    6848:      	ldr	x16, [x16]
		0000000000006848:  ARM64_RELOC_PAGEOFF12	l_stogir.415
    684c:      	orr	x0, x16, xzr
    6850:      	mov	x1, #0x1                ; =1
    6854:      	mov	x2, #0x25               ; =37
    6858:      	str	x1, [x19]
    685c:      	str	x0, [x19, #0x8]
    6860:      	str	x2, [x19, #0x10]
    6864:      	ldr	x19, [sp, #0x40]
    6868:      	ldr	x29, [sp]
    686c:      	ldr	x30, [sp, #0x8]
    6870:      	add	sp, sp, #0x50
    6874:      	ret
    6878:      	movz	x5, #0x0, lsl #48
    687c:      	b	0x6788 <_stogir.vector-lanes.validate+0xcc>
    6880:      	uxtb	w5, w5
    6884:      	orr	x1, x5, xzr
    6888:      	cmp	x1, #0x3d
    688c:      	b.lt	0x6984 <_stogir.vector-lanes.validate+0x2c8>
    6890:      	cmp	x1, #0x3f
    6894:      	b.gt	0x698c <_stogir.vector-lanes.validate+0x2d0>
    6898:      	cmp	x1, #0x3e
    689c:      	cset	w4, eq
    68a0:      	ldr	x6, [x0, #0x78]
    68a4:      	add	x3, x3, x6
    68a8:      	ldr	w3, [x3]
    68ac:      	cmp	x1, #0x3d
    68b0:      	b.ne	0x6918 <_stogir.vector-lanes.validate+0x25c>
    68b4:      	mov	w6, #0x2                ; =2
    68b8:      	b	0x692c <_stogir.vector-lanes.validate+0x270>
    68bc:      	movz	x5, #0x0, lsl #48
    68c0:      	b	0x6780 <_stogir.vector-lanes.validate+0xc4>
    68c4:      	movz	w4, #0x0, lsl #16
    68c8:      	ubfx	x3, x3, #8, #8
    68cc:      	mov	x19, x8
    68d0:      	add	x8, sp, #0x20
    68d4:      	fmov	s31, w1
    68d8:      	mov	w1, w5
    68dc:      	fmov	w5, s31
    68e0:      	fmov	s31, w2
    68e4:      	mov	w2, w3
    68e8:      	fmov	w3, s31
    68ec:      	fmov	s31, w4
    68f0:      	mov	w4, w6
    68f4:      	fmov	w6, s31
    68f8:      	bl	0x68f8 <_stogir.vector-lanes.validate+0x23c>
		00000000000068f8:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.operands
    68fc:      	add	x16, sp, #0x20
    6900:      	ldr	x1, [x16]
    6904:      	add	x16, sp, #0x20
    6908:      	ldr	x0, [x16, #0x8]
    690c:      	add	x16, sp, #0x20
    6910:      	ldr	x2, [x16, #0x10]
    6914:      	b	0x6858 <_stogir.vector-lanes.validate+0x19c>
    6918:      	uxtb	w16, w4
    691c:      	cmp	w16, wzr
    6920:      	mov	w16, #0x3               ; =3
    6924:      	mov	w17, #0x1               ; =1
    6928:      	csel	w6, w16, w17, ne
    692c:      	sxtw	x3, w3
    6930:      	sxtw	x6, w6
    6934:      	cmp	x3, x6
    6938:      	b.ne	0x6994 <_stogir.vector-lanes.validate+0x2d8>
    693c:      	add	x16, sp, #0x10
    6940:      	ldr	w3, [x16]
    6944:      	add	x16, sp, #0x10
    6948:      	ldr	w6, [x16, #0x4]
    694c:      	cmp	x1, #0x3f
    6950:      	b.ne	0x695c <_stogir.vector-lanes.validate+0x2a0>
    6954:      	movz	w1, #0x0, lsl #16
    6958:      	b	0x6964 <_stogir.vector-lanes.validate+0x2a8>
    695c:      	add	x16, sp, #0x10
    6960:      	ldr	w1, [x16, #0x8]
    6964:      	uxtb	w16, w4
    6968:      	cmp	w16, wzr
    696c:      	b.eq	0x68c4 <_stogir.vector-lanes.validate+0x208>
    6970:      	add	x16, sp, #0x10
    6974:      	ldr	w4, [x16, #0xc]
    6978:      	b	0x68c8 <_stogir.vector-lanes.validate+0x20c>
    697c:      	brk	#0
    6980:      	b	0x697c <_stogir.vector-lanes.validate+0x2c0>
    6984:      	mov	x19, x8
    6988:      	b	0x6844 <_stogir.vector-lanes.validate+0x188>
    698c:      	mov	x19, x8
    6990:      	b	0x6844 <_stogir.vector-lanes.validate+0x188>
    6994:      	mov	x19, x8
    6998:      	b	0x6844 <_stogir.vector-lanes.validate+0x188>

000000000000699c <_stogir.vector-comparison.node?>:
    699c:      	sxtw	x1, w1
    69a0:      	cmp	x1, #0x0
    69a4:      	cset	w2, gt
    69a8:      	movz	x16, #0x0, lsl #48
    69ac:      	sub	x3, x16, x1
    69b0:      	sub	x4, x3, #0x1
    69b4:      	uxtb	w16, w2
    69b8:      	cmp	w16, wzr
    69bc:      	b.eq	0x69fc <_stogir.vector-comparison.node?+0x60>
    69c0:      	ldr	x3, [x0, #0x8]
    69c4:      	cmp	x1, x3
    69c8:      	b.ge	0x6a4c <_stogir.vector-comparison.node?+0xb0>
    69cc:      	add	x3, x0, #0x78
    69d0:      	ldr	x3, [x3, #0x8]
    69d4:      	cmp	x1, x3
    69d8:      	b.ge	0x6b28 <_stogir.vector-comparison.node?+0x18c>
    69dc:      	ldr	x3, [x0, #0x78]
    69e0:      	add	x3, x3, x1, lsl #2
    69e4:      	ldr	w3, [x3]
    69e8:      	sxtw	x3, w3
    69ec:      	cmp	x3, #0x0
    69f0:      	cset	w3, ge
    69f4:      	ubfx	x3, x3, #0, #8
    69f8:      	b	0x6b2c <_stogir.vector-comparison.node?+0x190>
    69fc:      	cmp	x1, #0x0
    6a00:      	b.ge	0x6a54 <_stogir.vector-comparison.node?+0xb8>
    6a04:      	add	x5, x0, #0x28
    6a08:      	add	x6, x0, #0x50
    6a0c:      	ldr	x5, [x5, #0x8]
    6a10:      	ldr	x6, [x6, #0x8]
    6a14:      	cmp	x5, x6
    6a18:      	b.ne	0x6a44 <_stogir.vector-comparison.node?+0xa8>
    6a1c:      	cmp	x3, x5
    6a20:      	b.gt	0x6b30 <_stogir.vector-comparison.node?+0x194>
    6a24:      	ldr	x3, [x0, #0x50]
    6a28:      	add	x3, x3, x4, lsl #2
    6a2c:      	ldr	w3, [x3]
    6a30:      	sxtw	x3, w3
    6a34:      	cmp	x3, #0x0
    6a38:      	cset	w3, gt
    6a3c:      	ubfx	x3, x3, #0, #8
    6a40:      	b	0x6b34 <_stogir.vector-comparison.node?+0x198>
    6a44:      	movz	x3, #0x0, lsl #48
    6a48:      	b	0x6a58 <_stogir.vector-comparison.node?+0xbc>
    6a4c:      	movz	x3, #0x0, lsl #48
    6a50:      	b	0x6a58 <_stogir.vector-comparison.node?+0xbc>
    6a54:      	movz	x3, #0x0, lsl #48
    6a58:      	cmp	x3, #0x0
    6a5c:      	b.eq	0x6a90 <_stogir.vector-comparison.node?+0xf4>
    6a60:      	uxtb	w16, w2
    6a64:      	cmp	w16, wzr
    6a68:      	b.eq	0x6a7c <_stogir.vector-comparison.node?+0xe0>
    6a6c:      	ldr	x0, [x0]
    6a70:      	add	x0, x0, x1, lsl #4
    6a74:      	ldr	x0, [x0]
    6a78:      	b	0x6a88 <_stogir.vector-comparison.node?+0xec>
    6a7c:      	ldr	x0, [x0, #0x28]
    6a80:      	add	x0, x0, x4, lsl #4
    6a84:      	ldr	x0, [x0]
    6a88:      	mov	w1, #0x1                ; =1
    6a8c:      	b	0x6a98 <_stogir.vector-comparison.node?+0xfc>
    6a90:      	movz	w1, #0x0, lsl #16
    6a94:      	movz	x0, #0x0, lsl #48
    6a98:      	ubfx	x1, x1, #0, #32
    6a9c:      	lsr	x16, x1, #0
    6aa0:      	cmp	x16, #0x1
    6aa4:      	b.eq	0x6ac0 <_stogir.vector-comparison.node?+0x124>
    6aa8:      	b.lo	0x6ab0 <_stogir.vector-comparison.node?+0x114>
    6aac:      	b	0x6ac4 <_stogir.vector-comparison.node?+0x128>
    6ab0:      	cmp	x16, #0x0
    6ab4:      	b.eq	0x6abc <_stogir.vector-comparison.node?+0x120>
    6ab8:      	b	0x6ac4 <_stogir.vector-comparison.node?+0x128>
    6abc:      	b	0x6ac8 <_stogir.vector-comparison.node?+0x12c>
    6ac0:      	b	0x6ad8 <_stogir.vector-comparison.node?+0x13c>
    6ac4:      	b	0x6b50 <_stogir.vector-comparison.node?+0x1b4>
    6ac8:      	movz	x0, #0x0, lsl #48
    6acc:      	b	0x6ad4 <_stogir.vector-comparison.node?+0x138>
    6ad0:      	movz	x0, #0x0, lsl #48
    6ad4:      	ret
    6ad8:      	uxtb	w1, w0
    6adc:      	cmp	x1, #0xe
    6ae0:      	b.lt	0x6ad0 <_stogir.vector-comparison.node?+0x134>
    6ae4:      	cmp	x1, #0x19
    6ae8:      	b.gt	0x6ad0 <_stogir.vector-comparison.node?+0x134>
    6aec:      	ubfx	x0, x0, #0, #32
    6af0:      	ubfx	x0, x0, #8, #8
    6af4:      	orr	x1, x0, xzr
    6af8:      	cmp	x1, #0xf
    6afc:      	b.le	0x6b38 <_stogir.vector-comparison.node?+0x19c>
    6b00:      	cmp	x1, #0x80
    6b04:      	b.ge	0x6b40 <_stogir.vector-comparison.node?+0x1a4>
    6b08:      	and	w0, w0, #0xf
    6b0c:      	ubfx	x0, x0, #0, #32
    6b10:      	cmp	x0, #0x1
    6b14:      	b.lt	0x6b48 <_stogir.vector-comparison.node?+0x1ac>
    6b18:      	cmp	x0, #0xd
    6b1c:      	cset	w0, le
    6b20:      	ubfx	x0, x0, #0, #8
    6b24:      	b	0x6b4c <_stogir.vector-comparison.node?+0x1b0>
    6b28:      	movz	x3, #0x0, lsl #48
    6b2c:      	b	0x6a50 <_stogir.vector-comparison.node?+0xb4>
    6b30:      	movz	x3, #0x0, lsl #48
    6b34:      	b	0x6a48 <_stogir.vector-comparison.node?+0xac>
    6b38:      	movz	x0, #0x0, lsl #48
    6b3c:      	b	0x6ad4 <_stogir.vector-comparison.node?+0x138>
    6b40:      	movz	x0, #0x0, lsl #48
    6b44:      	b	0x6b3c <_stogir.vector-comparison.node?+0x1a0>
    6b48:      	movz	x0, #0x0, lsl #48
    6b4c:      	b	0x6b44 <_stogir.vector-comparison.node?+0x1a8>
    6b50:      	brk	#0
    6b54:      	b	0x6b50 <_stogir.vector-comparison.node?+0x1b4>

0000000000006b58 <_stogir.vector-comparison.validate>:
    6b58:      	sub	sp, sp, #0x50
    6b5c:      	str	x29, [sp]
    6b60:      	str	x30, [sp, #0x8]
    6b64:      	mov	x29, sp
    6b68:      	str	x19, [sp, #0x40]
    6b6c:      	sxtw	x1, w1
    6b70:      	lsl	x3, x1, #2
    6b74:      	cmp	x1, #0x0
    6b78:      	cset	w4, gt
    6b7c:      	movz	x16, #0x0, lsl #48
    6b80:      	sub	x5, x16, x1
    6b84:      	sub	x6, x5, #0x1
    6b88:      	uxtb	w16, w4
    6b8c:      	cmp	w16, wzr
    6b90:      	b.eq	0x6bd0 <_stogir.vector-comparison.validate+0x78>
    6b94:      	ldr	x5, [x0, #0x8]
    6b98:      	cmp	x1, x5
    6b9c:      	b.ge	0x6c20 <_stogir.vector-comparison.validate+0xc8>
    6ba0:      	add	x5, x0, #0x78
    6ba4:      	ldr	x5, [x5, #0x8]
    6ba8:      	cmp	x1, x5
    6bac:      	b.ge	0x6d18 <_stogir.vector-comparison.validate+0x1c0>
    6bb0:      	ldr	x5, [x0, #0x78]
    6bb4:      	add	x5, x3, x5
    6bb8:      	ldr	w5, [x5]
    6bbc:      	sxtw	x5, w5
    6bc0:      	cmp	x5, #0x0
    6bc4:      	cset	w5, ge
    6bc8:      	ubfx	x5, x5, #0, #8
    6bcc:      	b	0x6d1c <_stogir.vector-comparison.validate+0x1c4>
    6bd0:      	cmp	x1, #0x0
    6bd4:      	b.ge	0x6c28 <_stogir.vector-comparison.validate+0xd0>
    6bd8:      	add	x7, x0, #0x28
    6bdc:      	add	x9, x0, #0x50
    6be0:      	ldr	x7, [x7, #0x8]
    6be4:      	ldr	x9, [x9, #0x8]
    6be8:      	cmp	x7, x9
    6bec:      	b.ne	0x6c18 <_stogir.vector-comparison.validate+0xc0>
    6bf0:      	cmp	x5, x7
    6bf4:      	b.gt	0x6d68 <_stogir.vector-comparison.validate+0x210>
    6bf8:      	ldr	x5, [x0, #0x50]
    6bfc:      	add	x5, x5, x6, lsl #2
    6c00:      	ldr	w5, [x5]
    6c04:      	sxtw	x5, w5
    6c08:      	cmp	x5, #0x0
    6c0c:      	cset	w5, gt
    6c10:      	ubfx	x5, x5, #0, #8
    6c14:      	b	0x6d6c <_stogir.vector-comparison.validate+0x214>
    6c18:      	movz	x5, #0x0, lsl #48
    6c1c:      	b	0x6c2c <_stogir.vector-comparison.validate+0xd4>
    6c20:      	movz	x5, #0x0, lsl #48
    6c24:      	b	0x6c2c <_stogir.vector-comparison.validate+0xd4>
    6c28:      	movz	x5, #0x0, lsl #48
    6c2c:      	lsl	x7, x1, #4
    6c30:      	cmp	x5, #0x0
    6c34:      	b.eq	0x6c70 <_stogir.vector-comparison.validate+0x118>
    6c38:      	uxtb	w16, w4
    6c3c:      	cmp	w16, wzr
    6c40:      	b.eq	0x6c58 <_stogir.vector-comparison.validate+0x100>
    6c44:      	ldr	x4, [x0]
    6c48:      	add	x4, x7, x4
    6c4c:      	ldr	x5, [x4]
    6c50:      	ldr	x4, [x4, #0x8]
    6c54:      	b	0x6c68 <_stogir.vector-comparison.validate+0x110>
    6c58:      	ldr	x4, [x0, #0x28]
    6c5c:      	add	x4, x4, x6, lsl #4
    6c60:      	ldr	x5, [x4]
    6c64:      	ldr	x4, [x4, #0x8]
    6c68:      	mov	w6, #0x1                ; =1
    6c6c:      	b	0x6c7c <_stogir.vector-comparison.validate+0x124>
    6c70:      	movz	w6, #0x0, lsl #16
    6c74:      	movz	x5, #0x0, lsl #48
    6c78:      	movz	x4, #0x0, lsl #48
    6c7c:      	ubfx	x6, x6, #0, #32
    6c80:      	lsr	x16, x6, #0
    6c84:      	cmp	x16, #0x1
    6c88:      	b.eq	0x6ca4 <_stogir.vector-comparison.validate+0x14c>
    6c8c:      	b.lo	0x6c94 <_stogir.vector-comparison.validate+0x13c>
    6c90:      	b	0x6ca8 <_stogir.vector-comparison.validate+0x150>
    6c94:      	cmp	x16, #0x0
    6c98:      	b.eq	0x6ca0 <_stogir.vector-comparison.validate+0x148>
    6c9c:      	b	0x6ca8 <_stogir.vector-comparison.validate+0x150>
    6ca0:      	b	0x6cac <_stogir.vector-comparison.validate+0x154>
    6ca4:      	b	0x6ce4 <_stogir.vector-comparison.validate+0x18c>
    6ca8:      	b	0x6e68 <_stogir.vector-comparison.validate+0x310>
    6cac:      	adrp	x16, 0x6000 <_stogir.floating.validate+0x70>
		0000000000006cac:  ARM64_RELOC_PAGE21	l_stogir.416
    6cb0:      	ldr	x16, [x16]
		0000000000006cb0:  ARM64_RELOC_PAGEOFF12	l_stogir.416
    6cb4:      	orr	x0, x16, xzr
    6cb8:      	mov	x19, x8
    6cbc:      	mov	x1, #0x1                ; =1
    6cc0:      	mov	x2, #0x25               ; =37
    6cc4:      	str	x1, [x19]
    6cc8:      	str	x0, [x19, #0x8]
    6ccc:      	str	x2, [x19, #0x10]
    6cd0:      	ldr	x19, [sp, #0x40]
    6cd4:      	ldr	x29, [sp]
    6cd8:      	ldr	x30, [sp, #0x8]
    6cdc:      	add	sp, sp, #0x50
    6ce0:      	ret
    6ce4:      	add	x16, sp, #0x10
    6ce8:      	str	x5, [x16]
    6cec:      	add	x16, sp, #0x10
    6cf0:      	str	x4, [x16, #0x8]
    6cf4:      	cmp	x1, #0x0
    6cf8:      	b.gt	0x6d20 <_stogir.vector-comparison.validate+0x1c8>
    6cfc:      	mov	x19, x8
    6d00:      	adrp	x16, 0x6000 <_stogir.floating.validate+0x70>
		0000000000006d00:  ARM64_RELOC_PAGE21	l_stogir.417
    6d04:      	ldr	x16, [x16]
		0000000000006d04:  ARM64_RELOC_PAGEOFF12	l_stogir.417
    6d08:      	orr	x0, x16, xzr
    6d0c:      	mov	x1, #0x1                ; =1
    6d10:      	mov	x2, #0x2b               ; =43
    6d14:      	b	0x6cc4 <_stogir.vector-comparison.validate+0x16c>
    6d18:      	movz	x5, #0x0, lsl #48
    6d1c:      	b	0x6c24 <_stogir.vector-comparison.validate+0xcc>
    6d20:      	ldr	x4, [x0, #0x8]
    6d24:      	cmp	x1, x4
    6d28:      	b.ge	0x6d70 <_stogir.vector-comparison.validate+0x218>
    6d2c:      	add	x4, x0, #0x78
    6d30:      	ldr	x4, [x4, #0x8]
    6d34:      	cmp	x1, x4
    6d38:      	b.ge	0x6d70 <_stogir.vector-comparison.validate+0x218>
    6d3c:      	ldr	x1, [x0, #0x78]
    6d40:      	add	x1, x3, x1
    6d44:      	ldr	w1, [x1]
    6d48:      	sxtw	x1, w1
    6d4c:      	cmp	x1, #0x0
    6d50:      	b.lt	0x6d70 <_stogir.vector-comparison.validate+0x218>
    6d54:      	ldr	x1, [x0]
    6d58:      	add	x1, x7, x1
    6d5c:      	ldr	x1, [x1]
    6d60:      	mov	w4, #0x1                ; =1
    6d64:      	b	0x6d78 <_stogir.vector-comparison.validate+0x220>
    6d68:      	movz	x5, #0x0, lsl #48
    6d6c:      	b	0x6c1c <_stogir.vector-comparison.validate+0xc4>
    6d70:      	movz	w4, #0x0, lsl #16
    6d74:      	movz	x1, #0x0, lsl #48
    6d78:      	ubfx	x4, x4, #0, #32
    6d7c:      	lsr	x16, x4, #0
    6d80:      	cmp	x16, #0x1
    6d84:      	b.eq	0x6da0 <_stogir.vector-comparison.validate+0x248>
    6d88:      	b.lo	0x6d90 <_stogir.vector-comparison.validate+0x238>
    6d8c:      	b	0x6da4 <_stogir.vector-comparison.validate+0x24c>
    6d90:      	cmp	x16, #0x0
    6d94:      	b.eq	0x6d9c <_stogir.vector-comparison.validate+0x244>
    6d98:      	b	0x6da4 <_stogir.vector-comparison.validate+0x24c>
    6d9c:      	b	0x6da8 <_stogir.vector-comparison.validate+0x250>
    6da0:      	b	0x6db0 <_stogir.vector-comparison.validate+0x258>
    6da4:      	b	0x6e70 <_stogir.vector-comparison.validate+0x318>
    6da8:      	mov	x19, x8
    6dac:      	b	0x6d00 <_stogir.vector-comparison.validate+0x1a8>
    6db0:      	uxtb	w4, w1
    6db4:      	cmp	x4, #0xe
    6db8:      	b.lt	0x6e78 <_stogir.vector-comparison.validate+0x320>
    6dbc:      	cmp	x4, #0x19
    6dc0:      	b.gt	0x6e80 <_stogir.vector-comparison.validate+0x328>
    6dc4:      	ubfx	x1, x1, #0, #32
    6dc8:      	ubfx	x1, x1, #8, #8
    6dcc:      	orr	x4, x1, xzr
    6dd0:      	cmp	x4, #0xf
    6dd4:      	b.le	0x6e88 <_stogir.vector-comparison.validate+0x330>
    6dd8:      	cmp	x4, #0x80
    6ddc:      	b.ge	0x6e90 <_stogir.vector-comparison.validate+0x338>
    6de0:      	and	w1, w1, #0xf
    6de4:      	ubfx	x1, x1, #0, #32
    6de8:      	cmp	x1, #0x1
    6dec:      	b.lt	0x6e98 <_stogir.vector-comparison.validate+0x340>
    6df0:      	cmp	x1, #0xd
    6df4:      	b.gt	0x6ea0 <_stogir.vector-comparison.validate+0x348>
    6df8:      	ldr	x1, [x0, #0x78]
    6dfc:      	add	x1, x3, x1
    6e00:      	ldr	w1, [x1]
    6e04:      	sxtw	x1, w1
    6e08:      	cmp	x1, #0x2
    6e0c:      	b.ne	0x6ea8 <_stogir.vector-comparison.validate+0x350>
    6e10:      	add	x16, sp, #0x10
    6e14:      	ldr	w1, [x16]
    6e18:      	uxtb	w3, w1
    6e1c:      	add	x16, sp, #0x10
    6e20:      	ldr	w4, [x16, #0x4]
    6e24:      	ubfx	x1, x1, #8, #8
    6e28:      	add	x16, sp, #0x10
    6e2c:      	ldr	w5, [x16, #0x8]
    6e30:      	mov	x19, x8
    6e34:      	add	x8, sp, #0x20
    6e38:      	fmov	s31, w1
    6e3c:      	mov	w1, w3
    6e40:      	mov	w3, w2
    6e44:      	fmov	w2, s31
    6e48:      	bl	0x6e48 <_stogir.vector-comparison.validate+0x2f0>
		0000000000006e48:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.operands
    6e4c:      	add	x16, sp, #0x20
    6e50:      	ldr	x1, [x16]
    6e54:      	add	x16, sp, #0x20
    6e58:      	ldr	x0, [x16, #0x8]
    6e5c:      	add	x16, sp, #0x20
    6e60:      	ldr	x2, [x16, #0x10]
    6e64:      	b	0x6d14 <_stogir.vector-comparison.validate+0x1bc>
    6e68:      	brk	#0
    6e6c:      	b	0x6e68 <_stogir.vector-comparison.validate+0x310>
    6e70:      	brk	#0
    6e74:      	b	0x6e70 <_stogir.vector-comparison.validate+0x318>
    6e78:      	mov	x19, x8
    6e7c:      	b	0x6d00 <_stogir.vector-comparison.validate+0x1a8>
    6e80:      	mov	x19, x8
    6e84:      	b	0x6d00 <_stogir.vector-comparison.validate+0x1a8>
    6e88:      	mov	x19, x8
    6e8c:      	b	0x6d00 <_stogir.vector-comparison.validate+0x1a8>
    6e90:      	mov	x19, x8
    6e94:      	b	0x6d00 <_stogir.vector-comparison.validate+0x1a8>
    6e98:      	mov	x19, x8
    6e9c:      	b	0x6d00 <_stogir.vector-comparison.validate+0x1a8>
    6ea0:      	mov	x19, x8
    6ea4:      	b	0x6d00 <_stogir.vector-comparison.validate+0x1a8>
    6ea8:      	mov	x19, x8
    6eac:      	b	0x6d00 <_stogir.vector-comparison.validate+0x1a8>

0000000000006eb0 <_stogir.vector-arithmetic.node?>:
    6eb0:      	sxtw	x1, w1
    6eb4:      	cmp	x1, #0x0
    6eb8:      	cset	w2, gt
    6ebc:      	movz	x16, #0x0, lsl #48
    6ec0:      	sub	x3, x16, x1
    6ec4:      	sub	x4, x3, #0x1
    6ec8:      	uxtb	w16, w2
    6ecc:      	cmp	w16, wzr
    6ed0:      	b.eq	0x6f10 <_stogir.vector-arithmetic.node?+0x60>
    6ed4:      	ldr	x3, [x0, #0x8]
    6ed8:      	cmp	x1, x3
    6edc:      	b.ge	0x6f60 <_stogir.vector-arithmetic.node?+0xb0>
    6ee0:      	add	x3, x0, #0x78
    6ee4:      	ldr	x3, [x3, #0x8]
    6ee8:      	cmp	x1, x3
    6eec:      	b.ge	0x7084 <_stogir.vector-arithmetic.node?+0x1d4>
    6ef0:      	ldr	x3, [x0, #0x78]
    6ef4:      	add	x3, x3, x1, lsl #2
    6ef8:      	ldr	w3, [x3]
    6efc:      	sxtw	x3, w3
    6f00:      	cmp	x3, #0x0
    6f04:      	cset	w3, ge
    6f08:      	ubfx	x3, x3, #0, #8
    6f0c:      	b	0x7088 <_stogir.vector-arithmetic.node?+0x1d8>
    6f10:      	cmp	x1, #0x0
    6f14:      	b.ge	0x6f68 <_stogir.vector-arithmetic.node?+0xb8>
    6f18:      	add	x5, x0, #0x28
    6f1c:      	add	x6, x0, #0x50
    6f20:      	ldr	x5, [x5, #0x8]
    6f24:      	ldr	x6, [x6, #0x8]
    6f28:      	cmp	x5, x6
    6f2c:      	b.ne	0x6f58 <_stogir.vector-arithmetic.node?+0xa8>
    6f30:      	cmp	x3, x5
    6f34:      	b.gt	0x7094 <_stogir.vector-arithmetic.node?+0x1e4>
    6f38:      	ldr	x3, [x0, #0x50]
    6f3c:      	add	x3, x3, x4, lsl #2
    6f40:      	ldr	w3, [x3]
    6f44:      	sxtw	x3, w3
    6f48:      	cmp	x3, #0x0
    6f4c:      	cset	w3, gt
    6f50:      	ubfx	x3, x3, #0, #8
    6f54:      	b	0x7098 <_stogir.vector-arithmetic.node?+0x1e8>
    6f58:      	movz	x3, #0x0, lsl #48
    6f5c:      	b	0x6f6c <_stogir.vector-arithmetic.node?+0xbc>
    6f60:      	movz	x3, #0x0, lsl #48
    6f64:      	b	0x6f6c <_stogir.vector-arithmetic.node?+0xbc>
    6f68:      	movz	x3, #0x0, lsl #48
    6f6c:      	cmp	x3, #0x0
    6f70:      	b.eq	0x6fa4 <_stogir.vector-arithmetic.node?+0xf4>
    6f74:      	uxtb	w16, w2
    6f78:      	cmp	w16, wzr
    6f7c:      	b.eq	0x6f90 <_stogir.vector-arithmetic.node?+0xe0>
    6f80:      	ldr	x0, [x0]
    6f84:      	add	x0, x0, x1, lsl #4
    6f88:      	ldr	x0, [x0]
    6f8c:      	b	0x6f9c <_stogir.vector-arithmetic.node?+0xec>
    6f90:      	ldr	x0, [x0, #0x28]
    6f94:      	add	x0, x0, x4, lsl #4
    6f98:      	ldr	x0, [x0]
    6f9c:      	mov	w1, #0x1                ; =1
    6fa0:      	b	0x6fac <_stogir.vector-arithmetic.node?+0xfc>
    6fa4:      	movz	w1, #0x0, lsl #16
    6fa8:      	movz	x0, #0x0, lsl #48
    6fac:      	ubfx	x1, x1, #0, #32
    6fb0:      	lsr	x16, x1, #0
    6fb4:      	cmp	x16, #0x1
    6fb8:      	b.eq	0x6fd4 <_stogir.vector-arithmetic.node?+0x124>
    6fbc:      	b.lo	0x6fc4 <_stogir.vector-arithmetic.node?+0x114>
    6fc0:      	b	0x6fd8 <_stogir.vector-arithmetic.node?+0x128>
    6fc4:      	cmp	x16, #0x0
    6fc8:      	b.eq	0x6fd0 <_stogir.vector-arithmetic.node?+0x120>
    6fcc:      	b	0x6fd8 <_stogir.vector-arithmetic.node?+0x128>
    6fd0:      	b	0x6fdc <_stogir.vector-arithmetic.node?+0x12c>
    6fd4:      	b	0x6fec <_stogir.vector-arithmetic.node?+0x13c>
    6fd8:      	b	0x70a4 <_stogir.vector-arithmetic.node?+0x1f4>
    6fdc:      	movz	x0, #0x0, lsl #48
    6fe0:      	b	0x6fe8 <_stogir.vector-arithmetic.node?+0x138>
    6fe4:      	movz	x0, #0x0, lsl #48
    6fe8:      	ret
    6fec:      	uxtb	w1, w0
    6ff0:      	cmp	x1, #0x1f
    6ff4:      	b.eq	0x7048 <_stogir.vector-arithmetic.node?+0x198>
    6ff8:      	cmp	x1, #0x20
    6ffc:      	b.eq	0x7048 <_stogir.vector-arithmetic.node?+0x198>
    7000:      	cmp	x1, #0x2d
    7004:      	b.eq	0x7048 <_stogir.vector-arithmetic.node?+0x198>
    7008:      	cmp	x1, #0x36
    700c:      	b.eq	0x7048 <_stogir.vector-arithmetic.node?+0x198>
    7010:      	cmp	x1, #0x37
    7014:      	b.eq	0x7048 <_stogir.vector-arithmetic.node?+0x198>
    7018:      	cmp	x1, #0x38
    701c:      	b.eq	0x7048 <_stogir.vector-arithmetic.node?+0x198>
    7020:      	cmp	x1, #0x39
    7024:      	b.eq	0x7048 <_stogir.vector-arithmetic.node?+0x198>
    7028:      	cmp	x1, #0x3a
    702c:      	b.eq	0x7048 <_stogir.vector-arithmetic.node?+0x198>
    7030:      	cmp	x1, #0x3b
    7034:      	b.eq	0x7048 <_stogir.vector-arithmetic.node?+0x198>
    7038:      	cmp	x1, #0x31
    703c:      	b.lt	0x70ac <_stogir.vector-arithmetic.node?+0x1fc>
    7040:      	cmp	x1, #0x35
    7044:      	b.gt	0x70ac <_stogir.vector-arithmetic.node?+0x1fc>
    7048:      	ubfx	x0, x0, #0, #32
    704c:      	ubfx	x0, x0, #8, #8
    7050:      	orr	x1, x0, xzr
    7054:      	cmp	x1, #0xf
    7058:      	b.le	0x6fe4 <_stogir.vector-arithmetic.node?+0x134>
    705c:      	cmp	x1, #0x80
    7060:      	b.ge	0x708c <_stogir.vector-arithmetic.node?+0x1dc>
    7064:      	and	w0, w0, #0xf
    7068:      	ubfx	x0, x0, #0, #32
    706c:      	cmp	x0, #0x1
    7070:      	b.lt	0x709c <_stogir.vector-arithmetic.node?+0x1ec>
    7074:      	cmp	x0, #0xd
    7078:      	cset	w0, le
    707c:      	ubfx	x0, x0, #0, #8
    7080:      	b	0x70a0 <_stogir.vector-arithmetic.node?+0x1f0>
    7084:      	movz	x3, #0x0, lsl #48
    7088:      	b	0x6f64 <_stogir.vector-arithmetic.node?+0xb4>
    708c:      	movz	x0, #0x0, lsl #48
    7090:      	b	0x6fe8 <_stogir.vector-arithmetic.node?+0x138>
    7094:      	movz	x3, #0x0, lsl #48
    7098:      	b	0x6f5c <_stogir.vector-arithmetic.node?+0xac>
    709c:      	movz	x0, #0x0, lsl #48
    70a0:      	b	0x7090 <_stogir.vector-arithmetic.node?+0x1e0>
    70a4:      	brk	#0
    70a8:      	b	0x70a4 <_stogir.vector-arithmetic.node?+0x1f4>
    70ac:      	cmp	x1, #0x1a
    70b0:      	b.eq	0x7048 <_stogir.vector-arithmetic.node?+0x198>
    70b4:      	cmp	x1, #0x1b
    70b8:      	b.eq	0x7048 <_stogir.vector-arithmetic.node?+0x198>
    70bc:      	cmp	x1, #0x1c
    70c0:      	b.eq	0x7048 <_stogir.vector-arithmetic.node?+0x198>
    70c4:      	cmp	x1, #0x1d
    70c8:      	b.eq	0x7048 <_stogir.vector-arithmetic.node?+0x198>
    70cc:      	cmp	x1, #0x1e
    70d0:      	b.eq	0x7048 <_stogir.vector-arithmetic.node?+0x198>
    70d4:      	cmp	x1, #0x2e
    70d8:      	b.eq	0x7048 <_stogir.vector-arithmetic.node?+0x198>
    70dc:      	cmp	x1, #0x2f
    70e0:      	b.eq	0x7048 <_stogir.vector-arithmetic.node?+0x198>
    70e4:      	cmp	x1, #0x30
    70e8:      	b.eq	0x7048 <_stogir.vector-arithmetic.node?+0x198>
    70ec:      	movz	x0, #0x0, lsl #48
    70f0:      	b	0x6fe8 <_stogir.vector-arithmetic.node?+0x138>

00000000000070f4 <_stogir.vector-arithmetic.validate>:
    70f4:      	sub	sp, sp, #0x60
    70f8:      	str	x29, [sp]
    70fc:      	str	x30, [sp, #0x8]
    7100:      	mov	x29, sp
    7104:      	str	x19, [sp, #0x40]
    7108:      	str	x20, [sp, #0x48]
    710c:      	str	x21, [sp, #0x50]
    7110:      	str	x22, [sp, #0x58]
    7114:      	sxtw	x2, w1
    7118:      	lsl	x19, x2, #2
    711c:      	cmp	x2, #0x0
    7120:      	cset	w3, gt
    7124:      	movz	x16, #0x0, lsl #48
    7128:      	sub	x4, x16, x2
    712c:      	sub	x5, x4, #0x1
    7130:      	uxtb	w16, w3
    7134:      	cmp	w16, wzr
    7138:      	b.eq	0x7178 <_stogir.vector-arithmetic.validate+0x84>
    713c:      	ldr	x4, [x0, #0x8]
    7140:      	cmp	x2, x4
    7144:      	b.ge	0x71c8 <_stogir.vector-arithmetic.validate+0xd4>
    7148:      	add	x4, x0, #0x78
    714c:      	ldr	x4, [x4, #0x8]
    7150:      	cmp	x2, x4
    7154:      	b.ge	0x72c8 <_stogir.vector-arithmetic.validate+0x1d4>
    7158:      	ldr	x4, [x0, #0x78]
    715c:      	add	x4, x19, x4
    7160:      	ldr	w4, [x4]
    7164:      	sxtw	x4, w4
    7168:      	cmp	x4, #0x0
    716c:      	cset	w4, ge
    7170:      	ubfx	x4, x4, #0, #8
    7174:      	b	0x72cc <_stogir.vector-arithmetic.validate+0x1d8>
    7178:      	cmp	x2, #0x0
    717c:      	b.ge	0x71d0 <_stogir.vector-arithmetic.validate+0xdc>
    7180:      	add	x6, x0, #0x28
    7184:      	add	x7, x0, #0x50
    7188:      	ldr	x6, [x6, #0x8]
    718c:      	ldr	x7, [x7, #0x8]
    7190:      	cmp	x6, x7
    7194:      	b.ne	0x71c0 <_stogir.vector-arithmetic.validate+0xcc>
    7198:      	cmp	x4, x6
    719c:      	b.gt	0x7360 <_stogir.vector-arithmetic.validate+0x26c>
    71a0:      	ldr	x4, [x0, #0x50]
    71a4:      	add	x4, x4, x5, lsl #2
    71a8:      	ldr	w4, [x4]
    71ac:      	sxtw	x4, w4
    71b0:      	cmp	x4, #0x0
    71b4:      	cset	w4, gt
    71b8:      	ubfx	x4, x4, #0, #8
    71bc:      	b	0x7364 <_stogir.vector-arithmetic.validate+0x270>
    71c0:      	movz	x4, #0x0, lsl #48
    71c4:      	b	0x71d4 <_stogir.vector-arithmetic.validate+0xe0>
    71c8:      	movz	x4, #0x0, lsl #48
    71cc:      	b	0x71d4 <_stogir.vector-arithmetic.validate+0xe0>
    71d0:      	movz	x4, #0x0, lsl #48
    71d4:      	cmp	x4, #0x0
    71d8:      	b.eq	0x7214 <_stogir.vector-arithmetic.validate+0x120>
    71dc:      	uxtb	w16, w3
    71e0:      	cmp	w16, wzr
    71e4:      	b.eq	0x71fc <_stogir.vector-arithmetic.validate+0x108>
    71e8:      	ldr	x3, [x0]
    71ec:      	add	x3, x3, x2, lsl #4
    71f0:      	ldr	x20, [x3]
    71f4:      	ldr	x3, [x3, #0x8]
    71f8:      	b	0x720c <_stogir.vector-arithmetic.validate+0x118>
    71fc:      	ldr	x3, [x0, #0x28]
    7200:      	add	x3, x3, x5, lsl #4
    7204:      	ldr	x20, [x3]
    7208:      	ldr	x3, [x3, #0x8]
    720c:      	mov	w4, #0x1                ; =1
    7210:      	b	0x7220 <_stogir.vector-arithmetic.validate+0x12c>
    7214:      	movz	w4, #0x0, lsl #16
    7218:      	movz	x20, #0x0, lsl #48
    721c:      	movz	x3, #0x0, lsl #48
    7220:      	ubfx	x4, x4, #0, #32
    7224:      	lsr	x16, x4, #0
    7228:      	cmp	x16, #0x1
    722c:      	b.eq	0x7248 <_stogir.vector-arithmetic.validate+0x154>
    7230:      	b.lo	0x7238 <_stogir.vector-arithmetic.validate+0x144>
    7234:      	b	0x724c <_stogir.vector-arithmetic.validate+0x158>
    7238:      	cmp	x16, #0x0
    723c:      	b.eq	0x7244 <_stogir.vector-arithmetic.validate+0x150>
    7240:      	b	0x724c <_stogir.vector-arithmetic.validate+0x158>
    7244:      	b	0x7250 <_stogir.vector-arithmetic.validate+0x15c>
    7248:      	b	0x726c <_stogir.vector-arithmetic.validate+0x178>
    724c:      	b	0x73f8 <_stogir.vector-arithmetic.validate+0x304>
    7250:      	adrp	x16, 0x7000 <_stogir.vector-arithmetic.node?+0x150>
		0000000000007250:  ARM64_RELOC_PAGE21	l_stogir.418
    7254:      	ldr	x16, [x16]
		0000000000007254:  ARM64_RELOC_PAGEOFF12	l_stogir.418
    7258:      	orr	x0, x16, xzr
    725c:      	mov	x21, x8
    7260:      	mov	x1, #0x1                ; =1
    7264:      	mov	x2, #0x25               ; =37
    7268:      	b	0x729c <_stogir.vector-arithmetic.validate+0x1a8>
    726c:      	add	x16, sp, #0x10
    7270:      	str	x20, [x16]
    7274:      	add	x16, sp, #0x10
    7278:      	str	x3, [x16, #0x8]
    727c:      	cmp	x2, #0x0
    7280:      	b.gt	0x72d0 <_stogir.vector-arithmetic.validate+0x1dc>
    7284:      	mov	x21, x8
    7288:      	adrp	x16, 0x7000 <_stogir.vector-arithmetic.node?+0x150>
		0000000000007288:  ARM64_RELOC_PAGE21	l_stogir.419
    728c:      	ldr	x16, [x16]
		000000000000728c:  ARM64_RELOC_PAGEOFF12	l_stogir.419
    7290:      	orr	x0, x16, xzr
    7294:      	mov	x1, #0x1                ; =1
    7298:      	mov	x2, #0x2b               ; =43
    729c:      	str	x1, [x21]
    72a0:      	str	x0, [x21, #0x8]
    72a4:      	str	x2, [x21, #0x10]
    72a8:      	ldr	x19, [sp, #0x40]
    72ac:      	ldr	x20, [sp, #0x48]
    72b0:      	ldr	x21, [sp, #0x50]
    72b4:      	ldr	x22, [sp, #0x58]
    72b8:      	ldr	x29, [sp]
    72bc:      	ldr	x30, [sp, #0x8]
    72c0:      	add	sp, sp, #0x60
    72c4:      	ret
    72c8:      	movz	x4, #0x0, lsl #48
    72cc:      	b	0x71cc <_stogir.vector-arithmetic.validate+0xd8>
    72d0:      	mov	x21, x8
    72d4:      	mov	x22, x0
    72d8:      	bl	0x72d8 <_stogir.vector-arithmetic.validate+0x1e4>
		00000000000072d8:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.node?
    72dc:      	cmp	x0, #0x0
    72e0:      	b.eq	0x7288 <_stogir.vector-arithmetic.validate+0x194>
    72e4:      	uxtb	w20, w20
    72e8:      	orr	x0, x20, xzr
    72ec:      	ldr	x1, [x22, #0x78]
    72f0:      	cmp	x0, #0x1d
    72f4:      	cset	w2, eq
    72f8:      	cmp	x0, #0x1e
    72fc:      	cset	w3, eq
    7300:      	add	x1, x19, x1
    7304:      	ldr	w1, [x1]
    7308:      	cmp	x0, #0x1f
    730c:      	b.eq	0x73ac <_stogir.vector-arithmetic.validate+0x2b8>
    7310:      	cmp	x0, #0x20
    7314:      	b.eq	0x73ac <_stogir.vector-arithmetic.validate+0x2b8>
    7318:      	cmp	x0, #0x2d
    731c:      	b.eq	0x73ac <_stogir.vector-arithmetic.validate+0x2b8>
    7320:      	cmp	x0, #0x36
    7324:      	b.eq	0x73ac <_stogir.vector-arithmetic.validate+0x2b8>
    7328:      	cmp	x0, #0x37
    732c:      	b.eq	0x73ac <_stogir.vector-arithmetic.validate+0x2b8>
    7330:      	cmp	x0, #0x38
    7334:      	b.eq	0x73ac <_stogir.vector-arithmetic.validate+0x2b8>
    7338:      	cmp	x0, #0x39
    733c:      	b.eq	0x73ac <_stogir.vector-arithmetic.validate+0x2b8>
    7340:      	uxtb	w16, w2
    7344:      	cmp	w16, wzr
    7348:      	b.ne	0x7400 <_stogir.vector-arithmetic.validate+0x30c>
    734c:      	uxtb	w16, w3
    7350:      	cmp	w16, wzr
    7354:      	b.ne	0x7400 <_stogir.vector-arithmetic.validate+0x30c>
    7358:      	mov	w0, #0x2                ; =2
    735c:      	b	0x7404 <_stogir.vector-arithmetic.validate+0x310>
    7360:      	movz	x4, #0x0, lsl #48
    7364:      	b	0x71c4 <_stogir.vector-arithmetic.validate+0xd0>
    7368:      	add	x16, sp, #0x10
    736c:      	ldr	w2, [x16, #0xc]
    7370:      	ubfx	x0, x0, #8, #8
    7374:      	add	x8, sp, #0x20
    7378:      	mov	w3, w1
    737c:      	mov	w1, w20
    7380:      	mov	w5, w2
    7384:      	mov	w2, w0
    7388:      	mov	x0, x22
    738c:      	bl	0x738c <_stogir.vector-arithmetic.validate+0x298>
		000000000000738c:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.operands
    7390:      	add	x16, sp, #0x20
    7394:      	ldr	x1, [x16]
    7398:      	add	x16, sp, #0x20
    739c:      	ldr	x0, [x16, #0x8]
    73a0:      	add	x16, sp, #0x20
    73a4:      	ldr	x2, [x16, #0x10]
    73a8:      	b	0x729c <_stogir.vector-arithmetic.validate+0x1a8>
    73ac:      	mov	w0, #0x1                ; =1
    73b0:      	sxtw	x1, w1
    73b4:      	sxtw	x0, w0
    73b8:      	cmp	x1, x0
    73bc:      	b.ne	0x7288 <_stogir.vector-arithmetic.validate+0x194>
    73c0:      	add	x16, sp, #0x10
    73c4:      	ldr	w0, [x16]
    73c8:      	add	x16, sp, #0x10
    73cc:      	ldr	w1, [x16, #0x4]
    73d0:      	add	x16, sp, #0x10
    73d4:      	ldr	w4, [x16, #0x8]
    73d8:      	uxtb	w16, w2
    73dc:      	cmp	w16, wzr
    73e0:      	b.ne	0x7368 <_stogir.vector-arithmetic.validate+0x274>
    73e4:      	uxtb	w16, w3
    73e8:      	cmp	w16, wzr
    73ec:      	b.ne	0x7368 <_stogir.vector-arithmetic.validate+0x274>
    73f0:      	movz	w2, #0x0, lsl #16
    73f4:      	b	0x7370 <_stogir.vector-arithmetic.validate+0x27c>
    73f8:      	brk	#0
    73fc:      	b	0x73f8 <_stogir.vector-arithmetic.validate+0x304>
    7400:      	mov	w0, #0x3                ; =3
    7404:      	b	0x73b0 <_stogir.vector-arithmetic.validate+0x2bc>

0000000000007408 <_stogir.vector.memory-inputs>:
    7408:      	sub	sp, sp, #0x40
    740c:      	str	x29, [sp]
    7410:      	str	x30, [sp, #0x8]
    7414:      	mov	x29, sp
    7418:      	str	x19, [sp, #0x10]
    741c:      	str	x20, [sp, #0x18]
    7420:      	str	x21, [sp, #0x20]
    7424:      	str	x22, [sp, #0x28]
    7428:      	str	x23, [sp, #0x30]
    742c:      	str	x24, [sp, #0x38]
    7430:      	sxtw	x5, w1
    7434:      	cmp	x5, #0xf
    7438:      	b.le	0x78ac <_stogir.vector.memory-inputs+0x4a4>
    743c:      	cmp	x5, #0x80
    7440:      	b.ge	0x78b4 <_stogir.vector.memory-inputs+0x4ac>
    7444:      	and	w5, w1, #0xf
    7448:      	ubfx	x5, x5, #0, #32
    744c:      	cmp	x5, #0x1
    7450:      	b.lt	0x78bc <_stogir.vector.memory-inputs+0x4b4>
    7454:      	cmp	x5, #0xd
    7458:      	b.gt	0x78c4 <_stogir.vector.memory-inputs+0x4bc>
    745c:      	mov	x19, x8
    7460:      	mov	x20, x0
    7464:      	mov	w0, w1
    7468:      	mov	w21, w1
    746c:      	mov	w1, w2
    7470:      	mov	w22, w2
    7474:      	mov	w23, w3
    7478:      	mov	w24, w4
    747c:      	bl	0x747c <_stogir.vector.memory-inputs+0x74>
		000000000000747c:  ARM64_RELOC_BRANCH26	_stogir.types.size
    7480:      	sxtw	x0, w0
    7484:      	cmp	x0, #0x0
    7488:      	b.le	0x74ec <_stogir.vector.memory-inputs+0xe4>
    748c:      	sxtw	x23, w23
    7490:      	cmp	x23, #0x0
    7494:      	cset	w0, gt
    7498:      	movz	x16, #0x0, lsl #48
    749c:      	sub	x1, x16, x23
    74a0:      	sub	x2, x1, #0x1
    74a4:      	uxtb	w16, w0
    74a8:      	cmp	w16, wzr
    74ac:      	b.eq	0x75c8 <_stogir.vector.memory-inputs+0x1c0>
    74b0:      	ldr	x1, [x20, #0x8]
    74b4:      	cmp	x23, x1
    74b8:      	b.ge	0x75c0 <_stogir.vector.memory-inputs+0x1b8>
    74bc:      	add	x1, x20, #0x78
    74c0:      	ldr	x1, [x1, #0x8]
    74c4:      	cmp	x23, x1
    74c8:      	b.ge	0x7668 <_stogir.vector.memory-inputs+0x260>
    74cc:      	ldr	x1, [x20, #0x78]
    74d0:      	add	x1, x1, x23, lsl #2
    74d4:      	ldr	w1, [x1]
    74d8:      	sxtw	x1, w1
    74dc:      	cmp	x1, #0x0
    74e0:      	cset	w1, ge
    74e4:      	ubfx	x1, x1, #0, #8
    74e8:      	b	0x766c <_stogir.vector.memory-inputs+0x264>
    74ec:      	adrp	x16, 0x7000 <_stogir.vector-arithmetic.node?+0x150>
		00000000000074ec:  ARM64_RELOC_PAGE21	l_stogir.420
    74f0:      	ldr	x16, [x16]
		00000000000074f0:  ARM64_RELOC_PAGEOFF12	l_stogir.420
    74f4:      	orr	x0, x16, xzr
    74f8:      	mov	x1, #0x1                ; =1
    74fc:      	mov	x2, #0x32               ; =50
    7500:      	str	x1, [x19]
    7504:      	str	x0, [x19, #0x8]
    7508:      	str	x2, [x19, #0x10]
    750c:      	ldr	x19, [sp, #0x10]
    7510:      	ldr	x20, [sp, #0x18]
    7514:      	ldr	x21, [sp, #0x20]
    7518:      	ldr	x22, [sp, #0x28]
    751c:      	ldr	x23, [sp, #0x30]
    7520:      	ldr	x24, [sp, #0x38]
    7524:      	ldr	x29, [sp]
    7528:      	ldr	x30, [sp, #0x8]
    752c:      	add	sp, sp, #0x40
    7530:      	ret
    7534:      	movz	w1, #0x0, lsl #16
    7538:      	movz	x0, #0x0, lsl #48
    753c:      	ubfx	x1, x1, #0, #32
    7540:      	lsr	x16, x1, #0
    7544:      	cmp	x16, #0x1
    7548:      	b.eq	0x7564 <_stogir.vector.memory-inputs+0x15c>
    754c:      	b.lo	0x7554 <_stogir.vector.memory-inputs+0x14c>
    7550:      	b	0x7568 <_stogir.vector.memory-inputs+0x160>
    7554:      	cmp	x16, #0x0
    7558:      	b.eq	0x7560 <_stogir.vector.memory-inputs+0x158>
    755c:      	b	0x7568 <_stogir.vector.memory-inputs+0x160>
    7560:      	b	0x756c <_stogir.vector.memory-inputs+0x164>
    7564:      	b	0x7610 <_stogir.vector.memory-inputs+0x208>
    7568:      	b	0x7894 <_stogir.vector.memory-inputs+0x48c>
    756c:      	adrp	x16, 0x7000 <_stogir.vector-arithmetic.node?+0x150>
		000000000000756c:  ARM64_RELOC_PAGE21	l_stogir.421
    7570:      	ldr	x16, [x16]
		0000000000007570:  ARM64_RELOC_PAGEOFF12	l_stogir.421
    7574:      	orr	x0, x16, xzr
    7578:      	mov	x1, #0x1                ; =1
    757c:      	mov	x2, #0x1d               ; =29
    7580:      	b	0x7500 <_stogir.vector.memory-inputs+0xf8>
    7584:      	ldr	x0, [x20, #0x28]
    7588:      	add	x0, x0, x2, lsl #4
    758c:      	ldr	x0, [x0]
    7590:      	mov	w1, #0x1                ; =1
    7594:      	b	0x753c <_stogir.vector.memory-inputs+0x134>
    7598:      	movz	x1, #0x0, lsl #48
    759c:      	cmp	x1, #0x0
    75a0:      	b.eq	0x7534 <_stogir.vector.memory-inputs+0x12c>
    75a4:      	uxtb	w16, w0
    75a8:      	cmp	w16, wzr
    75ac:      	b.eq	0x7584 <_stogir.vector.memory-inputs+0x17c>
    75b0:      	ldr	x0, [x20]
    75b4:      	add	x0, x0, x23, lsl #4
    75b8:      	ldr	x0, [x0]
    75bc:      	b	0x7590 <_stogir.vector.memory-inputs+0x188>
    75c0:      	movz	x1, #0x0, lsl #48
    75c4:      	b	0x759c <_stogir.vector.memory-inputs+0x194>
    75c8:      	cmp	x23, #0x0
    75cc:      	b.ge	0x7598 <_stogir.vector.memory-inputs+0x190>
    75d0:      	add	x3, x20, #0x28
    75d4:      	add	x4, x20, #0x50
    75d8:      	ldr	x3, [x3, #0x8]
    75dc:      	ldr	x4, [x4, #0x8]
    75e0:      	cmp	x3, x4
    75e4:      	b.ne	0x7660 <_stogir.vector.memory-inputs+0x258>
    75e8:      	cmp	x1, x3
    75ec:      	b.gt	0x7670 <_stogir.vector.memory-inputs+0x268>
    75f0:      	ldr	x1, [x20, #0x50]
    75f4:      	add	x1, x1, x2, lsl #2
    75f8:      	ldr	w1, [x1]
    75fc:      	sxtw	x1, w1
    7600:      	cmp	x1, #0x0
    7604:      	cset	w1, gt
    7608:      	ubfx	x1, x1, #0, #8
    760c:      	b	0x7674 <_stogir.vector.memory-inputs+0x26c>
    7610:      	cmp	x23, #0x0
    7614:      	b.le	0x7648 <_stogir.vector.memory-inputs+0x240>
    7618:      	uxtb	w0, w0
    761c:      	cmp	x0, #0x83
    7620:      	cset	w1, lt
    7624:      	uxtb	w16, w1
    7628:      	cmp	w16, wzr
    762c:      	b.eq	0x7678 <_stogir.vector.memory-inputs+0x270>
    7630:      	adrp	x16, 0x7000 <_stogir.vector-arithmetic.node?+0x150>
		0000000000007630:  ARM64_RELOC_PAGE21	l_stogir.422
    7634:      	ldr	x16, [x16]
		0000000000007634:  ARM64_RELOC_PAGEOFF12	l_stogir.422
    7638:      	orr	x2, x16, xzr
    763c:      	add	x2, x0, x2
    7640:      	ldrb	w2, [x2]
    7644:      	b	0x767c <_stogir.vector.memory-inputs+0x274>
    7648:      	adrp	x16, 0x7000 <_stogir.vector-arithmetic.node?+0x150>
		0000000000007648:  ARM64_RELOC_PAGE21	l_stogir.423
    764c:      	ldr	x16, [x16]
		000000000000764c:  ARM64_RELOC_PAGEOFF12	l_stogir.423
    7650:      	orr	x0, x16, xzr
    7654:      	mov	x1, #0x1                ; =1
    7658:      	mov	x2, #0x2c               ; =44
    765c:      	b	0x7580 <_stogir.vector.memory-inputs+0x178>
    7660:      	movz	x1, #0x0, lsl #48
    7664:      	b	0x759c <_stogir.vector.memory-inputs+0x194>
    7668:      	movz	x1, #0x0, lsl #48
    766c:      	b	0x75c4 <_stogir.vector.memory-inputs+0x1bc>
    7670:      	movz	x1, #0x0, lsl #48
    7674:      	b	0x7664 <_stogir.vector.memory-inputs+0x25c>
    7678:      	movz	w2, #0x0, lsl #16
    767c:      	uxtb	w16, w2
    7680:      	and	w2, w16, #0x1
    7684:      	uxtb	w2, w2
    7688:      	ubfx	x2, x2, #0, #8
    768c:      	cmp	x2, #0x0
    7690:      	b.eq	0x7648 <_stogir.vector.memory-inputs+0x240>
    7694:      	uxtb	w16, w1
    7698:      	cmp	w16, wzr
    769c:      	b.eq	0x76b8 <_stogir.vector.memory-inputs+0x2b0>
    76a0:      	adrp	x16, 0x7000 <_stogir.vector-arithmetic.node?+0x150>
		00000000000076a0:  ARM64_RELOC_PAGE21	l_stogir.422
    76a4:      	ldr	x16, [x16]
		00000000000076a4:  ARM64_RELOC_PAGEOFF12	l_stogir.422
    76a8:      	orr	x1, x16, xzr
    76ac:      	add	x0, x0, x1
    76b0:      	ldrb	w0, [x0]
    76b4:      	b	0x76bc <_stogir.vector.memory-inputs+0x2b4>
    76b8:      	movz	w0, #0x0, lsl #16
    76bc:      	uxtb	w16, w0
    76c0:      	and	w0, w16, #0x4
    76c4:      	uxtb	w0, w0
    76c8:      	ubfx	x0, x0, #0, #8
    76cc:      	cmp	x0, #0x0
    76d0:      	cset	w0, eq
    76d4:      	uxtb	w16, w0
    76d8:      	cmp	w16, wzr
    76dc:      	cset	x0, eq
    76e0:      	cmp	x0, #0x0
    76e4:      	b.ne	0x7648 <_stogir.vector.memory-inputs+0x240>
    76e8:      	sxtw	x24, w24
    76ec:      	cmp	x24, #0x0
    76f0:      	cset	w0, gt
    76f4:      	movz	x16, #0x0, lsl #48
    76f8:      	sub	x1, x16, x24
    76fc:      	sub	x2, x1, #0x1
    7700:      	uxtb	w16, w0
    7704:      	cmp	w16, wzr
    7708:      	b.eq	0x7760 <_stogir.vector.memory-inputs+0x358>
    770c:      	ldr	x1, [x20, #0x8]
    7710:      	cmp	x24, x1
    7714:      	b.ge	0x77a8 <_stogir.vector.memory-inputs+0x3a0>
    7718:      	add	x1, x20, #0x78
    771c:      	ldr	x1, [x1, #0x8]
    7720:      	cmp	x24, x1
    7724:      	b.ge	0x788c <_stogir.vector.memory-inputs+0x484>
    7728:      	ldr	x1, [x20, #0x78]
    772c:      	add	x1, x1, x24, lsl #2
    7730:      	ldr	w1, [x1]
    7734:      	sxtw	x1, w1
    7738:      	cmp	x1, #0x0
    773c:      	cset	w1, ge
    7740:      	ubfx	x1, x1, #0, #8
    7744:      	b	0x7890 <_stogir.vector.memory-inputs+0x488>
    7748:      	adrp	x16, 0x7000 <_stogir.vector-arithmetic.node?+0x150>
		0000000000007748:  ARM64_RELOC_PAGE21	l_stogir.424
    774c:      	ldr	x16, [x16]
		000000000000774c:  ARM64_RELOC_PAGEOFF12	l_stogir.424
    7750:      	orr	x0, x16, xzr
    7754:      	mov	x1, #0x1                ; =1
    7758:      	mov	x2, #0x2b               ; =43
    775c:      	b	0x765c <_stogir.vector.memory-inputs+0x254>
    7760:      	cmp	x24, #0x0
    7764:      	b.ge	0x77b0 <_stogir.vector.memory-inputs+0x3a8>
    7768:      	add	x3, x20, #0x28
    776c:      	add	x4, x20, #0x50
    7770:      	ldr	x3, [x3, #0x8]
    7774:      	ldr	x4, [x4, #0x8]
    7778:      	cmp	x3, x4
    777c:      	b.ne	0x7884 <_stogir.vector.memory-inputs+0x47c>
    7780:      	cmp	x1, x3
    7784:      	b.gt	0x789c <_stogir.vector.memory-inputs+0x494>
    7788:      	ldr	x1, [x20, #0x50]
    778c:      	add	x1, x1, x2, lsl #2
    7790:      	ldr	w1, [x1]
    7794:      	sxtw	x1, w1
    7798:      	cmp	x1, #0x0
    779c:      	cset	w1, gt
    77a0:      	ubfx	x1, x1, #0, #8
    77a4:      	b	0x78a0 <_stogir.vector.memory-inputs+0x498>
    77a8:      	movz	x1, #0x0, lsl #48
    77ac:      	b	0x77b4 <_stogir.vector.memory-inputs+0x3ac>
    77b0:      	movz	x1, #0x0, lsl #48
    77b4:      	cmp	x1, #0x0
    77b8:      	b.eq	0x77ec <_stogir.vector.memory-inputs+0x3e4>
    77bc:      	uxtb	w16, w0
    77c0:      	cmp	w16, wzr
    77c4:      	b.eq	0x77d8 <_stogir.vector.memory-inputs+0x3d0>
    77c8:      	ldr	x0, [x20]
    77cc:      	add	x0, x0, x24, lsl #4
    77d0:      	ldr	x0, [x0]
    77d4:      	b	0x77e4 <_stogir.vector.memory-inputs+0x3dc>
    77d8:      	ldr	x0, [x20, #0x28]
    77dc:      	add	x0, x0, x2, lsl #4
    77e0:      	ldr	x0, [x0]
    77e4:      	mov	w1, #0x1                ; =1
    77e8:      	b	0x77f4 <_stogir.vector.memory-inputs+0x3ec>
    77ec:      	movz	w1, #0x0, lsl #16
    77f0:      	movz	x0, #0x0, lsl #48
    77f4:      	ubfx	x1, x1, #0, #32
    77f8:      	lsr	x16, x1, #0
    77fc:      	cmp	x16, #0x1
    7800:      	b.eq	0x781c <_stogir.vector.memory-inputs+0x414>
    7804:      	b.lo	0x780c <_stogir.vector.memory-inputs+0x404>
    7808:      	b	0x7820 <_stogir.vector.memory-inputs+0x418>
    780c:      	cmp	x16, #0x0
    7810:      	b.eq	0x7818 <_stogir.vector.memory-inputs+0x410>
    7814:      	b	0x7820 <_stogir.vector.memory-inputs+0x418>
    7818:      	b	0x7824 <_stogir.vector.memory-inputs+0x41c>
    781c:      	b	0x783c <_stogir.vector.memory-inputs+0x434>
    7820:      	b	0x78a4 <_stogir.vector.memory-inputs+0x49c>
    7824:      	adrp	x16, 0x7000 <_stogir.vector-arithmetic.node?+0x150>
		0000000000007824:  ARM64_RELOC_PAGE21	l_stogir.425
    7828:      	ldr	x16, [x16]
		0000000000007828:  ARM64_RELOC_PAGEOFF12	l_stogir.425
    782c:      	orr	x0, x16, xzr
    7830:      	mov	x1, #0x1                ; =1
    7834:      	mov	x2, #0x1d               ; =29
    7838:      	b	0x775c <_stogir.vector.memory-inputs+0x354>
    783c:      	orr	w1, w0, wzr
    7840:      	ubfx	x1, x1, #0, #32
    7844:      	ubfx	x1, x1, #8, #8
    7848:      	cmp	x1, #0x6
    784c:      	b.ne	0x7748 <_stogir.vector.memory-inputs+0x340>
    7850:      	uxtb	w0, w0
    7854:      	cmp	x0, #0x48
    7858:      	b.eq	0x7748 <_stogir.vector.memory-inputs+0x340>
    785c:      	cmp	x0, #0x46
    7860:      	b.eq	0x7748 <_stogir.vector.memory-inputs+0x340>
    7864:      	mov	w0, w21
    7868:      	mov	w1, w22
    786c:      	bl	0x786c <_stogir.vector.memory-inputs+0x464>
		000000000000786c:  ARM64_RELOC_BRANCH26	_stogir.types.size
    7870:      	sxtw	x0, w0
    7874:      	and	x0, x0, #0xffffffff
    7878:      	movz	x1, #0x0, lsl #48
    787c:      	movz	x2, #0x0, lsl #48
    7880:      	b	0x775c <_stogir.vector.memory-inputs+0x354>
    7884:      	movz	x1, #0x0, lsl #48
    7888:      	b	0x77b4 <_stogir.vector.memory-inputs+0x3ac>
    788c:      	movz	x1, #0x0, lsl #48
    7890:      	b	0x77ac <_stogir.vector.memory-inputs+0x3a4>
    7894:      	brk	#0
    7898:      	b	0x7894 <_stogir.vector.memory-inputs+0x48c>
    789c:      	movz	x1, #0x0, lsl #48
    78a0:      	b	0x7888 <_stogir.vector.memory-inputs+0x480>
    78a4:      	brk	#0
    78a8:      	b	0x78a4 <_stogir.vector.memory-inputs+0x49c>
    78ac:      	mov	x19, x8
    78b0:      	b	0x74ec <_stogir.vector.memory-inputs+0xe4>
    78b4:      	mov	x19, x8
    78b8:      	b	0x74ec <_stogir.vector.memory-inputs+0xe4>
    78bc:      	mov	x19, x8
    78c0:      	b	0x74ec <_stogir.vector.memory-inputs+0xe4>
    78c4:      	mov	x19, x8
    78c8:      	b	0x74ec <_stogir.vector.memory-inputs+0xe4>

00000000000078cc <_stogir.vector.store-inputs>:
    78cc:      	sub	sp, sp, #0x40
    78d0:      	str	x29, [sp]
    78d4:      	str	x30, [sp, #0x8]
    78d8:      	mov	x29, sp
    78dc:      	str	x19, [sp, #0x30]
    78e0:      	sxtw	x4, w4
    78e4:      	cmp	x4, #0x0
    78e8:      	cset	w5, gt
    78ec:      	movz	x16, #0x0, lsl #48
    78f0:      	sub	x6, x16, x4
    78f4:      	sub	x7, x6, #0x1
    78f8:      	uxtb	w16, w5
    78fc:      	cmp	w16, wzr
    7900:      	b.eq	0x7940 <_stogir.vector.store-inputs+0x74>
    7904:      	ldr	x6, [x0, #0x8]
    7908:      	cmp	x4, x6
    790c:      	b.ge	0x7990 <_stogir.vector.store-inputs+0xc4>
    7910:      	add	x6, x0, #0x78
    7914:      	ldr	x6, [x6, #0x8]
    7918:      	cmp	x4, x6
    791c:      	b.ge	0x7a88 <_stogir.vector.store-inputs+0x1bc>
    7920:      	ldr	x6, [x0, #0x78]
    7924:      	add	x6, x6, x4, lsl #2
    7928:      	ldr	w6, [x6]
    792c:      	sxtw	x6, w6
    7930:      	cmp	x6, #0x0
    7934:      	cset	w6, ge
    7938:      	ubfx	x6, x6, #0, #8
    793c:      	b	0x7a8c <_stogir.vector.store-inputs+0x1c0>
    7940:      	cmp	x4, #0x0
    7944:      	b.ge	0x7998 <_stogir.vector.store-inputs+0xcc>
    7948:      	add	x9, x0, #0x28
    794c:      	add	x10, x0, #0x50
    7950:      	ldr	x9, [x9, #0x8]
    7954:      	ldr	x10, [x10, #0x8]
    7958:      	cmp	x9, x10
    795c:      	b.ne	0x7988 <_stogir.vector.store-inputs+0xbc>
    7960:      	cmp	x6, x9
    7964:      	b.gt	0x7a90 <_stogir.vector.store-inputs+0x1c4>
    7968:      	ldr	x6, [x0, #0x50]
    796c:      	add	x6, x6, x7, lsl #2
    7970:      	ldr	w6, [x6]
    7974:      	sxtw	x6, w6
    7978:      	cmp	x6, #0x0
    797c:      	cset	w6, gt
    7980:      	ubfx	x6, x6, #0, #8
    7984:      	b	0x7a94 <_stogir.vector.store-inputs+0x1c8>
    7988:      	movz	x6, #0x0, lsl #48
    798c:      	b	0x799c <_stogir.vector.store-inputs+0xd0>
    7990:      	movz	x6, #0x0, lsl #48
    7994:      	b	0x799c <_stogir.vector.store-inputs+0xd0>
    7998:      	movz	x6, #0x0, lsl #48
    799c:      	cmp	x6, #0x0
    79a0:      	b.eq	0x79d4 <_stogir.vector.store-inputs+0x108>
    79a4:      	uxtb	w16, w5
    79a8:      	cmp	w16, wzr
    79ac:      	b.eq	0x79c0 <_stogir.vector.store-inputs+0xf4>
    79b0:      	ldr	x5, [x0]
    79b4:      	add	x4, x5, x4, lsl #4
    79b8:      	ldr	x4, [x4]
    79bc:      	b	0x79cc <_stogir.vector.store-inputs+0x100>
    79c0:      	ldr	x4, [x0, #0x28]
    79c4:      	add	x4, x4, x7, lsl #4
    79c8:      	ldr	x4, [x4]
    79cc:      	mov	w5, #0x1                ; =1
    79d0:      	b	0x79dc <_stogir.vector.store-inputs+0x110>
    79d4:      	movz	w5, #0x0, lsl #16
    79d8:      	movz	x4, #0x0, lsl #48
    79dc:      	ubfx	x5, x5, #0, #32
    79e0:      	lsr	x16, x5, #0
    79e4:      	cmp	x16, #0x1
    79e8:      	b.eq	0x7a04 <_stogir.vector.store-inputs+0x138>
    79ec:      	b.lo	0x79f4 <_stogir.vector.store-inputs+0x128>
    79f0:      	b	0x7a08 <_stogir.vector.store-inputs+0x13c>
    79f4:      	cmp	x16, #0x0
    79f8:      	b.eq	0x7a00 <_stogir.vector.store-inputs+0x134>
    79fc:      	b	0x7a08 <_stogir.vector.store-inputs+0x13c>
    7a00:      	b	0x7a0c <_stogir.vector.store-inputs+0x140>
    7a04:      	b	0x7a28 <_stogir.vector.store-inputs+0x15c>
    7a08:      	b	0x7a98 <_stogir.vector.store-inputs+0x1cc>
    7a0c:      	adrp	x16, 0x7000 <_stogir.vector-arithmetic.node?+0x150>
		0000000000007a0c:  ARM64_RELOC_PAGE21	l_stogir.426
    7a10:      	ldr	x16, [x16]
		0000000000007a10:  ARM64_RELOC_PAGEOFF12	l_stogir.426
    7a14:      	orr	x0, x16, xzr
    7a18:      	mov	x19, x8
    7a1c:      	mov	x1, #0x1                ; =1
    7a20:      	mov	x2, #0x1a               ; =26
    7a24:      	b	0x7a68 <_stogir.vector.store-inputs+0x19c>
    7a28:      	ubfx	x4, x4, #0, #32
    7a2c:      	ubfx	x4, x4, #8, #8
    7a30:      	mov	x19, x8
    7a34:      	add	x8, sp, #0x10
    7a38:      	fmov	s31, w1
    7a3c:      	mov	w1, w4
    7a40:      	mov	w4, w3
    7a44:      	mov	w3, w2
    7a48:      	fmov	w2, s31
    7a4c:      	bl	0x7a4c <_stogir.vector.store-inputs+0x180>
		0000000000007a4c:  ARM64_RELOC_BRANCH26	_stogir.vector.memory-inputs
    7a50:      	add	x16, sp, #0x10
    7a54:      	ldr	x1, [x16]
    7a58:      	add	x16, sp, #0x10
    7a5c:      	ldr	x0, [x16, #0x8]
    7a60:      	add	x16, sp, #0x10
    7a64:      	ldr	x2, [x16, #0x10]
    7a68:      	str	x1, [x19]
    7a6c:      	str	x0, [x19, #0x8]
    7a70:      	str	x2, [x19, #0x10]
    7a74:      	ldr	x19, [sp, #0x30]
    7a78:      	ldr	x29, [sp]
    7a7c:      	ldr	x30, [sp, #0x8]
    7a80:      	add	sp, sp, #0x40
    7a84:      	ret
    7a88:      	movz	x6, #0x0, lsl #48
    7a8c:      	b	0x7994 <_stogir.vector.store-inputs+0xc8>
    7a90:      	movz	x6, #0x0, lsl #48
    7a94:      	b	0x798c <_stogir.vector.store-inputs+0xc0>
    7a98:      	brk	#0
    7a9c:      	b	0x7a98 <_stogir.vector.store-inputs+0x1cc>

0000000000007aa0 <_stogir.types.size>:
    7aa0:      	sxtw	x2, w0
    7aa4:      	sxtw	x3, w1
    7aa8:      	cmp	x2, #0xf
    7aac:      	cset	w4, gt
    7ab0:      	cmp	x2, #0x0
    7ab4:      	cset	w5, eq
    7ab8:      	cmp	x3, #0x4
    7abc:      	cset	w6, eq
    7ac0:      	cmp	x3, #0x8
    7ac4:      	cset	w7, eq
    7ac8:      	uxtb	w16, w4
    7acc:      	cmp	w16, wzr
    7ad0:      	b.eq	0x7b94 <_stogir.types.size+0xf4>
    7ad4:      	cmp	x2, #0x80
    7ad8:      	cset	w8, lt
    7adc:      	uxtb	w16, w8
    7ae0:      	cmp	w16, wzr
    7ae4:      	b.eq	0x7b94 <_stogir.types.size+0xf4>
    7ae8:      	and	w0, w0, #0xf
    7aec:      	ubfx	x9, x0, #0, #32
    7af0:      	cmp	x9, #0x1
    7af4:      	cset	w10, ge
    7af8:      	uxtb	w16, w10
    7afc:      	cmp	w16, wzr
    7b00:      	b.eq	0x7b94 <_stogir.types.size+0xf4>
    7b04:      	cmp	x9, #0xd
    7b08:      	cset	w9, le
    7b0c:      	uxtb	w16, w9
    7b10:      	cmp	w16, wzr
    7b14:      	b.eq	0x7b94 <_stogir.types.size+0xf4>
    7b18:      	cmp	x2, #0x0
    7b1c:      	cset	w3, ge
    7b20:      	cmp	x2, #0xd
    7b24:      	cset	w11, le
    7b28:      	uxtb	w16, w3
    7b2c:      	cmp	w16, wzr
    7b30:      	b.eq	0x7b40 <_stogir.types.size+0xa0>
    7b34:      	uxtb	w16, w11
    7b38:      	cmp	w16, wzr
    7b3c:      	b.ne	0x7b74 <_stogir.types.size+0xd4>
    7b40:      	uxtb	w16, w4
    7b44:      	cmp	w16, wzr
    7b48:      	b.eq	0x7b70 <_stogir.types.size+0xd0>
    7b4c:      	uxtb	w16, w8
    7b50:      	cmp	w16, wzr
    7b54:      	b.eq	0x7b70 <_stogir.types.size+0xd0>
    7b58:      	uxtb	w16, w10
    7b5c:      	cmp	w16, wzr
    7b60:      	b.eq	0x7b70 <_stogir.types.size+0xd0>
    7b64:      	uxtb	w16, w9
    7b68:      	cmp	w16, wzr
    7b6c:      	b.ne	0x7b74 <_stogir.types.size+0xd4>
    7b70:      	movn	w0, #0x0, lsl #16
    7b74:      	uxtb	w16, w6
    7b78:      	cmp	w16, wzr
    7b7c:      	b.ne	0x7cb4 <_stogir.types.size+0x214>
    7b80:      	uxtb	w16, w7
    7b84:      	cmp	w16, wzr
    7b88:      	b.ne	0x7cb4 <_stogir.types.size+0x214>
    7b8c:      	movn	w1, #0x0, lsl #16
    7b90:      	b	0x7c48 <_stogir.types.size+0x1a8>
    7b94:      	uxtb	w16, w6
    7b98:      	cmp	w16, wzr
    7b9c:      	b.ne	0x7bb4 <_stogir.types.size+0x114>
    7ba0:      	uxtb	w16, w7
    7ba4:      	cmp	w16, wzr
    7ba8:      	b.ne	0x7bb4 <_stogir.types.size+0x114>
    7bac:      	movn	x3, #0x0, lsl #48
    7bb0:      	b	0x7bcc <_stogir.types.size+0x12c>
    7bb4:      	uxtb	w16, w5
    7bb8:      	cmp	w16, wzr
    7bbc:      	b.eq	0x7bd4 <_stogir.types.size+0x134>
    7bc0:      	movz	x3, #0x0, lsl #48
    7bc4:      	b	0x7bcc <_stogir.types.size+0x12c>
    7bc8:      	mov	x3, #0x1                ; =1
    7bcc:      	mov	x0, x3
    7bd0:      	ret
    7bd4:      	cmp	x2, #0x1
    7bd8:      	b.eq	0x7bc8 <_stogir.types.size+0x128>
    7bdc:      	cmp	x2, #0x2
    7be0:      	b.eq	0x7bc8 <_stogir.types.size+0x128>
    7be4:      	cmp	x2, #0x7
    7be8:      	b.eq	0x7bc8 <_stogir.types.size+0x128>
    7bec:      	cmp	x2, #0x8
    7bf0:      	b.eq	0x7bc8 <_stogir.types.size+0x128>
    7bf4:      	cmp	x2, #0x3
    7bf8:      	b.eq	0x7d38 <_stogir.types.size+0x298>
    7bfc:      	cmp	x2, #0x9
    7c00:      	b.eq	0x7d38 <_stogir.types.size+0x298>
    7c04:      	cmp	x2, #0x4
    7c08:      	b.eq	0x7d68 <_stogir.types.size+0x2c8>
    7c0c:      	cmp	x2, #0xa
    7c10:      	b.eq	0x7d68 <_stogir.types.size+0x2c8>
    7c14:      	cmp	x2, #0xd
    7c18:      	b.eq	0x7d68 <_stogir.types.size+0x2c8>
    7c1c:      	cmp	x2, #0x5
    7c20:      	b.eq	0x7d78 <_stogir.types.size+0x2d8>
    7c24:      	cmp	x2, #0xb
    7c28:      	b.eq	0x7d78 <_stogir.types.size+0x2d8>
    7c2c:      	cmp	x2, #0xc
    7c30:      	b.eq	0x7d78 <_stogir.types.size+0x2d8>
    7c34:      	cmp	x2, #0x6
    7c38:      	b.eq	0x7c40 <_stogir.types.size+0x1a0>
    7c3c:      	movn	x3, #0x0, lsl #48
    7c40:      	b	0x7d7c <_stogir.types.size+0x2dc>
    7c44:      	mov	w1, #0x1                ; =1
    7c48:      	sxtw	x0, w1
    7c4c:      	cmp	x0, #0x0
    7c50:      	b.ge	0x7c5c <_stogir.types.size+0x1bc>
    7c54:      	movn	x3, #0x0, lsl #48
    7c58:      	b	0x7bcc <_stogir.types.size+0x12c>
    7c5c:      	uxtb	w16, w4
    7c60:      	cmp	w16, wzr
    7c64:      	b.eq	0x7d40 <_stogir.types.size+0x2a0>
    7c68:      	uxtb	w16, w8
    7c6c:      	cmp	w16, wzr
    7c70:      	b.eq	0x7d40 <_stogir.types.size+0x2a0>
    7c74:      	uxtb	w16, w10
    7c78:      	cmp	w16, wzr
    7c7c:      	b.eq	0x7d40 <_stogir.types.size+0x2a0>
    7c80:      	uxtb	w16, w9
    7c84:      	cmp	w16, wzr
    7c88:      	b.eq	0x7d40 <_stogir.types.size+0x2a0>
    7c8c:      	ubfx	x0, x2, #4, #32
    7c90:      	sub	w0, w0, #0x1
    7c94:      	sxtw	x0, w0
    7c98:      	mov	x16, #0x1               ; =1
    7c9c:      	lsl	x0, x16, x0
    7ca0:      	b	0x7ca8 <_stogir.types.size+0x208>
    7ca4:      	movn	w0, #0x0, lsl #16
    7ca8:      	mul	w0, w0, w1
    7cac:      	sxtw	x3, w0
    7cb0:      	b	0x7c58 <_stogir.types.size+0x1b8>
    7cb4:      	sxtw	x0, w0
    7cb8:      	cmp	x0, #0x0
    7cbc:      	b.ne	0x7cc8 <_stogir.types.size+0x228>
    7cc0:      	movz	w1, #0x0, lsl #16
    7cc4:      	b	0x7c48 <_stogir.types.size+0x1a8>
    7cc8:      	cmp	x0, #0x1
    7ccc:      	b.eq	0x7c44 <_stogir.types.size+0x1a4>
    7cd0:      	cmp	x0, #0x2
    7cd4:      	b.eq	0x7c44 <_stogir.types.size+0x1a4>
    7cd8:      	cmp	x0, #0x7
    7cdc:      	b.eq	0x7c44 <_stogir.types.size+0x1a4>
    7ce0:      	cmp	x0, #0x8
    7ce4:      	b.eq	0x7c44 <_stogir.types.size+0x1a4>
    7ce8:      	cmp	x0, #0x3
    7cec:      	b.eq	0x7d70 <_stogir.types.size+0x2d0>
    7cf0:      	cmp	x0, #0x9
    7cf4:      	b.eq	0x7d70 <_stogir.types.size+0x2d0>
    7cf8:      	cmp	x0, #0x4
    7cfc:      	b.eq	0x7d80 <_stogir.types.size+0x2e0>
    7d00:      	cmp	x0, #0xa
    7d04:      	b.eq	0x7d80 <_stogir.types.size+0x2e0>
    7d08:      	cmp	x0, #0xd
    7d0c:      	b.eq	0x7d80 <_stogir.types.size+0x2e0>
    7d10:      	cmp	x0, #0x5
    7d14:      	b.eq	0x7d88 <_stogir.types.size+0x2e8>
    7d18:      	cmp	x0, #0xb
    7d1c:      	b.eq	0x7d88 <_stogir.types.size+0x2e8>
    7d20:      	cmp	x0, #0xc
    7d24:      	b.eq	0x7d88 <_stogir.types.size+0x2e8>
    7d28:      	cmp	x0, #0x6
    7d2c:      	b.eq	0x7d34 <_stogir.types.size+0x294>
    7d30:      	movn	w1, #0x0, lsl #16
    7d34:      	b	0x7d8c <_stogir.types.size+0x2ec>
    7d38:      	mov	x3, #0x2                ; =2
    7d3c:      	b	0x7bcc <_stogir.types.size+0x12c>
    7d40:      	uxtb	w16, w3
    7d44:      	cmp	w16, wzr
    7d48:      	b.eq	0x7ca4 <_stogir.types.size+0x204>
    7d4c:      	uxtb	w16, w11
    7d50:      	cmp	w16, wzr
    7d54:      	b.eq	0x7ca4 <_stogir.types.size+0x204>
    7d58:      	uxtb	w16, w5
    7d5c:      	cmp	w16, wzr
    7d60:      	cset	w0, eq
    7d64:      	b	0x7ca8 <_stogir.types.size+0x208>
    7d68:      	mov	x3, #0x4                ; =4
    7d6c:      	b	0x7d3c <_stogir.types.size+0x29c>
    7d70:      	mov	w1, #0x2                ; =2
    7d74:      	b	0x7c48 <_stogir.types.size+0x1a8>
    7d78:      	mov	x3, #0x8                ; =8
    7d7c:      	b	0x7d6c <_stogir.types.size+0x2cc>
    7d80:      	mov	w1, #0x4                ; =4
    7d84:      	b	0x7d74 <_stogir.types.size+0x2d4>
    7d88:      	mov	w1, #0x8                ; =8
    7d8c:      	b	0x7d84 <_stogir.types.size+0x2e4>

0000000000007d90 <_stogir.checked.projection>:
    7d90:      	sub	sp, sp, #0x40
    7d94:      	str	x29, [sp]
    7d98:      	str	x30, [sp, #0x8]
    7d9c:      	mov	x29, sp
    7da0:      	str	x19, [sp, #0x30]
    7da4:      	sxtw	x2, w1
    7da8:      	cmp	x2, #0x0
    7dac:      	cset	w3, gt
    7db0:      	movz	x16, #0x0, lsl #48
    7db4:      	sub	x4, x16, x2
    7db8:      	sub	x5, x4, #0x1
    7dbc:      	uxtb	w16, w3
    7dc0:      	cmp	w16, wzr
    7dc4:      	b.eq	0x7e04 <_stogir.checked.projection+0x74>
    7dc8:      	ldr	x4, [x0, #0x8]
    7dcc:      	cmp	x2, x4
    7dd0:      	b.ge	0x7e54 <_stogir.checked.projection+0xc4>
    7dd4:      	add	x4, x0, #0x78
    7dd8:      	ldr	x4, [x4, #0x8]
    7ddc:      	cmp	x2, x4
    7de0:      	b.ge	0x7f5c <_stogir.checked.projection+0x1cc>
    7de4:      	ldr	x4, [x0, #0x78]
    7de8:      	add	x4, x4, x2, lsl #2
    7dec:      	ldr	w4, [x4]
    7df0:      	sxtw	x4, w4
    7df4:      	cmp	x4, #0x0
    7df8:      	cset	w4, ge
    7dfc:      	ubfx	x4, x4, #0, #8
    7e00:      	b	0x7f60 <_stogir.checked.projection+0x1d0>
    7e04:      	cmp	x2, #0x0
    7e08:      	b.ge	0x7e5c <_stogir.checked.projection+0xcc>
    7e0c:      	add	x6, x0, #0x28
    7e10:      	add	x7, x0, #0x50
    7e14:      	ldr	x6, [x6, #0x8]
    7e18:      	ldr	x7, [x7, #0x8]
    7e1c:      	cmp	x6, x7
    7e20:      	b.ne	0x7e4c <_stogir.checked.projection+0xbc>
    7e24:      	cmp	x4, x6
    7e28:      	b.gt	0x7f8c <_stogir.checked.projection+0x1fc>
    7e2c:      	ldr	x4, [x0, #0x50]
    7e30:      	add	x4, x4, x5, lsl #2
    7e34:      	ldr	w4, [x4]
    7e38:      	sxtw	x4, w4
    7e3c:      	cmp	x4, #0x0
    7e40:      	cset	w4, gt
    7e44:      	ubfx	x4, x4, #0, #8
    7e48:      	b	0x7f90 <_stogir.checked.projection+0x200>
    7e4c:      	movz	x4, #0x0, lsl #48
    7e50:      	b	0x7e60 <_stogir.checked.projection+0xd0>
    7e54:      	movz	x4, #0x0, lsl #48
    7e58:      	b	0x7e60 <_stogir.checked.projection+0xd0>
    7e5c:      	movz	x4, #0x0, lsl #48
    7e60:      	cmp	x4, #0x0
    7e64:      	b.eq	0x7e98 <_stogir.checked.projection+0x108>
    7e68:      	uxtb	w16, w3
    7e6c:      	cmp	w16, wzr
    7e70:      	b.eq	0x7e84 <_stogir.checked.projection+0xf4>
    7e74:      	ldr	x3, [x0]
    7e78:      	add	x2, x3, x2, lsl #4
    7e7c:      	ldr	x2, [x2]
    7e80:      	b	0x7e90 <_stogir.checked.projection+0x100>
    7e84:      	ldr	x2, [x0, #0x28]
    7e88:      	add	x2, x2, x5, lsl #4
    7e8c:      	ldr	x2, [x2]
    7e90:      	mov	w3, #0x1                ; =1
    7e94:      	b	0x7ea0 <_stogir.checked.projection+0x110>
    7e98:      	movz	w3, #0x0, lsl #16
    7e9c:      	movz	x2, #0x0, lsl #48
    7ea0:      	ubfx	x3, x3, #0, #32
    7ea4:      	lsr	x16, x3, #0
    7ea8:      	cmp	x16, #0x1
    7eac:      	b.eq	0x7ec8 <_stogir.checked.projection+0x138>
    7eb0:      	b.lo	0x7eb8 <_stogir.checked.projection+0x128>
    7eb4:      	b	0x7ecc <_stogir.checked.projection+0x13c>
    7eb8:      	cmp	x16, #0x0
    7ebc:      	b.eq	0x7ec4 <_stogir.checked.projection+0x134>
    7ec0:      	b	0x7ecc <_stogir.checked.projection+0x13c>
    7ec4:      	b	0x7ed0 <_stogir.checked.projection+0x140>
    7ec8:      	b	0x7f20 <_stogir.checked.projection+0x190>
    7ecc:      	b	0x7f94 <_stogir.checked.projection+0x204>
    7ed0:      	adrp	x16, 0x7000 <_stogir.vector-arithmetic.node?+0x150>
		0000000000007ed0:  ARM64_RELOC_PAGE21	l_stogir.427
    7ed4:      	ldr	x16, [x16]
		0000000000007ed4:  ARM64_RELOC_PAGEOFF12	l_stogir.427
    7ed8:      	orr	x0, x16, xzr
    7edc:      	mov	x19, x8
    7ee0:      	mov	x1, #0x1                ; =1
    7ee4:      	mov	x2, #0x17               ; =23
    7ee8:      	b	0x7f00 <_stogir.checked.projection+0x170>
    7eec:      	adrp	x16, 0x7000 <_stogir.vector-arithmetic.node?+0x150>
		0000000000007eec:  ARM64_RELOC_PAGE21	l_stogir.428
    7ef0:      	ldr	x16, [x16]
		0000000000007ef0:  ARM64_RELOC_PAGEOFF12	l_stogir.428
    7ef4:      	orr	x0, x16, xzr
    7ef8:      	mov	x1, #0x1                ; =1
    7efc:      	mov	x2, #0x20               ; =32
    7f00:      	str	x1, [x19]
    7f04:      	str	x0, [x19, #0x8]
    7f08:      	str	x2, [x19, #0x10]
    7f0c:      	ldr	x19, [sp, #0x30]
    7f10:      	ldr	x29, [sp]
    7f14:      	ldr	x30, [sp, #0x8]
    7f18:      	add	sp, sp, #0x40
    7f1c:      	ret
    7f20:      	uxtb	w3, w2
    7f24:      	cmp	x3, #0x29
    7f28:      	b.lt	0x7f9c <_stogir.checked.projection+0x20c>
    7f2c:      	cmp	x3, #0x2b
    7f30:      	b.gt	0x7fa4 <_stogir.checked.projection+0x214>
    7f34:      	mov	x19, x8
    7f38:      	add	x8, sp, #0x10
    7f3c:      	bl	0x7f3c <_stogir.checked.projection+0x1ac>
		0000000000007f3c:  ARM64_RELOC_BRANCH26	_stogir.checked.validate
    7f40:      	add	x16, sp, #0x10
    7f44:      	ldr	x1, [x16]
    7f48:      	add	x16, sp, #0x10
    7f4c:      	ldr	x0, [x16, #0x8]
    7f50:      	add	x16, sp, #0x10
    7f54:      	ldr	x2, [x16, #0x10]
    7f58:      	b	0x7f00 <_stogir.checked.projection+0x170>
    7f5c:      	movz	x4, #0x0, lsl #48
    7f60:      	b	0x7e58 <_stogir.checked.projection+0xc8>
    7f64:      	ubfx	x2, x2, #0, #32
    7f68:      	ubfx	x0, x2, #8, #8
    7f6c:      	cmp	x0, #0x0
    7f70:      	b.eq	0x7eec <_stogir.checked.projection+0x15c>
    7f74:      	cmp	x0, #0xd
    7f78:      	b.gt	0x7eec <_stogir.checked.projection+0x15c>
    7f7c:      	movz	x1, #0x0, lsl #48
    7f80:      	movz	x0, #0x0, lsl #48
    7f84:      	movz	x2, #0x0, lsl #48
    7f88:      	b	0x7f00 <_stogir.checked.projection+0x170>
    7f8c:      	movz	x4, #0x0, lsl #48
    7f90:      	b	0x7e50 <_stogir.checked.projection+0xc0>
    7f94:      	brk	#0
    7f98:      	b	0x7f94 <_stogir.checked.projection+0x204>
    7f9c:      	mov	x19, x8
    7fa0:      	b	0x7f64 <_stogir.checked.projection+0x1d4>
    7fa4:      	mov	x19, x8
    7fa8:      	b	0x7f64 <_stogir.checked.projection+0x1d4>

0000000000007fac <_stogir.atomic.ordinary?>:
    7fac:      	sxtw	x1, w1
    7fb0:      	cmp	x1, #0x0
    7fb4:      	cset	w3, gt
    7fb8:      	movz	x16, #0x0, lsl #48
    7fbc:      	sub	x4, x16, x1
    7fc0:      	sub	x5, x4, #0x1
    7fc4:      	uxtb	w16, w3
    7fc8:      	cmp	w16, wzr
    7fcc:      	b.eq	0x800c <_stogir.atomic.ordinary?+0x60>
    7fd0:      	ldr	x4, [x0, #0x8]
    7fd4:      	cmp	x1, x4
    7fd8:      	b.ge	0x805c <_stogir.atomic.ordinary?+0xb0>
    7fdc:      	add	x4, x0, #0x78
    7fe0:      	ldr	x4, [x4, #0x8]
    7fe4:      	cmp	x1, x4
    7fe8:      	b.ge	0x8114 <_stogir.atomic.ordinary?+0x168>
    7fec:      	ldr	x4, [x0, #0x78]
    7ff0:      	add	x4, x4, x1, lsl #2
    7ff4:      	ldr	w4, [x4]
    7ff8:      	sxtw	x4, w4
    7ffc:      	cmp	x4, #0x0
    8000:      	cset	w4, ge
    8004:      	ubfx	x4, x4, #0, #8
    8008:      	b	0x8118 <_stogir.atomic.ordinary?+0x16c>
    800c:      	cmp	x1, #0x0
    8010:      	b.ge	0x8064 <_stogir.atomic.ordinary?+0xb8>
    8014:      	add	x6, x0, #0x28
    8018:      	add	x7, x0, #0x50
    801c:      	ldr	x6, [x6, #0x8]
    8020:      	ldr	x7, [x7, #0x8]
    8024:      	cmp	x6, x7
    8028:      	b.ne	0x8054 <_stogir.atomic.ordinary?+0xa8>
    802c:      	cmp	x4, x6
    8030:      	b.gt	0x8134 <_stogir.atomic.ordinary?+0x188>
    8034:      	ldr	x4, [x0, #0x50]
    8038:      	add	x4, x4, x5, lsl #2
    803c:      	ldr	w4, [x4]
    8040:      	sxtw	x4, w4
    8044:      	cmp	x4, #0x0
    8048:      	cset	w4, gt
    804c:      	ubfx	x4, x4, #0, #8
    8050:      	b	0x8138 <_stogir.atomic.ordinary?+0x18c>
    8054:      	movz	x4, #0x0, lsl #48
    8058:      	b	0x8068 <_stogir.atomic.ordinary?+0xbc>
    805c:      	movz	x4, #0x0, lsl #48
    8060:      	b	0x8068 <_stogir.atomic.ordinary?+0xbc>
    8064:      	movz	x4, #0x0, lsl #48
    8068:      	cmp	x4, #0x0
    806c:      	b.eq	0x80a0 <_stogir.atomic.ordinary?+0xf4>
    8070:      	uxtb	w16, w3
    8074:      	cmp	w16, wzr
    8078:      	b.eq	0x808c <_stogir.atomic.ordinary?+0xe0>
    807c:      	ldr	x0, [x0]
    8080:      	add	x0, x0, x1, lsl #4
    8084:      	ldr	x0, [x0]
    8088:      	b	0x8098 <_stogir.atomic.ordinary?+0xec>
    808c:      	ldr	x0, [x0, #0x28]
    8090:      	add	x0, x0, x5, lsl #4
    8094:      	ldr	x0, [x0]
    8098:      	mov	w1, #0x1                ; =1
    809c:      	b	0x80a8 <_stogir.atomic.ordinary?+0xfc>
    80a0:      	movz	w1, #0x0, lsl #16
    80a4:      	movz	x0, #0x0, lsl #48
    80a8:      	ubfx	x1, x1, #0, #32
    80ac:      	lsr	x16, x1, #0
    80b0:      	cmp	x16, #0x1
    80b4:      	b.eq	0x80d0 <_stogir.atomic.ordinary?+0x124>
    80b8:      	b.lo	0x80c0 <_stogir.atomic.ordinary?+0x114>
    80bc:      	b	0x80d4 <_stogir.atomic.ordinary?+0x128>
    80c0:      	cmp	x16, #0x0
    80c4:      	b.eq	0x80cc <_stogir.atomic.ordinary?+0x120>
    80c8:      	b	0x80d4 <_stogir.atomic.ordinary?+0x128>
    80cc:      	b	0x80d8 <_stogir.atomic.ordinary?+0x12c>
    80d0:      	b	0x80e8 <_stogir.atomic.ordinary?+0x13c>
    80d4:      	b	0x813c <_stogir.atomic.ordinary?+0x190>
    80d8:      	movz	x0, #0x0, lsl #48
    80dc:      	b	0x80e4 <_stogir.atomic.ordinary?+0x138>
    80e0:      	movz	x0, #0x0, lsl #48
    80e4:      	ret
    80e8:      	sxtw	x2, w2
    80ec:      	orr	w1, w0, wzr
    80f0:      	ubfx	x1, x1, #0, #32
    80f4:      	ubfx	x1, x1, #8, #8
    80f8:      	cmp	x1, x2
    80fc:      	b.ne	0x80e0 <_stogir.atomic.ordinary?+0x134>
    8100:      	uxtb	w0, w0
    8104:      	cmp	x0, #0x46
    8108:      	b.ne	0x811c <_stogir.atomic.ordinary?+0x170>
    810c:      	movz	x0, #0x0, lsl #48
    8110:      	b	0x8130 <_stogir.atomic.ordinary?+0x184>
    8114:      	movz	x4, #0x0, lsl #48
    8118:      	b	0x8060 <_stogir.atomic.ordinary?+0xb4>
    811c:      	cmp	x0, #0x48
    8120:      	cset	w0, eq
    8124:      	uxtb	w16, w0
    8128:      	cmp	w16, wzr
    812c:      	cset	x0, eq
    8130:      	b	0x80e4 <_stogir.atomic.ordinary?+0x138>
    8134:      	movz	x4, #0x0, lsl #48
    8138:      	b	0x8058 <_stogir.atomic.ordinary?+0xac>
    813c:      	brk	#0
    8140:      	b	0x813c <_stogir.atomic.ordinary?+0x190>

0000000000008144 <_stogir.types.scalar-size>:
    8144:      	sxtw	x1, w1
    8148:      	cmp	x1, #0x4
    814c:      	b.eq	0x8160 <_stogir.types.scalar-size+0x1c>
    8150:      	cmp	x1, #0x8
    8154:      	b.eq	0x8160 <_stogir.types.scalar-size+0x1c>
    8158:      	movn	x1, #0x0, lsl #48
    815c:      	b	0x8178 <_stogir.types.scalar-size+0x34>
    8160:      	sxtw	x0, w0
    8164:      	cmp	x0, #0x0
    8168:      	b.ne	0x8180 <_stogir.types.scalar-size+0x3c>
    816c:      	movz	x1, #0x0, lsl #48
    8170:      	b	0x8178 <_stogir.types.scalar-size+0x34>
    8174:      	mov	x1, #0x1                ; =1
    8178:      	mov	x0, x1
    817c:      	ret
    8180:      	cmp	x0, #0x1
    8184:      	b.eq	0x8174 <_stogir.types.scalar-size+0x30>
    8188:      	cmp	x0, #0x2
    818c:      	b.eq	0x8174 <_stogir.types.scalar-size+0x30>
    8190:      	cmp	x0, #0x7
    8194:      	b.eq	0x8174 <_stogir.types.scalar-size+0x30>
    8198:      	cmp	x0, #0x8
    819c:      	b.eq	0x8174 <_stogir.types.scalar-size+0x30>
    81a0:      	cmp	x0, #0x3
    81a4:      	b.eq	0x81f0 <_stogir.types.scalar-size+0xac>
    81a8:      	cmp	x0, #0x9
    81ac:      	b.eq	0x81f0 <_stogir.types.scalar-size+0xac>
    81b0:      	cmp	x0, #0x4
    81b4:      	b.eq	0x81f8 <_stogir.types.scalar-size+0xb4>
    81b8:      	cmp	x0, #0xa
    81bc:      	b.eq	0x81f8 <_stogir.types.scalar-size+0xb4>
    81c0:      	cmp	x0, #0xd
    81c4:      	b.eq	0x81f8 <_stogir.types.scalar-size+0xb4>
    81c8:      	cmp	x0, #0x5
    81cc:      	b.eq	0x8200 <_stogir.types.scalar-size+0xbc>
    81d0:      	cmp	x0, #0xb
    81d4:      	b.eq	0x8200 <_stogir.types.scalar-size+0xbc>
    81d8:      	cmp	x0, #0xc
    81dc:      	b.eq	0x8200 <_stogir.types.scalar-size+0xbc>
    81e0:      	cmp	x0, #0x6
    81e4:      	b.eq	0x81ec <_stogir.types.scalar-size+0xa8>
    81e8:      	movn	x1, #0x0, lsl #48
    81ec:      	b	0x8204 <_stogir.types.scalar-size+0xc0>
    81f0:      	mov	x1, #0x2                ; =2
    81f4:      	b	0x8178 <_stogir.types.scalar-size+0x34>
    81f8:      	mov	x1, #0x4                ; =4
    81fc:      	b	0x81f4 <_stogir.types.scalar-size+0xb0>
    8200:      	mov	x1, #0x8                ; =8
    8204:      	b	0x81fc <_stogir.types.scalar-size+0xb8>

0000000000008208 <_stogir.terminal.inputs>:
    8208:      	sxtw	x1, w1
    820c:      	cmp	x1, #0x60
    8210:      	cset	w4, eq
    8214:      	uxtb	w16, w4
    8218:      	cmp	w16, wzr
    821c:      	b.ne	0x824c <_stogir.terminal.inputs+0x44>
    8220:      	cmp	x1, #0x79
    8224:      	b.eq	0x824c <_stogir.terminal.inputs+0x44>
    8228:      	adrp	x16, 0x8000 <_stogir.atomic.ordinary?+0x54>
		0000000000008228:  ARM64_RELOC_PAGE21	l_stogir.429
    822c:      	ldr	x16, [x16]
		000000000000822c:  ARM64_RELOC_PAGEOFF12	l_stogir.429
    8230:      	orr	x0, x16, xzr
    8234:      	mov	x1, #0x1                ; =1
    8238:      	mov	x2, #0x25               ; =37
    823c:      	str	x1, [x8]
    8240:      	str	x0, [x8, #0x8]
    8244:      	str	x2, [x8, #0x10]
    8248:      	ret
    824c:      	sxtw	x3, w3
    8250:      	uxtb	w16, w4
    8254:      	cmp	w16, wzr
    8258:      	b.eq	0x8264 <_stogir.terminal.inputs+0x5c>
    825c:      	cmp	x3, #0x0
    8260:      	b.ne	0x8228 <_stogir.terminal.inputs+0x20>
    8264:      	sxtw	x2, w2
    8268:      	cmp	x2, #0x0
    826c:      	cset	w1, gt
    8270:      	movz	x16, #0x0, lsl #48
    8274:      	sub	x4, x16, x2
    8278:      	sub	x5, x4, #0x1
    827c:      	uxtb	w16, w1
    8280:      	cmp	w16, wzr
    8284:      	b.eq	0x8358 <_stogir.terminal.inputs+0x150>
    8288:      	ldr	x4, [x0, #0x8]
    828c:      	cmp	x2, x4
    8290:      	b.ge	0x8350 <_stogir.terminal.inputs+0x148>
    8294:      	add	x4, x0, #0x78
    8298:      	ldr	x4, [x4, #0x8]
    829c:      	cmp	x2, x4
    82a0:      	b.ge	0x83f8 <_stogir.terminal.inputs+0x1f0>
    82a4:      	ldr	x4, [x0, #0x78]
    82a8:      	add	x4, x4, x2, lsl #2
    82ac:      	ldr	w4, [x4]
    82b0:      	sxtw	x4, w4
    82b4:      	cmp	x4, #0x0
    82b8:      	cset	w4, ge
    82bc:      	ubfx	x4, x4, #0, #8
    82c0:      	b	0x83fc <_stogir.terminal.inputs+0x1f4>
    82c4:      	movz	w4, #0x0, lsl #16
    82c8:      	movz	x1, #0x0, lsl #48
    82cc:      	ubfx	x4, x4, #0, #32
    82d0:      	lsr	x16, x4, #0
    82d4:      	cmp	x16, #0x1
    82d8:      	b.eq	0x82f4 <_stogir.terminal.inputs+0xec>
    82dc:      	b.lo	0x82e4 <_stogir.terminal.inputs+0xdc>
    82e0:      	b	0x82f8 <_stogir.terminal.inputs+0xf0>
    82e4:      	cmp	x16, #0x0
    82e8:      	b.eq	0x82f0 <_stogir.terminal.inputs+0xe8>
    82ec:      	b	0x82f8 <_stogir.terminal.inputs+0xf0>
    82f0:      	b	0x82fc <_stogir.terminal.inputs+0xf4>
    82f4:      	b	0x83a0 <_stogir.terminal.inputs+0x198>
    82f8:      	b	0x854c <_stogir.terminal.inputs+0x344>
    82fc:      	adrp	x16, 0x8000 <_stogir.atomic.ordinary?+0x54>
		00000000000082fc:  ARM64_RELOC_PAGE21	l_stogir.430
    8300:      	ldr	x16, [x16]
		0000000000008300:  ARM64_RELOC_PAGEOFF12	l_stogir.430
    8304:      	orr	x0, x16, xzr
    8308:      	mov	x1, #0x1                ; =1
    830c:      	mov	x2, #0x1d               ; =29
    8310:      	b	0x823c <_stogir.terminal.inputs+0x34>
    8314:      	ldr	x1, [x0, #0x28]
    8318:      	add	x1, x1, x5, lsl #4
    831c:      	ldr	x1, [x1]
    8320:      	mov	w4, #0x1                ; =1
    8324:      	b	0x82cc <_stogir.terminal.inputs+0xc4>
    8328:      	movz	x4, #0x0, lsl #48
    832c:      	cmp	x4, #0x0
    8330:      	b.eq	0x82c4 <_stogir.terminal.inputs+0xbc>
    8334:      	uxtb	w16, w1
    8338:      	cmp	w16, wzr
    833c:      	b.eq	0x8314 <_stogir.terminal.inputs+0x10c>
    8340:      	ldr	x1, [x0]
    8344:      	add	x1, x1, x2, lsl #4
    8348:      	ldr	x1, [x1]
    834c:      	b	0x8320 <_stogir.terminal.inputs+0x118>
    8350:      	movz	x4, #0x0, lsl #48
    8354:      	b	0x832c <_stogir.terminal.inputs+0x124>
    8358:      	cmp	x2, #0x0
    835c:      	b.ge	0x8328 <_stogir.terminal.inputs+0x120>
    8360:      	add	x6, x0, #0x28
    8364:      	add	x7, x0, #0x50
    8368:      	ldr	x6, [x6, #0x8]
    836c:      	ldr	x7, [x7, #0x8]
    8370:      	cmp	x6, x7
    8374:      	b.ne	0x83f0 <_stogir.terminal.inputs+0x1e8>
    8378:      	cmp	x4, x6
    837c:      	b.gt	0x8400 <_stogir.terminal.inputs+0x1f8>
    8380:      	ldr	x4, [x0, #0x50]
    8384:      	add	x4, x4, x5, lsl #2
    8388:      	ldr	w4, [x4]
    838c:      	sxtw	x4, w4
    8390:      	cmp	x4, #0x0
    8394:      	cset	w4, gt
    8398:      	ubfx	x4, x4, #0, #8
    839c:      	b	0x8404 <_stogir.terminal.inputs+0x1fc>
    83a0:      	cmp	x2, #0x0
    83a4:      	b.le	0x83d8 <_stogir.terminal.inputs+0x1d0>
    83a8:      	uxtb	w1, w1
    83ac:      	cmp	x1, #0x83
    83b0:      	cset	w2, lt
    83b4:      	uxtb	w16, w2
    83b8:      	cmp	w16, wzr
    83bc:      	b.eq	0x8408 <_stogir.terminal.inputs+0x200>
    83c0:      	adrp	x16, 0x8000 <_stogir.atomic.ordinary?+0x54>
		00000000000083c0:  ARM64_RELOC_PAGE21	l_stogir.431
    83c4:      	ldr	x16, [x16]
		00000000000083c4:  ARM64_RELOC_PAGEOFF12	l_stogir.431
    83c8:      	orr	x4, x16, xzr
    83cc:      	add	x4, x1, x4
    83d0:      	ldrb	w4, [x4]
    83d4:      	b	0x840c <_stogir.terminal.inputs+0x204>
    83d8:      	adrp	x16, 0x8000 <_stogir.atomic.ordinary?+0x54>
		00000000000083d8:  ARM64_RELOC_PAGE21	l_stogir.432
    83dc:      	ldr	x16, [x16]
		00000000000083dc:  ARM64_RELOC_PAGEOFF12	l_stogir.432
    83e0:      	orr	x0, x16, xzr
    83e4:      	mov	x1, #0x1                ; =1
    83e8:      	mov	x2, #0x2c               ; =44
    83ec:      	b	0x8310 <_stogir.terminal.inputs+0x108>
    83f0:      	movz	x4, #0x0, lsl #48
    83f4:      	b	0x832c <_stogir.terminal.inputs+0x124>
    83f8:      	movz	x4, #0x0, lsl #48
    83fc:      	b	0x8354 <_stogir.terminal.inputs+0x14c>
    8400:      	movz	x4, #0x0, lsl #48
    8404:      	b	0x83f4 <_stogir.terminal.inputs+0x1ec>
    8408:      	movz	w4, #0x0, lsl #16
    840c:      	uxtb	w16, w4
    8410:      	and	w4, w16, #0x1
    8414:      	uxtb	w4, w4
    8418:      	ubfx	x4, x4, #0, #8
    841c:      	cmp	x4, #0x0
    8420:      	b.eq	0x83d8 <_stogir.terminal.inputs+0x1d0>
    8424:      	uxtb	w16, w2
    8428:      	cmp	w16, wzr
    842c:      	b.eq	0x8448 <_stogir.terminal.inputs+0x240>
    8430:      	adrp	x16, 0x8000 <_stogir.atomic.ordinary?+0x54>
		0000000000008430:  ARM64_RELOC_PAGE21	l_stogir.431
    8434:      	ldr	x16, [x16]
		0000000000008434:  ARM64_RELOC_PAGEOFF12	l_stogir.431
    8438:      	orr	x2, x16, xzr
    843c:      	add	x1, x1, x2
    8440:      	ldrb	w1, [x1]
    8444:      	b	0x844c <_stogir.terminal.inputs+0x244>
    8448:      	movz	w1, #0x0, lsl #16
    844c:      	uxtb	w16, w1
    8450:      	and	w1, w16, #0x4
    8454:      	uxtb	w1, w1
    8458:      	ubfx	x1, x1, #0, #8
    845c:      	cmp	x1, #0x0
    8460:      	cset	w1, eq
    8464:      	uxtb	w16, w1
    8468:      	cmp	w16, wzr
    846c:      	cset	x1, eq
    8470:      	cmp	x1, #0x0
    8474:      	b.ne	0x83d8 <_stogir.terminal.inputs+0x1d0>
    8478:      	cmp	x3, #0x0
    847c:      	b.ne	0x8490 <_stogir.terminal.inputs+0x288>
    8480:      	movz	x1, #0x0, lsl #48
    8484:      	movz	x0, #0x0, lsl #48
    8488:      	movz	x2, #0x0, lsl #48
    848c:      	b	0x83ec <_stogir.terminal.inputs+0x1e4>
    8490:      	cmp	x3, #0x0
    8494:      	cset	w1, gt
    8498:      	movz	x16, #0x0, lsl #48
    849c:      	sub	x2, x16, x3
    84a0:      	sub	x4, x2, #0x1
    84a4:      	uxtb	w16, w1
    84a8:      	cmp	w16, wzr
    84ac:      	b.eq	0x8504 <_stogir.terminal.inputs+0x2fc>
    84b0:      	ldr	x2, [x0, #0x8]
    84b4:      	cmp	x3, x2
    84b8:      	b.ge	0x8554 <_stogir.terminal.inputs+0x34c>
    84bc:      	add	x2, x0, #0x78
    84c0:      	ldr	x2, [x2, #0x8]
    84c4:      	cmp	x3, x2
    84c8:      	b.ge	0x861c <_stogir.terminal.inputs+0x414>
    84cc:      	ldr	x2, [x0, #0x78]
    84d0:      	add	x2, x2, x3, lsl #2
    84d4:      	ldr	w2, [x2]
    84d8:      	sxtw	x2, w2
    84dc:      	cmp	x2, #0x0
    84e0:      	cset	w2, ge
    84e4:      	ubfx	x2, x2, #0, #8
    84e8:      	b	0x8620 <_stogir.terminal.inputs+0x418>
    84ec:      	adrp	x16, 0x8000 <_stogir.atomic.ordinary?+0x54>
		00000000000084ec:  ARM64_RELOC_PAGE21	l_stogir.433
    84f0:      	ldr	x16, [x16]
		00000000000084f0:  ARM64_RELOC_PAGEOFF12	l_stogir.433
    84f4:      	orr	x0, x16, xzr
    84f8:      	mov	x1, #0x1                ; =1
    84fc:      	mov	x2, #0x2e               ; =46
    8500:      	b	0x848c <_stogir.terminal.inputs+0x284>
    8504:      	cmp	x3, #0x0
    8508:      	b.ge	0x855c <_stogir.terminal.inputs+0x354>
    850c:      	add	x5, x0, #0x28
    8510:      	add	x6, x0, #0x50
    8514:      	ldr	x5, [x5, #0x8]
    8518:      	ldr	x6, [x6, #0x8]
    851c:      	cmp	x5, x6
    8520:      	b.ne	0x8614 <_stogir.terminal.inputs+0x40c>
    8524:      	cmp	x2, x5
    8528:      	b.gt	0x8624 <_stogir.terminal.inputs+0x41c>
    852c:      	ldr	x2, [x0, #0x50]
    8530:      	add	x2, x2, x4, lsl #2
    8534:      	ldr	w2, [x2]
    8538:      	sxtw	x2, w2
    853c:      	cmp	x2, #0x0
    8540:      	cset	w2, gt
    8544:      	ubfx	x2, x2, #0, #8
    8548:      	b	0x8628 <_stogir.terminal.inputs+0x420>
    854c:      	brk	#0
    8550:      	b	0x854c <_stogir.terminal.inputs+0x344>
    8554:      	movz	x2, #0x0, lsl #48
    8558:      	b	0x8560 <_stogir.terminal.inputs+0x358>
    855c:      	movz	x2, #0x0, lsl #48
    8560:      	cmp	x2, #0x0
    8564:      	b.eq	0x8598 <_stogir.terminal.inputs+0x390>
    8568:      	uxtb	w16, w1
    856c:      	cmp	w16, wzr
    8570:      	b.eq	0x8584 <_stogir.terminal.inputs+0x37c>
    8574:      	ldr	x0, [x0]
    8578:      	add	x0, x0, x3, lsl #4
    857c:      	ldr	x0, [x0]
    8580:      	b	0x8590 <_stogir.terminal.inputs+0x388>
    8584:      	ldr	x0, [x0, #0x28]
    8588:      	add	x0, x0, x4, lsl #4
    858c:      	ldr	x0, [x0]
    8590:      	mov	w1, #0x1                ; =1
    8594:      	b	0x85a0 <_stogir.terminal.inputs+0x398>
    8598:      	movz	w1, #0x0, lsl #16
    859c:      	movz	x0, #0x0, lsl #48
    85a0:      	ubfx	x1, x1, #0, #32
    85a4:      	lsr	x16, x1, #0
    85a8:      	cmp	x16, #0x1
    85ac:      	b.eq	0x85c8 <_stogir.terminal.inputs+0x3c0>
    85b0:      	b.lo	0x85b8 <_stogir.terminal.inputs+0x3b0>
    85b4:      	b	0x85cc <_stogir.terminal.inputs+0x3c4>
    85b8:      	cmp	x16, #0x0
    85bc:      	b.eq	0x85c4 <_stogir.terminal.inputs+0x3bc>
    85c0:      	b	0x85cc <_stogir.terminal.inputs+0x3c4>
    85c4:      	b	0x85d0 <_stogir.terminal.inputs+0x3c8>
    85c8:      	b	0x85e8 <_stogir.terminal.inputs+0x3e0>
    85cc:      	b	0x866c <_stogir.terminal.inputs+0x464>
    85d0:      	adrp	x16, 0x8000 <_stogir.atomic.ordinary?+0x54>
		00000000000085d0:  ARM64_RELOC_PAGE21	l_stogir.434
    85d4:      	ldr	x16, [x16]
		00000000000085d4:  ARM64_RELOC_PAGEOFF12	l_stogir.434
    85d8:      	orr	x0, x16, xzr
    85dc:      	mov	x1, #0x1                ; =1
    85e0:      	mov	x2, #0x1d               ; =29
    85e4:      	b	0x8500 <_stogir.terminal.inputs+0x2f8>
    85e8:      	cmp	x3, #0x0
    85ec:      	b.le	0x84ec <_stogir.terminal.inputs+0x2e4>
    85f0:      	uxtb	w0, w0
    85f4:      	cmp	x0, #0x83
    85f8:      	b.ge	0x862c <_stogir.terminal.inputs+0x424>
    85fc:      	adrp	x16, 0x8000 <_stogir.atomic.ordinary?+0x54>
		00000000000085fc:  ARM64_RELOC_PAGE21	l_stogir.431
    8600:      	ldr	x16, [x16]
		0000000000008600:  ARM64_RELOC_PAGEOFF12	l_stogir.431
    8604:      	orr	x1, x16, xzr
    8608:      	add	x0, x0, x1
    860c:      	ldrb	w0, [x0]
    8610:      	b	0x8630 <_stogir.terminal.inputs+0x428>
    8614:      	movz	x2, #0x0, lsl #48
    8618:      	b	0x8560 <_stogir.terminal.inputs+0x358>
    861c:      	movz	x2, #0x0, lsl #48
    8620:      	b	0x8558 <_stogir.terminal.inputs+0x350>
    8624:      	movz	x2, #0x0, lsl #48
    8628:      	b	0x8618 <_stogir.terminal.inputs+0x410>
    862c:      	movz	w0, #0x0, lsl #16
    8630:      	uxtb	w16, w0
    8634:      	and	w0, w16, #0x8
    8638:      	uxtb	w0, w0
    863c:      	ubfx	x0, x0, #0, #8
    8640:      	cmp	x0, #0x0
    8644:      	cset	w0, eq
    8648:      	uxtb	w16, w0
    864c:      	cmp	w16, wzr
    8650:      	cset	x0, eq
    8654:      	cmp	x0, #0x0
    8658:      	b.eq	0x84ec <_stogir.terminal.inputs+0x2e4>
    865c:      	and	x0, x3, #0xffffffff
    8660:      	movz	x1, #0x0, lsl #48
    8664:      	movz	x2, #0x0, lsl #48
    8668:      	b	0x8500 <_stogir.terminal.inputs+0x2f8>
    866c:      	brk	#0
    8670:      	b	0x866c <_stogir.terminal.inputs+0x464>

0000000000008674 <_stogir.switch.switch-inputs>:
    8674:      	sxtw	x1, w1
    8678:      	cmp	x1, #0x0
    867c:      	cset	w3, gt
    8680:      	movz	x16, #0x0, lsl #48
    8684:      	sub	x4, x16, x1
    8688:      	sub	x5, x4, #0x1
    868c:      	uxtb	w16, w3
    8690:      	cmp	w16, wzr
    8694:      	b.eq	0x86d4 <_stogir.switch.switch-inputs+0x60>
    8698:      	ldr	x4, [x0, #0x8]
    869c:      	cmp	x1, x4
    86a0:      	b.ge	0x873c <_stogir.switch.switch-inputs+0xc8>
    86a4:      	add	x4, x0, #0x78
    86a8:      	ldr	x4, [x4, #0x8]
    86ac:      	cmp	x1, x4
    86b0:      	b.ge	0x8814 <_stogir.switch.switch-inputs+0x1a0>
    86b4:      	ldr	x4, [x0, #0x78]
    86b8:      	add	x4, x4, x1, lsl #2
    86bc:      	ldr	w4, [x4]
    86c0:      	sxtw	x4, w4
    86c4:      	cmp	x4, #0x0
    86c8:      	cset	w4, ge
    86cc:      	ubfx	x4, x4, #0, #8
    86d0:      	b	0x8818 <_stogir.switch.switch-inputs+0x1a4>
    86d4:      	cmp	x1, #0x0
    86d8:      	b.ge	0x8744 <_stogir.switch.switch-inputs+0xd0>
    86dc:      	add	x6, x0, #0x28
    86e0:      	add	x7, x0, #0x50
    86e4:      	ldr	x6, [x6, #0x8]
    86e8:      	ldr	x7, [x7, #0x8]
    86ec:      	cmp	x6, x7
    86f0:      	b.ne	0x871c <_stogir.switch.switch-inputs+0xa8>
    86f4:      	cmp	x4, x6
    86f8:      	b.gt	0x881c <_stogir.switch.switch-inputs+0x1a8>
    86fc:      	ldr	x4, [x0, #0x50]
    8700:      	add	x4, x4, x5, lsl #2
    8704:      	ldr	w4, [x4]
    8708:      	sxtw	x4, w4
    870c:      	cmp	x4, #0x0
    8710:      	cset	w4, gt
    8714:      	ubfx	x4, x4, #0, #8
    8718:      	b	0x8820 <_stogir.switch.switch-inputs+0x1ac>
    871c:      	movz	x4, #0x0, lsl #48
    8720:      	b	0x8748 <_stogir.switch.switch-inputs+0xd4>
    8724:      	adrp	x16, 0x8000 <_stogir.atomic.ordinary?+0x54>
		0000000000008724:  ARM64_RELOC_PAGE21	l_stogir.435
    8728:      	ldr	x16, [x16]
		0000000000008728:  ARM64_RELOC_PAGEOFF12	l_stogir.435
    872c:      	orr	x0, x16, xzr
    8730:      	mov	x1, #0x1                ; =1
    8734:      	mov	x2, #0x16               ; =22
    8738:      	b	0x87cc <_stogir.switch.switch-inputs+0x158>
    873c:      	movz	x4, #0x0, lsl #48
    8740:      	b	0x8748 <_stogir.switch.switch-inputs+0xd4>
    8744:      	movz	x4, #0x0, lsl #48
    8748:      	cmp	x4, #0x0
    874c:      	b.eq	0x8780 <_stogir.switch.switch-inputs+0x10c>
    8750:      	uxtb	w16, w3
    8754:      	cmp	w16, wzr
    8758:      	b.eq	0x876c <_stogir.switch.switch-inputs+0xf8>
    875c:      	ldr	x3, [x0]
    8760:      	add	x3, x3, x1, lsl #4
    8764:      	ldr	x3, [x3]
    8768:      	b	0x8778 <_stogir.switch.switch-inputs+0x104>
    876c:      	ldr	x3, [x0, #0x28]
    8770:      	add	x3, x3, x5, lsl #4
    8774:      	ldr	x3, [x3]
    8778:      	mov	w4, #0x1                ; =1
    877c:      	b	0x8788 <_stogir.switch.switch-inputs+0x114>
    8780:      	movz	w4, #0x0, lsl #16
    8784:      	movz	x3, #0x0, lsl #48
    8788:      	ubfx	x4, x4, #0, #32
    878c:      	lsr	x16, x4, #0
    8790:      	cmp	x16, #0x1
    8794:      	b.eq	0x87b0 <_stogir.switch.switch-inputs+0x13c>
    8798:      	b.lo	0x87a0 <_stogir.switch.switch-inputs+0x12c>
    879c:      	b	0x87b4 <_stogir.switch.switch-inputs+0x140>
    87a0:      	cmp	x16, #0x0
    87a4:      	b.eq	0x87ac <_stogir.switch.switch-inputs+0x138>
    87a8:      	b	0x87b4 <_stogir.switch.switch-inputs+0x140>
    87ac:      	b	0x87b8 <_stogir.switch.switch-inputs+0x144>
    87b0:      	b	0x87dc <_stogir.switch.switch-inputs+0x168>
    87b4:      	b	0x8a30 <_stogir.switch.switch-inputs+0x3bc>
    87b8:      	adrp	x16, 0x8000 <_stogir.atomic.ordinary?+0x54>
		00000000000087b8:  ARM64_RELOC_PAGE21	l_stogir.436
    87bc:      	ldr	x16, [x16]
		00000000000087bc:  ARM64_RELOC_PAGEOFF12	l_stogir.436
    87c0:      	orr	x0, x16, xzr
    87c4:      	mov	x1, #0x1                ; =1
    87c8:      	mov	x2, #0x16               ; =22
    87cc:      	str	x1, [x8]
    87d0:      	str	x0, [x8, #0x8]
    87d4:      	str	x2, [x8, #0x10]
    87d8:      	ret
    87dc:      	cmp	x1, #0x0
    87e0:      	b.le	0x8724 <_stogir.switch.switch-inputs+0xb0>
    87e4:      	uxtb	w3, w3
    87e8:      	cmp	x3, #0x83
    87ec:      	cset	w1, lt
    87f0:      	uxtb	w16, w1
    87f4:      	cmp	w16, wzr
    87f8:      	b.eq	0x8824 <_stogir.switch.switch-inputs+0x1b0>
    87fc:      	adrp	x16, 0x8000 <_stogir.atomic.ordinary?+0x54>
		00000000000087fc:  ARM64_RELOC_PAGE21	l_stogir.437
    8800:      	ldr	x16, [x16]
		0000000000008800:  ARM64_RELOC_PAGEOFF12	l_stogir.437
    8804:      	orr	x4, x16, xzr
    8808:      	add	x4, x3, x4
    880c:      	ldrb	w4, [x4]
    8810:      	b	0x8828 <_stogir.switch.switch-inputs+0x1b4>
    8814:      	movz	x4, #0x0, lsl #48
    8818:      	b	0x8740 <_stogir.switch.switch-inputs+0xcc>
    881c:      	movz	x4, #0x0, lsl #48
    8820:      	b	0x8720 <_stogir.switch.switch-inputs+0xac>
    8824:      	movz	w4, #0x0, lsl #16
    8828:      	uxtb	w16, w4
    882c:      	and	w4, w16, #0x1
    8830:      	uxtb	w4, w4
    8834:      	ubfx	x4, x4, #0, #8
    8838:      	cmp	x4, #0x0
    883c:      	b.eq	0x8724 <_stogir.switch.switch-inputs+0xb0>
    8840:      	uxtb	w16, w1
    8844:      	cmp	w16, wzr
    8848:      	b.eq	0x8864 <_stogir.switch.switch-inputs+0x1f0>
    884c:      	adrp	x16, 0x8000 <_stogir.atomic.ordinary?+0x54>
		000000000000884c:  ARM64_RELOC_PAGE21	l_stogir.437
    8850:      	ldr	x16, [x16]
		0000000000008850:  ARM64_RELOC_PAGEOFF12	l_stogir.437
    8854:      	orr	x1, x16, xzr
    8858:      	add	x1, x3, x1
    885c:      	ldrb	w1, [x1]
    8860:      	b	0x8868 <_stogir.switch.switch-inputs+0x1f4>
    8864:      	movz	w1, #0x0, lsl #16
    8868:      	uxtb	w16, w1
    886c:      	and	w1, w16, #0x4
    8870:      	uxtb	w1, w1
    8874:      	ubfx	x1, x1, #0, #8
    8878:      	cmp	x1, #0x0
    887c:      	cset	w1, eq
    8880:      	uxtb	w16, w1
    8884:      	cmp	w16, wzr
    8888:      	cset	x1, eq
    888c:      	cmp	x1, #0x0
    8890:      	b.ne	0x8724 <_stogir.switch.switch-inputs+0xb0>
    8894:      	sxtw	x2, w2
    8898:      	cmp	x2, #0x0
    889c:      	cset	w1, gt
    88a0:      	movz	x16, #0x0, lsl #48
    88a4:      	sub	x3, x16, x2
    88a8:      	sub	x4, x3, #0x1
    88ac:      	uxtb	w16, w1
    88b0:      	cmp	w16, wzr
    88b4:      	b.eq	0x890c <_stogir.switch.switch-inputs+0x298>
    88b8:      	ldr	x3, [x0, #0x8]
    88bc:      	cmp	x2, x3
    88c0:      	b.ge	0x8954 <_stogir.switch.switch-inputs+0x2e0>
    88c4:      	add	x3, x0, #0x78
    88c8:      	ldr	x3, [x3, #0x8]
    88cc:      	cmp	x2, x3
    88d0:      	b.ge	0x8a28 <_stogir.switch.switch-inputs+0x3b4>
    88d4:      	ldr	x3, [x0, #0x78]
    88d8:      	add	x3, x3, x2, lsl #2
    88dc:      	ldr	w3, [x3]
    88e0:      	sxtw	x3, w3
    88e4:      	cmp	x3, #0x0
    88e8:      	cset	w3, ge
    88ec:      	ubfx	x3, x3, #0, #8
    88f0:      	b	0x8a2c <_stogir.switch.switch-inputs+0x3b8>
    88f4:      	adrp	x16, 0x8000 <_stogir.atomic.ordinary?+0x54>
		00000000000088f4:  ARM64_RELOC_PAGE21	l_stogir.438
    88f8:      	ldr	x16, [x16]
		00000000000088f8:  ARM64_RELOC_PAGEOFF12	l_stogir.438
    88fc:      	orr	x0, x16, xzr
    8900:      	mov	x1, #0x1                ; =1
    8904:      	mov	x2, #0x20               ; =32
    8908:      	b	0x8738 <_stogir.switch.switch-inputs+0xc4>
    890c:      	cmp	x2, #0x0
    8910:      	b.ge	0x895c <_stogir.switch.switch-inputs+0x2e8>
    8914:      	add	x5, x0, #0x28
    8918:      	add	x6, x0, #0x50
    891c:      	ldr	x5, [x5, #0x8]
    8920:      	ldr	x6, [x6, #0x8]
    8924:      	cmp	x5, x6
    8928:      	b.ne	0x8a20 <_stogir.switch.switch-inputs+0x3ac>
    892c:      	cmp	x3, x5
    8930:      	b.gt	0x8a38 <_stogir.switch.switch-inputs+0x3c4>
    8934:      	ldr	x3, [x0, #0x50]
    8938:      	add	x3, x3, x4, lsl #2
    893c:      	ldr	w3, [x3]
    8940:      	sxtw	x3, w3
    8944:      	cmp	x3, #0x0
    8948:      	cset	w3, gt
    894c:      	ubfx	x3, x3, #0, #8
    8950:      	b	0x8a3c <_stogir.switch.switch-inputs+0x3c8>
    8954:      	movz	x3, #0x0, lsl #48
    8958:      	b	0x8960 <_stogir.switch.switch-inputs+0x2ec>
    895c:      	movz	x3, #0x0, lsl #48
    8960:      	cmp	x3, #0x0
    8964:      	b.eq	0x8998 <_stogir.switch.switch-inputs+0x324>
    8968:      	uxtb	w16, w1
    896c:      	cmp	w16, wzr
    8970:      	b.eq	0x8984 <_stogir.switch.switch-inputs+0x310>
    8974:      	ldr	x0, [x0]
    8978:      	add	x0, x0, x2, lsl #4
    897c:      	ldr	x0, [x0]
    8980:      	b	0x8990 <_stogir.switch.switch-inputs+0x31c>
    8984:      	ldr	x0, [x0, #0x28]
    8988:      	add	x0, x0, x4, lsl #4
    898c:      	ldr	x0, [x0]
    8990:      	mov	w1, #0x1                ; =1
    8994:      	b	0x89a0 <_stogir.switch.switch-inputs+0x32c>
    8998:      	movz	w1, #0x0, lsl #16
    899c:      	movz	x0, #0x0, lsl #48
    89a0:      	ubfx	x1, x1, #0, #32
    89a4:      	lsr	x16, x1, #0
    89a8:      	cmp	x16, #0x1
    89ac:      	b.eq	0x89c8 <_stogir.switch.switch-inputs+0x354>
    89b0:      	b.lo	0x89b8 <_stogir.switch.switch-inputs+0x344>
    89b4:      	b	0x89cc <_stogir.switch.switch-inputs+0x358>
    89b8:      	cmp	x16, #0x0
    89bc:      	b.eq	0x89c4 <_stogir.switch.switch-inputs+0x350>
    89c0:      	b	0x89cc <_stogir.switch.switch-inputs+0x358>
    89c4:      	b	0x89d0 <_stogir.switch.switch-inputs+0x35c>
    89c8:      	b	0x89e8 <_stogir.switch.switch-inputs+0x374>
    89cc:      	b	0x8a40 <_stogir.switch.switch-inputs+0x3cc>
    89d0:      	adrp	x16, 0x8000 <_stogir.atomic.ordinary?+0x54>
		00000000000089d0:  ARM64_RELOC_PAGE21	l_stogir.439
    89d4:      	ldr	x16, [x16]
		00000000000089d4:  ARM64_RELOC_PAGEOFF12	l_stogir.439
    89d8:      	orr	x0, x16, xzr
    89dc:      	mov	x1, #0x1                ; =1
    89e0:      	mov	x2, #0x17               ; =23
    89e4:      	b	0x8908 <_stogir.switch.switch-inputs+0x294>
    89e8:      	orr	w1, w0, wzr
    89ec:      	ubfx	x1, x1, #0, #32
    89f0:      	ubfx	x1, x1, #8, #8
    89f4:      	cmp	x1, #0x1
    89f8:      	b.lt	0x88f4 <_stogir.switch.switch-inputs+0x280>
    89fc:      	cmp	x1, #0xb
    8a00:      	b.gt	0x88f4 <_stogir.switch.switch-inputs+0x280>
    8a04:      	uxtb	w0, w0
    8a08:      	cmp	x0, #0x48
    8a0c:      	b.eq	0x88f4 <_stogir.switch.switch-inputs+0x280>
    8a10:      	and	x0, x1, #0xffffffff
    8a14:      	movz	x1, #0x0, lsl #48
    8a18:      	movz	x2, #0x0, lsl #48
    8a1c:      	b	0x8908 <_stogir.switch.switch-inputs+0x294>
    8a20:      	movz	x3, #0x0, lsl #48
    8a24:      	b	0x8960 <_stogir.switch.switch-inputs+0x2ec>
    8a28:      	movz	x3, #0x0, lsl #48
    8a2c:      	b	0x8958 <_stogir.switch.switch-inputs+0x2e4>
    8a30:      	brk	#0
    8a34:      	b	0x8a30 <_stogir.switch.switch-inputs+0x3bc>
    8a38:      	movz	x3, #0x0, lsl #48
    8a3c:      	b	0x8a24 <_stogir.switch.switch-inputs+0x3b0>
    8a40:      	brk	#0
    8a44:      	b	0x8a40 <_stogir.switch.switch-inputs+0x3cc>

0000000000008a48 <_stogir.switch.case-inputs>:
    8a48:      	sub	sp, sp, #0xb0
    8a4c:      	str	x29, [sp]
    8a50:      	str	x30, [sp, #0x8]
    8a54:      	mov	x29, sp
    8a58:      	str	x19, [sp, #0x70]
    8a5c:      	str	x20, [sp, #0x78]
    8a60:      	str	x21, [sp, #0x80]
    8a64:      	str	x22, [sp, #0x88]
    8a68:      	str	x23, [sp, #0x90]
    8a6c:      	str	x24, [sp, #0x98]
    8a70:      	str	x25, [sp, #0xa0]
    8a74:      	str	x26, [sp, #0xa8]
    8a78:      	sxtw	x2, w2
    8a7c:      	lsl	x5, x2, #2
    8a80:      	cmp	x2, #0x0
    8a84:      	cset	w6, gt
    8a88:      	movz	x16, #0x0, lsl #48
    8a8c:      	sub	x7, x16, x2
    8a90:      	sub	x9, x7, #0x1
    8a94:      	uxtb	w16, w6
    8a98:      	cmp	w16, wzr
    8a9c:      	b.eq	0x8adc <_stogir.switch.case-inputs+0x94>
    8aa0:      	ldr	x7, [x0, #0x8]
    8aa4:      	cmp	x2, x7
    8aa8:      	b.ge	0x8b2c <_stogir.switch.case-inputs+0xe4>
    8aac:      	add	x7, x0, #0x78
    8ab0:      	ldr	x7, [x7, #0x8]
    8ab4:      	cmp	x2, x7
    8ab8:      	b.ge	0x8c2c <_stogir.switch.case-inputs+0x1e4>
    8abc:      	ldr	x7, [x0, #0x78]
    8ac0:      	add	x7, x5, x7
    8ac4:      	ldr	w7, [x7]
    8ac8:      	sxtw	x7, w7
    8acc:      	cmp	x7, #0x0
    8ad0:      	cset	w7, ge
    8ad4:      	ubfx	x7, x7, #0, #8
    8ad8:      	b	0x8c30 <_stogir.switch.case-inputs+0x1e8>
    8adc:      	cmp	x2, #0x0
    8ae0:      	b.ge	0x8b34 <_stogir.switch.case-inputs+0xec>
    8ae4:      	add	x10, x0, #0x28
    8ae8:      	add	x11, x0, #0x50
    8aec:      	ldr	x10, [x10, #0x8]
    8af0:      	ldr	x11, [x11, #0x8]
    8af4:      	cmp	x10, x11
    8af8:      	b.ne	0x8b24 <_stogir.switch.case-inputs+0xdc>
    8afc:      	cmp	x7, x10
    8b00:      	b.gt	0x8cf4 <_stogir.switch.case-inputs+0x2ac>
    8b04:      	ldr	x7, [x0, #0x50]
    8b08:      	add	x7, x7, x9, lsl #2
    8b0c:      	ldr	w7, [x7]
    8b10:      	sxtw	x7, w7
    8b14:      	cmp	x7, #0x0
    8b18:      	cset	w7, gt
    8b1c:      	ubfx	x7, x7, #0, #8
    8b20:      	b	0x8cf8 <_stogir.switch.case-inputs+0x2b0>
    8b24:      	movz	x7, #0x0, lsl #48
    8b28:      	b	0x8b38 <_stogir.switch.case-inputs+0xf0>
    8b2c:      	movz	x7, #0x0, lsl #48
    8b30:      	b	0x8b38 <_stogir.switch.case-inputs+0xf0>
    8b34:      	movz	x7, #0x0, lsl #48
    8b38:      	cmp	x7, #0x0
    8b3c:      	b.eq	0x8b78 <_stogir.switch.case-inputs+0x130>
    8b40:      	uxtb	w16, w6
    8b44:      	cmp	w16, wzr
    8b48:      	b.eq	0x8b60 <_stogir.switch.case-inputs+0x118>
    8b4c:      	ldr	x6, [x0]
    8b50:      	add	x6, x6, x2, lsl #4
    8b54:      	ldr	x7, [x6]
    8b58:      	ldr	x6, [x6, #0x8]
    8b5c:      	b	0x8b70 <_stogir.switch.case-inputs+0x128>
    8b60:      	ldr	x6, [x0, #0x28]
    8b64:      	add	x6, x6, x9, lsl #4
    8b68:      	ldr	x7, [x6]
    8b6c:      	ldr	x6, [x6, #0x8]
    8b70:      	mov	w9, #0x1                ; =1
    8b74:      	b	0x8b84 <_stogir.switch.case-inputs+0x13c>
    8b78:      	movz	w9, #0x0, lsl #16
    8b7c:      	movz	x7, #0x0, lsl #48
    8b80:      	movz	x6, #0x0, lsl #48
    8b84:      	ubfx	x9, x9, #0, #32
    8b88:      	lsr	x16, x9, #0
    8b8c:      	cmp	x16, #0x1
    8b90:      	b.eq	0x8bac <_stogir.switch.case-inputs+0x164>
    8b94:      	b.lo	0x8b9c <_stogir.switch.case-inputs+0x154>
    8b98:      	b	0x8bb0 <_stogir.switch.case-inputs+0x168>
    8b9c:      	cmp	x16, #0x0
    8ba0:      	b.eq	0x8ba8 <_stogir.switch.case-inputs+0x160>
    8ba4:      	b	0x8bb0 <_stogir.switch.case-inputs+0x168>
    8ba8:      	b	0x8bb4 <_stogir.switch.case-inputs+0x16c>
    8bac:      	b	0x8c08 <_stogir.switch.case-inputs+0x1c0>
    8bb0:      	b	0x8cfc <_stogir.switch.case-inputs+0x2b4>
    8bb4:      	adrp	x16, 0x8000 <_stogir.atomic.ordinary?+0x54>
		0000000000008bb4:  ARM64_RELOC_PAGE21	l_stogir.440
    8bb8:      	ldr	x16, [x16]
		0000000000008bb8:  ARM64_RELOC_PAGEOFF12	l_stogir.440
    8bbc:      	orr	x19, x16, xzr
    8bc0:      	mov	x21, x8
    8bc4:      	mov	x1, #0x1                ; =1
    8bc8:      	mov	x0, #0x1a               ; =26
    8bcc:      	str	x1, [x21]
    8bd0:      	str	x19, [x21, #0x8]
    8bd4:      	str	x0, [x21, #0x10]
    8bd8:      	ldr	x19, [sp, #0x70]
    8bdc:      	ldr	x20, [sp, #0x78]
    8be0:      	ldr	x21, [sp, #0x80]
    8be4:      	ldr	x22, [sp, #0x88]
    8be8:      	ldr	x23, [sp, #0x90]
    8bec:      	ldr	x24, [sp, #0x98]
    8bf0:      	ldr	x25, [sp, #0xa0]
    8bf4:      	ldr	x26, [sp, #0xa8]
    8bf8:      	ldr	x29, [sp]
    8bfc:      	ldr	x30, [sp, #0x8]
    8c00:      	add	sp, sp, #0xb0
    8c04:      	ret
    8c08:      	cmp	x2, #0x0
    8c0c:      	b.gt	0x8c34 <_stogir.switch.case-inputs+0x1ec>
    8c10:      	mov	x21, x8
    8c14:      	adrp	x16, 0x8000 <_stogir.atomic.ordinary?+0x54>
		0000000000008c14:  ARM64_RELOC_PAGE21	l_stogir.441
    8c18:      	ldr	x16, [x16]
		0000000000008c18:  ARM64_RELOC_PAGEOFF12	l_stogir.441
    8c1c:      	orr	x19, x16, xzr
    8c20:      	mov	x1, #0x1                ; =1
    8c24:      	mov	x0, #0x1f               ; =31
    8c28:      	b	0x8bcc <_stogir.switch.case-inputs+0x184>
    8c2c:      	movz	x7, #0x0, lsl #48
    8c30:      	b	0x8b30 <_stogir.switch.case-inputs+0xe8>
    8c34:      	uxtb	w2, w7
    8c38:      	cmp	x2, #0x75
    8c3c:      	b.ne	0x8e58 <_stogir.switch.case-inputs+0x410>
    8c40:      	orr	w2, w7, wzr
    8c44:      	ubfx	x2, x2, #0, #32
    8c48:      	ubfx	x2, x2, #8, #8
    8c4c:      	cmp	x2, #0x0
    8c50:      	b.ne	0x8e60 <_stogir.switch.case-inputs+0x418>
    8c54:      	ldr	x2, [x0, #0x78]
    8c58:      	add	x2, x5, x2
    8c5c:      	ldr	w2, [x2]
    8c60:      	sxtw	x2, w2
    8c64:      	cmp	x2, #0x2
    8c68:      	b.ne	0x8e68 <_stogir.switch.case-inputs+0x420>
    8c6c:      	sxtw	x20, w1
    8c70:      	cmp	x20, #0x6d
    8c74:      	b.lt	0x8e70 <_stogir.switch.case-inputs+0x428>
    8c78:      	cmp	x20, #0x6f
    8c7c:      	b.gt	0x8e78 <_stogir.switch.case-inputs+0x430>
    8c80:      	add	x16, sp, #0x10
    8c84:      	orr	x19, x16, xzr
    8c88:      	lsr	x1, x7, #32
    8c8c:      	mov	w2, w6
    8c90:      	mov	x21, x8
    8c94:      	add	x8, sp, #0x10
    8c98:      	mov	x22, x0
    8c9c:      	mov	w23, w3
    8ca0:      	mov	w24, w4
    8ca4:      	bl	0x8ca4 <_stogir.switch.case-inputs+0x25c>
		0000000000008ca4:  ARM64_RELOC_BRANCH26	_stogir.switch.switch-inputs
    8ca8:      	add	x16, sp, #0x10
    8cac:      	ldr	w0, [x16]
    8cb0:      	lsr	x16, x0, #0
    8cb4:      	cmp	x16, #0x1
    8cb8:      	b.eq	0x8cd4 <_stogir.switch.case-inputs+0x28c>
    8cbc:      	b.lo	0x8cc4 <_stogir.switch.case-inputs+0x27c>
    8cc0:      	b	0x8cd8 <_stogir.switch.case-inputs+0x290>
    8cc4:      	cmp	x16, #0x0
    8cc8:      	b.eq	0x8cd0 <_stogir.switch.case-inputs+0x288>
    8ccc:      	b	0x8cd8 <_stogir.switch.case-inputs+0x290>
    8cd0:      	b	0x8d04 <_stogir.switch.case-inputs+0x2bc>
    8cd4:      	b	0x8cdc <_stogir.switch.case-inputs+0x294>
    8cd8:      	b	0x8e40 <_stogir.switch.case-inputs+0x3f8>
    8cdc:      	add	x0, x19, #0x8
    8ce0:      	add	x16, sp, #0x10
    8ce4:      	ldr	x19, [x16, #0x8]
    8ce8:      	ldr	x0, [x0, #0x8]
    8cec:      	mov	x1, #0x1                ; =1
    8cf0:      	b	0x8c28 <_stogir.switch.case-inputs+0x1e0>
    8cf4:      	movz	x7, #0x0, lsl #48
    8cf8:      	b	0x8b28 <_stogir.switch.case-inputs+0xe0>
    8cfc:      	brk	#0
    8d00:      	b	0x8cfc <_stogir.switch.case-inputs+0x2b4>
    8d04:      	add	x16, sp, #0x10
    8d08:      	ldr	w25, [x16, #0x8]
    8d0c:      	sxtw	x0, w25
    8d10:      	and	x19, x0, #0xffffffff
    8d14:      	cmp	x20, #0x6f
    8d18:      	b.ne	0x8d28 <_stogir.switch.case-inputs+0x2e0>
    8d1c:      	movz	x1, #0x0, lsl #48
    8d20:      	movz	x0, #0x0, lsl #48
    8d24:      	b	0x8cf0 <_stogir.switch.case-inputs+0x2a8>
    8d28:      	add	x16, sp, #0x30
    8d2c:      	orr	x26, x16, xzr
    8d30:      	add	x8, sp, #0x30
    8d34:      	mov	x0, x22
    8d38:      	mov	w1, w23
    8d3c:      	mov	w2, w25
    8d40:      	bl	0x8d40 <_stogir.switch.case-inputs+0x2f8>
		0000000000008d40:  ARM64_RELOC_BRANCH26	_stogir.switch.key
    8d44:      	add	x16, sp, #0x30
    8d48:      	ldr	w0, [x16]
    8d4c:      	lsr	x16, x0, #0
    8d50:      	cmp	x16, #0x1
    8d54:      	b.eq	0x8d70 <_stogir.switch.case-inputs+0x328>
    8d58:      	b.lo	0x8d60 <_stogir.switch.case-inputs+0x318>
    8d5c:      	b	0x8d74 <_stogir.switch.case-inputs+0x32c>
    8d60:      	cmp	x16, #0x0
    8d64:      	b.eq	0x8d6c <_stogir.switch.case-inputs+0x324>
    8d68:      	b	0x8d74 <_stogir.switch.case-inputs+0x32c>
    8d6c:      	b	0x8d90 <_stogir.switch.case-inputs+0x348>
    8d70:      	b	0x8d78 <_stogir.switch.case-inputs+0x330>
    8d74:      	b	0x8e48 <_stogir.switch.case-inputs+0x400>
    8d78:      	add	x0, x26, #0x8
    8d7c:      	add	x16, sp, #0x30
    8d80:      	ldr	x19, [x16, #0x8]
    8d84:      	ldr	x0, [x0, #0x8]
    8d88:      	mov	x1, #0x1                ; =1
    8d8c:      	b	0x8d24 <_stogir.switch.case-inputs+0x2dc>
    8d90:      	add	x16, sp, #0x30
    8d94:      	ldr	x26, [x16, #0x8]
    8d98:      	cmp	x20, #0x6d
    8d9c:      	b.eq	0x8da4 <_stogir.switch.case-inputs+0x35c>
    8da0:      	orr	w23, w24, wzr
    8da4:      	add	x16, sp, #0x50
    8da8:      	orr	x20, x16, xzr
    8dac:      	add	x8, sp, #0x50
    8db0:      	mov	x0, x22
    8db4:      	mov	w1, w23
    8db8:      	mov	w2, w25
    8dbc:      	bl	0x8dbc <_stogir.switch.case-inputs+0x374>
		0000000000008dbc:  ARM64_RELOC_BRANCH26	_stogir.switch.key
    8dc0:      	add	x16, sp, #0x50
    8dc4:      	ldr	w0, [x16]
    8dc8:      	lsr	x16, x0, #0
    8dcc:      	cmp	x16, #0x1
    8dd0:      	b.eq	0x8dec <_stogir.switch.case-inputs+0x3a4>
    8dd4:      	b.lo	0x8ddc <_stogir.switch.case-inputs+0x394>
    8dd8:      	b	0x8df0 <_stogir.switch.case-inputs+0x3a8>
    8ddc:      	cmp	x16, #0x0
    8de0:      	b.eq	0x8de8 <_stogir.switch.case-inputs+0x3a0>
    8de4:      	b	0x8df0 <_stogir.switch.case-inputs+0x3a8>
    8de8:      	b	0x8e18 <_stogir.switch.case-inputs+0x3d0>
    8dec:      	b	0x8df4 <_stogir.switch.case-inputs+0x3ac>
    8df0:      	b	0x8e50 <_stogir.switch.case-inputs+0x408>
    8df4:      	add	x0, x20, #0x8
    8df8:      	add	x16, sp, #0x50
    8dfc:      	ldr	x19, [x16, #0x8]
    8e00:      	ldr	x0, [x0, #0x8]
    8e04:      	mov	x1, #0x1                ; =1
    8e08:      	b	0x8e14 <_stogir.switch.case-inputs+0x3cc>
    8e0c:      	movz	x1, #0x0, lsl #48
    8e10:      	movz	x0, #0x0, lsl #48
    8e14:      	b	0x8d8c <_stogir.switch.case-inputs+0x344>
    8e18:      	add	x16, sp, #0x50
    8e1c:      	ldr	x0, [x16, #0x8]
    8e20:      	cmp	x26, x0
    8e24:      	b.ls	0x8e0c <_stogir.switch.case-inputs+0x3c4>
    8e28:      	adrp	x16, 0x8000 <_stogir.atomic.ordinary?+0x54>
		0000000000008e28:  ARM64_RELOC_PAGE21	l_stogir.442
    8e2c:      	ldr	x16, [x16]
		0000000000008e2c:  ARM64_RELOC_PAGEOFF12	l_stogir.442
    8e30:      	orr	x19, x16, xzr
    8e34:      	mov	x1, #0x1                ; =1
    8e38:      	mov	x0, #0x1a               ; =26
    8e3c:      	b	0x8e14 <_stogir.switch.case-inputs+0x3cc>
    8e40:      	brk	#0
    8e44:      	b	0x8e40 <_stogir.switch.case-inputs+0x3f8>
    8e48:      	brk	#0
    8e4c:      	b	0x8e48 <_stogir.switch.case-inputs+0x400>
    8e50:      	brk	#0
    8e54:      	b	0x8e50 <_stogir.switch.case-inputs+0x408>
    8e58:      	mov	x21, x8
    8e5c:      	b	0x8c14 <_stogir.switch.case-inputs+0x1cc>
    8e60:      	mov	x21, x8
    8e64:      	b	0x8c14 <_stogir.switch.case-inputs+0x1cc>
    8e68:      	mov	x21, x8
    8e6c:      	b	0x8c14 <_stogir.switch.case-inputs+0x1cc>
    8e70:      	mov	x21, x8
    8e74:      	b	0x8c14 <_stogir.switch.case-inputs+0x1cc>
    8e78:      	mov	x21, x8
    8e7c:      	b	0x8c14 <_stogir.switch.case-inputs+0x1cc>

0000000000008e80 <_stogir.stack.valid-frame-object-inputs?>:
    8e80:      	sub	sp, sp, #0x20
    8e84:      	str	x29, [sp]
    8e88:      	str	x30, [sp, #0x8]
    8e8c:      	mov	x29, sp
    8e90:      	str	x19, [sp, #0x10]
    8e94:      	str	x20, [sp, #0x18]
    8e98:      	mov	x19, x0
    8e9c:      	mov	w20, w2
    8ea0:      	bl	0x8ea0 <_stogir.stack.valid-frame-object-inputs?+0x20>
		0000000000008ea0:  ARM64_RELOC_BRANCH26	_stogir.stack.entry-allocation?
    8ea4:      	cmp	x0, #0x0
    8ea8:      	b.eq	0x8f24 <_stogir.stack.valid-frame-object-inputs?+0xa4>
    8eac:      	sxtw	x20, w20
    8eb0:      	cmp	x20, #0x0
    8eb4:      	b.ge	0x8f44 <_stogir.stack.valid-frame-object-inputs?+0xc4>
    8eb8:      	cmp	x20, #0x0
    8ebc:      	cset	w0, gt
    8ec0:      	movz	x16, #0x0, lsl #48
    8ec4:      	sub	x1, x16, x20
    8ec8:      	mov	x2, sp
    8ecc:      	sub	x3, x1, #0x1
    8ed0:      	mov	x4, sp
    8ed4:      	sub	sp, sp, #0x10
    8ed8:      	mov	x5, sp
    8edc:      	uxtb	w16, w0
    8ee0:      	cmp	w16, wzr
    8ee4:      	b.eq	0x8f4c <_stogir.stack.valid-frame-object-inputs?+0xcc>
    8ee8:      	ldr	x1, [x19, #0x8]
    8eec:      	cmp	x20, x1
    8ef0:      	b.ge	0x8fa4 <_stogir.stack.valid-frame-object-inputs?+0x124>
    8ef4:      	add	x1, x19, #0x78
    8ef8:      	ldr	x1, [x1, #0x8]
    8efc:      	cmp	x20, x1
    8f00:      	b.ge	0x9100 <_stogir.stack.valid-frame-object-inputs?+0x280>
    8f04:      	ldr	x1, [x19, #0x78]
    8f08:      	add	x1, x1, x20, lsl #2
    8f0c:      	ldr	w1, [x1]
    8f10:      	sxtw	x1, w1
    8f14:      	cmp	x1, #0x0
    8f18:      	cset	w1, ge
    8f1c:      	ubfx	x1, x1, #0, #8
    8f20:      	b	0x9104 <_stogir.stack.valid-frame-object-inputs?+0x284>
    8f24:      	movz	x0, #0x0, lsl #48
    8f28:      	sub	sp, x29, #0x0
    8f2c:      	ldr	x19, [sp, #0x10]
    8f30:      	ldr	x20, [sp, #0x18]
    8f34:      	ldr	x29, [sp]
    8f38:      	ldr	x30, [sp, #0x8]
    8f3c:      	add	sp, sp, #0x20
    8f40:      	ret
    8f44:      	movz	x0, #0x0, lsl #48
    8f48:      	b	0x8f28 <_stogir.stack.valid-frame-object-inputs?+0xa8>
    8f4c:      	add	x6, x19, #0x28
    8f50:      	add	x7, x19, #0x50
    8f54:      	ldr	x6, [x6, #0x8]
    8f58:      	ldr	x7, [x7, #0x8]
    8f5c:      	cmp	x6, x7
    8f60:      	b.ne	0x8fac <_stogir.stack.valid-frame-object-inputs?+0x12c>
    8f64:      	cmp	x1, x6
    8f68:      	b.gt	0x8f9c <_stogir.stack.valid-frame-object-inputs?+0x11c>
    8f6c:      	ldr	x1, [x19, #0x50]
    8f70:      	add	x1, x1, x3, lsl #2
    8f74:      	ldr	w1, [x1]
    8f78:      	sxtw	x1, w1
    8f7c:      	cmp	x1, #0x0
    8f80:      	cset	w1, gt
    8f84:      	ubfx	x1, x1, #0, #8
    8f88:      	b	0x8fa0 <_stogir.stack.valid-frame-object-inputs?+0x120>
    8f8c:      	cmp	x0, #0x0
    8f90:      	cset	w0, gt
    8f94:      	ubfx	x0, x0, #0, #8
    8f98:      	b	0x8f48 <_stogir.stack.valid-frame-object-inputs?+0xc8>
    8f9c:      	movz	x1, #0x0, lsl #48
    8fa0:      	b	0x8fb0 <_stogir.stack.valid-frame-object-inputs?+0x130>
    8fa4:      	movz	x1, #0x0, lsl #48
    8fa8:      	b	0x8fb0 <_stogir.stack.valid-frame-object-inputs?+0x130>
    8fac:      	movz	x1, #0x0, lsl #48
    8fb0:      	cmp	x1, #0x0
    8fb4:      	b.eq	0x8ff0 <_stogir.stack.valid-frame-object-inputs?+0x170>
    8fb8:      	uxtb	w16, w0
    8fbc:      	cmp	w16, wzr
    8fc0:      	b.eq	0x8fd8 <_stogir.stack.valid-frame-object-inputs?+0x158>
    8fc4:      	ldr	x0, [x19]
    8fc8:      	add	x0, x0, x20, lsl #4
    8fcc:      	ldr	x1, [x0]
    8fd0:      	ldr	x0, [x0, #0x8]
    8fd4:      	b	0x8fe8 <_stogir.stack.valid-frame-object-inputs?+0x168>
    8fd8:      	ldr	x0, [x19, #0x28]
    8fdc:      	add	x0, x0, x3, lsl #4
    8fe0:      	ldr	x1, [x0]
    8fe4:      	ldr	x0, [x0, #0x8]
    8fe8:      	mov	w3, #0x1                ; =1
    8fec:      	b	0x8ffc <_stogir.stack.valid-frame-object-inputs?+0x17c>
    8ff0:      	movz	w3, #0x0, lsl #16
    8ff4:      	movz	x1, #0x0, lsl #48
    8ff8:      	movz	x0, #0x0, lsl #48
    8ffc:      	ubfx	x3, x3, #0, #32
    9000:      	lsr	x16, x3, #0
    9004:      	cmp	x16, #0x1
    9008:      	b.eq	0x9024 <_stogir.stack.valid-frame-object-inputs?+0x1a4>
    900c:      	b.lo	0x9014 <_stogir.stack.valid-frame-object-inputs?+0x194>
    9010:      	b	0x9028 <_stogir.stack.valid-frame-object-inputs?+0x1a8>
    9014:      	cmp	x16, #0x0
    9018:      	b.eq	0x9020 <_stogir.stack.valid-frame-object-inputs?+0x1a0>
    901c:      	b	0x9028 <_stogir.stack.valid-frame-object-inputs?+0x1a8>
    9020:      	b	0x902c <_stogir.stack.valid-frame-object-inputs?+0x1ac>
    9024:      	b	0x90dc <_stogir.stack.valid-frame-object-inputs?+0x25c>
    9028:      	b	0x9218 <_stogir.stack.valid-frame-object-inputs?+0x398>
    902c:      	adrp	x16, 0x9000 <_stogir.stack.valid-frame-object-inputs?+0x180>
		000000000000902c:  ARM64_RELOC_PAGE21	l_stogir.443
    9030:      	ldr	x16, [x16]
		0000000000009030:  ARM64_RELOC_PAGEOFF12	l_stogir.443
    9034:      	orr	x0, x16, xzr
    9038:      	mov	w1, #0x1                ; =1
    903c:      	b	0x909c <_stogir.stack.valid-frame-object-inputs?+0x21c>
    9040:      	mov	w1, #0x1                ; =1
    9044:      	ldr	w3, [x5, #0x8]
    9048:      	ldr	w6, [x5, #0xc]
    904c:      	cmp	x20, #0x0
    9050:      	b.ge	0x908c <_stogir.stack.valid-frame-object-inputs?+0x20c>
    9054:      	cmp	x0, #0x1
    9058:      	b.lt	0x908c <_stogir.stack.valid-frame-object-inputs?+0x20c>
    905c:      	cmp	x0, #0xb
    9060:      	cset	w7, le
    9064:      	uxtb	w16, w7
    9068:      	cmp	w16, wzr
    906c:      	b.eq	0x908c <_stogir.stack.valid-frame-object-inputs?+0x20c>
    9070:      	ldr	w5, [x5]
    9074:      	uxtb	w8, w5
    9078:      	ubfx	x5, x5, #8, #8
    907c:      	cmp	x8, x5
    9080:      	b.eq	0x9188 <_stogir.stack.valid-frame-object-inputs?+0x308>
    9084:      	cmp	x8, #0x49
    9088:      	b.eq	0x9188 <_stogir.stack.valid-frame-object-inputs?+0x308>
    908c:      	adrp	x16, 0x9000 <_stogir.stack.valid-frame-object-inputs?+0x180>
		000000000000908c:  ARM64_RELOC_PAGE21	l_stogir.444
    9090:      	ldr	x16, [x16]
		0000000000009090:  ARM64_RELOC_PAGEOFF12	l_stogir.444
    9094:      	orr	x0, x16, xzr
    9098:      	mov	w1, #0x1                ; =1
    909c:      	mov	sp, x4
    90a0:      	ubfx	x1, x1, #0, #32
    90a4:      	mov	sp, x2
    90a8:      	lsr	x16, x1, #0
    90ac:      	cmp	x16, #0x1
    90b0:      	b.eq	0x90cc <_stogir.stack.valid-frame-object-inputs?+0x24c>
    90b4:      	b.lo	0x90bc <_stogir.stack.valid-frame-object-inputs?+0x23c>
    90b8:      	b	0x90d0 <_stogir.stack.valid-frame-object-inputs?+0x250>
    90bc:      	cmp	x16, #0x0
    90c0:      	b.eq	0x90c8 <_stogir.stack.valid-frame-object-inputs?+0x248>
    90c4:      	b	0x90d0 <_stogir.stack.valid-frame-object-inputs?+0x250>
    90c8:      	b	0x8f8c <_stogir.stack.valid-frame-object-inputs?+0x10c>
    90cc:      	b	0x90d4 <_stogir.stack.valid-frame-object-inputs?+0x254>
    90d0:      	b	0x9220 <_stogir.stack.valid-frame-object-inputs?+0x3a0>
    90d4:      	movz	x0, #0x0, lsl #48
    90d8:      	b	0x8f98 <_stogir.stack.valid-frame-object-inputs?+0x118>
    90dc:      	orr	w3, w1, wzr
    90e0:      	str	x1, [x5]
    90e4:      	ubfx	x3, x3, #0, #32
    90e8:      	str	x0, [x5, #0x8]
    90ec:      	ubfx	x0, x3, #8, #8
    90f0:      	cmp	x0, #0x0
    90f4:      	b.ne	0x9108 <_stogir.stack.valid-frame-object-inputs?+0x288>
    90f8:      	movz	w1, #0x0, lsl #16
    90fc:      	b	0x9044 <_stogir.stack.valid-frame-object-inputs?+0x1c4>
    9100:      	movz	x1, #0x0, lsl #48
    9104:      	b	0x8fa8 <_stogir.stack.valid-frame-object-inputs?+0x128>
    9108:      	cmp	x0, #0x1
    910c:      	b.eq	0x9040 <_stogir.stack.valid-frame-object-inputs?+0x1c0>
    9110:      	cmp	x0, #0x2
    9114:      	b.eq	0x9040 <_stogir.stack.valid-frame-object-inputs?+0x1c0>
    9118:      	cmp	x0, #0x7
    911c:      	b.eq	0x9040 <_stogir.stack.valid-frame-object-inputs?+0x1c0>
    9120:      	cmp	x0, #0x8
    9124:      	b.eq	0x9040 <_stogir.stack.valid-frame-object-inputs?+0x1c0>
    9128:      	cmp	x0, #0x3
    912c:      	b.eq	0x9210 <_stogir.stack.valid-frame-object-inputs?+0x390>
    9130:      	cmp	x0, #0x9
    9134:      	b.eq	0x9210 <_stogir.stack.valid-frame-object-inputs?+0x390>
    9138:      	cmp	x0, #0x4
    913c:      	b.eq	0x9228 <_stogir.stack.valid-frame-object-inputs?+0x3a8>
    9140:      	cmp	x0, #0xa
    9144:      	b.eq	0x9228 <_stogir.stack.valid-frame-object-inputs?+0x3a8>
    9148:      	cmp	x0, #0xd
    914c:      	b.eq	0x9228 <_stogir.stack.valid-frame-object-inputs?+0x3a8>
    9150:      	cmp	x0, #0x5
    9154:      	b.eq	0x9230 <_stogir.stack.valid-frame-object-inputs?+0x3b0>
    9158:      	cmp	x0, #0xb
    915c:      	b.eq	0x9230 <_stogir.stack.valid-frame-object-inputs?+0x3b0>
    9160:      	cmp	x0, #0xc
    9164:      	b.eq	0x9230 <_stogir.stack.valid-frame-object-inputs?+0x3b0>
    9168:      	cmp	x0, #0x6
    916c:      	cset	w1, eq
    9170:      	uxtb	w16, w1
    9174:      	cmp	w16, wzr
    9178:      	mov	w16, #0x8               ; =8
    917c:      	movn	w17, #0x0, lsl #16
    9180:      	csel	w1, w16, w17, ne
    9184:      	b	0x9234 <_stogir.stack.valid-frame-object-inputs?+0x3b4>
    9188:      	sxtw	x5, w1
    918c:      	cmp	x5, #0x0
    9190:      	b.le	0x908c <_stogir.stack.valid-frame-object-inputs?+0x20c>
    9194:      	lsl	w1, w1, #3
    9198:      	ubfx	x3, x3, #0, #32
    919c:      	ubfx	x6, x6, #0, #32
    91a0:      	lsl	x6, x6, #32
    91a4:      	orr	x3, x6, x3
    91a8:      	cmp	x5, #0x8
    91ac:      	b.ge	0x91c0 <_stogir.stack.valid-frame-object-inputs?+0x340>
    91b0:      	sxtw	x5, w1
    91b4:      	lsr	x5, x3, x5
    91b8:      	cmp	x5, #0x0
    91bc:      	b.ne	0x908c <_stogir.stack.valid-frame-object-inputs?+0x20c>
    91c0:      	cmp	x0, #0x7
    91c4:      	b.lt	0x91f0 <_stogir.stack.valid-frame-object-inputs?+0x370>
    91c8:      	uxtb	w16, w7
    91cc:      	cmp	w16, wzr
    91d0:      	b.eq	0x91f0 <_stogir.stack.valid-frame-object-inputs?+0x370>
    91d4:      	sub	w0, w1, #0x1
    91d8:      	sxtw	x0, w0
    91dc:      	mov	x16, #0x1               ; =1
    91e0:      	lsl	x0, x16, x0
    91e4:      	and	x0, x0, x3
    91e8:      	cmp	x0, #0x0
    91ec:      	b.ne	0x908c <_stogir.stack.valid-frame-object-inputs?+0x20c>
    91f0:      	mov	x17, #-0x10             ; =-16
    91f4:      	movk	x17, #0x7fff, lsl #48
    91f8:      	cmp	x3, x17
    91fc:      	b.hi	0x908c <_stogir.stack.valid-frame-object-inputs?+0x20c>
    9200:      	add	x0, x3, #0xf
    9204:      	and	x0, x0, #0xfffffffffffffff0
    9208:      	movz	w1, #0x0, lsl #16
    920c:      	b	0x909c <_stogir.stack.valid-frame-object-inputs?+0x21c>
    9210:      	mov	w1, #0x2                ; =2
    9214:      	b	0x9044 <_stogir.stack.valid-frame-object-inputs?+0x1c4>
    9218:      	brk	#0
    921c:      	b	0x9218 <_stogir.stack.valid-frame-object-inputs?+0x398>
    9220:      	brk	#0
    9224:      	b	0x9220 <_stogir.stack.valid-frame-object-inputs?+0x3a0>
    9228:      	mov	w1, #0x4                ; =4
    922c:      	b	0x9214 <_stogir.stack.valid-frame-object-inputs?+0x394>
    9230:      	mov	w1, #0x8                ; =8
    9234:      	b	0x922c <_stogir.stack.valid-frame-object-inputs?+0x3ac>

0000000000009238 <_stogir.stack.validate-scope-inputs>:
    9238:      	sxtw	x1, w1
    923c:      	cmp	x1, #0x53
    9240:      	cset	w5, eq
    9244:      	uxtb	w16, w5
    9248:      	cmp	w16, wzr
    924c:      	b.ne	0x927c <_stogir.stack.validate-scope-inputs+0x44>
    9250:      	cmp	x1, #0x54
    9254:      	b.eq	0x927c <_stogir.stack.validate-scope-inputs+0x44>
    9258:      	adrp	x16, 0x9000 <_stogir.stack.valid-frame-object-inputs?+0x180>
		0000000000009258:  ARM64_RELOC_PAGE21	l_stogir.445
    925c:      	ldr	x16, [x16]
		000000000000925c:  ARM64_RELOC_PAGEOFF12	l_stogir.445
    9260:      	orr	x0, x16, xzr
    9264:      	mov	x1, #0x1                ; =1
    9268:      	mov	x2, #0x22               ; =34
    926c:      	str	x1, [x8]
    9270:      	str	x0, [x8, #0x8]
    9274:      	str	x2, [x8, #0x10]
    9278:      	ret
    927c:      	uxtb	w16, w5
    9280:      	cmp	w16, wzr
    9284:      	mov	w16, #0x6               ; =6
    9288:      	movz	w17, #0x0, lsl #16
    928c:      	csel	w1, w16, w17, ne
    9290:      	sxtw	x2, w2
    9294:      	sxtw	x1, w1
    9298:      	cmp	x2, x1
    929c:      	b.ne	0x9258 <_stogir.stack.validate-scope-inputs+0x20>
    92a0:      	sxtw	x3, w3
    92a4:      	cmp	x3, #0x0
    92a8:      	cset	w1, gt
    92ac:      	movz	x16, #0x0, lsl #48
    92b0:      	sub	x2, x16, x3
    92b4:      	sub	x6, x2, #0x1
    92b8:      	uxtb	w16, w1
    92bc:      	cmp	w16, wzr
    92c0:      	b.eq	0x9394 <_stogir.stack.validate-scope-inputs+0x15c>
    92c4:      	ldr	x2, [x0, #0x8]
    92c8:      	cmp	x3, x2
    92cc:      	b.ge	0x938c <_stogir.stack.validate-scope-inputs+0x154>
    92d0:      	add	x2, x0, #0x78
    92d4:      	ldr	x2, [x2, #0x8]
    92d8:      	cmp	x3, x2
    92dc:      	b.ge	0x9434 <_stogir.stack.validate-scope-inputs+0x1fc>
    92e0:      	ldr	x2, [x0, #0x78]
    92e4:      	add	x2, x2, x3, lsl #2
    92e8:      	ldr	w2, [x2]
    92ec:      	sxtw	x2, w2
    92f0:      	cmp	x2, #0x0
    92f4:      	cset	w2, ge
    92f8:      	ubfx	x2, x2, #0, #8
    92fc:      	b	0x9438 <_stogir.stack.validate-scope-inputs+0x200>
    9300:      	movz	w2, #0x0, lsl #16
    9304:      	movz	x1, #0x0, lsl #48
    9308:      	ubfx	x2, x2, #0, #32
    930c:      	lsr	x16, x2, #0
    9310:      	cmp	x16, #0x1
    9314:      	b.eq	0x9330 <_stogir.stack.validate-scope-inputs+0xf8>
    9318:      	b.lo	0x9320 <_stogir.stack.validate-scope-inputs+0xe8>
    931c:      	b	0x9334 <_stogir.stack.validate-scope-inputs+0xfc>
    9320:      	cmp	x16, #0x0
    9324:      	b.eq	0x932c <_stogir.stack.validate-scope-inputs+0xf4>
    9328:      	b	0x9334 <_stogir.stack.validate-scope-inputs+0xfc>
    932c:      	b	0x9338 <_stogir.stack.validate-scope-inputs+0x100>
    9330:      	b	0x93dc <_stogir.stack.validate-scope-inputs+0x1a4>
    9334:      	b	0x960c <_stogir.stack.validate-scope-inputs+0x3d4>
    9338:      	adrp	x16, 0x9000 <_stogir.stack.valid-frame-object-inputs?+0x180>
		0000000000009338:  ARM64_RELOC_PAGE21	l_stogir.446
    933c:      	ldr	x16, [x16]
		000000000000933c:  ARM64_RELOC_PAGEOFF12	l_stogir.446
    9340:      	orr	x0, x16, xzr
    9344:      	mov	x1, #0x1                ; =1
    9348:      	mov	x2, #0x1b               ; =27
    934c:      	b	0x926c <_stogir.stack.validate-scope-inputs+0x34>
    9350:      	ldr	x1, [x0, #0x28]
    9354:      	add	x1, x1, x6, lsl #4
    9358:      	ldr	x1, [x1]
    935c:      	mov	w2, #0x1                ; =1
    9360:      	b	0x9308 <_stogir.stack.validate-scope-inputs+0xd0>
    9364:      	movz	x2, #0x0, lsl #48
    9368:      	cmp	x2, #0x0
    936c:      	b.eq	0x9300 <_stogir.stack.validate-scope-inputs+0xc8>
    9370:      	uxtb	w16, w1
    9374:      	cmp	w16, wzr
    9378:      	b.eq	0x9350 <_stogir.stack.validate-scope-inputs+0x118>
    937c:      	ldr	x1, [x0]
    9380:      	add	x1, x1, x3, lsl #4
    9384:      	ldr	x1, [x1]
    9388:      	b	0x935c <_stogir.stack.validate-scope-inputs+0x124>
    938c:      	movz	x2, #0x0, lsl #48
    9390:      	b	0x9368 <_stogir.stack.validate-scope-inputs+0x130>
    9394:      	cmp	x3, #0x0
    9398:      	b.ge	0x9364 <_stogir.stack.validate-scope-inputs+0x12c>
    939c:      	add	x7, x0, #0x28
    93a0:      	add	x9, x0, #0x50
    93a4:      	ldr	x7, [x7, #0x8]
    93a8:      	ldr	x9, [x9, #0x8]
    93ac:      	cmp	x7, x9
    93b0:      	b.ne	0x942c <_stogir.stack.validate-scope-inputs+0x1f4>
    93b4:      	cmp	x2, x7
    93b8:      	b.gt	0x943c <_stogir.stack.validate-scope-inputs+0x204>
    93bc:      	ldr	x2, [x0, #0x50]
    93c0:      	add	x2, x2, x6, lsl #2
    93c4:      	ldr	w2, [x2]
    93c8:      	sxtw	x2, w2
    93cc:      	cmp	x2, #0x0
    93d0:      	cset	w2, gt
    93d4:      	ubfx	x2, x2, #0, #8
    93d8:      	b	0x9440 <_stogir.stack.validate-scope-inputs+0x208>
    93dc:      	cmp	x3, #0x0
    93e0:      	b.le	0x9414 <_stogir.stack.validate-scope-inputs+0x1dc>
    93e4:      	uxtb	w1, w1
    93e8:      	cmp	x1, #0x83
    93ec:      	cset	w2, lt
    93f0:      	uxtb	w16, w2
    93f4:      	cmp	w16, wzr
    93f8:      	b.eq	0x9444 <_stogir.stack.validate-scope-inputs+0x20c>
    93fc:      	adrp	x16, 0x9000 <_stogir.stack.valid-frame-object-inputs?+0x180>
		00000000000093fc:  ARM64_RELOC_PAGE21	l_stogir.447
    9400:      	ldr	x16, [x16]
		0000000000009400:  ARM64_RELOC_PAGEOFF12	l_stogir.447
    9404:      	orr	x3, x16, xzr
    9408:      	add	x3, x1, x3
    940c:      	ldrb	w3, [x3]
    9410:      	b	0x9448 <_stogir.stack.validate-scope-inputs+0x210>
    9414:      	adrp	x16, 0x9000 <_stogir.stack.valid-frame-object-inputs?+0x180>
		0000000000009414:  ARM64_RELOC_PAGE21	l_stogir.448
    9418:      	ldr	x16, [x16]
		0000000000009418:  ARM64_RELOC_PAGEOFF12	l_stogir.448
    941c:      	orr	x0, x16, xzr
    9420:      	mov	x1, #0x1                ; =1
    9424:      	mov	x2, #0x1b               ; =27
    9428:      	b	0x934c <_stogir.stack.validate-scope-inputs+0x114>
    942c:      	movz	x2, #0x0, lsl #48
    9430:      	b	0x9368 <_stogir.stack.validate-scope-inputs+0x130>
    9434:      	movz	x2, #0x0, lsl #48
    9438:      	b	0x9390 <_stogir.stack.validate-scope-inputs+0x158>
    943c:      	movz	x2, #0x0, lsl #48
    9440:      	b	0x9430 <_stogir.stack.validate-scope-inputs+0x1f8>
    9444:      	movz	w3, #0x0, lsl #16
    9448:      	uxtb	w16, w3
    944c:      	and	w3, w16, #0x1
    9450:      	uxtb	w3, w3
    9454:      	ubfx	x3, x3, #0, #8
    9458:      	cmp	x3, #0x0
    945c:      	b.eq	0x9414 <_stogir.stack.validate-scope-inputs+0x1dc>
    9460:      	uxtb	w16, w2
    9464:      	cmp	w16, wzr
    9468:      	b.eq	0x9484 <_stogir.stack.validate-scope-inputs+0x24c>
    946c:      	adrp	x16, 0x9000 <_stogir.stack.valid-frame-object-inputs?+0x180>
		000000000000946c:  ARM64_RELOC_PAGE21	l_stogir.447
    9470:      	ldr	x16, [x16]
		0000000000009470:  ARM64_RELOC_PAGEOFF12	l_stogir.447
    9474:      	orr	x2, x16, xzr
    9478:      	add	x1, x1, x2
    947c:      	ldrb	w1, [x1]
    9480:      	b	0x9488 <_stogir.stack.validate-scope-inputs+0x250>
    9484:      	movz	w1, #0x0, lsl #16
    9488:      	uxtb	w16, w1
    948c:      	and	w1, w16, #0x4
    9490:      	uxtb	w1, w1
    9494:      	ubfx	x1, x1, #0, #8
    9498:      	cmp	x1, #0x0
    949c:      	cset	w1, eq
    94a0:      	uxtb	w16, w1
    94a4:      	cmp	w16, wzr
    94a8:      	cset	x1, eq
    94ac:      	cmp	x1, #0x0
    94b0:      	b.ne	0x9414 <_stogir.stack.validate-scope-inputs+0x1dc>
    94b4:      	uxtb	w16, w5
    94b8:      	cmp	w16, wzr
    94bc:      	b.eq	0x94d0 <_stogir.stack.validate-scope-inputs+0x298>
    94c0:      	movz	x1, #0x0, lsl #48
    94c4:      	mov	x0, #0x8                ; =8
    94c8:      	movz	x2, #0x0, lsl #48
    94cc:      	b	0x9428 <_stogir.stack.validate-scope-inputs+0x1f0>
    94d0:      	sxtw	x4, w4
    94d4:      	cmp	x4, #0x0
    94d8:      	cset	w1, gt
    94dc:      	movz	x16, #0x0, lsl #48
    94e0:      	sub	x2, x16, x4
    94e4:      	sub	x3, x2, #0x1
    94e8:      	uxtb	w16, w1
    94ec:      	cmp	w16, wzr
    94f0:      	b.eq	0x95c4 <_stogir.stack.validate-scope-inputs+0x38c>
    94f4:      	ldr	x2, [x0, #0x8]
    94f8:      	cmp	x4, x2
    94fc:      	b.ge	0x95bc <_stogir.stack.validate-scope-inputs+0x384>
    9500:      	add	x2, x0, #0x78
    9504:      	ldr	x2, [x2, #0x8]
    9508:      	cmp	x4, x2
    950c:      	b.ge	0x9664 <_stogir.stack.validate-scope-inputs+0x42c>
    9510:      	ldr	x2, [x0, #0x78]
    9514:      	add	x2, x2, x4, lsl #2
    9518:      	ldr	w2, [x2]
    951c:      	sxtw	x2, w2
    9520:      	cmp	x2, #0x0
    9524:      	cset	w2, ge
    9528:      	ubfx	x2, x2, #0, #8
    952c:      	b	0x9668 <_stogir.stack.validate-scope-inputs+0x430>
    9530:      	movz	w1, #0x0, lsl #16
    9534:      	movz	x0, #0x0, lsl #48
    9538:      	ubfx	x1, x1, #0, #32
    953c:      	lsr	x16, x1, #0
    9540:      	cmp	x16, #0x1
    9544:      	b.eq	0x9560 <_stogir.stack.validate-scope-inputs+0x328>
    9548:      	b.lo	0x9550 <_stogir.stack.validate-scope-inputs+0x318>
    954c:      	b	0x9564 <_stogir.stack.validate-scope-inputs+0x32c>
    9550:      	cmp	x16, #0x0
    9554:      	b.eq	0x955c <_stogir.stack.validate-scope-inputs+0x324>
    9558:      	b	0x9564 <_stogir.stack.validate-scope-inputs+0x32c>
    955c:      	b	0x9568 <_stogir.stack.validate-scope-inputs+0x330>
    9560:      	b	0x9614 <_stogir.stack.validate-scope-inputs+0x3dc>
    9564:      	b	0x9674 <_stogir.stack.validate-scope-inputs+0x43c>
    9568:      	adrp	x16, 0x9000 <_stogir.stack.valid-frame-object-inputs?+0x180>
		0000000000009568:  ARM64_RELOC_PAGE21	l_stogir.449
    956c:      	ldr	x16, [x16]
		000000000000956c:  ARM64_RELOC_PAGEOFF12	l_stogir.449
    9570:      	orr	x0, x16, xzr
    9574:      	mov	x1, #0x1                ; =1
    9578:      	mov	x2, #0x1b               ; =27
    957c:      	b	0x94cc <_stogir.stack.validate-scope-inputs+0x294>
    9580:      	ldr	x0, [x0, #0x28]
    9584:      	add	x0, x0, x3, lsl #4
    9588:      	ldr	x0, [x0]
    958c:      	mov	w1, #0x1                ; =1
    9590:      	b	0x9538 <_stogir.stack.validate-scope-inputs+0x300>
    9594:      	movz	x2, #0x0, lsl #48
    9598:      	cmp	x2, #0x0
    959c:      	b.eq	0x9530 <_stogir.stack.validate-scope-inputs+0x2f8>
    95a0:      	uxtb	w16, w1
    95a4:      	cmp	w16, wzr
    95a8:      	b.eq	0x9580 <_stogir.stack.validate-scope-inputs+0x348>
    95ac:      	ldr	x0, [x0]
    95b0:      	add	x0, x0, x4, lsl #4
    95b4:      	ldr	x0, [x0]
    95b8:      	b	0x958c <_stogir.stack.validate-scope-inputs+0x354>
    95bc:      	movz	x2, #0x0, lsl #48
    95c0:      	b	0x9598 <_stogir.stack.validate-scope-inputs+0x360>
    95c4:      	cmp	x4, #0x0
    95c8:      	b.ge	0x9594 <_stogir.stack.validate-scope-inputs+0x35c>
    95cc:      	add	x5, x0, #0x28
    95d0:      	add	x6, x0, #0x50
    95d4:      	ldr	x5, [x5, #0x8]
    95d8:      	ldr	x6, [x6, #0x8]
    95dc:      	cmp	x5, x6
    95e0:      	b.ne	0x965c <_stogir.stack.validate-scope-inputs+0x424>
    95e4:      	cmp	x2, x5
    95e8:      	b.gt	0x966c <_stogir.stack.validate-scope-inputs+0x434>
    95ec:      	ldr	x2, [x0, #0x50]
    95f0:      	add	x2, x2, x3, lsl #2
    95f4:      	ldr	w2, [x2]
    95f8:      	sxtw	x2, w2
    95fc:      	cmp	x2, #0x0
    9600:      	cset	w2, gt
    9604:      	ubfx	x2, x2, #0, #8
    9608:      	b	0x9670 <_stogir.stack.validate-scope-inputs+0x438>
    960c:      	brk	#0
    9610:      	b	0x960c <_stogir.stack.validate-scope-inputs+0x3d4>
    9614:      	orr	w1, w0, wzr
    9618:      	ubfx	x1, x1, #0, #32
    961c:      	ubfx	x1, x1, #8, #8
    9620:      	cmp	x1, #0x6
    9624:      	b.ne	0x9644 <_stogir.stack.validate-scope-inputs+0x40c>
    9628:      	uxtb	w0, w0
    962c:      	cmp	x0, #0x48
    9630:      	b.eq	0x9644 <_stogir.stack.validate-scope-inputs+0x40c>
    9634:      	movz	x1, #0x0, lsl #48
    9638:      	mov	x0, #0x8                ; =8
    963c:      	movz	x2, #0x0, lsl #48
    9640:      	b	0x9658 <_stogir.stack.validate-scope-inputs+0x420>
    9644:      	adrp	x16, 0x9000 <_stogir.stack.valid-frame-object-inputs?+0x180>
		0000000000009644:  ARM64_RELOC_PAGE21	l_stogir.450
    9648:      	ldr	x16, [x16]
		0000000000009648:  ARM64_RELOC_PAGEOFF12	l_stogir.450
    964c:      	orr	x0, x16, xzr
    9650:      	mov	x1, #0x1                ; =1
    9654:      	mov	x2, #0x29               ; =41
    9658:      	b	0x957c <_stogir.stack.validate-scope-inputs+0x344>
    965c:      	movz	x2, #0x0, lsl #48
    9660:      	b	0x9598 <_stogir.stack.validate-scope-inputs+0x360>
    9664:      	movz	x2, #0x0, lsl #48
    9668:      	b	0x95c0 <_stogir.stack.validate-scope-inputs+0x388>
    966c:      	movz	x2, #0x0, lsl #48
    9670:      	b	0x9660 <_stogir.stack.validate-scope-inputs+0x428>
    9674:      	brk	#0
    9678:      	b	0x9674 <_stogir.stack.validate-scope-inputs+0x43c>

000000000000967c <_stogir.stack.validate-inputs>:
    967c:      	sub	sp, sp, #0x110
    9680:      	str	x29, [sp]
    9684:      	str	x30, [sp, #0x8]
    9688:      	mov	x29, sp
    968c:      	str	x19, [sp, #0xb8]
    9690:      	str	x20, [sp, #0xc0]
    9694:      	str	x21, [sp, #0xc8]
    9698:      	str	x22, [sp, #0xd0]
    969c:      	str	x23, [sp, #0xd8]
    96a0:      	str	x24, [sp, #0xe0]
    96a4:      	str	x25, [sp, #0xe8]
    96a8:      	str	x26, [sp, #0xf0]
    96ac:      	str	x27, [sp, #0xf8]
    96b0:      	str	x28, [sp, #0x100]
    96b4:      	sxtw	x1, w1
    96b8:      	cmp	x1, #0x51
    96bc:      	cset	w19, eq
    96c0:      	uxtb	w16, w19
    96c4:      	cmp	w16, wzr
    96c8:      	b.ne	0x9734 <_stogir.stack.validate-inputs+0xb8>
    96cc:      	cmp	x1, #0x52
    96d0:      	b.eq	0x9734 <_stogir.stack.validate-inputs+0xb8>
    96d4:      	str	x8, [sp, #0x90]
    96d8:      	adrp	x16, 0x9000 <_stogir.stack.valid-frame-object-inputs?+0x180>
		00000000000096d8:  ARM64_RELOC_PAGE21	l_stogir.451
    96dc:      	ldr	x16, [x16]
		00000000000096dc:  ARM64_RELOC_PAGEOFF12	l_stogir.451
    96e0:      	orr	x0, x16, xzr
    96e4:      	mov	x2, #0x1                ; =1
    96e8:      	mov	x1, #0x29               ; =41
    96ec:      	ldr	x3, [sp, #0x90]
    96f0:      	str	x2, [x3]
    96f4:      	str	x0, [x3, #0x8]
    96f8:      	str	x1, [x3, #0x10]
    96fc:      	ldr	x19, [sp, #0xb8]
    9700:      	ldr	x20, [sp, #0xc0]
    9704:      	ldr	x21, [sp, #0xc8]
    9708:      	ldr	x22, [sp, #0xd0]
    970c:      	ldr	x23, [sp, #0xd8]
    9710:      	ldr	x24, [sp, #0xe0]
    9714:      	ldr	x25, [sp, #0xe8]
    9718:      	ldr	x26, [sp, #0xf0]
    971c:      	ldr	x27, [sp, #0xf8]
    9720:      	ldr	x28, [sp, #0x100]
    9724:      	ldr	x29, [sp]
    9728:      	ldr	x30, [sp, #0x8]
    972c:      	add	sp, sp, #0x110
    9730:      	ret
    9734:      	uxtb	w16, w19
    9738:      	cmp	w16, wzr
    973c:      	mov	w16, #0x6               ; =6
    9740:      	movz	w17, #0x0, lsl #16
    9744:      	csel	w1, w16, w17, ne
    9748:      	sxtw	x2, w2
    974c:      	sxtw	x1, w1
    9750:      	cmp	x2, x1
    9754:      	b.ne	0x9c90 <_stogir.stack.validate-inputs+0x614>
    9758:      	sxtw	x20, w5
    975c:      	uxtb	w16, w19
    9760:      	cmp	w16, wzr
    9764:      	b.eq	0x9788 <_stogir.stack.validate-inputs+0x10c>
    9768:      	cmp	x20, #0x0
    976c:      	b.eq	0x9788 <_stogir.stack.validate-inputs+0x10c>
    9770:      	cmp	x20, #0x0
    9774:      	b.le	0x9824 <_stogir.stack.validate-inputs+0x1a8>
    9778:      	sub	x1, x20, #0x1
    977c:      	and	x1, x1, x20
    9780:      	cmp	x1, #0x0
    9784:      	b.ne	0x9824 <_stogir.stack.validate-inputs+0x1a8>
    9788:      	mov	w1, w3
    978c:      	mov	x21, x8
    9790:      	add	x8, sp, #0x10
    9794:      	mov	x22, x0
    9798:      	mov	w23, w3
    979c:      	mov	w24, w4
    97a0:      	bl	0x97a0 <_stogir.stack.validate-inputs+0x124>
		00000000000097a0:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    97a4:      	add	x16, sp, #0x10
    97a8:      	ldr	w0, [x16]
    97ac:      	lsr	x16, x0, #0
    97b0:      	cmp	x16, #0x1
    97b4:      	b.eq	0x97d0 <_stogir.stack.validate-inputs+0x154>
    97b8:      	b.lo	0x97c0 <_stogir.stack.validate-inputs+0x144>
    97bc:      	b	0x97d4 <_stogir.stack.validate-inputs+0x158>
    97c0:      	cmp	x16, #0x0
    97c4:      	b.eq	0x97cc <_stogir.stack.validate-inputs+0x150>
    97c8:      	b	0x97d4 <_stogir.stack.validate-inputs+0x158>
    97cc:      	b	0x97d8 <_stogir.stack.validate-inputs+0x15c>
    97d0:      	b	0x97f4 <_stogir.stack.validate-inputs+0x178>
    97d4:      	b	0x9aac <_stogir.stack.validate-inputs+0x430>
    97d8:      	adrp	x16, 0x9000 <_stogir.stack.valid-frame-object-inputs?+0x180>
		00000000000097d8:  ARM64_RELOC_PAGE21	l_stogir.452
    97dc:      	ldr	x16, [x16]
		00000000000097dc:  ARM64_RELOC_PAGEOFF12	l_stogir.452
    97e0:      	orr	x0, x16, xzr
    97e4:      	str	x21, [sp, #0x90]
    97e8:      	mov	x2, #0x1                ; =1
    97ec:      	mov	x1, #0x1f               ; =31
    97f0:      	b	0x96ec <_stogir.stack.validate-inputs+0x70>
    97f4:      	sxtw	x23, w23
    97f8:      	add	x16, sp, #0x10
    97fc:      	ldr	x0, [x16, #0x8]
    9800:      	cmp	x23, #0x0
    9804:      	b.gt	0x982c <_stogir.stack.validate-inputs+0x1b0>
    9808:      	str	x21, [sp, #0x90]
    980c:      	adrp	x16, 0x9000 <_stogir.stack.valid-frame-object-inputs?+0x180>
		000000000000980c:  ARM64_RELOC_PAGE21	l_stogir.453
    9810:      	ldr	x16, [x16]
		0000000000009810:  ARM64_RELOC_PAGEOFF12	l_stogir.453
    9814:      	orr	x0, x16, xzr
    9818:      	mov	x2, #0x1                ; =1
    981c:      	mov	x1, #0x1f               ; =31
    9820:      	b	0x97f0 <_stogir.stack.validate-inputs+0x174>
    9824:      	str	x8, [sp, #0x90]
    9828:      	b	0x96d8 <_stogir.stack.validate-inputs+0x5c>
    982c:      	uxtb	w0, w0
    9830:      	cmp	x0, #0x83
    9834:      	cset	w1, lt
    9838:      	uxtb	w16, w1
    983c:      	cmp	w16, wzr
    9840:      	b.eq	0x985c <_stogir.stack.validate-inputs+0x1e0>
    9844:      	adrp	x16, 0x9000 <_stogir.stack.valid-frame-object-inputs?+0x180>
		0000000000009844:  ARM64_RELOC_PAGE21	l_stogir.454
    9848:      	ldr	x16, [x16]
		0000000000009848:  ARM64_RELOC_PAGEOFF12	l_stogir.454
    984c:      	orr	x2, x16, xzr
    9850:      	add	x2, x0, x2
    9854:      	ldrb	w2, [x2]
    9858:      	b	0x9860 <_stogir.stack.validate-inputs+0x1e4>
    985c:      	movz	w2, #0x0, lsl #16
    9860:      	uxtb	w16, w2
    9864:      	and	w2, w16, #0x1
    9868:      	uxtb	w2, w2
    986c:      	ubfx	x2, x2, #0, #8
    9870:      	cmp	x2, #0x0
    9874:      	b.eq	0x9c98 <_stogir.stack.validate-inputs+0x61c>
    9878:      	uxtb	w16, w1
    987c:      	cmp	w16, wzr
    9880:      	b.eq	0x989c <_stogir.stack.validate-inputs+0x220>
    9884:      	adrp	x16, 0x9000 <_stogir.stack.valid-frame-object-inputs?+0x180>
		0000000000009884:  ARM64_RELOC_PAGE21	l_stogir.454
    9888:      	ldr	x16, [x16]
		0000000000009888:  ARM64_RELOC_PAGEOFF12	l_stogir.454
    988c:      	orr	x1, x16, xzr
    9890:      	add	x0, x0, x1
    9894:      	ldrb	w0, [x0]
    9898:      	b	0x98a0 <_stogir.stack.validate-inputs+0x224>
    989c:      	movz	w0, #0x0, lsl #16
    98a0:      	uxtb	w16, w0
    98a4:      	and	w0, w16, #0x4
    98a8:      	uxtb	w0, w0
    98ac:      	ubfx	x0, x0, #0, #8
    98b0:      	cmp	x0, #0x0
    98b4:      	cset	w0, eq
    98b8:      	uxtb	w16, w0
    98bc:      	cmp	w16, wzr
    98c0:      	cset	x0, eq
    98c4:      	cmp	x0, #0x0
    98c8:      	b.ne	0x9ca0 <_stogir.stack.validate-inputs+0x624>
    98cc:      	add	x8, sp, #0x40
    98d0:      	mov	x0, x22
    98d4:      	mov	w1, w24
    98d8:      	bl	0x98d8 <_stogir.stack.validate-inputs+0x25c>
		00000000000098d8:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    98dc:      	add	x16, sp, #0x40
    98e0:      	ldr	w0, [x16]
    98e4:      	lsr	x16, x0, #0
    98e8:      	cmp	x16, #0x1
    98ec:      	b.eq	0x9908 <_stogir.stack.validate-inputs+0x28c>
    98f0:      	b.lo	0x98f8 <_stogir.stack.validate-inputs+0x27c>
    98f4:      	b	0x990c <_stogir.stack.validate-inputs+0x290>
    98f8:      	cmp	x16, #0x0
    98fc:      	b.eq	0x9904 <_stogir.stack.validate-inputs+0x288>
    9900:      	b	0x990c <_stogir.stack.validate-inputs+0x290>
    9904:      	b	0x9910 <_stogir.stack.validate-inputs+0x294>
    9908:      	b	0x992c <_stogir.stack.validate-inputs+0x2b0>
    990c:      	b	0x9b98 <_stogir.stack.validate-inputs+0x51c>
    9910:      	adrp	x16, 0x9000 <_stogir.stack.valid-frame-object-inputs?+0x180>
		0000000000009910:  ARM64_RELOC_PAGE21	l_stogir.455
    9914:      	ldr	x16, [x16]
		0000000000009914:  ARM64_RELOC_PAGEOFF12	l_stogir.455
    9918:      	orr	x0, x16, xzr
    991c:      	str	x21, [sp, #0x90]
    9920:      	mov	x2, #0x1                ; =1
    9924:      	mov	x1, #0x18               ; =24
    9928:      	b	0x9820 <_stogir.stack.validate-inputs+0x1a4>
    992c:      	add	x16, sp, #0x40
    9930:      	ldr	x0, [x16, #0x8]
    9934:      	orr	w1, w0, wzr
    9938:      	ubfx	x1, x1, #0, #32
    993c:      	ubfx	x1, x1, #8, #8
    9940:      	cmp	x1, #0x1
    9944:      	b.lt	0x9ca8 <_stogir.stack.validate-inputs+0x62c>
    9948:      	cmp	x1, #0xb
    994c:      	b.gt	0x9cb0 <_stogir.stack.validate-inputs+0x634>
    9950:      	uxtb	w0, w0
    9954:      	cmp	x0, #0x48
    9958:      	b.eq	0x9cb8 <_stogir.stack.validate-inputs+0x63c>
    995c:      	sxtw	x0, w24
    9960:      	cmp	x1, #0x0
    9964:      	cset	w23, eq
    9968:      	cmp	x1, #0x1
    996c:      	cset	w25, eq
    9970:      	cmp	x1, #0x2
    9974:      	cset	w26, eq
    9978:      	cmp	x1, #0x7
    997c:      	cset	w27, eq
    9980:      	cmp	x1, #0x8
    9984:      	cset	w28, eq
    9988:      	cmp	x1, #0x3
    998c:      	cset	w2, eq
    9990:      	cmp	x1, #0x9
    9994:      	cset	w3, eq
    9998:      	cmp	x1, #0x4
    999c:      	cset	w4, eq
    99a0:      	cmp	x1, #0xa
    99a4:      	cset	w5, eq
    99a8:      	cmp	x1, #0xd
    99ac:      	cset	w6, eq
    99b0:      	cmp	x1, #0x5
    99b4:      	cset	w7, eq
    99b8:      	cmp	x1, #0xb
    99bc:      	cset	w8, eq
    99c0:      	cmp	x1, #0xc
    99c4:      	cset	w9, eq
    99c8:      	cmp	x1, #0x6
    99cc:      	cset	w1, eq
    99d0:      	uxtb	w16, w1
    99d4:      	cmp	w16, wzr
    99d8:      	mov	w16, #0x8               ; =8
    99dc:      	movn	w17, #0x0, lsl #16
    99e0:      	csel	w1, w16, w17, ne
    99e4:      	cmp	x0, #0x0
    99e8:      	b.ge	0x9cc0 <_stogir.stack.validate-inputs+0x644>
    99ec:      	uxtb	w16, w19
    99f0:      	cmp	w16, wzr
    99f4:      	b.eq	0x9a00 <_stogir.stack.validate-inputs+0x384>
    99f8:      	cmp	x20, #0x10
    99fc:      	b.gt	0x9a04 <_stogir.stack.validate-inputs+0x388>
    9a00:      	mov	x20, #0x10              ; =16
    9a04:      	mov	x0, x22
    9a08:      	mov	w19, w2
    9a0c:      	mov	x2, x20
    9a10:      	mov	w20, w3
    9a14:      	mov	w22, w4
    9a18:      	str	w7, [sp, #0x98]
    9a1c:      	str	w8, [sp, #0xa0]
    9a20:      	add	x8, sp, #0x70
    9a24:      	str	w9, [sp, #0xa8]
    9a28:      	str	w1, [sp, #0xb0]
    9a2c:      	mov	w1, w24
    9a30:      	mov	w24, w5
    9a34:      	str	x21, [sp, #0x90]
    9a38:      	mov	w21, w6
    9a3c:      	bl	0x9a3c <_stogir.stack.validate-inputs+0x3c0>
		0000000000009a3c:  ARM64_RELOC_BRANCH26	_stogir.stack.constant-size-aligned
    9a40:      	add	x16, sp, #0x70
    9a44:      	ldr	w0, [x16]
    9a48:      	lsr	x16, x0, #0
    9a4c:      	cmp	x16, #0x1
    9a50:      	b.eq	0x9a6c <_stogir.stack.validate-inputs+0x3f0>
    9a54:      	b.lo	0x9a5c <_stogir.stack.validate-inputs+0x3e0>
    9a58:      	b	0x9a70 <_stogir.stack.validate-inputs+0x3f4>
    9a5c:      	cmp	x16, #0x0
    9a60:      	b.eq	0x9a68 <_stogir.stack.validate-inputs+0x3ec>
    9a64:      	b	0x9a70 <_stogir.stack.validate-inputs+0x3f4>
    9a68:      	b	0x9ba0 <_stogir.stack.validate-inputs+0x524>
    9a6c:      	b	0x9a74 <_stogir.stack.validate-inputs+0x3f8>
    9a70:      	b	0x9c74 <_stogir.stack.validate-inputs+0x5f8>
    9a74:      	add	x16, sp, #0x70
    9a78:      	orr	x0, x16, xzr
    9a7c:      	add	x1, x0, #0x8
    9a80:      	add	x16, sp, #0x70
    9a84:      	ldr	x0, [x16, #0x8]
    9a88:      	ldr	x1, [x1, #0x8]
    9a8c:      	mov	x2, #0x1                ; =1
    9a90:      	b	0x9afc <_stogir.stack.validate-inputs+0x480>
    9a94:      	adrp	x16, 0x9000 <_stogir.stack.valid-frame-object-inputs?+0x180>
		0000000000009a94:  ARM64_RELOC_PAGE21	l_stogir.456
    9a98:      	ldr	x16, [x16]
		0000000000009a98:  ARM64_RELOC_PAGEOFF12	l_stogir.456
    9a9c:      	orr	x0, x16, xzr
    9aa0:      	mov	x2, #0x1                ; =1
    9aa4:      	mov	x1, #0x29               ; =41
    9aa8:      	b	0x9928 <_stogir.stack.validate-inputs+0x2ac>
    9aac:      	brk	#0
    9ab0:      	b	0x9aac <_stogir.stack.validate-inputs+0x430>
    9ab4:      	mov	w3, #0x1                ; =1
    9ab8:      	sxtw	x3, w3
    9abc:      	and	x0, x3, #0xffffffff
    9ac0:      	movz	x2, #0x0, lsl #48
    9ac4:      	movz	x1, #0x0, lsl #48
    9ac8:      	b	0x9aa8 <_stogir.stack.validate-inputs+0x42c>
    9acc:      	uxtb	w16, w23
    9ad0:      	cmp	w16, wzr
    9ad4:      	b.eq	0x9b00 <_stogir.stack.validate-inputs+0x484>
    9ad8:      	movz	w3, #0x0, lsl #16
    9adc:      	b	0x9ab8 <_stogir.stack.validate-inputs+0x43c>
    9ae0:      	mov	w16, #0x1               ; =1
    9ae4:      	str	w16, [sp, #0xb0]
    9ae8:      	ldr	w3, [sp, #0xb0]
    9aec:      	sxtw	x3, w3
    9af0:      	and	x0, x3, #0xffffffff
    9af4:      	movz	x2, #0x0, lsl #48
    9af8:      	movz	x1, #0x0, lsl #48
    9afc:      	b	0x9ac8 <_stogir.stack.validate-inputs+0x44c>
    9b00:      	uxtb	w16, w25
    9b04:      	cmp	w16, wzr
    9b08:      	b.ne	0x9ab4 <_stogir.stack.validate-inputs+0x438>
    9b0c:      	uxtb	w16, w26
    9b10:      	cmp	w16, wzr
    9b14:      	b.ne	0x9ab4 <_stogir.stack.validate-inputs+0x438>
    9b18:      	uxtb	w16, w27
    9b1c:      	cmp	w16, wzr
    9b20:      	b.ne	0x9ab4 <_stogir.stack.validate-inputs+0x438>
    9b24:      	uxtb	w16, w28
    9b28:      	cmp	w16, wzr
    9b2c:      	b.ne	0x9ab4 <_stogir.stack.validate-inputs+0x438>
    9b30:      	uxtb	w16, w19
    9b34:      	cmp	w16, wzr
    9b38:      	b.ne	0x9c60 <_stogir.stack.validate-inputs+0x5e4>
    9b3c:      	uxtb	w16, w20
    9b40:      	cmp	w16, wzr
    9b44:      	b.ne	0x9c60 <_stogir.stack.validate-inputs+0x5e4>
    9b48:      	uxtb	w16, w22
    9b4c:      	cmp	w16, wzr
    9b50:      	b.ne	0x9c7c <_stogir.stack.validate-inputs+0x600>
    9b54:      	uxtb	w16, w24
    9b58:      	cmp	w16, wzr
    9b5c:      	b.ne	0x9c7c <_stogir.stack.validate-inputs+0x600>
    9b60:      	uxtb	w16, w21
    9b64:      	cmp	w16, wzr
    9b68:      	b.ne	0x9c7c <_stogir.stack.validate-inputs+0x600>
    9b6c:      	uxtb	w16, w0
    9b70:      	cmp	w16, wzr
    9b74:      	b.ne	0x9b90 <_stogir.stack.validate-inputs+0x514>
    9b78:      	uxtb	w16, w1
    9b7c:      	cmp	w16, wzr
    9b80:      	b.ne	0x9b90 <_stogir.stack.validate-inputs+0x514>
    9b84:      	uxtb	w16, w2
    9b88:      	cmp	w16, wzr
    9b8c:      	b.eq	0x9b94 <_stogir.stack.validate-inputs+0x518>
    9b90:      	mov	w3, #0x8                ; =8
    9b94:      	b	0x9c80 <_stogir.stack.validate-inputs+0x604>
    9b98:      	brk	#0
    9b9c:      	b	0x9b98 <_stogir.stack.validate-inputs+0x51c>
    9ba0:      	uxtb	w16, w23
    9ba4:      	cmp	w16, wzr
    9ba8:      	b.eq	0x9bb8 <_stogir.stack.validate-inputs+0x53c>
    9bac:      	movz	w16, #0x0, lsl #16
    9bb0:      	str	w16, [sp, #0xb0]
    9bb4:      	b	0x9ae8 <_stogir.stack.validate-inputs+0x46c>
    9bb8:      	uxtb	w16, w25
    9bbc:      	cmp	w16, wzr
    9bc0:      	b.ne	0x9ae0 <_stogir.stack.validate-inputs+0x464>
    9bc4:      	uxtb	w16, w26
    9bc8:      	cmp	w16, wzr
    9bcc:      	b.ne	0x9ae0 <_stogir.stack.validate-inputs+0x464>
    9bd0:      	uxtb	w16, w27
    9bd4:      	cmp	w16, wzr
    9bd8:      	b.ne	0x9ae0 <_stogir.stack.validate-inputs+0x464>
    9bdc:      	uxtb	w16, w28
    9be0:      	cmp	w16, wzr
    9be4:      	b.ne	0x9ae0 <_stogir.stack.validate-inputs+0x464>
    9be8:      	uxtb	w16, w19
    9bec:      	cmp	w16, wzr
    9bf0:      	b.ne	0x9c68 <_stogir.stack.validate-inputs+0x5ec>
    9bf4:      	uxtb	w16, w20
    9bf8:      	cmp	w16, wzr
    9bfc:      	b.ne	0x9c68 <_stogir.stack.validate-inputs+0x5ec>
    9c00:      	uxtb	w16, w22
    9c04:      	cmp	w16, wzr
    9c08:      	b.ne	0x9c84 <_stogir.stack.validate-inputs+0x608>
    9c0c:      	uxtb	w16, w24
    9c10:      	cmp	w16, wzr
    9c14:      	b.ne	0x9c84 <_stogir.stack.validate-inputs+0x608>
    9c18:      	uxtb	w16, w21
    9c1c:      	cmp	w16, wzr
    9c20:      	b.ne	0x9c84 <_stogir.stack.validate-inputs+0x608>
    9c24:      	ldr	w0, [sp, #0x98]
    9c28:      	uxtb	w16, w0
    9c2c:      	cmp	w16, wzr
    9c30:      	b.ne	0x9c54 <_stogir.stack.validate-inputs+0x5d8>
    9c34:      	ldr	w1, [sp, #0xa0]
    9c38:      	uxtb	w16, w1
    9c3c:      	cmp	w16, wzr
    9c40:      	b.ne	0x9c54 <_stogir.stack.validate-inputs+0x5d8>
    9c44:      	ldr	w2, [sp, #0xa8]
    9c48:      	uxtb	w16, w2
    9c4c:      	cmp	w16, wzr
    9c50:      	b.eq	0x9c5c <_stogir.stack.validate-inputs+0x5e0>
    9c54:      	mov	w16, #0x8               ; =8
    9c58:      	str	w16, [sp, #0xb0]
    9c5c:      	b	0x9c8c <_stogir.stack.validate-inputs+0x610>
    9c60:      	mov	w3, #0x2                ; =2
    9c64:      	b	0x9ab8 <_stogir.stack.validate-inputs+0x43c>
    9c68:      	mov	w16, #0x2               ; =2
    9c6c:      	str	w16, [sp, #0xb0]
    9c70:      	b	0x9ae8 <_stogir.stack.validate-inputs+0x46c>
    9c74:      	brk	#0
    9c78:      	b	0x9c74 <_stogir.stack.validate-inputs+0x5f8>
    9c7c:      	mov	w3, #0x4                ; =4
    9c80:      	b	0x9c64 <_stogir.stack.validate-inputs+0x5e8>
    9c84:      	mov	w16, #0x4               ; =4
    9c88:      	str	w16, [sp, #0xb0]
    9c8c:      	b	0x9c70 <_stogir.stack.validate-inputs+0x5f4>
    9c90:      	str	x8, [sp, #0x90]
    9c94:      	b	0x96d8 <_stogir.stack.validate-inputs+0x5c>
    9c98:      	str	x21, [sp, #0x90]
    9c9c:      	b	0x980c <_stogir.stack.validate-inputs+0x190>
    9ca0:      	str	x21, [sp, #0x90]
    9ca4:      	b	0x980c <_stogir.stack.validate-inputs+0x190>
    9ca8:      	str	x21, [sp, #0x90]
    9cac:      	b	0x9a94 <_stogir.stack.validate-inputs+0x418>
    9cb0:      	str	x21, [sp, #0x90]
    9cb4:      	b	0x9a94 <_stogir.stack.validate-inputs+0x418>
    9cb8:      	str	x21, [sp, #0x90]
    9cbc:      	b	0x9a94 <_stogir.stack.validate-inputs+0x418>
    9cc0:      	str	x21, [sp, #0x90]
    9cc4:      	mov	w19, w2
    9cc8:      	mov	w20, w3
    9ccc:      	mov	w3, w1
    9cd0:      	mov	w22, w4
    9cd4:      	mov	w24, w5
    9cd8:      	mov	w21, w6
    9cdc:      	mov	w0, w7
    9ce0:      	mov	w1, w8
    9ce4:      	mov	w2, w9
    9ce8:      	b	0x9acc <_stogir.stack.validate-inputs+0x450>

0000000000009cec <_stogir.locals.shape>:
    9cec:      	sub	sp, sp, #0x50
    9cf0:      	str	x29, [sp]
    9cf4:      	str	x30, [sp, #0x8]
    9cf8:      	mov	x29, sp
    9cfc:      	str	x19, [sp, #0x20]
    9d00:      	str	x20, [sp, #0x28]
    9d04:      	str	x21, [sp, #0x30]
    9d08:      	str	x22, [sp, #0x38]
    9d0c:      	str	x23, [sp, #0x40]
    9d10:      	sxtw	x19, w1
    9d14:      	lsl	x20, x19, #2
    9d18:      	cmp	x19, #0x0
    9d1c:      	cset	w1, gt
    9d20:      	movz	x16, #0x0, lsl #48
    9d24:      	sub	x3, x16, x19
    9d28:      	sub	x4, x3, #0x1
    9d2c:      	uxtb	w16, w1
    9d30:      	cmp	w16, wzr
    9d34:      	b.eq	0x9d74 <_stogir.locals.shape+0x88>
    9d38:      	ldr	x3, [x0, #0x8]
    9d3c:      	cmp	x19, x3
    9d40:      	b.ge	0x9ddc <_stogir.locals.shape+0xf0>
    9d44:      	add	x3, x0, #0x78
    9d48:      	ldr	x3, [x3, #0x8]
    9d4c:      	cmp	x19, x3
    9d50:      	b.ge	0x9f70 <_stogir.locals.shape+0x284>
    9d54:      	ldr	x3, [x0, #0x78]
    9d58:      	add	x3, x20, x3
    9d5c:      	ldr	w3, [x3]
    9d60:      	sxtw	x3, w3
    9d64:      	cmp	x3, #0x0
    9d68:      	cset	w3, ge
    9d6c:      	ubfx	x3, x3, #0, #8
    9d70:      	b	0x9f74 <_stogir.locals.shape+0x288>
    9d74:      	cmp	x19, #0x0
    9d78:      	b.ge	0x9de4 <_stogir.locals.shape+0xf8>
    9d7c:      	add	x5, x0, #0x28
    9d80:      	add	x6, x0, #0x50
    9d84:      	ldr	x5, [x5, #0x8]
    9d88:      	ldr	x6, [x6, #0x8]
    9d8c:      	cmp	x5, x6
    9d90:      	b.ne	0x9dbc <_stogir.locals.shape+0xd0>
    9d94:      	cmp	x3, x5
    9d98:      	b.gt	0xa074 <_stogir.locals.shape+0x388>
    9d9c:      	ldr	x3, [x0, #0x50]
    9da0:      	add	x3, x3, x4, lsl #2
    9da4:      	ldr	w3, [x3]
    9da8:      	sxtw	x3, w3
    9dac:      	cmp	x3, #0x0
    9db0:      	cset	w3, gt
    9db4:      	ubfx	x3, x3, #0, #8
    9db8:      	b	0xa078 <_stogir.locals.shape+0x38c>
    9dbc:      	movz	x3, #0x0, lsl #48
    9dc0:      	b	0x9de8 <_stogir.locals.shape+0xfc>
    9dc4:      	adrp	x16, 0x9000 <_stogir.stack.valid-frame-object-inputs?+0x180>
		0000000000009dc4:  ARM64_RELOC_PAGE21	l_stogir.457
    9dc8:      	ldr	x16, [x16]
		0000000000009dc8:  ARM64_RELOC_PAGEOFF12	l_stogir.457
    9dcc:      	orr	x0, x16, xzr
    9dd0:      	mov	x1, #0x1                ; =1
    9dd4:      	mov	x21, #0x1c              ; =28
    9dd8:      	b	0x9e7c <_stogir.locals.shape+0x190>
    9ddc:      	movz	x3, #0x0, lsl #48
    9de0:      	b	0x9de8 <_stogir.locals.shape+0xfc>
    9de4:      	movz	x3, #0x0, lsl #48
    9de8:      	cmp	x3, #0x0
    9dec:      	b.eq	0x9e28 <_stogir.locals.shape+0x13c>
    9df0:      	uxtb	w16, w1
    9df4:      	cmp	w16, wzr
    9df8:      	b.eq	0x9e10 <_stogir.locals.shape+0x124>
    9dfc:      	ldr	x1, [x0]
    9e00:      	add	x1, x1, x19, lsl #4
    9e04:      	ldr	x3, [x1]
    9e08:      	ldr	x1, [x1, #0x8]
    9e0c:      	b	0x9e20 <_stogir.locals.shape+0x134>
    9e10:      	ldr	x1, [x0, #0x28]
    9e14:      	add	x1, x1, x4, lsl #4
    9e18:      	ldr	x3, [x1]
    9e1c:      	ldr	x1, [x1, #0x8]
    9e20:      	mov	w4, #0x1                ; =1
    9e24:      	b	0x9e34 <_stogir.locals.shape+0x148>
    9e28:      	movz	w4, #0x0, lsl #16
    9e2c:      	movz	x3, #0x0, lsl #48
    9e30:      	movz	x1, #0x0, lsl #48
    9e34:      	ubfx	x4, x4, #0, #32
    9e38:      	lsr	x16, x4, #0
    9e3c:      	cmp	x16, #0x1
    9e40:      	b.eq	0x9e5c <_stogir.locals.shape+0x170>
    9e44:      	b.lo	0x9e4c <_stogir.locals.shape+0x160>
    9e48:      	b	0x9e60 <_stogir.locals.shape+0x174>
    9e4c:      	cmp	x16, #0x0
    9e50:      	b.eq	0x9e58 <_stogir.locals.shape+0x16c>
    9e54:      	b	0x9e60 <_stogir.locals.shape+0x174>
    9e58:      	b	0x9e64 <_stogir.locals.shape+0x178>
    9e5c:      	b	0x9eac <_stogir.locals.shape+0x1c0>
    9e60:      	b	0xa084 <_stogir.locals.shape+0x398>
    9e64:      	adrp	x16, 0x9000 <_stogir.stack.valid-frame-object-inputs?+0x180>
		0000000000009e64:  ARM64_RELOC_PAGE21	l_stogir.458
    9e68:      	ldr	x16, [x16]
		0000000000009e68:  ARM64_RELOC_PAGEOFF12	l_stogir.458
    9e6c:      	orr	x0, x16, xzr
    9e70:      	mov	x22, x8
    9e74:      	mov	x1, #0x1                ; =1
    9e78:      	mov	x21, #0x16              ; =22
    9e7c:      	str	x1, [x22]
    9e80:      	str	x0, [x22, #0x8]
    9e84:      	str	x21, [x22, #0x10]
    9e88:      	ldr	x19, [sp, #0x20]
    9e8c:      	ldr	x20, [sp, #0x28]
    9e90:      	ldr	x21, [sp, #0x30]
    9e94:      	ldr	x22, [sp, #0x38]
    9e98:      	ldr	x23, [sp, #0x40]
    9e9c:      	ldr	x29, [sp]
    9ea0:      	ldr	x30, [sp, #0x8]
    9ea4:      	add	sp, sp, #0x50
    9ea8:      	ret
    9eac:      	asr	x21, x1, #32
    9eb0:      	orr	w4, w3, wzr
    9eb4:      	add	x16, sp, #0x10
    9eb8:      	str	x3, [x16]
    9ebc:      	ubfx	x4, x4, #0, #32
    9ec0:      	add	x16, sp, #0x10
    9ec4:      	str	x1, [x16, #0x8]
    9ec8:      	ubfx	x1, x4, #8, #8
    9ecc:      	mov	x22, x8
    9ed0:      	mov	x23, x0
    9ed4:      	mov	w0, w1
    9ed8:      	mov	w1, w2
    9edc:      	bl	0x9edc <_stogir.locals.shape+0x1f0>
		0000000000009edc:  ARM64_RELOC_BRANCH26	_stogir.types.size
    9ee0:      	sxtw	x0, w0
    9ee4:      	cmp	x21, #0x0
    9ee8:      	b.ne	0x9ef0 <_stogir.locals.shape+0x204>
    9eec:      	mov	x21, x0
    9ef0:      	add	x16, sp, #0x10
    9ef4:      	ldr	w1, [x16, #0x8]
    9ef8:      	sxtw	x1, w1
    9efc:      	cmp	x1, #0x0
    9f00:      	cset	w2, eq
    9f04:      	ubfx	x2, x2, #0, #8
    9f08:      	cmp	x1, #0x0
    9f0c:      	b.le	0x9fb0 <_stogir.locals.shape+0x2c4>
    9f10:      	add	x3, x23, #0x110
    9f14:      	add	x4, x3, #0x28
    9f18:      	ldr	x4, [x4, #0x8]
    9f1c:      	cmp	x1, x4
    9f20:      	b.gt	0x9f78 <_stogir.locals.shape+0x28c>
    9f24:      	sub	x1, x1, #0x1
    9f28:      	mov	x17, #0x18              ; =24
    9f2c:      	mul	x1, x1, x17
    9f30:      	ldr	x4, [x3, #0x28]
    9f34:      	add	x1, x1, x4
    9f38:      	ldr	x4, [x1]
    9f3c:      	ldr	x1, [x1, #0x8]
    9f40:      	ldr	x3, [x3, #0x8]
    9f44:      	cmp	x4, #0x0
    9f48:      	b.lt	0xa07c <_stogir.locals.shape+0x390>
    9f4c:      	cmp	x4, x3
    9f50:      	b.gt	0xa07c <_stogir.locals.shape+0x390>
    9f54:      	cmp	x1, #0x0
    9f58:      	b.lt	0xa07c <_stogir.locals.shape+0x390>
    9f5c:      	sub	x3, x3, x4
    9f60:      	cmp	x1, x3
    9f64:      	b.gt	0xa07c <_stogir.locals.shape+0x390>
    9f68:      	mov	w1, #0x1                ; =1
    9f6c:      	b	0xa080 <_stogir.locals.shape+0x394>
    9f70:      	movz	x3, #0x0, lsl #48
    9f74:      	b	0x9de0 <_stogir.locals.shape+0xf4>
    9f78:      	movz	w1, #0x0, lsl #16
    9f7c:      	ubfx	x1, x1, #0, #32
    9f80:      	lsr	x16, x1, #0
    9f84:      	cmp	x16, #0x1
    9f88:      	b.eq	0x9fa4 <_stogir.locals.shape+0x2b8>
    9f8c:      	b.lo	0x9f94 <_stogir.locals.shape+0x2a8>
    9f90:      	b	0x9fa8 <_stogir.locals.shape+0x2bc>
    9f94:      	cmp	x16, #0x0
    9f98:      	b.eq	0x9fa0 <_stogir.locals.shape+0x2b4>
    9f9c:      	b	0x9fa8 <_stogir.locals.shape+0x2bc>
    9fa0:      	b	0x9fb0 <_stogir.locals.shape+0x2c4>
    9fa4:      	b	0x9fac <_stogir.locals.shape+0x2c0>
    9fa8:      	b	0xa08c <_stogir.locals.shape+0x3a0>
    9fac:      	mov	x2, #0x1                ; =1
    9fb0:      	cmp	x19, #0x0
    9fb4:      	b.le	0x9dc4 <_stogir.locals.shape+0xd8>
    9fb8:      	add	x16, sp, #0x10
    9fbc:      	ldr	w1, [x16]
    9fc0:      	uxtb	w1, w1
    9fc4:      	cmp	x1, #0x48
    9fc8:      	b.ne	0x9dc4 <_stogir.locals.shape+0xd8>
    9fcc:      	ldr	x1, [x23, #0x78]
    9fd0:      	add	x1, x20, x1
    9fd4:      	ldr	w1, [x1]
    9fd8:      	sxtw	x1, w1
    9fdc:      	cmp	x1, #0x3
    9fe0:      	b.ne	0x9dc4 <_stogir.locals.shape+0xd8>
    9fe4:      	cmp	x0, #0x0
    9fe8:      	b.le	0x9dc4 <_stogir.locals.shape+0xd8>
    9fec:      	cmp	x2, #0x0
    9ff0:      	b.eq	0x9dc4 <_stogir.locals.shape+0xd8>
    9ff4:      	cmp	x21, #0x0
    9ff8:      	b.le	0x9dc4 <_stogir.locals.shape+0xd8>
    9ffc:      	sub	x1, x21, #0x1
    a000:      	and	x1, x1, x21
    a004:      	cmp	x1, #0x0
    a008:      	b.ne	0x9dc4 <_stogir.locals.shape+0xd8>
    a00c:      	add	x16, sp, #0x10
    a010:      	ldr	w1, [x16, #0x4]
    a014:      	sxtw	x1, w1
    a018:      	cmp	x1, #0x0
    a01c:      	cset	w2, gt
    a020:      	movz	x16, #0x0, lsl #48
    a024:      	sub	x3, x16, x1
    a028:      	sub	x4, x3, #0x1
    a02c:      	uxtb	w16, w2
    a030:      	cmp	w16, wzr
    a034:      	b.eq	0xa0ac <_stogir.locals.shape+0x3c0>
    a038:      	ldr	x3, [x23, #0x8]
    a03c:      	cmp	x1, x3
    a040:      	b.ge	0xa0f4 <_stogir.locals.shape+0x408>
    a044:      	add	x3, x23, #0x78
    a048:      	ldr	x3, [x3, #0x8]
    a04c:      	cmp	x1, x3
    a050:      	b.ge	0xa1c8 <_stogir.locals.shape+0x4dc>
    a054:      	ldr	x3, [x23, #0x78]
    a058:      	add	x3, x3, x1, lsl #2
    a05c:      	ldr	w3, [x3]
    a060:      	sxtw	x3, w3
    a064:      	cmp	x3, #0x0
    a068:      	cset	w3, ge
    a06c:      	ubfx	x3, x3, #0, #8
    a070:      	b	0xa1cc <_stogir.locals.shape+0x4e0>
    a074:      	movz	x3, #0x0, lsl #48
    a078:      	b	0x9dc0 <_stogir.locals.shape+0xd4>
    a07c:      	movz	w1, #0x0, lsl #16
    a080:      	b	0x9f7c <_stogir.locals.shape+0x290>
    a084:      	brk	#0
    a088:      	b	0xa084 <_stogir.locals.shape+0x398>
    a08c:      	brk	#0
    a090:      	b	0xa08c <_stogir.locals.shape+0x3a0>
    a094:      	adrp	x16, 0xa000 <_stogir.locals.shape+0x314>
		000000000000a094:  ARM64_RELOC_PAGE21	l_stogir.459
    a098:      	ldr	x16, [x16]
		000000000000a098:  ARM64_RELOC_PAGEOFF12	l_stogir.459
    a09c:      	orr	x0, x16, xzr
    a0a0:      	mov	x1, #0x1                ; =1
    a0a4:      	mov	x21, #0x2c              ; =44
    a0a8:      	b	0x9dd8 <_stogir.locals.shape+0xec>
    a0ac:      	cmp	x1, #0x0
    a0b0:      	b.ge	0xa0fc <_stogir.locals.shape+0x410>
    a0b4:      	add	x5, x23, #0x28
    a0b8:      	add	x6, x23, #0x50
    a0bc:      	ldr	x5, [x5, #0x8]
    a0c0:      	ldr	x6, [x6, #0x8]
    a0c4:      	cmp	x5, x6
    a0c8:      	b.ne	0xa1c0 <_stogir.locals.shape+0x4d4>
    a0cc:      	cmp	x3, x5
    a0d0:      	b.gt	0xa1d0 <_stogir.locals.shape+0x4e4>
    a0d4:      	ldr	x3, [x23, #0x50]
    a0d8:      	add	x3, x3, x4, lsl #2
    a0dc:      	ldr	w3, [x3]
    a0e0:      	sxtw	x3, w3
    a0e4:      	cmp	x3, #0x0
    a0e8:      	cset	w3, gt
    a0ec:      	ubfx	x3, x3, #0, #8
    a0f0:      	b	0xa1d4 <_stogir.locals.shape+0x4e8>
    a0f4:      	movz	x3, #0x0, lsl #48
    a0f8:      	b	0xa100 <_stogir.locals.shape+0x414>
    a0fc:      	movz	x3, #0x0, lsl #48
    a100:      	cmp	x3, #0x0
    a104:      	b.eq	0xa138 <_stogir.locals.shape+0x44c>
    a108:      	uxtb	w16, w2
    a10c:      	cmp	w16, wzr
    a110:      	b.eq	0xa124 <_stogir.locals.shape+0x438>
    a114:      	ldr	x2, [x23]
    a118:      	add	x1, x2, x1, lsl #4
    a11c:      	ldr	x1, [x1]
    a120:      	b	0xa130 <_stogir.locals.shape+0x444>
    a124:      	ldr	x1, [x23, #0x28]
    a128:      	add	x1, x1, x4, lsl #4
    a12c:      	ldr	x1, [x1]
    a130:      	mov	w2, #0x1                ; =1
    a134:      	b	0xa140 <_stogir.locals.shape+0x454>
    a138:      	movz	w2, #0x0, lsl #16
    a13c:      	movz	x1, #0x0, lsl #48
    a140:      	ubfx	x2, x2, #0, #32
    a144:      	lsr	x16, x2, #0
    a148:      	cmp	x16, #0x1
    a14c:      	b.eq	0xa168 <_stogir.locals.shape+0x47c>
    a150:      	b.lo	0xa158 <_stogir.locals.shape+0x46c>
    a154:      	b	0xa16c <_stogir.locals.shape+0x480>
    a158:      	cmp	x16, #0x0
    a15c:      	b.eq	0xa164 <_stogir.locals.shape+0x478>
    a160:      	b	0xa16c <_stogir.locals.shape+0x480>
    a164:      	b	0xa170 <_stogir.locals.shape+0x484>
    a168:      	b	0xa188 <_stogir.locals.shape+0x49c>
    a16c:      	b	0xa210 <_stogir.locals.shape+0x524>
    a170:      	adrp	x16, 0xa000 <_stogir.locals.shape+0x314>
		000000000000a170:  ARM64_RELOC_PAGE21	l_stogir.460
    a174:      	ldr	x16, [x16]
		000000000000a174:  ARM64_RELOC_PAGEOFF12	l_stogir.460
    a178:      	orr	x0, x16, xzr
    a17c:      	mov	x1, #0x1                ; =1
    a180:      	mov	x21, #0x1d              ; =29
    a184:      	b	0xa0a8 <_stogir.locals.shape+0x3bc>
    a188:      	add	x16, sp, #0x10
    a18c:      	ldr	w2, [x16, #0x4]
    a190:      	sxtw	x2, w2
    a194:      	cmp	x2, #0x0
    a198:      	b.le	0xa094 <_stogir.locals.shape+0x3a8>
    a19c:      	uxtb	w1, w1
    a1a0:      	cmp	x1, #0x83
    a1a4:      	b.ge	0xa1d8 <_stogir.locals.shape+0x4ec>
    a1a8:      	adrp	x16, 0xa000 <_stogir.locals.shape+0x314>
		000000000000a1a8:  ARM64_RELOC_PAGE21	l_stogir.461
    a1ac:      	ldr	x16, [x16]
		000000000000a1ac:  ARM64_RELOC_PAGEOFF12	l_stogir.461
    a1b0:      	orr	x2, x16, xzr
    a1b4:      	add	x1, x1, x2
    a1b8:      	ldrb	w1, [x1]
    a1bc:      	b	0xa1dc <_stogir.locals.shape+0x4f0>
    a1c0:      	movz	x3, #0x0, lsl #48
    a1c4:      	b	0xa100 <_stogir.locals.shape+0x414>
    a1c8:      	movz	x3, #0x0, lsl #48
    a1cc:      	b	0xa0f8 <_stogir.locals.shape+0x40c>
    a1d0:      	movz	x3, #0x0, lsl #48
    a1d4:      	b	0xa1c4 <_stogir.locals.shape+0x4d8>
    a1d8:      	movz	w1, #0x0, lsl #16
    a1dc:      	uxtb	w16, w1
    a1e0:      	and	w1, w16, #0x2
    a1e4:      	uxtb	w1, w1
    a1e8:      	ubfx	x1, x1, #0, #8
    a1ec:      	cmp	x1, #0x0
    a1f0:      	cset	w1, eq
    a1f4:      	uxtb	w16, w1
    a1f8:      	cmp	w16, wzr
    a1fc:      	cset	x1, eq
    a200:      	cmp	x1, #0x0
    a204:      	b.eq	0xa094 <_stogir.locals.shape+0x3a8>
    a208:      	movz	x1, #0x0, lsl #48
    a20c:      	b	0xa0a8 <_stogir.locals.shape+0x3bc>
    a210:      	brk	#0
    a214:      	b	0xa210 <_stogir.locals.shape+0x524>

000000000000a218 <_stogir.conversion.policy>:
    a218:      	sub	sp, sp, #0x70
    a21c:      	str	x29, [sp]
    a220:      	str	x30, [sp, #0x8]
    a224:      	mov	x29, sp
    a228:      	str	x19, [sp, #0x18]
    a22c:      	str	x20, [sp, #0x20]
    a230:      	str	x21, [sp, #0x28]
    a234:      	str	x22, [sp, #0x30]
    a238:      	str	x23, [sp, #0x38]
    a23c:      	str	x24, [sp, #0x40]
    a240:      	str	x25, [sp, #0x48]
    a244:      	str	x26, [sp, #0x50]
    a248:      	str	x27, [sp, #0x58]
    a24c:      	str	x28, [sp, #0x60]
    a250:      	sxtw	x19, w0
    a254:      	sxtw	x20, w1
    a258:      	sxtw	x21, w2
    a25c:      	cmp	x19, #0x24
    a260:      	b.ne	0xa29c <_stogir.conversion.policy+0x84>
    a264:      	cmp	x20, #0xf
    a268:      	b.le	0xa488 <_stogir.conversion.policy+0x270>
    a26c:      	cmp	x20, #0x80
    a270:      	b.ge	0xa488 <_stogir.conversion.policy+0x270>
    a274:      	and	w0, w1, #0xf
    a278:      	ubfx	x0, x0, #0, #32
    a27c:      	cmp	x0, #0x1
    a280:      	b.lt	0xa488 <_stogir.conversion.policy+0x270>
    a284:      	cmp	x0, #0xd
    a288:      	b.gt	0xa488 <_stogir.conversion.policy+0x270>
    a28c:      	mov	x22, #0x1               ; =1
    a290:      	b	0xa298 <_stogir.conversion.policy+0x80>
    a294:      	movz	x22, #0x0, lsl #48
    a298:      	b	0xa2a0 <_stogir.conversion.policy+0x88>
    a29c:      	movz	x22, #0x0, lsl #48
    a2a0:      	sxtw	x0, w3
    a2a4:      	cmp	x20, #0xd
    a2a8:      	cset	w23, eq
    a2ac:      	cmp	x20, #0xc
    a2b0:      	cset	w24, eq
    a2b4:      	cmp	x0, #0x4
    a2b8:      	cset	w25, eq
    a2bc:      	cmp	x0, #0x8
    a2c0:      	cset	w26, eq
    a2c4:      	cmp	x22, #0x0
    a2c8:      	b.eq	0xa74c <_stogir.conversion.policy+0x534>
    a2cc:      	orr	w0, w3, wzr
    a2d0:      	str	x8, [sp, #0x10]
    a2d4:      	mov	w28, w2
    a2d8:      	mov	w27, w3
    a2dc:      	fmov	s31, w0
    a2e0:      	mov	w0, w1
    a2e4:      	fmov	w1, s31
    a2e8:      	bl	0xa2e8 <_stogir.conversion.policy+0xd0>
		000000000000a2e8:  ARM64_RELOC_BRANCH26	_stogir.types.size
    a2ec:      	b	0xa2f4 <_stogir.conversion.policy+0xdc>
    a2f0:      	mov	w0, #0x1                ; =1
    a2f4:      	cmp	x21, #0xd
    a2f8:      	cset	w1, eq
    a2fc:      	cmp	x21, #0xc
    a300:      	cset	w2, eq
    a304:      	cmp	x22, #0x0
    a308:      	b.eq	0xa75c <_stogir.conversion.policy+0x544>
    a30c:      	mov	w22, w0
    a310:      	mov	w0, w28
    a314:      	mov	w28, w1
    a318:      	mov	w1, w27
    a31c:      	mov	w25, w2
    a320:      	bl	0xa320 <_stogir.conversion.policy+0x108>
		000000000000a320:  ARM64_RELOC_BRANCH26	_stogir.types.size
    a324:      	orr	w27, w0, wzr
    a328:      	mov	w0, w25
    a32c:      	b	0xa334 <_stogir.conversion.policy+0x11c>
    a330:      	mov	w27, #0x1               ; =1
    a334:      	cmp	x19, #0x21
    a338:      	b.lt	0xa40c <_stogir.conversion.policy+0x1f4>
    a33c:      	cmp	x19, #0x27
    a340:      	b.gt	0xa40c <_stogir.conversion.policy+0x1f4>
    a344:      	lsl	w1, w22, #3
    a348:      	sxtw	x1, w1
    a34c:      	cmp	x1, #0x0
    a350:      	b.le	0xa40c <_stogir.conversion.policy+0x1f4>
    a354:      	lsl	w2, w27, #3
    a358:      	sxtw	x2, w2
    a35c:      	cmp	x2, #0x0
    a360:      	b.le	0xa40c <_stogir.conversion.policy+0x1f4>
    a364:      	cmp	x19, #0x26
    a368:      	cset	w3, eq
    a36c:      	cmp	x20, #0x1
    a370:      	cset	w4, ge
    a374:      	cmp	x20, #0xb
    a378:      	cset	w5, le
    a37c:      	cmp	x21, #0x1
    a380:      	cset	w6, ge
    a384:      	cmp	x21, #0xb
    a388:      	cset	w7, le
    a38c:      	cmp	x19, #0x25
    a390:      	b.lt	0xa608 <_stogir.conversion.policy+0x3f0>
    a394:      	ubfx	x8, x28, #0, #8
    a398:      	cmp	x19, #0x25
    a39c:      	b.ne	0xa678 <_stogir.conversion.policy+0x460>
    a3a0:      	uxtb	w16, w4
    a3a4:      	cmp	w16, wzr
    a3a8:      	b.eq	0xa670 <_stogir.conversion.policy+0x458>
    a3ac:      	uxtb	w16, w5
    a3b0:      	cmp	w16, wzr
    a3b4:      	b.eq	0xa670 <_stogir.conversion.policy+0x458>
    a3b8:      	uxtb	w16, w0
    a3bc:      	cmp	w16, wzr
    a3c0:      	b.eq	0xa3c8 <_stogir.conversion.policy+0x1b0>
    a3c4:      	mov	x8, #0x1                ; =1
    a3c8:      	b	0xa674 <_stogir.conversion.policy+0x45c>
    a3cc:      	uxtb	w16, w25
    a3d0:      	cmp	w16, wzr
    a3d4:      	b.ne	0xa468 <_stogir.conversion.policy+0x250>
    a3d8:      	uxtb	w16, w26
    a3dc:      	cmp	w16, wzr
    a3e0:      	b.ne	0xa468 <_stogir.conversion.policy+0x250>
    a3e4:      	movn	w27, #0x0, lsl #16
    a3e8:      	b	0xa334 <_stogir.conversion.policy+0x11c>
    a3ec:      	uxtb	w16, w25
    a3f0:      	cmp	w16, wzr
    a3f4:      	b.ne	0xa478 <_stogir.conversion.policy+0x260>
    a3f8:      	uxtb	w16, w26
    a3fc:      	cmp	w16, wzr
    a400:      	b.ne	0xa478 <_stogir.conversion.policy+0x260>
    a404:      	movn	w0, #0x0, lsl #16
    a408:      	b	0xa2f4 <_stogir.conversion.policy+0xdc>
    a40c:      	adrp	x16, 0xa000 <_stogir.locals.shape+0x314>
		000000000000a40c:  ARM64_RELOC_PAGE21	l_stogir.462
    a410:      	ldr	x16, [x16]
		000000000000a410:  ARM64_RELOC_PAGEOFF12	l_stogir.462
    a414:      	orr	x0, x16, xzr
    a418:      	mov	x1, #0x1                ; =1
    a41c:      	mov	x2, #0x22               ; =34
    a420:      	ldr	x3, [sp, #0x10]
    a424:      	str	x1, [x3]
    a428:      	str	x0, [x3, #0x8]
    a42c:      	str	x2, [x3, #0x10]
    a430:      	ldr	x19, [sp, #0x18]
    a434:      	ldr	x20, [sp, #0x20]
    a438:      	ldr	x21, [sp, #0x28]
    a43c:      	ldr	x22, [sp, #0x30]
    a440:      	ldr	x23, [sp, #0x38]
    a444:      	ldr	x24, [sp, #0x40]
    a448:      	ldr	x25, [sp, #0x48]
    a44c:      	ldr	x26, [sp, #0x50]
    a450:      	ldr	x27, [sp, #0x58]
    a454:      	ldr	x28, [sp, #0x60]
    a458:      	ldr	x29, [sp]
    a45c:      	ldr	x30, [sp, #0x8]
    a460:      	add	sp, sp, #0x70
    a464:      	ret
    a468:      	cmp	x21, #0x0
    a46c:      	b.ne	0xa4c0 <_stogir.conversion.policy+0x2a8>
    a470:      	movz	w27, #0x0, lsl #16
    a474:      	b	0xa334 <_stogir.conversion.policy+0x11c>
    a478:      	cmp	x20, #0x0
    a47c:      	b.ne	0xa538 <_stogir.conversion.policy+0x320>
    a480:      	movz	w0, #0x0, lsl #16
    a484:      	b	0xa2f4 <_stogir.conversion.policy+0xdc>
    a488:      	cmp	x21, #0xf
    a48c:      	b.le	0xa294 <_stogir.conversion.policy+0x7c>
    a490:      	cmp	x21, #0x80
    a494:      	b.ge	0xa4b8 <_stogir.conversion.policy+0x2a0>
    a498:      	and	w0, w2, #0xf
    a49c:      	ubfx	x0, x0, #0, #32
    a4a0:      	cmp	x0, #0x1
    a4a4:      	b.lt	0xa5b0 <_stogir.conversion.policy+0x398>
    a4a8:      	cmp	x0, #0xd
    a4ac:      	cset	w0, le
    a4b0:      	ubfx	x22, x0, #0, #8
    a4b4:      	b	0xa5b4 <_stogir.conversion.policy+0x39c>
    a4b8:      	movz	x22, #0x0, lsl #48
    a4bc:      	b	0xa298 <_stogir.conversion.policy+0x80>
    a4c0:      	cmp	x21, #0x1
    a4c4:      	b.eq	0xa330 <_stogir.conversion.policy+0x118>
    a4c8:      	cmp	x21, #0x2
    a4cc:      	b.eq	0xa330 <_stogir.conversion.policy+0x118>
    a4d0:      	cmp	x21, #0x7
    a4d4:      	b.eq	0xa330 <_stogir.conversion.policy+0x118>
    a4d8:      	cmp	x21, #0x8
    a4dc:      	b.eq	0xa330 <_stogir.conversion.policy+0x118>
    a4e0:      	cmp	x21, #0x3
    a4e4:      	b.eq	0xa6a4 <_stogir.conversion.policy+0x48c>
    a4e8:      	cmp	x21, #0x9
    a4ec:      	b.eq	0xa6a4 <_stogir.conversion.policy+0x48c>
    a4f0:      	cmp	x21, #0x4
    a4f4:      	b.eq	0xa714 <_stogir.conversion.policy+0x4fc>
    a4f8:      	cmp	x21, #0xa
    a4fc:      	b.eq	0xa714 <_stogir.conversion.policy+0x4fc>
    a500:      	uxtb	w16, w28
    a504:      	cmp	w16, wzr
    a508:      	b.ne	0xa714 <_stogir.conversion.policy+0x4fc>
    a50c:      	cmp	x21, #0x5
    a510:      	b.eq	0xa734 <_stogir.conversion.policy+0x51c>
    a514:      	cmp	x21, #0xb
    a518:      	b.eq	0xa734 <_stogir.conversion.policy+0x51c>
    a51c:      	uxtb	w16, w0
    a520:      	cmp	w16, wzr
    a524:      	b.ne	0xa734 <_stogir.conversion.policy+0x51c>
    a528:      	cmp	x21, #0x6
    a52c:      	b.eq	0xa534 <_stogir.conversion.policy+0x31c>
    a530:      	movn	w27, #0x0, lsl #16
    a534:      	b	0xa738 <_stogir.conversion.policy+0x520>
    a538:      	cmp	x20, #0x1
    a53c:      	b.eq	0xa2f0 <_stogir.conversion.policy+0xd8>
    a540:      	cmp	x20, #0x2
    a544:      	b.eq	0xa2f0 <_stogir.conversion.policy+0xd8>
    a548:      	cmp	x20, #0x7
    a54c:      	b.eq	0xa2f0 <_stogir.conversion.policy+0xd8>
    a550:      	cmp	x20, #0x8
    a554:      	b.eq	0xa2f0 <_stogir.conversion.policy+0xd8>
    a558:      	cmp	x20, #0x3
    a55c:      	b.eq	0xa6ac <_stogir.conversion.policy+0x494>
    a560:      	cmp	x20, #0x9
    a564:      	b.eq	0xa6ac <_stogir.conversion.policy+0x494>
    a568:      	cmp	x20, #0x4
    a56c:      	b.eq	0xa71c <_stogir.conversion.policy+0x504>
    a570:      	cmp	x20, #0xa
    a574:      	b.eq	0xa71c <_stogir.conversion.policy+0x504>
    a578:      	uxtb	w16, w23
    a57c:      	cmp	w16, wzr
    a580:      	b.ne	0xa71c <_stogir.conversion.policy+0x504>
    a584:      	cmp	x20, #0x5
    a588:      	b.eq	0xa73c <_stogir.conversion.policy+0x524>
    a58c:      	cmp	x20, #0xb
    a590:      	b.eq	0xa73c <_stogir.conversion.policy+0x524>
    a594:      	uxtb	w16, w24
    a598:      	cmp	w16, wzr
    a59c:      	b.ne	0xa73c <_stogir.conversion.policy+0x524>
    a5a0:      	cmp	x20, #0x6
    a5a4:      	b.ne	0xa744 <_stogir.conversion.policy+0x52c>
    a5a8:      	mov	w0, w27
    a5ac:      	b	0xa748 <_stogir.conversion.policy+0x530>
    a5b0:      	movz	x22, #0x0, lsl #48
    a5b4:      	b	0xa4bc <_stogir.conversion.policy+0x2a4>
    a5b8:      	mov	x0, #0x1                ; =1
    a5bc:      	cmp	x0, #0x0
    a5c0:      	b.ne	0xa40c <_stogir.conversion.policy+0x1f4>
    a5c4:      	cmp	x19, #0x23
    a5c8:      	b.eq	0xa5d8 <_stogir.conversion.policy+0x3c0>
    a5cc:      	uxtb	w16, w3
    a5d0:      	cmp	w16, wzr
    a5d4:      	b.eq	0xa5dc <_stogir.conversion.policy+0x3c4>
    a5d8:      	mov	x1, x2
    a5dc:      	and	x0, x1, #0xffffffff
    a5e0:      	movz	x1, #0x0, lsl #48
    a5e4:      	movz	x2, #0x0, lsl #48
    a5e8:      	b	0xa420 <_stogir.conversion.policy+0x208>
    a5ec:      	movz	x8, #0x0, lsl #48
    a5f0:      	cmp	x8, #0x0
    a5f4:      	cset	w0, ne
    a5f8:      	uxtb	w16, w0
    a5fc:      	cmp	w16, wzr
    a600:      	cset	x0, eq
    a604:      	b	0xa5bc <_stogir.conversion.policy+0x3a4>
    a608:      	cmp	x19, #0x24
    a60c:      	b.ne	0xa628 <_stogir.conversion.policy+0x410>
    a610:      	cmp	x1, x2
    a614:      	cset	w0, eq
    a618:      	uxtb	w16, w0
    a61c:      	cmp	w16, wzr
    a620:      	cset	x0, eq
    a624:      	b	0xa5bc <_stogir.conversion.policy+0x3a4>
    a628:      	uxtb	w16, w4
    a62c:      	cmp	w16, wzr
    a630:      	b.eq	0xa5b8 <_stogir.conversion.policy+0x3a0>
    a634:      	uxtb	w16, w5
    a638:      	cmp	w16, wzr
    a63c:      	b.eq	0xa5b8 <_stogir.conversion.policy+0x3a0>
    a640:      	uxtb	w16, w6
    a644:      	cmp	w16, wzr
    a648:      	b.eq	0xa6e4 <_stogir.conversion.policy+0x4cc>
    a64c:      	uxtb	w16, w7
    a650:      	cmp	w16, wzr
    a654:      	b.eq	0xa6e4 <_stogir.conversion.policy+0x4cc>
    a658:      	cmp	x19, #0x23
    a65c:      	b.ne	0xa724 <_stogir.conversion.policy+0x50c>
    a660:      	cmp	x2, x1
    a664:      	cset	w0, ge
    a668:      	ubfx	x0, x0, #0, #8
    a66c:      	b	0xa730 <_stogir.conversion.policy+0x518>
    a670:      	movz	x8, #0x0, lsl #48
    a674:      	b	0xa5f0 <_stogir.conversion.policy+0x3d8>
    a678:      	uxtb	w16, w3
    a67c:      	cmp	w16, wzr
    a680:      	b.eq	0xa6bc <_stogir.conversion.policy+0x4a4>
    a684:      	uxtb	w16, w24
    a688:      	cmp	w16, wzr
    a68c:      	b.ne	0xa700 <_stogir.conversion.policy+0x4e8>
    a690:      	uxtb	w16, w23
    a694:      	cmp	w16, wzr
    a698:      	b.ne	0xa700 <_stogir.conversion.policy+0x4e8>
    a69c:      	movz	x8, #0x0, lsl #48
    a6a0:      	b	0xa6b8 <_stogir.conversion.policy+0x4a0>
    a6a4:      	mov	w27, #0x2               ; =2
    a6a8:      	b	0xa334 <_stogir.conversion.policy+0x11c>
    a6ac:      	mov	w0, #0x2                ; =2
    a6b0:      	b	0xa2f4 <_stogir.conversion.policy+0xdc>
    a6b4:      	movz	x8, #0x0, lsl #48
    a6b8:      	b	0xa5f0 <_stogir.conversion.policy+0x3d8>
    a6bc:      	cmp	x19, #0x27
    a6c0:      	b.ne	0xa5ec <_stogir.conversion.policy+0x3d4>
    a6c4:      	uxtb	w16, w24
    a6c8:      	cmp	w16, wzr
    a6cc:      	b.ne	0xa6ec <_stogir.conversion.policy+0x4d4>
    a6d0:      	uxtb	w16, w23
    a6d4:      	cmp	w16, wzr
    a6d8:      	b.ne	0xa6ec <_stogir.conversion.policy+0x4d4>
    a6dc:      	movz	x8, #0x0, lsl #48
    a6e0:      	b	0xa6fc <_stogir.conversion.policy+0x4e4>
    a6e4:      	mov	x0, #0x1                ; =1
    a6e8:      	b	0xa5bc <_stogir.conversion.policy+0x3a4>
    a6ec:      	uxtb	w16, w0
    a6f0:      	cmp	w16, wzr
    a6f4:      	b.eq	0xa6fc <_stogir.conversion.policy+0x4e4>
    a6f8:      	mov	x8, #0x1                ; =1
    a6fc:      	b	0xa5f0 <_stogir.conversion.policy+0x3d8>
    a700:      	uxtb	w16, w6
    a704:      	cmp	w16, wzr
    a708:      	b.eq	0xa6b4 <_stogir.conversion.policy+0x49c>
    a70c:      	ubfx	x8, x7, #0, #8
    a710:      	b	0xa6b8 <_stogir.conversion.policy+0x4a0>
    a714:      	mov	w27, #0x4               ; =4
    a718:      	b	0xa6a8 <_stogir.conversion.policy+0x490>
    a71c:      	mov	w0, #0x4                ; =4
    a720:      	b	0xa6b0 <_stogir.conversion.policy+0x498>
    a724:      	cmp	x2, x1
    a728:      	cset	w0, le
    a72c:      	ubfx	x0, x0, #0, #8
    a730:      	b	0xa6e8 <_stogir.conversion.policy+0x4d0>
    a734:      	mov	w27, #0x8               ; =8
    a738:      	b	0xa718 <_stogir.conversion.policy+0x500>
    a73c:      	mov	w0, #0x8                ; =8
    a740:      	b	0xa720 <_stogir.conversion.policy+0x508>
    a744:      	movn	w0, #0x0, lsl #16
    a748:      	b	0xa740 <_stogir.conversion.policy+0x528>
    a74c:      	str	x8, [sp, #0x10]
    a750:      	mov	w28, w2
    a754:      	mov	w27, w3
    a758:      	b	0xa3ec <_stogir.conversion.policy+0x1d4>
    a75c:      	mov	w22, w0
    a760:      	mov	w28, w1
    a764:      	mov	w0, w2
    a768:      	b	0xa3cc <_stogir.conversion.policy+0x1b4>

000000000000a76c <_stogir.conditional.operands>:
    a76c:      	sub	sp, sp, #0x30
    a770:      	str	x19, [sp, #0x20]
    a774:      	str	x20, [sp, #0x28]
    a778:      	sxtw	x5, w1
    a77c:      	cmp	x5, #0x0
    a780:      	b.eq	0xa7d0 <_stogir.conditional.operands+0x64>
    a784:      	cmp	x5, #0x0
    a788:      	b.lt	0xa7a8 <_stogir.conditional.operands+0x3c>
    a78c:      	cmp	x5, #0xd
    a790:      	b.gt	0xa7a8 <_stogir.conditional.operands+0x3c>
    a794:      	adrp	x16, 0xa000 <_stogir.locals.shape+0x314>
		000000000000a794:  ARM64_RELOC_PAGE21	l_stogir.463
    a798:      	ldr	x16, [x16]
		000000000000a798:  ARM64_RELOC_PAGEOFF12	l_stogir.463
    a79c:      	orr	x1, x16, xzr
    a7a0:      	movz	x6, #0x0, lsl #48
    a7a4:      	b	0xa7e0 <_stogir.conditional.operands+0x74>
    a7a8:      	cmp	x5, #0xf
    a7ac:      	b.le	0xa7d0 <_stogir.conditional.operands+0x64>
    a7b0:      	cmp	x5, #0x80
    a7b4:      	b.ge	0xa7d0 <_stogir.conditional.operands+0x64>
    a7b8:      	and	w1, w1, #0xf
    a7bc:      	ubfx	x1, x1, #0, #32
    a7c0:      	cmp	x1, #0x1
    a7c4:      	b.lt	0xa7d0 <_stogir.conditional.operands+0x64>
    a7c8:      	cmp	x1, #0xd
    a7cc:      	b.le	0xa794 <_stogir.conditional.operands+0x28>
    a7d0:      	adrp	x16, 0xa000 <_stogir.locals.shape+0x314>
		000000000000a7d0:  ARM64_RELOC_PAGE21	l_stogir.464
    a7d4:      	ldr	x16, [x16]
		000000000000a7d4:  ARM64_RELOC_PAGEOFF12	l_stogir.464
    a7d8:      	orr	x1, x16, xzr
    a7dc:      	mov	x6, #0x2b               ; =43
    a7e0:      	sxtw	x2, w2
    a7e4:      	cmp	x2, #0x0
    a7e8:      	cset	w7, gt
    a7ec:      	movz	x16, #0x0, lsl #48
    a7f0:      	sub	x9, x16, x2
    a7f4:      	sub	x10, x9, #0x1
    a7f8:      	uxtb	w16, w7
    a7fc:      	cmp	w16, wzr
    a800:      	b.eq	0xa840 <_stogir.conditional.operands+0xd4>
    a804:      	ldr	x9, [x0, #0x8]
    a808:      	cmp	x2, x9
    a80c:      	b.ge	0xa898 <_stogir.conditional.operands+0x12c>
    a810:      	add	x9, x0, #0x78
    a814:      	ldr	x9, [x9, #0x8]
    a818:      	cmp	x2, x9
    a81c:      	b.ge	0xabb8 <_stogir.conditional.operands+0x44c>
    a820:      	ldr	x9, [x0, #0x78]
    a824:      	add	x9, x9, x2, lsl #2
    a828:      	ldr	w9, [x9]
    a82c:      	sxtw	x9, w9
    a830:      	cmp	x9, #0x0
    a834:      	cset	w9, ge
    a838:      	ubfx	x9, x9, #0, #8
    a83c:      	b	0xabbc <_stogir.conditional.operands+0x450>
    a840:      	cmp	x2, #0x0
    a844:      	b.ge	0xa8a0 <_stogir.conditional.operands+0x134>
    a848:      	add	x11, x0, #0x28
    a84c:      	add	x12, x0, #0x50
    a850:      	ldr	x11, [x11, #0x8]
    a854:      	ldr	x12, [x12, #0x8]
    a858:      	cmp	x11, x12
    a85c:      	b.ne	0xa888 <_stogir.conditional.operands+0x11c>
    a860:      	cmp	x9, x11
    a864:      	b.gt	0xabc0 <_stogir.conditional.operands+0x454>
    a868:      	ldr	x9, [x0, #0x50]
    a86c:      	add	x9, x9, x10, lsl #2
    a870:      	ldr	w9, [x9]
    a874:      	sxtw	x9, w9
    a878:      	cmp	x9, #0x0
    a87c:      	cset	w9, gt
    a880:      	ubfx	x9, x9, #0, #8
    a884:      	b	0xabc4 <_stogir.conditional.operands+0x458>
    a888:      	movz	x9, #0x0, lsl #48
    a88c:      	b	0xa8a4 <_stogir.conditional.operands+0x138>
    a890:      	movz	x14, #0x0, lsl #48
    a894:      	b	0xa934 <_stogir.conditional.operands+0x1c8>
    a898:      	movz	x9, #0x0, lsl #48
    a89c:      	b	0xa8a4 <_stogir.conditional.operands+0x138>
    a8a0:      	movz	x9, #0x0, lsl #48
    a8a4:      	cmp	x9, #0x0
    a8a8:      	b.eq	0xa8dc <_stogir.conditional.operands+0x170>
    a8ac:      	uxtb	w16, w7
    a8b0:      	cmp	w16, wzr
    a8b4:      	b.eq	0xa8c8 <_stogir.conditional.operands+0x15c>
    a8b8:      	ldr	x7, [x0]
    a8bc:      	add	x2, x7, x2, lsl #4
    a8c0:      	ldr	x2, [x2]
    a8c4:      	b	0xa8d4 <_stogir.conditional.operands+0x168>
    a8c8:      	ldr	x2, [x0, #0x28]
    a8cc:      	add	x2, x2, x10, lsl #4
    a8d0:      	ldr	x2, [x2]
    a8d4:      	mov	w7, #0x1                ; =1
    a8d8:      	b	0xa8e4 <_stogir.conditional.operands+0x178>
    a8dc:      	movz	w7, #0x0, lsl #16
    a8e0:      	movz	x2, #0x0, lsl #48
    a8e4:      	ubfx	x7, x7, #0, #32
    a8e8:      	lsr	x16, x7, #0
    a8ec:      	cmp	x16, #0x1
    a8f0:      	b.eq	0xa90c <_stogir.conditional.operands+0x1a0>
    a8f4:      	b.lo	0xa8fc <_stogir.conditional.operands+0x190>
    a8f8:      	b	0xa910 <_stogir.conditional.operands+0x1a4>
    a8fc:      	cmp	x16, #0x0
    a900:      	b.eq	0xa908 <_stogir.conditional.operands+0x19c>
    a904:      	b	0xa910 <_stogir.conditional.operands+0x1a4>
    a908:      	b	0xa914 <_stogir.conditional.operands+0x1a8>
    a90c:      	b	0xa938 <_stogir.conditional.operands+0x1cc>
    a910:      	b	0xabd8 <_stogir.conditional.operands+0x46c>
    a914:      	adrp	x16, 0xa000 <_stogir.locals.shape+0x314>
		000000000000a914:  ARM64_RELOC_PAGE21	l_stogir.465
    a918:      	ldr	x16, [x16]
		000000000000a918:  ARM64_RELOC_PAGEOFF12	l_stogir.465
    a91c:      	orr	x1, x16, xzr
    a920:      	mov	x6, #0x16               ; =22
    a924:      	b	0xa97c <_stogir.conditional.operands+0x210>
    a928:      	movz	x14, #0x0, lsl #48
    a92c:      	b	0xa9d4 <_stogir.conditional.operands+0x268>
    a930:      	movz	x14, #0x0, lsl #48
    a934:      	b	0xa9dc <_stogir.conditional.operands+0x270>
    a938:      	uxtb	w7, w2
    a93c:      	cmp	x7, #0x48
    a940:      	b.eq	0xa96c <_stogir.conditional.operands+0x200>
    a944:      	cmp	x7, #0x46
    a948:      	b.eq	0xa96c <_stogir.conditional.operands+0x200>
    a94c:      	ubfx	x7, x2, #0, #32
    a950:      	ubfx	x7, x7, #8, #8
    a954:      	cmp	x7, #0x0
    a958:      	b.eq	0xa96c <_stogir.conditional.operands+0x200>
    a95c:      	ubfx	x2, x2, #0, #32
    a960:      	ubfx	x2, x2, #8, #8
    a964:      	cmp	x2, #0xd
    a968:      	b.le	0xa97c <_stogir.conditional.operands+0x210>
    a96c:      	adrp	x16, 0xa000 <_stogir.locals.shape+0x314>
		000000000000a96c:  ARM64_RELOC_PAGE21	l_stogir.466
    a970:      	ldr	x16, [x16]
		000000000000a970:  ARM64_RELOC_PAGEOFF12	l_stogir.466
    a974:      	orr	x1, x16, xzr
    a978:      	mov	x6, #0x2a               ; =42
    a97c:      	add	x16, sp, #0x10
    a980:      	orr	x2, x16, xzr
    a984:      	adrp	x16, 0xa000 <_stogir.locals.shape+0x314>
		000000000000a984:  ARM64_RELOC_PAGE21	l_stogir.467
    a988:      	ldr	x16, [x16]
		000000000000a988:  ARM64_RELOC_PAGEOFF12	l_stogir.467
    a98c:      	orr	x7, x16, xzr
    a990:      	adrp	x16, 0xa000 <_stogir.locals.shape+0x314>
		000000000000a990:  ARM64_RELOC_PAGE21	l_stogir.468
    a994:      	ldr	x16, [x16]
		000000000000a994:  ARM64_RELOC_PAGEOFF12	l_stogir.468
    a998:      	orr	x9, x16, xzr
    a99c:      	add	x10, x0, #0x78
    a9a0:      	add	x11, x0, #0x28
    a9a4:      	add	x12, x0, #0x50
    a9a8:      	mov	x16, sp
    a9ac:      	str	w3, [x16]
    a9b0:      	mov	x16, sp
    a9b4:      	str	w4, [x16, #0x4]
    a9b8:      	mov	x16, sp
    a9bc:      	ldr	x3, [x16]
    a9c0:      	add	x16, sp, #0x10
    a9c4:      	str	x3, [x16]
    a9c8:      	movz	x3, #0x0, lsl #48
    a9cc:      	b	0xaa84 <_stogir.conditional.operands+0x318>
    a9d0:      	movz	x14, #0x0, lsl #48
    a9d4:      	b	0xa9dc <_stogir.conditional.operands+0x270>
    a9d8:      	movz	x14, #0x0, lsl #48
    a9dc:      	cmp	x14, #0x0
    a9e0:      	b.eq	0xaa14 <_stogir.conditional.operands+0x2a8>
    a9e4:      	uxtb	w16, w4
    a9e8:      	cmp	w16, wzr
    a9ec:      	b.eq	0xaa00 <_stogir.conditional.operands+0x294>
    a9f0:      	ldr	x4, [x0]
    a9f4:      	add	x4, x4, x13, lsl #4
    a9f8:      	ldr	x4, [x4]
    a9fc:      	b	0xaa0c <_stogir.conditional.operands+0x2a0>
    aa00:      	ldr	x4, [x0, #0x28]
    aa04:      	add	x4, x4, x15, lsl #4
    aa08:      	ldr	x4, [x4]
    aa0c:      	mov	w13, #0x1               ; =1
    aa10:      	b	0xaa1c <_stogir.conditional.operands+0x2b0>
    aa14:      	movz	w13, #0x0, lsl #16
    aa18:      	movz	x4, #0x0, lsl #48
    aa1c:      	ubfx	x13, x13, #0, #32
    aa20:      	lsr	x16, x13, #0
    aa24:      	cmp	x16, #0x1
    aa28:      	b.eq	0xaa44 <_stogir.conditional.operands+0x2d8>
    aa2c:      	b.lo	0xaa34 <_stogir.conditional.operands+0x2c8>
    aa30:      	b	0xaa48 <_stogir.conditional.operands+0x2dc>
    aa34:      	cmp	x16, #0x0
    aa38:      	b.eq	0xaa40 <_stogir.conditional.operands+0x2d4>
    aa3c:      	b	0xaa48 <_stogir.conditional.operands+0x2dc>
    aa40:      	b	0xaa4c <_stogir.conditional.operands+0x2e0>
    aa44:      	b	0xaa58 <_stogir.conditional.operands+0x2ec>
    aa48:      	b	0xabd0 <_stogir.conditional.operands+0x464>
    aa4c:      	mov	x1, x7
    aa50:      	mov	x6, #0x10               ; =16
    aa54:      	b	0xaa84 <_stogir.conditional.operands+0x318>
    aa58:      	uxtb	w13, w4
    aa5c:      	cmp	x13, #0x48
    aa60:      	b.eq	0xaa7c <_stogir.conditional.operands+0x310>
    aa64:      	cmp	x13, #0x46
    aa68:      	b.eq	0xaa7c <_stogir.conditional.operands+0x310>
    aa6c:      	ubfx	x4, x4, #0, #32
    aa70:      	ubfx	x4, x4, #8, #8
    aa74:      	cmp	x4, x5
    aa78:      	b.eq	0xaa84 <_stogir.conditional.operands+0x318>
    aa7c:      	mov	x1, x9
    aa80:      	mov	x6, #0x21               ; =33
    aa84:      	cmp	x3, #0x2
    aa88:      	b.ge	0xaaac <_stogir.conditional.operands+0x340>
    aa8c:      	add	x4, x3, #0x1
    aa90:      	add	x3, x2, x3, lsl #2
    aa94:      	ldr	w3, [x3]
    aa98:      	movn	w17, #0x0, lsl #16
    aa9c:      	and	w13, w3, w17
    aaa0:      	mov	x3, x4
    aaa4:      	mov	w4, #0x1                ; =1
    aaa8:      	b	0xaab4 <_stogir.conditional.operands+0x348>
    aaac:      	movz	w4, #0x0, lsl #16
    aab0:      	movz	w13, #0x0, lsl #16
    aab4:      	ubfx	x4, x4, #0, #32
    aab8:      	lsr	x16, x4, #0
    aabc:      	cmp	x16, #0x1
    aac0:      	b.eq	0xaadc <_stogir.conditional.operands+0x370>
    aac4:      	b.lo	0xaacc <_stogir.conditional.operands+0x360>
    aac8:      	b	0xaae0 <_stogir.conditional.operands+0x374>
    aacc:      	cmp	x16, #0x0
    aad0:      	b.eq	0xaad8 <_stogir.conditional.operands+0x36c>
    aad4:      	b	0xaae0 <_stogir.conditional.operands+0x374>
    aad8:      	b	0xab40 <_stogir.conditional.operands+0x3d4>
    aadc:      	b	0xaae4 <_stogir.conditional.operands+0x378>
    aae0:      	b	0xabc8 <_stogir.conditional.operands+0x45c>
    aae4:      	sxtw	x13, w13
    aae8:      	cmp	x13, #0x0
    aaec:      	cset	w4, gt
    aaf0:      	movz	x16, #0x0, lsl #48
    aaf4:      	sub	x14, x16, x13
    aaf8:      	sub	x15, x14, #0x1
    aafc:      	uxtb	w16, w4
    ab00:      	cmp	w16, wzr
    ab04:      	b.eq	0xab78 <_stogir.conditional.operands+0x40c>
    ab08:      	ldr	x14, [x0, #0x8]
    ab0c:      	cmp	x13, x14
    ab10:      	b.ge	0xa9d0 <_stogir.conditional.operands+0x264>
    ab14:      	ldr	x14, [x10, #0x8]
    ab18:      	cmp	x13, x14
    ab1c:      	b.ge	0xa928 <_stogir.conditional.operands+0x1bc>
    ab20:      	ldr	x14, [x0, #0x78]
    ab24:      	add	x14, x14, x13, lsl #2
    ab28:      	ldr	w14, [x14]
    ab2c:      	sxtw	x14, w14
    ab30:      	cmp	x14, #0x0
    ab34:      	cset	w14, ge
    ab38:      	ubfx	x14, x14, #0, #8
    ab3c:      	b	0xa92c <_stogir.conditional.operands+0x1c0>
    ab40:      	cmp	x6, #0x0
    ab44:      	b.ne	0xab58 <_stogir.conditional.operands+0x3ec>
    ab48:      	and	x1, x5, #0xffffffff
    ab4c:      	movz	x0, #0x0, lsl #48
    ab50:      	movz	x6, #0x0, lsl #48
    ab54:      	b	0xab5c <_stogir.conditional.operands+0x3f0>
    ab58:      	mov	x0, #0x1                ; =1
    ab5c:      	str	x0, [x8]
    ab60:      	str	x1, [x8, #0x8]
    ab64:      	str	x6, [x8, #0x10]
    ab68:      	ldr	x19, [sp, #0x20]
    ab6c:      	ldr	x20, [sp, #0x28]
    ab70:      	add	sp, sp, #0x30
    ab74:      	ret
    ab78:      	cmp	x13, #0x0
    ab7c:      	b.ge	0xa9d8 <_stogir.conditional.operands+0x26c>
    ab80:      	ldr	x19, [x11, #0x8]
    ab84:      	ldr	x20, [x12, #0x8]
    ab88:      	cmp	x19, x20
    ab8c:      	b.ne	0xa930 <_stogir.conditional.operands+0x1c4>
    ab90:      	cmp	x14, x19
    ab94:      	b.gt	0xa890 <_stogir.conditional.operands+0x124>
    ab98:      	ldr	x14, [x0, #0x50]
    ab9c:      	add	x14, x14, x15, lsl #2
    aba0:      	ldr	w14, [x14]
    aba4:      	sxtw	x14, w14
    aba8:      	cmp	x14, #0x0
    abac:      	cset	w14, gt
    abb0:      	ubfx	x14, x14, #0, #8
    abb4:      	b	0xa894 <_stogir.conditional.operands+0x128>
    abb8:      	movz	x9, #0x0, lsl #48
    abbc:      	b	0xa89c <_stogir.conditional.operands+0x130>
    abc0:      	movz	x9, #0x0, lsl #48
    abc4:      	b	0xa88c <_stogir.conditional.operands+0x120>
    abc8:      	brk	#0
    abcc:      	b	0xabc8 <_stogir.conditional.operands+0x45c>
    abd0:      	brk	#0
    abd4:      	b	0xabd0 <_stogir.conditional.operands+0x464>
    abd8:      	brk	#0
    abdc:      	b	0xabd8 <_stogir.conditional.operands+0x46c>

000000000000abe0 <_stogir.floating.operands>:
    abe0:      	sub	sp, sp, #0x90
    abe4:      	str	x29, [sp]
    abe8:      	str	x30, [sp, #0x8]
    abec:      	mov	x29, sp
    abf0:      	str	x19, [sp, #0x60]
    abf4:      	str	x20, [sp, #0x68]
    abf8:      	str	x21, [sp, #0x70]
    abfc:      	str	x22, [sp, #0x78]
    ac00:      	str	x23, [sp, #0x80]
    ac04:      	sxtw	x1, w1
    ac08:      	sxtw	x19, w2
    ac0c:      	cmp	x1, #0x1f
    ac10:      	cset	w2, eq
    ac14:      	cmp	x1, #0x20
    ac18:      	cset	w6, eq
    ac1c:      	cmp	x1, #0xe
    ac20:      	b.lt	0xac50 <_stogir.floating.operands+0x70>
    ac24:      	cmp	x1, #0x19
    ac28:      	b.gt	0xac50 <_stogir.floating.operands+0x70>
    ac2c:      	cmp	x19, #0xc
    ac30:      	b.eq	0xacf0 <_stogir.floating.operands+0x110>
    ac34:      	cmp	x19, #0xd
    ac38:      	b.eq	0xacf0 <_stogir.floating.operands+0x110>
    ac3c:      	adrp	x16, 0xa000 <_stogir.locals.shape+0x314>
		000000000000ac3c:  ARM64_RELOC_PAGE21	l_stogir.469
    ac40:      	ldr	x16, [x16]
		000000000000ac40:  ARM64_RELOC_PAGEOFF12	l_stogir.469
    ac44:      	orr	x20, x16, xzr
    ac48:      	mov	x21, #0x22              ; =34
    ac4c:      	b	0xad00 <_stogir.floating.operands+0x120>
    ac50:      	uxtb	w16, w2
    ac54:      	cmp	w16, wzr
    ac58:      	b.ne	0xac2c <_stogir.floating.operands+0x4c>
    ac5c:      	uxtb	w16, w6
    ac60:      	cmp	w16, wzr
    ac64:      	b.ne	0xac2c <_stogir.floating.operands+0x4c>
    ac68:      	cmp	x1, #0x1a
    ac6c:      	b.lt	0xac78 <_stogir.floating.operands+0x98>
    ac70:      	cmp	x1, #0x1d
    ac74:      	b.le	0xac2c <_stogir.floating.operands+0x4c>
    ac78:      	cmp	x1, #0x3a
    ac7c:      	b.eq	0xac2c <_stogir.floating.operands+0x4c>
    ac80:      	cmp	x1, #0x3b
    ac84:      	b.eq	0xac2c <_stogir.floating.operands+0x4c>
    ac88:      	b	0xac3c <_stogir.floating.operands+0x5c>
    ac8c:      	movz	w1, #0x0, lsl #16
    ac90:      	uxtb	w16, w1
    ac94:      	and	w1, w16, #0x2
    ac98:      	uxtb	w1, w1
    ac9c:      	ubfx	x1, x1, #0, #8
    aca0:      	cmp	x1, #0x0
    aca4:      	cset	w1, eq
    aca8:      	uxtb	w16, w1
    acac:      	cmp	w16, wzr
    acb0:      	cset	x1, eq
    acb4:      	cmp	x1, #0x0
    acb8:      	b.ne	0xacdc <_stogir.floating.operands+0xfc>
    acbc:      	cmp	x0, #0x65
    acc0:      	b.eq	0xacdc <_stogir.floating.operands+0xfc>
    acc4:      	cmp	x0, #0x66
    acc8:      	b.eq	0xacdc <_stogir.floating.operands+0xfc>
    accc:      	adrp	x16, 0xa000 <_stogir.locals.shape+0x314>
		000000000000accc:  ARM64_RELOC_PAGE21	l_stogir.470
    acd0:      	ldr	x16, [x16]
		000000000000acd0:  ARM64_RELOC_PAGEOFF12	l_stogir.470
    acd4:      	orr	x20, x16, xzr
    acd8:      	mov	x21, #0x2d              ; =45
    acdc:      	b	0xae08 <_stogir.floating.operands+0x228>
    ace0:      	movz	x13, #0x0, lsl #48
    ace4:      	b	0xad74 <_stogir.floating.operands+0x194>
    ace8:      	movz	x13, #0x0, lsl #48
    acec:      	b	0xad7c <_stogir.floating.operands+0x19c>
    acf0:      	adrp	x16, 0xa000 <_stogir.locals.shape+0x314>
		000000000000acf0:  ARM64_RELOC_PAGE21	l_stogir.471
    acf4:      	ldr	x16, [x16]
		000000000000acf4:  ARM64_RELOC_PAGEOFF12	l_stogir.471
    acf8:      	orr	x20, x16, xzr
    acfc:      	movz	x21, #0x0, lsl #48
    ad00:      	add	x16, sp, #0x10
    ad04:      	str	w3, [x16]
    ad08:      	uxtb	w16, w2
    ad0c:      	cmp	w16, wzr
    ad10:      	b.ne	0xad24 <_stogir.floating.operands+0x144>
    ad14:      	uxtb	w16, w6
    ad18:      	cmp	w16, wzr
    ad1c:      	b.ne	0xad24 <_stogir.floating.operands+0x144>
    ad20:      	orr	w3, w4, wzr
    ad24:      	add	x16, sp, #0x20
    ad28:      	orr	x2, x16, xzr
    ad2c:      	adrp	x16, 0xa000 <_stogir.locals.shape+0x314>
		000000000000ad2c:  ARM64_RELOC_PAGE21	l_stogir.472
    ad30:      	ldr	x16, [x16]
		000000000000ad30:  ARM64_RELOC_PAGEOFF12	l_stogir.472
    ad34:      	orr	x4, x16, xzr
    ad38:      	adrp	x16, 0xa000 <_stogir.locals.shape+0x314>
		000000000000ad38:  ARM64_RELOC_PAGE21	l_stogir.473
    ad3c:      	ldr	x16, [x16]
		000000000000ad3c:  ARM64_RELOC_PAGEOFF12	l_stogir.473
    ad40:      	orr	x6, x16, xzr
    ad44:      	add	x7, x0, #0x78
    ad48:      	add	x9, x0, #0x28
    ad4c:      	add	x10, x0, #0x50
    ad50:      	add	x16, sp, #0x10
    ad54:      	str	w3, [x16, #0x4]
    ad58:      	add	x16, sp, #0x10
    ad5c:      	ldr	x3, [x16]
    ad60:      	add	x16, sp, #0x20
    ad64:      	str	x3, [x16]
    ad68:      	movz	x3, #0x0, lsl #48
    ad6c:      	b	0xae24 <_stogir.floating.operands+0x244>
    ad70:      	movz	x13, #0x0, lsl #48
    ad74:      	b	0xad7c <_stogir.floating.operands+0x19c>
    ad78:      	movz	x13, #0x0, lsl #48
    ad7c:      	cmp	x13, #0x0
    ad80:      	b.eq	0xadb4 <_stogir.floating.operands+0x1d4>
    ad84:      	uxtb	w16, w11
    ad88:      	cmp	w16, wzr
    ad8c:      	b.eq	0xada0 <_stogir.floating.operands+0x1c0>
    ad90:      	ldr	x11, [x0]
    ad94:      	add	x11, x11, x12, lsl #4
    ad98:      	ldr	x11, [x11]
    ad9c:      	b	0xadac <_stogir.floating.operands+0x1cc>
    ada0:      	ldr	x11, [x0, #0x28]
    ada4:      	add	x11, x11, x14, lsl #4
    ada8:      	ldr	x11, [x11]
    adac:      	mov	w12, #0x1               ; =1
    adb0:      	b	0xadbc <_stogir.floating.operands+0x1dc>
    adb4:      	movz	w12, #0x0, lsl #16
    adb8:      	movz	x11, #0x0, lsl #48
    adbc:      	ubfx	x12, x12, #0, #32
    adc0:      	lsr	x16, x12, #0
    adc4:      	cmp	x16, #0x1
    adc8:      	b.eq	0xade4 <_stogir.floating.operands+0x204>
    adcc:      	b.lo	0xadd4 <_stogir.floating.operands+0x1f4>
    add0:      	b	0xade8 <_stogir.floating.operands+0x208>
    add4:      	cmp	x16, #0x0
    add8:      	b.eq	0xade0 <_stogir.floating.operands+0x200>
    addc:      	b	0xade8 <_stogir.floating.operands+0x208>
    ade0:      	b	0xadec <_stogir.floating.operands+0x20c>
    ade4:      	b	0xae0c <_stogir.floating.operands+0x22c>
    ade8:      	b	0xb020 <_stogir.floating.operands+0x440>
    adec:      	mov	x20, x4
    adf0:      	mov	x21, #0x18              ; =24
    adf4:      	b	0xae24 <_stogir.floating.operands+0x244>
    adf8:      	adrp	x16, 0xa000 <_stogir.locals.shape+0x314>
		000000000000adf8:  ARM64_RELOC_PAGE21	l_stogir.474
    adfc:      	ldr	x16, [x16]
		000000000000adfc:  ARM64_RELOC_PAGEOFF12	l_stogir.474
    ae00:      	orr	x20, x16, xzr
    ae04:      	mov	x21, #0x21              ; =33
    ae08:      	b	0xaef0 <_stogir.floating.operands+0x310>
    ae0c:      	ubfx	x11, x11, #0, #32
    ae10:      	ubfx	x11, x11, #8, #8
    ae14:      	cmp	x11, x19
    ae18:      	b.eq	0xae24 <_stogir.floating.operands+0x244>
    ae1c:      	mov	x20, x6
    ae20:      	mov	x21, #0x1e              ; =30
    ae24:      	cmp	x3, #0x2
    ae28:      	b.ge	0xae4c <_stogir.floating.operands+0x26c>
    ae2c:      	add	x11, x3, #0x1
    ae30:      	add	x3, x2, x3, lsl #2
    ae34:      	ldr	w3, [x3]
    ae38:      	movn	w17, #0x0, lsl #16
    ae3c:      	and	w12, w3, w17
    ae40:      	mov	x3, x11
    ae44:      	mov	w11, #0x1               ; =1
    ae48:      	b	0xae54 <_stogir.floating.operands+0x274>
    ae4c:      	movz	w11, #0x0, lsl #16
    ae50:      	movz	w12, #0x0, lsl #16
    ae54:      	ubfx	x11, x11, #0, #32
    ae58:      	lsr	x16, x11, #0
    ae5c:      	cmp	x16, #0x1
    ae60:      	b.eq	0xae7c <_stogir.floating.operands+0x29c>
    ae64:      	b.lo	0xae6c <_stogir.floating.operands+0x28c>
    ae68:      	b	0xae80 <_stogir.floating.operands+0x2a0>
    ae6c:      	cmp	x16, #0x0
    ae70:      	b.eq	0xae78 <_stogir.floating.operands+0x298>
    ae74:      	b	0xae80 <_stogir.floating.operands+0x2a0>
    ae78:      	b	0xaee0 <_stogir.floating.operands+0x300>
    ae7c:      	b	0xae84 <_stogir.floating.operands+0x2a4>
    ae80:      	b	0xb018 <_stogir.floating.operands+0x438>
    ae84:      	sxtw	x12, w12
    ae88:      	cmp	x12, #0x0
    ae8c:      	cset	w11, gt
    ae90:      	movz	x16, #0x0, lsl #48
    ae94:      	sub	x13, x16, x12
    ae98:      	sub	x14, x13, #0x1
    ae9c:      	uxtb	w16, w11
    aea0:      	cmp	w16, wzr
    aea4:      	b.eq	0xaf68 <_stogir.floating.operands+0x388>
    aea8:      	ldr	x13, [x0, #0x8]
    aeac:      	cmp	x12, x13
    aeb0:      	b.ge	0xad70 <_stogir.floating.operands+0x190>
    aeb4:      	ldr	x13, [x7, #0x8]
    aeb8:      	cmp	x12, x13
    aebc:      	b.ge	0xace0 <_stogir.floating.operands+0x100>
    aec0:      	ldr	x13, [x0, #0x78]
    aec4:      	add	x13, x13, x12, lsl #2
    aec8:      	ldr	w13, [x13]
    aecc:      	sxtw	x13, w13
    aed0:      	cmp	x13, #0x0
    aed4:      	cset	w13, ge
    aed8:      	ubfx	x13, x13, #0, #8
    aedc:      	b	0xace4 <_stogir.floating.operands+0x104>
    aee0:      	sxtw	x22, w5
    aee4:      	cmp	x22, #0x0
    aee8:      	b.ne	0xaf08 <_stogir.floating.operands+0x328>
    aeec:      	mov	x23, x8
    aef0:      	cmp	x21, #0x0
    aef4:      	b.ne	0xafa8 <_stogir.floating.operands+0x3c8>
    aef8:      	and	x20, x19, #0xffffffff
    aefc:      	movz	x0, #0x0, lsl #48
    af00:      	movz	x21, #0x0, lsl #48
    af04:      	b	0xafac <_stogir.floating.operands+0x3cc>
    af08:      	cmp	x1, #0x1d
    af0c:      	b.ne	0xb030 <_stogir.floating.operands+0x450>
    af10:      	mov	w1, w5
    af14:      	mov	x23, x8
    af18:      	add	x8, sp, #0x30
    af1c:      	bl	0xaf1c <_stogir.floating.operands+0x33c>
		000000000000af1c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    af20:      	add	x16, sp, #0x30
    af24:      	ldr	w0, [x16]
    af28:      	lsr	x16, x0, #0
    af2c:      	cmp	x16, #0x1
    af30:      	b.eq	0xaf4c <_stogir.floating.operands+0x36c>
    af34:      	b.lo	0xaf3c <_stogir.floating.operands+0x35c>
    af38:      	b	0xaf50 <_stogir.floating.operands+0x370>
    af3c:      	cmp	x16, #0x0
    af40:      	b.eq	0xaf48 <_stogir.floating.operands+0x368>
    af44:      	b	0xaf50 <_stogir.floating.operands+0x370>
    af48:      	b	0xaf54 <_stogir.floating.operands+0x374>
    af4c:      	b	0xafe4 <_stogir.floating.operands+0x404>
    af50:      	b	0xb028 <_stogir.floating.operands+0x448>
    af54:      	adrp	x16, 0xa000 <_stogir.locals.shape+0x314>
		000000000000af54:  ARM64_RELOC_PAGE21	l_stogir.475
    af58:      	ldr	x16, [x16]
		000000000000af58:  ARM64_RELOC_PAGEOFF12	l_stogir.475
    af5c:      	orr	x20, x16, xzr
    af60:      	mov	x21, #0x16              ; =22
    af64:      	b	0xacdc <_stogir.floating.operands+0xfc>
    af68:      	cmp	x12, #0x0
    af6c:      	b.ge	0xad78 <_stogir.floating.operands+0x198>
    af70:      	ldr	x15, [x9, #0x8]
    af74:      	ldr	x22, [x10, #0x8]
    af78:      	cmp	x15, x22
    af7c:      	b.ne	0xace8 <_stogir.floating.operands+0x108>
    af80:      	cmp	x13, x15
    af84:      	b.gt	0xafdc <_stogir.floating.operands+0x3fc>
    af88:      	ldr	x13, [x0, #0x50]
    af8c:      	add	x13, x13, x14, lsl #2
    af90:      	ldr	w13, [x13]
    af94:      	sxtw	x13, w13
    af98:      	cmp	x13, #0x0
    af9c:      	cset	w13, gt
    afa0:      	ubfx	x13, x13, #0, #8
    afa4:      	b	0xafe0 <_stogir.floating.operands+0x400>
    afa8:      	mov	x0, #0x1                ; =1
    afac:      	str	x0, [x23]
    afb0:      	str	x20, [x23, #0x8]
    afb4:      	str	x21, [x23, #0x10]
    afb8:      	ldr	x19, [sp, #0x60]
    afbc:      	ldr	x20, [sp, #0x68]
    afc0:      	ldr	x21, [sp, #0x70]
    afc4:      	ldr	x22, [sp, #0x78]
    afc8:      	ldr	x23, [sp, #0x80]
    afcc:      	ldr	x29, [sp]
    afd0:      	ldr	x30, [sp, #0x8]
    afd4:      	add	sp, sp, #0x90
    afd8:      	ret
    afdc:      	movz	x13, #0x0, lsl #48
    afe0:      	b	0xacec <_stogir.floating.operands+0x10c>
    afe4:      	add	x16, sp, #0x30
    afe8:      	ldr	x0, [x16, #0x8]
    afec:      	cmp	x22, #0x0
    aff0:      	b.lt	0xaccc <_stogir.floating.operands+0xec>
    aff4:      	uxtb	w0, w0
    aff8:      	cmp	x0, #0x83
    affc:      	b.ge	0xac8c <_stogir.floating.operands+0xac>
    b000:      	adrp	x16, 0xb000 <_stogir.floating.operands+0x420>
		000000000000b000:  ARM64_RELOC_PAGE21	l_stogir.476
    b004:      	ldr	x16, [x16]
		000000000000b004:  ARM64_RELOC_PAGEOFF12	l_stogir.476
    b008:      	orr	x1, x16, xzr
    b00c:      	add	x1, x0, x1
    b010:      	ldrb	w1, [x1]
    b014:      	b	0xac90 <_stogir.floating.operands+0xb0>
    b018:      	brk	#0
    b01c:      	b	0xb018 <_stogir.floating.operands+0x438>
    b020:      	brk	#0
    b024:      	b	0xb020 <_stogir.floating.operands+0x440>
    b028:      	brk	#0
    b02c:      	b	0xb028 <_stogir.floating.operands+0x448>
    b030:      	mov	x23, x8
    b034:      	b	0xadf8 <_stogir.floating.operands+0x218>

000000000000b038 <_stogir.vector-lanes.operands>:
    b038:      	sub	sp, sp, #0x110
    b03c:      	str	x29, [sp]
    b040:      	str	x30, [sp, #0x8]
    b044:      	mov	x29, sp
    b048:      	str	x19, [sp, #0xc0]
    b04c:      	str	x20, [sp, #0xc8]
    b050:      	str	x21, [sp, #0xd0]
    b054:      	str	x22, [sp, #0xd8]
    b058:      	str	x23, [sp, #0xe0]
    b05c:      	str	x24, [sp, #0xe8]
    b060:      	str	x25, [sp, #0xf0]
    b064:      	str	x26, [sp, #0xf8]
    b068:      	str	x27, [sp, #0x100]
    b06c:      	str	x28, [sp, #0x108]
    b070:      	sxtw	x4, w4
    b074:      	cmp	x4, #0x0
    b078:      	cset	w7, gt
    b07c:      	movz	x16, #0x0, lsl #48
    b080:      	sub	x9, x16, x4
    b084:      	sub	x10, x9, #0x1
    b088:      	uxtb	w16, w7
    b08c:      	cmp	w16, wzr
    b090:      	b.eq	0xb0d0 <_stogir.vector-lanes.operands+0x98>
    b094:      	ldr	x9, [x0, #0x8]
    b098:      	cmp	x4, x9
    b09c:      	b.ge	0xb128 <_stogir.vector-lanes.operands+0xf0>
    b0a0:      	add	x9, x0, #0x78
    b0a4:      	ldr	x9, [x9, #0x8]
    b0a8:      	cmp	x4, x9
    b0ac:      	b.ge	0xb22c <_stogir.vector-lanes.operands+0x1f4>
    b0b0:      	ldr	x9, [x0, #0x78]
    b0b4:      	add	x9, x9, x4, lsl #2
    b0b8:      	ldr	w9, [x9]
    b0bc:      	sxtw	x9, w9
    b0c0:      	cmp	x9, #0x0
    b0c4:      	cset	w9, ge
    b0c8:      	ubfx	x9, x9, #0, #8
    b0cc:      	b	0xb230 <_stogir.vector-lanes.operands+0x1f8>
    b0d0:      	cmp	x4, #0x0
    b0d4:      	b.ge	0xb130 <_stogir.vector-lanes.operands+0xf8>
    b0d8:      	add	x11, x0, #0x28
    b0dc:      	add	x12, x0, #0x50
    b0e0:      	ldr	x11, [x11, #0x8]
    b0e4:      	ldr	x12, [x12, #0x8]
    b0e8:      	cmp	x11, x12
    b0ec:      	b.ne	0xb118 <_stogir.vector-lanes.operands+0xe0>
    b0f0:      	cmp	x9, x11
    b0f4:      	b.gt	0xb3e0 <_stogir.vector-lanes.operands+0x3a8>
    b0f8:      	ldr	x9, [x0, #0x50]
    b0fc:      	add	x9, x9, x10, lsl #2
    b100:      	ldr	w9, [x9]
    b104:      	sxtw	x9, w9
    b108:      	cmp	x9, #0x0
    b10c:      	cset	w9, gt
    b110:      	ubfx	x9, x9, #0, #8
    b114:      	b	0xb3e4 <_stogir.vector-lanes.operands+0x3ac>
    b118:      	movz	x9, #0x0, lsl #48
    b11c:      	b	0xb134 <_stogir.vector-lanes.operands+0xfc>
    b120:      	mov	x1, #0x1                ; =1
    b124:      	b	0xb1bc <_stogir.vector-lanes.operands+0x184>
    b128:      	movz	x9, #0x0, lsl #48
    b12c:      	b	0xb134 <_stogir.vector-lanes.operands+0xfc>
    b130:      	movz	x9, #0x0, lsl #48
    b134:      	cmp	x9, #0x0
    b138:      	b.eq	0xb16c <_stogir.vector-lanes.operands+0x134>
    b13c:      	uxtb	w16, w7
    b140:      	cmp	w16, wzr
    b144:      	b.eq	0xb158 <_stogir.vector-lanes.operands+0x120>
    b148:      	ldr	x7, [x0]
    b14c:      	add	x4, x7, x4, lsl #4
    b150:      	ldr	x4, [x4]
    b154:      	b	0xb164 <_stogir.vector-lanes.operands+0x12c>
    b158:      	ldr	x4, [x0, #0x28]
    b15c:      	add	x4, x4, x10, lsl #4
    b160:      	ldr	x4, [x4]
    b164:      	mov	w7, #0x1                ; =1
    b168:      	b	0xb174 <_stogir.vector-lanes.operands+0x13c>
    b16c:      	movz	w7, #0x0, lsl #16
    b170:      	movz	x4, #0x0, lsl #48
    b174:      	ubfx	x7, x7, #0, #32
    b178:      	lsr	x16, x7, #0
    b17c:      	cmp	x16, #0x1
    b180:      	b.eq	0xb19c <_stogir.vector-lanes.operands+0x164>
    b184:      	b.lo	0xb18c <_stogir.vector-lanes.operands+0x154>
    b188:      	b	0xb1a0 <_stogir.vector-lanes.operands+0x168>
    b18c:      	cmp	x16, #0x0
    b190:      	b.eq	0xb198 <_stogir.vector-lanes.operands+0x160>
    b194:      	b	0xb1a0 <_stogir.vector-lanes.operands+0x168>
    b198:      	b	0xb1a4 <_stogir.vector-lanes.operands+0x16c>
    b19c:      	b	0xb204 <_stogir.vector-lanes.operands+0x1cc>
    b1a0:      	b	0xb6b8 <_stogir.vector-lanes.operands+0x680>
    b1a4:      	adrp	x16, 0xb000 <_stogir.floating.operands+0x420>
		000000000000b1a4:  ARM64_RELOC_PAGE21	l_stogir.477
    b1a8:      	ldr	x16, [x16]
		000000000000b1a8:  ARM64_RELOC_PAGEOFF12	l_stogir.477
    b1ac:      	orr	x19, x16, xzr
    b1b0:      	str	x8, [sp, #0xa0]
    b1b4:      	mov	x1, #0x1                ; =1
    b1b8:      	mov	x0, #0x1b               ; =27
    b1bc:      	ldr	x2, [sp, #0xa0]
    b1c0:      	str	x1, [x2]
    b1c4:      	str	x19, [x2, #0x8]
    b1c8:      	str	x0, [x2, #0x10]
    b1cc:      	ldr	x19, [sp, #0xc0]
    b1d0:      	ldr	x20, [sp, #0xc8]
    b1d4:      	ldr	x21, [sp, #0xd0]
    b1d8:      	ldr	x22, [sp, #0xd8]
    b1dc:      	ldr	x23, [sp, #0xe0]
    b1e0:      	ldr	x24, [sp, #0xe8]
    b1e4:      	ldr	x25, [sp, #0xf0]
    b1e8:      	ldr	x26, [sp, #0xf8]
    b1ec:      	ldr	x27, [sp, #0x100]
    b1f0:      	ldr	x28, [sp, #0x108]
    b1f4:      	ldr	x29, [sp]
    b1f8:      	ldr	x30, [sp, #0x8]
    b1fc:      	add	sp, sp, #0x110
    b200:      	ret
    b204:      	sxtw	x20, w1
    b208:      	sxtw	x1, w2
    b20c:      	orr	w7, w4, wzr
    b210:      	ubfx	x7, x7, #0, #32
    b214:      	ubfx	x7, x7, #8, #8
    b218:      	orr	x21, x7, xzr
    b21c:      	cmp	x20, #0x3d
    b220:      	b.ne	0xb234 <_stogir.vector-lanes.operands+0x1fc>
    b224:      	mov	x22, x21
    b228:      	b	0xb238 <_stogir.vector-lanes.operands+0x200>
    b22c:      	movz	x9, #0x0, lsl #48
    b230:      	b	0xb12c <_stogir.vector-lanes.operands+0xf4>
    b234:      	mov	x22, x1
    b238:      	cmp	x20, #0x3d
    b23c:      	b.eq	0xb244 <_stogir.vector-lanes.operands+0x20c>
    b240:      	mov	x1, x21
    b244:      	orr	w23, w22, wzr
    b248:      	sxtw	x24, w23
    b24c:      	cmp	x24, #0xf
    b250:      	cset	w25, gt
    b254:      	cmp	x24, #0x80
    b258:      	cset	w26, lt
    b25c:      	and	w7, w23, #0xf
    b260:      	ubfx	x7, x7, #0, #32
    b264:      	cmp	x7, #0x1
    b268:      	cset	w27, ge
    b26c:      	cmp	x7, #0xd
    b270:      	cset	w28, le
    b274:      	cmp	x20, #0x3d
    b278:      	b.lt	0xb2c8 <_stogir.vector-lanes.operands+0x290>
    b27c:      	cmp	x20, #0x3f
    b280:      	b.gt	0xb2c8 <_stogir.vector-lanes.operands+0x290>
    b284:      	uxtb	w16, w25
    b288:      	cmp	w16, wzr
    b28c:      	b.eq	0xb2c8 <_stogir.vector-lanes.operands+0x290>
    b290:      	uxtb	w16, w26
    b294:      	cmp	w16, wzr
    b298:      	b.eq	0xb2c8 <_stogir.vector-lanes.operands+0x290>
    b29c:      	uxtb	w16, w27
    b2a0:      	cmp	w16, wzr
    b2a4:      	b.eq	0xb2c8 <_stogir.vector-lanes.operands+0x290>
    b2a8:      	uxtb	w16, w28
    b2ac:      	cmp	w16, wzr
    b2b0:      	b.eq	0xb2c8 <_stogir.vector-lanes.operands+0x290>
    b2b4:      	sxtw	x7, w3
    b2b8:      	cmp	x7, #0x4
    b2bc:      	b.eq	0xb6e8 <_stogir.vector-lanes.operands+0x6b0>
    b2c0:      	cmp	x7, #0x8
    b2c4:      	b.eq	0xb6e8 <_stogir.vector-lanes.operands+0x6b0>
    b2c8:      	adrp	x16, 0xb000 <_stogir.floating.operands+0x420>
		000000000000b2c8:  ARM64_RELOC_PAGE21	l_stogir.478
    b2cc:      	ldr	x16, [x16]
		000000000000b2cc:  ARM64_RELOC_PAGEOFF12	l_stogir.478
    b2d0:      	orr	x19, x16, xzr
    b2d4:      	mov	x4, #0x36               ; =54
    b2d8:      	sxtw	x7, w5
    b2dc:      	sxtw	x9, w6
    b2e0:      	cmp	x9, #0x0
    b2e4:      	cset	w9, eq
    b2e8:      	cmp	x20, #0x3f
    b2ec:      	b.ne	0xb720 <_stogir.vector-lanes.operands+0x6e8>
    b2f0:      	mov	w0, w23
    b2f4:      	mov	w2, w3
    b2f8:      	mov	x20, x8
    b2fc:      	mov	x21, x4
    b300:      	mov	x23, x7
    b304:      	mov	w24, w9
    b308:      	bl	0xb308 <_stogir.vector-lanes.operands+0x2d0>
		000000000000b308:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.compatible?
    b30c:      	cmp	x0, #0x0
    b310:      	b.eq	0xb4f0 <_stogir.vector-lanes.operands+0x4b8>
    b314:      	movz	x0, #0x0, lsl #48
    b318:      	b	0xb4f4 <_stogir.vector-lanes.operands+0x4bc>
    b31c:      	cmp	x20, #0x3d
    b320:      	b.ne	0xb72c <_stogir.vector-lanes.operands+0x6f4>
    b324:      	str	x0, [sp, #0x80]
    b328:      	mov	w0, w23
    b32c:      	str	w3, [sp, #0x98]
    b330:      	str	w6, [sp, #0xb0]
    b334:      	str	x1, [sp, #0xa0]
    b338:      	mov	w1, w2
    b33c:      	mov	w2, w3
    b340:      	str	x4, [sp, #0xa8]
    b344:      	str	w8, [sp, #0xb8]
    b348:      	str	w23, [sp, #0x88]
    b34c:      	mov	x23, x7
    b350:      	str	x22, [sp, #0x90]
    b354:      	mov	w22, w5
    b358:      	bl	0xb358 <_stogir.vector-lanes.operands+0x320>
		000000000000b358:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.compatible?
    b35c:      	cmp	x0, #0x0
    b360:      	b.ne	0xb378 <_stogir.vector-lanes.operands+0x340>
    b364:      	adrp	x16, 0xb000 <_stogir.floating.operands+0x420>
		000000000000b364:  ARM64_RELOC_PAGE21	l_stogir.479
    b368:      	ldr	x16, [x16]
		000000000000b368:  ARM64_RELOC_PAGEOFF12	l_stogir.479
    b36c:      	orr	x19, x16, xzr
    b370:      	mov	x16, #0x26              ; =38
    b374:      	str	x16, [sp, #0xa8]
    b378:      	cmp	x20, #0x3e
    b37c:      	b.ne	0xb410 <_stogir.vector-lanes.operands+0x3d8>
    b380:      	cmp	x21, x24
    b384:      	cset	w0, eq
    b388:      	uxtb	w16, w0
    b38c:      	cmp	w16, wzr
    b390:      	cset	x0, eq
    b394:      	b	0xb414 <_stogir.vector-lanes.operands+0x3dc>
    b398:      	mov	x0, #0x1                ; =1
    b39c:      	cmp	x0, #0x0
    b3a0:      	b.eq	0xb3b4 <_stogir.vector-lanes.operands+0x37c>
    b3a4:      	adrp	x16, 0xb000 <_stogir.floating.operands+0x420>
		000000000000b3a4:  ARM64_RELOC_PAGE21	l_stogir.480
    b3a8:      	ldr	x16, [x16]
		000000000000b3a8:  ARM64_RELOC_PAGEOFF12	l_stogir.480
    b3ac:      	orr	x19, x16, xzr
    b3b0:      	mov	x21, #0x24              ; =36
    b3b4:      	str	x22, [sp, #0x90]
    b3b8:      	str	x20, [sp, #0xa0]
    b3bc:      	str	x21, [sp, #0xa8]
    b3c0:      	ldr	x0, [sp, #0xa8]
    b3c4:      	cmp	x0, #0x0
    b3c8:      	b.ne	0xb120 <_stogir.vector-lanes.operands+0xe8>
    b3cc:      	ldr	x0, [sp, #0x90]
    b3d0:      	and	x19, x0, #0xffffffff
    b3d4:      	movz	x1, #0x0, lsl #48
    b3d8:      	movz	x0, #0x0, lsl #48
    b3dc:      	b	0xb124 <_stogir.vector-lanes.operands+0xec>
    b3e0:      	movz	x9, #0x0, lsl #48
    b3e4:      	b	0xb11c <_stogir.vector-lanes.operands+0xe4>
    b3e8:      	ldr	w0, [sp, #0xb8]
    b3ec:      	uxtb	w16, w0
    b3f0:      	cmp	w16, wzr
    b3f4:      	b.ne	0xb40c <_stogir.vector-lanes.operands+0x3d4>
    b3f8:      	adrp	x16, 0xb000 <_stogir.floating.operands+0x420>
		000000000000b3f8:  ARM64_RELOC_PAGE21	l_stogir.481
    b3fc:      	ldr	x16, [x16]
		000000000000b3fc:  ARM64_RELOC_PAGEOFF12	l_stogir.481
    b400:      	orr	x19, x16, xzr
    b404:      	mov	x16, #0x20              ; =32
    b408:      	str	x16, [sp, #0xa8]
    b40c:      	b	0xb3c0 <_stogir.vector-lanes.operands+0x388>
    b410:      	movz	x0, #0x0, lsl #48
    b414:      	cmp	x0, #0x0
    b418:      	b.eq	0xb430 <_stogir.vector-lanes.operands+0x3f8>
    b41c:      	adrp	x16, 0xb000 <_stogir.floating.operands+0x420>
		000000000000b41c:  ARM64_RELOC_PAGE21	l_stogir.482
    b420:      	ldr	x16, [x16]
		000000000000b420:  ARM64_RELOC_PAGEOFF12	l_stogir.482
    b424:      	orr	x19, x16, xzr
    b428:      	mov	x16, #0x27              ; =39
    b42c:      	str	x16, [sp, #0xa8]
    b430:      	add	x8, sp, #0x10
    b434:      	ldr	x0, [sp, #0x80]
    b438:      	mov	w1, w22
    b43c:      	bl	0xb43c <_stogir.vector-lanes.operands+0x404>
		000000000000b43c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    b440:      	add	x16, sp, #0x10
    b444:      	ldr	w0, [x16]
    b448:      	lsr	x16, x0, #0
    b44c:      	cmp	x16, #0x1
    b450:      	b.eq	0xb46c <_stogir.vector-lanes.operands+0x434>
    b454:      	b.lo	0xb45c <_stogir.vector-lanes.operands+0x424>
    b458:      	b	0xb470 <_stogir.vector-lanes.operands+0x438>
    b45c:      	cmp	x16, #0x0
    b460:      	b.eq	0xb468 <_stogir.vector-lanes.operands+0x430>
    b464:      	b	0xb470 <_stogir.vector-lanes.operands+0x438>
    b468:      	b	0xb474 <_stogir.vector-lanes.operands+0x43c>
    b46c:      	b	0xb51c <_stogir.vector-lanes.operands+0x4e4>
    b470:      	b	0xb710 <_stogir.vector-lanes.operands+0x6d8>
    b474:      	adrp	x16, 0xb000 <_stogir.floating.operands+0x420>
		000000000000b474:  ARM64_RELOC_PAGE21	l_stogir.483
    b478:      	ldr	x16, [x16]
		000000000000b478:  ARM64_RELOC_PAGEOFF12	l_stogir.483
    b47c:      	orr	x19, x16, xzr
    b480:      	mov	x16, #0x19              ; =25
    b484:      	str	x16, [sp, #0xa8]
    b488:      	cmp	x20, #0x3e
    b48c:      	b.ne	0xb3e8 <_stogir.vector-lanes.operands+0x3b0>
    b490:      	ldr	w0, [sp, #0xb0]
    b494:      	add	x8, sp, #0x50
    b498:      	mov	w1, w0
    b49c:      	ldr	x0, [sp, #0x80]
    b4a0:      	bl	0xb4a0 <_stogir.vector-lanes.operands+0x468>
		000000000000b4a0:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    b4a4:      	add	x16, sp, #0x50
    b4a8:      	ldr	w0, [x16]
    b4ac:      	lsr	x16, x0, #0
    b4b0:      	cmp	x16, #0x1
    b4b4:      	b.eq	0xb4d0 <_stogir.vector-lanes.operands+0x498>
    b4b8:      	b.lo	0xb4c0 <_stogir.vector-lanes.operands+0x488>
    b4bc:      	b	0xb4d4 <_stogir.vector-lanes.operands+0x49c>
    b4c0:      	cmp	x16, #0x0
    b4c4:      	b.eq	0xb4cc <_stogir.vector-lanes.operands+0x494>
    b4c8:      	b	0xb4d4 <_stogir.vector-lanes.operands+0x49c>
    b4cc:      	b	0xb4d8 <_stogir.vector-lanes.operands+0x4a0>
    b4d0:      	b	0xb608 <_stogir.vector-lanes.operands+0x5d0>
    b4d4:      	b	0xb718 <_stogir.vector-lanes.operands+0x6e0>
    b4d8:      	adrp	x16, 0xb000 <_stogir.floating.operands+0x420>
		000000000000b4d8:  ARM64_RELOC_PAGE21	l_stogir.484
    b4dc:      	ldr	x16, [x16]
		000000000000b4dc:  ARM64_RELOC_PAGEOFF12	l_stogir.484
    b4e0:      	orr	x19, x16, xzr
    b4e4:      	mov	x16, #0x20              ; =32
    b4e8:      	str	x16, [sp, #0xa8]
    b4ec:      	b	0xb40c <_stogir.vector-lanes.operands+0x3d4>
    b4f0:      	mov	x0, #0x1                ; =1
    b4f4:      	cmp	x0, #0x0
    b4f8:      	b.eq	0xb504 <_stogir.vector-lanes.operands+0x4cc>
    b4fc:      	mov	x0, #0x1                ; =1
    b500:      	b	0xb39c <_stogir.vector-lanes.operands+0x364>
    b504:      	cmp	x23, #0x0
    b508:      	b.ne	0xb398 <_stogir.vector-lanes.operands+0x360>
    b50c:      	uxtb	w16, w24
    b510:      	cmp	w16, wzr
    b514:      	cset	x0, eq
    b518:      	b	0xb39c <_stogir.vector-lanes.operands+0x364>
    b51c:      	add	x16, sp, #0x10
    b520:      	orr	x0, x16, xzr
    b524:      	add	x0, x0, #0x8
    b528:      	add	x16, sp, #0x10
    b52c:      	ldr	x1, [x16, #0x8]
    b530:      	add	x16, sp, #0x40
    b534:      	str	x1, [x16]
    b538:      	ldr	x0, [x0, #0x8]
    b53c:      	ubfx	x1, x1, #0, #32
    b540:      	add	x16, sp, #0x40
    b544:      	str	x0, [x16, #0x8]
    b548:      	ubfx	x0, x1, #8, #8
    b54c:      	cmp	x0, #0x1
    b550:      	b.lt	0xb578 <_stogir.vector-lanes.operands+0x540>
    b554:      	cmp	x0, #0xb
    b558:      	b.gt	0xb578 <_stogir.vector-lanes.operands+0x540>
    b55c:      	add	x16, sp, #0x40
    b560:      	ldr	w0, [x16]
    b564:      	uxtb	w0, w0
    b568:      	cmp	x0, #0x48
    b56c:      	b.eq	0xb578 <_stogir.vector-lanes.operands+0x540>
    b570:      	cmp	x0, #0x46
    b574:      	b.ne	0xb58c <_stogir.vector-lanes.operands+0x554>
    b578:      	adrp	x16, 0xb000 <_stogir.floating.operands+0x420>
		000000000000b578:  ARM64_RELOC_PAGE21	l_stogir.485
    b57c:      	ldr	x16, [x16]
		000000000000b57c:  ARM64_RELOC_PAGEOFF12	l_stogir.485
    b580:      	orr	x19, x16, xzr
    b584:      	mov	x16, #0x2b              ; =43
    b588:      	str	x16, [sp, #0xa8]
    b58c:      	cmp	x23, #0x0
    b590:      	b.ge	0xb5bc <_stogir.vector-lanes.operands+0x584>
    b594:      	add	x16, sp, #0x40
    b598:      	ldr	w0, [x16]
    b59c:      	uxtb	w1, w0
    b5a0:      	ubfx	x0, x0, #8, #8
    b5a4:      	cmp	x1, x0
    b5a8:      	b.eq	0xb660 <_stogir.vector-lanes.operands+0x628>
    b5ac:      	cmp	x1, #0x49
    b5b0:      	b.eq	0xb660 <_stogir.vector-lanes.operands+0x628>
    b5b4:      	movz	x0, #0x0, lsl #48
    b5b8:      	b	0xb604 <_stogir.vector-lanes.operands+0x5cc>
    b5bc:      	movz	x0, #0x0, lsl #48
    b5c0:      	cmp	x0, #0x0
    b5c4:      	b.eq	0xb5dc <_stogir.vector-lanes.operands+0x5a4>
    b5c8:      	adrp	x16, 0xb000 <_stogir.floating.operands+0x420>
		000000000000b5c8:  ARM64_RELOC_PAGE21	l_stogir.486
    b5cc:      	ldr	x16, [x16]
		000000000000b5cc:  ARM64_RELOC_PAGEOFF12	l_stogir.486
    b5d0:      	orr	x19, x16, xzr
    b5d4:      	mov	x16, #0x28              ; =40
    b5d8:      	str	x16, [sp, #0xa8]
    b5dc:      	b	0xb488 <_stogir.vector-lanes.operands+0x450>
    b5e0:      	movn	w2, #0x0, lsl #16
    b5e4:      	ubfx	x0, x0, #0, #32
    b5e8:      	ubfx	x1, x1, #0, #32
    b5ec:      	lsl	x1, x1, #32
    b5f0:      	orr	x0, x1, x0
    b5f4:      	sxtw	x2, w2
    b5f8:      	cmp	x0, x2
    b5fc:      	cset	w0, hs
    b600:      	ubfx	x0, x0, #0, #8
    b604:      	b	0xb5c0 <_stogir.vector-lanes.operands+0x588>
    b608:      	add	x16, sp, #0x50
    b60c:      	ldr	x0, [x16, #0x8]
    b610:      	uxtb	w1, w0
    b614:      	cmp	x1, #0x48
    b618:      	b.eq	0xb648 <_stogir.vector-lanes.operands+0x610>
    b61c:      	cmp	x1, #0x46
    b620:      	b.eq	0xb648 <_stogir.vector-lanes.operands+0x610>
    b624:      	ldr	w1, [sp, #0x98]
    b628:      	ubfx	x0, x0, #0, #32
    b62c:      	ubfx	x0, x0, #8, #8
    b630:      	mov	w2, w1
    b634:      	mov	w1, w0
    b638:      	ldr	w0, [sp, #0x88]
    b63c:      	bl	0xb63c <_stogir.vector-lanes.operands+0x604>
		000000000000b63c:  ARM64_RELOC_BRANCH26	_stogir.vector-lanes.compatible?
    b640:      	cmp	x0, #0x0
    b644:      	b.ne	0xb65c <_stogir.vector-lanes.operands+0x624>
    b648:      	adrp	x16, 0xb000 <_stogir.floating.operands+0x420>
		000000000000b648:  ARM64_RELOC_PAGE21	l_stogir.487
    b64c:      	ldr	x16, [x16]
		000000000000b64c:  ARM64_RELOC_PAGEOFF12	l_stogir.487
    b650:      	orr	x19, x16, xzr
    b654:      	mov	x16, #0x27              ; =39
    b658:      	str	x16, [sp, #0xa8]
    b65c:      	b	0xb4ec <_stogir.vector-lanes.operands+0x4b4>
    b660:      	add	x16, sp, #0x40
    b664:      	ldr	w0, [x16, #0x8]
    b668:      	add	x16, sp, #0x40
    b66c:      	ldr	w1, [x16, #0xc]
    b670:      	uxtb	w16, w25
    b674:      	cmp	w16, wzr
    b678:      	b.eq	0xb6c0 <_stogir.vector-lanes.operands+0x688>
    b67c:      	uxtb	w16, w26
    b680:      	cmp	w16, wzr
    b684:      	b.eq	0xb6c0 <_stogir.vector-lanes.operands+0x688>
    b688:      	uxtb	w16, w27
    b68c:      	cmp	w16, wzr
    b690:      	b.eq	0xb6c0 <_stogir.vector-lanes.operands+0x688>
    b694:      	uxtb	w16, w28
    b698:      	cmp	w16, wzr
    b69c:      	b.eq	0xb6c0 <_stogir.vector-lanes.operands+0x688>
    b6a0:      	ubfx	x2, x24, #4, #32
    b6a4:      	sub	w2, w2, #0x1
    b6a8:      	sxtw	x2, w2
    b6ac:      	mov	x16, #0x1               ; =1
    b6b0:      	lsl	x2, x16, x2
    b6b4:      	b	0xb5e4 <_stogir.vector-lanes.operands+0x5ac>
    b6b8:      	brk	#0
    b6bc:      	b	0xb6b8 <_stogir.vector-lanes.operands+0x680>
    b6c0:      	cmp	x24, #0x0
    b6c4:      	b.lt	0xb5e0 <_stogir.vector-lanes.operands+0x5a8>
    b6c8:      	cmp	x24, #0xd
    b6cc:      	b.gt	0xb5e0 <_stogir.vector-lanes.operands+0x5a8>
    b6d0:      	cmp	x24, #0x0
    b6d4:      	cset	w2, eq
    b6d8:      	uxtb	w16, w2
    b6dc:      	cmp	w16, wzr
    b6e0:      	cset	w2, eq
    b6e4:      	b	0xb5e4 <_stogir.vector-lanes.operands+0x5ac>
    b6e8:      	uxtb	w4, w4
    b6ec:      	cmp	x4, #0x48
    b6f0:      	b.eq	0xb2c8 <_stogir.vector-lanes.operands+0x290>
    b6f4:      	cmp	x4, #0x46
    b6f8:      	b.eq	0xb2c8 <_stogir.vector-lanes.operands+0x290>
    b6fc:      	adrp	x16, 0xb000 <_stogir.floating.operands+0x420>
		000000000000b6fc:  ARM64_RELOC_PAGE21	l_stogir.488
    b700:      	ldr	x16, [x16]
		000000000000b700:  ARM64_RELOC_PAGEOFF12	l_stogir.488
    b704:      	orr	x19, x16, xzr
    b708:      	movz	x4, #0x0, lsl #48
    b70c:      	b	0xb2d8 <_stogir.vector-lanes.operands+0x2a0>
    b710:      	brk	#0
    b714:      	b	0xb710 <_stogir.vector-lanes.operands+0x6d8>
    b718:      	brk	#0
    b71c:      	b	0xb718 <_stogir.vector-lanes.operands+0x6e0>
    b720:      	mov	x1, x8
    b724:      	mov	w8, w9
    b728:      	b	0xb31c <_stogir.vector-lanes.operands+0x2e4>
    b72c:      	str	x22, [sp, #0x90]
    b730:      	str	x1, [sp, #0xa0]
    b734:      	str	x0, [sp, #0x80]
    b738:      	str	w3, [sp, #0x98]
    b73c:      	mov	w22, w5
    b740:      	str	w6, [sp, #0xb0]
    b744:      	str	w23, [sp, #0x88]
    b748:      	mov	x23, x7
    b74c:      	str	w8, [sp, #0xb8]
    b750:      	str	x4, [sp, #0xa8]
    b754:      	b	0xb378 <_stogir.vector-lanes.operands+0x340>

000000000000b758 <_stogir.vector-comparison.operands>:
    b758:      	sub	sp, sp, #0xc0
    b75c:      	str	x29, [sp]
    b760:      	str	x30, [sp, #0x8]
    b764:      	mov	x29, sp
    b768:      	str	x19, [sp, #0x70]
    b76c:      	str	x20, [sp, #0x78]
    b770:      	str	x21, [sp, #0x80]
    b774:      	str	x22, [sp, #0x88]
    b778:      	str	x23, [sp, #0x90]
    b77c:      	str	x24, [sp, #0x98]
    b780:      	str	x25, [sp, #0xa0]
    b784:      	str	x26, [sp, #0xa8]
    b788:      	str	x27, [sp, #0xb0]
    b78c:      	adrp	x16, 0xb000 <_stogir.floating.operands+0x420>
		000000000000b78c:  ARM64_RELOC_PAGE21	l_stogir.489
    b790:      	ldr	x16, [x16]
		000000000000b790:  ARM64_RELOC_PAGEOFF12	l_stogir.489
    b794:      	orr	x19, x16, xzr
    b798:      	mov	x20, x8
    b79c:      	add	x8, sp, #0x10
    b7a0:      	mov	x21, x0
    b7a4:      	mov	w22, w1
    b7a8:      	mov	w1, w4
    b7ac:      	mov	w23, w2
    b7b0:      	mov	w24, w3
    b7b4:      	mov	w25, w5
    b7b8:      	bl	0xb7b8 <_stogir.vector-comparison.operands+0x60>
		000000000000b7b8:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    b7bc:      	add	x16, sp, #0x10
    b7c0:      	ldr	w0, [x16]
    b7c4:      	lsr	x16, x0, #0
    b7c8:      	cmp	x16, #0x1
    b7cc:      	b.eq	0xb7e8 <_stogir.vector-comparison.operands+0x90>
    b7d0:      	b.lo	0xb7d8 <_stogir.vector-comparison.operands+0x80>
    b7d4:      	b	0xb7ec <_stogir.vector-comparison.operands+0x94>
    b7d8:      	cmp	x16, #0x0
    b7dc:      	b.eq	0xb7e4 <_stogir.vector-comparison.operands+0x8c>
    b7e0:      	b	0xb7ec <_stogir.vector-comparison.operands+0x94>
    b7e4:      	b	0xb7f0 <_stogir.vector-comparison.operands+0x98>
    b7e8:      	b	0xb838 <_stogir.vector-comparison.operands+0xe0>
    b7ec:      	b	0xb9b0 <_stogir.vector-comparison.operands+0x258>
    b7f0:      	mov	x0, #0x1                ; =1
    b7f4:      	mov	x1, #0x21               ; =33
    b7f8:      	str	x0, [x20]
    b7fc:      	str	x19, [x20, #0x8]
    b800:      	str	x1, [x20, #0x10]
    b804:      	ldr	x19, [sp, #0x70]
    b808:      	ldr	x20, [sp, #0x78]
    b80c:      	ldr	x21, [sp, #0x80]
    b810:      	ldr	x22, [sp, #0x88]
    b814:      	ldr	x23, [sp, #0x90]
    b818:      	ldr	x24, [sp, #0x98]
    b81c:      	ldr	x25, [sp, #0xa0]
    b820:      	ldr	x26, [sp, #0xa8]
    b824:      	ldr	x27, [sp, #0xb0]
    b828:      	ldr	x29, [sp]
    b82c:      	ldr	x30, [sp, #0x8]
    b830:      	add	sp, sp, #0xc0
    b834:      	ret
    b838:      	add	x16, sp, #0x10
    b83c:      	ldr	x26, [x16, #0x8]
    b840:      	add	x8, sp, #0x40
    b844:      	mov	x0, x21
    b848:      	mov	w1, w25
    b84c:      	bl	0xb84c <_stogir.vector-comparison.operands+0xf4>
		000000000000b84c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    b850:      	add	x16, sp, #0x40
    b854:      	ldr	w0, [x16]
    b858:      	lsr	x16, x0, #0
    b85c:      	cmp	x16, #0x1
    b860:      	b.eq	0xb87c <_stogir.vector-comparison.operands+0x124>
    b864:      	b.lo	0xb86c <_stogir.vector-comparison.operands+0x114>
    b868:      	b	0xb880 <_stogir.vector-comparison.operands+0x128>
    b86c:      	cmp	x16, #0x0
    b870:      	b.eq	0xb878 <_stogir.vector-comparison.operands+0x120>
    b874:      	b	0xb880 <_stogir.vector-comparison.operands+0x128>
    b878:      	b	0xb884 <_stogir.vector-comparison.operands+0x12c>
    b87c:      	b	0xb890 <_stogir.vector-comparison.operands+0x138>
    b880:      	b	0xb9b8 <_stogir.vector-comparison.operands+0x260>
    b884:      	mov	x0, #0x1                ; =1
    b888:      	mov	x1, #0x21               ; =33
    b88c:      	b	0xb7f8 <_stogir.vector-comparison.operands+0xa0>
    b890:      	sxtw	x0, w24
    b894:      	add	x16, sp, #0x40
    b898:      	ldr	x19, [x16, #0x8]
    b89c:      	cmp	x0, #0x4
    b8a0:      	b.eq	0xb8c4 <_stogir.vector-comparison.operands+0x16c>
    b8a4:      	cmp	x0, #0x8
    b8a8:      	b.eq	0xb8c4 <_stogir.vector-comparison.operands+0x16c>
    b8ac:      	adrp	x16, 0xb000 <_stogir.floating.operands+0x420>
		000000000000b8ac:  ARM64_RELOC_PAGE21	l_stogir.490
    b8b0:      	ldr	x16, [x16]
		000000000000b8b0:  ARM64_RELOC_PAGEOFF12	l_stogir.490
    b8b4:      	orr	x19, x16, xzr
    b8b8:      	mov	x0, #0x1                ; =1
    b8bc:      	mov	x1, #0x33               ; =51
    b8c0:      	b	0xb88c <_stogir.vector-comparison.operands+0x134>
    b8c4:      	orr	w0, w26, wzr
    b8c8:      	ubfx	x0, x0, #0, #32
    b8cc:      	ubfx	x21, x0, #8, #8
    b8d0:      	orr	x25, x21, xzr
    b8d4:      	mov	w0, w22
    b8d8:      	mov	w1, w25
    b8dc:      	bl	0xb8dc <_stogir.vector-comparison.operands+0x184>
		000000000000b8dc:  ARM64_RELOC_BRANCH26	_stogir.vector-comparison.valid-type?
    b8e0:      	cmp	x0, #0x0
    b8e4:      	b.eq	0xb8ac <_stogir.vector-comparison.operands+0x154>
    b8e8:      	orr	w0, w19, wzr
    b8ec:      	ubfx	x0, x0, #0, #32
    b8f0:      	ubfx	x0, x0, #8, #8
    b8f4:      	cmp	x21, x0
    b8f8:      	b.ne	0xb8ac <_stogir.vector-comparison.operands+0x154>
    b8fc:      	uxtb	w26, w26
    b900:      	cmp	x26, #0x48
    b904:      	b.eq	0xb8ac <_stogir.vector-comparison.operands+0x154>
    b908:      	cmp	x26, #0x46
    b90c:      	b.eq	0xb8ac <_stogir.vector-comparison.operands+0x154>
    b910:      	uxtb	w19, w19
    b914:      	cmp	x19, #0x48
    b918:      	b.eq	0xb8ac <_stogir.vector-comparison.operands+0x154>
    b91c:      	cmp	x19, #0x46
    b920:      	b.eq	0xb8ac <_stogir.vector-comparison.operands+0x154>
    b924:      	sxtw	x0, w23
    b928:      	cmp	x0, #0xf
    b92c:      	cset	w1, gt
    b930:      	uxtb	w16, w1
    b934:      	cmp	w16, wzr
    b938:      	b.eq	0xb8ac <_stogir.vector-comparison.operands+0x154>
    b93c:      	cmp	x0, #0x80
    b940:      	cset	w2, lt
    b944:      	uxtb	w16, w2
    b948:      	cmp	w16, wzr
    b94c:      	b.eq	0xb8ac <_stogir.vector-comparison.operands+0x154>
    b950:      	and	w3, w23, #0xf
    b954:      	ubfx	x4, x3, #0, #32
    b958:      	cmp	x4, #0x1
    b95c:      	cset	w5, ge
    b960:      	uxtb	w16, w5
    b964:      	cmp	w16, wzr
    b968:      	b.eq	0xb8ac <_stogir.vector-comparison.operands+0x154>
    b96c:      	cmp	x4, #0xd
    b970:      	cset	w4, le
    b974:      	uxtb	w16, w4
    b978:      	cmp	w16, wzr
    b97c:      	b.eq	0xb8ac <_stogir.vector-comparison.operands+0x154>
    b980:      	cmp	x0, #0x0
    b984:      	cset	w6, ge
    b988:      	cmp	x0, #0xd
    b98c:      	cset	w7, le
    b990:      	uxtb	w16, w6
    b994:      	cmp	w16, wzr
    b998:      	b.eq	0xb9c0 <_stogir.vector-comparison.operands+0x268>
    b99c:      	uxtb	w16, w7
    b9a0:      	cmp	w16, wzr
    b9a4:      	b.eq	0xb9c0 <_stogir.vector-comparison.operands+0x268>
    b9a8:      	mov	w8, w3
    b9ac:      	b	0xb9f4 <_stogir.vector-comparison.operands+0x29c>
    b9b0:      	brk	#0
    b9b4:      	b	0xb9b0 <_stogir.vector-comparison.operands+0x258>
    b9b8:      	brk	#0
    b9bc:      	b	0xb9b8 <_stogir.vector-comparison.operands+0x260>
    b9c0:      	uxtb	w16, w1
    b9c4:      	cmp	w16, wzr
    b9c8:      	b.eq	0xb9f0 <_stogir.vector-comparison.operands+0x298>
    b9cc:      	uxtb	w16, w2
    b9d0:      	cmp	w16, wzr
    b9d4:      	b.eq	0xb9f0 <_stogir.vector-comparison.operands+0x298>
    b9d8:      	uxtb	w16, w5
    b9dc:      	cmp	w16, wzr
    b9e0:      	b.eq	0xb9f0 <_stogir.vector-comparison.operands+0x298>
    b9e4:      	uxtb	w16, w4
    b9e8:      	cmp	w16, wzr
    b9ec:      	b.ne	0xb9a8 <_stogir.vector-comparison.operands+0x250>
    b9f0:      	movn	w8, #0x0, lsl #16
    b9f4:      	sxtw	x8, w8
    b9f8:      	cmp	x8, #0x1
    b9fc:      	b.lt	0xb8ac <_stogir.vector-comparison.operands+0x154>
    ba00:      	cmp	x8, #0xb
    ba04:      	b.gt	0xb8ac <_stogir.vector-comparison.operands+0x154>
    ba08:      	uxtb	w16, w1
    ba0c:      	cmp	w16, wzr
    ba10:      	b.eq	0xba50 <_stogir.vector-comparison.operands+0x2f8>
    ba14:      	uxtb	w16, w2
    ba18:      	cmp	w16, wzr
    ba1c:      	b.eq	0xba50 <_stogir.vector-comparison.operands+0x2f8>
    ba20:      	uxtb	w16, w5
    ba24:      	cmp	w16, wzr
    ba28:      	b.eq	0xba50 <_stogir.vector-comparison.operands+0x2f8>
    ba2c:      	uxtb	w16, w4
    ba30:      	cmp	w16, wzr
    ba34:      	b.eq	0xba50 <_stogir.vector-comparison.operands+0x2f8>
    ba38:      	ubfx	x0, x0, #4, #32
    ba3c:      	sub	w0, w0, #0x1
    ba40:      	sxtw	x0, w0
    ba44:      	mov	x16, #0x1               ; =1
    ba48:      	lsl	x0, x16, x0
    ba4c:      	b	0xbb5c <_stogir.vector-comparison.operands+0x404>
    ba50:      	uxtb	w16, w6
    ba54:      	cmp	w16, wzr
    ba58:      	b.eq	0xbb58 <_stogir.vector-comparison.operands+0x400>
    ba5c:      	uxtb	w16, w7
    ba60:      	cmp	w16, wzr
    ba64:      	b.eq	0xbb58 <_stogir.vector-comparison.operands+0x400>
    ba68:      	cmp	x0, #0x0
    ba6c:      	cset	w0, eq
    ba70:      	uxtb	w16, w0
    ba74:      	cmp	w16, wzr
    ba78:      	cset	w0, eq
    ba7c:      	b	0xbb5c <_stogir.vector-comparison.operands+0x404>
    ba80:      	movn	w8, #0x0, lsl #16
    ba84:      	sxtw	x0, w0
    ba88:      	sxtw	x8, w8
    ba8c:      	cmp	x0, x8
    ba90:      	b.ne	0xb8ac <_stogir.vector-comparison.operands+0x154>
    ba94:      	uxtb	w16, w6
    ba98:      	cmp	w16, wzr
    ba9c:      	b.eq	0xbaac <_stogir.vector-comparison.operands+0x354>
    baa0:      	uxtb	w16, w7
    baa4:      	cmp	w16, wzr
    baa8:      	b.ne	0xbae0 <_stogir.vector-comparison.operands+0x388>
    baac:      	uxtb	w16, w1
    bab0:      	cmp	w16, wzr
    bab4:      	b.eq	0xbadc <_stogir.vector-comparison.operands+0x384>
    bab8:      	uxtb	w16, w2
    babc:      	cmp	w16, wzr
    bac0:      	b.eq	0xbadc <_stogir.vector-comparison.operands+0x384>
    bac4:      	uxtb	w16, w5
    bac8:      	cmp	w16, wzr
    bacc:      	b.eq	0xbadc <_stogir.vector-comparison.operands+0x384>
    bad0:      	uxtb	w16, w4
    bad4:      	cmp	w16, wzr
    bad8:      	b.ne	0xbae0 <_stogir.vector-comparison.operands+0x388>
    badc:      	movn	w3, #0x0, lsl #16
    bae0:      	mov	w0, w3
    bae4:      	mov	w1, w24
    bae8:      	bl	0xbae8 <_stogir.vector-comparison.operands+0x390>
		000000000000bae8:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    baec:      	uxtb	w16, w22
    baf0:      	cmp	w16, wzr
    baf4:      	b.ne	0xbb2c <_stogir.vector-comparison.operands+0x3d4>
    baf8:      	uxtb	w16, w23
    bafc:      	cmp	w16, wzr
    bb00:      	b.eq	0xbb28 <_stogir.vector-comparison.operands+0x3d0>
    bb04:      	uxtb	w16, w25
    bb08:      	cmp	w16, wzr
    bb0c:      	b.eq	0xbb28 <_stogir.vector-comparison.operands+0x3d0>
    bb10:      	uxtb	w16, w26
    bb14:      	cmp	w16, wzr
    bb18:      	b.eq	0xbb28 <_stogir.vector-comparison.operands+0x3d0>
    bb1c:      	uxtb	w16, w27
    bb20:      	cmp	w16, wzr
    bb24:      	b.ne	0xbb2c <_stogir.vector-comparison.operands+0x3d4>
    bb28:      	movn	w19, #0x0, lsl #16
    bb2c:      	sxtw	x22, w0
    bb30:      	mov	w0, w19
    bb34:      	mov	w1, w24
    bb38:      	bl	0xbb38 <_stogir.vector-comparison.operands+0x3e0>
		000000000000bb38:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    bb3c:      	sxtw	x0, w0
    bb40:      	cmp	x22, x0
    bb44:      	b.ne	0xb8ac <_stogir.vector-comparison.operands+0x154>
    bb48:      	and	x19, x21, #0xffffffff
    bb4c:      	movz	x0, #0x0, lsl #48
    bb50:      	movz	x1, #0x0, lsl #48
    bb54:      	b	0xb8c0 <_stogir.vector-comparison.operands+0x168>
    bb58:      	movn	w0, #0x0, lsl #16
    bb5c:      	and	w19, w25, #0xf
    bb60:      	cmp	x21, #0xd
    bb64:      	cset	w22, le
    bb68:      	cmp	x21, #0xf
    bb6c:      	cset	w23, gt
    bb70:      	cmp	x21, #0x80
    bb74:      	cset	w25, lt
    bb78:      	ubfx	x8, x19, #0, #32
    bb7c:      	cmp	x8, #0x1
    bb80:      	cset	w26, ge
    bb84:      	cmp	x8, #0xd
    bb88:      	cset	w27, le
    bb8c:      	uxtb	w16, w23
    bb90:      	cmp	w16, wzr
    bb94:      	b.eq	0xbbd4 <_stogir.vector-comparison.operands+0x47c>
    bb98:      	uxtb	w16, w25
    bb9c:      	cmp	w16, wzr
    bba0:      	b.eq	0xbbd4 <_stogir.vector-comparison.operands+0x47c>
    bba4:      	uxtb	w16, w26
    bba8:      	cmp	w16, wzr
    bbac:      	b.eq	0xbbd4 <_stogir.vector-comparison.operands+0x47c>
    bbb0:      	uxtb	w16, w27
    bbb4:      	cmp	w16, wzr
    bbb8:      	b.eq	0xbbd4 <_stogir.vector-comparison.operands+0x47c>
    bbbc:      	ubfx	x8, x21, #4, #32
    bbc0:      	sub	w8, w8, #0x1
    bbc4:      	sxtw	x8, w8
    bbc8:      	mov	x16, #0x1               ; =1
    bbcc:      	lsl	x8, x16, x8
    bbd0:      	b	0xba84 <_stogir.vector-comparison.operands+0x32c>
    bbd4:      	uxtb	w16, w22
    bbd8:      	cmp	w16, wzr
    bbdc:      	b.eq	0xba80 <_stogir.vector-comparison.operands+0x328>
    bbe0:      	cmp	x21, #0x0
    bbe4:      	cset	w8, eq
    bbe8:      	uxtb	w16, w8
    bbec:      	cmp	w16, wzr
    bbf0:      	cset	w8, eq
    bbf4:      	b	0xba84 <_stogir.vector-comparison.operands+0x32c>

000000000000bbf8 <_stogir.vector-arithmetic.operands>:
    bbf8:      	sub	sp, sp, #0x80
    bbfc:      	str	x29, [sp]
    bc00:      	str	x30, [sp, #0x8]
    bc04:      	mov	x29, sp
    bc08:      	str	x19, [sp, #0x30]
    bc0c:      	str	x20, [sp, #0x38]
    bc10:      	str	x21, [sp, #0x40]
    bc14:      	str	x22, [sp, #0x48]
    bc18:      	str	x23, [sp, #0x50]
    bc1c:      	str	x24, [sp, #0x58]
    bc20:      	str	x25, [sp, #0x60]
    bc24:      	str	x26, [sp, #0x68]
    bc28:      	str	x27, [sp, #0x70]
    bc2c:      	str	x28, [sp, #0x78]
    bc30:      	mov	x19, x8
    bc34:      	mov	x20, x0
    bc38:      	mov	w0, w1
    bc3c:      	mov	w21, w1
    bc40:      	mov	w1, w2
    bc44:      	mov	w22, w2
    bc48:      	mov	w23, w3
    bc4c:      	mov	w24, w4
    bc50:      	mov	w25, w5
    bc54:      	bl	0xbc54 <_stogir.vector-arithmetic.operands+0x5c>
		000000000000bc54:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.valid-type?
    bc58:      	cmp	x0, #0x0
    bc5c:      	b.eq	0xbc74 <_stogir.vector-arithmetic.operands+0x7c>
    bc60:      	adrp	x16, 0xb000 <_stogir.floating.operands+0x420>
		000000000000bc60:  ARM64_RELOC_PAGE21	l_stogir.491
    bc64:      	ldr	x16, [x16]
		000000000000bc64:  ARM64_RELOC_PAGEOFF12	l_stogir.491
    bc68:      	orr	x0, x16, xzr
    bc6c:      	movz	x1, #0x0, lsl #48
    bc70:      	b	0xbc84 <_stogir.vector-arithmetic.operands+0x8c>
    bc74:      	adrp	x16, 0xb000 <_stogir.floating.operands+0x420>
		000000000000bc74:  ARM64_RELOC_PAGE21	l_stogir.492
    bc78:      	ldr	x16, [x16]
		000000000000bc78:  ARM64_RELOC_PAGEOFF12	l_stogir.492
    bc7c:      	orr	x0, x16, xzr
    bc80:      	mov	x1, #0x37               ; =55
    bc84:      	sxtw	x21, w21
    bc88:      	sxtw	x22, w22
    bc8c:      	adrp	x16, 0xb000 <_stogir.floating.operands+0x420>
		000000000000bc8c:  ARM64_RELOC_PAGE21	l_stogir.493
    bc90:      	ldr	x16, [x16]
		000000000000bc90:  ARM64_RELOC_PAGEOFF12	l_stogir.493
    bc94:      	orr	x2, x16, xzr
    bc98:      	adrp	x16, 0xb000 <_stogir.floating.operands+0x420>
		000000000000bc98:  ARM64_RELOC_PAGE21	l_stogir.494
    bc9c:      	ldr	x16, [x16]
		000000000000bc9c:  ARM64_RELOC_PAGEOFF12	l_stogir.494
    bca0:      	orr	x3, x16, xzr
    bca4:      	add	x4, x20, #0x78
    bca8:      	add	x5, x20, #0x28
    bcac:      	add	x6, x20, #0x50
    bcb0:      	cmp	x21, #0x31
    bcb4:      	cset	w7, ge
    bcb8:      	cmp	x21, #0x35
    bcbc:      	cset	w8, le
    bcc0:      	cmp	x21, #0x1f
    bcc4:      	cset	w9, eq
    bcc8:      	cmp	x21, #0x20
    bccc:      	cset	w10, eq
    bcd0:      	cmp	x21, #0x2d
    bcd4:      	cset	w11, eq
    bcd8:      	cmp	x21, #0x36
    bcdc:      	cset	w12, eq
    bce0:      	cmp	x21, #0x37
    bce4:      	cset	w13, eq
    bce8:      	cmp	x21, #0x38
    bcec:      	cset	w14, eq
    bcf0:      	cmp	x21, #0x39
    bcf4:      	cset	w15, eq
    bcf8:      	movz	x26, #0x0, lsl #48
    bcfc:      	b	0xbe20 <_stogir.vector-arithmetic.operands+0x228>
    bd00:      	movz	x2, #0x0, lsl #48
    bd04:      	b	0xbd14 <_stogir.vector-arithmetic.operands+0x11c>
    bd08:      	movz	x2, #0x0, lsl #48
    bd0c:      	b	0xbd1c <_stogir.vector-arithmetic.operands+0x124>
    bd10:      	movz	x2, #0x0, lsl #48
    bd14:      	b	0xbd2c <_stogir.vector-arithmetic.operands+0x134>
    bd18:      	movz	x2, #0x0, lsl #48
    bd1c:      	str	x4, [sp, #0x20]
    bd20:      	str	x5, [sp, #0x28]
    bd24:      	b	0xbd2c <_stogir.vector-arithmetic.operands+0x134>
    bd28:      	movz	x2, #0x0, lsl #48
    bd2c:      	cmp	x2, #0x0
    bd30:      	b.eq	0xbd64 <_stogir.vector-arithmetic.operands+0x16c>
    bd34:      	uxtb	w16, w28
    bd38:      	cmp	w16, wzr
    bd3c:      	b.eq	0xbd50 <_stogir.vector-arithmetic.operands+0x158>
    bd40:      	ldr	x2, [x20]
    bd44:      	add	x2, x2, x27, lsl #4
    bd48:      	ldr	x2, [x2]
    bd4c:      	b	0xbd5c <_stogir.vector-arithmetic.operands+0x164>
    bd50:      	ldr	x2, [x20, #0x28]
    bd54:      	add	x2, x2, x3, lsl #4
    bd58:      	ldr	x2, [x2]
    bd5c:      	mov	w3, #0x1                ; =1
    bd60:      	b	0xbd6c <_stogir.vector-arithmetic.operands+0x174>
    bd64:      	movz	w3, #0x0, lsl #16
    bd68:      	movz	x2, #0x0, lsl #48
    bd6c:      	ubfx	x3, x3, #0, #32
    bd70:      	lsr	x16, x3, #0
    bd74:      	cmp	x16, #0x1
    bd78:      	b.eq	0xbd94 <_stogir.vector-arithmetic.operands+0x19c>
    bd7c:      	b.lo	0xbd84 <_stogir.vector-arithmetic.operands+0x18c>
    bd80:      	b	0xbd98 <_stogir.vector-arithmetic.operands+0x1a0>
    bd84:      	cmp	x16, #0x0
    bd88:      	b.eq	0xbd90 <_stogir.vector-arithmetic.operands+0x198>
    bd8c:      	b	0xbd98 <_stogir.vector-arithmetic.operands+0x1a0>
    bd90:      	b	0xbd9c <_stogir.vector-arithmetic.operands+0x1a4>
    bd94:      	b	0xbda8 <_stogir.vector-arithmetic.operands+0x1b0>
    bd98:      	b	0xc108 <_stogir.vector-arithmetic.operands+0x510>
    bd9c:      	ldr	x0, [sp, #0x10]
    bda0:      	mov	x1, #0x21               ; =33
    bda4:      	b	0xbe08 <_stogir.vector-arithmetic.operands+0x210>
    bda8:      	orr	w3, w2, wzr
    bdac:      	ubfx	x3, x3, #0, #32
    bdb0:      	ubfx	x3, x3, #8, #8
    bdb4:      	cmp	x3, x22
    bdb8:      	b.eq	0xbdec <_stogir.vector-arithmetic.operands+0x1f4>
    bdbc:      	cmp	x26, #0x1
    bdc0:      	b.ne	0xbe00 <_stogir.vector-arithmetic.operands+0x208>
    bdc4:      	uxtb	w16, w7
    bdc8:      	cmp	w16, wzr
    bdcc:      	b.eq	0xbe00 <_stogir.vector-arithmetic.operands+0x208>
    bdd0:      	uxtb	w16, w8
    bdd4:      	cmp	w16, wzr
    bdd8:      	b.eq	0xbe00 <_stogir.vector-arithmetic.operands+0x208>
    bddc:      	cmp	x3, #0x1
    bde0:      	b.lt	0xbe00 <_stogir.vector-arithmetic.operands+0x208>
    bde4:      	cmp	x3, #0xb
    bde8:      	b.gt	0xbe00 <_stogir.vector-arithmetic.operands+0x208>
    bdec:      	uxtb	w2, w2
    bdf0:      	cmp	x2, #0x48
    bdf4:      	b.eq	0xbe00 <_stogir.vector-arithmetic.operands+0x208>
    bdf8:      	cmp	x2, #0x46
    bdfc:      	b.ne	0xbe08 <_stogir.vector-arithmetic.operands+0x210>
    be00:      	ldr	x0, [sp, #0x18]
    be04:      	mov	x1, #0x32               ; =50
    be08:      	add	x2, x26, #0x1
    be0c:      	sxtw	x26, w2
    be10:      	ldr	x2, [sp, #0x10]
    be14:      	ldr	x3, [sp, #0x18]
    be18:      	ldr	x4, [sp, #0x20]
    be1c:      	ldr	x5, [sp, #0x28]
    be20:      	uxtb	w16, w9
    be24:      	cmp	w16, wzr
    be28:      	b.ne	0xbe7c <_stogir.vector-arithmetic.operands+0x284>
    be2c:      	uxtb	w16, w10
    be30:      	cmp	w16, wzr
    be34:      	b.ne	0xbe7c <_stogir.vector-arithmetic.operands+0x284>
    be38:      	uxtb	w16, w11
    be3c:      	cmp	w16, wzr
    be40:      	b.ne	0xbe7c <_stogir.vector-arithmetic.operands+0x284>
    be44:      	uxtb	w16, w12
    be48:      	cmp	w16, wzr
    be4c:      	b.ne	0xbe7c <_stogir.vector-arithmetic.operands+0x284>
    be50:      	uxtb	w16, w13
    be54:      	cmp	w16, wzr
    be58:      	b.ne	0xbe7c <_stogir.vector-arithmetic.operands+0x284>
    be5c:      	uxtb	w16, w14
    be60:      	cmp	w16, wzr
    be64:      	b.ne	0xbe7c <_stogir.vector-arithmetic.operands+0x284>
    be68:      	uxtb	w16, w15
    be6c:      	cmp	w16, wzr
    be70:      	b.ne	0xbe7c <_stogir.vector-arithmetic.operands+0x284>
    be74:      	mov	x27, #0x2               ; =2
    be78:      	b	0xbe80 <_stogir.vector-arithmetic.operands+0x288>
    be7c:      	mov	x27, #0x1               ; =1
    be80:      	cmp	x26, x27
    be84:      	b.ge	0xbf48 <_stogir.vector-arithmetic.operands+0x350>
    be88:      	cmp	x26, #0x0
    be8c:      	b.ne	0xbe98 <_stogir.vector-arithmetic.operands+0x2a0>
    be90:      	mov	w27, w23
    be94:      	b	0xbe9c <_stogir.vector-arithmetic.operands+0x2a4>
    be98:      	mov	w27, w24
    be9c:      	sxtw	x27, w27
    bea0:      	cmp	x27, #0x0
    bea4:      	cset	w28, gt
    bea8:      	str	x2, [sp, #0x10]
    beac:      	movz	x16, #0x0, lsl #48
    beb0:      	sub	x2, x16, x27
    beb4:      	str	x3, [sp, #0x18]
    beb8:      	sub	x3, x2, #0x1
    bebc:      	uxtb	w16, w28
    bec0:      	cmp	w16, wzr
    bec4:      	b.eq	0xbf00 <_stogir.vector-arithmetic.operands+0x308>
    bec8:      	ldr	x2, [x20, #0x8]
    becc:      	cmp	x27, x2
    bed0:      	b.ge	0xbd18 <_stogir.vector-arithmetic.operands+0x120>
    bed4:      	ldr	x2, [x4, #0x8]
    bed8:      	cmp	x27, x2
    bedc:      	b.ge	0xbd08 <_stogir.vector-arithmetic.operands+0x110>
    bee0:      	ldr	x2, [x20, #0x78]
    bee4:      	add	x2, x2, x27, lsl #2
    bee8:      	ldr	w2, [x2]
    beec:      	sxtw	x2, w2
    bef0:      	cmp	x2, #0x0
    bef4:      	cset	w2, ge
    bef8:      	ubfx	x2, x2, #0, #8
    befc:      	b	0xbd0c <_stogir.vector-arithmetic.operands+0x114>
    bf00:      	cmp	x27, #0x0
    bf04:      	b.ge	0xc1ec <_stogir.vector-arithmetic.operands+0x5f4>
    bf08:      	str	x4, [sp, #0x20]
    bf0c:      	ldr	x4, [x5, #0x8]
    bf10:      	str	x5, [sp, #0x28]
    bf14:      	ldr	x5, [x6, #0x8]
    bf18:      	cmp	x4, x5
    bf1c:      	b.ne	0xbd10 <_stogir.vector-arithmetic.operands+0x118>
    bf20:      	cmp	x2, x4
    bf24:      	b.gt	0xbd00 <_stogir.vector-arithmetic.operands+0x108>
    bf28:      	ldr	x2, [x20, #0x50]
    bf2c:      	add	x2, x2, x3, lsl #2
    bf30:      	ldr	w2, [x2]
    bf34:      	sxtw	x2, w2
    bf38:      	cmp	x2, #0x0
    bf3c:      	cset	w2, gt
    bf40:      	ubfx	x2, x2, #0, #8
    bf44:      	b	0xbd04 <_stogir.vector-arithmetic.operands+0x10c>
    bf48:      	sxtw	x25, w25
    bf4c:      	cmp	x25, #0x0
    bf50:      	b.ne	0xbf5c <_stogir.vector-arithmetic.operands+0x364>
    bf54:      	movz	x2, #0x0, lsl #48
    bf58:      	b	0xbf60 <_stogir.vector-arithmetic.operands+0x368>
    bf5c:      	mov	x2, #0x1                ; =1
    bf60:      	cmp	x2, #0x0
    bf64:      	b.eq	0xbf94 <_stogir.vector-arithmetic.operands+0x39c>
    bf68:      	cmp	x21, #0x1d
    bf6c:      	b.ne	0xc050 <_stogir.vector-arithmetic.operands+0x458>
    bf70:      	mov	x2, #0x1                ; =1
    bf74:      	b	0xc05c <_stogir.vector-arithmetic.operands+0x464>
    bf78:      	mov	x2, #0x1                ; =1
    bf7c:      	cmp	x2, #0x0
    bf80:      	b.eq	0xbff4 <_stogir.vector-arithmetic.operands+0x3fc>
    bf84:      	adrp	x16, 0xb000 <_stogir.floating.operands+0x420>
		000000000000bf84:  ARM64_RELOC_PAGE21	l_stogir.495
    bf88:      	ldr	x16, [x16]
		000000000000bf88:  ARM64_RELOC_PAGEOFF12	l_stogir.495
    bf8c:      	orr	x0, x16, xzr
    bf90:      	mov	x1, #0x23               ; =35
    bf94:      	cmp	x1, #0x0
    bf98:      	b.ne	0xbfac <_stogir.vector-arithmetic.operands+0x3b4>
    bf9c:      	and	x0, x22, #0xffffffff
    bfa0:      	movz	x2, #0x0, lsl #48
    bfa4:      	movz	x1, #0x0, lsl #48
    bfa8:      	b	0xbfb0 <_stogir.vector-arithmetic.operands+0x3b8>
    bfac:      	mov	x2, #0x1                ; =1
    bfb0:      	str	x2, [x19]
    bfb4:      	str	x0, [x19, #0x8]
    bfb8:      	str	x1, [x19, #0x10]
    bfbc:      	ldr	x19, [sp, #0x30]
    bfc0:      	ldr	x20, [sp, #0x38]
    bfc4:      	ldr	x21, [sp, #0x40]
    bfc8:      	ldr	x22, [sp, #0x48]
    bfcc:      	ldr	x23, [sp, #0x50]
    bfd0:      	ldr	x24, [sp, #0x58]
    bfd4:      	ldr	x25, [sp, #0x60]
    bfd8:      	ldr	x26, [sp, #0x68]
    bfdc:      	ldr	x27, [sp, #0x70]
    bfe0:      	ldr	x28, [sp, #0x78]
    bfe4:      	ldr	x29, [sp]
    bfe8:      	ldr	x30, [sp, #0x8]
    bfec:      	add	sp, sp, #0x80
    bff0:      	ret
    bff4:      	cmp	x25, #0x0
    bff8:      	cset	w2, gt
    bffc:      	movz	x16, #0x0, lsl #48
    c000:      	sub	x3, x16, x25
    c004:      	sub	x4, x3, #0x1
    c008:      	uxtb	w16, w2
    c00c:      	cmp	w16, wzr
    c010:      	b.eq	0xc0c0 <_stogir.vector-arithmetic.operands+0x4c8>
    c014:      	ldr	x3, [x20, #0x8]
    c018:      	cmp	x25, x3
    c01c:      	b.ge	0xc110 <_stogir.vector-arithmetic.operands+0x518>
    c020:      	add	x3, x20, #0x78
    c024:      	ldr	x3, [x3, #0x8]
    c028:      	cmp	x25, x3
    c02c:      	b.ge	0xc1d4 <_stogir.vector-arithmetic.operands+0x5dc>
    c030:      	ldr	x3, [x20, #0x78]
    c034:      	add	x3, x3, x25, lsl #2
    c038:      	ldr	w3, [x3]
    c03c:      	sxtw	x3, w3
    c040:      	cmp	x3, #0x0
    c044:      	cset	w3, ge
    c048:      	ubfx	x3, x3, #0, #8
    c04c:      	b	0xc1d8 <_stogir.vector-arithmetic.operands+0x5e0>
    c050:      	cmp	x21, #0x1e
    c054:      	cset	w2, eq
    c058:      	ubfx	x2, x2, #0, #8
    c05c:      	cmp	x2, #0x0
    c060:      	b.eq	0xbf78 <_stogir.vector-arithmetic.operands+0x380>
    c064:      	movz	x2, #0x0, lsl #48
    c068:      	b	0xbf7c <_stogir.vector-arithmetic.operands+0x384>
    c06c:      	movz	w3, #0x0, lsl #16
    c070:      	uxtb	w16, w3
    c074:      	and	w3, w16, #0x2
    c078:      	uxtb	w3, w3
    c07c:      	ubfx	x3, x3, #0, #8
    c080:      	cmp	x3, #0x0
    c084:      	cset	w3, eq
    c088:      	uxtb	w16, w3
    c08c:      	cmp	w16, wzr
    c090:      	cset	x3, eq
    c094:      	cmp	x3, #0x0
    c098:      	b.ne	0xc0bc <_stogir.vector-arithmetic.operands+0x4c4>
    c09c:      	cmp	x2, #0x65
    c0a0:      	b.eq	0xc0bc <_stogir.vector-arithmetic.operands+0x4c4>
    c0a4:      	cmp	x2, #0x66
    c0a8:      	b.eq	0xc0bc <_stogir.vector-arithmetic.operands+0x4c4>
    c0ac:      	adrp	x16, 0xc000 <_stogir.vector-arithmetic.operands+0x408>
		000000000000c0ac:  ARM64_RELOC_PAGE21	l_stogir.496
    c0b0:      	ldr	x16, [x16]
		000000000000c0b0:  ARM64_RELOC_PAGEOFF12	l_stogir.496
    c0b4:      	orr	x0, x16, xzr
    c0b8:      	mov	x1, #0x34               ; =52
    c0bc:      	b	0xbf94 <_stogir.vector-arithmetic.operands+0x39c>
    c0c0:      	cmp	x25, #0x0
    c0c4:      	b.ge	0xc118 <_stogir.vector-arithmetic.operands+0x520>
    c0c8:      	add	x5, x20, #0x28
    c0cc:      	add	x6, x20, #0x50
    c0d0:      	ldr	x5, [x5, #0x8]
    c0d4:      	ldr	x6, [x6, #0x8]
    c0d8:      	cmp	x5, x6
    c0dc:      	b.ne	0xc1cc <_stogir.vector-arithmetic.operands+0x5d4>
    c0e0:      	cmp	x3, x5
    c0e4:      	b.gt	0xc1dc <_stogir.vector-arithmetic.operands+0x5e4>
    c0e8:      	ldr	x3, [x20, #0x50]
    c0ec:      	add	x3, x3, x4, lsl #2
    c0f0:      	ldr	w3, [x3]
    c0f4:      	sxtw	x3, w3
    c0f8:      	cmp	x3, #0x0
    c0fc:      	cset	w3, gt
    c100:      	ubfx	x3, x3, #0, #8
    c104:      	b	0xc1e0 <_stogir.vector-arithmetic.operands+0x5e8>
    c108:      	brk	#0
    c10c:      	b	0xc108 <_stogir.vector-arithmetic.operands+0x510>
    c110:      	movz	x3, #0x0, lsl #48
    c114:      	b	0xc11c <_stogir.vector-arithmetic.operands+0x524>
    c118:      	movz	x3, #0x0, lsl #48
    c11c:      	cmp	x3, #0x0
    c120:      	b.eq	0xc154 <_stogir.vector-arithmetic.operands+0x55c>
    c124:      	uxtb	w16, w2
    c128:      	cmp	w16, wzr
    c12c:      	b.eq	0xc140 <_stogir.vector-arithmetic.operands+0x548>
    c130:      	ldr	x2, [x20]
    c134:      	add	x2, x2, x25, lsl #4
    c138:      	ldr	x2, [x2]
    c13c:      	b	0xc14c <_stogir.vector-arithmetic.operands+0x554>
    c140:      	ldr	x2, [x20, #0x28]
    c144:      	add	x2, x2, x4, lsl #4
    c148:      	ldr	x2, [x2]
    c14c:      	mov	w3, #0x1                ; =1
    c150:      	b	0xc15c <_stogir.vector-arithmetic.operands+0x564>
    c154:      	movz	w3, #0x0, lsl #16
    c158:      	movz	x2, #0x0, lsl #48
    c15c:      	ubfx	x3, x3, #0, #32
    c160:      	lsr	x16, x3, #0
    c164:      	cmp	x16, #0x1
    c168:      	b.eq	0xc184 <_stogir.vector-arithmetic.operands+0x58c>
    c16c:      	b.lo	0xc174 <_stogir.vector-arithmetic.operands+0x57c>
    c170:      	b	0xc188 <_stogir.vector-arithmetic.operands+0x590>
    c174:      	cmp	x16, #0x0
    c178:      	b.eq	0xc180 <_stogir.vector-arithmetic.operands+0x588>
    c17c:      	b	0xc188 <_stogir.vector-arithmetic.operands+0x590>
    c180:      	b	0xc18c <_stogir.vector-arithmetic.operands+0x594>
    c184:      	b	0xc1a0 <_stogir.vector-arithmetic.operands+0x5a8>
    c188:      	b	0xc1e4 <_stogir.vector-arithmetic.operands+0x5ec>
    c18c:      	adrp	x16, 0xc000 <_stogir.vector-arithmetic.operands+0x408>
		000000000000c18c:  ARM64_RELOC_PAGE21	l_stogir.497
    c190:      	ldr	x16, [x16]
		000000000000c190:  ARM64_RELOC_PAGEOFF12	l_stogir.497
    c194:      	orr	x0, x16, xzr
    c198:      	mov	x1, #0x1d               ; =29
    c19c:      	b	0xc0bc <_stogir.vector-arithmetic.operands+0x4c4>
    c1a0:      	cmp	x25, #0x0
    c1a4:      	b.le	0xc0ac <_stogir.vector-arithmetic.operands+0x4b4>
    c1a8:      	uxtb	w2, w2
    c1ac:      	cmp	x2, #0x83
    c1b0:      	b.ge	0xc06c <_stogir.vector-arithmetic.operands+0x474>
    c1b4:      	adrp	x16, 0xc000 <_stogir.vector-arithmetic.operands+0x408>
		000000000000c1b4:  ARM64_RELOC_PAGE21	l_stogir.498
    c1b8:      	ldr	x16, [x16]
		000000000000c1b8:  ARM64_RELOC_PAGEOFF12	l_stogir.498
    c1bc:      	orr	x3, x16, xzr
    c1c0:      	add	x3, x2, x3
    c1c4:      	ldrb	w3, [x3]
    c1c8:      	b	0xc070 <_stogir.vector-arithmetic.operands+0x478>
    c1cc:      	movz	x3, #0x0, lsl #48
    c1d0:      	b	0xc11c <_stogir.vector-arithmetic.operands+0x524>
    c1d4:      	movz	x3, #0x0, lsl #48
    c1d8:      	b	0xc114 <_stogir.vector-arithmetic.operands+0x51c>
    c1dc:      	movz	x3, #0x0, lsl #48
    c1e0:      	b	0xc1d0 <_stogir.vector-arithmetic.operands+0x5d8>
    c1e4:      	brk	#0
    c1e8:      	b	0xc1e4 <_stogir.vector-arithmetic.operands+0x5ec>
    c1ec:      	str	x4, [sp, #0x20]
    c1f0:      	str	x5, [sp, #0x28]
    c1f4:      	b	0xbd28 <_stogir.vector-arithmetic.operands+0x130>

000000000000c1f8 <_stogir.switch.key>:
    c1f8:      	sub	sp, sp, #0x30
    c1fc:      	str	x19, [sp]
    c200:      	str	x20, [sp, #0x8]
    c204:      	str	x21, [sp, #0x10]
    c208:      	str	x22, [sp, #0x18]
    c20c:      	str	x23, [sp, #0x20]
    c210:      	sxtw	x2, w2
    c214:      	cmp	x2, #0x1
    c218:      	b.lt	0xc290 <_stogir.switch.key+0x98>
    c21c:      	cmp	x2, #0xb
    c220:      	cset	w3, le
    c224:      	uxtb	w16, w3
    c228:      	cmp	w16, wzr
    c22c:      	b.eq	0xc290 <_stogir.switch.key+0x98>
    c230:      	sxtw	x1, w1
    c234:      	cmp	x1, #0x0
    c238:      	cset	w4, gt
    c23c:      	movz	x16, #0x0, lsl #48
    c240:      	sub	x5, x16, x1
    c244:      	sub	x6, x5, #0x1
    c248:      	uxtb	w16, w4
    c24c:      	cmp	w16, wzr
    c250:      	b.eq	0xc310 <_stogir.switch.key+0x118>
    c254:      	ldr	x5, [x0, #0x8]
    c258:      	cmp	x1, x5
    c25c:      	b.ge	0xc358 <_stogir.switch.key+0x160>
    c260:      	add	x5, x0, #0x78
    c264:      	ldr	x5, [x5, #0x8]
    c268:      	cmp	x1, x5
    c26c:      	b.ge	0xc498 <_stogir.switch.key+0x2a0>
    c270:      	ldr	x5, [x0, #0x78]
    c274:      	add	x5, x5, x1, lsl #2
    c278:      	ldr	w5, [x5]
    c27c:      	sxtw	x5, w5
    c280:      	cmp	x5, #0x0
    c284:      	cset	w5, ge
    c288:      	ubfx	x5, x5, #0, #8
    c28c:      	b	0xc49c <_stogir.switch.key+0x2a4>
    c290:      	adrp	x16, 0xc000 <_stogir.vector-arithmetic.operands+0x408>
		000000000000c290:  ARM64_RELOC_PAGE21	l_stogir.499
    c294:      	ldr	x16, [x16]
		000000000000c294:  ARM64_RELOC_PAGEOFF12	l_stogir.499
    c298:      	orr	x0, x16, xzr
    c29c:      	mov	x1, #0x1                ; =1
    c2a0:      	mov	x2, #0x24               ; =36
    c2a4:      	str	x1, [x8]
    c2a8:      	str	x0, [x8, #0x8]
    c2ac:      	str	x2, [x8, #0x10]
    c2b0:      	ldr	x19, [sp]
    c2b4:      	ldr	x20, [sp, #0x8]
    c2b8:      	ldr	x21, [sp, #0x10]
    c2bc:      	ldr	x22, [sp, #0x18]
    c2c0:      	ldr	x23, [sp, #0x20]
    c2c4:      	add	sp, sp, #0x30
    c2c8:      	ret
    c2cc:      	mov	w23, #0x1               ; =1
    c2d0:      	cmp	x1, #0x0
    c2d4:      	b.ge	0xc2f8 <_stogir.switch.key+0x100>
    c2d8:      	orr	w1, w4, wzr
    c2dc:      	uxtb	w4, w4
    c2e0:      	ubfx	x1, x1, #0, #32
    c2e4:      	ubfx	x1, x1, #8, #8
    c2e8:      	cmp	x4, x1
    c2ec:      	b.eq	0xc540 <_stogir.switch.key+0x348>
    c2f0:      	cmp	x4, #0x49
    c2f4:      	b.eq	0xc540 <_stogir.switch.key+0x348>
    c2f8:      	adrp	x16, 0xc000 <_stogir.vector-arithmetic.operands+0x408>
		000000000000c2f8:  ARM64_RELOC_PAGE21	l_stogir.500
    c2fc:      	ldr	x16, [x16]
		000000000000c2fc:  ARM64_RELOC_PAGEOFF12	l_stogir.500
    c300:      	orr	x0, x16, xzr
    c304:      	mov	x1, #0x1                ; =1
    c308:      	mov	x2, #0x30               ; =48
    c30c:      	b	0xc2a4 <_stogir.switch.key+0xac>
    c310:      	cmp	x1, #0x0
    c314:      	b.ge	0xc360 <_stogir.switch.key+0x168>
    c318:      	add	x7, x0, #0x28
    c31c:      	add	x9, x0, #0x50
    c320:      	ldr	x7, [x7, #0x8]
    c324:      	ldr	x9, [x9, #0x8]
    c328:      	cmp	x7, x9
    c32c:      	b.ne	0xc490 <_stogir.switch.key+0x298>
    c330:      	cmp	x5, x7
    c334:      	b.gt	0xc538 <_stogir.switch.key+0x340>
    c338:      	ldr	x5, [x0, #0x50]
    c33c:      	add	x5, x5, x6, lsl #2
    c340:      	ldr	w5, [x5]
    c344:      	sxtw	x5, w5
    c348:      	cmp	x5, #0x0
    c34c:      	cset	w5, gt
    c350:      	ubfx	x5, x5, #0, #8
    c354:      	b	0xc53c <_stogir.switch.key+0x344>
    c358:      	movz	x5, #0x0, lsl #48
    c35c:      	b	0xc364 <_stogir.switch.key+0x16c>
    c360:      	movz	x5, #0x0, lsl #48
    c364:      	cmp	x5, #0x0
    c368:      	b.eq	0xc3a4 <_stogir.switch.key+0x1ac>
    c36c:      	uxtb	w16, w4
    c370:      	cmp	w16, wzr
    c374:      	b.eq	0xc38c <_stogir.switch.key+0x194>
    c378:      	ldr	x0, [x0]
    c37c:      	add	x0, x0, x1, lsl #4
    c380:      	ldr	x4, [x0]
    c384:      	ldr	x0, [x0, #0x8]
    c388:      	b	0xc39c <_stogir.switch.key+0x1a4>
    c38c:      	ldr	x0, [x0, #0x28]
    c390:      	add	x0, x0, x6, lsl #4
    c394:      	ldr	x4, [x0]
    c398:      	ldr	x0, [x0, #0x8]
    c39c:      	mov	w5, #0x1                ; =1
    c3a0:      	b	0xc3b0 <_stogir.switch.key+0x1b8>
    c3a4:      	movz	w5, #0x0, lsl #16
    c3a8:      	movz	x4, #0x0, lsl #48
    c3ac:      	movz	x0, #0x0, lsl #48
    c3b0:      	ubfx	x5, x5, #0, #32
    c3b4:      	lsr	x16, x5, #0
    c3b8:      	cmp	x16, #0x1
    c3bc:      	b.eq	0xc3d8 <_stogir.switch.key+0x1e0>
    c3c0:      	b.lo	0xc3c8 <_stogir.switch.key+0x1d0>
    c3c4:      	b	0xc3dc <_stogir.switch.key+0x1e4>
    c3c8:      	cmp	x16, #0x0
    c3cc:      	b.eq	0xc3d4 <_stogir.switch.key+0x1dc>
    c3d0:      	b	0xc3dc <_stogir.switch.key+0x1e4>
    c3d4:      	b	0xc3e0 <_stogir.switch.key+0x1e8>
    c3d8:      	b	0xc3f8 <_stogir.switch.key+0x200>
    c3dc:      	b	0xc5d4 <_stogir.switch.key+0x3dc>
    c3e0:      	adrp	x16, 0xc000 <_stogir.vector-arithmetic.operands+0x408>
		000000000000c3e0:  ARM64_RELOC_PAGE21	l_stogir.501
    c3e4:      	ldr	x16, [x16]
		000000000000c3e4:  ARM64_RELOC_PAGEOFF12	l_stogir.501
    c3e8:      	orr	x0, x16, xzr
    c3ec:      	mov	x1, #0x1                ; =1
    c3f0:      	mov	x2, #0x1c               ; =28
    c3f4:      	b	0xc30c <_stogir.switch.key+0x114>
    c3f8:      	cmp	x2, #0x1
    c3fc:      	cset	w5, eq
    c400:      	cmp	x2, #0x0
    c404:      	cset	w6, eq
    c408:      	cmp	x2, #0x2
    c40c:      	cset	w7, eq
    c410:      	cmp	x2, #0x7
    c414:      	cset	w9, eq
    c418:      	cmp	x2, #0x8
    c41c:      	cset	w10, eq
    c420:      	cmp	x2, #0x3
    c424:      	cset	w11, eq
    c428:      	cmp	x2, #0x9
    c42c:      	cset	w12, eq
    c430:      	cmp	x2, #0x4
    c434:      	cset	w13, eq
    c438:      	cmp	x2, #0xa
    c43c:      	cset	w14, eq
    c440:      	cmp	x2, #0xd
    c444:      	cset	w15, eq
    c448:      	cmp	x2, #0x5
    c44c:      	cset	w19, eq
    c450:      	cmp	x2, #0xb
    c454:      	cset	w20, eq
    c458:      	cmp	x2, #0xc
    c45c:      	cset	w21, eq
    c460:      	cmp	x2, #0x6
    c464:      	cset	w22, eq
    c468:      	uxtb	w16, w22
    c46c:      	cmp	w16, wzr
    c470:      	mov	w16, #0x8               ; =8
    c474:      	movn	w17, #0x0, lsl #16
    c478:      	csel	w22, w16, w17, ne
    c47c:      	uxtb	w16, w6
    c480:      	cmp	w16, wzr
    c484:      	b.eq	0xc4a0 <_stogir.switch.key+0x2a8>
    c488:      	movz	w23, #0x0, lsl #16
    c48c:      	b	0xc2d0 <_stogir.switch.key+0xd8>
    c490:      	movz	x5, #0x0, lsl #48
    c494:      	b	0xc364 <_stogir.switch.key+0x16c>
    c498:      	movz	x5, #0x0, lsl #48
    c49c:      	b	0xc35c <_stogir.switch.key+0x164>
    c4a0:      	uxtb	w16, w5
    c4a4:      	cmp	w16, wzr
    c4a8:      	b.ne	0xc2cc <_stogir.switch.key+0xd4>
    c4ac:      	uxtb	w16, w7
    c4b0:      	cmp	w16, wzr
    c4b4:      	b.ne	0xc2cc <_stogir.switch.key+0xd4>
    c4b8:      	uxtb	w16, w9
    c4bc:      	cmp	w16, wzr
    c4c0:      	b.ne	0xc2cc <_stogir.switch.key+0xd4>
    c4c4:      	uxtb	w16, w10
    c4c8:      	cmp	w16, wzr
    c4cc:      	b.ne	0xc2cc <_stogir.switch.key+0xd4>
    c4d0:      	uxtb	w16, w11
    c4d4:      	cmp	w16, wzr
    c4d8:      	b.ne	0xc5cc <_stogir.switch.key+0x3d4>
    c4dc:      	uxtb	w16, w12
    c4e0:      	cmp	w16, wzr
    c4e4:      	b.ne	0xc5cc <_stogir.switch.key+0x3d4>
    c4e8:      	uxtb	w16, w13
    c4ec:      	cmp	w16, wzr
    c4f0:      	b.ne	0xc690 <_stogir.switch.key+0x498>
    c4f4:      	uxtb	w16, w14
    c4f8:      	cmp	w16, wzr
    c4fc:      	b.ne	0xc690 <_stogir.switch.key+0x498>
    c500:      	uxtb	w16, w15
    c504:      	cmp	w16, wzr
    c508:      	b.ne	0xc690 <_stogir.switch.key+0x498>
    c50c:      	uxtb	w16, w19
    c510:      	cmp	w16, wzr
    c514:      	b.ne	0xc698 <_stogir.switch.key+0x4a0>
    c518:      	uxtb	w16, w20
    c51c:      	cmp	w16, wzr
    c520:      	b.ne	0xc698 <_stogir.switch.key+0x4a0>
    c524:      	uxtb	w16, w21
    c528:      	cmp	w16, wzr
    c52c:      	b.ne	0xc698 <_stogir.switch.key+0x4a0>
    c530:      	mov	w23, w22
    c534:      	b	0xc69c <_stogir.switch.key+0x4a4>
    c538:      	movz	x5, #0x0, lsl #48
    c53c:      	b	0xc494 <_stogir.switch.key+0x29c>
    c540:      	cmp	x1, x2
    c544:      	b.ne	0xc2f8 <_stogir.switch.key+0x100>
    c548:      	lsl	w1, w23, #3
    c54c:      	orr	w4, w0, wzr
    c550:      	sxtw	x1, w1
    c554:      	ubfx	x4, x4, #0, #32
    c558:      	lsr	x0, x0, #32
    c55c:      	ubfx	x0, x0, #0, #32
    c560:      	lsl	x0, x0, #32
    c564:      	orr	x0, x0, x4
    c568:      	cmp	x1, #0x40
    c56c:      	b.ge	0xc57c <_stogir.switch.key+0x384>
    c570:      	lsr	x1, x0, x1
    c574:      	cmp	x1, #0x0
    c578:      	b.ne	0xc2f8 <_stogir.switch.key+0x100>
    c57c:      	uxtb	w16, w5
    c580:      	cmp	w16, wzr
    c584:      	b.eq	0xc590 <_stogir.switch.key+0x398>
    c588:      	cmp	x0, #0x1
    c58c:      	b.hi	0xc2f8 <_stogir.switch.key+0x100>
    c590:      	cmp	x2, #0x7
    c594:      	b.lt	0xc5b8 <_stogir.switch.key+0x3c0>
    c598:      	uxtb	w16, w3
    c59c:      	cmp	w16, wzr
    c5a0:      	b.eq	0xc5b8 <_stogir.switch.key+0x3c0>
    c5a4:      	uxtb	w16, w6
    c5a8:      	cmp	w16, wzr
    c5ac:      	b.eq	0xc5f8 <_stogir.switch.key+0x400>
    c5b0:      	movz	w22, #0x0, lsl #16
    c5b4:      	b	0xc5e0 <_stogir.switch.key+0x3e8>
    c5b8:      	movz	x1, #0x0, lsl #48
    c5bc:      	eor	x0, x1, x0
    c5c0:      	movz	x1, #0x0, lsl #48
    c5c4:      	movz	x2, #0x0, lsl #48
    c5c8:      	b	0xc30c <_stogir.switch.key+0x114>
    c5cc:      	mov	w23, #0x2               ; =2
    c5d0:      	b	0xc2d0 <_stogir.switch.key+0xd8>
    c5d4:      	brk	#0
    c5d8:      	b	0xc5d4 <_stogir.switch.key+0x3dc>
    c5dc:      	mov	w22, #0x1               ; =1
    c5e0:      	lsl	w1, w22, #3
    c5e4:      	sub	w1, w1, #0x1
    c5e8:      	sxtw	x1, w1
    c5ec:      	mov	x16, #0x1               ; =1
    c5f0:      	lsl	x1, x16, x1
    c5f4:      	b	0xc5bc <_stogir.switch.key+0x3c4>
    c5f8:      	uxtb	w16, w5
    c5fc:      	cmp	w16, wzr
    c600:      	b.ne	0xc5dc <_stogir.switch.key+0x3e4>
    c604:      	uxtb	w16, w7
    c608:      	cmp	w16, wzr
    c60c:      	b.ne	0xc5dc <_stogir.switch.key+0x3e4>
    c610:      	uxtb	w16, w9
    c614:      	cmp	w16, wzr
    c618:      	b.ne	0xc5dc <_stogir.switch.key+0x3e4>
    c61c:      	uxtb	w16, w10
    c620:      	cmp	w16, wzr
    c624:      	b.ne	0xc5dc <_stogir.switch.key+0x3e4>
    c628:      	uxtb	w16, w11
    c62c:      	cmp	w16, wzr
    c630:      	b.ne	0xc6a0 <_stogir.switch.key+0x4a8>
    c634:      	uxtb	w16, w12
    c638:      	cmp	w16, wzr
    c63c:      	b.ne	0xc6a0 <_stogir.switch.key+0x4a8>
    c640:      	uxtb	w16, w13
    c644:      	cmp	w16, wzr
    c648:      	b.ne	0xc6a8 <_stogir.switch.key+0x4b0>
    c64c:      	uxtb	w16, w14
    c650:      	cmp	w16, wzr
    c654:      	b.ne	0xc6a8 <_stogir.switch.key+0x4b0>
    c658:      	uxtb	w16, w15
    c65c:      	cmp	w16, wzr
    c660:      	b.ne	0xc6a8 <_stogir.switch.key+0x4b0>
    c664:      	uxtb	w16, w19
    c668:      	cmp	w16, wzr
    c66c:      	b.ne	0xc688 <_stogir.switch.key+0x490>
    c670:      	uxtb	w16, w20
    c674:      	cmp	w16, wzr
    c678:      	b.ne	0xc688 <_stogir.switch.key+0x490>
    c67c:      	uxtb	w16, w21
    c680:      	cmp	w16, wzr
    c684:      	b.eq	0xc68c <_stogir.switch.key+0x494>
    c688:      	mov	w22, #0x8               ; =8
    c68c:      	b	0xc6ac <_stogir.switch.key+0x4b4>
    c690:      	mov	w23, #0x4               ; =4
    c694:      	b	0xc5d0 <_stogir.switch.key+0x3d8>
    c698:      	mov	w23, #0x8               ; =8
    c69c:      	b	0xc694 <_stogir.switch.key+0x49c>
    c6a0:      	mov	w22, #0x2               ; =2
    c6a4:      	b	0xc5e0 <_stogir.switch.key+0x3e8>
    c6a8:      	mov	w22, #0x4               ; =4
    c6ac:      	b	0xc6a4 <_stogir.switch.key+0x4ac>

000000000000c6b0 <_stogir.stack.entry-allocation?>:
    c6b0:      	sub	sp, sp, #0x10
    c6b4:      	add	x2, x0, #0x78
    c6b8:      	add	x3, x0, #0x28
    c6bc:      	add	x4, x0, #0x50
    c6c0:      	add	x5, x0, #0x78
    c6c4:      	add	x6, x0, #0x28
    c6c8:      	add	x7, x0, #0x50
    c6cc:      	sxtw	x1, w1
    c6d0:      	mov	x8, #0x1                ; =1
    c6d4:      	movz	x9, #0x0, lsl #48
    c6d8:      	b	0xc7dc <_stogir.stack.entry-allocation?+0x12c>
    c6dc:      	movz	x12, #0x0, lsl #48
    c6e0:      	b	0xc74c <_stogir.stack.entry-allocation?+0x9c>
    c6e4:      	movz	w11, #0x0, lsl #16
    c6e8:      	movz	x10, #0x0, lsl #48
    c6ec:      	ubfx	x11, x11, #0, #32
    c6f0:      	lsr	x16, x11, #0
    c6f4:      	cmp	x16, #0x1
    c6f8:      	b.eq	0xc714 <_stogir.stack.entry-allocation?+0x64>
    c6fc:      	b.lo	0xc704 <_stogir.stack.entry-allocation?+0x54>
    c700:      	b	0xc718 <_stogir.stack.entry-allocation?+0x68>
    c704:      	cmp	x16, #0x0
    c708:      	b.eq	0xc710 <_stogir.stack.entry-allocation?+0x60>
    c70c:      	b	0xc718 <_stogir.stack.entry-allocation?+0x68>
    c710:      	b	0xc738 <_stogir.stack.entry-allocation?+0x88>
    c714:      	b	0xc71c <_stogir.stack.entry-allocation?+0x6c>
    c718:      	b	0xca00 <_stogir.stack.entry-allocation?+0x350>
    c71c:      	uxtb	w11, w10
    c720:      	ubfx	x10, x10, #0, #32
    c724:      	ubfx	x10, x10, #8, #8
    c728:      	cmp	x11, x10
    c72c:      	b.eq	0xc9f0 <_stogir.stack.entry-allocation?+0x340>
    c730:      	cmp	x11, #0x49
    c734:      	b.eq	0xc9f0 <_stogir.stack.entry-allocation?+0x340>
    c738:      	movz	x8, #0x0, lsl #48
    c73c:      	b	0xc8bc <_stogir.stack.entry-allocation?+0x20c>
    c740:      	movz	x12, #0x0, lsl #48
    c744:      	b	0xc754 <_stogir.stack.entry-allocation?+0xa4>
    c748:      	movz	x12, #0x0, lsl #48
    c74c:      	b	0xc75c <_stogir.stack.entry-allocation?+0xac>
    c750:      	movz	x12, #0x0, lsl #48
    c754:      	b	0xc75c <_stogir.stack.entry-allocation?+0xac>
    c758:      	movz	x12, #0x0, lsl #48
    c75c:      	cmp	x12, #0x0
    c760:      	b.eq	0xc79c <_stogir.stack.entry-allocation?+0xec>
    c764:      	uxtb	w16, w11
    c768:      	cmp	w16, wzr
    c76c:      	b.eq	0xc784 <_stogir.stack.entry-allocation?+0xd4>
    c770:      	ldr	x11, [x0]
    c774:      	add	x10, x11, x10, lsl #4
    c778:      	ldr	x11, [x10]
    c77c:      	ldr	x10, [x10, #0x8]
    c780:      	b	0xc794 <_stogir.stack.entry-allocation?+0xe4>
    c784:      	ldr	x10, [x0, #0x28]
    c788:      	add	x10, x10, x13, lsl #4
    c78c:      	ldr	x11, [x10]
    c790:      	ldr	x10, [x10, #0x8]
    c794:      	mov	w12, #0x1               ; =1
    c798:      	b	0xc7a8 <_stogir.stack.entry-allocation?+0xf8>
    c79c:      	movz	w12, #0x0, lsl #16
    c7a0:      	movz	x11, #0x0, lsl #48
    c7a4:      	movz	x10, #0x0, lsl #48
    c7a8:      	ubfx	x12, x12, #0, #32
    c7ac:      	lsr	x16, x12, #0
    c7b0:      	cmp	x16, #0x1
    c7b4:      	b.eq	0xc7d0 <_stogir.stack.entry-allocation?+0x120>
    c7b8:      	b.lo	0xc7c0 <_stogir.stack.entry-allocation?+0x110>
    c7bc:      	b	0xc7d4 <_stogir.stack.entry-allocation?+0x124>
    c7c0:      	cmp	x16, #0x0
    c7c4:      	b.eq	0xc7cc <_stogir.stack.entry-allocation?+0x11c>
    c7c8:      	b	0xc7d4 <_stogir.stack.entry-allocation?+0x124>
    c7cc:      	b	0xc7d8 <_stogir.stack.entry-allocation?+0x128>
    c7d0:      	b	0xc88c <_stogir.stack.entry-allocation?+0x1dc>
    c7d4:      	b	0xc95c <_stogir.stack.entry-allocation?+0x2ac>
    c7d8:      	movz	x8, #0x0, lsl #48
    c7dc:      	cmp	x8, #0x0
    c7e0:      	b.eq	0xc944 <_stogir.stack.entry-allocation?+0x294>
    c7e4:      	cmp	x9, #0x0
    c7e8:      	b.ne	0xc944 <_stogir.stack.entry-allocation?+0x294>
    c7ec:      	orr	w10, w1, wzr
    c7f0:      	sxtw	x10, w10
    c7f4:      	cmp	x10, #0x0
    c7f8:      	cset	w11, gt
    c7fc:      	movz	x16, #0x0, lsl #48
    c800:      	sub	x12, x16, x10
    c804:      	sub	x13, x12, #0x1
    c808:      	uxtb	w16, w11
    c80c:      	cmp	w16, wzr
    c810:      	b.eq	0xc84c <_stogir.stack.entry-allocation?+0x19c>
    c814:      	ldr	x12, [x0, #0x8]
    c818:      	cmp	x10, x12
    c81c:      	b.ge	0xc750 <_stogir.stack.entry-allocation?+0xa0>
    c820:      	ldr	x12, [x2, #0x8]
    c824:      	cmp	x10, x12
    c828:      	b.ge	0xc740 <_stogir.stack.entry-allocation?+0x90>
    c82c:      	ldr	x12, [x0, #0x78]
    c830:      	add	x12, x12, x10, lsl #2
    c834:      	ldr	w12, [x12]
    c838:      	sxtw	x12, w12
    c83c:      	cmp	x12, #0x0
    c840:      	cset	w12, ge
    c844:      	ubfx	x12, x12, #0, #8
    c848:      	b	0xc744 <_stogir.stack.entry-allocation?+0x94>
    c84c:      	cmp	x10, #0x0
    c850:      	b.ge	0xc758 <_stogir.stack.entry-allocation?+0xa8>
    c854:      	ldr	x14, [x3, #0x8]
    c858:      	ldr	x15, [x4, #0x8]
    c85c:      	cmp	x14, x15
    c860:      	b.ne	0xc748 <_stogir.stack.entry-allocation?+0x98>
    c864:      	cmp	x12, x14
    c868:      	b.gt	0xc6dc <_stogir.stack.entry-allocation?+0x2c>
    c86c:      	ldr	x12, [x0, #0x50]
    c870:      	add	x12, x12, x13, lsl #2
    c874:      	ldr	w12, [x12]
    c878:      	sxtw	x12, w12
    c87c:      	cmp	x12, #0x0
    c880:      	cset	w12, gt
    c884:      	ubfx	x12, x12, #0, #8
    c888:      	b	0xc6e0 <_stogir.stack.entry-allocation?+0x30>
    c88c:      	uxtb	w12, w11
    c890:      	asr	x13, x11, #32
    c894:      	mov	x16, sp
    c898:      	str	x11, [x16]
    c89c:      	mov	x16, sp
    c8a0:      	str	x10, [x16, #0x8]
    c8a4:      	cmp	x12, #0x68
    c8a8:      	b.ne	0xc8c0 <_stogir.stack.entry-allocation?+0x210>
    c8ac:      	cmp	x13, #0x0
    c8b0:      	cset	w8, eq
    c8b4:      	ubfx	x8, x8, #0, #8
    c8b8:      	mov	x9, #0x1                ; =1
    c8bc:      	b	0xc7dc <_stogir.stack.entry-allocation?+0x12c>
    c8c0:      	cmp	x1, #0x0
    c8c4:      	b.le	0xc738 <_stogir.stack.entry-allocation?+0x88>
    c8c8:      	cmp	x12, #0x51
    c8cc:      	b.ne	0xc738 <_stogir.stack.entry-allocation?+0x88>
    c8d0:      	cmp	x13, #0x0
    c8d4:      	b.le	0xc738 <_stogir.stack.entry-allocation?+0x88>
    c8d8:      	cmp	x13, x1
    c8dc:      	b.ge	0xc738 <_stogir.stack.entry-allocation?+0x88>
    c8e0:      	sxtw	x10, w10
    c8e4:      	cmp	x10, #0x0
    c8e8:      	b.ge	0xc738 <_stogir.stack.entry-allocation?+0x88>
    c8ec:      	cmp	x10, #0x0
    c8f0:      	cset	w11, gt
    c8f4:      	movz	x16, #0x0, lsl #48
    c8f8:      	sub	x12, x16, x10
    c8fc:      	sub	x13, x12, #0x1
    c900:      	uxtb	w16, w11
    c904:      	cmp	w16, wzr
    c908:      	b.eq	0xc9a8 <_stogir.stack.entry-allocation?+0x2f8>
    c90c:      	ldr	x12, [x0, #0x8]
    c910:      	cmp	x10, x12
    c914:      	b.ge	0xc9a0 <_stogir.stack.entry-allocation?+0x2f0>
    c918:      	ldr	x12, [x5, #0x8]
    c91c:      	cmp	x10, x12
    c920:      	b.ge	0xc9e8 <_stogir.stack.entry-allocation?+0x338>
    c924:      	ldr	x12, [x0, #0x78]
    c928:      	add	x12, x12, x10, lsl #2
    c92c:      	ldr	w12, [x12]
    c930:      	sxtw	x12, w12
    c934:      	cmp	x12, #0x0
    c938:      	cset	w12, ge
    c93c:      	ubfx	x12, x12, #0, #8
    c940:      	b	0xc9ec <_stogir.stack.entry-allocation?+0x33c>
    c944:      	cmp	x8, #0x0
    c948:      	b.ne	0xc950 <_stogir.stack.entry-allocation?+0x2a0>
    c94c:      	movz	x9, #0x0, lsl #48
    c950:      	mov	x0, x9
    c954:      	add	sp, sp, #0x10
    c958:      	ret
    c95c:      	brk	#0
    c960:      	b	0xc95c <_stogir.stack.entry-allocation?+0x2ac>
    c964:      	ldr	x10, [x0, #0x28]
    c968:      	add	x10, x10, x13, lsl #4
    c96c:      	ldr	x10, [x10]
    c970:      	mov	w11, #0x1               ; =1
    c974:      	b	0xc6ec <_stogir.stack.entry-allocation?+0x3c>
    c978:      	movz	x12, #0x0, lsl #48
    c97c:      	cmp	x12, #0x0
    c980:      	b.eq	0xc6e4 <_stogir.stack.entry-allocation?+0x34>
    c984:      	uxtb	w16, w11
    c988:      	cmp	w16, wzr
    c98c:      	b.eq	0xc964 <_stogir.stack.entry-allocation?+0x2b4>
    c990:      	ldr	x11, [x0]
    c994:      	add	x10, x11, x10, lsl #4
    c998:      	ldr	x10, [x10]
    c99c:      	b	0xc970 <_stogir.stack.entry-allocation?+0x2c0>
    c9a0:      	movz	x12, #0x0, lsl #48
    c9a4:      	b	0xc97c <_stogir.stack.entry-allocation?+0x2cc>
    c9a8:      	ldr	x14, [x6, #0x8]
    c9ac:      	ldr	x15, [x7, #0x8]
    c9b0:      	cmp	x14, x15
    c9b4:      	b.ne	0xc978 <_stogir.stack.entry-allocation?+0x2c8>
    c9b8:      	cmp	x12, x14
    c9bc:      	b.gt	0xc9e0 <_stogir.stack.entry-allocation?+0x330>
    c9c0:      	ldr	x12, [x0, #0x50]
    c9c4:      	add	x12, x12, x13, lsl #2
    c9c8:      	ldr	w12, [x12]
    c9cc:      	sxtw	x12, w12
    c9d0:      	cmp	x12, #0x0
    c9d4:      	cset	w12, gt
    c9d8:      	ubfx	x12, x12, #0, #8
    c9dc:      	b	0xc9e4 <_stogir.stack.entry-allocation?+0x334>
    c9e0:      	movz	x12, #0x0, lsl #48
    c9e4:      	b	0xc97c <_stogir.stack.entry-allocation?+0x2cc>
    c9e8:      	movz	x12, #0x0, lsl #48
    c9ec:      	b	0xc9a4 <_stogir.stack.entry-allocation?+0x2f4>
    c9f0:      	mov	x16, sp
    c9f4:      	ldr	w1, [x16, #0x4]
    c9f8:      	sxtw	x1, w1
    c9fc:      	b	0xc73c <_stogir.stack.entry-allocation?+0x8c>
    ca00:      	brk	#0
    ca04:      	b	0xca00 <_stogir.stack.entry-allocation?+0x350>

000000000000ca08 <_stogir.stack.constant-size-aligned>:
    ca08:      	sub	sp, sp, #0x10
    ca0c:      	cmp	x2, #0x10
    ca10:      	b.lt	0xca8c <_stogir.stack.constant-size-aligned+0x84>
    ca14:      	cmp	x2, #0x0
    ca18:      	b.le	0xca8c <_stogir.stack.constant-size-aligned+0x84>
    ca1c:      	sub	x3, x2, #0x1
    ca20:      	and	x3, x3, x2
    ca24:      	cmp	x3, #0x0
    ca28:      	b.ne	0xca8c <_stogir.stack.constant-size-aligned+0x84>
    ca2c:      	sxtw	x1, w1
    ca30:      	cmp	x1, #0x0
    ca34:      	cset	w3, gt
    ca38:      	movz	x16, #0x0, lsl #48
    ca3c:      	sub	x4, x16, x1
    ca40:      	sub	x5, x4, #0x1
    ca44:      	uxtb	w16, w3
    ca48:      	cmp	w16, wzr
    ca4c:      	b.eq	0xcb24 <_stogir.stack.constant-size-aligned+0x11c>
    ca50:      	ldr	x4, [x0, #0x8]
    ca54:      	cmp	x1, x4
    ca58:      	b.ge	0xcb6c <_stogir.stack.constant-size-aligned+0x164>
    ca5c:      	add	x4, x0, #0x78
    ca60:      	ldr	x4, [x4, #0x8]
    ca64:      	cmp	x1, x4
    ca68:      	b.ge	0xcc40 <_stogir.stack.constant-size-aligned+0x238>
    ca6c:      	ldr	x4, [x0, #0x78]
    ca70:      	add	x4, x4, x1, lsl #2
    ca74:      	ldr	w4, [x4]
    ca78:      	sxtw	x4, w4
    ca7c:      	cmp	x4, #0x0
    ca80:      	cset	w4, ge
    ca84:      	ubfx	x4, x4, #0, #8
    ca88:      	b	0xcc44 <_stogir.stack.constant-size-aligned+0x23c>
    ca8c:      	adrp	x16, 0xc000 <_stogir.vector-arithmetic.operands+0x408>
		000000000000ca8c:  ARM64_RELOC_PAGE21	l_stogir.502
    ca90:      	ldr	x16, [x16]
		000000000000ca90:  ARM64_RELOC_PAGEOFF12	l_stogir.502
    ca94:      	orr	x0, x16, xzr
    ca98:      	mov	x1, #0x1                ; =1
    ca9c:      	mov	x2, #0x20               ; =32
    caa0:      	str	x1, [x8]
    caa4:      	str	x0, [x8, #0x8]
    caa8:      	str	x2, [x8, #0x10]
    caac:      	add	sp, sp, #0x10
    cab0:      	ret
    cab4:      	mov	w3, #0x1                ; =1
    cab8:      	mov	x16, sp
    cabc:      	ldr	w4, [x16, #0x8]
    cac0:      	mov	x16, sp
    cac4:      	ldr	w5, [x16, #0xc]
    cac8:      	cmp	x1, #0x0
    cacc:      	b.ge	0xcb0c <_stogir.stack.constant-size-aligned+0x104>
    cad0:      	cmp	x0, #0x1
    cad4:      	b.lt	0xcb0c <_stogir.stack.constant-size-aligned+0x104>
    cad8:      	cmp	x0, #0xb
    cadc:      	cset	w1, le
    cae0:      	uxtb	w16, w1
    cae4:      	cmp	w16, wzr
    cae8:      	b.eq	0xcb0c <_stogir.stack.constant-size-aligned+0x104>
    caec:      	mov	x16, sp
    caf0:      	ldr	w6, [x16]
    caf4:      	uxtb	w7, w6
    caf8:      	ubfx	x6, x6, #8, #8
    cafc:      	cmp	x7, x6
    cb00:      	b.eq	0xccd0 <_stogir.stack.constant-size-aligned+0x2c8>
    cb04:      	cmp	x7, #0x49
    cb08:      	b.eq	0xccd0 <_stogir.stack.constant-size-aligned+0x2c8>
    cb0c:      	adrp	x16, 0xc000 <_stogir.vector-arithmetic.operands+0x408>
		000000000000cb0c:  ARM64_RELOC_PAGE21	l_stogir.503
    cb10:      	ldr	x16, [x16]
		000000000000cb10:  ARM64_RELOC_PAGEOFF12	l_stogir.503
    cb14:      	orr	x0, x16, xzr
    cb18:      	mov	x1, #0x1                ; =1
    cb1c:      	mov	x2, #0x30               ; =48
    cb20:      	b	0xcaa0 <_stogir.stack.constant-size-aligned+0x98>
    cb24:      	cmp	x1, #0x0
    cb28:      	b.ge	0xcb74 <_stogir.stack.constant-size-aligned+0x16c>
    cb2c:      	add	x6, x0, #0x28
    cb30:      	add	x7, x0, #0x50
    cb34:      	ldr	x6, [x6, #0x8]
    cb38:      	ldr	x7, [x7, #0x8]
    cb3c:      	cmp	x6, x7
    cb40:      	b.ne	0xcc38 <_stogir.stack.constant-size-aligned+0x230>
    cb44:      	cmp	x4, x6
    cb48:      	b.gt	0xccc8 <_stogir.stack.constant-size-aligned+0x2c0>
    cb4c:      	ldr	x4, [x0, #0x50]
    cb50:      	add	x4, x4, x5, lsl #2
    cb54:      	ldr	w4, [x4]
    cb58:      	sxtw	x4, w4
    cb5c:      	cmp	x4, #0x0
    cb60:      	cset	w4, gt
    cb64:      	ubfx	x4, x4, #0, #8
    cb68:      	b	0xcccc <_stogir.stack.constant-size-aligned+0x2c4>
    cb6c:      	movz	x4, #0x0, lsl #48
    cb70:      	b	0xcb78 <_stogir.stack.constant-size-aligned+0x170>
    cb74:      	movz	x4, #0x0, lsl #48
    cb78:      	cmp	x4, #0x0
    cb7c:      	b.eq	0xcbb8 <_stogir.stack.constant-size-aligned+0x1b0>
    cb80:      	uxtb	w16, w3
    cb84:      	cmp	w16, wzr
    cb88:      	b.eq	0xcba0 <_stogir.stack.constant-size-aligned+0x198>
    cb8c:      	ldr	x0, [x0]
    cb90:      	add	x0, x0, x1, lsl #4
    cb94:      	ldr	x3, [x0]
    cb98:      	ldr	x0, [x0, #0x8]
    cb9c:      	b	0xcbb0 <_stogir.stack.constant-size-aligned+0x1a8>
    cba0:      	ldr	x0, [x0, #0x28]
    cba4:      	add	x0, x0, x5, lsl #4
    cba8:      	ldr	x3, [x0]
    cbac:      	ldr	x0, [x0, #0x8]
    cbb0:      	mov	w4, #0x1                ; =1
    cbb4:      	b	0xcbc4 <_stogir.stack.constant-size-aligned+0x1bc>
    cbb8:      	movz	w4, #0x0, lsl #16
    cbbc:      	movz	x3, #0x0, lsl #48
    cbc0:      	movz	x0, #0x0, lsl #48
    cbc4:      	ubfx	x4, x4, #0, #32
    cbc8:      	lsr	x16, x4, #0
    cbcc:      	cmp	x16, #0x1
    cbd0:      	b.eq	0xcbec <_stogir.stack.constant-size-aligned+0x1e4>
    cbd4:      	b.lo	0xcbdc <_stogir.stack.constant-size-aligned+0x1d4>
    cbd8:      	b	0xcbf0 <_stogir.stack.constant-size-aligned+0x1e8>
    cbdc:      	cmp	x16, #0x0
    cbe0:      	b.eq	0xcbe8 <_stogir.stack.constant-size-aligned+0x1e0>
    cbe4:      	b	0xcbf0 <_stogir.stack.constant-size-aligned+0x1e8>
    cbe8:      	b	0xcbf4 <_stogir.stack.constant-size-aligned+0x1ec>
    cbec:      	b	0xcc0c <_stogir.stack.constant-size-aligned+0x204>
    cbf0:      	b	0xcd74 <_stogir.stack.constant-size-aligned+0x36c>
    cbf4:      	adrp	x16, 0xc000 <_stogir.vector-arithmetic.operands+0x408>
		000000000000cbf4:  ARM64_RELOC_PAGE21	l_stogir.504
    cbf8:      	ldr	x16, [x16]
		000000000000cbf8:  ARM64_RELOC_PAGEOFF12	l_stogir.504
    cbfc:      	orr	x0, x16, xzr
    cc00:      	mov	x1, #0x1                ; =1
    cc04:      	mov	x2, #0x18               ; =24
    cc08:      	b	0xcb20 <_stogir.stack.constant-size-aligned+0x118>
    cc0c:      	orr	w4, w3, wzr
    cc10:      	mov	x16, sp
    cc14:      	str	x3, [x16]
    cc18:      	ubfx	x4, x4, #0, #32
    cc1c:      	mov	x16, sp
    cc20:      	str	x0, [x16, #0x8]
    cc24:      	ubfx	x0, x4, #8, #8
    cc28:      	cmp	x0, #0x0
    cc2c:      	b.ne	0xcc48 <_stogir.stack.constant-size-aligned+0x240>
    cc30:      	movz	w3, #0x0, lsl #16
    cc34:      	b	0xcab8 <_stogir.stack.constant-size-aligned+0xb0>
    cc38:      	movz	x4, #0x0, lsl #48
    cc3c:      	b	0xcb78 <_stogir.stack.constant-size-aligned+0x170>
    cc40:      	movz	x4, #0x0, lsl #48
    cc44:      	b	0xcb70 <_stogir.stack.constant-size-aligned+0x168>
    cc48:      	cmp	x0, #0x1
    cc4c:      	b.eq	0xcab4 <_stogir.stack.constant-size-aligned+0xac>
    cc50:      	cmp	x0, #0x2
    cc54:      	b.eq	0xcab4 <_stogir.stack.constant-size-aligned+0xac>
    cc58:      	cmp	x0, #0x7
    cc5c:      	b.eq	0xcab4 <_stogir.stack.constant-size-aligned+0xac>
    cc60:      	cmp	x0, #0x8
    cc64:      	b.eq	0xcab4 <_stogir.stack.constant-size-aligned+0xac>
    cc68:      	cmp	x0, #0x3
    cc6c:      	b.eq	0xcd6c <_stogir.stack.constant-size-aligned+0x364>
    cc70:      	cmp	x0, #0x9
    cc74:      	b.eq	0xcd6c <_stogir.stack.constant-size-aligned+0x364>
    cc78:      	cmp	x0, #0x4
    cc7c:      	b.eq	0xcd7c <_stogir.stack.constant-size-aligned+0x374>
    cc80:      	cmp	x0, #0xa
    cc84:      	b.eq	0xcd7c <_stogir.stack.constant-size-aligned+0x374>
    cc88:      	cmp	x0, #0xd
    cc8c:      	b.eq	0xcd7c <_stogir.stack.constant-size-aligned+0x374>
    cc90:      	cmp	x0, #0x5
    cc94:      	b.eq	0xcd84 <_stogir.stack.constant-size-aligned+0x37c>
    cc98:      	cmp	x0, #0xb
    cc9c:      	b.eq	0xcd84 <_stogir.stack.constant-size-aligned+0x37c>
    cca0:      	cmp	x0, #0xc
    cca4:      	b.eq	0xcd84 <_stogir.stack.constant-size-aligned+0x37c>
    cca8:      	cmp	x0, #0x6
    ccac:      	cset	w3, eq
    ccb0:      	uxtb	w16, w3
    ccb4:      	cmp	w16, wzr
    ccb8:      	mov	w16, #0x8               ; =8
    ccbc:      	movn	w17, #0x0, lsl #16
    ccc0:      	csel	w3, w16, w17, ne
    ccc4:      	b	0xcd88 <_stogir.stack.constant-size-aligned+0x380>
    ccc8:      	movz	x4, #0x0, lsl #48
    cccc:      	b	0xcc3c <_stogir.stack.constant-size-aligned+0x234>
    ccd0:      	sxtw	x6, w3
    ccd4:      	cmp	x6, #0x0
    ccd8:      	b.le	0xcb0c <_stogir.stack.constant-size-aligned+0x104>
    ccdc:      	lsl	w3, w3, #3
    cce0:      	ubfx	x4, x4, #0, #32
    cce4:      	ubfx	x5, x5, #0, #32
    cce8:      	lsl	x5, x5, #32
    ccec:      	orr	x4, x5, x4
    ccf0:      	cmp	x6, #0x8
    ccf4:      	b.ge	0xcd08 <_stogir.stack.constant-size-aligned+0x300>
    ccf8:      	sxtw	x5, w3
    ccfc:      	lsr	x5, x4, x5
    cd00:      	cmp	x5, #0x0
    cd04:      	b.ne	0xcb0c <_stogir.stack.constant-size-aligned+0x104>
    cd08:      	cmp	x0, #0x7
    cd0c:      	b.lt	0xcd38 <_stogir.stack.constant-size-aligned+0x330>
    cd10:      	uxtb	w16, w1
    cd14:      	cmp	w16, wzr
    cd18:      	b.eq	0xcd38 <_stogir.stack.constant-size-aligned+0x330>
    cd1c:      	sub	w0, w3, #0x1
    cd20:      	sxtw	x0, w0
    cd24:      	mov	x16, #0x1               ; =1
    cd28:      	lsl	x0, x16, x0
    cd2c:      	and	x0, x0, x4
    cd30:      	cmp	x0, #0x0
    cd34:      	b.ne	0xcb0c <_stogir.stack.constant-size-aligned+0x104>
    cd38:      	sub	x0, x2, #0x1
    cd3c:      	mov	x16, #0x7fffffffffffffff ; =9223372036854775807
    cd40:      	sub	x0, x16, x0
    cd44:      	cmp	x4, x0
    cd48:      	b.hi	0xcb0c <_stogir.stack.constant-size-aligned+0x104>
    cd4c:      	sub	x0, x2, #0x1
    cd50:      	movz	x16, #0x0, lsl #48
    cd54:      	sub	x1, x16, x2
    cd58:      	add	x0, x0, x4
    cd5c:      	and	x0, x1, x0
    cd60:      	movz	x1, #0x0, lsl #48
    cd64:      	movz	x2, #0x0, lsl #48
    cd68:      	b	0xcb20 <_stogir.stack.constant-size-aligned+0x118>
    cd6c:      	mov	w3, #0x2                ; =2
    cd70:      	b	0xcab8 <_stogir.stack.constant-size-aligned+0xb0>
    cd74:      	brk	#0
    cd78:      	b	0xcd74 <_stogir.stack.constant-size-aligned+0x36c>
    cd7c:      	mov	w3, #0x4                ; =4
    cd80:      	b	0xcd70 <_stogir.stack.constant-size-aligned+0x368>
    cd84:      	mov	w3, #0x8                ; =8
    cd88:      	b	0xcd80 <_stogir.stack.constant-size-aligned+0x378>

000000000000cd8c <_stogir.vector-lanes.compatible?>:
    cd8c:      	and	w3, w0, #0xf
    cd90:      	sxtw	x0, w0
    cd94:      	ubfx	x4, x3, #0, #32
    cd98:      	cmp	x0, #0xf
    cd9c:      	cset	w5, gt
    cda0:      	cmp	x0, #0x80
    cda4:      	cset	w6, lt
    cda8:      	cmp	x4, #0x1
    cdac:      	cset	w7, ge
    cdb0:      	cmp	x4, #0xd
    cdb4:      	cset	w4, le
    cdb8:      	cmp	x0, #0x0
    cdbc:      	b.lt	0xcdc8 <_stogir.vector-lanes.compatible?+0x3c>
    cdc0:      	cmp	x0, #0xd
    cdc4:      	b.le	0xcdfc <_stogir.vector-lanes.compatible?+0x70>
    cdc8:      	uxtb	w16, w5
    cdcc:      	cmp	w16, wzr
    cdd0:      	b.eq	0xcdf8 <_stogir.vector-lanes.compatible?+0x6c>
    cdd4:      	uxtb	w16, w6
    cdd8:      	cmp	w16, wzr
    cddc:      	b.eq	0xcdf8 <_stogir.vector-lanes.compatible?+0x6c>
    cde0:      	uxtb	w16, w7
    cde4:      	cmp	w16, wzr
    cde8:      	b.eq	0xcdf8 <_stogir.vector-lanes.compatible?+0x6c>
    cdec:      	uxtb	w16, w4
    cdf0:      	cmp	w16, wzr
    cdf4:      	b.ne	0xcdfc <_stogir.vector-lanes.compatible?+0x70>
    cdf8:      	movn	w3, #0x0, lsl #16
    cdfc:      	uxtb	w16, w5
    ce00:      	cmp	w16, wzr
    ce04:      	b.eq	0xce60 <_stogir.vector-lanes.compatible?+0xd4>
    ce08:      	uxtb	w16, w6
    ce0c:      	cmp	w16, wzr
    ce10:      	b.eq	0xce60 <_stogir.vector-lanes.compatible?+0xd4>
    ce14:      	uxtb	w16, w7
    ce18:      	cmp	w16, wzr
    ce1c:      	b.eq	0xce60 <_stogir.vector-lanes.compatible?+0xd4>
    ce20:      	uxtb	w16, w4
    ce24:      	cmp	w16, wzr
    ce28:      	b.eq	0xce60 <_stogir.vector-lanes.compatible?+0xd4>
    ce2c:      	sxtw	x0, w2
    ce30:      	cmp	x0, #0x4
    ce34:      	cset	w4, eq
    ce38:      	cmp	x0, #0x8
    ce3c:      	cset	w0, eq
    ce40:      	uxtb	w16, w4
    ce44:      	cmp	w16, wzr
    ce48:      	b.ne	0xce70 <_stogir.vector-lanes.compatible?+0xe4>
    ce4c:      	uxtb	w16, w0
    ce50:      	cmp	w16, wzr
    ce54:      	b.ne	0xce70 <_stogir.vector-lanes.compatible?+0xe4>
    ce58:      	movz	x0, #0x0, lsl #48
    ce5c:      	b	0xce6c <_stogir.vector-lanes.compatible?+0xe0>
    ce60:      	movz	x0, #0x0, lsl #48
    ce64:      	ret
    ce68:      	movz	x0, #0x0, lsl #48
    ce6c:      	b	0xce64 <_stogir.vector-lanes.compatible?+0xd8>
    ce70:      	sxtw	x1, w1
    ce74:      	cmp	x1, #0x0
    ce78:      	b.lt	0xce68 <_stogir.vector-lanes.compatible?+0xdc>
    ce7c:      	cmp	x1, #0xd
    ce80:      	b.gt	0xce68 <_stogir.vector-lanes.compatible?+0xdc>
    ce84:      	cmp	x1, #0x0
    ce88:      	b.le	0xcea0 <_stogir.vector-lanes.compatible?+0x114>
    ce8c:      	sxtw	x3, w3
    ce90:      	cmp	x3, x1
    ce94:      	b.ne	0xcea8 <_stogir.vector-lanes.compatible?+0x11c>
    ce98:      	mov	x0, #0x1                ; =1
    ce9c:      	b	0xcea4 <_stogir.vector-lanes.compatible?+0x118>
    cea0:      	movz	x0, #0x0, lsl #48
    cea4:      	b	0xce6c <_stogir.vector-lanes.compatible?+0xe0>
    cea8:      	cmp	x3, #0x1
    ceac:      	b.lt	0xcee8 <_stogir.vector-lanes.compatible?+0x15c>
    ceb0:      	cmp	x3, #0xb
    ceb4:      	b.gt	0xcee8 <_stogir.vector-lanes.compatible?+0x15c>
    ceb8:      	cmp	x1, #0x1
    cebc:      	b.lt	0xcef0 <_stogir.vector-lanes.compatible?+0x164>
    cec0:      	cmp	x1, #0xb
    cec4:      	b.gt	0xcef0 <_stogir.vector-lanes.compatible?+0x164>
    cec8:      	uxtb	w16, w4
    cecc:      	cmp	w16, wzr
    ced0:      	b.ne	0xcf14 <_stogir.vector-lanes.compatible?+0x188>
    ced4:      	uxtb	w16, w0
    ced8:      	cmp	w16, wzr
    cedc:      	b.ne	0xcf14 <_stogir.vector-lanes.compatible?+0x188>
    cee0:      	movn	w3, #0x0, lsl #16
    cee4:      	b	0xcf28 <_stogir.vector-lanes.compatible?+0x19c>
    cee8:      	movz	x0, #0x0, lsl #48
    ceec:      	b	0xce9c <_stogir.vector-lanes.compatible?+0x110>
    cef0:      	movz	x0, #0x0, lsl #48
    cef4:      	b	0xceec <_stogir.vector-lanes.compatible?+0x160>
    cef8:      	mov	w2, #0x1                ; =1
    cefc:      	sxtw	x3, w3
    cf00:      	sxtw	x2, w2
    cf04:      	cmp	x3, x2
    cf08:      	cset	w0, eq
    cf0c:      	ubfx	x0, x0, #0, #8
    cf10:      	b	0xcef4 <_stogir.vector-lanes.compatible?+0x168>
    cf14:      	cmp	x3, #0x0
    cf18:      	b.ne	0xcfc8 <_stogir.vector-lanes.compatible?+0x23c>
    cf1c:      	movz	w3, #0x0, lsl #16
    cf20:      	b	0xcf28 <_stogir.vector-lanes.compatible?+0x19c>
    cf24:      	mov	w3, #0x1                ; =1
    cf28:      	uxtb	w16, w4
    cf2c:      	cmp	w16, wzr
    cf30:      	b.ne	0xcf48 <_stogir.vector-lanes.compatible?+0x1bc>
    cf34:      	uxtb	w16, w0
    cf38:      	cmp	w16, wzr
    cf3c:      	b.ne	0xcf48 <_stogir.vector-lanes.compatible?+0x1bc>
    cf40:      	movn	w2, #0x0, lsl #16
    cf44:      	b	0xcefc <_stogir.vector-lanes.compatible?+0x170>
    cf48:      	cmp	x1, #0x0
    cf4c:      	b.ne	0xcf58 <_stogir.vector-lanes.compatible?+0x1cc>
    cf50:      	movz	w2, #0x0, lsl #16
    cf54:      	b	0xcefc <_stogir.vector-lanes.compatible?+0x170>
    cf58:      	cmp	x1, #0x1
    cf5c:      	b.eq	0xcef8 <_stogir.vector-lanes.compatible?+0x16c>
    cf60:      	cmp	x1, #0x2
    cf64:      	b.eq	0xcef8 <_stogir.vector-lanes.compatible?+0x16c>
    cf68:      	cmp	x1, #0x7
    cf6c:      	b.eq	0xcef8 <_stogir.vector-lanes.compatible?+0x16c>
    cf70:      	cmp	x1, #0x8
    cf74:      	b.eq	0xcef8 <_stogir.vector-lanes.compatible?+0x16c>
    cf78:      	cmp	x1, #0x3
    cf7c:      	b.eq	0xd038 <_stogir.vector-lanes.compatible?+0x2ac>
    cf80:      	cmp	x1, #0x9
    cf84:      	b.eq	0xd038 <_stogir.vector-lanes.compatible?+0x2ac>
    cf88:      	cmp	x1, #0x4
    cf8c:      	b.eq	0xd048 <_stogir.vector-lanes.compatible?+0x2bc>
    cf90:      	cmp	x1, #0xa
    cf94:      	b.eq	0xd048 <_stogir.vector-lanes.compatible?+0x2bc>
    cf98:      	cmp	x1, #0xd
    cf9c:      	b.eq	0xd048 <_stogir.vector-lanes.compatible?+0x2bc>
    cfa0:      	cmp	x1, #0x5
    cfa4:      	b.eq	0xd058 <_stogir.vector-lanes.compatible?+0x2cc>
    cfa8:      	cmp	x1, #0xb
    cfac:      	b.eq	0xd058 <_stogir.vector-lanes.compatible?+0x2cc>
    cfb0:      	cmp	x1, #0xc
    cfb4:      	b.eq	0xd058 <_stogir.vector-lanes.compatible?+0x2cc>
    cfb8:      	cmp	x1, #0x6
    cfbc:      	b.eq	0xcfc4 <_stogir.vector-lanes.compatible?+0x238>
    cfc0:      	movn	w2, #0x0, lsl #16
    cfc4:      	b	0xd05c <_stogir.vector-lanes.compatible?+0x2d0>
    cfc8:      	cmp	x3, #0x1
    cfcc:      	b.eq	0xcf24 <_stogir.vector-lanes.compatible?+0x198>
    cfd0:      	cmp	x3, #0x2
    cfd4:      	b.eq	0xcf24 <_stogir.vector-lanes.compatible?+0x198>
    cfd8:      	cmp	x3, #0x7
    cfdc:      	b.eq	0xcf24 <_stogir.vector-lanes.compatible?+0x198>
    cfe0:      	cmp	x3, #0x8
    cfe4:      	b.eq	0xcf24 <_stogir.vector-lanes.compatible?+0x198>
    cfe8:      	cmp	x3, #0x3
    cfec:      	b.eq	0xd040 <_stogir.vector-lanes.compatible?+0x2b4>
    cff0:      	cmp	x3, #0x9
    cff4:      	b.eq	0xd040 <_stogir.vector-lanes.compatible?+0x2b4>
    cff8:      	cmp	x3, #0x4
    cffc:      	b.eq	0xd050 <_stogir.vector-lanes.compatible?+0x2c4>
    d000:      	cmp	x3, #0xa
    d004:      	b.eq	0xd050 <_stogir.vector-lanes.compatible?+0x2c4>
    d008:      	cmp	x3, #0xd
    d00c:      	b.eq	0xd050 <_stogir.vector-lanes.compatible?+0x2c4>
    d010:      	cmp	x3, #0x5
    d014:      	b.eq	0xd060 <_stogir.vector-lanes.compatible?+0x2d4>
    d018:      	cmp	x3, #0xb
    d01c:      	b.eq	0xd060 <_stogir.vector-lanes.compatible?+0x2d4>
    d020:      	cmp	x3, #0xc
    d024:      	b.eq	0xd060 <_stogir.vector-lanes.compatible?+0x2d4>
    d028:      	cmp	x3, #0x6
    d02c:      	b.ne	0xd068 <_stogir.vector-lanes.compatible?+0x2dc>
    d030:      	mov	w3, w2
    d034:      	b	0xd06c <_stogir.vector-lanes.compatible?+0x2e0>
    d038:      	mov	w2, #0x2                ; =2
    d03c:      	b	0xcefc <_stogir.vector-lanes.compatible?+0x170>
    d040:      	mov	w3, #0x2                ; =2
    d044:      	b	0xcf28 <_stogir.vector-lanes.compatible?+0x19c>
    d048:      	mov	w2, #0x4                ; =4
    d04c:      	b	0xd03c <_stogir.vector-lanes.compatible?+0x2b0>
    d050:      	mov	w3, #0x4                ; =4
    d054:      	b	0xd044 <_stogir.vector-lanes.compatible?+0x2b8>
    d058:      	mov	w2, #0x8                ; =8
    d05c:      	b	0xd04c <_stogir.vector-lanes.compatible?+0x2c0>
    d060:      	mov	w3, #0x8                ; =8
    d064:      	b	0xd054 <_stogir.vector-lanes.compatible?+0x2c8>
    d068:      	movn	w3, #0x0, lsl #16
    d06c:      	b	0xd064 <_stogir.vector-lanes.compatible?+0x2d8>

000000000000d070 <_stogir.vector-comparison.valid-type?>:
    d070:      	sxtw	x0, w0
    d074:      	cmp	x0, #0xe
    d078:      	b.lt	0xd110 <_stogir.vector-comparison.valid-type?+0xa0>
    d07c:      	cmp	x0, #0x19
    d080:      	b.gt	0xd110 <_stogir.vector-comparison.valid-type?+0xa0>
    d084:      	sxtw	x2, w1
    d088:      	cmp	x2, #0xf
    d08c:      	cset	w3, gt
    d090:      	uxtb	w16, w3
    d094:      	cmp	w16, wzr
    d098:      	b.eq	0xd118 <_stogir.vector-comparison.valid-type?+0xa8>
    d09c:      	cmp	x2, #0x80
    d0a0:      	cset	w4, lt
    d0a4:      	uxtb	w16, w4
    d0a8:      	cmp	w16, wzr
    d0ac:      	b.eq	0xd118 <_stogir.vector-comparison.valid-type?+0xa8>
    d0b0:      	and	w1, w1, #0xf
    d0b4:      	ubfx	x5, x1, #0, #32
    d0b8:      	cmp	x5, #0x1
    d0bc:      	cset	w6, ge
    d0c0:      	uxtb	w16, w6
    d0c4:      	cmp	w16, wzr
    d0c8:      	b.eq	0xd118 <_stogir.vector-comparison.valid-type?+0xa8>
    d0cc:      	cmp	x5, #0xd
    d0d0:      	cset	w5, le
    d0d4:      	uxtb	w16, w5
    d0d8:      	cmp	w16, wzr
    d0dc:      	b.eq	0xd118 <_stogir.vector-comparison.valid-type?+0xa8>
    d0e0:      	cmp	x2, #0x0
    d0e4:      	cset	w7, ge
    d0e8:      	cmp	x2, #0xd
    d0ec:      	cset	w2, le
    d0f0:      	uxtb	w16, w7
    d0f4:      	cmp	w16, wzr
    d0f8:      	b.eq	0xd128 <_stogir.vector-comparison.valid-type?+0xb8>
    d0fc:      	uxtb	w16, w2
    d100:      	cmp	w16, wzr
    d104:      	b.eq	0xd128 <_stogir.vector-comparison.valid-type?+0xb8>
    d108:      	mov	w8, w1
    d10c:      	b	0xd15c <_stogir.vector-comparison.valid-type?+0xec>
    d110:      	movz	x0, #0x0, lsl #48
    d114:      	ret
    d118:      	movz	x0, #0x0, lsl #48
    d11c:      	b	0xd114 <_stogir.vector-comparison.valid-type?+0xa4>
    d120:      	mov	x0, #0x1                ; =1
    d124:      	b	0xd11c <_stogir.vector-comparison.valid-type?+0xac>
    d128:      	uxtb	w16, w3
    d12c:      	cmp	w16, wzr
    d130:      	b.eq	0xd158 <_stogir.vector-comparison.valid-type?+0xe8>
    d134:      	uxtb	w16, w4
    d138:      	cmp	w16, wzr
    d13c:      	b.eq	0xd158 <_stogir.vector-comparison.valid-type?+0xe8>
    d140:      	uxtb	w16, w6
    d144:      	cmp	w16, wzr
    d148:      	b.eq	0xd158 <_stogir.vector-comparison.valid-type?+0xe8>
    d14c:      	uxtb	w16, w5
    d150:      	cmp	w16, wzr
    d154:      	b.ne	0xd108 <_stogir.vector-comparison.valid-type?+0x98>
    d158:      	movn	w8, #0x0, lsl #16
    d15c:      	sxtw	x8, w8
    d160:      	cmp	x8, #0xc
    d164:      	b.eq	0xd120 <_stogir.vector-comparison.valid-type?+0xb0>
    d168:      	cmp	x8, #0xd
    d16c:      	b.eq	0xd120 <_stogir.vector-comparison.valid-type?+0xb0>
    d170:      	uxtb	w16, w7
    d174:      	cmp	w16, wzr
    d178:      	b.eq	0xd188 <_stogir.vector-comparison.valid-type?+0x118>
    d17c:      	uxtb	w16, w2
    d180:      	cmp	w16, wzr
    d184:      	b.ne	0xd1bc <_stogir.vector-comparison.valid-type?+0x14c>
    d188:      	uxtb	w16, w3
    d18c:      	cmp	w16, wzr
    d190:      	b.eq	0xd1b8 <_stogir.vector-comparison.valid-type?+0x148>
    d194:      	uxtb	w16, w4
    d198:      	cmp	w16, wzr
    d19c:      	b.eq	0xd1b8 <_stogir.vector-comparison.valid-type?+0x148>
    d1a0:      	uxtb	w16, w6
    d1a4:      	cmp	w16, wzr
    d1a8:      	b.eq	0xd1b8 <_stogir.vector-comparison.valid-type?+0x148>
    d1ac:      	uxtb	w16, w5
    d1b0:      	cmp	w16, wzr
    d1b4:      	b.ne	0xd1bc <_stogir.vector-comparison.valid-type?+0x14c>
    d1b8:      	movn	w1, #0x0, lsl #16
    d1bc:      	sxtw	x1, w1
    d1c0:      	cmp	x1, #0x1
    d1c4:      	b.lt	0xd1e0 <_stogir.vector-comparison.valid-type?+0x170>
    d1c8:      	cmp	x1, #0xb
    d1cc:      	b.gt	0xd1e0 <_stogir.vector-comparison.valid-type?+0x170>
    d1d0:      	cmp	x0, #0x17
    d1d4:      	cset	w0, le
    d1d8:      	ubfx	x0, x0, #0, #8
    d1dc:      	b	0xd1e4 <_stogir.vector-comparison.valid-type?+0x174>
    d1e0:      	movz	x0, #0x0, lsl #48
    d1e4:      	b	0xd124 <_stogir.vector-comparison.valid-type?+0xb4>

000000000000d1e8 <_stogir.vector-arithmetic.valid-type?>:
    d1e8:      	sub	sp, sp, #0x30
    d1ec:      	str	x29, [sp]
    d1f0:      	str	x30, [sp, #0x8]
    d1f4:      	mov	x29, sp
    d1f8:      	str	x19, [sp, #0x10]
    d1fc:      	str	x20, [sp, #0x18]
    d200:      	str	x21, [sp, #0x20]
    d204:      	str	x22, [sp, #0x28]
    d208:      	sxtw	x2, w1
    d20c:      	and	w1, w1, #0xf
    d210:      	cmp	x2, #0xf
    d214:      	cset	w3, gt
    d218:      	cmp	x2, #0x80
    d21c:      	cset	w4, lt
    d220:      	ubfx	x5, x1, #0, #32
    d224:      	cmp	x5, #0x1
    d228:      	cset	w6, ge
    d22c:      	cmp	x5, #0xd
    d230:      	cset	w5, le
    d234:      	cmp	x2, #0x0
    d238:      	b.lt	0xd244 <_stogir.vector-arithmetic.valid-type?+0x5c>
    d23c:      	cmp	x2, #0xd
    d240:      	b.le	0xd278 <_stogir.vector-arithmetic.valid-type?+0x90>
    d244:      	uxtb	w16, w3
    d248:      	cmp	w16, wzr
    d24c:      	b.eq	0xd274 <_stogir.vector-arithmetic.valid-type?+0x8c>
    d250:      	uxtb	w16, w4
    d254:      	cmp	w16, wzr
    d258:      	b.eq	0xd274 <_stogir.vector-arithmetic.valid-type?+0x8c>
    d25c:      	uxtb	w16, w6
    d260:      	cmp	w16, wzr
    d264:      	b.eq	0xd274 <_stogir.vector-arithmetic.valid-type?+0x8c>
    d268:      	uxtb	w16, w5
    d26c:      	cmp	w16, wzr
    d270:      	b.ne	0xd278 <_stogir.vector-arithmetic.valid-type?+0x90>
    d274:      	movn	w1, #0x0, lsl #16
    d278:      	uxtb	w16, w3
    d27c:      	cmp	w16, wzr
    d280:      	b.eq	0xd468 <_stogir.vector-arithmetic.valid-type?+0x280>
    d284:      	uxtb	w16, w4
    d288:      	cmp	w16, wzr
    d28c:      	b.eq	0xd468 <_stogir.vector-arithmetic.valid-type?+0x280>
    d290:      	uxtb	w16, w6
    d294:      	cmp	w16, wzr
    d298:      	b.eq	0xd468 <_stogir.vector-arithmetic.valid-type?+0x280>
    d29c:      	uxtb	w16, w5
    d2a0:      	cmp	w16, wzr
    d2a4:      	b.eq	0xd468 <_stogir.vector-arithmetic.valid-type?+0x280>
    d2a8:      	sxtw	x2, w0
    d2ac:      	cmp	x2, #0x1f
    d2b0:      	cset	w19, eq
    d2b4:      	cmp	x2, #0x20
    d2b8:      	cset	w20, eq
    d2bc:      	cmp	x2, #0x2e
    d2c0:      	cset	w3, eq
    d2c4:      	cmp	x2, #0x2f
    d2c8:      	cset	w4, eq
    d2cc:      	cmp	x2, #0x30
    d2d0:      	cset	w5, eq
    d2d4:      	cmp	x2, #0x1e
    d2d8:      	cset	w6, eq
    d2dc:      	cmp	x2, #0x31
    d2e0:      	cset	w7, ge
    d2e4:      	cmp	x2, #0x35
    d2e8:      	cset	w8, le
    d2ec:      	cmp	x2, #0x3a
    d2f0:      	cset	w9, eq
    d2f4:      	cmp	x2, #0x3b
    d2f8:      	cset	w10, eq
    d2fc:      	cmp	x2, #0x2d
    d300:      	cset	w11, eq
    d304:      	cmp	x2, #0x36
    d308:      	cset	w12, eq
    d30c:      	cmp	x2, #0x37
    d310:      	cset	w13, eq
    d314:      	cmp	x2, #0x38
    d318:      	cset	w14, eq
    d31c:      	cmp	x2, #0x39
    d320:      	cset	w15, eq
    d324:      	uxtb	w16, w19
    d328:      	cmp	w16, wzr
    d32c:      	b.ne	0xd3a8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d330:      	uxtb	w16, w20
    d334:      	cmp	w16, wzr
    d338:      	b.ne	0xd3a8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d33c:      	uxtb	w16, w11
    d340:      	cmp	w16, wzr
    d344:      	b.ne	0xd3a8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d348:      	uxtb	w16, w12
    d34c:      	cmp	w16, wzr
    d350:      	b.ne	0xd3a8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d354:      	uxtb	w16, w13
    d358:      	cmp	w16, wzr
    d35c:      	b.ne	0xd3a8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d360:      	uxtb	w16, w14
    d364:      	cmp	w16, wzr
    d368:      	b.ne	0xd3a8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d36c:      	uxtb	w16, w15
    d370:      	cmp	w16, wzr
    d374:      	b.ne	0xd3a8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d378:      	uxtb	w16, w9
    d37c:      	cmp	w16, wzr
    d380:      	b.ne	0xd3a8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d384:      	uxtb	w16, w10
    d388:      	cmp	w16, wzr
    d38c:      	b.ne	0xd3a8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d390:      	uxtb	w16, w7
    d394:      	cmp	w16, wzr
    d398:      	b.eq	0xd574 <_stogir.vector-arithmetic.valid-type?+0x38c>
    d39c:      	uxtb	w16, w8
    d3a0:      	cmp	w16, wzr
    d3a4:      	b.eq	0xd574 <_stogir.vector-arithmetic.valid-type?+0x38c>
    d3a8:      	sxtw	x2, w1
    d3ac:      	cmp	x2, #0xc
    d3b0:      	cset	w21, eq
    d3b4:      	cmp	x2, #0xd
    d3b8:      	cset	w22, eq
    d3bc:      	uxtb	w16, w19
    d3c0:      	cmp	w16, wzr
    d3c4:      	b.ne	0xd494 <_stogir.vector-arithmetic.valid-type?+0x2ac>
    d3c8:      	uxtb	w16, w20
    d3cc:      	cmp	w16, wzr
    d3d0:      	b.ne	0xd494 <_stogir.vector-arithmetic.valid-type?+0x2ac>
    d3d4:      	uxtb	w16, w11
    d3d8:      	cmp	w16, wzr
    d3dc:      	b.ne	0xd494 <_stogir.vector-arithmetic.valid-type?+0x2ac>
    d3e0:      	uxtb	w16, w12
    d3e4:      	cmp	w16, wzr
    d3e8:      	b.ne	0xd494 <_stogir.vector-arithmetic.valid-type?+0x2ac>
    d3ec:      	uxtb	w16, w13
    d3f0:      	cmp	w16, wzr
    d3f4:      	b.ne	0xd494 <_stogir.vector-arithmetic.valid-type?+0x2ac>
    d3f8:      	uxtb	w16, w14
    d3fc:      	cmp	w16, wzr
    d400:      	b.ne	0xd494 <_stogir.vector-arithmetic.valid-type?+0x2ac>
    d404:      	uxtb	w16, w15
    d408:      	cmp	w16, wzr
    d40c:      	b.ne	0xd494 <_stogir.vector-arithmetic.valid-type?+0x2ac>
    d410:      	cmp	x2, #0x1
    d414:      	cset	w0, eq
    d418:      	cmp	x2, #0x1
    d41c:      	cset	w1, ge
    d420:      	cmp	x2, #0xb
    d424:      	cset	w2, le
    d428:      	uxtb	w16, w7
    d42c:      	cmp	w16, wzr
    d430:      	b.eq	0xd4e4 <_stogir.vector-arithmetic.valid-type?+0x2fc>
    d434:      	uxtb	w16, w8
    d438:      	cmp	w16, wzr
    d43c:      	b.eq	0xd4e4 <_stogir.vector-arithmetic.valid-type?+0x2fc>
    d440:      	uxtb	w16, w1
    d444:      	cmp	w16, wzr
    d448:      	b.eq	0xd56c <_stogir.vector-arithmetic.valid-type?+0x384>
    d44c:      	uxtb	w16, w2
    d450:      	cmp	w16, wzr
    d454:      	b.eq	0xd56c <_stogir.vector-arithmetic.valid-type?+0x384>
    d458:      	uxtb	w16, w0
    d45c:      	cmp	w16, wzr
    d460:      	cset	x0, eq
    d464:      	b	0xd570 <_stogir.vector-arithmetic.valid-type?+0x388>
    d468:      	movz	x0, #0x0, lsl #48
    d46c:      	ldr	x19, [sp, #0x10]
    d470:      	ldr	x20, [sp, #0x18]
    d474:      	ldr	x21, [sp, #0x20]
    d478:      	ldr	x22, [sp, #0x28]
    d47c:      	ldr	x29, [sp]
    d480:      	ldr	x30, [sp, #0x8]
    d484:      	add	sp, sp, #0x30
    d488:      	ret
    d48c:      	ubfx	x0, x20, #0, #8
    d490:      	b	0xd46c <_stogir.vector-arithmetic.valid-type?+0x284>
    d494:      	bl	0xd494 <_stogir.vector-arithmetic.valid-type?+0x2ac>
		000000000000d494:  ARM64_RELOC_BRANCH26	_stogir.integer-unary.valid-type?
    d498:      	cmp	x0, #0x0
    d49c:      	b.eq	0xd4a8 <_stogir.vector-arithmetic.valid-type?+0x2c0>
    d4a0:      	mov	x0, #0x1                ; =1
    d4a4:      	b	0xd490 <_stogir.vector-arithmetic.valid-type?+0x2a8>
    d4a8:      	uxtb	w16, w21
    d4ac:      	cmp	w16, wzr
    d4b0:      	b.ne	0xd4c8 <_stogir.vector-arithmetic.valid-type?+0x2e0>
    d4b4:      	uxtb	w16, w22
    d4b8:      	cmp	w16, wzr
    d4bc:      	b.ne	0xd4c8 <_stogir.vector-arithmetic.valid-type?+0x2e0>
    d4c0:      	movz	x0, #0x0, lsl #48
    d4c4:      	b	0xd490 <_stogir.vector-arithmetic.valid-type?+0x2a8>
    d4c8:      	uxtb	w16, w19
    d4cc:      	cmp	w16, wzr
    d4d0:      	b.eq	0xd48c <_stogir.vector-arithmetic.valid-type?+0x2a4>
    d4d4:      	mov	x0, #0x1                ; =1
    d4d8:      	b	0xd490 <_stogir.vector-arithmetic.valid-type?+0x2a8>
    d4dc:      	movz	x0, #0x0, lsl #48
    d4e0:      	b	0xd490 <_stogir.vector-arithmetic.valid-type?+0x2a8>
    d4e4:      	uxtb	w16, w3
    d4e8:      	cmp	w16, wzr
    d4ec:      	b.ne	0xd558 <_stogir.vector-arithmetic.valid-type?+0x370>
    d4f0:      	uxtb	w16, w4
    d4f4:      	cmp	w16, wzr
    d4f8:      	b.ne	0xd558 <_stogir.vector-arithmetic.valid-type?+0x370>
    d4fc:      	uxtb	w16, w5
    d500:      	cmp	w16, wzr
    d504:      	b.ne	0xd558 <_stogir.vector-arithmetic.valid-type?+0x370>
    d508:      	uxtb	w16, w21
    d50c:      	cmp	w16, wzr
    d510:      	b.ne	0xd5cc <_stogir.vector-arithmetic.valid-type?+0x3e4>
    d514:      	uxtb	w16, w22
    d518:      	cmp	w16, wzr
    d51c:      	b.ne	0xd5cc <_stogir.vector-arithmetic.valid-type?+0x3e4>
    d520:      	uxtb	w16, w1
    d524:      	cmp	w16, wzr
    d528:      	b.eq	0xd5dc <_stogir.vector-arithmetic.valid-type?+0x3f4>
    d52c:      	uxtb	w16, w2
    d530:      	cmp	w16, wzr
    d534:      	b.eq	0xd5dc <_stogir.vector-arithmetic.valid-type?+0x3f4>
    d538:      	uxtb	w16, w0
    d53c:      	cmp	w16, wzr
    d540:      	b.eq	0xd5e4 <_stogir.vector-arithmetic.valid-type?+0x3fc>
    d544:      	uxtb	w16, w9
    d548:      	cmp	w16, wzr
    d54c:      	b.eq	0xd5ec <_stogir.vector-arithmetic.valid-type?+0x404>
    d550:      	mov	x0, #0x1                ; =1
    d554:      	b	0xd5f0 <_stogir.vector-arithmetic.valid-type?+0x408>
    d558:      	uxtb	w16, w1
    d55c:      	cmp	w16, wzr
    d560:      	b.eq	0xd4dc <_stogir.vector-arithmetic.valid-type?+0x2f4>
    d564:      	ubfx	x0, x2, #0, #8
    d568:      	b	0xd4e0 <_stogir.vector-arithmetic.valid-type?+0x2f8>
    d56c:      	movz	x0, #0x0, lsl #48
    d570:      	b	0xd4e0 <_stogir.vector-arithmetic.valid-type?+0x2f8>
    d574:      	cmp	x2, #0x1a
    d578:      	b.eq	0xd3a8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d57c:      	cmp	x2, #0x1b
    d580:      	b.eq	0xd3a8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d584:      	cmp	x2, #0x1c
    d588:      	b.eq	0xd3a8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d58c:      	cmp	x2, #0x1d
    d590:      	b.eq	0xd3a8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d594:      	uxtb	w16, w6
    d598:      	cmp	w16, wzr
    d59c:      	b.ne	0xd3a8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d5a0:      	uxtb	w16, w3
    d5a4:      	cmp	w16, wzr
    d5a8:      	b.ne	0xd3a8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d5ac:      	uxtb	w16, w4
    d5b0:      	cmp	w16, wzr
    d5b4:      	b.ne	0xd3a8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d5b8:      	uxtb	w16, w5
    d5bc:      	cmp	w16, wzr
    d5c0:      	b.ne	0xd3a8 <_stogir.vector-arithmetic.valid-type?+0x1c0>
    d5c4:      	movz	x0, #0x0, lsl #48
    d5c8:      	b	0xd490 <_stogir.vector-arithmetic.valid-type?+0x2a8>
    d5cc:      	uxtb	w16, w6
    d5d0:      	cmp	w16, wzr
    d5d4:      	cset	x0, eq
    d5d8:      	b	0xd4e0 <_stogir.vector-arithmetic.valid-type?+0x2f8>
    d5dc:      	movz	x0, #0x0, lsl #48
    d5e0:      	b	0xd5d8 <_stogir.vector-arithmetic.valid-type?+0x3f0>
    d5e4:      	mov	x0, #0x1                ; =1
    d5e8:      	b	0xd5e0 <_stogir.vector-arithmetic.valid-type?+0x3f8>
    d5ec:      	ubfx	x0, x10, #0, #8
    d5f0:      	b	0xd5e8 <_stogir.vector-arithmetic.valid-type?+0x400>
