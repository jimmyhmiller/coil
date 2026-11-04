
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-iterative-control/build/stable-mask-control-properties-comparison/before-stogir:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001000005c0 <_main>:
1000005c0:     	sub	sp, sp, #0x40
1000005c4:     	str	x29, [sp]
1000005c8:     	str	x30, [sp, #0x8]
1000005cc:     	mov	x29, sp
1000005d0:     	str	x19, [sp, #0x10]
1000005d4:     	str	x20, [sp, #0x18]
1000005d8:     	str	x21, [sp, #0x20]
1000005dc:     	str	x22, [sp, #0x28]
1000005e0:     	str	x23, [sp, #0x30]
1000005e4:     	str	x24, [sp, #0x38]
1000005e8:     	sub	sp, sp, #0x50
1000005ec:     	mov	x19, sp
1000005f0:     	sub	sp, sp, #0x50
1000005f4:     	mov	x20, sp
1000005f8:     	sub	sp, sp, #0x20
1000005fc:     	mov	x21, sp
100000600:     	mov	x0, #0x9680             ; =38528
100000604:     	movk	x0, #0x98, lsl #16
100000608:     	bl	0x100000708 <_stogir.benchmarks.opcode-properties.kernel>
10000060c:     	movz	x1, #0x0, lsl #48
100000610:     	b	0x10000062c <_main+0x6c>
100000614:     	nop
100000618:     	add	x2, x1, #0x8
10000061c:     	add	x1, x20, x1
100000620:     	movz	x17, #0x0, lsl #48
100000624:     	str	x17, [x1]
100000628:     	mov	x1, x2
10000062c:     	mov	x17, #0x48              ; =72
100000630:     	cmp	x1, x17
100000634:     	b.lo	0x100000618 <_main+0x58>
100000638:     	movz	x1, #0x0, lsl #48
10000063c:     	b	0x100000658 <_main+0x98>
100000640:     	add	x2, x1, #0x8
100000644:     	add	x3, x19, x1
100000648:     	add	x1, x20, x1
10000064c:     	ldr	x1, [x1]
100000650:     	str	x1, [x3]
100000654:     	mov	x1, x2
100000658:     	mov	x17, #0x48              ; =72
10000065c:     	cmp	x1, x17
100000660:     	b.lo	0x100000640 <_main+0x80>
100000664:     	orr	x20, x19, xzr
100000668:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
10000066c:     	ldr	x16, [x16, #0x8]
100000670:     	orr	x22, x16, xzr
100000674:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
100000678:     	ldr	x16, [x16, #0x10]
10000067c:     	orr	x23, x16, xzr
100000680:     	add	x1, x20, #0x8
100000684:     	add	x2, x20, #0x10
100000688:     	add	x3, x20, #0x8
10000068c:     	str	x23, [x19]
100000690:     	orr	x19, x3, xzr
100000694:     	movz	w17, #0x0, lsl #16
100000698:     	strb	w17, [x1]
10000069c:     	movz	x17, #0x0, lsl #48
1000006a0:     	str	x17, [x2]
1000006a4:     	mov	x24, x0
1000006a8:     	mov	x0, x20
1000006ac:     	bl	0x100000bd8 <_inherent$coil.fmt.Formatter$clear-spec!>
1000006b0:     	movz	w17, #0x0, lsl #16
1000006b4:     	strb	w17, [x19]
1000006b8:     	mov	x0, x24
1000006bc:     	mov	x1, x20
1000006c0:     	bl	0x100000970 <_coil.fmt.Display$u64$display-fmt>
1000006c4:     	mov	x8, x21
1000006c8:     	mov	x0, x23
1000006cc:     	mov	x1, x22
1000006d0:     	mov	x2, #0x1                ; =1
1000006d4:     	bl	0x1000009f8 <_coil.io.print-str>
1000006d8:     	movz	x0, #0x0, lsl #48
1000006dc:     	sub	sp, x29, #0x0
1000006e0:     	ldr	x19, [sp, #0x10]
1000006e4:     	ldr	x20, [sp, #0x18]
1000006e8:     	ldr	x21, [sp, #0x20]
1000006ec:     	ldr	x22, [sp, #0x28]
1000006f0:     	ldr	x23, [sp, #0x30]
1000006f4:     	ldr	x24, [sp, #0x38]
1000006f8:     	ldr	x29, [sp]
1000006fc:     	ldr	x30, [sp, #0x8]
100000700:     	add	sp, sp, #0x40
100000704:     	ret

0000000100000708 <_stogir.benchmarks.opcode-properties.kernel>:
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
10000074c:     	b	0x1000008dc <_stogir.benchmarks.opcode-properties.kernel+0x1d4>
100000750:     	movz	x10, #0x0, lsl #48
100000754:     	uxtb	w16, w8
100000758:     	cmp	w16, wzr
10000075c:     	b.eq	0x100000778 <_stogir.benchmarks.opcode-properties.kernel+0x70>
100000760:     	uxtb	w16, w9
100000764:     	cmp	w16, wzr
100000768:     	b.eq	0x100000778 <_stogir.benchmarks.opcode-properties.kernel+0x70>
10000076c:     	add	x11, x7, x2
100000770:     	ldrb	w11, [x11]
100000774:     	b	0x10000077c <_stogir.benchmarks.opcode-properties.kernel+0x74>
100000778:     	movz	x11, #0x0, lsl #48
10000077c:     	uxtb	w16, w8
100000780:     	cmp	w16, wzr
100000784:     	b.eq	0x1000007a0 <_stogir.benchmarks.opcode-properties.kernel+0x98>
100000788:     	uxtb	w16, w9
10000078c:     	cmp	w16, wzr
100000790:     	b.eq	0x1000007a0 <_stogir.benchmarks.opcode-properties.kernel+0x98>
100000794:     	add	x12, x7, x3
100000798:     	ldrb	w12, [x12]
10000079c:     	b	0x1000007a4 <_stogir.benchmarks.opcode-properties.kernel+0x9c>
1000007a0:     	movz	x12, #0x0, lsl #48
1000007a4:     	uxtb	w16, w8
1000007a8:     	cmp	w16, wzr
1000007ac:     	b.eq	0x1000007c8 <_stogir.benchmarks.opcode-properties.kernel+0xc0>
1000007b0:     	uxtb	w16, w9
1000007b4:     	cmp	w16, wzr
1000007b8:     	b.eq	0x1000007c8 <_stogir.benchmarks.opcode-properties.kernel+0xc0>
1000007bc:     	add	x7, x7, x4
1000007c0:     	ldrb	w7, [x7]
1000007c4:     	b	0x1000007cc <_stogir.benchmarks.opcode-properties.kernel+0xc4>
1000007c8:     	movz	x7, #0x0, lsl #48
1000007cc:     	uxtb	w8, w10
1000007d0:     	uxtb	w9, w11
1000007d4:     	uxtb	w10, w12
1000007d8:     	uxtb	w7, w7
1000007dc:     	and	x8, x8, #0x1
1000007e0:     	and	x9, x9, #0x2
1000007e4:     	and	x10, x10, #0x4
1000007e8:     	and	x7, x7, #0x8
1000007ec:     	uxtb	w8, w8
1000007f0:     	uxtb	w9, w9
1000007f4:     	uxtb	w10, w10
1000007f8:     	uxtb	w7, w7
1000007fc:     	movz	x17, #0x0, lsl #48
100000800:     	cmp	x8, x17
100000804:     	cset	w8, eq
100000808:     	movz	x17, #0x0, lsl #48
10000080c:     	cmp	x9, x17
100000810:     	cset	w9, eq
100000814:     	movz	x17, #0x0, lsl #48
100000818:     	cmp	x10, x17
10000081c:     	cset	w10, eq
100000820:     	movz	x17, #0x0, lsl #48
100000824:     	cmp	x7, x17
100000828:     	cset	w7, eq
10000082c:     	uxtb	w16, w8
100000830:     	cmp	w16, wzr
100000834:     	cset	x8, eq
100000838:     	uxtb	w16, w9
10000083c:     	cmp	w16, wzr
100000840:     	cset	x9, eq
100000844:     	uxtb	w16, w10
100000848:     	cmp	w16, wzr
10000084c:     	cset	x10, eq
100000850:     	uxtb	w16, w7
100000854:     	cmp	w16, wzr
100000858:     	cset	x7, eq
10000085c:     	movz	x17, #0x0, lsl #48
100000860:     	cmp	x8, x17
100000864:     	cset	w8, ne
100000868:     	movz	x17, #0x0, lsl #48
10000086c:     	cmp	x9, x17
100000870:     	cset	w9, ne
100000874:     	movz	x17, #0x0, lsl #48
100000878:     	cmp	x10, x17
10000087c:     	cset	w10, ne
100000880:     	movz	x17, #0x0, lsl #48
100000884:     	cmp	x7, x17
100000888:     	cset	w7, ne
10000088c:     	ubfx	x8, x8, #0, #8
100000890:     	uxtb	w16, w9
100000894:     	cmp	w16, wzr
100000898:     	mov	x16, #0x2               ; =2
10000089c:     	movz	x17, #0x0, lsl #48
1000008a0:     	csel	x9, x16, x17, ne
1000008a4:     	uxtb	w16, w10
1000008a8:     	cmp	w16, wzr
1000008ac:     	mov	x16, #0x4               ; =4
1000008b0:     	movz	x17, #0x0, lsl #48
1000008b4:     	csel	x10, x16, x17, ne
1000008b8:     	uxtb	w16, w7
1000008bc:     	cmp	w16, wzr
1000008c0:     	mov	x16, #0x8               ; =8
1000008c4:     	movz	x17, #0x0, lsl #48
1000008c8:     	csel	x7, x16, x17, ne
1000008cc:     	add	x8, x9, x8
1000008d0:     	add	x8, x8, x10
1000008d4:     	add	x7, x8, x7
1000008d8:     	eor	x6, x7, x6
1000008dc:     	add	x5, x5, #0x1
1000008e0:     	cmp	x5, x0
1000008e4:     	b.ge	0x10000095c <_stogir.benchmarks.opcode-properties.kernel+0x254>
1000008e8:     	mov	x17, #0x7f2d            ; =32557
1000008ec:     	movk	x17, #0x4c95, lsl #16
1000008f0:     	movk	x17, #0xf42d, lsl #32
1000008f4:     	movk	x17, #0x5851, lsl #48
1000008f8:     	mul	x6, x6, x17
1000008fc:     	mov	x17, #0x814f            ; =33103
100000900:     	movk	x17, #0xf767, lsl #16
100000904:     	movk	x17, #0x7b7e, lsl #32
100000908:     	movk	x17, #0x1405, lsl #48
10000090c:     	add	x6, x6, x17
100000910:     	lsr	x7, x6, #32
100000914:     	and	x7, x7, #0x7f
100000918:     	lsr	w7, w7, #0
10000091c:     	sxtw	x7, w7
100000920:     	movz	x17, #0x0, lsl #48
100000924:     	cmp	x7, x17
100000928:     	cset	w8, ge
10000092c:     	mov	x17, #0x83              ; =131
100000930:     	cmp	x7, x17
100000934:     	cset	w9, lt
100000938:     	uxtb	w16, w8
10000093c:     	cmp	w16, wzr
100000940:     	b.eq	0x100000750 <_stogir.benchmarks.opcode-properties.kernel+0x48>
100000944:     	uxtb	w16, w9
100000948:     	cmp	w16, wzr
10000094c:     	b.eq	0x100000750 <_stogir.benchmarks.opcode-properties.kernel+0x48>
100000950:     	add	x10, x7, x1
100000954:     	ldrb	w10, [x10]
100000958:     	b	0x100000754 <_stogir.benchmarks.opcode-properties.kernel+0x4c>
10000095c:     	mov	x0, x6
100000960:     	ret
		...

0000000100000970 <_coil.fmt.Display$u64$display-fmt>:
100000970:     	sub	sp, sp, #0x10
100000974:     	str	x29, [sp]
100000978:     	str	x30, [sp, #0x8]
10000097c:     	mov	x29, sp
100000980:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
100000984:     	ldr	x16, [x16, #0x20]
100000988:     	orr	x2, x16, xzr
10000098c:     	sub	sp, sp, #0x20
100000990:     	mov	x3, sp
100000994:     	orr	x4, x3, xzr
100000998:     	sub	sp, sp, #0x20
10000099c:     	mov	x5, sp
1000009a0:     	add	x4, x4, #0x8
1000009a4:     	orr	x6, x5, xzr
1000009a8:     	movz	w17, #0x0, lsl #16
1000009ac:     	str	w17, [x3]
1000009b0:     	str	x0, [x4]
1000009b4:     	ldr	x0, [x3]
1000009b8:     	str	x0, [x5]
1000009bc:     	ldr	x0, [x3, #0x8]
1000009c0:     	str	x0, [x5, #0x8]
1000009c4:     	ldr	x0, [x3, #0x10]
1000009c8:     	str	x0, [x5, #0x10]
1000009cc:     	mov	x0, x1
1000009d0:     	mov	x4, x6
1000009d4:     	movz	x1, #0x0, lsl #48
1000009d8:     	movz	x3, #0x0, lsl #48
1000009dc:     	uxtb	w1, w1
1000009e0:     	bl	0x100000c68 <_coil.fmt.fmt--number__coil.fmt.IntDigits>
1000009e4:     	sub	sp, x29, #0x0
1000009e8:     	ldr	x29, [sp]
1000009ec:     	ldr	x30, [sp, #0x8]
1000009f0:     	add	sp, sp, #0x10
1000009f4:     	ret

00000001000009f8 <_coil.io.print-str>:
1000009f8:     	sub	sp, sp, #0x20
1000009fc:     	str	x29, [sp]
100000a00:     	str	x30, [sp, #0x8]
100000a04:     	mov	x29, sp
100000a08:     	str	x19, [sp, #0x10]
100000a0c:     	str	x20, [sp, #0x18]
100000a10:     	sub	sp, sp, #0x20
100000a14:     	mov	x19, sp
100000a18:     	mov	x20, x8
100000a1c:     	mov	x8, x19
100000a20:     	bl	0x10000102c <_coil.io.write-all>
100000a24:     	ldr	x0, [x19]
100000a28:     	str	x0, [x20]
100000a2c:     	ldr	x0, [x19, #0x8]
100000a30:     	str	x0, [x20, #0x8]
100000a34:     	ldr	x0, [x19, #0x10]
100000a38:     	str	x0, [x20, #0x10]
100000a3c:     	sub	sp, x29, #0x0
100000a40:     	ldr	x19, [sp, #0x10]
100000a44:     	ldr	x20, [sp, #0x18]
100000a48:     	ldr	x29, [sp]
100000a4c:     	ldr	x30, [sp, #0x8]
100000a50:     	add	sp, sp, #0x20
100000a54:     	ret

0000000100000a58 <_coil.io.write-fd>:
100000a58:     	sub	sp, sp, #0x60
100000a5c:     	str	x29, [sp]
100000a60:     	str	x30, [sp, #0x8]
100000a64:     	mov	x29, sp
100000a68:     	str	x19, [sp, #0x10]
100000a6c:     	str	x20, [sp, #0x18]
100000a70:     	str	x21, [sp, #0x20]
100000a74:     	str	x22, [sp, #0x28]
100000a78:     	str	x23, [sp, #0x30]
100000a7c:     	str	x24, [sp, #0x38]
100000a80:     	str	x25, [sp, #0x40]
100000a84:     	str	x26, [sp, #0x48]
100000a88:     	str	x27, [sp, #0x50]
100000a8c:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
100000a90:     	ldr	x16, [x16, #0x28]
100000a94:     	orr	x19, x16, xzr
100000a98:     	sub	sp, sp, #0x20
100000a9c:     	mov	x20, sp
100000aa0:     	lsr	w0, w0, #0
100000aa4:     	sub	sp, sp, #0x20
100000aa8:     	mov	x21, sp
100000aac:     	lsr	w22, w0, #0
100000ab0:     	sub	sp, sp, #0x10
100000ab4:     	mov	x23, sp
100000ab8:     	b	0x100000acc <_coil.io.write-fd+0x74>
100000abc:     	nop
100000ac0:     	mov	x8, x24
100000ac4:     	mov	x1, x25
100000ac8:     	mov	x2, x26
100000acc:     	mov	w0, w22
100000ad0:     	mov	x24, x8
100000ad4:     	mov	x25, x1
100000ad8:     	mov	x26, x2
100000adc:     	bl	0x100001f6c <dyld_stub_binder+0x100001f6c>
100000ae0:     	movz	x17, #0x0, lsl #48
100000ae4:     	cmp	x0, x17
100000ae8:     	b.ge	0x100000b70 <_coil.io.write-fd+0x118>
100000aec:     	mov	x0, x19
100000af0:     	mov	x1, #-0x2               ; =-2
100000af4:     	bl	0x100001bc0 <_coil.os.dlsym-errno-cell>
100000af8:     	ldr	w0, [x0]
100000afc:     	sxtw	x27, w0
100000b00:     	mov	x17, #0x4               ; =4
100000b04:     	cmp	x27, x17
100000b08:     	b.eq	0x100000ac0 <_coil.io.write-fd+0x68>
100000b0c:     	mov	x17, #0x23              ; =35
100000b10:     	cmp	x27, x17
100000b14:     	b.ne	0x100000b38 <_coil.io.write-fd+0xe0>
100000b18:     	mov	w0, w22
100000b1c:     	mov	x1, #0x4                ; =4
100000b20:     	mov	x2, #-0x2               ; =-2
100000b24:     	uxth	w1, w1
100000b28:     	bl	0x1000017b4 <_coil.io.poll-one>
100000b2c:     	movz	x17, #0x0, lsl #48
100000b30:     	cmp	x0, x17
100000b34:     	b.ne	0x100000ac0 <_coil.io.write-fd+0x68>
100000b38:     	orr	x0, x21, xzr
100000b3c:     	orr	x1, x23, xzr
100000b40:     	mov	w17, #0x1               ; =1
100000b44:     	str	w17, [x21]
100000b48:     	add	x2, x0, #0x8
100000b4c:     	add	x1, x1, #0x8
100000b50:     	mov	w17, #0x1               ; =1
100000b54:     	str	w17, [x23]
100000b58:     	str	x27, [x1]
100000b5c:     	ldr	x1, [x23]
100000b60:     	str	x1, [x2]
100000b64:     	ldr	x1, [x23, #0x8]
100000b68:     	str	x1, [x2, #0x8]
100000b6c:     	b	0x100000b88 <_coil.io.write-fd+0x130>
100000b70:     	orr	x1, x20, xzr
100000b74:     	movz	w17, #0x0, lsl #16
100000b78:     	str	w17, [x20]
100000b7c:     	add	x2, x1, #0x8
100000b80:     	str	x0, [x2]
100000b84:     	mov	x0, x1
100000b88:     	ldr	x1, [x0]
100000b8c:     	str	x1, [x24]
100000b90:     	ldr	x1, [x0, #0x8]
100000b94:     	str	x1, [x24, #0x8]
100000b98:     	ldr	x0, [x0, #0x10]
100000b9c:     	str	x0, [x24, #0x10]
100000ba0:     	sub	sp, x29, #0x0
100000ba4:     	ldr	x19, [sp, #0x10]
100000ba8:     	ldr	x20, [sp, #0x18]
100000bac:     	ldr	x21, [sp, #0x20]
100000bb0:     	ldr	x22, [sp, #0x28]
100000bb4:     	ldr	x23, [sp, #0x30]
100000bb8:     	ldr	x24, [sp, #0x38]
100000bbc:     	ldr	x25, [sp, #0x40]
100000bc0:     	ldr	x26, [sp, #0x48]
100000bc4:     	ldr	x27, [sp, #0x50]
100000bc8:     	ldr	x29, [sp]
100000bcc:     	ldr	x30, [sp, #0x8]
100000bd0:     	add	sp, sp, #0x60
100000bd4:     	ret

0000000100000bd8 <_inherent$coil.fmt.Formatter$clear-spec!>:
100000bd8:     	sub	sp, sp, #0x30
100000bdc:     	str	x29, [sp]
100000be0:     	str	x30, [sp, #0x8]
100000be4:     	mov	x29, sp
100000be8:     	str	x19, [sp, #0x10]
100000bec:     	str	x20, [sp, #0x18]
100000bf0:     	str	x21, [sp, #0x20]
100000bf4:     	sub	sp, sp, #0x30
100000bf8:     	mov	x19, sp
100000bfc:     	add	x20, x0, #0x18
100000c00:     	add	x21, x0, #0x40
100000c04:     	mov	x8, x19
100000c08:     	bl	0x100001294 <_coil.fmt.plain-format-spec>
100000c0c:     	orr	x0, x20, xzr
100000c10:     	orr	x1, x21, xzr
100000c14:     	ldr	x2, [x19]
100000c18:     	str	x2, [x0]
100000c1c:     	ldr	x2, [x19, #0x8]
100000c20:     	str	x2, [x0, #0x8]
100000c24:     	ldr	x2, [x19, #0x10]
100000c28:     	str	x2, [x0, #0x10]
100000c2c:     	ldr	x2, [x19, #0x18]
100000c30:     	str	x2, [x0, #0x18]
100000c34:     	ldr	x2, [x19, #0x20]
100000c38:     	str	x2, [x0, #0x20]
100000c3c:     	movz	w17, #0x0, lsl #16
100000c40:     	strb	w17, [x1]
100000c44:     	movz	x0, #0x0, lsl #48
100000c48:     	sub	sp, x29, #0x0
100000c4c:     	ldr	x19, [sp, #0x10]
100000c50:     	ldr	x20, [sp, #0x18]
100000c54:     	ldr	x21, [sp, #0x20]
100000c58:     	ldr	x29, [sp]
100000c5c:     	ldr	x30, [sp, #0x8]
100000c60:     	add	sp, sp, #0x30
100000c64:     	ret

0000000100000c68 <_coil.fmt.fmt--number__coil.fmt.IntDigits>:
100000c68:     	sub	sp, sp, #0xb0
100000c6c:     	str	x29, [sp]
100000c70:     	str	x30, [sp, #0x8]
100000c74:     	mov	x29, sp
100000c78:     	str	x19, [sp, #0x60]
100000c7c:     	str	x20, [sp, #0x68]
100000c80:     	str	x21, [sp, #0x70]
100000c84:     	str	x22, [sp, #0x78]
100000c88:     	str	x23, [sp, #0x80]
100000c8c:     	str	x24, [sp, #0x88]
100000c90:     	str	x25, [sp, #0x90]
100000c94:     	str	x26, [sp, #0x98]
100000c98:     	str	x27, [sp, #0xa0]
100000c9c:     	str	x28, [sp, #0xa8]
100000ca0:     	sub	sp, sp, #0x30
100000ca4:     	mov	x19, sp
100000ca8:     	orr	x5, x0, xzr
100000cac:     	ubfx	x20, x1, #0, #8
100000cb0:     	orr	x21, x19, xzr
100000cb4:     	sub	sp, sp, #0x30
100000cb8:     	mov	x22, sp
100000cbc:     	sub	sp, sp, #0x10
100000cc0:     	mov	x23, sp
100000cc4:     	sub	sp, sp, #0x10
100000cc8:     	mov	x24, sp
100000ccc:     	sub	sp, sp, #0x10
100000cd0:     	mov	x25, sp
100000cd4:     	sub	sp, sp, #0x10
100000cd8:     	mov	x26, sp
100000cdc:     	sub	sp, sp, #0x10
100000ce0:     	mov	x27, sp
100000ce4:     	sub	sp, sp, #0x20
100000ce8:     	mov	x28, sp
100000cec:     	sub	sp, sp, #0x20
100000cf0:     	mov	x1, sp
100000cf4:     	sub	sp, sp, #0x20
100000cf8:     	mov	x6, sp
100000cfc:     	sub	sp, sp, #0x20
100000d00:     	mov	x7, sp
100000d04:     	sub	sp, sp, #0x20
100000d08:     	mov	x8, sp
100000d0c:     	sub	sp, sp, #0x20
100000d10:     	mov	x9, sp
100000d14:     	sub	sp, sp, #0x20
100000d18:     	mov	x10, sp
100000d1c:     	ldr	x5, [x5]
100000d20:     	str	x2, [x29, #0x10]
100000d24:     	str	x3, [x29, #0x58]
100000d28:     	str	x4, [x29, #0x20]
100000d2c:     	str	x1, [x29, #0x28]
100000d30:     	str	x6, [x29, #0x30]
100000d34:     	str	x7, [x29, #0x38]
100000d38:     	str	x8, [x29, #0x40]
100000d3c:     	mov	x8, x22
100000d40:     	str	x9, [x29, #0x48]
100000d44:     	str	x10, [x29, #0x50]
100000d48:     	str	x28, [x29, #0x18]
100000d4c:     	mov	x28, x5
100000d50:     	bl	0x100001370 <_inherent$coil.fmt.Formatter$take-spec!>
100000d54:     	ldr	x0, [x22]
100000d58:     	str	x0, [x19]
100000d5c:     	ldr	x0, [x22, #0x8]
100000d60:     	str	x0, [x19, #0x8]
100000d64:     	ldr	x1, [x22, #0x10]
100000d68:     	str	x1, [x19, #0x10]
100000d6c:     	ldr	x1, [x22, #0x18]
100000d70:     	str	x1, [x19, #0x18]
100000d74:     	ldr	x1, [x22, #0x20]
100000d78:     	str	x1, [x19, #0x20]
100000d7c:     	movz	x17, #0x0, lsl #48
100000d80:     	cmp	x20, x17
100000d84:     	b.eq	0x100000fa4 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x33c>
100000d88:     	orr	x1, x23, xzr
100000d8c:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
100000d90:     	ldr	x16, [x16, #0x30]
100000d94:     	orr	x2, x16, xzr
100000d98:     	add	x3, x1, #0x8
100000d9c:     	str	x2, [x23]
100000da0:     	orr	x2, x3, xzr
100000da4:     	mov	x17, #0x1               ; =1
100000da8:     	str	x17, [x2]
100000dac:     	mov	x20, x1
100000db0:     	b	0x100000ddc <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x174>
100000db4:     	orr	x1, x25, xzr
100000db8:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
100000dbc:     	ldr	x16, [x16, #0x38]
100000dc0:     	orr	x2, x16, xzr
100000dc4:     	add	x3, x1, #0x8
100000dc8:     	str	x2, [x25]
100000dcc:     	orr	x2, x3, xzr
100000dd0:     	movz	x17, #0x0, lsl #48
100000dd4:     	str	x17, [x2]
100000dd8:     	mov	x20, x1
100000ddc:     	orr	x22, x28, xzr
100000de0:     	ldr	x1, [x19]
100000de4:     	movz	x17, #0x0, lsl #48
100000de8:     	cmp	x1, x17
100000dec:     	b.ge	0x100001018 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x3b0>
100000df0:     	orr	x1, x20, xzr
100000df4:     	add	x2, x20, #0x8
100000df8:     	ldr	x1, [x1]
100000dfc:     	ldr	x2, [x2]
100000e00:     	ldr	x8, [x29, #0x18]
100000e04:     	mov	x23, x0
100000e08:     	mov	x0, x22
100000e0c:     	bl	0x1000009f8 <_coil.io.print-str>
100000e10:     	ldr	x8, [x29, #0x28]
100000e14:     	mov	x0, x22
100000e18:     	ldr	x1, [x29, #0x10]
100000e1c:     	ldr	x2, [x29, #0x58]
100000e20:     	bl	0x1000009f8 <_coil.io.print-str>
100000e24:     	ldr	x0, [x29, #0x20]
100000e28:     	mov	x1, x22
100000e2c:     	mov	x2, x23
100000e30:     	bl	0x10000144c <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits>
100000e34:     	b	0x100000eb0 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x248>
100000e38:     	orr	x19, x20, xzr
100000e3c:     	add	x20, x20, #0x8
100000e40:     	mov	x0, x22
100000e44:     	mov	x1, x21
100000e48:     	mov	x2, x25
100000e4c:     	movz	x3, #0x0, lsl #48
100000e50:     	uxtb	w3, w3
100000e54:     	bl	0x1000015bc <_coil.fmt.fmt--pad-before>
100000e58:     	orr	x0, x20, xzr
100000e5c:     	ldr	x1, [x19]
100000e60:     	ldr	x0, [x0]
100000e64:     	ldr	x8, [x29, #0x48]
100000e68:     	mov	x2, x0
100000e6c:     	mov	x0, x22
100000e70:     	bl	0x1000009f8 <_coil.io.print-str>
100000e74:     	ldr	x8, [x29, #0x50]
100000e78:     	mov	x0, x22
100000e7c:     	ldr	x1, [x29, #0x10]
100000e80:     	mov	x2, x24
100000e84:     	bl	0x1000009f8 <_coil.io.print-str>
100000e88:     	ldr	x0, [x29, #0x20]
100000e8c:     	mov	x1, x22
100000e90:     	mov	x2, x23
100000e94:     	bl	0x10000144c <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits>
100000e98:     	mov	x0, x22
100000e9c:     	mov	x1, x21
100000ea0:     	mov	x2, x25
100000ea4:     	movz	x3, #0x0, lsl #48
100000ea8:     	uxtb	w3, w3
100000eac:     	bl	0x100001678 <_coil.fmt.fmt--pad-after>
100000eb0:     	sub	sp, x29, #0x0
100000eb4:     	ldr	x19, [sp, #0x60]
100000eb8:     	ldr	x20, [sp, #0x68]
100000ebc:     	ldr	x21, [sp, #0x70]
100000ec0:     	ldr	x22, [sp, #0x78]
100000ec4:     	ldr	x23, [sp, #0x80]
100000ec8:     	ldr	x24, [sp, #0x88]
100000ecc:     	ldr	x25, [sp, #0x90]
100000ed0:     	ldr	x26, [sp, #0x98]
100000ed4:     	ldr	x27, [sp, #0xa0]
100000ed8:     	ldr	x28, [sp, #0xa8]
100000edc:     	ldr	x29, [sp]
100000ee0:     	ldr	x30, [sp, #0x8]
100000ee4:     	add	sp, sp, #0xb0
100000ee8:     	ret
100000eec:     	orr	x0, x26, xzr
100000ef0:     	orr	x1, x27, xzr
100000ef4:     	add	x2, x20, #0x8
100000ef8:     	add	x3, x21, #0x21
100000efc:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
100000f00:     	ldr	x16, [x16, #0x40]
100000f04:     	orr	x4, x16, xzr
100000f08:     	movz	x17, #0x0, lsl #48
100000f0c:     	str	x17, [x27]
100000f10:     	add	x5, x0, #0x8
100000f14:     	orr	x24, x2, xzr
100000f18:     	orr	x25, x3, xzr
100000f1c:     	str	x4, [x26]
100000f20:     	orr	x2, x5, xzr
100000f24:     	str	x1, [x2]
100000f28:     	mov	x1, x0
100000f2c:     	ldr	x0, [x29, #0x20]
100000f30:     	mov	x2, x23
100000f34:     	bl	0x10000144c <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits>
100000f38:     	ldr	x0, [x24]
100000f3c:     	ldr	x1, [x27]
100000f40:     	ldrb	w2, [x25]
100000f44:     	ldr	x24, [x29, #0x58]
100000f48:     	add	x1, x1, x24
100000f4c:     	add	x25, x1, x0
100000f50:     	movz	x17, #0x0, lsl #48
100000f54:     	cmp	x2, x17
100000f58:     	b.eq	0x100000e38 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1d0>
100000f5c:     	orr	x0, x20, xzr
100000f60:     	add	x1, x20, #0x8
100000f64:     	ldr	x0, [x0]
100000f68:     	ldr	x1, [x1]
100000f6c:     	ldr	x8, [x29, #0x30]
100000f70:     	mov	x2, x1
100000f74:     	mov	x1, x0
100000f78:     	mov	x0, x22
100000f7c:     	bl	0x1000009f8 <_coil.io.print-str>
100000f80:     	ldr	x8, [x29, #0x38]
100000f84:     	mov	x0, x22
100000f88:     	ldr	x1, [x29, #0x10]
100000f8c:     	mov	x2, x24
100000f90:     	bl	0x1000009f8 <_coil.io.print-str>
100000f94:     	ldr	x0, [x19]
100000f98:     	sub	x19, x0, x25
100000f9c:     	movn	x0, #0x0, lsl #48
100000fa0:     	b	0x100000ff8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x390>
100000fa4:     	add	x1, x21, #0x20
100000fa8:     	ldrb	w1, [x1]
100000fac:     	movz	x17, #0x0, lsl #48
100000fb0:     	cmp	x1, x17
100000fb4:     	b.eq	0x100000db4 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x14c>
100000fb8:     	orr	x1, x24, xzr
100000fbc:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
100000fc0:     	ldr	x16, [x16, #0x48]
100000fc4:     	orr	x2, x16, xzr
100000fc8:     	add	x3, x1, #0x8
100000fcc:     	str	x2, [x24]
100000fd0:     	orr	x2, x3, xzr
100000fd4:     	mov	x17, #0x1               ; =1
100000fd8:     	str	x17, [x2]
100000fdc:     	b	0x100000dd8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x170>
100000fe0:     	ldr	x8, [x29, #0x40]
100000fe4:     	mov	x0, x22
100000fe8:     	mov	x1, #0x30               ; =48
100000fec:     	uxtb	w1, w1
100000ff0:     	bl	0x100001544 <_coil.io.write-byte>
100000ff4:     	mov	x0, x20
100000ff8:     	add	x20, x0, #0x1
100000ffc:     	cmp	x20, x19
100001000:     	b.lt	0x100000fe0 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x378>
100001004:     	ldr	x0, [x29, #0x20]
100001008:     	mov	x1, x22
10000100c:     	mov	x2, x23
100001010:     	bl	0x10000144c <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits>
100001014:     	b	0x100000eb0 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x248>
100001018:     	mov	x23, x0
10000101c:     	b	0x100000eec <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x284>
		...

000000010000102c <_coil.io.write-all>:
10000102c:     	sub	sp, sp, #0x70
100001030:     	str	x29, [sp]
100001034:     	str	x30, [sp, #0x8]
100001038:     	mov	x29, sp
10000103c:     	str	x19, [sp, #0x20]
100001040:     	str	x20, [sp, #0x28]
100001044:     	str	x21, [sp, #0x30]
100001048:     	str	x22, [sp, #0x38]
10000104c:     	str	x23, [sp, #0x40]
100001050:     	str	x24, [sp, #0x48]
100001054:     	str	x25, [sp, #0x50]
100001058:     	str	x26, [sp, #0x58]
10000105c:     	str	x27, [sp, #0x60]
100001060:     	str	x28, [sp, #0x68]
100001064:     	sub	sp, sp, #0x20
100001068:     	mov	x3, sp
10000106c:     	sub	sp, sp, #0x20
100001070:     	mov	x19, sp
100001074:     	sub	sp, sp, #0x20
100001078:     	mov	x20, sp
10000107c:     	sub	sp, sp, #0x20
100001080:     	mov	x21, sp
100001084:     	sub	sp, sp, #0x10
100001088:     	mov	x22, sp
10000108c:     	sub	sp, sp, #0x20
100001090:     	mov	x23, sp
100001094:     	sub	sp, sp, #0x20
100001098:     	mov	x24, sp
10000109c:     	sub	sp, sp, #0x20
1000010a0:     	mov	x25, sp
1000010a4:     	movz	x17, #0x0, lsl #48
1000010a8:     	cmp	x2, x17
1000010ac:     	b.gt	0x100001124 <_coil.io.write-all+0xf8>
1000010b0:     	orr	x0, x3, xzr
1000010b4:     	movz	w17, #0x0, lsl #16
1000010b8:     	str	w17, [x3]
1000010bc:     	add	x1, x0, #0x8
1000010c0:     	movz	x17, #0x0, lsl #48
1000010c4:     	str	x17, [x1]
1000010c8:     	str	x8, [x29, #0x18]
1000010cc:     	ldr	x1, [x0]
1000010d0:     	ldr	x2, [x29, #0x18]
1000010d4:     	str	x1, [x2]
1000010d8:     	ldr	x1, [x0, #0x8]
1000010dc:     	str	x1, [x2, #0x8]
1000010e0:     	ldr	x0, [x0, #0x10]
1000010e4:     	str	x0, [x2, #0x10]
1000010e8:     	sub	sp, x29, #0x0
1000010ec:     	ldr	x19, [sp, #0x20]
1000010f0:     	ldr	x20, [sp, #0x28]
1000010f4:     	ldr	x21, [sp, #0x30]
1000010f8:     	ldr	x22, [sp, #0x38]
1000010fc:     	ldr	x23, [sp, #0x40]
100001100:     	ldr	x24, [sp, #0x48]
100001104:     	ldr	x25, [sp, #0x50]
100001108:     	ldr	x26, [sp, #0x58]
10000110c:     	ldr	x27, [sp, #0x60]
100001110:     	ldr	x28, [sp, #0x68]
100001114:     	ldr	x29, [sp]
100001118:     	ldr	x30, [sp, #0x8]
10000111c:     	add	sp, sp, #0x70
100001120:     	ret
100001124:     	orr	x26, x19, xzr
100001128:     	str	x8, [x29, #0x18]
10000112c:     	mov	x8, x19
100001130:     	str	x0, [x29, #0x10]
100001134:     	mov	x28, x1
100001138:     	mov	x27, x2
10000113c:     	bl	0x10000173c <_coil.io.write-some>
100001140:     	ldr	w0, [x19]
100001144:     	lsr	x16, x0, #0
100001148:     	cmp	x16, #0x1
10000114c:     	b.eq	0x100001168 <_coil.io.write-all+0x13c>
100001150:     	b.lo	0x100001158 <_coil.io.write-all+0x12c>
100001154:     	b	0x10000116c <_coil.io.write-all+0x140>
100001158:     	cmp	x16, #0x0
10000115c:     	b.eq	0x100001164 <_coil.io.write-all+0x138>
100001160:     	b	0x10000116c <_coil.io.write-all+0x140>
100001164:     	b	0x100001198 <_coil.io.write-all+0x16c>
100001168:     	b	0x100001170 <_coil.io.write-all+0x144>
10000116c:     	b	0x10000127c <_coil.io.write-all+0x250>
100001170:     	orr	x0, x20, xzr
100001174:     	add	x1, x26, #0x8
100001178:     	add	x2, x0, #0x8
10000117c:     	ldr	x3, [x1]
100001180:     	ldr	x1, [x1, #0x8]
100001184:     	mov	w17, #0x1               ; =1
100001188:     	str	w17, [x20]
10000118c:     	str	x3, [x2]
100001190:     	str	x1, [x2, #0x8]
100001194:     	b	0x1000010cc <_coil.io.write-all+0xa0>
100001198:     	add	x0, x26, #0x8
10000119c:     	ldr	x0, [x0]
1000011a0:     	orr	x19, x0, xzr
1000011a4:     	movz	x17, #0x0, lsl #48
1000011a8:     	cmp	x19, x17
1000011ac:     	b.gt	0x1000011dc <_coil.io.write-all+0x1b0>
1000011b0:     	orr	x0, x21, xzr
1000011b4:     	mov	w17, #0x1               ; =1
1000011b8:     	str	w17, [x21]
1000011bc:     	add	x1, x0, #0x8
1000011c0:     	mov	w17, #0x5               ; =5
1000011c4:     	str	w17, [x22]
1000011c8:     	ldr	x2, [x22]
1000011cc:     	str	x2, [x1]
1000011d0:     	ldr	x2, [x22, #0x8]
1000011d4:     	str	x2, [x1, #0x8]
1000011d8:     	b	0x100001194 <_coil.io.write-all+0x168>
1000011dc:     	orr	x20, x23, xzr
1000011e0:     	lsr	x0, x19, #0
1000011e4:     	sub	x1, x27, x19
1000011e8:     	add	x0, x0, x28
1000011ec:     	mov	x8, x23
1000011f0:     	mov	x2, x1
1000011f4:     	mov	x1, x0
1000011f8:     	ldr	x0, [x29, #0x10]
1000011fc:     	bl	0x10000102c <_coil.io.write-all>
100001200:     	ldr	w0, [x23]
100001204:     	lsr	x16, x0, #0
100001208:     	cmp	x16, #0x1
10000120c:     	b.eq	0x100001228 <_coil.io.write-all+0x1fc>
100001210:     	b.lo	0x100001218 <_coil.io.write-all+0x1ec>
100001214:     	b	0x10000122c <_coil.io.write-all+0x200>
100001218:     	cmp	x16, #0x0
10000121c:     	b.eq	0x100001224 <_coil.io.write-all+0x1f8>
100001220:     	b	0x10000122c <_coil.io.write-all+0x200>
100001224:     	b	0x100001258 <_coil.io.write-all+0x22c>
100001228:     	b	0x100001230 <_coil.io.write-all+0x204>
10000122c:     	b	0x100001284 <_coil.io.write-all+0x258>
100001230:     	orr	x0, x24, xzr
100001234:     	add	x1, x20, #0x8
100001238:     	add	x2, x0, #0x8
10000123c:     	ldr	x3, [x1]
100001240:     	ldr	x1, [x1, #0x8]
100001244:     	mov	w17, #0x1               ; =1
100001248:     	str	w17, [x24]
10000124c:     	str	x3, [x2]
100001250:     	str	x1, [x2, #0x8]
100001254:     	b	0x100001278 <_coil.io.write-all+0x24c>
100001258:     	orr	x0, x25, xzr
10000125c:     	add	x1, x20, #0x8
100001260:     	add	x2, x0, #0x8
100001264:     	ldr	x1, [x1]
100001268:     	movz	w17, #0x0, lsl #16
10000126c:     	str	w17, [x25]
100001270:     	add	x1, x1, x19
100001274:     	str	x1, [x2]
100001278:     	b	0x1000011d8 <_coil.io.write-all+0x1ac>
10000127c:     	brk	#0
100001280:     	b	0x10000127c <_coil.io.write-all+0x250>
100001284:     	brk	#0
100001288:     	b	0x100001284 <_coil.io.write-all+0x258>
		...

0000000100001294 <_coil.fmt.plain-format-spec>:
100001294:     	sub	sp, sp, #0x10
100001298:     	str	x29, [sp]
10000129c:     	str	x30, [sp, #0x8]
1000012a0:     	mov	x29, sp
1000012a4:     	sub	sp, sp, #0x30
1000012a8:     	mov	x0, sp
1000012ac:     	orr	x1, x0, xzr
1000012b0:     	sub	sp, sp, #0x10
1000012b4:     	mov	x2, sp
1000012b8:     	add	x3, x1, #0x8
1000012bc:     	add	x4, x1, #0x10
1000012c0:     	add	x5, x1, #0x18
1000012c4:     	add	x6, x1, #0x20
1000012c8:     	add	x1, x1, #0x21
1000012cc:     	movz	x17, #0x0, lsl #48
1000012d0:     	str	x17, [x0]
1000012d4:     	movz	x17, #0x0, lsl #48
1000012d8:     	str	x17, [x0, #0x8]
1000012dc:     	movz	x17, #0x0, lsl #48
1000012e0:     	str	x17, [x0, #0x10]
1000012e4:     	movz	x17, #0x0, lsl #48
1000012e8:     	str	x17, [x0, #0x18]
1000012ec:     	movz	x17, #0x0, lsl #48
1000012f0:     	str	x17, [x0, #0x20]
1000012f4:     	movn	x17, #0x0, lsl #48
1000012f8:     	str	x17, [x0]
1000012fc:     	movn	x17, #0x0, lsl #48
100001300:     	str	x17, [x3]
100001304:     	mov	w17, #0x20              ; =32
100001308:     	str	w17, [x4]
10000130c:     	movz	w17, #0x0, lsl #16
100001310:     	str	w17, [x2]
100001314:     	ldr	x2, [x2]
100001318:     	str	x2, [x5]
10000131c:     	movz	w17, #0x0, lsl #16
100001320:     	strb	w17, [x6]
100001324:     	movz	w17, #0x0, lsl #16
100001328:     	strb	w17, [x1]
10000132c:     	ldr	x1, [x0]
100001330:     	ldr	x2, [x0, #0x8]
100001334:     	ldr	x3, [x0, #0x10]
100001338:     	ldr	x4, [x0, #0x18]
10000133c:     	ldr	x0, [x0, #0x20]
100001340:     	str	x1, [x8]
100001344:     	str	x2, [x8, #0x8]
100001348:     	str	x3, [x8, #0x10]
10000134c:     	str	x4, [x8, #0x18]
100001350:     	str	x0, [x8, #0x20]
100001354:     	sub	sp, x29, #0x0
100001358:     	ldr	x29, [sp]
10000135c:     	ldr	x30, [sp, #0x8]
100001360:     	add	sp, sp, #0x10
100001364:     	ret
		...

0000000100001370 <_inherent$coil.fmt.Formatter$take-spec!>:
100001370:     	sub	sp, sp, #0x20
100001374:     	str	x29, [sp]
100001378:     	str	x30, [sp, #0x8]
10000137c:     	mov	x29, sp
100001380:     	str	x19, [sp, #0x10]
100001384:     	str	x20, [sp, #0x18]
100001388:     	sub	sp, sp, #0x30
10000138c:     	mov	x1, sp
100001390:     	add	x2, x0, #0x40
100001394:     	sub	sp, sp, #0x30
100001398:     	mov	x3, sp
10000139c:     	ldrb	w2, [x2]
1000013a0:     	movz	x17, #0x0, lsl #48
1000013a4:     	cmp	x2, x17
1000013a8:     	b.eq	0x1000013f4 <_inherent$coil.fmt.Formatter$take-spec!+0x84>
1000013ac:     	orr	x2, x1, xzr
1000013b0:     	add	x3, x0, #0x40
1000013b4:     	add	x0, x0, #0x18
1000013b8:     	movz	w17, #0x0, lsl #16
1000013bc:     	strb	w17, [x3]
1000013c0:     	ldr	x3, [x0]
1000013c4:     	str	x3, [x1]
1000013c8:     	ldr	x3, [x0, #0x8]
1000013cc:     	str	x3, [x1, #0x8]
1000013d0:     	ldr	x3, [x0, #0x10]
1000013d4:     	str	x3, [x1, #0x10]
1000013d8:     	ldr	x3, [x0, #0x18]
1000013dc:     	str	x3, [x1, #0x18]
1000013e0:     	ldr	x0, [x0, #0x20]
1000013e4:     	str	x0, [x1, #0x20]
1000013e8:     	mov	x20, x8
1000013ec:     	mov	x0, x2
1000013f0:     	b	0x100001408 <_inherent$coil.fmt.Formatter$take-spec!+0x98>
1000013f4:     	orr	x19, x3, xzr
1000013f8:     	mov	x20, x8
1000013fc:     	mov	x8, x3
100001400:     	bl	0x100001294 <_coil.fmt.plain-format-spec>
100001404:     	mov	x0, x19
100001408:     	ldr	x1, [x0]
10000140c:     	str	x1, [x20]
100001410:     	ldr	x1, [x0, #0x8]
100001414:     	str	x1, [x20, #0x8]
100001418:     	ldr	x1, [x0, #0x10]
10000141c:     	str	x1, [x20, #0x10]
100001420:     	ldr	x1, [x0, #0x18]
100001424:     	str	x1, [x20, #0x18]
100001428:     	ldr	x0, [x0, #0x20]
10000142c:     	str	x0, [x20, #0x20]
100001430:     	sub	sp, x29, #0x0
100001434:     	ldr	x19, [sp, #0x10]
100001438:     	ldr	x20, [sp, #0x18]
10000143c:     	ldr	x29, [sp]
100001440:     	ldr	x30, [sp, #0x8]
100001444:     	add	sp, sp, #0x20
100001448:     	ret

000000010000144c <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits>:
10000144c:     	sub	sp, sp, #0x10
100001450:     	str	x29, [sp]
100001454:     	str	x30, [sp, #0x8]
100001458:     	mov	x29, sp
10000145c:     	sub	sp, sp, #0x20
100001460:     	mov	x2, sp
100001464:     	orr	x3, x0, xzr
100001468:     	sub	sp, sp, #0x20
10000146c:     	mov	x4, sp
100001470:     	sub	sp, sp, #0x20
100001474:     	mov	x5, sp
100001478:     	ldr	w3, [x3]
10000147c:     	lsr	x16, x3, #0
100001480:     	cmp	x16, #0x2
100001484:     	b.hi	0x1000014b0 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x64>
100001488:     	adr	x17, 0x100001498 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x4c>
10000148c:     	ldrsw	x16, [x17, x16, lsl #2]
100001490:     	add	x16, x17, x16
100001494:     	br	x16
100001498:     	udf	#0xc
10000149c:     	udf	#0x10
1000014a0:     	udf	#0x14
1000014a4:     	b	0x1000014b4 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x68>
1000014a8:     	b	0x1000014d4 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x88>
1000014ac:     	b	0x1000014f4 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xa8>
1000014b0:     	b	0x100001530 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xe4>
1000014b4:     	add	x0, x0, #0x8
1000014b8:     	ldr	x0, [x0]
1000014bc:     	mov	x8, x2
1000014c0:     	fmov	d31, x0
1000014c4:     	mov	x0, x1
1000014c8:     	fmov	x1, d31
1000014cc:     	bl	0x100001910 <_coil.fmt.print-u>
1000014d0:     	b	0x100001518 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xcc>
1000014d4:     	add	x0, x0, #0x8
1000014d8:     	ldr	x0, [x0]
1000014dc:     	mov	x8, x4
1000014e0:     	fmov	d31, x0
1000014e4:     	mov	x0, x1
1000014e8:     	fmov	x1, d31
1000014ec:     	bl	0x1000019b0 <_coil.fmt.print-uhex>
1000014f0:     	b	0x100001518 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xcc>
1000014f4:     	add	x0, x0, #0x8
1000014f8:     	ldr	x2, [x0]
1000014fc:     	ldr	x0, [x0, #0x8]
100001500:     	mov	x8, x5
100001504:     	fmov	d31, x0
100001508:     	mov	x0, x1
10000150c:     	mov	x1, x2
100001510:     	fmov	x2, d31
100001514:     	bl	0x1000009f8 <_coil.io.print-str>
100001518:     	movz	x0, #0x0, lsl #48
10000151c:     	sub	sp, x29, #0x0
100001520:     	ldr	x29, [sp]
100001524:     	ldr	x30, [sp, #0x8]
100001528:     	add	sp, sp, #0x10
10000152c:     	ret
100001530:     	brk	#0
100001534:     	b	0x100001530 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xe4>
		...

0000000100001544 <_coil.io.write-byte>:
100001544:     	sub	sp, sp, #0x20
100001548:     	str	x29, [sp]
10000154c:     	str	x30, [sp, #0x8]
100001550:     	mov	x29, sp
100001554:     	str	x19, [sp, #0x10]
100001558:     	str	x20, [sp, #0x18]
10000155c:     	sub	sp, sp, #0x10
100001560:     	mov	x2, sp
100001564:     	orr	x3, x2, xzr
100001568:     	sub	sp, sp, #0x20
10000156c:     	mov	x19, sp
100001570:     	strb	w1, [x2]
100001574:     	mov	x1, x3
100001578:     	mov	x20, x8
10000157c:     	mov	x8, x19
100001580:     	mov	x2, #0x1                ; =1
100001584:     	bl	0x10000102c <_coil.io.write-all>
100001588:     	ldr	x0, [x19]
10000158c:     	str	x0, [x20]
100001590:     	ldr	x0, [x19, #0x8]
100001594:     	str	x0, [x20, #0x8]
100001598:     	ldr	x0, [x19, #0x10]
10000159c:     	str	x0, [x20, #0x10]
1000015a0:     	sub	sp, x29, #0x0
1000015a4:     	ldr	x19, [sp, #0x10]
1000015a8:     	ldr	x20, [sp, #0x18]
1000015ac:     	ldr	x29, [sp]
1000015b0:     	ldr	x30, [sp, #0x8]
1000015b4:     	add	sp, sp, #0x20
1000015b8:     	ret

00000001000015bc <_coil.fmt.fmt--pad-before>:
1000015bc:     	sub	sp, sp, #0x10
1000015c0:     	str	x29, [sp]
1000015c4:     	str	x30, [sp, #0x8]
1000015c8:     	mov	x29, sp
1000015cc:     	orr	x4, x1, xzr
1000015d0:     	ldr	x4, [x4]
1000015d4:     	sub	x2, x4, x2
1000015d8:     	movz	x17, #0x0, lsl #48
1000015dc:     	cmp	x2, x17
1000015e0:     	b.le	0x100001644 <_coil.fmt.fmt--pad-before+0x88>
1000015e4:     	add	x4, x1, #0x18
1000015e8:     	ldr	x4, [x4]
1000015ec:     	lsr	w4, w4, #0
1000015f0:     	lsr	x16, x4, #0
1000015f4:     	cmp	x16, #0x3
1000015f8:     	b.hi	0x10000162c <_coil.fmt.fmt--pad-before+0x70>
1000015fc:     	adr	x17, 0x10000160c <_coil.fmt.fmt--pad-before+0x50>
100001600:     	ldrsw	x16, [x17, x16, lsl #2]
100001604:     	add	x16, x17, x16
100001608:     	br	x16
10000160c:     	udf	#0x10
100001610:     	udf	#0x14
100001614:     	udf	#0x18
100001618:     	udf	#0x1c
10000161c:     	b	0x100001658 <_coil.fmt.fmt--pad-before+0x9c>
100001620:     	b	0x100001644 <_coil.fmt.fmt--pad-before+0x88>
100001624:     	b	0x100001630 <_coil.fmt.fmt--pad-before+0x74>
100001628:     	b	0x100001638 <_coil.fmt.fmt--pad-before+0x7c>
10000162c:     	b	0x100001670 <_coil.fmt.fmt--pad-before+0xb4>
100001630:     	bl	0x100001ab8 <_coil.fmt.fmt--fill>
100001634:     	b	0x100001644 <_coil.fmt.fmt--pad-before+0x88>
100001638:     	mov	x17, #0x2               ; =2
10000163c:     	sdiv	x2, x2, x17
100001640:     	bl	0x100001ab8 <_coil.fmt.fmt--fill>
100001644:     	movz	x0, #0x0, lsl #48
100001648:     	ldr	x29, [sp]
10000164c:     	ldr	x30, [sp, #0x8]
100001650:     	add	sp, sp, #0x10
100001654:     	ret
100001658:     	ubfx	x3, x3, #0, #8
10000165c:     	movz	x17, #0x0, lsl #48
100001660:     	cmp	x3, x17
100001664:     	b.ne	0x100001644 <_coil.fmt.fmt--pad-before+0x88>
100001668:     	bl	0x100001ab8 <_coil.fmt.fmt--fill>
10000166c:     	b	0x100001644 <_coil.fmt.fmt--pad-before+0x88>
100001670:     	brk	#0
100001674:     	b	0x100001670 <_coil.fmt.fmt--pad-before+0xb4>

0000000100001678 <_coil.fmt.fmt--pad-after>:
100001678:     	sub	sp, sp, #0x10
10000167c:     	str	x29, [sp]
100001680:     	str	x30, [sp, #0x8]
100001684:     	mov	x29, sp
100001688:     	orr	x4, x1, xzr
10000168c:     	ldr	x4, [x4]
100001690:     	sub	x2, x4, x2
100001694:     	movz	x17, #0x0, lsl #48
100001698:     	cmp	x2, x17
10000169c:     	b.le	0x100001708 <_coil.fmt.fmt--pad-after+0x90>
1000016a0:     	add	x4, x1, #0x18
1000016a4:     	ldr	x4, [x4]
1000016a8:     	lsr	w4, w4, #0
1000016ac:     	lsr	x16, x4, #0
1000016b0:     	cmp	x16, #0x3
1000016b4:     	b.hi	0x1000016e8 <_coil.fmt.fmt--pad-after+0x70>
1000016b8:     	adr	x17, 0x1000016c8 <_coil.fmt.fmt--pad-after+0x50>
1000016bc:     	ldrsw	x16, [x17, x16, lsl #2]
1000016c0:     	add	x16, x17, x16
1000016c4:     	br	x16
1000016c8:     	udf	#0x10
1000016cc:     	udf	#0x14
1000016d0:     	udf	#0x18
1000016d4:     	udf	#0x1c
1000016d8:     	b	0x10000171c <_coil.fmt.fmt--pad-after+0xa4>
1000016dc:     	b	0x1000016ec <_coil.fmt.fmt--pad-after+0x74>
1000016e0:     	b	0x100001708 <_coil.fmt.fmt--pad-after+0x90>
1000016e4:     	b	0x1000016f4 <_coil.fmt.fmt--pad-after+0x7c>
1000016e8:     	b	0x100001734 <_coil.fmt.fmt--pad-after+0xbc>
1000016ec:     	bl	0x100001ab8 <_coil.fmt.fmt--fill>
1000016f0:     	b	0x100001708 <_coil.fmt.fmt--pad-after+0x90>
1000016f4:     	orr	x3, x2, xzr
1000016f8:     	mov	x17, #0x2               ; =2
1000016fc:     	sdiv	x3, x3, x17
100001700:     	sub	x2, x2, x3
100001704:     	bl	0x100001ab8 <_coil.fmt.fmt--fill>
100001708:     	movz	x0, #0x0, lsl #48
10000170c:     	ldr	x29, [sp]
100001710:     	ldr	x30, [sp, #0x8]
100001714:     	add	sp, sp, #0x10
100001718:     	ret
10000171c:     	ubfx	x3, x3, #0, #8
100001720:     	movz	x17, #0x0, lsl #48
100001724:     	cmp	x3, x17
100001728:     	b.eq	0x100001708 <_coil.fmt.fmt--pad-after+0x90>
10000172c:     	bl	0x100001ab8 <_coil.fmt.fmt--fill>
100001730:     	b	0x100001708 <_coil.fmt.fmt--pad-after+0x90>
100001734:     	brk	#0
100001738:     	b	0x100001734 <_coil.fmt.fmt--pad-after+0xbc>

000000010000173c <_coil.io.write-some>:
10000173c:     	sub	sp, sp, #0x20
100001740:     	str	x29, [sp]
100001744:     	str	x30, [sp, #0x8]
100001748:     	mov	x29, sp
10000174c:     	str	x19, [sp, #0x10]
100001750:     	str	x20, [sp, #0x18]
100001754:     	sub	sp, sp, #0x20
100001758:     	mov	x19, sp
10000175c:     	orr	x3, x0, xzr
100001760:     	add	x0, x0, #0x8
100001764:     	ldr	x3, [x3]
100001768:     	ldr	x0, [x0]
10000176c:     	mov	x30, x3
100001770:     	mov	x20, x8
100001774:     	mov	x8, x19
100001778:     	blr	x30
10000177c:     	ldr	x0, [x19]
100001780:     	str	x0, [x20]
100001784:     	ldr	x0, [x19, #0x8]
100001788:     	str	x0, [x20, #0x8]
10000178c:     	ldr	x0, [x19, #0x10]
100001790:     	str	x0, [x20, #0x10]
100001794:     	sub	sp, x29, #0x0
100001798:     	ldr	x19, [sp, #0x10]
10000179c:     	ldr	x20, [sp, #0x18]
1000017a0:     	ldr	x29, [sp]
1000017a4:     	ldr	x30, [sp, #0x8]
1000017a8:     	add	sp, sp, #0x20
1000017ac:     	ret
1000017b0:     	udf	#0x0

00000001000017b4 <_coil.io.poll-one>:
1000017b4:     	sub	sp, sp, #0x40
1000017b8:     	str	x29, [sp]
1000017bc:     	str	x30, [sp, #0x8]
1000017c0:     	mov	x29, sp
1000017c4:     	str	x19, [sp, #0x10]
1000017c8:     	str	x20, [sp, #0x18]
1000017cc:     	str	x21, [sp, #0x20]
1000017d0:     	str	x22, [sp, #0x28]
1000017d4:     	str	x23, [sp, #0x30]
1000017d8:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
1000017dc:     	ldr	x16, [x16, #0x50]
1000017e0:     	orr	x19, x16, xzr
1000017e4:     	sub	sp, sp, #0x10
1000017e8:     	mov	x20, sp
1000017ec:     	mov	w21, w0
1000017f0:     	mov	x0, x19
1000017f4:     	mov	w22, w1
1000017f8:     	mov	x23, x2
1000017fc:     	bl	0x100001f40 <_coil.atomic.read-ptr__i8>
100001800:     	movz	x17, #0x0, lsl #48
100001804:     	cmp	x0, x17
100001808:     	b.ne	0x10000183c <_coil.io.poll-one+0x88>
10000180c:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
100001810:     	ldr	x16, [x16, #0x58]
100001814:     	orr	x0, x16, xzr
100001818:     	mov	x1, x0
10000181c:     	mov	x0, x23
100001820:     	bl	0x100001f60 <dyld_stub_binder+0x100001f60>
100001824:     	mov	x1, x0
100001828:     	fmov	d31, x0
10000182c:     	mov	x0, x19
100001830:     	fmov	x19, d31
100001834:     	bl	0x100001f4c <_coil.atomic.store-ptr__i8>
100001838:     	mov	x0, x19
10000183c:     	orr	x1, x20, xzr
100001840:     	lsr	w2, w21, #0
100001844:     	uxth	w3, w22
100001848:     	add	x4, x1, #0x4
10000184c:     	add	x5, x1, #0x6
100001850:     	str	w2, [x20]
100001854:     	orr	x2, x4, xzr
100001858:     	orr	x4, x5, xzr
10000185c:     	strh	w3, [x2]
100001860:     	movz	w17, #0x0, lsl #16
100001864:     	strh	w17, [x4]
100001868:     	movz	x17, #0x0, lsl #48
10000186c:     	cmp	x0, x17
100001870:     	b.ne	0x1000018d0 <_coil.io.poll-one+0x11c>
100001874:     	movz	x0, #0x0, lsl #48
100001878:     	b	0x1000018a8 <_coil.io.poll-one+0xf4>
10000187c:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
100001880:     	ldr	x16, [x16, #0x60]
100001884:     	orr	x0, x16, xzr
100001888:     	mov	x1, #-0x2               ; =-2
10000188c:     	bl	0x100001bc0 <_coil.os.dlsym-errno-cell>
100001890:     	ldr	w0, [x0]
100001894:     	sxtw	x0, w0
100001898:     	mov	x17, #0x4               ; =4
10000189c:     	cmp	x0, x17
1000018a0:     	cset	w0, eq
1000018a4:     	ubfx	x0, x0, #0, #8
1000018a8:     	sub	sp, x29, #0x0
1000018ac:     	ldr	x19, [sp, #0x10]
1000018b0:     	ldr	x20, [sp, #0x18]
1000018b4:     	ldr	x21, [sp, #0x20]
1000018b8:     	ldr	x22, [sp, #0x28]
1000018bc:     	ldr	x23, [sp, #0x30]
1000018c0:     	ldr	x29, [sp]
1000018c4:     	ldr	x30, [sp, #0x8]
1000018c8:     	add	sp, sp, #0x40
1000018cc:     	ret
1000018d0:     	mov	x30, x0
1000018d4:     	mov	x0, x1
1000018d8:     	mov	x1, #0x1                ; =1
1000018dc:     	mov	x2, #0xffff             ; =65535
1000018e0:     	movk	x2, #0xffff, lsl #16
1000018e4:     	blr	x30
1000018e8:     	lsr	w0, w0, #0
1000018ec:     	sxtw	x0, w0
1000018f0:     	movz	x17, #0x0, lsl #48
1000018f4:     	cmp	x0, x17
1000018f8:     	b.lt	0x10000187c <_coil.io.poll-one+0xc8>
1000018fc:     	mov	x0, #0x1                ; =1
100001900:     	b	0x1000018a8 <_coil.io.poll-one+0xf4>
		...

0000000100001910 <_coil.fmt.print-u>:
100001910:     	sub	sp, sp, #0x20
100001914:     	str	x29, [sp]
100001918:     	str	x30, [sp, #0x8]
10000191c:     	mov	x29, sp
100001920:     	str	x19, [sp, #0x10]
100001924:     	str	x20, [sp, #0x18]
100001928:     	sub	sp, sp, #0x20
10000192c:     	mov	x2, sp
100001930:     	sub	sp, sp, #0x20
100001934:     	mov	x3, sp
100001938:     	movz	x17, #0x0, lsl #48
10000193c:     	cmp	x1, x17
100001940:     	b.ne	0x1000019a8 <_coil.fmt.print-u+0x98>
100001944:     	orr	x19, x2, xzr
100001948:     	mov	x20, x8
10000194c:     	mov	x8, x2
100001950:     	mov	x1, #0x30               ; =48
100001954:     	uxtb	w1, w1
100001958:     	bl	0x100001544 <_coil.io.write-byte>
10000195c:     	mov	x0, x19
100001960:     	b	0x100001974 <_coil.fmt.print-u+0x64>
100001964:     	orr	x19, x3, xzr
100001968:     	mov	x8, x3
10000196c:     	bl	0x100001c4c <_coil.fmt.udec-digits>
100001970:     	mov	x0, x19
100001974:     	ldr	x1, [x0]
100001978:     	str	x1, [x20]
10000197c:     	ldr	x1, [x0, #0x8]
100001980:     	str	x1, [x20, #0x8]
100001984:     	ldr	x0, [x0, #0x10]
100001988:     	str	x0, [x20, #0x10]
10000198c:     	sub	sp, x29, #0x0
100001990:     	ldr	x19, [sp, #0x10]
100001994:     	ldr	x20, [sp, #0x18]
100001998:     	ldr	x29, [sp]
10000199c:     	ldr	x30, [sp, #0x8]
1000019a0:     	add	sp, sp, #0x20
1000019a4:     	ret
1000019a8:     	mov	x20, x8
1000019ac:     	b	0x100001964 <_coil.fmt.print-u+0x54>

00000001000019b0 <_coil.fmt.print-uhex>:
1000019b0:     	sub	sp, sp, #0x20
1000019b4:     	str	x29, [sp]
1000019b8:     	str	x30, [sp, #0x8]
1000019bc:     	mov	x29, sp
1000019c0:     	str	x19, [sp, #0x10]
1000019c4:     	str	x20, [sp, #0x18]
1000019c8:     	sub	sp, sp, #0x20
1000019cc:     	mov	x2, sp
1000019d0:     	sub	sp, sp, #0x20
1000019d4:     	mov	x3, sp
1000019d8:     	movz	x17, #0x0, lsl #48
1000019dc:     	cmp	x1, x17
1000019e0:     	b.ne	0x100001a48 <_coil.fmt.print-uhex+0x98>
1000019e4:     	orr	x19, x2, xzr
1000019e8:     	mov	x20, x8
1000019ec:     	mov	x8, x2
1000019f0:     	mov	x1, #0x30               ; =48
1000019f4:     	uxtb	w1, w1
1000019f8:     	bl	0x100001544 <_coil.io.write-byte>
1000019fc:     	mov	x0, x19
100001a00:     	b	0x100001a14 <_coil.fmt.print-uhex+0x64>
100001a04:     	orr	x19, x3, xzr
100001a08:     	mov	x8, x3
100001a0c:     	bl	0x100001dbc <_coil.fmt.uhex-digits>
100001a10:     	mov	x0, x19
100001a14:     	ldr	x1, [x0]
100001a18:     	str	x1, [x20]
100001a1c:     	ldr	x1, [x0, #0x8]
100001a20:     	str	x1, [x20, #0x8]
100001a24:     	ldr	x0, [x0, #0x10]
100001a28:     	str	x0, [x20, #0x10]
100001a2c:     	sub	sp, x29, #0x0
100001a30:     	ldr	x19, [sp, #0x10]
100001a34:     	ldr	x20, [sp, #0x18]
100001a38:     	ldr	x29, [sp]
100001a3c:     	ldr	x30, [sp, #0x8]
100001a40:     	add	sp, sp, #0x20
100001a44:     	ret
100001a48:     	mov	x20, x8
100001a4c:     	b	0x100001a04 <_coil.fmt.print-uhex+0x54>

0000000100001a50 <_coil.fmt.count--write>:
100001a50:     	sub	sp, sp, #0x10
100001a54:     	str	x29, [sp]
100001a58:     	str	x30, [sp, #0x8]
100001a5c:     	mov	x29, sp
100001a60:     	sub	sp, sp, #0x20
100001a64:     	mov	x1, sp
100001a68:     	orr	x3, x1, xzr
100001a6c:     	ldr	x4, [x0]
100001a70:     	add	x3, x3, #0x8
100001a74:     	add	x4, x4, x2
100001a78:     	str	x4, [x0]
100001a7c:     	movz	w17, #0x0, lsl #16
100001a80:     	str	w17, [x1]
100001a84:     	str	x2, [x3]
100001a88:     	ldr	x0, [x1]
100001a8c:     	str	x0, [x8]
100001a90:     	ldr	x0, [x1, #0x8]
100001a94:     	str	x0, [x8, #0x8]
100001a98:     	ldr	x0, [x1, #0x10]
100001a9c:     	str	x0, [x8, #0x10]
100001aa0:     	sub	sp, x29, #0x0
100001aa4:     	ldr	x29, [sp]
100001aa8:     	ldr	x30, [sp, #0x8]
100001aac:     	add	sp, sp, #0x10
100001ab0:     	ret
100001ab4:     	udf	#0x0

0000000100001ab8 <_coil.fmt.fmt--fill>:
100001ab8:     	sub	sp, sp, #0x50
100001abc:     	str	x29, [sp]
100001ac0:     	str	x30, [sp, #0x8]
100001ac4:     	mov	x29, sp
100001ac8:     	str	x19, [sp, #0x10]
100001acc:     	str	x20, [sp, #0x18]
100001ad0:     	str	x21, [sp, #0x20]
100001ad4:     	str	x22, [sp, #0x28]
100001ad8:     	str	x23, [sp, #0x30]
100001adc:     	str	x24, [sp, #0x38]
100001ae0:     	str	x25, [sp, #0x40]
100001ae4:     	sub	sp, sp, #0x20
100001ae8:     	mov	x19, sp
100001aec:     	add	x1, x1, #0x10
100001af0:     	sub	sp, sp, #0x20
100001af4:     	mov	x20, sp
100001af8:     	orr	x21, x1, xzr
100001afc:     	movn	x1, #0x0, lsl #48
100001b00:     	b	0x100001b54 <_coil.fmt.fmt--fill+0x9c>
100001b04:     	nop
100001b08:     	lsr	x0, x0, #8
100001b0c:     	lsr	w0, w0, #0
100001b10:     	orr	x23, x0, xzr
100001b14:     	and	x0, x23, #0xff
100001b18:     	uxtb	w0, w0
100001b1c:     	mov	x8, x20
100001b20:     	mov	w1, w0
100001b24:     	mov	x0, x24
100001b28:     	uxtb	w1, w1
100001b2c:     	bl	0x100001544 <_coil.io.write-byte>
100001b30:     	mov	x0, x23
100001b34:     	lsr	x1, x0, #8
100001b38:     	lsr	w1, w1, #0
100001b3c:     	movz	x17, #0x0, lsl #48
100001b40:     	cmp	x1, x17
100001b44:     	b.ne	0x100001b08 <_coil.fmt.fmt--fill+0x50>
100001b48:     	mov	x0, x24
100001b4c:     	mov	x2, x25
100001b50:     	mov	x1, x22
100001b54:     	add	x22, x1, #0x1
100001b58:     	cmp	x22, x2
100001b5c:     	b.ge	0x100001b8c <_coil.fmt.fmt--fill+0xd4>
100001b60:     	ldr	w1, [x21]
100001b64:     	orr	x23, x1, xzr
100001b68:     	and	x1, x23, #0xff
100001b6c:     	uxtb	w1, w1
100001b70:     	mov	x8, x19
100001b74:     	mov	x24, x0
100001b78:     	mov	x25, x2
100001b7c:     	uxtb	w1, w1
100001b80:     	bl	0x100001544 <_coil.io.write-byte>
100001b84:     	mov	x0, x23
100001b88:     	b	0x100001b34 <_coil.fmt.fmt--fill+0x7c>
100001b8c:     	movz	x0, #0x0, lsl #48
100001b90:     	sub	sp, x29, #0x0
100001b94:     	ldr	x19, [sp, #0x10]
100001b98:     	ldr	x20, [sp, #0x18]
100001b9c:     	ldr	x21, [sp, #0x20]
100001ba0:     	ldr	x22, [sp, #0x28]
100001ba4:     	ldr	x23, [sp, #0x30]
100001ba8:     	ldr	x24, [sp, #0x38]
100001bac:     	ldr	x25, [sp, #0x40]
100001bb0:     	ldr	x29, [sp]
100001bb4:     	ldr	x30, [sp, #0x8]
100001bb8:     	add	sp, sp, #0x50
100001bbc:     	ret

0000000100001bc0 <_coil.os.dlsym-errno-cell>:
100001bc0:     	sub	sp, sp, #0x30
100001bc4:     	str	x29, [sp]
100001bc8:     	str	x30, [sp, #0x8]
100001bcc:     	mov	x29, sp
100001bd0:     	str	x19, [sp, #0x10]
100001bd4:     	str	x20, [sp, #0x18]
100001bd8:     	str	x21, [sp, #0x20]
100001bdc:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
100001be0:     	ldr	x16, [x16, #0x68]
100001be4:     	orr	x19, x16, xzr
100001be8:     	mov	x20, x0
100001bec:     	mov	x0, x19
100001bf0:     	mov	x21, x1
100001bf4:     	bl	0x100001f40 <_coil.atomic.read-ptr__i8>
100001bf8:     	movz	x17, #0x0, lsl #48
100001bfc:     	cmp	x0, x17
100001c00:     	b.ne	0x100001c28 <_coil.os.dlsym-errno-cell+0x68>
100001c04:     	mov	x0, x21
100001c08:     	mov	x1, x20
100001c0c:     	bl	0x100001f60 <dyld_stub_binder+0x100001f60>
100001c10:     	mov	x1, x0
100001c14:     	fmov	d31, x0
100001c18:     	mov	x0, x19
100001c1c:     	fmov	x19, d31
100001c20:     	bl	0x100001f4c <_coil.atomic.store-ptr__i8>
100001c24:     	mov	x0, x19
100001c28:     	mov	x30, x0
100001c2c:     	blr	x30
100001c30:     	ldr	x19, [sp, #0x10]
100001c34:     	ldr	x20, [sp, #0x18]
100001c38:     	ldr	x21, [sp, #0x20]
100001c3c:     	ldr	x29, [sp]
100001c40:     	ldr	x30, [sp, #0x8]
100001c44:     	add	sp, sp, #0x30
100001c48:     	ret

0000000100001c4c <_coil.fmt.udec-digits>:
100001c4c:     	sub	sp, sp, #0x40
100001c50:     	str	x29, [sp]
100001c54:     	str	x30, [sp, #0x8]
100001c58:     	mov	x29, sp
100001c5c:     	str	x19, [sp, #0x10]
100001c60:     	str	x20, [sp, #0x18]
100001c64:     	str	x21, [sp, #0x20]
100001c68:     	str	x22, [sp, #0x28]
100001c6c:     	str	x23, [sp, #0x30]
100001c70:     	str	x24, [sp, #0x38]
100001c74:     	sub	sp, sp, #0x20
100001c78:     	mov	x2, sp
100001c7c:     	sub	sp, sp, #0x20
100001c80:     	mov	x19, sp
100001c84:     	sub	sp, sp, #0x20
100001c88:     	mov	x20, sp
100001c8c:     	sub	sp, sp, #0x20
100001c90:     	mov	x21, sp
100001c94:     	movz	x17, #0x0, lsl #48
100001c98:     	cmp	x1, x17
100001c9c:     	b.ne	0x100001d00 <_coil.fmt.udec-digits+0xb4>
100001ca0:     	orr	x0, x2, xzr
100001ca4:     	movz	w17, #0x0, lsl #16
100001ca8:     	str	w17, [x2]
100001cac:     	add	x1, x0, #0x8
100001cb0:     	movz	x17, #0x0, lsl #48
100001cb4:     	str	x17, [x1]
100001cb8:     	mov	x22, x8
100001cbc:     	ldr	x1, [x0]
100001cc0:     	str	x1, [x22]
100001cc4:     	ldr	x1, [x0, #0x8]
100001cc8:     	str	x1, [x22, #0x8]
100001ccc:     	ldr	x0, [x0, #0x10]
100001cd0:     	str	x0, [x22, #0x10]
100001cd4:     	sub	sp, x29, #0x0
100001cd8:     	ldr	x19, [sp, #0x10]
100001cdc:     	ldr	x20, [sp, #0x18]
100001ce0:     	ldr	x21, [sp, #0x20]
100001ce4:     	ldr	x22, [sp, #0x28]
100001ce8:     	ldr	x23, [sp, #0x30]
100001cec:     	ldr	x24, [sp, #0x38]
100001cf0:     	ldr	x29, [sp]
100001cf4:     	ldr	x30, [sp, #0x8]
100001cf8:     	add	sp, sp, #0x40
100001cfc:     	ret
100001d00:     	mov	x17, #0xa               ; =10
100001d04:     	udiv	x2, x1, x17
100001d08:     	mov	x22, x8
100001d0c:     	mov	x8, x19
100001d10:     	mov	x23, x0
100001d14:     	mov	x24, x1
100001d18:     	mov	x1, x2
100001d1c:     	bl	0x100001c4c <_coil.fmt.udec-digits>
100001d20:     	ldr	w0, [x19]
100001d24:     	lsr	x16, x0, #0
100001d28:     	cmp	x16, #0x1
100001d2c:     	b.eq	0x100001d48 <_coil.fmt.udec-digits+0xfc>
100001d30:     	b.lo	0x100001d38 <_coil.fmt.udec-digits+0xec>
100001d34:     	b	0x100001d4c <_coil.fmt.udec-digits+0x100>
100001d38:     	cmp	x16, #0x0
100001d3c:     	b.eq	0x100001d44 <_coil.fmt.udec-digits+0xf8>
100001d40:     	b	0x100001d4c <_coil.fmt.udec-digits+0x100>
100001d44:     	b	0x100001d80 <_coil.fmt.udec-digits+0x134>
100001d48:     	b	0x100001d50 <_coil.fmt.udec-digits+0x104>
100001d4c:     	b	0x100001db4 <_coil.fmt.udec-digits+0x168>
100001d50:     	orr	x0, x19, xzr
100001d54:     	orr	x1, x20, xzr
100001d58:     	add	x0, x0, #0x8
100001d5c:     	add	x2, x1, #0x8
100001d60:     	ldr	x3, [x0]
100001d64:     	ldr	x0, [x0, #0x8]
100001d68:     	mov	w17, #0x1               ; =1
100001d6c:     	str	w17, [x20]
100001d70:     	str	x3, [x2]
100001d74:     	str	x0, [x2, #0x8]
100001d78:     	mov	x0, x1
100001d7c:     	b	0x100001db0 <_coil.fmt.udec-digits+0x164>
100001d80:     	orr	x19, x21, xzr
100001d84:     	mov	x17, #0xa               ; =10
100001d88:     	udiv	x16, x24, x17
100001d8c:     	msub	x0, x16, x17, x24
100001d90:     	add	x0, x0, #0x30
100001d94:     	uxtb	w0, w0
100001d98:     	mov	x8, x21
100001d9c:     	mov	w1, w0
100001da0:     	mov	x0, x23
100001da4:     	uxtb	w1, w1
100001da8:     	bl	0x100001544 <_coil.io.write-byte>
100001dac:     	mov	x0, x19
100001db0:     	b	0x100001cbc <_coil.fmt.udec-digits+0x70>
100001db4:     	brk	#0
100001db8:     	b	0x100001db4 <_coil.fmt.udec-digits+0x168>

0000000100001dbc <_coil.fmt.uhex-digits>:
100001dbc:     	sub	sp, sp, #0x40
100001dc0:     	str	x29, [sp]
100001dc4:     	str	x30, [sp, #0x8]
100001dc8:     	mov	x29, sp
100001dcc:     	str	x19, [sp, #0x10]
100001dd0:     	str	x20, [sp, #0x18]
100001dd4:     	str	x21, [sp, #0x20]
100001dd8:     	str	x22, [sp, #0x28]
100001ddc:     	str	x23, [sp, #0x30]
100001de0:     	str	x24, [sp, #0x38]
100001de4:     	sub	sp, sp, #0x20
100001de8:     	mov	x2, sp
100001dec:     	sub	sp, sp, #0x20
100001df0:     	mov	x19, sp
100001df4:     	sub	sp, sp, #0x20
100001df8:     	mov	x20, sp
100001dfc:     	sub	sp, sp, #0x20
100001e00:     	mov	x21, sp
100001e04:     	movz	x17, #0x0, lsl #48
100001e08:     	cmp	x1, x17
100001e0c:     	b.ne	0x100001e70 <_coil.fmt.uhex-digits+0xb4>
100001e10:     	orr	x0, x2, xzr
100001e14:     	movz	w17, #0x0, lsl #16
100001e18:     	str	w17, [x2]
100001e1c:     	add	x1, x0, #0x8
100001e20:     	movz	x17, #0x0, lsl #48
100001e24:     	str	x17, [x1]
100001e28:     	mov	x22, x8
100001e2c:     	ldr	x1, [x0]
100001e30:     	str	x1, [x22]
100001e34:     	ldr	x1, [x0, #0x8]
100001e38:     	str	x1, [x22, #0x8]
100001e3c:     	ldr	x0, [x0, #0x10]
100001e40:     	str	x0, [x22, #0x10]
100001e44:     	sub	sp, x29, #0x0
100001e48:     	ldr	x19, [sp, #0x10]
100001e4c:     	ldr	x20, [sp, #0x18]
100001e50:     	ldr	x21, [sp, #0x20]
100001e54:     	ldr	x22, [sp, #0x28]
100001e58:     	ldr	x23, [sp, #0x30]
100001e5c:     	ldr	x24, [sp, #0x38]
100001e60:     	ldr	x29, [sp]
100001e64:     	ldr	x30, [sp, #0x8]
100001e68:     	add	sp, sp, #0x40
100001e6c:     	ret
100001e70:     	mov	x17, #0x10              ; =16
100001e74:     	udiv	x2, x1, x17
100001e78:     	mov	x22, x8
100001e7c:     	mov	x8, x19
100001e80:     	mov	x23, x0
100001e84:     	mov	x24, x1
100001e88:     	mov	x1, x2
100001e8c:     	bl	0x100001dbc <_coil.fmt.uhex-digits>
100001e90:     	ldr	w0, [x19]
100001e94:     	lsr	x16, x0, #0
100001e98:     	cmp	x16, #0x1
100001e9c:     	b.eq	0x100001eb8 <_coil.fmt.uhex-digits+0xfc>
100001ea0:     	b.lo	0x100001ea8 <_coil.fmt.uhex-digits+0xec>
100001ea4:     	b	0x100001ebc <_coil.fmt.uhex-digits+0x100>
100001ea8:     	cmp	x16, #0x0
100001eac:     	b.eq	0x100001eb4 <_coil.fmt.uhex-digits+0xf8>
100001eb0:     	b	0x100001ebc <_coil.fmt.uhex-digits+0x100>
100001eb4:     	b	0x100001f18 <_coil.fmt.uhex-digits+0x15c>
100001eb8:     	b	0x100001ec0 <_coil.fmt.uhex-digits+0x104>
100001ebc:     	b	0x100001f38 <_coil.fmt.uhex-digits+0x17c>
100001ec0:     	orr	x0, x19, xzr
100001ec4:     	orr	x1, x20, xzr
100001ec8:     	add	x0, x0, #0x8
100001ecc:     	add	x2, x1, #0x8
100001ed0:     	ldr	x3, [x0]
100001ed4:     	ldr	x0, [x0, #0x8]
100001ed8:     	mov	w17, #0x1               ; =1
100001edc:     	str	w17, [x20]
100001ee0:     	str	x3, [x2]
100001ee4:     	str	x0, [x2, #0x8]
100001ee8:     	mov	x0, x1
100001eec:     	b	0x100001f14 <_coil.fmt.uhex-digits+0x158>
100001ef0:     	add	x0, x0, #0x57
100001ef4:     	orr	x19, x21, xzr
100001ef8:     	uxtb	w0, w0
100001efc:     	mov	x8, x21
100001f00:     	mov	w1, w0
100001f04:     	mov	x0, x23
100001f08:     	uxtb	w1, w1
100001f0c:     	bl	0x100001544 <_coil.io.write-byte>
100001f10:     	mov	x0, x19
100001f14:     	b	0x100001e2c <_coil.fmt.uhex-digits+0x70>
100001f18:     	mov	x17, #0x10              ; =16
100001f1c:     	udiv	x16, x24, x17
100001f20:     	msub	x0, x16, x17, x24
100001f24:     	mov	x17, #0xa               ; =10
100001f28:     	cmp	x0, x17
100001f2c:     	b.ge	0x100001ef0 <_coil.fmt.uhex-digits+0x134>
100001f30:     	add	x0, x0, #0x30
100001f34:     	b	0x100001ef4 <_coil.fmt.uhex-digits+0x138>
100001f38:     	brk	#0
100001f3c:     	b	0x100001f38 <_coil.fmt.uhex-digits+0x17c>

0000000100001f40 <_coil.atomic.read-ptr__i8>:
100001f40:     	mov	x16, x0
100001f44:     	ldar	x0, [x16]
100001f48:     	ret

0000000100001f4c <_coil.atomic.store-ptr__i8>:
100001f4c:     	mov	x16, x0
100001f50:     	mov	x17, x1
100001f54:     	stlr	x17, [x16]
100001f58:     	movz	x0, #0x0, lsl #48
100001f5c:     	ret

Disassembly of section __TEXT,__stubs:

0000000100001f60 <__stubs>:
100001f60:     	adrp	x16, 0x100008000 <dyld_stub_binder+0x100008000>
100001f64:     	ldr	x16, [x16]
100001f68:     	br	x16
100001f6c:     	adrp	x16, 0x100008000 <dyld_stub_binder+0x100008000>
100001f70:     	ldr	x16, [x16, #0x8]
100001f74:     	br	x16

Disassembly of section __TEXT,__stub_helper:

0000000100001f78 <__stub_helper>:
100001f78:     	adrp	x17, 0x100008000 <dyld_stub_binder+0x100008000>
100001f7c:     	add	x17, x17, #0xb8
100001f80:     	stp	x16, x17, [sp, #-0x10]!
100001f84:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
100001f88:     	ldr	x16, [x16]
100001f8c:     	br	x16
100001f90:     	ldr	w16, 0x100001f98 <__stub_helper+0x20>
100001f94:     	b	0x100001f78 <__stub_helper>
100001f98:     	udf	#0x0
100001f9c:     	ldr	w16, 0x100001fa4 <__stub_helper+0x2c>
100001fa0:     	b	0x100001f78 <__stub_helper>
100001fa4:     	udf	#0xd
