
build/bin/coil-normal-llvm-s3:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100053620 <_coil.compiler.parser.i64->str>:
100053620:     	sub	sp, sp, #0x70
100053624:     	stp	x24, x23, [sp, #0x30]
100053628:     	stp	x22, x21, [sp, #0x40]
10005362c:     	stp	x20, x19, [sp, #0x50]
100053630:     	stp	x29, x30, [sp, #0x60]
100053634:     	add	x29, sp, #0x60
100053638:     	add	x8, sp, #0x4
10005363c:     	cmp	x1, #0x0
100053640:     	mov	x21, x1
100053644:     	add	x20, x8, #0x14
100053648:     	mov	x8, #-0x3333333333333334 ; =-3689348814741910324
10005364c:     	mov	x19, xzr
100053650:     	cneg	x9, x1, mi
100053654:     	movk	x8, #0xcccd
100053658:     	mov	w10, #0xa               ; =10
10005365c:     	umulh	x11, x9, x8
100053660:     	cmp	x9, #0x9
100053664:     	add	x19, x19, #0x1
100053668:     	lsr	x11, x11, #3
10005366c:     	msub	w12, w11, w10, w9
100053670:     	mov	x9, x11
100053674:     	orr	w12, w12, #0x30
100053678:     	strb	w12, [x20, #-0x1]!
10005367c:     	b.hi	0x10005365c <_coil.compiler.parser.i64->str+0x3c>
100053680:     	lsr	x23, x21, #63
100053684:     	add	x8, sp, #0x18
100053688:     	mov	w2, #0x1                ; =1
10005368c:     	add	x1, x23, x19
100053690:     	bl	0x10000088c <_coil.alloc.alloc-bytes>
100053694:     	ldr	w8, [sp, #0x18]
100053698:     	cmp	w8, #0x1
10005369c:     	b.ne	0x1000536e8 <_coil.compiler.parser.i64->str+0xc8>
1000536a0:     	ldr	x22, [sp, #0x20]
1000536a4:     	tbz	x21, #0x3f, 0x1000536b0 <_coil.compiler.parser.i64->str+0x90>
1000536a8:     	mov	w8, #0x2d               ; =45
1000536ac:     	strb	w8, [x22]
1000536b0:     	cmp	x19, #0x1
1000536b4:     	b.lt	0x1000536c8 <_coil.compiler.parser.i64->str+0xa8>
1000536b8:     	add	x0, x22, x23
1000536bc:     	mov	x1, x20
1000536c0:     	mov	x2, x19
1000536c4:     	bl	0x10048579c <_write+0x10048579c>
1000536c8:     	add	x1, x23, x19
1000536cc:     	mov	x0, x22
1000536d0:     	ldp	x29, x30, [sp, #0x60]
1000536d4:     	ldp	x20, x19, [sp, #0x50]
1000536d8:     	ldp	x22, x21, [sp, #0x40]
1000536dc:     	ldp	x24, x23, [sp, #0x30]
1000536e0:     	add	sp, sp, #0x70
1000536e4:     	ret
1000536e8:     	adrp	x0, 0x100495000 <_static.cstr.2255+0x98dc>
1000536ec:     	add	x0, x0, #0x570
1000536f0:     	add	x1, x23, x19
1000536f4:     	bl	0x10000095c <_coil.alloc.oom-at>
1000536f8:     	b	0x1000536f8 <_coil.compiler.parser.i64->str+0xd8>
