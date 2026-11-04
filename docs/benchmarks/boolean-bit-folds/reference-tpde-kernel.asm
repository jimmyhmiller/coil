; reference-tpde
<_stogir.benchmarks.opcode-properties.kernel>:
100000658:     	stp	x29, x30, [sp, #-0xc0]!
10000065c:     	mov	x29, sp
100000660:     	stp	x19, x20, [sp, #0x10]
100000664:     	stp	x21, x22, [sp, #0x20]
100000668:     	str	x23, [sp, #0x30]
10000066c:     	mov	w1, #0x0                ; =0
100000670:     	sub	x1, x1, #0x1
100000674:     	str	x0, [x29, #0xa0]
100000678:     	mov	x19, x1
10000067c:     	mov	x20, #0xcdef            ; =52719
100000680:     	movk	x20, #0x89ab, lsl #16
100000684:     	movk	x20, #0x4567, lsl #32
100000688:     	movk	x20, #0x123, lsl #48
10000068c:     	add	x21, x19, #0x1
100000690:     	ldr	x0, [x29, #0xa0]
100000694:     	cmp	x21, x0
100000698:     	b.ge	0x10000078c <_stogir.benchmarks.opcode-properties.kernel+0x134>
10000069c:     	mov	x1, #0x7f2d             ; =32557
1000006a0:     	movk	x1, #0x4c95, lsl #16
1000006a4:     	movk	x1, #0xf42d, lsl #32
1000006a8:     	movk	x1, #0x5851, lsl #48
1000006ac:     	mul	x2, x20, x1
1000006b0:     	mov	x1, #0x814f             ; =33103
1000006b4:     	movk	x1, #0xf767, lsl #16
1000006b8:     	movk	x1, #0x7b7e, lsl #32
1000006bc:     	movk	x1, #0x1405, lsl #48
1000006c0:     	add	x22, x2, x1
1000006c4:     	lsr	x1, x22, #32
1000006c8:     	and	x1, x1, #0x7f
1000006cc:     	sxtw	x23, w1
1000006d0:     	mov	x9, x0
1000006d4:     	mov	x0, x23
1000006d8:     	bl	0x100000978 <_stogir.opcode.control?>
1000006dc:     	cbz	x0, 0x1000006ec <_stogir.benchmarks.opcode-properties.kernel+0x94>
1000006e0:     	mov	w0, #0x1                ; =1
1000006e4:     	str	x0, [x29, #0xa8]
1000006e8:     	b	0x1000006f4 <_stogir.benchmarks.opcode-properties.kernel+0x9c>
1000006ec:     	mov	w0, #0x0                ; =0
1000006f0:     	str	x0, [x29, #0xa8]
1000006f4:     	mov	x0, x23
1000006f8:     	bl	0x1000009cc <_stogir.opcode.block-start?>
1000006fc:     	cbz	x0, 0x10000070c <_stogir.benchmarks.opcode-properties.kernel+0xb4>
100000700:     	mov	w0, #0x2                ; =2
100000704:     	str	x0, [x29, #0xb0]
100000708:     	b	0x100000714 <_stogir.benchmarks.opcode-properties.kernel+0xbc>
10000070c:     	mov	w0, #0x0                ; =0
100000710:     	str	x0, [x29, #0xb0]
100000714:     	ldr	x0, [x29, #0xa8]
100000718:     	ldr	x1, [x29, #0xb0]
10000071c:     	add	x0, x0, x1
100000720:     	mov	x9, x0
100000724:     	mov	x0, x23
100000728:     	str	x9, [x29, #0xa8]
10000072c:     	bl	0x100000a20 <_stogir.opcode.block-end?>
100000730:     	cbz	x0, 0x100000740 <_stogir.benchmarks.opcode-properties.kernel+0xe8>
100000734:     	mov	w0, #0x4                ; =4
100000738:     	str	x0, [x29, #0xb0]
10000073c:     	b	0x100000748 <_stogir.benchmarks.opcode-properties.kernel+0xf0>
100000740:     	mov	w0, #0x0                ; =0
100000744:     	str	x0, [x29, #0xb0]
100000748:     	ldr	x0, [x29, #0xa8]
10000074c:     	ldr	x1, [x29, #0xb0]
100000750:     	add	x0, x0, x1
100000754:     	mov	x9, x0
100000758:     	mov	x0, x23
10000075c:     	str	x9, [x29, #0xa8]
100000760:     	bl	0x100000a74 <_stogir.opcode.terminator?>
100000764:     	cbz	x0, 0x100000770 <_stogir.benchmarks.opcode-properties.kernel+0x118>
100000768:     	mov	w23, #0x8               ; =8
10000076c:     	b	0x100000774 <_stogir.benchmarks.opcode-properties.kernel+0x11c>
100000770:     	mov	w23, #0x0               ; =0
100000774:     	ldr	x0, [x29, #0xa8]
100000778:     	add	x0, x0, x23
10000077c:     	eor	x23, x22, x0
100000780:     	mov	x19, x21
100000784:     	mov	x20, x23
100000788:     	b	0x10000068c <_stogir.benchmarks.opcode-properties.kernel+0x34>
10000078c:     	mov	x0, x20
100000790:     	ldp	x19, x20, [sp, #0x10]
100000794:     	ldp	x21, x22, [sp, #0x20]
100000798:     	ldr	x23, [sp, #0x30]
10000079c:     	ldp	x29, x30, [sp], #0xc0
1000007a0:     	ret
