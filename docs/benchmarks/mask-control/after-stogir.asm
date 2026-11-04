
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-iterative-control/build/stable-mask-control-properties-comparison/after-stogir:	file format mach-o arm64

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
1000006ac:     	bl	0x100000b30 <_inherent$coil.fmt.Formatter$clear-spec!>
1000006b0:     	movz	w17, #0x0, lsl #16
1000006b4:     	strb	w17, [x19]
1000006b8:     	mov	x0, x24
1000006bc:     	mov	x1, x20
1000006c0:     	bl	0x1000008c8 <_coil.fmt.Display$u64$display-fmt>
1000006c4:     	mov	x8, x21
1000006c8:     	mov	x0, x23
1000006cc:     	mov	x1, x22
1000006d0:     	mov	x2, #0x1                ; =1
1000006d4:     	bl	0x100000950 <_coil.io.print-str>
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
10000074c:     	b	0x1000008a8 <_stogir.benchmarks.opcode-properties.kernel+0x1a0>
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
1000007c4:     	cset	w8, eq
1000007c8:     	uxtb	w10, w10
1000007cc:     	and	x7, x7, #0x8
1000007d0:     	uxtb	w16, w8
1000007d4:     	cmp	w16, wzr
1000007d8:     	cset	x8, eq
1000007dc:     	movz	x17, #0x0, lsl #48
1000007e0:     	cmp	x9, x17
1000007e4:     	cset	w9, eq
1000007e8:     	uxtb	w7, w7
1000007ec:     	movz	x17, #0x0, lsl #48
1000007f0:     	cmp	x8, x17
1000007f4:     	cset	w8, ne
1000007f8:     	uxtb	w16, w9
1000007fc:     	cmp	w16, wzr
100000800:     	cset	x9, eq
100000804:     	movz	x17, #0x0, lsl #48
100000808:     	cmp	x10, x17
10000080c:     	cset	w10, eq
100000810:     	ubfx	x8, x8, #0, #8
100000814:     	movz	x17, #0x0, lsl #48
100000818:     	cmp	x9, x17
10000081c:     	cset	w9, ne
100000820:     	uxtb	w16, w10
100000824:     	cmp	w16, wzr
100000828:     	cset	x10, eq
10000082c:     	movz	x17, #0x0, lsl #48
100000830:     	cmp	x7, x17
100000834:     	cset	w7, eq
100000838:     	uxtb	w16, w9
10000083c:     	cmp	w16, wzr
100000840:     	mov	x16, #0x2               ; =2
100000844:     	movz	x17, #0x0, lsl #48
100000848:     	csel	x9, x16, x17, ne
10000084c:     	movz	x17, #0x0, lsl #48
100000850:     	cmp	x10, x17
100000854:     	cset	w10, ne
100000858:     	uxtb	w16, w7
10000085c:     	cmp	w16, wzr
100000860:     	cset	x7, eq
100000864:     	add	x8, x9, x8
100000868:     	uxtb	w16, w10
10000086c:     	cmp	w16, wzr
100000870:     	mov	x16, #0x4               ; =4
100000874:     	movz	x17, #0x0, lsl #48
100000878:     	csel	x9, x16, x17, ne
10000087c:     	movz	x17, #0x0, lsl #48
100000880:     	cmp	x7, x17
100000884:     	cset	w7, ne
100000888:     	add	x8, x8, x9
10000088c:     	uxtb	w16, w7
100000890:     	cmp	w16, wzr
100000894:     	mov	x16, #0x8               ; =8
100000898:     	movz	x17, #0x0, lsl #48
10000089c:     	csel	x7, x16, x17, ne
1000008a0:     	add	x7, x8, x7
1000008a4:     	eor	x6, x7, x6
1000008a8:     	add	x5, x5, #0x1
1000008ac:     	cmp	x5, x0
1000008b0:     	b.lt	0x100000750 <_stogir.benchmarks.opcode-properties.kernel+0x48>
1000008b4:     	mov	x0, x6
1000008b8:     	ret
		...

00000001000008c8 <_coil.fmt.Display$u64$display-fmt>:
1000008c8:     	sub	sp, sp, #0x10
1000008cc:     	str	x29, [sp]
1000008d0:     	str	x30, [sp, #0x8]
1000008d4:     	mov	x29, sp
1000008d8:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
1000008dc:     	ldr	x16, [x16, #0x20]
1000008e0:     	orr	x2, x16, xzr
1000008e4:     	sub	sp, sp, #0x20
1000008e8:     	mov	x3, sp
1000008ec:     	orr	x4, x3, xzr
1000008f0:     	sub	sp, sp, #0x20
1000008f4:     	mov	x5, sp
1000008f8:     	add	x4, x4, #0x8
1000008fc:     	orr	x6, x5, xzr
100000900:     	movz	w17, #0x0, lsl #16
100000904:     	str	w17, [x3]
100000908:     	str	x0, [x4]
10000090c:     	ldr	x0, [x3]
100000910:     	str	x0, [x5]
100000914:     	ldr	x0, [x3, #0x8]
100000918:     	str	x0, [x5, #0x8]
10000091c:     	ldr	x0, [x3, #0x10]
100000920:     	str	x0, [x5, #0x10]
100000924:     	mov	x0, x1
100000928:     	mov	x4, x6
10000092c:     	movz	x1, #0x0, lsl #48
100000930:     	movz	x3, #0x0, lsl #48
100000934:     	uxtb	w1, w1
100000938:     	bl	0x100000bc0 <_coil.fmt.fmt--number__coil.fmt.IntDigits>
10000093c:     	sub	sp, x29, #0x0
100000940:     	ldr	x29, [sp]
100000944:     	ldr	x30, [sp, #0x8]
100000948:     	add	sp, sp, #0x10
10000094c:     	ret

0000000100000950 <_coil.io.print-str>:
100000950:     	sub	sp, sp, #0x20
100000954:     	str	x29, [sp]
100000958:     	str	x30, [sp, #0x8]
10000095c:     	mov	x29, sp
100000960:     	str	x19, [sp, #0x10]
100000964:     	str	x20, [sp, #0x18]
100000968:     	sub	sp, sp, #0x20
10000096c:     	mov	x19, sp
100000970:     	mov	x20, x8
100000974:     	mov	x8, x19
100000978:     	bl	0x100000f84 <_coil.io.write-all>
10000097c:     	ldr	x0, [x19]
100000980:     	str	x0, [x20]
100000984:     	ldr	x0, [x19, #0x8]
100000988:     	str	x0, [x20, #0x8]
10000098c:     	ldr	x0, [x19, #0x10]
100000990:     	str	x0, [x20, #0x10]
100000994:     	sub	sp, x29, #0x0
100000998:     	ldr	x19, [sp, #0x10]
10000099c:     	ldr	x20, [sp, #0x18]
1000009a0:     	ldr	x29, [sp]
1000009a4:     	ldr	x30, [sp, #0x8]
1000009a8:     	add	sp, sp, #0x20
1000009ac:     	ret

00000001000009b0 <_coil.io.write-fd>:
1000009b0:     	sub	sp, sp, #0x60
1000009b4:     	str	x29, [sp]
1000009b8:     	str	x30, [sp, #0x8]
1000009bc:     	mov	x29, sp
1000009c0:     	str	x19, [sp, #0x10]
1000009c4:     	str	x20, [sp, #0x18]
1000009c8:     	str	x21, [sp, #0x20]
1000009cc:     	str	x22, [sp, #0x28]
1000009d0:     	str	x23, [sp, #0x30]
1000009d4:     	str	x24, [sp, #0x38]
1000009d8:     	str	x25, [sp, #0x40]
1000009dc:     	str	x26, [sp, #0x48]
1000009e0:     	str	x27, [sp, #0x50]
1000009e4:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
1000009e8:     	ldr	x16, [x16, #0x28]
1000009ec:     	orr	x19, x16, xzr
1000009f0:     	sub	sp, sp, #0x20
1000009f4:     	mov	x20, sp
1000009f8:     	lsr	w0, w0, #0
1000009fc:     	sub	sp, sp, #0x20
100000a00:     	mov	x21, sp
100000a04:     	lsr	w22, w0, #0
100000a08:     	sub	sp, sp, #0x10
100000a0c:     	mov	x23, sp
100000a10:     	b	0x100000a24 <_coil.io.write-fd+0x74>
100000a14:     	nop
100000a18:     	mov	x8, x24
100000a1c:     	mov	x1, x25
100000a20:     	mov	x2, x26
100000a24:     	mov	w0, w22
100000a28:     	mov	x24, x8
100000a2c:     	mov	x25, x1
100000a30:     	mov	x26, x2
100000a34:     	bl	0x100001ec4 <dyld_stub_binder+0x100001ec4>
100000a38:     	movz	x17, #0x0, lsl #48
100000a3c:     	cmp	x0, x17
100000a40:     	b.ge	0x100000ac8 <_coil.io.write-fd+0x118>
100000a44:     	mov	x0, x19
100000a48:     	mov	x1, #-0x2               ; =-2
100000a4c:     	bl	0x100001b18 <_coil.os.dlsym-errno-cell>
100000a50:     	ldr	w0, [x0]
100000a54:     	sxtw	x27, w0
100000a58:     	mov	x17, #0x4               ; =4
100000a5c:     	cmp	x27, x17
100000a60:     	b.eq	0x100000a18 <_coil.io.write-fd+0x68>
100000a64:     	mov	x17, #0x23              ; =35
100000a68:     	cmp	x27, x17
100000a6c:     	b.ne	0x100000a90 <_coil.io.write-fd+0xe0>
100000a70:     	mov	w0, w22
100000a74:     	mov	x1, #0x4                ; =4
100000a78:     	mov	x2, #-0x2               ; =-2
100000a7c:     	uxth	w1, w1
100000a80:     	bl	0x10000170c <_coil.io.poll-one>
100000a84:     	movz	x17, #0x0, lsl #48
100000a88:     	cmp	x0, x17
100000a8c:     	b.ne	0x100000a18 <_coil.io.write-fd+0x68>
100000a90:     	orr	x0, x21, xzr
100000a94:     	orr	x1, x23, xzr
100000a98:     	mov	w17, #0x1               ; =1
100000a9c:     	str	w17, [x21]
100000aa0:     	add	x2, x0, #0x8
100000aa4:     	add	x1, x1, #0x8
100000aa8:     	mov	w17, #0x1               ; =1
100000aac:     	str	w17, [x23]
100000ab0:     	str	x27, [x1]
100000ab4:     	ldr	x1, [x23]
100000ab8:     	str	x1, [x2]
100000abc:     	ldr	x1, [x23, #0x8]
100000ac0:     	str	x1, [x2, #0x8]
100000ac4:     	b	0x100000ae0 <_coil.io.write-fd+0x130>
100000ac8:     	orr	x1, x20, xzr
100000acc:     	movz	w17, #0x0, lsl #16
100000ad0:     	str	w17, [x20]
100000ad4:     	add	x2, x1, #0x8
100000ad8:     	str	x0, [x2]
100000adc:     	mov	x0, x1
100000ae0:     	ldr	x1, [x0]
100000ae4:     	str	x1, [x24]
100000ae8:     	ldr	x1, [x0, #0x8]
100000aec:     	str	x1, [x24, #0x8]
100000af0:     	ldr	x0, [x0, #0x10]
100000af4:     	str	x0, [x24, #0x10]
100000af8:     	sub	sp, x29, #0x0
100000afc:     	ldr	x19, [sp, #0x10]
100000b00:     	ldr	x20, [sp, #0x18]
100000b04:     	ldr	x21, [sp, #0x20]
100000b08:     	ldr	x22, [sp, #0x28]
100000b0c:     	ldr	x23, [sp, #0x30]
100000b10:     	ldr	x24, [sp, #0x38]
100000b14:     	ldr	x25, [sp, #0x40]
100000b18:     	ldr	x26, [sp, #0x48]
100000b1c:     	ldr	x27, [sp, #0x50]
100000b20:     	ldr	x29, [sp]
100000b24:     	ldr	x30, [sp, #0x8]
100000b28:     	add	sp, sp, #0x60
100000b2c:     	ret

0000000100000b30 <_inherent$coil.fmt.Formatter$clear-spec!>:
100000b30:     	sub	sp, sp, #0x30
100000b34:     	str	x29, [sp]
100000b38:     	str	x30, [sp, #0x8]
100000b3c:     	mov	x29, sp
100000b40:     	str	x19, [sp, #0x10]
100000b44:     	str	x20, [sp, #0x18]
100000b48:     	str	x21, [sp, #0x20]
100000b4c:     	sub	sp, sp, #0x30
100000b50:     	mov	x19, sp
100000b54:     	add	x20, x0, #0x18
100000b58:     	add	x21, x0, #0x40
100000b5c:     	mov	x8, x19
100000b60:     	bl	0x1000011ec <_coil.fmt.plain-format-spec>
100000b64:     	orr	x0, x20, xzr
100000b68:     	orr	x1, x21, xzr
100000b6c:     	ldr	x2, [x19]
100000b70:     	str	x2, [x0]
100000b74:     	ldr	x2, [x19, #0x8]
100000b78:     	str	x2, [x0, #0x8]
100000b7c:     	ldr	x2, [x19, #0x10]
100000b80:     	str	x2, [x0, #0x10]
100000b84:     	ldr	x2, [x19, #0x18]
100000b88:     	str	x2, [x0, #0x18]
100000b8c:     	ldr	x2, [x19, #0x20]
100000b90:     	str	x2, [x0, #0x20]
100000b94:     	movz	w17, #0x0, lsl #16
100000b98:     	strb	w17, [x1]
100000b9c:     	movz	x0, #0x0, lsl #48
100000ba0:     	sub	sp, x29, #0x0
100000ba4:     	ldr	x19, [sp, #0x10]
100000ba8:     	ldr	x20, [sp, #0x18]
100000bac:     	ldr	x21, [sp, #0x20]
100000bb0:     	ldr	x29, [sp]
100000bb4:     	ldr	x30, [sp, #0x8]
100000bb8:     	add	sp, sp, #0x30
100000bbc:     	ret

0000000100000bc0 <_coil.fmt.fmt--number__coil.fmt.IntDigits>:
100000bc0:     	sub	sp, sp, #0xb0
100000bc4:     	str	x29, [sp]
100000bc8:     	str	x30, [sp, #0x8]
100000bcc:     	mov	x29, sp
100000bd0:     	str	x19, [sp, #0x60]
100000bd4:     	str	x20, [sp, #0x68]
100000bd8:     	str	x21, [sp, #0x70]
100000bdc:     	str	x22, [sp, #0x78]
100000be0:     	str	x23, [sp, #0x80]
100000be4:     	str	x24, [sp, #0x88]
100000be8:     	str	x25, [sp, #0x90]
100000bec:     	str	x26, [sp, #0x98]
100000bf0:     	str	x27, [sp, #0xa0]
100000bf4:     	str	x28, [sp, #0xa8]
100000bf8:     	sub	sp, sp, #0x30
100000bfc:     	mov	x19, sp
100000c00:     	orr	x5, x0, xzr
100000c04:     	ubfx	x20, x1, #0, #8
100000c08:     	orr	x21, x19, xzr
100000c0c:     	sub	sp, sp, #0x30
100000c10:     	mov	x22, sp
100000c14:     	sub	sp, sp, #0x10
100000c18:     	mov	x23, sp
100000c1c:     	sub	sp, sp, #0x10
100000c20:     	mov	x24, sp
100000c24:     	sub	sp, sp, #0x10
100000c28:     	mov	x25, sp
100000c2c:     	sub	sp, sp, #0x10
100000c30:     	mov	x26, sp
100000c34:     	sub	sp, sp, #0x10
100000c38:     	mov	x27, sp
100000c3c:     	sub	sp, sp, #0x20
100000c40:     	mov	x28, sp
100000c44:     	sub	sp, sp, #0x20
100000c48:     	mov	x1, sp
100000c4c:     	sub	sp, sp, #0x20
100000c50:     	mov	x6, sp
100000c54:     	sub	sp, sp, #0x20
100000c58:     	mov	x7, sp
100000c5c:     	sub	sp, sp, #0x20
100000c60:     	mov	x8, sp
100000c64:     	sub	sp, sp, #0x20
100000c68:     	mov	x9, sp
100000c6c:     	sub	sp, sp, #0x20
100000c70:     	mov	x10, sp
100000c74:     	ldr	x5, [x5]
100000c78:     	str	x2, [x29, #0x10]
100000c7c:     	str	x3, [x29, #0x58]
100000c80:     	str	x4, [x29, #0x20]
100000c84:     	str	x1, [x29, #0x28]
100000c88:     	str	x6, [x29, #0x30]
100000c8c:     	str	x7, [x29, #0x38]
100000c90:     	str	x8, [x29, #0x40]
100000c94:     	mov	x8, x22
100000c98:     	str	x9, [x29, #0x48]
100000c9c:     	str	x10, [x29, #0x50]
100000ca0:     	str	x28, [x29, #0x18]
100000ca4:     	mov	x28, x5
100000ca8:     	bl	0x1000012c8 <_inherent$coil.fmt.Formatter$take-spec!>
100000cac:     	ldr	x0, [x22]
100000cb0:     	str	x0, [x19]
100000cb4:     	ldr	x0, [x22, #0x8]
100000cb8:     	str	x0, [x19, #0x8]
100000cbc:     	ldr	x1, [x22, #0x10]
100000cc0:     	str	x1, [x19, #0x10]
100000cc4:     	ldr	x1, [x22, #0x18]
100000cc8:     	str	x1, [x19, #0x18]
100000ccc:     	ldr	x1, [x22, #0x20]
100000cd0:     	str	x1, [x19, #0x20]
100000cd4:     	movz	x17, #0x0, lsl #48
100000cd8:     	cmp	x20, x17
100000cdc:     	b.eq	0x100000efc <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x33c>
100000ce0:     	orr	x1, x23, xzr
100000ce4:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
100000ce8:     	ldr	x16, [x16, #0x30]
100000cec:     	orr	x2, x16, xzr
100000cf0:     	add	x3, x1, #0x8
100000cf4:     	str	x2, [x23]
100000cf8:     	orr	x2, x3, xzr
100000cfc:     	mov	x17, #0x1               ; =1
100000d00:     	str	x17, [x2]
100000d04:     	mov	x20, x1
100000d08:     	b	0x100000d34 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x174>
100000d0c:     	orr	x1, x25, xzr
100000d10:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
100000d14:     	ldr	x16, [x16, #0x38]
100000d18:     	orr	x2, x16, xzr
100000d1c:     	add	x3, x1, #0x8
100000d20:     	str	x2, [x25]
100000d24:     	orr	x2, x3, xzr
100000d28:     	movz	x17, #0x0, lsl #48
100000d2c:     	str	x17, [x2]
100000d30:     	mov	x20, x1
100000d34:     	orr	x22, x28, xzr
100000d38:     	ldr	x1, [x19]
100000d3c:     	movz	x17, #0x0, lsl #48
100000d40:     	cmp	x1, x17
100000d44:     	b.ge	0x100000f70 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x3b0>
100000d48:     	orr	x1, x20, xzr
100000d4c:     	add	x2, x20, #0x8
100000d50:     	ldr	x1, [x1]
100000d54:     	ldr	x2, [x2]
100000d58:     	ldr	x8, [x29, #0x18]
100000d5c:     	mov	x23, x0
100000d60:     	mov	x0, x22
100000d64:     	bl	0x100000950 <_coil.io.print-str>
100000d68:     	ldr	x8, [x29, #0x28]
100000d6c:     	mov	x0, x22
100000d70:     	ldr	x1, [x29, #0x10]
100000d74:     	ldr	x2, [x29, #0x58]
100000d78:     	bl	0x100000950 <_coil.io.print-str>
100000d7c:     	ldr	x0, [x29, #0x20]
100000d80:     	mov	x1, x22
100000d84:     	mov	x2, x23
100000d88:     	bl	0x1000013a4 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits>
100000d8c:     	b	0x100000e08 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x248>
100000d90:     	orr	x19, x20, xzr
100000d94:     	add	x20, x20, #0x8
100000d98:     	mov	x0, x22
100000d9c:     	mov	x1, x21
100000da0:     	mov	x2, x25
100000da4:     	movz	x3, #0x0, lsl #48
100000da8:     	uxtb	w3, w3
100000dac:     	bl	0x100001514 <_coil.fmt.fmt--pad-before>
100000db0:     	orr	x0, x20, xzr
100000db4:     	ldr	x1, [x19]
100000db8:     	ldr	x0, [x0]
100000dbc:     	ldr	x8, [x29, #0x48]
100000dc0:     	mov	x2, x0
100000dc4:     	mov	x0, x22
100000dc8:     	bl	0x100000950 <_coil.io.print-str>
100000dcc:     	ldr	x8, [x29, #0x50]
100000dd0:     	mov	x0, x22
100000dd4:     	ldr	x1, [x29, #0x10]
100000dd8:     	mov	x2, x24
100000ddc:     	bl	0x100000950 <_coil.io.print-str>
100000de0:     	ldr	x0, [x29, #0x20]
100000de4:     	mov	x1, x22
100000de8:     	mov	x2, x23
100000dec:     	bl	0x1000013a4 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits>
100000df0:     	mov	x0, x22
100000df4:     	mov	x1, x21
100000df8:     	mov	x2, x25
100000dfc:     	movz	x3, #0x0, lsl #48
100000e00:     	uxtb	w3, w3
100000e04:     	bl	0x1000015d0 <_coil.fmt.fmt--pad-after>
100000e08:     	sub	sp, x29, #0x0
100000e0c:     	ldr	x19, [sp, #0x60]
100000e10:     	ldr	x20, [sp, #0x68]
100000e14:     	ldr	x21, [sp, #0x70]
100000e18:     	ldr	x22, [sp, #0x78]
100000e1c:     	ldr	x23, [sp, #0x80]
100000e20:     	ldr	x24, [sp, #0x88]
100000e24:     	ldr	x25, [sp, #0x90]
100000e28:     	ldr	x26, [sp, #0x98]
100000e2c:     	ldr	x27, [sp, #0xa0]
100000e30:     	ldr	x28, [sp, #0xa8]
100000e34:     	ldr	x29, [sp]
100000e38:     	ldr	x30, [sp, #0x8]
100000e3c:     	add	sp, sp, #0xb0
100000e40:     	ret
100000e44:     	orr	x0, x26, xzr
100000e48:     	orr	x1, x27, xzr
100000e4c:     	add	x2, x20, #0x8
100000e50:     	add	x3, x21, #0x21
100000e54:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
100000e58:     	ldr	x16, [x16, #0x40]
100000e5c:     	orr	x4, x16, xzr
100000e60:     	movz	x17, #0x0, lsl #48
100000e64:     	str	x17, [x27]
100000e68:     	add	x5, x0, #0x8
100000e6c:     	orr	x24, x2, xzr
100000e70:     	orr	x25, x3, xzr
100000e74:     	str	x4, [x26]
100000e78:     	orr	x2, x5, xzr
100000e7c:     	str	x1, [x2]
100000e80:     	mov	x1, x0
100000e84:     	ldr	x0, [x29, #0x20]
100000e88:     	mov	x2, x23
100000e8c:     	bl	0x1000013a4 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits>
100000e90:     	ldr	x0, [x24]
100000e94:     	ldr	x1, [x27]
100000e98:     	ldrb	w2, [x25]
100000e9c:     	ldr	x24, [x29, #0x58]
100000ea0:     	add	x1, x1, x24
100000ea4:     	add	x25, x1, x0
100000ea8:     	movz	x17, #0x0, lsl #48
100000eac:     	cmp	x2, x17
100000eb0:     	b.eq	0x100000d90 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x1d0>
100000eb4:     	orr	x0, x20, xzr
100000eb8:     	add	x1, x20, #0x8
100000ebc:     	ldr	x0, [x0]
100000ec0:     	ldr	x1, [x1]
100000ec4:     	ldr	x8, [x29, #0x30]
100000ec8:     	mov	x2, x1
100000ecc:     	mov	x1, x0
100000ed0:     	mov	x0, x22
100000ed4:     	bl	0x100000950 <_coil.io.print-str>
100000ed8:     	ldr	x8, [x29, #0x38]
100000edc:     	mov	x0, x22
100000ee0:     	ldr	x1, [x29, #0x10]
100000ee4:     	mov	x2, x24
100000ee8:     	bl	0x100000950 <_coil.io.print-str>
100000eec:     	ldr	x0, [x19]
100000ef0:     	sub	x19, x0, x25
100000ef4:     	movn	x0, #0x0, lsl #48
100000ef8:     	b	0x100000f50 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x390>
100000efc:     	add	x1, x21, #0x20
100000f00:     	ldrb	w1, [x1]
100000f04:     	movz	x17, #0x0, lsl #48
100000f08:     	cmp	x1, x17
100000f0c:     	b.eq	0x100000d0c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x14c>
100000f10:     	orr	x1, x24, xzr
100000f14:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
100000f18:     	ldr	x16, [x16, #0x48]
100000f1c:     	orr	x2, x16, xzr
100000f20:     	add	x3, x1, #0x8
100000f24:     	str	x2, [x24]
100000f28:     	orr	x2, x3, xzr
100000f2c:     	mov	x17, #0x1               ; =1
100000f30:     	str	x17, [x2]
100000f34:     	b	0x100000d30 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x170>
100000f38:     	ldr	x8, [x29, #0x40]
100000f3c:     	mov	x0, x22
100000f40:     	mov	x1, #0x30               ; =48
100000f44:     	uxtb	w1, w1
100000f48:     	bl	0x10000149c <_coil.io.write-byte>
100000f4c:     	mov	x0, x20
100000f50:     	add	x20, x0, #0x1
100000f54:     	cmp	x20, x19
100000f58:     	b.lt	0x100000f38 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x378>
100000f5c:     	ldr	x0, [x29, #0x20]
100000f60:     	mov	x1, x22
100000f64:     	mov	x2, x23
100000f68:     	bl	0x1000013a4 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits>
100000f6c:     	b	0x100000e08 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x248>
100000f70:     	mov	x23, x0
100000f74:     	b	0x100000e44 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x284>
		...

0000000100000f84 <_coil.io.write-all>:
100000f84:     	sub	sp, sp, #0x70
100000f88:     	str	x29, [sp]
100000f8c:     	str	x30, [sp, #0x8]
100000f90:     	mov	x29, sp
100000f94:     	str	x19, [sp, #0x20]
100000f98:     	str	x20, [sp, #0x28]
100000f9c:     	str	x21, [sp, #0x30]
100000fa0:     	str	x22, [sp, #0x38]
100000fa4:     	str	x23, [sp, #0x40]
100000fa8:     	str	x24, [sp, #0x48]
100000fac:     	str	x25, [sp, #0x50]
100000fb0:     	str	x26, [sp, #0x58]
100000fb4:     	str	x27, [sp, #0x60]
100000fb8:     	str	x28, [sp, #0x68]
100000fbc:     	sub	sp, sp, #0x20
100000fc0:     	mov	x3, sp
100000fc4:     	sub	sp, sp, #0x20
100000fc8:     	mov	x19, sp
100000fcc:     	sub	sp, sp, #0x20
100000fd0:     	mov	x20, sp
100000fd4:     	sub	sp, sp, #0x20
100000fd8:     	mov	x21, sp
100000fdc:     	sub	sp, sp, #0x10
100000fe0:     	mov	x22, sp
100000fe4:     	sub	sp, sp, #0x20
100000fe8:     	mov	x23, sp
100000fec:     	sub	sp, sp, #0x20
100000ff0:     	mov	x24, sp
100000ff4:     	sub	sp, sp, #0x20
100000ff8:     	mov	x25, sp
100000ffc:     	movz	x17, #0x0, lsl #48
100001000:     	cmp	x2, x17
100001004:     	b.gt	0x10000107c <_coil.io.write-all+0xf8>
100001008:     	orr	x0, x3, xzr
10000100c:     	movz	w17, #0x0, lsl #16
100001010:     	str	w17, [x3]
100001014:     	add	x1, x0, #0x8
100001018:     	movz	x17, #0x0, lsl #48
10000101c:     	str	x17, [x1]
100001020:     	str	x8, [x29, #0x18]
100001024:     	ldr	x1, [x0]
100001028:     	ldr	x2, [x29, #0x18]
10000102c:     	str	x1, [x2]
100001030:     	ldr	x1, [x0, #0x8]
100001034:     	str	x1, [x2, #0x8]
100001038:     	ldr	x0, [x0, #0x10]
10000103c:     	str	x0, [x2, #0x10]
100001040:     	sub	sp, x29, #0x0
100001044:     	ldr	x19, [sp, #0x20]
100001048:     	ldr	x20, [sp, #0x28]
10000104c:     	ldr	x21, [sp, #0x30]
100001050:     	ldr	x22, [sp, #0x38]
100001054:     	ldr	x23, [sp, #0x40]
100001058:     	ldr	x24, [sp, #0x48]
10000105c:     	ldr	x25, [sp, #0x50]
100001060:     	ldr	x26, [sp, #0x58]
100001064:     	ldr	x27, [sp, #0x60]
100001068:     	ldr	x28, [sp, #0x68]
10000106c:     	ldr	x29, [sp]
100001070:     	ldr	x30, [sp, #0x8]
100001074:     	add	sp, sp, #0x70
100001078:     	ret
10000107c:     	orr	x26, x19, xzr
100001080:     	str	x8, [x29, #0x18]
100001084:     	mov	x8, x19
100001088:     	str	x0, [x29, #0x10]
10000108c:     	mov	x28, x1
100001090:     	mov	x27, x2
100001094:     	bl	0x100001694 <_coil.io.write-some>
100001098:     	ldr	w0, [x19]
10000109c:     	lsr	x16, x0, #0
1000010a0:     	cmp	x16, #0x1
1000010a4:     	b.eq	0x1000010c0 <_coil.io.write-all+0x13c>
1000010a8:     	b.lo	0x1000010b0 <_coil.io.write-all+0x12c>
1000010ac:     	b	0x1000010c4 <_coil.io.write-all+0x140>
1000010b0:     	cmp	x16, #0x0
1000010b4:     	b.eq	0x1000010bc <_coil.io.write-all+0x138>
1000010b8:     	b	0x1000010c4 <_coil.io.write-all+0x140>
1000010bc:     	b	0x1000010f0 <_coil.io.write-all+0x16c>
1000010c0:     	b	0x1000010c8 <_coil.io.write-all+0x144>
1000010c4:     	b	0x1000011d4 <_coil.io.write-all+0x250>
1000010c8:     	orr	x0, x20, xzr
1000010cc:     	add	x1, x26, #0x8
1000010d0:     	add	x2, x0, #0x8
1000010d4:     	ldr	x3, [x1]
1000010d8:     	ldr	x1, [x1, #0x8]
1000010dc:     	mov	w17, #0x1               ; =1
1000010e0:     	str	w17, [x20]
1000010e4:     	str	x3, [x2]
1000010e8:     	str	x1, [x2, #0x8]
1000010ec:     	b	0x100001024 <_coil.io.write-all+0xa0>
1000010f0:     	add	x0, x26, #0x8
1000010f4:     	ldr	x0, [x0]
1000010f8:     	orr	x19, x0, xzr
1000010fc:     	movz	x17, #0x0, lsl #48
100001100:     	cmp	x19, x17
100001104:     	b.gt	0x100001134 <_coil.io.write-all+0x1b0>
100001108:     	orr	x0, x21, xzr
10000110c:     	mov	w17, #0x1               ; =1
100001110:     	str	w17, [x21]
100001114:     	add	x1, x0, #0x8
100001118:     	mov	w17, #0x5               ; =5
10000111c:     	str	w17, [x22]
100001120:     	ldr	x2, [x22]
100001124:     	str	x2, [x1]
100001128:     	ldr	x2, [x22, #0x8]
10000112c:     	str	x2, [x1, #0x8]
100001130:     	b	0x1000010ec <_coil.io.write-all+0x168>
100001134:     	orr	x20, x23, xzr
100001138:     	lsr	x0, x19, #0
10000113c:     	sub	x1, x27, x19
100001140:     	add	x0, x0, x28
100001144:     	mov	x8, x23
100001148:     	mov	x2, x1
10000114c:     	mov	x1, x0
100001150:     	ldr	x0, [x29, #0x10]
100001154:     	bl	0x100000f84 <_coil.io.write-all>
100001158:     	ldr	w0, [x23]
10000115c:     	lsr	x16, x0, #0
100001160:     	cmp	x16, #0x1
100001164:     	b.eq	0x100001180 <_coil.io.write-all+0x1fc>
100001168:     	b.lo	0x100001170 <_coil.io.write-all+0x1ec>
10000116c:     	b	0x100001184 <_coil.io.write-all+0x200>
100001170:     	cmp	x16, #0x0
100001174:     	b.eq	0x10000117c <_coil.io.write-all+0x1f8>
100001178:     	b	0x100001184 <_coil.io.write-all+0x200>
10000117c:     	b	0x1000011b0 <_coil.io.write-all+0x22c>
100001180:     	b	0x100001188 <_coil.io.write-all+0x204>
100001184:     	b	0x1000011dc <_coil.io.write-all+0x258>
100001188:     	orr	x0, x24, xzr
10000118c:     	add	x1, x20, #0x8
100001190:     	add	x2, x0, #0x8
100001194:     	ldr	x3, [x1]
100001198:     	ldr	x1, [x1, #0x8]
10000119c:     	mov	w17, #0x1               ; =1
1000011a0:     	str	w17, [x24]
1000011a4:     	str	x3, [x2]
1000011a8:     	str	x1, [x2, #0x8]
1000011ac:     	b	0x1000011d0 <_coil.io.write-all+0x24c>
1000011b0:     	orr	x0, x25, xzr
1000011b4:     	add	x1, x20, #0x8
1000011b8:     	add	x2, x0, #0x8
1000011bc:     	ldr	x1, [x1]
1000011c0:     	movz	w17, #0x0, lsl #16
1000011c4:     	str	w17, [x25]
1000011c8:     	add	x1, x1, x19
1000011cc:     	str	x1, [x2]
1000011d0:     	b	0x100001130 <_coil.io.write-all+0x1ac>
1000011d4:     	brk	#0
1000011d8:     	b	0x1000011d4 <_coil.io.write-all+0x250>
1000011dc:     	brk	#0
1000011e0:     	b	0x1000011dc <_coil.io.write-all+0x258>
		...

00000001000011ec <_coil.fmt.plain-format-spec>:
1000011ec:     	sub	sp, sp, #0x10
1000011f0:     	str	x29, [sp]
1000011f4:     	str	x30, [sp, #0x8]
1000011f8:     	mov	x29, sp
1000011fc:     	sub	sp, sp, #0x30
100001200:     	mov	x0, sp
100001204:     	orr	x1, x0, xzr
100001208:     	sub	sp, sp, #0x10
10000120c:     	mov	x2, sp
100001210:     	add	x3, x1, #0x8
100001214:     	add	x4, x1, #0x10
100001218:     	add	x5, x1, #0x18
10000121c:     	add	x6, x1, #0x20
100001220:     	add	x1, x1, #0x21
100001224:     	movz	x17, #0x0, lsl #48
100001228:     	str	x17, [x0]
10000122c:     	movz	x17, #0x0, lsl #48
100001230:     	str	x17, [x0, #0x8]
100001234:     	movz	x17, #0x0, lsl #48
100001238:     	str	x17, [x0, #0x10]
10000123c:     	movz	x17, #0x0, lsl #48
100001240:     	str	x17, [x0, #0x18]
100001244:     	movz	x17, #0x0, lsl #48
100001248:     	str	x17, [x0, #0x20]
10000124c:     	movn	x17, #0x0, lsl #48
100001250:     	str	x17, [x0]
100001254:     	movn	x17, #0x0, lsl #48
100001258:     	str	x17, [x3]
10000125c:     	mov	w17, #0x20              ; =32
100001260:     	str	w17, [x4]
100001264:     	movz	w17, #0x0, lsl #16
100001268:     	str	w17, [x2]
10000126c:     	ldr	x2, [x2]
100001270:     	str	x2, [x5]
100001274:     	movz	w17, #0x0, lsl #16
100001278:     	strb	w17, [x6]
10000127c:     	movz	w17, #0x0, lsl #16
100001280:     	strb	w17, [x1]
100001284:     	ldr	x1, [x0]
100001288:     	ldr	x2, [x0, #0x8]
10000128c:     	ldr	x3, [x0, #0x10]
100001290:     	ldr	x4, [x0, #0x18]
100001294:     	ldr	x0, [x0, #0x20]
100001298:     	str	x1, [x8]
10000129c:     	str	x2, [x8, #0x8]
1000012a0:     	str	x3, [x8, #0x10]
1000012a4:     	str	x4, [x8, #0x18]
1000012a8:     	str	x0, [x8, #0x20]
1000012ac:     	sub	sp, x29, #0x0
1000012b0:     	ldr	x29, [sp]
1000012b4:     	ldr	x30, [sp, #0x8]
1000012b8:     	add	sp, sp, #0x10
1000012bc:     	ret
		...

00000001000012c8 <_inherent$coil.fmt.Formatter$take-spec!>:
1000012c8:     	sub	sp, sp, #0x20
1000012cc:     	str	x29, [sp]
1000012d0:     	str	x30, [sp, #0x8]
1000012d4:     	mov	x29, sp
1000012d8:     	str	x19, [sp, #0x10]
1000012dc:     	str	x20, [sp, #0x18]
1000012e0:     	sub	sp, sp, #0x30
1000012e4:     	mov	x1, sp
1000012e8:     	add	x2, x0, #0x40
1000012ec:     	sub	sp, sp, #0x30
1000012f0:     	mov	x3, sp
1000012f4:     	ldrb	w2, [x2]
1000012f8:     	movz	x17, #0x0, lsl #48
1000012fc:     	cmp	x2, x17
100001300:     	b.eq	0x10000134c <_inherent$coil.fmt.Formatter$take-spec!+0x84>
100001304:     	orr	x2, x1, xzr
100001308:     	add	x3, x0, #0x40
10000130c:     	add	x0, x0, #0x18
100001310:     	movz	w17, #0x0, lsl #16
100001314:     	strb	w17, [x3]
100001318:     	ldr	x3, [x0]
10000131c:     	str	x3, [x1]
100001320:     	ldr	x3, [x0, #0x8]
100001324:     	str	x3, [x1, #0x8]
100001328:     	ldr	x3, [x0, #0x10]
10000132c:     	str	x3, [x1, #0x10]
100001330:     	ldr	x3, [x0, #0x18]
100001334:     	str	x3, [x1, #0x18]
100001338:     	ldr	x0, [x0, #0x20]
10000133c:     	str	x0, [x1, #0x20]
100001340:     	mov	x20, x8
100001344:     	mov	x0, x2
100001348:     	b	0x100001360 <_inherent$coil.fmt.Formatter$take-spec!+0x98>
10000134c:     	orr	x19, x3, xzr
100001350:     	mov	x20, x8
100001354:     	mov	x8, x3
100001358:     	bl	0x1000011ec <_coil.fmt.plain-format-spec>
10000135c:     	mov	x0, x19
100001360:     	ldr	x1, [x0]
100001364:     	str	x1, [x20]
100001368:     	ldr	x1, [x0, #0x8]
10000136c:     	str	x1, [x20, #0x8]
100001370:     	ldr	x1, [x0, #0x10]
100001374:     	str	x1, [x20, #0x10]
100001378:     	ldr	x1, [x0, #0x18]
10000137c:     	str	x1, [x20, #0x18]
100001380:     	ldr	x0, [x0, #0x20]
100001384:     	str	x0, [x20, #0x20]
100001388:     	sub	sp, x29, #0x0
10000138c:     	ldr	x19, [sp, #0x10]
100001390:     	ldr	x20, [sp, #0x18]
100001394:     	ldr	x29, [sp]
100001398:     	ldr	x30, [sp, #0x8]
10000139c:     	add	sp, sp, #0x20
1000013a0:     	ret

00000001000013a4 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits>:
1000013a4:     	sub	sp, sp, #0x10
1000013a8:     	str	x29, [sp]
1000013ac:     	str	x30, [sp, #0x8]
1000013b0:     	mov	x29, sp
1000013b4:     	sub	sp, sp, #0x20
1000013b8:     	mov	x2, sp
1000013bc:     	orr	x3, x0, xzr
1000013c0:     	sub	sp, sp, #0x20
1000013c4:     	mov	x4, sp
1000013c8:     	sub	sp, sp, #0x20
1000013cc:     	mov	x5, sp
1000013d0:     	ldr	w3, [x3]
1000013d4:     	lsr	x16, x3, #0
1000013d8:     	cmp	x16, #0x2
1000013dc:     	b.hi	0x100001408 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x64>
1000013e0:     	adr	x17, 0x1000013f0 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x4c>
1000013e4:     	ldrsw	x16, [x17, x16, lsl #2]
1000013e8:     	add	x16, x17, x16
1000013ec:     	br	x16
1000013f0:     	udf	#0xc
1000013f4:     	udf	#0x10
1000013f8:     	udf	#0x14
1000013fc:     	b	0x10000140c <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x68>
100001400:     	b	0x10000142c <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x88>
100001404:     	b	0x10000144c <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xa8>
100001408:     	b	0x100001488 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xe4>
10000140c:     	add	x0, x0, #0x8
100001410:     	ldr	x0, [x0]
100001414:     	mov	x8, x2
100001418:     	fmov	d31, x0
10000141c:     	mov	x0, x1
100001420:     	fmov	x1, d31
100001424:     	bl	0x100001868 <_coil.fmt.print-u>
100001428:     	b	0x100001470 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xcc>
10000142c:     	add	x0, x0, #0x8
100001430:     	ldr	x0, [x0]
100001434:     	mov	x8, x4
100001438:     	fmov	d31, x0
10000143c:     	mov	x0, x1
100001440:     	fmov	x1, d31
100001444:     	bl	0x100001908 <_coil.fmt.print-uhex>
100001448:     	b	0x100001470 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xcc>
10000144c:     	add	x0, x0, #0x8
100001450:     	ldr	x2, [x0]
100001454:     	ldr	x0, [x0, #0x8]
100001458:     	mov	x8, x5
10000145c:     	fmov	d31, x0
100001460:     	mov	x0, x1
100001464:     	mov	x1, x2
100001468:     	fmov	x2, d31
10000146c:     	bl	0x100000950 <_coil.io.print-str>
100001470:     	movz	x0, #0x0, lsl #48
100001474:     	sub	sp, x29, #0x0
100001478:     	ldr	x29, [sp]
10000147c:     	ldr	x30, [sp, #0x8]
100001480:     	add	sp, sp, #0x10
100001484:     	ret
100001488:     	brk	#0
10000148c:     	b	0x100001488 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xe4>
		...

000000010000149c <_coil.io.write-byte>:
10000149c:     	sub	sp, sp, #0x20
1000014a0:     	str	x29, [sp]
1000014a4:     	str	x30, [sp, #0x8]
1000014a8:     	mov	x29, sp
1000014ac:     	str	x19, [sp, #0x10]
1000014b0:     	str	x20, [sp, #0x18]
1000014b4:     	sub	sp, sp, #0x10
1000014b8:     	mov	x2, sp
1000014bc:     	orr	x3, x2, xzr
1000014c0:     	sub	sp, sp, #0x20
1000014c4:     	mov	x19, sp
1000014c8:     	strb	w1, [x2]
1000014cc:     	mov	x1, x3
1000014d0:     	mov	x20, x8
1000014d4:     	mov	x8, x19
1000014d8:     	mov	x2, #0x1                ; =1
1000014dc:     	bl	0x100000f84 <_coil.io.write-all>
1000014e0:     	ldr	x0, [x19]
1000014e4:     	str	x0, [x20]
1000014e8:     	ldr	x0, [x19, #0x8]
1000014ec:     	str	x0, [x20, #0x8]
1000014f0:     	ldr	x0, [x19, #0x10]
1000014f4:     	str	x0, [x20, #0x10]
1000014f8:     	sub	sp, x29, #0x0
1000014fc:     	ldr	x19, [sp, #0x10]
100001500:     	ldr	x20, [sp, #0x18]
100001504:     	ldr	x29, [sp]
100001508:     	ldr	x30, [sp, #0x8]
10000150c:     	add	sp, sp, #0x20
100001510:     	ret

0000000100001514 <_coil.fmt.fmt--pad-before>:
100001514:     	sub	sp, sp, #0x10
100001518:     	str	x29, [sp]
10000151c:     	str	x30, [sp, #0x8]
100001520:     	mov	x29, sp
100001524:     	orr	x4, x1, xzr
100001528:     	ldr	x4, [x4]
10000152c:     	sub	x2, x4, x2
100001530:     	movz	x17, #0x0, lsl #48
100001534:     	cmp	x2, x17
100001538:     	b.le	0x10000159c <_coil.fmt.fmt--pad-before+0x88>
10000153c:     	add	x4, x1, #0x18
100001540:     	ldr	x4, [x4]
100001544:     	lsr	w4, w4, #0
100001548:     	lsr	x16, x4, #0
10000154c:     	cmp	x16, #0x3
100001550:     	b.hi	0x100001584 <_coil.fmt.fmt--pad-before+0x70>
100001554:     	adr	x17, 0x100001564 <_coil.fmt.fmt--pad-before+0x50>
100001558:     	ldrsw	x16, [x17, x16, lsl #2]
10000155c:     	add	x16, x17, x16
100001560:     	br	x16
100001564:     	udf	#0x10
100001568:     	udf	#0x14
10000156c:     	udf	#0x18
100001570:     	udf	#0x1c
100001574:     	b	0x1000015b0 <_coil.fmt.fmt--pad-before+0x9c>
100001578:     	b	0x10000159c <_coil.fmt.fmt--pad-before+0x88>
10000157c:     	b	0x100001588 <_coil.fmt.fmt--pad-before+0x74>
100001580:     	b	0x100001590 <_coil.fmt.fmt--pad-before+0x7c>
100001584:     	b	0x1000015c8 <_coil.fmt.fmt--pad-before+0xb4>
100001588:     	bl	0x100001a10 <_coil.fmt.fmt--fill>
10000158c:     	b	0x10000159c <_coil.fmt.fmt--pad-before+0x88>
100001590:     	mov	x17, #0x2               ; =2
100001594:     	sdiv	x2, x2, x17
100001598:     	bl	0x100001a10 <_coil.fmt.fmt--fill>
10000159c:     	movz	x0, #0x0, lsl #48
1000015a0:     	ldr	x29, [sp]
1000015a4:     	ldr	x30, [sp, #0x8]
1000015a8:     	add	sp, sp, #0x10
1000015ac:     	ret
1000015b0:     	ubfx	x3, x3, #0, #8
1000015b4:     	movz	x17, #0x0, lsl #48
1000015b8:     	cmp	x3, x17
1000015bc:     	b.ne	0x10000159c <_coil.fmt.fmt--pad-before+0x88>
1000015c0:     	bl	0x100001a10 <_coil.fmt.fmt--fill>
1000015c4:     	b	0x10000159c <_coil.fmt.fmt--pad-before+0x88>
1000015c8:     	brk	#0
1000015cc:     	b	0x1000015c8 <_coil.fmt.fmt--pad-before+0xb4>

00000001000015d0 <_coil.fmt.fmt--pad-after>:
1000015d0:     	sub	sp, sp, #0x10
1000015d4:     	str	x29, [sp]
1000015d8:     	str	x30, [sp, #0x8]
1000015dc:     	mov	x29, sp
1000015e0:     	orr	x4, x1, xzr
1000015e4:     	ldr	x4, [x4]
1000015e8:     	sub	x2, x4, x2
1000015ec:     	movz	x17, #0x0, lsl #48
1000015f0:     	cmp	x2, x17
1000015f4:     	b.le	0x100001660 <_coil.fmt.fmt--pad-after+0x90>
1000015f8:     	add	x4, x1, #0x18
1000015fc:     	ldr	x4, [x4]
100001600:     	lsr	w4, w4, #0
100001604:     	lsr	x16, x4, #0
100001608:     	cmp	x16, #0x3
10000160c:     	b.hi	0x100001640 <_coil.fmt.fmt--pad-after+0x70>
100001610:     	adr	x17, 0x100001620 <_coil.fmt.fmt--pad-after+0x50>
100001614:     	ldrsw	x16, [x17, x16, lsl #2]
100001618:     	add	x16, x17, x16
10000161c:     	br	x16
100001620:     	udf	#0x10
100001624:     	udf	#0x14
100001628:     	udf	#0x18
10000162c:     	udf	#0x1c
100001630:     	b	0x100001674 <_coil.fmt.fmt--pad-after+0xa4>
100001634:     	b	0x100001644 <_coil.fmt.fmt--pad-after+0x74>
100001638:     	b	0x100001660 <_coil.fmt.fmt--pad-after+0x90>
10000163c:     	b	0x10000164c <_coil.fmt.fmt--pad-after+0x7c>
100001640:     	b	0x10000168c <_coil.fmt.fmt--pad-after+0xbc>
100001644:     	bl	0x100001a10 <_coil.fmt.fmt--fill>
100001648:     	b	0x100001660 <_coil.fmt.fmt--pad-after+0x90>
10000164c:     	orr	x3, x2, xzr
100001650:     	mov	x17, #0x2               ; =2
100001654:     	sdiv	x3, x3, x17
100001658:     	sub	x2, x2, x3
10000165c:     	bl	0x100001a10 <_coil.fmt.fmt--fill>
100001660:     	movz	x0, #0x0, lsl #48
100001664:     	ldr	x29, [sp]
100001668:     	ldr	x30, [sp, #0x8]
10000166c:     	add	sp, sp, #0x10
100001670:     	ret
100001674:     	ubfx	x3, x3, #0, #8
100001678:     	movz	x17, #0x0, lsl #48
10000167c:     	cmp	x3, x17
100001680:     	b.eq	0x100001660 <_coil.fmt.fmt--pad-after+0x90>
100001684:     	bl	0x100001a10 <_coil.fmt.fmt--fill>
100001688:     	b	0x100001660 <_coil.fmt.fmt--pad-after+0x90>
10000168c:     	brk	#0
100001690:     	b	0x10000168c <_coil.fmt.fmt--pad-after+0xbc>

0000000100001694 <_coil.io.write-some>:
100001694:     	sub	sp, sp, #0x20
100001698:     	str	x29, [sp]
10000169c:     	str	x30, [sp, #0x8]
1000016a0:     	mov	x29, sp
1000016a4:     	str	x19, [sp, #0x10]
1000016a8:     	str	x20, [sp, #0x18]
1000016ac:     	sub	sp, sp, #0x20
1000016b0:     	mov	x19, sp
1000016b4:     	orr	x3, x0, xzr
1000016b8:     	add	x0, x0, #0x8
1000016bc:     	ldr	x3, [x3]
1000016c0:     	ldr	x0, [x0]
1000016c4:     	mov	x30, x3
1000016c8:     	mov	x20, x8
1000016cc:     	mov	x8, x19
1000016d0:     	blr	x30
1000016d4:     	ldr	x0, [x19]
1000016d8:     	str	x0, [x20]
1000016dc:     	ldr	x0, [x19, #0x8]
1000016e0:     	str	x0, [x20, #0x8]
1000016e4:     	ldr	x0, [x19, #0x10]
1000016e8:     	str	x0, [x20, #0x10]
1000016ec:     	sub	sp, x29, #0x0
1000016f0:     	ldr	x19, [sp, #0x10]
1000016f4:     	ldr	x20, [sp, #0x18]
1000016f8:     	ldr	x29, [sp]
1000016fc:     	ldr	x30, [sp, #0x8]
100001700:     	add	sp, sp, #0x20
100001704:     	ret
100001708:     	udf	#0x0

000000010000170c <_coil.io.poll-one>:
10000170c:     	sub	sp, sp, #0x40
100001710:     	str	x29, [sp]
100001714:     	str	x30, [sp, #0x8]
100001718:     	mov	x29, sp
10000171c:     	str	x19, [sp, #0x10]
100001720:     	str	x20, [sp, #0x18]
100001724:     	str	x21, [sp, #0x20]
100001728:     	str	x22, [sp, #0x28]
10000172c:     	str	x23, [sp, #0x30]
100001730:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
100001734:     	ldr	x16, [x16, #0x50]
100001738:     	orr	x19, x16, xzr
10000173c:     	sub	sp, sp, #0x10
100001740:     	mov	x20, sp
100001744:     	mov	w21, w0
100001748:     	mov	x0, x19
10000174c:     	mov	w22, w1
100001750:     	mov	x23, x2
100001754:     	bl	0x100001e98 <_coil.atomic.read-ptr__i8>
100001758:     	movz	x17, #0x0, lsl #48
10000175c:     	cmp	x0, x17
100001760:     	b.ne	0x100001794 <_coil.io.poll-one+0x88>
100001764:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
100001768:     	ldr	x16, [x16, #0x58]
10000176c:     	orr	x0, x16, xzr
100001770:     	mov	x1, x0
100001774:     	mov	x0, x23
100001778:     	bl	0x100001eb8 <dyld_stub_binder+0x100001eb8>
10000177c:     	mov	x1, x0
100001780:     	fmov	d31, x0
100001784:     	mov	x0, x19
100001788:     	fmov	x19, d31
10000178c:     	bl	0x100001ea4 <_coil.atomic.store-ptr__i8>
100001790:     	mov	x0, x19
100001794:     	orr	x1, x20, xzr
100001798:     	lsr	w2, w21, #0
10000179c:     	uxth	w3, w22
1000017a0:     	add	x4, x1, #0x4
1000017a4:     	add	x5, x1, #0x6
1000017a8:     	str	w2, [x20]
1000017ac:     	orr	x2, x4, xzr
1000017b0:     	orr	x4, x5, xzr
1000017b4:     	strh	w3, [x2]
1000017b8:     	movz	w17, #0x0, lsl #16
1000017bc:     	strh	w17, [x4]
1000017c0:     	movz	x17, #0x0, lsl #48
1000017c4:     	cmp	x0, x17
1000017c8:     	b.ne	0x100001828 <_coil.io.poll-one+0x11c>
1000017cc:     	movz	x0, #0x0, lsl #48
1000017d0:     	b	0x100001800 <_coil.io.poll-one+0xf4>
1000017d4:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
1000017d8:     	ldr	x16, [x16, #0x60]
1000017dc:     	orr	x0, x16, xzr
1000017e0:     	mov	x1, #-0x2               ; =-2
1000017e4:     	bl	0x100001b18 <_coil.os.dlsym-errno-cell>
1000017e8:     	ldr	w0, [x0]
1000017ec:     	sxtw	x0, w0
1000017f0:     	mov	x17, #0x4               ; =4
1000017f4:     	cmp	x0, x17
1000017f8:     	cset	w0, eq
1000017fc:     	ubfx	x0, x0, #0, #8
100001800:     	sub	sp, x29, #0x0
100001804:     	ldr	x19, [sp, #0x10]
100001808:     	ldr	x20, [sp, #0x18]
10000180c:     	ldr	x21, [sp, #0x20]
100001810:     	ldr	x22, [sp, #0x28]
100001814:     	ldr	x23, [sp, #0x30]
100001818:     	ldr	x29, [sp]
10000181c:     	ldr	x30, [sp, #0x8]
100001820:     	add	sp, sp, #0x40
100001824:     	ret
100001828:     	mov	x30, x0
10000182c:     	mov	x0, x1
100001830:     	mov	x1, #0x1                ; =1
100001834:     	mov	x2, #0xffff             ; =65535
100001838:     	movk	x2, #0xffff, lsl #16
10000183c:     	blr	x30
100001840:     	lsr	w0, w0, #0
100001844:     	sxtw	x0, w0
100001848:     	movz	x17, #0x0, lsl #48
10000184c:     	cmp	x0, x17
100001850:     	b.lt	0x1000017d4 <_coil.io.poll-one+0xc8>
100001854:     	mov	x0, #0x1                ; =1
100001858:     	b	0x100001800 <_coil.io.poll-one+0xf4>
		...

0000000100001868 <_coil.fmt.print-u>:
100001868:     	sub	sp, sp, #0x20
10000186c:     	str	x29, [sp]
100001870:     	str	x30, [sp, #0x8]
100001874:     	mov	x29, sp
100001878:     	str	x19, [sp, #0x10]
10000187c:     	str	x20, [sp, #0x18]
100001880:     	sub	sp, sp, #0x20
100001884:     	mov	x2, sp
100001888:     	sub	sp, sp, #0x20
10000188c:     	mov	x3, sp
100001890:     	movz	x17, #0x0, lsl #48
100001894:     	cmp	x1, x17
100001898:     	b.ne	0x100001900 <_coil.fmt.print-u+0x98>
10000189c:     	orr	x19, x2, xzr
1000018a0:     	mov	x20, x8
1000018a4:     	mov	x8, x2
1000018a8:     	mov	x1, #0x30               ; =48
1000018ac:     	uxtb	w1, w1
1000018b0:     	bl	0x10000149c <_coil.io.write-byte>
1000018b4:     	mov	x0, x19
1000018b8:     	b	0x1000018cc <_coil.fmt.print-u+0x64>
1000018bc:     	orr	x19, x3, xzr
1000018c0:     	mov	x8, x3
1000018c4:     	bl	0x100001ba4 <_coil.fmt.udec-digits>
1000018c8:     	mov	x0, x19
1000018cc:     	ldr	x1, [x0]
1000018d0:     	str	x1, [x20]
1000018d4:     	ldr	x1, [x0, #0x8]
1000018d8:     	str	x1, [x20, #0x8]
1000018dc:     	ldr	x0, [x0, #0x10]
1000018e0:     	str	x0, [x20, #0x10]
1000018e4:     	sub	sp, x29, #0x0
1000018e8:     	ldr	x19, [sp, #0x10]
1000018ec:     	ldr	x20, [sp, #0x18]
1000018f0:     	ldr	x29, [sp]
1000018f4:     	ldr	x30, [sp, #0x8]
1000018f8:     	add	sp, sp, #0x20
1000018fc:     	ret
100001900:     	mov	x20, x8
100001904:     	b	0x1000018bc <_coil.fmt.print-u+0x54>

0000000100001908 <_coil.fmt.print-uhex>:
100001908:     	sub	sp, sp, #0x20
10000190c:     	str	x29, [sp]
100001910:     	str	x30, [sp, #0x8]
100001914:     	mov	x29, sp
100001918:     	str	x19, [sp, #0x10]
10000191c:     	str	x20, [sp, #0x18]
100001920:     	sub	sp, sp, #0x20
100001924:     	mov	x2, sp
100001928:     	sub	sp, sp, #0x20
10000192c:     	mov	x3, sp
100001930:     	movz	x17, #0x0, lsl #48
100001934:     	cmp	x1, x17
100001938:     	b.ne	0x1000019a0 <_coil.fmt.print-uhex+0x98>
10000193c:     	orr	x19, x2, xzr
100001940:     	mov	x20, x8
100001944:     	mov	x8, x2
100001948:     	mov	x1, #0x30               ; =48
10000194c:     	uxtb	w1, w1
100001950:     	bl	0x10000149c <_coil.io.write-byte>
100001954:     	mov	x0, x19
100001958:     	b	0x10000196c <_coil.fmt.print-uhex+0x64>
10000195c:     	orr	x19, x3, xzr
100001960:     	mov	x8, x3
100001964:     	bl	0x100001d14 <_coil.fmt.uhex-digits>
100001968:     	mov	x0, x19
10000196c:     	ldr	x1, [x0]
100001970:     	str	x1, [x20]
100001974:     	ldr	x1, [x0, #0x8]
100001978:     	str	x1, [x20, #0x8]
10000197c:     	ldr	x0, [x0, #0x10]
100001980:     	str	x0, [x20, #0x10]
100001984:     	sub	sp, x29, #0x0
100001988:     	ldr	x19, [sp, #0x10]
10000198c:     	ldr	x20, [sp, #0x18]
100001990:     	ldr	x29, [sp]
100001994:     	ldr	x30, [sp, #0x8]
100001998:     	add	sp, sp, #0x20
10000199c:     	ret
1000019a0:     	mov	x20, x8
1000019a4:     	b	0x10000195c <_coil.fmt.print-uhex+0x54>

00000001000019a8 <_coil.fmt.count--write>:
1000019a8:     	sub	sp, sp, #0x10
1000019ac:     	str	x29, [sp]
1000019b0:     	str	x30, [sp, #0x8]
1000019b4:     	mov	x29, sp
1000019b8:     	sub	sp, sp, #0x20
1000019bc:     	mov	x1, sp
1000019c0:     	orr	x3, x1, xzr
1000019c4:     	ldr	x4, [x0]
1000019c8:     	add	x3, x3, #0x8
1000019cc:     	add	x4, x4, x2
1000019d0:     	str	x4, [x0]
1000019d4:     	movz	w17, #0x0, lsl #16
1000019d8:     	str	w17, [x1]
1000019dc:     	str	x2, [x3]
1000019e0:     	ldr	x0, [x1]
1000019e4:     	str	x0, [x8]
1000019e8:     	ldr	x0, [x1, #0x8]
1000019ec:     	str	x0, [x8, #0x8]
1000019f0:     	ldr	x0, [x1, #0x10]
1000019f4:     	str	x0, [x8, #0x10]
1000019f8:     	sub	sp, x29, #0x0
1000019fc:     	ldr	x29, [sp]
100001a00:     	ldr	x30, [sp, #0x8]
100001a04:     	add	sp, sp, #0x10
100001a08:     	ret
100001a0c:     	udf	#0x0

0000000100001a10 <_coil.fmt.fmt--fill>:
100001a10:     	sub	sp, sp, #0x50
100001a14:     	str	x29, [sp]
100001a18:     	str	x30, [sp, #0x8]
100001a1c:     	mov	x29, sp
100001a20:     	str	x19, [sp, #0x10]
100001a24:     	str	x20, [sp, #0x18]
100001a28:     	str	x21, [sp, #0x20]
100001a2c:     	str	x22, [sp, #0x28]
100001a30:     	str	x23, [sp, #0x30]
100001a34:     	str	x24, [sp, #0x38]
100001a38:     	str	x25, [sp, #0x40]
100001a3c:     	sub	sp, sp, #0x20
100001a40:     	mov	x19, sp
100001a44:     	add	x1, x1, #0x10
100001a48:     	sub	sp, sp, #0x20
100001a4c:     	mov	x20, sp
100001a50:     	orr	x21, x1, xzr
100001a54:     	movn	x1, #0x0, lsl #48
100001a58:     	b	0x100001aac <_coil.fmt.fmt--fill+0x9c>
100001a5c:     	nop
100001a60:     	lsr	x0, x0, #8
100001a64:     	lsr	w0, w0, #0
100001a68:     	orr	x23, x0, xzr
100001a6c:     	and	x0, x23, #0xff
100001a70:     	uxtb	w0, w0
100001a74:     	mov	x8, x20
100001a78:     	mov	w1, w0
100001a7c:     	mov	x0, x24
100001a80:     	uxtb	w1, w1
100001a84:     	bl	0x10000149c <_coil.io.write-byte>
100001a88:     	mov	x0, x23
100001a8c:     	lsr	x1, x0, #8
100001a90:     	lsr	w1, w1, #0
100001a94:     	movz	x17, #0x0, lsl #48
100001a98:     	cmp	x1, x17
100001a9c:     	b.ne	0x100001a60 <_coil.fmt.fmt--fill+0x50>
100001aa0:     	mov	x0, x24
100001aa4:     	mov	x2, x25
100001aa8:     	mov	x1, x22
100001aac:     	add	x22, x1, #0x1
100001ab0:     	cmp	x22, x2
100001ab4:     	b.ge	0x100001ae4 <_coil.fmt.fmt--fill+0xd4>
100001ab8:     	ldr	w1, [x21]
100001abc:     	orr	x23, x1, xzr
100001ac0:     	and	x1, x23, #0xff
100001ac4:     	uxtb	w1, w1
100001ac8:     	mov	x8, x19
100001acc:     	mov	x24, x0
100001ad0:     	mov	x25, x2
100001ad4:     	uxtb	w1, w1
100001ad8:     	bl	0x10000149c <_coil.io.write-byte>
100001adc:     	mov	x0, x23
100001ae0:     	b	0x100001a8c <_coil.fmt.fmt--fill+0x7c>
100001ae4:     	movz	x0, #0x0, lsl #48
100001ae8:     	sub	sp, x29, #0x0
100001aec:     	ldr	x19, [sp, #0x10]
100001af0:     	ldr	x20, [sp, #0x18]
100001af4:     	ldr	x21, [sp, #0x20]
100001af8:     	ldr	x22, [sp, #0x28]
100001afc:     	ldr	x23, [sp, #0x30]
100001b00:     	ldr	x24, [sp, #0x38]
100001b04:     	ldr	x25, [sp, #0x40]
100001b08:     	ldr	x29, [sp]
100001b0c:     	ldr	x30, [sp, #0x8]
100001b10:     	add	sp, sp, #0x50
100001b14:     	ret

0000000100001b18 <_coil.os.dlsym-errno-cell>:
100001b18:     	sub	sp, sp, #0x30
100001b1c:     	str	x29, [sp]
100001b20:     	str	x30, [sp, #0x8]
100001b24:     	mov	x29, sp
100001b28:     	str	x19, [sp, #0x10]
100001b2c:     	str	x20, [sp, #0x18]
100001b30:     	str	x21, [sp, #0x20]
100001b34:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
100001b38:     	ldr	x16, [x16, #0x68]
100001b3c:     	orr	x19, x16, xzr
100001b40:     	mov	x20, x0
100001b44:     	mov	x0, x19
100001b48:     	mov	x21, x1
100001b4c:     	bl	0x100001e98 <_coil.atomic.read-ptr__i8>
100001b50:     	movz	x17, #0x0, lsl #48
100001b54:     	cmp	x0, x17
100001b58:     	b.ne	0x100001b80 <_coil.os.dlsym-errno-cell+0x68>
100001b5c:     	mov	x0, x21
100001b60:     	mov	x1, x20
100001b64:     	bl	0x100001eb8 <dyld_stub_binder+0x100001eb8>
100001b68:     	mov	x1, x0
100001b6c:     	fmov	d31, x0
100001b70:     	mov	x0, x19
100001b74:     	fmov	x19, d31
100001b78:     	bl	0x100001ea4 <_coil.atomic.store-ptr__i8>
100001b7c:     	mov	x0, x19
100001b80:     	mov	x30, x0
100001b84:     	blr	x30
100001b88:     	ldr	x19, [sp, #0x10]
100001b8c:     	ldr	x20, [sp, #0x18]
100001b90:     	ldr	x21, [sp, #0x20]
100001b94:     	ldr	x29, [sp]
100001b98:     	ldr	x30, [sp, #0x8]
100001b9c:     	add	sp, sp, #0x30
100001ba0:     	ret

0000000100001ba4 <_coil.fmt.udec-digits>:
100001ba4:     	sub	sp, sp, #0x40
100001ba8:     	str	x29, [sp]
100001bac:     	str	x30, [sp, #0x8]
100001bb0:     	mov	x29, sp
100001bb4:     	str	x19, [sp, #0x10]
100001bb8:     	str	x20, [sp, #0x18]
100001bbc:     	str	x21, [sp, #0x20]
100001bc0:     	str	x22, [sp, #0x28]
100001bc4:     	str	x23, [sp, #0x30]
100001bc8:     	str	x24, [sp, #0x38]
100001bcc:     	sub	sp, sp, #0x20
100001bd0:     	mov	x2, sp
100001bd4:     	sub	sp, sp, #0x20
100001bd8:     	mov	x19, sp
100001bdc:     	sub	sp, sp, #0x20
100001be0:     	mov	x20, sp
100001be4:     	sub	sp, sp, #0x20
100001be8:     	mov	x21, sp
100001bec:     	movz	x17, #0x0, lsl #48
100001bf0:     	cmp	x1, x17
100001bf4:     	b.ne	0x100001c58 <_coil.fmt.udec-digits+0xb4>
100001bf8:     	orr	x0, x2, xzr
100001bfc:     	movz	w17, #0x0, lsl #16
100001c00:     	str	w17, [x2]
100001c04:     	add	x1, x0, #0x8
100001c08:     	movz	x17, #0x0, lsl #48
100001c0c:     	str	x17, [x1]
100001c10:     	mov	x22, x8
100001c14:     	ldr	x1, [x0]
100001c18:     	str	x1, [x22]
100001c1c:     	ldr	x1, [x0, #0x8]
100001c20:     	str	x1, [x22, #0x8]
100001c24:     	ldr	x0, [x0, #0x10]
100001c28:     	str	x0, [x22, #0x10]
100001c2c:     	sub	sp, x29, #0x0
100001c30:     	ldr	x19, [sp, #0x10]
100001c34:     	ldr	x20, [sp, #0x18]
100001c38:     	ldr	x21, [sp, #0x20]
100001c3c:     	ldr	x22, [sp, #0x28]
100001c40:     	ldr	x23, [sp, #0x30]
100001c44:     	ldr	x24, [sp, #0x38]
100001c48:     	ldr	x29, [sp]
100001c4c:     	ldr	x30, [sp, #0x8]
100001c50:     	add	sp, sp, #0x40
100001c54:     	ret
100001c58:     	mov	x17, #0xa               ; =10
100001c5c:     	udiv	x2, x1, x17
100001c60:     	mov	x22, x8
100001c64:     	mov	x8, x19
100001c68:     	mov	x23, x0
100001c6c:     	mov	x24, x1
100001c70:     	mov	x1, x2
100001c74:     	bl	0x100001ba4 <_coil.fmt.udec-digits>
100001c78:     	ldr	w0, [x19]
100001c7c:     	lsr	x16, x0, #0
100001c80:     	cmp	x16, #0x1
100001c84:     	b.eq	0x100001ca0 <_coil.fmt.udec-digits+0xfc>
100001c88:     	b.lo	0x100001c90 <_coil.fmt.udec-digits+0xec>
100001c8c:     	b	0x100001ca4 <_coil.fmt.udec-digits+0x100>
100001c90:     	cmp	x16, #0x0
100001c94:     	b.eq	0x100001c9c <_coil.fmt.udec-digits+0xf8>
100001c98:     	b	0x100001ca4 <_coil.fmt.udec-digits+0x100>
100001c9c:     	b	0x100001cd8 <_coil.fmt.udec-digits+0x134>
100001ca0:     	b	0x100001ca8 <_coil.fmt.udec-digits+0x104>
100001ca4:     	b	0x100001d0c <_coil.fmt.udec-digits+0x168>
100001ca8:     	orr	x0, x19, xzr
100001cac:     	orr	x1, x20, xzr
100001cb0:     	add	x0, x0, #0x8
100001cb4:     	add	x2, x1, #0x8
100001cb8:     	ldr	x3, [x0]
100001cbc:     	ldr	x0, [x0, #0x8]
100001cc0:     	mov	w17, #0x1               ; =1
100001cc4:     	str	w17, [x20]
100001cc8:     	str	x3, [x2]
100001ccc:     	str	x0, [x2, #0x8]
100001cd0:     	mov	x0, x1
100001cd4:     	b	0x100001d08 <_coil.fmt.udec-digits+0x164>
100001cd8:     	orr	x19, x21, xzr
100001cdc:     	mov	x17, #0xa               ; =10
100001ce0:     	udiv	x16, x24, x17
100001ce4:     	msub	x0, x16, x17, x24
100001ce8:     	add	x0, x0, #0x30
100001cec:     	uxtb	w0, w0
100001cf0:     	mov	x8, x21
100001cf4:     	mov	w1, w0
100001cf8:     	mov	x0, x23
100001cfc:     	uxtb	w1, w1
100001d00:     	bl	0x10000149c <_coil.io.write-byte>
100001d04:     	mov	x0, x19
100001d08:     	b	0x100001c14 <_coil.fmt.udec-digits+0x70>
100001d0c:     	brk	#0
100001d10:     	b	0x100001d0c <_coil.fmt.udec-digits+0x168>

0000000100001d14 <_coil.fmt.uhex-digits>:
100001d14:     	sub	sp, sp, #0x40
100001d18:     	str	x29, [sp]
100001d1c:     	str	x30, [sp, #0x8]
100001d20:     	mov	x29, sp
100001d24:     	str	x19, [sp, #0x10]
100001d28:     	str	x20, [sp, #0x18]
100001d2c:     	str	x21, [sp, #0x20]
100001d30:     	str	x22, [sp, #0x28]
100001d34:     	str	x23, [sp, #0x30]
100001d38:     	str	x24, [sp, #0x38]
100001d3c:     	sub	sp, sp, #0x20
100001d40:     	mov	x2, sp
100001d44:     	sub	sp, sp, #0x20
100001d48:     	mov	x19, sp
100001d4c:     	sub	sp, sp, #0x20
100001d50:     	mov	x20, sp
100001d54:     	sub	sp, sp, #0x20
100001d58:     	mov	x21, sp
100001d5c:     	movz	x17, #0x0, lsl #48
100001d60:     	cmp	x1, x17
100001d64:     	b.ne	0x100001dc8 <_coil.fmt.uhex-digits+0xb4>
100001d68:     	orr	x0, x2, xzr
100001d6c:     	movz	w17, #0x0, lsl #16
100001d70:     	str	w17, [x2]
100001d74:     	add	x1, x0, #0x8
100001d78:     	movz	x17, #0x0, lsl #48
100001d7c:     	str	x17, [x1]
100001d80:     	mov	x22, x8
100001d84:     	ldr	x1, [x0]
100001d88:     	str	x1, [x22]
100001d8c:     	ldr	x1, [x0, #0x8]
100001d90:     	str	x1, [x22, #0x8]
100001d94:     	ldr	x0, [x0, #0x10]
100001d98:     	str	x0, [x22, #0x10]
100001d9c:     	sub	sp, x29, #0x0
100001da0:     	ldr	x19, [sp, #0x10]
100001da4:     	ldr	x20, [sp, #0x18]
100001da8:     	ldr	x21, [sp, #0x20]
100001dac:     	ldr	x22, [sp, #0x28]
100001db0:     	ldr	x23, [sp, #0x30]
100001db4:     	ldr	x24, [sp, #0x38]
100001db8:     	ldr	x29, [sp]
100001dbc:     	ldr	x30, [sp, #0x8]
100001dc0:     	add	sp, sp, #0x40
100001dc4:     	ret
100001dc8:     	mov	x17, #0x10              ; =16
100001dcc:     	udiv	x2, x1, x17
100001dd0:     	mov	x22, x8
100001dd4:     	mov	x8, x19
100001dd8:     	mov	x23, x0
100001ddc:     	mov	x24, x1
100001de0:     	mov	x1, x2
100001de4:     	bl	0x100001d14 <_coil.fmt.uhex-digits>
100001de8:     	ldr	w0, [x19]
100001dec:     	lsr	x16, x0, #0
100001df0:     	cmp	x16, #0x1
100001df4:     	b.eq	0x100001e10 <_coil.fmt.uhex-digits+0xfc>
100001df8:     	b.lo	0x100001e00 <_coil.fmt.uhex-digits+0xec>
100001dfc:     	b	0x100001e14 <_coil.fmt.uhex-digits+0x100>
100001e00:     	cmp	x16, #0x0
100001e04:     	b.eq	0x100001e0c <_coil.fmt.uhex-digits+0xf8>
100001e08:     	b	0x100001e14 <_coil.fmt.uhex-digits+0x100>
100001e0c:     	b	0x100001e70 <_coil.fmt.uhex-digits+0x15c>
100001e10:     	b	0x100001e18 <_coil.fmt.uhex-digits+0x104>
100001e14:     	b	0x100001e90 <_coil.fmt.uhex-digits+0x17c>
100001e18:     	orr	x0, x19, xzr
100001e1c:     	orr	x1, x20, xzr
100001e20:     	add	x0, x0, #0x8
100001e24:     	add	x2, x1, #0x8
100001e28:     	ldr	x3, [x0]
100001e2c:     	ldr	x0, [x0, #0x8]
100001e30:     	mov	w17, #0x1               ; =1
100001e34:     	str	w17, [x20]
100001e38:     	str	x3, [x2]
100001e3c:     	str	x0, [x2, #0x8]
100001e40:     	mov	x0, x1
100001e44:     	b	0x100001e6c <_coil.fmt.uhex-digits+0x158>
100001e48:     	add	x0, x0, #0x57
100001e4c:     	orr	x19, x21, xzr
100001e50:     	uxtb	w0, w0
100001e54:     	mov	x8, x21
100001e58:     	mov	w1, w0
100001e5c:     	mov	x0, x23
100001e60:     	uxtb	w1, w1
100001e64:     	bl	0x10000149c <_coil.io.write-byte>
100001e68:     	mov	x0, x19
100001e6c:     	b	0x100001d84 <_coil.fmt.uhex-digits+0x70>
100001e70:     	mov	x17, #0x10              ; =16
100001e74:     	udiv	x16, x24, x17
100001e78:     	msub	x0, x16, x17, x24
100001e7c:     	mov	x17, #0xa               ; =10
100001e80:     	cmp	x0, x17
100001e84:     	b.ge	0x100001e48 <_coil.fmt.uhex-digits+0x134>
100001e88:     	add	x0, x0, #0x30
100001e8c:     	b	0x100001e4c <_coil.fmt.uhex-digits+0x138>
100001e90:     	brk	#0
100001e94:     	b	0x100001e90 <_coil.fmt.uhex-digits+0x17c>

0000000100001e98 <_coil.atomic.read-ptr__i8>:
100001e98:     	mov	x16, x0
100001e9c:     	ldar	x0, [x16]
100001ea0:     	ret

0000000100001ea4 <_coil.atomic.store-ptr__i8>:
100001ea4:     	mov	x16, x0
100001ea8:     	mov	x17, x1
100001eac:     	stlr	x17, [x16]
100001eb0:     	movz	x0, #0x0, lsl #48
100001eb4:     	ret

Disassembly of section __TEXT,__stubs:

0000000100001eb8 <__stubs>:
100001eb8:     	adrp	x16, 0x100008000 <dyld_stub_binder+0x100008000>
100001ebc:     	ldr	x16, [x16]
100001ec0:     	br	x16
100001ec4:     	adrp	x16, 0x100008000 <dyld_stub_binder+0x100008000>
100001ec8:     	ldr	x16, [x16, #0x8]
100001ecc:     	br	x16

Disassembly of section __TEXT,__stub_helper:

0000000100001ed0 <__stub_helper>:
100001ed0:     	adrp	x17, 0x100008000 <dyld_stub_binder+0x100008000>
100001ed4:     	add	x17, x17, #0xb8
100001ed8:     	stp	x16, x17, [sp, #-0x10]!
100001edc:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
100001ee0:     	ldr	x16, [x16]
100001ee4:     	br	x16
100001ee8:     	ldr	w16, 0x100001ef0 <__stub_helper+0x20>
100001eec:     	b	0x100001ed0 <__stub_helper>
100001ef0:     	udf	#0x0
100001ef4:     	ldr	w16, 0x100001efc <__stub_helper+0x2c>
100001ef8:     	b	0x100001ed0 <__stub_helper>
100001efc:     	udf	#0xd
