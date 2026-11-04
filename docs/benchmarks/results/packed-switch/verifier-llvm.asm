
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-iterator-results/build/packed-switch-bench/verifier/llvm.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <ltmp0>:
       0:      	cbz	x2, 0x20 <ltmp0+0x20>
       4:      	stp	x29, x30, [sp, #-0x10]!
       8:      	mov	x29, sp
       c:      	bl	0xc <ltmp0+0xc>
		000000000000000c:  ARM64_RELOC_BRANCH26	_memcmp
      10:      	cmp	w0, #0x0
      14:      	cset	w0, eq
      18:      	ldp	x29, x30, [sp], #0x10
      1c:      	ret
      20:      	mov	w0, #0x1                ; =1
      24:      	ret

0000000000000028 <_coil.hashmap.bytewise-hash>:
      28:      	mov	x8, x0
      2c:      	mov	x0, #0x2325             ; =8997
      30:      	cmp	x1, #0x1
      34:      	movk	x0, #0x8422, lsl #16
      38:      	movk	x0, #0x9ce4, lsl #32
      3c:      	movk	x0, #0xcbf2, lsl #48
      40:      	b.lt	0x60 <_coil.hashmap.bytewise-hash+0x38>
      44:      	mov	x9, #0x1b3              ; =435
      48:      	movk	x9, #0x100, lsl #32
      4c:      	ldrsb	x10, [x8], #0x1
      50:      	subs	x1, x1, #0x1
      54:      	eor	x10, x0, x10
      58:      	mul	x0, x10, x9
      5c:      	b.ne	0x4c <_coil.hashmap.bytewise-hash+0x24>
      60:      	ret

0000000000000064 <_gap_verify_graph>:
      64:      	ldr	x8, [x0, #0x8]
      68:      	ldr	x9, [x0, #0x80]
      6c:      	cmp	x8, x9
      70:      	b.ne	0x478 <_gap_verify_graph+0x414>
      74:      	stp	x28, x27, [sp, #-0x60]!
      78:      	stp	x26, x25, [sp, #0x10]
      7c:      	stp	x24, x23, [sp, #0x20]
      80:      	stp	x22, x21, [sp, #0x30]
      84:      	stp	x20, x19, [sp, #0x40]
      88:      	stp	x29, x30, [sp, #0x50]
      8c:      	add	x29, sp, #0x50
      90:      	sub	sp, sp, #0x1d0
      94:      	mov	x19, x0
      98:      	mov	w9, #0x1                ; =1
      9c:      	adrp	x10, 0x0 <ltmp0>
		000000000000009c:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.INPUT-COUNTS
      a0:      	add	x10, x10, #0x0
		00000000000000a0:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.INPUT-COUNTS
      a4:      	mov	w11, #0x24              ; =36
      a8:      	mov	w12, #0x15              ; =21
      ac:      	mov	w15, #0x5e1c            ; =24092
      b0:      	mov	w17, #0x18              ; =24
      b4:      	adrp	x16, 0x0 <ltmp0>
		00000000000000b4:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
      b8:      	add	x16, x16, #0x0
		00000000000000b8:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
      bc:      	mov	w1, #0x5                ; =5
      c0:      	mov	w2, #0x818              ; =2072
      c4:      	mov	w3, #0x1                ; =1
      c8:      	b	0xd4 <_gap_verify_graph+0x70>
      cc:      	mov	x3, x20
      d0:      	cbnz	x28, 0x3a34 <_gap_verify_graph+0x39d0>
      d4:      	cmp	x3, x8
      d8:      	b.ge	0x480 <_gap_verify_graph+0x41c>
      dc:      	ldr	x4, [x19, #0x78]
      e0:      	mov	x0, #-0x1               ; =-1
      e4:      	ldr	w5, [x4, x3, lsl #2]
      e8:      	lsr	w13, w5, #16
      ec:      	cbnz	w13, 0x3a38 <_gap_verify_graph+0x39d4>
      f0:      	ldr	x6, [x19]
      f4:      	lsl	x13, x3, #4
      f8:      	ldr	x20, [x6, x13]
      fc:      	and	w21, w20, #0xff
     100:      	cmp	w21, #0x82
     104:      	b.hi	0x3a38 <_gap_verify_graph+0x39d4>
     108:      	ubfx	w22, w20, #8, #8
     10c:      	cmp	w22, #0xe
     110:      	b.lo	0x130 <_gap_verify_graph+0xcc>
     114:      	sub	w13, w22, #0x80
     118:      	cmn	w13, #0x70
     11c:      	b.lo	0x3a38 <_gap_verify_graph+0x39d4>
     120:      	ubfx	w13, w20, #8, #4
     124:      	sub	w13, w13, #0xe
     128:      	cmn	w13, #0xd
     12c:      	b.lo	0x3a38 <_gap_verify_graph+0x39d4>
     130:      	and	x7, x20, #0xff
     134:      	adrp	x13, 0x0 <ltmp0>
		0000000000000134:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.OPERAND-SLOTS
     138:      	add	x13, x13, #0x0
		0000000000000138:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.OPERAND-SLOTS
     13c:      	ldrsb	w13, [x13, x7]
     140:      	tbnz	w13, #0x1f, 0x14c <_gap_verify_graph+0xe8>
     144:      	cmp	w5, w13
     148:      	b.ne	0x3a38 <_gap_verify_graph+0x39d4>
     14c:      	ldrb	w13, [x10, x7]
     150:      	add	x0, x5, #0x4
     154:      	lsr	w20, w20, #16
     158:      	lsr	x0, x0, #2
     15c:      	cmp	w13, #0xff
     160:      	ccmp	w5, w20, #0x4, eq
     164:      	add	x20, x3, x0
     168:      	csel	x13, x11, xzr, ne
     16c:      	cmp	x20, x8
     170:      	csel	x28, x12, x13, gt
     174:      	cmp	w5, #0x4
     178:      	b.lo	0x1b0 <_gap_verify_graph+0x14c>
     17c:      	cbnz	x28, 0x1b0 <_gap_verify_graph+0x14c>
     180:      	add	x13, x4, x3, lsl #2
     184:      	mov	w24, #0x2               ; =2
     188:      	add	x23, x13, #0x4
     18c:      	ldr	w25, [x23], #0x4
     190:      	cmn	w25, #0x1
     194:      	b.ne	0x1a4 <_gap_verify_graph+0x140>
     198:      	cmp	x24, x0
     19c:      	add	x24, x24, #0x1
     1a0:      	b.lo	0x18c <_gap_verify_graph+0x128>
     1a4:      	cmn	w25, #0x1
     1a8:      	mov	w13, #0x1b              ; =27
     1ac:      	csel	x28, xzr, x13, eq
     1b0:      	cbz	w5, 0xcc <_gap_verify_graph+0x68>
     1b4:      	cbnz	x28, 0xcc <_gap_verify_graph+0x68>
     1b8:      	cmp	w21, #0x78
     1bc:      	mov	w24, #0x2               ; =2
     1c0:      	ccmp	w22, #0x0, #0x0, eq
     1c4:      	and	x22, x3, #0x7fffffff
     1c8:      	cset	w21, ne
     1cc:      	cmp	w3, #0x1
     1d0:      	ccmp	x8, x22, #0x4, ge
     1d4:      	cset	w23, le
     1d8:      	sub	w25, w24, #0x1
     1dc:      	cmp	w25, #0x1
     1e0:      	b.lt	0x208 <_gap_verify_graph+0x1a4>
     1e4:      	cmp	w25, #0x5
     1e8:      	ldr	w0, [x16, x7, lsl #2]
     1ec:      	csel	w13, w25, w1, lo
     1f0:      	lsl	w13, w13, #2
     1f4:      	sub	w13, w13, #0x4
     1f8:      	lsr	w13, w0, w13
     1fc:      	and	w0, w13, #0xf
     200:      	tbz	w23, #0x0, 0x210 <_gap_verify_graph+0x1ac>
     204:      	b	0x224 <_gap_verify_graph+0x1c0>
     208:      	mov	w0, wzr
     20c:      	tbnz	w23, #0x0, 0x224 <_gap_verify_graph+0x1c0>
     210:      	ldr	w13, [x4, x22, lsl #2]
     214:      	cmp	w25, w13
     218:      	ccmp	w13, #0x0, #0x8, ls
     21c:      	ccmp	w25, #0x1, #0x8, pl
     220:      	b.ge	0x230 <_gap_verify_graph+0x1cc>
     224:      	mov	x26, xzr
     228:      	cbnz	w26, 0x248 <_gap_verify_graph+0x1e4>
     22c:      	b	0x3a34 <_gap_verify_graph+0x39d0>
     230:      	add	w13, w3, w25, lsr #2
     234:      	and	w26, w25, #0x3
     238:      	add	x13, x6, w13, uxtw #4
     23c:      	ldr	w27, [x13, w26, uxtw #2]
     240:      	mov	w26, #0x1               ; =1
     244:      	cbz	w26, 0x3a34 <_gap_verify_graph+0x39d0>
     248:      	cmp	w0, #0x2
     24c:      	b.eq	0x258 <_gap_verify_graph+0x1f4>
     250:      	cmp	w0, #0x9
     254:      	b.ne	0x2a0 <_gap_verify_graph+0x23c>
     258:      	cmp	w27, #0x1
     25c:      	b.lt	0x2d4 <_gap_verify_graph+0x270>
     260:      	and	x26, x27, #0x7fffffff
     264:      	cmp	x8, x26
     268:      	b.le	0x39c <_gap_verify_graph+0x338>
     26c:      	ldr	w13, [x4, x26, lsl #2]
     270:      	tbnz	w13, #0x1f, 0x39c <_gap_verify_graph+0x338>
     274:      	add	x26, x6, x26, lsl #4
     278:      	cbz	x26, 0x39c <_gap_verify_graph+0x338>
     27c:      	ldrb	w13, [x26]
     280:      	mov	w26, #0x1               ; =1
     284:      	mov	w30, #0x1               ; =1
     288:      	cmp	w13, #0x48
     28c:      	mov	w13, #0x25              ; =37
     290:      	csel	x28, x13, xzr, eq
     294:      	cmp	w0, #0x8
     298:      	b.eq	0x3b0 <_gap_verify_graph+0x34c>
     29c:      	b	0x2b4 <_gap_verify_graph+0x250>
     2a0:      	mov	w26, wzr
     2a4:      	mov	w30, wzr
     2a8:      	mov	x28, xzr
     2ac:      	cmp	w0, #0x8
     2b0:      	b.eq	0x3b0 <_gap_verify_graph+0x34c>
     2b4:      	cmp	w0, #0xf
     2b8:      	b.eq	0x464 <_gap_verify_graph+0x400>
     2bc:      	lsl	w13, w9, w0
     2c0:      	and	w13, w13, w15
     2c4:      	cbz	w13, 0x464 <_gap_verify_graph+0x400>
     2c8:      	tbz	w26, #0x0, 0x338 <_gap_verify_graph+0x2d4>
     2cc:      	tbnz	w30, #0x0, 0x464 <_gap_verify_graph+0x400>
     2d0:      	b	0x2ec <_gap_verify_graph+0x288>
     2d4:      	tbnz	w27, #0x1f, 0x358 <_gap_verify_graph+0x2f4>
     2d8:      	cmp	w0, #0x8
     2dc:      	b.eq	0x3a34 <_gap_verify_graph+0x39d0>
     2e0:      	lsr	w13, w15, w0
     2e4:      	mov	x28, xzr
     2e8:      	tbz	w13, #0x0, 0x464 <_gap_verify_graph+0x400>
     2ec:      	cmp	w25, #0x1
     2f0:      	mov	x0, #-0x1               ; =-1
     2f4:      	b.lt	0x3a38 <_gap_verify_graph+0x39d4>
     2f8:      	cbnz	w27, 0x3a38 <_gap_verify_graph+0x39d4>
     2fc:      	cmp	w25, #0x5
     300:      	ldr	w14, [x16, x7, lsl #2]
     304:      	csel	w13, w25, w1, lo
     308:      	lsl	w13, w13, #2
     30c:      	sub	w13, w13, #0x4
     310:      	lsr	w13, w14, w13
     314:      	and	w13, w13, #0xf
     318:      	cmp	w13, #0xb
     31c:      	b.hi	0x328 <_gap_verify_graph+0x2c4>
     320:      	lsr	w13, w2, w13
     324:      	tbnz	w13, #0x0, 0x464 <_gap_verify_graph+0x400>
     328:      	cmp	w24, #0x3
     32c:      	csinc	w13, w21, wzr, eq
     330:      	tbz	w13, #0x0, 0x464 <_gap_verify_graph+0x400>
     334:      	b	0x3a34 <_gap_verify_graph+0x39d0>
     338:      	cmp	w27, #0x1
     33c:      	b.lt	0x424 <_gap_verify_graph+0x3c0>
     340:      	and	x13, x27, #0x7fffffff
     344:      	cmp	x8, x13
     348:      	b.le	0x3a34 <_gap_verify_graph+0x39d0>
     34c:      	ldr	w13, [x4, x13, lsl #2]
     350:      	tbz	w13, #0x1f, 0x464 <_gap_verify_graph+0x400>
     354:      	b	0x3a34 <_gap_verify_graph+0x39d0>
     358:      	ldr	x26, [x19, #0x30]
     35c:      	ldr	x13, [x19, #0x58]
     360:      	cmp	x26, x13
     364:      	b.ne	0x39c <_gap_verify_graph+0x338>
     368:      	sxtw	x28, w27
     36c:      	cmn	x26, x28
     370:      	b.lt	0x39c <_gap_verify_graph+0x338>
     374:      	ldr	x13, [x19, #0x50]
     378:      	mvn	x26, x28
     37c:      	ldr	w13, [x13, x26, lsl #2]
     380:      	cmp	w13, #0x0
     384:      	b.le	0x39c <_gap_verify_graph+0x338>
     388:      	ldr	x13, [x19, #0x28]
     38c:      	mvn	w26, w27
     390:      	and	x26, x26, #0x7fffffff
     394:      	add	x26, x13, x26, lsl #4
     398:      	cbnz	x26, 0x27c <_gap_verify_graph+0x218>
     39c:      	mov	w30, wzr
     3a0:      	mov	x28, xzr
     3a4:      	mov	w26, #0x1               ; =1
     3a8:      	cmp	w0, #0x8
     3ac:      	b.ne	0x2b4 <_gap_verify_graph+0x250>
     3b0:      	cmp	w27, #0x1
     3b4:      	b.lt	0x3d8 <_gap_verify_graph+0x374>
     3b8:      	ldr	x14, [x19, #0x140]
     3bc:      	and	x13, x27, #0x7fffffff
     3c0:      	cmp	x14, x13
     3c4:      	b.ge	0x3e8 <_gap_verify_graph+0x384>
     3c8:      	mov	w28, #0x21              ; =33
     3cc:      	cmp	w0, #0xf
     3d0:      	b.ne	0x2bc <_gap_verify_graph+0x258>
     3d4:      	b	0x464 <_gap_verify_graph+0x400>
     3d8:      	mov	w28, #0x21              ; =33
     3dc:      	cmp	w0, #0xf
     3e0:      	b.ne	0x2bc <_gap_verify_graph+0x258>
     3e4:      	b	0x464 <_gap_verify_graph+0x400>
     3e8:      	ldr	x14, [x19, #0x138]
     3ec:      	umaddl	x13, w13, w17, x14
     3f0:      	ldr	x14, [x19, #0x118]
     3f4:      	ldp	x16, x13, [x13, #-0x18]
     3f8:      	subs	x14, x14, x16
     3fc:      	ccmp	x16, #0x0, #0x8, ge
     400:      	adrp	x16, 0x0 <ltmp0>
		0000000000000400:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
     404:      	add	x16, x16, #0x0
		0000000000000404:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
     408:      	ccmp	x13, #0x0, #0x8, pl
     40c:      	ccmp	x13, x14, #0x0, pl
     410:      	mov	w13, #0x21              ; =33
     414:      	csel	x28, x13, x28, gt
     418:      	cmp	w0, #0xf
     41c:      	b.ne	0x2bc <_gap_verify_graph+0x258>
     420:      	b	0x464 <_gap_verify_graph+0x400>
     424:      	tbnz	w27, #0x1f, 0x434 <_gap_verify_graph+0x3d0>
     428:      	cmp	w25, #0x1
     42c:      	b.ge	0x2fc <_gap_verify_graph+0x298>
     430:      	b	0x3a34 <_gap_verify_graph+0x39d0>
     434:      	ldr	x13, [x19, #0x30]
     438:      	ldr	x14, [x19, #0x58]
     43c:      	cmp	x13, x14
     440:      	b.ne	0x3a34 <_gap_verify_graph+0x39d0>
     444:      	sxtw	x0, w27
     448:      	cmn	x13, x0
     44c:      	b.lt	0x3a34 <_gap_verify_graph+0x39d0>
     450:      	ldr	x13, [x19, #0x50]
     454:      	mvn	x14, x0
     458:      	ldr	w13, [x13, x14, lsl #2]
     45c:      	cmp	w13, #0x0
     460:      	b.le	0x3a34 <_gap_verify_graph+0x39d0>
     464:      	cmp	w24, w5
     468:      	b.gt	0xcc <_gap_verify_graph+0x68>
     46c:      	add	w24, w24, #0x1
     470:      	cbz	x28, 0x1d8 <_gap_verify_graph+0x174>
     474:      	b	0xcc <_gap_verify_graph+0x68>
     478:      	mov	x0, #-0x1               ; =-1
     47c:      	ret
     480:      	add	x8, sp, #0xd0
     484:      	mov	x28, #0x80000000        ; =2147483648
     488:      	adrp	x26, 0x0 <ltmp0>
		0000000000000488:  ARM64_RELOC_PAGE21	l_str.543
     48c:      	add	x26, x26, #0x0
		000000000000048c:  ARM64_RELOC_PAGEOFF12	l_str.543
     490:      	add	x9, x8, #0x8
     494:      	add	x8, sp, #0xe8
     498:      	movk	x28, #0x2001, lsl #32
     49c:      	add	x8, x8, #0x8
     4a0:      	mov	w1, #0x5                ; =5
     4a4:      	movk	x28, #0x3c0, lsl #48
     4a8:      	mov	w20, #0x1               ; =1
     4ac:      	stp	x9, x8, [sp, #0x68]
     4b0:      	b	0x4d0 <_gap_verify_graph+0x46c>
     4b4:      	cmp	w8, w9
     4b8:      	b.ne	0x3a34 <_gap_verify_graph+0x39d0>
     4bc:      	adds	x8, x24, #0x4
     4c0:      	add	x9, x24, #0x7
     4c4:      	csel	x8, x9, x8, mi
     4c8:      	add	x20, x20, x8, asr #2
     4cc:      	cbnz	x23, 0x3a34 <_gap_verify_graph+0x39d0>
     4d0:      	ldr	x0, [x19, #0x8]
     4d4:      	cmp	x20, x0
     4d8:      	b.ge	0x3a38 <_gap_verify_graph+0x39d4>
     4dc:      	ldr	x4, [x19]
     4e0:      	add	x8, x4, x20, lsl #4
     4e4:      	ldr	x22, [x8]
     4e8:      	and	w21, w22, #0xff
     4ec:      	cmp	w21, #0xe
     4f0:      	b.lo	0x51c <_gap_verify_graph+0x4b8>
     4f4:      	cmp	w21, #0x18
     4f8:      	cset	w9, lo
     4fc:      	cmp	w21, #0x1a
     500:      	b.lo	0x528 <_gap_verify_graph+0x4c4>
     504:      	cmp	w21, #0x1f
     508:      	b.hs	0x8b0 <_gap_verify_graph+0x84c>
     50c:      	mov	w9, #0x1                ; =1
     510:      	str	wzr, [sp, #0x98]
     514:      	str	w9, [sp, #0x88]
     518:      	b	0x538 <_gap_verify_graph+0x4d4>
     51c:      	str	wzr, [sp, #0x88]
     520:      	str	wzr, [sp, #0x98]
     524:      	b	0x530 <_gap_verify_graph+0x4cc>
     528:      	str	w9, [sp, #0x98]
     52c:      	str	wzr, [sp, #0x88]
     530:      	cmp	w21, #0x3b
     534:      	cset	w9, eq
     538:      	lsr	w12, w22, #8
     53c:      	str	w9, [sp, #0x94]
     540:      	ubfx	w10, w22, #8, #4
     544:      	cmp	w21, #0x3a
     548:      	and	w9, w12, #0xf0
     54c:      	cset	w11, lo
     550:      	sub	w10, w10, #0x1
     554:      	sub	w9, w9, #0x10
     558:      	str	w11, [sp, #0x90]
     55c:      	cmp	w9, #0x70
     560:      	sub	w9, w21, #0x1f
     564:      	ccmp	w10, #0xd, #0x2, lo
     568:      	sub	w10, w21, #0xe
     56c:      	cset	w27, lo
     570:      	cmp	w9, #0x2
     574:      	ccmp	w10, #0xc, #0x0, hs
     578:      	b.hs	0x584 <_gap_verify_graph+0x520>
     57c:      	mov	w9, #0x1                ; =1
     580:      	b	0x5a0 <_gap_verify_graph+0x53c>
     584:      	cmp	w21, #0x1a
     588:      	b.lo	0x598 <_gap_verify_graph+0x534>
     58c:      	cmp	w21, #0x3a
     590:      	ccmp	w21, #0x1e, #0x0, ne
     594:      	b.lo	0x57c <_gap_verify_graph+0x518>
     598:      	cmp	w21, #0x3b
     59c:      	cset	w9, eq
     5a0:      	ldr	x23, [x19, #0x78]
     5a4:      	ldr	x2, [x8, #0x8]
     5a8:      	eor	w10, w27, #0x1
     5ac:      	lsr	x8, x22, #32
     5b0:      	ands	w9, w9, w10
     5b4:      	str	w12, [sp, #0x8c]
     5b8:      	ldrsw	x24, [x23, x20, lsl #2]
     5bc:      	b.eq	0x62c <_gap_verify_graph+0x5c8>
     5c0:      	cmp	w8, #0x1
     5c4:      	b.lt	0x648 <_gap_verify_graph+0x5e4>
     5c8:      	cmp	x0, x8
     5cc:      	b.le	0x68c <_gap_verify_graph+0x628>
     5d0:      	ldr	x10, [x19, #0x80]
     5d4:      	cmp	x10, x8
     5d8:      	b.le	0x68c <_gap_verify_graph+0x628>
     5dc:      	ldr	w10, [x23, x8, lsl #2]
     5e0:      	tbnz	w10, #0x1f, 0x68c <_gap_verify_graph+0x628>
     5e4:      	add	x10, x4, x8, lsl #4
     5e8:      	cbz	x10, 0x68c <_gap_verify_graph+0x628>
     5ec:      	ldr	w10, [x10]
     5f0:      	lsr	w10, w10, #8
     5f4:      	and	w11, w10, #0xf
     5f8:      	and	w10, w10, #0xff
     5fc:      	sub	w11, w11, #0x1
     600:      	sub	w12, w10, #0x10
     604:      	cmp	w11, #0xd
     608:      	mov	w11, #0x70              ; =112
     60c:      	ccmp	w12, w11, #0x2, lo
     610:      	b.hs	0x690 <_gap_verify_graph+0x62c>
     614:      	str	wzr, [sp, #0x9c]
     618:      	cmp	w24, #0x1
     61c:      	lsr	x3, x2, #32
     620:      	csinc	w11, w27, wzr, ge
     624:      	tbz	w11, #0x0, 0x6cc <_gap_verify_graph+0x668>
     628:      	b	0x904 <_gap_verify_graph+0x8a0>
     62c:      	str	wzr, [sp, #0x9c]
     630:      	mov	w10, #-0x1              ; =-1
     634:      	cmp	w24, #0x1
     638:      	lsr	x3, x2, #32
     63c:      	csinc	w11, w27, wzr, ge
     640:      	tbz	w11, #0x0, 0x6cc <_gap_verify_graph+0x668>
     644:      	b	0x904 <_gap_verify_graph+0x8a0>
     648:      	tbz	x22, #0x3f, 0x68c <_gap_verify_graph+0x628>
     64c:      	ldr	x10, [x19, #0x30]
     650:      	ldr	x11, [x19, #0x58]
     654:      	cmp	x10, x11
     658:      	b.ne	0x68c <_gap_verify_graph+0x628>
     65c:      	asr	x11, x22, #32
     660:      	cmn	x10, x11
     664:      	b.lt	0x68c <_gap_verify_graph+0x628>
     668:      	ldr	x10, [x19, #0x50]
     66c:      	mvn	x11, x11
     670:      	ldr	w10, [x10, x11, lsl #2]
     674:      	cmp	w10, #0x0
     678:      	b.le	0x68c <_gap_verify_graph+0x628>
     67c:      	ldr	x10, [x19, #0x28]
     680:      	eor	x11, x8, #0xffffffff
     684:      	add	x10, x10, x11, lsl #4
     688:      	cbnz	x10, 0x5ec <_gap_verify_graph+0x588>
     68c:      	mov	w10, #-0x1              ; =-1
     690:      	and	w11, w22, #0xfe00
     694:      	and	w12, w22, #0xfe
     698:      	cmp	w11, #0xc00
     69c:      	ccmp	w12, #0x18, #0x4, ne
     6a0:      	b.ne	0x6ac <_gap_verify_graph+0x648>
     6a4:      	mov	w11, #0x1               ; =1
     6a8:      	b	0x6b8 <_gap_verify_graph+0x654>
     6ac:      	and	w11, w10, #0xfffffffe
     6b0:      	cmp	w11, #0xc
     6b4:      	cset	w11, eq
     6b8:      	str	w11, [sp, #0x9c]
     6bc:      	cmp	w24, #0x1
     6c0:      	lsr	x3, x2, #32
     6c4:      	csinc	w11, w27, wzr, ge
     6c8:      	tbnz	w11, #0x0, 0x904 <_gap_verify_graph+0x8a0>
     6cc:      	sub	w11, w10, #0x10
     6d0:      	and	w10, w10, #0xf
     6d4:      	sub	w10, w10, #0x1
     6d8:      	cmp	w11, #0x70
     6dc:      	ccmp	w10, #0xd, #0x2, lo
     6e0:      	cset	w10, lo
     6e4:      	cmp	w21, #0x83
     6e8:      	b.hs	0x890 <_gap_verify_graph+0x82c>
     6ec:      	mov	w11, w20
     6f0:      	cmp	w20, #0x0
     6f4:      	and	x12, x22, #0xff
     6f8:      	ccmp	x0, x11, #0x4, gt
     6fc:      	mov	w14, #0x1               ; =1
     700:      	cset	w13, gt
     704:      	cmp	w14, #0x1
     708:      	b.lt	0x81c <_gap_verify_graph+0x7b8>
     70c:      	cmp	w14, #0x5
     710:      	ldr	w16, [x16, x12, lsl #2]
     714:      	csel	w15, w14, w1, lo
     718:      	lsl	w15, w15, #2
     71c:      	sub	w15, w15, #0x4
     720:      	lsr	w15, w16, w15
     724:      	and	w15, w15, #0xf
     728:      	cmp	w15, #0x9
     72c:      	ccmp	w15, #0x2, #0x4, ne
     730:      	b.ne	0x870 <_gap_verify_graph+0x80c>
     734:      	cmp	w14, #0x1
     738:      	mov	w27, w10
     73c:      	adrp	x16, 0x0 <ltmp0>
		000000000000073c:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
     740:      	add	x16, x16, #0x0
		0000000000000740:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
     744:      	csel	w15, wzr, w9, ne
     748:      	tbnz	w15, #0x0, 0x820 <_gap_verify_graph+0x7bc>
     74c:      	mov	w15, w8
     750:      	b.eq	0x7c0 <_gap_verify_graph+0x75c>
     754:      	cmp	w14, #0x2
     758:      	mov	w15, w2
     75c:      	b.eq	0x7c0 <_gap_verify_graph+0x75c>
     760:      	cmp	w14, #0x3
     764:      	mov	w15, w3
     768:      	b.eq	0x7c0 <_gap_verify_graph+0x75c>
     76c:      	cbz	w13, 0x7ac <_gap_verify_graph+0x748>
     770:      	ldr	x15, [x19, #0x80]
     774:      	cmp	x15, x11
     778:      	b.le	0x7ac <_gap_verify_graph+0x748>
     77c:      	ldr	w16, [x23, x11, lsl #2]
     780:      	mov	x15, xzr
     784:      	tbnz	w16, #0x1f, 0x86c <_gap_verify_graph+0x808>
     788:      	cmp	w14, w16
     78c:      	b.hi	0x7b0 <_gap_verify_graph+0x74c>
     790:      	add	w15, w20, w14, lsr #2
     794:      	and	w16, w14, #0x3
     798:      	add	x15, x4, w15, uxtw #4
     79c:      	ldr	w16, [x15, w16, uxtw #2]
     7a0:      	mov	w15, #0x1               ; =1
     7a4:      	cbnz	w15, 0x7b4 <_gap_verify_graph+0x750>
     7a8:      	b	0x870 <_gap_verify_graph+0x80c>
     7ac:      	mov	x15, xzr
     7b0:      	cbz	w15, 0x870 <_gap_verify_graph+0x80c>
     7b4:      	mov	w15, w16
     7b8:      	adrp	x16, 0x0 <ltmp0>
		00000000000007b8:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
     7bc:      	add	x16, x16, #0x0
		00000000000007bc:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
     7c0:      	cmp	w15, #0x1
     7c4:      	b.lt	0x818 <_gap_verify_graph+0x7b4>
     7c8:      	mov	w15, w15
     7cc:      	cmp	x0, x15
     7d0:      	b.le	0x81c <_gap_verify_graph+0x7b8>
     7d4:      	ldr	x16, [x19, #0x80]
     7d8:      	cmp	x16, x15
     7dc:      	b.le	0x870 <_gap_verify_graph+0x80c>
     7e0:      	ldr	w16, [x23, x15, lsl #2]
     7e4:      	tbnz	w16, #0x1f, 0x870 <_gap_verify_graph+0x80c>
     7e8:      	add	x15, x4, x15, lsl #4
     7ec:      	cbz	x15, 0x870 <_gap_verify_graph+0x80c>
     7f0:      	ldr	w15, [x15]
     7f4:      	lsr	w15, w15, #8
     7f8:      	and	w16, w15, #0xf0
     7fc:      	and	w15, w15, #0xf
     800:      	sub	w16, w16, #0x10
     804:      	sub	w15, w15, #0x1
     808:      	cmp	w16, #0x70
     80c:      	ccmp	w15, #0xd, #0x2, lo
     810:      	cset	w27, lo
     814:      	b	0x874 <_gap_verify_graph+0x810>
     818:      	tbnz	w15, #0x1f, 0x828 <_gap_verify_graph+0x7c4>
     81c:      	mov	w27, wzr
     820:      	tbz	w27, #0x0, 0x880 <_gap_verify_graph+0x81c>
     824:      	b	0x904 <_gap_verify_graph+0x8a0>
     828:      	ldr	x16, [x19, #0x30]
     82c:      	ldr	x17, [x19, #0x58]
     830:      	cmp	x16, x17
     834:      	b.ne	0x870 <_gap_verify_graph+0x80c>
     838:      	sxtw	x17, w15
     83c:      	cmn	x16, x17
     840:      	b.lt	0x870 <_gap_verify_graph+0x80c>
     844:      	ldr	x16, [x19, #0x50]
     848:      	mvn	x17, x17
     84c:      	ldr	w16, [x16, x17, lsl #2]
     850:      	cmp	w16, #0x0
     854:      	b.le	0x870 <_gap_verify_graph+0x80c>
     858:      	ldr	x16, [x19, #0x28]
     85c:      	mvn	w15, w15
     860:      	add	x15, x16, w15, uxtw #4
     864:      	cbnz	x15, 0x7f0 <_gap_verify_graph+0x78c>
     868:      	b	0x870 <_gap_verify_graph+0x80c>
     86c:      	cbnz	w15, 0x7b4 <_gap_verify_graph+0x750>
     870:      	mov	w27, wzr
     874:      	adrp	x16, 0x0 <ltmp0>
		0000000000000874:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
     878:      	add	x16, x16, #0x0
		0000000000000878:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
     87c:      	tbnz	w27, #0x0, 0x904 <_gap_verify_graph+0x8a0>
     880:      	add	w14, w14, #0x1
     884:      	cmp	w14, w24
     888:      	b.le	0x704 <_gap_verify_graph+0x6a0>
     88c:      	b	0x904 <_gap_verify_graph+0x8a0>
     890:      	mov	w8, #-0x7fffffff        ; =-2147483647
     894:      	mov	w9, #0x5                ; =5
     898:      	add	w8, w24, w8
     89c:      	movk	w9, #0x8000, lsl #16
     8a0:      	cmp	w8, w9
     8a4:      	b.hs	0x8d8 <_gap_verify_graph+0x874>
     8a8:      	mov	w8, #0x1                ; =1
     8ac:      	b	0x8f4 <_gap_verify_graph+0x890>
     8b0:      	cmp	w21, #0x2e
     8b4:      	b.lo	0xb74 <_gap_verify_graph+0xb10>
     8b8:      	cmp	w21, #0x3a
     8bc:      	mov	w9, #0x36               ; =54
     8c0:      	str	wzr, [sp, #0x98]
     8c4:      	ccmp	w21, w9, #0x0, ne
     8c8:      	mov	w9, #0x1                ; =1
     8cc:      	str	w9, [sp, #0x88]
     8d0:      	b.hs	0x530 <_gap_verify_graph+0x4cc>
     8d4:      	b	0x538 <_gap_verify_graph+0x4d4>
     8d8:      	and	w9, w24, #0x7ffffffc
     8dc:      	and	w10, w24, #0x7ffffffc
     8e0:      	orr	w8, w9, #0x1
     8e4:      	subs	w10, w10, #0x4
     8e8:      	b.ne	0x8e4 <_gap_verify_graph+0x880>
     8ec:      	cmp	w24, w9
     8f0:      	b.eq	0x900 <_gap_verify_graph+0x89c>
     8f4:      	add	w8, w8, #0x1
     8f8:      	cmp	w8, w24
     8fc:      	b.le	0x8f4 <_gap_verify_graph+0x890>
     900:      	mov	w27, wzr
     904:      	sub	w8, w21, #0x3d
     908:      	ldr	w9, [sp, #0x9c]
     90c:      	sturb	w27, [x29, #-0x98]
     910:      	cmp	w8, #0x3
     914:      	str	x2, [sp, #0x80]
     918:      	cset	w8, lo
     91c:      	sturb	w9, [x29, #-0xc0]
     920:      	orr	w8, w8, w27
     924:      	tbz	w8, #0x0, 0x98c <_gap_verify_graph+0x928>
     928:      	cmp	w20, #0x1
     92c:      	b.lt	0x9a4 <_gap_verify_graph+0x940>
     930:      	and	x8, x20, #0x7fffffff
     934:      	cmp	x0, x8
     938:      	b.le	0x9c4 <_gap_verify_graph+0x960>
     93c:      	ldr	x17, [x19, #0x80]
     940:      	cmp	x17, x8
     944:      	b.le	0x9c4 <_gap_verify_graph+0x960>
     948:      	ldr	w14, [x23, x8, lsl #2]
     94c:      	tbnz	w14, #0x1f, 0x9c4 <_gap_verify_graph+0x960>
     950:      	add	x8, x4, x8, lsl #4
     954:      	ldr	x1, [x8]
     958:      	and	w11, w1, #0xff
     95c:      	cmp	w11, #0x24
     960:      	b.eq	0xd08 <_gap_verify_graph+0xca4>
     964:      	cmp	w11, #0x3c
     968:      	b.eq	0xcf0 <_gap_verify_graph+0xc8c>
     96c:      	cmp	w11, #0x44
     970:      	b.ne	0xd6c <_gap_verify_graph+0xd08>
     974:      	add	x0, sp, #0xa0
     978:      	mov	x1, x19
     97c:      	mov	w2, w20
     980:      	str	x3, [sp, #0x60]
     984:      	bl	0x984 <_gap_verify_graph+0x920>
		0000000000000984:  ARM64_RELOC_BRANCH26	_stogir.copy.validate
     988:      	b	0xd1c <_gap_verify_graph+0xcb8>
     98c:      	mov	x25, xzr
     990:      	cmp	w21, #0x44
     994:      	cset	w8, ne
     998:      	orr	w8, w8, w27
     99c:      	tbz	w8, #0x0, 0xd48 <_gap_verify_graph+0xce4>
     9a0:      	b	0x9f4 <_gap_verify_graph+0x990>
     9a4:      	tbz	w20, #0x1f, 0x9c4 <_gap_verify_graph+0x960>
     9a8:      	ldr	x8, [x19, #0x30]
     9ac:      	ldr	x9, [x19, #0x58]
     9b0:      	cmp	x8, x9
     9b4:      	b.ne	0x9c4 <_gap_verify_graph+0x960>
     9b8:      	sxtw	x9, w20
     9bc:      	cmn	x8, x9
     9c0:      	b.ge	0xca4 <_gap_verify_graph+0xc40>
     9c4:      	mov	x28, x26
     9c8:      	mov	w25, #0x1a              ; =26
     9cc:      	stp	x28, x25, [sp, #0xa8]
     9d0:      	mov	x28, #0x80000000        ; =2147483648
     9d4:      	mov	w8, #0x1                ; =1
     9d8:      	movk	x28, #0x2001, lsl #32
     9dc:      	str	w8, [sp, #0xa0]
     9e0:      	movk	x28, #0x3c0, lsl #48
     9e4:      	cmp	w21, #0x44
     9e8:      	cset	w8, ne
     9ec:      	orr	w8, w8, w27
     9f0:      	tbz	w8, #0x0, 0xd48 <_gap_verify_graph+0xce4>
     9f4:      	sub	w8, w21, #0x1d
     9f8:      	cmp	w8, #0x1
     9fc:      	b.hi	0xa68 <_gap_verify_graph+0xa04>
     a00:      	cbz	x3, 0x17b0 <_gap_verify_graph+0x174c>
     a04:      	cmp	w3, #0x1
     a08:      	b.lt	0xc14 <_gap_verify_graph+0xbb0>
     a0c:      	ldr	x8, [x19, #0x8]
     a10:      	cmp	x8, x3
     a14:      	b.le	0xc34 <_gap_verify_graph+0xbd0>
     a18:      	ldr	x8, [x19, #0x80]
     a1c:      	cmp	x8, x3
     a20:      	b.le	0xc34 <_gap_verify_graph+0xbd0>
     a24:      	ldr	x8, [x19, #0x78]
     a28:      	ldr	w8, [x8, x3, lsl #2]
     a2c:      	tbnz	w8, #0x1f, 0xc34 <_gap_verify_graph+0xbd0>
     a30:      	ldr	x8, [x19]
     a34:      	lsl	x9, x3, #4
     a38:      	ldr	w8, [x8, x9]
     a3c:      	and	w9, w8, #0xfe
     a40:      	and	w8, w8, #0xff
     a44:      	sub	w9, w9, #0x68
     a48:      	cmp	w9, #0xa
     a4c:      	mov	w9, #0x65               ; =101
     a50:      	ccmp	w8, w9, #0x4, hs
     a54:      	b.eq	0x17b0 <_gap_verify_graph+0x174c>
     a58:      	cmp	w8, #0x66
     a5c:      	mov	w8, #0x2d               ; =45
     a60:      	csel	x8, x25, x8, eq
     a64:      	b	0x17b4 <_gap_verify_graph+0x1750>
     a68:      	sub	w8, w21, #0x29
     a6c:      	cmp	w8, #0x3
     a70:      	b.hs	0xaa4 <_gap_verify_graph+0xa40>
     a74:      	add	x0, sp, #0xe8
     a78:      	mov	x1, x19
     a7c:      	mov	w2, w20
     a80:      	add	x23, sp, #0xe8
     a84:      	bl	0xa84 <_gap_verify_graph+0xa20>
		0000000000000a84:  ARM64_RELOC_BRANCH26	_stogir.checked.validate
     a88:      	ldr	x10, [sp, #0x70]
     a8c:      	ldr	w8, [x23]
     a90:      	cmp	w8, #0x1
     a94:      	mov	x8, x25
     a98:      	b.ne	0x17b4 <_gap_verify_graph+0x1750>
     a9c:      	ldr	x8, [x10, #0x8]
     aa0:      	b	0x17b4 <_gap_verify_graph+0x1750>
     aa4:      	cmp	w21, #0x2c
     aa8:      	b.ne	0xb84 <_gap_verify_graph+0xb20>
     aac:      	cmp	w20, #0x1
     ab0:      	b.lt	0xc3c <_gap_verify_graph+0xbd8>
     ab4:      	ldr	x8, [x19, #0x8]
     ab8:      	and	x12, x20, #0x7fffffff
     abc:      	cmp	x8, x12
     ac0:      	b.le	0xc80 <_gap_verify_graph+0xc1c>
     ac4:      	ldr	x9, [x19, #0x80]
     ac8:      	cmp	x9, x12
     acc:      	b.le	0xc80 <_gap_verify_graph+0xc1c>
     ad0:      	ldr	x10, [x19, #0x78]
     ad4:      	ldr	w13, [x10, x12, lsl #2]
     ad8:      	tbnz	w13, #0x1f, 0xc80 <_gap_verify_graph+0xc1c>
     adc:      	ldr	x11, [x19]
     ae0:      	lsl	x12, x12, #4
     ae4:      	ldr	x12, [x11, x12]
     ae8:      	and	x14, x12, #0xffff
     aec:      	cmp	x14, #0x12c
     af0:      	ccmp	w13, #0x1, #0x0, eq
     af4:      	b.ne	0xc70 <_gap_verify_graph+0xc0c>
     af8:      	lsr	x2, x12, #32
     afc:      	cmp	w2, #0x1
     b00:      	b.lt	0x11c4 <_gap_verify_graph+0x1160>
     b04:      	cmp	x8, x2
     b08:      	b.ls	0x11c8 <_gap_verify_graph+0x1164>
     b0c:      	cmp	x9, x2
     b10:      	adrp	x8, 0x0 <ltmp0>
		0000000000000b10:  ARM64_RELOC_PAGE21	l_str.238
     b14:      	add	x8, x8, #0x0
		0000000000000b14:  ARM64_RELOC_PAGEOFF12	l_str.238
     b18:      	mov	w9, #0x17               ; =23
     b1c:      	b.ls	0xc8c <_gap_verify_graph+0xc28>
     b20:      	ldr	w8, [x10, x2, lsl #2]
     b24:      	tbnz	w8, #0x1f, 0x11c8 <_gap_verify_graph+0x1164>
     b28:      	add	x8, x11, x2, lsl #4
     b2c:      	ldr	x8, [x8]
     b30:      	and	w9, w8, #0xff
     b34:      	sub	w9, w9, #0x29
     b38:      	cmp	w9, #0x2
     b3c:      	b.hi	0x13fc <_gap_verify_graph+0x1398>
     b40:      	add	x0, sp, #0xd0
     b44:      	mov	x1, x19
     b48:      	add	x23, sp, #0xd0
     b4c:      	bl	0xb4c <_gap_verify_graph+0xae8>
		0000000000000b4c:  ARM64_RELOC_BRANCH26	_stogir.checked.validate
     b50:      	mov	x28, #0x80000000        ; =2147483648
     b54:      	ldr	x10, [sp, #0x68]
     b58:      	movk	x28, #0x2001, lsl #32
     b5c:      	movk	x28, #0x3c0, lsl #48
     b60:      	ldr	w8, [x23]
     b64:      	cmp	w8, #0x1
     b68:      	mov	x8, x25
     b6c:      	b.eq	0xa9c <_gap_verify_graph+0xa38>
     b70:      	b	0x17b4 <_gap_verify_graph+0x1750>
     b74:      	mov	w9, #0x1                ; =1
     b78:      	str	wzr, [sp, #0x98]
     b7c:      	str	w9, [sp, #0x88]
     b80:      	b	0x530 <_gap_verify_graph+0x4cc>
     b84:      	sub	w8, w21, #0x7e
     b88:      	cmp	w8, #0x4
     b8c:      	b.hi	0x17b0 <_gap_verify_graph+0x174c>
     b90:      	cmp	w20, #0x1
     b94:      	b.lt	0xe68 <_gap_verify_graph+0xe04>
     b98:      	ldr	x9, [x19, #0x8]
     b9c:      	and	x8, x20, #0x7fffffff
     ba0:      	cmp	x9, x8
     ba4:      	b.le	0x1190 <_gap_verify_graph+0x112c>
     ba8:      	ldr	x9, [x19, #0x80]
     bac:      	cmp	x9, x8
     bb0:      	b.le	0x1190 <_gap_verify_graph+0x112c>
     bb4:      	ldr	x9, [x19, #0x78]
     bb8:      	ldr	w9, [x9, x8, lsl #2]
     bbc:      	tbnz	w9, #0x1f, 0x1190 <_gap_verify_graph+0x112c>
     bc0:      	ldr	x9, [x19]
     bc4:      	add	x11, x9, x8, lsl #4
     bc8:      	cmp	w20, #0x1
     bcc:      	ldr	x10, [x11]
     bd0:      	and	w12, w10, #0xff
     bd4:      	b.lt	0x1120 <_gap_verify_graph+0x10bc>
     bd8:      	sub	w8, w12, #0x7e
     bdc:      	cmp	w8, #0x4
     be0:      	mov	w8, #0x20               ; =32
     be4:      	b.hi	0x1124 <_gap_verify_graph+0x10c0>
     be8:      	ldr	x8, [x19, #0x78]
     bec:      	and	x9, x20, #0x7fffffff
     bf0:      	and	x13, x10, #0xff
     bf4:      	ldr	w8, [x8, x9, lsl #2]
     bf8:      	adrp	x9, 0x0 <ltmp0>
		0000000000000bf8:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.OPERAND-SLOTS
     bfc:      	add	x9, x9, #0x0
		0000000000000bfc:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.OPERAND-SLOTS
     c00:      	ldrsb	w9, [x9, x13]
     c04:      	cmp	w8, w9
     c08:      	mov	w8, #0x20               ; =32
     c0c:      	csel	x8, x8, xzr, ne
     c10:      	b	0x1124 <_gap_verify_graph+0x10c0>
     c14:      	ldr	x8, [x19, #0x30]
     c18:      	ldr	x9, [x19, #0x58]
     c1c:      	cmp	x8, x9
     c20:      	b.ne	0xc34 <_gap_verify_graph+0xbd0>
     c24:      	ldr	x9, [sp, #0x80]
     c28:      	asr	x9, x9, #32
     c2c:      	cmn	x8, x9
     c30:      	b.ge	0xcd0 <_gap_verify_graph+0xc6c>
     c34:      	mov	w8, #0x16               ; =22
     c38:      	b	0x17b4 <_gap_verify_graph+0x1750>
     c3c:      	tbz	w20, #0x1f, 0xc80 <_gap_verify_graph+0xc1c>
     c40:      	ldr	x8, [x19, #0x30]
     c44:      	ldr	x9, [x19, #0x58]
     c48:      	cmp	x8, x9
     c4c:      	b.ne	0xc80 <_gap_verify_graph+0xc1c>
     c50:      	sxtw	x9, w20
     c54:      	cmn	x8, x9
     c58:      	b.lt	0xc80 <_gap_verify_graph+0xc1c>
     c5c:      	ldr	x8, [x19, #0x50]
     c60:      	mvn	x9, x9
     c64:      	ldr	w8, [x8, x9, lsl #2]
     c68:      	cmp	w8, #0x0
     c6c:      	b.le	0xc80 <_gap_verify_graph+0xc1c>
     c70:      	adrp	x8, 0x0 <ltmp0>
		0000000000000c70:  ARM64_RELOC_PAGE21	l_str.243
     c74:      	add	x8, x8, #0x0
		0000000000000c74:  ARM64_RELOC_PAGEOFF12	l_str.243
     c78:      	mov	w9, #0x1c               ; =28
     c7c:      	b	0xc8c <_gap_verify_graph+0xc28>
     c80:      	adrp	x8, 0x0 <ltmp0>
		0000000000000c80:  ARM64_RELOC_PAGE21	l_str.242
     c84:      	add	x8, x8, #0x0
		0000000000000c84:  ARM64_RELOC_PAGEOFF12	l_str.242
     c88:      	mov	w9, #0x10               ; =16
     c8c:      	mov	w10, #0x1               ; =1
     c90:      	stp	x8, x9, [sp, #0xd8]
     c94:      	str	w10, [sp, #0xd0]
     c98:      	ldr	x10, [sp, #0x68]
     c9c:      	ldr	x8, [x10, #0x8]
     ca0:      	b	0x17b4 <_gap_verify_graph+0x1750>
     ca4:      	ldr	x8, [x19, #0x50]
     ca8:      	mvn	x9, x9
     cac:      	ldr	w8, [x8, x9, lsl #2]
     cb0:      	mov	w9, #0x3b               ; =59
     cb4:      	cmp	w8, #0x0
     cb8:      	adrp	x8, 0x0 <ltmp0>
		0000000000000cb8:  ARM64_RELOC_PAGE21	l_str.544
     cbc:      	add	x8, x8, #0x0
		0000000000000cbc:  ARM64_RELOC_PAGEOFF12	l_str.544
     cc0:      	csel	x28, x8, x26, gt
     cc4:      	mov	w8, #0x1a               ; =26
     cc8:      	csel	x25, x9, x8, gt
     ccc:      	b	0x9cc <_gap_verify_graph+0x968>
     cd0:      	ldr	x8, [x19, #0x50]
     cd4:      	mvn	x9, x9
     cd8:      	ldr	w8, [x8, x9, lsl #2]
     cdc:      	mov	w9, #0x2d               ; =45
     ce0:      	cmp	w8, #0x0
     ce4:      	mov	w8, #0x16               ; =22
     ce8:      	csel	x8, x9, x8, gt
     cec:      	b	0x17b4 <_gap_verify_graph+0x1750>
     cf0:      	add	x0, sp, #0xa0
     cf4:      	mov	x1, x19
     cf8:      	mov	w2, w20
     cfc:      	str	x3, [sp, #0x60]
     d00:      	bl	0xd00 <_gap_verify_graph+0xc9c>
		0000000000000d00:  ARM64_RELOC_BRANCH26	_stogir.conditional.validate
     d04:      	b	0xd1c <_gap_verify_graph+0xcb8>
     d08:      	add	x0, sp, #0xa0
     d0c:      	mov	x1, x19
     d10:      	mov	w2, w20
     d14:      	str	x3, [sp, #0x60]
     d18:      	bl	0xd18 <_gap_verify_graph+0xcb4>
		0000000000000d18:  ARM64_RELOC_BRANCH26	_stogir.conversion.validate
     d1c:      	ldr	w8, [sp, #0xa0]
     d20:      	ldr	x9, [sp, #0xb0]
     d24:      	adrp	x16, 0x0 <ltmp0>
		0000000000000d24:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
     d28:      	add	x16, x16, #0x0
		0000000000000d28:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
     d2c:      	ldr	x3, [sp, #0x60]
     d30:      	cmp	w8, #0x1
     d34:      	csel	x25, x9, xzr, eq
     d38:      	cmp	w21, #0x44
     d3c:      	cset	w8, ne
     d40:      	orr	w8, w8, w27
     d44:      	tbnz	w8, #0x0, 0x9f4 <_gap_verify_graph+0x990>
     d48:      	add	x0, sp, #0xb8
     d4c:      	mov	x1, x19
     d50:      	mov	w2, w20
     d54:      	bl	0xd54 <_gap_verify_graph+0xcf0>
		0000000000000d54:  ARM64_RELOC_BRANCH26	_stogir.copy.validate
     d58:      	ldr	w8, [sp, #0xb8]
     d5c:      	ldr	x9, [sp, #0xc8]
     d60:      	cmp	w8, #0x1
     d64:      	csel	x8, x9, x25, eq
     d68:      	b	0x17b4 <_gap_verify_graph+0x1750>
     d6c:      	ldr	x10, [x8, #0x8]
     d70:      	sub	w8, w11, #0x3d
     d74:      	lsr	x12, x1, #32
     d78:      	ubfx	w15, w1, #8, #8
     d7c:      	mov	w13, w1
     d80:      	cmp	w8, #0x2
     d84:      	b.hi	0xe74 <_gap_verify_graph+0xe10>
     d88:      	cmp	w11, #0x3e
     d8c:      	mov	w8, #0x3                ; =3
     d90:      	mov	w9, #0x2                ; =2
     d94:      	csinc	w8, w8, wzr, eq
     d98:      	cmp	w11, #0x3d
     d9c:      	csel	w8, w9, w8, eq
     da0:      	cmp	w14, w8
     da4:      	b.ne	0x11b4 <_gap_verify_graph+0x1150>
     da8:      	cmp	w12, #0x1
     dac:      	b.lt	0x11d8 <_gap_verify_graph+0x1174>
     db0:      	cmp	x0, x12
     db4:      	stp	x0, x10, [sp, #0x48]
     db8:      	str	w15, [sp, #0x5c]
     dbc:      	b.ls	0x11dc <_gap_verify_graph+0x1178>
     dc0:      	cmp	x17, x12
     dc4:      	adrp	x28, 0x0 <ltmp0>
		0000000000000dc4:  ARM64_RELOC_PAGE21	l_str.522
     dc8:      	add	x28, x28, #0x0
		0000000000000dc8:  ARM64_RELOC_PAGEOFF12	l_str.522
     dcc:      	mov	w25, #0x1b              ; =27
     dd0:      	stp	x17, x4, [sp, #0x38]
     dd4:      	b.ls	0x9cc <_gap_verify_graph+0x968>
     dd8:      	mov	x8, x12
     ddc:      	mov	x9, x12
     de0:      	ldr	w8, [x23, x8, lsl #2]
     de4:      	tbnz	w8, #0x1f, 0x1608 <_gap_verify_graph+0x15a4>
     de8:      	ldr	x8, [sp, #0x40]
     dec:      	str	x3, [sp, #0x60]
     df0:      	add	x8, x8, x9, lsl #4
     df4:      	ldr	w9, [sp, #0x5c]
     df8:      	cmp	w11, #0x3d
     dfc:      	ldr	x8, [x8]
     e00:      	ubfx	w10, w8, #8, #8
     e04:      	str	w10, [sp, #0x24]
     e08:      	csel	w10, w10, w9, eq
     e0c:      	sub	w9, w10, #0x10
     e10:      	str	x10, [sp, #0x8]
     e14:      	and	w10, w10, #0xf
     e18:      	str	w10, [sp, #0x14]
     e1c:      	sub	w10, w10, #0x1
     e20:      	cmp	w9, #0x70
     e24:      	ccmp	w10, #0xd, #0x2, lo
     e28:      	cset	w9, lo
     e2c:      	str	w9, [sp, #0x18]
     e30:      	b.hs	0x1f98 <_gap_verify_graph+0x1f34>
     e34:      	and	w8, w8, #0xff
     e38:      	mov	w9, #0x46               ; =70
     e3c:      	cmp	w8, #0x48
     e40:      	ccmp	w8, w9, #0x4, ne
     e44:      	mov	w8, #0x36               ; =54
     e48:      	adrp	x9, 0x0 <ltmp0>
		0000000000000e48:  ARM64_RELOC_PAGE21	l_str.523
     e4c:      	add	x9, x9, #0x0
		0000000000000e4c:  ARM64_RELOC_PAGEOFF12	l_str.523
     e50:      	csel	x8, x8, xzr, eq
     e54:      	str	x8, [sp, #0x30]
     e58:      	adrp	x8, 0x0 <ltmp0>
		0000000000000e58:  ARM64_RELOC_PAGE21	l_str.524
     e5c:      	add	x8, x8, #0x0
		0000000000000e5c:  ARM64_RELOC_PAGEOFF12	l_str.524
     e60:      	csel	x8, x8, x9, eq
     e64:      	b	0x1fa8 <_gap_verify_graph+0x1f44>
     e68:      	tbnz	w20, #0x1f, 0x10d0 <_gap_verify_graph+0x106c>
     e6c:      	mov	w25, #0x1a              ; =26
     e70:      	b	0x1958 <_gap_verify_graph+0x18f4>
     e74:      	and	w30, w13, #0xfe
     e78:      	lsr	w25, w1, #8
     e7c:      	ubfx	w2, w13, #8, #4
     e80:      	sub	w8, w30, #0xe
     e84:      	cmp	w8, #0xb
     e88:      	b.hi	0x1074 <_gap_verify_graph+0x1010>
     e8c:      	and	w8, w25, #0xf0
     e90:      	sub	w9, w2, #0x1
     e94:      	sub	w8, w8, #0x10
     e98:      	cmp	w9, #0xd
     e9c:      	mov	w9, #0x70               ; =112
     ea0:      	ccmp	w8, w9, #0x2, lo
     ea4:      	b.hs	0x1074 <_gap_verify_graph+0x1010>
     ea8:      	cmp	w14, #0x2
     eac:      	b.ne	0x11ec <_gap_verify_graph+0x1188>
     eb0:      	mov	w14, w11
     eb4:      	mov	x11, x10
     eb8:      	mov	w13, w15
     ebc:      	cmp	w12, #0x1
     ec0:      	str	x3, [sp, #0x60]
     ec4:      	b.lt	0x21c8 <_gap_verify_graph+0x2164>
     ec8:      	cmp	x0, x12
     ecc:      	b.ls	0x2278 <_gap_verify_graph+0x2214>
     ed0:      	ldr	x3, [sp, #0x60]
     ed4:      	mov	x10, x12
     ed8:      	cmp	x17, x12
     edc:      	adrp	x28, 0x0 <ltmp0>
		0000000000000edc:  ARM64_RELOC_PAGE21	l_str.517
     ee0:      	add	x28, x28, #0x0
		0000000000000ee0:  ARM64_RELOC_PAGEOFF12	l_str.517
     ee4:      	mov	w25, #0x21              ; =33
     ee8:      	adrp	x16, 0x0 <ltmp0>
		0000000000000ee8:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
     eec:      	add	x16, x16, #0x0
		0000000000000eec:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
     ef0:      	adrp	x26, 0x0 <ltmp0>
		0000000000000ef0:  ARM64_RELOC_PAGE21	l_str.543
     ef4:      	add	x26, x26, #0x0
		0000000000000ef4:  ARM64_RELOC_PAGEOFF12	l_str.543
     ef8:      	b.ls	0x9cc <_gap_verify_graph+0x968>
     efc:      	ldr	w8, [x23, x10, lsl #2]
     f00:      	tbnz	w8, #0x1f, 0x245c <_gap_verify_graph+0x23f8>
     f04:      	mov	x9, x0
     f08:      	add	x8, x4, x10, lsl #4
     f0c:      	ldr	x8, [x8]
     f10:      	cmp	w11, #0x1
     f14:      	b.lt	0x2218 <_gap_verify_graph+0x21b4>
     f18:      	and	x10, x11, #0x7fffffff
     f1c:      	cmp	x9, x10
     f20:      	b.ls	0x2468 <_gap_verify_graph+0x2404>
     f24:      	ldr	x3, [sp, #0x60]
     f28:      	cmp	x17, x10
     f2c:      	adrp	x28, 0x0 <ltmp0>
		0000000000000f2c:  ARM64_RELOC_PAGE21	l_str.518
     f30:      	add	x28, x28, #0x0
		0000000000000f30:  ARM64_RELOC_PAGEOFF12	l_str.518
     f34:      	mov	w25, #0x21              ; =33
     f38:      	adrp	x16, 0x0 <ltmp0>
		0000000000000f38:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
     f3c:      	add	x16, x16, #0x0
		0000000000000f3c:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
     f40:      	adrp	x26, 0x0 <ltmp0>
		0000000000000f40:  ARM64_RELOC_PAGE21	l_str.543
     f44:      	add	x26, x26, #0x0
		0000000000000f44:  ARM64_RELOC_PAGEOFF12	l_str.543
     f48:      	b.ls	0x9cc <_gap_verify_graph+0x968>
     f4c:      	ldr	w9, [x23, x10, lsl #2]
     f50:      	tbnz	w9, #0x1f, 0x245c <_gap_verify_graph+0x23f8>
     f54:      	add	x9, x4, x10, lsl #4
     f58:      	sub	w10, w14, #0xe
     f5c:      	cmp	w10, #0xb
     f60:      	b.hi	0x2268 <_gap_verify_graph+0x2204>
     f64:      	lsr	x10, x8, #8
     f68:      	ubfx	x12, x8, #8, #8
     f6c:      	and	w11, w10, #0xf
     f70:      	str	x12, [sp, #0x8]
     f74:      	sub	w12, w12, #0x10
     f78:      	sub	w11, w11, #0x1
     f7c:      	and	w23, w10, #0xf
     f80:      	cmp	w11, #0xd
     f84:      	mov	w11, #0x70              ; =112
     f88:      	ccmp	w12, w11, #0x2, lo
     f8c:      	b.hs	0x2268 <_gap_verify_graph+0x2204>
     f90:      	and	w11, w10, #0xe
     f94:      	cmp	w14, #0x18
     f98:      	ccmp	w11, #0xc, #0x4, hs
     f9c:      	b.ne	0x2268 <_gap_verify_graph+0x2204>
     fa0:      	ldr	x9, [x9]
     fa4:      	and	w10, w10, #0xff
     fa8:      	ldr	x3, [sp, #0x60]
     fac:      	adrp	x28, 0x0 <ltmp0>
		0000000000000fac:  ARM64_RELOC_PAGE21	l_str.519
     fb0:      	add	x28, x28, #0x0
		0000000000000fb0:  ARM64_RELOC_PAGEOFF12	l_str.519
     fb4:      	mov	w25, #0x33              ; =51
     fb8:      	lsr	x11, x9, #8
     fbc:      	adrp	x16, 0x0 <ltmp0>
		0000000000000fbc:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
     fc0:      	add	x16, x16, #0x0
		0000000000000fc0:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
     fc4:      	adrp	x26, 0x0 <ltmp0>
		0000000000000fc4:  ARM64_RELOC_PAGE21	l_str.543
     fc8:      	add	x26, x26, #0x0
		0000000000000fc8:  ARM64_RELOC_PAGEOFF12	l_str.543
     fcc:      	cmp	w10, w11, uxtb
     fd0:      	b.ne	0x9cc <_gap_verify_graph+0x968>
     fd4:      	and	w8, w8, #0xff
     fd8:      	cmp	w8, #0x46
     fdc:      	b.eq	0x3988 <_gap_verify_graph+0x3924>
     fe0:      	ldr	x3, [sp, #0x60]
     fe4:      	cmp	w8, #0x48
     fe8:      	mov	w25, #0x33              ; =51
     fec:      	b.eq	0x9cc <_gap_verify_graph+0x968>
     ff0:      	and	w8, w9, #0xff
     ff4:      	cmp	w8, #0x46
     ff8:      	b.eq	0x3988 <_gap_verify_graph+0x3924>
     ffc:      	ldr	x3, [sp, #0x60]
    1000:      	cmp	w8, #0x48
    1004:      	mov	w25, #0x33              ; =51
    1008:      	b.eq	0x9cc <_gap_verify_graph+0x968>
    100c:      	sub	w8, w13, #0x10
    1010:      	cmp	w2, #0xc
    1014:      	mov	w9, #0x70               ; =112
    1018:      	ccmp	w8, w9, #0x2, lo
    101c:      	b.hs	0x3988 <_gap_verify_graph+0x3924>
    1020:      	ldr	x9, [sp, #0x8]
    1024:      	lsr	w8, w13, #4
    1028:      	mov	w10, #0x1               ; =1
    102c:      	lsr	w9, w9, #4
    1030:      	sub	w8, w8, #0x1
    1034:      	lsl	w8, w10, w8
    1038:      	sub	w9, w9, #0x1
    103c:      	lsl	w9, w10, w9
    1040:      	cmp	w8, w9
    1044:      	b.ne	0x3988 <_gap_verify_graph+0x3924>
    1048:      	mov	w0, w2
    104c:      	bl	0x104c <_gap_verify_graph+0xfe8>
		000000000000104c:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    1050:      	mov	w25, w0
    1054:      	mov	w0, w23
    1058:      	bl	0x1058 <_gap_verify_graph+0xff4>
		0000000000001058:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    105c:      	cmp	w25, w0
    1060:      	b.ne	0x3a2c <_gap_verify_graph+0x39c8>
    1064:      	ldr	x3, [sp, #0x60]
    1068:      	adrp	x16, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001068:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    106c:      	add	x16, x16, #0x0
		000000000000106c:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    1070:      	b	0x2940 <_gap_verify_graph+0x28dc>
    1074:      	and	w8, w13, #0xff
    1078:      	sub	w8, w8, #0x41
    107c:      	cmp	w8, #0x37
    1080:      	b.hi	0x11fc <_gap_verify_graph+0x1198>
    1084:      	mov	x9, #0xc0c1             ; =49345
    1088:      	movk	x9, #0x80, lsl #48
    108c:      	lsr	x8, x9, x8
    1090:      	tbz	w8, #0x0, 0x11fc <_gap_verify_graph+0x1198>
    1094:      	and	x8, x1, #0xfe
    1098:      	cmp	x8, #0x3a
    109c:      	b.eq	0x129c <_gap_verify_graph+0x1238>
    10a0:      	and	w8, w13, #0xff
    10a4:      	sub	w8, w8, #0x1a
    10a8:      	cmp	w8, #0x2e
    10ac:      	b.hi	0x132c <_gap_verify_graph+0x12c8>
    10b0:      	mov	w9, #0x1f               ; =31
    10b4:      	movk	w9, #0xff0, lsl #16
    10b8:      	lsr	x9, x9, x8
    10bc:      	tbnz	w9, #0x0, 0x129c <_gap_verify_graph+0x1238>
    10c0:      	mov	x9, #0x408000000000     ; =70918499991552
    10c4:      	lsr	x8, x9, x8
    10c8:      	tbnz	w8, #0x0, 0x1338 <_gap_verify_graph+0x12d4>
    10cc:      	b	0x132c <_gap_verify_graph+0x12c8>
    10d0:      	ldr	x8, [x19, #0x30]
    10d4:      	ldr	x9, [x19, #0x58]
    10d8:      	cmp	x8, x9
    10dc:      	b.ne	0x1190 <_gap_verify_graph+0x112c>
    10e0:      	sxtw	x9, w20
    10e4:      	cmn	x8, x9
    10e8:      	b.lt	0x1190 <_gap_verify_graph+0x112c>
    10ec:      	ldr	x8, [x19, #0x50]
    10f0:      	mvn	x9, x9
    10f4:      	ldr	w8, [x8, x9, lsl #2]
    10f8:      	cmp	w8, #0x0
    10fc:      	b.le	0x1190 <_gap_verify_graph+0x112c>
    1100:      	mvn	w8, w20
    1104:      	ldr	x9, [x19, #0x28]
    1108:      	and	x8, x8, #0x7fffffff
    110c:      	add	x11, x9, x8, lsl #4
    1110:      	cmp	w20, #0x1
    1114:      	ldr	x10, [x11]
    1118:      	and	w12, w10, #0xff
    111c:      	b.ge	0xbd8 <_gap_verify_graph+0xb74>
    1120:      	mov	w8, #0x20               ; =32
    1124:      	lsr	x9, x10, #32
    1128:      	cmp	w9, #0x1
    112c:      	b.lt	0x1198 <_gap_verify_graph+0x1134>
    1130:      	ldr	x13, [x19, #0x8]
    1134:      	cmp	x13, x9
    1138:      	b.le	0x1198 <_gap_verify_graph+0x1134>
    113c:      	ldr	x13, [x19, #0x80]
    1140:      	cmp	x13, x9
    1144:      	b.le	0x1198 <_gap_verify_graph+0x1134>
    1148:      	ldr	x13, [x19, #0x78]
    114c:      	ldr	w13, [x13, x9, lsl #2]
    1150:      	tbnz	w13, #0x1f, 0x1478 <_gap_verify_graph+0x1414>
    1154:      	ldr	x13, [x19]
    1158:      	lsl	x9, x9, #4
    115c:      	ldr	x9, [x13, x9]
    1160:      	and	w13, w9, #0xff
    1164:      	sub	w13, w13, #0x4f
    1168:      	cmp	w13, #0x33
    116c:      	b.hi	0x1478 <_gap_verify_graph+0x1414>
    1170:      	and	x9, x9, #0xff
    1174:      	adrp	x13, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001174:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.PROPERTIES
    1178:      	add	x13, x13, #0x0
		0000000000001178:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.PROPERTIES
    117c:      	ldrb	w9, [x13, x9]
    1180:      	tst	w9, #0x4
    1184:      	mov	w9, #0x16               ; =22
    1188:      	csel	x8, x8, x9, eq
    118c:      	b	0x147c <_gap_verify_graph+0x1418>
    1190:      	mov	w8, #0x1a               ; =26
    1194:      	b	0x17b4 <_gap_verify_graph+0x1750>
    1198:      	mov	w8, #0x16               ; =22
    119c:      	ubfx	w9, w10, #8, #8
    11a0:      	cmp	w12, #0x82
    11a4:      	b.ne	0x1494 <_gap_verify_graph+0x1430>
    11a8:      	cbz	w9, 0x17ac <_gap_verify_graph+0x1748>
    11ac:      	mov	w8, #0x19               ; =25
    11b0:      	b	0x17b4 <_gap_verify_graph+0x1750>
    11b4:      	adrp	x28, 0x1000 <_gap_verify_graph+0xf9c>
		00000000000011b4:  ARM64_RELOC_PAGE21	l_str.536
    11b8:      	add	x28, x28, #0x0
		00000000000011b8:  ARM64_RELOC_PAGEOFF12	l_str.536
    11bc:      	mov	w25, #0x25              ; =37
    11c0:      	b	0x9cc <_gap_verify_graph+0x968>
    11c4:      	tbnz	x12, #0x3f, 0x13ac <_gap_verify_graph+0x1348>
    11c8:      	adrp	x8, 0x1000 <_gap_verify_graph+0xf9c>
		00000000000011c8:  ARM64_RELOC_PAGE21	l_str.238
    11cc:      	add	x8, x8, #0x0
		00000000000011cc:  ARM64_RELOC_PAGEOFF12	l_str.238
    11d0:      	mov	w9, #0x17               ; =23
    11d4:      	b	0xc8c <_gap_verify_graph+0xc28>
    11d8:      	tbnz	x1, #0x3f, 0x142c <_gap_verify_graph+0x13c8>
    11dc:      	adrp	x28, 0x1000 <_gap_verify_graph+0xf9c>
		00000000000011dc:  ARM64_RELOC_PAGE21	l_str.522
    11e0:      	add	x28, x28, #0x0
		00000000000011e0:  ARM64_RELOC_PAGEOFF12	l_str.522
    11e4:      	mov	w25, #0x1b              ; =27
    11e8:      	b	0x9cc <_gap_verify_graph+0x968>
    11ec:      	adrp	x28, 0x1000 <_gap_verify_graph+0xf9c>
		00000000000011ec:  ARM64_RELOC_PAGE21	l_str.521
    11f0:      	add	x28, x28, #0x0
		00000000000011f0:  ARM64_RELOC_PAGEOFF12	l_str.521
    11f4:      	mov	w25, #0x2b              ; =43
    11f8:      	b	0x9cc <_gap_verify_graph+0x968>
    11fc:      	and	w8, w13, #0xfe
    1200:      	mov	x26, x13
    1204:      	str	w14, [sp, #0x30]
    1208:      	str	w8, [sp, #0x14]
    120c:      	sub	w8, w11, #0x55
    1210:      	cmp	w8, #0x4
    1214:      	str	w2, [sp, #0x24]
    1218:      	str	x1, [sp, #0x18]
    121c:      	str	x12, [sp, #0x28]
    1220:      	stp	x0, x10, [sp, #0x48]
    1224:      	stp	x17, x4, [sp, #0x38]
    1228:      	str	w15, [sp, #0x5c]
    122c:      	str	x3, [sp, #0x60]
    1230:      	b.lo	0x1244 <_gap_verify_graph+0x11e0>
    1234:      	mov	x0, x19
    1238:      	mov	w1, w20
    123c:      	bl	0x123c <_gap_verify_graph+0x11d8>
		000000000000123c:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.node?
    1240:      	cbz	w0, 0x2338 <_gap_verify_graph+0x22d4>
    1244:      	mov	x13, x26
    1248:      	ldp	x4, x0, [sp, #0x40]
    124c:      	and	w8, w13, #0xff
    1250:      	ldr	x3, [sp, #0x60]
    1254:      	ldr	w15, [sp, #0x5c]
    1258:      	ldr	x17, [sp, #0x38]
    125c:      	ldr	x10, [sp, #0x50]
    1260:      	cmp	w8, #0x39
    1264:      	ldr	x12, [sp, #0x28]
    1268:      	ldr	x1, [sp, #0x18]
    126c:      	adrp	x16, 0x1000 <_gap_verify_graph+0xf9c>
		000000000000126c:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    1270:      	add	x16, x16, #0x0
		0000000000001270:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    1274:      	ldr	w2, [sp, #0x24]
    1278:      	ldr	w14, [sp, #0x30]
    127c:      	ldr	w30, [sp, #0x14]
    1280:      	adrp	x26, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001280:  ARM64_RELOC_PAGE21	l_str.543
    1284:      	add	x26, x26, #0x0
		0000000000001284:  ARM64_RELOC_PAGEOFF12	l_str.543
    1288:      	and	w11, w13, #0xff
    128c:      	b.hi	0x1094 <_gap_verify_graph+0x1030>
    1290:      	and	x8, x1, #0xff
    1294:      	lsr	x8, x28, x8
    1298:      	tbz	w8, #0x0, 0x1094 <_gap_verify_graph+0x1030>
    129c:      	and	w8, w25, #0xf0
    12a0:      	sub	w9, w2, #0x1
    12a4:      	sub	w8, w8, #0x10
    12a8:      	cmp	w9, #0xd
    12ac:      	mov	w9, #0x70               ; =112
    12b0:      	ccmp	w8, w9, #0x2, lo
    12b4:      	b.hs	0x1318 <_gap_verify_graph+0x12b4>
    12b8:      	and	w8, w13, #0xff
    12bc:      	mov	w7, w14
    12c0:      	mov	x6, x1
    12c4:      	mov	x14, x12
    12c8:      	mov	x5, x13
    12cc:      	cmp	w8, #0x39
    12d0:      	b.hi	0x22a4 <_gap_verify_graph+0x2240>
    12d4:      	mov	x9, #0x80000000         ; =2147483648
    12d8:      	and	x8, x6, #0xff
    12dc:      	movk	x9, #0x2001, lsl #32
    12e0:      	movk	x9, #0x3c0, lsl #48
    12e4:      	lsr	x8, x9, x8
    12e8:      	tbz	w8, #0x0, 0x22a4 <_gap_verify_graph+0x2240>
    12ec:      	mov	x1, x5
    12f0:      	sub	w8, w1, #0x1f
    12f4:      	and	w9, w8, #0xff
    12f8:      	cmp	w9, #0x1b
    12fc:      	b.hs	0x1350 <_gap_verify_graph+0x12ec>
    1300:      	mov	w9, #0x4003             ; =16387
    1304:      	movk	w9, #0x780, lsl #16
    1308:      	lsr	w8, w9, w8
    130c:      	tbz	w8, #0x0, 0x1350 <_gap_verify_graph+0x12ec>
    1310:      	mov	w8, #0x1                ; =1
    1314:      	b	0x1378 <_gap_verify_graph+0x1314>
    1318:      	and	w8, w13, #0xff
    131c:      	cmp	w8, #0x41
    1320:      	b.eq	0x1338 <_gap_verify_graph+0x12d4>
    1324:      	cmp	w8, #0x48
    1328:      	b.eq	0x1338 <_gap_verify_graph+0x12d4>
    132c:      	sub	w8, w11, #0x55
    1330:      	cmp	w8, #0x3
    1334:      	b.hi	0x15d0 <_gap_verify_graph+0x156c>
    1338:      	add	x0, sp, #0xa0
    133c:      	mov	x1, x19
    1340:      	mov	w2, w20
    1344:      	str	x3, [sp, #0x60]
    1348:      	bl	0x1348 <_gap_verify_graph+0x12e4>
		0000000000001348:  ARM64_RELOC_BRANCH26	_stogir.locals.validate
    134c:      	b	0xd1c <_gap_verify_graph+0xcb8>
    1350:      	and	w8, w1, #0xff
    1354:      	cmp	w8, #0x1d
    1358:      	b.ne	0x136c <_gap_verify_graph+0x1308>
    135c:      	and	w11, w1, #0xff
    1360:      	cmp	w7, #0x3
    1364:      	b.eq	0x1390 <_gap_verify_graph+0x132c>
    1368:      	b	0x139c <_gap_verify_graph+0x1338>
    136c:      	cmp	w8, #0x1e
    1370:      	mov	w8, #0x2                ; =2
    1374:      	cinc	w8, w8, eq
    1378:      	cmp	w7, w8
    137c:      	b.ne	0x139c <_gap_verify_graph+0x1338>
    1380:      	and	w9, w1, #0xff
    1384:      	cmp	w9, #0x1d
    1388:      	b.ne	0x209c <_gap_verify_graph+0x2038>
    138c:      	and	w11, w1, #0xff
    1390:      	mov	x16, x10
    1394:      	lsr	x8, x10, #32
    1398:      	b	0x20b0 <_gap_verify_graph+0x204c>
    139c:      	adrp	x28, 0x1000 <_gap_verify_graph+0xf9c>
		000000000000139c:  ARM64_RELOC_PAGE21	l_str.516
    13a0:      	add	x28, x28, #0x0
		00000000000013a0:  ARM64_RELOC_PAGEOFF12	l_str.516
    13a4:      	mov	w25, #0x2b              ; =43
    13a8:      	b	0x9cc <_gap_verify_graph+0x968>
    13ac:      	ldr	x8, [x19, #0x30]
    13b0:      	ldr	x9, [x19, #0x58]
    13b4:      	cmp	x8, x9
    13b8:      	b.ne	0x15dc <_gap_verify_graph+0x1578>
    13bc:      	asr	x9, x12, #32
    13c0:      	cmn	x8, x9
    13c4:      	b.lt	0x15dc <_gap_verify_graph+0x1578>
    13c8:      	ldr	x8, [x19, #0x50]
    13cc:      	mvn	x9, x9
    13d0:      	ldr	w8, [x8, x9, lsl #2]
    13d4:      	cmp	w8, #0x0
    13d8:      	b.le	0x15dc <_gap_verify_graph+0x1578>
    13dc:      	ldr	x8, [x19, #0x28]
    13e0:      	eor	x9, x2, #0xffffffff
    13e4:      	add	x8, x8, x9, lsl #4
    13e8:      	ldr	x8, [x8]
    13ec:      	and	w9, w8, #0xff
    13f0:      	sub	w9, w9, #0x29
    13f4:      	cmp	w9, #0x2
    13f8:      	b.ls	0xb40 <_gap_verify_graph+0xadc>
    13fc:      	and	x9, x8, #0xfe00
    1400:      	and	x8, x8, #0xff00
    1404:      	cmp	x9, #0xdff
    1408:      	ccmp	x8, #0x0, #0x4, ls
    140c:      	b.ne	0x22f4 <_gap_verify_graph+0x2290>
    1410:      	mov	x28, #0x80000000        ; =2147483648
    1414:      	adrp	x8, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001414:  ARM64_RELOC_PAGE21	l_str.239
    1418:      	add	x8, x8, #0x0
		0000000000001418:  ARM64_RELOC_PAGEOFF12	l_str.239
    141c:      	movk	x28, #0x2001, lsl #32
    1420:      	mov	w9, #0x20               ; =32
    1424:      	movk	x28, #0x3c0, lsl #48
    1428:      	b	0xc8c <_gap_verify_graph+0xc28>
    142c:      	ldr	x8, [x19, #0x30]
    1430:      	ldr	x9, [x19, #0x58]
    1434:      	stp	x0, x10, [sp, #0x48]
    1438:      	stp	x17, x4, [sp, #0x38]
    143c:      	cmp	x8, x9
    1440:      	str	w15, [sp, #0x5c]
    1444:      	str	x3, [sp, #0x60]
    1448:      	b.ne	0x15f8 <_gap_verify_graph+0x1594>
    144c:      	asr	x9, x1, #32
    1450:      	cmn	x8, x9
    1454:      	b.lt	0x15f8 <_gap_verify_graph+0x1594>
    1458:      	ldr	x8, [x19, #0x50]
    145c:      	mvn	x9, x9
    1460:      	ldr	w8, [x8, x9, lsl #2]
    1464:      	cmp	w8, #0x0
    1468:      	b.le	0x15f8 <_gap_verify_graph+0x1594>
    146c:      	ldr	x8, [x19, #0x28]
    1470:      	eor	x9, x12, #0xffffffff
    1474:      	b	0xdf0 <_gap_verify_graph+0xd8c>
    1478:      	mov	w8, #0x16               ; =22
    147c:      	mov	x28, #0x80000000        ; =2147483648
    1480:      	movk	x28, #0x2001, lsl #32
    1484:      	movk	x28, #0x3c0, lsl #48
    1488:      	ubfx	w9, w10, #8, #8
    148c:      	cmp	w12, #0x82
    1490:      	b.eq	0x11a8 <_gap_verify_graph+0x1144>
    1494:      	ldr	x11, [x11, #0x8]
    1498:      	cmp	w11, #0x1
    149c:      	b.lt	0x1520 <_gap_verify_graph+0x14bc>
    14a0:      	ldr	x14, [x19, #0x8]
    14a4:      	and	x13, x11, #0x7fffffff
    14a8:      	cmp	x14, x13
    14ac:      	b.le	0x1574 <_gap_verify_graph+0x1510>
    14b0:      	ldr	x14, [x19, #0x80]
    14b4:      	cmp	x14, x13
    14b8:      	b.le	0x1574 <_gap_verify_graph+0x1510>
    14bc:      	ldr	x14, [x19, #0x78]
    14c0:      	ldr	w14, [x14, x13, lsl #2]
    14c4:      	tbnz	w14, #0x1f, 0x1574 <_gap_verify_graph+0x1510>
    14c8:      	ldr	x14, [x19]
    14cc:      	add	x13, x14, x13, lsl #4
    14d0:      	ldr	x13, [x13]
    14d4:      	and	x14, x13, #0xff00
    14d8:      	cmp	x14, #0x600
    14dc:      	b.ne	0x1574 <_gap_verify_graph+0x1510>
    14e0:      	and	w13, w13, #0xff
    14e4:      	mov	w14, #0x46              ; =70
    14e8:      	cmp	w13, #0x48
    14ec:      	ccmp	w13, w14, #0x4, ne
    14f0:      	mov	w13, #0x1b              ; =27
    14f4:      	csel	x8, x8, x13, ne
    14f8:      	cmp	w12, #0x7f
    14fc:      	b.eq	0x1580 <_gap_verify_graph+0x151c>
    1500:      	sub	w13, w9, #0x6
    1504:      	cmn	w13, #0x4
    1508:      	mov	w13, #0x25              ; =37
    150c:      	csel	x8, x13, x8, lo
    1510:      	cmp	w12, #0x7e
    1514:      	b.eq	0x17a0 <_gap_verify_graph+0x173c>
    1518:      	lsr	x12, x11, #32
    151c:      	b	0x1668 <_gap_verify_graph+0x1604>
    1520:      	tbz	w11, #0x1f, 0x1574 <_gap_verify_graph+0x1510>
    1524:      	ldr	x13, [x19, #0x30]
    1528:      	ldr	x14, [x19, #0x58]
    152c:      	cmp	x13, x14
    1530:      	b.ne	0x1574 <_gap_verify_graph+0x1510>
    1534:      	sxtw	x14, w11
    1538:      	cmn	x13, x14
    153c:      	b.lt	0x1574 <_gap_verify_graph+0x1510>
    1540:      	ldr	x13, [x19, #0x50]
    1544:      	mvn	x14, x14
    1548:      	ldr	w13, [x13, x14, lsl #2]
    154c:      	cmp	w13, #0x0
    1550:      	b.le	0x1574 <_gap_verify_graph+0x1510>
    1554:      	mvn	w13, w11
    1558:      	ldr	x14, [x19, #0x28]
    155c:      	and	x13, x13, #0x7fffffff
    1560:      	add	x13, x14, x13, lsl #4
    1564:      	ldr	x13, [x13]
    1568:      	and	x14, x13, #0xff00
    156c:      	cmp	x14, #0x600
    1570:      	b.eq	0x14e0 <_gap_verify_graph+0x147c>
    1574:      	mov	w8, #0x1b               ; =27
    1578:      	cmp	w12, #0x7f
    157c:      	b.ne	0x1500 <_gap_verify_graph+0x149c>
    1580:      	lsr	x12, x11, #32
    1584:      	cmp	w9, #0x0
    1588:      	mov	w13, #0x19              ; =25
    158c:      	csel	x8, x8, x13, eq
    1590:      	cmp	w12, #0x1
    1594:      	b.lt	0x1610 <_gap_verify_graph+0x15ac>
    1598:      	ldr	x13, [x19, #0x8]
    159c:      	cmp	x13, x12
    15a0:      	b.le	0x1654 <_gap_verify_graph+0x15f0>
    15a4:      	ldr	x13, [x19, #0x80]
    15a8:      	cmp	x13, x12
    15ac:      	b.le	0x1654 <_gap_verify_graph+0x15f0>
    15b0:      	ldr	x13, [x19, #0x78]
    15b4:      	ldr	w13, [x13, x12, lsl #2]
    15b8:      	tbnz	w13, #0x1f, 0x1654 <_gap_verify_graph+0x15f0>
    15bc:      	ldr	x9, [x19]
    15c0:      	add	x9, x9, x12, lsl #4
    15c4:      	ldr	w9, [x9]
    15c8:      	ubfx	w9, w9, #8, #8
    15cc:      	b	0x1658 <_gap_verify_graph+0x15f4>
    15d0:      	mov	w0, wzr
    15d4:      	str	wzr, [sp, #0xa0]
    15d8:      	b	0x3748 <_gap_verify_graph+0x36e4>
    15dc:      	mov	x28, #0x80000000        ; =2147483648
    15e0:      	adrp	x8, 0x1000 <_gap_verify_graph+0xf9c>
		00000000000015e0:  ARM64_RELOC_PAGE21	l_str.238
    15e4:      	add	x8, x8, #0x0
		00000000000015e4:  ARM64_RELOC_PAGEOFF12	l_str.238
    15e8:      	movk	x28, #0x2001, lsl #32
    15ec:      	mov	w9, #0x17               ; =23
    15f0:      	movk	x28, #0x3c0, lsl #48
    15f4:      	b	0xc8c <_gap_verify_graph+0xc28>
    15f8:      	adrp	x28, 0x1000 <_gap_verify_graph+0xf9c>
		00000000000015f8:  ARM64_RELOC_PAGE21	l_str.522
    15fc:      	add	x28, x28, #0x0
		00000000000015fc:  ARM64_RELOC_PAGEOFF12	l_str.522
    1600:      	mov	w25, #0x1b              ; =27
    1604:      	b	0x394c <_gap_verify_graph+0x38e8>
    1608:      	mov	w25, #0x1b              ; =27
    160c:      	b	0x9cc <_gap_verify_graph+0x968>
    1610:      	tbz	x11, #0x3f, 0x1654 <_gap_verify_graph+0x15f0>
    1614:      	ldr	x13, [x19, #0x30]
    1618:      	ldr	x14, [x19, #0x58]
    161c:      	cmp	x13, x14
    1620:      	b.ne	0x1654 <_gap_verify_graph+0x15f0>
    1624:      	asr	x14, x11, #32
    1628:      	cmn	x13, x14
    162c:      	b.lt	0x1654 <_gap_verify_graph+0x15f0>
    1630:      	ldr	x13, [x19, #0x50]
    1634:      	mvn	x14, x14
    1638:      	ldr	w13, [x13, x14, lsl #2]
    163c:      	cmp	w13, #0x0
    1640:      	b.le	0x1654 <_gap_verify_graph+0x15f0>
    1644:      	ldr	x9, [x19, #0x28]
    1648:      	eor	x13, x12, #0xffffffff
    164c:      	add	x9, x9, x13, lsl #4
    1650:      	b	0x15c4 <_gap_verify_graph+0x1560>
    1654:      	mov	w8, #0x1a               ; =26
    1658:      	sub	w13, w9, #0x6
    165c:      	cmn	w13, #0x4
    1660:      	mov	w13, #0x25              ; =37
    1664:      	csel	x8, x13, x8, lo
    1668:      	cmp	w12, #0x1
    166c:      	b.lt	0x16d8 <_gap_verify_graph+0x1674>
    1670:      	ldr	x11, [x19, #0x8]
    1674:      	cmp	x11, x12
    1678:      	b.le	0x1728 <_gap_verify_graph+0x16c4>
    167c:      	ldr	x11, [x19, #0x80]
    1680:      	cmp	x11, x12
    1684:      	b.le	0x1728 <_gap_verify_graph+0x16c4>
    1688:      	ldr	x11, [x19, #0x78]
    168c:      	ldr	w11, [x11, x12, lsl #2]
    1690:      	tbnz	w11, #0x1f, 0x1728 <_gap_verify_graph+0x16c4>
    1694:      	ldr	x11, [x19]
    1698:      	add	x11, x11, x12, lsl #4
    169c:      	ldr	x11, [x11]
    16a0:      	lsr	w12, w11, #8
    16a4:      	cmp	w9, w12, uxtb
    16a8:      	b.ne	0x1728 <_gap_verify_graph+0x16c4>
    16ac:      	and	w11, w11, #0xff
    16b0:      	mov	w12, #0x46              ; =70
    16b4:      	cmp	w11, #0x48
    16b8:      	ccmp	w11, w12, #0x4, ne
    16bc:      	mov	w11, #0x22              ; =34
    16c0:      	csel	x8, x11, x8, eq
    16c4:      	and	w10, w10, #0xff
    16c8:      	cmp	w10, #0x80
    16cc:      	b.ne	0x1738 <_gap_verify_graph+0x16d4>
    16d0:      	mov	w10, #0x1               ; =1
    16d4:      	b	0x1744 <_gap_verify_graph+0x16e0>
    16d8:      	tbz	x11, #0x3f, 0x1728 <_gap_verify_graph+0x16c4>
    16dc:      	ldr	x13, [x19, #0x30]
    16e0:      	ldr	x14, [x19, #0x58]
    16e4:      	cmp	x13, x14
    16e8:      	b.ne	0x1728 <_gap_verify_graph+0x16c4>
    16ec:      	asr	x11, x11, #32
    16f0:      	cmn	x13, x11
    16f4:      	b.lt	0x1728 <_gap_verify_graph+0x16c4>
    16f8:      	ldr	x13, [x19, #0x50]
    16fc:      	mvn	x11, x11
    1700:      	ldr	w11, [x13, x11, lsl #2]
    1704:      	cmp	w11, #0x0
    1708:      	b.le	0x1728 <_gap_verify_graph+0x16c4>
    170c:      	ldr	x11, [x19, #0x28]
    1710:      	eor	x12, x12, #0xffffffff
    1714:      	add	x11, x11, x12, lsl #4
    1718:      	ldr	x11, [x11]
    171c:      	lsr	w12, w11, #8
    1720:      	cmp	w9, w12, uxtb
    1724:      	b.eq	0x16ac <_gap_verify_graph+0x1648>
    1728:      	mov	w8, #0x22               ; =34
    172c:      	and	w10, w10, #0xff
    1730:      	cmp	w10, #0x80
    1734:      	b.eq	0x16d0 <_gap_verify_graph+0x166c>
    1738:      	cmp	w10, #0x81
    173c:      	b.ne	0x17a0 <_gap_verify_graph+0x173c>
    1740:      	mov	w10, wzr
    1744:      	cmp	w20, #0x1
    1748:      	b.lt	0x1778 <_gap_verify_graph+0x1714>
    174c:      	ldr	x12, [x19, #0x8]
    1750:      	and	x11, x20, #0x7fffffff
    1754:      	cmp	x12, x11
    1758:      	b.le	0x1778 <_gap_verify_graph+0x1714>
    175c:      	ldr	x12, [x19, #0x80]
    1760:      	cmp	x12, x11
    1764:      	b.le	0x1778 <_gap_verify_graph+0x1714>
    1768:      	ldr	x12, [x19, #0x78]
    176c:      	ldr	w11, [x12, x11, lsl #2]
    1770:      	cmp	w11, #0x4
    1774:      	b.ge	0x24fc <_gap_verify_graph+0x2498>
    1778:      	mov	x12, xzr
    177c:      	cbz	w12, 0x2514 <_gap_verify_graph+0x24b0>
    1780:      	cbz	w10, 0x2158 <_gap_verify_graph+0x20f4>
    1784:      	mov	x28, #0x80000000        ; =2147483648
    1788:      	cmp	w11, #0x9
    178c:      	movk	x28, #0x2001, lsl #32
    1790:      	movk	x28, #0x3c0, lsl #48
    1794:      	b.ls	0x17ac <_gap_verify_graph+0x1748>
    1798:      	mov	w8, #0x1c               ; =28
    179c:      	b	0x17b4 <_gap_verify_graph+0x1750>
    17a0:      	mov	x28, #0x80000000        ; =2147483648
    17a4:      	movk	x28, #0x2001, lsl #32
    17a8:      	movk	x28, #0x3c0, lsl #48
    17ac:      	cbnz	x8, 0x17b4 <_gap_verify_graph+0x1750>
    17b0:      	mov	x8, x25
    17b4:      	cmp	w21, #0x79
    17b8:      	b.eq	0x17c4 <_gap_verify_graph+0x1760>
    17bc:      	cmp	w21, #0x60
    17c0:      	b.ne	0x1924 <_gap_verify_graph+0x18c0>
    17c4:      	cmp	w20, #0x1
    17c8:      	adrp	x16, 0x1000 <_gap_verify_graph+0xf9c>
		00000000000017c8:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    17cc:      	add	x16, x16, #0x0
		00000000000017cc:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    17d0:      	b.lt	0x1934 <_gap_verify_graph+0x18d0>
    17d4:      	ldr	x9, [x19, #0x8]
    17d8:      	and	x13, x20, #0x7fffffff
    17dc:      	cmp	x9, x13
    17e0:      	b.le	0x1954 <_gap_verify_graph+0x18f0>
    17e4:      	ldr	x10, [x19, #0x80]
    17e8:      	cmp	x10, x13
    17ec:      	b.le	0x1954 <_gap_verify_graph+0x18f0>
    17f0:      	ldr	x11, [x19, #0x78]
    17f4:      	ldr	w16, [x11, x13, lsl #2]
    17f8:      	tbnz	w16, #0x1f, 0x1ba4 <_gap_verify_graph+0x1b40>
    17fc:      	ldr	x12, [x19]
    1800:      	add	x13, x12, x13, lsl #4
    1804:      	ldp	x14, x13, [x13]
    1808:      	and	w15, w14, #0xff
    180c:      	cmp	w15, #0x79
    1810:      	b.eq	0x181c <_gap_verify_graph+0x17b8>
    1814:      	cmp	w15, #0x60
    1818:      	b.ne	0x1bb4 <_gap_verify_graph+0x1b50>
    181c:      	cmp	w15, #0x60
    1820:      	mov	w17, #0x3               ; =3
    1824:      	and	x0, x14, #0xff00
    1828:      	csinc	w17, w17, wzr, ne
    182c:      	cbnz	x0, 0x1bb4 <_gap_verify_graph+0x1b50>
    1830:      	cmp	w16, w17
    1834:      	mov	w25, #0x1b              ; =27
    1838:      	adrp	x16, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001838:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    183c:      	add	x16, x16, #0x0
		000000000000183c:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    1840:      	b.ne	0x1958 <_gap_verify_graph+0x18f4>
    1844:      	cmp	w13, #0x0
    1848:      	mov	w17, #0x79              ; =121
    184c:      	ccmp	w15, w17, #0x0, ne
    1850:      	b.eq	0x1c5c <_gap_verify_graph+0x1bf8>
    1854:      	lsr	x13, x13, #32
    1858:      	cmp	w15, #0x79
    185c:      	and	w15, w14, #0xff
    1860:      	csel	w13, wzr, w13, ne
    1864:      	cmp	w15, #0x79
    1868:      	b.eq	0x1874 <_gap_verify_graph+0x1810>
    186c:      	cmp	w15, #0x60
    1870:      	b.ne	0x1cf8 <_gap_verify_graph+0x1c94>
    1874:      	lsr	x15, x14, #32
    1878:      	cmp	w15, #0x1
    187c:      	b.lt	0x1ea8 <_gap_verify_graph+0x1e44>
    1880:      	cmp	x9, x15
    1884:      	b.ls	0x2978 <_gap_verify_graph+0x2914>
    1888:      	cmp	x10, x15
    188c:      	mov	w25, #0x1d              ; =29
    1890:      	b.ls	0x1958 <_gap_verify_graph+0x18f4>
    1894:      	ldr	w14, [x11, x15, lsl #2]
    1898:      	tbnz	w14, #0x1f, 0x2978 <_gap_verify_graph+0x2914>
    189c:      	lsl	x14, x15, #4
    18a0:      	ldr	x14, [x12, x14]
    18a4:      	and	w15, w14, #0xff
    18a8:      	sub	w15, w15, #0x4f
    18ac:      	cmp	w15, #0x33
    18b0:      	b.hi	0x1edc <_gap_verify_graph+0x1e78>
    18b4:      	and	x14, x14, #0xff
    18b8:      	adrp	x15, 0x1000 <_gap_verify_graph+0xf9c>
		00000000000018b8:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.PROPERTIES
    18bc:      	add	x15, x15, #0x0
		00000000000018bc:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.PROPERTIES
    18c0:      	ldrb	w14, [x15, x14]
    18c4:      	tbnz	w14, #0x2, 0x1edc <_gap_verify_graph+0x1e78>
    18c8:      	mov	x14, x26
    18cc:      	cbz	w13, 0x23ec <_gap_verify_graph+0x2388>
    18d0:      	cmp	w13, #0x1
    18d4:      	b.lt	0x2474 <_gap_verify_graph+0x2410>
    18d8:      	cmp	x9, x13
    18dc:      	b.ls	0x2490 <_gap_verify_graph+0x242c>
    18e0:      	mov	x28, #0x80000000        ; =2147483648
    18e4:      	cmp	x10, x13
    18e8:      	mov	w25, #0x1d              ; =29
    18ec:      	movk	x28, #0x2001, lsl #32
    18f0:      	mov	x26, x14
    18f4:      	movk	x28, #0x3c0, lsl #48
    18f8:      	b.ls	0x1958 <_gap_verify_graph+0x18f4>
    18fc:      	ldr	w9, [x11, x13, lsl #2]
    1900:      	tbnz	w9, #0x1f, 0x2744 <_gap_verify_graph+0x26e0>
    1904:      	lsl	x9, x13, #4
    1908:      	mov	x25, x8
    190c:      	mov	x26, x14
    1910:      	ldrb	w9, [x12, x9]
    1914:      	sub	w9, w9, #0x7a
    1918:      	cmn	w9, #0x4
    191c:      	b.hi	0x1958 <_gap_verify_graph+0x18f4>
    1920:      	b	0x2970 <_gap_verify_graph+0x290c>
    1924:      	mov	x25, x8
    1928:      	adrp	x16, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001928:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    192c:      	add	x16, x16, #0x0
		000000000000192c:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    1930:      	b	0x1958 <_gap_verify_graph+0x18f4>
    1934:      	tbz	w20, #0x1f, 0x1954 <_gap_verify_graph+0x18f0>
    1938:      	ldr	x8, [x19, #0x30]
    193c:      	ldr	x9, [x19, #0x58]
    1940:      	cmp	x8, x9
    1944:      	b.ne	0x1954 <_gap_verify_graph+0x18f0>
    1948:      	sxtw	x9, w20
    194c:      	cmn	x8, x9
    1950:      	b.ge	0x1bf0 <_gap_verify_graph+0x1b8c>
    1954:      	mov	w25, #0x21              ; =33
    1958:      	sub	w8, w21, #0x6d
    195c:      	cmp	w8, #0x8
    1960:      	b.hi	0x1a48 <_gap_verify_graph+0x19e4>
    1964:      	mov	w9, #0x107              ; =263
    1968:      	lsr	w8, w9, w8
    196c:      	tbz	w8, #0x0, 0x1a48 <_gap_verify_graph+0x19e4>
    1970:      	cmp	w20, #0x1
    1974:      	b.lt	0x1a10 <_gap_verify_graph+0x19ac>
    1978:      	ldr	x8, [x19, #0x8]
    197c:      	and	x12, x20, #0x7fffffff
    1980:      	cmp	x8, x12
    1984:      	b.le	0x1a30 <_gap_verify_graph+0x19cc>
    1988:      	ldr	x11, [x19, #0x80]
    198c:      	cmp	x11, x12
    1990:      	b.le	0x1a30 <_gap_verify_graph+0x19cc>
    1994:      	ldr	x9, [x19, #0x78]
    1998:      	ldr	w13, [x9, x12, lsl #2]
    199c:      	tbnz	w13, #0x1f, 0x1a30 <_gap_verify_graph+0x19cc>
    19a0:      	ldr	x10, [x19]
    19a4:      	add	x14, x10, x12, lsl #4
    19a8:      	ldr	x12, [x14]
    19ac:      	and	w23, w12, #0xff
    19b0:      	sub	w15, w23, #0x6d
    19b4:      	cmp	w15, #0x8
    19b8:      	b.hi	0x1bd8 <_gap_verify_graph+0x1b74>
    19bc:      	mov	w16, #0x107             ; =263
    19c0:      	lsr	w16, w16, w15
    19c4:      	tbz	w16, #0x0, 0x1bd8 <_gap_verify_graph+0x1b74>
    19c8:      	tst	x12, #0xff00
    19cc:      	b.ne	0x1bd8 <_gap_verify_graph+0x1b74>
    19d0:      	cmp	w15, #0x2
    19d4:      	mov	w15, #0x2               ; =2
    19d8:      	cinc	w15, w15, lo
    19dc:      	cmp	w13, w15
    19e0:      	b.ne	0x1bd8 <_gap_verify_graph+0x1b74>
    19e4:      	ldr	x3, [x14, #0x8]
    19e8:      	lsr	x2, x12, #32
    19ec:      	cmp	w23, #0x75
    19f0:      	b.ne	0x1c74 <_gap_verify_graph+0x1c10>
    19f4:      	add	x0, sp, #0x100
    19f8:      	mov	x1, x19
    19fc:      	bl	0x19fc <_gap_verify_graph+0x1998>
		00000000000019fc:  ARM64_RELOC_BRANCH26	_stogir.switch.switch-inputs
    1a00:      	ldr	w8, [sp, #0x100]
    1a04:      	adrp	x16, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001a04:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    1a08:      	add	x16, x16, #0x0
		0000000000001a08:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    1a0c:      	b	0x1f58 <_gap_verify_graph+0x1ef4>
    1a10:      	tbz	w20, #0x1f, 0x1a30 <_gap_verify_graph+0x19cc>
    1a14:      	ldr	x8, [x19, #0x30]
    1a18:      	ldr	x9, [x19, #0x58]
    1a1c:      	cmp	x8, x9
    1a20:      	b.ne	0x1a30 <_gap_verify_graph+0x19cc>
    1a24:      	sxtw	x9, w20
    1a28:      	cmn	x8, x9
    1a2c:      	b.ge	0x1bc4 <_gap_verify_graph+0x1b60>
    1a30:      	adrp	x8, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001a30:  ARM64_RELOC_PAGE21	l_str.475
    1a34:      	add	x8, x8, #0x0
		0000000000001a34:  ARM64_RELOC_PAGEOFF12	l_str.475
    1a38:      	mov	w25, #0x1a              ; =26
    1a3c:      	mov	w9, #0x1                ; =1
    1a40:      	stp	x8, x25, [sp, #0x108]
    1a44:      	str	w9, [sp, #0x100]
    1a48:      	sub	w8, w21, #0x51
    1a4c:      	cmp	w8, #0x4
    1a50:      	b.lo	0x1a5c <_gap_verify_graph+0x19f8>
    1a54:      	cmp	w21, #0x42
    1a58:      	b.ne	0x2b78 <_gap_verify_graph+0x2b14>
    1a5c:      	cmp	w20, #0x1
    1a60:      	b.lt	0x1ac4 <_gap_verify_graph+0x1a60>
    1a64:      	ldr	x13, [x19, #0x8]
    1a68:      	and	x8, x20, #0x7fffffff
    1a6c:      	cmp	x13, x8
    1a70:      	b.le	0x1b2c <_gap_verify_graph+0x1ac8>
    1a74:      	ldr	x12, [x19, #0x80]
    1a78:      	cmp	x12, x8
    1a7c:      	b.le	0x1b2c <_gap_verify_graph+0x1ac8>
    1a80:      	ldr	x11, [x19, #0x78]
    1a84:      	ldr	w14, [x11, x8, lsl #2]
    1a88:      	tbnz	w14, #0x1f, 0x1b2c <_gap_verify_graph+0x1ac8>
    1a8c:      	ldr	x10, [x19]
    1a90:      	add	x15, x10, x8, lsl #4
    1a94:      	ldr	x8, [x15]
    1a98:      	and	w9, w8, #0xff
    1a9c:      	cmp	w9, #0x42
    1aa0:      	b.ne	0x1b3c <_gap_verify_graph+0x1ad8>
    1aa4:      	and	x8, x8, #0xffff
    1aa8:      	cmp	x8, #0x642
    1aac:      	ccmp	w14, #0x0, #0x0, eq
    1ab0:      	b.eq	0x2b78 <_gap_verify_graph+0x2b14>
    1ab4:      	mov	w8, #0x1e               ; =30
    1ab8:      	mov	w23, #0x1e              ; =30
    1abc:      	str	x8, [sp, #0x78]
    1ac0:      	b	0x2b7c <_gap_verify_graph+0x2b18>
    1ac4:      	tbz	w20, #0x1f, 0x1b2c <_gap_verify_graph+0x1ac8>
    1ac8:      	ldr	x8, [x19, #0x30]
    1acc:      	ldr	x9, [x19, #0x58]
    1ad0:      	cmp	x8, x9
    1ad4:      	b.ne	0x1b2c <_gap_verify_graph+0x1ac8>
    1ad8:      	sxtw	x9, w20
    1adc:      	cmn	x8, x9
    1ae0:      	b.lt	0x1b2c <_gap_verify_graph+0x1ac8>
    1ae4:      	ldr	x8, [x19, #0x50]
    1ae8:      	mvn	x9, x9
    1aec:      	ldr	w8, [x8, x9, lsl #2]
    1af0:      	cmp	w8, #0x0
    1af4:      	b.le	0x1b2c <_gap_verify_graph+0x1ac8>
    1af8:      	mvn	w8, w20
    1afc:      	ldr	x9, [x19, #0x28]
    1b00:      	and	x8, x8, #0x7fffffff
    1b04:      	lsl	x8, x8, #4
    1b08:      	ldrb	w8, [x9, x8]
    1b0c:      	cmp	x8, #0x42
    1b10:      	b.ne	0x1c44 <_gap_verify_graph+0x1be0>
    1b14:      	mov	w8, #0x1e               ; =30
    1b18:      	mov	w23, #0x1e              ; =30
    1b1c:      	adrp	x16, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001b1c:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    1b20:      	add	x16, x16, #0x0
		0000000000001b20:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    1b24:      	str	x8, [sp, #0x78]
    1b28:      	b	0x2b7c <_gap_verify_graph+0x2b18>
    1b2c:      	mov	w8, #0x19               ; =25
    1b30:      	mov	w23, #0x19              ; =25
    1b34:      	str	x8, [sp, #0x78]
    1b38:      	b	0x2b7c <_gap_verify_graph+0x2b18>
    1b3c:      	and	w16, w8, #0xff
    1b40:      	ldr	x2, [x15, #0x8]
    1b44:      	sub	w17, w16, #0x51
    1b48:      	cmp	w17, #0x4
    1b4c:      	b.lo	0x1b58 <_gap_verify_graph+0x1af4>
    1b50:      	cmp	w16, #0x42
    1b54:      	b.ne	0x1c44 <_gap_verify_graph+0x1be0>
    1b58:      	lsr	x15, x8, #32
    1b5c:      	cmp	w9, #0x51
    1b60:      	b.ne	0x1c10 <_gap_verify_graph+0x1bac>
    1b64:      	cmp	w14, #0x3
    1b68:      	b.ne	0x1c44 <_gap_verify_graph+0x1be0>
    1b6c:      	and	w8, w8, #0xff00
    1b70:      	cmp	w8, #0x600
    1b74:      	b.ne	0x1e9c <_gap_verify_graph+0x1e38>
    1b78:      	lsr	x14, x2, #32
    1b7c:      	cbz	x14, 0x1de4 <_gap_verify_graph+0x1d80>
    1b80:      	cmp	w14, #0x1
    1b84:      	mov	w8, #0x1                ; =1
    1b88:      	b.lt	0x1f88 <_gap_verify_graph+0x1f24>
    1b8c:      	asr	x16, x2, #32
    1b90:      	mov	w23, #0x29              ; =41
    1b94:      	sub	x17, x16, #0x1
    1b98:      	and	x16, x16, x17
    1b9c:      	cbz	x16, 0x1de4 <_gap_verify_graph+0x1d80>
    1ba0:      	b	0x2b58 <_gap_verify_graph+0x2af4>
    1ba4:      	mov	w25, #0x21              ; =33
    1ba8:      	adrp	x16, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001ba8:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    1bac:      	add	x16, x16, #0x0
		0000000000001bac:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    1bb0:      	b	0x1958 <_gap_verify_graph+0x18f4>
    1bb4:      	mov	w25, #0x1b              ; =27
    1bb8:      	adrp	x16, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001bb8:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    1bbc:      	add	x16, x16, #0x0
		0000000000001bbc:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    1bc0:      	b	0x1958 <_gap_verify_graph+0x18f4>
    1bc4:      	ldr	x8, [x19, #0x50]
    1bc8:      	mvn	x9, x9
    1bcc:      	ldr	w8, [x8, x9, lsl #2]
    1bd0:      	cmp	w8, #0x0
    1bd4:      	b.le	0x1c64 <_gap_verify_graph+0x1c00>
    1bd8:      	adrp	x8, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001bd8:  ARM64_RELOC_PAGE21	l_str.476
    1bdc:      	add	x8, x8, #0x0
		0000000000001bdc:  ARM64_RELOC_PAGEOFF12	l_str.476
    1be0:      	mov	w25, #0x20              ; =32
    1be4:      	adrp	x16, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001be4:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    1be8:      	add	x16, x16, #0x0
		0000000000001be8:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    1bec:      	b	0x1a3c <_gap_verify_graph+0x19d8>
    1bf0:      	ldr	x8, [x19, #0x50]
    1bf4:      	mvn	x9, x9
    1bf8:      	ldr	w8, [x8, x9, lsl #2]
    1bfc:      	mov	w9, #0x21               ; =33
    1c00:      	cmp	w8, #0x0
    1c04:      	mov	w8, #0x1b               ; =27
    1c08:      	csel	x25, x8, x9, gt
    1c0c:      	b	0x1958 <_gap_verify_graph+0x18f4>
    1c10:      	cmp	w9, #0x53
    1c14:      	mov	w16, #0x1               ; =1
    1c18:      	cinc	w16, w16, ne
    1c1c:      	cmp	w14, w16
    1c20:      	b.ne	0x1c44 <_gap_verify_graph+0x1be0>
    1c24:      	and	w14, w8, #0xff
    1c28:      	cmp	w14, #0x53
    1c2c:      	b.eq	0x1d00 <_gap_verify_graph+0x1c9c>
    1c30:      	cmp	w14, #0x54
    1c34:      	b.ne	0x1dd4 <_gap_verify_graph+0x1d70>
    1c38:      	mov	w9, wzr
    1c3c:      	mov	w14, wzr
    1c40:      	b	0x1d08 <_gap_verify_graph+0x1ca4>
    1c44:      	mov	w8, #0x19               ; =25
    1c48:      	mov	w23, #0x19              ; =25
    1c4c:      	adrp	x16, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001c4c:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    1c50:      	add	x16, x16, #0x0
		0000000000001c50:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    1c54:      	str	x8, [sp, #0x78]
    1c58:      	b	0x2b7c <_gap_verify_graph+0x2b18>
    1c5c:      	mov	w25, #0x1b              ; =27
    1c60:      	b	0x1958 <_gap_verify_graph+0x18f4>
    1c64:      	adrp	x8, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001c64:  ARM64_RELOC_PAGE21	l_str.475
    1c68:      	add	x8, x8, #0x0
		0000000000001c68:  ARM64_RELOC_PAGEOFF12	l_str.475
    1c6c:      	mov	w25, #0x1a              ; =26
    1c70:      	b	0x1be4 <_gap_verify_graph+0x1b80>
    1c74:      	cmp	w2, #0x1
    1c78:      	b.lt	0x1ef0 <_gap_verify_graph+0x1e8c>
    1c7c:      	cmp	x8, x2
    1c80:      	adrp	x16, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001c80:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    1c84:      	add	x16, x16, #0x0
		0000000000001c84:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    1c88:      	b.ls	0x1f40 <_gap_verify_graph+0x1edc>
    1c8c:      	cmp	x11, x2
    1c90:      	b.ls	0x1f40 <_gap_verify_graph+0x1edc>
    1c94:      	ldr	w8, [x9, x2, lsl #2]
    1c98:      	tbnz	w8, #0x1f, 0x1f40 <_gap_verify_graph+0x1edc>
    1c9c:      	add	x9, x10, x2, lsl #4
    1ca0:      	ldr	x10, [x9]
    1ca4:      	and	x11, x10, #0xffff
    1ca8:      	cmp	x11, #0x75
    1cac:      	b.ne	0x1f2c <_gap_verify_graph+0x1ec8>
    1cb0:      	sub	w11, w23, #0x70
    1cb4:      	cmn	w11, #0x3
    1cb8:      	ccmp	w8, #0x2, #0x0, hs
    1cbc:      	b.ne	0x1f2c <_gap_verify_graph+0x1ec8>
    1cc0:      	str	x3, [sp, #0x60]
    1cc4:      	ldr	x3, [x9, #0x8]
    1cc8:      	lsr	x2, x10, #32
    1ccc:      	sub	x0, x29, #0x70
    1cd0:      	mov	x1, x19
    1cd4:      	mov	x28, x26
    1cd8:      	bl	0x1cd8 <_gap_verify_graph+0x1c74>
		0000000000001cd8:  ARM64_RELOC_BRANCH26	_stogir.switch.switch-inputs
    1cdc:      	ldur	w8, [x29, #-0x70]
    1ce0:      	cmp	w8, #0x1
    1ce4:      	b.ne	0x23b0 <_gap_verify_graph+0x234c>
    1ce8:      	ldp	x9, x10, [x29, #-0x68]
    1cec:      	str	w8, [sp, #0x100]
    1cf0:      	stp	x9, x10, [sp, #0x108]
    1cf4:      	b	0x23d0 <_gap_verify_graph+0x236c>
    1cf8:      	mov	w25, #0x25              ; =37
    1cfc:      	b	0x1958 <_gap_verify_graph+0x18f4>
    1d00:      	mov	w14, #0x6               ; =6
    1d04:      	mov	w9, #0x1                ; =1
    1d08:      	lsr	w8, w8, #8
    1d0c:      	adrp	x16, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001d0c:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    1d10:      	add	x16, x16, #0x0
		0000000000001d10:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    1d14:      	cmp	w14, w8, uxtb
    1d18:      	b.ne	0x1dc8 <_gap_verify_graph+0x1d64>
    1d1c:      	cmp	w15, #0x1
    1d20:      	b.lt	0x1f74 <_gap_verify_graph+0x1f10>
    1d24:      	cmp	x13, x15
    1d28:      	mov	w8, #0x1                ; =1
    1d2c:      	b.ls	0x1f90 <_gap_verify_graph+0x1f2c>
    1d30:      	cmp	x12, x15
    1d34:      	mov	w23, #0x1b              ; =27
    1d38:      	b.ls	0x2b6c <_gap_verify_graph+0x2b08>
    1d3c:      	ldr	w8, [x11, x15, lsl #2]
    1d40:      	tbnz	w8, #0x1f, 0x1f74 <_gap_verify_graph+0x1f10>
    1d44:      	lsl	x8, x15, #4
    1d48:      	ldr	x8, [x10, x8]
    1d4c:      	and	w10, w8, #0xff
    1d50:      	sub	w10, w10, #0x4f
    1d54:      	cmp	w10, #0x33
    1d58:      	b.hi	0x2288 <_gap_verify_graph+0x2224>
    1d5c:      	and	x8, x8, #0xff
    1d60:      	adrp	x10, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001d60:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.PROPERTIES
    1d64:      	add	x10, x10, #0x0
		0000000000001d64:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.PROPERTIES
    1d68:      	ldrb	w8, [x10, x8]
    1d6c:      	ldr	x11, [sp, #0x78]
    1d70:      	mov	w10, #0x1b              ; =27
    1d74:      	ands	w8, w8, #0x4
    1d78:      	lsr	w8, w8, #2
    1d7c:      	csel	x23, x10, x11, ne
    1d80:      	orr	w9, w8, w9
    1d84:      	tbnz	w9, #0x0, 0x2b60 <_gap_verify_graph+0x2afc>
    1d88:      	sub	x0, x29, #0x98
    1d8c:      	mov	x1, x19
    1d90:      	bl	0x1d90 <_gap_verify_graph+0x1d2c>
		0000000000001d90:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    1d94:      	ldur	w8, [x29, #-0x98]
    1d98:      	cbz	w8, 0x2674 <_gap_verify_graph+0x2610>
    1d9c:      	ldur	w8, [x29, #-0x90]
    1da0:      	ldr	x10, [sp, #0x78]
    1da4:      	and	w9, w8, #0xff00
    1da8:      	and	w8, w8, #0xff
    1dac:      	cmp	w9, #0x600
    1db0:      	mov	w9, #0x48               ; =72
    1db4:      	ccmp	w8, w9, #0x4, eq
    1db8:      	mov	w9, #0x29               ; =41
    1dbc:      	cset	w8, eq
    1dc0:      	csel	x23, x9, x10, eq
    1dc4:      	b	0x2b58 <_gap_verify_graph+0x2af4>
    1dc8:      	mov	w8, #0x1                ; =1
    1dcc:      	mov	w23, #0x22              ; =34
    1dd0:      	b	0x2b6c <_gap_verify_graph+0x2b08>
    1dd4:      	and	x8, x8, #0xffff
    1dd8:      	cmp	x8, #0x52
    1ddc:      	b.ne	0x1e9c <_gap_verify_graph+0x1e38>
    1de0:      	lsr	x14, x2, #32
    1de4:      	cmp	w15, #0x1
    1de8:      	b.lt	0x1ee4 <_gap_verify_graph+0x1e80>
    1dec:      	cmp	x13, x15
    1df0:      	mov	w8, #0x1                ; =1
    1df4:      	b.ls	0x1f80 <_gap_verify_graph+0x1f1c>
    1df8:      	cmp	x12, x15
    1dfc:      	mov	w23, #0x1f              ; =31
    1e00:      	b.ls	0x2b58 <_gap_verify_graph+0x2af4>
    1e04:      	ldr	w8, [x11, x15, lsl #2]
    1e08:      	tbnz	w8, #0x1f, 0x1ee4 <_gap_verify_graph+0x1e80>
    1e0c:      	lsl	x8, x15, #4
    1e10:      	ldr	x8, [x10, x8]
    1e14:      	and	w15, w8, #0xff
    1e18:      	sub	w15, w15, #0x4f
    1e1c:      	cmp	w15, #0x33
    1e20:      	b.hi	0x1ee4 <_gap_verify_graph+0x1e80>
    1e24:      	and	x8, x8, #0xff
    1e28:      	adrp	x15, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001e28:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.PROPERTIES
    1e2c:      	add	x15, x15, #0x0
		0000000000001e2c:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.PROPERTIES
    1e30:      	ldrb	w8, [x15, x8]
    1e34:      	mov	x28, x26
    1e38:      	tbnz	w8, #0x2, 0x22e8 <_gap_verify_graph+0x2284>
    1e3c:      	cmp	w2, #0x1
    1e40:      	b.lt	0x24a8 <_gap_verify_graph+0x2444>
    1e44:      	and	x15, x2, #0x7fffffff
    1e48:      	mov	w8, #0x1                ; =1
    1e4c:      	cmp	x13, x15
    1e50:      	b.ls	0x26f4 <_gap_verify_graph+0x2690>
    1e54:      	cmp	x12, x15
    1e58:      	mov	w23, #0x18              ; =24
    1e5c:      	mov	x26, x28
    1e60:      	b.ls	0x2b58 <_gap_verify_graph+0x2af4>
    1e64:      	ldr	w8, [x11, x15, lsl #2]
    1e68:      	tbnz	w8, #0x1f, 0x24f0 <_gap_verify_graph+0x248c>
    1e6c:      	add	x8, x10, x15, lsl #4
    1e70:      	ldr	x8, [x8]
    1e74:      	ubfx	w10, w8, #8, #8
    1e78:      	and	x8, x8, #0xff
    1e7c:      	sub	w10, w10, #0xc
    1e80:      	cmn	w10, #0xb
    1e84:      	mov	w10, #0x48              ; =72
    1e88:      	ccmp	x8, x10, #0x4, hs
    1e8c:      	b.ne	0x2750 <_gap_verify_graph+0x26ec>
    1e90:      	mov	w8, #0x1                ; =1
    1e94:      	mov	w23, #0x29              ; =41
    1e98:      	b	0x2b54 <_gap_verify_graph+0x2af0>
    1e9c:      	mov	w8, #0x1                ; =1
    1ea0:      	mov	w23, #0x29              ; =41
    1ea4:      	b	0x2b58 <_gap_verify_graph+0x2af4>
    1ea8:      	tbz	x14, #0x3f, 0x2978 <_gap_verify_graph+0x2914>
    1eac:      	ldr	x8, [x19, #0x30]
    1eb0:      	ldr	x9, [x19, #0x58]
    1eb4:      	cmp	x8, x9
    1eb8:      	b.ne	0x2978 <_gap_verify_graph+0x2914>
    1ebc:      	asr	x9, x14, #32
    1ec0:      	cmn	x8, x9
    1ec4:      	b.lt	0x2978 <_gap_verify_graph+0x2914>
    1ec8:      	ldr	x8, [x19, #0x50]
    1ecc:      	mvn	x9, x9
    1ed0:      	ldr	w8, [x8, x9, lsl #2]
    1ed4:      	cmp	w8, #0x0
    1ed8:      	b.le	0x2978 <_gap_verify_graph+0x2914>
    1edc:      	mov	w25, #0x2c              ; =44
    1ee0:      	b	0x1958 <_gap_verify_graph+0x18f4>
    1ee4:      	mov	w8, #0x1                ; =1
    1ee8:      	mov	w23, #0x1f              ; =31
    1eec:      	b	0x2b58 <_gap_verify_graph+0x2af4>
    1ef0:      	adrp	x16, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001ef0:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    1ef4:      	add	x16, x16, #0x0
		0000000000001ef4:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    1ef8:      	tbz	x12, #0x3f, 0x1f40 <_gap_verify_graph+0x1edc>
    1efc:      	ldr	x8, [x19, #0x30]
    1f00:      	ldr	x9, [x19, #0x58]
    1f04:      	cmp	x8, x9
    1f08:      	b.ne	0x1f40 <_gap_verify_graph+0x1edc>
    1f0c:      	asr	x9, x12, #32
    1f10:      	cmn	x8, x9
    1f14:      	b.lt	0x1f40 <_gap_verify_graph+0x1edc>
    1f18:      	ldr	x8, [x19, #0x50]
    1f1c:      	mvn	x9, x9
    1f20:      	ldr	w8, [x8, x9, lsl #2]
    1f24:      	cmp	w8, #0x0
    1f28:      	b.le	0x1f40 <_gap_verify_graph+0x1edc>
    1f2c:      	adrp	x9, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001f2c:  ARM64_RELOC_PAGE21	l_str.456
    1f30:      	add	x10, x9, #0x0
		0000000000001f30:  ARM64_RELOC_PAGEOFF12	l_str.456
    1f34:      	mov	w8, #0x1                ; =1
    1f38:      	mov	w9, #0x1f               ; =31
    1f3c:      	b	0x1f50 <_gap_verify_graph+0x1eec>
    1f40:      	adrp	x9, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001f40:  ARM64_RELOC_PAGE21	l_str.455
    1f44:      	add	x10, x9, #0x0
		0000000000001f44:  ARM64_RELOC_PAGEOFF12	l_str.455
    1f48:      	mov	w8, #0x1                ; =1
    1f4c:      	mov	w9, #0x1a               ; =26
    1f50:      	str	w8, [sp, #0x100]
    1f54:      	stp	x10, x9, [sp, #0x108]
    1f58:      	ldr	x9, [sp, #0x110]
    1f5c:      	cmp	w8, #0x1
    1f60:      	csel	x25, x9, x25, eq
    1f64:      	sub	w8, w21, #0x51
    1f68:      	cmp	w8, #0x4
    1f6c:      	b.lo	0x1a5c <_gap_verify_graph+0x19f8>
    1f70:      	b	0x1a54 <_gap_verify_graph+0x19f0>
    1f74:      	mov	w8, #0x1                ; =1
    1f78:      	mov	w23, #0x1b              ; =27
    1f7c:      	b	0x2b6c <_gap_verify_graph+0x2b08>
    1f80:      	mov	w23, #0x1f              ; =31
    1f84:      	b	0x2b58 <_gap_verify_graph+0x2af4>
    1f88:      	mov	w23, #0x29              ; =41
    1f8c:      	b	0x2b58 <_gap_verify_graph+0x2af4>
    1f90:      	mov	w23, #0x1b              ; =27
    1f94:      	b	0x2b6c <_gap_verify_graph+0x2b08>
    1f98:      	mov	w8, #0x36               ; =54
    1f9c:      	str	x8, [sp, #0x30]
    1fa0:      	adrp	x8, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001fa0:  ARM64_RELOC_PAGE21	l_str.524
    1fa4:      	add	x8, x8, #0x0
		0000000000001fa4:  ARM64_RELOC_PAGEOFF12	l_str.524
    1fa8:      	cmp	w11, #0x3f
    1fac:      	str	x8, [sp, #0x28]
    1fb0:      	b.ne	0x2050 <_gap_verify_graph+0x1fec>
    1fb4:      	ldr	w8, [sp, #0x5c]
    1fb8:      	cmp	w8, #0xe
    1fbc:      	b.lo	0x2294 <_gap_verify_graph+0x2230>
    1fc0:      	ldp	w9, w10, [sp, #0x14]
    1fc4:      	ldr	w8, [sp, #0x24]
    1fc8:      	cmp	w10, #0x0
    1fcc:      	sub	w8, w8, #0x1
    1fd0:      	csinv	w0, w9, wzr, ne
    1fd4:      	cmp	w8, #0xd
    1fd8:      	csel	w8, wzr, w10, hs
    1fdc:      	cbz	w8, 0x2294 <_gap_verify_graph+0x2230>
    1fe0:      	ldr	w8, [sp, #0x24]
    1fe4:      	cmp	w0, w8
    1fe8:      	b.eq	0x2920 <_gap_verify_graph+0x28bc>
    1fec:      	sub	w8, w0, #0x1
    1ff0:      	cmp	w8, #0xa
    1ff4:      	b.hi	0x2294 <_gap_verify_graph+0x2230>
    1ff8:      	ldr	w8, [sp, #0x24]
    1ffc:      	ldr	x3, [sp, #0x60]
    2000:      	adrp	x28, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002000:  ARM64_RELOC_PAGE21	l_str.525
    2004:      	add	x28, x28, #0x0
		0000000000002004:  ARM64_RELOC_PAGEOFF12	l_str.525
    2008:      	mov	w25, #0x24              ; =36
    200c:      	adrp	x16, 0x2000 <_gap_verify_graph+0x1f9c>
		000000000000200c:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    2010:      	add	x16, x16, #0x0
		0000000000002010:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    2014:      	cmp	w8, #0xb
    2018:      	adrp	x26, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002018:  ARM64_RELOC_PAGE21	l_str.543
    201c:      	add	x26, x26, #0x0
		000000000000201c:  ARM64_RELOC_PAGEOFF12	l_str.543
    2020:      	b.hi	0x9cc <_gap_verify_graph+0x968>
    2024:      	bl	0x2024 <_gap_verify_graph+0x1fc0>
		0000000000002024:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    2028:      	mov	w23, w0
    202c:      	ldr	w0, [sp, #0x24]
    2030:      	bl	0x2030 <_gap_verify_graph+0x1fcc>
		0000000000002030:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    2034:      	cmp	w23, w0
    2038:      	b.eq	0x2920 <_gap_verify_graph+0x28bc>
    203c:      	mov	w25, #0x24              ; =36
    2040:      	ldr	x3, [sp, #0x60]
    2044:      	adrp	x16, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002044:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    2048:      	add	x16, x16, #0x0
		0000000000002048:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    204c:      	b	0x9cc <_gap_verify_graph+0x968>
    2050:      	mov	w25, w11
    2054:      	cmp	w11, #0x3d
    2058:      	b.ne	0x2310 <_gap_verify_graph+0x22ac>
    205c:      	ldr	w8, [sp, #0x24]
    2060:      	cmp	w8, #0xe
    2064:      	b.lo	0x27b4 <_gap_verify_graph+0x2750>
    2068:      	ldp	w9, w10, [sp, #0x14]
    206c:      	ldr	w8, [sp, #0x5c]
    2070:      	cmp	w10, #0x0
    2074:      	sub	w8, w8, #0x1
    2078:      	csinv	w0, w9, wzr, ne
    207c:      	cmp	w8, #0xd
    2080:      	csel	w8, wzr, w10, hs
    2084:      	cbz	w8, 0x27b4 <_gap_verify_graph+0x2750>
    2088:      	ldr	w8, [sp, #0x5c]
    208c:      	cmp	w0, w8
    2090:      	b.ne	0x2760 <_gap_verify_graph+0x26fc>
    2094:      	ldp	x9, x8, [sp, #0x28]
    2098:      	b	0x27c0 <_gap_verify_graph+0x275c>
    209c:      	lsr	x8, x10, #32
    20a0:      	cmp	w9, #0x1e
    20a4:      	mov	x16, x10
    20a8:      	and	w11, w1, #0xff
    20ac:      	csel	w8, w8, wzr, eq
    20b0:      	mov	x10, #0x80000000        ; =2147483648
    20b4:      	sub	w9, w15, #0x10
    20b8:      	mov	x7, x6
    20bc:      	movk	x10, #0x2001, lsl #32
    20c0:      	cmp	w9, #0x6f
    20c4:      	movk	x10, #0x3c0, lsl #48
    20c8:      	b.hi	0x258c <_gap_verify_graph+0x2528>
    20cc:      	and	w9, w1, #0xff
    20d0:      	cmp	w9, #0x39
    20d4:      	b.hi	0x2550 <_gap_verify_graph+0x24ec>
    20d8:      	and	x9, x7, #0xff
    20dc:      	lsr	x9, x10, x9
    20e0:      	tbz	w9, #0x0, 0x2550 <_gap_verify_graph+0x24ec>
    20e4:      	and	w9, w1, #0xff
    20e8:      	cmp	w9, #0x39
    20ec:      	b.hi	0x25a8 <_gap_verify_graph+0x2544>
    20f0:      	and	x9, x7, #0xff
    20f4:      	lsr	x9, x10, x9
    20f8:      	tbz	w9, #0x0, 0x25a8 <_gap_verify_graph+0x2544>
    20fc:      	and	w9, w1, #0xff
    2100:      	and	w11, w1, #0xff
    2104:      	mov	x13, x14
    2108:      	cmp	w9, #0x39
    210c:      	b.hi	0x2ab0 <_gap_verify_graph+0x2a4c>
    2110:      	and	x9, x7, #0xff
    2114:      	lsr	x9, x10, x9
    2118:      	tbz	w9, #0x0, 0x2ab0 <_gap_verify_graph+0x2a4c>
    211c:      	cmp	w2, #0xb
    2120:      	b.hi	0x2ab0 <_gap_verify_graph+0x2a4c>
    2124:      	cmp	w11, #0x2d
    2128:      	b.eq	0x2ac4 <_gap_verify_graph+0x2a60>
    212c:      	cmp	w2, #0x1
    2130:      	b.ne	0x2680 <_gap_verify_graph+0x261c>
    2134:      	mov	x1, x5
    2138:      	mov	w12, #0x37              ; =55
    213c:      	adrp	x2, 0x2000 <_gap_verify_graph+0x1f9c>
		000000000000213c:  ARM64_RELOC_PAGE21	l_str.508
    2140:      	add	x2, x2, #0x0
		0000000000002140:  ARM64_RELOC_PAGEOFF12	l_str.508
    2144:      	and	w9, w1, #0xff
    2148:      	and	w11, w1, #0xff
    214c:      	mov	x13, x14
    2150:      	mov	x7, x6
    2154:      	b	0x337c <_gap_verify_graph+0x3318>
    2158:      	cmp	w11, #0x1
    215c:      	b.lt	0x23f4 <_gap_verify_graph+0x2390>
    2160:      	ldr	x12, [x19, #0x8]
    2164:      	and	x10, x11, #0x7fffffff
    2168:      	cmp	x12, x10
    216c:      	b.le	0x2448 <_gap_verify_graph+0x23e4>
    2170:      	ldr	x11, [x19, #0x80]
    2174:      	cmp	x11, x10
    2178:      	b.le	0x2448 <_gap_verify_graph+0x23e4>
    217c:      	ldr	x11, [x19, #0x78]
    2180:      	ldr	w11, [x11, x10, lsl #2]
    2184:      	tbnz	w11, #0x1f, 0x2448 <_gap_verify_graph+0x23e4>
    2188:      	ldr	x11, [x19]
    218c:      	add	x10, x11, x10, lsl #4
    2190:      	ldr	x10, [x10]
    2194:      	lsr	w11, w10, #8
    2198:      	cmp	w9, w11, uxtb
    219c:      	b.ne	0x2448 <_gap_verify_graph+0x23e4>
    21a0:      	and	w9, w10, #0xff
    21a4:      	mov	x28, #0x80000000        ; =2147483648
    21a8:      	mov	w10, #0x46              ; =70
    21ac:      	cmp	w9, #0x48
    21b0:      	movk	x28, #0x2001, lsl #32
    21b4:      	ccmp	w9, w10, #0x4, ne
    21b8:      	movk	x28, #0x3c0, lsl #48
    21bc:      	b.ne	0x17ac <_gap_verify_graph+0x1748>
    21c0:      	mov	w8, #0x24               ; =36
    21c4:      	b	0x17b4 <_gap_verify_graph+0x1750>
    21c8:      	tbz	x1, #0x3f, 0x2278 <_gap_verify_graph+0x2214>
    21cc:      	ldr	x8, [x19, #0x30]
    21d0:      	ldr	x10, [x19, #0x58]
    21d4:      	cmp	x8, x10
    21d8:      	b.ne	0x2278 <_gap_verify_graph+0x2214>
    21dc:      	asr	x10, x1, #32
    21e0:      	cmn	x8, x10
    21e4:      	b.lt	0x2278 <_gap_verify_graph+0x2214>
    21e8:      	ldr	x8, [x19, #0x50]
    21ec:      	mvn	x10, x10
    21f0:      	ldr	w8, [x8, x10, lsl #2]
    21f4:      	cmp	w8, #0x0
    21f8:      	b.le	0x2278 <_gap_verify_graph+0x2214>
    21fc:      	ldr	x8, [x19, #0x28]
    2200:      	eor	x10, x12, #0xffffffff
    2204:      	mov	x9, x0
    2208:      	add	x8, x8, x10, lsl #4
    220c:      	ldr	x8, [x8]
    2210:      	cmp	w11, #0x1
    2214:      	b.ge	0xf18 <_gap_verify_graph+0xeb4>
    2218:      	tbz	w11, #0x1f, 0x2468 <_gap_verify_graph+0x2404>
    221c:      	ldr	x9, [x19, #0x30]
    2220:      	ldr	x10, [x19, #0x58]
    2224:      	cmp	x9, x10
    2228:      	b.ne	0x2468 <_gap_verify_graph+0x2404>
    222c:      	sxtw	x10, w11
    2230:      	cmn	x9, x10
    2234:      	b.lt	0x2468 <_gap_verify_graph+0x2404>
    2238:      	ldr	x9, [x19, #0x50]
    223c:      	mvn	x10, x10
    2240:      	ldr	w9, [x9, x10, lsl #2]
    2244:      	cmp	w9, #0x0
    2248:      	b.le	0x2468 <_gap_verify_graph+0x2404>
    224c:      	mvn	w9, w11
    2250:      	ldr	x10, [x19, #0x28]
    2254:      	and	x9, x9, #0x7fffffff
    2258:      	add	x9, x10, x9, lsl #4
    225c:      	sub	w10, w14, #0xe
    2260:      	cmp	w10, #0xb
    2264:      	b.ls	0xf64 <_gap_verify_graph+0xf00>
    2268:      	adrp	x28, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002268:  ARM64_RELOC_PAGE21	l_str.519
    226c:      	add	x28, x28, #0x0
		000000000000226c:  ARM64_RELOC_PAGEOFF12	l_str.519
    2270:      	mov	w25, #0x33              ; =51
    2274:      	b	0x394c <_gap_verify_graph+0x38e8>
    2278:      	adrp	x28, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002278:  ARM64_RELOC_PAGE21	l_str.517
    227c:      	add	x28, x28, #0x0
		000000000000227c:  ARM64_RELOC_PAGEOFF12	l_str.517
    2280:      	mov	w25, #0x21              ; =33
    2284:      	b	0x394c <_gap_verify_graph+0x38e8>
    2288:      	mov	w8, #0x1                ; =1
    228c:      	mov	w23, #0x1b              ; =27
    2290:      	b	0x2b60 <_gap_verify_graph+0x2afc>
    2294:      	adrp	x28, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002294:  ARM64_RELOC_PAGE21	l_str.525
    2298:      	add	x28, x28, #0x0
		0000000000002298:  ARM64_RELOC_PAGEOFF12	l_str.525
    229c:      	mov	w25, #0x24              ; =36
    22a0:      	b	0x394c <_gap_verify_graph+0x38e8>
    22a4:      	and	x8, x6, #0xfe
    22a8:      	cmp	x8, #0x3a
    22ac:      	b.eq	0x12ec <_gap_verify_graph+0x1288>
    22b0:      	and	w8, w5, #0xff
    22b4:      	cmp	w8, #0x35
    22b8:      	b.hi	0x3794 <_gap_verify_graph+0x3730>
    22bc:      	mov	x9, #0x3fc00000000000   ; =17944029765304320
    22c0:      	and	x8, x6, #0xff
    22c4:      	adrp	x28, 0x2000 <_gap_verify_graph+0x1f9c>
		00000000000022c4:  ARM64_RELOC_PAGE21	l_str.516
    22c8:      	add	x28, x28, #0x0
		00000000000022c8:  ARM64_RELOC_PAGEOFF12	l_str.516
    22cc:      	movk	x9, #0x7c00, lsl #16
    22d0:      	mov	w25, #0x2b              ; =43
    22d4:      	lsr	x8, x9, x8
    22d8:      	adrp	x16, 0x2000 <_gap_verify_graph+0x1f9c>
		00000000000022d8:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    22dc:      	add	x16, x16, #0x0
		00000000000022dc:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    22e0:      	tbnz	w8, #0x0, 0x12ec <_gap_verify_graph+0x1288>
    22e4:      	b	0x9cc <_gap_verify_graph+0x968>
    22e8:      	mov	w8, #0x1                ; =1
    22ec:      	mov	w23, #0x1f              ; =31
    22f0:      	b	0x2b54 <_gap_verify_graph+0x2af0>
    22f4:      	mov	x28, #0x80000000        ; =2147483648
    22f8:      	str	wzr, [sp, #0xd0]
    22fc:      	mov	x8, x25
    2300:      	movk	x28, #0x2001, lsl #32
    2304:      	str	wzr, [sp, #0xd8]
    2308:      	movk	x28, #0x3c0, lsl #48
    230c:      	b	0x17b4 <_gap_verify_graph+0x1750>
    2310:      	ldr	w8, [sp, #0x5c]
    2314:      	ldr	w9, [sp, #0x24]
    2318:      	cmp	w9, w8
    231c:      	ldp	x10, x9, [sp, #0x28]
    2320:      	mov	w8, #0x27               ; =39
    2324:      	csel	x8, x9, x8, eq
    2328:      	adrp	x9, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002328:  ARM64_RELOC_PAGE21	l_str.527
    232c:      	add	x9, x9, #0x0
		000000000000232c:  ARM64_RELOC_PAGEOFF12	l_str.527
    2330:      	csel	x9, x10, x9, eq
    2334:      	b	0x27c0 <_gap_verify_graph+0x275c>
    2338:      	and	w8, w26, #0xff
    233c:      	sub	w9, w8, #0x5b
    2340:      	cmp	w9, #0x2
    2344:      	b.lo	0x25d4 <_gap_verify_graph+0x2570>
    2348:      	sub	w9, w8, #0x5d
    234c:      	cmp	w9, #0x2
    2350:      	b.hs	0x2610 <_gap_verify_graph+0x25ac>
    2354:      	ldr	w8, [sp, #0x30]
    2358:      	adrp	x28, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002358:  ARM64_RELOC_PAGE21	l_str.546
    235c:      	add	x28, x28, #0x0
		000000000000235c:  ARM64_RELOC_PAGEOFF12	l_str.546
    2360:      	mov	w25, #0x1a              ; =26
    2364:      	cmp	w8, #0x3
    2368:      	b.ne	0x394c <_gap_verify_graph+0x38e8>
    236c:      	ldr	x3, [sp, #0x60]
    2370:      	ldr	w8, [sp, #0x5c]
    2374:      	adrp	x16, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002374:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    2378:      	add	x16, x16, #0x0
		0000000000002378:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    237c:      	adrp	x26, 0x2000 <_gap_verify_graph+0x1f9c>
		000000000000237c:  ARM64_RELOC_PAGE21	l_str.543
    2380:      	add	x26, x26, #0x0
		0000000000002380:  ARM64_RELOC_PAGEOFF12	l_str.543
    2384:      	cbnz	w8, 0x9cc <_gap_verify_graph+0x968>
    2388:      	ldr	x3, [sp, #0x50]
    238c:      	add	x0, sp, #0xa0
    2390:      	mov	x1, x19
    2394:      	ldr	x2, [sp, #0x28]
    2398:      	lsr	x4, x3, #32
    239c:      	bl	0x239c <_gap_verify_graph+0x2338>
		000000000000239c:  ARM64_RELOC_BRANCH26	_stogir.vector.store-inputs
    23a0:      	mov	x28, #0x80000000        ; =2147483648
    23a4:      	movk	x28, #0x2001, lsl #32
    23a8:      	movk	x28, #0x3c0, lsl #48
    23ac:      	b	0xd1c <_gap_verify_graph+0xcb8>
    23b0:      	ldur	w8, [x29, #-0x68]
    23b4:      	cmp	w23, #0x6f
    23b8:      	str	w8, [sp, #0x5c]
    23bc:      	b.ne	0x2528 <_gap_verify_graph+0x24c4>
    23c0:      	ldr	w9, [sp, #0x5c]
    23c4:      	mov	w8, wzr
    23c8:      	str	wzr, [sp, #0x100]
    23cc:      	str	w9, [sp, #0x108]
    23d0:      	mov	x26, x28
    23d4:      	mov	x28, #0x80000000        ; =2147483648
    23d8:      	adrp	x16, 0x2000 <_gap_verify_graph+0x1f9c>
		00000000000023d8:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    23dc:      	add	x16, x16, #0x0
		00000000000023dc:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    23e0:      	movk	x28, #0x2001, lsl #32
    23e4:      	movk	x28, #0x3c0, lsl #48
    23e8:      	b	0x1f58 <_gap_verify_graph+0x1ef4>
    23ec:      	mov	x25, x8
    23f0:      	b	0x2494 <_gap_verify_graph+0x2430>
    23f4:      	tbz	w11, #0x1f, 0x2448 <_gap_verify_graph+0x23e4>
    23f8:      	ldr	x10, [x19, #0x30]
    23fc:      	ldr	x12, [x19, #0x58]
    2400:      	cmp	x10, x12
    2404:      	b.ne	0x2448 <_gap_verify_graph+0x23e4>
    2408:      	sxtw	x12, w11
    240c:      	cmn	x10, x12
    2410:      	b.lt	0x2448 <_gap_verify_graph+0x23e4>
    2414:      	ldr	x10, [x19, #0x50]
    2418:      	mvn	x12, x12
    241c:      	ldr	w10, [x10, x12, lsl #2]
    2420:      	cmp	w10, #0x0
    2424:      	b.le	0x2448 <_gap_verify_graph+0x23e4>
    2428:      	mvn	w10, w11
    242c:      	ldr	x11, [x19, #0x28]
    2430:      	and	x10, x10, #0x7fffffff
    2434:      	add	x10, x11, x10, lsl #4
    2438:      	ldr	x10, [x10]
    243c:      	lsr	w11, w10, #8
    2440:      	cmp	w9, w11, uxtb
    2444:      	b.eq	0x21a0 <_gap_verify_graph+0x213c>
    2448:      	mov	x28, #0x80000000        ; =2147483648
    244c:      	mov	w8, #0x24               ; =36
    2450:      	movk	x28, #0x2001, lsl #32
    2454:      	movk	x28, #0x3c0, lsl #48
    2458:      	b	0x17b4 <_gap_verify_graph+0x1750>
    245c:      	ldr	x3, [sp, #0x60]
    2460:      	mov	w25, #0x21              ; =33
    2464:      	b	0x9cc <_gap_verify_graph+0x968>
    2468:      	adrp	x28, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002468:  ARM64_RELOC_PAGE21	l_str.518
    246c:      	add	x28, x28, #0x0
		000000000000246c:  ARM64_RELOC_PAGEOFF12	l_str.518
    2470:      	b	0x2280 <_gap_verify_graph+0x221c>
    2474:      	ldr	x8, [x19, #0x30]
    2478:      	ldr	x9, [x19, #0x58]
    247c:      	cmp	x8, x9
    2480:      	b.ne	0x2490 <_gap_verify_graph+0x242c>
    2484:      	sxtw	x9, w13
    2488:      	cmn	x8, x9
    248c:      	b.ge	0x294c <_gap_verify_graph+0x28e8>
    2490:      	mov	w25, #0x1d              ; =29
    2494:      	mov	x28, #0x80000000        ; =2147483648
    2498:      	mov	x26, x14
    249c:      	movk	x28, #0x2001, lsl #32
    24a0:      	movk	x28, #0x3c0, lsl #48
    24a4:      	b	0x1958 <_gap_verify_graph+0x18f4>
    24a8:      	tbz	w2, #0x1f, 0x24f0 <_gap_verify_graph+0x248c>
    24ac:      	ldr	x8, [x19, #0x30]
    24b0:      	ldr	x10, [x19, #0x58]
    24b4:      	cmp	x8, x10
    24b8:      	b.ne	0x24f0 <_gap_verify_graph+0x248c>
    24bc:      	sxtw	x10, w2
    24c0:      	cmn	x8, x10
    24c4:      	b.lt	0x24f0 <_gap_verify_graph+0x248c>
    24c8:      	ldr	x8, [x19, #0x50]
    24cc:      	mvn	x10, x10
    24d0:      	ldr	w8, [x8, x10, lsl #2]
    24d4:      	cmp	w8, #0x0
    24d8:      	b.le	0x24f0 <_gap_verify_graph+0x248c>
    24dc:      	mvn	w8, w2
    24e0:      	ldr	x10, [x19, #0x28]
    24e4:      	and	x8, x8, #0x7fffffff
    24e8:      	add	x8, x10, x8, lsl #4
    24ec:      	b	0x1e70 <_gap_verify_graph+0x1e0c>
    24f0:      	mov	w8, #0x1                ; =1
    24f4:      	mov	w23, #0x18              ; =24
    24f8:      	b	0x2b54 <_gap_verify_graph+0x2af0>
    24fc:      	add	w11, w20, #0x1
    2500:      	ldr	x12, [x19]
    2504:      	ubfiz	x11, x11, #4, #32
    2508:      	ldr	w11, [x12, x11]
    250c:      	mov	w12, #0x1               ; =1
    2510:      	cbnz	w12, 0x1780 <_gap_verify_graph+0x171c>
    2514:      	mov	x28, #0x80000000        ; =2147483648
    2518:      	mov	w8, #0x1d               ; =29
    251c:      	movk	x28, #0x2001, lsl #32
    2520:      	movk	x28, #0x3c0, lsl #48
    2524:      	b	0x17b4 <_gap_verify_graph+0x1750>
    2528:      	ldr	w3, [sp, #0x5c]
    252c:      	sub	x0, x29, #0xc0
    2530:      	mov	x1, x19
    2534:      	ldr	x2, [sp, #0x60]
    2538:      	bl	0x2538 <_gap_verify_graph+0x24d4>
		0000000000002538:  ARM64_RELOC_BRANCH26	_stogir.switch.key
    253c:      	ldur	w8, [x29, #-0xc0]
    2540:      	cmp	w8, #0x1
    2544:      	b.ne	0x26bc <_gap_verify_graph+0x2658>
    2548:      	ldp	x9, x10, [x29, #-0xb8]
    254c:      	b	0x1cec <_gap_verify_graph+0x1c88>
    2550:      	cmp	w30, #0x3a
    2554:      	b.eq	0x20e4 <_gap_verify_graph+0x2080>
    2558:      	and	w9, w1, #0xff
    255c:      	cmp	w9, #0x35
    2560:      	b.hi	0x2134 <_gap_verify_graph+0x20d0>
    2564:      	mov	x10, #0x3fc00000000000  ; =17944029765304320
    2568:      	and	x9, x6, #0xff
    256c:      	mov	x7, x6
    2570:      	movk	x10, #0x7c00, lsl #16
    2574:      	mov	x1, x5
    2578:      	lsr	x9, x10, x9
    257c:      	mov	x10, #0x80000000        ; =2147483648
    2580:      	movk	x10, #0x2001, lsl #32
    2584:      	movk	x10, #0x3c0, lsl #48
    2588:      	tbnz	w9, #0x0, 0x20e4 <_gap_verify_graph+0x2080>
    258c:      	and	w9, w1, #0xff
    2590:      	mov	w12, #0x37              ; =55
    2594:      	adrp	x2, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002594:  ARM64_RELOC_PAGE21	l_str.508
    2598:      	add	x2, x2, #0x0
		0000000000002598:  ARM64_RELOC_PAGEOFF12	l_str.508
    259c:      	and	w11, w1, #0xff
    25a0:      	mov	x13, x14
    25a4:      	b	0x337c <_gap_verify_graph+0x3318>
    25a8:      	sub	w9, w11, #0x31
    25ac:      	cmp	w9, #0x5
    25b0:      	b.hs	0x26fc <_gap_verify_graph+0x2698>
    25b4:      	sub	w9, w2, #0x2
    25b8:      	mov	x1, x5
    25bc:      	mov	x13, x14
    25c0:      	cmp	w9, #0x9
    25c4:      	and	w11, w1, #0xff
    25c8:      	mov	x7, x6
    25cc:      	b.ls	0x2ac4 <_gap_verify_graph+0x2a60>
    25d0:      	b	0x336c <_gap_verify_graph+0x3308>
    25d4:      	ldr	w8, [sp, #0x30]
    25d8:      	cmp	w8, #0x2
    25dc:      	b.ne	0x2724 <_gap_verify_graph+0x26c0>
    25e0:      	ldr	w2, [sp, #0x5c]
    25e4:      	add	x0, sp, #0xa0
    25e8:      	mov	x1, x19
    25ec:      	ldr	x3, [sp, #0x28]
    25f0:      	ldr	x4, [sp, #0x50]
    25f4:      	bl	0x25f4 <_gap_verify_graph+0x2590>
		00000000000025f4:  ARM64_RELOC_BRANCH26	_stogir.vector.memory-inputs
    25f8:      	mov	x28, #0x80000000        ; =2147483648
    25fc:      	adrp	x26, 0x2000 <_gap_verify_graph+0x1f9c>
		00000000000025fc:  ARM64_RELOC_PAGE21	l_str.543
    2600:      	add	x26, x26, #0x0
		0000000000002600:  ARM64_RELOC_PAGEOFF12	l_str.543
    2604:      	movk	x28, #0x2001, lsl #32
    2608:      	movk	x28, #0x3c0, lsl #48
    260c:      	b	0xd1c <_gap_verify_graph+0xcb8>
    2610:      	cmp	w8, #0x43
    2614:      	b.ne	0x2734 <_gap_verify_graph+0x26d0>
    2618:      	ldr	w8, [sp, #0x24]
    261c:      	ldr	w9, [sp, #0x5c]
    2620:      	sub	w8, w8, #0x1
    2624:      	sub	w9, w9, #0x10
    2628:      	cmp	w8, #0xd
    262c:      	mov	w8, #0x70               ; =112
    2630:      	ccmp	w9, w8, #0x2, lo
    2634:      	b.hs	0x29e8 <_gap_verify_graph+0x2984>
    2638:      	ldr	w0, [sp, #0x5c]
    263c:      	bl	0x263c <_gap_verify_graph+0x25d8>
		000000000000263c:  ARM64_RELOC_BRANCH26	_stogir.types.size
    2640:      	ldr	w8, [sp, #0x30]
    2644:      	adrp	x9, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002644:  ARM64_RELOC_PAGE21	l_str.547
    2648:      	add	x9, x9, #0x0
		0000000000002648:  ARM64_RELOC_PAGEOFF12	l_str.547
    264c:      	cmp	w8, #0x3
    2650:      	ccmp	w0, #0x1, #0x8, hs
    2654:      	cset	w8, lt
    2658:      	cmp	w8, #0x0
    265c:      	adrp	x8, 0x2000 <_gap_verify_graph+0x1f9c>
		000000000000265c:  ARM64_RELOC_PAGE21	l_str.548
    2660:      	add	x8, x8, #0x0
		0000000000002660:  ARM64_RELOC_PAGEOFF12	l_str.548
    2664:      	csel	x28, x8, x9, ne
    2668:      	mov	w8, #0x20               ; =32
    266c:      	csel	x25, x8, xzr, ne
    2670:      	b	0x29f4 <_gap_verify_graph+0x2990>
    2674:      	mov	w8, #0x1                ; =1
    2678:      	mov	w23, #0x1b              ; =27
    267c:      	b	0x2b58 <_gap_verify_graph+0x2af4>
    2680:      	and	w9, w5, #0xff
    2684:      	cmp	w9, #0x36
    2688:      	b.eq	0x2ad8 <_gap_verify_graph+0x2a74>
    268c:      	cmp	w9, #0x20
    2690:      	b.eq	0x2a98 <_gap_verify_graph+0x2a34>
    2694:      	mov	x1, x5
    2698:      	cmp	w9, #0x1f
    269c:      	mov	x13, x14
    26a0:      	and	w11, w1, #0xff
    26a4:      	mov	x7, x6
    26a8:      	b.ne	0x2ac4 <_gap_verify_graph+0x2a60>
    26ac:      	cmp	w2, #0x6
    26b0:      	b.ne	0x2ac4 <_gap_verify_graph+0x2a60>
    26b4:      	mov	w9, #0x1f               ; =31
    26b8:      	b	0x3370 <_gap_verify_graph+0x330c>
    26bc:      	ldr	x8, [sp, #0x60]
    26c0:      	cmp	w23, #0x6d
    26c4:      	ldr	w3, [sp, #0x5c]
    26c8:      	ldur	x26, [x29, #-0xb8]
    26cc:      	sub	x0, x29, #0x98
    26d0:      	mov	x1, x19
    26d4:      	lsr	x9, x8, #32
    26d8:      	csel	w2, w8, w9, eq
    26dc:      	bl	0x26dc <_gap_verify_graph+0x2678>
		00000000000026dc:  ARM64_RELOC_BRANCH26	_stogir.switch.key
    26e0:      	ldur	w8, [x29, #-0x98]
    26e4:      	cmp	w8, #0x1
    26e8:      	b.ne	0x2980 <_gap_verify_graph+0x291c>
    26ec:      	ldp	x9, x10, [x29, #-0x90]
    26f0:      	b	0x1cec <_gap_verify_graph+0x1c88>
    26f4:      	mov	w23, #0x18              ; =24
    26f8:      	b	0x2b54 <_gap_verify_graph+0x2af0>
    26fc:      	sub	w9, w11, #0x2e
    2700:      	cmp	w9, #0x2
    2704:      	b.hi	0x29a8 <_gap_verify_graph+0x2944>
    2708:      	mov	x1, x5
    270c:      	cmp	w2, #0xc
    2710:      	mov	x13, x14
    2714:      	and	w11, w1, #0xff
    2718:      	mov	x7, x6
    271c:      	b.lo	0x2ac4 <_gap_verify_graph+0x2a60>
    2720:      	b	0x336c <_gap_verify_graph+0x3308>
    2724:      	adrp	x28, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002724:  ARM64_RELOC_PAGE21	l_str.545
    2728:      	add	x28, x28, #0x0
		0000000000002728:  ARM64_RELOC_PAGEOFF12	l_str.545
    272c:      	mov	w25, #0x19              ; =25
    2730:      	b	0x394c <_gap_verify_graph+0x38e8>
    2734:      	adrp	x28, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002734:  ARM64_RELOC_PAGE21	l_str.556
    2738:      	add	x28, x28, #0x0
		0000000000002738:  ARM64_RELOC_PAGEOFF12	l_str.556
    273c:      	mov	w25, #0x28              ; =40
    2740:      	b	0x394c <_gap_verify_graph+0x38e8>
    2744:      	mov	w25, #0x1d              ; =29
    2748:      	mov	x26, x14
    274c:      	b	0x1958 <_gap_verify_graph+0x18f4>
    2750:      	tbnz	w2, #0x1f, 0x2b1c <_gap_verify_graph+0x2ab8>
    2754:      	ldr	x23, [sp, #0x78]
    2758:      	mov	w8, wzr
    275c:      	b	0x2b54 <_gap_verify_graph+0x2af0>
    2760:      	sub	w8, w0, #0x1
    2764:      	cmp	w8, #0xa
    2768:      	b.hi	0x27b4 <_gap_verify_graph+0x2750>
    276c:      	ldr	w8, [sp, #0x5c]
    2770:      	adrp	x9, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002770:  ARM64_RELOC_PAGE21	l_str.526
    2774:      	add	x9, x9, #0x0
		0000000000002774:  ARM64_RELOC_PAGEOFF12	l_str.526
    2778:      	cmp	w8, #0xb
    277c:      	mov	w8, #0x26               ; =38
    2780:      	b.hi	0x27c0 <_gap_verify_graph+0x275c>
    2784:      	bl	0x2784 <_gap_verify_graph+0x2720>
		0000000000002784:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    2788:      	mov	w26, w0
    278c:      	ldr	w0, [sp, #0x5c]
    2790:      	bl	0x2790 <_gap_verify_graph+0x272c>
		0000000000002790:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    2794:      	ldp	x10, x9, [sp, #0x28]
    2798:      	cmp	w26, w0
    279c:      	mov	w8, #0x26               ; =38
    27a0:      	csel	x8, x8, x9, ne
    27a4:      	adrp	x9, 0x2000 <_gap_verify_graph+0x1f9c>
		00000000000027a4:  ARM64_RELOC_PAGE21	l_str.526
    27a8:      	add	x9, x9, #0x0
		00000000000027a8:  ARM64_RELOC_PAGEOFF12	l_str.526
    27ac:      	csel	x9, x9, x10, ne
    27b0:      	b	0x27c0 <_gap_verify_graph+0x275c>
    27b4:      	mov	w8, #0x26               ; =38
    27b8:      	adrp	x9, 0x2000 <_gap_verify_graph+0x1f9c>
		00000000000027b8:  ARM64_RELOC_PAGE21	l_str.526
    27bc:      	add	x9, x9, #0x0
		00000000000027bc:  ARM64_RELOC_PAGEOFF12	l_str.526
    27c0:      	ldr	x10, [sp, #0x50]
    27c4:      	cmp	w10, #0x1
    27c8:      	b.lt	0x284c <_gap_verify_graph+0x27e8>
    27cc:      	ldp	x11, x10, [sp, #0x48]
    27d0:      	and	x10, x10, #0x7fffffff
    27d4:      	cmp	x11, x10
    27d8:      	b.ls	0x2904 <_gap_verify_graph+0x28a0>
    27dc:      	ldr	x11, [sp, #0x38]
    27e0:      	cmp	x11, x10
    27e4:      	mov	w11, #0x19              ; =25
    27e8:      	str	x11, [sp, #0x30]
    27ec:      	adrp	x11, 0x2000 <_gap_verify_graph+0x1f9c>
		00000000000027ec:  ARM64_RELOC_PAGE21	l_str.528
    27f0:      	add	x11, x11, #0x0
		00000000000027f0:  ARM64_RELOC_PAGEOFF12	l_str.528
    27f4:      	str	x11, [sp, #0x28]
    27f8:      	b.ls	0x2918 <_gap_verify_graph+0x28b4>
    27fc:      	ldr	w11, [x23, x10, lsl #2]
    2800:      	tbnz	w11, #0x1f, 0x2904 <_gap_verify_graph+0x28a0>
    2804:      	ldr	x11, [sp, #0x40]
    2808:      	add	x10, x11, x10, lsl #4
    280c:      	ldr	x12, [x10]
    2810:      	ubfx	w11, w12, #8, #8
    2814:      	sub	w13, w11, #0x1
    2818:      	cmp	w13, #0xb
    281c:      	b.hs	0x28b0 <_gap_verify_graph+0x284c>
    2820:      	and	w13, w12, #0xff
    2824:      	mov	w14, #0x46              ; =70
    2828:      	cmp	w13, #0x48
    282c:      	ccmp	w13, w14, #0x4, ne
    2830:      	mov	w13, #0x2b              ; =43
    2834:      	csel	x8, x13, x8, eq
    2838:      	str	x8, [sp, #0x30]
    283c:      	adrp	x8, 0x2000 <_gap_verify_graph+0x1f9c>
		000000000000283c:  ARM64_RELOC_PAGE21	l_str.529
    2840:      	add	x8, x8, #0x0
		0000000000002840:  ARM64_RELOC_PAGEOFF12	l_str.529
    2844:      	csel	x8, x8, x9, eq
    2848:      	b	0x28c0 <_gap_verify_graph+0x285c>
    284c:      	ldr	x10, [sp, #0x50]
    2850:      	tbz	w10, #0x1f, 0x2904 <_gap_verify_graph+0x28a0>
    2854:      	ldr	x10, [x19, #0x30]
    2858:      	ldr	x11, [x19, #0x58]
    285c:      	cmp	x10, x11
    2860:      	b.ne	0x2904 <_gap_verify_graph+0x28a0>
    2864:      	ldr	x11, [sp, #0x50]
    2868:      	sxtw	x11, w11
    286c:      	cmn	x10, x11
    2870:      	b.lt	0x2904 <_gap_verify_graph+0x28a0>
    2874:      	ldr	x10, [x19, #0x50]
    2878:      	mvn	x11, x11
    287c:      	ldr	w10, [x10, x11, lsl #2]
    2880:      	cmp	w10, #0x0
    2884:      	b.le	0x2904 <_gap_verify_graph+0x28a0>
    2888:      	ldr	x10, [sp, #0x50]
    288c:      	ldr	x11, [x19, #0x28]
    2890:      	mvn	w10, w10
    2894:      	and	x10, x10, #0x7fffffff
    2898:      	add	x10, x11, x10, lsl #4
    289c:      	ldr	x12, [x10]
    28a0:      	ubfx	w11, w12, #8, #8
    28a4:      	sub	w13, w11, #0x1
    28a8:      	cmp	w13, #0xb
    28ac:      	b.lo	0x2820 <_gap_verify_graph+0x27bc>
    28b0:      	mov	w8, #0x2b               ; =43
    28b4:      	str	x8, [sp, #0x30]
    28b8:      	adrp	x8, 0x2000 <_gap_verify_graph+0x1f9c>
		00000000000028b8:  ARM64_RELOC_PAGE21	l_str.529
    28bc:      	add	x8, x8, #0x0
		00000000000028bc:  ARM64_RELOC_PAGEOFF12	l_str.529
    28c0:      	str	x8, [sp, #0x28]
    28c4:      	ldr	x8, [sp, #0x50]
    28c8:      	tbz	w8, #0x1f, 0x2918 <_gap_verify_graph+0x28b4>
    28cc:      	and	w9, w12, #0xff
    28d0:      	ldr	x8, [x10, #0x8]
    28d4:      	cmp	w9, #0x49
    28d8:      	b.eq	0x28e4 <_gap_verify_graph+0x2880>
    28dc:      	cmp	w9, w11
    28e0:      	b.ne	0x2918 <_gap_verify_graph+0x28b4>
    28e4:      	ldr	w9, [sp, #0x18]
    28e8:      	cbz	w9, 0x3778 <_gap_verify_graph+0x3714>
    28ec:      	ldr	x9, [sp, #0x8]
    28f0:      	mov	w10, #0x1               ; =1
    28f4:      	lsr	w9, w9, #4
    28f8:      	sub	w9, w9, #0x1
    28fc:      	lsl	w9, w10, w9
    2900:      	b	0x37b0 <_gap_verify_graph+0x374c>
    2904:      	mov	w8, #0x19               ; =25
    2908:      	str	x8, [sp, #0x30]
    290c:      	adrp	x8, 0x2000 <_gap_verify_graph+0x1f9c>
		000000000000290c:  ARM64_RELOC_PAGE21	l_str.528
    2910:      	add	x8, x8, #0x0
		0000000000002910:  ARM64_RELOC_PAGEOFF12	l_str.528
    2914:      	str	x8, [sp, #0x28]
    2918:      	cmp	w25, #0x3d
    291c:      	b.ne	0x37d8 <_gap_verify_graph+0x3774>
    2920:      	ldp	x28, x8, [sp, #0x28]
    2924:      	adrp	x16, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002924:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    2928:      	add	x16, x16, #0x0
		0000000000002928:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    292c:      	ldr	x3, [sp, #0x60]
    2930:      	adrp	x26, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002930:  ARM64_RELOC_PAGE21	l_str.543
    2934:      	add	x26, x26, #0x0
		0000000000002934:  ARM64_RELOC_PAGEOFF12	l_str.543
    2938:      	mov	x25, x8
    293c:      	cbnz	x8, 0x9cc <_gap_verify_graph+0x968>
    2940:      	str	wzr, [sp, #0xa0]
    2944:      	ldr	x0, [sp, #0x8]
    2948:      	b	0x3748 <_gap_verify_graph+0x36e4>
    294c:      	ldr	x8, [x19, #0x50]
    2950:      	mvn	x9, x9
    2954:      	mov	x28, #0x80000000        ; =2147483648
    2958:      	movk	x28, #0x2001, lsl #32
    295c:      	mov	x26, x14
    2960:      	ldr	w8, [x8, x9, lsl #2]
    2964:      	movk	x28, #0x3c0, lsl #48
    2968:      	cmp	w8, #0x0
    296c:      	b.le	0x2978 <_gap_verify_graph+0x2914>
    2970:      	mov	w25, #0x2e              ; =46
    2974:      	b	0x1958 <_gap_verify_graph+0x18f4>
    2978:      	mov	w25, #0x1d              ; =29
    297c:      	b	0x1958 <_gap_verify_graph+0x18f4>
    2980:      	ldur	x8, [x29, #-0x90]
    2984:      	cmp	x26, x8
    2988:      	b.ls	0x23c0 <_gap_verify_graph+0x235c>
    298c:      	adrp	x9, 0x2000 <_gap_verify_graph+0x1f9c>
		000000000000298c:  ARM64_RELOC_PAGE21	l_str.457
    2990:      	add	x10, x9, #0x0
		0000000000002990:  ARM64_RELOC_PAGEOFF12	l_str.457
    2994:      	mov	w8, #0x1                ; =1
    2998:      	mov	w9, #0x1a               ; =26
    299c:      	str	w8, [sp, #0x100]
    29a0:      	stp	x10, x9, [sp, #0x108]
    29a4:      	b	0x23d0 <_gap_verify_graph+0x236c>
    29a8:      	and	w9, w5, #0xe00
    29ac:      	cmp	w9, #0xc00
    29b0:      	b.ne	0x334c <_gap_verify_graph+0x32e8>
    29b4:      	mov	x1, x5
    29b8:      	mov	x13, x14
    29bc:      	mov	x7, x6
    29c0:      	and	w11, w1, #0xff
    29c4:      	cmp	w11, #0x1e
    29c8:      	b.ne	0x2ac4 <_gap_verify_graph+0x2a60>
    29cc:      	mov	w1, #0x1e               ; =30
    29d0:      	mov	w9, #0x1                ; =1
    29d4:      	mov	w10, #0x1               ; =1
    29d8:      	adrp	x2, 0x2000 <_gap_verify_graph+0x1f9c>
		00000000000029d8:  ARM64_RELOC_PAGE21	l_str.508
    29dc:      	add	x2, x2, #0x0
		00000000000029dc:  ARM64_RELOC_PAGEOFF12	l_str.508
    29e0:      	mov	w12, #0x37              ; =55
    29e4:      	b	0x3394 <_gap_verify_graph+0x3330>
    29e8:      	adrp	x28, 0x2000 <_gap_verify_graph+0x1f9c>
		00000000000029e8:  ARM64_RELOC_PAGE21	l_str.548
    29ec:      	add	x28, x28, #0x0
		00000000000029ec:  ARM64_RELOC_PAGEOFF12	l_str.548
    29f0:      	mov	w25, #0x20              ; =32
    29f4:      	sub	x0, x29, #0xc0
    29f8:      	mov	x1, x19
    29fc:      	ldr	x2, [sp, #0x28]
    2a00:      	bl	0x2a00 <_gap_verify_graph+0x299c>
		0000000000002a00:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    2a04:      	ldur	w8, [x29, #-0xc0]
    2a08:      	cbz	w8, 0x2b0c <_gap_verify_graph+0x2aa8>
    2a0c:      	ldr	x8, [sp, #0x28]
    2a10:      	cmp	w8, #0x1
    2a14:      	b.lt	0x2a88 <_gap_verify_graph+0x2a24>
    2a18:      	ldur	w8, [x29, #-0xb8]
    2a1c:      	and	w8, w8, #0xfe
    2a20:      	cmp	w8, #0x70
    2a24:      	b.ne	0x2a88 <_gap_verify_graph+0x2a24>
    2a28:      	ldr	x8, [sp, #0x28]
    2a2c:      	ldr	w9, [sp, #0x30]
    2a30:      	ldr	w8, [x23, x8, lsl #2]
    2a34:      	add	w8, w8, #0x1
    2a38:      	cmp	w9, w8
    2a3c:      	b.ne	0x2a88 <_gap_verify_graph+0x2a24>
    2a40:      	ldr	x3, [sp, #0x60]
    2a44:      	adrp	x16, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002a44:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    2a48:      	add	x16, x16, #0x0
		0000000000002a48:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    2a4c:      	adrp	x26, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002a4c:  ARM64_RELOC_PAGE21	l_str.543
    2a50:      	add	x26, x26, #0x0
		0000000000002a50:  ARM64_RELOC_PAGEOFF12	l_str.543
    2a54:      	cbnz	x25, 0x9cc <_gap_verify_graph+0x968>
    2a58:      	ldr	w8, [sp, #0x30]
    2a5c:      	cmp	w8, #0x2
    2a60:      	b.hs	0x39a8 <_gap_verify_graph+0x3944>
    2a64:      	ldr	w0, [sp, #0x5c]
    2a68:      	str	wzr, [sp, #0xa0]
    2a6c:      	bl	0x2a6c <_gap_verify_graph+0x2a08>
		0000000000002a6c:  ARM64_RELOC_BRANCH26	_stogir.types.size
    2a70:      	ldr	x3, [sp, #0x60]
    2a74:      	adrp	x16, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002a74:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    2a78:      	add	x16, x16, #0x0
		0000000000002a78:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    2a7c:      	adrp	x26, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002a7c:  ARM64_RELOC_PAGE21	l_str.543
    2a80:      	add	x26, x26, #0x0
		0000000000002a80:  ARM64_RELOC_PAGEOFF12	l_str.543
    2a84:      	b	0x3748 <_gap_verify_graph+0x36e4>
    2a88:      	adrp	x28, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002a88:  ARM64_RELOC_PAGE21	l_str.550
    2a8c:      	add	x28, x28, #0x0
		0000000000002a8c:  ARM64_RELOC_PAGEOFF12	l_str.550
    2a90:      	mov	w25, #0x19              ; =25
    2a94:      	b	0x394c <_gap_verify_graph+0x38e8>
    2a98:      	mov	x1, x5
    2a9c:      	cmp	w2, #0x6
    2aa0:      	mov	x13, x14
    2aa4:      	and	w11, w1, #0xff
    2aa8:      	mov	x7, x6
    2aac:      	b.hi	0x2ac4 <_gap_verify_graph+0x2a60>
    2ab0:      	and	w9, w1, #0xe00
    2ab4:      	cmp	w9, #0xc00
    2ab8:      	mov	w9, #0x21               ; =33
    2abc:      	ccmp	w11, w9, #0x2, eq
    2ac0:      	b.hs	0x336c <_gap_verify_graph+0x3308>
    2ac4:      	mov	x12, xzr
    2ac8:      	and	w9, w1, #0xff
    2acc:      	adrp	x2, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002acc:  ARM64_RELOC_PAGE21	l_str.507
    2ad0:      	add	x2, x2, #0x0
		0000000000002ad0:  ARM64_RELOC_PAGEOFF12	l_str.507
    2ad4:      	b	0x337c <_gap_verify_graph+0x3318>
    2ad8:      	cmp	w2, #0xb
    2adc:      	b.hi	0x3994 <_gap_verify_graph+0x3930>
    2ae0:      	mov	w10, #0xe78             ; =3704
    2ae4:      	mov	x1, x5
    2ae8:      	mov	w12, #0x37              ; =55
    2aec:      	lsr	w10, w10, w2
    2af0:      	adrp	x2, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002af0:  ARM64_RELOC_PAGE21	l_str.508
    2af4:      	add	x2, x2, #0x0
		0000000000002af4:  ARM64_RELOC_PAGEOFF12	l_str.508
    2af8:      	and	w11, w1, #0xff
    2afc:      	mov	x13, x14
    2b00:      	mov	x7, x6
    2b04:      	tbnz	w10, #0x0, 0x2ac4 <_gap_verify_graph+0x2a60>
    2b08:      	b	0x337c <_gap_verify_graph+0x3318>
    2b0c:      	adrp	x28, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002b0c:  ARM64_RELOC_PAGE21	l_str.549
    2b10:      	add	x28, x28, #0x0
		0000000000002b10:  ARM64_RELOC_PAGEOFF12	l_str.549
    2b14:      	mov	w25, #0x19              ; =25
    2b18:      	b	0x394c <_gap_verify_graph+0x38e8>
    2b1c:      	cmp	w14, #0x10
    2b20:      	mov	w10, #0x10              ; =16
    2b24:      	sub	x0, x29, #0x98
    2b28:      	csel	w8, w14, w10, gt
    2b2c:      	cmp	w9, #0x51
    2b30:      	mov	x1, x19
    2b34:      	csel	w3, w8, w10, eq
    2b38:      	bl	0x2b38 <_gap_verify_graph+0x2ad4>
		0000000000002b38:  ARM64_RELOC_BRANCH26	_stogir.stack.constant-size-aligned
    2b3c:      	ldur	w8, [x29, #-0x98]
    2b40:      	ldur	x9, [x29, #-0x88]
    2b44:      	ldr	x10, [sp, #0x78]
    2b48:      	cmp	w8, #0x1
    2b4c:      	cset	w8, eq
    2b50:      	csel	x23, x9, x10, eq
    2b54:      	mov	x26, x28
    2b58:      	adrp	x16, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002b58:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    2b5c:      	add	x16, x16, #0x0
		0000000000002b5c:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    2b60:      	mov	x28, #0x80000000        ; =2147483648
    2b64:      	movk	x28, #0x2001, lsl #32
    2b68:      	movk	x28, #0x3c0, lsl #48
    2b6c:      	cmp	w8, #0x1
    2b70:      	str	x23, [sp, #0x78]
    2b74:      	b.eq	0x2b7c <_gap_verify_graph+0x2b18>
    2b78:      	mov	x23, x25
    2b7c:      	cmp	w21, #0x41
    2b80:      	b.eq	0x2b98 <_gap_verify_graph+0x2b34>
    2b84:      	cmp	w21, #0x48
    2b88:      	b.eq	0x2b98 <_gap_verify_graph+0x2b34>
    2b8c:      	sub	w8, w21, #0x55
    2b90:      	cmp	w8, #0x3
    2b94:      	b.hi	0x2c54 <_gap_verify_graph+0x2bf0>
    2b98:      	add	x0, sp, #0x118
    2b9c:      	mov	x1, x19
    2ba0:      	mov	w2, w20
    2ba4:      	bl	0x2ba4 <_gap_verify_graph+0x2b40>
		0000000000002ba4:  ARM64_RELOC_BRANCH26	_stogir.locals.validate
    2ba8:      	ldr	w8, [sp, #0x118]
    2bac:      	ldr	x9, [sp, #0x128]
    2bb0:      	adrp	x16, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002bb0:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    2bb4:      	add	x16, x16, #0x0
		0000000000002bb4:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    2bb8:      	sub	x25, x29, #0x98
    2bbc:      	cmp	w8, #0x1
    2bc0:      	csel	x23, x9, x23, eq
    2bc4:      	ldr	w8, [sp, #0x9c]
    2bc8:      	cbz	w8, 0x2c48 <_gap_verify_graph+0x2be4>
    2bcc:      	cmp	w20, #0x1
    2bd0:      	b.lt	0x3a34 <_gap_verify_graph+0x39d0>
    2bd4:      	ldr	x8, [x19, #0x8]
    2bd8:      	and	x12, x20, #0x7fffffff
    2bdc:      	cmp	x8, x12
    2be0:      	b.le	0x3a34 <_gap_verify_graph+0x39d0>
    2be4:      	ldr	x10, [x19, #0x80]
    2be8:      	cmp	x10, x12
    2bec:      	b.le	0x3a34 <_gap_verify_graph+0x39d0>
    2bf0:      	ldr	x9, [x19, #0x78]
    2bf4:      	ldr	w14, [x9, x12, lsl #2]
    2bf8:      	tbnz	w14, #0x1f, 0x3a34 <_gap_verify_graph+0x39d0>
    2bfc:      	ldr	x11, [x19]
    2c00:      	add	x12, x11, x12, lsl #4
    2c04:      	ldp	x15, x12, [x12]
    2c08:      	and	w13, w15, #0xff
    2c0c:      	sub	w2, w13, #0xe
    2c10:      	sub	w16, w13, #0x1f
    2c14:      	cmp	w2, #0xc
    2c18:      	ccmp	w16, #0x2, #0x0, hs
    2c1c:      	cset	w17, lo
    2c20:      	b.lo	0x2c38 <_gap_verify_graph+0x2bd4>
    2c24:      	cmp	w13, #0x1a
    2c28:      	b.lo	0x3a34 <_gap_verify_graph+0x39d0>
    2c2c:      	cmp	w13, #0x3a
    2c30:      	ccmp	w13, #0x1e, #0x0, ne
    2c34:      	b.hs	0x2c80 <_gap_verify_graph+0x2c1c>
    2c38:      	cmp	w16, #0x2
    2c3c:      	b.hs	0x2c88 <_gap_verify_graph+0x2c24>
    2c40:      	mov	w0, #0x1                ; =1
    2c44:      	b	0x2c94 <_gap_verify_graph+0x2c30>
    2c48:      	mov	w1, #0x5                ; =5
    2c4c:      	tbz	w27, #0x0, 0x2f38 <_gap_verify_graph+0x2ed4>
    2c50:      	b	0x4bc <_gap_verify_graph+0x458>
    2c54:      	sub	w8, w21, #0x21
    2c58:      	sub	x25, x29, #0x98
    2c5c:      	cmp	w8, #0x6
    2c60:      	b.hi	0x2ed4 <_gap_verify_graph+0x2e70>
    2c64:      	sub	x0, x29, #0xf0
    2c68:      	mov	x1, x19
    2c6c:      	mov	w2, w20
    2c70:      	bl	0x2c70 <_gap_verify_graph+0x2c0c>
		0000000000002c70:  ARM64_RELOC_BRANCH26	_stogir.conversion.validate
    2c74:      	ldur	w8, [x29, #-0xf0]
    2c78:      	ldur	x9, [x29, #-0xe0]
    2c7c:      	b	0x2efc <_gap_verify_graph+0x2e98>
    2c80:      	cmp	w13, #0x3b
    2c84:      	b.ne	0x3a34 <_gap_verify_graph+0x39d0>
    2c88:      	cmp	w13, #0x1d
    2c8c:      	mov	w0, #0x2                ; =2
    2c90:      	cinc	w0, w0, eq
    2c94:      	cmp	w14, w0
    2c98:      	b.ne	0x3a34 <_gap_verify_graph+0x39d0>
    2c9c:      	lsr	x1, x15, #32
    2ca0:      	cmp	w1, #0x1
    2ca4:      	b.lt	0x2ccc <_gap_verify_graph+0x2c68>
    2ca8:      	cmp	x8, x1
    2cac:      	mov	x0, #-0x1               ; =-1
    2cb0:      	b.ls	0x3a38 <_gap_verify_graph+0x39d4>
    2cb4:      	cmp	x10, x1
    2cb8:      	b.ls	0x3a38 <_gap_verify_graph+0x39d4>
    2cbc:      	ldr	w14, [x9, x1, lsl #2]
    2cc0:      	tbnz	w14, #0x1f, 0x3a38 <_gap_verify_graph+0x39d4>
    2cc4:      	add	x14, x11, x1, lsl #4
    2cc8:      	b	0x2d0c <_gap_verify_graph+0x2ca8>
    2ccc:      	tbz	x15, #0x3f, 0x3a34 <_gap_verify_graph+0x39d0>
    2cd0:      	ldr	x14, [x19, #0x30]
    2cd4:      	ldr	x0, [x19, #0x58]
    2cd8:      	cmp	x14, x0
    2cdc:      	b.ne	0x3a34 <_gap_verify_graph+0x39d0>
    2ce0:      	asr	x0, x15, #32
    2ce4:      	cmn	x14, x0
    2ce8:      	b.lt	0x3a34 <_gap_verify_graph+0x39d0>
    2cec:      	ldr	x14, [x19, #0x50]
    2cf0:      	mvn	x0, x0
    2cf4:      	ldr	w14, [x14, x0, lsl #2]
    2cf8:      	cmp	w14, #0x0
    2cfc:      	b.le	0x3a34 <_gap_verify_graph+0x39d0>
    2d00:      	ldr	x14, [x19, #0x28]
    2d04:      	eor	x0, x1, #0xffffffff
    2d08:      	add	x14, x14, x0, lsl #4
    2d0c:      	ldr	w0, [x14]
    2d10:      	lsr	w3, w15, #8
    2d14:      	cmp	w2, #0xc
    2d18:      	ubfx	w14, w0, #8, #8
    2d1c:      	csinc	w2, w14, wzr, hs
    2d20:      	cmp	w2, w3, uxtb
    2d24:      	b.ne	0x3a34 <_gap_verify_graph+0x39d0>
    2d28:      	tbz	w17, #0x0, 0x2d3c <_gap_verify_graph+0x2cd8>
    2d2c:      	and	w15, w0, #0xfe00
    2d30:      	cmp	w15, #0xc00
    2d34:      	b.eq	0x2d5c <_gap_verify_graph+0x2cf8>
    2d38:      	b	0x2d64 <_gap_verify_graph+0x2d00>
    2d3c:      	and	w15, w15, #0xfe
    2d40:      	cmp	w15, #0x3a
    2d44:      	ccmp	w13, #0x1d, #0x0, ne
    2d48:      	b.hi	0x2d64 <_gap_verify_graph+0x2d00>
    2d4c:      	and	w15, w0, #0xfe00
    2d50:      	mov	w2, #0x22               ; =34
    2d54:      	cmp	w15, #0xc00
    2d58:      	b.ne	0x2d68 <_gap_verify_graph+0x2d04>
    2d5c:      	mov	x2, xzr
    2d60:      	b	0x2d68 <_gap_verify_graph+0x2d04>
    2d64:      	mov	w2, #0x22               ; =34
    2d68:      	cmp	w16, #0x2
    2d6c:      	lsr	x15, x12, #32
    2d70:      	mov	x17, xzr
    2d74:      	csel	w16, w1, w12, lo
    2d78:      	cmp	x8, x10
    2d7c:      	csel	x0, x8, x10, lo
    2d80:      	stp	w1, w16, [x29, #-0x98]
    2d84:      	b	0x2d90 <_gap_verify_graph+0x2d2c>
    2d88:      	mov	w2, #0x18               ; =24
    2d8c:      	tbnz	w1, #0x1f, 0x2df8 <_gap_verify_graph+0x2d94>
    2d90:      	cmp	x17, #0x1
    2d94:      	mov	x16, x2
    2d98:      	b.gt	0x2db0 <_gap_verify_graph+0x2d4c>
    2d9c:      	ldr	w1, [x25, x17, lsl #2]
    2da0:      	add	x17, x17, #0x1
    2da4:      	mov	w2, #0x1                ; =1
    2da8:      	cbnz	w2, 0x2dbc <_gap_verify_graph+0x2d58>
    2dac:      	b	0x2e48 <_gap_verify_graph+0x2de4>
    2db0:      	mov	x2, xzr
    2db4:      	mov	w17, #0x2               ; =2
    2db8:      	cbz	w2, 0x2e48 <_gap_verify_graph+0x2de4>
    2dbc:      	cmp	w1, #0x1
    2dc0:      	b.lt	0x2d88 <_gap_verify_graph+0x2d24>
    2dc4:      	and	x1, x1, #0x7fffffff
    2dc8:      	mov	w2, #0x18               ; =24
    2dcc:      	cmp	x1, x0
    2dd0:      	b.ge	0x2d90 <_gap_verify_graph+0x2d2c>
    2dd4:      	ldr	w3, [x9, x1, lsl #2]
    2dd8:      	mov	w2, #0x18               ; =24
    2ddc:      	tbnz	w3, #0x1f, 0x2d90 <_gap_verify_graph+0x2d2c>
    2de0:      	add	x1, x11, x1, lsl #4
    2de4:      	ldrb	w1, [x1, #0x1]
    2de8:      	cmp	w1, w14
    2dec:      	mov	w1, #0x1e               ; =30
    2df0:      	csel	x2, x16, x1, eq
    2df4:      	b	0x2d90 <_gap_verify_graph+0x2d2c>
    2df8:      	ldr	x3, [x19, #0x30]
    2dfc:      	ldr	x2, [x19, #0x58]
    2e00:      	cmp	x3, x2
    2e04:      	mov	w2, #0x18               ; =24
    2e08:      	b.ne	0x2d90 <_gap_verify_graph+0x2d2c>
    2e0c:      	sxtw	x4, w1
    2e10:      	mov	w2, #0x18               ; =24
    2e14:      	cmn	x3, x4
    2e18:      	b.lt	0x2d90 <_gap_verify_graph+0x2d2c>
    2e1c:      	ldr	x2, [x19, #0x50]
    2e20:      	mvn	x3, x4
    2e24:      	ldr	w2, [x2, x3, lsl #2]
    2e28:      	cmp	w2, #0x0
    2e2c:      	mov	w2, #0x18               ; =24
    2e30:      	b.le	0x2d90 <_gap_verify_graph+0x2d2c>
    2e34:      	mvn	w1, w1
    2e38:      	ldr	x2, [x19, #0x28]
    2e3c:      	and	x1, x1, #0x7fffffff
    2e40:      	add	x1, x2, x1, lsl #4
    2e44:      	b	0x2de4 <_gap_verify_graph+0x2d80>
    2e48:      	cmp	x15, #0x0
    2e4c:      	mov	w1, #0x5                ; =5
    2e50:      	ccmp	w13, #0x1d, #0x0, ne
    2e54:      	b.eq	0x2e74 <_gap_verify_graph+0x2e10>
    2e58:      	cmp	x16, #0x0
    2e5c:      	csel	x8, x23, x16, eq
    2e60:      	mov	x23, x8
    2e64:      	adrp	x16, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002e64:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    2e68:      	add	x16, x16, #0x0
		0000000000002e68:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    2e6c:      	tbz	w27, #0x0, 0x2f38 <_gap_verify_graph+0x2ed4>
    2e70:      	b	0x4bc <_gap_verify_graph+0x458>
    2e74:      	cmp	w15, #0x1
    2e78:      	b.lt	0x2f08 <_gap_verify_graph+0x2ea4>
    2e7c:      	cmp	x8, x15
    2e80:      	b.le	0x2f24 <_gap_verify_graph+0x2ec0>
    2e84:      	cmp	x10, x15
    2e88:      	mov	w8, #0x16               ; =22
    2e8c:      	b.le	0x2f28 <_gap_verify_graph+0x2ec4>
    2e90:      	ldr	w8, [x9, x15, lsl #2]
    2e94:      	tbnz	w8, #0x1f, 0x2f24 <_gap_verify_graph+0x2ec0>
    2e98:      	lsl	x8, x15, #4
    2e9c:      	ldr	w8, [x11, x8]
    2ea0:      	and	w9, w8, #0xfe
    2ea4:      	and	w8, w8, #0xff
    2ea8:      	sub	w9, w9, #0x68
    2eac:      	sub	w8, w8, #0x65
    2eb0:      	cmp	w9, #0x9
    2eb4:      	ccmp	w8, #0x1, #0x0, hi
    2eb8:      	b.ls	0x2e58 <_gap_verify_graph+0x2df4>
    2ebc:      	mov	w8, #0x2d               ; =45
    2ec0:      	mov	x23, x8
    2ec4:      	adrp	x16, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002ec4:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    2ec8:      	add	x16, x16, #0x0
		0000000000002ec8:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    2ecc:      	tbz	w27, #0x0, 0x2f38 <_gap_verify_graph+0x2ed4>
    2ed0:      	b	0x4bc <_gap_verify_graph+0x458>
    2ed4:      	cmp	w21, #0x78
    2ed8:      	b.eq	0x30f8 <_gap_verify_graph+0x3094>
    2edc:      	cmp	w21, #0x3c
    2ee0:      	b.ne	0x2bc4 <_gap_verify_graph+0x2b60>
    2ee4:      	sub	x0, x29, #0xd8
    2ee8:      	mov	x1, x19
    2eec:      	mov	w2, w20
    2ef0:      	bl	0x2ef0 <_gap_verify_graph+0x2e8c>
		0000000000002ef0:  ARM64_RELOC_BRANCH26	_stogir.conditional.validate
    2ef4:      	ldur	w8, [x29, #-0xd8]
    2ef8:      	ldur	x9, [x29, #-0xc8]
    2efc:      	adrp	x16, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002efc:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    2f00:      	add	x16, x16, #0x0
		0000000000002f00:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    2f04:      	b	0x2bbc <_gap_verify_graph+0x2b58>
    2f08:      	ldr	x8, [x19, #0x30]
    2f0c:      	ldr	x9, [x19, #0x58]
    2f10:      	cmp	x8, x9
    2f14:      	b.ne	0x2f24 <_gap_verify_graph+0x2ec0>
    2f18:      	asr	x9, x12, #32
    2f1c:      	cmn	x8, x9
    2f20:      	b.ge	0x316c <_gap_verify_graph+0x3108>
    2f24:      	mov	w8, #0x16               ; =22
    2f28:      	mov	x23, x8
    2f2c:      	adrp	x16, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002f2c:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    2f30:      	add	x16, x16, #0x0
		0000000000002f30:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    2f34:      	tbnz	w27, #0x0, 0x4bc <_gap_verify_graph+0x458>
    2f38:      	ldr	w8, [sp, #0x9c]
    2f3c:      	cbnz	w8, 0x4bc <_gap_verify_graph+0x458>
    2f40:      	ldp	w9, w14, [sp, #0x90]
    2f44:      	lsr	x8, x28, x22
    2f48:      	ldr	w13, [sp, #0x98]
    2f4c:      	and	w11, w9, w8
    2f50:      	orr	w9, w13, w14
    2f54:      	orr	w8, w9, w11
    2f58:      	cbz	w8, 0x4bc <_gap_verify_graph+0x458>
    2f5c:      	cmp	w20, #0x1
    2f60:      	b.lt	0x2fa4 <_gap_verify_graph+0x2f40>
    2f64:      	ldr	x10, [x19, #0x8]
    2f68:      	and	x8, x20, #0x7fffffff
    2f6c:      	cmp	x10, x8
    2f70:      	b.le	0x2fa4 <_gap_verify_graph+0x2f40>
    2f74:      	ldr	x10, [x19, #0x80]
    2f78:      	cmp	x10, x8
    2f7c:      	b.le	0x2fa4 <_gap_verify_graph+0x2f40>
    2f80:      	ldr	x10, [x19, #0x78]
    2f84:      	ldr	w10, [x10, x8, lsl #2]
    2f88:      	cmp	w10, #0x1
    2f8c:      	b.lt	0x2fa4 <_gap_verify_graph+0x2f40>
    2f90:      	ldr	x10, [x19]
    2f94:      	add	x8, x10, x8, lsl #4
    2f98:      	mov	w10, #0x1               ; =1
    2f9c:      	ldr	w8, [x8, #0x4]
    2fa0:      	b	0x2fa8 <_gap_verify_graph+0x2f44>
    2fa4:      	mov	x10, xzr
    2fa8:      	cbz	w10, 0x3a34 <_gap_verify_graph+0x39d0>
    2fac:      	cmp	w8, #0x1
    2fb0:      	b.lt	0x2fe4 <_gap_verify_graph+0x2f80>
    2fb4:      	ldr	x10, [x19, #0x8]
    2fb8:      	and	x8, x8, #0x7fffffff
    2fbc:      	cmp	x10, x8
    2fc0:      	b.le	0x3a34 <_gap_verify_graph+0x39d0>
    2fc4:      	ldr	x10, [x19, #0x80]
    2fc8:      	cmp	x10, x8
    2fcc:      	b.le	0x3a34 <_gap_verify_graph+0x39d0>
    2fd0:      	ldr	x10, [x19, #0x78]
    2fd4:      	ldr	w10, [x10, x8, lsl #2]
    2fd8:      	tbnz	w10, #0x1f, 0x3a34 <_gap_verify_graph+0x39d0>
    2fdc:      	ldr	x10, [x19]
    2fe0:      	b	0x3024 <_gap_verify_graph+0x2fc0>
    2fe4:      	tbz	w8, #0x1f, 0x3a34 <_gap_verify_graph+0x39d0>
    2fe8:      	ldr	x10, [x19, #0x30]
    2fec:      	ldr	x12, [x19, #0x58]
    2ff0:      	cmp	x10, x12
    2ff4:      	b.ne	0x3a34 <_gap_verify_graph+0x39d0>
    2ff8:      	sxtw	x12, w8
    2ffc:      	cmn	x10, x12
    3000:      	b.lt	0x3a34 <_gap_verify_graph+0x39d0>
    3004:      	ldr	x10, [x19, #0x50]
    3008:      	mvn	x12, x12
    300c:      	ldr	w10, [x10, x12, lsl #2]
    3010:      	cmp	w10, #0x0
    3014:      	b.le	0x3a34 <_gap_verify_graph+0x39d0>
    3018:      	ldr	x10, [x19, #0x28]
    301c:      	mvn	w8, w8
    3020:      	and	x8, x8, #0x7fffffff
    3024:      	add	x8, x10, x8, lsl #4
    3028:      	cbz	x8, 0x3a34 <_gap_verify_graph+0x39d0>
    302c:      	ldr	w12, [x8]
    3030:      	and	x10, x22, #0xff00
    3034:      	cmp	x10, #0x600
    3038:      	ubfx	w8, w12, #8, #8
    303c:      	b.ne	0x3058 <_gap_verify_graph+0x2ff4>
    3040:      	cmp	w8, #0x6
    3044:      	b.ne	0x3058 <_gap_verify_graph+0x2ff4>
    3048:      	and	w10, w22, #0xfe
    304c:      	cmp	w10, #0x1a
    3050:      	cset	w10, eq
    3054:      	b	0x3068 <_gap_verify_graph+0x3004>
    3058:      	sub	w10, w8, #0x1
    305c:      	cmp	w10, #0xa
    3060:      	mov	w10, wzr
    3064:      	b.hi	0x31e0 <_gap_verify_graph+0x317c>
    3068:      	cbz	w11, 0x3094 <_gap_verify_graph+0x3030>
    306c:      	cmp	w21, #0x39
    3070:      	b.hi	0x31e0 <_gap_verify_graph+0x317c>
    3074:      	lsr	x11, x28, x21
    3078:      	tbz	w11, #0x0, 0x31e0 <_gap_verify_graph+0x317c>
    307c:      	cmp	w21, #0x2d
    3080:      	b.ne	0x30cc <_gap_verify_graph+0x3068>
    3084:      	mov	w11, #0x1               ; =1
    3088:      	and	w12, w14, w11
    308c:      	tbnz	w12, #0x0, 0x3098 <_gap_verify_graph+0x3034>
    3090:      	b	0x30c4 <_gap_verify_graph+0x3060>
    3094:      	cbz	w14, 0x31e4 <_gap_verify_graph+0x3180>
    3098:      	ldr	w11, [sp, #0x88]
    309c:      	cbz	w11, 0x31e0 <_gap_verify_graph+0x317c>
    30a0:      	cmp	w21, #0x1f
    30a4:      	b.hs	0x314c <_gap_verify_graph+0x30e8>
    30a8:      	cmp	w8, #0x1
    30ac:      	b.ne	0x31e4 <_gap_verify_graph+0x3180>
    30b0:      	cmp	w21, #0x3b
    30b4:      	b.hi	0x31e0 <_gap_verify_graph+0x317c>
    30b8:      	mov	x11, #0xc00000000000    ; =211106232532992
    30bc:      	movk	x11, #0xc01, lsl #48
    30c0:      	lsr	x11, x11, x21
    30c4:      	tbnz	w11, #0x0, 0x31e4 <_gap_verify_graph+0x3180>
    30c8:      	b	0x31e0 <_gap_verify_graph+0x317c>
    30cc:      	cmp	w8, #0x1
    30d0:      	b.eq	0x31e0 <_gap_verify_graph+0x317c>
    30d4:      	cmp	w21, #0x36
    30d8:      	b.eq	0x31c0 <_gap_verify_graph+0x315c>
    30dc:      	cmp	w21, #0x20
    30e0:      	b.eq	0x31b0 <_gap_verify_graph+0x314c>
    30e4:      	cmp	w21, #0x1f
    30e8:      	b.ne	0x3084 <_gap_verify_graph+0x3020>
    30ec:      	cmp	w8, #0x6
    30f0:      	cset	w11, ne
    30f4:      	b	0x3088 <_gap_verify_graph+0x3024>
    30f8:      	ubfx	w8, w22, #8, #8
    30fc:      	cbz	w8, 0x319c <_gap_verify_graph+0x3138>
    3100:      	ldr	x11, [sp, #0x80]
    3104:      	cmp	w11, #0x1
    3108:      	b.lt	0x3300 <_gap_verify_graph+0x329c>
    310c:      	ldr	x10, [x19, #0x8]
    3110:      	and	x9, x11, #0x7fffffff
    3114:      	cmp	x10, x9
    3118:      	b.le	0x3344 <_gap_verify_graph+0x32e0>
    311c:      	ldr	x10, [x19, #0x80]
    3120:      	cmp	x10, x9
    3124:      	b.le	0x3344 <_gap_verify_graph+0x32e0>
    3128:      	ldr	x10, [x19, #0x78]
    312c:      	ldr	w10, [x10, x9, lsl #2]
    3130:      	tbnz	w10, #0x1f, 0x3344 <_gap_verify_graph+0x32e0>
    3134:      	ldr	x10, [x19]
    3138:      	add	x9, x10, x9, lsl #4
    313c:      	ldrb	w9, [x9, #0x1]
    3140:      	cmp	w9, w8
    3144:      	mov	w8, #0x1a               ; =26
    3148:      	b	0x31a8 <_gap_verify_graph+0x3144>
    314c:      	cmp	w21, #0x2e
    3150:      	b.lo	0x31e0 <_gap_verify_graph+0x317c>
    3154:      	and	w11, w22, #0xfe
    3158:      	cmp	w11, #0x3a
    315c:      	mov	w11, #0x35              ; =53
    3160:      	ccmp	w21, w11, #0x0, ne
    3164:      	b.ls	0x30a8 <_gap_verify_graph+0x3044>
    3168:      	b	0x31e0 <_gap_verify_graph+0x317c>
    316c:      	ldr	x8, [x19, #0x50]
    3170:      	mvn	x9, x9
    3174:      	ldr	w8, [x8, x9, lsl #2]
    3178:      	mov	w9, #0x2d               ; =45
    317c:      	cmp	w8, #0x0
    3180:      	mov	w8, #0x16               ; =22
    3184:      	csel	x8, x9, x8, gt
    3188:      	mov	x23, x8
    318c:      	adrp	x16, 0x3000 <_gap_verify_graph+0x2f9c>
		000000000000318c:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    3190:      	add	x16, x16, #0x0
		0000000000003190:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    3194:      	tbz	w27, #0x0, 0x2f38 <_gap_verify_graph+0x2ed4>
    3198:      	b	0x4bc <_gap_verify_graph+0x458>
    319c:      	ldr	x8, [sp, #0x80]
    31a0:      	cmp	w8, #0x0
    31a4:      	mov	w8, #0x1f               ; =31
    31a8:      	csel	x23, x23, x8, eq
    31ac:      	b	0x2bc4 <_gap_verify_graph+0x2b60>
    31b0:      	sub	w11, w8, #0x7
    31b4:      	cmp	w11, #0x5
    31b8:      	cset	w11, lo
    31bc:      	b	0x3088 <_gap_verify_graph+0x3024>
    31c0:      	lsr	w11, w12, #8
    31c4:      	sub	w11, w11, #0x3
    31c8:      	and	w12, w11, #0xff
    31cc:      	cmp	w12, #0x8
    31d0:      	b.hi	0x31e0 <_gap_verify_graph+0x317c>
    31d4:      	mov	w12, #0x1cf             ; =463
    31d8:      	lsr	w11, w12, w11
    31dc:      	tbnz	w11, #0x0, 0x3084 <_gap_verify_graph+0x3020>
    31e0:      	mov	w23, #0x1c              ; =28
    31e4:      	cmp	w13, #0x0
    31e8:      	ldr	w12, [sp, #0x8c]
    31ec:      	csinc	w11, w8, wzr, eq
    31f0:      	cmp	w11, w12, uxtb
    31f4:      	mov	w11, #0x26              ; =38
    31f8:      	csel	x23, x23, x11, eq
    31fc:      	cbz	w9, 0x4bc <_gap_verify_graph+0x458>
    3200:      	cmp	w20, #0x1
    3204:      	b.lt	0x3234 <_gap_verify_graph+0x31d0>
    3208:      	ldr	x11, [x19, #0x8]
    320c:      	and	x9, x20, #0x7fffffff
    3210:      	cmp	x11, x9
    3214:      	b.le	0x3234 <_gap_verify_graph+0x31d0>
    3218:      	ldr	x11, [x19, #0x80]
    321c:      	cmp	x11, x9
    3220:      	b.le	0x3234 <_gap_verify_graph+0x31d0>
    3224:      	ldr	x11, [x19, #0x78]
    3228:      	ldr	w11, [x11, x9, lsl #2]
    322c:      	cmp	w11, #0x2
    3230:      	b.ge	0x32e8 <_gap_verify_graph+0x3284>
    3234:      	mov	x11, xzr
    3238:      	cbz	w11, 0x3a34 <_gap_verify_graph+0x39d0>
    323c:      	cmp	w9, #0x1
    3240:      	b.lt	0x3274 <_gap_verify_graph+0x3210>
    3244:      	ldr	x11, [x19, #0x8]
    3248:      	and	x9, x9, #0x7fffffff
    324c:      	cmp	x11, x9
    3250:      	b.le	0x3a34 <_gap_verify_graph+0x39d0>
    3254:      	ldr	x11, [x19, #0x80]
    3258:      	cmp	x11, x9
    325c:      	b.le	0x3a34 <_gap_verify_graph+0x39d0>
    3260:      	ldr	x11, [x19, #0x78]
    3264:      	ldr	w11, [x11, x9, lsl #2]
    3268:      	tbnz	w11, #0x1f, 0x3a34 <_gap_verify_graph+0x39d0>
    326c:      	ldr	x11, [x19]
    3270:      	b	0x32b4 <_gap_verify_graph+0x3250>
    3274:      	tbz	w9, #0x1f, 0x3a34 <_gap_verify_graph+0x39d0>
    3278:      	ldr	x11, [x19, #0x30]
    327c:      	ldr	x12, [x19, #0x58]
    3280:      	cmp	x11, x12
    3284:      	b.ne	0x3a34 <_gap_verify_graph+0x39d0>
    3288:      	sxtw	x12, w9
    328c:      	cmn	x11, x12
    3290:      	b.lt	0x3a34 <_gap_verify_graph+0x39d0>
    3294:      	ldr	x11, [x19, #0x50]
    3298:      	mvn	x12, x12
    329c:      	ldr	w11, [x11, x12, lsl #2]
    32a0:      	cmp	w11, #0x0
    32a4:      	b.le	0x3a34 <_gap_verify_graph+0x39d0>
    32a8:      	ldr	x11, [x19, #0x28]
    32ac:      	mvn	w9, w9
    32b0:      	and	x9, x9, #0x7fffffff
    32b4:      	add	x9, x11, x9, lsl #4
    32b8:      	cbz	x9, 0x3a34 <_gap_verify_graph+0x39d0>
    32bc:      	ldr	w9, [x9]
    32c0:      	eor	w10, w10, #0x1
    32c4:      	ubfx	w9, w9, #8, #8
    32c8:      	cmp	w8, w9
    32cc:      	csinc	w10, w10, wzr, ne
    32d0:      	tbnz	w10, #0x0, 0x4b4 <_gap_verify_graph+0x450>
    32d4:      	cmp	w9, #0x5
    32d8:      	b.eq	0x4bc <_gap_verify_graph+0x458>
    32dc:      	cmp	w9, #0xb
    32e0:      	b.eq	0x4bc <_gap_verify_graph+0x458>
    32e4:      	b	0x3a34 <_gap_verify_graph+0x39d0>
    32e8:      	ldr	x11, [x19]
    32ec:      	add	x9, x11, x9, lsl #4
    32f0:      	mov	w11, #0x1               ; =1
    32f4:      	ldr	w9, [x9, #0x8]
    32f8:      	cbnz	w11, 0x323c <_gap_verify_graph+0x31d8>
    32fc:      	b	0x3a34 <_gap_verify_graph+0x39d0>
    3300:      	tbz	w11, #0x1f, 0x3344 <_gap_verify_graph+0x32e0>
    3304:      	ldr	x9, [x19, #0x30]
    3308:      	ldr	x10, [x19, #0x58]
    330c:      	cmp	x9, x10
    3310:      	b.ne	0x3344 <_gap_verify_graph+0x32e0>
    3314:      	sxtw	x10, w11
    3318:      	cmn	x9, x10
    331c:      	b.lt	0x3344 <_gap_verify_graph+0x32e0>
    3320:      	ldr	x9, [x19, #0x50]
    3324:      	mvn	x10, x10
    3328:      	ldr	w9, [x9, x10, lsl #2]
    332c:      	cmp	w9, #0x0
    3330:      	b.le	0x3344 <_gap_verify_graph+0x32e0>
    3334:      	mvn	w9, w11
    3338:      	ldr	x10, [x19, #0x28]
    333c:      	and	x9, x9, #0x7fffffff
    3340:      	b	0x3138 <_gap_verify_graph+0x30d4>
    3344:      	mov	w23, #0x14              ; =20
    3348:      	b	0x2bc4 <_gap_verify_graph+0x2b60>
    334c:      	cmp	w2, #0x1
    3350:      	mov	w9, #0x3a               ; =58
    3354:      	mov	x1, x5
    3358:      	ccmp	w30, w9, #0x4, eq
    335c:      	and	w11, w1, #0xff
    3360:      	mov	x13, x14
    3364:      	mov	x7, x6
    3368:      	b.eq	0x2ac4 <_gap_verify_graph+0x2a60>
    336c:      	and	w9, w1, #0xff
    3370:      	mov	w12, #0x37              ; =55
    3374:      	adrp	x2, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003374:  ARM64_RELOC_PAGE21	l_str.508
    3378:      	add	x2, x2, #0x0
		0000000000003378:  ARM64_RELOC_PAGEOFF12	l_str.508
    337c:      	sub	w10, w11, #0x36
    3380:      	sub	w9, w9, #0x1d
    3384:      	cmn	w10, #0x5
    3388:      	cset	w10, lo
    338c:      	cmp	w9, #0x2
    3390:      	cset	w9, lo
    3394:      	mov	x5, x1
    3398:      	cmp	w13, #0x0
    339c:      	b.le	0x3418 <_gap_verify_graph+0x33b4>
    33a0:      	cmp	x0, x13
    33a4:      	b.ls	0x34bc <_gap_verify_graph+0x3458>
    33a8:      	cmp	x17, x13
    33ac:      	mov	w11, #0x21              ; =33
    33b0:      	adrp	x1, 0x3000 <_gap_verify_graph+0x2f9c>
		00000000000033b0:  ARM64_RELOC_PAGE21	l_str.509
    33b4:      	add	x1, x1, #0x0
		00000000000033b4:  ARM64_RELOC_PAGEOFF12	l_str.509
    33b8:      	mov	x13, x16
    33bc:      	b.ls	0x34cc <_gap_verify_graph+0x3468>
    33c0:      	ldr	w13, [x23, x14, lsl #2]
    33c4:      	mov	x11, x4
    33c8:      	tbnz	w13, #0x1f, 0x3640 <_gap_verify_graph+0x35dc>
    33cc:      	lsl	x13, x14, #4
    33d0:      	ldr	x11, [x11, x13]
    33d4:      	lsr	w13, w11, #8
    33d8:      	cmp	w15, w13, uxtb
    33dc:      	b.ne	0x3468 <_gap_verify_graph+0x3404>
    33e0:      	and	w11, w11, #0xff
    33e4:      	cmp	w11, #0x46
    33e8:      	b.eq	0x3468 <_gap_verify_graph+0x3404>
    33ec:      	cmp	w11, #0x48
    33f0:      	mov	w11, #0x32              ; =50
    33f4:      	adrp	x1, 0x3000 <_gap_verify_graph+0x2f9c>
		00000000000033f4:  ARM64_RELOC_PAGE21	l_str.510
    33f8:      	add	x1, x1, #0x0
		00000000000033f8:  ARM64_RELOC_PAGEOFF12	l_str.510
    33fc:      	mov	x13, x16
    3400:      	b.eq	0x34cc <_gap_verify_graph+0x3468>
    3404:      	mov	x11, x12
    3408:      	mov	x1, x2
    340c:      	cmp	w13, #0x1
    3410:      	b.ge	0x34d4 <_gap_verify_graph+0x3470>
    3414:      	b	0x3480 <_gap_verify_graph+0x341c>
    3418:      	tbz	x7, #0x3f, 0x34bc <_gap_verify_graph+0x3458>
    341c:      	ldr	x11, [x19, #0x30]
    3420:      	ldr	x13, [x19, #0x58]
    3424:      	cmp	x11, x13
    3428:      	b.ne	0x34bc <_gap_verify_graph+0x3458>
    342c:      	asr	x13, x6, #32
    3430:      	cmn	x11, x13
    3434:      	b.lt	0x34bc <_gap_verify_graph+0x3458>
    3438:      	ldr	x11, [x19, #0x50]
    343c:      	mvn	x13, x13
    3440:      	ldr	w11, [x11, x13, lsl #2]
    3444:      	cmp	w11, #0x1
    3448:      	b.lt	0x34bc <_gap_verify_graph+0x3458>
    344c:      	ldr	x11, [x19, #0x28]
    3450:      	eor	x14, x14, #0xffffffff
    3454:      	lsl	x13, x14, #4
    3458:      	ldr	x11, [x11, x13]
    345c:      	lsr	w13, w11, #8
    3460:      	cmp	w15, w13, uxtb
    3464:      	b.eq	0x33e0 <_gap_verify_graph+0x337c>
    3468:      	mov	w11, #0x32              ; =50
    346c:      	adrp	x1, 0x3000 <_gap_verify_graph+0x2f9c>
		000000000000346c:  ARM64_RELOC_PAGE21	l_str.510
    3470:      	add	x1, x1, #0x0
		0000000000003470:  ARM64_RELOC_PAGEOFF12	l_str.510
    3474:      	mov	x13, x16
    3478:      	cmp	w13, #0x1
    347c:      	b.ge	0x34d4 <_gap_verify_graph+0x3470>
    3480:      	tbnz	w13, #0x1f, 0x358c <_gap_verify_graph+0x3528>
    3484:      	mov	x12, #0x80000000        ; =2147483648
    3488:      	and	w10, w5, #0xff
    348c:      	movk	x12, #0x2001, lsl #32
    3490:      	cmp	w10, #0x39
    3494:      	movk	x12, #0x3c0, lsl #48
    3498:      	b.hi	0x36c4 <_gap_verify_graph+0x3660>
    349c:      	mov	w10, w5
    34a0:      	mov	x2, x1
    34a4:      	and	x10, x10, #0xff
    34a8:      	lsr	x10, x12, x10
    34ac:      	mov	x12, x11
    34b0:      	tbz	w10, #0x0, 0x36c4 <_gap_verify_graph+0x3660>
    34b4:      	cbnz	w8, 0x3504 <_gap_verify_graph+0x34a0>
    34b8:      	b	0x372c <_gap_verify_graph+0x36c8>
    34bc:      	mov	w11, #0x21              ; =33
    34c0:      	adrp	x1, 0x3000 <_gap_verify_graph+0x2f9c>
		00000000000034c0:  ARM64_RELOC_PAGE21	l_str.509
    34c4:      	add	x1, x1, #0x0
		00000000000034c4:  ARM64_RELOC_PAGEOFF12	l_str.509
    34c8:      	mov	x13, x16
    34cc:      	cmp	w13, #0x1
    34d0:      	b.lt	0x3480 <_gap_verify_graph+0x341c>
    34d4:      	mov	x13, #0x80000000        ; =2147483648
    34d8:      	and	w12, w5, #0xff
    34dc:      	movk	x13, #0x2001, lsl #32
    34e0:      	cmp	w12, #0x39
    34e4:      	movk	x13, #0x3c0, lsl #48
    34e8:      	b.hi	0x3654 <_gap_verify_graph+0x35f0>
    34ec:      	and	x12, x5, #0xff
    34f0:      	lsr	x12, x13, x12
    34f4:      	tbz	w12, #0x0, 0x3654 <_gap_verify_graph+0x35f0>
    34f8:      	mov	x12, x11
    34fc:      	mov	x2, x1
    3500:      	cbz	w8, 0x372c <_gap_verify_graph+0x36c8>
    3504:      	cbz	w9, 0x3574 <_gap_verify_graph+0x3510>
    3508:      	cmp	w8, #0x1
    350c:      	b.lt	0x360c <_gap_verify_graph+0x35a8>
    3510:      	mov	w8, w8
    3514:      	cmp	x0, x8
    3518:      	b.ls	0x3628 <_gap_verify_graph+0x35c4>
    351c:      	cmp	x17, x8
    3520:      	adrp	x28, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003520:  ARM64_RELOC_PAGE21	l_str.512
    3524:      	add	x28, x28, #0x0
		0000000000003524:  ARM64_RELOC_PAGEOFF12	l_str.512
    3528:      	mov	w25, #0x1d              ; =29
    352c:      	adrp	x16, 0x3000 <_gap_verify_graph+0x2f9c>
		000000000000352c:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    3530:      	add	x16, x16, #0x0
		0000000000003530:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    3534:      	b.ls	0x9cc <_gap_verify_graph+0x968>
    3538:      	ldr	w9, [x23, x8, lsl #2]
    353c:      	tbnz	w9, #0x1f, 0x36d8 <_gap_verify_graph+0x3674>
    3540:      	lsl	x8, x8, #4
    3544:      	ldr	w8, [x4, x8]
    3548:      	and	w9, w8, #0xfe
    354c:      	and	w8, w8, #0xff
    3550:      	sub	w9, w9, #0x68
    3554:      	sub	w8, w8, #0x65
    3558:      	cmp	w9, #0x9
    355c:      	ccmp	w8, #0x1, #0x0, hi
    3560:      	b.ls	0x372c <_gap_verify_graph+0x36c8>
    3564:      	adrp	x28, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003564:  ARM64_RELOC_PAGE21	l_str.513
    3568:      	add	x28, x28, #0x0
		0000000000003568:  ARM64_RELOC_PAGEOFF12	l_str.513
    356c:      	mov	w25, #0x34              ; =52
    3570:      	b	0x9cc <_gap_verify_graph+0x968>
    3574:      	adrp	x28, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003574:  ARM64_RELOC_PAGE21	l_str.511
    3578:      	add	x28, x28, #0x0
		0000000000003578:  ARM64_RELOC_PAGEOFF12	l_str.511
    357c:      	mov	w25, #0x23              ; =35
    3580:      	adrp	x16, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003580:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    3584:      	add	x16, x16, #0x0
		0000000000003584:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    3588:      	b	0x9cc <_gap_verify_graph+0x968>
    358c:      	and	w12, w5, #0xff
    3590:      	cmp	w12, #0x39
    3594:      	b.hi	0x35b4 <_gap_verify_graph+0x3550>
    3598:      	mov	x13, #0x80000000        ; =2147483648
    359c:      	mov	w12, w5
    35a0:      	movk	x13, #0x2001, lsl #32
    35a4:      	and	x12, x12, #0xff
    35a8:      	movk	x13, #0x3c0, lsl #48
    35ac:      	lsr	x12, x13, x12
    35b0:      	tbnz	w12, #0x0, 0x34f8 <_gap_verify_graph+0x3494>
    35b4:      	ldr	x12, [x19, #0x30]
    35b8:      	ldr	x13, [x19, #0x58]
    35bc:      	cmp	x12, x13
    35c0:      	b.ne	0x36c4 <_gap_verify_graph+0x3660>
    35c4:      	mov	w13, w16
    35c8:      	adrp	x2, 0x3000 <_gap_verify_graph+0x2f9c>
		00000000000035c8:  ARM64_RELOC_PAGE21	l_str.509
    35cc:      	add	x2, x2, #0x0
		00000000000035cc:  ARM64_RELOC_PAGEOFF12	l_str.509
    35d0:      	sxtw	x13, w13
    35d4:      	neg	x14, x13
    35d8:      	cmp	x12, x14
    35dc:      	mov	w12, #0x21              ; =33
    35e0:      	b.lt	0x34b4 <_gap_verify_graph+0x3450>
    35e4:      	ldr	x12, [x19, #0x50]
    35e8:      	mvn	x13, x13
    35ec:      	ldr	w12, [x12, x13, lsl #2]
    35f0:      	cmp	w12, #0x1
    35f4:      	b.lt	0x397c <_gap_verify_graph+0x3918>
    35f8:      	mvn	w12, w16
    35fc:      	ldr	x13, [x19, #0x28]
    3600:      	lsl	x12, x12, #4
    3604:      	ldr	x12, [x13, x12]
    3608:      	b	0x3684 <_gap_verify_graph+0x3620>
    360c:      	ldr	x9, [x19, #0x30]
    3610:      	ldr	x10, [x19, #0x58]
    3614:      	cmp	x9, x10
    3618:      	b.ne	0x3628 <_gap_verify_graph+0x35c4>
    361c:      	sxtw	x8, w8
    3620:      	cmn	x9, x8
    3624:      	b.ge	0x36e0 <_gap_verify_graph+0x367c>
    3628:      	adrp	x28, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003628:  ARM64_RELOC_PAGE21	l_str.512
    362c:      	add	x28, x28, #0x0
		000000000000362c:  ARM64_RELOC_PAGEOFF12	l_str.512
    3630:      	mov	w25, #0x1d              ; =29
    3634:      	adrp	x16, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003634:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    3638:      	add	x16, x16, #0x0
		0000000000003638:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    363c:      	b	0x9cc <_gap_verify_graph+0x968>
    3640:      	mov	w11, #0x21              ; =33
    3644:      	mov	x13, x16
    3648:      	cmp	w13, #0x1
    364c:      	b.ge	0x34d4 <_gap_verify_graph+0x3470>
    3650:      	b	0x3480 <_gap_verify_graph+0x341c>
    3654:      	mov	w13, w16
    3658:      	cmp	x0, x13
    365c:      	b.ls	0x36c4 <_gap_verify_graph+0x3660>
    3660:      	cmp	x17, x13
    3664:      	mov	w12, #0x21              ; =33
    3668:      	adrp	x2, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003668:  ARM64_RELOC_PAGE21	l_str.509
    366c:      	add	x2, x2, #0x0
		000000000000366c:  ARM64_RELOC_PAGEOFF12	l_str.509
    3670:      	b.ls	0x34b4 <_gap_verify_graph+0x3450>
    3674:      	ldr	w12, [x23, x13, lsl #2]
    3678:      	tbnz	w12, #0x1f, 0x3770 <_gap_verify_graph+0x370c>
    367c:      	lsl	x12, x13, #4
    3680:      	ldr	x12, [x4, x12]
    3684:      	ubfx	w13, w12, #8, #8
    3688:      	cmp	w13, w15
    368c:      	b.eq	0x36a0 <_gap_verify_graph+0x363c>
    3690:      	sub	w13, w13, #0xc
    3694:      	cmn	w13, #0xb
    3698:      	csinc	w10, w10, wzr, hs
    369c:      	tbnz	w10, #0x0, 0x371c <_gap_verify_graph+0x36b8>
    36a0:      	and	w10, w12, #0xff
    36a4:      	cmp	w10, #0x46
    36a8:      	b.eq	0x371c <_gap_verify_graph+0x36b8>
    36ac:      	cmp	w10, #0x48
    36b0:      	mov	w12, #0x32              ; =50
    36b4:      	adrp	x2, 0x3000 <_gap_verify_graph+0x2f9c>
		00000000000036b4:  ARM64_RELOC_PAGE21	l_str.510
    36b8:      	add	x2, x2, #0x0
		00000000000036b8:  ARM64_RELOC_PAGEOFF12	l_str.510
    36bc:      	b.eq	0x34b4 <_gap_verify_graph+0x3450>
    36c0:      	b	0x34f8 <_gap_verify_graph+0x3494>
    36c4:      	mov	w12, #0x21              ; =33
    36c8:      	adrp	x2, 0x3000 <_gap_verify_graph+0x2f9c>
		00000000000036c8:  ARM64_RELOC_PAGE21	l_str.509
    36cc:      	add	x2, x2, #0x0
		00000000000036cc:  ARM64_RELOC_PAGEOFF12	l_str.509
    36d0:      	cbnz	w8, 0x3504 <_gap_verify_graph+0x34a0>
    36d4:      	b	0x372c <_gap_verify_graph+0x36c8>
    36d8:      	mov	w25, #0x1d              ; =29
    36dc:      	b	0x9cc <_gap_verify_graph+0x968>
    36e0:      	ldr	x9, [x19, #0x50]
    36e4:      	mvn	x8, x8
    36e8:      	adrp	x16, 0x3000 <_gap_verify_graph+0x2f9c>
		00000000000036e8:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    36ec:      	add	x16, x16, #0x0
		00000000000036ec:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    36f0:      	ldr	w8, [x9, x8, lsl #2]
    36f4:      	adrp	x9, 0x3000 <_gap_verify_graph+0x2f9c>
		00000000000036f4:  ARM64_RELOC_PAGE21	l_str.513
    36f8:      	add	x9, x9, #0x0
		00000000000036f8:  ARM64_RELOC_PAGEOFF12	l_str.513
    36fc:      	cmp	w8, #0x0
    3700:      	adrp	x8, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003700:  ARM64_RELOC_PAGE21	l_str.512
    3704:      	add	x8, x8, #0x0
		0000000000003704:  ARM64_RELOC_PAGEOFF12	l_str.512
    3708:      	csel	x28, x9, x8, gt
    370c:      	mov	w8, #0x1d               ; =29
    3710:      	mov	w9, #0x34               ; =52
    3714:      	csel	x25, x9, x8, gt
    3718:      	b	0x9cc <_gap_verify_graph+0x968>
    371c:      	mov	w12, #0x32              ; =50
    3720:      	adrp	x2, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003720:  ARM64_RELOC_PAGE21	l_str.510
    3724:      	add	x2, x2, #0x0
		0000000000003724:  ARM64_RELOC_PAGEOFF12	l_str.510
    3728:      	cbnz	w8, 0x3504 <_gap_verify_graph+0x34a0>
    372c:      	mov	x28, x2
    3730:      	mov	x25, x12
    3734:      	adrp	x16, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003734:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    3738:      	add	x16, x16, #0x0
		0000000000003738:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    373c:      	cbnz	x12, 0x9cc <_gap_verify_graph+0x968>
    3740:      	str	wzr, [sp, #0xa0]
    3744:      	mov	w0, w15
    3748:      	mov	x28, #0x80000000        ; =2147483648
    374c:      	mov	x25, xzr
    3750:      	str	w0, [sp, #0xa8]
    3754:      	movk	x28, #0x2001, lsl #32
    3758:      	movk	x28, #0x3c0, lsl #48
    375c:      	cmp	w21, #0x44
    3760:      	cset	w8, ne
    3764:      	orr	w8, w8, w27
    3768:      	tbz	w8, #0x0, 0xd48 <_gap_verify_graph+0xce4>
    376c:      	b	0x9f4 <_gap_verify_graph+0x990>
    3770:      	mov	w12, #0x21              ; =33
    3774:      	b	0x34b4 <_gap_verify_graph+0x3450>
    3778:      	ldr	x9, [sp, #0x8]
    377c:      	cmp	w9, #0xd
    3780:      	b.hi	0x37ac <_gap_verify_graph+0x3748>
    3784:      	ldr	x9, [sp, #0x8]
    3788:      	cmp	w9, #0x0
    378c:      	cset	w9, ne
    3790:      	b	0x37b0 <_gap_verify_graph+0x374c>
    3794:      	adrp	x28, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003794:  ARM64_RELOC_PAGE21	l_str.516
    3798:      	add	x28, x28, #0x0
		0000000000003798:  ARM64_RELOC_PAGEOFF12	l_str.516
    379c:      	mov	w25, #0x2b              ; =43
    37a0:      	adrp	x16, 0x3000 <_gap_verify_graph+0x2f9c>
		00000000000037a0:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    37a4:      	add	x16, x16, #0x0
		00000000000037a4:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    37a8:      	b	0x9cc <_gap_verify_graph+0x968>
    37ac:      	mov	w9, #-0x1               ; =-1
    37b0:      	cmp	x8, w9, sxtw
    37b4:      	ldp	x9, x11, [sp, #0x28]
    37b8:      	mov	w8, #0x28               ; =40
    37bc:      	csel	x10, x8, x11, hs
    37c0:      	adrp	x8, 0x3000 <_gap_verify_graph+0x2f9c>
		00000000000037c0:  ARM64_RELOC_PAGE21	l_str.530
    37c4:      	add	x8, x8, #0x0
		00000000000037c4:  ARM64_RELOC_PAGEOFF12	l_str.530
    37c8:      	csel	x9, x8, x9, hs
    37cc:      	stp	x9, x10, [sp, #0x28]
    37d0:      	cmp	w25, #0x3d
    37d4:      	b.eq	0x2920 <_gap_verify_graph+0x28bc>
    37d8:      	ldr	x8, [sp, #0x50]
    37dc:      	lsr	x8, x8, #32
    37e0:      	cmp	w8, #0x1
    37e4:      	b.lt	0x38d8 <_gap_verify_graph+0x3874>
    37e8:      	ldr	x9, [sp, #0x48]
    37ec:      	cmp	x9, x8
    37f0:      	b.ls	0x3940 <_gap_verify_graph+0x38dc>
    37f4:      	ldr	x9, [sp, #0x38]
    37f8:      	ldr	x3, [sp, #0x60]
    37fc:      	adrp	x28, 0x3000 <_gap_verify_graph+0x2f9c>
		00000000000037fc:  ARM64_RELOC_PAGE21	l_str.531
    3800:      	add	x28, x28, #0x0
		0000000000003800:  ARM64_RELOC_PAGEOFF12	l_str.531
    3804:      	mov	w25, #0x20              ; =32
    3808:      	adrp	x16, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003808:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    380c:      	add	x16, x16, #0x0
		000000000000380c:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    3810:      	cmp	x9, x8
    3814:      	adrp	x26, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003814:  ARM64_RELOC_PAGE21	l_str.543
    3818:      	add	x26, x26, #0x0
		0000000000003818:  ARM64_RELOC_PAGEOFF12	l_str.543
    381c:      	b.ls	0x9cc <_gap_verify_graph+0x968>
    3820:      	ldr	w9, [x23, x8, lsl #2]
    3824:      	tbnz	w9, #0x1f, 0x3964 <_gap_verify_graph+0x3900>
    3828:      	ldr	x9, [sp, #0x40]
    382c:      	add	x8, x9, x8, lsl #4
    3830:      	ldr	x8, [x8]
    3834:      	and	w9, w8, #0xff
    3838:      	cmp	w9, #0x46
    383c:      	b.eq	0x3930 <_gap_verify_graph+0x38cc>
    3840:      	ldr	x3, [sp, #0x60]
    3844:      	cmp	w9, #0x48
    3848:      	adrp	x28, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003848:  ARM64_RELOC_PAGE21	l_str.532
    384c:      	add	x28, x28, #0x0
		000000000000384c:  ARM64_RELOC_PAGEOFF12	l_str.532
    3850:      	mov	w25, #0x27              ; =39
    3854:      	adrp	x16, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003854:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    3858:      	add	x16, x16, #0x0
		0000000000003858:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    385c:      	adrp	x26, 0x3000 <_gap_verify_graph+0x2f9c>
		000000000000385c:  ARM64_RELOC_PAGE21	l_str.543
    3860:      	add	x26, x26, #0x0
		0000000000003860:  ARM64_RELOC_PAGEOFF12	l_str.543
    3864:      	b.eq	0x9cc <_gap_verify_graph+0x968>
    3868:      	ldr	w9, [sp, #0x5c]
    386c:      	cmp	w9, #0xe
    3870:      	b.lo	0x3970 <_gap_verify_graph+0x390c>
    3874:      	ldp	w9, w10, [sp, #0x14]
    3878:      	ubfx	w23, w8, #8, #8
    387c:      	cmp	w10, #0x0
    3880:      	sub	w8, w23, #0x1
    3884:      	csinv	w0, w9, wzr, ne
    3888:      	cmp	w8, #0xd
    388c:      	csel	w8, wzr, w10, hs
    3890:      	cbz	w8, 0x3970 <_gap_verify_graph+0x390c>
    3894:      	cmp	w0, w23
    3898:      	b.eq	0x2920 <_gap_verify_graph+0x28bc>
    389c:      	sub	w8, w0, #0x1
    38a0:      	cmp	w8, #0xa
    38a4:      	b.hi	0x3970 <_gap_verify_graph+0x390c>
    38a8:      	ldr	x3, [sp, #0x60]
    38ac:      	cmp	w23, #0xb
    38b0:      	mov	w25, #0x27              ; =39
    38b4:      	b.hi	0x9cc <_gap_verify_graph+0x968>
    38b8:      	bl	0x38b8 <_gap_verify_graph+0x3854>
		00000000000038b8:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    38bc:      	mov	w25, w0
    38c0:      	mov	w0, w23
    38c4:      	bl	0x38c4 <_gap_verify_graph+0x3860>
		00000000000038c4:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    38c8:      	cmp	w25, w0
    38cc:      	b.eq	0x2920 <_gap_verify_graph+0x28bc>
    38d0:      	mov	w25, #0x27              ; =39
    38d4:      	b	0x2040 <_gap_verify_graph+0x1fdc>
    38d8:      	ldr	x9, [sp, #0x50]
    38dc:      	tbz	x9, #0x3f, 0x3940 <_gap_verify_graph+0x38dc>
    38e0:      	ldr	x9, [x19, #0x30]
    38e4:      	ldr	x10, [x19, #0x58]
    38e8:      	cmp	x9, x10
    38ec:      	b.ne	0x3940 <_gap_verify_graph+0x38dc>
    38f0:      	ldr	x10, [sp, #0x50]
    38f4:      	asr	x10, x10, #32
    38f8:      	cmn	x9, x10
    38fc:      	b.lt	0x3940 <_gap_verify_graph+0x38dc>
    3900:      	ldr	x9, [x19, #0x50]
    3904:      	mvn	x10, x10
    3908:      	ldr	w9, [x9, x10, lsl #2]
    390c:      	cmp	w9, #0x0
    3910:      	b.le	0x3940 <_gap_verify_graph+0x38dc>
    3914:      	ldr	x9, [x19, #0x28]
    3918:      	eor	x8, x8, #0xffffffff
    391c:      	add	x8, x9, x8, lsl #4
    3920:      	ldr	x8, [x8]
    3924:      	and	w9, w8, #0xff
    3928:      	cmp	w9, #0x46
    392c:      	b.ne	0x3840 <_gap_verify_graph+0x37dc>
    3930:      	adrp	x28, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003930:  ARM64_RELOC_PAGE21	l_str.532
    3934:      	add	x28, x28, #0x0
		0000000000003934:  ARM64_RELOC_PAGEOFF12	l_str.532
    3938:      	mov	w25, #0x27              ; =39
    393c:      	b	0x394c <_gap_verify_graph+0x38e8>
    3940:      	adrp	x28, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003940:  ARM64_RELOC_PAGE21	l_str.531
    3944:      	add	x28, x28, #0x0
		0000000000003944:  ARM64_RELOC_PAGEOFF12	l_str.531
    3948:      	mov	w25, #0x20              ; =32
    394c:      	ldr	x3, [sp, #0x60]
    3950:      	adrp	x16, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003950:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    3954:      	add	x16, x16, #0x0
		0000000000003954:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    3958:      	adrp	x26, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003958:  ARM64_RELOC_PAGE21	l_str.543
    395c:      	add	x26, x26, #0x0
		000000000000395c:  ARM64_RELOC_PAGEOFF12	l_str.543
    3960:      	b	0x9cc <_gap_verify_graph+0x968>
    3964:      	ldr	x3, [sp, #0x60]
    3968:      	mov	w25, #0x20              ; =32
    396c:      	b	0x9cc <_gap_verify_graph+0x968>
    3970:      	ldr	x3, [sp, #0x60]
    3974:      	mov	w25, #0x27              ; =39
    3978:      	b	0x9cc <_gap_verify_graph+0x968>
    397c:      	mov	w12, #0x21              ; =33
    3980:      	cbnz	w8, 0x3504 <_gap_verify_graph+0x34a0>
    3984:      	b	0x372c <_gap_verify_graph+0x36c8>
    3988:      	ldr	x3, [sp, #0x60]
    398c:      	mov	w25, #0x33              ; =51
    3990:      	b	0x9cc <_gap_verify_graph+0x968>
    3994:      	mov	w12, #0x37              ; =55
    3998:      	adrp	x2, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003998:  ARM64_RELOC_PAGE21	l_str.508
    399c:      	add	x2, x2, #0x0
		000000000000399c:  ARM64_RELOC_PAGEOFF12	l_str.508
    39a0:      	mov	x1, x5
    39a4:      	b	0x2148 <_gap_verify_graph+0x20e4>
    39a8:      	mov	w23, #0x2               ; =2
    39ac:      	mov	x0, x19
    39b0:      	mov	w1, w20
    39b4:      	mov	w2, w23
    39b8:      	bl	0x39b8 <_gap_verify_graph+0x3954>
		00000000000039b8:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    39bc:      	cbz	w0, 0x39fc <_gap_verify_graph+0x3998>
    39c0:      	mov	x2, x1
    39c4:      	sub	x0, x29, #0x98
    39c8:      	mov	x1, x19
    39cc:      	bl	0x39cc <_gap_verify_graph+0x3968>
		00000000000039cc:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    39d0:      	ldur	w8, [x29, #-0x98]
    39d4:      	cbz	w8, 0x3a0c <_gap_verify_graph+0x39a8>
    39d8:      	ldurb	w8, [x29, #-0x8f]
    39dc:      	ldr	w9, [sp, #0x5c]
    39e0:      	cmp	w8, w9
    39e4:      	b.ne	0x3a1c <_gap_verify_graph+0x39b8>
    39e8:      	ldr	w8, [sp, #0x30]
    39ec:      	add	w23, w23, #0x1
    39f0:      	cmp	w23, w8
    39f4:      	b.le	0x39ac <_gap_verify_graph+0x3948>
    39f8:      	b	0x2a64 <_gap_verify_graph+0x2a00>
    39fc:      	adrp	x28, 0x3000 <_gap_verify_graph+0x2f9c>
		00000000000039fc:  ARM64_RELOC_PAGE21	l_str.552
    3a00:      	add	x28, x28, #0x0
		0000000000003a00:  ARM64_RELOC_PAGEOFF12	l_str.552
    3a04:      	mov	w25, #0x18              ; =24
    3a08:      	b	0x394c <_gap_verify_graph+0x38e8>
    3a0c:      	adrp	x28, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003a0c:  ARM64_RELOC_PAGE21	l_str.553
    3a10:      	add	x28, x28, #0x0
		0000000000003a10:  ARM64_RELOC_PAGEOFF12	l_str.553
    3a14:      	mov	w25, #0x18              ; =24
    3a18:      	b	0x394c <_gap_verify_graph+0x38e8>
    3a1c:      	adrp	x28, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003a1c:  ARM64_RELOC_PAGE21	l_str.554
    3a20:      	add	x28, x28, #0x0
		0000000000003a20:  ARM64_RELOC_PAGEOFF12	l_str.554
    3a24:      	mov	w25, #0x1e              ; =30
    3a28:      	b	0x394c <_gap_verify_graph+0x38e8>
    3a2c:      	mov	w25, #0x33              ; =51
    3a30:      	b	0x2040 <_gap_verify_graph+0x1fdc>
    3a34:      	mov	x0, #-0x1               ; =-1
    3a38:      	add	sp, sp, #0x1d0
    3a3c:      	ldp	x29, x30, [sp, #0x50]
    3a40:      	ldp	x20, x19, [sp, #0x40]
    3a44:      	ldp	x22, x21, [sp, #0x30]
    3a48:      	ldp	x24, x23, [sp, #0x20]
    3a4c:      	ldp	x26, x25, [sp, #0x10]
    3a50:      	ldp	x28, x27, [sp], #0x60
    3a54:      	ret

0000000000003a58 <_stogir.checked.validate>:
    3a58:      	cmp	w2, #0x1
    3a5c:      	b.lt	0x3be4 <_stogir.checked.validate+0x18c>
    3a60:      	ldr	x13, [x1, #0x8]
    3a64:      	mov	w10, w2
    3a68:      	cmp	x13, x10
    3a6c:      	b.le	0x3c34 <_stogir.checked.validate+0x1dc>
    3a70:      	ldr	x14, [x1, #0x80]
    3a74:      	cmp	x14, x10
    3a78:      	b.le	0x3c34 <_stogir.checked.validate+0x1dc>
    3a7c:      	ldr	x8, [x1, #0x78]
    3a80:      	ldr	w11, [x8, x10, lsl #2]
    3a84:      	tbnz	w11, #0x1f, 0x3c34 <_stogir.checked.validate+0x1dc>
    3a88:      	ldr	x9, [x1]
    3a8c:      	cmp	w11, #0x2
    3a90:      	add	x12, x9, x10, lsl #4
    3a94:      	ldr	x15, [x12]
    3a98:      	and	w10, w15, #0xff
    3a9c:      	sub	w10, w10, #0x29
    3aa0:      	ccmp	w10, #0x3, #0x2, eq
    3aa4:      	b.hs	0x3c18 <_stogir.checked.validate+0x1c0>
    3aa8:      	sub	sp, sp, #0x10
    3aac:      	ubfx	w10, w15, #8, #8
    3ab0:      	lsr	x15, x15, #32
    3ab4:      	ldr	x12, [x12, #0x8]
    3ab8:      	mov	w16, #0x36              ; =54
    3abc:      	adrp	x2, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003abc:  ARM64_RELOC_PAGE21	l_str.231
    3ac0:      	add	x2, x2, #0x0
		0000000000003ac0:  ARM64_RELOC_PAGEOFF12	l_str.231
    3ac4:      	sub	w17, w10, #0xc
    3ac8:      	mov	x11, xzr
    3acc:      	stp	w15, w12, [sp, #0x8]
    3ad0:      	cmn	w17, #0xa
    3ad4:      	adrp	x17, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003ad4:  ARM64_RELOC_PAGE21	l_str.232
    3ad8:      	add	x17, x17, #0x0
		0000000000003ad8:  ARM64_RELOC_PAGEOFF12	l_str.232
    3adc:      	csel	x4, x16, xzr, lo
    3ae0:      	csel	x5, x17, x2, lo
    3ae4:      	cmp	x13, x14
    3ae8:      	add	x12, sp, #0x8
    3aec:      	csel	x13, x13, x14, lt
    3af0:      	adrp	x14, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003af0:  ARM64_RELOC_PAGE21	l_str.233
    3af4:      	add	x14, x14, #0x0
		0000000000003af4:  ARM64_RELOC_PAGEOFF12	l_str.233
    3af8:      	mov	w15, #0x28              ; =40
    3afc:      	adrp	x16, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003afc:  ARM64_RELOC_PAGE21	l_str.234
    3b00:      	add	x16, x16, #0x0
		0000000000003b00:  ARM64_RELOC_PAGEOFF12	l_str.234
    3b04:      	b	0x3b14 <_stogir.checked.validate+0xbc>
    3b08:      	mov	w4, #0x22               ; =34
    3b0c:      	mov	x5, x14
    3b10:      	tbnz	w3, #0x1f, 0x3b88 <_stogir.checked.validate+0x130>
    3b14:      	cmp	x11, #0x1
    3b18:      	mov	x17, x5
    3b1c:      	mov	x2, x4
    3b20:      	b.gt	0x3b38 <_stogir.checked.validate+0xe0>
    3b24:      	ldr	w3, [x12, x11, lsl #2]
    3b28:      	add	x11, x11, #0x1
    3b2c:      	mov	w4, #0x1                ; =1
    3b30:      	cbnz	w4, 0x3b44 <_stogir.checked.validate+0xec>
    3b34:      	b	0x3c50 <_stogir.checked.validate+0x1f8>
    3b38:      	mov	x4, xzr
    3b3c:      	mov	w11, #0x2               ; =2
    3b40:      	cbz	w4, 0x3c50 <_stogir.checked.validate+0x1f8>
    3b44:      	cmp	w3, #0x1
    3b48:      	b.lt	0x3b08 <_stogir.checked.validate+0xb0>
    3b4c:      	and	x3, x3, #0x7fffffff
    3b50:      	mov	w4, #0x22               ; =34
    3b54:      	mov	x5, x14
    3b58:      	cmp	x3, x13
    3b5c:      	b.ge	0x3b14 <_stogir.checked.validate+0xbc>
    3b60:      	ldr	w6, [x8, x3, lsl #2]
    3b64:      	mov	w4, #0x22               ; =34
    3b68:      	mov	x5, x14
    3b6c:      	tbnz	w6, #0x1f, 0x3b14 <_stogir.checked.validate+0xbc>
    3b70:      	add	x3, x9, x3, lsl #4
    3b74:      	ldrb	w3, [x3, #0x1]
    3b78:      	cmp	w3, w10
    3b7c:      	csel	x4, x2, x15, eq
    3b80:      	csel	x5, x17, x16, eq
    3b84:      	b	0x3b14 <_stogir.checked.validate+0xbc>
    3b88:      	ldr	x6, [x1, #0x30]
    3b8c:      	ldr	x4, [x1, #0x58]
    3b90:      	mov	x5, x14
    3b94:      	cmp	x6, x4
    3b98:      	mov	w4, #0x22               ; =34
    3b9c:      	b.ne	0x3b14 <_stogir.checked.validate+0xbc>
    3ba0:      	sxtw	x7, w3
    3ba4:      	mov	w4, #0x22               ; =34
    3ba8:      	mov	x5, x14
    3bac:      	cmn	x6, x7
    3bb0:      	b.lt	0x3b14 <_stogir.checked.validate+0xbc>
    3bb4:      	ldr	x4, [x1, #0x50]
    3bb8:      	mvn	x5, x7
    3bbc:      	ldr	w4, [x4, x5, lsl #2]
    3bc0:      	mov	x5, x14
    3bc4:      	cmp	w4, #0x0
    3bc8:      	mov	w4, #0x22               ; =34
    3bcc:      	b.le	0x3b14 <_stogir.checked.validate+0xbc>
    3bd0:      	mvn	w3, w3
    3bd4:      	ldr	x4, [x1, #0x28]
    3bd8:      	and	x3, x3, #0x7fffffff
    3bdc:      	add	x3, x4, x3, lsl #4
    3be0:      	b	0x3b74 <_stogir.checked.validate+0x11c>
    3be4:      	tbz	w2, #0x1f, 0x3c34 <_stogir.checked.validate+0x1dc>
    3be8:      	ldr	x8, [x1, #0x30]
    3bec:      	ldr	x9, [x1, #0x58]
    3bf0:      	cmp	x8, x9
    3bf4:      	b.ne	0x3c34 <_stogir.checked.validate+0x1dc>
    3bf8:      	sxtw	x9, w2
    3bfc:      	cmn	x8, x9
    3c00:      	b.lt	0x3c34 <_stogir.checked.validate+0x1dc>
    3c04:      	ldr	x8, [x1, #0x50]
    3c08:      	mvn	x9, x9
    3c0c:      	ldr	w8, [x8, x9, lsl #2]
    3c10:      	cmp	w8, #0x0
    3c14:      	b.le	0x3c34 <_stogir.checked.validate+0x1dc>
    3c18:      	mov	w8, #0x1                ; =1
    3c1c:      	adrp	x9, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003c1c:  ARM64_RELOC_PAGE21	l_str.241
    3c20:      	add	x9, x9, #0x0
		0000000000003c20:  ARM64_RELOC_PAGEOFF12	l_str.241
    3c24:      	str	w8, [x0]
    3c28:      	mov	w8, #0x26               ; =38
    3c2c:      	stp	x9, x8, [x0, #0x8]
    3c30:      	ret
    3c34:      	mov	w8, #0x1                ; =1
    3c38:      	adrp	x9, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003c38:  ARM64_RELOC_PAGE21	l_str.240
    3c3c:      	add	x9, x9, #0x0
		0000000000003c3c:  ARM64_RELOC_PAGEOFF12	l_str.240
    3c40:      	str	w8, [x0]
    3c44:      	mov	w8, #0x1a               ; =26
    3c48:      	stp	x9, x8, [x0, #0x8]
    3c4c:      	ret
    3c50:      	add	sp, sp, #0x10
    3c54:      	cbz	x2, 0x3c68 <_stogir.checked.validate+0x210>
    3c58:      	mov	w8, #0x1                ; =1
    3c5c:      	stp	x17, x2, [x0, #0x8]
    3c60:      	str	w8, [x0]
    3c64:      	ret
    3c68:      	str	w10, [x0, #0x8]
    3c6c:      	str	wzr, [x0]
    3c70:      	ret

0000000000003c74 <_stogir.conditional.validate>:
    3c74:      	cmp	w2, #0x1
    3c78:      	b.lt	0x3cf4 <_stogir.conditional.validate+0x80>
    3c7c:      	ldr	x11, [x1, #0x8]
    3c80:      	mov	w10, w2
    3c84:      	cmp	x11, x10
    3c88:      	b.le	0x3d44 <_stogir.conditional.validate+0xd0>
    3c8c:      	ldr	x12, [x1, #0x80]
    3c90:      	cmp	x12, x10
    3c94:      	b.le	0x3d44 <_stogir.conditional.validate+0xd0>
    3c98:      	ldr	x8, [x1, #0x78]
    3c9c:      	ldr	w13, [x8, x10, lsl #2]
    3ca0:      	tbnz	w13, #0x1f, 0x3d44 <_stogir.conditional.validate+0xd0>
    3ca4:      	ldr	x9, [x1]
    3ca8:      	cmp	w13, #0x3
    3cac:      	mov	w13, #0x3c              ; =60
    3cb0:      	add	x14, x9, x10, lsl #4
    3cb4:      	ldr	x17, [x14]
    3cb8:      	and	x10, x17, #0xff
    3cbc:      	ccmp	x10, x13, #0x0, eq
    3cc0:      	b.ne	0x3d28 <_stogir.conditional.validate+0xb4>
    3cc4:      	ubfx	w10, w17, #8, #8
    3cc8:      	lsr	x16, x17, #32
    3ccc:      	adrp	x13, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003ccc:  ARM64_RELOC_PAGE21	l_str.246
    3cd0:      	add	x13, x13, #0x0
		0000000000003cd0:  ARM64_RELOC_PAGEOFF12	l_str.246
    3cd4:      	cbz	w10, 0x3d60 <_stogir.conditional.validate+0xec>
    3cd8:      	cmp	w10, #0xe
    3cdc:      	adrp	x2, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003cdc:  ARM64_RELOC_PAGE21	l_str.245
    3ce0:      	add	x2, x2, #0x0
		0000000000003ce0:  ARM64_RELOC_PAGEOFF12	l_str.245
    3ce4:      	b.hs	0x3d68 <_stogir.conditional.validate+0xf4>
    3ce8:      	mov	x15, xzr
    3cec:      	mov	x13, x2
    3cf0:      	b	0x3d90 <_stogir.conditional.validate+0x11c>
    3cf4:      	tbz	w2, #0x1f, 0x3d44 <_stogir.conditional.validate+0xd0>
    3cf8:      	ldr	x8, [x1, #0x30]
    3cfc:      	ldr	x9, [x1, #0x58]
    3d00:      	cmp	x8, x9
    3d04:      	b.ne	0x3d44 <_stogir.conditional.validate+0xd0>
    3d08:      	sxtw	x9, w2
    3d0c:      	cmn	x8, x9
    3d10:      	b.lt	0x3d44 <_stogir.conditional.validate+0xd0>
    3d14:      	ldr	x8, [x1, #0x50]
    3d18:      	mvn	x9, x9
    3d1c:      	ldr	w8, [x8, x9, lsl #2]
    3d20:      	cmp	w8, #0x0
    3d24:      	b.le	0x3d44 <_stogir.conditional.validate+0xd0>
    3d28:      	mov	w8, #0x1                ; =1
    3d2c:      	adrp	x9, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003d2c:  ARM64_RELOC_PAGE21	l_str.253
    3d30:      	add	x9, x9, #0x0
		0000000000003d30:  ARM64_RELOC_PAGEOFF12	l_str.253
    3d34:      	str	w8, [x0]
    3d38:      	mov	w8, #0x18               ; =24
    3d3c:      	stp	x9, x8, [x0, #0x8]
    3d40:      	ret
    3d44:      	mov	w8, #0x1                ; =1
    3d48:      	adrp	x9, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003d48:  ARM64_RELOC_PAGE21	l_str.252
    3d4c:      	add	x9, x9, #0x0
		0000000000003d4c:  ARM64_RELOC_PAGEOFF12	l_str.252
    3d50:      	str	w8, [x0]
    3d54:      	mov	w8, #0x18               ; =24
    3d58:      	stp	x9, x8, [x0, #0x8]
    3d5c:      	ret
    3d60:      	mov	w15, #0x2b              ; =43
    3d64:      	b	0x3d90 <_stogir.conditional.validate+0x11c>
    3d68:      	ubfx	w15, w17, #8, #4
    3d6c:      	sub	w3, w10, #0x80
    3d70:      	cmn	w3, #0x70
    3d74:      	sub	w15, w15, #0xe
    3d78:      	ccmn	w15, #0xd, #0x0, hs
    3d7c:      	cset	w15, lo
    3d80:      	cmp	w15, #0x0
    3d84:      	mov	w15, #0x2b              ; =43
    3d88:      	csel	x15, x15, xzr, ne
    3d8c:      	csel	x13, x13, x2, ne
    3d90:      	ldr	x14, [x14, #0x8]
    3d94:      	cmp	w16, #0x1
    3d98:      	b.lt	0x3e10 <_stogir.conditional.validate+0x19c>
    3d9c:      	cmp	x11, x16
    3da0:      	adrp	x3, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003da0:  ARM64_RELOC_PAGE21	l_str.247
    3da4:      	add	x3, x3, #0x0
		0000000000003da4:  ARM64_RELOC_PAGEOFF12	l_str.247
    3da8:      	mov	w4, #0x16               ; =22
    3dac:      	b.ls	0x3e60 <_stogir.conditional.validate+0x1ec>
    3db0:      	cmp	x12, x16
    3db4:      	b.ls	0x3e60 <_stogir.conditional.validate+0x1ec>
    3db8:      	ldr	w17, [x8, x16, lsl #2]
    3dbc:      	tbnz	w17, #0x1f, 0x3e5c <_stogir.conditional.validate+0x1e8>
    3dc0:      	add	x16, x9, x16, lsl #4
    3dc4:      	ldr	x16, [x16]
    3dc8:      	adrp	x3, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003dc8:  ARM64_RELOC_PAGE21	l_str.248
    3dcc:      	add	x3, x3, #0x0
		0000000000003dcc:  ARM64_RELOC_PAGEOFF12	l_str.248
    3dd0:      	mov	w4, #0x2a               ; =42
    3dd4:      	and	w17, w16, #0xff
    3dd8:      	cmp	w17, #0x48
    3ddc:      	b.eq	0x3e60 <_stogir.conditional.validate+0x1ec>
    3de0:      	cmp	w17, #0x46
    3de4:      	b.eq	0x3e60 <_stogir.conditional.validate+0x1ec>
    3de8:      	tst	x16, #0xff00
    3dec:      	and	x16, x16, #0xfe00
    3df0:      	mov	w17, #0xdff             ; =3583
    3df4:      	ccmp	x16, x17, #0x2, ne
    3df8:      	cset	w16, hi
    3dfc:      	cmp	w16, #0x0
    3e00:      	mov	w16, #0x2a              ; =42
    3e04:      	csel	x4, x16, x15, ne
    3e08:      	csel	x3, x3, x13, ne
    3e0c:      	b	0x3e60 <_stogir.conditional.validate+0x1ec>
    3e10:      	tbz	x17, #0x3f, 0x3e54 <_stogir.conditional.validate+0x1e0>
    3e14:      	ldr	x2, [x1, #0x30]
    3e18:      	ldr	x3, [x1, #0x58]
    3e1c:      	cmp	x2, x3
    3e20:      	b.ne	0x3e54 <_stogir.conditional.validate+0x1e0>
    3e24:      	asr	x17, x17, #32
    3e28:      	cmn	x2, x17
    3e2c:      	b.lt	0x3e54 <_stogir.conditional.validate+0x1e0>
    3e30:      	ldr	x2, [x1, #0x50]
    3e34:      	mvn	x17, x17
    3e38:      	ldr	w17, [x2, x17, lsl #2]
    3e3c:      	cmp	w17, #0x0
    3e40:      	b.le	0x3e54 <_stogir.conditional.validate+0x1e0>
    3e44:      	ldr	x17, [x1, #0x28]
    3e48:      	eor	x16, x16, #0xffffffff
    3e4c:      	add	x16, x17, x16, lsl #4
    3e50:      	b	0x3dc4 <_stogir.conditional.validate+0x150>
    3e54:      	adrp	x3, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003e54:  ARM64_RELOC_PAGE21	l_str.247
    3e58:      	add	x3, x3, #0x0
		0000000000003e58:  ARM64_RELOC_PAGEOFF12	l_str.247
    3e5c:      	mov	w4, #0x16               ; =22
    3e60:      	sub	sp, sp, #0x10
    3e64:      	cmp	x11, x12
    3e68:      	mov	x13, xzr
    3e6c:      	str	x14, [sp, #0x8]
    3e70:      	add	x14, sp, #0x8
    3e74:      	csel	x11, x11, x12, lt
    3e78:      	adrp	x12, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003e78:  ARM64_RELOC_PAGE21	l_str.249
    3e7c:      	add	x12, x12, #0x0
		0000000000003e7c:  ARM64_RELOC_PAGEOFF12	l_str.249
    3e80:      	adrp	x15, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003e80:  ARM64_RELOC_PAGE21	l_str.250
    3e84:      	add	x15, x15, #0x0
		0000000000003e84:  ARM64_RELOC_PAGEOFF12	l_str.250
    3e88:      	mov	w16, #0x21              ; =33
    3e8c:      	b	0x3e9c <_stogir.conditional.validate+0x228>
    3e90:      	mov	w4, #0x10               ; =16
    3e94:      	mov	x3, x12
    3e98:      	tbnz	w5, #0x1f, 0x3f38 <_stogir.conditional.validate+0x2c4>
    3e9c:      	cmp	x13, #0x1
    3ea0:      	mov	x17, x3
    3ea4:      	mov	x2, x4
    3ea8:      	b.gt	0x3ec0 <_stogir.conditional.validate+0x24c>
    3eac:      	ldr	w5, [x14, x13, lsl #2]
    3eb0:      	add	x13, x13, #0x1
    3eb4:      	mov	w3, #0x1                ; =1
    3eb8:      	cbnz	w3, 0x3ecc <_stogir.conditional.validate+0x258>
    3ebc:      	b	0x3fac <_stogir.conditional.validate+0x338>
    3ec0:      	mov	x3, xzr
    3ec4:      	mov	w13, #0x2               ; =2
    3ec8:      	cbz	w3, 0x3fac <_stogir.conditional.validate+0x338>
    3ecc:      	cmp	w5, #0x1
    3ed0:      	b.lt	0x3e90 <_stogir.conditional.validate+0x21c>
    3ed4:      	and	x5, x5, #0x7fffffff
    3ed8:      	mov	w4, #0x10               ; =16
    3edc:      	mov	x3, x12
    3ee0:      	cmp	x5, x11
    3ee4:      	b.ge	0x3e9c <_stogir.conditional.validate+0x228>
    3ee8:      	ldr	w6, [x8, x5, lsl #2]
    3eec:      	mov	w4, #0x10               ; =16
    3ef0:      	mov	x3, x12
    3ef4:      	tbnz	w6, #0x1f, 0x3e9c <_stogir.conditional.validate+0x228>
    3ef8:      	add	x3, x9, x5, lsl #4
    3efc:      	ldr	x5, [x3]
    3f00:      	mov	w4, #0x21               ; =33
    3f04:      	mov	x3, x15
    3f08:      	and	w6, w5, #0xff
    3f0c:      	cmp	w6, #0x46
    3f10:      	b.eq	0x3e9c <_stogir.conditional.validate+0x228>
    3f14:      	cmp	w6, #0x48
    3f18:      	mov	w4, #0x21               ; =33
    3f1c:      	mov	x3, x15
    3f20:      	b.eq	0x3e9c <_stogir.conditional.validate+0x228>
    3f24:      	ubfx	w3, w5, #8, #8
    3f28:      	cmp	w3, w10
    3f2c:      	csel	x4, x16, x2, ne
    3f30:      	csel	x3, x15, x17, ne
    3f34:      	b	0x3e9c <_stogir.conditional.validate+0x228>
    3f38:      	ldr	x6, [x1, #0x30]
    3f3c:      	ldr	x3, [x1, #0x58]
    3f40:      	mov	w4, #0x10               ; =16
    3f44:      	cmp	x6, x3
    3f48:      	mov	x3, x12
    3f4c:      	b.ne	0x3e9c <_stogir.conditional.validate+0x228>
    3f50:      	sxtw	x7, w5
    3f54:      	mov	w4, #0x10               ; =16
    3f58:      	mov	x3, x12
    3f5c:      	cmn	x6, x7
    3f60:      	b.lt	0x3e9c <_stogir.conditional.validate+0x228>
    3f64:      	ldr	x3, [x1, #0x50]
    3f68:      	mvn	x4, x7
    3f6c:      	ldr	w3, [x3, x4, lsl #2]
    3f70:      	mov	w4, #0x10               ; =16
    3f74:      	cmp	w3, #0x0
    3f78:      	mov	x3, x12
    3f7c:      	b.le	0x3e9c <_stogir.conditional.validate+0x228>
    3f80:      	mvn	w3, w5
    3f84:      	ldr	x4, [x1, #0x28]
    3f88:      	and	x3, x3, #0x7fffffff
    3f8c:      	add	x3, x4, x3, lsl #4
    3f90:      	ldr	x5, [x3]
    3f94:      	mov	w4, #0x21               ; =33
    3f98:      	mov	x3, x15
    3f9c:      	and	w6, w5, #0xff
    3fa0:      	cmp	w6, #0x46
    3fa4:      	b.ne	0x3f14 <_stogir.conditional.validate+0x2a0>
    3fa8:      	b	0x3e9c <_stogir.conditional.validate+0x228>
    3fac:      	add	sp, sp, #0x10
    3fb0:      	cbz	x2, 0x3fc4 <_stogir.conditional.validate+0x350>
    3fb4:      	mov	w8, #0x1                ; =1
    3fb8:      	stp	x17, x2, [x0, #0x8]
    3fbc:      	str	w8, [x0]
    3fc0:      	ret
    3fc4:      	str	w10, [x0, #0x8]
    3fc8:      	str	wzr, [x0]
    3fcc:      	ret

0000000000003fd0 <_stogir.conversion.policy>:
    3fd0:      	cmp	w1, #0x24
    3fd4:      	b.ne	0x408c <_stogir.conversion.policy+0xbc>
    3fd8:      	and	w8, w2, #0xf
    3fdc:      	sub	w10, w2, #0x10
    3fe0:      	sub	w9, w8, #0x1
    3fe4:      	cmp	w9, #0xd
    3fe8:      	mov	w9, #0x70               ; =112
    3fec:      	ccmp	w10, w9, #0x2, lo
    3ff0:      	b.hs	0x405c <_stogir.conversion.policy+0x8c>
    3ff4:      	adrp	x9, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003ff4:  ARM64_RELOC_PAGE21	l_switch.table.stogir.types.size
    3ff8:      	add	x9, x9, #0x0
		0000000000003ff8:  ARM64_RELOC_PAGEOFF12	l_switch.table.stogir.types.size
    3ffc:      	add	x8, x9, w8, uxtw
    4000:      	lsr	w9, w2, #4
    4004:      	ldurb	w8, [x8, #-0x1]
    4008:      	sub	w9, w9, #0x1
    400c:      	lsl	w8, w8, w9
    4010:      	lsl	w8, w8, #3
    4014:      	and	w9, w3, #0xf
    4018:      	sub	w11, w3, #0x10
    401c:      	sub	w10, w9, #0x1
    4020:      	cmp	w10, #0xd
    4024:      	mov	w10, #0x70              ; =112
    4028:      	ccmp	w11, w10, #0x2, lo
    402c:      	b.hs	0x40dc <_stogir.conversion.policy+0x10c>
    4030:      	adrp	x10, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004030:  ARM64_RELOC_PAGE21	l_switch.table.stogir.types.size
    4034:      	add	x10, x10, #0x0
		0000000000004034:  ARM64_RELOC_PAGEOFF12	l_switch.table.stogir.types.size
    4038:      	add	x9, x10, w9, uxtw
    403c:      	lsr	w10, w3, #4
    4040:      	ldurb	w9, [x9, #-0x1]
    4044:      	sub	w10, w10, #0x1
    4048:      	lsl	w9, w9, w10
    404c:      	lsl	w9, w9, #3
    4050:      	cmp	w8, #0x1
    4054:      	b.ge	0x4174 <_stogir.conversion.policy+0x1a4>
    4058:      	b	0x4254 <_stogir.conversion.policy+0x284>
    405c:      	and	w8, w3, #0xf
    4060:      	sub	w10, w3, #0x10
    4064:      	sub	w8, w8, #0x1
    4068:      	cmp	w8, #0xd
    406c:      	ccmp	w10, w9, #0x2, lo
    4070:      	b.hs	0x408c <_stogir.conversion.policy+0xbc>
    4074:      	cmp	w2, #0xe
    4078:      	b.hs	0x4130 <_stogir.conversion.policy+0x160>
    407c:      	adrp	x8, 0x4000 <_stogir.conversion.policy+0x30>
		000000000000407c:  ARM64_RELOC_PAGE21	l_switch.table.stogir.conversion.policy.21
    4080:      	add	x8, x8, #0x0
		0000000000004080:  ARM64_RELOC_PAGEOFF12	l_switch.table.stogir.conversion.policy.21
    4084:      	ldrb	w8, [x8, w2, uxtw]
    4088:      	b	0x4014 <_stogir.conversion.policy+0x44>
    408c:      	cmp	w2, #0xe
    4090:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004090:  ARM64_RELOC_PAGE21	l_switch.table.stogir.conversion.policy.21
    4094:      	add	x9, x9, #0x0
		0000000000004094:  ARM64_RELOC_PAGEOFF12	l_switch.table.stogir.conversion.policy.21
    4098:      	b.hs	0x40bc <_stogir.conversion.policy+0xec>
    409c:      	ldrb	w8, [x9, w2, uxtw]
    40a0:      	cmp	w3, #0xd
    40a4:      	b.ls	0x40c8 <_stogir.conversion.policy+0xf8>
    40a8:      	mov	w9, #-0x8               ; =-8
    40ac:      	sub	w10, w1, #0x21
    40b0:      	cmp	w10, #0x6
    40b4:      	b.ls	0x416c <_stogir.conversion.policy+0x19c>
    40b8:      	b	0x4254 <_stogir.conversion.policy+0x284>
    40bc:      	mov	w8, #-0x8               ; =-8
    40c0:      	cmp	w3, #0xd
    40c4:      	b.hi	0x40a8 <_stogir.conversion.policy+0xd8>
    40c8:      	ldrb	w9, [x9, w3, uxtw]
    40cc:      	sub	w10, w1, #0x21
    40d0:      	cmp	w10, #0x6
    40d4:      	b.ls	0x416c <_stogir.conversion.policy+0x19c>
    40d8:      	b	0x4254 <_stogir.conversion.policy+0x284>
    40dc:      	cmp	w3, #0x6
    40e0:      	mov	w9, #0x8                ; =8
    40e4:      	b.le	0x4110 <_stogir.conversion.policy+0x140>
    40e8:      	cmp	w3, #0x9
    40ec:      	b.le	0x4138 <_stogir.conversion.policy+0x168>
    40f0:      	sub	w9, w3, #0xb
    40f4:      	cmp	w9, #0x2
    40f8:      	b.lo	0x4168 <_stogir.conversion.policy+0x198>
    40fc:      	cmp	w3, #0xa
    4100:      	b.eq	0x4248 <_stogir.conversion.policy+0x278>
    4104:      	cmp	w3, #0xd
    4108:      	b.eq	0x4248 <_stogir.conversion.policy+0x278>
    410c:      	b	0x4254 <_stogir.conversion.policy+0x284>
    4110:      	cmp	w3, #0x3
    4114:      	b.gt	0x415c <_stogir.conversion.policy+0x18c>
    4118:      	sub	w10, w3, #0x1
    411c:      	cmp	w10, #0x2
    4120:      	b.lo	0x416c <_stogir.conversion.policy+0x19c>
    4124:      	cmp	w3, #0x3
    4128:      	b.eq	0x414c <_stogir.conversion.policy+0x17c>
    412c:      	b	0x4254 <_stogir.conversion.policy+0x284>
    4130:      	mov	w8, #-0x8               ; =-8
    4134:      	b	0x4014 <_stogir.conversion.policy+0x44>
    4138:      	sub	w10, w3, #0x7
    413c:      	cmp	w10, #0x2
    4140:      	b.lo	0x416c <_stogir.conversion.policy+0x19c>
    4144:      	cmp	w3, #0x9
    4148:      	b.ne	0x4254 <_stogir.conversion.policy+0x284>
    414c:      	mov	w9, #0x10               ; =16
    4150:      	cmp	w8, #0x1
    4154:      	b.ge	0x4174 <_stogir.conversion.policy+0x1a4>
    4158:      	b	0x4254 <_stogir.conversion.policy+0x284>
    415c:      	sub	w9, w3, #0x5
    4160:      	cmp	w9, #0x2
    4164:      	b.hs	0x4240 <_stogir.conversion.policy+0x270>
    4168:      	mov	w9, #0x40               ; =64
    416c:      	cmp	w8, #0x1
    4170:      	b.lt	0x4254 <_stogir.conversion.policy+0x284>
    4174:      	cmp	w9, #0x1
    4178:      	b.lt	0x4254 <_stogir.conversion.policy+0x284>
    417c:      	sub	w10, w1, #0x25
    4180:      	cmp	w10, #0x2
    4184:      	b.hi	0x41b0 <_stogir.conversion.policy+0x1e0>
    4188:      	cmp	w1, #0x27
    418c:      	b.eq	0x41f4 <_stogir.conversion.policy+0x224>
    4190:      	cmp	w1, #0x26
    4194:      	b.ne	0x420c <_stogir.conversion.policy+0x23c>
    4198:      	sub	w10, w3, #0x1
    419c:      	and	w11, w2, #0xfe
    41a0:      	cmp	w10, #0xb
    41a4:      	ccmp	w11, #0xc, #0x0, lo
    41a8:      	b.eq	0x422c <_stogir.conversion.policy+0x25c>
    41ac:      	b	0x4254 <_stogir.conversion.policy+0x284>
    41b0:      	cmp	w1, #0x24
    41b4:      	b.ne	0x41c4 <_stogir.conversion.policy+0x1f4>
    41b8:      	cmp	w8, w9
    41bc:      	b.eq	0x422c <_stogir.conversion.policy+0x25c>
    41c0:      	b	0x4254 <_stogir.conversion.policy+0x284>
    41c4:      	sub	w10, w3, #0x1
    41c8:      	sub	w11, w2, #0x1
    41cc:      	cmp	w10, #0xb
    41d0:      	ccmp	w11, #0xb, #0x2, lo
    41d4:      	b.hs	0x4254 <_stogir.conversion.policy+0x284>
    41d8:      	cmp	w1, #0x23
    41dc:      	b.ne	0x4224 <_stogir.conversion.policy+0x254>
    41e0:      	cmp	w9, w8
    41e4:      	b.hs	0x4254 <_stogir.conversion.policy+0x284>
    41e8:      	str	wzr, [x0]
    41ec:      	str	w9, [x0, #0x8]
    41f0:      	ret
    41f4:      	and	w10, w3, #0xfe
    41f8:      	and	w11, w2, #0xfe
    41fc:      	cmp	w10, #0xc
    4200:      	ccmp	w11, #0xc, #0x0, eq
    4204:      	b.eq	0x422c <_stogir.conversion.policy+0x25c>
    4208:      	b	0x4254 <_stogir.conversion.policy+0x284>
    420c:      	and	w10, w3, #0xfe
    4210:      	sub	w11, w2, #0x1
    4214:      	cmp	w10, #0xc
    4218:      	ccmp	w11, #0xb, #0x2, eq
    421c:      	b.lo	0x422c <_stogir.conversion.policy+0x25c>
    4220:      	b	0x4254 <_stogir.conversion.policy+0x284>
    4224:      	cmp	w9, w8
    4228:      	b.ls	0x4254 <_stogir.conversion.policy+0x284>
    422c:      	cmp	w1, #0x26
    4230:      	str	wzr, [x0]
    4234:      	csel	w9, w9, w8, eq
    4238:      	str	w9, [x0, #0x8]
    423c:      	ret
    4240:      	cmp	w3, #0x4
    4244:      	b.ne	0x4254 <_stogir.conversion.policy+0x284>
    4248:      	mov	w9, #0x20               ; =32
    424c:      	cmp	w8, #0x1
    4250:      	b.ge	0x4174 <_stogir.conversion.policy+0x1a4>
    4254:      	mov	w8, #0x1                ; =1
    4258:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004258:  ARM64_RELOC_PAGE21	l_str.259
    425c:      	add	x9, x9, #0x0
		000000000000425c:  ARM64_RELOC_PAGEOFF12	l_str.259
    4260:      	str	w8, [x0]
    4264:      	mov	w8, #0x22               ; =34
    4268:      	stp	x9, x8, [x0, #0x8]
    426c:      	ret

0000000000004270 <_stogir.conversion.validate>:
    4270:      	cmp	w2, #0x1
    4274:      	b.lt	0x431c <_stogir.conversion.validate+0xac>
    4278:      	ldr	x11, [x1, #0x8]
    427c:      	mov	w8, w2
    4280:      	cmp	x11, x8
    4284:      	b.le	0x436c <_stogir.conversion.validate+0xfc>
    4288:      	ldr	x13, [x1, #0x80]
    428c:      	cmp	x13, x8
    4290:      	b.le	0x436c <_stogir.conversion.validate+0xfc>
    4294:      	ldr	x12, [x1, #0x78]
    4298:      	ldr	w10, [x12, x8, lsl #2]
    429c:      	tbnz	w10, #0x1f, 0x436c <_stogir.conversion.validate+0xfc>
    42a0:      	ldr	x14, [x1]
    42a4:      	lsl	x8, x8, #4
    42a8:      	cmp	w10, #0x1
    42ac:      	ldr	x9, [x14, x8]
    42b0:      	and	w8, w9, #0xff
    42b4:      	sub	w15, w8, #0x21
    42b8:      	ccmp	w15, #0x7, #0x2, eq
    42bc:      	b.hs	0x4350 <_stogir.conversion.validate+0xe0>
    42c0:      	lsr	x10, x9, #32
    42c4:      	cmp	w10, #0x1
    42c8:      	b.lt	0x4388 <_stogir.conversion.validate+0x118>
    42cc:      	cmp	x11, x10
    42d0:      	b.ls	0x43dc <_stogir.conversion.validate+0x16c>
    42d4:      	cmp	x13, x10
    42d8:      	b.ls	0x43dc <_stogir.conversion.validate+0x16c>
    42dc:      	ldr	w11, [x12, x10, lsl #2]
    42e0:      	tbnz	w11, #0x1f, 0x43dc <_stogir.conversion.validate+0x16c>
    42e4:      	add	x10, x14, x10, lsl #4
    42e8:      	ldr	x10, [x10]
    42ec:      	and	w11, w10, #0xff
    42f0:      	cmp	w11, #0x48
    42f4:      	b.eq	0x4300 <_stogir.conversion.validate+0x90>
    42f8:      	cmp	w11, #0x46
    42fc:      	b.ne	0x43f8 <_stogir.conversion.validate+0x188>
    4300:      	mov	w8, #0x1                ; =1
    4304:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004304:  ARM64_RELOC_PAGE21	l_str.263
    4308:      	add	x9, x9, #0x0
		0000000000004308:  ARM64_RELOC_PAGEOFF12	l_str.263
    430c:      	str	w8, [x0]
    4310:      	mov	w8, #0x25               ; =37
    4314:      	stp	x9, x8, [x0, #0x8]
    4318:      	ret
    431c:      	tbz	w2, #0x1f, 0x436c <_stogir.conversion.validate+0xfc>
    4320:      	ldr	x8, [x1, #0x30]
    4324:      	ldr	x9, [x1, #0x58]
    4328:      	cmp	x8, x9
    432c:      	b.ne	0x436c <_stogir.conversion.validate+0xfc>
    4330:      	sxtw	x9, w2
    4334:      	cmn	x8, x9
    4338:      	b.lt	0x436c <_stogir.conversion.validate+0xfc>
    433c:      	ldr	x8, [x1, #0x50]
    4340:      	mvn	x9, x9
    4344:      	ldr	w8, [x8, x9, lsl #2]
    4348:      	cmp	w8, #0x0
    434c:      	b.le	0x436c <_stogir.conversion.validate+0xfc>
    4350:      	mov	w8, #0x1                ; =1
    4354:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004354:  ARM64_RELOC_PAGE21	l_str.261
    4358:      	add	x9, x9, #0x0
		0000000000004358:  ARM64_RELOC_PAGEOFF12	l_str.261
    435c:      	str	w8, [x0]
    4360:      	mov	w8, #0x1e               ; =30
    4364:      	stp	x9, x8, [x0, #0x8]
    4368:      	ret
    436c:      	mov	w8, #0x1                ; =1
    4370:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004370:  ARM64_RELOC_PAGE21	l_str.260
    4374:      	add	x9, x9, #0x0
		0000000000004374:  ARM64_RELOC_PAGEOFF12	l_str.260
    4378:      	str	w8, [x0]
    437c:      	mov	w8, #0x12               ; =18
    4380:      	stp	x9, x8, [x0, #0x8]
    4384:      	ret
    4388:      	tbz	x9, #0x3f, 0x43dc <_stogir.conversion.validate+0x16c>
    438c:      	ldr	x11, [x1, #0x30]
    4390:      	ldr	x12, [x1, #0x58]
    4394:      	cmp	x11, x12
    4398:      	b.ne	0x43dc <_stogir.conversion.validate+0x16c>
    439c:      	asr	x12, x9, #32
    43a0:      	cmn	x11, x12
    43a4:      	b.lt	0x43dc <_stogir.conversion.validate+0x16c>
    43a8:      	ldr	x11, [x1, #0x50]
    43ac:      	mvn	x12, x12
    43b0:      	ldr	w11, [x11, x12, lsl #2]
    43b4:      	cmp	w11, #0x0
    43b8:      	b.le	0x43dc <_stogir.conversion.validate+0x16c>
    43bc:      	ldr	x11, [x1, #0x28]
    43c0:      	eor	x10, x10, #0xffffffff
    43c4:      	add	x10, x11, x10, lsl #4
    43c8:      	ldr	x10, [x10]
    43cc:      	and	w11, w10, #0xff
    43d0:      	cmp	w11, #0x48
    43d4:      	b.ne	0x42f8 <_stogir.conversion.validate+0x88>
    43d8:      	b	0x4300 <_stogir.conversion.validate+0x90>
    43dc:      	mov	w8, #0x1                ; =1
    43e0:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x30>
		00000000000043e0:  ARM64_RELOC_PAGE21	l_str.262
    43e4:      	add	x9, x9, #0x0
		00000000000043e4:  ARM64_RELOC_PAGEOFF12	l_str.262
    43e8:      	str	w8, [x0]
    43ec:      	mov	w8, #0x19               ; =25
    43f0:      	stp	x9, x8, [x0, #0x8]
    43f4:      	ret
    43f8:      	ubfx	w2, w10, #8, #8
    43fc:      	ubfx	w3, w9, #8, #8
    4400:      	mov	w1, w8
    4404:      	b	0x4404 <_stogir.conversion.validate+0x194>
		0000000000004404:  ARM64_RELOC_BRANCH26	_stogir.conversion.policy

0000000000004408 <_stogir.copy.validate>:
    4408:      	cmp	w2, #0x1
    440c:      	b.lt	0x44cc <_stogir.copy.validate+0xc4>
    4410:      	ldr	x10, [x1, #0x8]
    4414:      	mov	w8, w2
    4418:      	cmp	x10, x8
    441c:      	b.le	0x451c <_stogir.copy.validate+0x114>
    4420:      	ldr	x12, [x1, #0x80]
    4424:      	cmp	x12, x8
    4428:      	b.le	0x451c <_stogir.copy.validate+0x114>
    442c:      	ldr	x11, [x1, #0x78]
    4430:      	ldr	w14, [x11, x8, lsl #2]
    4434:      	tbnz	w14, #0x1f, 0x451c <_stogir.copy.validate+0x114>
    4438:      	ldr	x13, [x1]
    443c:      	lsl	x8, x8, #4
    4440:      	ldr	x9, [x13, x8]
    4444:      	and	x8, x9, #0xff
    4448:      	cmp	x8, #0x44
    444c:      	b.ne	0x4500 <_stogir.copy.validate+0xf8>
    4450:      	ubfx	x8, x9, #8, #8
    4454:      	cmp	w14, #0x2
    4458:      	ccmp	w8, #0x0, #0x4, eq
    445c:      	b.eq	0x4500 <_stogir.copy.validate+0xf8>
    4460:      	cmp	w8, #0xe
    4464:      	b.lo	0x4488 <_stogir.copy.validate+0x80>
    4468:      	lsr	x14, x9, #8
    446c:      	sub	w15, w8, #0x80
    4470:      	and	w14, w14, #0xf
    4474:      	sub	w14, w14, #0xe
    4478:      	cmn	w14, #0xd
    447c:      	mov	w14, #-0x70             ; =-112
    4480:      	ccmp	w15, w14, #0x0, hs
    4484:      	b.lo	0x4500 <_stogir.copy.validate+0xf8>
    4488:      	lsr	x14, x9, #32
    448c:      	cmp	w14, #0x1
    4490:      	b.lt	0x4538 <_stogir.copy.validate+0x130>
    4494:      	cmp	x10, x14
    4498:      	b.ls	0x45a4 <_stogir.copy.validate+0x19c>
    449c:      	cmp	x12, x14
    44a0:      	b.ls	0x45a4 <_stogir.copy.validate+0x19c>
    44a4:      	ldr	w10, [x11, x14, lsl #2]
    44a8:      	tbnz	w10, #0x1f, 0x45a4 <_stogir.copy.validate+0x19c>
    44ac:      	add	x10, x13, x14, lsl #4
    44b0:      	lsr	w9, w9, #8
    44b4:      	ldrb	w10, [x10, #0x1]
    44b8:      	cmp	w10, w9, uxtb
    44bc:      	b.ne	0x4588 <_stogir.copy.validate+0x180>
    44c0:      	str	wzr, [x0]
    44c4:      	str	w8, [x0, #0x8]
    44c8:      	ret
    44cc:      	tbz	w2, #0x1f, 0x451c <_stogir.copy.validate+0x114>
    44d0:      	ldr	x8, [x1, #0x30]
    44d4:      	ldr	x9, [x1, #0x58]
    44d8:      	cmp	x8, x9
    44dc:      	b.ne	0x451c <_stogir.copy.validate+0x114>
    44e0:      	sxtw	x9, w2
    44e4:      	cmn	x8, x9
    44e8:      	b.lt	0x451c <_stogir.copy.validate+0x114>
    44ec:      	ldr	x8, [x1, #0x50]
    44f0:      	mvn	x9, x9
    44f4:      	ldr	w8, [x8, x9, lsl #2]
    44f8:      	cmp	w8, #0x0
    44fc:      	b.le	0x451c <_stogir.copy.validate+0x114>
    4500:      	mov	w8, #0x1                ; =1
    4504:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004504:  ARM64_RELOC_PAGE21	l_str.265
    4508:      	add	x9, x9, #0x0
		0000000000004508:  ARM64_RELOC_PAGEOFF12	l_str.265
    450c:      	str	w8, [x0]
    4510:      	mov	w8, #0x21               ; =33
    4514:      	stp	x9, x8, [x0, #0x8]
    4518:      	ret
    451c:      	mov	w8, #0x1                ; =1
    4520:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004520:  ARM64_RELOC_PAGE21	l_str.264
    4524:      	add	x9, x9, #0x0
		0000000000004524:  ARM64_RELOC_PAGEOFF12	l_str.264
    4528:      	str	w8, [x0]
    452c:      	mov	w8, #0x18               ; =24
    4530:      	stp	x9, x8, [x0, #0x8]
    4534:      	ret
    4538:      	tbz	x9, #0x3f, 0x45a4 <_stogir.copy.validate+0x19c>
    453c:      	ldr	x10, [x1, #0x30]
    4540:      	ldr	x11, [x1, #0x58]
    4544:      	cmp	x10, x11
    4548:      	b.ne	0x45a4 <_stogir.copy.validate+0x19c>
    454c:      	asr	x11, x9, #32
    4550:      	cmn	x10, x11
    4554:      	b.lt	0x45a4 <_stogir.copy.validate+0x19c>
    4558:      	ldr	x10, [x1, #0x50]
    455c:      	mvn	x11, x11
    4560:      	ldr	w10, [x10, x11, lsl #2]
    4564:      	cmp	w10, #0x0
    4568:      	b.le	0x45a4 <_stogir.copy.validate+0x19c>
    456c:      	ldr	x10, [x1, #0x28]
    4570:      	eor	x11, x14, #0xffffffff
    4574:      	add	x10, x10, x11, lsl #4
    4578:      	lsr	w9, w9, #8
    457c:      	ldrb	w10, [x10, #0x1]
    4580:      	cmp	w10, w9, uxtb
    4584:      	b.eq	0x44c0 <_stogir.copy.validate+0xb8>
    4588:      	mov	w8, #0x1                ; =1
    458c:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x30>
		000000000000458c:  ARM64_RELOC_PAGE21	l_str.267
    4590:      	add	x9, x9, #0x0
		0000000000004590:  ARM64_RELOC_PAGEOFF12	l_str.267
    4594:      	str	w8, [x0]
    4598:      	mov	w8, #0x20               ; =32
    459c:      	stp	x9, x8, [x0, #0x8]
    45a0:      	ret
    45a4:      	mov	w8, #0x1                ; =1
    45a8:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x30>
		00000000000045a8:  ARM64_RELOC_PAGE21	l_str.266
    45ac:      	add	x9, x9, #0x0
		00000000000045ac:  ARM64_RELOC_PAGEOFF12	l_str.266
    45b0:      	str	w8, [x0]
    45b4:      	mov	w8, #0x13               ; =19
    45b8:      	stp	x9, x8, [x0, #0x8]
    45bc:      	ret

00000000000045c0 <_stogir.graph.lookup>:
    45c0:      	cmp	w2, #0x1
    45c4:      	b.lt	0x4608 <_stogir.graph.lookup+0x48>
    45c8:      	ldr	x9, [x1, #0x8]
    45cc:      	mov	w8, w2
    45d0:      	cmp	x9, x8
    45d4:      	b.le	0x4658 <_stogir.graph.lookup+0x98>
    45d8:      	ldr	x9, [x1, #0x80]
    45dc:      	cmp	x9, x8
    45e0:      	b.le	0x4658 <_stogir.graph.lookup+0x98>
    45e4:      	ldr	x9, [x1, #0x78]
    45e8:      	ldr	w9, [x9, x8, lsl #2]
    45ec:      	tbnz	w9, #0x1f, 0x4658 <_stogir.graph.lookup+0x98>
    45f0:      	ldr	x9, [x1]
    45f4:      	mov	w10, #0x1               ; =1
    45f8:      	ldr	q0, [x9, x8, lsl #4]
    45fc:      	str	w10, [x0]
    4600:      	stur	q0, [x0, #0x8]
    4604:      	ret
    4608:      	tbz	w2, #0x1f, 0x4658 <_stogir.graph.lookup+0x98>
    460c:      	ldr	x8, [x1, #0x30]
    4610:      	ldr	x9, [x1, #0x58]
    4614:      	cmp	x8, x9
    4618:      	b.ne	0x4658 <_stogir.graph.lookup+0x98>
    461c:      	sxtw	x9, w2
    4620:      	cmn	x8, x9
    4624:      	b.lt	0x4658 <_stogir.graph.lookup+0x98>
    4628:      	ldr	x8, [x1, #0x50]
    462c:      	mvn	x9, x9
    4630:      	ldr	w8, [x8, x9, lsl #2]
    4634:      	cmp	w8, #0x0
    4638:      	b.le	0x4658 <_stogir.graph.lookup+0x98>
    463c:      	ldr	x8, [x1, #0x28]
    4640:      	mvn	w9, w2
    4644:      	mov	w10, #0x1               ; =1
    4648:      	ldr	q0, [x8, w9, uxtw #4]
    464c:      	str	w10, [x0]
    4650:      	stur	q0, [x0, #0x8]
    4654:      	ret
    4658:      	str	wzr, [x0]
    465c:      	ret

0000000000004660 <_stogir.graph.operand>:
    4660:      	cmp	w1, #0x1
    4664:      	b.lt	0x469c <_stogir.graph.operand+0x3c>
    4668:      	ldr	x9, [x0, #0x8]
    466c:      	mov	w8, w1
    4670:      	cmp	x9, x8
    4674:      	b.le	0x469c <_stogir.graph.operand+0x3c>
    4678:      	ldr	x9, [x0, #0x80]
    467c:      	cmp	x9, x8
    4680:      	b.le	0x469c <_stogir.graph.operand+0x3c>
    4684:      	ldr	x9, [x0, #0x78]
    4688:      	ldr	w8, [x9, x8, lsl #2]
    468c:      	cmp	w2, w8
    4690:      	ccmp	w2, #0x1, #0x8, ls
    4694:      	ccmp	w8, #0x0, #0x8, ge
    4698:      	b.pl	0x46a4 <_stogir.graph.operand+0x44>
    469c:      	mov	x0, xzr
    46a0:      	ret
    46a4:      	add	w8, w1, w2, lsr #2
    46a8:      	ldr	x9, [x0]
    46ac:      	mov	w0, #0x1                ; =1
    46b0:      	add	x8, x9, w8, uxtw #4
    46b4:      	and	w9, w2, #0x3
    46b8:      	ldr	w1, [x8, w9, uxtw #2]
    46bc:      	ret

00000000000046c0 <_stogir.locals.validate>:
    46c0:      	sub	sp, sp, #0xe0
    46c4:      	cmp	w2, #0x1
    46c8:      	stp	x28, x27, [sp, #0x80]
    46cc:      	stp	x26, x25, [sp, #0x90]
    46d0:      	stp	x24, x23, [sp, #0xa0]
    46d4:      	stp	x22, x21, [sp, #0xb0]
    46d8:      	stp	x20, x19, [sp, #0xc0]
    46dc:      	stp	x29, x30, [sp, #0xd0]
    46e0:      	add	x29, sp, #0xd0
    46e4:      	b.lt	0x4754 <_stogir.locals.validate+0x94>
    46e8:      	ldr	x9, [x1, #0x8]
    46ec:      	mov	w8, w2
    46f0:      	cmp	x9, x8
    46f4:      	b.le	0x4814 <_stogir.locals.validate+0x154>
    46f8:      	ldr	x9, [x1, #0x80]
    46fc:      	cmp	x9, x8
    4700:      	b.le	0x4814 <_stogir.locals.validate+0x154>
    4704:      	ldr	x9, [x1, #0x78]
    4708:      	ldr	w9, [x9, x8, lsl #2]
    470c:      	tbnz	w9, #0x1f, 0x4814 <_stogir.locals.validate+0x154>
    4710:      	ldr	x9, [x1]
    4714:      	add	x8, x9, x8, lsl #4
    4718:      	ldr	x22, [x8]
    471c:      	mov	w10, #0x2               ; =2
    4720:      	and	w25, w22, #0xff
    4724:      	subs	w9, w25, #0x55
    4728:      	b.eq	0x47a8 <_stogir.locals.validate+0xe8>
    472c:      	cmp	w25, #0x56
    4730:      	cinc	w10, w10, ne
    4734:      	cmp	w25, #0x57
    4738:      	b.ne	0x47a8 <_stogir.locals.validate+0xe8>
    473c:      	mov	w23, #0x1               ; =1
    4740:      	cmp	w25, #0x41
    4744:      	csinc	w10, w10, wzr, ne
    4748:      	cmp	w2, #0x1
    474c:      	b.ge	0x47c0 <_stogir.locals.validate+0x100>
    4750:      	b	0x484c <_stogir.locals.validate+0x18c>
    4754:      	tbz	w2, #0x1f, 0x4814 <_stogir.locals.validate+0x154>
    4758:      	ldr	x8, [x1, #0x30]
    475c:      	ldr	x9, [x1, #0x58]
    4760:      	cmp	x8, x9
    4764:      	b.ne	0x4814 <_stogir.locals.validate+0x154>
    4768:      	sxtw	x9, w2
    476c:      	cmn	x8, x9
    4770:      	b.lt	0x4814 <_stogir.locals.validate+0x154>
    4774:      	ldr	x8, [x1, #0x50]
    4778:      	mvn	x9, x9
    477c:      	ldr	w8, [x8, x9, lsl #2]
    4780:      	cmp	w8, #0x0
    4784:      	b.le	0x4814 <_stogir.locals.validate+0x154>
    4788:      	ldr	x8, [x1, #0x28]
    478c:      	mvn	w9, w2
    4790:      	add	x8, x8, w9, uxtw #4
    4794:      	ldr	x22, [x8]
    4798:      	mov	w10, #0x2               ; =2
    479c:      	and	w25, w22, #0xff
    47a0:      	subs	w9, w25, #0x55
    47a4:      	b.ne	0x472c <_stogir.locals.validate+0x6c>
    47a8:      	cmp	w25, #0x58
    47ac:      	cset	w23, eq
    47b0:      	cmp	w25, #0x41
    47b4:      	csinc	w10, w10, wzr, ne
    47b8:      	cmp	w2, #0x1
    47bc:      	b.lt	0x484c <_stogir.locals.validate+0x18c>
    47c0:      	and	w11, w22, #0xff
    47c4:      	ldr	x26, [x8, #0x8]
    47c8:      	ldr	w24, [x8]
    47cc:      	cmp	w11, #0x41
    47d0:      	b.eq	0x47e4 <_stogir.locals.validate+0x124>
    47d4:      	cmp	w11, #0x48
    47d8:      	b.eq	0x47e4 <_stogir.locals.validate+0x124>
    47dc:      	cmp	w9, #0x3
    47e0:      	b.hi	0x484c <_stogir.locals.validate+0x18c>
    47e4:      	ldr	x8, [x1, #0x78]
    47e8:      	ldr	w9, [x8, w2, uxtw #2]
    47ec:      	cmp	w9, w10
    47f0:      	b.ne	0x484c <_stogir.locals.validate+0x18c>
    47f4:      	lsr	x19, x22, #32
    47f8:      	cmp	w25, #0x41
    47fc:      	mov	w9, w19
    4800:      	b.eq	0x4860 <_stogir.locals.validate+0x1a0>
    4804:      	cmp	w25, #0x48
    4808:      	b.ne	0x485c <_stogir.locals.validate+0x19c>
    480c:      	mov	w10, w2
    4810:      	b	0x4870 <_stogir.locals.validate+0x1b0>
    4814:      	mov	w8, #0x1                ; =1
    4818:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004818:  ARM64_RELOC_PAGE21	l_str.298
    481c:      	add	x9, x9, #0x0
		000000000000481c:  ARM64_RELOC_PAGEOFF12	l_str.298
    4820:      	str	w8, [x0]
    4824:      	mov	w8, #0x17               ; =23
    4828:      	stp	x9, x8, [x0, #0x8]
    482c:      	ldp	x29, x30, [sp, #0xd0]
    4830:      	ldp	x20, x19, [sp, #0xc0]
    4834:      	ldp	x22, x21, [sp, #0xb0]
    4838:      	ldp	x24, x23, [sp, #0xa0]
    483c:      	ldp	x26, x25, [sp, #0x90]
    4840:      	ldp	x28, x27, [sp, #0x80]
    4844:      	add	sp, sp, #0xe0
    4848:      	ret
    484c:      	mov	w8, #0x1                ; =1
    4850:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004850:  ARM64_RELOC_PAGE21	l_str.299
    4854:      	add	x9, x9, #0x0
		0000000000004854:  ARM64_RELOC_PAGEOFF12	l_str.299
    4858:      	b	0x4820 <_stogir.locals.validate+0x160>
    485c:      	mov	w9, w26
    4860:      	cmp	w9, #0x1
    4864:      	b.lt	0x48e4 <_stogir.locals.validate+0x224>
    4868:      	mov	w10, w9
    486c:      	mov	w2, w9
    4870:      	ldr	x9, [x1, #0x8]
    4874:      	cmp	x9, x10
    4878:      	b.le	0x492c <_stogir.locals.validate+0x26c>
    487c:      	ldr	x9, [x1, #0x80]
    4880:      	cmp	x9, x10
    4884:      	b.le	0x492c <_stogir.locals.validate+0x26c>
    4888:      	ldr	w9, [x8, x10, lsl #2]
    488c:      	tbnz	w9, #0x1f, 0x492c <_stogir.locals.validate+0x26c>
    4890:      	ldr	x9, [x1]
    4894:      	add	x10, x9, x10, lsl #4
    4898:      	ldp	x9, x10, [x10]
    489c:      	lsr	x11, x9, #8
    48a0:      	and	w12, w11, #0xf
    48a4:      	and	w11, w11, #0xff
    48a8:      	sub	w12, w12, #0x1
    48ac:      	sub	w13, w11, #0x10
    48b0:      	cmp	w12, #0xd
    48b4:      	mov	w12, #0x70              ; =112
    48b8:      	ccmp	w13, w12, #0x2, lo
    48bc:      	b.hs	0x4948 <_stogir.locals.validate+0x288>
    48c0:      	ubfx	x12, x9, #8, #4
    48c4:      	adrp	x13, 0x4000 <_stogir.conversion.policy+0x30>
		00000000000048c4:  ARM64_RELOC_PAGE21	l_switch.table.stogir.types.size
    48c8:      	add	x13, x13, #0x0
		00000000000048c8:  ARM64_RELOC_PAGEOFF12	l_switch.table.stogir.types.size
    48cc:      	lsr	w11, w11, #4
    48d0:      	add	x12, x13, x12
    48d4:      	ldurb	w12, [x12, #-0x1]
    48d8:      	sub	w11, w11, #0x1
    48dc:      	lsl	w27, w12, w11
    48e0:      	b	0x496c <_stogir.locals.validate+0x2ac>
    48e4:      	tbz	w9, #0x1f, 0x492c <_stogir.locals.validate+0x26c>
    48e8:      	ldr	x10, [x1, #0x30]
    48ec:      	ldr	x11, [x1, #0x58]
    48f0:      	cmp	x10, x11
    48f4:      	b.ne	0x492c <_stogir.locals.validate+0x26c>
    48f8:      	sxtw	x11, w9
    48fc:      	cmn	x10, x11
    4900:      	b.lt	0x492c <_stogir.locals.validate+0x26c>
    4904:      	ldr	x10, [x1, #0x50]
    4908:      	mvn	x11, x11
    490c:      	ldr	w10, [x10, x11, lsl #2]
    4910:      	cmp	w10, #0x0
    4914:      	b.le	0x492c <_stogir.locals.validate+0x26c>
    4918:      	ldr	x10, [x1, #0x28]
    491c:      	mvn	w11, w9
    4920:      	mov	w2, w9
    4924:      	add	x10, x10, w11, uxtw #4
    4928:      	b	0x4898 <_stogir.locals.validate+0x1d8>
    492c:      	adrp	x10, 0x4000 <_stogir.conversion.policy+0x30>
		000000000000492c:  ARM64_RELOC_PAGE21	l_str.294
    4930:      	add	x10, x10, #0x0
		0000000000004930:  ARM64_RELOC_PAGEOFF12	l_str.294
    4934:      	mov	w11, #0x16              ; =22
    4938:      	mov	w8, #0x1                ; =1
    493c:      	stp	x10, x11, [x0, #0x8]
    4940:      	str	w8, [x0]
    4944:      	b	0x482c <_stogir.locals.validate+0x16c>
    4948:      	ubfx	w11, w9, #8, #8
    494c:      	cmp	w11, #0xd
    4950:      	b.hi	0x4968 <_stogir.locals.validate+0x2a8>
    4954:      	ubfx	x11, x9, #8, #4
    4958:      	adrp	x12, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004958:  ARM64_RELOC_PAGE21	l_switch.table.stogir.types.size.23
    495c:      	add	x12, x12, #0x0
		000000000000495c:  ARM64_RELOC_PAGEOFF12	l_switch.table.stogir.types.size.23
    4960:      	ldrb	w27, [x12, x11]
    4964:      	b	0x496c <_stogir.locals.validate+0x2ac>
    4968:      	mov	w27, #-0x1              ; =-1
    496c:      	lsr	x11, x10, #32
    4970:      	cmp	x11, #0x0
    4974:      	csel	w12, w27, w11, eq
    4978:      	cmp	w10, #0x0
    497c:      	cset	w13, eq
    4980:      	cmp	w10, #0x1
    4984:      	b.lt	0x49d0 <_stogir.locals.validate+0x310>
    4988:      	ldr	x11, [x1, #0x140]
    498c:      	and	x10, x10, #0x7fffffff
    4990:      	cmp	x11, x10
    4994:      	b.ge	0x49a0 <_stogir.locals.validate+0x2e0>
    4998:      	mov	w13, wzr
    499c:      	b	0x49d0 <_stogir.locals.validate+0x310>
    49a0:      	mov	w11, #0x18              ; =24
    49a4:      	ldr	x13, [x1, #0x138]
    49a8:      	umaddl	x10, w10, w11, x13
    49ac:      	ldr	x13, [x1, #0x118]
    49b0:      	ldp	x11, x10, [x10, #-0x18]
    49b4:      	orr	x14, x11, x10
    49b8:      	cmn	x14, #0x1
    49bc:      	cset	w14, gt
    49c0:      	subs	x11, x13, x11
    49c4:      	csel	w13, wzr, w14, lt
    49c8:      	cmp	x10, x11
    49cc:      	csel	w13, wzr, w13, gt
    49d0:      	cmp	w2, #0x1
    49d4:      	adrp	x10, 0x4000 <_stogir.conversion.policy+0x30>
		00000000000049d4:  ARM64_RELOC_PAGE21	l_str.295
    49d8:      	add	x10, x10, #0x0
		00000000000049d8:  ARM64_RELOC_PAGEOFF12	l_str.295
    49dc:      	mov	w11, #0x1c              ; =28
    49e0:      	b.lt	0x4938 <_stogir.locals.validate+0x278>
    49e4:      	and	x14, x9, #0xff
    49e8:      	cmp	x14, #0x48
    49ec:      	b.ne	0x4938 <_stogir.locals.validate+0x278>
    49f0:      	ldr	w8, [x8, w2, uxtw #2]
    49f4:      	cmp	w8, #0x3
    49f8:      	ccmp	w27, #0x0, #0x4, eq
    49fc:      	cset	w8, gt
    4a00:      	tst	w8, w13
    4a04:      	b.eq	0x4a70 <_stogir.locals.validate+0x3b0>
    4a08:      	sxtw	x8, w12
    4a0c:      	mov	w11, #0x1c              ; =28
    4a10:      	cmp	w8, #0x1
    4a14:      	b.lt	0x4938 <_stogir.locals.validate+0x278>
    4a18:      	sub	x12, x8, #0x1
    4a1c:      	and	x8, x8, x12
    4a20:      	cbnz	x8, 0x4938 <_stogir.locals.validate+0x278>
    4a24:      	lsr	x21, x9, #32
    4a28:      	mov	x28, x0
    4a2c:      	add	x0, sp, #0x58
    4a30:      	mov	x20, x1
    4a34:      	mov	w2, w21
    4a38:      	bl	0x4a38 <_stogir.locals.validate+0x378>
		0000000000004a38:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    4a3c:      	ldr	w8, [sp, #0x58]
    4a40:      	cbz	w8, 0x4a78 <_stogir.locals.validate+0x3b8>
    4a44:      	cmp	w21, #0x1
    4a48:      	b.lt	0x4a60 <_stogir.locals.validate+0x3a0>
    4a4c:      	ldr	w8, [sp, #0x60]
    4a50:      	and	w8, w8, #0xfe
    4a54:      	sub	w8, w8, #0x72
    4a58:      	cmn	w8, #0xb
    4a5c:      	b.hi	0x4a8c <_stogir.locals.validate+0x3cc>
    4a60:      	adrp	x10, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004a60:  ARM64_RELOC_PAGE21	l_str.297
    4a64:      	add	x10, x10, #0x0
		0000000000004a64:  ARM64_RELOC_PAGEOFF12	l_str.297
    4a68:      	mov	w11, #0x2c              ; =44
    4a6c:      	b	0x4a84 <_stogir.locals.validate+0x3c4>
    4a70:      	mov	w11, #0x1c              ; =28
    4a74:      	b	0x4938 <_stogir.locals.validate+0x278>
    4a78:      	adrp	x10, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004a78:  ARM64_RELOC_PAGE21	l_str.296
    4a7c:      	add	x10, x10, #0x0
		0000000000004a7c:  ARM64_RELOC_PAGEOFF12	l_str.296
    4a80:      	mov	w11, #0x1d              ; =29
    4a84:      	mov	x0, x28
    4a88:      	b	0x4938 <_stogir.locals.validate+0x278>
    4a8c:      	cmp	w25, #0x48
    4a90:      	b.ne	0x4aa0 <_stogir.locals.validate+0x3e0>
    4a94:      	str	wzr, [x28]
    4a98:      	str	w27, [x28, #0x8]
    4a9c:      	b	0x482c <_stogir.locals.validate+0x16c>
    4aa0:      	cmp	w25, #0x41
    4aa4:      	b.ne	0x4ac4 <_stogir.locals.validate+0x404>
    4aa8:      	and	x8, x22, #0xff00
    4aac:      	cmp	x8, #0x600
    4ab0:      	b.ne	0x4b70 <_stogir.locals.validate+0x4b0>
    4ab4:      	mov	w8, #0x8                ; =8
    4ab8:      	str	wzr, [x28]
    4abc:      	str	w8, [x28, #0x8]
    4ac0:      	b	0x482c <_stogir.locals.validate+0x16c>
    4ac4:      	add	x0, sp, #0x8
    4ac8:      	mov	x1, x20
    4acc:      	mov	w2, w19
    4ad0:      	bl	0x4ad0 <_stogir.locals.validate+0x410>
		0000000000004ad0:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    4ad4:      	ldr	w8, [sp, #0x8]
    4ad8:      	cbz	w8, 0x4b88 <_stogir.locals.validate+0x4c8>
    4adc:      	cmp	w19, #0x1
    4ae0:      	b.lt	0x4b60 <_stogir.locals.validate+0x4a0>
    4ae4:      	ldrb	w8, [sp, #0x10]
    4ae8:      	sub	w9, w8, #0x4f
    4aec:      	cmp	w9, #0x33
    4af0:      	b.hi	0x4b60 <_stogir.locals.validate+0x4a0>
    4af4:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004af4:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.PROPERTIES
    4af8:      	add	x9, x9, #0x0
		0000000000004af8:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.PROPERTIES
    4afc:      	ldrb	w8, [x9, x8]
    4b00:      	tbnz	w8, #0x2, 0x4b60 <_stogir.locals.validate+0x4a0>
    4b04:      	cbz	w23, 0x4b24 <_stogir.locals.validate+0x464>
    4b08:      	lsr	x2, x26, #32
    4b0c:      	add	x0, sp, #0x30
    4b10:      	mov	x1, x20
    4b14:      	bl	0x4b14 <_stogir.locals.validate+0x454>
		0000000000004b14:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    4b18:      	ldr	w8, [sp, #0x30]
    4b1c:      	cbz	w8, 0x4bbc <_stogir.locals.validate+0x4fc>
    4b20:      	ldr	w24, [sp, #0x38]
    4b24:      	ubfx	w0, w24, #8, #8
    4b28:      	bl	0x4b28 <_stogir.locals.validate+0x468>
		0000000000004b28:  ARM64_RELOC_BRANCH26	_stogir.types.size
    4b2c:      	cmp	w0, #0x1
    4b30:      	b.lt	0x4ba4 <_stogir.locals.validate+0x4e4>
    4b34:      	cmp	w0, w27
    4b38:      	b.hi	0x4ba4 <_stogir.locals.validate+0x4e4>
    4b3c:      	tst	x22, #0xff00
    4b40:      	csel	w8, wzr, w23, eq
    4b44:      	tbnz	w8, #0x0, 0x4ba4 <_stogir.locals.validate+0x4e4>
    4b48:      	and	w8, w24, #0xff
    4b4c:      	cmp	w8, #0x48
    4b50:      	b.eq	0x4ba4 <_stogir.locals.validate+0x4e4>
    4b54:      	str	wzr, [x28]
    4b58:      	str	w0, [x28, #0x8]
    4b5c:      	b	0x482c <_stogir.locals.validate+0x16c>
    4b60:      	mov	w8, #0x1                ; =1
    4b64:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004b64:  ARM64_RELOC_PAGE21	l_str.302
    4b68:      	add	x9, x9, #0x0
		0000000000004b68:  ARM64_RELOC_PAGEOFF12	l_str.302
    4b6c:      	b	0x4b94 <_stogir.locals.validate+0x4d4>
    4b70:      	mov	w8, #0x1                ; =1
    4b74:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004b74:  ARM64_RELOC_PAGE21	l_str.300
    4b78:      	add	x9, x9, #0x0
		0000000000004b78:  ARM64_RELOC_PAGEOFF12	l_str.300
    4b7c:      	str	w8, [x28]
    4b80:      	mov	w8, #0x21               ; =33
    4b84:      	b	0x4b9c <_stogir.locals.validate+0x4dc>
    4b88:      	mov	w8, #0x1                ; =1
    4b8c:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004b8c:  ARM64_RELOC_PAGE21	l_str.301
    4b90:      	add	x9, x9, #0x0
		0000000000004b90:  ARM64_RELOC_PAGEOFF12	l_str.301
    4b94:      	str	w8, [x28]
    4b98:      	mov	w8, #0x1c               ; =28
    4b9c:      	stp	x9, x8, [x28, #0x8]
    4ba0:      	b	0x482c <_stogir.locals.validate+0x16c>
    4ba4:      	mov	w8, #0x1                ; =1
    4ba8:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004ba8:  ARM64_RELOC_PAGE21	l_str.304
    4bac:      	add	x9, x9, #0x0
		0000000000004bac:  ARM64_RELOC_PAGEOFF12	l_str.304
    4bb0:      	str	w8, [x28]
    4bb4:      	mov	w8, #0x23               ; =35
    4bb8:      	b	0x4b9c <_stogir.locals.validate+0x4dc>
    4bbc:      	mov	w8, #0x1                ; =1
    4bc0:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004bc0:  ARM64_RELOC_PAGE21	l_str.303
    4bc4:      	add	x9, x9, #0x0
		0000000000004bc4:  ARM64_RELOC_PAGEOFF12	l_str.303
    4bc8:      	str	w8, [x28]
    4bcc:      	mov	w8, #0x19               ; =25
    4bd0:      	b	0x4b9c <_stogir.locals.validate+0x4dc>

0000000000004bd4 <_stogir.stack.constant-size-aligned>:
    4bd4:      	cmp	x3, #0x10
    4bd8:      	b.lt	0x4c64 <_stogir.stack.constant-size-aligned+0x90>
    4bdc:      	sub	x8, x3, #0x1
    4be0:      	and	x8, x3, x8
    4be4:      	cbnz	x8, 0x4c64 <_stogir.stack.constant-size-aligned+0x90>
    4be8:      	cmp	w2, #0x1
    4bec:      	b.lt	0x4c80 <_stogir.stack.constant-size-aligned+0xac>
    4bf0:      	ldr	x9, [x1, #0x8]
    4bf4:      	mov	w8, w2
    4bf8:      	cmp	x9, x8
    4bfc:      	b.le	0x4cdc <_stogir.stack.constant-size-aligned+0x108>
    4c00:      	ldr	x9, [x1, #0x80]
    4c04:      	cmp	x9, x8
    4c08:      	b.le	0x4cdc <_stogir.stack.constant-size-aligned+0x108>
    4c0c:      	ldr	x9, [x1, #0x78]
    4c10:      	ldr	w9, [x9, x8, lsl #2]
    4c14:      	tbnz	w9, #0x1f, 0x4cdc <_stogir.stack.constant-size-aligned+0x108>
    4c18:      	ldr	x9, [x1]
    4c1c:      	add	x8, x9, x8, lsl #4
    4c20:      	ldp	x10, x8, [x8]
    4c24:      	ubfx	x9, x10, #8, #8
    4c28:      	cmp	w9, #0xd
    4c2c:      	b.hi	0x4cd0 <_stogir.stack.constant-size-aligned+0xfc>
    4c30:      	adrp	x11, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004c30:  ARM64_RELOC_PAGE21	ltmp1
    4c34:      	add	x11, x11, #0x0
		0000000000004c34:  ARM64_RELOC_PAGEOFF12	ltmp1
    4c38:      	mov	w12, wzr
    4c3c:      	adr	x14, 0x4c54 <_stogir.stack.constant-size-aligned+0x80>
    4c40:      	ldrb	w13, [x11, x9]
    4c44:      	add	x14, x14, x13, lsl #2
    4c48:      	mov	w11, w9
    4c4c:      	mov	w13, #0x1               ; =1
    4c50:      	br	x14
    4c54:      	mov	w13, wzr
    4c58:      	mov	w12, wzr
    4c5c:      	mov	w11, #0x8               ; =8
    4c60:      	b	0x4d24 <_stogir.stack.constant-size-aligned+0x150>
    4c64:      	mov	w8, #0x1                ; =1
    4c68:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004c68:  ARM64_RELOC_PAGE21	l_str.438
    4c6c:      	add	x9, x9, #0x0
		0000000000004c6c:  ARM64_RELOC_PAGEOFF12	l_str.438
    4c70:      	str	w8, [x0]
    4c74:      	mov	w8, #0x20               ; =32
    4c78:      	stp	x9, x8, [x0, #0x8]
    4c7c:      	ret
    4c80:      	tbz	w2, #0x1f, 0x4cdc <_stogir.stack.constant-size-aligned+0x108>
    4c84:      	ldr	x8, [x1, #0x30]
    4c88:      	ldr	x9, [x1, #0x58]
    4c8c:      	cmp	x8, x9
    4c90:      	b.ne	0x4cdc <_stogir.stack.constant-size-aligned+0x108>
    4c94:      	sxtw	x9, w2
    4c98:      	cmn	x8, x9
    4c9c:      	b.lt	0x4cdc <_stogir.stack.constant-size-aligned+0x108>
    4ca0:      	ldr	x8, [x1, #0x50]
    4ca4:      	mvn	x9, x9
    4ca8:      	ldr	w8, [x8, x9, lsl #2]
    4cac:      	cmp	w8, #0x0
    4cb0:      	b.le	0x4cdc <_stogir.stack.constant-size-aligned+0x108>
    4cb4:      	ldr	x8, [x1, #0x28]
    4cb8:      	mvn	w9, w2
    4cbc:      	add	x8, x8, w9, uxtw #4
    4cc0:      	ldp	x10, x8, [x8]
    4cc4:      	ubfx	x9, x10, #8, #8
    4cc8:      	cmp	w9, #0xd
    4ccc:      	b.ls	0x4c30 <_stogir.stack.constant-size-aligned+0x5c>
    4cd0:      	mov	w11, #-0x8              ; =-8
    4cd4:      	mov	w13, #0x1               ; =1
    4cd8:      	b	0x4d00 <_stogir.stack.constant-size-aligned+0x12c>
    4cdc:      	mov	w8, #0x1                ; =1
    4ce0:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004ce0:  ARM64_RELOC_PAGE21	l_str.439
    4ce4:      	add	x9, x9, #0x0
		0000000000004ce4:  ARM64_RELOC_PAGEOFF12	l_str.439
    4ce8:      	str	w8, [x0]
    4cec:      	mov	w8, #0x18               ; =24
    4cf0:      	stp	x9, x8, [x0, #0x8]
    4cf4:      	ret
    4cf8:      	mov	w13, wzr
    4cfc:      	mov	w11, #0x40              ; =64
    4d00:      	mov	w12, #0x1               ; =1
    4d04:      	b	0x4d24 <_stogir.stack.constant-size-aligned+0x150>
    4d08:      	mov	w13, wzr
    4d0c:      	mov	w12, wzr
    4d10:      	mov	w11, #0x20              ; =32
    4d14:      	b	0x4d24 <_stogir.stack.constant-size-aligned+0x150>
    4d18:      	mov	w13, wzr
    4d1c:      	mov	w12, wzr
    4d20:      	mov	w11, #0x10              ; =16
    4d24:      	tbz	w2, #0x1f, 0x4d9c <_stogir.stack.constant-size-aligned+0x1c8>
    4d28:      	sub	w14, w9, #0x1
    4d2c:      	cmp	w14, #0xa
    4d30:      	b.hi	0x4d9c <_stogir.stack.constant-size-aligned+0x1c8>
    4d34:      	and	w10, w10, #0xff
    4d38:      	cmp	w10, #0x49
    4d3c:      	ccmp	w10, w9, #0x4, ne
    4d40:      	csinc	w10, w13, wzr, eq
    4d44:      	tbnz	w10, #0x0, 0x4d9c <_stogir.stack.constant-size-aligned+0x1c8>
    4d48:      	lsr	x10, x8, x11
    4d4c:      	cmp	x10, #0x0
    4d50:      	csinc	w10, w12, wzr, ne
    4d54:      	cbz	w10, 0x4d9c <_stogir.stack.constant-size-aligned+0x1c8>
    4d58:      	sub	w9, w9, #0x7
    4d5c:      	cmp	w9, #0x4
    4d60:      	b.hi	0x4d70 <_stogir.stack.constant-size-aligned+0x19c>
    4d64:      	sub	w9, w11, #0x1
    4d68:      	lsr	x9, x8, x9
    4d6c:      	tbnz	w9, #0x0, 0x4d9c <_stogir.stack.constant-size-aligned+0x1c8>
    4d70:      	mov	x9, #-0x8000000000000000 ; =-9223372036854775808
    4d74:      	sub	x9, x9, x3
    4d78:      	cmp	x8, x9
    4d7c:      	b.hi	0x4d9c <_stogir.stack.constant-size-aligned+0x1c8>
    4d80:      	add	x8, x3, x8
    4d84:      	neg	x9, x3
    4d88:      	str	wzr, [x0]
    4d8c:      	sub	x8, x8, #0x1
    4d90:      	and	x8, x8, x9
    4d94:      	str	x8, [x0, #0x8]
    4d98:      	ret
    4d9c:      	mov	w8, #0x1                ; =1
    4da0:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004da0:  ARM64_RELOC_PAGE21	l_str.440
    4da4:      	add	x9, x9, #0x0
		0000000000004da4:  ARM64_RELOC_PAGEOFF12	l_str.440
    4da8:      	str	w8, [x0]
    4dac:      	mov	w8, #0x30               ; =48
    4db0:      	stp	x9, x8, [x0, #0x8]
    4db4:      	ret

0000000000004db8 <_stogir.switch.key>:
    4db8:      	sub	w9, w3, #0x1
    4dbc:      	cmp	w9, #0xb
    4dc0:      	b.hs	0x4e2c <_stogir.switch.key+0x74>
    4dc4:      	cmp	w2, #0x1
    4dc8:      	b.lt	0x4e50 <_stogir.switch.key+0x98>
    4dcc:      	ldr	x10, [x1, #0x8]
    4dd0:      	mov	w8, w2
    4dd4:      	cmp	x10, x8
    4dd8:      	b.le	0x4ec0 <_stogir.switch.key+0x108>
    4ddc:      	ldr	x10, [x1, #0x80]
    4de0:      	cmp	x10, x8
    4de4:      	b.le	0x4ec0 <_stogir.switch.key+0x108>
    4de8:      	ldr	x10, [x1, #0x78]
    4dec:      	ldr	w10, [x10, x8, lsl #2]
    4df0:      	tbnz	w10, #0x1f, 0x4ec0 <_stogir.switch.key+0x108>
    4df4:      	ldr	x10, [x1]
    4df8:      	add	x8, x10, x8, lsl #4
    4dfc:      	mov	w10, wzr
    4e00:      	cmp	w3, #0x6
    4e04:      	mov	w11, #0x8               ; =8
    4e08:      	b.gt	0x4ea0 <_stogir.switch.key+0xe8>
    4e0c:      	cmp	w3, #0x3
    4e10:      	b.le	0x4eac <_stogir.switch.key+0xf4>
    4e14:      	sub	w9, w3, #0x5
    4e18:      	cmp	w9, #0x2
    4e1c:      	b.hs	0x4eec <_stogir.switch.key+0x134>
    4e20:      	mov	w10, #0x1               ; =1
    4e24:      	mov	w11, #0x40              ; =64
    4e28:      	b	0x4ef4 <_stogir.switch.key+0x13c>
    4e2c:      	mov	w8, #0x1                ; =1
    4e30:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004e30:  ARM64_RELOC_PAGE21	l_str.468
    4e34:      	add	x9, x9, #0x0
		0000000000004e34:  ARM64_RELOC_PAGEOFF12	l_str.468
    4e38:      	str	w8, [x0]
    4e3c:      	mov	w8, #0x24               ; =36
    4e40:      	str	x9, [x0, #0x8]
    4e44:      	mov	w9, #0x10               ; =16
    4e48:      	str	x8, [x0, x9]
    4e4c:      	ret
    4e50:      	tbz	w2, #0x1f, 0x4ec0 <_stogir.switch.key+0x108>
    4e54:      	ldr	x8, [x1, #0x30]
    4e58:      	ldr	x10, [x1, #0x58]
    4e5c:      	cmp	x8, x10
    4e60:      	b.ne	0x4ec0 <_stogir.switch.key+0x108>
    4e64:      	sxtw	x10, w2
    4e68:      	cmn	x8, x10
    4e6c:      	b.lt	0x4ec0 <_stogir.switch.key+0x108>
    4e70:      	ldr	x8, [x1, #0x50]
    4e74:      	mvn	x10, x10
    4e78:      	ldr	w8, [x8, x10, lsl #2]
    4e7c:      	cmp	w8, #0x0
    4e80:      	b.le	0x4ec0 <_stogir.switch.key+0x108>
    4e84:      	ldr	x8, [x1, #0x28]
    4e88:      	mvn	w10, w2
    4e8c:      	add	x8, x8, w10, uxtw #4
    4e90:      	mov	w10, wzr
    4e94:      	cmp	w3, #0x6
    4e98:      	mov	w11, #0x8               ; =8
    4e9c:      	b.le	0x4e0c <_stogir.switch.key+0x54>
    4ea0:      	cmp	w3, #0x9
    4ea4:      	b.gt	0x4ee4 <_stogir.switch.key+0x12c>
    4ea8:      	sub	w9, w3, #0x7
    4eac:      	cmp	w9, #0x2
    4eb0:      	b.lo	0x4ef4 <_stogir.switch.key+0x13c>
    4eb4:      	mov	w10, wzr
    4eb8:      	mov	w11, #0x10              ; =16
    4ebc:      	b	0x4ef4 <_stogir.switch.key+0x13c>
    4ec0:      	mov	w8, #0x1                ; =1
    4ec4:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004ec4:  ARM64_RELOC_PAGE21	l_str.469
    4ec8:      	add	x9, x9, #0x0
		0000000000004ec8:  ARM64_RELOC_PAGEOFF12	l_str.469
    4ecc:      	str	w8, [x0]
    4ed0:      	mov	w8, #0x1c               ; =28
    4ed4:      	str	x9, [x0, #0x8]
    4ed8:      	mov	w9, #0x10               ; =16
    4edc:      	str	x8, [x0, x9]
    4ee0:      	ret
    4ee4:      	cmp	w3, #0xa
    4ee8:      	b.ne	0x4e20 <_stogir.switch.key+0x68>
    4eec:      	mov	w10, wzr
    4ef0:      	mov	w11, #0x20              ; =32
    4ef4:      	tbz	w2, #0x1f, 0x4f3c <_stogir.switch.key+0x184>
    4ef8:      	ldr	x9, [x8]
    4efc:      	mov	w13, #0x49              ; =73
    4f00:      	ubfx	w12, w9, #8, #8
    4f04:      	and	w9, w9, #0xff
    4f08:      	cmp	w9, w12
    4f0c:      	ccmp	w9, w13, #0x4, ne
    4f10:      	ccmp	w12, w3, #0x0, eq
    4f14:      	b.ne	0x4f3c <_stogir.switch.key+0x184>
    4f18:      	ldr	x8, [x8, #0x8]
    4f1c:      	lsr	x9, x8, x11
    4f20:      	cmp	x9, #0x0
    4f24:      	csinc	w9, w10, wzr, ne
    4f28:      	cbz	w9, 0x4f3c <_stogir.switch.key+0x184>
    4f2c:      	cmp	w3, #0x1
    4f30:      	b.ne	0x4f60 <_stogir.switch.key+0x1a8>
    4f34:      	cmp	x8, #0x1
    4f38:      	b.ls	0x4f98 <_stogir.switch.key+0x1e0>
    4f3c:      	mov	w8, #0x1                ; =1
    4f40:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004f40:  ARM64_RELOC_PAGE21	l_str.470
    4f44:      	add	x9, x9, #0x0
		0000000000004f44:  ARM64_RELOC_PAGEOFF12	l_str.470
    4f48:      	str	w8, [x0]
    4f4c:      	mov	w8, #0x30               ; =48
    4f50:      	str	x9, [x0, #0x8]
    4f54:      	mov	w9, #0x10               ; =16
    4f58:      	str	x8, [x0, x9]
    4f5c:      	ret
    4f60:      	sub	w9, w3, #0x7
    4f64:      	str	wzr, [x0]
    4f68:      	cmp	w9, #0x4
    4f6c:      	b.hi	0x4f9c <_stogir.switch.key+0x1e4>
    4f70:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004f70:  ARM64_RELOC_PAGE21	l_switch.table.stogir.switch.key
    4f74:      	add	x9, x9, #0x0
		0000000000004f74:  ARM64_RELOC_PAGEOFF12	l_switch.table.stogir.switch.key
    4f78:      	mov	w10, #0x1               ; =1
    4f7c:      	add	x9, x9, w3, uxtw
    4f80:      	ldurb	w9, [x9, #-0x7]
    4f84:      	lsl	x9, x10, x9
    4f88:      	eor	x8, x9, x8
    4f8c:      	mov	w9, #0x8                ; =8
    4f90:      	str	x8, [x0, x9]
    4f94:      	ret
    4f98:      	str	wzr, [x0]
    4f9c:      	mov	w9, #0x8                ; =8
    4fa0:      	str	x8, [x0, x9]
    4fa4:      	ret

0000000000004fa8 <_stogir.switch.switch-inputs>:
    4fa8:      	cmp	w2, #0x1
    4fac:      	b.lt	0x506c <_stogir.switch.switch-inputs+0xc4>
    4fb0:      	ldr	x8, [x1, #0x8]
    4fb4:      	mov	w12, w2
    4fb8:      	cmp	x8, x12
    4fbc:      	b.le	0x50bc <_stogir.switch.switch-inputs+0x114>
    4fc0:      	ldr	x9, [x1, #0x80]
    4fc4:      	cmp	x9, x12
    4fc8:      	b.le	0x50bc <_stogir.switch.switch-inputs+0x114>
    4fcc:      	ldr	x10, [x1, #0x78]
    4fd0:      	ldr	w11, [x10, x12, lsl #2]
    4fd4:      	tbnz	w11, #0x1f, 0x50bc <_stogir.switch.switch-inputs+0x114>
    4fd8:      	ldr	x11, [x1]
    4fdc:      	lsl	x12, x12, #4
    4fe0:      	ldr	x12, [x11, x12]
    4fe4:      	and	w13, w12, #0xff
    4fe8:      	sub	w13, w13, #0x4f
    4fec:      	cmp	w13, #0x33
    4ff0:      	b.hi	0x50a0 <_stogir.switch.switch-inputs+0xf8>
    4ff4:      	and	x12, x12, #0xff
    4ff8:      	adrp	x13, 0x4000 <_stogir.conversion.policy+0x30>
		0000000000004ff8:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.PROPERTIES
    4ffc:      	add	x13, x13, #0x0
		0000000000004ffc:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.PROPERTIES
    5000:      	ldrb	w12, [x13, x12]
    5004:      	tbnz	w12, #0x2, 0x50a0 <_stogir.switch.switch-inputs+0xf8>
    5008:      	cmp	w3, #0x1
    500c:      	b.lt	0x50d8 <_stogir.switch.switch-inputs+0x130>
    5010:      	mov	w12, w3
    5014:      	cmp	x8, x12
    5018:      	b.ls	0x511c <_stogir.switch.switch-inputs+0x174>
    501c:      	cmp	x9, x12
    5020:      	b.ls	0x511c <_stogir.switch.switch-inputs+0x174>
    5024:      	ldr	w8, [x10, x12, lsl #2]
    5028:      	tbnz	w8, #0x1f, 0x511c <_stogir.switch.switch-inputs+0x174>
    502c:      	add	x8, x11, x12, lsl #4
    5030:      	ldr	x9, [x8]
    5034:      	ubfx	w8, w9, #8, #8
    5038:      	and	x9, x9, #0xff
    503c:      	sub	w10, w8, #0xc
    5040:      	cmn	w10, #0xc
    5044:      	mov	w10, #0x48              ; =72
    5048:      	ccmp	x9, x10, #0x4, hi
    504c:      	b.ne	0x5138 <_stogir.switch.switch-inputs+0x190>
    5050:      	mov	w8, #0x1                ; =1
    5054:      	adrp	x9, 0x5000 <_stogir.switch.switch-inputs+0x58>
		0000000000005054:  ARM64_RELOC_PAGE21	l_str.472
    5058:      	add	x9, x9, #0x0
		0000000000005058:  ARM64_RELOC_PAGEOFF12	l_str.472
    505c:      	str	w8, [x0]
    5060:      	mov	w8, #0x20               ; =32
    5064:      	stp	x9, x8, [x0, #0x8]
    5068:      	ret
    506c:      	tbz	w2, #0x1f, 0x50bc <_stogir.switch.switch-inputs+0x114>
    5070:      	ldr	x8, [x1, #0x30]
    5074:      	ldr	x9, [x1, #0x58]
    5078:      	cmp	x8, x9
    507c:      	b.ne	0x50bc <_stogir.switch.switch-inputs+0x114>
    5080:      	sxtw	x9, w2
    5084:      	cmn	x8, x9
    5088:      	b.lt	0x50bc <_stogir.switch.switch-inputs+0x114>
    508c:      	ldr	x8, [x1, #0x50]
    5090:      	mvn	x9, x9
    5094:      	ldr	w8, [x8, x9, lsl #2]
    5098:      	cmp	w8, #0x0
    509c:      	b.le	0x50bc <_stogir.switch.switch-inputs+0x114>
    50a0:      	mov	w8, #0x1                ; =1
    50a4:      	adrp	x9, 0x5000 <_stogir.switch.switch-inputs+0x58>
		00000000000050a4:  ARM64_RELOC_PAGE21	l_str.474
    50a8:      	add	x9, x9, #0x0
		00000000000050a8:  ARM64_RELOC_PAGEOFF12	l_str.474
    50ac:      	str	w8, [x0]
    50b0:      	mov	w8, #0x16               ; =22
    50b4:      	stp	x9, x8, [x0, #0x8]
    50b8:      	ret
    50bc:      	mov	w8, #0x1                ; =1
    50c0:      	adrp	x9, 0x5000 <_stogir.switch.switch-inputs+0x58>
		00000000000050c0:  ARM64_RELOC_PAGE21	l_str.473
    50c4:      	add	x9, x9, #0x0
		00000000000050c4:  ARM64_RELOC_PAGEOFF12	l_str.473
    50c8:      	str	w8, [x0]
    50cc:      	mov	w8, #0x16               ; =22
    50d0:      	stp	x9, x8, [x0, #0x8]
    50d4:      	ret
    50d8:      	tbz	w3, #0x1f, 0x511c <_stogir.switch.switch-inputs+0x174>
    50dc:      	ldr	x8, [x1, #0x30]
    50e0:      	ldr	x9, [x1, #0x58]
    50e4:      	cmp	x8, x9
    50e8:      	b.ne	0x511c <_stogir.switch.switch-inputs+0x174>
    50ec:      	sxtw	x9, w3
    50f0:      	cmn	x8, x9
    50f4:      	b.lt	0x511c <_stogir.switch.switch-inputs+0x174>
    50f8:      	ldr	x8, [x1, #0x50]
    50fc:      	mvn	x9, x9
    5100:      	ldr	w8, [x8, x9, lsl #2]
    5104:      	cmp	w8, #0x0
    5108:      	b.le	0x511c <_stogir.switch.switch-inputs+0x174>
    510c:      	ldr	x8, [x1, #0x28]
    5110:      	mvn	w9, w3
    5114:      	add	x8, x8, w9, uxtw #4
    5118:      	b	0x5030 <_stogir.switch.switch-inputs+0x88>
    511c:      	mov	w8, #0x1                ; =1
    5120:      	adrp	x9, 0x5000 <_stogir.switch.switch-inputs+0x58>
		0000000000005120:  ARM64_RELOC_PAGE21	l_str.471
    5124:      	add	x9, x9, #0x0
		0000000000005124:  ARM64_RELOC_PAGEOFF12	l_str.471
    5128:      	str	w8, [x0]
    512c:      	mov	w8, #0x17               ; =23
    5130:      	stp	x9, x8, [x0, #0x8]
    5134:      	ret
    5138:      	str	wzr, [x0]
    513c:      	str	w8, [x0, #0x8]
    5140:      	ret

0000000000005144 <_stogir.types.scalar-size>:
    5144:      	cmp	w0, #0xd
    5148:      	b.hi	0x515c <_stogir.types.scalar-size+0x18>
    514c:      	adrp	x8, 0x5000 <_stogir.switch.switch-inputs+0x58>
		000000000000514c:  ARM64_RELOC_PAGE21	l_switch.table.stogir.types.size.23
    5150:      	add	x8, x8, #0x0
		0000000000005150:  ARM64_RELOC_PAGEOFF12	l_switch.table.stogir.types.size.23
    5154:      	ldrb	w0, [x8, w0, uxtw]
    5158:      	ret
    515c:      	mov	w0, #-0x1               ; =-1
    5160:      	ret

0000000000005164 <_stogir.types.size>:
    5164:      	and	w8, w0, #0xf
    5168:      	mov	w9, #0x70               ; =112
    516c:      	sub	w11, w0, #0x10
    5170:      	sub	w10, w8, #0x1
    5174:      	cmp	w10, #0xd
    5178:      	ccmp	w11, w9, #0x2, lo
    517c:      	b.hs	0x51a0 <_stogir.types.size+0x3c>
    5180:      	adrp	x9, 0x5000 <_stogir.switch.switch-inputs+0x58>
		0000000000005180:  ARM64_RELOC_PAGE21	l_switch.table.stogir.types.size
    5184:      	add	x9, x9, #0x0
		0000000000005184:  ARM64_RELOC_PAGEOFF12	l_switch.table.stogir.types.size
    5188:      	add	x8, x9, w8, uxtw
    518c:      	lsr	w9, w0, #4
    5190:      	ldurb	w8, [x8, #-0x1]
    5194:      	sub	w9, w9, #0x1
    5198:      	lsl	w0, w8, w9
    519c:      	ret
    51a0:      	cmp	w0, #0xd
    51a4:      	b.hi	0x51b8 <_stogir.types.size+0x54>
    51a8:      	adrp	x8, 0x5000 <_stogir.switch.switch-inputs+0x58>
		00000000000051a8:  ARM64_RELOC_PAGE21	l_switch.table.stogir.types.size.23
    51ac:      	add	x8, x8, #0x0
		00000000000051ac:  ARM64_RELOC_PAGEOFF12	l_switch.table.stogir.types.size.23
    51b0:      	ldrb	w0, [x8, w0, uxtw]
    51b4:      	ret
    51b8:      	mov	w0, #-0x1               ; =-1
    51bc:      	ret

00000000000051c0 <_stogir.vector-arithmetic.node?>:
    51c0:      	cmp	w1, #0x1
    51c4:      	b.lt	0x5244 <_stogir.vector-arithmetic.node?+0x84>
    51c8:      	ldr	x9, [x0, #0x8]
    51cc:      	mov	w8, w1
    51d0:      	cmp	x9, x8
    51d4:      	b.le	0x52c8 <_stogir.vector-arithmetic.node?+0x108>
    51d8:      	ldr	x9, [x0, #0x80]
    51dc:      	cmp	x9, x8
    51e0:      	b.le	0x52c8 <_stogir.vector-arithmetic.node?+0x108>
    51e4:      	ldr	x9, [x0, #0x78]
    51e8:      	ldr	w9, [x9, x8, lsl #2]
    51ec:      	tbnz	w9, #0x1f, 0x52c8 <_stogir.vector-arithmetic.node?+0x108>
    51f0:      	ldr	x9, [x0]
    51f4:      	add	x8, x9, x8, lsl #4
    51f8:      	ldr	x8, [x8]
    51fc:      	and	w9, w8, #0xff
    5200:      	cmp	w9, #0x39
    5204:      	b.hi	0x5294 <_stogir.vector-arithmetic.node?+0xd4>
    5208:      	mov	x10, #0x80000000        ; =2147483648
    520c:      	and	x9, x8, #0xff
    5210:      	movk	x10, #0x2001, lsl #32
    5214:      	movk	x10, #0x3c0, lsl #48
    5218:      	lsr	x9, x10, x9
    521c:      	tbz	w9, #0x0, 0x5294 <_stogir.vector-arithmetic.node?+0xd4>
    5220:      	lsr	w9, w8, #8
    5224:      	ubfx	w8, w8, #8, #4
    5228:      	and	w9, w9, #0xf0
    522c:      	sub	w8, w8, #0x1
    5230:      	sub	w9, w9, #0x10
    5234:      	cmp	w9, #0x70
    5238:      	ccmp	w8, #0xd, #0x2, lo
    523c:      	cset	w0, lo
    5240:      	ret
    5244:      	tbz	w1, #0x1f, 0x52c8 <_stogir.vector-arithmetic.node?+0x108>
    5248:      	ldr	x8, [x0, #0x30]
    524c:      	ldr	x9, [x0, #0x58]
    5250:      	cmp	x8, x9
    5254:      	b.ne	0x52c8 <_stogir.vector-arithmetic.node?+0x108>
    5258:      	sxtw	x9, w1
    525c:      	cmn	x8, x9
    5260:      	b.lt	0x52c8 <_stogir.vector-arithmetic.node?+0x108>
    5264:      	ldr	x8, [x0, #0x50]
    5268:      	mvn	x9, x9
    526c:      	ldr	w8, [x8, x9, lsl #2]
    5270:      	cmp	w8, #0x0
    5274:      	b.le	0x52c8 <_stogir.vector-arithmetic.node?+0x108>
    5278:      	ldr	x8, [x0, #0x28]
    527c:      	mvn	w9, w1
    5280:      	add	x8, x8, w9, uxtw #4
    5284:      	ldr	x8, [x8]
    5288:      	and	w9, w8, #0xff
    528c:      	cmp	w9, #0x39
    5290:      	b.ls	0x5208 <_stogir.vector-arithmetic.node?+0x48>
    5294:      	and	x9, x8, #0xfe
    5298:      	cmp	x9, #0x3a
    529c:      	b.eq	0x5220 <_stogir.vector-arithmetic.node?+0x60>
    52a0:      	and	w9, w8, #0xff
    52a4:      	mov	w0, wzr
    52a8:      	cmp	w9, #0x35
    52ac:      	b.hi	0x52cc <_stogir.vector-arithmetic.node?+0x10c>
    52b0:      	mov	x10, #0x3fc00000000000  ; =17944029765304320
    52b4:      	and	x9, x8, #0xff
    52b8:      	movk	x10, #0x7c00, lsl #16
    52bc:      	lsr	x9, x10, x9
    52c0:      	tbnz	w9, #0x0, 0x5220 <_stogir.vector-arithmetic.node?+0x60>
    52c4:      	b	0x52cc <_stogir.vector-arithmetic.node?+0x10c>
    52c8:      	mov	w0, wzr
    52cc:      	ret

00000000000052d0 <_stogir.vector.memory-inputs>:
    52d0:      	and	w8, w2, #0xf
    52d4:      	sub	w9, w2, #0x10
    52d8:      	sub	w8, w8, #0x1
    52dc:      	cmp	w8, #0xd
    52e0:      	mov	w8, #0x70               ; =112
    52e4:      	ccmp	w9, w8, #0x2, lo
    52e8:      	b.hs	0x53c8 <_stogir.vector.memory-inputs+0xf8>
    52ec:      	sub	sp, sp, #0x50
    52f0:      	cmp	w3, #0x0
    52f4:      	stp	x20, x19, [sp, #0x30]
    52f8:      	stp	x29, x30, [sp, #0x40]
    52fc:      	add	x29, sp, #0x40
    5300:      	b.le	0x53e4 <_stogir.vector.memory-inputs+0x114>
    5304:      	ldr	x9, [x1, #0x8]
    5308:      	mov	w8, w3
    530c:      	cmp	x9, x8
    5310:      	b.le	0x5440 <_stogir.vector.memory-inputs+0x170>
    5314:      	ldr	x9, [x1, #0x80]
    5318:      	cmp	x9, x8
    531c:      	b.le	0x5440 <_stogir.vector.memory-inputs+0x170>
    5320:      	ldr	x9, [x1, #0x78]
    5324:      	ldr	w9, [x9, x8, lsl #2]
    5328:      	tbnz	w9, #0x1f, 0x5440 <_stogir.vector.memory-inputs+0x170>
    532c:      	ldr	x9, [x1]
    5330:      	lsl	x8, x8, #4
    5334:      	ldr	x8, [x9, x8]
    5338:      	and	w9, w8, #0xff
    533c:      	sub	w9, w9, #0x4f
    5340:      	cmp	w9, #0x33
    5344:      	b.hi	0x5418 <_stogir.vector.memory-inputs+0x148>
    5348:      	and	x8, x8, #0xff
    534c:      	adrp	x9, 0x5000 <_stogir.switch.switch-inputs+0x58>
		000000000000534c:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.PROPERTIES
    5350:      	add	x9, x9, #0x0
		0000000000005350:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.PROPERTIES
    5354:      	ldrb	w8, [x9, x8]
    5358:      	tbnz	w8, #0x2, 0x5418 <_stogir.vector.memory-inputs+0x148>
    535c:      	mov	w19, w2
    5360:      	mov	x20, x0
    5364:      	add	x0, sp, #0x8
    5368:      	mov	w2, w4
    536c:      	bl	0x536c <_stogir.vector.memory-inputs+0x9c>
		000000000000536c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    5370:      	ldr	w8, [sp, #0x8]
    5374:      	cbz	w8, 0x5468 <_stogir.vector.memory-inputs+0x198>
    5378:      	ldr	w9, [sp, #0x10]
    537c:      	and	w8, w9, #0xff00
    5380:      	cmp	w8, #0x600
    5384:      	mov	x8, x20
    5388:      	b.ne	0x53a0 <_stogir.vector.memory-inputs+0xd0>
    538c:      	and	w9, w9, #0xff
    5390:      	cmp	w9, #0x48
    5394:      	b.eq	0x53a0 <_stogir.vector.memory-inputs+0xd0>
    5398:      	cmp	w9, #0x46
    539c:      	b.ne	0x5490 <_stogir.vector.memory-inputs+0x1c0>
    53a0:      	mov	w9, #0x1                ; =1
    53a4:      	adrp	x10, 0x5000 <_stogir.switch.switch-inputs+0x58>
		00000000000053a4:  ARM64_RELOC_PAGE21	l_str.541
    53a8:      	add	x10, x10, #0x0
		00000000000053a8:  ARM64_RELOC_PAGEOFF12	l_str.541
    53ac:      	str	w9, [x8]
    53b0:      	mov	w9, #0x2b               ; =43
    53b4:      	stp	x10, x9, [x8, #0x8]
    53b8:      	ldp	x29, x30, [sp, #0x40]
    53bc:      	ldp	x20, x19, [sp, #0x30]
    53c0:      	add	sp, sp, #0x50
    53c4:      	ret
    53c8:      	mov	w8, #0x1                ; =1
    53cc:      	adrp	x9, 0x5000 <_stogir.switch.switch-inputs+0x58>
		00000000000053cc:  ARM64_RELOC_PAGE21	l_str.537
    53d0:      	add	x9, x9, #0x0
		00000000000053d0:  ARM64_RELOC_PAGEOFF12	l_str.537
    53d4:      	str	w8, [x0]
    53d8:      	mov	w8, #0x32               ; =50
    53dc:      	stp	x9, x8, [x0, #0x8]
    53e0:      	ret
    53e4:      	tbz	w3, #0x1f, 0x5440 <_stogir.vector.memory-inputs+0x170>
    53e8:      	ldr	x8, [x1, #0x30]
    53ec:      	ldr	x9, [x1, #0x58]
    53f0:      	cmp	x8, x9
    53f4:      	b.ne	0x5440 <_stogir.vector.memory-inputs+0x170>
    53f8:      	sxtw	x9, w3
    53fc:      	cmn	x8, x9
    5400:      	b.lt	0x5440 <_stogir.vector.memory-inputs+0x170>
    5404:      	ldr	x8, [x1, #0x50]
    5408:      	mvn	x9, x9
    540c:      	ldr	w8, [x8, x9, lsl #2]
    5410:      	cmp	w8, #0x0
    5414:      	b.le	0x5440 <_stogir.vector.memory-inputs+0x170>
    5418:      	mov	w8, #0x1                ; =1
    541c:      	adrp	x9, 0x5000 <_stogir.switch.switch-inputs+0x58>
		000000000000541c:  ARM64_RELOC_PAGE21	l_str.539
    5420:      	add	x9, x9, #0x0
		0000000000005420:  ARM64_RELOC_PAGEOFF12	l_str.539
    5424:      	str	w8, [x0]
    5428:      	mov	w8, #0x2c               ; =44
    542c:      	stp	x9, x8, [x0, #0x8]
    5430:      	ldp	x29, x30, [sp, #0x40]
    5434:      	ldp	x20, x19, [sp, #0x30]
    5438:      	add	sp, sp, #0x50
    543c:      	ret
    5440:      	mov	w8, #0x1                ; =1
    5444:      	adrp	x9, 0x5000 <_stogir.switch.switch-inputs+0x58>
		0000000000005444:  ARM64_RELOC_PAGE21	l_str.538
    5448:      	add	x9, x9, #0x0
		0000000000005448:  ARM64_RELOC_PAGEOFF12	l_str.538
    544c:      	str	w8, [x0]
    5450:      	mov	w8, #0x1d               ; =29
    5454:      	stp	x9, x8, [x0, #0x8]
    5458:      	ldp	x29, x30, [sp, #0x40]
    545c:      	ldp	x20, x19, [sp, #0x30]
    5460:      	add	sp, sp, #0x50
    5464:      	ret
    5468:      	mov	w8, #0x1                ; =1
    546c:      	adrp	x9, 0x5000 <_stogir.switch.switch-inputs+0x58>
		000000000000546c:  ARM64_RELOC_PAGE21	l_str.540
    5470:      	add	x9, x9, #0x0
		0000000000005470:  ARM64_RELOC_PAGEOFF12	l_str.540
    5474:      	str	w8, [x20]
    5478:      	mov	w8, #0x1d               ; =29
    547c:      	stp	x9, x8, [x20, #0x8]
    5480:      	ldp	x29, x30, [sp, #0x40]
    5484:      	ldp	x20, x19, [sp, #0x30]
    5488:      	add	sp, sp, #0x50
    548c:      	ret
    5490:      	mov	w0, w19
    5494:      	str	wzr, [x8]
    5498:      	mov	x20, x8
    549c:      	bl	0x549c <_stogir.vector.memory-inputs+0x1cc>
		000000000000549c:  ARM64_RELOC_BRANCH26	_stogir.types.size
    54a0:      	str	w0, [x20, #0x8]
    54a4:      	ldp	x29, x30, [sp, #0x40]
    54a8:      	ldp	x20, x19, [sp, #0x30]
    54ac:      	add	sp, sp, #0x50
    54b0:      	ret

00000000000054b4 <_stogir.vector.store-inputs>:
    54b4:      	mov	w8, w3
    54b8:      	mov	w3, w2
    54bc:      	cmp	w4, #0x1
    54c0:      	b.lt	0x5500 <_stogir.vector.store-inputs+0x4c>
    54c4:      	ldr	x10, [x1, #0x8]
    54c8:      	mov	w9, w4
    54cc:      	cmp	x10, x9
    54d0:      	b.le	0x554c <_stogir.vector.store-inputs+0x98>
    54d4:      	ldr	x10, [x1, #0x80]
    54d8:      	cmp	x10, x9
    54dc:      	b.le	0x554c <_stogir.vector.store-inputs+0x98>
    54e0:      	ldr	x10, [x1, #0x78]
    54e4:      	ldr	w10, [x10, x9, lsl #2]
    54e8:      	tbnz	w10, #0x1f, 0x554c <_stogir.vector.store-inputs+0x98>
    54ec:      	ldr	x10, [x1]
    54f0:      	add	x9, x10, x9, lsl #4
    54f4:      	ldrb	w2, [x9, #0x1]
    54f8:      	mov	w4, w8
    54fc:      	b	0x54fc <_stogir.vector.store-inputs+0x48>
		00000000000054fc:  ARM64_RELOC_BRANCH26	_stogir.vector.memory-inputs
    5500:      	tbz	w4, #0x1f, 0x554c <_stogir.vector.store-inputs+0x98>
    5504:      	ldr	x9, [x1, #0x30]
    5508:      	ldr	x10, [x1, #0x58]
    550c:      	cmp	x9, x10
    5510:      	b.ne	0x554c <_stogir.vector.store-inputs+0x98>
    5514:      	sxtw	x10, w4
    5518:      	cmn	x9, x10
    551c:      	b.lt	0x554c <_stogir.vector.store-inputs+0x98>
    5520:      	ldr	x9, [x1, #0x50]
    5524:      	mvn	x10, x10
    5528:      	ldr	w9, [x9, x10, lsl #2]
    552c:      	cmp	w9, #0x0
    5530:      	b.le	0x554c <_stogir.vector.store-inputs+0x98>
    5534:      	ldr	x9, [x1, #0x28]
    5538:      	mvn	w10, w4
    553c:      	add	x9, x9, w10, uxtw #4
    5540:      	ldrb	w2, [x9, #0x1]
    5544:      	mov	w4, w8
    5548:      	b	0x5548 <_stogir.vector.store-inputs+0x94>
		0000000000005548:  ARM64_RELOC_BRANCH26	_stogir.vector.memory-inputs
    554c:      	mov	w8, #0x1                ; =1
    5550:      	adrp	x9, 0x5000 <_stogir.switch.switch-inputs+0x58>
		0000000000005550:  ARM64_RELOC_PAGE21	l_str.542
    5554:      	add	x9, x9, #0x0
		0000000000005554:  ARM64_RELOC_PAGEOFF12	l_str.542
    5558:      	str	w8, [x0]
    555c:      	mov	w8, #0x1a               ; =26
    5560:      	stp	x9, x8, [x0, #0x8]
    5564:      	ret
