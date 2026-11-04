
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-iterative-control/build/stable-mask-control-properties-comparison/reference-llvm:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100000598 <_coil.fmt.count--write>:
100000598:     	ldr	x9, [x0]
10000059c:     	add	x9, x9, x2
1000005a0:     	str	x9, [x0]
1000005a4:     	str	wzr, [x8]
1000005a8:     	str	x2, [x8, #0x8]
1000005ac:     	ret

00000001000005b0 <_coil.fmt.plain-format-spec>:
1000005b0:     	movi.2d	v0, #0xffffffffffffffff
1000005b4:     	mov	w9, #0x20               ; =32
1000005b8:     	stp	xzr, xzr, [x8, #0x10]
1000005bc:     	str	xzr, [x8, #0x20]
1000005c0:     	str	w9, [x8, #0x10]
1000005c4:     	strb	wzr, [x8, #0x20]
1000005c8:     	str	q0, [x8]
1000005cc:     	ret

00000001000005d0 <_coil.fmt.udec-digits>:
1000005d0:     	sub	sp, sp, #0x50
1000005d4:     	stp	x22, x21, [sp, #0x20]
1000005d8:     	stp	x20, x19, [sp, #0x30]
1000005dc:     	stp	x29, x30, [sp, #0x40]
1000005e0:     	add	x29, sp, #0x40
1000005e4:     	mov	x19, x8
1000005e8:     	cbz	x1, 0x10000063c <_coil.fmt.udec-digits+0x6c>
1000005ec:     	mov	x8, #-0x3333333333333334 ; =-3689348814741910324
1000005f0:     	mov	x20, x1
1000005f4:     	mov	x21, x0
1000005f8:     	movk	x8, #0xcccd
1000005fc:     	umulh	x8, x1, x8
100000600:     	lsr	x22, x8, #3
100000604:     	mov	x8, sp
100000608:     	mov	x1, x22
10000060c:     	bl	0x1000005d0 <_coil.fmt.udec-digits>
100000610:     	ldr	w8, [sp]
100000614:     	cmp	w8, #0x1
100000618:     	b.ne	0x100000658 <_coil.fmt.udec-digits+0x88>
10000061c:     	ldur	q0, [sp, #0x8]
100000620:     	str	w8, [x19]
100000624:     	stur	q0, [x19, #0x8]
100000628:     	ldp	x29, x30, [sp, #0x40]
10000062c:     	ldp	x20, x19, [sp, #0x30]
100000630:     	ldp	x22, x21, [sp, #0x20]
100000634:     	add	sp, sp, #0x50
100000638:     	ret
10000063c:     	str	wzr, [x19]
100000640:     	str	xzr, [x19, #0x8]
100000644:     	ldp	x29, x30, [sp, #0x40]
100000648:     	ldp	x20, x19, [sp, #0x30]
10000064c:     	ldp	x22, x21, [sp, #0x20]
100000650:     	add	sp, sp, #0x50
100000654:     	ret
100000658:     	mov	w8, #0xa                ; =10
10000065c:     	add	x1, sp, #0x1f
100000660:     	mov	x0, x21
100000664:     	msub	w8, w22, w8, w20
100000668:     	mov	w2, #0x1                ; =1
10000066c:     	orr	w8, w8, #0x30
100000670:     	strb	w8, [sp, #0x1f]
100000674:     	mov	x8, x19
100000678:     	bl	0x100000f4c <_coil.io.write-all>
10000067c:     	ldp	x29, x30, [sp, #0x40]
100000680:     	ldp	x20, x19, [sp, #0x30]
100000684:     	ldp	x22, x21, [sp, #0x20]
100000688:     	add	sp, sp, #0x50
10000068c:     	ret

0000000100000690 <_coil.fmt.uhex-digits>:
100000690:     	sub	sp, sp, #0x50
100000694:     	stp	x22, x21, [sp, #0x20]
100000698:     	stp	x20, x19, [sp, #0x30]
10000069c:     	stp	x29, x30, [sp, #0x40]
1000006a0:     	add	x29, sp, #0x40
1000006a4:     	mov	x19, x8
1000006a8:     	cbz	x1, 0x1000006ec <_coil.fmt.uhex-digits+0x5c>
1000006ac:     	mov	x21, x1
1000006b0:     	lsr	x1, x1, #4
1000006b4:     	mov	x8, sp
1000006b8:     	mov	x20, x0
1000006bc:     	bl	0x100000690 <_coil.fmt.uhex-digits>
1000006c0:     	ldr	w8, [sp]
1000006c4:     	cmp	w8, #0x1
1000006c8:     	b.ne	0x100000708 <_coil.fmt.uhex-digits+0x78>
1000006cc:     	ldur	q0, [sp, #0x8]
1000006d0:     	str	w8, [x19]
1000006d4:     	stur	q0, [x19, #0x8]
1000006d8:     	ldp	x29, x30, [sp, #0x40]
1000006dc:     	ldp	x20, x19, [sp, #0x30]
1000006e0:     	ldp	x22, x21, [sp, #0x20]
1000006e4:     	add	sp, sp, #0x50
1000006e8:     	ret
1000006ec:     	str	wzr, [x19]
1000006f0:     	str	xzr, [x19, #0x8]
1000006f4:     	ldp	x29, x30, [sp, #0x40]
1000006f8:     	ldp	x20, x19, [sp, #0x30]
1000006fc:     	ldp	x22, x21, [sp, #0x20]
100000700:     	add	sp, sp, #0x50
100000704:     	ret
100000708:     	and	x8, x21, #0xf
10000070c:     	add	x1, sp, #0x1f
100000710:     	mov	x0, x20
100000714:     	orr	w9, w8, #0x30
100000718:     	add	w10, w8, #0x57
10000071c:     	cmp	x8, #0xa
100000720:     	csel	x8, x9, x10, lo
100000724:     	mov	w2, #0x1                ; =1
100000728:     	strb	w8, [sp, #0x1f]
10000072c:     	mov	x8, x19
100000730:     	bl	0x100000f4c <_coil.io.write-all>
100000734:     	ldp	x29, x30, [sp, #0x40]
100000738:     	ldp	x20, x19, [sp, #0x30]
10000073c:     	ldp	x22, x21, [sp, #0x20]
100000740:     	add	sp, sp, #0x50
100000744:     	ret

0000000100000748 <_main>:
100000748:     	sub	sp, sp, #0xa0
10000074c:     	stp	x20, x19, [sp, #0x80]
100000750:     	stp	x29, x30, [sp, #0x90]
100000754:     	add	x29, sp, #0x90
100000758:     	bl	0x1000007f4 <_stogir.benchmarks.opcode-properties.kernel>
10000075c:     	movi.2d	v0, #0000000000000000
100000760:     	movi.2d	v1, #0xffffffffffffffff
100000764:     	adrp	x19, 0x100008000 <_repl_static.coil.io.stdout.0>
100000768:     	add	x19, x19, #0x0
10000076c:     	mov	w8, #0x20               ; =32
100000770:     	stur	x0, [x29, #-0x20]
100000774:     	adrp	x2, 0x100001000 <_coil.io.write-all+0xb4>
100000778:     	add	x2, x2, #0x1b2
10000077c:     	mov	x0, sp
100000780:     	sub	x4, x29, #0x28
100000784:     	mov	w1, wzr
100000788:     	mov	x3, xzr
10000078c:     	stur	q0, [sp, #0x8]
100000790:     	stur	q0, [sp, #0x38]
100000794:     	stur	q0, [sp, #0x28]
100000798:     	stur	q0, [sp, #0x18]
10000079c:     	str	x19, [sp]
1000007a0:     	str	xzr, [sp, #0x10]
1000007a4:     	stur	q1, [sp, #0x18]
1000007a8:     	str	w8, [sp, #0x28]
1000007ac:     	stur	xzr, [sp, #0x2c]
1000007b0:     	str	wzr, [sp, #0x34]
1000007b4:     	strb	wzr, [sp, #0x38]
1000007b8:     	stur	xzr, [sp, #0x39]
1000007bc:     	strb	wzr, [sp, #0x8]
1000007c0:     	stur	wzr, [x29, #-0x28]
1000007c4:     	bl	0x100000914 <_coil.fmt.fmt--number__coil.fmt.IntDigits>
1000007c8:     	adrp	x1, 0x100001000 <_coil.io.write-all+0xb4>
1000007cc:     	add	x1, x1, #0x1b0
1000007d0:     	add	x8, sp, #0x48
1000007d4:     	mov	x0, x19
1000007d8:     	mov	w2, #0x1                ; =1
1000007dc:     	bl	0x100000f4c <_coil.io.write-all>
1000007e0:     	ldp	x29, x30, [sp, #0x90]
1000007e4:     	mov	x0, xzr
1000007e8:     	ldp	x20, x19, [sp, #0x80]
1000007ec:     	add	sp, sp, #0xa0
1000007f0:     	ret

00000001000007f4 <_stogir.benchmarks.opcode-properties.kernel>:
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

0000000100000854 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits>:
100000854:     	sub	sp, sp, #0x60
100000858:     	stp	x29, x30, [sp, #0x50]
10000085c:     	add	x29, sp, #0x50
100000860:     	ldr	w9, [x0]
100000864:     	mov	x8, x0
100000868:     	mov	x0, x1
10000086c:     	cmp	w9, #0x2
100000870:     	b.eq	0x100000898 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x44>
100000874:     	cmp	w9, #0x1
100000878:     	b.ne	0x1000008b0 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x5c>
10000087c:     	ldr	x1, [x8, #0x8]
100000880:     	cbz	x1, 0x1000008cc <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x78>
100000884:     	add	x8, sp, #0x18
100000888:     	bl	0x100000690 <_coil.fmt.uhex-digits>
10000088c:     	ldp	x29, x30, [sp, #0x50]
100000890:     	add	sp, sp, #0x60
100000894:     	ret
100000898:     	ldp	x1, x2, [x8, #0x8]
10000089c:     	sub	x8, x29, #0x20
1000008a0:     	bl	0x100000f4c <_coil.io.write-all>
1000008a4:     	ldp	x29, x30, [sp, #0x50]
1000008a8:     	add	sp, sp, #0x60
1000008ac:     	ret
1000008b0:     	ldr	x1, [x8, #0x8]
1000008b4:     	cbz	x1, 0x1000008f0 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x9c>
1000008b8:     	mov	x8, sp
1000008bc:     	bl	0x1000005d0 <_coil.fmt.udec-digits>
1000008c0:     	ldp	x29, x30, [sp, #0x50]
1000008c4:     	add	sp, sp, #0x60
1000008c8:     	ret
1000008cc:     	mov	w8, #0x30               ; =48
1000008d0:     	sturb	w8, [x29, #-0x1]
1000008d4:     	add	x8, sp, #0x18
1000008d8:     	sub	x1, x29, #0x1
1000008dc:     	mov	w2, #0x1                ; =1
1000008e0:     	bl	0x100000f4c <_coil.io.write-all>
1000008e4:     	ldp	x29, x30, [sp, #0x50]
1000008e8:     	add	sp, sp, #0x60
1000008ec:     	ret
1000008f0:     	mov	w8, #0x30               ; =48
1000008f4:     	sturb	w8, [x29, #-0x1]
1000008f8:     	mov	x8, sp
1000008fc:     	sub	x1, x29, #0x1
100000900:     	mov	w2, #0x1                ; =1
100000904:     	bl	0x100000f4c <_coil.io.write-all>
100000908:     	ldp	x29, x30, [sp, #0x50]
10000090c:     	add	sp, sp, #0x60
100000910:     	ret

0000000100000914 <_coil.fmt.fmt--number__coil.fmt.IntDigits>:
100000914:     	stp	x28, x27, [sp, #-0x60]!
100000918:     	stp	x26, x25, [sp, #0x10]
10000091c:     	stp	x24, x23, [sp, #0x20]
100000920:     	stp	x22, x21, [sp, #0x30]
100000924:     	stp	x20, x19, [sp, #0x40]
100000928:     	stp	x29, x30, [sp, #0x50]
10000092c:     	add	x29, sp, #0x50
100000930:     	sub	sp, sp, #0x1a0
100000934:     	mov	x19, sp
100000938:     	ldrb	w8, [x0, #0x40]
10000093c:     	ldr	x20, [x0]
100000940:     	mov	x21, x4
100000944:     	mov	x22, x3
100000948:     	mov	x23, x2
10000094c:     	mov	w24, w1
100000950:     	cbz	w8, 0x100000970 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x5c>
100000954:     	ldur	q0, [x0, #0x18]
100000958:     	ldur	q1, [x0, #0x28]
10000095c:     	ldr	x8, [x0, #0x38]
100000960:     	strb	wzr, [x0, #0x40]
100000964:     	stp	q0, q1, [x19, #0x10]
100000968:     	str	x8, [x19, #0x30]
10000096c:     	b	0x100000978 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x64>
100000970:     	add	x8, x19, #0x10
100000974:     	bl	0x1000005b0 <_coil.fmt.plain-format-spec>
100000978:     	ldrb	w26, [x19, #0x30]
10000097c:     	sub	x1, sp, #0x10
100000980:     	mov	sp, x1
100000984:     	sub	x25, sp, #0x10
100000988:     	mov	sp, x25
10000098c:     	ldr	x8, [x19, #0x10]
100000990:     	tbnz	x8, #0x3f, 0x100000a74 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x160>
100000994:     	ldr	x8, [x21, #0x10]
100000998:     	ldr	q0, [x21]
10000099c:     	add	x0, x19, #0x90
1000009a0:     	str	xzr, [x25]
1000009a4:     	str	x8, [x19, #0xa0]
1000009a8:     	adrp	x8, 0x100000000 <_write+0x100000000>
1000009ac:     	add	x8, x8, #0x598
1000009b0:     	str	q0, [x19, #0x90]
1000009b4:     	stp	x8, x25, [x1]
1000009b8:     	bl	0x100000854 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits>
1000009bc:     	ldr	x8, [x25]
1000009c0:     	orr	w9, w24, w26
1000009c4:     	ldrb	w10, [x19, #0x31]
1000009c8:     	and	x2, x9, #0x1
1000009cc:     	add	x8, x22, x8
1000009d0:     	add	x25, x8, x2
1000009d4:     	cbz	w10, 0x100000b04 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1f0>
1000009d8:     	adrp	x8, 0x100001000 <_coil.io.write-all+0xb4>
1000009dc:     	add	x8, x8, #0x23a
1000009e0:     	adrp	x9, 0x100001000 <_coil.io.write-all+0xb4>
1000009e4:     	add	x9, x9, #0x238
1000009e8:     	cmp	w26, #0x0
1000009ec:     	mov	x0, x20
1000009f0:     	csel	x8, x9, x8, ne
1000009f4:     	cmp	w24, #0x0
1000009f8:     	adrp	x9, 0x100001000 <_coil.io.write-all+0xb4>
1000009fc:     	add	x9, x9, #0x236
100000a00:     	csel	x1, x9, x8, ne
100000a04:     	add	x8, x19, #0xa8
100000a08:     	bl	0x100000f4c <_coil.io.write-all>
100000a0c:     	add	x8, x19, #0xc0
100000a10:     	mov	x0, x20
100000a14:     	mov	x1, x23
100000a18:     	mov	x2, x22
100000a1c:     	bl	0x100000f4c <_coil.io.write-all>
100000a20:     	ldr	x8, [x19, #0x10]
100000a24:     	sub	x22, x8, x25
100000a28:     	cmp	x22, #0x1
100000a2c:     	b.lt	0x100000a5c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x148>
100000a30:     	mov	x23, xzr
100000a34:     	mov	w24, #0x30              ; =48
100000a38:     	add	x8, x19, #0xd8
100000a3c:     	sub	x1, x29, #0x78
100000a40:     	mov	x0, x20
100000a44:     	mov	w2, #0x1                ; =1
100000a48:     	sturb	w24, [x29, #-0x78]
100000a4c:     	bl	0x100000f4c <_coil.io.write-all>
100000a50:     	add	x23, x23, #0x1
100000a54:     	cmp	x23, x22
100000a58:     	b.lt	0x100000a38 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x124>
100000a5c:     	ldr	q0, [x21]
100000a60:     	ldr	x8, [x21, #0x10]
100000a64:     	add	x0, x19, #0xf0
100000a68:     	str	q0, [x19, #0xf0]
100000a6c:     	str	x8, [x19, #0x100]
100000a70:     	b	0x100000ad8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1c4>
100000a74:     	adrp	x8, 0x100001000 <_coil.io.write-all+0xb4>
100000a78:     	add	x8, x8, #0x23a
100000a7c:     	tst	w26, #0x1
100000a80:     	adrp	x9, 0x100001000 <_coil.io.write-all+0xb4>
100000a84:     	add	x9, x9, #0x238
100000a88:     	mov	x0, x20
100000a8c:     	csel	x8, x9, x8, ne
100000a90:     	adrp	x9, 0x100001000 <_coil.io.write-all+0xb4>
100000a94:     	add	x9, x9, #0x236
100000a98:     	cmp	w24, #0x0
100000a9c:     	csel	x1, x9, x8, ne
100000aa0:     	orr	w9, w24, w26
100000aa4:     	add	x8, x19, #0x40
100000aa8:     	and	x2, x9, #0x1
100000aac:     	bl	0x100000f4c <_coil.io.write-all>
100000ab0:     	add	x8, x19, #0x58
100000ab4:     	mov	x0, x20
100000ab8:     	mov	x1, x23
100000abc:     	mov	x2, x22
100000ac0:     	bl	0x100000f4c <_coil.io.write-all>
100000ac4:     	ldr	q0, [x21]
100000ac8:     	ldr	x8, [x21, #0x10]
100000acc:     	add	x0, x19, #0x70
100000ad0:     	str	q0, [x19, #0x70]
100000ad4:     	str	x8, [x19, #0x80]
100000ad8:     	mov	x1, x20
100000adc:     	bl	0x100000854 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits>
100000ae0:     	mov	x0, xzr
100000ae4:     	sub	sp, x29, #0x50
100000ae8:     	ldp	x29, x30, [sp, #0x50]
100000aec:     	ldp	x20, x19, [sp, #0x40]
100000af0:     	ldp	x22, x21, [sp, #0x30]
100000af4:     	ldp	x24, x23, [sp, #0x20]
100000af8:     	ldp	x26, x25, [sp, #0x10]
100000afc:     	ldp	x28, x27, [sp], #0x60
100000b00:     	ret
100000b04:     	ldr	x8, [x19, #0x10]
100000b08:     	sub	x27, x8, x25
100000b0c:     	cmp	x27, #0x1
100000b10:     	b.lt	0x100000bcc <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x2b8>
100000b14:     	ldr	w8, [x19, #0x28]
100000b18:     	cmp	w8, #0x1
100000b1c:     	b.gt	0x100000bb4 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x2a0>
100000b20:     	cbnz	w8, 0x100000bcc <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x2b8>
100000b24:     	str	x2, [x19, #0x8]
100000b28:     	b	0x100000b34 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x220>
100000b2c:     	subs	x27, x27, #0x1
100000b30:     	b.eq	0x100000bc8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x2b4>
100000b34:     	ldr	w28, [x19, #0x20]
100000b38:     	sub	x8, x29, #0x90
100000b3c:     	sub	x1, x29, #0x59
100000b40:     	mov	x0, x20
100000b44:     	mov	w2, #0x1                ; =1
100000b48:     	sturb	w28, [x29, #-0x59]
100000b4c:     	bl	0x100000f4c <_coil.io.write-all>
100000b50:     	lsr	w8, w28, #8
100000b54:     	cbz	w8, 0x100000b2c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x218>
100000b58:     	sturb	w8, [x29, #-0x59]
100000b5c:     	sub	x8, x29, #0x78
100000b60:     	sub	x1, x29, #0x59
100000b64:     	mov	x0, x20
100000b68:     	mov	w2, #0x1                ; =1
100000b6c:     	bl	0x100000f4c <_coil.io.write-all>
100000b70:     	lsr	w8, w28, #16
100000b74:     	cbz	w8, 0x100000b2c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x218>
100000b78:     	sturb	w8, [x29, #-0x59]
100000b7c:     	sub	x8, x29, #0x78
100000b80:     	sub	x1, x29, #0x59
100000b84:     	mov	x0, x20
100000b88:     	mov	w2, #0x1                ; =1
100000b8c:     	bl	0x100000f4c <_coil.io.write-all>
100000b90:     	lsr	w8, w28, #24
100000b94:     	cbz	w8, 0x100000b2c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x218>
100000b98:     	sturb	w8, [x29, #-0x59]
100000b9c:     	sub	x8, x29, #0x78
100000ba0:     	sub	x1, x29, #0x59
100000ba4:     	mov	x0, x20
100000ba8:     	mov	w2, #0x1                ; =1
100000bac:     	bl	0x100000f4c <_coil.io.write-all>
100000bb0:     	b	0x100000b2c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x218>
100000bb4:     	cmp	w8, #0x3
100000bb8:     	str	x2, [x19, #0x8]
100000bbc:     	b.ne	0x100000ce4 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x3d0>
100000bc0:     	lsr	x27, x27, #1
100000bc4:     	cbnz	x27, 0x100000d6c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x458>
100000bc8:     	ldr	x2, [x19, #0x8]
100000bcc:     	adrp	x8, 0x100001000 <_coil.io.write-all+0xb4>
100000bd0:     	add	x8, x8, #0x23a
100000bd4:     	adrp	x9, 0x100001000 <_coil.io.write-all+0xb4>
100000bd8:     	add	x9, x9, #0x238
100000bdc:     	cmp	w26, #0x0
100000be0:     	mov	x0, x20
100000be4:     	csel	x8, x9, x8, ne
100000be8:     	cmp	w24, #0x0
100000bec:     	adrp	x9, 0x100001000 <_coil.io.write-all+0xb4>
100000bf0:     	add	x9, x9, #0x236
100000bf4:     	csel	x1, x9, x8, ne
100000bf8:     	sub	x8, x29, #0xe0
100000bfc:     	bl	0x100000f4c <_coil.io.write-all>
100000c00:     	sub	x8, x29, #0xc8
100000c04:     	mov	x0, x20
100000c08:     	mov	x1, x23
100000c0c:     	mov	x2, x22
100000c10:     	bl	0x100000f4c <_coil.io.write-all>
100000c14:     	ldr	q0, [x21]
100000c18:     	ldr	x8, [x21, #0x10]
100000c1c:     	sub	x0, x29, #0xb0
100000c20:     	mov	x1, x20
100000c24:     	stur	q0, [x29, #-0xb0]
100000c28:     	stur	x8, [x29, #-0xa0]
100000c2c:     	bl	0x100000854 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits>
100000c30:     	ldr	x8, [x19, #0x10]
100000c34:     	sub	x21, x8, x25
100000c38:     	cmp	x21, #0x1
100000c3c:     	b.lt	0x100000ae0 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1cc>
100000c40:     	ldr	w8, [x19, #0x28]
100000c44:     	cmp	w8, #0x1
100000c48:     	b.gt	0x100000dec <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x4d8>
100000c4c:     	cbnz	w8, 0x100000c5c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x348>
100000c50:     	b	0x100000ae0 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1cc>
100000c54:     	subs	x21, x21, #0x1
100000c58:     	b.eq	0x100000ae0 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1cc>
100000c5c:     	ldr	w22, [x19, #0x20]
100000c60:     	sub	x8, x29, #0x90
100000c64:     	sub	x1, x29, #0x59
100000c68:     	mov	x0, x20
100000c6c:     	mov	w2, #0x1                ; =1
100000c70:     	sturb	w22, [x29, #-0x59]
100000c74:     	bl	0x100000f4c <_coil.io.write-all>
100000c78:     	lsr	w8, w22, #8
100000c7c:     	cbz	w8, 0x100000c54 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x340>
100000c80:     	sturb	w8, [x29, #-0x59]
100000c84:     	sub	x8, x29, #0x78
100000c88:     	sub	x1, x29, #0x59
100000c8c:     	mov	x0, x20
100000c90:     	mov	w2, #0x1                ; =1
100000c94:     	bl	0x100000f4c <_coil.io.write-all>
100000c98:     	lsr	w8, w22, #16
100000c9c:     	cbz	w8, 0x100000c54 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x340>
100000ca0:     	sturb	w8, [x29, #-0x59]
100000ca4:     	sub	x8, x29, #0x78
100000ca8:     	sub	x1, x29, #0x59
100000cac:     	mov	x0, x20
100000cb0:     	mov	w2, #0x1                ; =1
100000cb4:     	bl	0x100000f4c <_coil.io.write-all>
100000cb8:     	lsr	w8, w22, #24
100000cbc:     	cbz	w8, 0x100000c54 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x340>
100000cc0:     	sturb	w8, [x29, #-0x59]
100000cc4:     	sub	x8, x29, #0x78
100000cc8:     	sub	x1, x29, #0x59
100000ccc:     	mov	x0, x20
100000cd0:     	mov	w2, #0x1                ; =1
100000cd4:     	bl	0x100000f4c <_coil.io.write-all>
100000cd8:     	b	0x100000c54 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x340>
100000cdc:     	subs	x27, x27, #0x1
100000ce0:     	b.eq	0x100000bc8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x2b4>
100000ce4:     	ldr	w28, [x19, #0x20]
100000ce8:     	sub	x8, x29, #0x90
100000cec:     	sub	x1, x29, #0x59
100000cf0:     	mov	x0, x20
100000cf4:     	mov	w2, #0x1                ; =1
100000cf8:     	sturb	w28, [x29, #-0x59]
100000cfc:     	bl	0x100000f4c <_coil.io.write-all>
100000d00:     	lsr	w8, w28, #8
100000d04:     	cbz	w8, 0x100000cdc <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x3c8>
100000d08:     	sturb	w8, [x29, #-0x59]
100000d0c:     	sub	x8, x29, #0x78
100000d10:     	sub	x1, x29, #0x59
100000d14:     	mov	x0, x20
100000d18:     	mov	w2, #0x1                ; =1
100000d1c:     	bl	0x100000f4c <_coil.io.write-all>
100000d20:     	lsr	w8, w28, #16
100000d24:     	cbz	w8, 0x100000cdc <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x3c8>
100000d28:     	sturb	w8, [x29, #-0x59]
100000d2c:     	sub	x8, x29, #0x78
100000d30:     	sub	x1, x29, #0x59
100000d34:     	mov	x0, x20
100000d38:     	mov	w2, #0x1                ; =1
100000d3c:     	bl	0x100000f4c <_coil.io.write-all>
100000d40:     	lsr	w8, w28, #24
100000d44:     	cbz	w8, 0x100000cdc <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x3c8>
100000d48:     	sturb	w8, [x29, #-0x59]
100000d4c:     	sub	x8, x29, #0x78
100000d50:     	sub	x1, x29, #0x59
100000d54:     	mov	x0, x20
100000d58:     	mov	w2, #0x1                ; =1
100000d5c:     	bl	0x100000f4c <_coil.io.write-all>
100000d60:     	b	0x100000cdc <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x3c8>
100000d64:     	subs	x27, x27, #0x1
100000d68:     	b.eq	0x100000bc8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x2b4>
100000d6c:     	ldr	w28, [x19, #0x20]
100000d70:     	sub	x8, x29, #0x90
100000d74:     	sub	x1, x29, #0x59
100000d78:     	mov	x0, x20
100000d7c:     	mov	w2, #0x1                ; =1
100000d80:     	sturb	w28, [x29, #-0x59]
100000d84:     	bl	0x100000f4c <_coil.io.write-all>
100000d88:     	lsr	w8, w28, #8
100000d8c:     	cbz	w8, 0x100000d64 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x450>
100000d90:     	sturb	w8, [x29, #-0x59]
100000d94:     	sub	x8, x29, #0x78
100000d98:     	sub	x1, x29, #0x59
100000d9c:     	mov	x0, x20
100000da0:     	mov	w2, #0x1                ; =1
100000da4:     	bl	0x100000f4c <_coil.io.write-all>
100000da8:     	lsr	w8, w28, #16
100000dac:     	cbz	w8, 0x100000d64 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x450>
100000db0:     	sturb	w8, [x29, #-0x59]
100000db4:     	sub	x8, x29, #0x78
100000db8:     	sub	x1, x29, #0x59
100000dbc:     	mov	x0, x20
100000dc0:     	mov	w2, #0x1                ; =1
100000dc4:     	bl	0x100000f4c <_coil.io.write-all>
100000dc8:     	lsr	w8, w28, #24
100000dcc:     	cbz	w8, 0x100000d64 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x450>
100000dd0:     	sturb	w8, [x29, #-0x59]
100000dd4:     	sub	x8, x29, #0x78
100000dd8:     	sub	x1, x29, #0x59
100000ddc:     	mov	x0, x20
100000de0:     	mov	w2, #0x1                ; =1
100000de4:     	bl	0x100000f4c <_coil.io.write-all>
100000de8:     	b	0x100000d64 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x450>
100000dec:     	cmp	w8, #0x2
100000df0:     	b.eq	0x100000ae0 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1cc>
100000df4:     	sub	x21, x21, x21, lsr #1
100000df8:     	cmp	x21, #0x1
100000dfc:     	b.ge	0x100000e0c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x4f8>
100000e00:     	b	0x100000ae0 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1cc>
100000e04:     	subs	x21, x21, #0x1
100000e08:     	b.eq	0x100000ae0 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1cc>
100000e0c:     	ldr	w22, [x19, #0x20]
100000e10:     	sub	x8, x29, #0x90
100000e14:     	sub	x1, x29, #0x59
100000e18:     	mov	x0, x20
100000e1c:     	mov	w2, #0x1                ; =1
100000e20:     	sturb	w22, [x29, #-0x59]
100000e24:     	bl	0x100000f4c <_coil.io.write-all>
100000e28:     	lsr	w8, w22, #8
100000e2c:     	cbz	w8, 0x100000e04 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x4f0>
100000e30:     	sturb	w8, [x29, #-0x59]
100000e34:     	sub	x8, x29, #0x78
100000e38:     	sub	x1, x29, #0x59
100000e3c:     	mov	x0, x20
100000e40:     	mov	w2, #0x1                ; =1
100000e44:     	bl	0x100000f4c <_coil.io.write-all>
100000e48:     	lsr	w8, w22, #16
100000e4c:     	cbz	w8, 0x100000e04 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x4f0>
100000e50:     	sturb	w8, [x29, #-0x59]
100000e54:     	sub	x8, x29, #0x78
100000e58:     	sub	x1, x29, #0x59
100000e5c:     	mov	x0, x20
100000e60:     	mov	w2, #0x1                ; =1
100000e64:     	bl	0x100000f4c <_coil.io.write-all>
100000e68:     	lsr	w8, w22, #24
100000e6c:     	cbz	w8, 0x100000e04 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x4f0>
100000e70:     	sturb	w8, [x29, #-0x59]
100000e74:     	sub	x8, x29, #0x78
100000e78:     	sub	x1, x29, #0x59
100000e7c:     	mov	x0, x20
100000e80:     	mov	w2, #0x1                ; =1
100000e84:     	bl	0x100000f4c <_coil.io.write-all>
100000e88:     	b	0x100000e04 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x4f0>

0000000100000e8c <_coil.io.poll-one>:
100000e8c:     	sub	sp, sp, #0x30
100000e90:     	stp	x20, x19, [sp, #0x10]
100000e94:     	stp	x29, x30, [sp, #0x20]
100000e98:     	add	x29, sp, #0x20
100000e9c:     	mov	w19, w1
100000ea0:     	mov	w20, w0
100000ea4:     	adrp	x0, 0x100008000 <_repl_static.coil.io.stdout.0>
100000ea8:     	add	x0, x0, #0x10
100000eac:     	adrp	x1, 0x100001000 <_coil.io.write-all+0xb4>
100000eb0:     	add	x1, x1, #0x23d
100000eb4:     	bl	0x100001150 <_coil.os.dlsym-cached>
100000eb8:     	str	w20, [sp, #0x8]
100000ebc:     	strh	w19, [sp, #0xc]
100000ec0:     	strh	wzr, [sp, #0xe]
100000ec4:     	cbz	x0, 0x100000ef8 <_coil.io.poll-one+0x6c>
100000ec8:     	mov	x8, x0
100000ecc:     	add	x0, sp, #0x8
100000ed0:     	mov	w1, #0x1                ; =1
100000ed4:     	mov	w2, #-0x1               ; =-1
100000ed8:     	mov	w19, #0x1               ; =1
100000edc:     	blr	x8
100000ee0:     	tbnz	w0, #0x1f, 0x100000f10 <_coil.io.poll-one+0x84>
100000ee4:     	mov	w0, w19
100000ee8:     	ldp	x29, x30, [sp, #0x20]
100000eec:     	ldp	x20, x19, [sp, #0x10]
100000ef0:     	add	sp, sp, #0x30
100000ef4:     	ret
100000ef8:     	mov	w19, wzr
100000efc:     	mov	w0, w19
100000f00:     	ldp	x29, x30, [sp, #0x20]
100000f04:     	ldp	x20, x19, [sp, #0x10]
100000f08:     	add	sp, sp, #0x30
100000f0c:     	ret
100000f10:     	adrp	x0, 0x100008000 <_repl_static.coil.io.stdout.0>
100000f14:     	add	x0, x0, #0x18
100000f18:     	adrp	x1, 0x100001000 <_coil.io.write-all+0xb4>
100000f1c:     	add	x1, x1, #0x243
100000f20:     	mov	x2, #-0x2               ; =-2
100000f24:     	bl	0x100001150 <_coil.os.dlsym-cached>
100000f28:     	blr	x0
100000f2c:     	ldr	w8, [x0]
100000f30:     	cmp	w8, #0x4
100000f34:     	cset	w19, eq
100000f38:     	mov	w0, w19
100000f3c:     	ldp	x29, x30, [sp, #0x20]
100000f40:     	ldp	x20, x19, [sp, #0x10]
100000f44:     	add	sp, sp, #0x30
100000f48:     	ret

0000000100000f4c <_coil.io.write-all>:
100000f4c:     	sub	sp, sp, #0x70
100000f50:     	stp	x24, x23, [sp, #0x30]
100000f54:     	stp	x22, x21, [sp, #0x40]
100000f58:     	stp	x20, x19, [sp, #0x50]
100000f5c:     	stp	x29, x30, [sp, #0x60]
100000f60:     	add	x29, sp, #0x60
100000f64:     	cmp	x2, #0x1
100000f68:     	mov	x19, x8
100000f6c:     	b.lt	0x100000fa0 <_coil.io.write-all+0x54>
100000f70:     	mov	x22, x0
100000f74:     	ldp	x9, x0, [x0]
100000f78:     	mov	x8, sp
100000f7c:     	mov	x21, x2
100000f80:     	mov	x20, x1
100000f84:     	mov	x23, sp
100000f88:     	blr	x9
100000f8c:     	ldr	w8, [sp]
100000f90:     	cmp	w8, #0x1
100000f94:     	b.ne	0x100000fc0 <_coil.io.write-all+0x74>
100000f98:     	ldur	q0, [x23, #0x8]
100000f9c:     	b	0x100000ff4 <_coil.io.write-all+0xa8>
100000fa0:     	str	wzr, [x19]
100000fa4:     	str	xzr, [x19, #0x8]
100000fa8:     	ldp	x29, x30, [sp, #0x60]
100000fac:     	ldp	x20, x19, [sp, #0x50]
100000fb0:     	ldp	x22, x21, [sp, #0x40]
100000fb4:     	ldp	x24, x23, [sp, #0x30]
100000fb8:     	add	sp, sp, #0x70
100000fbc:     	ret
100000fc0:     	ldr	x23, [sp, #0x8]
100000fc4:     	cmp	x23, #0x0
100000fc8:     	b.le	0x100001014 <_coil.io.write-all+0xc8>
100000fcc:     	sub	x2, x21, x23
100000fd0:     	add	x8, sp, #0x18
100000fd4:     	add	x1, x20, x23
100000fd8:     	mov	x0, x22
100000fdc:     	add	x20, sp, #0x18
100000fe0:     	bl	0x100000f4c <_coil.io.write-all>
100000fe4:     	ldr	w8, [sp, #0x18]
100000fe8:     	cmp	w8, #0x1
100000fec:     	b.ne	0x10000103c <_coil.io.write-all+0xf0>
100000ff0:     	ldur	q0, [x20, #0x8]
100000ff4:     	str	w8, [x19]
100000ff8:     	stur	q0, [x19, #0x8]
100000ffc:     	ldp	x29, x30, [sp, #0x60]
100001000:     	ldp	x20, x19, [sp, #0x50]
100001004:     	ldp	x22, x21, [sp, #0x40]
100001008:     	ldp	x24, x23, [sp, #0x30]
10000100c:     	add	sp, sp, #0x70
100001010:     	ret
100001014:     	mov	w8, #0x1                ; =1
100001018:     	mov	w9, #0x5                ; =5
10000101c:     	str	w8, [x19]
100001020:     	str	w9, [x19, #0x8]
100001024:     	ldp	x29, x30, [sp, #0x60]
100001028:     	ldp	x20, x19, [sp, #0x50]
10000102c:     	ldp	x22, x21, [sp, #0x40]
100001030:     	ldp	x24, x23, [sp, #0x30]
100001034:     	add	sp, sp, #0x70
100001038:     	ret
10000103c:     	ldr	x8, [sp, #0x20]
100001040:     	str	wzr, [x19]
100001044:     	add	x8, x8, x23
100001048:     	str	x8, [x19, #0x8]
10000104c:     	ldp	x29, x30, [sp, #0x60]
100001050:     	ldp	x20, x19, [sp, #0x50]
100001054:     	ldp	x22, x21, [sp, #0x40]
100001058:     	ldp	x24, x23, [sp, #0x30]
10000105c:     	add	sp, sp, #0x70
100001060:     	ret

0000000100001064 <_coil.io.write-fd>:
100001064:     	sub	sp, sp, #0x80
100001068:     	stp	x26, x25, [sp, #0x30]
10000106c:     	stp	x24, x23, [sp, #0x40]
100001070:     	stp	x22, x21, [sp, #0x50]
100001074:     	stp	x20, x19, [sp, #0x60]
100001078:     	stp	x29, x30, [sp, #0x70]
10000107c:     	add	x29, sp, #0x70
100001080:     	mov	x20, x2
100001084:     	mov	x21, x1
100001088:     	mov	x22, x0
10000108c:     	mov	x19, x8
100001090:     	bl	0x100001198 <_write+0x100001198>
100001094:     	tbnz	x0, #0x3f, 0x1000010d0 <_coil.io.write-fd+0x6c>
100001098:     	str	wzr, [sp]
10000109c:     	mov	x8, sp
1000010a0:     	str	x0, [sp, #0x8]
1000010a4:     	ldr	q0, [x8]
1000010a8:     	ldr	x8, [x8, #0x10]
1000010ac:     	ldp	x29, x30, [sp, #0x70]
1000010b0:     	str	q0, [x19]
1000010b4:     	ldp	x22, x21, [sp, #0x50]
1000010b8:     	str	x8, [x19, #0x10]
1000010bc:     	ldp	x20, x19, [sp, #0x60]
1000010c0:     	ldp	x24, x23, [sp, #0x40]
1000010c4:     	ldp	x26, x25, [sp, #0x30]
1000010c8:     	add	sp, sp, #0x80
1000010cc:     	ret
1000010d0:     	adrp	x23, 0x100008000 <_repl_static.coil.io.stdout.0>
1000010d4:     	add	x23, x23, #0x18
1000010d8:     	adrp	x24, 0x100001000 <_coil.io.write-all+0xb4>
1000010dc:     	add	x24, x24, #0x24e
1000010e0:     	b	0x1000010f8 <_coil.io.write-fd+0x94>
1000010e4:     	mov	w0, w22
1000010e8:     	mov	x1, x21
1000010ec:     	mov	x2, x20
1000010f0:     	bl	0x100001198 <_write+0x100001198>
1000010f4:     	tbz	x0, #0x3f, 0x100001098 <_coil.io.write-fd+0x34>
1000010f8:     	mov	x0, x23
1000010fc:     	mov	x1, x24
100001100:     	mov	x2, #-0x2               ; =-2
100001104:     	bl	0x100001150 <_coil.os.dlsym-cached>
100001108:     	blr	x0
10000110c:     	ldr	w25, [x0]
100001110:     	cmp	w25, #0x4
100001114:     	b.eq	0x1000010e4 <_coil.io.write-fd+0x80>
100001118:     	cmp	w25, #0x23
10000111c:     	b.ne	0x100001134 <_coil.io.write-fd+0xd0>
100001120:     	mov	w0, w22
100001124:     	mov	w1, #0x4                ; =4
100001128:     	mov	x2, #-0x2               ; =-2
10000112c:     	bl	0x100000e8c <_coil.io.poll-one>
100001130:     	cbnz	w0, 0x1000010e4 <_coil.io.write-fd+0x80>
100001134:     	mov	w8, #0x1                ; =1
100001138:     	sxtw	x9, w25
10000113c:     	str	w8, [sp, #0x18]
100001140:     	str	w8, [sp, #0x20]
100001144:     	add	x8, sp, #0x18
100001148:     	str	x9, [sp, #0x28]
10000114c:     	b	0x1000010a4 <_coil.io.write-fd+0x40>

0000000100001150 <_coil.os.dlsym-cached>:
100001150:     	stp	x20, x19, [sp, #-0x20]!
100001154:     	stp	x29, x30, [sp, #0x10]
100001158:     	add	x29, sp, #0x10
10000115c:     	mov	x19, x0
100001160:     	ldar	x0, [x0]
100001164:     	cbz	x0, 0x100001174 <_coil.os.dlsym-cached+0x24>
100001168:     	ldp	x29, x30, [sp, #0x10]
10000116c:     	ldp	x20, x19, [sp], #0x20
100001170:     	ret
100001174:     	mov	x0, x2
100001178:     	bl	0x10000118c <_write+0x10000118c>
10000117c:     	stlr	x0, [x19]
100001180:     	ldp	x29, x30, [sp, #0x10]
100001184:     	ldp	x20, x19, [sp], #0x20
100001188:     	ret

Disassembly of section __TEXT,__stubs:

000000010000118c <__stubs>:
10000118c:     	adrp	x16, 0x100004000 <_write+0x100004000>
100001190:     	ldr	x16, [x16]
100001194:     	br	x16
100001198:     	adrp	x16, 0x100004000 <_write+0x100004000>
10000119c:     	ldr	x16, [x16, #0x8]
1000011a0:     	br	x16
