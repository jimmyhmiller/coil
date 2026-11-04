<_stogir.benchmarks.opcode-properties.kernel>:
100000708:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
10000070c:     	ldr	x16, [x16, #0x18]
100000710:     	orr	x1, x16, xzr
100000714:     	movn	x2, #0x0, lsl #48
100000718:     	mov	x3, #0xcdef             ; =52719
10000071c:     	movk	x3, #0x89ab, lsl #16
100000720:     	movk	x3, #0x4567, lsl #32
100000724:     	movk	x3, #0x123, lsl #48
100000728:     	b	0x1000007ac <_stogir.benchmarks.opcode-properties.kernel+0xa4>
10000072c:     	nop
100000730:     	mov	x17, #0x7f2d            ; =32557
100000734:     	movk	x17, #0x4c95, lsl #16
100000738:     	movk	x17, #0xf42d, lsl #32
10000073c:     	movk	x17, #0x5851, lsl #48
100000740:     	mul	x3, x3, x17
100000744:     	mov	x17, #0x814f            ; =33103
100000748:     	movk	x17, #0xf767, lsl #16
10000074c:     	movk	x17, #0x7b7e, lsl #32
100000750:     	movk	x17, #0x1405, lsl #48
100000754:     	add	x3, x3, x17
100000758:     	lsr	x4, x3, #32
10000075c:     	and	x4, x4, #0x7f
100000760:     	lsr	w4, w4, #0
100000764:     	sxtw	x4, w4
100000768:     	add	x4, x4, x1
10000076c:     	ldrb	w4, [x4]
100000770:     	orr	x5, x4, xzr
100000774:     	mov	w6, w4
100000778:     	mov	w6, w4
10000077c:     	and	x4, x5, #0x1
100000780:     	and	x6, x5, #0x2
100000784:     	and	x7, x5, #0x4
100000788:     	and	x5, x5, #0x8
10000078c:     	uxtb	w4, w4
100000790:     	uxtb	w6, w6
100000794:     	uxtb	w7, w7
100000798:     	uxtb	w5, w5
10000079c:     	add	x4, x6, x4
1000007a0:     	add	x4, x4, x7
1000007a4:     	add	x4, x4, x5
1000007a8:     	eor	x3, x4, x3
1000007ac:     	add	x2, x2, #0x1
1000007b0:     	cmp	x2, x0
1000007b4:     	b.lt	0x100000730 <_stogir.benchmarks.opcode-properties.kernel+0x28>
1000007b8:     	mov	x0, x3
1000007bc:     	ret
		...
