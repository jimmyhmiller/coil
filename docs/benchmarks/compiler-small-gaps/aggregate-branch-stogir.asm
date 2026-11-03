
/tmp/gap-aggregate-branch-stogir:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100000300 <_gap_aggregate_branch>:
100000300:     	sub	sp, sp, #0x10
100000304:     	str	x29, [sp]
100000308:     	str	x30, [sp, #0x8]
10000030c:     	mov	x29, sp
100000310:     	sub	sp, sp, #0x10
100000314:     	mov	x3, sp
100000318:     	ubfx	x2, x2, #0, #8
10000031c:     	orr	x4, x3, xzr
100000320:     	str	x0, [x4]
100000324:     	str	x1, [x4, #0x8]
100000328:     	movz	x17, #0x0, lsl #48
10000032c:     	cmp	x2, x17
100000330:     	b.eq	0x10000036c <_gap_aggregate_branch+0x6c>
100000334:     	orr	x0, x3, xzr
100000338:     	ldr	x1, [x0]
10000033c:     	add	x1, x1, #0x7
100000340:     	str	x1, [x0]
100000344:     	orr	x0, x3, xzr
100000348:     	add	x1, x3, #0x8
10000034c:     	ldr	x0, [x0]
100000350:     	ldr	x1, [x1]
100000354:     	add	x0, x1, x0
100000358:     	sub	sp, x29, #0x0
10000035c:     	ldr	x29, [sp]
100000360:     	ldr	x30, [sp, #0x8]
100000364:     	add	sp, sp, #0x10
100000368:     	ret
10000036c:     	add	x0, x3, #0x8
100000370:     	ldr	x1, [x0]
100000374:     	mov	x17, #0x3               ; =3
100000378:     	mul	x1, x1, x17
10000037c:     	str	x1, [x0]
100000380:     	b	0x100000344 <_gap_aggregate_branch+0x44>
100000384:     	udf	#0x0
