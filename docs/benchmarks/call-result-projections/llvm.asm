
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-call-result-projections/build/projections-verifier/llvm.o:	file format mach-o arm64

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
      90:      	sub	sp, sp, #0x1c0
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
      d0:      	cbnz	x28, 0x3888 <_gap_verify_graph+0x3824>
      d4:      	cmp	x3, x8
      d8:      	b.ge	0x480 <_gap_verify_graph+0x41c>
      dc:      	ldr	x4, [x19, #0x78]
      e0:      	mov	x0, #-0x1               ; =-1
      e4:      	ldr	w5, [x4, x3, lsl #2]
      e8:      	lsr	w13, w5, #16
      ec:      	cbnz	w13, 0x388c <_gap_verify_graph+0x3828>
      f0:      	ldr	x6, [x19]
      f4:      	lsl	x13, x3, #4
      f8:      	ldr	x20, [x6, x13]
      fc:      	and	w21, w20, #0xff
     100:      	cmp	w21, #0x82
     104:      	b.hi	0x388c <_gap_verify_graph+0x3828>
     108:      	ubfx	w22, w20, #8, #8
     10c:      	cmp	w22, #0xe
     110:      	b.lo	0x130 <_gap_verify_graph+0xcc>
     114:      	sub	w13, w22, #0x80
     118:      	cmn	w13, #0x70
     11c:      	b.lo	0x388c <_gap_verify_graph+0x3828>
     120:      	ubfx	w13, w20, #8, #4
     124:      	sub	w13, w13, #0xe
     128:      	cmn	w13, #0xd
     12c:      	b.lo	0x388c <_gap_verify_graph+0x3828>
     130:      	and	x7, x20, #0xff
     134:      	adrp	x13, 0x0 <ltmp0>
		0000000000000134:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.OPERAND-SLOTS
     138:      	add	x13, x13, #0x0
		0000000000000138:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.OPERAND-SLOTS
     13c:      	ldrsb	w13, [x13, x7]
     140:      	tbnz	w13, #0x1f, 0x14c <_gap_verify_graph+0xe8>
     144:      	cmp	w5, w13
     148:      	b.ne	0x388c <_gap_verify_graph+0x3828>
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
     22c:      	b	0x3888 <_gap_verify_graph+0x3824>
     230:      	add	w13, w3, w25, lsr #2
     234:      	and	w26, w25, #0x3
     238:      	add	x13, x6, w13, uxtw #4
     23c:      	ldr	w27, [x13, w26, uxtw #2]
     240:      	mov	w26, #0x1               ; =1
     244:      	cbz	w26, 0x3888 <_gap_verify_graph+0x3824>
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
     2dc:      	b.eq	0x3888 <_gap_verify_graph+0x3824>
     2e0:      	lsr	w13, w15, w0
     2e4:      	mov	x28, xzr
     2e8:      	tbz	w13, #0x0, 0x464 <_gap_verify_graph+0x400>
     2ec:      	cmp	w25, #0x1
     2f0:      	mov	x0, #-0x1               ; =-1
     2f4:      	b.lt	0x388c <_gap_verify_graph+0x3828>
     2f8:      	cbnz	w27, 0x388c <_gap_verify_graph+0x3828>
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
     334:      	b	0x3888 <_gap_verify_graph+0x3824>
     338:      	cmp	w27, #0x1
     33c:      	b.lt	0x424 <_gap_verify_graph+0x3c0>
     340:      	and	x13, x27, #0x7fffffff
     344:      	cmp	x8, x13
     348:      	b.le	0x3888 <_gap_verify_graph+0x3824>
     34c:      	ldr	w13, [x4, x13, lsl #2]
     350:      	tbz	w13, #0x1f, 0x464 <_gap_verify_graph+0x400>
     354:      	b	0x3888 <_gap_verify_graph+0x3824>
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
     430:      	b	0x3888 <_gap_verify_graph+0x3824>
     434:      	ldr	x13, [x19, #0x30]
     438:      	ldr	x14, [x19, #0x58]
     43c:      	cmp	x13, x14
     440:      	b.ne	0x3888 <_gap_verify_graph+0x3824>
     444:      	sxtw	x0, w27
     448:      	cmn	x13, x0
     44c:      	b.lt	0x3888 <_gap_verify_graph+0x3824>
     450:      	ldr	x13, [x19, #0x50]
     454:      	mvn	x14, x0
     458:      	ldr	w13, [x13, x14, lsl #2]
     45c:      	cmp	w13, #0x0
     460:      	b.le	0x3888 <_gap_verify_graph+0x3824>
     464:      	cmp	w24, w5
     468:      	b.gt	0xcc <_gap_verify_graph+0x68>
     46c:      	add	w24, w24, #0x1
     470:      	cbz	x28, 0x1d8 <_gap_verify_graph+0x174>
     474:      	b	0xcc <_gap_verify_graph+0x68>
     478:      	mov	x0, #-0x1               ; =-1
     47c:      	ret
     480:      	add	x8, sp, #0xc0
     484:      	mov	w1, #0x5                ; =5
     488:      	mov	w20, #0x1               ; =1
     48c:      	add	x9, x8, #0x8
     490:      	add	x8, sp, #0xd8
     494:      	add	x8, x8, #0x8
     498:      	stp	x9, x8, [sp, #0x70]
     49c:      	b	0x4bc <_gap_verify_graph+0x458>
     4a0:      	cmp	w8, w9
     4a4:      	b.ne	0x3888 <_gap_verify_graph+0x3824>
     4a8:      	adds	x8, x22, #0x4
     4ac:      	add	x9, x22, #0x7
     4b0:      	csel	x8, x9, x8, mi
     4b4:      	add	x20, x20, x8, asr #2
     4b8:      	cbnz	x21, 0x3888 <_gap_verify_graph+0x3824>
     4bc:      	ldr	x0, [x19, #0x8]
     4c0:      	cmp	x20, x0
     4c4:      	b.ge	0x388c <_gap_verify_graph+0x3828>
     4c8:      	ldr	x6, [x19]
     4cc:      	add	x8, x6, x20, lsl #4
     4d0:      	ldr	x27, [x8]
     4d4:      	and	w3, w27, #0xff
     4d8:      	cmp	w3, #0x82
     4dc:      	b.hi	0x500 <_gap_verify_graph+0x49c>
     4e0:      	and	x9, x27, #0xff
     4e4:      	adrp	x10, 0x0 <ltmp0>
		00000000000004e4:  ARM64_RELOC_PAGE21	_coil_def.stogir.validation-kind.KINDS
     4e8:      	add	x10, x10, #0x0
		00000000000004e8:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.validation-kind.KINDS
     4ec:      	ldrh	w23, [x10, x9, lsl #1]
     4f0:      	cmp	w3, #0xe
     4f4:      	b.hs	0x504 <_gap_verify_graph+0x4a0>
     4f8:      	str	wzr, [sp, #0x88]
     4fc:      	b	0x510 <_gap_verify_graph+0x4ac>
     500:      	mov	w23, wzr
     504:      	cmp	w3, #0x18
     508:      	cset	w9, lo
     50c:      	str	w9, [sp, #0x88]
     510:      	lsr	w2, w27, #8
     514:      	ubfx	w10, w27, #8, #4
     518:      	and	w9, w2, #0xf0
     51c:      	sub	w10, w10, #0x1
     520:      	sub	w9, w9, #0x10
     524:      	cmp	w9, #0x70
     528:      	sub	w9, w3, #0x1f
     52c:      	ccmp	w10, #0xd, #0x2, lo
     530:      	sub	w10, w3, #0xe
     534:      	cset	w28, lo
     538:      	cmp	w9, #0x2
     53c:      	ccmp	w10, #0xc, #0x0, hs
     540:      	b.hs	0x54c <_gap_verify_graph+0x4e8>
     544:      	mov	w9, #0x1                ; =1
     548:      	b	0x568 <_gap_verify_graph+0x504>
     54c:      	cmp	w3, #0x1a
     550:      	b.lo	0x560 <_gap_verify_graph+0x4fc>
     554:      	cmp	w3, #0x3a
     558:      	ccmp	w3, #0x1e, #0x0, ne
     55c:      	b.lo	0x544 <_gap_verify_graph+0x4e0>
     560:      	cmp	w3, #0x3b
     564:      	cset	w9, eq
     568:      	ldr	x25, [x19, #0x78]
     56c:      	ldr	x4, [x8, #0x8]
     570:      	eor	w10, w28, #0x1
     574:      	lsr	x8, x27, #32
     578:      	ands	w9, w9, w10
     57c:      	ldrsw	x22, [x25, x20, lsl #2]
     580:      	b.eq	0x5e0 <_gap_verify_graph+0x57c>
     584:      	cmp	w8, #0x1
     588:      	b.lt	0x5ec <_gap_verify_graph+0x588>
     58c:      	cmp	x0, x8
     590:      	b.le	0x630 <_gap_verify_graph+0x5cc>
     594:      	ldr	x10, [x19, #0x80]
     598:      	cmp	x10, x8
     59c:      	b.le	0x630 <_gap_verify_graph+0x5cc>
     5a0:      	ldr	w10, [x25, x8, lsl #2]
     5a4:      	tbnz	w10, #0x1f, 0x630 <_gap_verify_graph+0x5cc>
     5a8:      	add	x10, x6, x8, lsl #4
     5ac:      	cbz	x10, 0x630 <_gap_verify_graph+0x5cc>
     5b0:      	ldr	w10, [x10]
     5b4:      	lsr	w10, w10, #8
     5b8:      	and	w11, w10, #0xf
     5bc:      	and	w10, w10, #0xff
     5c0:      	sub	w11, w11, #0x1
     5c4:      	sub	w12, w10, #0x10
     5c8:      	cmp	w11, #0xd
     5cc:      	mov	w11, #0x70              ; =112
     5d0:      	ccmp	w12, w11, #0x2, lo
     5d4:      	b.hs	0x634 <_gap_verify_graph+0x5d0>
     5d8:      	mov	w26, wzr
     5dc:      	b	0x65c <_gap_verify_graph+0x5f8>
     5e0:      	mov	w26, wzr
     5e4:      	mov	w10, #-0x1              ; =-1
     5e8:      	b	0x65c <_gap_verify_graph+0x5f8>
     5ec:      	tbz	x27, #0x3f, 0x630 <_gap_verify_graph+0x5cc>
     5f0:      	ldr	x10, [x19, #0x30]
     5f4:      	ldr	x11, [x19, #0x58]
     5f8:      	cmp	x10, x11
     5fc:      	b.ne	0x630 <_gap_verify_graph+0x5cc>
     600:      	asr	x11, x27, #32
     604:      	cmn	x10, x11
     608:      	b.lt	0x630 <_gap_verify_graph+0x5cc>
     60c:      	ldr	x10, [x19, #0x50]
     610:      	mvn	x11, x11
     614:      	ldr	w10, [x10, x11, lsl #2]
     618:      	cmp	w10, #0x0
     61c:      	b.le	0x630 <_gap_verify_graph+0x5cc>
     620:      	ldr	x10, [x19, #0x28]
     624:      	eor	x11, x8, #0xffffffff
     628:      	add	x10, x10, x11, lsl #4
     62c:      	cbnz	x10, 0x5b0 <_gap_verify_graph+0x54c>
     630:      	mov	w10, #-0x1              ; =-1
     634:      	and	w11, w27, #0xfe00
     638:      	and	w12, w27, #0xfe
     63c:      	cmp	w11, #0xc00
     640:      	ccmp	w12, #0x18, #0x4, ne
     644:      	b.ne	0x650 <_gap_verify_graph+0x5ec>
     648:      	mov	w26, #0x1               ; =1
     64c:      	b	0x65c <_gap_verify_graph+0x5f8>
     650:      	and	w11, w10, #0xfffffffe
     654:      	cmp	w11, #0xc
     658:      	cset	w26, eq
     65c:      	cmp	w22, #0x1
     660:      	lsr	x5, x4, #32
     664:      	csinc	w11, w28, wzr, ge
     668:      	tbnz	w11, #0x0, 0x87c <_gap_verify_graph+0x818>
     66c:      	sub	w11, w10, #0x10
     670:      	and	w10, w10, #0xf
     674:      	sub	w10, w10, #0x1
     678:      	cmp	w11, #0x70
     67c:      	ccmp	w10, #0xd, #0x2, lo
     680:      	cset	w10, lo
     684:      	cmp	w3, #0x83
     688:      	b.hs	0x830 <_gap_verify_graph+0x7cc>
     68c:      	mov	w11, w20
     690:      	cmp	w20, #0x0
     694:      	and	x12, x27, #0xff
     698:      	ccmp	x0, x11, #0x4, gt
     69c:      	mov	w14, #0x1               ; =1
     6a0:      	cset	w13, gt
     6a4:      	cmp	w14, #0x1
     6a8:      	b.lt	0x7bc <_gap_verify_graph+0x758>
     6ac:      	cmp	w14, #0x5
     6b0:      	ldr	w16, [x16, x12, lsl #2]
     6b4:      	csel	w15, w14, w1, lo
     6b8:      	lsl	w15, w15, #2
     6bc:      	sub	w15, w15, #0x4
     6c0:      	lsr	w15, w16, w15
     6c4:      	and	w15, w15, #0xf
     6c8:      	cmp	w15, #0x9
     6cc:      	ccmp	w15, #0x2, #0x4, ne
     6d0:      	b.ne	0x810 <_gap_verify_graph+0x7ac>
     6d4:      	cmp	w14, #0x1
     6d8:      	mov	w28, w10
     6dc:      	adrp	x16, 0x0 <ltmp0>
		00000000000006dc:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
     6e0:      	add	x16, x16, #0x0
		00000000000006e0:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
     6e4:      	csel	w15, wzr, w9, ne
     6e8:      	tbnz	w15, #0x0, 0x7c0 <_gap_verify_graph+0x75c>
     6ec:      	mov	w15, w8
     6f0:      	b.eq	0x760 <_gap_verify_graph+0x6fc>
     6f4:      	cmp	w14, #0x2
     6f8:      	mov	w15, w4
     6fc:      	b.eq	0x760 <_gap_verify_graph+0x6fc>
     700:      	cmp	w14, #0x3
     704:      	mov	w15, w5
     708:      	b.eq	0x760 <_gap_verify_graph+0x6fc>
     70c:      	cbz	w13, 0x74c <_gap_verify_graph+0x6e8>
     710:      	ldr	x15, [x19, #0x80]
     714:      	cmp	x15, x11
     718:      	b.le	0x74c <_gap_verify_graph+0x6e8>
     71c:      	ldr	w16, [x25, x11, lsl #2]
     720:      	mov	x15, xzr
     724:      	tbnz	w16, #0x1f, 0x80c <_gap_verify_graph+0x7a8>
     728:      	cmp	w14, w16
     72c:      	b.hi	0x750 <_gap_verify_graph+0x6ec>
     730:      	add	w15, w20, w14, lsr #2
     734:      	and	w16, w14, #0x3
     738:      	add	x15, x6, w15, uxtw #4
     73c:      	ldr	w16, [x15, w16, uxtw #2]
     740:      	mov	w15, #0x1               ; =1
     744:      	cbnz	w15, 0x754 <_gap_verify_graph+0x6f0>
     748:      	b	0x810 <_gap_verify_graph+0x7ac>
     74c:      	mov	x15, xzr
     750:      	cbz	w15, 0x810 <_gap_verify_graph+0x7ac>
     754:      	mov	w15, w16
     758:      	adrp	x16, 0x0 <ltmp0>
		0000000000000758:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
     75c:      	add	x16, x16, #0x0
		000000000000075c:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
     760:      	cmp	w15, #0x1
     764:      	b.lt	0x7b8 <_gap_verify_graph+0x754>
     768:      	mov	w15, w15
     76c:      	cmp	x0, x15
     770:      	b.le	0x7bc <_gap_verify_graph+0x758>
     774:      	ldr	x16, [x19, #0x80]
     778:      	cmp	x16, x15
     77c:      	b.le	0x810 <_gap_verify_graph+0x7ac>
     780:      	ldr	w16, [x25, x15, lsl #2]
     784:      	tbnz	w16, #0x1f, 0x810 <_gap_verify_graph+0x7ac>
     788:      	add	x15, x6, x15, lsl #4
     78c:      	cbz	x15, 0x810 <_gap_verify_graph+0x7ac>
     790:      	ldr	w15, [x15]
     794:      	lsr	w15, w15, #8
     798:      	and	w16, w15, #0xf0
     79c:      	and	w15, w15, #0xf
     7a0:      	sub	w16, w16, #0x10
     7a4:      	sub	w15, w15, #0x1
     7a8:      	cmp	w16, #0x70
     7ac:      	ccmp	w15, #0xd, #0x2, lo
     7b0:      	cset	w28, lo
     7b4:      	b	0x814 <_gap_verify_graph+0x7b0>
     7b8:      	tbnz	w15, #0x1f, 0x7c8 <_gap_verify_graph+0x764>
     7bc:      	mov	w28, wzr
     7c0:      	tbz	w28, #0x0, 0x820 <_gap_verify_graph+0x7bc>
     7c4:      	b	0x87c <_gap_verify_graph+0x818>
     7c8:      	ldr	x16, [x19, #0x30]
     7cc:      	ldr	x17, [x19, #0x58]
     7d0:      	cmp	x16, x17
     7d4:      	b.ne	0x810 <_gap_verify_graph+0x7ac>
     7d8:      	sxtw	x17, w15
     7dc:      	cmn	x16, x17
     7e0:      	b.lt	0x810 <_gap_verify_graph+0x7ac>
     7e4:      	ldr	x16, [x19, #0x50]
     7e8:      	mvn	x17, x17
     7ec:      	ldr	w16, [x16, x17, lsl #2]
     7f0:      	cmp	w16, #0x0
     7f4:      	b.le	0x810 <_gap_verify_graph+0x7ac>
     7f8:      	ldr	x16, [x19, #0x28]
     7fc:      	mvn	w15, w15
     800:      	add	x15, x16, w15, uxtw #4
     804:      	cbnz	x15, 0x790 <_gap_verify_graph+0x72c>
     808:      	b	0x810 <_gap_verify_graph+0x7ac>
     80c:      	cbnz	w15, 0x754 <_gap_verify_graph+0x6f0>
     810:      	mov	w28, wzr
     814:      	adrp	x16, 0x0 <ltmp0>
		0000000000000814:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
     818:      	add	x16, x16, #0x0
		0000000000000818:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
     81c:      	tbnz	w28, #0x0, 0x87c <_gap_verify_graph+0x818>
     820:      	add	w14, w14, #0x1
     824:      	cmp	w14, w22
     828:      	b.le	0x6a4 <_gap_verify_graph+0x640>
     82c:      	b	0x87c <_gap_verify_graph+0x818>
     830:      	mov	w8, #-0x7fffffff        ; =-2147483647
     834:      	mov	w9, #0x5                ; =5
     838:      	add	w8, w22, w8
     83c:      	movk	w9, #0x8000, lsl #16
     840:      	cmp	w8, w9
     844:      	b.hs	0x850 <_gap_verify_graph+0x7ec>
     848:      	mov	w8, #0x1                ; =1
     84c:      	b	0x86c <_gap_verify_graph+0x808>
     850:      	and	w9, w22, #0x7ffffffc
     854:      	and	w10, w22, #0x7ffffffc
     858:      	orr	w8, w9, #0x1
     85c:      	subs	w10, w10, #0x4
     860:      	b.ne	0x85c <_gap_verify_graph+0x7f8>
     864:      	cmp	w22, w9
     868:      	b.eq	0x878 <_gap_verify_graph+0x814>
     86c:      	add	w8, w8, #0x1
     870:      	cmp	w8, w22
     874:      	b.le	0x86c <_gap_verify_graph+0x808>
     878:      	mov	w28, wzr
     87c:      	sturb	w28, [x29, #-0x80]
     880:      	sturb	w26, [x29, #-0xc0]
     884:      	str	w26, [sp, #0x8c]
     888:      	str	w2, [sp, #0x84]
     88c:      	tbnz	w23, #0x2, 0x8a0 <_gap_verify_graph+0x83c>
     890:      	cbnz	w28, 0x8a0 <_gap_verify_graph+0x83c>
     894:      	mov	x21, xzr
     898:      	sub	x25, x29, #0x80
     89c:      	b	0x944 <_gap_verify_graph+0x8e0>
     8a0:      	cmp	w20, #0x1
     8a4:      	b.lt	0x908 <_gap_verify_graph+0x8a4>
     8a8:      	and	x8, x20, #0x7fffffff
     8ac:      	cmp	x0, x8
     8b0:      	b.le	0x928 <_gap_verify_graph+0x8c4>
     8b4:      	ldr	x16, [x19, #0x80]
     8b8:      	cmp	x16, x8
     8bc:      	b.le	0x928 <_gap_verify_graph+0x8c4>
     8c0:      	ldr	w14, [x25, x8, lsl #2]
     8c4:      	tbnz	w14, #0x1f, 0x928 <_gap_verify_graph+0x8c4>
     8c8:      	add	x8, x6, x8, lsl #4
     8cc:      	ldr	x15, [x8]
     8d0:      	and	w11, w15, #0xff
     8d4:      	cmp	w11, #0x24
     8d8:      	b.eq	0xc00 <_gap_verify_graph+0xb9c>
     8dc:      	cmp	w11, #0x3c
     8e0:      	b.eq	0xbe4 <_gap_verify_graph+0xb80>
     8e4:      	cmp	w11, #0x44
     8e8:      	b.ne	0xc3c <_gap_verify_graph+0xbd8>
     8ec:      	add	x0, sp, #0x90
     8f0:      	mov	x1, x19
     8f4:      	mov	w2, w20
     8f8:      	str	x5, [sp, #0x60]
     8fc:      	mov	x26, x4
     900:      	bl	0x900 <_gap_verify_graph+0x89c>
		0000000000000900:  ARM64_RELOC_BRANCH26	_stogir.copy.validate
     904:      	b	0xc18 <_gap_verify_graph+0xbb4>
     908:      	tbz	w20, #0x1f, 0x928 <_gap_verify_graph+0x8c4>
     90c:      	ldr	x8, [x19, #0x30]
     910:      	ldr	x9, [x19, #0x58]
     914:      	cmp	x8, x9
     918:      	b.ne	0x928 <_gap_verify_graph+0x8c4>
     91c:      	sxtw	x9, w20
     920:      	cmn	x8, x9
     924:      	b.ge	0xbb0 <_gap_verify_graph+0xb4c>
     928:      	adrp	x24, 0x0 <ltmp0>
		0000000000000928:  ARM64_RELOC_PAGE21	l_str.688
     92c:      	add	x24, x24, #0x0
		000000000000092c:  ARM64_RELOC_PAGEOFF12	l_str.688
     930:      	mov	w21, #0x1a              ; =26
     934:      	mov	w8, #0x1                ; =1
     938:      	stp	x24, x21, [sp, #0x98]
     93c:      	sub	x25, x29, #0x80
     940:      	str	w8, [sp, #0x90]
     944:      	cmp	w3, #0x44
     948:      	cset	w8, ne
     94c:      	orr	w8, w8, w28
     950:      	tbz	w8, #0x0, 0x9d0 <_gap_verify_graph+0x96c>
     954:      	sub	w8, w3, #0x1d
     958:      	cmp	w8, #0x1
     95c:      	b.hi	0xa1c <_gap_verify_graph+0x9b8>
     960:      	cbz	x5, 0xa1c <_gap_verify_graph+0x9b8>
     964:      	cmp	w5, #0x1
     968:      	b.lt	0x9fc <_gap_verify_graph+0x998>
     96c:      	ldr	x8, [x19, #0x8]
     970:      	cmp	x8, x5
     974:      	b.le	0xa18 <_gap_verify_graph+0x9b4>
     978:      	ldr	x8, [x19, #0x80]
     97c:      	cmp	x8, x5
     980:      	b.le	0xa18 <_gap_verify_graph+0x9b4>
     984:      	ldr	x8, [x19, #0x78]
     988:      	ldr	w8, [x8, x5, lsl #2]
     98c:      	tbnz	w8, #0x1f, 0xa18 <_gap_verify_graph+0x9b4>
     990:      	ldr	x8, [x19]
     994:      	lsl	x9, x5, #4
     998:      	ldr	w8, [x8, x9]
     99c:      	and	w9, w8, #0xfe
     9a0:      	and	w8, w8, #0xff
     9a4:      	sub	w9, w9, #0x68
     9a8:      	cmp	w9, #0xa
     9ac:      	mov	w9, #0x65               ; =101
     9b0:      	ccmp	w8, w9, #0x4, hs
     9b4:      	b.eq	0xa1c <_gap_verify_graph+0x9b8>
     9b8:      	cmp	w8, #0x66
     9bc:      	mov	w8, #0x2d               ; =45
     9c0:      	csel	x21, x21, x8, eq
     9c4:      	cmp	w3, #0x2c
     9c8:      	tbnz	w23, #0x3, 0xa58 <_gap_verify_graph+0x9f4>
     9cc:      	b	0xa24 <_gap_verify_graph+0x9c0>
     9d0:      	add	x0, sp, #0xa8
     9d4:      	mov	x1, x19
     9d8:      	mov	w2, w20
     9dc:      	mov	x26, x4
     9e0:      	bl	0x9e0 <_gap_verify_graph+0x97c>
		00000000000009e0:  ARM64_RELOC_BRANCH26	_stogir.copy.validate
     9e4:      	ldr	w8, [sp, #0xa8]
     9e8:      	ldr	x9, [sp, #0xb8]
     9ec:      	cmp	w8, #0x1
     9f0:      	csel	x21, x9, x21, eq
     9f4:      	tbnz	w23, #0x3, 0xb10 <_gap_verify_graph+0xaac>
     9f8:      	b	0xb34 <_gap_verify_graph+0xad0>
     9fc:      	ldr	x8, [x19, #0x30]
     a00:      	ldr	x9, [x19, #0x58]
     a04:      	cmp	x8, x9
     a08:      	b.ne	0xa18 <_gap_verify_graph+0x9b4>
     a0c:      	asr	x9, x4, #32
     a10:      	cmn	x8, x9
     a14:      	b.ge	0xa34 <_gap_verify_graph+0x9d0>
     a18:      	mov	w21, #0x16              ; =22
     a1c:      	cmp	w3, #0x2c
     a20:      	tbnz	w23, #0x3, 0xa58 <_gap_verify_graph+0x9f4>
     a24:      	b.eq	0xa5c <_gap_verify_graph+0x9f8>
     a28:      	mov	x26, x4
     a2c:      	tbz	w23, #0x4, 0xba8 <_gap_verify_graph+0xb44>
     a30:      	b	0x1070 <_gap_verify_graph+0x100c>
     a34:      	ldr	x8, [x19, #0x50]
     a38:      	mvn	x9, x9
     a3c:      	ldr	w8, [x8, x9, lsl #2]
     a40:      	mov	w9, #0x2d               ; =45
     a44:      	cmp	w8, #0x0
     a48:      	mov	w8, #0x16               ; =22
     a4c:      	csel	x21, x9, x8, gt
     a50:      	cmp	w3, #0x2c
     a54:      	tbz	w23, #0x3, 0xa24 <_gap_verify_graph+0x9c0>
     a58:      	b.ne	0xb0c <_gap_verify_graph+0xaa8>
     a5c:      	cmp	w20, #0x1
     a60:      	b.lt	0xb3c <_gap_verify_graph+0xad8>
     a64:      	ldr	x8, [x19, #0x8]
     a68:      	and	x12, x20, #0x7fffffff
     a6c:      	cmp	x8, x12
     a70:      	b.le	0xb80 <_gap_verify_graph+0xb1c>
     a74:      	ldr	x9, [x19, #0x80]
     a78:      	cmp	x9, x12
     a7c:      	b.le	0xb80 <_gap_verify_graph+0xb1c>
     a80:      	ldr	x10, [x19, #0x78]
     a84:      	ldr	w13, [x10, x12, lsl #2]
     a88:      	tbnz	w13, #0x1f, 0xb80 <_gap_verify_graph+0xb1c>
     a8c:      	ldr	x11, [x19]
     a90:      	lsl	x12, x12, #4
     a94:      	ldr	x12, [x11, x12]
     a98:      	and	x14, x12, #0xffff
     a9c:      	cmp	x14, #0x12c
     aa0:      	ccmp	w13, #0x1, #0x0, eq
     aa4:      	b.ne	0xb70 <_gap_verify_graph+0xb0c>
     aa8:      	lsr	x2, x12, #32
     aac:      	cmp	w2, #0x1
     ab0:      	b.lt	0xf48 <_gap_verify_graph+0xee4>
     ab4:      	cmp	x8, x2
     ab8:      	b.ls	0xfc0 <_gap_verify_graph+0xf5c>
     abc:      	cmp	x9, x2
     ac0:      	adrp	x8, 0x0 <ltmp0>
		0000000000000ac0:  ARM64_RELOC_PAGE21	l_str.370
     ac4:      	add	x8, x8, #0x0
		0000000000000ac4:  ARM64_RELOC_PAGEOFF12	l_str.370
     ac8:      	mov	w9, #0x17               ; =23
     acc:      	b.ls	0xb8c <_gap_verify_graph+0xb28>
     ad0:      	ldr	w8, [x10, x2, lsl #2]
     ad4:      	tbnz	w8, #0x1f, 0xfc0 <_gap_verify_graph+0xf5c>
     ad8:      	add	x8, x11, x2, lsl #4
     adc:      	ldr	x8, [x8]
     ae0:      	and	w9, w8, #0xff
     ae4:      	sub	w9, w9, #0x29
     ae8:      	cmp	w9, #0x2
     aec:      	b.hi	0xf9c <_gap_verify_graph+0xf38>
     af0:      	add	x0, sp, #0xc0
     af4:      	mov	x1, x19
     af8:      	mov	x26, x4
     afc:      	add	x24, sp, #0xc0
     b00:      	bl	0xb00 <_gap_verify_graph+0xa9c>
		0000000000000b00:  ARM64_RELOC_BRANCH26	_stogir.checked.validate
     b04:      	ldr	x8, [sp, #0x70]
     b08:      	b	0xb28 <_gap_verify_graph+0xac4>
     b0c:      	mov	x26, x4
     b10:      	add	x0, sp, #0xd8
     b14:      	mov	x1, x19
     b18:      	mov	w2, w20
     b1c:      	add	x24, sp, #0xd8
     b20:      	bl	0xb20 <_gap_verify_graph+0xabc>
		0000000000000b20:  ARM64_RELOC_BRANCH26	_stogir.checked.validate
     b24:      	ldr	x8, [sp, #0x78]
     b28:      	ldr	w9, [x24]
     b2c:      	cmp	w9, #0x1
     b30:      	b.eq	0xba0 <_gap_verify_graph+0xb3c>
     b34:      	tbnz	w23, #0x4, 0x1070 <_gap_verify_graph+0x100c>
     b38:      	b	0xba8 <_gap_verify_graph+0xb44>
     b3c:      	tbz	w20, #0x1f, 0xb80 <_gap_verify_graph+0xb1c>
     b40:      	ldr	x8, [x19, #0x30]
     b44:      	ldr	x9, [x19, #0x58]
     b48:      	cmp	x8, x9
     b4c:      	b.ne	0xb80 <_gap_verify_graph+0xb1c>
     b50:      	sxtw	x9, w20
     b54:      	cmn	x8, x9
     b58:      	b.lt	0xb80 <_gap_verify_graph+0xb1c>
     b5c:      	ldr	x8, [x19, #0x50]
     b60:      	mvn	x9, x9
     b64:      	ldr	w8, [x8, x9, lsl #2]
     b68:      	cmp	w8, #0x0
     b6c:      	b.le	0xb80 <_gap_verify_graph+0xb1c>
     b70:      	adrp	x8, 0x0 <ltmp0>
		0000000000000b70:  ARM64_RELOC_PAGE21	l_str.375
     b74:      	add	x8, x8, #0x0
		0000000000000b74:  ARM64_RELOC_PAGEOFF12	l_str.375
     b78:      	mov	w9, #0x1c               ; =28
     b7c:      	b	0xb8c <_gap_verify_graph+0xb28>
     b80:      	adrp	x8, 0x0 <ltmp0>
		0000000000000b80:  ARM64_RELOC_PAGE21	l_str.374
     b84:      	add	x8, x8, #0x0
		0000000000000b84:  ARM64_RELOC_PAGEOFF12	l_str.374
     b88:      	mov	w9, #0x10               ; =16
     b8c:      	stp	x8, x9, [sp, #0xc8]
     b90:      	ldr	x8, [sp, #0x70]
     b94:      	mov	x26, x4
     b98:      	mov	w10, #0x1               ; =1
     b9c:      	str	w10, [sp, #0xc0]
     ba0:      	ldr	x21, [x8, #0x8]
     ba4:      	tbnz	w23, #0x4, 0x1070 <_gap_verify_graph+0x100c>
     ba8:      	mov	x8, x21
     bac:      	b	0x11d0 <_gap_verify_graph+0x116c>
     bb0:      	ldr	x8, [x19, #0x50]
     bb4:      	mvn	x9, x9
     bb8:      	ldr	w8, [x8, x9, lsl #2]
     bbc:      	adrp	x9, 0x0 <ltmp0>
		0000000000000bbc:  ARM64_RELOC_PAGE21	l_str.689
     bc0:      	add	x9, x9, #0x0
		0000000000000bc0:  ARM64_RELOC_PAGEOFF12	l_str.689
     bc4:      	cmp	w8, #0x0
     bc8:      	adrp	x8, 0x0 <ltmp0>
		0000000000000bc8:  ARM64_RELOC_PAGE21	l_str.688
     bcc:      	add	x8, x8, #0x0
		0000000000000bcc:  ARM64_RELOC_PAGEOFF12	l_str.688
     bd0:      	csel	x24, x9, x8, gt
     bd4:      	mov	w8, #0x1a               ; =26
     bd8:      	mov	w9, #0x3b               ; =59
     bdc:      	csel	x21, x9, x8, gt
     be0:      	b	0x934 <_gap_verify_graph+0x8d0>
     be4:      	add	x0, sp, #0x90
     be8:      	mov	x1, x19
     bec:      	mov	w2, w20
     bf0:      	str	x5, [sp, #0x60]
     bf4:      	mov	x26, x4
     bf8:      	bl	0xbf8 <_gap_verify_graph+0xb94>
		0000000000000bf8:  ARM64_RELOC_BRANCH26	_stogir.conditional.validate
     bfc:      	b	0xc18 <_gap_verify_graph+0xbb4>
     c00:      	add	x0, sp, #0x90
     c04:      	mov	x1, x19
     c08:      	mov	w2, w20
     c0c:      	str	x5, [sp, #0x60]
     c10:      	mov	x26, x4
     c14:      	bl	0xc14 <_gap_verify_graph+0xbb0>
		0000000000000c14:  ARM64_RELOC_BRANCH26	_stogir.conversion.validate
     c18:      	ldr	w8, [sp, #0x90]
     c1c:      	ldr	x9, [sp, #0xa0]
     c20:      	sub	x25, x29, #0x80
     c24:      	ldr	x5, [sp, #0x60]
     c28:      	and	w3, w27, #0xff
     c2c:      	mov	x4, x26
     c30:      	cmp	w8, #0x1
     c34:      	csel	x21, x9, xzr, eq
     c38:      	b	0x944 <_gap_verify_graph+0x8e0>
     c3c:      	ldr	x10, [x8, #0x8]
     c40:      	sub	w8, w11, #0x3d
     c44:      	lsr	x12, x15, #32
     c48:      	ubfx	w26, w15, #8, #8
     c4c:      	mov	w24, w15
     c50:      	cmp	w8, #0x2
     c54:      	b.hi	0xd40 <_gap_verify_graph+0xcdc>
     c58:      	cmp	w11, #0x3e
     c5c:      	mov	w8, #0x3                ; =3
     c60:      	mov	w9, #0x2                ; =2
     c64:      	csinc	w8, w8, wzr, eq
     c68:      	cmp	w11, #0x3d
     c6c:      	csel	w8, w9, w8, eq
     c70:      	cmp	w14, w8
     c74:      	b.ne	0x102c <_gap_verify_graph+0xfc8>
     c78:      	cmp	w12, #0x1
     c7c:      	b.lt	0x103c <_gap_verify_graph+0xfd8>
     c80:      	cmp	x0, x12
     c84:      	str	x10, [sp, #0x50]
     c88:      	str	w26, [sp, #0x58]
     c8c:      	str	x0, [sp, #0x40]
     c90:      	b.ls	0x1040 <_gap_verify_graph+0xfdc>
     c94:      	cmp	x16, x12
     c98:      	adrp	x24, 0x0 <ltmp0>
		0000000000000c98:  ARM64_RELOC_PAGE21	l_str.667
     c9c:      	add	x24, x24, #0x0
		0000000000000c9c:  ARM64_RELOC_PAGEOFF12	l_str.667
     ca0:      	mov	w21, #0x1b              ; =27
     ca4:      	stp	x16, x6, [sp, #0x30]
     ca8:      	b.ls	0x934 <_gap_verify_graph+0x8d0>
     cac:      	mov	x8, x12
     cb0:      	mov	x9, x12
     cb4:      	ldr	w8, [x25, x8, lsl #2]
     cb8:      	tbnz	w8, #0x1f, 0x2764 <_gap_verify_graph+0x2700>
     cbc:      	ldr	x8, [sp, #0x38]
     cc0:      	str	x5, [sp, #0x60]
     cc4:      	str	x4, [sp, #0x48]
     cc8:      	add	x8, x8, x9, lsl #4
     ccc:      	ldr	w9, [sp, #0x58]
     cd0:      	cmp	w11, #0x3d
     cd4:      	ldr	x8, [x8]
     cd8:      	ubfx	w10, w8, #8, #8
     cdc:      	mov	w26, w10
     ce0:      	csel	w10, w10, w9, eq
     ce4:      	sub	w9, w10, #0x10
     ce8:      	str	x10, [sp, #0x8]
     cec:      	and	w10, w10, #0xf
     cf0:      	str	w10, [sp, #0x10]
     cf4:      	sub	w10, w10, #0x1
     cf8:      	cmp	w9, #0x70
     cfc:      	ccmp	w10, #0xd, #0x2, lo
     d00:      	cset	w9, lo
     d04:      	str	w9, [sp, #0x1c]
     d08:      	b.hs	0x276c <_gap_verify_graph+0x2708>
     d0c:      	and	w8, w8, #0xff
     d10:      	mov	w9, #0x46               ; =70
     d14:      	cmp	w8, #0x48
     d18:      	ccmp	w8, w9, #0x4, ne
     d1c:      	mov	w8, #0x36               ; =54
     d20:      	adrp	x9, 0x0 <ltmp0>
		0000000000000d20:  ARM64_RELOC_PAGE21	l_str.668
     d24:      	add	x9, x9, #0x0
		0000000000000d24:  ARM64_RELOC_PAGEOFF12	l_str.668
     d28:      	csel	x8, x8, xzr, eq
     d2c:      	str	x8, [sp, #0x28]
     d30:      	adrp	x8, 0x0 <ltmp0>
		0000000000000d30:  ARM64_RELOC_PAGE21	l_str.669
     d34:      	add	x8, x8, #0x0
		0000000000000d34:  ARM64_RELOC_PAGEOFF12	l_str.669
     d38:      	csel	x8, x8, x9, eq
     d3c:      	b	0x277c <_gap_verify_graph+0x2718>
     d40:      	and	w17, w24, #0xfe
     d44:      	lsr	w21, w15, #8
     d48:      	ubfx	w2, w24, #8, #4
     d4c:      	sub	w8, w17, #0xe
     d50:      	cmp	w8, #0xb
     d54:      	b.hi	0xfd0 <_gap_verify_graph+0xf6c>
     d58:      	and	w8, w21, #0xf0
     d5c:      	sub	w9, w2, #0x1
     d60:      	sub	w8, w8, #0x10
     d64:      	cmp	w9, #0xd
     d68:      	mov	w9, #0x70               ; =112
     d6c:      	ccmp	w8, w9, #0x2, lo
     d70:      	b.hs	0xfd0 <_gap_verify_graph+0xf6c>
     d74:      	cmp	w14, #0x2
     d78:      	b.ne	0x1050 <_gap_verify_graph+0xfec>
     d7c:      	mov	w1, w2
     d80:      	mov	w14, w11
     d84:      	mov	x11, x10
     d88:      	mov	w13, w26
     d8c:      	mov	x26, x5
     d90:      	cmp	w12, #0x1
     d94:      	str	x4, [sp, #0x48]
     d98:      	b.lt	0x29d4 <_gap_verify_graph+0x2970>
     d9c:      	cmp	x0, x12
     da0:      	b.ls	0x2a84 <_gap_verify_graph+0x2a20>
     da4:      	ldr	x4, [sp, #0x48]
     da8:      	mov	x10, x12
     dac:      	cmp	x16, x12
     db0:      	adrp	x24, 0x0 <ltmp0>
		0000000000000db0:  ARM64_RELOC_PAGE21	l_str.662
     db4:      	add	x24, x24, #0x0
		0000000000000db4:  ARM64_RELOC_PAGEOFF12	l_str.662
     db8:      	mov	w21, #0x21              ; =33
     dbc:      	and	w3, w27, #0xff
     dc0:      	mov	x5, x26
     dc4:      	b.ls	0x934 <_gap_verify_graph+0x8d0>
     dc8:      	ldr	w8, [x25, x10, lsl #2]
     dcc:      	tbnz	w8, #0x1f, 0x2a8c <_gap_verify_graph+0x2a28>
     dd0:      	mov	x9, x0
     dd4:      	add	x8, x6, x10, lsl #4
     dd8:      	ldr	x8, [x8]
     ddc:      	cmp	w11, #0x1
     de0:      	b.lt	0x2a24 <_gap_verify_graph+0x29c0>
     de4:      	and	x10, x11, #0x7fffffff
     de8:      	cmp	x9, x10
     dec:      	b.ls	0x2ba4 <_gap_verify_graph+0x2b40>
     df0:      	ldr	x4, [sp, #0x48]
     df4:      	cmp	x16, x10
     df8:      	adrp	x24, 0x0 <ltmp0>
		0000000000000df8:  ARM64_RELOC_PAGE21	l_str.663
     dfc:      	add	x24, x24, #0x0
		0000000000000dfc:  ARM64_RELOC_PAGEOFF12	l_str.663
     e00:      	mov	w21, #0x21              ; =33
     e04:      	and	w3, w27, #0xff
     e08:      	mov	x5, x26
     e0c:      	b.ls	0x934 <_gap_verify_graph+0x8d0>
     e10:      	ldr	w9, [x25, x10, lsl #2]
     e14:      	tbnz	w9, #0x1f, 0x2a8c <_gap_verify_graph+0x2a28>
     e18:      	add	x9, x6, x10, lsl #4
     e1c:      	sub	w10, w14, #0xe
     e20:      	cmp	w10, #0xb
     e24:      	b.hi	0x2a74 <_gap_verify_graph+0x2a10>
     e28:      	lsr	x10, x8, #8
     e2c:      	ubfx	x12, x8, #8, #8
     e30:      	and	w11, w10, #0xf
     e34:      	str	x12, [sp, #0x8]
     e38:      	sub	w12, w12, #0x10
     e3c:      	sub	w11, w11, #0x1
     e40:      	and	w25, w10, #0xf
     e44:      	cmp	w11, #0xd
     e48:      	mov	w11, #0x70              ; =112
     e4c:      	ccmp	w12, w11, #0x2, lo
     e50:      	b.hs	0x2a74 <_gap_verify_graph+0x2a10>
     e54:      	and	w11, w10, #0xe
     e58:      	cmp	w14, #0x18
     e5c:      	ccmp	w11, #0xc, #0x4, hs
     e60:      	b.ne	0x2a74 <_gap_verify_graph+0x2a10>
     e64:      	ldr	x9, [x9]
     e68:      	and	w10, w10, #0xff
     e6c:      	ldr	x4, [sp, #0x48]
     e70:      	adrp	x24, 0x0 <ltmp0>
		0000000000000e70:  ARM64_RELOC_PAGE21	l_str.664
     e74:      	add	x24, x24, #0x0
		0000000000000e74:  ARM64_RELOC_PAGEOFF12	l_str.664
     e78:      	mov	w21, #0x33              ; =51
     e7c:      	lsr	x11, x9, #8
     e80:      	and	w3, w27, #0xff
     e84:      	mov	x5, x26
     e88:      	cmp	w10, w11, uxtb
     e8c:      	b.ne	0x934 <_gap_verify_graph+0x8d0>
     e90:      	and	w8, w8, #0xff
     e94:      	cmp	w8, #0x46
     e98:      	b.eq	0x37b8 <_gap_verify_graph+0x3754>
     e9c:      	ldr	x4, [sp, #0x48]
     ea0:      	cmp	w8, #0x48
     ea4:      	mov	w21, #0x33              ; =51
     ea8:      	and	w3, w27, #0xff
     eac:      	mov	x5, x26
     eb0:      	b.eq	0x934 <_gap_verify_graph+0x8d0>
     eb4:      	and	w8, w9, #0xff
     eb8:      	cmp	w8, #0x46
     ebc:      	b.eq	0x37b8 <_gap_verify_graph+0x3754>
     ec0:      	ldr	x4, [sp, #0x48]
     ec4:      	cmp	w8, #0x48
     ec8:      	mov	w21, #0x33              ; =51
     ecc:      	and	w3, w27, #0xff
     ed0:      	mov	x5, x26
     ed4:      	b.eq	0x934 <_gap_verify_graph+0x8d0>
     ed8:      	sub	w8, w13, #0x10
     edc:      	cmp	w1, #0xc
     ee0:      	mov	w9, #0x70               ; =112
     ee4:      	ccmp	w8, w9, #0x2, lo
     ee8:      	b.hs	0x37b8 <_gap_verify_graph+0x3754>
     eec:      	ldr	x9, [sp, #0x8]
     ef0:      	lsr	w8, w13, #4
     ef4:      	mov	w10, #0x1               ; =1
     ef8:      	lsr	w9, w9, #4
     efc:      	sub	w8, w8, #0x1
     f00:      	lsl	w8, w10, w8
     f04:      	sub	w9, w9, #0x1
     f08:      	lsl	w9, w10, w9
     f0c:      	cmp	w8, w9
     f10:      	b.ne	0x37b8 <_gap_verify_graph+0x3754>
     f14:      	mov	w0, w1
     f18:      	bl	0xf18 <_gap_verify_graph+0xeb4>
		0000000000000f18:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
     f1c:      	mov	w21, w0
     f20:      	mov	w0, w25
     f24:      	bl	0xf24 <_gap_verify_graph+0xec0>
		0000000000000f24:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
     f28:      	cmp	w21, w0
     f2c:      	b.ne	0x37b8 <_gap_verify_graph+0x3754>
     f30:      	ldr	x4, [sp, #0x48]
     f34:      	ldr	x0, [sp, #0x8]
     f38:      	and	w3, w27, #0xff
     f3c:      	str	wzr, [sp, #0x90]
     f40:      	mov	x5, x26
     f44:      	b	0x35a0 <_gap_verify_graph+0x353c>
     f48:      	tbz	x12, #0x3f, 0xfc0 <_gap_verify_graph+0xf5c>
     f4c:      	ldr	x8, [x19, #0x30]
     f50:      	ldr	x9, [x19, #0x58]
     f54:      	cmp	x8, x9
     f58:      	b.ne	0xfc0 <_gap_verify_graph+0xf5c>
     f5c:      	asr	x9, x12, #32
     f60:      	cmn	x8, x9
     f64:      	b.lt	0xfc0 <_gap_verify_graph+0xf5c>
     f68:      	ldr	x8, [x19, #0x50]
     f6c:      	mvn	x9, x9
     f70:      	ldr	w8, [x8, x9, lsl #2]
     f74:      	cmp	w8, #0x0
     f78:      	b.le	0xfc0 <_gap_verify_graph+0xf5c>
     f7c:      	ldr	x8, [x19, #0x28]
     f80:      	eor	x9, x2, #0xffffffff
     f84:      	add	x8, x8, x9, lsl #4
     f88:      	ldr	x8, [x8]
     f8c:      	and	w9, w8, #0xff
     f90:      	sub	w9, w9, #0x29
     f94:      	cmp	w9, #0x2
     f98:      	b.ls	0xaf0 <_gap_verify_graph+0xa8c>
     f9c:      	and	x9, x8, #0xfe00
     fa0:      	and	x8, x8, #0xff00
     fa4:      	cmp	x9, #0xdff
     fa8:      	ccmp	x8, #0x0, #0x4, ls
     fac:      	b.ne	0x1060 <_gap_verify_graph+0xffc>
     fb0:      	adrp	x8, 0x0 <ltmp0>
		0000000000000fb0:  ARM64_RELOC_PAGE21	l_str.371
     fb4:      	add	x8, x8, #0x0
		0000000000000fb4:  ARM64_RELOC_PAGEOFF12	l_str.371
     fb8:      	mov	w9, #0x20               ; =32
     fbc:      	b	0xb8c <_gap_verify_graph+0xb28>
     fc0:      	adrp	x8, 0x0 <ltmp0>
		0000000000000fc0:  ARM64_RELOC_PAGE21	l_str.370
     fc4:      	add	x8, x8, #0x0
		0000000000000fc4:  ARM64_RELOC_PAGEOFF12	l_str.370
     fc8:      	mov	w9, #0x17               ; =23
     fcc:      	b	0xb8c <_gap_verify_graph+0xb28>
     fd0:      	and	w8, w24, #0xff
     fd4:      	sub	w8, w8, #0x41
     fd8:      	cmp	w8, #0x37
     fdc:      	b.hi	0x253c <_gap_verify_graph+0x24d8>
     fe0:      	mov	x9, #0xc0c1             ; =49345
     fe4:      	movk	x9, #0x80, lsl #48
     fe8:      	lsr	x8, x9, x8
     fec:      	tbz	w8, #0x0, 0x253c <_gap_verify_graph+0x24d8>
     ff0:      	and	x8, x15, #0xfe
     ff4:      	cmp	x8, #0x3a
     ff8:      	b.eq	0x25e0 <_gap_verify_graph+0x257c>
     ffc:      	and	w8, w24, #0xff
    1000:      	sub	w8, w8, #0x1a
    1004:      	cmp	w8, #0x2e
    1008:      	b.hi	0x2678 <_gap_verify_graph+0x2614>
    100c:      	mov	w9, #0x1f               ; =31
    1010:      	movk	w9, #0xff0, lsl #16
    1014:      	lsr	x9, x9, x8
    1018:      	tbnz	w9, #0x0, 0x25e0 <_gap_verify_graph+0x257c>
    101c:      	mov	x9, #0x408000000000     ; =70918499991552
    1020:      	lsr	x8, x9, x8
    1024:      	tbnz	w8, #0x0, 0x2684 <_gap_verify_graph+0x2620>
    1028:      	b	0x2678 <_gap_verify_graph+0x2614>
    102c:      	adrp	x24, 0x1000 <_gap_verify_graph+0xf9c>
		000000000000102c:  ARM64_RELOC_PAGE21	l_str.681
    1030:      	add	x24, x24, #0x0
		0000000000001030:  ARM64_RELOC_PAGEOFF12	l_str.681
    1034:      	mov	w21, #0x25              ; =37
    1038:      	b	0x934 <_gap_verify_graph+0x8d0>
    103c:      	tbnz	x15, #0x3f, 0x26f8 <_gap_verify_graph+0x2694>
    1040:      	adrp	x24, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001040:  ARM64_RELOC_PAGE21	l_str.667
    1044:      	add	x24, x24, #0x0
		0000000000001044:  ARM64_RELOC_PAGEOFF12	l_str.667
    1048:      	mov	w21, #0x1b              ; =27
    104c:      	b	0x934 <_gap_verify_graph+0x8d0>
    1050:      	adrp	x24, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001050:  ARM64_RELOC_PAGE21	l_str.666
    1054:      	add	x24, x24, #0x0
		0000000000001054:  ARM64_RELOC_PAGEOFF12	l_str.666
    1058:      	mov	w21, #0x2b              ; =43
    105c:      	b	0x934 <_gap_verify_graph+0x8d0>
    1060:      	mov	x26, x4
    1064:      	str	wzr, [sp, #0xc0]
    1068:      	str	wzr, [sp, #0xc8]
    106c:      	tbz	w23, #0x4, 0xba8 <_gap_verify_graph+0xb44>
    1070:      	cmp	w20, #0x1
    1074:      	b.lt	0x10f4 <_gap_verify_graph+0x1090>
    1078:      	ldr	x9, [x19, #0x8]
    107c:      	and	x8, x20, #0x7fffffff
    1080:      	cmp	x9, x8
    1084:      	b.le	0x11cc <_gap_verify_graph+0x1168>
    1088:      	ldr	x9, [x19, #0x80]
    108c:      	cmp	x9, x8
    1090:      	b.le	0x11cc <_gap_verify_graph+0x1168>
    1094:      	ldr	x9, [x19, #0x78]
    1098:      	ldr	w9, [x9, x8, lsl #2]
    109c:      	tbnz	w9, #0x1f, 0x11cc <_gap_verify_graph+0x1168>
    10a0:      	ldr	x9, [x19]
    10a4:      	add	x11, x9, x8, lsl #4
    10a8:      	cmp	w20, #0x1
    10ac:      	ldr	x10, [x11]
    10b0:      	and	w12, w10, #0xff
    10b4:      	b.lt	0x115c <_gap_verify_graph+0x10f8>
    10b8:      	sub	w8, w12, #0x7e
    10bc:      	cmp	w8, #0x4
    10c0:      	mov	w8, #0x20               ; =32
    10c4:      	b.hi	0x1160 <_gap_verify_graph+0x10fc>
    10c8:      	ldr	x8, [x19, #0x78]
    10cc:      	and	x9, x20, #0x7fffffff
    10d0:      	and	x13, x10, #0xff
    10d4:      	ldr	w8, [x8, x9, lsl #2]
    10d8:      	adrp	x9, 0x1000 <_gap_verify_graph+0xf9c>
		00000000000010d8:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.OPERAND-SLOTS
    10dc:      	add	x9, x9, #0x0
		00000000000010dc:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.OPERAND-SLOTS
    10e0:      	ldrsb	w9, [x9, x13]
    10e4:      	cmp	w8, w9
    10e8:      	mov	w8, #0x20               ; =32
    10ec:      	csel	x8, x8, xzr, ne
    10f0:      	b	0x1160 <_gap_verify_graph+0x10fc>
    10f4:      	tbnz	w20, #0x1f, 0x110c <_gap_verify_graph+0x10a8>
    10f8:      	tst	w23, #0x20
    10fc:      	mov	w8, #0x1a               ; =26
    1100:      	mov	w9, #0x21               ; =33
    1104:      	csel	x24, x8, x9, eq
    1108:      	b	0x1338 <_gap_verify_graph+0x12d4>
    110c:      	ldr	x8, [x19, #0x30]
    1110:      	ldr	x9, [x19, #0x58]
    1114:      	cmp	x8, x9
    1118:      	b.ne	0x11cc <_gap_verify_graph+0x1168>
    111c:      	sxtw	x9, w20
    1120:      	cmn	x8, x9
    1124:      	b.lt	0x11cc <_gap_verify_graph+0x1168>
    1128:      	ldr	x8, [x19, #0x50]
    112c:      	mvn	x9, x9
    1130:      	ldr	w8, [x8, x9, lsl #2]
    1134:      	cmp	w8, #0x0
    1138:      	b.le	0x11cc <_gap_verify_graph+0x1168>
    113c:      	mvn	w8, w20
    1140:      	ldr	x9, [x19, #0x28]
    1144:      	and	x8, x8, #0x7fffffff
    1148:      	add	x11, x9, x8, lsl #4
    114c:      	cmp	w20, #0x1
    1150:      	ldr	x10, [x11]
    1154:      	and	w12, w10, #0xff
    1158:      	b.ge	0x10b8 <_gap_verify_graph+0x1054>
    115c:      	mov	w8, #0x20               ; =32
    1160:      	lsr	x9, x10, #32
    1164:      	cmp	w9, #0x1
    1168:      	b.lt	0x143c <_gap_verify_graph+0x13d8>
    116c:      	ldr	x13, [x19, #0x8]
    1170:      	cmp	x13, x9
    1174:      	b.le	0x143c <_gap_verify_graph+0x13d8>
    1178:      	ldr	x13, [x19, #0x80]
    117c:      	cmp	x13, x9
    1180:      	b.le	0x143c <_gap_verify_graph+0x13d8>
    1184:      	ldr	x13, [x19, #0x78]
    1188:      	ldr	w13, [x13, x9, lsl #2]
    118c:      	tbnz	w13, #0x1f, 0x143c <_gap_verify_graph+0x13d8>
    1190:      	ldr	x13, [x19]
    1194:      	lsl	x9, x9, #4
    1198:      	ldr	x9, [x13, x9]
    119c:      	and	w13, w9, #0xff
    11a0:      	sub	w13, w13, #0x4f
    11a4:      	cmp	w13, #0x33
    11a8:      	b.hi	0x143c <_gap_verify_graph+0x13d8>
    11ac:      	and	x9, x9, #0xff
    11b0:      	adrp	x13, 0x1000 <_gap_verify_graph+0xf9c>
		00000000000011b0:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.PROPERTIES
    11b4:      	add	x13, x13, #0x0
		00000000000011b4:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.PROPERTIES
    11b8:      	ldrb	w9, [x13, x9]
    11bc:      	tst	w9, #0x4
    11c0:      	mov	w9, #0x16               ; =22
    11c4:      	csel	x8, x8, x9, eq
    11c8:      	b	0x1440 <_gap_verify_graph+0x13dc>
    11cc:      	mov	w8, #0x1a               ; =26
    11d0:      	tbnz	w23, #0x5, 0x11dc <_gap_verify_graph+0x1178>
    11d4:      	mov	x24, x8
    11d8:      	b	0x1338 <_gap_verify_graph+0x12d4>
    11dc:      	cmp	w20, #0x1
    11e0:      	b.lt	0x1314 <_gap_verify_graph+0x12b0>
    11e4:      	ldr	x9, [x19, #0x8]
    11e8:      	and	x13, x20, #0x7fffffff
    11ec:      	cmp	x9, x13
    11f0:      	b.le	0x1334 <_gap_verify_graph+0x12d0>
    11f4:      	ldr	x10, [x19, #0x80]
    11f8:      	cmp	x10, x13
    11fc:      	b.le	0x1334 <_gap_verify_graph+0x12d0>
    1200:      	ldr	x11, [x19, #0x78]
    1204:      	ldr	w16, [x11, x13, lsl #2]
    1208:      	tbnz	w16, #0x1f, 0x1334 <_gap_verify_graph+0x12d0>
    120c:      	ldr	x12, [x19]
    1210:      	add	x13, x12, x13, lsl #4
    1214:      	ldp	x14, x13, [x13]
    1218:      	and	w15, w14, #0xff
    121c:      	cmp	w15, #0x79
    1220:      	b.eq	0x122c <_gap_verify_graph+0x11c8>
    1224:      	cmp	w15, #0x60
    1228:      	b.ne	0x14e4 <_gap_verify_graph+0x1480>
    122c:      	cmp	w15, #0x60
    1230:      	mov	w17, #0x3               ; =3
    1234:      	and	x0, x14, #0xff00
    1238:      	csinc	w17, w17, wzr, ne
    123c:      	cbnz	x0, 0x14e4 <_gap_verify_graph+0x1480>
    1240:      	cmp	w16, w17
    1244:      	mov	w24, #0x1b              ; =27
    1248:      	b.ne	0x1338 <_gap_verify_graph+0x12d4>
    124c:      	cmp	w13, #0x0
    1250:      	mov	w16, #0x79              ; =121
    1254:      	ccmp	w15, w16, #0x0, ne
    1258:      	b.eq	0x14e4 <_gap_verify_graph+0x1480>
    125c:      	lsr	x13, x13, #32
    1260:      	cmp	w15, #0x79
    1264:      	and	w15, w14, #0xff
    1268:      	csel	w13, wzr, w13, ne
    126c:      	cmp	w15, #0x79
    1270:      	b.eq	0x127c <_gap_verify_graph+0x1218>
    1274:      	cmp	w15, #0x60
    1278:      	b.ne	0x181c <_gap_verify_graph+0x17b8>
    127c:      	lsr	x15, x14, #32
    1280:      	cmp	w15, #0x1
    1284:      	b.lt	0x1824 <_gap_verify_graph+0x17c0>
    1288:      	cmp	x9, x15
    128c:      	b.ls	0x2c64 <_gap_verify_graph+0x2c00>
    1290:      	cmp	x10, x15
    1294:      	mov	w24, #0x1d              ; =29
    1298:      	b.ls	0x1338 <_gap_verify_graph+0x12d4>
    129c:      	ldr	w14, [x11, x15, lsl #2]
    12a0:      	tbnz	w14, #0x1f, 0x2c64 <_gap_verify_graph+0x2c00>
    12a4:      	lsl	x14, x15, #4
    12a8:      	ldr	x14, [x12, x14]
    12ac:      	and	w15, w14, #0xff
    12b0:      	sub	w15, w15, #0x4f
    12b4:      	cmp	w15, #0x33
    12b8:      	b.hi	0x1858 <_gap_verify_graph+0x17f4>
    12bc:      	and	x14, x14, #0xff
    12c0:      	adrp	x15, 0x1000 <_gap_verify_graph+0xf9c>
		00000000000012c0:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.PROPERTIES
    12c4:      	add	x15, x15, #0x0
		00000000000012c4:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.PROPERTIES
    12c8:      	ldrb	w14, [x15, x14]
    12cc:      	tbnz	w14, #0x2, 0x1858 <_gap_verify_graph+0x17f4>
    12d0:      	cbz	w13, 0x11d4 <_gap_verify_graph+0x1170>
    12d4:      	cmp	w13, #0x1
    12d8:      	b.lt	0x2c2c <_gap_verify_graph+0x2bc8>
    12dc:      	cmp	x9, x13
    12e0:      	b.ls	0x2c64 <_gap_verify_graph+0x2c00>
    12e4:      	cmp	x10, x13
    12e8:      	mov	w24, #0x1d              ; =29
    12ec:      	b.ls	0x1338 <_gap_verify_graph+0x12d4>
    12f0:      	ldr	w9, [x11, x13, lsl #2]
    12f4:      	tbnz	w9, #0x1f, 0x2c64 <_gap_verify_graph+0x2c00>
    12f8:      	lsl	x9, x13, #4
    12fc:      	mov	x24, x8
    1300:      	ldrb	w9, [x12, x9]
    1304:      	sub	w9, w9, #0x7a
    1308:      	cmn	w9, #0x4
    130c:      	b.hi	0x1338 <_gap_verify_graph+0x12d4>
    1310:      	b	0x2c5c <_gap_verify_graph+0x2bf8>
    1314:      	tbz	w20, #0x1f, 0x1334 <_gap_verify_graph+0x12d0>
    1318:      	ldr	x8, [x19, #0x30]
    131c:      	ldr	x9, [x19, #0x58]
    1320:      	cmp	x8, x9
    1324:      	b.ne	0x1334 <_gap_verify_graph+0x12d0>
    1328:      	sxtw	x9, w20
    132c:      	cmn	x8, x9
    1330:      	b.ge	0x14ec <_gap_verify_graph+0x1488>
    1334:      	mov	w24, #0x21              ; =33
    1338:      	tbz	w23, #0x6, 0x1430 <_gap_verify_graph+0x13cc>
    133c:      	cmp	w20, #0x1
    1340:      	b.lt	0x13d4 <_gap_verify_graph+0x1370>
    1344:      	ldr	x8, [x19, #0x8]
    1348:      	and	x12, x20, #0x7fffffff
    134c:      	cmp	x8, x12
    1350:      	b.le	0x1418 <_gap_verify_graph+0x13b4>
    1354:      	ldr	x11, [x19, #0x80]
    1358:      	cmp	x11, x12
    135c:      	b.le	0x1418 <_gap_verify_graph+0x13b4>
    1360:      	ldr	x9, [x19, #0x78]
    1364:      	ldr	w13, [x9, x12, lsl #2]
    1368:      	tbnz	w13, #0x1f, 0x1418 <_gap_verify_graph+0x13b4>
    136c:      	ldr	x10, [x19]
    1370:      	add	x14, x10, x12, lsl #4
    1374:      	ldr	x12, [x14]
    1378:      	and	w21, w12, #0xff
    137c:      	sub	w15, w21, #0x6d
    1380:      	cmp	w15, #0x8
    1384:      	b.hi	0x1408 <_gap_verify_graph+0x13a4>
    1388:      	mov	w16, #0x107             ; =263
    138c:      	lsr	w16, w16, w15
    1390:      	tbz	w16, #0x0, 0x1408 <_gap_verify_graph+0x13a4>
    1394:      	tst	x12, #0xff00
    1398:      	b.ne	0x1408 <_gap_verify_graph+0x13a4>
    139c:      	cmp	w15, #0x2
    13a0:      	mov	w15, #0x2               ; =2
    13a4:      	cinc	w15, w15, lo
    13a8:      	cmp	w13, w15
    13ac:      	b.ne	0x1408 <_gap_verify_graph+0x13a4>
    13b0:      	ldr	x3, [x14, #0x8]
    13b4:      	lsr	x2, x12, #32
    13b8:      	cmp	w21, #0x75
    13bc:      	b.ne	0x17a4 <_gap_verify_graph+0x1740>
    13c0:      	add	x0, sp, #0xf0
    13c4:      	mov	x1, x19
    13c8:      	bl	0x13c8 <_gap_verify_graph+0x1364>
		00000000000013c8:  ARM64_RELOC_BRANCH26	_stogir.switch.switch-inputs
    13cc:      	ldr	w8, [sp, #0xf0]
    13d0:      	b	0x191c <_gap_verify_graph+0x18b8>
    13d4:      	tbz	w20, #0x1f, 0x1418 <_gap_verify_graph+0x13b4>
    13d8:      	ldr	x8, [x19, #0x30]
    13dc:      	ldr	x9, [x19, #0x58]
    13e0:      	cmp	x8, x9
    13e4:      	b.ne	0x1418 <_gap_verify_graph+0x13b4>
    13e8:      	sxtw	x9, w20
    13ec:      	cmn	x8, x9
    13f0:      	b.lt	0x1418 <_gap_verify_graph+0x13b4>
    13f4:      	ldr	x8, [x19, #0x50]
    13f8:      	mvn	x9, x9
    13fc:      	ldr	w8, [x8, x9, lsl #2]
    1400:      	cmp	w8, #0x0
    1404:      	b.le	0x1418 <_gap_verify_graph+0x13b4>
    1408:      	adrp	x8, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001408:  ARM64_RELOC_PAGE21	l_str.621
    140c:      	add	x8, x8, #0x0
		000000000000140c:  ARM64_RELOC_PAGEOFF12	l_str.621
    1410:      	mov	w24, #0x20              ; =32
    1414:      	b	0x1424 <_gap_verify_graph+0x13c0>
    1418:      	adrp	x8, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001418:  ARM64_RELOC_PAGE21	l_str.620
    141c:      	add	x8, x8, #0x0
		000000000000141c:  ARM64_RELOC_PAGEOFF12	l_str.620
    1420:      	mov	w24, #0x1a              ; =26
    1424:      	mov	w9, #0x1                ; =1
    1428:      	stp	x8, x24, [sp, #0xf8]
    142c:      	str	w9, [sp, #0xf0]
    1430:      	tbnz	w23, #0x7, 0x192c <_gap_verify_graph+0x18c8>
    1434:      	mov	x21, x24
    1438:      	b	0x1b18 <_gap_verify_graph+0x1ab4>
    143c:      	mov	w8, #0x16               ; =22
    1440:      	ubfx	w9, w10, #8, #8
    1444:      	cmp	w12, #0x82
    1448:      	b.ne	0x1458 <_gap_verify_graph+0x13f4>
    144c:      	cbz	w9, 0x179c <_gap_verify_graph+0x1738>
    1450:      	mov	w8, #0x19               ; =25
    1454:      	b	0x11d0 <_gap_verify_graph+0x116c>
    1458:      	ldr	x11, [x11, #0x8]
    145c:      	cmp	w11, #0x1
    1460:      	b.lt	0x150c <_gap_verify_graph+0x14a8>
    1464:      	ldr	x14, [x19, #0x8]
    1468:      	and	x13, x11, #0x7fffffff
    146c:      	cmp	x14, x13
    1470:      	b.le	0x1560 <_gap_verify_graph+0x14fc>
    1474:      	ldr	x14, [x19, #0x80]
    1478:      	cmp	x14, x13
    147c:      	b.le	0x1560 <_gap_verify_graph+0x14fc>
    1480:      	ldr	x14, [x19, #0x78]
    1484:      	ldr	w14, [x14, x13, lsl #2]
    1488:      	tbnz	w14, #0x1f, 0x1560 <_gap_verify_graph+0x14fc>
    148c:      	ldr	x14, [x19]
    1490:      	add	x13, x14, x13, lsl #4
    1494:      	ldr	x13, [x13]
    1498:      	and	x14, x13, #0xff00
    149c:      	cmp	x14, #0x600
    14a0:      	b.ne	0x1560 <_gap_verify_graph+0x14fc>
    14a4:      	and	w13, w13, #0xff
    14a8:      	mov	w14, #0x46              ; =70
    14ac:      	cmp	w13, #0x48
    14b0:      	ccmp	w13, w14, #0x4, ne
    14b4:      	mov	w13, #0x1b              ; =27
    14b8:      	csel	x8, x8, x13, ne
    14bc:      	cmp	w12, #0x7f
    14c0:      	b.eq	0x156c <_gap_verify_graph+0x1508>
    14c4:      	sub	w13, w9, #0x6
    14c8:      	cmn	w13, #0x4
    14cc:      	mov	w13, #0x25              ; =37
    14d0:      	csel	x8, x13, x8, lo
    14d4:      	cmp	w12, #0x7e
    14d8:      	b.eq	0x179c <_gap_verify_graph+0x1738>
    14dc:      	lsr	x12, x11, #32
    14e0:      	b	0x1614 <_gap_verify_graph+0x15b0>
    14e4:      	mov	w24, #0x1b              ; =27
    14e8:      	b	0x1338 <_gap_verify_graph+0x12d4>
    14ec:      	ldr	x8, [x19, #0x50]
    14f0:      	mvn	x9, x9
    14f4:      	ldr	w8, [x8, x9, lsl #2]
    14f8:      	mov	w9, #0x21               ; =33
    14fc:      	cmp	w8, #0x0
    1500:      	mov	w8, #0x1b               ; =27
    1504:      	csel	x24, x8, x9, gt
    1508:      	b	0x1338 <_gap_verify_graph+0x12d4>
    150c:      	tbz	w11, #0x1f, 0x1560 <_gap_verify_graph+0x14fc>
    1510:      	ldr	x13, [x19, #0x30]
    1514:      	ldr	x14, [x19, #0x58]
    1518:      	cmp	x13, x14
    151c:      	b.ne	0x1560 <_gap_verify_graph+0x14fc>
    1520:      	sxtw	x14, w11
    1524:      	cmn	x13, x14
    1528:      	b.lt	0x1560 <_gap_verify_graph+0x14fc>
    152c:      	ldr	x13, [x19, #0x50]
    1530:      	mvn	x14, x14
    1534:      	ldr	w13, [x13, x14, lsl #2]
    1538:      	cmp	w13, #0x0
    153c:      	b.le	0x1560 <_gap_verify_graph+0x14fc>
    1540:      	mvn	w13, w11
    1544:      	ldr	x14, [x19, #0x28]
    1548:      	and	x13, x13, #0x7fffffff
    154c:      	add	x13, x14, x13, lsl #4
    1550:      	ldr	x13, [x13]
    1554:      	and	x14, x13, #0xff00
    1558:      	cmp	x14, #0x600
    155c:      	b.eq	0x14a4 <_gap_verify_graph+0x1440>
    1560:      	mov	w8, #0x1b               ; =27
    1564:      	cmp	w12, #0x7f
    1568:      	b.ne	0x14c4 <_gap_verify_graph+0x1460>
    156c:      	lsr	x12, x11, #32
    1570:      	cmp	w9, #0x0
    1574:      	mov	w13, #0x19              ; =25
    1578:      	csel	x8, x8, x13, eq
    157c:      	cmp	w12, #0x1
    1580:      	b.lt	0x15bc <_gap_verify_graph+0x1558>
    1584:      	ldr	x13, [x19, #0x8]
    1588:      	cmp	x13, x12
    158c:      	b.le	0x1600 <_gap_verify_graph+0x159c>
    1590:      	ldr	x13, [x19, #0x80]
    1594:      	cmp	x13, x12
    1598:      	b.le	0x1600 <_gap_verify_graph+0x159c>
    159c:      	ldr	x13, [x19, #0x78]
    15a0:      	ldr	w13, [x13, x12, lsl #2]
    15a4:      	tbnz	w13, #0x1f, 0x1600 <_gap_verify_graph+0x159c>
    15a8:      	ldr	x9, [x19]
    15ac:      	add	x9, x9, x12, lsl #4
    15b0:      	ldr	w9, [x9]
    15b4:      	ubfx	w9, w9, #8, #8
    15b8:      	b	0x1604 <_gap_verify_graph+0x15a0>
    15bc:      	tbz	x11, #0x3f, 0x1600 <_gap_verify_graph+0x159c>
    15c0:      	ldr	x13, [x19, #0x30]
    15c4:      	ldr	x14, [x19, #0x58]
    15c8:      	cmp	x13, x14
    15cc:      	b.ne	0x1600 <_gap_verify_graph+0x159c>
    15d0:      	asr	x14, x11, #32
    15d4:      	cmn	x13, x14
    15d8:      	b.lt	0x1600 <_gap_verify_graph+0x159c>
    15dc:      	ldr	x13, [x19, #0x50]
    15e0:      	mvn	x14, x14
    15e4:      	ldr	w13, [x13, x14, lsl #2]
    15e8:      	cmp	w13, #0x0
    15ec:      	b.le	0x1600 <_gap_verify_graph+0x159c>
    15f0:      	ldr	x9, [x19, #0x28]
    15f4:      	eor	x13, x12, #0xffffffff
    15f8:      	add	x9, x9, x13, lsl #4
    15fc:      	b	0x15b0 <_gap_verify_graph+0x154c>
    1600:      	mov	w8, #0x1a               ; =26
    1604:      	sub	w13, w9, #0x6
    1608:      	cmn	w13, #0x4
    160c:      	mov	w13, #0x25              ; =37
    1610:      	csel	x8, x13, x8, lo
    1614:      	cmp	w12, #0x1
    1618:      	b.lt	0x1684 <_gap_verify_graph+0x1620>
    161c:      	ldr	x11, [x19, #0x8]
    1620:      	cmp	x11, x12
    1624:      	b.le	0x16d4 <_gap_verify_graph+0x1670>
    1628:      	ldr	x11, [x19, #0x80]
    162c:      	cmp	x11, x12
    1630:      	b.le	0x16d4 <_gap_verify_graph+0x1670>
    1634:      	ldr	x11, [x19, #0x78]
    1638:      	ldr	w11, [x11, x12, lsl #2]
    163c:      	tbnz	w11, #0x1f, 0x16d4 <_gap_verify_graph+0x1670>
    1640:      	ldr	x11, [x19]
    1644:      	add	x11, x11, x12, lsl #4
    1648:      	ldr	x11, [x11]
    164c:      	lsr	w12, w11, #8
    1650:      	cmp	w9, w12, uxtb
    1654:      	b.ne	0x16d4 <_gap_verify_graph+0x1670>
    1658:      	and	w11, w11, #0xff
    165c:      	mov	w12, #0x46              ; =70
    1660:      	cmp	w11, #0x48
    1664:      	ccmp	w11, w12, #0x4, ne
    1668:      	mov	w11, #0x22              ; =34
    166c:      	csel	x8, x11, x8, eq
    1670:      	and	w10, w10, #0xff
    1674:      	cmp	w10, #0x80
    1678:      	b.ne	0x16e4 <_gap_verify_graph+0x1680>
    167c:      	mov	w10, #0x1               ; =1
    1680:      	b	0x16f0 <_gap_verify_graph+0x168c>
    1684:      	tbz	x11, #0x3f, 0x16d4 <_gap_verify_graph+0x1670>
    1688:      	ldr	x13, [x19, #0x30]
    168c:      	ldr	x14, [x19, #0x58]
    1690:      	cmp	x13, x14
    1694:      	b.ne	0x16d4 <_gap_verify_graph+0x1670>
    1698:      	asr	x11, x11, #32
    169c:      	cmn	x13, x11
    16a0:      	b.lt	0x16d4 <_gap_verify_graph+0x1670>
    16a4:      	ldr	x13, [x19, #0x50]
    16a8:      	mvn	x11, x11
    16ac:      	ldr	w11, [x13, x11, lsl #2]
    16b0:      	cmp	w11, #0x0
    16b4:      	b.le	0x16d4 <_gap_verify_graph+0x1670>
    16b8:      	ldr	x11, [x19, #0x28]
    16bc:      	eor	x12, x12, #0xffffffff
    16c0:      	add	x11, x11, x12, lsl #4
    16c4:      	ldr	x11, [x11]
    16c8:      	lsr	w12, w11, #8
    16cc:      	cmp	w9, w12, uxtb
    16d0:      	b.eq	0x1658 <_gap_verify_graph+0x15f4>
    16d4:      	mov	w8, #0x22               ; =34
    16d8:      	and	w10, w10, #0xff
    16dc:      	cmp	w10, #0x80
    16e0:      	b.eq	0x167c <_gap_verify_graph+0x1618>
    16e4:      	cmp	w10, #0x81
    16e8:      	b.ne	0x179c <_gap_verify_graph+0x1738>
    16ec:      	mov	w10, wzr
    16f0:      	cmp	w20, #0x1
    16f4:      	b.lt	0x1724 <_gap_verify_graph+0x16c0>
    16f8:      	ldr	x12, [x19, #0x8]
    16fc:      	and	x11, x20, #0x7fffffff
    1700:      	cmp	x12, x11
    1704:      	b.le	0x1724 <_gap_verify_graph+0x16c0>
    1708:      	ldr	x12, [x19, #0x80]
    170c:      	cmp	x12, x11
    1710:      	b.le	0x1724 <_gap_verify_graph+0x16c0>
    1714:      	ldr	x12, [x19, #0x78]
    1718:      	ldr	w11, [x12, x11, lsl #2]
    171c:      	cmp	w11, #0x4
    1720:      	b.ge	0x2440 <_gap_verify_graph+0x23dc>
    1724:      	mov	x12, xzr
    1728:      	cbz	w12, 0x2458 <_gap_verify_graph+0x23f4>
    172c:      	cbz	w10, 0x1740 <_gap_verify_graph+0x16dc>
    1730:      	cmp	w11, #0x9
    1734:      	b.ls	0x179c <_gap_verify_graph+0x1738>
    1738:      	mov	w8, #0x1c               ; =28
    173c:      	b	0x11d0 <_gap_verify_graph+0x116c>
    1740:      	cmp	w11, #0x1
    1744:      	b.lt	0x1860 <_gap_verify_graph+0x17fc>
    1748:      	ldr	x12, [x19, #0x8]
    174c:      	and	x10, x11, #0x7fffffff
    1750:      	cmp	x12, x10
    1754:      	b.le	0x18b4 <_gap_verify_graph+0x1850>
    1758:      	ldr	x11, [x19, #0x80]
    175c:      	cmp	x11, x10
    1760:      	b.le	0x18b4 <_gap_verify_graph+0x1850>
    1764:      	ldr	x11, [x19, #0x78]
    1768:      	ldr	w11, [x11, x10, lsl #2]
    176c:      	tbnz	w11, #0x1f, 0x18b4 <_gap_verify_graph+0x1850>
    1770:      	ldr	x11, [x19]
    1774:      	add	x10, x11, x10, lsl #4
    1778:      	ldr	x10, [x10]
    177c:      	lsr	w11, w10, #8
    1780:      	cmp	w9, w11, uxtb
    1784:      	b.ne	0x18b4 <_gap_verify_graph+0x1850>
    1788:      	and	w9, w10, #0xff
    178c:      	mov	w10, #0x46              ; =70
    1790:      	cmp	w9, #0x48
    1794:      	ccmp	w9, w10, #0x4, ne
    1798:      	b.eq	0x18b4 <_gap_verify_graph+0x1850>
    179c:      	cbnz	x8, 0x11d0 <_gap_verify_graph+0x116c>
    17a0:      	b	0xba8 <_gap_verify_graph+0xb44>
    17a4:      	cmp	w2, #0x1
    17a8:      	b.lt	0x18bc <_gap_verify_graph+0x1858>
    17ac:      	cmp	x8, x2
    17b0:      	b.ls	0x1904 <_gap_verify_graph+0x18a0>
    17b4:      	cmp	x11, x2
    17b8:      	b.ls	0x1904 <_gap_verify_graph+0x18a0>
    17bc:      	ldr	w8, [x9, x2, lsl #2]
    17c0:      	tbnz	w8, #0x1f, 0x1904 <_gap_verify_graph+0x18a0>
    17c4:      	add	x9, x10, x2, lsl #4
    17c8:      	ldr	x10, [x9]
    17cc:      	and	x11, x10, #0xffff
    17d0:      	cmp	x11, #0x75
    17d4:      	b.ne	0x18f0 <_gap_verify_graph+0x188c>
    17d8:      	sub	w11, w21, #0x70
    17dc:      	cmn	w11, #0x3
    17e0:      	ccmp	w8, #0x2, #0x0, hs
    17e4:      	b.ne	0x18f0 <_gap_verify_graph+0x188c>
    17e8:      	str	x3, [sp, #0x60]
    17ec:      	ldr	x3, [x9, #0x8]
    17f0:      	lsr	x2, x10, #32
    17f4:      	sub	x0, x29, #0x98
    17f8:      	mov	x1, x19
    17fc:      	bl	0x17fc <_gap_verify_graph+0x1798>
		00000000000017fc:  ARM64_RELOC_BRANCH26	_stogir.switch.switch-inputs
    1800:      	ldur	w8, [x29, #-0x98]
    1804:      	cmp	w8, #0x1
    1808:      	b.ne	0x2b80 <_gap_verify_graph+0x2b1c>
    180c:      	ldp	x9, x10, [x29, #-0x90]
    1810:      	str	w8, [sp, #0xf0]
    1814:      	stp	x9, x10, [sp, #0xf8]
    1818:      	b	0x191c <_gap_verify_graph+0x18b8>
    181c:      	mov	w24, #0x25              ; =37
    1820:      	b	0x1338 <_gap_verify_graph+0x12d4>
    1824:      	tbz	x14, #0x3f, 0x2c64 <_gap_verify_graph+0x2c00>
    1828:      	ldr	x8, [x19, #0x30]
    182c:      	ldr	x9, [x19, #0x58]
    1830:      	cmp	x8, x9
    1834:      	b.ne	0x2c64 <_gap_verify_graph+0x2c00>
    1838:      	asr	x9, x14, #32
    183c:      	cmn	x8, x9
    1840:      	b.lt	0x2c64 <_gap_verify_graph+0x2c00>
    1844:      	ldr	x8, [x19, #0x50]
    1848:      	mvn	x9, x9
    184c:      	ldr	w8, [x8, x9, lsl #2]
    1850:      	cmp	w8, #0x0
    1854:      	b.le	0x2c64 <_gap_verify_graph+0x2c00>
    1858:      	mov	w24, #0x2c              ; =44
    185c:      	b	0x1338 <_gap_verify_graph+0x12d4>
    1860:      	tbz	w11, #0x1f, 0x18b4 <_gap_verify_graph+0x1850>
    1864:      	ldr	x10, [x19, #0x30]
    1868:      	ldr	x12, [x19, #0x58]
    186c:      	cmp	x10, x12
    1870:      	b.ne	0x18b4 <_gap_verify_graph+0x1850>
    1874:      	sxtw	x12, w11
    1878:      	cmn	x10, x12
    187c:      	b.lt	0x18b4 <_gap_verify_graph+0x1850>
    1880:      	ldr	x10, [x19, #0x50]
    1884:      	mvn	x12, x12
    1888:      	ldr	w10, [x10, x12, lsl #2]
    188c:      	cmp	w10, #0x0
    1890:      	b.le	0x18b4 <_gap_verify_graph+0x1850>
    1894:      	mvn	w10, w11
    1898:      	ldr	x11, [x19, #0x28]
    189c:      	and	x10, x10, #0x7fffffff
    18a0:      	add	x10, x11, x10, lsl #4
    18a4:      	ldr	x10, [x10]
    18a8:      	lsr	w11, w10, #8
    18ac:      	cmp	w9, w11, uxtb
    18b0:      	b.eq	0x1788 <_gap_verify_graph+0x1724>
    18b4:      	mov	w8, #0x24               ; =36
    18b8:      	b	0x11d0 <_gap_verify_graph+0x116c>
    18bc:      	tbz	x12, #0x3f, 0x1904 <_gap_verify_graph+0x18a0>
    18c0:      	ldr	x8, [x19, #0x30]
    18c4:      	ldr	x9, [x19, #0x58]
    18c8:      	cmp	x8, x9
    18cc:      	b.ne	0x1904 <_gap_verify_graph+0x18a0>
    18d0:      	asr	x9, x12, #32
    18d4:      	cmn	x8, x9
    18d8:      	b.lt	0x1904 <_gap_verify_graph+0x18a0>
    18dc:      	ldr	x8, [x19, #0x50]
    18e0:      	mvn	x9, x9
    18e4:      	ldr	w8, [x8, x9, lsl #2]
    18e8:      	cmp	w8, #0x0
    18ec:      	b.le	0x1904 <_gap_verify_graph+0x18a0>
    18f0:      	adrp	x9, 0x1000 <_gap_verify_graph+0xf9c>
		00000000000018f0:  ARM64_RELOC_PAGE21	l_str.601
    18f4:      	add	x10, x9, #0x0
		00000000000018f4:  ARM64_RELOC_PAGEOFF12	l_str.601
    18f8:      	mov	w8, #0x1                ; =1
    18fc:      	mov	w9, #0x1f               ; =31
    1900:      	b	0x1914 <_gap_verify_graph+0x18b0>
    1904:      	adrp	x9, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001904:  ARM64_RELOC_PAGE21	l_str.600
    1908:      	add	x10, x9, #0x0
		0000000000001908:  ARM64_RELOC_PAGEOFF12	l_str.600
    190c:      	mov	w8, #0x1                ; =1
    1910:      	mov	w9, #0x1a               ; =26
    1914:      	str	w8, [sp, #0xf0]
    1918:      	stp	x10, x9, [sp, #0xf8]
    191c:      	ldr	x9, [sp, #0x100]
    1920:      	cmp	w8, #0x1
    1924:      	csel	x24, x9, x24, eq
    1928:      	tbz	w23, #0x7, 0x1434 <_gap_verify_graph+0x13d0>
    192c:      	cmp	w20, #0x1
    1930:      	b.lt	0x198c <_gap_verify_graph+0x1928>
    1934:      	ldr	x25, [x19, #0x8]
    1938:      	and	x9, x20, #0x7fffffff
    193c:      	cmp	x25, x9
    1940:      	b.le	0x1b08 <_gap_verify_graph+0x1aa4>
    1944:      	ldr	x15, [x19, #0x80]
    1948:      	cmp	x15, x9
    194c:      	b.le	0x1b08 <_gap_verify_graph+0x1aa4>
    1950:      	ldr	x14, [x19, #0x78]
    1954:      	ldr	w8, [x14, x9, lsl #2]
    1958:      	tbnz	w8, #0x1f, 0x1b08 <_gap_verify_graph+0x1aa4>
    195c:      	ldr	x13, [x19]
    1960:      	add	x9, x13, x9, lsl #4
    1964:      	ldr	x21, [x9]
    1968:      	and	w12, w21, #0xff
    196c:      	cmp	w12, #0x42
    1970:      	b.ne	0x19f4 <_gap_verify_graph+0x1990>
    1974:      	and	x9, x21, #0xffff
    1978:      	sub	x25, x29, #0x80
    197c:      	cmp	x9, #0x642
    1980:      	ccmp	w8, #0x0, #0x0, eq
    1984:      	b.eq	0x1434 <_gap_verify_graph+0x13d0>
    1988:      	b	0x19dc <_gap_verify_graph+0x1978>
    198c:      	tbz	w20, #0x1f, 0x19e8 <_gap_verify_graph+0x1984>
    1990:      	ldr	x8, [x19, #0x30]
    1994:      	ldr	x9, [x19, #0x58]
    1998:      	cmp	x8, x9
    199c:      	b.ne	0x19e8 <_gap_verify_graph+0x1984>
    19a0:      	sxtw	x9, w20
    19a4:      	cmn	x8, x9
    19a8:      	b.lt	0x19e8 <_gap_verify_graph+0x1984>
    19ac:      	ldr	x8, [x19, #0x50]
    19b0:      	mvn	x9, x9
    19b4:      	ldr	w8, [x8, x9, lsl #2]
    19b8:      	cmp	w8, #0x0
    19bc:      	b.le	0x19e8 <_gap_verify_graph+0x1984>
    19c0:      	mvn	w8, w20
    19c4:      	ldr	x9, [x19, #0x28]
    19c8:      	and	x8, x8, #0x7fffffff
    19cc:      	lsl	x8, x8, #4
    19d0:      	ldrb	w8, [x9, x8]
    19d4:      	cmp	x8, #0x42
    19d8:      	b.ne	0x1b08 <_gap_verify_graph+0x1aa4>
    19dc:      	mov	w8, #0x1e               ; =30
    19e0:      	mov	w21, #0x1e              ; =30
    19e4:      	b	0x1b14 <_gap_verify_graph+0x1ab0>
    19e8:      	mov	w8, #0x19               ; =25
    19ec:      	mov	w21, #0x19              ; =25
    19f0:      	b	0x1b14 <_gap_verify_graph+0x1ab0>
    19f4:      	and	w10, w21, #0xff
    19f8:      	ldr	x2, [x9, #0x8]
    19fc:      	sub	w11, w10, #0x51
    1a00:      	cmp	w11, #0x4
    1a04:      	b.lo	0x1a10 <_gap_verify_graph+0x19ac>
    1a08:      	cmp	w10, #0x42
    1a0c:      	b.ne	0x1b08 <_gap_verify_graph+0x1aa4>
    1a10:      	subs	w17, w12, #0x53
    1a14:      	mov	w9, #0x1                ; =1
    1a18:      	mov	w10, #0x3               ; =3
    1a1c:      	cinc	w9, w9, ne
    1a20:      	cmp	w12, #0x51
    1a24:      	csel	w9, w10, w9, eq
    1a28:      	cmp	w8, w9
    1a2c:      	b.ne	0x1b08 <_gap_verify_graph+0x1aa4>
    1a30:      	lsr	x16, x21, #32
    1a34:      	tbnz	w21, #0x1f, 0x2300 <_gap_verify_graph+0x229c>
    1a38:      	ubfx	w8, w21, #8, #8
    1a3c:      	cmp	w17, #0x1
    1a40:      	b.hi	0x23dc <_gap_verify_graph+0x2378>
    1a44:      	cmp	w12, #0x53
    1a48:      	mov	w9, #0x6                ; =6
    1a4c:      	csel	w9, w9, wzr, eq
    1a50:      	cmp	w8, w9
    1a54:      	b.ne	0x2418 <_gap_verify_graph+0x23b4>
    1a58:      	cmp	w16, #0x1
    1a5c:      	b.lt	0x2514 <_gap_verify_graph+0x24b0>
    1a60:      	cmp	x25, x16
    1a64:      	mov	w8, #0x1                ; =1
    1a68:      	b.le	0x2af0 <_gap_verify_graph+0x2a8c>
    1a6c:      	cmp	x15, x16
    1a70:      	mov	w21, #0x1b              ; =27
    1a74:      	b.le	0x2528 <_gap_verify_graph+0x24c4>
    1a78:      	ldr	w8, [x14, x16, lsl #2]
    1a7c:      	tbnz	w8, #0x1f, 0x2514 <_gap_verify_graph+0x24b0>
    1a80:      	lsl	x8, x16, #4
    1a84:      	ldr	x8, [x13, x8]
    1a88:      	and	w9, w8, #0xff
    1a8c:      	sub	w9, w9, #0x4f
    1a90:      	cmp	w9, #0x33
    1a94:      	b.hi	0x2514 <_gap_verify_graph+0x24b0>
    1a98:      	and	x8, x8, #0xff
    1a9c:      	adrp	x9, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001a9c:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.PROPERTIES
    1aa0:      	add	x9, x9, #0x0
		0000000000001aa0:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.PROPERTIES
    1aa4:      	ldrb	w9, [x9, x8]
    1aa8:      	ldr	x11, [sp, #0x68]
    1aac:      	mov	w10, #0x1b              ; =27
    1ab0:      	ands	w8, w9, #0x4
    1ab4:      	lsr	w8, w8, #2
    1ab8:      	csel	x21, x10, x11, ne
    1abc:      	tbnz	w9, #0x2, 0x2528 <_gap_verify_graph+0x24c4>
    1ac0:      	cmp	w12, #0x53
    1ac4:      	b.eq	0x2528 <_gap_verify_graph+0x24c4>
    1ac8:      	sub	x0, x29, #0x80
    1acc:      	mov	x1, x19
    1ad0:      	bl	0x1ad0 <_gap_verify_graph+0x1a6c>
		0000000000001ad0:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    1ad4:      	ldur	w8, [x29, #-0x80]
    1ad8:      	cbz	w8, 0x2514 <_gap_verify_graph+0x24b0>
    1adc:      	ldur	w8, [x29, #-0x78]
    1ae0:      	and	w9, w8, #0xff00
    1ae4:      	and	w8, w8, #0xff
    1ae8:      	cmp	w9, #0x600
    1aec:      	mov	w9, #0x48               ; =72
    1af0:      	ccmp	w8, w9, #0x4, eq
    1af4:      	mov	w9, #0x29               ; =41
    1af8:      	cset	w8, eq
    1afc:      	ldr	x10, [sp, #0x68]
    1b00:      	csel	x21, x9, x10, eq
    1b04:      	b	0x2528 <_gap_verify_graph+0x24c4>
    1b08:      	mov	w8, #0x19               ; =25
    1b0c:      	mov	w21, #0x19              ; =25
    1b10:      	sub	x25, x29, #0x80
    1b14:      	str	x8, [sp, #0x68]
    1b18:      	tbnz	w23, #0x8, 0x1ba8 <_gap_verify_graph+0x1b44>
    1b1c:      	tbz	w23, #0x9, 0x1b40 <_gap_verify_graph+0x1adc>
    1b20:      	sub	x0, x29, #0xf0
    1b24:      	mov	x1, x19
    1b28:      	mov	w2, w20
    1b2c:      	bl	0x1b2c <_gap_verify_graph+0x1ac8>
		0000000000001b2c:  ARM64_RELOC_BRANCH26	_stogir.conversion.validate
    1b30:      	ldur	w8, [x29, #-0xf0]
    1b34:      	ldur	x9, [x29, #-0xe0]
    1b38:      	cmp	w8, #0x1
    1b3c:      	csel	x21, x9, x21, eq
    1b40:      	ldr	w6, [sp, #0x8c]
    1b44:      	and	w8, w27, #0xff
    1b48:      	adrp	x16, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001b48:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    1b4c:      	add	x16, x16, #0x0
		0000000000001b4c:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    1b50:      	mov	w5, #0x1e               ; =30
    1b54:      	cmp	w8, #0x78
    1b58:      	b.eq	0x1bd0 <_gap_verify_graph+0x1b6c>
    1b5c:      	cmp	w8, #0x3c
    1b60:      	b.ne	0x1c88 <_gap_verify_graph+0x1c24>
    1b64:      	sub	x0, x29, #0xd8
    1b68:      	mov	x1, x19
    1b6c:      	mov	w2, w20
    1b70:      	bl	0x1b70 <_gap_verify_graph+0x1b0c>
		0000000000001b70:  ARM64_RELOC_BRANCH26	_stogir.conditional.validate
    1b74:      	ldur	w8, [x29, #-0xd8]
    1b78:      	ldur	x9, [x29, #-0xc8]
    1b7c:      	mov	w5, #0x1e               ; =30
    1b80:      	ldr	w6, [sp, #0x8c]
    1b84:      	adrp	x16, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001b84:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    1b88:      	add	x16, x16, #0x0
		0000000000001b88:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    1b8c:      	cmp	w8, #0x1
    1b90:      	csel	x21, x9, x21, eq
    1b94:      	cbnz	w6, 0x1c8c <_gap_verify_graph+0x1c28>
    1b98:      	mov	w1, #0x5                ; =5
    1b9c:      	and	w14, w27, #0xff
    1ba0:      	cbz	w28, 0x1f8c <_gap_verify_graph+0x1f28>
    1ba4:      	b	0x4a8 <_gap_verify_graph+0x444>
    1ba8:      	add	x0, sp, #0x108
    1bac:      	mov	x1, x19
    1bb0:      	mov	w2, w20
    1bb4:      	bl	0x1bb4 <_gap_verify_graph+0x1b50>
		0000000000001bb4:  ARM64_RELOC_BRANCH26	_stogir.locals.validate
    1bb8:      	ldr	w8, [sp, #0x108]
    1bbc:      	ldr	x9, [sp, #0x118]
    1bc0:      	cmp	w8, #0x1
    1bc4:      	csel	x21, x9, x21, eq
    1bc8:      	tbnz	w23, #0x9, 0x1b20 <_gap_verify_graph+0x1abc>
    1bcc:      	b	0x1b40 <_gap_verify_graph+0x1adc>
    1bd0:      	ubfx	w8, w27, #8, #8
    1bd4:      	cbz	w8, 0x1c20 <_gap_verify_graph+0x1bbc>
    1bd8:      	cmp	w26, #0x1
    1bdc:      	b.lt	0x1c34 <_gap_verify_graph+0x1bd0>
    1be0:      	ldr	x10, [x19, #0x8]
    1be4:      	and	x9, x26, #0x7fffffff
    1be8:      	cmp	x10, x9
    1bec:      	b.le	0x1c78 <_gap_verify_graph+0x1c14>
    1bf0:      	ldr	x10, [x19, #0x80]
    1bf4:      	cmp	x10, x9
    1bf8:      	b.le	0x1c78 <_gap_verify_graph+0x1c14>
    1bfc:      	ldr	x10, [x19, #0x78]
    1c00:      	ldr	w10, [x10, x9, lsl #2]
    1c04:      	tbnz	w10, #0x1f, 0x1c84 <_gap_verify_graph+0x1c20>
    1c08:      	ldr	x10, [x19]
    1c0c:      	add	x9, x10, x9, lsl #4
    1c10:      	ldrb	w9, [x9, #0x1]
    1c14:      	cmp	w9, w8
    1c18:      	mov	w8, #0x1a               ; =26
    1c1c:      	b	0x1c28 <_gap_verify_graph+0x1bc4>
    1c20:      	cmp	w26, #0x0
    1c24:      	mov	w8, #0x1f               ; =31
    1c28:      	csel	x21, x21, x8, eq
    1c2c:      	cbz	w6, 0x1b98 <_gap_verify_graph+0x1b34>
    1c30:      	b	0x1c8c <_gap_verify_graph+0x1c28>
    1c34:      	tbz	w26, #0x1f, 0x1c78 <_gap_verify_graph+0x1c14>
    1c38:      	ldr	x9, [x19, #0x30]
    1c3c:      	ldr	x10, [x19, #0x58]
    1c40:      	cmp	x9, x10
    1c44:      	b.ne	0x1c78 <_gap_verify_graph+0x1c14>
    1c48:      	sxtw	x10, w26
    1c4c:      	cmn	x9, x10
    1c50:      	b.lt	0x1c78 <_gap_verify_graph+0x1c14>
    1c54:      	ldr	x9, [x19, #0x50]
    1c58:      	mvn	x10, x10
    1c5c:      	ldr	w9, [x9, x10, lsl #2]
    1c60:      	cmp	w9, #0x0
    1c64:      	b.le	0x1c78 <_gap_verify_graph+0x1c14>
    1c68:      	mvn	w9, w26
    1c6c:      	ldr	x10, [x19, #0x28]
    1c70:      	and	x9, x9, #0x7fffffff
    1c74:      	b	0x1c0c <_gap_verify_graph+0x1ba8>
    1c78:      	mov	w21, #0x14              ; =20
    1c7c:      	cbz	w6, 0x1b98 <_gap_verify_graph+0x1b34>
    1c80:      	b	0x1c8c <_gap_verify_graph+0x1c28>
    1c84:      	mov	w21, #0x14              ; =20
    1c88:      	cbz	w6, 0x1b98 <_gap_verify_graph+0x1b34>
    1c8c:      	cmp	w20, #0x1
    1c90:      	b.lt	0x3888 <_gap_verify_graph+0x3824>
    1c94:      	ldr	x8, [x19, #0x8]
    1c98:      	and	x12, x20, #0x7fffffff
    1c9c:      	cmp	x8, x12
    1ca0:      	b.le	0x3888 <_gap_verify_graph+0x3824>
    1ca4:      	ldr	x10, [x19, #0x80]
    1ca8:      	cmp	x10, x12
    1cac:      	b.le	0x3888 <_gap_verify_graph+0x3824>
    1cb0:      	ldr	x9, [x19, #0x78]
    1cb4:      	ldr	w14, [x9, x12, lsl #2]
    1cb8:      	tbnz	w14, #0x1f, 0x3888 <_gap_verify_graph+0x3824>
    1cbc:      	ldr	x11, [x19]
    1cc0:      	add	x12, x11, x12, lsl #4
    1cc4:      	ldp	x15, x12, [x12]
    1cc8:      	and	w13, w15, #0xff
    1ccc:      	sub	w2, w13, #0xe
    1cd0:      	sub	w16, w13, #0x1f
    1cd4:      	cmp	w2, #0xc
    1cd8:      	ccmp	w16, #0x2, #0x0, hs
    1cdc:      	cset	w17, lo
    1ce0:      	b.lo	0x1cf8 <_gap_verify_graph+0x1c94>
    1ce4:      	cmp	w13, #0x1a
    1ce8:      	b.lo	0x3888 <_gap_verify_graph+0x3824>
    1cec:      	cmp	w13, #0x3a
    1cf0:      	ccmp	w13, #0x1e, #0x0, ne
    1cf4:      	b.hs	0x1d08 <_gap_verify_graph+0x1ca4>
    1cf8:      	cmp	w16, #0x2
    1cfc:      	b.hs	0x1d10 <_gap_verify_graph+0x1cac>
    1d00:      	mov	w0, #0x1                ; =1
    1d04:      	b	0x1d1c <_gap_verify_graph+0x1cb8>
    1d08:      	cmp	w13, #0x3b
    1d0c:      	b.ne	0x3888 <_gap_verify_graph+0x3824>
    1d10:      	cmp	w13, #0x1d
    1d14:      	mov	w0, #0x2                ; =2
    1d18:      	cinc	w0, w0, eq
    1d1c:      	cmp	w14, w0
    1d20:      	b.ne	0x3888 <_gap_verify_graph+0x3824>
    1d24:      	lsr	x1, x15, #32
    1d28:      	cmp	w1, #0x1
    1d2c:      	b.lt	0x1d54 <_gap_verify_graph+0x1cf0>
    1d30:      	cmp	x8, x1
    1d34:      	mov	x0, #-0x1               ; =-1
    1d38:      	b.ls	0x388c <_gap_verify_graph+0x3828>
    1d3c:      	cmp	x10, x1
    1d40:      	b.ls	0x388c <_gap_verify_graph+0x3828>
    1d44:      	ldr	w14, [x9, x1, lsl #2]
    1d48:      	tbnz	w14, #0x1f, 0x388c <_gap_verify_graph+0x3828>
    1d4c:      	add	x14, x11, x1, lsl #4
    1d50:      	b	0x1d94 <_gap_verify_graph+0x1d30>
    1d54:      	tbz	x15, #0x3f, 0x3888 <_gap_verify_graph+0x3824>
    1d58:      	ldr	x14, [x19, #0x30]
    1d5c:      	ldr	x0, [x19, #0x58]
    1d60:      	cmp	x14, x0
    1d64:      	b.ne	0x3888 <_gap_verify_graph+0x3824>
    1d68:      	asr	x0, x15, #32
    1d6c:      	cmn	x14, x0
    1d70:      	b.lt	0x3888 <_gap_verify_graph+0x3824>
    1d74:      	ldr	x14, [x19, #0x50]
    1d78:      	mvn	x0, x0
    1d7c:      	ldr	w14, [x14, x0, lsl #2]
    1d80:      	cmp	w14, #0x0
    1d84:      	b.le	0x3888 <_gap_verify_graph+0x3824>
    1d88:      	ldr	x14, [x19, #0x28]
    1d8c:      	eor	x0, x1, #0xffffffff
    1d90:      	add	x14, x14, x0, lsl #4
    1d94:      	ldr	w0, [x14]
    1d98:      	lsr	w3, w15, #8
    1d9c:      	cmp	w2, #0xc
    1da0:      	ubfx	w14, w0, #8, #8
    1da4:      	csinc	w2, w14, wzr, hs
    1da8:      	cmp	w2, w3, uxtb
    1dac:      	b.ne	0x3888 <_gap_verify_graph+0x3824>
    1db0:      	tbz	w17, #0x0, 0x1dc4 <_gap_verify_graph+0x1d60>
    1db4:      	and	w15, w0, #0xfe00
    1db8:      	cmp	w15, #0xc00
    1dbc:      	b.eq	0x1de4 <_gap_verify_graph+0x1d80>
    1dc0:      	b	0x1dec <_gap_verify_graph+0x1d88>
    1dc4:      	and	w15, w15, #0xfe
    1dc8:      	cmp	w15, #0x3a
    1dcc:      	ccmp	w13, #0x1d, #0x0, ne
    1dd0:      	b.hi	0x1dec <_gap_verify_graph+0x1d88>
    1dd4:      	and	w15, w0, #0xfe00
    1dd8:      	mov	w2, #0x22               ; =34
    1ddc:      	cmp	w15, #0xc00
    1de0:      	b.ne	0x1df0 <_gap_verify_graph+0x1d8c>
    1de4:      	mov	x2, xzr
    1de8:      	b	0x1df0 <_gap_verify_graph+0x1d8c>
    1dec:      	mov	w2, #0x22               ; =34
    1df0:      	cmp	w16, #0x2
    1df4:      	lsr	x15, x12, #32
    1df8:      	mov	x17, xzr
    1dfc:      	csel	w16, w1, w12, lo
    1e00:      	cmp	x8, x10
    1e04:      	csel	x0, x8, x10, lo
    1e08:      	stp	w1, w16, [x29, #-0x80]
    1e0c:      	b	0x1e18 <_gap_verify_graph+0x1db4>
    1e10:      	mov	w2, #0x18               ; =24
    1e14:      	tbnz	w1, #0x1f, 0x1e7c <_gap_verify_graph+0x1e18>
    1e18:      	cmp	x17, #0x1
    1e1c:      	mov	x16, x2
    1e20:      	b.gt	0x1e38 <_gap_verify_graph+0x1dd4>
    1e24:      	ldr	w1, [x25, x17, lsl #2]
    1e28:      	add	x17, x17, #0x1
    1e2c:      	mov	w2, #0x1                ; =1
    1e30:      	cbnz	w2, 0x1e44 <_gap_verify_graph+0x1de0>
    1e34:      	b	0x1ecc <_gap_verify_graph+0x1e68>
    1e38:      	mov	x2, xzr
    1e3c:      	mov	w17, #0x2               ; =2
    1e40:      	cbz	w2, 0x1ecc <_gap_verify_graph+0x1e68>
    1e44:      	cmp	w1, #0x1
    1e48:      	b.lt	0x1e10 <_gap_verify_graph+0x1dac>
    1e4c:      	and	x1, x1, #0x7fffffff
    1e50:      	mov	w2, #0x18               ; =24
    1e54:      	cmp	x1, x0
    1e58:      	b.ge	0x1e18 <_gap_verify_graph+0x1db4>
    1e5c:      	ldr	w3, [x9, x1, lsl #2]
    1e60:      	mov	w2, #0x18               ; =24
    1e64:      	tbnz	w3, #0x1f, 0x1e18 <_gap_verify_graph+0x1db4>
    1e68:      	add	x1, x11, x1, lsl #4
    1e6c:      	ldrb	w1, [x1, #0x1]
    1e70:      	cmp	w1, w14
    1e74:      	csel	x2, x16, x5, eq
    1e78:      	b	0x1e18 <_gap_verify_graph+0x1db4>
    1e7c:      	ldr	x3, [x19, #0x30]
    1e80:      	ldr	x2, [x19, #0x58]
    1e84:      	cmp	x3, x2
    1e88:      	mov	w2, #0x18               ; =24
    1e8c:      	b.ne	0x1e18 <_gap_verify_graph+0x1db4>
    1e90:      	sxtw	x4, w1
    1e94:      	mov	w2, #0x18               ; =24
    1e98:      	cmn	x3, x4
    1e9c:      	b.lt	0x1e18 <_gap_verify_graph+0x1db4>
    1ea0:      	ldr	x2, [x19, #0x50]
    1ea4:      	mvn	x3, x4
    1ea8:      	ldr	w2, [x2, x3, lsl #2]
    1eac:      	cmp	w2, #0x0
    1eb0:      	mov	w2, #0x18               ; =24
    1eb4:      	b.le	0x1e18 <_gap_verify_graph+0x1db4>
    1eb8:      	mvn	w1, w1
    1ebc:      	ldr	x2, [x19, #0x28]
    1ec0:      	and	x1, x1, #0x7fffffff
    1ec4:      	add	x1, x2, x1, lsl #4
    1ec8:      	b	0x1e6c <_gap_verify_graph+0x1e08>
    1ecc:      	cmp	x15, #0x0
    1ed0:      	mov	w1, #0x5                ; =5
    1ed4:      	and	w14, w27, #0xff
    1ed8:      	ccmp	w13, #0x1d, #0x0, ne
    1edc:      	b.eq	0x1efc <_gap_verify_graph+0x1e98>
    1ee0:      	cmp	x16, #0x0
    1ee4:      	csel	x8, x21, x16, eq
    1ee8:      	mov	x21, x8
    1eec:      	adrp	x16, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001eec:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    1ef0:      	add	x16, x16, #0x0
		0000000000001ef0:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    1ef4:      	cbz	w28, 0x1f8c <_gap_verify_graph+0x1f28>
    1ef8:      	b	0x4a8 <_gap_verify_graph+0x444>
    1efc:      	cmp	w15, #0x1
    1f00:      	b.lt	0x1f5c <_gap_verify_graph+0x1ef8>
    1f04:      	cmp	x8, x15
    1f08:      	b.le	0x1f78 <_gap_verify_graph+0x1f14>
    1f0c:      	cmp	x10, x15
    1f10:      	mov	w8, #0x16               ; =22
    1f14:      	b.le	0x1f7c <_gap_verify_graph+0x1f18>
    1f18:      	ldr	w8, [x9, x15, lsl #2]
    1f1c:      	tbnz	w8, #0x1f, 0x1f78 <_gap_verify_graph+0x1f14>
    1f20:      	lsl	x8, x15, #4
    1f24:      	ldr	w8, [x11, x8]
    1f28:      	and	w9, w8, #0xfe
    1f2c:      	and	w8, w8, #0xff
    1f30:      	sub	w9, w9, #0x68
    1f34:      	sub	w8, w8, #0x65
    1f38:      	cmp	w9, #0x9
    1f3c:      	ccmp	w8, #0x1, #0x0, hi
    1f40:      	b.ls	0x1ee0 <_gap_verify_graph+0x1e7c>
    1f44:      	mov	w8, #0x2d               ; =45
    1f48:      	mov	x21, x8
    1f4c:      	adrp	x16, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001f4c:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    1f50:      	add	x16, x16, #0x0
		0000000000001f50:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    1f54:      	cbz	w28, 0x1f8c <_gap_verify_graph+0x1f28>
    1f58:      	b	0x4a8 <_gap_verify_graph+0x444>
    1f5c:      	ldr	x8, [x19, #0x30]
    1f60:      	ldr	x9, [x19, #0x58]
    1f64:      	cmp	x8, x9
    1f68:      	b.ne	0x1f78 <_gap_verify_graph+0x1f14>
    1f6c:      	asr	x9, x12, #32
    1f70:      	cmn	x8, x9
    1f74:      	b.ge	0x2284 <_gap_verify_graph+0x2220>
    1f78:      	mov	w8, #0x16               ; =22
    1f7c:      	mov	x21, x8
    1f80:      	adrp	x16, 0x1000 <_gap_verify_graph+0xf9c>
		0000000000001f80:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    1f84:      	add	x16, x16, #0x0
		0000000000001f84:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    1f88:      	cbnz	w28, 0x4a8 <_gap_verify_graph+0x444>
    1f8c:      	cbnz	w6, 0x4a8 <_gap_verify_graph+0x444>
    1f90:      	ldr	w26, [sp, #0x88]
    1f94:      	and	w8, w23, #0x2
    1f98:      	orr	w9, w26, w23
    1f9c:      	orr	w8, w9, w8, lsr #1
    1fa0:      	tbz	w8, #0x0, 0x4a8 <_gap_verify_graph+0x444>
    1fa4:      	cmp	w20, #0x1
    1fa8:      	b.lt	0x1fec <_gap_verify_graph+0x1f88>
    1fac:      	ldr	x10, [x19, #0x8]
    1fb0:      	and	x8, x20, #0x7fffffff
    1fb4:      	cmp	x10, x8
    1fb8:      	b.le	0x1fec <_gap_verify_graph+0x1f88>
    1fbc:      	ldr	x10, [x19, #0x80]
    1fc0:      	cmp	x10, x8
    1fc4:      	b.le	0x1fec <_gap_verify_graph+0x1f88>
    1fc8:      	ldr	x10, [x19, #0x78]
    1fcc:      	ldr	w10, [x10, x8, lsl #2]
    1fd0:      	cmp	w10, #0x1
    1fd4:      	b.lt	0x1fec <_gap_verify_graph+0x1f88>
    1fd8:      	ldr	x10, [x19]
    1fdc:      	add	x8, x10, x8, lsl #4
    1fe0:      	mov	w10, #0x1               ; =1
    1fe4:      	ldr	w8, [x8, #0x4]
    1fe8:      	b	0x1ff0 <_gap_verify_graph+0x1f8c>
    1fec:      	mov	x10, xzr
    1ff0:      	cbz	w10, 0x3888 <_gap_verify_graph+0x3824>
    1ff4:      	cmp	w8, #0x1
    1ff8:      	b.lt	0x202c <_gap_verify_graph+0x1fc8>
    1ffc:      	ldr	x10, [x19, #0x8]
    2000:      	and	x8, x8, #0x7fffffff
    2004:      	cmp	x10, x8
    2008:      	b.le	0x3888 <_gap_verify_graph+0x3824>
    200c:      	ldr	x10, [x19, #0x80]
    2010:      	cmp	x10, x8
    2014:      	b.le	0x3888 <_gap_verify_graph+0x3824>
    2018:      	ldr	x10, [x19, #0x78]
    201c:      	ldr	w10, [x10, x8, lsl #2]
    2020:      	tbnz	w10, #0x1f, 0x3888 <_gap_verify_graph+0x3824>
    2024:      	ldr	x10, [x19]
    2028:      	b	0x206c <_gap_verify_graph+0x2008>
    202c:      	tbz	w8, #0x1f, 0x3888 <_gap_verify_graph+0x3824>
    2030:      	ldr	x10, [x19, #0x30]
    2034:      	ldr	x11, [x19, #0x58]
    2038:      	cmp	x10, x11
    203c:      	b.ne	0x3888 <_gap_verify_graph+0x3824>
    2040:      	sxtw	x11, w8
    2044:      	cmn	x10, x11
    2048:      	b.lt	0x3888 <_gap_verify_graph+0x3824>
    204c:      	ldr	x10, [x19, #0x50]
    2050:      	mvn	x11, x11
    2054:      	ldr	w10, [x10, x11, lsl #2]
    2058:      	cmp	w10, #0x0
    205c:      	b.le	0x3888 <_gap_verify_graph+0x3824>
    2060:      	ldr	x10, [x19, #0x28]
    2064:      	mvn	w8, w8
    2068:      	and	x8, x8, #0x7fffffff
    206c:      	add	x8, x10, x8, lsl #4
    2070:      	cbz	x8, 0x3888 <_gap_verify_graph+0x3824>
    2074:      	ldr	w11, [x8]
    2078:      	and	x10, x27, #0xff00
    207c:      	cmp	x10, #0x600
    2080:      	ubfx	w8, w11, #8, #8
    2084:      	b.ne	0x20a0 <_gap_verify_graph+0x203c>
    2088:      	cmp	w8, #0x6
    208c:      	b.ne	0x20a0 <_gap_verify_graph+0x203c>
    2090:      	and	w10, w27, #0xfe
    2094:      	cmp	w10, #0x1a
    2098:      	cset	w10, eq
    209c:      	b	0x20b0 <_gap_verify_graph+0x204c>
    20a0:      	sub	w10, w8, #0x1
    20a4:      	cmp	w10, #0xa
    20a8:      	mov	w10, wzr
    20ac:      	b.hi	0x2154 <_gap_verify_graph+0x20f0>
    20b0:      	tbz	w23, #0x1, 0x20f0 <_gap_verify_graph+0x208c>
    20b4:      	and	w12, w27, #0xff
    20b8:      	cmp	w12, #0x39
    20bc:      	b.hi	0x2154 <_gap_verify_graph+0x20f0>
    20c0:      	mov	x13, #0x80000000        ; =2147483648
    20c4:      	and	x12, x27, #0xff
    20c8:      	movk	x13, #0x2001, lsl #32
    20cc:      	movk	x13, #0x3c0, lsl #48
    20d0:      	lsr	x12, x13, x12
    20d4:      	tbz	w12, #0x0, 0x2154 <_gap_verify_graph+0x20f0>
    20d8:      	cmp	w14, #0x2d
    20dc:      	b.ne	0x214c <_gap_verify_graph+0x20e8>
    20e0:      	mov	w11, #0x1               ; =1
    20e4:      	cbz	w11, 0x2144 <_gap_verify_graph+0x20e0>
    20e8:      	tbnz	w23, #0x0, 0x2104 <_gap_verify_graph+0x20a0>
    20ec:      	b	0x2144 <_gap_verify_graph+0x20e0>
    20f0:      	tbz	w23, #0x0, 0x2158 <_gap_verify_graph+0x20f4>
    20f4:      	cmp	w14, #0x1a
    20f8:      	b.lo	0x2154 <_gap_verify_graph+0x20f0>
    20fc:      	cmp	w14, #0x1f
    2100:      	b.lo	0x2120 <_gap_verify_graph+0x20bc>
    2104:      	cmp	w14, #0x2e
    2108:      	b.lo	0x2154 <_gap_verify_graph+0x20f0>
    210c:      	and	w11, w27, #0xfe
    2110:      	cmp	w11, #0x3a
    2114:      	mov	w11, #0x35              ; =53
    2118:      	ccmp	w14, w11, #0x0, ne
    211c:      	b.hi	0x2154 <_gap_verify_graph+0x20f0>
    2120:      	cmp	w8, #0x1
    2124:      	b.ne	0x2158 <_gap_verify_graph+0x20f4>
    2128:      	and	w11, w27, #0xff
    212c:      	cmp	w11, #0x3b
    2130:      	b.hi	0x2154 <_gap_verify_graph+0x20f0>
    2134:      	mov	x12, #0xc00000000000    ; =211106232532992
    2138:      	and	x11, x27, #0xff
    213c:      	movk	x12, #0xc01, lsl #48
    2140:      	lsr	x11, x12, x11
    2144:      	tbnz	w11, #0x0, 0x2158 <_gap_verify_graph+0x20f4>
    2148:      	b	0x2154 <_gap_verify_graph+0x20f0>
    214c:      	cmp	w8, #0x1
    2150:      	b.ne	0x225c <_gap_verify_graph+0x21f8>
    2154:      	mov	w21, #0x1c              ; =28
    2158:      	cmp	w26, #0x0
    215c:      	ldr	w12, [sp, #0x84]
    2160:      	csinc	w11, w8, wzr, eq
    2164:      	cmp	w11, w12, uxtb
    2168:      	mov	w11, #0x26              ; =38
    216c:      	csel	x21, x21, x11, eq
    2170:      	tbz	w9, #0x0, 0x4a8 <_gap_verify_graph+0x444>
    2174:      	cmp	w20, #0x1
    2178:      	b.lt	0x21a8 <_gap_verify_graph+0x2144>
    217c:      	ldr	x11, [x19, #0x8]
    2180:      	and	x9, x20, #0x7fffffff
    2184:      	cmp	x11, x9
    2188:      	b.le	0x21a8 <_gap_verify_graph+0x2144>
    218c:      	ldr	x11, [x19, #0x80]
    2190:      	cmp	x11, x9
    2194:      	b.le	0x21a8 <_gap_verify_graph+0x2144>
    2198:      	ldr	x11, [x19, #0x78]
    219c:      	ldr	w11, [x11, x9, lsl #2]
    21a0:      	cmp	w11, #0x2
    21a4:      	b.ge	0x22b4 <_gap_verify_graph+0x2250>
    21a8:      	mov	x11, xzr
    21ac:      	cbz	w11, 0x3888 <_gap_verify_graph+0x3824>
    21b0:      	cmp	w9, #0x1
    21b4:      	b.lt	0x21e8 <_gap_verify_graph+0x2184>
    21b8:      	ldr	x11, [x19, #0x8]
    21bc:      	and	x9, x9, #0x7fffffff
    21c0:      	cmp	x11, x9
    21c4:      	b.le	0x3888 <_gap_verify_graph+0x3824>
    21c8:      	ldr	x11, [x19, #0x80]
    21cc:      	cmp	x11, x9
    21d0:      	b.le	0x3888 <_gap_verify_graph+0x3824>
    21d4:      	ldr	x11, [x19, #0x78]
    21d8:      	ldr	w11, [x11, x9, lsl #2]
    21dc:      	tbnz	w11, #0x1f, 0x3888 <_gap_verify_graph+0x3824>
    21e0:      	ldr	x11, [x19]
    21e4:      	b	0x2228 <_gap_verify_graph+0x21c4>
    21e8:      	tbz	w9, #0x1f, 0x3888 <_gap_verify_graph+0x3824>
    21ec:      	ldr	x11, [x19, #0x30]
    21f0:      	ldr	x12, [x19, #0x58]
    21f4:      	cmp	x11, x12
    21f8:      	b.ne	0x3888 <_gap_verify_graph+0x3824>
    21fc:      	sxtw	x12, w9
    2200:      	cmn	x11, x12
    2204:      	b.lt	0x3888 <_gap_verify_graph+0x3824>
    2208:      	ldr	x11, [x19, #0x50]
    220c:      	mvn	x12, x12
    2210:      	ldr	w11, [x11, x12, lsl #2]
    2214:      	cmp	w11, #0x0
    2218:      	b.le	0x3888 <_gap_verify_graph+0x3824>
    221c:      	ldr	x11, [x19, #0x28]
    2220:      	mvn	w9, w9
    2224:      	and	x9, x9, #0x7fffffff
    2228:      	add	x9, x11, x9, lsl #4
    222c:      	cbz	x9, 0x3888 <_gap_verify_graph+0x3824>
    2230:      	ldr	w9, [x9]
    2234:      	eor	w10, w10, #0x1
    2238:      	ubfx	w9, w9, #8, #8
    223c:      	cmp	w8, w9
    2240:      	csinc	w10, w10, wzr, ne
    2244:      	tbnz	w10, #0x0, 0x4a0 <_gap_verify_graph+0x43c>
    2248:      	cmp	w9, #0x5
    224c:      	b.eq	0x4a8 <_gap_verify_graph+0x444>
    2250:      	cmp	w9, #0xb
    2254:      	b.eq	0x4a8 <_gap_verify_graph+0x444>
    2258:      	b	0x3888 <_gap_verify_graph+0x3824>
    225c:      	and	w12, w27, #0xff
    2260:      	cmp	w12, #0x36
    2264:      	b.eq	0x22dc <_gap_verify_graph+0x2278>
    2268:      	cmp	w12, #0x20
    226c:      	b.eq	0x22cc <_gap_verify_graph+0x2268>
    2270:      	cmp	w12, #0x1f
    2274:      	b.ne	0x20e0 <_gap_verify_graph+0x207c>
    2278:      	cmp	w8, #0x6
    227c:      	cset	w11, ne
    2280:      	b	0x20e4 <_gap_verify_graph+0x2080>
    2284:      	ldr	x8, [x19, #0x50]
    2288:      	mvn	x9, x9
    228c:      	ldr	w8, [x8, x9, lsl #2]
    2290:      	mov	w9, #0x2d               ; =45
    2294:      	cmp	w8, #0x0
    2298:      	mov	w8, #0x16               ; =22
    229c:      	csel	x8, x9, x8, gt
    22a0:      	mov	x21, x8
    22a4:      	adrp	x16, 0x2000 <_gap_verify_graph+0x1f9c>
		00000000000022a4:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.METADATA
    22a8:      	add	x16, x16, #0x0
		00000000000022a8:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.METADATA
    22ac:      	cbz	w28, 0x1f8c <_gap_verify_graph+0x1f28>
    22b0:      	b	0x4a8 <_gap_verify_graph+0x444>
    22b4:      	ldr	x11, [x19]
    22b8:      	add	x9, x11, x9, lsl #4
    22bc:      	mov	w11, #0x1               ; =1
    22c0:      	ldr	w9, [x9, #0x8]
    22c4:      	cbnz	w11, 0x21b0 <_gap_verify_graph+0x214c>
    22c8:      	b	0x3888 <_gap_verify_graph+0x3824>
    22cc:      	sub	w11, w8, #0x7
    22d0:      	cmp	w11, #0x5
    22d4:      	cset	w11, lo
    22d8:      	b	0x20e4 <_gap_verify_graph+0x2080>
    22dc:      	lsr	w11, w11, #8
    22e0:      	sub	w11, w11, #0x3
    22e4:      	and	w12, w11, #0xff
    22e8:      	cmp	w12, #0x8
    22ec:      	b.hi	0x2154 <_gap_verify_graph+0x20f0>
    22f0:      	mov	w12, #0x1cf             ; =463
    22f4:      	lsr	w11, w12, w11
    22f8:      	tbnz	w11, #0x0, 0x20e0 <_gap_verify_graph+0x207c>
    22fc:      	b	0x2154 <_gap_verify_graph+0x20f0>
    2300:      	mov	w8, #-0xff01            ; =-65281
    2304:      	mov	w9, #0x51               ; =81
    2308:      	and	x8, x21, x8
    230c:      	movk	w9, #0x8000, lsl #16
    2310:      	cmp	x8, x9
    2314:      	b.ne	0x2900 <_gap_verify_graph+0x289c>
    2318:      	cmp	x25, x15
    231c:      	mov	w10, w16
    2320:      	csel	x8, x25, x15, lo
    2324:      	cmp	w10, #0x1
    2328:      	b.lt	0x2850 <_gap_verify_graph+0x27ec>
    232c:      	mov	w9, w10
    2330:      	cmp	x8, x9
    2334:      	b.ls	0x2900 <_gap_verify_graph+0x289c>
    2338:      	ldr	w11, [x14, x9, lsl #2]
    233c:      	tbnz	w11, #0x1f, 0x2900 <_gap_verify_graph+0x289c>
    2340:      	add	x11, x13, x9, lsl #4
    2344:      	ldrb	w12, [x11]
    2348:      	ldr	w9, [x11, #0x4]
    234c:      	cmp	w12, #0x68
    2350:      	b.eq	0x28a4 <_gap_verify_graph+0x2840>
    2354:      	cmp	w12, #0x51
    2358:      	b.ne	0x2900 <_gap_verify_graph+0x289c>
    235c:      	cmp	w9, #0x1
    2360:      	b.lt	0x2900 <_gap_verify_graph+0x289c>
    2364:      	cmp	w10, w9
    2368:      	b.ls	0x2900 <_gap_verify_graph+0x289c>
    236c:      	ldr	x10, [x11, #0x8]
    2370:      	tbz	w10, #0x1f, 0x2900 <_gap_verify_graph+0x289c>
    2374:      	ldr	x11, [x19, #0x30]
    2378:      	ldr	x12, [x19, #0x58]
    237c:      	cmp	x11, x12
    2380:      	b.ne	0x2900 <_gap_verify_graph+0x289c>
    2384:      	sxtw	x12, w10
    2388:      	cmn	x11, x12
    238c:      	b.lt	0x2900 <_gap_verify_graph+0x289c>
    2390:      	ldr	x11, [x19, #0x50]
    2394:      	mvn	x12, x12
    2398:      	ldr	w11, [x11, x12, lsl #2]
    239c:      	cmp	w11, #0x0
    23a0:      	b.le	0x2900 <_gap_verify_graph+0x289c>
    23a4:      	mvn	w10, w10
    23a8:      	ldr	x11, [x19, #0x28]
    23ac:      	and	x10, x10, #0x7fffffff
    23b0:      	lsl	x10, x10, #4
    23b4:      	ldr	w11, [x11, x10]
    23b8:      	mov	w10, w9
    23bc:      	and	w12, w11, #0xff
    23c0:      	cmp	w12, #0x49
    23c4:      	b.eq	0x2324 <_gap_verify_graph+0x22c0>
    23c8:      	ubfx	w10, w11, #8, #8
    23cc:      	cmp	w12, w10
    23d0:      	mov	w10, w9
    23d4:      	b.eq	0x2324 <_gap_verify_graph+0x22c0>
    23d8:      	b	0x2900 <_gap_verify_graph+0x289c>
    23dc:      	lsr	x9, x2, #32
    23e0:      	cmp	w12, #0x51
    23e4:      	b.ne	0x2424 <_gap_verify_graph+0x23c0>
    23e8:      	cmp	w8, #0x6
    23ec:      	b.ne	0x2434 <_gap_verify_graph+0x23d0>
    23f0:      	cbz	x9, 0x2460 <_gap_verify_graph+0x23fc>
    23f4:      	cmp	w9, #0x1
    23f8:      	mov	w8, #0x1                ; =1
    23fc:      	b.lt	0x2438 <_gap_verify_graph+0x23d4>
    2400:      	asr	x10, x2, #32
    2404:      	mov	w21, #0x29              ; =41
    2408:      	sub	x11, x10, #0x1
    240c:      	and	x10, x10, x11
    2410:      	cbz	x10, 0x2460 <_gap_verify_graph+0x23fc>
    2414:      	b	0x2528 <_gap_verify_graph+0x24c4>
    2418:      	mov	w8, #0x1                ; =1
    241c:      	mov	w21, #0x22              ; =34
    2420:      	b	0x2528 <_gap_verify_graph+0x24c4>
    2424:      	cmp	w8, #0x0
    2428:      	mov	w8, #0x52               ; =82
    242c:      	ccmp	w12, w8, #0x0, eq
    2430:      	b.eq	0x2460 <_gap_verify_graph+0x23fc>
    2434:      	mov	w8, #0x1                ; =1
    2438:      	mov	w21, #0x29              ; =41
    243c:      	b	0x2528 <_gap_verify_graph+0x24c4>
    2440:      	add	w11, w20, #0x1
    2444:      	ldr	x12, [x19]
    2448:      	ubfiz	x11, x11, #4, #32
    244c:      	ldr	w11, [x12, x11]
    2450:      	mov	w12, #0x1               ; =1
    2454:      	cbnz	w12, 0x172c <_gap_verify_graph+0x16c8>
    2458:      	mov	w8, #0x1d               ; =29
    245c:      	b	0x11d0 <_gap_verify_graph+0x116c>
    2460:      	cmp	w16, #0x1
    2464:      	b.lt	0x2520 <_gap_verify_graph+0x24bc>
    2468:      	cmp	x25, x16
    246c:      	mov	w8, #0x1                ; =1
    2470:      	b.le	0x2524 <_gap_verify_graph+0x24c0>
    2474:      	cmp	x15, x16
    2478:      	mov	w21, #0x1f              ; =31
    247c:      	b.le	0x2528 <_gap_verify_graph+0x24c4>
    2480:      	ldr	w8, [x14, x16, lsl #2]
    2484:      	tbnz	w8, #0x1f, 0x2520 <_gap_verify_graph+0x24bc>
    2488:      	lsl	x8, x16, #4
    248c:      	ldr	x8, [x13, x8]
    2490:      	and	w10, w8, #0xff
    2494:      	sub	w10, w10, #0x4f
    2498:      	cmp	w10, #0x33
    249c:      	b.hi	0x2520 <_gap_verify_graph+0x24bc>
    24a0:      	and	x8, x8, #0xff
    24a4:      	adrp	x10, 0x2000 <_gap_verify_graph+0x1f9c>
		00000000000024a4:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.PROPERTIES
    24a8:      	add	x10, x10, #0x0
		00000000000024a8:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.PROPERTIES
    24ac:      	ldrb	w8, [x10, x8]
    24b0:      	tbnz	w8, #0x2, 0x2520 <_gap_verify_graph+0x24bc>
    24b4:      	cmp	w2, #0x1
    24b8:      	b.lt	0x2fc8 <_gap_verify_graph+0x2f64>
    24bc:      	and	x10, x2, #0x7fffffff
    24c0:      	mov	w8, #0x1                ; =1
    24c4:      	cmp	x25, x10
    24c8:      	b.ls	0x31b0 <_gap_verify_graph+0x314c>
    24cc:      	cmp	x15, x10
    24d0:      	mov	w21, #0x18              ; =24
    24d4:      	b.ls	0x2528 <_gap_verify_graph+0x24c4>
    24d8:      	ldr	w8, [x14, x10, lsl #2]
    24dc:      	tbnz	w8, #0x1f, 0x3010 <_gap_verify_graph+0x2fac>
    24e0:      	add	x8, x13, x10, lsl #4
    24e4:      	ldr	x8, [x8]
    24e8:      	ubfx	w10, w8, #8, #8
    24ec:      	and	x8, x8, #0xff
    24f0:      	sub	w10, w10, #0xc
    24f4:      	cmn	w10, #0xb
    24f8:      	mov	w10, #0x48              ; =72
    24fc:      	ccmp	x8, x10, #0x4, hs
    2500:      	b.eq	0x2434 <_gap_verify_graph+0x23d0>
    2504:      	tbnz	w2, #0x1f, 0x37c0 <_gap_verify_graph+0x375c>
    2508:      	ldr	x21, [sp, #0x68]
    250c:      	mov	w8, wzr
    2510:      	b	0x2528 <_gap_verify_graph+0x24c4>
    2514:      	mov	w8, #0x1                ; =1
    2518:      	mov	w21, #0x1b              ; =27
    251c:      	b	0x2528 <_gap_verify_graph+0x24c4>
    2520:      	mov	w8, #0x1                ; =1
    2524:      	mov	w21, #0x1f              ; =31
    2528:      	sub	x25, x29, #0x80
    252c:      	cmp	w8, #0x1
    2530:      	str	x21, [sp, #0x68]
    2534:      	b.ne	0x1434 <_gap_verify_graph+0x13d0>
    2538:      	b	0x1b18 <_gap_verify_graph+0x1ab4>
    253c:      	and	w8, w24, #0xfe
    2540:      	str	w26, [sp, #0x58]
    2544:      	mov	x26, x4
    2548:      	str	w8, [sp, #0x48]
    254c:      	sub	w8, w11, #0x55
    2550:      	cmp	w8, #0x4
    2554:      	str	w14, [sp, #0x28]
    2558:      	str	w2, [sp, #0x1c]
    255c:      	str	x15, [sp, #0x10]
    2560:      	str	x12, [sp, #0x20]
    2564:      	str	x10, [sp, #0x50]
    2568:      	stp	x16, x6, [sp, #0x30]
    256c:      	str	x5, [sp, #0x60]
    2570:      	str	x0, [sp, #0x40]
    2574:      	b.lo	0x2588 <_gap_verify_graph+0x2524>
    2578:      	mov	x0, x19
    257c:      	mov	w1, w20
    2580:      	bl	0x2580 <_gap_verify_graph+0x251c>
		0000000000002580:  ARM64_RELOC_BRANCH26	_stogir.vector-arithmetic.node?
    2584:      	cbz	w0, 0x2b1c <_gap_verify_graph+0x2ab8>
    2588:      	ldp	x6, x0, [sp, #0x38]
    258c:      	and	w8, w24, #0xff
    2590:      	mov	x4, x26
    2594:      	ldr	x5, [sp, #0x60]
    2598:      	ldr	w26, [sp, #0x58]
    259c:      	ldr	x16, [sp, #0x30]
    25a0:      	ldr	x10, [sp, #0x50]
    25a4:      	cmp	w8, #0x39
    25a8:      	ldr	x12, [sp, #0x20]
    25ac:      	ldr	x15, [sp, #0x10]
    25b0:      	and	w3, w27, #0xff
    25b4:      	ldr	w2, [sp, #0x1c]
    25b8:      	ldr	w14, [sp, #0x28]
    25bc:      	and	w11, w24, #0xff
    25c0:      	ldr	w17, [sp, #0x48]
    25c4:      	b.hi	0xff0 <_gap_verify_graph+0xf8c>
    25c8:      	mov	x9, #0x80000000         ; =2147483648
    25cc:      	and	x8, x15, #0xff
    25d0:      	movk	x9, #0x2001, lsl #32
    25d4:      	movk	x9, #0x3c0, lsl #48
    25d8:      	lsr	x8, x9, x8
    25dc:      	tbz	w8, #0x0, 0xff0 <_gap_verify_graph+0xf8c>
    25e0:      	and	w8, w21, #0xf0
    25e4:      	sub	w9, w2, #0x1
    25e8:      	sub	w8, w8, #0x10
    25ec:      	cmp	w9, #0xd
    25f0:      	mov	w9, #0x70               ; =112
    25f4:      	ccmp	w8, w9, #0x2, lo
    25f8:      	b.hs	0x2664 <_gap_verify_graph+0x2600>
    25fc:      	and	w8, w24, #0xff
    2600:      	str	w17, [sp, #0x48]
    2604:      	mov	w17, w14
    2608:      	mov	x30, x15
    260c:      	mov	x14, x12
    2610:      	mov	w15, w26
    2614:      	mov	x7, x24
    2618:      	cmp	w8, #0x39
    261c:      	b.hi	0x2ab0 <_gap_verify_graph+0x2a4c>
    2620:      	mov	x9, #0x80000000         ; =2147483648
    2624:      	and	x8, x30, #0xff
    2628:      	movk	x9, #0x2001, lsl #32
    262c:      	movk	x9, #0x3c0, lsl #48
    2630:      	lsr	x8, x9, x8
    2634:      	tbz	w8, #0x0, 0x2ab0 <_gap_verify_graph+0x2a4c>
    2638:      	mov	x1, x7
    263c:      	sub	w8, w1, #0x1f
    2640:      	and	w9, w8, #0xff
    2644:      	cmp	w9, #0x1b
    2648:      	b.hs	0x26a0 <_gap_verify_graph+0x263c>
    264c:      	mov	w9, #0x4003             ; =16387
    2650:      	movk	w9, #0x780, lsl #16
    2654:      	lsr	w8, w9, w8
    2658:      	tbz	w8, #0x0, 0x26a0 <_gap_verify_graph+0x263c>
    265c:      	mov	w8, #0x1                ; =1
    2660:      	b	0x26c8 <_gap_verify_graph+0x2664>
    2664:      	and	w8, w24, #0xff
    2668:      	cmp	w8, #0x41
    266c:      	b.eq	0x2684 <_gap_verify_graph+0x2620>
    2670:      	cmp	w8, #0x48
    2674:      	b.eq	0x2684 <_gap_verify_graph+0x2620>
    2678:      	sub	w8, w11, #0x55
    267c:      	cmp	w8, #0x3
    2680:      	b.hi	0x2748 <_gap_verify_graph+0x26e4>
    2684:      	add	x0, sp, #0x90
    2688:      	mov	x1, x19
    268c:      	mov	w2, w20
    2690:      	str	x5, [sp, #0x60]
    2694:      	mov	x26, x4
    2698:      	bl	0x2698 <_gap_verify_graph+0x2634>
		0000000000002698:  ARM64_RELOC_BRANCH26	_stogir.locals.validate
    269c:      	b	0xc18 <_gap_verify_graph+0xbb4>
    26a0:      	and	w8, w1, #0xff
    26a4:      	cmp	w8, #0x1d
    26a8:      	b.ne	0x26bc <_gap_verify_graph+0x2658>
    26ac:      	and	w11, w1, #0xff
    26b0:      	cmp	w17, #0x3
    26b4:      	b.eq	0x26e0 <_gap_verify_graph+0x267c>
    26b8:      	b	0x26e8 <_gap_verify_graph+0x2684>
    26bc:      	cmp	w8, #0x1e
    26c0:      	mov	w8, #0x2                ; =2
    26c4:      	cinc	w8, w8, eq
    26c8:      	cmp	w17, w8
    26cc:      	b.ne	0x26e8 <_gap_verify_graph+0x2684>
    26d0:      	and	w9, w1, #0xff
    26d4:      	cmp	w9, #0x1d
    26d8:      	b.ne	0x290c <_gap_verify_graph+0x28a8>
    26dc:      	and	w11, w1, #0xff
    26e0:      	lsr	x8, x10, #32
    26e4:      	b	0x291c <_gap_verify_graph+0x28b8>
    26e8:      	adrp	x24, 0x2000 <_gap_verify_graph+0x1f9c>
		00000000000026e8:  ARM64_RELOC_PAGE21	l_str.661
    26ec:      	add	x24, x24, #0x0
		00000000000026ec:  ARM64_RELOC_PAGEOFF12	l_str.661
    26f0:      	mov	w21, #0x2b              ; =43
    26f4:      	b	0x934 <_gap_verify_graph+0x8d0>
    26f8:      	ldr	x8, [x19, #0x30]
    26fc:      	ldr	x9, [x19, #0x58]
    2700:      	stp	x4, x10, [sp, #0x48]
    2704:      	stp	x16, x6, [sp, #0x30]
    2708:      	cmp	x8, x9
    270c:      	str	w26, [sp, #0x58]
    2710:      	str	x5, [sp, #0x60]
    2714:      	str	x0, [sp, #0x40]
    2718:      	b.ne	0x2754 <_gap_verify_graph+0x26f0>
    271c:      	asr	x9, x15, #32
    2720:      	cmn	x8, x9
    2724:      	b.lt	0x2754 <_gap_verify_graph+0x26f0>
    2728:      	ldr	x8, [x19, #0x50]
    272c:      	mvn	x9, x9
    2730:      	ldr	w8, [x8, x9, lsl #2]
    2734:      	cmp	w8, #0x0
    2738:      	b.le	0x2754 <_gap_verify_graph+0x26f0>
    273c:      	ldr	x8, [x19, #0x28]
    2740:      	eor	x9, x12, #0xffffffff
    2744:      	b	0xcc8 <_gap_verify_graph+0xc64>
    2748:      	mov	w0, wzr
    274c:      	str	wzr, [sp, #0x90]
    2750:      	b	0x35a0 <_gap_verify_graph+0x353c>
    2754:      	adrp	x24, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002754:  ARM64_RELOC_PAGE21	l_str.667
    2758:      	add	x24, x24, #0x0
		0000000000002758:  ARM64_RELOC_PAGEOFF12	l_str.667
    275c:      	mov	w21, #0x1b              ; =27
    2760:      	b	0x379c <_gap_verify_graph+0x3738>
    2764:      	mov	w21, #0x1b              ; =27
    2768:      	b	0x934 <_gap_verify_graph+0x8d0>
    276c:      	mov	w8, #0x36               ; =54
    2770:      	str	x8, [sp, #0x28]
    2774:      	adrp	x8, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002774:  ARM64_RELOC_PAGE21	l_str.669
    2778:      	add	x8, x8, #0x0
		0000000000002778:  ARM64_RELOC_PAGEOFF12	l_str.669
    277c:      	cmp	w11, #0x3f
    2780:      	str	x8, [sp, #0x20]
    2784:      	b.ne	0x2804 <_gap_verify_graph+0x27a0>
    2788:      	ldr	w8, [sp, #0x58]
    278c:      	cmp	w8, #0xe
    2790:      	b.lo	0x2aa0 <_gap_verify_graph+0x2a3c>
    2794:      	ldr	w10, [sp, #0x1c]
    2798:      	ldr	w9, [sp, #0x10]
    279c:      	sub	w8, w26, #0x1
    27a0:      	cmp	w10, #0x0
    27a4:      	csinv	w0, w9, wzr, ne
    27a8:      	cmp	w8, #0xd
    27ac:      	csel	w8, wzr, w10, hs
    27b0:      	cbz	w8, 0x2aa0 <_gap_verify_graph+0x2a3c>
    27b4:      	cmp	w0, w26
    27b8:      	b.eq	0x2fa4 <_gap_verify_graph+0x2f40>
    27bc:      	sub	w8, w0, #0x1
    27c0:      	cmp	w8, #0xa
    27c4:      	b.hi	0x2aa0 <_gap_verify_graph+0x2a3c>
    27c8:      	ldr	x4, [sp, #0x48]
    27cc:      	ldr	x5, [sp, #0x60]
    27d0:      	cmp	w26, #0xb
    27d4:      	adrp	x24, 0x2000 <_gap_verify_graph+0x1f9c>
		00000000000027d4:  ARM64_RELOC_PAGE21	l_str.670
    27d8:      	add	x24, x24, #0x0
		00000000000027d8:  ARM64_RELOC_PAGEOFF12	l_str.670
    27dc:      	mov	w21, #0x24              ; =36
    27e0:      	and	w3, w27, #0xff
    27e4:      	b.hi	0x934 <_gap_verify_graph+0x8d0>
    27e8:      	bl	0x27e8 <_gap_verify_graph+0x2784>
		00000000000027e8:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    27ec:      	mov	w21, w0
    27f0:      	mov	w0, w26
    27f4:      	bl	0x27f4 <_gap_verify_graph+0x2790>
		00000000000027f4:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    27f8:      	cmp	w21, w0
    27fc:      	b.ne	0x2aa8 <_gap_verify_graph+0x2a44>
    2800:      	b	0x2fa4 <_gap_verify_graph+0x2f40>
    2804:      	mov	w21, w11
    2808:      	cmp	w11, #0x3d
    280c:      	b.ne	0x2af8 <_gap_verify_graph+0x2a94>
    2810:      	cmp	w26, #0xe
    2814:      	b.lo	0x2e34 <_gap_verify_graph+0x2dd0>
    2818:      	ldr	w10, [sp, #0x1c]
    281c:      	ldr	w8, [sp, #0x58]
    2820:      	ldr	w9, [sp, #0x10]
    2824:      	cmp	w10, #0x0
    2828:      	sub	w8, w8, #0x1
    282c:      	csinv	w0, w9, wzr, ne
    2830:      	cmp	w8, #0xd
    2834:      	csel	w8, wzr, w10, hs
    2838:      	cbz	w8, 0x2e34 <_gap_verify_graph+0x2dd0>
    283c:      	ldr	w8, [sp, #0x58]
    2840:      	cmp	w0, w8
    2844:      	b.ne	0x2de0 <_gap_verify_graph+0x2d7c>
    2848:      	ldp	x9, x8, [sp, #0x20]
    284c:      	b	0x2e40 <_gap_verify_graph+0x2ddc>
    2850:      	tbz	w10, #0x1f, 0x2900 <_gap_verify_graph+0x289c>
    2854:      	ldr	x8, [x19, #0x30]
    2858:      	ldr	x9, [x19, #0x58]
    285c:      	cmp	x8, x9
    2860:      	b.ne	0x2900 <_gap_verify_graph+0x289c>
    2864:      	sxtw	x9, w10
    2868:      	cmn	x8, x9
    286c:      	b.lt	0x2900 <_gap_verify_graph+0x289c>
    2870:      	ldr	x8, [x19, #0x50]
    2874:      	mvn	x9, x9
    2878:      	ldr	w8, [x8, x9, lsl #2]
    287c:      	cmp	w8, #0x0
    2880:      	b.le	0x2900 <_gap_verify_graph+0x289c>
    2884:      	mvn	w8, w10
    2888:      	ldr	x9, [x19, #0x28]
    288c:      	ubfiz	x8, x8, #4, #32
    2890:      	ldr	x8, [x9, x8]
    2894:      	and	x9, x8, #0xff
    2898:      	cmp	x9, #0x68
    289c:      	b.ne	0x2900 <_gap_verify_graph+0x289c>
    28a0:      	lsr	x9, x8, #32
    28a4:      	mov	x8, x2
    28a8:      	tbz	w8, #0x1f, 0x2900 <_gap_verify_graph+0x289c>
    28ac:      	cbnz	w9, 0x2900 <_gap_verify_graph+0x289c>
    28b0:      	sub	x0, x29, #0x80
    28b4:      	mov	x1, x19
    28b8:      	mov	x2, x8
    28bc:      	mov	w3, #0x10               ; =16
    28c0:      	stp	x13, x8, [sp, #0x58]
    28c4:      	stp	x15, x14, [sp, #0x48]
    28c8:      	str	x16, [sp, #0x40]
    28cc:      	str	w17, [sp, #0x38]
    28d0:      	bl	0x28d0 <_gap_verify_graph+0x286c>
		00000000000028d0:  ARM64_RELOC_BRANCH26	_stogir.stack.constant-size-aligned
    28d4:      	ldp	x16, x15, [sp, #0x40]
    28d8:      	and	w12, w21, #0xff
    28dc:      	ldp	x14, x13, [sp, #0x50]
    28e0:      	ldur	w8, [x29, #-0x80]
    28e4:      	ldr	w17, [sp, #0x38]
    28e8:      	ldr	x2, [sp, #0x60]
    28ec:      	cmp	w8, #0x1
    28f0:      	b.eq	0x2900 <_gap_verify_graph+0x289c>
    28f4:      	ldur	x8, [x29, #-0x78]
    28f8:      	cmp	x8, #0x1
    28fc:      	b.ge	0x1a38 <_gap_verify_graph+0x19d4>
    2900:      	mov	w8, #0x26               ; =38
    2904:      	mov	w21, #0x26              ; =38
    2908:      	b	0x1b10 <_gap_verify_graph+0x1aac>
    290c:      	lsr	x8, x10, #32
    2910:      	cmp	w9, #0x1e
    2914:      	and	w11, w1, #0xff
    2918:      	csel	w8, w8, wzr, eq
    291c:      	sub	w9, w15, #0x10
    2920:      	mov	x21, x30
    2924:      	mov	x17, x10
    2928:      	cmp	w9, #0x6f
    292c:      	b.hi	0x2be4 <_gap_verify_graph+0x2b80>
    2930:      	and	w9, w1, #0xff
    2934:      	cmp	w9, #0x39
    2938:      	b.hi	0x2bb0 <_gap_verify_graph+0x2b4c>
    293c:      	mov	x10, #0x80000000        ; =2147483648
    2940:      	and	x9, x21, #0xff
    2944:      	movk	x10, #0x2001, lsl #32
    2948:      	movk	x10, #0x3c0, lsl #48
    294c:      	lsr	x9, x10, x9
    2950:      	tbz	w9, #0x0, 0x2bb0 <_gap_verify_graph+0x2b4c>
    2954:      	and	w9, w1, #0xff
    2958:      	cmp	w9, #0x39
    295c:      	b.hi	0x2c00 <_gap_verify_graph+0x2b9c>
    2960:      	mov	x10, #0x80000000        ; =2147483648
    2964:      	and	x9, x21, #0xff
    2968:      	movk	x10, #0x2001, lsl #32
    296c:      	movk	x10, #0x3c0, lsl #48
    2970:      	lsr	x9, x10, x9
    2974:      	tbz	w9, #0x0, 0x2c00 <_gap_verify_graph+0x2b9c>
    2978:      	and	w9, w1, #0xff
    297c:      	and	w11, w1, #0xff
    2980:      	mov	x13, x14
    2984:      	cmp	w9, #0x39
    2988:      	b.hi	0x3144 <_gap_verify_graph+0x30e0>
    298c:      	and	x9, x21, #0xff
    2990:      	lsr	x9, x10, x9
    2994:      	tbz	w9, #0x0, 0x3144 <_gap_verify_graph+0x30e0>
    2998:      	cmp	w2, #0xb
    299c:      	b.hi	0x3144 <_gap_verify_graph+0x30e0>
    29a0:      	cmp	w11, #0x2d
    29a4:      	b.eq	0x3158 <_gap_verify_graph+0x30f4>
    29a8:      	cmp	w2, #0x1
    29ac:      	b.ne	0x2cf8 <_gap_verify_graph+0x2c94>
    29b0:      	mov	x1, x7
    29b4:      	mov	w12, #0x37              ; =55
    29b8:      	adrp	x2, 0x2000 <_gap_verify_graph+0x1f9c>
		00000000000029b8:  ARM64_RELOC_PAGE21	l_str.653
    29bc:      	add	x2, x2, #0x0
		00000000000029bc:  ARM64_RELOC_PAGEOFF12	l_str.653
    29c0:      	and	w9, w1, #0xff
    29c4:      	and	w11, w1, #0xff
    29c8:      	mov	x13, x14
    29cc:      	mov	x21, x30
    29d0:      	b	0x31ec <_gap_verify_graph+0x3188>
    29d4:      	tbz	x15, #0x3f, 0x2a84 <_gap_verify_graph+0x2a20>
    29d8:      	ldr	x8, [x19, #0x30]
    29dc:      	ldr	x10, [x19, #0x58]
    29e0:      	cmp	x8, x10
    29e4:      	b.ne	0x2a84 <_gap_verify_graph+0x2a20>
    29e8:      	asr	x10, x15, #32
    29ec:      	cmn	x8, x10
    29f0:      	b.lt	0x2a84 <_gap_verify_graph+0x2a20>
    29f4:      	ldr	x8, [x19, #0x50]
    29f8:      	mvn	x10, x10
    29fc:      	ldr	w8, [x8, x10, lsl #2]
    2a00:      	cmp	w8, #0x0
    2a04:      	b.le	0x2a84 <_gap_verify_graph+0x2a20>
    2a08:      	ldr	x8, [x19, #0x28]
    2a0c:      	eor	x10, x12, #0xffffffff
    2a10:      	mov	x9, x0
    2a14:      	add	x8, x8, x10, lsl #4
    2a18:      	ldr	x8, [x8]
    2a1c:      	cmp	w11, #0x1
    2a20:      	b.ge	0xde4 <_gap_verify_graph+0xd80>
    2a24:      	tbz	w11, #0x1f, 0x2ba4 <_gap_verify_graph+0x2b40>
    2a28:      	ldr	x9, [x19, #0x30]
    2a2c:      	ldr	x10, [x19, #0x58]
    2a30:      	cmp	x9, x10
    2a34:      	b.ne	0x2ba4 <_gap_verify_graph+0x2b40>
    2a38:      	sxtw	x10, w11
    2a3c:      	cmn	x9, x10
    2a40:      	b.lt	0x2ba4 <_gap_verify_graph+0x2b40>
    2a44:      	ldr	x9, [x19, #0x50]
    2a48:      	mvn	x10, x10
    2a4c:      	ldr	w9, [x9, x10, lsl #2]
    2a50:      	cmp	w9, #0x0
    2a54:      	b.le	0x2ba4 <_gap_verify_graph+0x2b40>
    2a58:      	mvn	w9, w11
    2a5c:      	ldr	x10, [x19, #0x28]
    2a60:      	and	x9, x9, #0x7fffffff
    2a64:      	add	x9, x10, x9, lsl #4
    2a68:      	sub	w10, w14, #0xe
    2a6c:      	cmp	w10, #0xb
    2a70:      	b.ls	0xe28 <_gap_verify_graph+0xdc4>
    2a74:      	adrp	x24, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002a74:  ARM64_RELOC_PAGE21	l_str.664
    2a78:      	add	x24, x24, #0x0
		0000000000002a78:  ARM64_RELOC_PAGEOFF12	l_str.664
    2a7c:      	mov	w21, #0x33              ; =51
    2a80:      	b	0x2a90 <_gap_verify_graph+0x2a2c>
    2a84:      	adrp	x24, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002a84:  ARM64_RELOC_PAGE21	l_str.662
    2a88:      	add	x24, x24, #0x0
		0000000000002a88:  ARM64_RELOC_PAGEOFF12	l_str.662
    2a8c:      	mov	w21, #0x21              ; =33
    2a90:      	ldr	x4, [sp, #0x48]
    2a94:      	and	w3, w27, #0xff
    2a98:      	mov	x5, x26
    2a9c:      	b	0x934 <_gap_verify_graph+0x8d0>
    2aa0:      	adrp	x24, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002aa0:  ARM64_RELOC_PAGE21	l_str.670
    2aa4:      	add	x24, x24, #0x0
		0000000000002aa4:  ARM64_RELOC_PAGEOFF12	l_str.670
    2aa8:      	mov	w21, #0x24              ; =36
    2aac:      	b	0x379c <_gap_verify_graph+0x3738>
    2ab0:      	and	x8, x30, #0xfe
    2ab4:      	cmp	x8, #0x3a
    2ab8:      	b.eq	0x2638 <_gap_verify_graph+0x25d4>
    2abc:      	and	w8, w7, #0xff
    2ac0:      	cmp	w8, #0x35
    2ac4:      	b.hi	0x35ec <_gap_verify_graph+0x3588>
    2ac8:      	mov	x9, #0x3fc00000000000   ; =17944029765304320
    2acc:      	and	x8, x30, #0xff
    2ad0:      	adrp	x24, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002ad0:  ARM64_RELOC_PAGE21	l_str.661
    2ad4:      	add	x24, x24, #0x0
		0000000000002ad4:  ARM64_RELOC_PAGEOFF12	l_str.661
    2ad8:      	movk	x9, #0x7c00, lsl #16
    2adc:      	mov	w21, #0x2b              ; =43
    2ae0:      	lsr	x8, x9, x8
    2ae4:      	and	w3, w27, #0xff
    2ae8:      	tbnz	w8, #0x0, 0x2638 <_gap_verify_graph+0x25d4>
    2aec:      	b	0x934 <_gap_verify_graph+0x8d0>
    2af0:      	mov	w21, #0x1b              ; =27
    2af4:      	b	0x2528 <_gap_verify_graph+0x24c4>
    2af8:      	ldr	w8, [sp, #0x58]
    2afc:      	ldp	x10, x9, [sp, #0x20]
    2b00:      	cmp	w26, w8
    2b04:      	mov	w8, #0x27               ; =39
    2b08:      	csel	x8, x9, x8, eq
    2b0c:      	adrp	x9, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002b0c:  ARM64_RELOC_PAGE21	l_str.672
    2b10:      	add	x9, x9, #0x0
		0000000000002b10:  ARM64_RELOC_PAGEOFF12	l_str.672
    2b14:      	csel	x9, x10, x9, eq
    2b18:      	b	0x2e40 <_gap_verify_graph+0x2ddc>
    2b1c:      	and	w8, w24, #0xff
    2b20:      	sub	w9, w8, #0x5b
    2b24:      	cmp	w9, #0x2
    2b28:      	b.lo	0x2c6c <_gap_verify_graph+0x2c08>
    2b2c:      	sub	w9, w8, #0x5d
    2b30:      	cmp	w9, #0x2
    2b34:      	b.hs	0x2c94 <_gap_verify_graph+0x2c30>
    2b38:      	ldr	w8, [sp, #0x28]
    2b3c:      	adrp	x24, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002b3c:  ARM64_RELOC_PAGE21	l_str.691
    2b40:      	add	x24, x24, #0x0
		0000000000002b40:  ARM64_RELOC_PAGEOFF12	l_str.691
    2b44:      	mov	w21, #0x1a              ; =26
    2b48:      	cmp	w8, #0x3
    2b4c:      	b.ne	0x31a0 <_gap_verify_graph+0x313c>
    2b50:      	ldr	x5, [sp, #0x60]
    2b54:      	ldr	w8, [sp, #0x58]
    2b58:      	and	w3, w27, #0xff
    2b5c:      	mov	x4, x26
    2b60:      	cbnz	w8, 0x934 <_gap_verify_graph+0x8d0>
    2b64:      	ldr	x3, [sp, #0x50]
    2b68:      	add	x0, sp, #0x90
    2b6c:      	mov	x1, x19
    2b70:      	ldr	x2, [sp, #0x20]
    2b74:      	lsr	x4, x3, #32
    2b78:      	bl	0x2b78 <_gap_verify_graph+0x2b14>
		0000000000002b78:  ARM64_RELOC_BRANCH26	_stogir.vector.store-inputs
    2b7c:      	b	0xc18 <_gap_verify_graph+0xbb4>
    2b80:      	ldur	w8, [x29, #-0x90]
    2b84:      	cmp	w21, #0x6f
    2b88:      	str	w8, [sp, #0x58]
    2b8c:      	b.ne	0x2d34 <_gap_verify_graph+0x2cd0>
    2b90:      	ldr	w9, [sp, #0x58]
    2b94:      	mov	w8, wzr
    2b98:      	str	wzr, [sp, #0xf0]
    2b9c:      	str	w9, [sp, #0xf8]
    2ba0:      	b	0x191c <_gap_verify_graph+0x18b8>
    2ba4:      	adrp	x24, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002ba4:  ARM64_RELOC_PAGE21	l_str.663
    2ba8:      	add	x24, x24, #0x0
		0000000000002ba8:  ARM64_RELOC_PAGEOFF12	l_str.663
    2bac:      	b	0x2a8c <_gap_verify_graph+0x2a28>
    2bb0:      	ldr	w9, [sp, #0x48]
    2bb4:      	cmp	w9, #0x3a
    2bb8:      	b.eq	0x2954 <_gap_verify_graph+0x28f0>
    2bbc:      	and	w9, w1, #0xff
    2bc0:      	cmp	w9, #0x35
    2bc4:      	b.hi	0x29b0 <_gap_verify_graph+0x294c>
    2bc8:      	mov	x10, #0x3fc00000000000  ; =17944029765304320
    2bcc:      	and	x9, x30, #0xff
    2bd0:      	mov	x21, x30
    2bd4:      	movk	x10, #0x7c00, lsl #16
    2bd8:      	mov	x1, x7
    2bdc:      	lsr	x9, x10, x9
    2be0:      	tbnz	w9, #0x0, 0x2954 <_gap_verify_graph+0x28f0>
    2be4:      	and	w9, w1, #0xff
    2be8:      	mov	w12, #0x37              ; =55
    2bec:      	adrp	x2, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002bec:  ARM64_RELOC_PAGE21	l_str.653
    2bf0:      	add	x2, x2, #0x0
		0000000000002bf0:  ARM64_RELOC_PAGEOFF12	l_str.653
    2bf4:      	and	w11, w1, #0xff
    2bf8:      	mov	x13, x14
    2bfc:      	b	0x31ec <_gap_verify_graph+0x3188>
    2c00:      	sub	w9, w11, #0x31
    2c04:      	cmp	w9, #0x5
    2c08:      	b.hs	0x2d5c <_gap_verify_graph+0x2cf8>
    2c0c:      	sub	w9, w2, #0x2
    2c10:      	mov	x1, x7
    2c14:      	mov	x13, x14
    2c18:      	cmp	w9, #0x9
    2c1c:      	and	w11, w1, #0xff
    2c20:      	mov	x21, x30
    2c24:      	b.ls	0x3158 <_gap_verify_graph+0x30f4>
    2c28:      	b	0x31dc <_gap_verify_graph+0x3178>
    2c2c:      	ldr	x8, [x19, #0x30]
    2c30:      	ldr	x9, [x19, #0x58]
    2c34:      	cmp	x8, x9
    2c38:      	b.ne	0x2c64 <_gap_verify_graph+0x2c00>
    2c3c:      	sxtw	x9, w13
    2c40:      	cmn	x8, x9
    2c44:      	b.lt	0x2c64 <_gap_verify_graph+0x2c00>
    2c48:      	ldr	x8, [x19, #0x50]
    2c4c:      	mvn	x9, x9
    2c50:      	ldr	w8, [x8, x9, lsl #2]
    2c54:      	cmp	w8, #0x0
    2c58:      	b.le	0x2c64 <_gap_verify_graph+0x2c00>
    2c5c:      	mov	w24, #0x2e              ; =46
    2c60:      	b	0x1338 <_gap_verify_graph+0x12d4>
    2c64:      	mov	w24, #0x1d              ; =29
    2c68:      	b	0x1338 <_gap_verify_graph+0x12d4>
    2c6c:      	ldr	w8, [sp, #0x28]
    2c70:      	cmp	w8, #0x2
    2c74:      	b.ne	0x2d84 <_gap_verify_graph+0x2d20>
    2c78:      	ldr	w2, [sp, #0x58]
    2c7c:      	add	x0, sp, #0x90
    2c80:      	mov	x1, x19
    2c84:      	ldr	x3, [sp, #0x20]
    2c88:      	ldr	x4, [sp, #0x50]
    2c8c:      	bl	0x2c8c <_gap_verify_graph+0x2c28>
		0000000000002c8c:  ARM64_RELOC_BRANCH26	_stogir.vector.memory-inputs
    2c90:      	b	0xc18 <_gap_verify_graph+0xbb4>
    2c94:      	cmp	w8, #0x43
    2c98:      	b.ne	0x2d90 <_gap_verify_graph+0x2d2c>
    2c9c:      	ldr	w8, [sp, #0x1c]
    2ca0:      	ldr	w9, [sp, #0x58]
    2ca4:      	sub	w8, w8, #0x1
    2ca8:      	sub	w9, w9, #0x10
    2cac:      	cmp	w8, #0xd
    2cb0:      	mov	w8, #0x70               ; =112
    2cb4:      	ccmp	w9, w8, #0x2, lo
    2cb8:      	b.hs	0x305c <_gap_verify_graph+0x2ff8>
    2cbc:      	ldr	w0, [sp, #0x58]
    2cc0:      	bl	0x2cc0 <_gap_verify_graph+0x2c5c>
		0000000000002cc0:  ARM64_RELOC_BRANCH26	_stogir.types.size
    2cc4:      	ldr	w8, [sp, #0x28]
    2cc8:      	adrp	x9, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002cc8:  ARM64_RELOC_PAGE21	l_str.692
    2ccc:      	add	x9, x9, #0x0
		0000000000002ccc:  ARM64_RELOC_PAGEOFF12	l_str.692
    2cd0:      	cmp	w8, #0x3
    2cd4:      	ccmp	w0, #0x1, #0x8, hs
    2cd8:      	cset	w8, lt
    2cdc:      	cmp	w8, #0x0
    2ce0:      	adrp	x8, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002ce0:  ARM64_RELOC_PAGE21	l_str.693
    2ce4:      	add	x8, x8, #0x0
		0000000000002ce4:  ARM64_RELOC_PAGEOFF12	l_str.693
    2ce8:      	csel	x24, x8, x9, ne
    2cec:      	mov	w8, #0x20               ; =32
    2cf0:      	csel	x21, x8, xzr, ne
    2cf4:      	b	0x3068 <_gap_verify_graph+0x3004>
    2cf8:      	and	w9, w7, #0xff
    2cfc:      	cmp	w9, #0x36
    2d00:      	b.eq	0x30f8 <_gap_verify_graph+0x3094>
    2d04:      	cmp	w9, #0x20
    2d08:      	b.eq	0x312c <_gap_verify_graph+0x30c8>
    2d0c:      	mov	x1, x7
    2d10:      	cmp	w9, #0x1f
    2d14:      	mov	x13, x14
    2d18:      	and	w11, w1, #0xff
    2d1c:      	mov	x21, x30
    2d20:      	b.ne	0x3158 <_gap_verify_graph+0x30f4>
    2d24:      	cmp	w2, #0x6
    2d28:      	b.ne	0x3158 <_gap_verify_graph+0x30f4>
    2d2c:      	mov	w9, #0x1f               ; =31
    2d30:      	b	0x31e0 <_gap_verify_graph+0x317c>
    2d34:      	ldr	w3, [sp, #0x58]
    2d38:      	sub	x0, x29, #0xc0
    2d3c:      	mov	x1, x19
    2d40:      	ldr	x2, [sp, #0x60]
    2d44:      	bl	0x2d44 <_gap_verify_graph+0x2ce0>
		0000000000002d44:  ARM64_RELOC_BRANCH26	_stogir.switch.key
    2d48:      	ldur	w8, [x29, #-0xc0]
    2d4c:      	cmp	w8, #0x1
    2d50:      	b.ne	0x2da0 <_gap_verify_graph+0x2d3c>
    2d54:      	ldp	x9, x10, [x29, #-0xb8]
    2d58:      	b	0x1810 <_gap_verify_graph+0x17ac>
    2d5c:      	sub	w9, w11, #0x2e
    2d60:      	cmp	w9, #0x2
    2d64:      	b.hi	0x301c <_gap_verify_graph+0x2fb8>
    2d68:      	mov	x1, x7
    2d6c:      	cmp	w2, #0xc
    2d70:      	mov	x13, x14
    2d74:      	and	w11, w1, #0xff
    2d78:      	mov	x21, x30
    2d7c:      	b.lo	0x3158 <_gap_verify_graph+0x30f4>
    2d80:      	b	0x31dc <_gap_verify_graph+0x3178>
    2d84:      	adrp	x24, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002d84:  ARM64_RELOC_PAGE21	l_str.690
    2d88:      	add	x24, x24, #0x0
		0000000000002d88:  ARM64_RELOC_PAGEOFF12	l_str.690
    2d8c:      	b	0x319c <_gap_verify_graph+0x3138>
    2d90:      	adrp	x24, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002d90:  ARM64_RELOC_PAGE21	l_str.701
    2d94:      	add	x24, x24, #0x0
		0000000000002d94:  ARM64_RELOC_PAGEOFF12	l_str.701
    2d98:      	mov	w21, #0x28              ; =40
    2d9c:      	b	0x31a0 <_gap_verify_graph+0x313c>
    2da0:      	ldr	x8, [sp, #0x60]
    2da4:      	cmp	w21, #0x6d
    2da8:      	ldr	w3, [sp, #0x58]
    2dac:      	ldur	x25, [x29, #-0xb8]
    2db0:      	sub	x0, x29, #0x80
    2db4:      	mov	x1, x19
    2db8:      	lsr	x9, x8, #32
    2dbc:      	csel	w2, w8, w9, eq
    2dc0:      	bl	0x2dc0 <_gap_verify_graph+0x2d5c>
		0000000000002dc0:  ARM64_RELOC_BRANCH26	_stogir.switch.key
    2dc4:      	ldur	w8, [x29, #-0x80]
    2dc8:      	cmp	w8, #0x1
    2dcc:      	b.ne	0x316c <_gap_verify_graph+0x3108>
    2dd0:      	ldp	x9, x10, [x29, #-0x78]
    2dd4:      	str	w8, [sp, #0xf0]
    2dd8:      	stp	x9, x10, [sp, #0xf8]
    2ddc:      	b	0x35e4 <_gap_verify_graph+0x3580>
    2de0:      	sub	w8, w0, #0x1
    2de4:      	cmp	w8, #0xa
    2de8:      	b.hi	0x2e34 <_gap_verify_graph+0x2dd0>
    2dec:      	ldr	w8, [sp, #0x58]
    2df0:      	adrp	x9, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002df0:  ARM64_RELOC_PAGE21	l_str.671
    2df4:      	add	x9, x9, #0x0
		0000000000002df4:  ARM64_RELOC_PAGEOFF12	l_str.671
    2df8:      	cmp	w8, #0xb
    2dfc:      	mov	w8, #0x26               ; =38
    2e00:      	b.hi	0x2e40 <_gap_verify_graph+0x2ddc>
    2e04:      	bl	0x2e04 <_gap_verify_graph+0x2da0>
		0000000000002e04:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    2e08:      	mov	w24, w0
    2e0c:      	ldr	w0, [sp, #0x58]
    2e10:      	bl	0x2e10 <_gap_verify_graph+0x2dac>
		0000000000002e10:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    2e14:      	ldp	x10, x9, [sp, #0x20]
    2e18:      	cmp	w24, w0
    2e1c:      	mov	w8, #0x26               ; =38
    2e20:      	csel	x8, x8, x9, ne
    2e24:      	adrp	x9, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002e24:  ARM64_RELOC_PAGE21	l_str.671
    2e28:      	add	x9, x9, #0x0
		0000000000002e28:  ARM64_RELOC_PAGEOFF12	l_str.671
    2e2c:      	csel	x9, x9, x10, ne
    2e30:      	b	0x2e40 <_gap_verify_graph+0x2ddc>
    2e34:      	mov	w8, #0x26               ; =38
    2e38:      	adrp	x9, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002e38:  ARM64_RELOC_PAGE21	l_str.671
    2e3c:      	add	x9, x9, #0x0
		0000000000002e3c:  ARM64_RELOC_PAGEOFF12	l_str.671
    2e40:      	ldr	x10, [sp, #0x50]
    2e44:      	cmp	w10, #0x1
    2e48:      	b.lt	0x2ed0 <_gap_verify_graph+0x2e6c>
    2e4c:      	ldr	x10, [sp, #0x50]
    2e50:      	ldr	x11, [sp, #0x40]
    2e54:      	and	x10, x10, #0x7fffffff
    2e58:      	cmp	x11, x10
    2e5c:      	b.ls	0x2f88 <_gap_verify_graph+0x2f24>
    2e60:      	ldr	x11, [sp, #0x30]
    2e64:      	cmp	x11, x10
    2e68:      	mov	w11, #0x19              ; =25
    2e6c:      	str	x11, [sp, #0x28]
    2e70:      	adrp	x11, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002e70:  ARM64_RELOC_PAGE21	l_str.673
    2e74:      	add	x11, x11, #0x0
		0000000000002e74:  ARM64_RELOC_PAGEOFF12	l_str.673
    2e78:      	str	x11, [sp, #0x20]
    2e7c:      	b.ls	0x2f9c <_gap_verify_graph+0x2f38>
    2e80:      	ldr	w11, [x25, x10, lsl #2]
    2e84:      	tbnz	w11, #0x1f, 0x2f88 <_gap_verify_graph+0x2f24>
    2e88:      	ldr	x11, [sp, #0x38]
    2e8c:      	add	x10, x11, x10, lsl #4
    2e90:      	ldr	x12, [x10]
    2e94:      	ubfx	w11, w12, #8, #8
    2e98:      	sub	w13, w11, #0x1
    2e9c:      	cmp	w13, #0xb
    2ea0:      	b.hs	0x2f34 <_gap_verify_graph+0x2ed0>
    2ea4:      	and	w13, w12, #0xff
    2ea8:      	mov	w14, #0x46              ; =70
    2eac:      	cmp	w13, #0x48
    2eb0:      	ccmp	w13, w14, #0x4, ne
    2eb4:      	mov	w13, #0x2b              ; =43
    2eb8:      	csel	x8, x13, x8, eq
    2ebc:      	str	x8, [sp, #0x28]
    2ec0:      	adrp	x8, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002ec0:  ARM64_RELOC_PAGE21	l_str.674
    2ec4:      	add	x8, x8, #0x0
		0000000000002ec4:  ARM64_RELOC_PAGEOFF12	l_str.674
    2ec8:      	csel	x8, x8, x9, eq
    2ecc:      	b	0x2f44 <_gap_verify_graph+0x2ee0>
    2ed0:      	ldr	x10, [sp, #0x50]
    2ed4:      	tbz	w10, #0x1f, 0x2f88 <_gap_verify_graph+0x2f24>
    2ed8:      	ldr	x10, [x19, #0x30]
    2edc:      	ldr	x11, [x19, #0x58]
    2ee0:      	cmp	x10, x11
    2ee4:      	b.ne	0x2f88 <_gap_verify_graph+0x2f24>
    2ee8:      	ldr	x11, [sp, #0x50]
    2eec:      	sxtw	x11, w11
    2ef0:      	cmn	x10, x11
    2ef4:      	b.lt	0x2f88 <_gap_verify_graph+0x2f24>
    2ef8:      	ldr	x10, [x19, #0x50]
    2efc:      	mvn	x11, x11
    2f00:      	ldr	w10, [x10, x11, lsl #2]
    2f04:      	cmp	w10, #0x0
    2f08:      	b.le	0x2f88 <_gap_verify_graph+0x2f24>
    2f0c:      	ldr	x10, [sp, #0x50]
    2f10:      	ldr	x11, [x19, #0x28]
    2f14:      	mvn	w10, w10
    2f18:      	and	x10, x10, #0x7fffffff
    2f1c:      	add	x10, x11, x10, lsl #4
    2f20:      	ldr	x12, [x10]
    2f24:      	ubfx	w11, w12, #8, #8
    2f28:      	sub	w13, w11, #0x1
    2f2c:      	cmp	w13, #0xb
    2f30:      	b.lo	0x2ea4 <_gap_verify_graph+0x2e40>
    2f34:      	mov	w8, #0x2b               ; =43
    2f38:      	str	x8, [sp, #0x28]
    2f3c:      	adrp	x8, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002f3c:  ARM64_RELOC_PAGE21	l_str.674
    2f40:      	add	x8, x8, #0x0
		0000000000002f40:  ARM64_RELOC_PAGEOFF12	l_str.674
    2f44:      	str	x8, [sp, #0x20]
    2f48:      	ldr	x8, [sp, #0x50]
    2f4c:      	tbz	w8, #0x1f, 0x2f9c <_gap_verify_graph+0x2f38>
    2f50:      	and	w9, w12, #0xff
    2f54:      	ldr	x8, [x10, #0x8]
    2f58:      	cmp	w9, #0x49
    2f5c:      	b.eq	0x2f68 <_gap_verify_graph+0x2f04>
    2f60:      	cmp	w9, w11
    2f64:      	b.ne	0x2f9c <_gap_verify_graph+0x2f38>
    2f68:      	ldr	w9, [sp, #0x1c]
    2f6c:      	cbz	w9, 0x35b8 <_gap_verify_graph+0x3554>
    2f70:      	ldr	x9, [sp, #0x8]
    2f74:      	mov	w10, #0x1               ; =1
    2f78:      	lsr	w9, w9, #4
    2f7c:      	sub	w9, w9, #0x1
    2f80:      	lsl	w9, w10, w9
    2f84:      	b	0x3604 <_gap_verify_graph+0x35a0>
    2f88:      	mov	w8, #0x19               ; =25
    2f8c:      	str	x8, [sp, #0x28]
    2f90:      	adrp	x8, 0x2000 <_gap_verify_graph+0x1f9c>
		0000000000002f90:  ARM64_RELOC_PAGE21	l_str.673
    2f94:      	add	x8, x8, #0x0
		0000000000002f94:  ARM64_RELOC_PAGEOFF12	l_str.673
    2f98:      	str	x8, [sp, #0x20]
    2f9c:      	cmp	w21, #0x3d
    2fa0:      	b.ne	0x362c <_gap_verify_graph+0x35c8>
    2fa4:      	ldp	x24, x8, [sp, #0x20]
    2fa8:      	and	w3, w27, #0xff
    2fac:      	ldr	x4, [sp, #0x48]
    2fb0:      	ldr	x5, [sp, #0x60]
    2fb4:      	mov	x21, x8
    2fb8:      	cbnz	x8, 0x934 <_gap_verify_graph+0x8d0>
    2fbc:      	ldr	x0, [sp, #0x8]
    2fc0:      	str	wzr, [sp, #0x90]
    2fc4:      	b	0x35a0 <_gap_verify_graph+0x353c>
    2fc8:      	tbz	w2, #0x1f, 0x3010 <_gap_verify_graph+0x2fac>
    2fcc:      	ldr	x8, [x19, #0x30]
    2fd0:      	ldr	x10, [x19, #0x58]
    2fd4:      	cmp	x8, x10
    2fd8:      	b.ne	0x3010 <_gap_verify_graph+0x2fac>
    2fdc:      	sxtw	x10, w2
    2fe0:      	cmn	x8, x10
    2fe4:      	b.lt	0x3010 <_gap_verify_graph+0x2fac>
    2fe8:      	ldr	x8, [x19, #0x50]
    2fec:      	mvn	x10, x10
    2ff0:      	ldr	w8, [x8, x10, lsl #2]
    2ff4:      	cmp	w8, #0x0
    2ff8:      	b.le	0x3010 <_gap_verify_graph+0x2fac>
    2ffc:      	mvn	w8, w2
    3000:      	ldr	x10, [x19, #0x28]
    3004:      	and	x8, x8, #0x7fffffff
    3008:      	add	x8, x10, x8, lsl #4
    300c:      	b	0x24e4 <_gap_verify_graph+0x2480>
    3010:      	mov	w8, #0x1                ; =1
    3014:      	mov	w21, #0x18              ; =24
    3018:      	b	0x2528 <_gap_verify_graph+0x24c4>
    301c:      	and	w9, w7, #0xe00
    3020:      	cmp	w9, #0xc00
    3024:      	b.ne	0x31b8 <_gap_verify_graph+0x3154>
    3028:      	mov	x1, x7
    302c:      	mov	x13, x14
    3030:      	mov	x21, x30
    3034:      	and	w11, w1, #0xff
    3038:      	cmp	w11, #0x1e
    303c:      	b.ne	0x3158 <_gap_verify_graph+0x30f4>
    3040:      	mov	w1, #0x1e               ; =30
    3044:      	mov	w9, #0x1                ; =1
    3048:      	mov	w10, #0x1               ; =1
    304c:      	adrp	x2, 0x3000 <_gap_verify_graph+0x2f9c>
		000000000000304c:  ARM64_RELOC_PAGE21	l_str.653
    3050:      	add	x2, x2, #0x0
		0000000000003050:  ARM64_RELOC_PAGEOFF12	l_str.653
    3054:      	mov	w12, #0x37              ; =55
    3058:      	b	0x3204 <_gap_verify_graph+0x31a0>
    305c:      	adrp	x24, 0x3000 <_gap_verify_graph+0x2f9c>
		000000000000305c:  ARM64_RELOC_PAGE21	l_str.693
    3060:      	add	x24, x24, #0x0
		0000000000003060:  ARM64_RELOC_PAGEOFF12	l_str.693
    3064:      	mov	w21, #0x20              ; =32
    3068:      	sub	x0, x29, #0xc0
    306c:      	mov	x1, x19
    3070:      	ldr	x2, [sp, #0x20]
    3074:      	bl	0x3074 <_gap_verify_graph+0x3010>
		0000000000003074:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    3078:      	ldur	w8, [x29, #-0xc0]
    307c:      	cbz	w8, 0x3194 <_gap_verify_graph+0x3130>
    3080:      	ldr	x8, [sp, #0x20]
    3084:      	cmp	w8, #0x1
    3088:      	b.lt	0x30ec <_gap_verify_graph+0x3088>
    308c:      	ldur	w8, [x29, #-0xb8]
    3090:      	and	w8, w8, #0xfe
    3094:      	cmp	w8, #0x70
    3098:      	b.ne	0x30ec <_gap_verify_graph+0x3088>
    309c:      	ldr	x8, [sp, #0x20]
    30a0:      	ldr	w9, [sp, #0x28]
    30a4:      	ldr	w8, [x25, x8, lsl #2]
    30a8:      	add	w8, w8, #0x1
    30ac:      	cmp	w9, w8
    30b0:      	b.ne	0x30ec <_gap_verify_graph+0x3088>
    30b4:      	ldr	x5, [sp, #0x60]
    30b8:      	and	w3, w27, #0xff
    30bc:      	mov	x4, x26
    30c0:      	cbnz	x21, 0x934 <_gap_verify_graph+0x8d0>
    30c4:      	ldr	w8, [sp, #0x28]
    30c8:      	cmp	w8, #0x2
    30cc:      	b.hs	0x3804 <_gap_verify_graph+0x37a0>
    30d0:      	ldr	w0, [sp, #0x58]
    30d4:      	str	wzr, [sp, #0x90]
    30d8:      	bl	0x30d8 <_gap_verify_graph+0x3074>
		00000000000030d8:  ARM64_RELOC_BRANCH26	_stogir.types.size
    30dc:      	ldr	x5, [sp, #0x60]
    30e0:      	and	w3, w27, #0xff
    30e4:      	mov	x4, x26
    30e8:      	b	0x35a0 <_gap_verify_graph+0x353c>
    30ec:      	adrp	x24, 0x3000 <_gap_verify_graph+0x2f9c>
		00000000000030ec:  ARM64_RELOC_PAGE21	l_str.695
    30f0:      	add	x24, x24, #0x0
		00000000000030f0:  ARM64_RELOC_PAGEOFF12	l_str.695
    30f4:      	b	0x319c <_gap_verify_graph+0x3138>
    30f8:      	cmp	w2, #0xb
    30fc:      	b.hi	0x37f0 <_gap_verify_graph+0x378c>
    3100:      	mov	w10, #0xe78             ; =3704
    3104:      	mov	x1, x7
    3108:      	mov	w12, #0x37              ; =55
    310c:      	lsr	w10, w10, w2
    3110:      	adrp	x2, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003110:  ARM64_RELOC_PAGE21	l_str.653
    3114:      	add	x2, x2, #0x0
		0000000000003114:  ARM64_RELOC_PAGEOFF12	l_str.653
    3118:      	and	w11, w1, #0xff
    311c:      	mov	x13, x14
    3120:      	mov	x21, x30
    3124:      	tbnz	w10, #0x0, 0x3158 <_gap_verify_graph+0x30f4>
    3128:      	b	0x31ec <_gap_verify_graph+0x3188>
    312c:      	mov	x1, x7
    3130:      	cmp	w2, #0x6
    3134:      	mov	x13, x14
    3138:      	and	w11, w1, #0xff
    313c:      	mov	x21, x30
    3140:      	b.hi	0x3158 <_gap_verify_graph+0x30f4>
    3144:      	and	w9, w1, #0xe00
    3148:      	cmp	w9, #0xc00
    314c:      	mov	w9, #0x21               ; =33
    3150:      	ccmp	w11, w9, #0x2, eq
    3154:      	b.hs	0x31dc <_gap_verify_graph+0x3178>
    3158:      	mov	x12, xzr
    315c:      	and	w9, w1, #0xff
    3160:      	adrp	x2, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003160:  ARM64_RELOC_PAGE21	l_str.652
    3164:      	add	x2, x2, #0x0
		0000000000003164:  ARM64_RELOC_PAGEOFF12	l_str.652
    3168:      	b	0x31ec <_gap_verify_graph+0x3188>
    316c:      	ldur	x8, [x29, #-0x78]
    3170:      	cmp	x25, x8
    3174:      	b.ls	0x35d4 <_gap_verify_graph+0x3570>
    3178:      	adrp	x9, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003178:  ARM64_RELOC_PAGE21	l_str.602
    317c:      	add	x10, x9, #0x0
		000000000000317c:  ARM64_RELOC_PAGEOFF12	l_str.602
    3180:      	mov	w8, #0x1                ; =1
    3184:      	mov	w9, #0x1a               ; =26
    3188:      	str	w8, [sp, #0xf0]
    318c:      	stp	x10, x9, [sp, #0xf8]
    3190:      	b	0x35e4 <_gap_verify_graph+0x3580>
    3194:      	adrp	x24, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003194:  ARM64_RELOC_PAGE21	l_str.694
    3198:      	add	x24, x24, #0x0
		0000000000003198:  ARM64_RELOC_PAGEOFF12	l_str.694
    319c:      	mov	w21, #0x19              ; =25
    31a0:      	ldr	x5, [sp, #0x60]
    31a4:      	and	w3, w27, #0xff
    31a8:      	mov	x4, x26
    31ac:      	b	0x934 <_gap_verify_graph+0x8d0>
    31b0:      	mov	w21, #0x18              ; =24
    31b4:      	b	0x2528 <_gap_verify_graph+0x24c4>
    31b8:      	ldr	w10, [sp, #0x48]
    31bc:      	cmp	w2, #0x1
    31c0:      	mov	w9, #0x3a               ; =58
    31c4:      	mov	x1, x7
    31c8:      	mov	x13, x14
    31cc:      	mov	x21, x30
    31d0:      	ccmp	w10, w9, #0x4, eq
    31d4:      	and	w11, w1, #0xff
    31d8:      	b.eq	0x3158 <_gap_verify_graph+0x30f4>
    31dc:      	and	w9, w1, #0xff
    31e0:      	mov	w12, #0x37              ; =55
    31e4:      	adrp	x2, 0x3000 <_gap_verify_graph+0x2f9c>
		00000000000031e4:  ARM64_RELOC_PAGE21	l_str.653
    31e8:      	add	x2, x2, #0x0
		00000000000031e8:  ARM64_RELOC_PAGEOFF12	l_str.653
    31ec:      	sub	w10, w11, #0x36
    31f0:      	sub	w9, w9, #0x1d
    31f4:      	cmn	w10, #0x5
    31f8:      	cset	w10, lo
    31fc:      	cmp	w9, #0x2
    3200:      	cset	w9, lo
    3204:      	mov	x3, x1
    3208:      	cmp	w13, #0x0
    320c:      	b.le	0x3288 <_gap_verify_graph+0x3224>
    3210:      	cmp	x0, x13
    3214:      	b.ls	0x332c <_gap_verify_graph+0x32c8>
    3218:      	cmp	x16, x13
    321c:      	mov	w11, #0x21              ; =33
    3220:      	adrp	x1, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003220:  ARM64_RELOC_PAGE21	l_str.654
    3224:      	add	x1, x1, #0x0
		0000000000003224:  ARM64_RELOC_PAGEOFF12	l_str.654
    3228:      	mov	x13, x17
    322c:      	b.ls	0x333c <_gap_verify_graph+0x32d8>
    3230:      	ldr	w13, [x25, x14, lsl #2]
    3234:      	mov	x11, x6
    3238:      	tbnz	w13, #0x1f, 0x34a8 <_gap_verify_graph+0x3444>
    323c:      	lsl	x13, x14, #4
    3240:      	ldr	x11, [x11, x13]
    3244:      	lsr	w13, w11, #8
    3248:      	cmp	w15, w13, uxtb
    324c:      	b.ne	0x32d8 <_gap_verify_graph+0x3274>
    3250:      	and	w11, w11, #0xff
    3254:      	cmp	w11, #0x46
    3258:      	b.eq	0x32d8 <_gap_verify_graph+0x3274>
    325c:      	cmp	w11, #0x48
    3260:      	mov	w11, #0x32              ; =50
    3264:      	adrp	x1, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003264:  ARM64_RELOC_PAGE21	l_str.655
    3268:      	add	x1, x1, #0x0
		0000000000003268:  ARM64_RELOC_PAGEOFF12	l_str.655
    326c:      	mov	x13, x17
    3270:      	b.eq	0x333c <_gap_verify_graph+0x32d8>
    3274:      	mov	x11, x12
    3278:      	mov	x1, x2
    327c:      	cmp	w13, #0x1
    3280:      	b.ge	0x3344 <_gap_verify_graph+0x32e0>
    3284:      	b	0x32f0 <_gap_verify_graph+0x328c>
    3288:      	tbz	x21, #0x3f, 0x332c <_gap_verify_graph+0x32c8>
    328c:      	ldr	x11, [x19, #0x30]
    3290:      	ldr	x13, [x19, #0x58]
    3294:      	cmp	x11, x13
    3298:      	b.ne	0x332c <_gap_verify_graph+0x32c8>
    329c:      	asr	x13, x30, #32
    32a0:      	cmn	x11, x13
    32a4:      	b.lt	0x332c <_gap_verify_graph+0x32c8>
    32a8:      	ldr	x11, [x19, #0x50]
    32ac:      	mvn	x13, x13
    32b0:      	ldr	w11, [x11, x13, lsl #2]
    32b4:      	cmp	w11, #0x1
    32b8:      	b.lt	0x332c <_gap_verify_graph+0x32c8>
    32bc:      	ldr	x11, [x19, #0x28]
    32c0:      	eor	x14, x14, #0xffffffff
    32c4:      	lsl	x13, x14, #4
    32c8:      	ldr	x11, [x11, x13]
    32cc:      	lsr	w13, w11, #8
    32d0:      	cmp	w15, w13, uxtb
    32d4:      	b.eq	0x3250 <_gap_verify_graph+0x31ec>
    32d8:      	mov	w11, #0x32              ; =50
    32dc:      	adrp	x1, 0x3000 <_gap_verify_graph+0x2f9c>
		00000000000032dc:  ARM64_RELOC_PAGE21	l_str.655
    32e0:      	add	x1, x1, #0x0
		00000000000032e0:  ARM64_RELOC_PAGEOFF12	l_str.655
    32e4:      	mov	x13, x17
    32e8:      	cmp	w13, #0x1
    32ec:      	b.ge	0x3344 <_gap_verify_graph+0x32e0>
    32f0:      	tbnz	w13, #0x1f, 0x33f8 <_gap_verify_graph+0x3394>
    32f4:      	and	w10, w3, #0xff
    32f8:      	cmp	w10, #0x39
    32fc:      	b.hi	0x352c <_gap_verify_graph+0x34c8>
    3300:      	mov	x12, #0x80000000        ; =2147483648
    3304:      	mov	w10, w3
    3308:      	mov	x2, x1
    330c:      	movk	x12, #0x2001, lsl #32
    3310:      	and	x10, x10, #0xff
    3314:      	movk	x12, #0x3c0, lsl #48
    3318:      	lsr	x10, x12, x10
    331c:      	mov	x12, x11
    3320:      	tbz	w10, #0x0, 0x352c <_gap_verify_graph+0x34c8>
    3324:      	cbnz	w8, 0x3374 <_gap_verify_graph+0x3310>
    3328:      	b	0x3588 <_gap_verify_graph+0x3524>
    332c:      	mov	w11, #0x21              ; =33
    3330:      	adrp	x1, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003330:  ARM64_RELOC_PAGE21	l_str.654
    3334:      	add	x1, x1, #0x0
		0000000000003334:  ARM64_RELOC_PAGEOFF12	l_str.654
    3338:      	mov	x13, x17
    333c:      	cmp	w13, #0x1
    3340:      	b.lt	0x32f0 <_gap_verify_graph+0x328c>
    3344:      	and	w12, w3, #0xff
    3348:      	cmp	w12, #0x39
    334c:      	b.hi	0x34bc <_gap_verify_graph+0x3458>
    3350:      	mov	x13, #0x80000000        ; =2147483648
    3354:      	and	x12, x3, #0xff
    3358:      	movk	x13, #0x2001, lsl #32
    335c:      	movk	x13, #0x3c0, lsl #48
    3360:      	lsr	x12, x13, x12
    3364:      	tbz	w12, #0x0, 0x34bc <_gap_verify_graph+0x3458>
    3368:      	mov	x12, x11
    336c:      	mov	x2, x1
    3370:      	cbz	w8, 0x3588 <_gap_verify_graph+0x3524>
    3374:      	cbz	w9, 0x33e4 <_gap_verify_graph+0x3380>
    3378:      	cmp	w8, #0x1
    337c:      	b.lt	0x3478 <_gap_verify_graph+0x3414>
    3380:      	mov	w8, w8
    3384:      	cmp	x0, x8
    3388:      	b.ls	0x3494 <_gap_verify_graph+0x3430>
    338c:      	cmp	x16, x8
    3390:      	adrp	x24, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003390:  ARM64_RELOC_PAGE21	l_str.657
    3394:      	add	x24, x24, #0x0
		0000000000003394:  ARM64_RELOC_PAGEOFF12	l_str.657
    3398:      	mov	w21, #0x1d              ; =29
    339c:      	and	w3, w27, #0xff
    33a0:      	b.ls	0x934 <_gap_verify_graph+0x8d0>
    33a4:      	ldr	w9, [x25, x8, lsl #2]
    33a8:      	tbnz	w9, #0x1f, 0x349c <_gap_verify_graph+0x3438>
    33ac:      	lsl	x8, x8, #4
    33b0:      	ldr	w8, [x6, x8]
    33b4:      	and	w9, w8, #0xfe
    33b8:      	and	w8, w8, #0xff
    33bc:      	sub	w9, w9, #0x68
    33c0:      	sub	w8, w8, #0x65
    33c4:      	cmp	w9, #0x9
    33c8:      	ccmp	w8, #0x1, #0x0, hi
    33cc:      	b.ls	0x3588 <_gap_verify_graph+0x3524>
    33d0:      	adrp	x24, 0x3000 <_gap_verify_graph+0x2f9c>
		00000000000033d0:  ARM64_RELOC_PAGE21	l_str.658
    33d4:      	add	x24, x24, #0x0
		00000000000033d4:  ARM64_RELOC_PAGEOFF12	l_str.658
    33d8:      	mov	w21, #0x34              ; =52
    33dc:      	and	w3, w27, #0xff
    33e0:      	b	0x934 <_gap_verify_graph+0x8d0>
    33e4:      	adrp	x24, 0x3000 <_gap_verify_graph+0x2f9c>
		00000000000033e4:  ARM64_RELOC_PAGE21	l_str.656
    33e8:      	add	x24, x24, #0x0
		00000000000033e8:  ARM64_RELOC_PAGEOFF12	l_str.656
    33ec:      	mov	w21, #0x23              ; =35
    33f0:      	and	w3, w27, #0xff
    33f4:      	b	0x934 <_gap_verify_graph+0x8d0>
    33f8:      	and	w12, w3, #0xff
    33fc:      	cmp	w12, #0x39
    3400:      	b.hi	0x3420 <_gap_verify_graph+0x33bc>
    3404:      	mov	x13, #0x80000000        ; =2147483648
    3408:      	mov	w12, w3
    340c:      	movk	x13, #0x2001, lsl #32
    3410:      	and	x12, x12, #0xff
    3414:      	movk	x13, #0x3c0, lsl #48
    3418:      	lsr	x12, x13, x12
    341c:      	tbnz	w12, #0x0, 0x3368 <_gap_verify_graph+0x3304>
    3420:      	ldr	x12, [x19, #0x30]
    3424:      	ldr	x13, [x19, #0x58]
    3428:      	cmp	x12, x13
    342c:      	b.ne	0x352c <_gap_verify_graph+0x34c8>
    3430:      	mov	w13, w17
    3434:      	adrp	x2, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003434:  ARM64_RELOC_PAGE21	l_str.654
    3438:      	add	x2, x2, #0x0
		0000000000003438:  ARM64_RELOC_PAGEOFF12	l_str.654
    343c:      	sxtw	x13, w13
    3440:      	neg	x14, x13
    3444:      	cmp	x12, x14
    3448:      	mov	w12, #0x21              ; =33
    344c:      	b.lt	0x3324 <_gap_verify_graph+0x32c0>
    3450:      	ldr	x12, [x19, #0x50]
    3454:      	mvn	x13, x13
    3458:      	ldr	w12, [x12, x13, lsl #2]
    345c:      	cmp	w12, #0x1
    3460:      	b.lt	0x37ac <_gap_verify_graph+0x3748>
    3464:      	mvn	w12, w17
    3468:      	ldr	x13, [x19, #0x28]
    346c:      	lsl	x12, x12, #4
    3470:      	ldr	x12, [x13, x12]
    3474:      	b	0x34ec <_gap_verify_graph+0x3488>
    3478:      	ldr	x9, [x19, #0x30]
    347c:      	ldr	x10, [x19, #0x58]
    3480:      	cmp	x9, x10
    3484:      	b.ne	0x3494 <_gap_verify_graph+0x3430>
    3488:      	sxtw	x8, w8
    348c:      	cmn	x9, x8
    3490:      	b.ge	0x3540 <_gap_verify_graph+0x34dc>
    3494:      	adrp	x24, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003494:  ARM64_RELOC_PAGE21	l_str.657
    3498:      	add	x24, x24, #0x0
		0000000000003498:  ARM64_RELOC_PAGEOFF12	l_str.657
    349c:      	mov	w21, #0x1d              ; =29
    34a0:      	and	w3, w27, #0xff
    34a4:      	b	0x934 <_gap_verify_graph+0x8d0>
    34a8:      	mov	w11, #0x21              ; =33
    34ac:      	mov	x13, x17
    34b0:      	cmp	w13, #0x1
    34b4:      	b.ge	0x3344 <_gap_verify_graph+0x32e0>
    34b8:      	b	0x32f0 <_gap_verify_graph+0x328c>
    34bc:      	mov	w13, w17
    34c0:      	cmp	x0, x13
    34c4:      	b.ls	0x352c <_gap_verify_graph+0x34c8>
    34c8:      	cmp	x16, x13
    34cc:      	mov	w12, #0x21              ; =33
    34d0:      	adrp	x2, 0x3000 <_gap_verify_graph+0x2f9c>
		00000000000034d0:  ARM64_RELOC_PAGE21	l_str.654
    34d4:      	add	x2, x2, #0x0
		00000000000034d4:  ARM64_RELOC_PAGEOFF12	l_str.654
    34d8:      	b.ls	0x3324 <_gap_verify_graph+0x32c0>
    34dc:      	ldr	w12, [x25, x13, lsl #2]
    34e0:      	tbnz	w12, #0x1f, 0x35b0 <_gap_verify_graph+0x354c>
    34e4:      	lsl	x12, x13, #4
    34e8:      	ldr	x12, [x6, x12]
    34ec:      	ubfx	w13, w12, #8, #8
    34f0:      	cmp	w13, w15
    34f4:      	b.eq	0x3508 <_gap_verify_graph+0x34a4>
    34f8:      	sub	w13, w13, #0xc
    34fc:      	cmn	w13, #0xb
    3500:      	csinc	w10, w10, wzr, hs
    3504:      	tbnz	w10, #0x0, 0x3578 <_gap_verify_graph+0x3514>
    3508:      	and	w10, w12, #0xff
    350c:      	cmp	w10, #0x46
    3510:      	b.eq	0x3578 <_gap_verify_graph+0x3514>
    3514:      	cmp	w10, #0x48
    3518:      	mov	w12, #0x32              ; =50
    351c:      	adrp	x2, 0x3000 <_gap_verify_graph+0x2f9c>
		000000000000351c:  ARM64_RELOC_PAGE21	l_str.655
    3520:      	add	x2, x2, #0x0
		0000000000003520:  ARM64_RELOC_PAGEOFF12	l_str.655
    3524:      	b.eq	0x3324 <_gap_verify_graph+0x32c0>
    3528:      	b	0x3368 <_gap_verify_graph+0x3304>
    352c:      	mov	w12, #0x21              ; =33
    3530:      	adrp	x2, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003530:  ARM64_RELOC_PAGE21	l_str.654
    3534:      	add	x2, x2, #0x0
		0000000000003534:  ARM64_RELOC_PAGEOFF12	l_str.654
    3538:      	cbnz	w8, 0x3374 <_gap_verify_graph+0x3310>
    353c:      	b	0x3588 <_gap_verify_graph+0x3524>
    3540:      	ldr	x9, [x19, #0x50]
    3544:      	mvn	x8, x8
    3548:      	and	w3, w27, #0xff
    354c:      	ldr	w8, [x9, x8, lsl #2]
    3550:      	adrp	x9, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003550:  ARM64_RELOC_PAGE21	l_str.658
    3554:      	add	x9, x9, #0x0
		0000000000003554:  ARM64_RELOC_PAGEOFF12	l_str.658
    3558:      	cmp	w8, #0x0
    355c:      	adrp	x8, 0x3000 <_gap_verify_graph+0x2f9c>
		000000000000355c:  ARM64_RELOC_PAGE21	l_str.657
    3560:      	add	x8, x8, #0x0
		0000000000003560:  ARM64_RELOC_PAGEOFF12	l_str.657
    3564:      	csel	x24, x9, x8, gt
    3568:      	mov	w8, #0x1d               ; =29
    356c:      	mov	w9, #0x34               ; =52
    3570:      	csel	x21, x9, x8, gt
    3574:      	b	0x934 <_gap_verify_graph+0x8d0>
    3578:      	mov	w12, #0x32              ; =50
    357c:      	adrp	x2, 0x3000 <_gap_verify_graph+0x2f9c>
		000000000000357c:  ARM64_RELOC_PAGE21	l_str.655
    3580:      	add	x2, x2, #0x0
		0000000000003580:  ARM64_RELOC_PAGEOFF12	l_str.655
    3584:      	cbnz	w8, 0x3374 <_gap_verify_graph+0x3310>
    3588:      	mov	x24, x2
    358c:      	mov	x21, x12
    3590:      	and	w3, w27, #0xff
    3594:      	cbnz	x12, 0x934 <_gap_verify_graph+0x8d0>
    3598:      	str	wzr, [sp, #0x90]
    359c:      	mov	w0, w15
    35a0:      	mov	x21, xzr
    35a4:      	str	w0, [sp, #0x98]
    35a8:      	sub	x25, x29, #0x80
    35ac:      	b	0x944 <_gap_verify_graph+0x8e0>
    35b0:      	mov	w12, #0x21              ; =33
    35b4:      	b	0x3324 <_gap_verify_graph+0x32c0>
    35b8:      	ldr	x9, [sp, #0x8]
    35bc:      	cmp	w9, #0xd
    35c0:      	b.hi	0x3600 <_gap_verify_graph+0x359c>
    35c4:      	ldr	x9, [sp, #0x8]
    35c8:      	cmp	w9, #0x0
    35cc:      	cset	w9, ne
    35d0:      	b	0x3604 <_gap_verify_graph+0x35a0>
    35d4:      	ldr	w9, [sp, #0x58]
    35d8:      	mov	w8, wzr
    35dc:      	str	wzr, [sp, #0xf0]
    35e0:      	str	w9, [sp, #0xf8]
    35e4:      	sub	x25, x29, #0x80
    35e8:      	b	0x191c <_gap_verify_graph+0x18b8>
    35ec:      	adrp	x24, 0x3000 <_gap_verify_graph+0x2f9c>
		00000000000035ec:  ARM64_RELOC_PAGE21	l_str.661
    35f0:      	add	x24, x24, #0x0
		00000000000035f0:  ARM64_RELOC_PAGEOFF12	l_str.661
    35f4:      	mov	w21, #0x2b              ; =43
    35f8:      	and	w3, w27, #0xff
    35fc:      	b	0x934 <_gap_verify_graph+0x8d0>
    3600:      	mov	w9, #-0x1               ; =-1
    3604:      	cmp	x8, w9, sxtw
    3608:      	ldp	x9, x11, [sp, #0x20]
    360c:      	mov	w8, #0x28               ; =40
    3610:      	csel	x10, x8, x11, hs
    3614:      	adrp	x8, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003614:  ARM64_RELOC_PAGE21	l_str.675
    3618:      	add	x8, x8, #0x0
		0000000000003618:  ARM64_RELOC_PAGEOFF12	l_str.675
    361c:      	csel	x9, x8, x9, hs
    3620:      	stp	x9, x10, [sp, #0x20]
    3624:      	cmp	w21, #0x3d
    3628:      	b.eq	0x2fa4 <_gap_verify_graph+0x2f40>
    362c:      	ldr	x8, [sp, #0x50]
    3630:      	lsr	x8, x8, #32
    3634:      	cmp	w8, #0x1
    3638:      	b.lt	0x3728 <_gap_verify_graph+0x36c4>
    363c:      	ldr	x9, [sp, #0x40]
    3640:      	cmp	x9, x8
    3644:      	b.ls	0x3790 <_gap_verify_graph+0x372c>
    3648:      	ldr	x9, [sp, #0x30]
    364c:      	ldr	x4, [sp, #0x48]
    3650:      	adrp	x24, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003650:  ARM64_RELOC_PAGE21	l_str.676
    3654:      	add	x24, x24, #0x0
		0000000000003654:  ARM64_RELOC_PAGEOFF12	l_str.676
    3658:      	ldr	x5, [sp, #0x60]
    365c:      	mov	w21, #0x20              ; =32
    3660:      	cmp	x9, x8
    3664:      	and	w3, w27, #0xff
    3668:      	b.ls	0x934 <_gap_verify_graph+0x8d0>
    366c:      	ldr	w9, [x25, x8, lsl #2]
    3670:      	tbnz	w9, #0x1f, 0x3798 <_gap_verify_graph+0x3734>
    3674:      	ldr	x9, [sp, #0x38]
    3678:      	add	x8, x9, x8, lsl #4
    367c:      	ldr	x8, [x8]
    3680:      	and	w9, w8, #0xff
    3684:      	cmp	w9, #0x46
    3688:      	b.eq	0x3780 <_gap_verify_graph+0x371c>
    368c:      	ldr	x4, [sp, #0x48]
    3690:      	ldr	x5, [sp, #0x60]
    3694:      	cmp	w9, #0x48
    3698:      	adrp	x24, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003698:  ARM64_RELOC_PAGE21	l_str.677
    369c:      	add	x24, x24, #0x0
		000000000000369c:  ARM64_RELOC_PAGEOFF12	l_str.677
    36a0:      	mov	w21, #0x27              ; =39
    36a4:      	and	w3, w27, #0xff
    36a8:      	b.eq	0x934 <_gap_verify_graph+0x8d0>
    36ac:      	ldr	w9, [sp, #0x58]
    36b0:      	cmp	w9, #0xe
    36b4:      	b.lo	0x3720 <_gap_verify_graph+0x36bc>
    36b8:      	ubfx	w25, w8, #8, #8
    36bc:      	ldr	w10, [sp, #0x1c]
    36c0:      	ldr	w9, [sp, #0x10]
    36c4:      	cmp	w10, #0x0
    36c8:      	sub	w8, w25, #0x1
    36cc:      	csinv	w0, w9, wzr, ne
    36d0:      	cmp	w8, #0xd
    36d4:      	csel	w8, wzr, w10, hs
    36d8:      	cbz	w8, 0x3720 <_gap_verify_graph+0x36bc>
    36dc:      	cmp	w0, w25
    36e0:      	b.eq	0x2fa4 <_gap_verify_graph+0x2f40>
    36e4:      	sub	w8, w0, #0x1
    36e8:      	cmp	w8, #0xa
    36ec:      	b.hi	0x3720 <_gap_verify_graph+0x36bc>
    36f0:      	ldr	x4, [sp, #0x48]
    36f4:      	ldr	x5, [sp, #0x60]
    36f8:      	cmp	w25, #0xb
    36fc:      	mov	w21, #0x27              ; =39
    3700:      	and	w3, w27, #0xff
    3704:      	b.hi	0x934 <_gap_verify_graph+0x8d0>
    3708:      	bl	0x3708 <_gap_verify_graph+0x36a4>
		0000000000003708:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    370c:      	mov	w21, w0
    3710:      	mov	w0, w25
    3714:      	bl	0x3714 <_gap_verify_graph+0x36b0>
		0000000000003714:  ARM64_RELOC_BRANCH26	_stogir.types.scalar-size
    3718:      	cmp	w21, w0
    371c:      	b.eq	0x2fa4 <_gap_verify_graph+0x2f40>
    3720:      	mov	w21, #0x27              ; =39
    3724:      	b	0x379c <_gap_verify_graph+0x3738>
    3728:      	ldr	x9, [sp, #0x50]
    372c:      	tbz	x9, #0x3f, 0x3790 <_gap_verify_graph+0x372c>
    3730:      	ldr	x9, [x19, #0x30]
    3734:      	ldr	x10, [x19, #0x58]
    3738:      	cmp	x9, x10
    373c:      	b.ne	0x3790 <_gap_verify_graph+0x372c>
    3740:      	ldr	x10, [sp, #0x50]
    3744:      	asr	x10, x10, #32
    3748:      	cmn	x9, x10
    374c:      	b.lt	0x3790 <_gap_verify_graph+0x372c>
    3750:      	ldr	x9, [x19, #0x50]
    3754:      	mvn	x10, x10
    3758:      	ldr	w9, [x9, x10, lsl #2]
    375c:      	cmp	w9, #0x0
    3760:      	b.le	0x3790 <_gap_verify_graph+0x372c>
    3764:      	ldr	x9, [x19, #0x28]
    3768:      	eor	x8, x8, #0xffffffff
    376c:      	add	x8, x9, x8, lsl #4
    3770:      	ldr	x8, [x8]
    3774:      	and	w9, w8, #0xff
    3778:      	cmp	w9, #0x46
    377c:      	b.ne	0x368c <_gap_verify_graph+0x3628>
    3780:      	adrp	x24, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003780:  ARM64_RELOC_PAGE21	l_str.677
    3784:      	add	x24, x24, #0x0
		0000000000003784:  ARM64_RELOC_PAGEOFF12	l_str.677
    3788:      	mov	w21, #0x27              ; =39
    378c:      	b	0x379c <_gap_verify_graph+0x3738>
    3790:      	adrp	x24, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003790:  ARM64_RELOC_PAGE21	l_str.676
    3794:      	add	x24, x24, #0x0
		0000000000003794:  ARM64_RELOC_PAGEOFF12	l_str.676
    3798:      	mov	w21, #0x20              ; =32
    379c:      	ldr	x4, [sp, #0x48]
    37a0:      	ldr	x5, [sp, #0x60]
    37a4:      	and	w3, w27, #0xff
    37a8:      	b	0x934 <_gap_verify_graph+0x8d0>
    37ac:      	mov	w12, #0x21              ; =33
    37b0:      	cbnz	w8, 0x3374 <_gap_verify_graph+0x3310>
    37b4:      	b	0x3588 <_gap_verify_graph+0x3524>
    37b8:      	mov	w21, #0x33              ; =51
    37bc:      	b	0x2a90 <_gap_verify_graph+0x2a2c>
    37c0:      	cmp	w9, #0x10
    37c4:      	mov	w10, #0x10              ; =16
    37c8:      	sub	x0, x29, #0x80
    37cc:      	csel	w8, w9, w10, gt
    37d0:      	cmp	w12, #0x51
    37d4:      	mov	x1, x19
    37d8:      	csel	w3, w8, w10, eq
    37dc:      	bl	0x37dc <_gap_verify_graph+0x3778>
		00000000000037dc:  ARM64_RELOC_BRANCH26	_stogir.stack.constant-size-aligned
    37e0:      	ldur	w8, [x29, #-0x80]
    37e4:      	ldur	x9, [x29, #-0x70]
    37e8:      	cmp	w8, #0x1
    37ec:      	b	0x1af8 <_gap_verify_graph+0x1a94>
    37f0:      	mov	w12, #0x37              ; =55
    37f4:      	adrp	x2, 0x3000 <_gap_verify_graph+0x2f9c>
		00000000000037f4:  ARM64_RELOC_PAGE21	l_str.653
    37f8:      	add	x2, x2, #0x0
		00000000000037f8:  ARM64_RELOC_PAGEOFF12	l_str.653
    37fc:      	mov	x1, x7
    3800:      	b	0x29c4 <_gap_verify_graph+0x2960>
    3804:      	mov	w21, #0x2               ; =2
    3808:      	mov	x0, x19
    380c:      	mov	w1, w20
    3810:      	mov	w2, w21
    3814:      	bl	0x3814 <_gap_verify_graph+0x37b0>
		0000000000003814:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
    3818:      	cbz	w0, 0x3858 <_gap_verify_graph+0x37f4>
    381c:      	mov	x2, x1
    3820:      	sub	x0, x29, #0x80
    3824:      	mov	x1, x19
    3828:      	bl	0x3828 <_gap_verify_graph+0x37c4>
		0000000000003828:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    382c:      	ldur	w8, [x29, #-0x80]
    3830:      	cbz	w8, 0x3868 <_gap_verify_graph+0x3804>
    3834:      	ldurb	w8, [x29, #-0x77]
    3838:      	ldr	w9, [sp, #0x58]
    383c:      	cmp	w8, w9
    3840:      	b.ne	0x3878 <_gap_verify_graph+0x3814>
    3844:      	ldr	w8, [sp, #0x28]
    3848:      	add	w21, w21, #0x1
    384c:      	cmp	w21, w8
    3850:      	b.le	0x3808 <_gap_verify_graph+0x37a4>
    3854:      	b	0x30d0 <_gap_verify_graph+0x306c>
    3858:      	adrp	x24, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003858:  ARM64_RELOC_PAGE21	l_str.697
    385c:      	add	x24, x24, #0x0
		000000000000385c:  ARM64_RELOC_PAGEOFF12	l_str.697
    3860:      	mov	w21, #0x18              ; =24
    3864:      	b	0x31a0 <_gap_verify_graph+0x313c>
    3868:      	adrp	x24, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003868:  ARM64_RELOC_PAGE21	l_str.698
    386c:      	add	x24, x24, #0x0
		000000000000386c:  ARM64_RELOC_PAGEOFF12	l_str.698
    3870:      	mov	w21, #0x18              ; =24
    3874:      	b	0x31a0 <_gap_verify_graph+0x313c>
    3878:      	adrp	x24, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003878:  ARM64_RELOC_PAGE21	l_str.699
    387c:      	add	x24, x24, #0x0
		000000000000387c:  ARM64_RELOC_PAGEOFF12	l_str.699
    3880:      	mov	w21, #0x1e              ; =30
    3884:      	b	0x31a0 <_gap_verify_graph+0x313c>
    3888:      	mov	x0, #-0x1               ; =-1
    388c:      	add	sp, sp, #0x1c0
    3890:      	ldp	x29, x30, [sp, #0x50]
    3894:      	ldp	x20, x19, [sp, #0x40]
    3898:      	ldp	x22, x21, [sp, #0x30]
    389c:      	ldp	x24, x23, [sp, #0x20]
    38a0:      	ldp	x26, x25, [sp, #0x10]
    38a4:      	ldp	x28, x27, [sp], #0x60
    38a8:      	ret

00000000000038ac <_stogir.checked.validate>:
    38ac:      	cmp	w2, #0x1
    38b0:      	b.lt	0x3a38 <_stogir.checked.validate+0x18c>
    38b4:      	ldr	x13, [x1, #0x8]
    38b8:      	mov	w10, w2
    38bc:      	cmp	x13, x10
    38c0:      	b.le	0x3a88 <_stogir.checked.validate+0x1dc>
    38c4:      	ldr	x14, [x1, #0x80]
    38c8:      	cmp	x14, x10
    38cc:      	b.le	0x3a88 <_stogir.checked.validate+0x1dc>
    38d0:      	ldr	x8, [x1, #0x78]
    38d4:      	ldr	w11, [x8, x10, lsl #2]
    38d8:      	tbnz	w11, #0x1f, 0x3a88 <_stogir.checked.validate+0x1dc>
    38dc:      	ldr	x9, [x1]
    38e0:      	cmp	w11, #0x2
    38e4:      	add	x12, x9, x10, lsl #4
    38e8:      	ldr	x15, [x12]
    38ec:      	and	w10, w15, #0xff
    38f0:      	sub	w10, w10, #0x29
    38f4:      	ccmp	w10, #0x3, #0x2, eq
    38f8:      	b.hs	0x3a6c <_stogir.checked.validate+0x1c0>
    38fc:      	sub	sp, sp, #0x10
    3900:      	ubfx	w10, w15, #8, #8
    3904:      	lsr	x15, x15, #32
    3908:      	ldr	x12, [x12, #0x8]
    390c:      	mov	w16, #0x36              ; =54
    3910:      	adrp	x2, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003910:  ARM64_RELOC_PAGE21	l_str.363
    3914:      	add	x2, x2, #0x0
		0000000000003914:  ARM64_RELOC_PAGEOFF12	l_str.363
    3918:      	sub	w17, w10, #0xc
    391c:      	mov	x11, xzr
    3920:      	stp	w15, w12, [sp, #0x8]
    3924:      	cmn	w17, #0xa
    3928:      	adrp	x17, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003928:  ARM64_RELOC_PAGE21	l_str.364
    392c:      	add	x17, x17, #0x0
		000000000000392c:  ARM64_RELOC_PAGEOFF12	l_str.364
    3930:      	csel	x4, x16, xzr, lo
    3934:      	csel	x5, x17, x2, lo
    3938:      	cmp	x13, x14
    393c:      	add	x12, sp, #0x8
    3940:      	csel	x13, x13, x14, lt
    3944:      	adrp	x14, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003944:  ARM64_RELOC_PAGE21	l_str.365
    3948:      	add	x14, x14, #0x0
		0000000000003948:  ARM64_RELOC_PAGEOFF12	l_str.365
    394c:      	mov	w15, #0x28              ; =40
    3950:      	adrp	x16, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003950:  ARM64_RELOC_PAGE21	l_str.366
    3954:      	add	x16, x16, #0x0
		0000000000003954:  ARM64_RELOC_PAGEOFF12	l_str.366
    3958:      	b	0x3968 <_stogir.checked.validate+0xbc>
    395c:      	mov	w4, #0x22               ; =34
    3960:      	mov	x5, x14
    3964:      	tbnz	w3, #0x1f, 0x39dc <_stogir.checked.validate+0x130>
    3968:      	cmp	x11, #0x1
    396c:      	mov	x17, x5
    3970:      	mov	x2, x4
    3974:      	b.gt	0x398c <_stogir.checked.validate+0xe0>
    3978:      	ldr	w3, [x12, x11, lsl #2]
    397c:      	add	x11, x11, #0x1
    3980:      	mov	w4, #0x1                ; =1
    3984:      	cbnz	w4, 0x3998 <_stogir.checked.validate+0xec>
    3988:      	b	0x3aa4 <_stogir.checked.validate+0x1f8>
    398c:      	mov	x4, xzr
    3990:      	mov	w11, #0x2               ; =2
    3994:      	cbz	w4, 0x3aa4 <_stogir.checked.validate+0x1f8>
    3998:      	cmp	w3, #0x1
    399c:      	b.lt	0x395c <_stogir.checked.validate+0xb0>
    39a0:      	and	x3, x3, #0x7fffffff
    39a4:      	mov	w4, #0x22               ; =34
    39a8:      	mov	x5, x14
    39ac:      	cmp	x3, x13
    39b0:      	b.ge	0x3968 <_stogir.checked.validate+0xbc>
    39b4:      	ldr	w6, [x8, x3, lsl #2]
    39b8:      	mov	w4, #0x22               ; =34
    39bc:      	mov	x5, x14
    39c0:      	tbnz	w6, #0x1f, 0x3968 <_stogir.checked.validate+0xbc>
    39c4:      	add	x3, x9, x3, lsl #4
    39c8:      	ldrb	w3, [x3, #0x1]
    39cc:      	cmp	w3, w10
    39d0:      	csel	x4, x2, x15, eq
    39d4:      	csel	x5, x17, x16, eq
    39d8:      	b	0x3968 <_stogir.checked.validate+0xbc>
    39dc:      	ldr	x6, [x1, #0x30]
    39e0:      	ldr	x4, [x1, #0x58]
    39e4:      	mov	x5, x14
    39e8:      	cmp	x6, x4
    39ec:      	mov	w4, #0x22               ; =34
    39f0:      	b.ne	0x3968 <_stogir.checked.validate+0xbc>
    39f4:      	sxtw	x7, w3
    39f8:      	mov	w4, #0x22               ; =34
    39fc:      	mov	x5, x14
    3a00:      	cmn	x6, x7
    3a04:      	b.lt	0x3968 <_stogir.checked.validate+0xbc>
    3a08:      	ldr	x4, [x1, #0x50]
    3a0c:      	mvn	x5, x7
    3a10:      	ldr	w4, [x4, x5, lsl #2]
    3a14:      	mov	x5, x14
    3a18:      	cmp	w4, #0x0
    3a1c:      	mov	w4, #0x22               ; =34
    3a20:      	b.le	0x3968 <_stogir.checked.validate+0xbc>
    3a24:      	mvn	w3, w3
    3a28:      	ldr	x4, [x1, #0x28]
    3a2c:      	and	x3, x3, #0x7fffffff
    3a30:      	add	x3, x4, x3, lsl #4
    3a34:      	b	0x39c8 <_stogir.checked.validate+0x11c>
    3a38:      	tbz	w2, #0x1f, 0x3a88 <_stogir.checked.validate+0x1dc>
    3a3c:      	ldr	x8, [x1, #0x30]
    3a40:      	ldr	x9, [x1, #0x58]
    3a44:      	cmp	x8, x9
    3a48:      	b.ne	0x3a88 <_stogir.checked.validate+0x1dc>
    3a4c:      	sxtw	x9, w2
    3a50:      	cmn	x8, x9
    3a54:      	b.lt	0x3a88 <_stogir.checked.validate+0x1dc>
    3a58:      	ldr	x8, [x1, #0x50]
    3a5c:      	mvn	x9, x9
    3a60:      	ldr	w8, [x8, x9, lsl #2]
    3a64:      	cmp	w8, #0x0
    3a68:      	b.le	0x3a88 <_stogir.checked.validate+0x1dc>
    3a6c:      	mov	w8, #0x1                ; =1
    3a70:      	adrp	x9, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003a70:  ARM64_RELOC_PAGE21	l_str.373
    3a74:      	add	x9, x9, #0x0
		0000000000003a74:  ARM64_RELOC_PAGEOFF12	l_str.373
    3a78:      	str	w8, [x0]
    3a7c:      	mov	w8, #0x26               ; =38
    3a80:      	stp	x9, x8, [x0, #0x8]
    3a84:      	ret
    3a88:      	mov	w8, #0x1                ; =1
    3a8c:      	adrp	x9, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003a8c:  ARM64_RELOC_PAGE21	l_str.372
    3a90:      	add	x9, x9, #0x0
		0000000000003a90:  ARM64_RELOC_PAGEOFF12	l_str.372
    3a94:      	str	w8, [x0]
    3a98:      	mov	w8, #0x1a               ; =26
    3a9c:      	stp	x9, x8, [x0, #0x8]
    3aa0:      	ret
    3aa4:      	add	sp, sp, #0x10
    3aa8:      	cbz	x2, 0x3abc <_stogir.checked.validate+0x210>
    3aac:      	mov	w8, #0x1                ; =1
    3ab0:      	stp	x17, x2, [x0, #0x8]
    3ab4:      	str	w8, [x0]
    3ab8:      	ret
    3abc:      	str	w10, [x0, #0x8]
    3ac0:      	str	wzr, [x0]
    3ac4:      	ret

0000000000003ac8 <_stogir.conditional.validate>:
    3ac8:      	cmp	w2, #0x1
    3acc:      	b.lt	0x3b48 <_stogir.conditional.validate+0x80>
    3ad0:      	ldr	x11, [x1, #0x8]
    3ad4:      	mov	w10, w2
    3ad8:      	cmp	x11, x10
    3adc:      	b.le	0x3b98 <_stogir.conditional.validate+0xd0>
    3ae0:      	ldr	x12, [x1, #0x80]
    3ae4:      	cmp	x12, x10
    3ae8:      	b.le	0x3b98 <_stogir.conditional.validate+0xd0>
    3aec:      	ldr	x8, [x1, #0x78]
    3af0:      	ldr	w13, [x8, x10, lsl #2]
    3af4:      	tbnz	w13, #0x1f, 0x3b98 <_stogir.conditional.validate+0xd0>
    3af8:      	ldr	x9, [x1]
    3afc:      	cmp	w13, #0x3
    3b00:      	mov	w13, #0x3c              ; =60
    3b04:      	add	x14, x9, x10, lsl #4
    3b08:      	ldr	x17, [x14]
    3b0c:      	and	x10, x17, #0xff
    3b10:      	ccmp	x10, x13, #0x0, eq
    3b14:      	b.ne	0x3b7c <_stogir.conditional.validate+0xb4>
    3b18:      	ubfx	w10, w17, #8, #8
    3b1c:      	lsr	x16, x17, #32
    3b20:      	adrp	x13, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003b20:  ARM64_RELOC_PAGE21	l_str.378
    3b24:      	add	x13, x13, #0x0
		0000000000003b24:  ARM64_RELOC_PAGEOFF12	l_str.378
    3b28:      	cbz	w10, 0x3bb4 <_stogir.conditional.validate+0xec>
    3b2c:      	cmp	w10, #0xe
    3b30:      	adrp	x2, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003b30:  ARM64_RELOC_PAGE21	l_str.377
    3b34:      	add	x2, x2, #0x0
		0000000000003b34:  ARM64_RELOC_PAGEOFF12	l_str.377
    3b38:      	b.hs	0x3bbc <_stogir.conditional.validate+0xf4>
    3b3c:      	mov	x15, xzr
    3b40:      	mov	x13, x2
    3b44:      	b	0x3be4 <_stogir.conditional.validate+0x11c>
    3b48:      	tbz	w2, #0x1f, 0x3b98 <_stogir.conditional.validate+0xd0>
    3b4c:      	ldr	x8, [x1, #0x30]
    3b50:      	ldr	x9, [x1, #0x58]
    3b54:      	cmp	x8, x9
    3b58:      	b.ne	0x3b98 <_stogir.conditional.validate+0xd0>
    3b5c:      	sxtw	x9, w2
    3b60:      	cmn	x8, x9
    3b64:      	b.lt	0x3b98 <_stogir.conditional.validate+0xd0>
    3b68:      	ldr	x8, [x1, #0x50]
    3b6c:      	mvn	x9, x9
    3b70:      	ldr	w8, [x8, x9, lsl #2]
    3b74:      	cmp	w8, #0x0
    3b78:      	b.le	0x3b98 <_stogir.conditional.validate+0xd0>
    3b7c:      	mov	w8, #0x1                ; =1
    3b80:      	adrp	x9, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003b80:  ARM64_RELOC_PAGE21	l_str.385
    3b84:      	add	x9, x9, #0x0
		0000000000003b84:  ARM64_RELOC_PAGEOFF12	l_str.385
    3b88:      	str	w8, [x0]
    3b8c:      	mov	w8, #0x18               ; =24
    3b90:      	stp	x9, x8, [x0, #0x8]
    3b94:      	ret
    3b98:      	mov	w8, #0x1                ; =1
    3b9c:      	adrp	x9, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003b9c:  ARM64_RELOC_PAGE21	l_str.384
    3ba0:      	add	x9, x9, #0x0
		0000000000003ba0:  ARM64_RELOC_PAGEOFF12	l_str.384
    3ba4:      	str	w8, [x0]
    3ba8:      	mov	w8, #0x18               ; =24
    3bac:      	stp	x9, x8, [x0, #0x8]
    3bb0:      	ret
    3bb4:      	mov	w15, #0x2b              ; =43
    3bb8:      	b	0x3be4 <_stogir.conditional.validate+0x11c>
    3bbc:      	ubfx	w15, w17, #8, #4
    3bc0:      	sub	w3, w10, #0x80
    3bc4:      	cmn	w3, #0x70
    3bc8:      	sub	w15, w15, #0xe
    3bcc:      	ccmn	w15, #0xd, #0x0, hs
    3bd0:      	cset	w15, lo
    3bd4:      	cmp	w15, #0x0
    3bd8:      	mov	w15, #0x2b              ; =43
    3bdc:      	csel	x15, x15, xzr, ne
    3be0:      	csel	x13, x13, x2, ne
    3be4:      	ldr	x14, [x14, #0x8]
    3be8:      	cmp	w16, #0x1
    3bec:      	b.lt	0x3c64 <_stogir.conditional.validate+0x19c>
    3bf0:      	cmp	x11, x16
    3bf4:      	adrp	x3, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003bf4:  ARM64_RELOC_PAGE21	l_str.379
    3bf8:      	add	x3, x3, #0x0
		0000000000003bf8:  ARM64_RELOC_PAGEOFF12	l_str.379
    3bfc:      	mov	w4, #0x16               ; =22
    3c00:      	b.ls	0x3cb4 <_stogir.conditional.validate+0x1ec>
    3c04:      	cmp	x12, x16
    3c08:      	b.ls	0x3cb4 <_stogir.conditional.validate+0x1ec>
    3c0c:      	ldr	w17, [x8, x16, lsl #2]
    3c10:      	tbnz	w17, #0x1f, 0x3cb0 <_stogir.conditional.validate+0x1e8>
    3c14:      	add	x16, x9, x16, lsl #4
    3c18:      	ldr	x16, [x16]
    3c1c:      	adrp	x3, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003c1c:  ARM64_RELOC_PAGE21	l_str.380
    3c20:      	add	x3, x3, #0x0
		0000000000003c20:  ARM64_RELOC_PAGEOFF12	l_str.380
    3c24:      	mov	w4, #0x2a               ; =42
    3c28:      	and	w17, w16, #0xff
    3c2c:      	cmp	w17, #0x48
    3c30:      	b.eq	0x3cb4 <_stogir.conditional.validate+0x1ec>
    3c34:      	cmp	w17, #0x46
    3c38:      	b.eq	0x3cb4 <_stogir.conditional.validate+0x1ec>
    3c3c:      	tst	x16, #0xff00
    3c40:      	and	x16, x16, #0xfe00
    3c44:      	mov	w17, #0xdff             ; =3583
    3c48:      	ccmp	x16, x17, #0x2, ne
    3c4c:      	cset	w16, hi
    3c50:      	cmp	w16, #0x0
    3c54:      	mov	w16, #0x2a              ; =42
    3c58:      	csel	x4, x16, x15, ne
    3c5c:      	csel	x3, x3, x13, ne
    3c60:      	b	0x3cb4 <_stogir.conditional.validate+0x1ec>
    3c64:      	tbz	x17, #0x3f, 0x3ca8 <_stogir.conditional.validate+0x1e0>
    3c68:      	ldr	x2, [x1, #0x30]
    3c6c:      	ldr	x3, [x1, #0x58]
    3c70:      	cmp	x2, x3
    3c74:      	b.ne	0x3ca8 <_stogir.conditional.validate+0x1e0>
    3c78:      	asr	x17, x17, #32
    3c7c:      	cmn	x2, x17
    3c80:      	b.lt	0x3ca8 <_stogir.conditional.validate+0x1e0>
    3c84:      	ldr	x2, [x1, #0x50]
    3c88:      	mvn	x17, x17
    3c8c:      	ldr	w17, [x2, x17, lsl #2]
    3c90:      	cmp	w17, #0x0
    3c94:      	b.le	0x3ca8 <_stogir.conditional.validate+0x1e0>
    3c98:      	ldr	x17, [x1, #0x28]
    3c9c:      	eor	x16, x16, #0xffffffff
    3ca0:      	add	x16, x17, x16, lsl #4
    3ca4:      	b	0x3c18 <_stogir.conditional.validate+0x150>
    3ca8:      	adrp	x3, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003ca8:  ARM64_RELOC_PAGE21	l_str.379
    3cac:      	add	x3, x3, #0x0
		0000000000003cac:  ARM64_RELOC_PAGEOFF12	l_str.379
    3cb0:      	mov	w4, #0x16               ; =22
    3cb4:      	sub	sp, sp, #0x10
    3cb8:      	cmp	x11, x12
    3cbc:      	mov	x13, xzr
    3cc0:      	str	x14, [sp, #0x8]
    3cc4:      	add	x14, sp, #0x8
    3cc8:      	csel	x11, x11, x12, lt
    3ccc:      	adrp	x12, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003ccc:  ARM64_RELOC_PAGE21	l_str.381
    3cd0:      	add	x12, x12, #0x0
		0000000000003cd0:  ARM64_RELOC_PAGEOFF12	l_str.381
    3cd4:      	adrp	x15, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003cd4:  ARM64_RELOC_PAGE21	l_str.382
    3cd8:      	add	x15, x15, #0x0
		0000000000003cd8:  ARM64_RELOC_PAGEOFF12	l_str.382
    3cdc:      	mov	w16, #0x21              ; =33
    3ce0:      	b	0x3cf0 <_stogir.conditional.validate+0x228>
    3ce4:      	mov	w4, #0x10               ; =16
    3ce8:      	mov	x3, x12
    3cec:      	tbnz	w5, #0x1f, 0x3d8c <_stogir.conditional.validate+0x2c4>
    3cf0:      	cmp	x13, #0x1
    3cf4:      	mov	x17, x3
    3cf8:      	mov	x2, x4
    3cfc:      	b.gt	0x3d14 <_stogir.conditional.validate+0x24c>
    3d00:      	ldr	w5, [x14, x13, lsl #2]
    3d04:      	add	x13, x13, #0x1
    3d08:      	mov	w3, #0x1                ; =1
    3d0c:      	cbnz	w3, 0x3d20 <_stogir.conditional.validate+0x258>
    3d10:      	b	0x3e00 <_stogir.conditional.validate+0x338>
    3d14:      	mov	x3, xzr
    3d18:      	mov	w13, #0x2               ; =2
    3d1c:      	cbz	w3, 0x3e00 <_stogir.conditional.validate+0x338>
    3d20:      	cmp	w5, #0x1
    3d24:      	b.lt	0x3ce4 <_stogir.conditional.validate+0x21c>
    3d28:      	and	x5, x5, #0x7fffffff
    3d2c:      	mov	w4, #0x10               ; =16
    3d30:      	mov	x3, x12
    3d34:      	cmp	x5, x11
    3d38:      	b.ge	0x3cf0 <_stogir.conditional.validate+0x228>
    3d3c:      	ldr	w6, [x8, x5, lsl #2]
    3d40:      	mov	w4, #0x10               ; =16
    3d44:      	mov	x3, x12
    3d48:      	tbnz	w6, #0x1f, 0x3cf0 <_stogir.conditional.validate+0x228>
    3d4c:      	add	x3, x9, x5, lsl #4
    3d50:      	ldr	x5, [x3]
    3d54:      	mov	w4, #0x21               ; =33
    3d58:      	mov	x3, x15
    3d5c:      	and	w6, w5, #0xff
    3d60:      	cmp	w6, #0x46
    3d64:      	b.eq	0x3cf0 <_stogir.conditional.validate+0x228>
    3d68:      	cmp	w6, #0x48
    3d6c:      	mov	w4, #0x21               ; =33
    3d70:      	mov	x3, x15
    3d74:      	b.eq	0x3cf0 <_stogir.conditional.validate+0x228>
    3d78:      	ubfx	w3, w5, #8, #8
    3d7c:      	cmp	w3, w10
    3d80:      	csel	x4, x16, x2, ne
    3d84:      	csel	x3, x15, x17, ne
    3d88:      	b	0x3cf0 <_stogir.conditional.validate+0x228>
    3d8c:      	ldr	x6, [x1, #0x30]
    3d90:      	ldr	x3, [x1, #0x58]
    3d94:      	mov	w4, #0x10               ; =16
    3d98:      	cmp	x6, x3
    3d9c:      	mov	x3, x12
    3da0:      	b.ne	0x3cf0 <_stogir.conditional.validate+0x228>
    3da4:      	sxtw	x7, w5
    3da8:      	mov	w4, #0x10               ; =16
    3dac:      	mov	x3, x12
    3db0:      	cmn	x6, x7
    3db4:      	b.lt	0x3cf0 <_stogir.conditional.validate+0x228>
    3db8:      	ldr	x3, [x1, #0x50]
    3dbc:      	mvn	x4, x7
    3dc0:      	ldr	w3, [x3, x4, lsl #2]
    3dc4:      	mov	w4, #0x10               ; =16
    3dc8:      	cmp	w3, #0x0
    3dcc:      	mov	x3, x12
    3dd0:      	b.le	0x3cf0 <_stogir.conditional.validate+0x228>
    3dd4:      	mvn	w3, w5
    3dd8:      	ldr	x4, [x1, #0x28]
    3ddc:      	and	x3, x3, #0x7fffffff
    3de0:      	add	x3, x4, x3, lsl #4
    3de4:      	ldr	x5, [x3]
    3de8:      	mov	w4, #0x21               ; =33
    3dec:      	mov	x3, x15
    3df0:      	and	w6, w5, #0xff
    3df4:      	cmp	w6, #0x46
    3df8:      	b.ne	0x3d68 <_stogir.conditional.validate+0x2a0>
    3dfc:      	b	0x3cf0 <_stogir.conditional.validate+0x228>
    3e00:      	add	sp, sp, #0x10
    3e04:      	cbz	x2, 0x3e18 <_stogir.conditional.validate+0x350>
    3e08:      	mov	w8, #0x1                ; =1
    3e0c:      	stp	x17, x2, [x0, #0x8]
    3e10:      	str	w8, [x0]
    3e14:      	ret
    3e18:      	str	w10, [x0, #0x8]
    3e1c:      	str	wzr, [x0]
    3e20:      	ret

0000000000003e24 <_stogir.conversion.policy>:
    3e24:      	cmp	w1, #0x24
    3e28:      	b.ne	0x3ee0 <_stogir.conversion.policy+0xbc>
    3e2c:      	and	w8, w2, #0xf
    3e30:      	sub	w10, w2, #0x10
    3e34:      	sub	w9, w8, #0x1
    3e38:      	cmp	w9, #0xd
    3e3c:      	mov	w9, #0x70               ; =112
    3e40:      	ccmp	w10, w9, #0x2, lo
    3e44:      	b.hs	0x3eb0 <_stogir.conversion.policy+0x8c>
    3e48:      	adrp	x9, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003e48:  ARM64_RELOC_PAGE21	l_switch.table.stogir.types.size
    3e4c:      	add	x9, x9, #0x0
		0000000000003e4c:  ARM64_RELOC_PAGEOFF12	l_switch.table.stogir.types.size
    3e50:      	add	x8, x9, w8, uxtw
    3e54:      	lsr	w9, w2, #4
    3e58:      	ldurb	w8, [x8, #-0x1]
    3e5c:      	sub	w9, w9, #0x1
    3e60:      	lsl	w8, w8, w9
    3e64:      	lsl	w8, w8, #3
    3e68:      	and	w9, w3, #0xf
    3e6c:      	sub	w11, w3, #0x10
    3e70:      	sub	w10, w9, #0x1
    3e74:      	cmp	w10, #0xd
    3e78:      	mov	w10, #0x70              ; =112
    3e7c:      	ccmp	w11, w10, #0x2, lo
    3e80:      	b.hs	0x3f30 <_stogir.conversion.policy+0x10c>
    3e84:      	adrp	x10, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003e84:  ARM64_RELOC_PAGE21	l_switch.table.stogir.types.size
    3e88:      	add	x10, x10, #0x0
		0000000000003e88:  ARM64_RELOC_PAGEOFF12	l_switch.table.stogir.types.size
    3e8c:      	add	x9, x10, w9, uxtw
    3e90:      	lsr	w10, w3, #4
    3e94:      	ldurb	w9, [x9, #-0x1]
    3e98:      	sub	w10, w10, #0x1
    3e9c:      	lsl	w9, w9, w10
    3ea0:      	lsl	w9, w9, #3
    3ea4:      	cmp	w8, #0x1
    3ea8:      	b.ge	0x3fc8 <_stogir.conversion.policy+0x1a4>
    3eac:      	b	0x40a8 <_stogir.conversion.policy+0x284>
    3eb0:      	and	w8, w3, #0xf
    3eb4:      	sub	w10, w3, #0x10
    3eb8:      	sub	w8, w8, #0x1
    3ebc:      	cmp	w8, #0xd
    3ec0:      	ccmp	w10, w9, #0x2, lo
    3ec4:      	b.hs	0x3ee0 <_stogir.conversion.policy+0xbc>
    3ec8:      	cmp	w2, #0xe
    3ecc:      	b.hs	0x3f84 <_stogir.conversion.policy+0x160>
    3ed0:      	adrp	x8, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003ed0:  ARM64_RELOC_PAGE21	l_switch.table.stogir.conversion.policy.22
    3ed4:      	add	x8, x8, #0x0
		0000000000003ed4:  ARM64_RELOC_PAGEOFF12	l_switch.table.stogir.conversion.policy.22
    3ed8:      	ldrb	w8, [x8, w2, uxtw]
    3edc:      	b	0x3e68 <_stogir.conversion.policy+0x44>
    3ee0:      	cmp	w2, #0xe
    3ee4:      	adrp	x9, 0x3000 <_gap_verify_graph+0x2f9c>
		0000000000003ee4:  ARM64_RELOC_PAGE21	l_switch.table.stogir.conversion.policy.22
    3ee8:      	add	x9, x9, #0x0
		0000000000003ee8:  ARM64_RELOC_PAGEOFF12	l_switch.table.stogir.conversion.policy.22
    3eec:      	b.hs	0x3f10 <_stogir.conversion.policy+0xec>
    3ef0:      	ldrb	w8, [x9, w2, uxtw]
    3ef4:      	cmp	w3, #0xd
    3ef8:      	b.ls	0x3f1c <_stogir.conversion.policy+0xf8>
    3efc:      	mov	w9, #-0x8               ; =-8
    3f00:      	sub	w10, w1, #0x21
    3f04:      	cmp	w10, #0x6
    3f08:      	b.ls	0x3fc0 <_stogir.conversion.policy+0x19c>
    3f0c:      	b	0x40a8 <_stogir.conversion.policy+0x284>
    3f10:      	mov	w8, #-0x8               ; =-8
    3f14:      	cmp	w3, #0xd
    3f18:      	b.hi	0x3efc <_stogir.conversion.policy+0xd8>
    3f1c:      	ldrb	w9, [x9, w3, uxtw]
    3f20:      	sub	w10, w1, #0x21
    3f24:      	cmp	w10, #0x6
    3f28:      	b.ls	0x3fc0 <_stogir.conversion.policy+0x19c>
    3f2c:      	b	0x40a8 <_stogir.conversion.policy+0x284>
    3f30:      	cmp	w3, #0x6
    3f34:      	mov	w9, #0x8                ; =8
    3f38:      	b.le	0x3f64 <_stogir.conversion.policy+0x140>
    3f3c:      	cmp	w3, #0x9
    3f40:      	b.le	0x3f8c <_stogir.conversion.policy+0x168>
    3f44:      	sub	w9, w3, #0xb
    3f48:      	cmp	w9, #0x2
    3f4c:      	b.lo	0x3fbc <_stogir.conversion.policy+0x198>
    3f50:      	cmp	w3, #0xa
    3f54:      	b.eq	0x409c <_stogir.conversion.policy+0x278>
    3f58:      	cmp	w3, #0xd
    3f5c:      	b.eq	0x409c <_stogir.conversion.policy+0x278>
    3f60:      	b	0x40a8 <_stogir.conversion.policy+0x284>
    3f64:      	cmp	w3, #0x3
    3f68:      	b.gt	0x3fb0 <_stogir.conversion.policy+0x18c>
    3f6c:      	sub	w10, w3, #0x1
    3f70:      	cmp	w10, #0x2
    3f74:      	b.lo	0x3fc0 <_stogir.conversion.policy+0x19c>
    3f78:      	cmp	w3, #0x3
    3f7c:      	b.eq	0x3fa0 <_stogir.conversion.policy+0x17c>
    3f80:      	b	0x40a8 <_stogir.conversion.policy+0x284>
    3f84:      	mov	w8, #-0x8               ; =-8
    3f88:      	b	0x3e68 <_stogir.conversion.policy+0x44>
    3f8c:      	sub	w10, w3, #0x7
    3f90:      	cmp	w10, #0x2
    3f94:      	b.lo	0x3fc0 <_stogir.conversion.policy+0x19c>
    3f98:      	cmp	w3, #0x9
    3f9c:      	b.ne	0x40a8 <_stogir.conversion.policy+0x284>
    3fa0:      	mov	w9, #0x10               ; =16
    3fa4:      	cmp	w8, #0x1
    3fa8:      	b.ge	0x3fc8 <_stogir.conversion.policy+0x1a4>
    3fac:      	b	0x40a8 <_stogir.conversion.policy+0x284>
    3fb0:      	sub	w9, w3, #0x5
    3fb4:      	cmp	w9, #0x2
    3fb8:      	b.hs	0x4094 <_stogir.conversion.policy+0x270>
    3fbc:      	mov	w9, #0x40               ; =64
    3fc0:      	cmp	w8, #0x1
    3fc4:      	b.lt	0x40a8 <_stogir.conversion.policy+0x284>
    3fc8:      	cmp	w9, #0x1
    3fcc:      	b.lt	0x40a8 <_stogir.conversion.policy+0x284>
    3fd0:      	sub	w10, w1, #0x25
    3fd4:      	cmp	w10, #0x2
    3fd8:      	b.hi	0x4004 <_stogir.conversion.policy+0x1e0>
    3fdc:      	cmp	w1, #0x27
    3fe0:      	b.eq	0x4048 <_stogir.conversion.policy+0x224>
    3fe4:      	cmp	w1, #0x26
    3fe8:      	b.ne	0x4060 <_stogir.conversion.policy+0x23c>
    3fec:      	sub	w10, w3, #0x1
    3ff0:      	and	w11, w2, #0xfe
    3ff4:      	cmp	w10, #0xb
    3ff8:      	ccmp	w11, #0xc, #0x0, lo
    3ffc:      	b.eq	0x4080 <_stogir.conversion.policy+0x25c>
    4000:      	b	0x40a8 <_stogir.conversion.policy+0x284>
    4004:      	cmp	w1, #0x24
    4008:      	b.ne	0x4018 <_stogir.conversion.policy+0x1f4>
    400c:      	cmp	w8, w9
    4010:      	b.eq	0x4080 <_stogir.conversion.policy+0x25c>
    4014:      	b	0x40a8 <_stogir.conversion.policy+0x284>
    4018:      	sub	w10, w3, #0x1
    401c:      	sub	w11, w2, #0x1
    4020:      	cmp	w10, #0xb
    4024:      	ccmp	w11, #0xb, #0x2, lo
    4028:      	b.hs	0x40a8 <_stogir.conversion.policy+0x284>
    402c:      	cmp	w1, #0x23
    4030:      	b.ne	0x4078 <_stogir.conversion.policy+0x254>
    4034:      	cmp	w9, w8
    4038:      	b.hs	0x40a8 <_stogir.conversion.policy+0x284>
    403c:      	str	wzr, [x0]
    4040:      	str	w9, [x0, #0x8]
    4044:      	ret
    4048:      	and	w10, w3, #0xfe
    404c:      	and	w11, w2, #0xfe
    4050:      	cmp	w10, #0xc
    4054:      	ccmp	w11, #0xc, #0x0, eq
    4058:      	b.eq	0x4080 <_stogir.conversion.policy+0x25c>
    405c:      	b	0x40a8 <_stogir.conversion.policy+0x284>
    4060:      	and	w10, w3, #0xfe
    4064:      	sub	w11, w2, #0x1
    4068:      	cmp	w10, #0xc
    406c:      	ccmp	w11, #0xb, #0x2, eq
    4070:      	b.lo	0x4080 <_stogir.conversion.policy+0x25c>
    4074:      	b	0x40a8 <_stogir.conversion.policy+0x284>
    4078:      	cmp	w9, w8
    407c:      	b.ls	0x40a8 <_stogir.conversion.policy+0x284>
    4080:      	cmp	w1, #0x26
    4084:      	str	wzr, [x0]
    4088:      	csel	w9, w9, w8, eq
    408c:      	str	w9, [x0, #0x8]
    4090:      	ret
    4094:      	cmp	w3, #0x4
    4098:      	b.ne	0x40a8 <_stogir.conversion.policy+0x284>
    409c:      	mov	w9, #0x20               ; =32
    40a0:      	cmp	w8, #0x1
    40a4:      	b.ge	0x3fc8 <_stogir.conversion.policy+0x1a4>
    40a8:      	mov	w8, #0x1                ; =1
    40ac:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		00000000000040ac:  ARM64_RELOC_PAGE21	l_str.391
    40b0:      	add	x9, x9, #0x0
		00000000000040b0:  ARM64_RELOC_PAGEOFF12	l_str.391
    40b4:      	str	w8, [x0]
    40b8:      	mov	w8, #0x22               ; =34
    40bc:      	stp	x9, x8, [x0, #0x8]
    40c0:      	ret

00000000000040c4 <_stogir.conversion.validate>:
    40c4:      	cmp	w2, #0x1
    40c8:      	b.lt	0x4170 <_stogir.conversion.validate+0xac>
    40cc:      	ldr	x11, [x1, #0x8]
    40d0:      	mov	w8, w2
    40d4:      	cmp	x11, x8
    40d8:      	b.le	0x41c0 <_stogir.conversion.validate+0xfc>
    40dc:      	ldr	x13, [x1, #0x80]
    40e0:      	cmp	x13, x8
    40e4:      	b.le	0x41c0 <_stogir.conversion.validate+0xfc>
    40e8:      	ldr	x12, [x1, #0x78]
    40ec:      	ldr	w10, [x12, x8, lsl #2]
    40f0:      	tbnz	w10, #0x1f, 0x41c0 <_stogir.conversion.validate+0xfc>
    40f4:      	ldr	x14, [x1]
    40f8:      	lsl	x8, x8, #4
    40fc:      	cmp	w10, #0x1
    4100:      	ldr	x9, [x14, x8]
    4104:      	and	w8, w9, #0xff
    4108:      	sub	w15, w8, #0x21
    410c:      	ccmp	w15, #0x7, #0x2, eq
    4110:      	b.hs	0x41a4 <_stogir.conversion.validate+0xe0>
    4114:      	lsr	x10, x9, #32
    4118:      	cmp	w10, #0x1
    411c:      	b.lt	0x41dc <_stogir.conversion.validate+0x118>
    4120:      	cmp	x11, x10
    4124:      	b.ls	0x4230 <_stogir.conversion.validate+0x16c>
    4128:      	cmp	x13, x10
    412c:      	b.ls	0x4230 <_stogir.conversion.validate+0x16c>
    4130:      	ldr	w11, [x12, x10, lsl #2]
    4134:      	tbnz	w11, #0x1f, 0x4230 <_stogir.conversion.validate+0x16c>
    4138:      	add	x10, x14, x10, lsl #4
    413c:      	ldr	x10, [x10]
    4140:      	and	w11, w10, #0xff
    4144:      	cmp	w11, #0x48
    4148:      	b.eq	0x4154 <_stogir.conversion.validate+0x90>
    414c:      	cmp	w11, #0x46
    4150:      	b.ne	0x424c <_stogir.conversion.validate+0x188>
    4154:      	mov	w8, #0x1                ; =1
    4158:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		0000000000004158:  ARM64_RELOC_PAGE21	l_str.395
    415c:      	add	x9, x9, #0x0
		000000000000415c:  ARM64_RELOC_PAGEOFF12	l_str.395
    4160:      	str	w8, [x0]
    4164:      	mov	w8, #0x25               ; =37
    4168:      	stp	x9, x8, [x0, #0x8]
    416c:      	ret
    4170:      	tbz	w2, #0x1f, 0x41c0 <_stogir.conversion.validate+0xfc>
    4174:      	ldr	x8, [x1, #0x30]
    4178:      	ldr	x9, [x1, #0x58]
    417c:      	cmp	x8, x9
    4180:      	b.ne	0x41c0 <_stogir.conversion.validate+0xfc>
    4184:      	sxtw	x9, w2
    4188:      	cmn	x8, x9
    418c:      	b.lt	0x41c0 <_stogir.conversion.validate+0xfc>
    4190:      	ldr	x8, [x1, #0x50]
    4194:      	mvn	x9, x9
    4198:      	ldr	w8, [x8, x9, lsl #2]
    419c:      	cmp	w8, #0x0
    41a0:      	b.le	0x41c0 <_stogir.conversion.validate+0xfc>
    41a4:      	mov	w8, #0x1                ; =1
    41a8:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		00000000000041a8:  ARM64_RELOC_PAGE21	l_str.393
    41ac:      	add	x9, x9, #0x0
		00000000000041ac:  ARM64_RELOC_PAGEOFF12	l_str.393
    41b0:      	str	w8, [x0]
    41b4:      	mov	w8, #0x1e               ; =30
    41b8:      	stp	x9, x8, [x0, #0x8]
    41bc:      	ret
    41c0:      	mov	w8, #0x1                ; =1
    41c4:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		00000000000041c4:  ARM64_RELOC_PAGE21	l_str.392
    41c8:      	add	x9, x9, #0x0
		00000000000041c8:  ARM64_RELOC_PAGEOFF12	l_str.392
    41cc:      	str	w8, [x0]
    41d0:      	mov	w8, #0x12               ; =18
    41d4:      	stp	x9, x8, [x0, #0x8]
    41d8:      	ret
    41dc:      	tbz	x9, #0x3f, 0x4230 <_stogir.conversion.validate+0x16c>
    41e0:      	ldr	x11, [x1, #0x30]
    41e4:      	ldr	x12, [x1, #0x58]
    41e8:      	cmp	x11, x12
    41ec:      	b.ne	0x4230 <_stogir.conversion.validate+0x16c>
    41f0:      	asr	x12, x9, #32
    41f4:      	cmn	x11, x12
    41f8:      	b.lt	0x4230 <_stogir.conversion.validate+0x16c>
    41fc:      	ldr	x11, [x1, #0x50]
    4200:      	mvn	x12, x12
    4204:      	ldr	w11, [x11, x12, lsl #2]
    4208:      	cmp	w11, #0x0
    420c:      	b.le	0x4230 <_stogir.conversion.validate+0x16c>
    4210:      	ldr	x11, [x1, #0x28]
    4214:      	eor	x10, x10, #0xffffffff
    4218:      	add	x10, x11, x10, lsl #4
    421c:      	ldr	x10, [x10]
    4220:      	and	w11, w10, #0xff
    4224:      	cmp	w11, #0x48
    4228:      	b.ne	0x414c <_stogir.conversion.validate+0x88>
    422c:      	b	0x4154 <_stogir.conversion.validate+0x90>
    4230:      	mov	w8, #0x1                ; =1
    4234:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		0000000000004234:  ARM64_RELOC_PAGE21	l_str.394
    4238:      	add	x9, x9, #0x0
		0000000000004238:  ARM64_RELOC_PAGEOFF12	l_str.394
    423c:      	str	w8, [x0]
    4240:      	mov	w8, #0x19               ; =25
    4244:      	stp	x9, x8, [x0, #0x8]
    4248:      	ret
    424c:      	ubfx	w2, w10, #8, #8
    4250:      	ubfx	w3, w9, #8, #8
    4254:      	mov	w1, w8
    4258:      	b	0x4258 <_stogir.conversion.validate+0x194>
		0000000000004258:  ARM64_RELOC_BRANCH26	_stogir.conversion.policy

000000000000425c <_stogir.copy.validate>:
    425c:      	cmp	w2, #0x1
    4260:      	b.lt	0x4320 <_stogir.copy.validate+0xc4>
    4264:      	ldr	x10, [x1, #0x8]
    4268:      	mov	w8, w2
    426c:      	cmp	x10, x8
    4270:      	b.le	0x4370 <_stogir.copy.validate+0x114>
    4274:      	ldr	x12, [x1, #0x80]
    4278:      	cmp	x12, x8
    427c:      	b.le	0x4370 <_stogir.copy.validate+0x114>
    4280:      	ldr	x11, [x1, #0x78]
    4284:      	ldr	w14, [x11, x8, lsl #2]
    4288:      	tbnz	w14, #0x1f, 0x4370 <_stogir.copy.validate+0x114>
    428c:      	ldr	x13, [x1]
    4290:      	lsl	x8, x8, #4
    4294:      	ldr	x9, [x13, x8]
    4298:      	and	x8, x9, #0xff
    429c:      	cmp	x8, #0x44
    42a0:      	b.ne	0x4354 <_stogir.copy.validate+0xf8>
    42a4:      	ubfx	x8, x9, #8, #8
    42a8:      	cmp	w14, #0x2
    42ac:      	ccmp	w8, #0x0, #0x4, eq
    42b0:      	b.eq	0x4354 <_stogir.copy.validate+0xf8>
    42b4:      	cmp	w8, #0xe
    42b8:      	b.lo	0x42dc <_stogir.copy.validate+0x80>
    42bc:      	lsr	x14, x9, #8
    42c0:      	sub	w15, w8, #0x80
    42c4:      	and	w14, w14, #0xf
    42c8:      	sub	w14, w14, #0xe
    42cc:      	cmn	w14, #0xd
    42d0:      	mov	w14, #-0x70             ; =-112
    42d4:      	ccmp	w15, w14, #0x0, hs
    42d8:      	b.lo	0x4354 <_stogir.copy.validate+0xf8>
    42dc:      	lsr	x14, x9, #32
    42e0:      	cmp	w14, #0x1
    42e4:      	b.lt	0x438c <_stogir.copy.validate+0x130>
    42e8:      	cmp	x10, x14
    42ec:      	b.ls	0x43f8 <_stogir.copy.validate+0x19c>
    42f0:      	cmp	x12, x14
    42f4:      	b.ls	0x43f8 <_stogir.copy.validate+0x19c>
    42f8:      	ldr	w10, [x11, x14, lsl #2]
    42fc:      	tbnz	w10, #0x1f, 0x43f8 <_stogir.copy.validate+0x19c>
    4300:      	add	x10, x13, x14, lsl #4
    4304:      	lsr	w9, w9, #8
    4308:      	ldrb	w10, [x10, #0x1]
    430c:      	cmp	w10, w9, uxtb
    4310:      	b.ne	0x43dc <_stogir.copy.validate+0x180>
    4314:      	str	wzr, [x0]
    4318:      	str	w8, [x0, #0x8]
    431c:      	ret
    4320:      	tbz	w2, #0x1f, 0x4370 <_stogir.copy.validate+0x114>
    4324:      	ldr	x8, [x1, #0x30]
    4328:      	ldr	x9, [x1, #0x58]
    432c:      	cmp	x8, x9
    4330:      	b.ne	0x4370 <_stogir.copy.validate+0x114>
    4334:      	sxtw	x9, w2
    4338:      	cmn	x8, x9
    433c:      	b.lt	0x4370 <_stogir.copy.validate+0x114>
    4340:      	ldr	x8, [x1, #0x50]
    4344:      	mvn	x9, x9
    4348:      	ldr	w8, [x8, x9, lsl #2]
    434c:      	cmp	w8, #0x0
    4350:      	b.le	0x4370 <_stogir.copy.validate+0x114>
    4354:      	mov	w8, #0x1                ; =1
    4358:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		0000000000004358:  ARM64_RELOC_PAGE21	l_str.397
    435c:      	add	x9, x9, #0x0
		000000000000435c:  ARM64_RELOC_PAGEOFF12	l_str.397
    4360:      	str	w8, [x0]
    4364:      	mov	w8, #0x21               ; =33
    4368:      	stp	x9, x8, [x0, #0x8]
    436c:      	ret
    4370:      	mov	w8, #0x1                ; =1
    4374:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		0000000000004374:  ARM64_RELOC_PAGE21	l_str.396
    4378:      	add	x9, x9, #0x0
		0000000000004378:  ARM64_RELOC_PAGEOFF12	l_str.396
    437c:      	str	w8, [x0]
    4380:      	mov	w8, #0x18               ; =24
    4384:      	stp	x9, x8, [x0, #0x8]
    4388:      	ret
    438c:      	tbz	x9, #0x3f, 0x43f8 <_stogir.copy.validate+0x19c>
    4390:      	ldr	x10, [x1, #0x30]
    4394:      	ldr	x11, [x1, #0x58]
    4398:      	cmp	x10, x11
    439c:      	b.ne	0x43f8 <_stogir.copy.validate+0x19c>
    43a0:      	asr	x11, x9, #32
    43a4:      	cmn	x10, x11
    43a8:      	b.lt	0x43f8 <_stogir.copy.validate+0x19c>
    43ac:      	ldr	x10, [x1, #0x50]
    43b0:      	mvn	x11, x11
    43b4:      	ldr	w10, [x10, x11, lsl #2]
    43b8:      	cmp	w10, #0x0
    43bc:      	b.le	0x43f8 <_stogir.copy.validate+0x19c>
    43c0:      	ldr	x10, [x1, #0x28]
    43c4:      	eor	x11, x14, #0xffffffff
    43c8:      	add	x10, x10, x11, lsl #4
    43cc:      	lsr	w9, w9, #8
    43d0:      	ldrb	w10, [x10, #0x1]
    43d4:      	cmp	w10, w9, uxtb
    43d8:      	b.eq	0x4314 <_stogir.copy.validate+0xb8>
    43dc:      	mov	w8, #0x1                ; =1
    43e0:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		00000000000043e0:  ARM64_RELOC_PAGE21	l_str.399
    43e4:      	add	x9, x9, #0x0
		00000000000043e4:  ARM64_RELOC_PAGEOFF12	l_str.399
    43e8:      	str	w8, [x0]
    43ec:      	mov	w8, #0x20               ; =32
    43f0:      	stp	x9, x8, [x0, #0x8]
    43f4:      	ret
    43f8:      	mov	w8, #0x1                ; =1
    43fc:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		00000000000043fc:  ARM64_RELOC_PAGE21	l_str.398
    4400:      	add	x9, x9, #0x0
		0000000000004400:  ARM64_RELOC_PAGEOFF12	l_str.398
    4404:      	str	w8, [x0]
    4408:      	mov	w8, #0x13               ; =19
    440c:      	stp	x9, x8, [x0, #0x8]
    4410:      	ret

0000000000004414 <_stogir.graph.lookup>:
    4414:      	cmp	w2, #0x1
    4418:      	b.lt	0x445c <_stogir.graph.lookup+0x48>
    441c:      	ldr	x9, [x1, #0x8]
    4420:      	mov	w8, w2
    4424:      	cmp	x9, x8
    4428:      	b.le	0x44ac <_stogir.graph.lookup+0x98>
    442c:      	ldr	x9, [x1, #0x80]
    4430:      	cmp	x9, x8
    4434:      	b.le	0x44ac <_stogir.graph.lookup+0x98>
    4438:      	ldr	x9, [x1, #0x78]
    443c:      	ldr	w9, [x9, x8, lsl #2]
    4440:      	tbnz	w9, #0x1f, 0x44ac <_stogir.graph.lookup+0x98>
    4444:      	ldr	x9, [x1]
    4448:      	mov	w10, #0x1               ; =1
    444c:      	ldr	q0, [x9, x8, lsl #4]
    4450:      	str	w10, [x0]
    4454:      	stur	q0, [x0, #0x8]
    4458:      	ret
    445c:      	tbz	w2, #0x1f, 0x44ac <_stogir.graph.lookup+0x98>
    4460:      	ldr	x8, [x1, #0x30]
    4464:      	ldr	x9, [x1, #0x58]
    4468:      	cmp	x8, x9
    446c:      	b.ne	0x44ac <_stogir.graph.lookup+0x98>
    4470:      	sxtw	x9, w2
    4474:      	cmn	x8, x9
    4478:      	b.lt	0x44ac <_stogir.graph.lookup+0x98>
    447c:      	ldr	x8, [x1, #0x50]
    4480:      	mvn	x9, x9
    4484:      	ldr	w8, [x8, x9, lsl #2]
    4488:      	cmp	w8, #0x0
    448c:      	b.le	0x44ac <_stogir.graph.lookup+0x98>
    4490:      	ldr	x8, [x1, #0x28]
    4494:      	mvn	w9, w2
    4498:      	mov	w10, #0x1               ; =1
    449c:      	ldr	q0, [x8, w9, uxtw #4]
    44a0:      	str	w10, [x0]
    44a4:      	stur	q0, [x0, #0x8]
    44a8:      	ret
    44ac:      	str	wzr, [x0]
    44b0:      	ret

00000000000044b4 <_stogir.graph.operand>:
    44b4:      	cmp	w1, #0x1
    44b8:      	b.lt	0x44f0 <_stogir.graph.operand+0x3c>
    44bc:      	ldr	x9, [x0, #0x8]
    44c0:      	mov	w8, w1
    44c4:      	cmp	x9, x8
    44c8:      	b.le	0x44f0 <_stogir.graph.operand+0x3c>
    44cc:      	ldr	x9, [x0, #0x80]
    44d0:      	cmp	x9, x8
    44d4:      	b.le	0x44f0 <_stogir.graph.operand+0x3c>
    44d8:      	ldr	x9, [x0, #0x78]
    44dc:      	ldr	w8, [x9, x8, lsl #2]
    44e0:      	cmp	w2, w8
    44e4:      	ccmp	w2, #0x1, #0x8, ls
    44e8:      	ccmp	w8, #0x0, #0x8, ge
    44ec:      	b.pl	0x44f8 <_stogir.graph.operand+0x44>
    44f0:      	mov	x0, xzr
    44f4:      	ret
    44f8:      	add	w8, w1, w2, lsr #2
    44fc:      	ldr	x9, [x0]
    4500:      	mov	w0, #0x1                ; =1
    4504:      	add	x8, x9, w8, uxtw #4
    4508:      	and	w9, w2, #0x3
    450c:      	ldr	w1, [x8, w9, uxtw #2]
    4510:      	ret

0000000000004514 <_stogir.locals.validate>:
    4514:      	sub	sp, sp, #0xe0
    4518:      	cmp	w2, #0x1
    451c:      	stp	x28, x27, [sp, #0x80]
    4520:      	stp	x26, x25, [sp, #0x90]
    4524:      	stp	x24, x23, [sp, #0xa0]
    4528:      	stp	x22, x21, [sp, #0xb0]
    452c:      	stp	x20, x19, [sp, #0xc0]
    4530:      	stp	x29, x30, [sp, #0xd0]
    4534:      	add	x29, sp, #0xd0
    4538:      	b.lt	0x45a8 <_stogir.locals.validate+0x94>
    453c:      	ldr	x9, [x1, #0x8]
    4540:      	mov	w8, w2
    4544:      	cmp	x9, x8
    4548:      	b.le	0x4668 <_stogir.locals.validate+0x154>
    454c:      	ldr	x9, [x1, #0x80]
    4550:      	cmp	x9, x8
    4554:      	b.le	0x4668 <_stogir.locals.validate+0x154>
    4558:      	ldr	x9, [x1, #0x78]
    455c:      	ldr	w9, [x9, x8, lsl #2]
    4560:      	tbnz	w9, #0x1f, 0x4668 <_stogir.locals.validate+0x154>
    4564:      	ldr	x9, [x1]
    4568:      	add	x8, x9, x8, lsl #4
    456c:      	ldr	x22, [x8]
    4570:      	mov	w10, #0x2               ; =2
    4574:      	and	w25, w22, #0xff
    4578:      	subs	w9, w25, #0x55
    457c:      	b.eq	0x45fc <_stogir.locals.validate+0xe8>
    4580:      	cmp	w25, #0x56
    4584:      	cinc	w10, w10, ne
    4588:      	cmp	w25, #0x57
    458c:      	b.ne	0x45fc <_stogir.locals.validate+0xe8>
    4590:      	mov	w23, #0x1               ; =1
    4594:      	cmp	w25, #0x41
    4598:      	csinc	w10, w10, wzr, ne
    459c:      	cmp	w2, #0x1
    45a0:      	b.ge	0x4614 <_stogir.locals.validate+0x100>
    45a4:      	b	0x46a0 <_stogir.locals.validate+0x18c>
    45a8:      	tbz	w2, #0x1f, 0x4668 <_stogir.locals.validate+0x154>
    45ac:      	ldr	x8, [x1, #0x30]
    45b0:      	ldr	x9, [x1, #0x58]
    45b4:      	cmp	x8, x9
    45b8:      	b.ne	0x4668 <_stogir.locals.validate+0x154>
    45bc:      	sxtw	x9, w2
    45c0:      	cmn	x8, x9
    45c4:      	b.lt	0x4668 <_stogir.locals.validate+0x154>
    45c8:      	ldr	x8, [x1, #0x50]
    45cc:      	mvn	x9, x9
    45d0:      	ldr	w8, [x8, x9, lsl #2]
    45d4:      	cmp	w8, #0x0
    45d8:      	b.le	0x4668 <_stogir.locals.validate+0x154>
    45dc:      	ldr	x8, [x1, #0x28]
    45e0:      	mvn	w9, w2
    45e4:      	add	x8, x8, w9, uxtw #4
    45e8:      	ldr	x22, [x8]
    45ec:      	mov	w10, #0x2               ; =2
    45f0:      	and	w25, w22, #0xff
    45f4:      	subs	w9, w25, #0x55
    45f8:      	b.ne	0x4580 <_stogir.locals.validate+0x6c>
    45fc:      	cmp	w25, #0x58
    4600:      	cset	w23, eq
    4604:      	cmp	w25, #0x41
    4608:      	csinc	w10, w10, wzr, ne
    460c:      	cmp	w2, #0x1
    4610:      	b.lt	0x46a0 <_stogir.locals.validate+0x18c>
    4614:      	and	w11, w22, #0xff
    4618:      	ldr	x26, [x8, #0x8]
    461c:      	ldr	w24, [x8]
    4620:      	cmp	w11, #0x41
    4624:      	b.eq	0x4638 <_stogir.locals.validate+0x124>
    4628:      	cmp	w11, #0x48
    462c:      	b.eq	0x4638 <_stogir.locals.validate+0x124>
    4630:      	cmp	w9, #0x3
    4634:      	b.hi	0x46a0 <_stogir.locals.validate+0x18c>
    4638:      	ldr	x8, [x1, #0x78]
    463c:      	ldr	w9, [x8, w2, uxtw #2]
    4640:      	cmp	w9, w10
    4644:      	b.ne	0x46a0 <_stogir.locals.validate+0x18c>
    4648:      	lsr	x19, x22, #32
    464c:      	cmp	w25, #0x41
    4650:      	mov	w9, w19
    4654:      	b.eq	0x46b4 <_stogir.locals.validate+0x1a0>
    4658:      	cmp	w25, #0x48
    465c:      	b.ne	0x46b0 <_stogir.locals.validate+0x19c>
    4660:      	mov	w10, w2
    4664:      	b	0x46c4 <_stogir.locals.validate+0x1b0>
    4668:      	mov	w8, #0x1                ; =1
    466c:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		000000000000466c:  ARM64_RELOC_PAGE21	l_str.442
    4670:      	add	x9, x9, #0x0
		0000000000004670:  ARM64_RELOC_PAGEOFF12	l_str.442
    4674:      	str	w8, [x0]
    4678:      	mov	w8, #0x17               ; =23
    467c:      	stp	x9, x8, [x0, #0x8]
    4680:      	ldp	x29, x30, [sp, #0xd0]
    4684:      	ldp	x20, x19, [sp, #0xc0]
    4688:      	ldp	x22, x21, [sp, #0xb0]
    468c:      	ldp	x24, x23, [sp, #0xa0]
    4690:      	ldp	x26, x25, [sp, #0x90]
    4694:      	ldp	x28, x27, [sp, #0x80]
    4698:      	add	sp, sp, #0xe0
    469c:      	ret
    46a0:      	mov	w8, #0x1                ; =1
    46a4:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		00000000000046a4:  ARM64_RELOC_PAGE21	l_str.443
    46a8:      	add	x9, x9, #0x0
		00000000000046a8:  ARM64_RELOC_PAGEOFF12	l_str.443
    46ac:      	b	0x4674 <_stogir.locals.validate+0x160>
    46b0:      	mov	w9, w26
    46b4:      	cmp	w9, #0x1
    46b8:      	b.lt	0x4738 <_stogir.locals.validate+0x224>
    46bc:      	mov	w10, w9
    46c0:      	mov	w2, w9
    46c4:      	ldr	x9, [x1, #0x8]
    46c8:      	cmp	x9, x10
    46cc:      	b.le	0x4780 <_stogir.locals.validate+0x26c>
    46d0:      	ldr	x9, [x1, #0x80]
    46d4:      	cmp	x9, x10
    46d8:      	b.le	0x4780 <_stogir.locals.validate+0x26c>
    46dc:      	ldr	w9, [x8, x10, lsl #2]
    46e0:      	tbnz	w9, #0x1f, 0x4780 <_stogir.locals.validate+0x26c>
    46e4:      	ldr	x9, [x1]
    46e8:      	add	x10, x9, x10, lsl #4
    46ec:      	ldp	x9, x10, [x10]
    46f0:      	lsr	x11, x9, #8
    46f4:      	and	w12, w11, #0xf
    46f8:      	and	w11, w11, #0xff
    46fc:      	sub	w12, w12, #0x1
    4700:      	sub	w13, w11, #0x10
    4704:      	cmp	w12, #0xd
    4708:      	mov	w12, #0x70              ; =112
    470c:      	ccmp	w13, w12, #0x2, lo
    4710:      	b.hs	0x479c <_stogir.locals.validate+0x288>
    4714:      	ubfx	x12, x9, #8, #4
    4718:      	adrp	x13, 0x4000 <_stogir.conversion.policy+0x1dc>
		0000000000004718:  ARM64_RELOC_PAGE21	l_switch.table.stogir.types.size
    471c:      	add	x13, x13, #0x0
		000000000000471c:  ARM64_RELOC_PAGEOFF12	l_switch.table.stogir.types.size
    4720:      	lsr	w11, w11, #4
    4724:      	add	x12, x13, x12
    4728:      	ldurb	w12, [x12, #-0x1]
    472c:      	sub	w11, w11, #0x1
    4730:      	lsl	w27, w12, w11
    4734:      	b	0x47c0 <_stogir.locals.validate+0x2ac>
    4738:      	tbz	w9, #0x1f, 0x4780 <_stogir.locals.validate+0x26c>
    473c:      	ldr	x10, [x1, #0x30]
    4740:      	ldr	x11, [x1, #0x58]
    4744:      	cmp	x10, x11
    4748:      	b.ne	0x4780 <_stogir.locals.validate+0x26c>
    474c:      	sxtw	x11, w9
    4750:      	cmn	x10, x11
    4754:      	b.lt	0x4780 <_stogir.locals.validate+0x26c>
    4758:      	ldr	x10, [x1, #0x50]
    475c:      	mvn	x11, x11
    4760:      	ldr	w10, [x10, x11, lsl #2]
    4764:      	cmp	w10, #0x0
    4768:      	b.le	0x4780 <_stogir.locals.validate+0x26c>
    476c:      	ldr	x10, [x1, #0x28]
    4770:      	mvn	w11, w9
    4774:      	mov	w2, w9
    4778:      	add	x10, x10, w11, uxtw #4
    477c:      	b	0x46ec <_stogir.locals.validate+0x1d8>
    4780:      	adrp	x10, 0x4000 <_stogir.conversion.policy+0x1dc>
		0000000000004780:  ARM64_RELOC_PAGE21	l_str.438
    4784:      	add	x10, x10, #0x0
		0000000000004784:  ARM64_RELOC_PAGEOFF12	l_str.438
    4788:      	mov	w11, #0x16              ; =22
    478c:      	mov	w8, #0x1                ; =1
    4790:      	stp	x10, x11, [x0, #0x8]
    4794:      	str	w8, [x0]
    4798:      	b	0x4680 <_stogir.locals.validate+0x16c>
    479c:      	ubfx	w11, w9, #8, #8
    47a0:      	cmp	w11, #0xd
    47a4:      	b.hi	0x47bc <_stogir.locals.validate+0x2a8>
    47a8:      	ubfx	x11, x9, #8, #4
    47ac:      	adrp	x12, 0x4000 <_stogir.conversion.policy+0x1dc>
		00000000000047ac:  ARM64_RELOC_PAGE21	l_switch.table.stogir.types.size.24
    47b0:      	add	x12, x12, #0x0
		00000000000047b0:  ARM64_RELOC_PAGEOFF12	l_switch.table.stogir.types.size.24
    47b4:      	ldrb	w27, [x12, x11]
    47b8:      	b	0x47c0 <_stogir.locals.validate+0x2ac>
    47bc:      	mov	w27, #-0x1              ; =-1
    47c0:      	lsr	x11, x10, #32
    47c4:      	cmp	x11, #0x0
    47c8:      	csel	w12, w27, w11, eq
    47cc:      	cmp	w10, #0x0
    47d0:      	cset	w13, eq
    47d4:      	cmp	w10, #0x1
    47d8:      	b.lt	0x4824 <_stogir.locals.validate+0x310>
    47dc:      	ldr	x11, [x1, #0x140]
    47e0:      	and	x10, x10, #0x7fffffff
    47e4:      	cmp	x11, x10
    47e8:      	b.ge	0x47f4 <_stogir.locals.validate+0x2e0>
    47ec:      	mov	w13, wzr
    47f0:      	b	0x4824 <_stogir.locals.validate+0x310>
    47f4:      	mov	w11, #0x18              ; =24
    47f8:      	ldr	x13, [x1, #0x138]
    47fc:      	umaddl	x10, w10, w11, x13
    4800:      	ldr	x13, [x1, #0x118]
    4804:      	ldp	x11, x10, [x10, #-0x18]
    4808:      	orr	x14, x11, x10
    480c:      	cmn	x14, #0x1
    4810:      	cset	w14, gt
    4814:      	subs	x11, x13, x11
    4818:      	csel	w13, wzr, w14, lt
    481c:      	cmp	x10, x11
    4820:      	csel	w13, wzr, w13, gt
    4824:      	cmp	w2, #0x1
    4828:      	adrp	x10, 0x4000 <_stogir.conversion.policy+0x1dc>
		0000000000004828:  ARM64_RELOC_PAGE21	l_str.439
    482c:      	add	x10, x10, #0x0
		000000000000482c:  ARM64_RELOC_PAGEOFF12	l_str.439
    4830:      	mov	w11, #0x1c              ; =28
    4834:      	b.lt	0x478c <_stogir.locals.validate+0x278>
    4838:      	and	x14, x9, #0xff
    483c:      	cmp	x14, #0x48
    4840:      	b.ne	0x478c <_stogir.locals.validate+0x278>
    4844:      	ldr	w8, [x8, w2, uxtw #2]
    4848:      	cmp	w8, #0x3
    484c:      	ccmp	w27, #0x0, #0x4, eq
    4850:      	cset	w8, gt
    4854:      	tst	w8, w13
    4858:      	b.eq	0x48c4 <_stogir.locals.validate+0x3b0>
    485c:      	sxtw	x8, w12
    4860:      	mov	w11, #0x1c              ; =28
    4864:      	cmp	w8, #0x1
    4868:      	b.lt	0x478c <_stogir.locals.validate+0x278>
    486c:      	sub	x12, x8, #0x1
    4870:      	and	x8, x8, x12
    4874:      	cbnz	x8, 0x478c <_stogir.locals.validate+0x278>
    4878:      	lsr	x21, x9, #32
    487c:      	mov	x28, x0
    4880:      	add	x0, sp, #0x58
    4884:      	mov	x20, x1
    4888:      	mov	w2, w21
    488c:      	bl	0x488c <_stogir.locals.validate+0x378>
		000000000000488c:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    4890:      	ldr	w8, [sp, #0x58]
    4894:      	cbz	w8, 0x48cc <_stogir.locals.validate+0x3b8>
    4898:      	cmp	w21, #0x1
    489c:      	b.lt	0x48b4 <_stogir.locals.validate+0x3a0>
    48a0:      	ldr	w8, [sp, #0x60]
    48a4:      	and	w8, w8, #0xfe
    48a8:      	sub	w8, w8, #0x72
    48ac:      	cmn	w8, #0xb
    48b0:      	b.hi	0x48e0 <_stogir.locals.validate+0x3cc>
    48b4:      	adrp	x10, 0x4000 <_stogir.conversion.policy+0x1dc>
		00000000000048b4:  ARM64_RELOC_PAGE21	l_str.441
    48b8:      	add	x10, x10, #0x0
		00000000000048b8:  ARM64_RELOC_PAGEOFF12	l_str.441
    48bc:      	mov	w11, #0x2c              ; =44
    48c0:      	b	0x48d8 <_stogir.locals.validate+0x3c4>
    48c4:      	mov	w11, #0x1c              ; =28
    48c8:      	b	0x478c <_stogir.locals.validate+0x278>
    48cc:      	adrp	x10, 0x4000 <_stogir.conversion.policy+0x1dc>
		00000000000048cc:  ARM64_RELOC_PAGE21	l_str.440
    48d0:      	add	x10, x10, #0x0
		00000000000048d0:  ARM64_RELOC_PAGEOFF12	l_str.440
    48d4:      	mov	w11, #0x1d              ; =29
    48d8:      	mov	x0, x28
    48dc:      	b	0x478c <_stogir.locals.validate+0x278>
    48e0:      	cmp	w25, #0x48
    48e4:      	b.ne	0x48f4 <_stogir.locals.validate+0x3e0>
    48e8:      	str	wzr, [x28]
    48ec:      	str	w27, [x28, #0x8]
    48f0:      	b	0x4680 <_stogir.locals.validate+0x16c>
    48f4:      	cmp	w25, #0x41
    48f8:      	b.ne	0x4918 <_stogir.locals.validate+0x404>
    48fc:      	and	x8, x22, #0xff00
    4900:      	cmp	x8, #0x600
    4904:      	b.ne	0x49c4 <_stogir.locals.validate+0x4b0>
    4908:      	mov	w8, #0x8                ; =8
    490c:      	str	wzr, [x28]
    4910:      	str	w8, [x28, #0x8]
    4914:      	b	0x4680 <_stogir.locals.validate+0x16c>
    4918:      	add	x0, sp, #0x8
    491c:      	mov	x1, x20
    4920:      	mov	w2, w19
    4924:      	bl	0x4924 <_stogir.locals.validate+0x410>
		0000000000004924:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    4928:      	ldr	w8, [sp, #0x8]
    492c:      	cbz	w8, 0x49dc <_stogir.locals.validate+0x4c8>
    4930:      	cmp	w19, #0x1
    4934:      	b.lt	0x49b4 <_stogir.locals.validate+0x4a0>
    4938:      	ldrb	w8, [sp, #0x10]
    493c:      	sub	w9, w8, #0x4f
    4940:      	cmp	w9, #0x33
    4944:      	b.hi	0x49b4 <_stogir.locals.validate+0x4a0>
    4948:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		0000000000004948:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.PROPERTIES
    494c:      	add	x9, x9, #0x0
		000000000000494c:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.PROPERTIES
    4950:      	ldrb	w8, [x9, x8]
    4954:      	tbnz	w8, #0x2, 0x49b4 <_stogir.locals.validate+0x4a0>
    4958:      	cbz	w23, 0x4978 <_stogir.locals.validate+0x464>
    495c:      	lsr	x2, x26, #32
    4960:      	add	x0, sp, #0x30
    4964:      	mov	x1, x20
    4968:      	bl	0x4968 <_stogir.locals.validate+0x454>
		0000000000004968:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    496c:      	ldr	w8, [sp, #0x30]
    4970:      	cbz	w8, 0x4a10 <_stogir.locals.validate+0x4fc>
    4974:      	ldr	w24, [sp, #0x38]
    4978:      	ubfx	w0, w24, #8, #8
    497c:      	bl	0x497c <_stogir.locals.validate+0x468>
		000000000000497c:  ARM64_RELOC_BRANCH26	_stogir.types.size
    4980:      	cmp	w0, #0x1
    4984:      	b.lt	0x49f8 <_stogir.locals.validate+0x4e4>
    4988:      	cmp	w0, w27
    498c:      	b.hi	0x49f8 <_stogir.locals.validate+0x4e4>
    4990:      	tst	x22, #0xff00
    4994:      	csel	w8, wzr, w23, eq
    4998:      	tbnz	w8, #0x0, 0x49f8 <_stogir.locals.validate+0x4e4>
    499c:      	and	w8, w24, #0xff
    49a0:      	cmp	w8, #0x48
    49a4:      	b.eq	0x49f8 <_stogir.locals.validate+0x4e4>
    49a8:      	str	wzr, [x28]
    49ac:      	str	w0, [x28, #0x8]
    49b0:      	b	0x4680 <_stogir.locals.validate+0x16c>
    49b4:      	mov	w8, #0x1                ; =1
    49b8:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		00000000000049b8:  ARM64_RELOC_PAGE21	l_str.446
    49bc:      	add	x9, x9, #0x0
		00000000000049bc:  ARM64_RELOC_PAGEOFF12	l_str.446
    49c0:      	b	0x49e8 <_stogir.locals.validate+0x4d4>
    49c4:      	mov	w8, #0x1                ; =1
    49c8:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		00000000000049c8:  ARM64_RELOC_PAGE21	l_str.444
    49cc:      	add	x9, x9, #0x0
		00000000000049cc:  ARM64_RELOC_PAGEOFF12	l_str.444
    49d0:      	str	w8, [x28]
    49d4:      	mov	w8, #0x21               ; =33
    49d8:      	b	0x49f0 <_stogir.locals.validate+0x4dc>
    49dc:      	mov	w8, #0x1                ; =1
    49e0:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		00000000000049e0:  ARM64_RELOC_PAGE21	l_str.445
    49e4:      	add	x9, x9, #0x0
		00000000000049e4:  ARM64_RELOC_PAGEOFF12	l_str.445
    49e8:      	str	w8, [x28]
    49ec:      	mov	w8, #0x1c               ; =28
    49f0:      	stp	x9, x8, [x28, #0x8]
    49f4:      	b	0x4680 <_stogir.locals.validate+0x16c>
    49f8:      	mov	w8, #0x1                ; =1
    49fc:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		00000000000049fc:  ARM64_RELOC_PAGE21	l_str.448
    4a00:      	add	x9, x9, #0x0
		0000000000004a00:  ARM64_RELOC_PAGEOFF12	l_str.448
    4a04:      	str	w8, [x28]
    4a08:      	mov	w8, #0x23               ; =35
    4a0c:      	b	0x49f0 <_stogir.locals.validate+0x4dc>
    4a10:      	mov	w8, #0x1                ; =1
    4a14:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		0000000000004a14:  ARM64_RELOC_PAGE21	l_str.447
    4a18:      	add	x9, x9, #0x0
		0000000000004a18:  ARM64_RELOC_PAGEOFF12	l_str.447
    4a1c:      	str	w8, [x28]
    4a20:      	mov	w8, #0x19               ; =25
    4a24:      	b	0x49f0 <_stogir.locals.validate+0x4dc>

0000000000004a28 <_stogir.stack.constant-size-aligned>:
    4a28:      	cmp	x3, #0x10
    4a2c:      	b.lt	0x4ab8 <_stogir.stack.constant-size-aligned+0x90>
    4a30:      	sub	x8, x3, #0x1
    4a34:      	and	x8, x3, x8
    4a38:      	cbnz	x8, 0x4ab8 <_stogir.stack.constant-size-aligned+0x90>
    4a3c:      	cmp	w2, #0x1
    4a40:      	b.lt	0x4ad4 <_stogir.stack.constant-size-aligned+0xac>
    4a44:      	ldr	x9, [x1, #0x8]
    4a48:      	mov	w8, w2
    4a4c:      	cmp	x9, x8
    4a50:      	b.le	0x4b30 <_stogir.stack.constant-size-aligned+0x108>
    4a54:      	ldr	x9, [x1, #0x80]
    4a58:      	cmp	x9, x8
    4a5c:      	b.le	0x4b30 <_stogir.stack.constant-size-aligned+0x108>
    4a60:      	ldr	x9, [x1, #0x78]
    4a64:      	ldr	w9, [x9, x8, lsl #2]
    4a68:      	tbnz	w9, #0x1f, 0x4b30 <_stogir.stack.constant-size-aligned+0x108>
    4a6c:      	ldr	x9, [x1]
    4a70:      	add	x8, x9, x8, lsl #4
    4a74:      	ldp	x10, x8, [x8]
    4a78:      	ubfx	x9, x10, #8, #8
    4a7c:      	cmp	w9, #0xd
    4a80:      	b.hi	0x4b24 <_stogir.stack.constant-size-aligned+0xfc>
    4a84:      	adrp	x11, 0x4000 <_stogir.conversion.policy+0x1dc>
		0000000000004a84:  ARM64_RELOC_PAGE21	ltmp1
    4a88:      	add	x11, x11, #0x0
		0000000000004a88:  ARM64_RELOC_PAGEOFF12	ltmp1
    4a8c:      	mov	w12, wzr
    4a90:      	adr	x14, 0x4aa8 <_stogir.stack.constant-size-aligned+0x80>
    4a94:      	ldrb	w13, [x11, x9]
    4a98:      	add	x14, x14, x13, lsl #2
    4a9c:      	mov	w11, w9
    4aa0:      	mov	w13, #0x1               ; =1
    4aa4:      	br	x14
    4aa8:      	mov	w13, wzr
    4aac:      	mov	w12, wzr
    4ab0:      	mov	w11, #0x8               ; =8
    4ab4:      	b	0x4b78 <_stogir.stack.constant-size-aligned+0x150>
    4ab8:      	mov	w8, #0x1                ; =1
    4abc:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		0000000000004abc:  ARM64_RELOC_PAGE21	l_str.582
    4ac0:      	add	x9, x9, #0x0
		0000000000004ac0:  ARM64_RELOC_PAGEOFF12	l_str.582
    4ac4:      	str	w8, [x0]
    4ac8:      	mov	w8, #0x20               ; =32
    4acc:      	stp	x9, x8, [x0, #0x8]
    4ad0:      	ret
    4ad4:      	tbz	w2, #0x1f, 0x4b30 <_stogir.stack.constant-size-aligned+0x108>
    4ad8:      	ldr	x8, [x1, #0x30]
    4adc:      	ldr	x9, [x1, #0x58]
    4ae0:      	cmp	x8, x9
    4ae4:      	b.ne	0x4b30 <_stogir.stack.constant-size-aligned+0x108>
    4ae8:      	sxtw	x9, w2
    4aec:      	cmn	x8, x9
    4af0:      	b.lt	0x4b30 <_stogir.stack.constant-size-aligned+0x108>
    4af4:      	ldr	x8, [x1, #0x50]
    4af8:      	mvn	x9, x9
    4afc:      	ldr	w8, [x8, x9, lsl #2]
    4b00:      	cmp	w8, #0x0
    4b04:      	b.le	0x4b30 <_stogir.stack.constant-size-aligned+0x108>
    4b08:      	ldr	x8, [x1, #0x28]
    4b0c:      	mvn	w9, w2
    4b10:      	add	x8, x8, w9, uxtw #4
    4b14:      	ldp	x10, x8, [x8]
    4b18:      	ubfx	x9, x10, #8, #8
    4b1c:      	cmp	w9, #0xd
    4b20:      	b.ls	0x4a84 <_stogir.stack.constant-size-aligned+0x5c>
    4b24:      	mov	w11, #-0x8              ; =-8
    4b28:      	mov	w13, #0x1               ; =1
    4b2c:      	b	0x4b54 <_stogir.stack.constant-size-aligned+0x12c>
    4b30:      	mov	w8, #0x1                ; =1
    4b34:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		0000000000004b34:  ARM64_RELOC_PAGE21	l_str.583
    4b38:      	add	x9, x9, #0x0
		0000000000004b38:  ARM64_RELOC_PAGEOFF12	l_str.583
    4b3c:      	str	w8, [x0]
    4b40:      	mov	w8, #0x18               ; =24
    4b44:      	stp	x9, x8, [x0, #0x8]
    4b48:      	ret
    4b4c:      	mov	w13, wzr
    4b50:      	mov	w11, #0x40              ; =64
    4b54:      	mov	w12, #0x1               ; =1
    4b58:      	b	0x4b78 <_stogir.stack.constant-size-aligned+0x150>
    4b5c:      	mov	w13, wzr
    4b60:      	mov	w12, wzr
    4b64:      	mov	w11, #0x20              ; =32
    4b68:      	b	0x4b78 <_stogir.stack.constant-size-aligned+0x150>
    4b6c:      	mov	w13, wzr
    4b70:      	mov	w12, wzr
    4b74:      	mov	w11, #0x10              ; =16
    4b78:      	tbz	w2, #0x1f, 0x4bf0 <_stogir.stack.constant-size-aligned+0x1c8>
    4b7c:      	sub	w14, w9, #0x1
    4b80:      	cmp	w14, #0xa
    4b84:      	b.hi	0x4bf0 <_stogir.stack.constant-size-aligned+0x1c8>
    4b88:      	and	w10, w10, #0xff
    4b8c:      	cmp	w10, #0x49
    4b90:      	ccmp	w10, w9, #0x4, ne
    4b94:      	csinc	w10, w13, wzr, eq
    4b98:      	tbnz	w10, #0x0, 0x4bf0 <_stogir.stack.constant-size-aligned+0x1c8>
    4b9c:      	lsr	x10, x8, x11
    4ba0:      	cmp	x10, #0x0
    4ba4:      	csinc	w10, w12, wzr, ne
    4ba8:      	cbz	w10, 0x4bf0 <_stogir.stack.constant-size-aligned+0x1c8>
    4bac:      	sub	w9, w9, #0x7
    4bb0:      	cmp	w9, #0x4
    4bb4:      	b.hi	0x4bc4 <_stogir.stack.constant-size-aligned+0x19c>
    4bb8:      	sub	w9, w11, #0x1
    4bbc:      	lsr	x9, x8, x9
    4bc0:      	tbnz	w9, #0x0, 0x4bf0 <_stogir.stack.constant-size-aligned+0x1c8>
    4bc4:      	mov	x9, #-0x8000000000000000 ; =-9223372036854775808
    4bc8:      	sub	x9, x9, x3
    4bcc:      	cmp	x8, x9
    4bd0:      	b.hi	0x4bf0 <_stogir.stack.constant-size-aligned+0x1c8>
    4bd4:      	add	x8, x3, x8
    4bd8:      	neg	x9, x3
    4bdc:      	str	wzr, [x0]
    4be0:      	sub	x8, x8, #0x1
    4be4:      	and	x8, x8, x9
    4be8:      	str	x8, [x0, #0x8]
    4bec:      	ret
    4bf0:      	mov	w8, #0x1                ; =1
    4bf4:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		0000000000004bf4:  ARM64_RELOC_PAGE21	l_str.584
    4bf8:      	add	x9, x9, #0x0
		0000000000004bf8:  ARM64_RELOC_PAGEOFF12	l_str.584
    4bfc:      	str	w8, [x0]
    4c00:      	mov	w8, #0x30               ; =48
    4c04:      	stp	x9, x8, [x0, #0x8]
    4c08:      	ret

0000000000004c0c <_stogir.switch.key>:
    4c0c:      	sub	w9, w3, #0x1
    4c10:      	cmp	w9, #0xb
    4c14:      	b.hs	0x4c80 <_stogir.switch.key+0x74>
    4c18:      	cmp	w2, #0x1
    4c1c:      	b.lt	0x4ca4 <_stogir.switch.key+0x98>
    4c20:      	ldr	x10, [x1, #0x8]
    4c24:      	mov	w8, w2
    4c28:      	cmp	x10, x8
    4c2c:      	b.le	0x4d14 <_stogir.switch.key+0x108>
    4c30:      	ldr	x10, [x1, #0x80]
    4c34:      	cmp	x10, x8
    4c38:      	b.le	0x4d14 <_stogir.switch.key+0x108>
    4c3c:      	ldr	x10, [x1, #0x78]
    4c40:      	ldr	w10, [x10, x8, lsl #2]
    4c44:      	tbnz	w10, #0x1f, 0x4d14 <_stogir.switch.key+0x108>
    4c48:      	ldr	x10, [x1]
    4c4c:      	add	x8, x10, x8, lsl #4
    4c50:      	mov	w10, wzr
    4c54:      	cmp	w3, #0x6
    4c58:      	mov	w11, #0x8               ; =8
    4c5c:      	b.gt	0x4cf4 <_stogir.switch.key+0xe8>
    4c60:      	cmp	w3, #0x3
    4c64:      	b.le	0x4d00 <_stogir.switch.key+0xf4>
    4c68:      	sub	w9, w3, #0x5
    4c6c:      	cmp	w9, #0x2
    4c70:      	b.hs	0x4d40 <_stogir.switch.key+0x134>
    4c74:      	mov	w10, #0x1               ; =1
    4c78:      	mov	w11, #0x40              ; =64
    4c7c:      	b	0x4d48 <_stogir.switch.key+0x13c>
    4c80:      	mov	w8, #0x1                ; =1
    4c84:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		0000000000004c84:  ARM64_RELOC_PAGE21	l_str.613
    4c88:      	add	x9, x9, #0x0
		0000000000004c88:  ARM64_RELOC_PAGEOFF12	l_str.613
    4c8c:      	str	w8, [x0]
    4c90:      	mov	w8, #0x24               ; =36
    4c94:      	str	x9, [x0, #0x8]
    4c98:      	mov	w9, #0x10               ; =16
    4c9c:      	str	x8, [x0, x9]
    4ca0:      	ret
    4ca4:      	tbz	w2, #0x1f, 0x4d14 <_stogir.switch.key+0x108>
    4ca8:      	ldr	x8, [x1, #0x30]
    4cac:      	ldr	x10, [x1, #0x58]
    4cb0:      	cmp	x8, x10
    4cb4:      	b.ne	0x4d14 <_stogir.switch.key+0x108>
    4cb8:      	sxtw	x10, w2
    4cbc:      	cmn	x8, x10
    4cc0:      	b.lt	0x4d14 <_stogir.switch.key+0x108>
    4cc4:      	ldr	x8, [x1, #0x50]
    4cc8:      	mvn	x10, x10
    4ccc:      	ldr	w8, [x8, x10, lsl #2]
    4cd0:      	cmp	w8, #0x0
    4cd4:      	b.le	0x4d14 <_stogir.switch.key+0x108>
    4cd8:      	ldr	x8, [x1, #0x28]
    4cdc:      	mvn	w10, w2
    4ce0:      	add	x8, x8, w10, uxtw #4
    4ce4:      	mov	w10, wzr
    4ce8:      	cmp	w3, #0x6
    4cec:      	mov	w11, #0x8               ; =8
    4cf0:      	b.le	0x4c60 <_stogir.switch.key+0x54>
    4cf4:      	cmp	w3, #0x9
    4cf8:      	b.gt	0x4d38 <_stogir.switch.key+0x12c>
    4cfc:      	sub	w9, w3, #0x7
    4d00:      	cmp	w9, #0x2
    4d04:      	b.lo	0x4d48 <_stogir.switch.key+0x13c>
    4d08:      	mov	w10, wzr
    4d0c:      	mov	w11, #0x10              ; =16
    4d10:      	b	0x4d48 <_stogir.switch.key+0x13c>
    4d14:      	mov	w8, #0x1                ; =1
    4d18:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		0000000000004d18:  ARM64_RELOC_PAGE21	l_str.614
    4d1c:      	add	x9, x9, #0x0
		0000000000004d1c:  ARM64_RELOC_PAGEOFF12	l_str.614
    4d20:      	str	w8, [x0]
    4d24:      	mov	w8, #0x1c               ; =28
    4d28:      	str	x9, [x0, #0x8]
    4d2c:      	mov	w9, #0x10               ; =16
    4d30:      	str	x8, [x0, x9]
    4d34:      	ret
    4d38:      	cmp	w3, #0xa
    4d3c:      	b.ne	0x4c74 <_stogir.switch.key+0x68>
    4d40:      	mov	w10, wzr
    4d44:      	mov	w11, #0x20              ; =32
    4d48:      	tbz	w2, #0x1f, 0x4d90 <_stogir.switch.key+0x184>
    4d4c:      	ldr	x9, [x8]
    4d50:      	mov	w13, #0x49              ; =73
    4d54:      	ubfx	w12, w9, #8, #8
    4d58:      	and	w9, w9, #0xff
    4d5c:      	cmp	w9, w12
    4d60:      	ccmp	w9, w13, #0x4, ne
    4d64:      	ccmp	w12, w3, #0x0, eq
    4d68:      	b.ne	0x4d90 <_stogir.switch.key+0x184>
    4d6c:      	ldr	x8, [x8, #0x8]
    4d70:      	lsr	x9, x8, x11
    4d74:      	cmp	x9, #0x0
    4d78:      	csinc	w9, w10, wzr, ne
    4d7c:      	cbz	w9, 0x4d90 <_stogir.switch.key+0x184>
    4d80:      	cmp	w3, #0x1
    4d84:      	b.ne	0x4db4 <_stogir.switch.key+0x1a8>
    4d88:      	cmp	x8, #0x1
    4d8c:      	b.ls	0x4dec <_stogir.switch.key+0x1e0>
    4d90:      	mov	w8, #0x1                ; =1
    4d94:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		0000000000004d94:  ARM64_RELOC_PAGE21	l_str.615
    4d98:      	add	x9, x9, #0x0
		0000000000004d98:  ARM64_RELOC_PAGEOFF12	l_str.615
    4d9c:      	str	w8, [x0]
    4da0:      	mov	w8, #0x30               ; =48
    4da4:      	str	x9, [x0, #0x8]
    4da8:      	mov	w9, #0x10               ; =16
    4dac:      	str	x8, [x0, x9]
    4db0:      	ret
    4db4:      	sub	w9, w3, #0x7
    4db8:      	str	wzr, [x0]
    4dbc:      	cmp	w9, #0x4
    4dc0:      	b.hi	0x4df0 <_stogir.switch.key+0x1e4>
    4dc4:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		0000000000004dc4:  ARM64_RELOC_PAGE21	l_switch.table.stogir.switch.key
    4dc8:      	add	x9, x9, #0x0
		0000000000004dc8:  ARM64_RELOC_PAGEOFF12	l_switch.table.stogir.switch.key
    4dcc:      	mov	w10, #0x1               ; =1
    4dd0:      	add	x9, x9, w3, uxtw
    4dd4:      	ldurb	w9, [x9, #-0x7]
    4dd8:      	lsl	x9, x10, x9
    4ddc:      	eor	x8, x9, x8
    4de0:      	mov	w9, #0x8                ; =8
    4de4:      	str	x8, [x0, x9]
    4de8:      	ret
    4dec:      	str	wzr, [x0]
    4df0:      	mov	w9, #0x8                ; =8
    4df4:      	str	x8, [x0, x9]
    4df8:      	ret

0000000000004dfc <_stogir.switch.switch-inputs>:
    4dfc:      	cmp	w2, #0x1
    4e00:      	b.lt	0x4ec0 <_stogir.switch.switch-inputs+0xc4>
    4e04:      	ldr	x8, [x1, #0x8]
    4e08:      	mov	w12, w2
    4e0c:      	cmp	x8, x12
    4e10:      	b.le	0x4f10 <_stogir.switch.switch-inputs+0x114>
    4e14:      	ldr	x9, [x1, #0x80]
    4e18:      	cmp	x9, x12
    4e1c:      	b.le	0x4f10 <_stogir.switch.switch-inputs+0x114>
    4e20:      	ldr	x10, [x1, #0x78]
    4e24:      	ldr	w11, [x10, x12, lsl #2]
    4e28:      	tbnz	w11, #0x1f, 0x4f10 <_stogir.switch.switch-inputs+0x114>
    4e2c:      	ldr	x11, [x1]
    4e30:      	lsl	x12, x12, #4
    4e34:      	ldr	x12, [x11, x12]
    4e38:      	and	w13, w12, #0xff
    4e3c:      	sub	w13, w13, #0x4f
    4e40:      	cmp	w13, #0x33
    4e44:      	b.hi	0x4ef4 <_stogir.switch.switch-inputs+0xf8>
    4e48:      	and	x12, x12, #0xff
    4e4c:      	adrp	x13, 0x4000 <_stogir.conversion.policy+0x1dc>
		0000000000004e4c:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.PROPERTIES
    4e50:      	add	x13, x13, #0x0
		0000000000004e50:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.PROPERTIES
    4e54:      	ldrb	w12, [x13, x12]
    4e58:      	tbnz	w12, #0x2, 0x4ef4 <_stogir.switch.switch-inputs+0xf8>
    4e5c:      	cmp	w3, #0x1
    4e60:      	b.lt	0x4f2c <_stogir.switch.switch-inputs+0x130>
    4e64:      	mov	w12, w3
    4e68:      	cmp	x8, x12
    4e6c:      	b.ls	0x4f70 <_stogir.switch.switch-inputs+0x174>
    4e70:      	cmp	x9, x12
    4e74:      	b.ls	0x4f70 <_stogir.switch.switch-inputs+0x174>
    4e78:      	ldr	w8, [x10, x12, lsl #2]
    4e7c:      	tbnz	w8, #0x1f, 0x4f70 <_stogir.switch.switch-inputs+0x174>
    4e80:      	add	x8, x11, x12, lsl #4
    4e84:      	ldr	x9, [x8]
    4e88:      	ubfx	w8, w9, #8, #8
    4e8c:      	and	x9, x9, #0xff
    4e90:      	sub	w10, w8, #0xc
    4e94:      	cmn	w10, #0xc
    4e98:      	mov	w10, #0x48              ; =72
    4e9c:      	ccmp	x9, x10, #0x4, hi
    4ea0:      	b.ne	0x4f8c <_stogir.switch.switch-inputs+0x190>
    4ea4:      	mov	w8, #0x1                ; =1
    4ea8:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		0000000000004ea8:  ARM64_RELOC_PAGE21	l_str.617
    4eac:      	add	x9, x9, #0x0
		0000000000004eac:  ARM64_RELOC_PAGEOFF12	l_str.617
    4eb0:      	str	w8, [x0]
    4eb4:      	mov	w8, #0x20               ; =32
    4eb8:      	stp	x9, x8, [x0, #0x8]
    4ebc:      	ret
    4ec0:      	tbz	w2, #0x1f, 0x4f10 <_stogir.switch.switch-inputs+0x114>
    4ec4:      	ldr	x8, [x1, #0x30]
    4ec8:      	ldr	x9, [x1, #0x58]
    4ecc:      	cmp	x8, x9
    4ed0:      	b.ne	0x4f10 <_stogir.switch.switch-inputs+0x114>
    4ed4:      	sxtw	x9, w2
    4ed8:      	cmn	x8, x9
    4edc:      	b.lt	0x4f10 <_stogir.switch.switch-inputs+0x114>
    4ee0:      	ldr	x8, [x1, #0x50]
    4ee4:      	mvn	x9, x9
    4ee8:      	ldr	w8, [x8, x9, lsl #2]
    4eec:      	cmp	w8, #0x0
    4ef0:      	b.le	0x4f10 <_stogir.switch.switch-inputs+0x114>
    4ef4:      	mov	w8, #0x1                ; =1
    4ef8:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		0000000000004ef8:  ARM64_RELOC_PAGE21	l_str.619
    4efc:      	add	x9, x9, #0x0
		0000000000004efc:  ARM64_RELOC_PAGEOFF12	l_str.619
    4f00:      	str	w8, [x0]
    4f04:      	mov	w8, #0x16               ; =22
    4f08:      	stp	x9, x8, [x0, #0x8]
    4f0c:      	ret
    4f10:      	mov	w8, #0x1                ; =1
    4f14:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		0000000000004f14:  ARM64_RELOC_PAGE21	l_str.618
    4f18:      	add	x9, x9, #0x0
		0000000000004f18:  ARM64_RELOC_PAGEOFF12	l_str.618
    4f1c:      	str	w8, [x0]
    4f20:      	mov	w8, #0x16               ; =22
    4f24:      	stp	x9, x8, [x0, #0x8]
    4f28:      	ret
    4f2c:      	tbz	w3, #0x1f, 0x4f70 <_stogir.switch.switch-inputs+0x174>
    4f30:      	ldr	x8, [x1, #0x30]
    4f34:      	ldr	x9, [x1, #0x58]
    4f38:      	cmp	x8, x9
    4f3c:      	b.ne	0x4f70 <_stogir.switch.switch-inputs+0x174>
    4f40:      	sxtw	x9, w3
    4f44:      	cmn	x8, x9
    4f48:      	b.lt	0x4f70 <_stogir.switch.switch-inputs+0x174>
    4f4c:      	ldr	x8, [x1, #0x50]
    4f50:      	mvn	x9, x9
    4f54:      	ldr	w8, [x8, x9, lsl #2]
    4f58:      	cmp	w8, #0x0
    4f5c:      	b.le	0x4f70 <_stogir.switch.switch-inputs+0x174>
    4f60:      	ldr	x8, [x1, #0x28]
    4f64:      	mvn	w9, w3
    4f68:      	add	x8, x8, w9, uxtw #4
    4f6c:      	b	0x4e84 <_stogir.switch.switch-inputs+0x88>
    4f70:      	mov	w8, #0x1                ; =1
    4f74:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		0000000000004f74:  ARM64_RELOC_PAGE21	l_str.616
    4f78:      	add	x9, x9, #0x0
		0000000000004f78:  ARM64_RELOC_PAGEOFF12	l_str.616
    4f7c:      	str	w8, [x0]
    4f80:      	mov	w8, #0x17               ; =23
    4f84:      	stp	x9, x8, [x0, #0x8]
    4f88:      	ret
    4f8c:      	str	wzr, [x0]
    4f90:      	str	w8, [x0, #0x8]
    4f94:      	ret

0000000000004f98 <_stogir.types.scalar-size>:
    4f98:      	cmp	w0, #0xd
    4f9c:      	b.hi	0x4fb0 <_stogir.types.scalar-size+0x18>
    4fa0:      	adrp	x8, 0x4000 <_stogir.conversion.policy+0x1dc>
		0000000000004fa0:  ARM64_RELOC_PAGE21	l_switch.table.stogir.types.size.24
    4fa4:      	add	x8, x8, #0x0
		0000000000004fa4:  ARM64_RELOC_PAGEOFF12	l_switch.table.stogir.types.size.24
    4fa8:      	ldrb	w0, [x8, w0, uxtw]
    4fac:      	ret
    4fb0:      	mov	w0, #-0x1               ; =-1
    4fb4:      	ret

0000000000004fb8 <_stogir.types.size>:
    4fb8:      	and	w8, w0, #0xf
    4fbc:      	mov	w9, #0x70               ; =112
    4fc0:      	sub	w11, w0, #0x10
    4fc4:      	sub	w10, w8, #0x1
    4fc8:      	cmp	w10, #0xd
    4fcc:      	ccmp	w11, w9, #0x2, lo
    4fd0:      	b.hs	0x4ff4 <_stogir.types.size+0x3c>
    4fd4:      	adrp	x9, 0x4000 <_stogir.conversion.policy+0x1dc>
		0000000000004fd4:  ARM64_RELOC_PAGE21	l_switch.table.stogir.types.size
    4fd8:      	add	x9, x9, #0x0
		0000000000004fd8:  ARM64_RELOC_PAGEOFF12	l_switch.table.stogir.types.size
    4fdc:      	add	x8, x9, w8, uxtw
    4fe0:      	lsr	w9, w0, #4
    4fe4:      	ldurb	w8, [x8, #-0x1]
    4fe8:      	sub	w9, w9, #0x1
    4fec:      	lsl	w0, w8, w9
    4ff0:      	ret
    4ff4:      	cmp	w0, #0xd
    4ff8:      	b.hi	0x500c <_stogir.types.size+0x54>
    4ffc:      	adrp	x8, 0x4000 <_stogir.conversion.policy+0x1dc>
		0000000000004ffc:  ARM64_RELOC_PAGE21	l_switch.table.stogir.types.size.24
    5000:      	add	x8, x8, #0x0
		0000000000005000:  ARM64_RELOC_PAGEOFF12	l_switch.table.stogir.types.size.24
    5004:      	ldrb	w0, [x8, w0, uxtw]
    5008:      	ret
    500c:      	mov	w0, #-0x1               ; =-1
    5010:      	ret

0000000000005014 <_stogir.vector-arithmetic.node?>:
    5014:      	cmp	w1, #0x1
    5018:      	b.lt	0x5098 <_stogir.vector-arithmetic.node?+0x84>
    501c:      	ldr	x9, [x0, #0x8]
    5020:      	mov	w8, w1
    5024:      	cmp	x9, x8
    5028:      	b.le	0x511c <_stogir.vector-arithmetic.node?+0x108>
    502c:      	ldr	x9, [x0, #0x80]
    5030:      	cmp	x9, x8
    5034:      	b.le	0x511c <_stogir.vector-arithmetic.node?+0x108>
    5038:      	ldr	x9, [x0, #0x78]
    503c:      	ldr	w9, [x9, x8, lsl #2]
    5040:      	tbnz	w9, #0x1f, 0x511c <_stogir.vector-arithmetic.node?+0x108>
    5044:      	ldr	x9, [x0]
    5048:      	add	x8, x9, x8, lsl #4
    504c:      	ldr	x8, [x8]
    5050:      	and	w9, w8, #0xff
    5054:      	cmp	w9, #0x39
    5058:      	b.hi	0x50e8 <_stogir.vector-arithmetic.node?+0xd4>
    505c:      	mov	x10, #0x80000000        ; =2147483648
    5060:      	and	x9, x8, #0xff
    5064:      	movk	x10, #0x2001, lsl #32
    5068:      	movk	x10, #0x3c0, lsl #48
    506c:      	lsr	x9, x10, x9
    5070:      	tbz	w9, #0x0, 0x50e8 <_stogir.vector-arithmetic.node?+0xd4>
    5074:      	lsr	w9, w8, #8
    5078:      	ubfx	w8, w8, #8, #4
    507c:      	and	w9, w9, #0xf0
    5080:      	sub	w8, w8, #0x1
    5084:      	sub	w9, w9, #0x10
    5088:      	cmp	w9, #0x70
    508c:      	ccmp	w8, #0xd, #0x2, lo
    5090:      	cset	w0, lo
    5094:      	ret
    5098:      	tbz	w1, #0x1f, 0x511c <_stogir.vector-arithmetic.node?+0x108>
    509c:      	ldr	x8, [x0, #0x30]
    50a0:      	ldr	x9, [x0, #0x58]
    50a4:      	cmp	x8, x9
    50a8:      	b.ne	0x511c <_stogir.vector-arithmetic.node?+0x108>
    50ac:      	sxtw	x9, w1
    50b0:      	cmn	x8, x9
    50b4:      	b.lt	0x511c <_stogir.vector-arithmetic.node?+0x108>
    50b8:      	ldr	x8, [x0, #0x50]
    50bc:      	mvn	x9, x9
    50c0:      	ldr	w8, [x8, x9, lsl #2]
    50c4:      	cmp	w8, #0x0
    50c8:      	b.le	0x511c <_stogir.vector-arithmetic.node?+0x108>
    50cc:      	ldr	x8, [x0, #0x28]
    50d0:      	mvn	w9, w1
    50d4:      	add	x8, x8, w9, uxtw #4
    50d8:      	ldr	x8, [x8]
    50dc:      	and	w9, w8, #0xff
    50e0:      	cmp	w9, #0x39
    50e4:      	b.ls	0x505c <_stogir.vector-arithmetic.node?+0x48>
    50e8:      	and	x9, x8, #0xfe
    50ec:      	cmp	x9, #0x3a
    50f0:      	b.eq	0x5074 <_stogir.vector-arithmetic.node?+0x60>
    50f4:      	and	w9, w8, #0xff
    50f8:      	mov	w0, wzr
    50fc:      	cmp	w9, #0x35
    5100:      	b.hi	0x5120 <_stogir.vector-arithmetic.node?+0x10c>
    5104:      	mov	x10, #0x3fc00000000000  ; =17944029765304320
    5108:      	and	x9, x8, #0xff
    510c:      	movk	x10, #0x7c00, lsl #16
    5110:      	lsr	x9, x10, x9
    5114:      	tbnz	w9, #0x0, 0x5074 <_stogir.vector-arithmetic.node?+0x60>
    5118:      	b	0x5120 <_stogir.vector-arithmetic.node?+0x10c>
    511c:      	mov	w0, wzr
    5120:      	ret

0000000000005124 <_stogir.vector.memory-inputs>:
    5124:      	and	w8, w2, #0xf
    5128:      	sub	w9, w2, #0x10
    512c:      	sub	w8, w8, #0x1
    5130:      	cmp	w8, #0xd
    5134:      	mov	w8, #0x70               ; =112
    5138:      	ccmp	w9, w8, #0x2, lo
    513c:      	b.hs	0x521c <_stogir.vector.memory-inputs+0xf8>
    5140:      	sub	sp, sp, #0x50
    5144:      	cmp	w3, #0x0
    5148:      	stp	x20, x19, [sp, #0x30]
    514c:      	stp	x29, x30, [sp, #0x40]
    5150:      	add	x29, sp, #0x40
    5154:      	b.le	0x5238 <_stogir.vector.memory-inputs+0x114>
    5158:      	ldr	x9, [x1, #0x8]
    515c:      	mov	w8, w3
    5160:      	cmp	x9, x8
    5164:      	b.le	0x5294 <_stogir.vector.memory-inputs+0x170>
    5168:      	ldr	x9, [x1, #0x80]
    516c:      	cmp	x9, x8
    5170:      	b.le	0x5294 <_stogir.vector.memory-inputs+0x170>
    5174:      	ldr	x9, [x1, #0x78]
    5178:      	ldr	w9, [x9, x8, lsl #2]
    517c:      	tbnz	w9, #0x1f, 0x5294 <_stogir.vector.memory-inputs+0x170>
    5180:      	ldr	x9, [x1]
    5184:      	lsl	x8, x8, #4
    5188:      	ldr	x8, [x9, x8]
    518c:      	and	w9, w8, #0xff
    5190:      	sub	w9, w9, #0x4f
    5194:      	cmp	w9, #0x33
    5198:      	b.hi	0x526c <_stogir.vector.memory-inputs+0x148>
    519c:      	and	x8, x8, #0xff
    51a0:      	adrp	x9, 0x5000 <_stogir.types.size+0x48>
		00000000000051a0:  ARM64_RELOC_PAGE21	_coil_def.stogir.opcode.PROPERTIES
    51a4:      	add	x9, x9, #0x0
		00000000000051a4:  ARM64_RELOC_PAGEOFF12	_coil_def.stogir.opcode.PROPERTIES
    51a8:      	ldrb	w8, [x9, x8]
    51ac:      	tbnz	w8, #0x2, 0x526c <_stogir.vector.memory-inputs+0x148>
    51b0:      	mov	w19, w2
    51b4:      	mov	x20, x0
    51b8:      	add	x0, sp, #0x8
    51bc:      	mov	w2, w4
    51c0:      	bl	0x51c0 <_stogir.vector.memory-inputs+0x9c>
		00000000000051c0:  ARM64_RELOC_BRANCH26	_stogir.graph.lookup
    51c4:      	ldr	w8, [sp, #0x8]
    51c8:      	cbz	w8, 0x52bc <_stogir.vector.memory-inputs+0x198>
    51cc:      	ldr	w9, [sp, #0x10]
    51d0:      	and	w8, w9, #0xff00
    51d4:      	cmp	w8, #0x600
    51d8:      	mov	x8, x20
    51dc:      	b.ne	0x51f4 <_stogir.vector.memory-inputs+0xd0>
    51e0:      	and	w9, w9, #0xff
    51e4:      	cmp	w9, #0x48
    51e8:      	b.eq	0x51f4 <_stogir.vector.memory-inputs+0xd0>
    51ec:      	cmp	w9, #0x46
    51f0:      	b.ne	0x52e4 <_stogir.vector.memory-inputs+0x1c0>
    51f4:      	mov	w9, #0x1                ; =1
    51f8:      	adrp	x10, 0x5000 <_stogir.types.size+0x48>
		00000000000051f8:  ARM64_RELOC_PAGE21	l_str.686
    51fc:      	add	x10, x10, #0x0
		00000000000051fc:  ARM64_RELOC_PAGEOFF12	l_str.686
    5200:      	str	w9, [x8]
    5204:      	mov	w9, #0x2b               ; =43
    5208:      	stp	x10, x9, [x8, #0x8]
    520c:      	ldp	x29, x30, [sp, #0x40]
    5210:      	ldp	x20, x19, [sp, #0x30]
    5214:      	add	sp, sp, #0x50
    5218:      	ret
    521c:      	mov	w8, #0x1                ; =1
    5220:      	adrp	x9, 0x5000 <_stogir.types.size+0x48>
		0000000000005220:  ARM64_RELOC_PAGE21	l_str.682
    5224:      	add	x9, x9, #0x0
		0000000000005224:  ARM64_RELOC_PAGEOFF12	l_str.682
    5228:      	str	w8, [x0]
    522c:      	mov	w8, #0x32               ; =50
    5230:      	stp	x9, x8, [x0, #0x8]
    5234:      	ret
    5238:      	tbz	w3, #0x1f, 0x5294 <_stogir.vector.memory-inputs+0x170>
    523c:      	ldr	x8, [x1, #0x30]
    5240:      	ldr	x9, [x1, #0x58]
    5244:      	cmp	x8, x9
    5248:      	b.ne	0x5294 <_stogir.vector.memory-inputs+0x170>
    524c:      	sxtw	x9, w3
    5250:      	cmn	x8, x9
    5254:      	b.lt	0x5294 <_stogir.vector.memory-inputs+0x170>
    5258:      	ldr	x8, [x1, #0x50]
    525c:      	mvn	x9, x9
    5260:      	ldr	w8, [x8, x9, lsl #2]
    5264:      	cmp	w8, #0x0
    5268:      	b.le	0x5294 <_stogir.vector.memory-inputs+0x170>
    526c:      	mov	w8, #0x1                ; =1
    5270:      	adrp	x9, 0x5000 <_stogir.types.size+0x48>
		0000000000005270:  ARM64_RELOC_PAGE21	l_str.684
    5274:      	add	x9, x9, #0x0
		0000000000005274:  ARM64_RELOC_PAGEOFF12	l_str.684
    5278:      	str	w8, [x0]
    527c:      	mov	w8, #0x2c               ; =44
    5280:      	stp	x9, x8, [x0, #0x8]
    5284:      	ldp	x29, x30, [sp, #0x40]
    5288:      	ldp	x20, x19, [sp, #0x30]
    528c:      	add	sp, sp, #0x50
    5290:      	ret
    5294:      	mov	w8, #0x1                ; =1
    5298:      	adrp	x9, 0x5000 <_stogir.types.size+0x48>
		0000000000005298:  ARM64_RELOC_PAGE21	l_str.683
    529c:      	add	x9, x9, #0x0
		000000000000529c:  ARM64_RELOC_PAGEOFF12	l_str.683
    52a0:      	str	w8, [x0]
    52a4:      	mov	w8, #0x1d               ; =29
    52a8:      	stp	x9, x8, [x0, #0x8]
    52ac:      	ldp	x29, x30, [sp, #0x40]
    52b0:      	ldp	x20, x19, [sp, #0x30]
    52b4:      	add	sp, sp, #0x50
    52b8:      	ret
    52bc:      	mov	w8, #0x1                ; =1
    52c0:      	adrp	x9, 0x5000 <_stogir.types.size+0x48>
		00000000000052c0:  ARM64_RELOC_PAGE21	l_str.685
    52c4:      	add	x9, x9, #0x0
		00000000000052c4:  ARM64_RELOC_PAGEOFF12	l_str.685
    52c8:      	str	w8, [x20]
    52cc:      	mov	w8, #0x1d               ; =29
    52d0:      	stp	x9, x8, [x20, #0x8]
    52d4:      	ldp	x29, x30, [sp, #0x40]
    52d8:      	ldp	x20, x19, [sp, #0x30]
    52dc:      	add	sp, sp, #0x50
    52e0:      	ret
    52e4:      	mov	w0, w19
    52e8:      	str	wzr, [x8]
    52ec:      	mov	x20, x8
    52f0:      	bl	0x52f0 <_stogir.vector.memory-inputs+0x1cc>
		00000000000052f0:  ARM64_RELOC_BRANCH26	_stogir.types.size
    52f4:      	str	w0, [x20, #0x8]
    52f8:      	ldp	x29, x30, [sp, #0x40]
    52fc:      	ldp	x20, x19, [sp, #0x30]
    5300:      	add	sp, sp, #0x50
    5304:      	ret

0000000000005308 <_stogir.vector.store-inputs>:
    5308:      	mov	w8, w3
    530c:      	mov	w3, w2
    5310:      	cmp	w4, #0x1
    5314:      	b.lt	0x5354 <_stogir.vector.store-inputs+0x4c>
    5318:      	ldr	x10, [x1, #0x8]
    531c:      	mov	w9, w4
    5320:      	cmp	x10, x9
    5324:      	b.le	0x53a0 <_stogir.vector.store-inputs+0x98>
    5328:      	ldr	x10, [x1, #0x80]
    532c:      	cmp	x10, x9
    5330:      	b.le	0x53a0 <_stogir.vector.store-inputs+0x98>
    5334:      	ldr	x10, [x1, #0x78]
    5338:      	ldr	w10, [x10, x9, lsl #2]
    533c:      	tbnz	w10, #0x1f, 0x53a0 <_stogir.vector.store-inputs+0x98>
    5340:      	ldr	x10, [x1]
    5344:      	add	x9, x10, x9, lsl #4
    5348:      	ldrb	w2, [x9, #0x1]
    534c:      	mov	w4, w8
    5350:      	b	0x5350 <_stogir.vector.store-inputs+0x48>
		0000000000005350:  ARM64_RELOC_BRANCH26	_stogir.vector.memory-inputs
    5354:      	tbz	w4, #0x1f, 0x53a0 <_stogir.vector.store-inputs+0x98>
    5358:      	ldr	x9, [x1, #0x30]
    535c:      	ldr	x10, [x1, #0x58]
    5360:      	cmp	x9, x10
    5364:      	b.ne	0x53a0 <_stogir.vector.store-inputs+0x98>
    5368:      	sxtw	x10, w4
    536c:      	cmn	x9, x10
    5370:      	b.lt	0x53a0 <_stogir.vector.store-inputs+0x98>
    5374:      	ldr	x9, [x1, #0x50]
    5378:      	mvn	x10, x10
    537c:      	ldr	w9, [x9, x10, lsl #2]
    5380:      	cmp	w9, #0x0
    5384:      	b.le	0x53a0 <_stogir.vector.store-inputs+0x98>
    5388:      	ldr	x9, [x1, #0x28]
    538c:      	mvn	w10, w4
    5390:      	add	x9, x9, w10, uxtw #4
    5394:      	ldrb	w2, [x9, #0x1]
    5398:      	mov	w4, w8
    539c:      	b	0x539c <_stogir.vector.store-inputs+0x94>
		000000000000539c:  ARM64_RELOC_BRANCH26	_stogir.vector.memory-inputs
    53a0:      	mov	w8, #0x1                ; =1
    53a4:      	adrp	x9, 0x5000 <_stogir.types.size+0x48>
		00000000000053a4:  ARM64_RELOC_PAGE21	l_str.687
    53a8:      	add	x9, x9, #0x0
		00000000000053a8:  ARM64_RELOC_PAGEOFF12	l_str.687
    53ac:      	str	w8, [x0]
    53b0:      	mov	w8, #0x1a               ; =26
    53b4:      	stp	x9, x8, [x0, #0x8]
    53b8:      	ret
