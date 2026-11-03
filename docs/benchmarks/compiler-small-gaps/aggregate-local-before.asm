
/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/build/compiler-small-gaps/aggregate-local-before:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100000300 <_gap_aggregate_local>:
100000300:     	sub	sp, sp, #0x10
100000304:     	str	x29, [sp]
100000308:     	str	x30, [sp, #0x8]
10000030c:     	mov	x29, sp
100000310:     	sub	sp, sp, #0x10
100000314:     	mov	x2, sp
100000318:     	add	x0, x0, #0x3
10000031c:     	mov	x17, #0x7               ; =7
100000320:     	mul	x1, x1, x17
100000324:     	sub	sp, sp, #0x10
100000328:     	mov	x3, sp
10000032c:     	orr	x4, x2, xzr
100000330:     	add	x2, x2, #0x8
100000334:     	movz	x17, #0x0, lsl #48
100000338:     	str	x17, [x3]
10000033c:     	movz	x17, #0x0, lsl #48
100000340:     	str	x17, [x3, #0x8]
100000344:     	ldr	x5, [x3]
100000348:     	str	x5, [x4]
10000034c:     	ldr	x3, [x3, #0x8]
100000350:     	str	x3, [x4, #0x8]
100000354:     	str	x0, [x4]
100000358:     	str	x1, [x2]
10000035c:     	ldr	x0, [x4]
100000360:     	ldr	x1, [x2]
100000364:     	add	x0, x1, x0
100000368:     	sub	sp, x29, #0x0
10000036c:     	ldr	x29, [sp]
100000370:     	ldr	x30, [sp, #0x8]
100000374:     	add	sp, sp, #0x10
100000378:     	ret
10000037c:     	udf	#0x0
