; reference-llvm
<_stogir.benchmarks.opcode-properties.kernel>:
1000007f4:     	mov	x0, #0xcdef             ; =52719
1000007f8:     	mov	x10, #0x7f2d            ; =32557
1000007fc:     	mov	x11, #0x814f            ; =33103
100000800:     	movk	x0, #0x89ab, lsl #16
100000804:     	adrp	x8, 0x100001000 <_coil.io.write-all+0xb4>
100000808:     	movk	x10, #0x4c95, lsl #16
10000080c:     	movk	x11, #0xf767, lsl #16
100000810:     	movk	x0, #0x4567, lsl #32
100000814:     	add	x8, x8, #0x1b3
100000818:     	mov	w9, #0x9680             ; =38528
10000081c:     	movk	x10, #0xf42d, lsl #32
100000820:     	movk	x11, #0x7b7e, lsl #32
100000824:     	movk	x0, #0x123, lsl #48
100000828:     	movk	w9, #0x98, lsl #16
10000082c:     	movk	x10, #0x5851, lsl #48
100000830:     	movk	x11, #0x1405, lsl #48
100000834:     	madd	x12, x0, x10, x11
100000838:     	subs	x9, x9, #0x1
10000083c:     	ubfx	x13, x12, #32, #7
100000840:     	ldrb	w13, [x8, x13]
100000844:     	and	x13, x13, #0xf
100000848:     	eor	x0, x12, x13
10000084c:     	b.ne	0x100000834 <_stogir.benchmarks.opcode-properties.kernel+0x40>
100000850:     	ret
