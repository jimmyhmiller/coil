; before-stogir
<_stogir.benchmarks.opcode-properties.kernel>:
100000708:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
10000070c:     	ldr	x16, [x16, #0x18]
100000710:     	orr	x1, x16, xzr
100000714:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
100000718:     	ldr	x16, [x16, #0x18]
10000071c:     	orr	x2, x16, xzr
100000720:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
100000724:     	ldr	x16, [x16, #0x18]
100000728:     	orr	x3, x16, xzr
10000072c:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
100000730:     	ldr	x16, [x16, #0x18]
100000734:     	orr	x4, x16, xzr
100000738:     	movn	x5, #0x0, lsl #48
10000073c:     	mov	x6, #0xcdef             ; =52719
100000740:     	movk	x6, #0x89ab, lsl #16
100000744:     	movk	x6, #0x4567, lsl #32
100000748:     	movk	x6, #0x123, lsl #48
10000074c:     	b	0x100000848 <_stogir.benchmarks.opcode-properties.kernel+0x140>
100000750:     	mov	x17, #0x7f2d            ; =32557
100000754:     	movk	x17, #0x4c95, lsl #16
100000758:     	movk	x17, #0xf42d, lsl #32
10000075c:     	movk	x17, #0x5851, lsl #48
100000760:     	mul	x6, x6, x17
100000764:     	mov	x17, #0x814f            ; =33103
100000768:     	movk	x17, #0xf767, lsl #16
10000076c:     	movk	x17, #0x7b7e, lsl #32
100000770:     	movk	x17, #0x1405, lsl #48
100000774:     	add	x6, x6, x17
100000778:     	lsr	x7, x6, #32
10000077c:     	and	x7, x7, #0x7f
100000780:     	lsr	w7, w7, #0
100000784:     	sxtw	x7, w7
100000788:     	add	x8, x7, x1
10000078c:     	add	x9, x7, x2
100000790:     	add	x10, x7, x3
100000794:     	add	x7, x7, x4
100000798:     	ldrb	w8, [x8]
10000079c:     	ldrb	w9, [x9]
1000007a0:     	and	x8, x8, #0x1
1000007a4:     	ldrb	w10, [x10]
1000007a8:     	uxtb	w8, w8
1000007ac:     	and	x9, x9, #0x2
1000007b0:     	ldrb	w7, [x7]
1000007b4:     	uxtb	w9, w9
1000007b8:     	and	x10, x10, #0x4
1000007bc:     	movz	x17, #0x0, lsl #48
1000007c0:     	cmp	x8, x17
1000007c4:     	cset	w8, ne
1000007c8:     	uxtb	w10, w10
1000007cc:     	and	x7, x7, #0x8
1000007d0:     	ubfx	x8, x8, #0, #8
1000007d4:     	movz	x17, #0x0, lsl #48
1000007d8:     	cmp	x9, x17
1000007dc:     	cset	w9, ne
1000007e0:     	uxtb	w7, w7
1000007e4:     	uxtb	w16, w9
1000007e8:     	cmp	w16, wzr
1000007ec:     	mov	x16, #0x2               ; =2
1000007f0:     	movz	x17, #0x0, lsl #48
1000007f4:     	csel	x9, x16, x17, ne
1000007f8:     	movz	x17, #0x0, lsl #48
1000007fc:     	cmp	x10, x17
100000800:     	cset	w10, ne
100000804:     	add	x8, x9, x8
100000808:     	uxtb	w16, w10
10000080c:     	cmp	w16, wzr
100000810:     	mov	x16, #0x4               ; =4
100000814:     	movz	x17, #0x0, lsl #48
100000818:     	csel	x9, x16, x17, ne
10000081c:     	movz	x17, #0x0, lsl #48
100000820:     	cmp	x7, x17
100000824:     	cset	w7, ne
100000828:     	add	x8, x8, x9
10000082c:     	uxtb	w16, w7
100000830:     	cmp	w16, wzr
100000834:     	mov	x16, #0x8               ; =8
100000838:     	movz	x17, #0x0, lsl #48
10000083c:     	csel	x7, x16, x17, ne
100000840:     	add	x7, x8, x7
100000844:     	eor	x6, x7, x6
100000848:     	add	x5, x5, #0x1
10000084c:     	cmp	x5, x0
100000850:     	b.lt	0x100000750 <_stogir.benchmarks.opcode-properties.kernel+0x48>
100000854:     	mov	x0, x6
100000858:     	ret
		...
