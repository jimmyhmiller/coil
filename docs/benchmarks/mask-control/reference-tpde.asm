
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-iterative-control/build/stable-mask-control-properties-comparison/reference-tpde:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100000570 <_main>:
100000570:     	stp	x29, x30, [sp, #-0x180]!
100000574:     	mov	x29, sp
100000578:     	bl	0x10000064c <_coil.io.stdout>
10000057c:     	mov	x9, x0
100000580:     	mov	w0, #0x9680             ; =38528
100000584:     	movk	w0, #0x98, lsl #16
100000588:     	str	x9, [x29, #0x170]
10000058c:     	bl	0x100000658 <_stogir.benchmarks.opcode-properties.kernel>
100000590:     	str	xzr, [x29, #0xf0]
100000594:     	str	xzr, [x29, #0xf8]
100000598:     	str	xzr, [x29, #0x100]
10000059c:     	str	xzr, [x29, #0x108]
1000005a0:     	str	xzr, [x29, #0x110]
1000005a4:     	str	xzr, [x29, #0x118]
1000005a8:     	str	xzr, [x29, #0x120]
1000005ac:     	str	xzr, [x29, #0x128]
1000005b0:     	str	xzr, [x29, #0x130]
1000005b4:     	ldr	q0, [x29, #0xf0]
1000005b8:     	str	q0, [x29, #0xa0]
1000005bc:     	ldr	q0, [x29, #0x100]
1000005c0:     	str	q0, [x29, #0xb0]
1000005c4:     	ldr	q0, [x29, #0x110]
1000005c8:     	str	q0, [x29, #0xc0]
1000005cc:     	ldr	q0, [x29, #0x120]
1000005d0:     	str	q0, [x29, #0xd0]
1000005d4:     	ldr	x1, [x29, #0x130]
1000005d8:     	str	x1, [x29, #0xe0]
1000005dc:     	mov	x9, x0
1000005e0:     	add	x0, x29, #0xa0
1000005e4:     	ldr	x1, [x29, #0x170]
1000005e8:     	str	x9, [x29, #0x178]
1000005ec:     	bl	0x1000007a4 <_inherent$coil.fmt.Formatter$init>
1000005f0:     	add	x0, x29, #0xa0
1000005f4:     	mov	w1, #0x0                ; =0
1000005f8:     	bl	0x1000007d0 <_inherent$coil.fmt.Formatter$set-alternate!>
1000005fc:     	ldr	x0, [x29, #0x178]
100000600:     	add	x1, x29, #0xa0
100000604:     	bl	0x1000007dc <_coil.fmt.Display$u64$display-fmt>
100000608:     	adrp	x0, 0x100001000 <_coil.io.fd-retry?+0x1c>
10000060c:     	add	x0, x0, #0xaf2
100000610:     	str	x0, [x29, #0x140]
100000614:     	mov	w0, #0x1                ; =1
100000618:     	str	x0, [x29, #0x148]
10000061c:     	ldr	x0, [x29, #0x140]
100000620:     	ldr	x1, [x29, #0x148]
100000624:     	add	x8, x29, #0x150
100000628:     	mov	x9, x0
10000062c:     	ldr	x0, [x29, #0x170]
100000630:     	mov	x10, x1
100000634:     	mov	x1, x9
100000638:     	mov	x2, x10
10000063c:     	bl	0x10000083c <_coil.io.print-str>
100000640:     	mov	w0, #0x0                ; =0
100000644:     	ldp	x29, x30, [sp], #0x180
100000648:     	ret

000000010000064c <_coil.io.stdout>:
10000064c:     	adrp	x0, 0x100008000 <dyld_stub_binder+0x100008000>
100000650:     	add	x0, x0, #0x98
100000654:     	ret

0000000100000658 <_stogir.benchmarks.opcode-properties.kernel>:
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

00000001000007a4 <_inherent$coil.fmt.Formatter$init>:
1000007a4:     	stp	x29, x30, [sp, #-0xb0]!
1000007a8:     	mov	x29, sp
1000007ac:     	str	x1, [x0]
1000007b0:     	strb	wzr, [x0, #0x8]
1000007b4:     	str	xzr, [x0, #0x10]
1000007b8:     	mov	x9, x0
1000007bc:     	str	x9, [x29, #0xa0]
1000007c0:     	bl	0x100000ac8 <_inherent$coil.fmt.Formatter$clear-spec!>
1000007c4:     	ldr	x0, [x29, #0xa0]
1000007c8:     	ldp	x29, x30, [sp], #0xb0
1000007cc:     	ret

00000001000007d0 <_inherent$coil.fmt.Formatter$set-alternate!>:
1000007d0:     	strb	w1, [x0, #0x8]
1000007d4:     	mov	w0, #0x0                ; =0
1000007d8:     	ret

00000001000007dc <_coil.fmt.Display$u64$display-fmt>:
1000007dc:     	stp	x29, x30, [sp, #-0xf0]!
1000007e0:     	mov	x29, sp
1000007e4:     	adrp	x2, 0x100001000 <_coil.io.fd-retry?+0x1c>
1000007e8:     	add	x2, x2, #0xaf4
1000007ec:     	str	x2, [x29, #0xa0]
1000007f0:     	str	xzr, [x29, #0xa8]
1000007f4:     	str	wzr, [x29, #0xb0]
1000007f8:     	str	x0, [x29, #0xb8]
1000007fc:     	ldr	x0, [x29, #0xa0]
100000800:     	ldr	x2, [x29, #0xa8]
100000804:     	ldr	q0, [x29, #0xb0]
100000808:     	str	q0, [x29, #0xd0]
10000080c:     	ldr	x3, [x29, #0xc0]
100000810:     	str	x3, [x29, #0xe0]
100000814:     	mov	x9, x0
100000818:     	mov	x0, x1
10000081c:     	mov	w1, #0x0                ; =0
100000820:     	mov	x10, x2
100000824:     	mov	x2, x9
100000828:     	mov	x3, x10
10000082c:     	add	x4, x29, #0xd0
100000830:     	bl	0x100000b14 <_coil.fmt.fmt--number__coil.fmt.IntDigits>
100000834:     	ldp	x29, x30, [sp], #0xf0
100000838:     	ret

000000010000083c <_coil.io.print-str>:
10000083c:     	stp	x29, x30, [sp, #-0xf0]!
100000840:     	mov	x29, sp
100000844:     	str	x1, [x29, #0xa0]
100000848:     	str	x2, [x29, #0xa8]
10000084c:     	ldr	x1, [x29, #0xa0]
100000850:     	ldr	x2, [x29, #0xa8]
100000854:     	mov	x9, x0
100000858:     	mov	x0, x1
10000085c:     	mov	x1, x2
100000860:     	str	x8, [x29, #0xd0]
100000864:     	str	x9, [x29, #0xd8]
100000868:     	bl	0x100000e0c <_inherent$slice$data__u8>
10000086c:     	ldr	x1, [x29, #0xa0]
100000870:     	ldr	x2, [x29, #0xa8]
100000874:     	mov	x9, x0
100000878:     	mov	x0, x1
10000087c:     	mov	x1, x2
100000880:     	str	x9, [x29, #0xe0]
100000884:     	bl	0x100000e28 <_coil.core.Len$slice$len__u8>
100000888:     	add	x8, x29, #0xb0
10000088c:     	mov	x9, x0
100000890:     	ldr	x0, [x29, #0xd8]
100000894:     	ldr	x1, [x29, #0xe0]
100000898:     	mov	x2, x9
10000089c:     	bl	0x100000e44 <_coil.io.write-all>
1000008a0:     	ldr	x0, [x29, #0xd0]
1000008a4:     	ldr	q0, [x29, #0xb0]
1000008a8:     	str	q0, [x0]
1000008ac:     	ldr	x1, [x29, #0xc0]
1000008b0:     	str	x1, [x0, #0x10]
1000008b4:     	ldp	x29, x30, [sp], #0xf0
1000008b8:     	ret

00000001000008bc <_coil.io.write-fd>:
1000008bc:     	stp	x29, x30, [sp, #-0x110]!
1000008c0:     	mov	x29, sp
1000008c4:     	stp	x19, x20, [sp, #0x10]
1000008c8:     	str	x21, [sp, #0x20]
1000008cc:     	mov	x19, x8
1000008d0:     	sxtw	x0, w0
1000008d4:     	str	x0, [x29, #0xf0]
1000008d8:     	str	x1, [x29, #0xf8]
1000008dc:     	str	x2, [x29, #0x100]
1000008e0:     	ldr	x0, [x29, #0xf0]
1000008e4:     	ldr	x1, [x29, #0xf8]
1000008e8:     	ldr	x2, [x29, #0x100]
1000008ec:     	bl	0x100001aa8 <dyld_stub_binder+0x100001aa8>
1000008f0:     	mov	x20, x0
1000008f4:     	cmp	x20, #0x0
1000008f8:     	b.ge	0x10000091c <_coil.io.write-fd+0x60>
1000008fc:     	bl	0x100000fcc <_coil.os.errno>
100000900:     	mov	x21, x0
100000904:     	ldr	x0, [x29, #0xf0]
100000908:     	mov	x1, x21
10000090c:     	mov	w2, #0x4                ; =4
100000910:     	bl	0x100000fe4 <_coil.io.fd-retry?>
100000914:     	cbz	x0, 0x100000930 <_coil.io.write-fd+0x74>
100000918:     	b	0x1000008e0 <_coil.io.write-fd+0x24>
10000091c:     	str	wzr, [x29, #0xa0]
100000920:     	str	x20, [x29, #0xa8]
100000924:     	add	x0, x29, #0xa0
100000928:     	str	x0, [x29, #0xf8]
10000092c:     	b	0x100000954 <_coil.io.write-fd+0x98>
100000930:     	mov	w0, #0x1                ; =1
100000934:     	str	w0, [x29, #0xc0]
100000938:     	mov	w0, #0x1                ; =1
10000093c:     	str	w0, [x29, #0xe0]
100000940:     	str	x21, [x29, #0xe8]
100000944:     	ldr	q0, [x29, #0xe0]
100000948:     	stur	q0, [x29, #0xc8]
10000094c:     	add	x0, x29, #0xc0
100000950:     	str	x0, [x29, #0xf8]
100000954:     	ldr	x0, [x29, #0xf8]
100000958:     	ldr	q0, [x0]
10000095c:     	str	q0, [x19]
100000960:     	ldr	x1, [x0, #0x10]
100000964:     	str	x1, [x19, #0x10]
100000968:     	ldp	x19, x20, [sp, #0x10]
10000096c:     	ldr	x21, [sp, #0x20]
100000970:     	ldp	x29, x30, [sp], #0x110
100000974:     	ret

0000000100000978 <_stogir.opcode.control?>:
100000978:     	stp	x29, x30, [sp, #-0xb0]!
10000097c:     	mov	x29, sp
100000980:     	str	x19, [sp, #0x10]
100000984:     	sxtw	x0, w0
100000988:     	bl	0x10000104c <_stogir.opcode.properties>
10000098c:     	ubfx	x0, x0, #0, #8
100000990:     	and	x0, x0, #0x1
100000994:     	ubfx	x0, x0, #0, #8
100000998:     	strb	w0, [x29, #0xa0]
10000099c:     	strb	wzr, [x29, #0xa1]
1000009a0:     	ldrb	w0, [x29, #0xa0]
1000009a4:     	ldrb	w1, [x29, #0xa1]
1000009a8:     	cmp	x0, x1
1000009ac:     	b.ne	0x1000009b8 <_stogir.opcode.control?+0x40>
1000009b0:     	mov	w19, #0x0               ; =0
1000009b4:     	b	0x1000009bc <_stogir.opcode.control?+0x44>
1000009b8:     	mov	w19, #0x1               ; =1
1000009bc:     	mov	x0, x19
1000009c0:     	ldr	x19, [sp, #0x10]
1000009c4:     	ldp	x29, x30, [sp], #0xb0
1000009c8:     	ret

00000001000009cc <_stogir.opcode.block-start?>:
1000009cc:     	stp	x29, x30, [sp, #-0xb0]!
1000009d0:     	mov	x29, sp
1000009d4:     	str	x19, [sp, #0x10]
1000009d8:     	sxtw	x0, w0
1000009dc:     	bl	0x10000104c <_stogir.opcode.properties>
1000009e0:     	ubfx	x0, x0, #0, #8
1000009e4:     	and	x0, x0, #0x2
1000009e8:     	ubfx	x0, x0, #0, #8
1000009ec:     	strb	w0, [x29, #0xa0]
1000009f0:     	strb	wzr, [x29, #0xa1]
1000009f4:     	ldrb	w0, [x29, #0xa0]
1000009f8:     	ldrb	w1, [x29, #0xa1]
1000009fc:     	cmp	x0, x1
100000a00:     	b.ne	0x100000a0c <_stogir.opcode.block-start?+0x40>
100000a04:     	mov	w19, #0x0               ; =0
100000a08:     	b	0x100000a10 <_stogir.opcode.block-start?+0x44>
100000a0c:     	mov	w19, #0x1               ; =1
100000a10:     	mov	x0, x19
100000a14:     	ldr	x19, [sp, #0x10]
100000a18:     	ldp	x29, x30, [sp], #0xb0
100000a1c:     	ret

0000000100000a20 <_stogir.opcode.block-end?>:
100000a20:     	stp	x29, x30, [sp, #-0xb0]!
100000a24:     	mov	x29, sp
100000a28:     	str	x19, [sp, #0x10]
100000a2c:     	sxtw	x0, w0
100000a30:     	bl	0x10000104c <_stogir.opcode.properties>
100000a34:     	ubfx	x0, x0, #0, #8
100000a38:     	and	x0, x0, #0x4
100000a3c:     	ubfx	x0, x0, #0, #8
100000a40:     	strb	w0, [x29, #0xa0]
100000a44:     	strb	wzr, [x29, #0xa1]
100000a48:     	ldrb	w0, [x29, #0xa0]
100000a4c:     	ldrb	w1, [x29, #0xa1]
100000a50:     	cmp	x0, x1
100000a54:     	b.ne	0x100000a60 <_stogir.opcode.block-end?+0x40>
100000a58:     	mov	w19, #0x0               ; =0
100000a5c:     	b	0x100000a64 <_stogir.opcode.block-end?+0x44>
100000a60:     	mov	w19, #0x1               ; =1
100000a64:     	mov	x0, x19
100000a68:     	ldr	x19, [sp, #0x10]
100000a6c:     	ldp	x29, x30, [sp], #0xb0
100000a70:     	ret

0000000100000a74 <_stogir.opcode.terminator?>:
100000a74:     	stp	x29, x30, [sp, #-0xb0]!
100000a78:     	mov	x29, sp
100000a7c:     	str	x19, [sp, #0x10]
100000a80:     	sxtw	x0, w0
100000a84:     	bl	0x10000104c <_stogir.opcode.properties>
100000a88:     	ubfx	x0, x0, #0, #8
100000a8c:     	and	x0, x0, #0x8
100000a90:     	ubfx	x0, x0, #0, #8
100000a94:     	strb	w0, [x29, #0xa0]
100000a98:     	strb	wzr, [x29, #0xa1]
100000a9c:     	ldrb	w0, [x29, #0xa0]
100000aa0:     	ldrb	w1, [x29, #0xa1]
100000aa4:     	cmp	x0, x1
100000aa8:     	b.ne	0x100000ab4 <_stogir.opcode.terminator?+0x40>
100000aac:     	mov	w19, #0x0               ; =0
100000ab0:     	b	0x100000ab8 <_stogir.opcode.terminator?+0x44>
100000ab4:     	mov	w19, #0x1               ; =1
100000ab8:     	mov	x0, x19
100000abc:     	ldr	x19, [sp, #0x10]
100000ac0:     	ldp	x29, x30, [sp], #0xb0
100000ac4:     	ret

0000000100000ac8 <_inherent$coil.fmt.Formatter$clear-spec!>:
100000ac8:     	stp	x29, x30, [sp, #-0xe0]!
100000acc:     	mov	x29, sp
100000ad0:     	add	x1, x0, #0x18
100000ad4:     	add	x8, x29, #0xa0
100000ad8:     	str	x0, [x29, #0xd0]
100000adc:     	str	x1, [x29, #0xd8]
100000ae0:     	bl	0x1000010ac <_coil.fmt.plain-format-spec>
100000ae4:     	ldr	x0, [x29, #0xd8]
100000ae8:     	ldr	q0, [x29, #0xa0]
100000aec:     	str	q0, [x0]
100000af0:     	ldr	q0, [x29, #0xb0]
100000af4:     	str	q0, [x0, #0x10]
100000af8:     	ldr	x1, [x29, #0xc0]
100000afc:     	str	x1, [x0, #0x20]
100000b00:     	ldr	x0, [x29, #0xd0]
100000b04:     	strb	wzr, [x0, #0x40]
100000b08:     	mov	w0, #0x0                ; =0
100000b0c:     	ldp	x29, x30, [sp], #0xe0
100000b10:     	ret

0000000100000b14 <_coil.fmt.fmt--number__coil.fmt.IntDigits>:
100000b14:     	sub	sp, sp, #0x260
100000b18:     	stp	x29, x30, [sp]
100000b1c:     	mov	x29, sp
100000b20:     	stp	x19, x20, [sp, #0x10]
100000b24:     	stp	x21, x22, [sp, #0x20]
100000b28:     	str	x23, [sp, #0x30]
100000b2c:     	mov	x19, x4
100000b30:     	str	x2, [x29, #0xa0]
100000b34:     	str	x3, [x29, #0xa8]
100000b38:     	mov	x9, x0
100000b3c:     	str	x1, [x29, #0x158]
100000b40:     	str	x9, [x29, #0x240]
100000b44:     	bl	0x100001144 <_inherent$coil.fmt.Formatter$writer>
100000b48:     	mov	x20, x0
100000b4c:     	add	x8, x29, #0xe0
100000b50:     	ldr	x0, [x29, #0x240]
100000b54:     	bl	0x10000114c <_inherent$coil.fmt.Formatter$take-spec!>
100000b58:     	ldr	q0, [x29, #0xe0]
100000b5c:     	str	q0, [x29, #0xb0]
100000b60:     	ldr	q0, [x29, #0xf0]
100000b64:     	str	q0, [x29, #0xc0]
100000b68:     	ldr	x0, [x29, #0x100]
100000b6c:     	str	x0, [x29, #0xd0]
100000b70:     	ldr	x21, [x29, #0xb8]
100000b74:     	ldr	x0, [x29, #0x158]
100000b78:     	cbz	x0, 0x100000b9c <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x88>
100000b7c:     	adrp	x0, 0x100001000 <_coil.io.fd-retry?+0x1c>
100000b80:     	add	x0, x0, #0xaf5
100000b84:     	str	x0, [x29, #0x110]
100000b88:     	mov	w0, #0x1                ; =1
100000b8c:     	str	x0, [x29, #0x118]
100000b90:     	add	x0, x29, #0x110
100000b94:     	str	x0, [x29, #0x158]
100000b98:     	b	0x100000be4 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0xd0>
100000b9c:     	ldrb	w0, [x29, #0xd0]
100000ba0:     	cbz	x0, 0x100000bc4 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0xb0>
100000ba4:     	adrp	x0, 0x100001000 <_coil.io.fd-retry?+0x1c>
100000ba8:     	add	x0, x0, #0xaf7
100000bac:     	str	x0, [x29, #0x120]
100000bb0:     	mov	w0, #0x1                ; =1
100000bb4:     	str	x0, [x29, #0x128]
100000bb8:     	add	x0, x29, #0x120
100000bbc:     	str	x0, [x29, #0x240]
100000bc0:     	b	0x100000bdc <_coil.fmt.fmt--number__coil.fmt.IntDigits+0xc8>
100000bc4:     	adrp	x0, 0x100001000 <_coil.io.fd-retry?+0x1c>
100000bc8:     	add	x0, x0, #0xaf4
100000bcc:     	str	x0, [x29, #0x130]
100000bd0:     	str	xzr, [x29, #0x138]
100000bd4:     	add	x0, x29, #0x130
100000bd8:     	str	x0, [x29, #0x240]
100000bdc:     	ldr	x0, [x29, #0x240]
100000be0:     	str	x0, [x29, #0x158]
100000be4:     	ldr	x0, [x29, #0xb0]
100000be8:     	cmp	x0, #0x0
100000bec:     	b.ge	0x100000c48 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x134>
100000bf0:     	ldr	x0, [x29, #0x158]
100000bf4:     	ldr	x1, [x0]
100000bf8:     	ldr	x2, [x0, #0x8]
100000bfc:     	add	x8, x29, #0x160
100000c00:     	mov	x9, x0
100000c04:     	mov	x0, x20
100000c08:     	bl	0x10000083c <_coil.io.print-str>
100000c0c:     	ldr	x0, [x29, #0xa0]
100000c10:     	ldr	x1, [x29, #0xa8]
100000c14:     	add	x8, x29, #0x180
100000c18:     	mov	x9, x0
100000c1c:     	mov	x0, x20
100000c20:     	mov	x10, x1
100000c24:     	mov	x1, x9
100000c28:     	mov	x2, x10
100000c2c:     	bl	0x10000083c <_coil.io.print-str>
100000c30:     	mov	x0, x19
100000c34:     	mov	x1, x20
100000c38:     	mov	x2, x21
100000c3c:     	bl	0x1000011c0 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits>
100000c40:     	str	x0, [x29, #0x240]
100000c44:     	b	0x100000df0 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x2dc>
100000c48:     	add	x0, x29, #0x140
100000c4c:     	add	x1, x29, #0x150
100000c50:     	bl	0x100001278 <_coil.fmt.counting-writer>
100000c54:     	mov	x9, x0
100000c58:     	mov	x0, x19
100000c5c:     	mov	x1, x9
100000c60:     	mov	x2, x21
100000c64:     	bl	0x1000011c0 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits>
100000c68:     	ldr	x0, [x29, #0x158]
100000c6c:     	ldr	x1, [x0]
100000c70:     	ldr	x2, [x0, #0x8]
100000c74:     	mov	x9, x0
100000c78:     	mov	x0, x1
100000c7c:     	mov	x1, x2
100000c80:     	bl	0x100000e28 <_coil.core.Len$slice$len__u8>
100000c84:     	ldr	x1, [x29, #0xa0]
100000c88:     	ldr	x2, [x29, #0xa8]
100000c8c:     	mov	x9, x0
100000c90:     	mov	x0, x1
100000c94:     	mov	x1, x2
100000c98:     	str	x9, [x29, #0x248]
100000c9c:     	bl	0x100000e28 <_coil.core.Len$slice$len__u8>
100000ca0:     	ldr	x1, [x29, #0x150]
100000ca4:     	add	x0, x0, x1
100000ca8:     	ldr	x1, [x29, #0x248]
100000cac:     	add	x1, x1, x0
100000cb0:     	ldrb	w0, [x29, #0xd1]
100000cb4:     	str	x1, [x29, #0x248]
100000cb8:     	cbz	x0, 0x100000d68 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x254>
100000cbc:     	ldr	x0, [x29, #0x158]
100000cc0:     	ldr	x2, [x0]
100000cc4:     	ldr	x3, [x0, #0x8]
100000cc8:     	add	x8, x29, #0x1a0
100000ccc:     	mov	x9, x0
100000cd0:     	mov	x0, x20
100000cd4:     	mov	x10, x1
100000cd8:     	mov	x1, x2
100000cdc:     	mov	x2, x3
100000ce0:     	bl	0x10000083c <_coil.io.print-str>
100000ce4:     	ldr	x0, [x29, #0xa0]
100000ce8:     	ldr	x1, [x29, #0xa8]
100000cec:     	add	x8, x29, #0x1c0
100000cf0:     	mov	x9, x0
100000cf4:     	mov	x0, x20
100000cf8:     	mov	x10, x1
100000cfc:     	mov	x1, x9
100000d00:     	mov	x2, x10
100000d04:     	bl	0x10000083c <_coil.io.print-str>
100000d08:     	ldr	x0, [x29, #0xb0]
100000d0c:     	ldr	x1, [x29, #0x248]
100000d10:     	sub	x0, x0, x1
100000d14:     	mov	w2, #0x0                ; =0
100000d18:     	sub	x2, x2, #0x1
100000d1c:     	str	x0, [x29, #0x250]
100000d20:     	mov	x22, x2
100000d24:     	add	x23, x22, #0x1
100000d28:     	ldr	x0, [x29, #0x250]
100000d2c:     	cmp	x23, x0
100000d30:     	b.ge	0x100000d50 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x23c>
100000d34:     	add	x8, x29, #0x1e0
100000d38:     	mov	x9, x0
100000d3c:     	mov	x0, x20
100000d40:     	mov	w1, #0x30               ; =48
100000d44:     	bl	0x100001290 <_coil.io.write-byte>
100000d48:     	mov	x22, x23
100000d4c:     	b	0x100000d24 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x210>
100000d50:     	mov	x0, x19
100000d54:     	mov	x1, x20
100000d58:     	mov	x2, x21
100000d5c:     	bl	0x1000011c0 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits>
100000d60:     	str	x0, [x29, #0x250]
100000d64:     	b	0x100000de8 <_coil.fmt.fmt--number__coil.fmt.IntDigits+0x2d4>
100000d68:     	mov	x0, x20
100000d6c:     	add	x1, x29, #0xb0
100000d70:     	ldr	x2, [x29, #0x248]
100000d74:     	mov	w3, #0x0                ; =0
100000d78:     	bl	0x1000012d4 <_coil.fmt.fmt--pad-before>
100000d7c:     	ldr	x0, [x29, #0x158]
100000d80:     	ldr	x1, [x0]
100000d84:     	ldr	x0, [x0, #0x8]
100000d88:     	add	x8, x29, #0x200
100000d8c:     	mov	x9, x0
100000d90:     	mov	x0, x20
100000d94:     	mov	x2, x9
100000d98:     	bl	0x10000083c <_coil.io.print-str>
100000d9c:     	ldr	x0, [x29, #0xa0]
100000da0:     	ldr	x1, [x29, #0xa8]
100000da4:     	add	x8, x29, #0x220
100000da8:     	mov	x9, x0
100000dac:     	mov	x0, x20
100000db0:     	mov	x10, x1
100000db4:     	mov	x1, x9
100000db8:     	mov	x2, x10
100000dbc:     	bl	0x10000083c <_coil.io.print-str>
100000dc0:     	mov	x0, x19
100000dc4:     	mov	x1, x20
100000dc8:     	mov	x2, x21
100000dcc:     	bl	0x1000011c0 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits>
100000dd0:     	mov	x0, x20
100000dd4:     	add	x1, x29, #0xb0
100000dd8:     	ldr	x2, [x29, #0x248]
100000ddc:     	mov	w3, #0x0                ; =0
100000de0:     	bl	0x1000013a4 <_coil.fmt.fmt--pad-after>
100000de4:     	str	x0, [x29, #0x250]
100000de8:     	ldr	x0, [x29, #0x250]
100000dec:     	str	x0, [x29, #0x240]
100000df0:     	ldr	x0, [x29, #0x240]
100000df4:     	ldp	x19, x20, [sp, #0x10]
100000df8:     	ldp	x21, x22, [sp, #0x20]
100000dfc:     	ldr	x23, [sp, #0x30]
100000e00:     	ldp	x29, x30, [sp]
100000e04:     	add	sp, sp, #0x260
100000e08:     	ret

0000000100000e0c <_inherent$slice$data__u8>:
100000e0c:     	stp	x29, x30, [sp, #-0xb0]!
100000e10:     	mov	x29, sp
100000e14:     	str	x0, [x29, #0xa0]
100000e18:     	str	x1, [x29, #0xa8]
100000e1c:     	ldr	x0, [x29, #0xa0]
100000e20:     	ldp	x29, x30, [sp], #0xb0
100000e24:     	ret

0000000100000e28 <_coil.core.Len$slice$len__u8>:
100000e28:     	stp	x29, x30, [sp, #-0xb0]!
100000e2c:     	mov	x29, sp
100000e30:     	str	x0, [x29, #0xa0]
100000e34:     	str	x1, [x29, #0xa8]
100000e38:     	ldr	x0, [x29, #0xa8]
100000e3c:     	ldp	x29, x30, [sp], #0xb0
100000e40:     	ret

0000000100000e44 <_coil.io.write-all>:
100000e44:     	stp	x29, x30, [sp, #-0x1d0]!
100000e48:     	mov	x29, sp
100000e4c:     	stp	x19, x20, [sp, #0x10]
100000e50:     	stp	x21, x22, [sp, #0x20]
100000e54:     	str	x23, [sp, #0x30]
100000e58:     	mov	x19, x8
100000e5c:     	mov	x20, x0
100000e60:     	mov	x21, x1
100000e64:     	mov	x22, x2
100000e68:     	cmp	x22, #0x0
100000e6c:     	b.gt	0x100000e80 <_coil.io.write-all+0x3c>
100000e70:     	str	wzr, [x29, #0xa0]
100000e74:     	str	xzr, [x29, #0xa8]
100000e78:     	add	x23, x29, #0xa0
100000e7c:     	b	0x100000f9c <_coil.io.write-all+0x158>
100000e80:     	add	x8, x29, #0xc0
100000e84:     	mov	x0, x20
100000e88:     	mov	x1, x21
100000e8c:     	mov	x2, x22
100000e90:     	bl	0x100001478 <_coil.io.write-some>
100000e94:     	ldr	w0, [x29, #0xc0]
100000e98:     	cmp	x0, #0x0
100000e9c:     	b.eq	0x100000ed4 <_coil.io.write-all+0x90>
100000ea0:     	cmp	x0, #0x1
100000ea4:     	b.eq	0x100000eb0 <_coil.io.write-all+0x6c>
100000ea8:     	b	0x100000eac <_coil.io.write-all+0x68>
100000eac:     	b	0x100000fb4 <_coil.io.write-all+0x170>
100000eb0:     	ldur	q0, [x29, #0xc8]
100000eb4:     	str	q0, [x29, #0xe0]
100000eb8:     	mov	w0, #0x1                ; =1
100000ebc:     	str	w0, [x29, #0xf0]
100000ec0:     	ldr	q0, [x29, #0xe0]
100000ec4:     	stur	q0, [x29, #0xf8]
100000ec8:     	add	x0, x29, #0xf0
100000ecc:     	str	x0, [x29, #0x1b0]
100000ed0:     	b	0x100000f98 <_coil.io.write-all+0x154>
100000ed4:     	ldr	x0, [x29, #0xc8]
100000ed8:     	cmp	x0, #0x0
100000edc:     	str	x0, [x29, #0x1b8]
100000ee0:     	b.gt	0x100000f0c <_coil.io.write-all+0xc8>
100000ee4:     	mov	w1, #0x1                ; =1
100000ee8:     	str	w1, [x29, #0x110]
100000eec:     	mov	w1, #0x5                ; =5
100000ef0:     	str	w1, [x29, #0x130]
100000ef4:     	ldr	q0, [x29, #0x130]
100000ef8:     	mov	w16, #0x118             ; =280
100000efc:     	str	q0, [x29, x16]
100000f00:     	add	x1, x29, #0x110
100000f04:     	str	x1, [x29, #0x1c0]
100000f08:     	b	0x100000f90 <_coil.io.write-all+0x14c>
100000f0c:     	ldr	x0, [x29, #0x1b8]
100000f10:     	add	x21, x21, x0
100000f14:     	sub	x22, x22, x0
100000f18:     	add	x8, x29, #0x140
100000f1c:     	mov	x9, x0
100000f20:     	mov	x0, x20
100000f24:     	mov	x1, x21
100000f28:     	mov	x2, x22
100000f2c:     	bl	0x100000e44 <_coil.io.write-all>
100000f30:     	ldr	w0, [x29, #0x140]
100000f34:     	cmp	x0, #0x0
100000f38:     	b.eq	0x100000f74 <_coil.io.write-all+0x130>
100000f3c:     	cmp	x0, #0x1
100000f40:     	b.eq	0x100000f4c <_coil.io.write-all+0x108>
100000f44:     	b	0x100000f48 <_coil.io.write-all+0x104>
100000f48:     	b	0x100000fb0 <_coil.io.write-all+0x16c>
100000f4c:     	mov	w16, #0x148             ; =328
100000f50:     	ldr	q0, [x29, x16]
100000f54:     	str	q0, [x29, #0x160]
100000f58:     	mov	w0, #0x1                ; =1
100000f5c:     	str	w0, [x29, #0x170]
100000f60:     	ldr	q0, [x29, #0x160]
100000f64:     	mov	w16, #0x178             ; =376
100000f68:     	str	q0, [x29, x16]
100000f6c:     	add	x20, x29, #0x170
100000f70:     	b	0x100000f8c <_coil.io.write-all+0x148>
100000f74:     	ldr	x0, [x29, #0x148]
100000f78:     	str	wzr, [x29, #0x190]
100000f7c:     	ldr	x1, [x29, #0x1b8]
100000f80:     	add	x1, x1, x0
100000f84:     	str	x1, [x29, #0x198]
100000f88:     	add	x20, x29, #0x190
100000f8c:     	str	x20, [x29, #0x1c0]
100000f90:     	ldr	x0, [x29, #0x1c0]
100000f94:     	str	x0, [x29, #0x1b0]
100000f98:     	ldr	x23, [x29, #0x1b0]
100000f9c:     	ldr	q0, [x23]
100000fa0:     	str	q0, [x19]
100000fa4:     	ldr	x0, [x23, #0x10]
100000fa8:     	str	x0, [x19, #0x10]
100000fac:     	b	0x100000fb8 <_coil.io.write-all+0x174>
100000fb0:     	brk	#0x1
100000fb4:     	brk	#0x1
100000fb8:     	ldp	x19, x20, [sp, #0x10]
100000fbc:     	ldp	x21, x22, [sp, #0x20]
100000fc0:     	ldr	x23, [sp, #0x30]
100000fc4:     	ldp	x29, x30, [sp], #0x1d0
100000fc8:     	ret

0000000100000fcc <_coil.os.errno>:
100000fcc:     	stp	x29, x30, [sp, #-0xa0]!
100000fd0:     	mov	x29, sp
100000fd4:     	bl	0x1000014b4 <_coil.os.errno-cell>
100000fd8:     	ldrsw	x0, [x0]
100000fdc:     	ldp	x29, x30, [sp], #0xa0
100000fe0:     	ret

0000000100000fe4 <_coil.io.fd-retry?>:
100000fe4:     	stp	x29, x30, [sp, #-0xa0]!
100000fe8:     	mov	x29, sp
100000fec:     	stp	x19, x20, [sp, #0x10]
100000ff0:     	stp	x21, x22, [sp, #0x20]
100000ff4:     	mov	x19, x1
100000ff8:     	sxtw	x20, w0
100000ffc:     	sxth	x21, w2
100001000:     	cmp	x19, #0x4
100001004:     	b.ne	0x100001010 <_coil.io.fd-retry?+0x2c>
100001008:     	mov	w22, #0x1               ; =1
10000100c:     	b	0x100001038 <_coil.io.fd-retry?+0x54>
100001010:     	cmp	x19, #0x23
100001014:     	b.ne	0x100001030 <_coil.io.fd-retry?+0x4c>
100001018:     	mov	x0, x20
10000101c:     	mov	x1, x21
100001020:     	mov	x2, #-0x2               ; =-2
100001024:     	bl	0x1000014d4 <_coil.io.poll-one>
100001028:     	mov	x19, x0
10000102c:     	b	0x100001034 <_coil.io.fd-retry?+0x50>
100001030:     	mov	w19, #0x0               ; =0
100001034:     	mov	x22, x19
100001038:     	mov	x0, x22
10000103c:     	ldp	x19, x20, [sp, #0x10]
100001040:     	ldp	x21, x22, [sp, #0x20]
100001044:     	ldp	x29, x30, [sp], #0xa0
100001048:     	ret

000000010000104c <_stogir.opcode.properties>:
10000104c:     	stp	x29, x30, [sp, #-0xb0]!
100001050:     	mov	x29, sp
100001054:     	str	x19, [sp, #0x10]
100001058:     	sxtw	x19, w0
10000105c:     	mov	x0, x19
100001060:     	bl	0x10000157c <_stogir.opcode.valid?>
100001064:     	cbz	x0, 0x100001098 <_stogir.opcode.properties+0x4c>
100001068:     	adrp	x0, 0x100008000 <dyld_stub_binder+0x100008000>
10000106c:     	add	x0, x0, #0x10
100001070:     	str	x0, [x29, #0xa0]
100001074:     	mov	w0, #0x83               ; =131
100001078:     	str	x0, [x29, #0xa8]
10000107c:     	ldr	x0, [x29, #0xa0]
100001080:     	ldr	x1, [x29, #0xa8]
100001084:     	mov	x2, x19
100001088:     	bl	0x1000015c0 <_coil.core.Get$slice$get__u8>
10000108c:     	ubfx	x0, x0, #0, #8
100001090:     	mov	x19, x0
100001094:     	b	0x10000109c <_stogir.opcode.properties+0x50>
100001098:     	mov	w19, #0x0               ; =0
10000109c:     	mov	x0, x19
1000010a0:     	ldr	x19, [sp, #0x10]
1000010a4:     	ldp	x29, x30, [sp], #0xb0
1000010a8:     	ret

00000001000010ac <_coil.fmt.plain-format-spec>:
1000010ac:     	stp	x29, x30, [sp, #-0x140]!
1000010b0:     	mov	x29, sp
1000010b4:     	str	xzr, [x29, #0xd0]
1000010b8:     	str	xzr, [x29, #0xd8]
1000010bc:     	str	xzr, [x29, #0xe0]
1000010c0:     	str	xzr, [x29, #0xe8]
1000010c4:     	str	xzr, [x29, #0xf0]
1000010c8:     	ldr	q0, [x29, #0xd0]
1000010cc:     	str	q0, [x29, #0xa0]
1000010d0:     	ldr	q0, [x29, #0xe0]
1000010d4:     	str	q0, [x29, #0xb0]
1000010d8:     	ldr	x0, [x29, #0xf0]
1000010dc:     	str	x0, [x29, #0xc0]
1000010e0:     	mov	x0, #-0x1               ; =-1
1000010e4:     	str	x0, [x29, #0xa0]
1000010e8:     	mov	x0, #-0x1               ; =-1
1000010ec:     	str	x0, [x29, #0xa8]
1000010f0:     	mov	w0, #0x20               ; =32
1000010f4:     	str	w0, [x29, #0xb0]
1000010f8:     	str	wzr, [x29, #0x100]
1000010fc:     	ldr	x0, [x29, #0x100]
100001100:     	str	x0, [x29, #0xb8]
100001104:     	strb	wzr, [x29, #0xc0]
100001108:     	strb	wzr, [x29, #0xc1]
10000110c:     	ldr	q0, [x29, #0xa0]
100001110:     	str	q0, [x29, #0x110]
100001114:     	ldr	q0, [x29, #0xb0]
100001118:     	str	q0, [x29, #0x120]
10000111c:     	ldr	x0, [x29, #0xc0]
100001120:     	str	x0, [x29, #0x130]
100001124:     	ldr	q0, [x29, #0x110]
100001128:     	str	q0, [x8]
10000112c:     	ldr	q0, [x29, #0x120]
100001130:     	str	q0, [x8, #0x10]
100001134:     	ldr	x0, [x29, #0x130]
100001138:     	str	x0, [x8, #0x20]
10000113c:     	ldp	x29, x30, [sp], #0x140
100001140:     	ret

0000000100001144 <_inherent$coil.fmt.Formatter$writer>:
100001144:     	ldr	x0, [x0]
100001148:     	ret

000000010000114c <_inherent$coil.fmt.Formatter$take-spec!>:
10000114c:     	stp	x29, x30, [sp, #-0x100]!
100001150:     	mov	x29, sp
100001154:     	stp	x19, x20, [sp, #0x10]
100001158:     	mov	x19, x8
10000115c:     	mov	x20, x0
100001160:     	ldrb	w0, [x20, #0x40]
100001164:     	cbz	x0, 0x100001190 <_inherent$coil.fmt.Formatter$take-spec!+0x44>
100001168:     	strb	wzr, [x20, #0x40]
10000116c:     	add	x20, x20, #0x18
100001170:     	ldr	q0, [x20]
100001174:     	str	q0, [x29, #0xa0]
100001178:     	ldr	q0, [x20, #0x10]
10000117c:     	str	q0, [x29, #0xb0]
100001180:     	ldr	x0, [x20, #0x20]
100001184:     	str	x0, [x29, #0xc0]
100001188:     	add	x20, x29, #0xa0
10000118c:     	b	0x10000119c <_inherent$coil.fmt.Formatter$take-spec!+0x50>
100001190:     	add	x8, x29, #0xd0
100001194:     	bl	0x1000010ac <_coil.fmt.plain-format-spec>
100001198:     	add	x20, x29, #0xd0
10000119c:     	ldr	q0, [x20]
1000011a0:     	str	q0, [x19]
1000011a4:     	ldr	q0, [x20, #0x10]
1000011a8:     	str	q0, [x19, #0x10]
1000011ac:     	ldr	x0, [x20, #0x20]
1000011b0:     	str	x0, [x19, #0x20]
1000011b4:     	ldp	x19, x20, [sp, #0x10]
1000011b8:     	ldp	x29, x30, [sp], #0x100
1000011bc:     	ret

00000001000011c0 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits>:
1000011c0:     	stp	x29, x30, [sp, #-0x110]!
1000011c4:     	mov	x29, sp
1000011c8:     	stp	x19, x20, [sp, #0x10]
1000011cc:     	mov	x19, x0
1000011d0:     	mov	x20, x1
1000011d4:     	ldr	w0, [x19]
1000011d8:     	cmp	x0, #0x0
1000011dc:     	b.eq	0x1000011f8 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x38>
1000011e0:     	cmp	x0, #0x1
1000011e4:     	b.eq	0x100001214 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x54>
1000011e8:     	cmp	x0, #0x2
1000011ec:     	b.eq	0x100001230 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x70>
1000011f0:     	b	0x1000011f4 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0x34>
1000011f4:     	b	0x100001268 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xa8>
1000011f8:     	ldr	x0, [x19, #0x8]
1000011fc:     	add	x8, x29, #0xa0
100001200:     	mov	x9, x0
100001204:     	mov	x0, x20
100001208:     	mov	x1, x9
10000120c:     	bl	0x1000015f4 <_coil.fmt.print-u>
100001210:     	b	0x100001260 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xa0>
100001214:     	ldr	x0, [x19, #0x8]
100001218:     	add	x8, x29, #0xc0
10000121c:     	mov	x9, x0
100001220:     	mov	x0, x20
100001224:     	mov	x1, x9
100001228:     	bl	0x100001664 <_coil.fmt.print-uhex>
10000122c:     	b	0x100001260 <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xa0>
100001230:     	add	x19, x19, #0x8
100001234:     	ldr	q0, [x19]
100001238:     	str	q0, [x29, #0xe0]
10000123c:     	ldr	x0, [x29, #0xe0]
100001240:     	ldr	x1, [x29, #0xe8]
100001244:     	add	x8, x29, #0xf0
100001248:     	mov	x9, x0
10000124c:     	mov	x0, x20
100001250:     	mov	x10, x1
100001254:     	mov	x1, x9
100001258:     	mov	x2, x10
10000125c:     	bl	0x10000083c <_coil.io.print-str>
100001260:     	mov	w0, #0x0                ; =0
100001264:     	b	0x10000126c <_coil.fmt.NumberDigits$coil.fmt.IntDigits$print-digits+0xac>
100001268:     	brk	#0x1
10000126c:     	ldp	x19, x20, [sp, #0x10]
100001270:     	ldp	x29, x30, [sp], #0x110
100001274:     	ret

0000000100001278 <_coil.fmt.counting-writer>:
100001278:     	str	xzr, [x1]
10000127c:     	adrp	x2, 0x100001000 <_coil.io.fd-retry?+0x1c>
100001280:     	add	x2, x2, #0x6d4
100001284:     	str	x2, [x0]
100001288:     	str	x1, [x0, #0x8]
10000128c:     	ret

0000000100001290 <_coil.io.write-byte>:
100001290:     	stp	x29, x30, [sp, #-0xd0]!
100001294:     	mov	x29, sp
100001298:     	ubfx	x1, x1, #0, #8
10000129c:     	strb	w1, [x29, #0xa0]
1000012a0:     	mov	x9, x8
1000012a4:     	add	x8, x29, #0xb0
1000012a8:     	add	x1, x29, #0xa0
1000012ac:     	mov	w2, #0x1                ; =1
1000012b0:     	str	x9, [x29, #0xa8]
1000012b4:     	bl	0x100000e44 <_coil.io.write-all>
1000012b8:     	ldr	x0, [x29, #0xa8]
1000012bc:     	ldr	q0, [x29, #0xb0]
1000012c0:     	str	q0, [x0]
1000012c4:     	ldr	x1, [x29, #0xc0]
1000012c8:     	str	x1, [x0, #0x10]
1000012cc:     	ldp	x29, x30, [sp], #0xd0
1000012d0:     	ret

00000001000012d4 <_coil.fmt.fmt--pad-before>:
1000012d4:     	stp	x29, x30, [sp, #-0xb0]!
1000012d8:     	mov	x29, sp
1000012dc:     	stp	x19, x20, [sp, #0x10]
1000012e0:     	stp	x21, x22, [sp, #0x20]
1000012e4:     	mov	x19, x0
1000012e8:     	mov	x20, x1
1000012ec:     	mov	x21, x3
1000012f0:     	ldr	x0, [x20]
1000012f4:     	sub	x22, x0, x2
1000012f8:     	cmp	x22, #0x0
1000012fc:     	b.le	0x100001390 <_coil.fmt.fmt--pad-before+0xbc>
100001300:     	add	x0, x20, #0x18
100001304:     	ldr	x1, [x0]
100001308:     	str	x1, [x29, #0xa0]
10000130c:     	ldr	w0, [x29, #0xa0]
100001310:     	cmp	x0, #0x0
100001314:     	b.eq	0x100001370 <_coil.fmt.fmt--pad-before+0x9c>
100001318:     	cmp	x0, #0x1
10000131c:     	b.eq	0x10000136c <_coil.fmt.fmt--pad-before+0x98>
100001320:     	cmp	x0, #0x2
100001324:     	b.eq	0x100001338 <_coil.fmt.fmt--pad-before+0x64>
100001328:     	cmp	x0, #0x3
10000132c:     	b.eq	0x10000134c <_coil.fmt.fmt--pad-before+0x78>
100001330:     	b	0x100001334 <_coil.fmt.fmt--pad-before+0x60>
100001334:     	b	0x10000138c <_coil.fmt.fmt--pad-before+0xb8>
100001338:     	mov	x0, x19
10000133c:     	mov	x1, x20
100001340:     	mov	x2, x22
100001344:     	bl	0x100001708 <_coil.fmt.fmt--fill>
100001348:     	b	0x100001388 <_coil.fmt.fmt--pad-before+0xb4>
10000134c:     	mov	w0, #0x2                ; =2
100001350:     	sdiv	x1, x22, x0
100001354:     	mov	x0, x19
100001358:     	mov	x9, x1
10000135c:     	mov	x1, x20
100001360:     	mov	x2, x9
100001364:     	bl	0x100001708 <_coil.fmt.fmt--fill>
100001368:     	b	0x100001388 <_coil.fmt.fmt--pad-before+0xb4>
10000136c:     	b	0x100001388 <_coil.fmt.fmt--pad-before+0xb4>
100001370:     	cbz	x21, 0x100001378 <_coil.fmt.fmt--pad-before+0xa4>
100001374:     	b	0x100001388 <_coil.fmt.fmt--pad-before+0xb4>
100001378:     	mov	x0, x19
10000137c:     	mov	x1, x20
100001380:     	mov	x2, x22
100001384:     	bl	0x100001708 <_coil.fmt.fmt--fill>
100001388:     	b	0x100001390 <_coil.fmt.fmt--pad-before+0xbc>
10000138c:     	brk	#0x1
100001390:     	mov	w0, #0x0                ; =0
100001394:     	ldp	x19, x20, [sp, #0x10]
100001398:     	ldp	x21, x22, [sp, #0x20]
10000139c:     	ldp	x29, x30, [sp], #0xb0
1000013a0:     	ret

00000001000013a4 <_coil.fmt.fmt--pad-after>:
1000013a4:     	stp	x29, x30, [sp, #-0xb0]!
1000013a8:     	mov	x29, sp
1000013ac:     	stp	x19, x20, [sp, #0x10]
1000013b0:     	stp	x21, x22, [sp, #0x20]
1000013b4:     	mov	x19, x0
1000013b8:     	mov	x20, x1
1000013bc:     	mov	x21, x3
1000013c0:     	ldr	x0, [x20]
1000013c4:     	sub	x22, x0, x2
1000013c8:     	cmp	x22, #0x0
1000013cc:     	b.le	0x100001464 <_coil.fmt.fmt--pad-after+0xc0>
1000013d0:     	add	x0, x20, #0x18
1000013d4:     	ldr	x1, [x0]
1000013d8:     	str	x1, [x29, #0xa0]
1000013dc:     	ldr	w0, [x29, #0xa0]
1000013e0:     	cmp	x0, #0x0
1000013e4:     	b.eq	0x100001444 <_coil.fmt.fmt--pad-after+0xa0>
1000013e8:     	cmp	x0, #0x1
1000013ec:     	b.eq	0x100001408 <_coil.fmt.fmt--pad-after+0x64>
1000013f0:     	cmp	x0, #0x2
1000013f4:     	b.eq	0x100001440 <_coil.fmt.fmt--pad-after+0x9c>
1000013f8:     	cmp	x0, #0x3
1000013fc:     	b.eq	0x10000141c <_coil.fmt.fmt--pad-after+0x78>
100001400:     	b	0x100001404 <_coil.fmt.fmt--pad-after+0x60>
100001404:     	b	0x100001460 <_coil.fmt.fmt--pad-after+0xbc>
100001408:     	mov	x0, x19
10000140c:     	mov	x1, x20
100001410:     	mov	x2, x22
100001414:     	bl	0x100001708 <_coil.fmt.fmt--fill>
100001418:     	b	0x10000145c <_coil.fmt.fmt--pad-after+0xb8>
10000141c:     	mov	w0, #0x2                ; =2
100001420:     	sdiv	x1, x22, x0
100001424:     	sub	x0, x22, x1
100001428:     	mov	x9, x0
10000142c:     	mov	x0, x19
100001430:     	mov	x1, x20
100001434:     	mov	x2, x9
100001438:     	bl	0x100001708 <_coil.fmt.fmt--fill>
10000143c:     	b	0x10000145c <_coil.fmt.fmt--pad-after+0xb8>
100001440:     	b	0x10000145c <_coil.fmt.fmt--pad-after+0xb8>
100001444:     	cbz	x21, 0x10000145c <_coil.fmt.fmt--pad-after+0xb8>
100001448:     	mov	x0, x19
10000144c:     	mov	x1, x20
100001450:     	mov	x2, x22
100001454:     	bl	0x100001708 <_coil.fmt.fmt--fill>
100001458:     	b	0x10000145c <_coil.fmt.fmt--pad-after+0xb8>
10000145c:     	b	0x100001464 <_coil.fmt.fmt--pad-after+0xc0>
100001460:     	brk	#0x1
100001464:     	mov	w0, #0x0                ; =0
100001468:     	ldp	x19, x20, [sp, #0x10]
10000146c:     	ldp	x21, x22, [sp, #0x20]
100001470:     	ldp	x29, x30, [sp], #0xb0
100001474:     	ret

0000000100001478 <_coil.io.write-some>:
100001478:     	stp	x29, x30, [sp, #-0xd0]!
10000147c:     	mov	x29, sp
100001480:     	ldr	x3, [x0]
100001484:     	ldr	x0, [x0, #0x8]
100001488:     	mov	x9, x8
10000148c:     	add	x8, x29, #0xa0
100001490:     	str	x9, [x29, #0xc0]
100001494:     	blr	x3
100001498:     	ldr	x0, [x29, #0xc0]
10000149c:     	ldr	q0, [x29, #0xa0]
1000014a0:     	str	q0, [x0]
1000014a4:     	ldr	x1, [x29, #0xb0]
1000014a8:     	str	x1, [x0, #0x10]
1000014ac:     	ldp	x29, x30, [sp], #0xd0
1000014b0:     	ret

00000001000014b4 <_coil.os.errno-cell>:
1000014b4:     	stp	x29, x30, [sp, #-0xa0]!
1000014b8:     	mov	x29, sp
1000014bc:     	adrp	x0, 0x100001000 <_coil.io.fd-retry?+0x1c>
1000014c0:     	add	x0, x0, #0xaf9
1000014c4:     	mov	x1, #-0x2               ; =-2
1000014c8:     	bl	0x1000017f4 <_coil.os.dlsym-errno-cell>
1000014cc:     	ldp	x29, x30, [sp], #0xa0
1000014d0:     	ret

00000001000014d4 <_coil.io.poll-one>:
1000014d4:     	stp	x29, x30, [sp, #-0xc0]!
1000014d8:     	mov	x29, sp
1000014dc:     	stp	x19, x20, [sp, #0x10]
1000014e0:     	sxtw	x0, w0
1000014e4:     	sxth	x1, w1
1000014e8:     	mov	x9, x0
1000014ec:     	adrp	x0, 0x100008000 <dyld_stub_binder+0x100008000>
1000014f0:     	add	x0, x0, #0xa8
1000014f4:     	mov	x10, x1
1000014f8:     	adrp	x1, 0x100001000 <_coil.io.fd-retry?+0x1c>
1000014fc:     	add	x1, x1, #0xb01
100001500:     	str	x9, [x29, #0xa8]
100001504:     	str	x10, [x29, #0xb0]
100001508:     	bl	0x100001824 <_coil.os.dlsym-cached>
10000150c:     	mov	x19, x0
100001510:     	ldr	x0, [x29, #0xa8]
100001514:     	str	w0, [x29, #0xa0]
100001518:     	ldr	x0, [x29, #0xb0]
10000151c:     	strh	w0, [x29, #0xa4]
100001520:     	strh	wzr, [x29, #0xa6]
100001524:     	cmp	x19, #0x0
100001528:     	b.ne	0x100001534 <_coil.io.poll-one+0x60>
10000152c:     	mov	w20, #0x0               ; =0
100001530:     	b	0x10000156c <_coil.io.poll-one+0x98>
100001534:     	add	x0, x29, #0xa0
100001538:     	mov	w1, #0x1                ; =1
10000153c:     	mov	x2, #-0x1               ; =-1
100001540:     	blr	x19
100001544:     	sxtw	x0, w0
100001548:     	cmp	x0, #0x0
10000154c:     	b.lt	0x100001558 <_coil.io.poll-one+0x84>
100001550:     	mov	w19, #0x1               ; =1
100001554:     	b	0x100001568 <_coil.io.poll-one+0x94>
100001558:     	bl	0x100000fcc <_coil.os.errno>
10000155c:     	cmp	x0, #0x4
100001560:     	cset	x0, eq
100001564:     	mov	x19, x0
100001568:     	mov	x20, x19
10000156c:     	mov	x0, x20
100001570:     	ldp	x19, x20, [sp, #0x10]
100001574:     	ldp	x29, x30, [sp], #0xc0
100001578:     	ret

000000010000157c <_stogir.opcode.valid?>:
10000157c:     	stp	x29, x30, [sp, #-0xa0]!
100001580:     	mov	x29, sp
100001584:     	str	x19, [sp, #0x10]
100001588:     	sxtw	x19, w0
10000158c:     	cmp	x19, #0x0
100001590:     	b.lt	0x1000015ac <_stogir.opcode.valid?+0x30>
100001594:     	bl	0x100001894 <_stogir.opcode.count>
100001598:     	sxtw	x0, w0
10000159c:     	cmp	x19, x0
1000015a0:     	cset	x0, lt
1000015a4:     	mov	x19, x0
1000015a8:     	b	0x1000015b0 <_stogir.opcode.valid?+0x34>
1000015ac:     	mov	w19, #0x0               ; =0
1000015b0:     	mov	x0, x19
1000015b4:     	ldr	x19, [sp, #0x10]
1000015b8:     	ldp	x29, x30, [sp], #0xa0
1000015bc:     	ret

00000001000015c0 <_coil.core.Get$slice$get__u8>:
1000015c0:     	stp	x29, x30, [sp, #-0xc0]!
1000015c4:     	mov	x29, sp
1000015c8:     	str	x0, [x29, #0xa0]
1000015cc:     	str	x1, [x29, #0xa8]
1000015d0:     	ldr	x0, [x29, #0xa0]
1000015d4:     	ldr	x1, [x29, #0xa8]
1000015d8:     	str	x2, [x29, #0xb0]
1000015dc:     	bl	0x100000e0c <_inherent$slice$data__u8>
1000015e0:     	ldr	x1, [x29, #0xb0]
1000015e4:     	add	x0, x0, x1
1000015e8:     	ldrb	w0, [x0]
1000015ec:     	ldp	x29, x30, [sp], #0xc0
1000015f0:     	ret

00000001000015f4 <_coil.fmt.print-u>:
1000015f4:     	stp	x29, x30, [sp, #-0xe0]!
1000015f8:     	mov	x29, sp
1000015fc:     	stp	x19, x20, [sp, #0x10]
100001600:     	stp	x21, x22, [sp, #0x20]
100001604:     	mov	x19, x8
100001608:     	mov	x20, x0
10000160c:     	mov	x21, x1
100001610:     	cmp	x21, #0x0
100001614:     	b.ne	0x100001630 <_coil.fmt.print-u+0x3c>
100001618:     	add	x8, x29, #0xa0
10000161c:     	mov	x0, x20
100001620:     	mov	w1, #0x30               ; =48
100001624:     	bl	0x100001290 <_coil.io.write-byte>
100001628:     	add	x22, x29, #0xa0
10000162c:     	b	0x100001644 <_coil.fmt.print-u+0x50>
100001630:     	add	x8, x29, #0xc0
100001634:     	mov	x0, x20
100001638:     	mov	x1, x21
10000163c:     	bl	0x10000189c <_coil.fmt.udec-digits>
100001640:     	add	x22, x29, #0xc0
100001644:     	ldr	q0, [x22]
100001648:     	str	q0, [x19]
10000164c:     	ldr	x0, [x22, #0x10]
100001650:     	str	x0, [x19, #0x10]
100001654:     	ldp	x19, x20, [sp, #0x10]
100001658:     	ldp	x21, x22, [sp, #0x20]
10000165c:     	ldp	x29, x30, [sp], #0xe0
100001660:     	ret

0000000100001664 <_coil.fmt.print-uhex>:
100001664:     	stp	x29, x30, [sp, #-0xe0]!
100001668:     	mov	x29, sp
10000166c:     	stp	x19, x20, [sp, #0x10]
100001670:     	stp	x21, x22, [sp, #0x20]
100001674:     	mov	x19, x8
100001678:     	mov	x20, x0
10000167c:     	mov	x21, x1
100001680:     	cmp	x21, #0x0
100001684:     	b.ne	0x1000016a0 <_coil.fmt.print-uhex+0x3c>
100001688:     	add	x8, x29, #0xa0
10000168c:     	mov	x0, x20
100001690:     	mov	w1, #0x30               ; =48
100001694:     	bl	0x100001290 <_coil.io.write-byte>
100001698:     	add	x22, x29, #0xa0
10000169c:     	b	0x1000016b4 <_coil.fmt.print-uhex+0x50>
1000016a0:     	add	x8, x29, #0xc0
1000016a4:     	mov	x0, x20
1000016a8:     	mov	x1, x21
1000016ac:     	bl	0x100001980 <_coil.fmt.uhex-digits>
1000016b0:     	add	x22, x29, #0xc0
1000016b4:     	ldr	q0, [x22]
1000016b8:     	str	q0, [x19]
1000016bc:     	ldr	x0, [x22, #0x10]
1000016c0:     	str	x0, [x19, #0x10]
1000016c4:     	ldp	x19, x20, [sp, #0x10]
1000016c8:     	ldp	x21, x22, [sp, #0x20]
1000016cc:     	ldp	x29, x30, [sp], #0xe0
1000016d0:     	ret

00000001000016d4 <_coil.fmt.count--write>:
1000016d4:     	stp	x29, x30, [sp, #-0xc0]!
1000016d8:     	mov	x29, sp
1000016dc:     	ldr	x1, [x0]
1000016e0:     	add	x1, x1, x2
1000016e4:     	str	x1, [x0]
1000016e8:     	str	wzr, [x29, #0xa0]
1000016ec:     	str	x2, [x29, #0xa8]
1000016f0:     	ldr	q0, [x29, #0xa0]
1000016f4:     	str	q0, [x8]
1000016f8:     	ldr	x0, [x29, #0xb0]
1000016fc:     	str	x0, [x8, #0x10]
100001700:     	ldp	x29, x30, [sp], #0xc0
100001704:     	ret

0000000100001708 <_coil.fmt.fmt--fill>:
100001708:     	stp	x29, x30, [sp, #-0x120]!
10000170c:     	mov	x29, sp
100001710:     	stp	x19, x20, [sp, #0x10]
100001714:     	mov	w3, #0x0                ; =0
100001718:     	sub	x3, x3, #0x1
10000171c:     	str	x0, [x29, #0xc8]
100001720:     	str	x1, [x29, #0xf0]
100001724:     	str	x2, [x29, #0xf8]
100001728:     	str	x3, [x29, #0x100]
10000172c:     	ldr	x0, [x29, #0x100]
100001730:     	add	x1, x0, #0x1
100001734:     	ldr	x2, [x29, #0xf8]
100001738:     	cmp	x1, x2
10000173c:     	b.ge	0x1000017e4 <_coil.fmt.fmt--fill+0xdc>
100001740:     	ldr	x3, [x29, #0xf0]
100001744:     	ldr	w4, [x3, #0x10]
100001748:     	and	x5, x4, #0xff
10000174c:     	ubfx	x5, x5, #0, #32
100001750:     	ubfx	x5, x5, #0, #8
100001754:     	add	x8, x29, #0xa0
100001758:     	mov	x9, x0
10000175c:     	ldr	x0, [x29, #0xc8]
100001760:     	mov	x10, x1
100001764:     	mov	x1, x5
100001768:     	str	x4, [x29, #0x108]
10000176c:     	str	x10, [x29, #0x110]
100001770:     	bl	0x100001290 <_coil.io.write-byte>
100001774:     	ldr	x19, [x29, #0x108]
100001778:     	lsr	x0, x19, #8
10000177c:     	ubfx	x0, x0, #0, #32
100001780:     	str	w0, [x29, #0xc0]
100001784:     	str	wzr, [x29, #0xc4]
100001788:     	ldr	w0, [x29, #0xc0]
10000178c:     	ldr	w1, [x29, #0xc4]
100001790:     	cmp	x0, x1
100001794:     	b.ne	0x1000017a0 <_coil.fmt.fmt--fill+0x98>
100001798:     	mov	w20, #0x0               ; =0
10000179c:     	b	0x1000017a4 <_coil.fmt.fmt--fill+0x9c>
1000017a0:     	mov	w20, #0x1               ; =1
1000017a4:     	cbz	x20, 0x1000017d8 <_coil.fmt.fmt--fill+0xd0>
1000017a8:     	lsr	x0, x19, #8
1000017ac:     	ubfx	x20, x0, #0, #32
1000017b0:     	and	x0, x20, #0xff
1000017b4:     	ubfx	x0, x0, #0, #32
1000017b8:     	ubfx	x0, x0, #0, #8
1000017bc:     	add	x8, x29, #0xd0
1000017c0:     	mov	x9, x0
1000017c4:     	ldr	x0, [x29, #0xc8]
1000017c8:     	mov	x1, x9
1000017cc:     	bl	0x100001290 <_coil.io.write-byte>
1000017d0:     	mov	x19, x20
1000017d4:     	b	0x100001778 <_coil.fmt.fmt--fill+0x70>
1000017d8:     	ldr	x0, [x29, #0x110]
1000017dc:     	str	x0, [x29, #0x100]
1000017e0:     	b	0x10000172c <_coil.fmt.fmt--fill+0x24>
1000017e4:     	mov	w0, #0x0                ; =0
1000017e8:     	ldp	x19, x20, [sp, #0x10]
1000017ec:     	ldp	x29, x30, [sp], #0x120
1000017f0:     	ret

00000001000017f4 <_coil.os.dlsym-errno-cell>:
1000017f4:     	stp	x29, x30, [sp, #-0xa0]!
1000017f8:     	mov	x29, sp
1000017fc:     	mov	x9, x0
100001800:     	adrp	x0, 0x100008000 <dyld_stub_binder+0x100008000>
100001804:     	add	x0, x0, #0xb0
100001808:     	mov	x10, x1
10000180c:     	mov	x1, x9
100001810:     	mov	x2, x10
100001814:     	bl	0x100001824 <_coil.os.dlsym-cached>
100001818:     	blr	x0
10000181c:     	ldp	x29, x30, [sp], #0xa0
100001820:     	ret

0000000100001824 <_coil.os.dlsym-cached>:
100001824:     	stp	x29, x30, [sp, #-0xb0]!
100001828:     	mov	x29, sp
10000182c:     	stp	x19, x20, [sp, #0x10]
100001830:     	stp	x21, x22, [sp, #0x20]
100001834:     	mov	x19, x0
100001838:     	mov	x20, x1
10000183c:     	mov	x21, x2
100001840:     	mov	x0, x19
100001844:     	bl	0x100001a84 <_coil.atomic.read-ptr__i8>
100001848:     	mov	x22, x0
10000184c:     	cmp	x22, #0x0
100001850:     	b.ne	0x10000187c <_coil.os.dlsym-cached+0x58>
100001854:     	mov	x0, x21
100001858:     	mov	x1, x20
10000185c:     	bl	0x100001a9c <dyld_stub_binder+0x100001a9c>
100001860:     	mov	x9, x0
100001864:     	mov	x0, x19
100001868:     	mov	x1, x9
10000186c:     	str	x9, [x29, #0xa0]
100001870:     	bl	0x100001a90 <_coil.atomic.store-ptr__i8>
100001874:     	ldr	x19, [x29, #0xa0]
100001878:     	b	0x100001880 <_coil.os.dlsym-cached+0x5c>
10000187c:     	mov	x19, x22
100001880:     	mov	x0, x19
100001884:     	ldp	x19, x20, [sp, #0x10]
100001888:     	ldp	x21, x22, [sp, #0x20]
10000188c:     	ldp	x29, x30, [sp], #0xb0
100001890:     	ret

0000000100001894 <_stogir.opcode.count>:
100001894:     	mov	w0, #0x83               ; =131
100001898:     	ret

000000010000189c <_coil.fmt.udec-digits>:
10000189c:     	stp	x29, x30, [sp, #-0x130]!
1000018a0:     	mov	x29, sp
1000018a4:     	stp	x19, x20, [sp, #0x10]
1000018a8:     	stp	x21, x22, [sp, #0x20]
1000018ac:     	str	x23, [sp, #0x30]
1000018b0:     	mov	x19, x8
1000018b4:     	mov	x20, x0
1000018b8:     	mov	x21, x1
1000018bc:     	cmp	x21, #0x0
1000018c0:     	b.ne	0x1000018d4 <_coil.fmt.udec-digits+0x38>
1000018c4:     	str	wzr, [x29, #0xa0]
1000018c8:     	str	xzr, [x29, #0xa8]
1000018cc:     	add	x22, x29, #0xa0
1000018d0:     	b	0x100001954 <_coil.fmt.udec-digits+0xb8>
1000018d4:     	mov	w0, #0xa                ; =10
1000018d8:     	udiv	x1, x21, x0
1000018dc:     	add	x8, x29, #0xc0
1000018e0:     	mov	x0, x20
1000018e4:     	bl	0x10000189c <_coil.fmt.udec-digits>
1000018e8:     	ldr	w0, [x29, #0xc0]
1000018ec:     	cmp	x0, #0x0
1000018f0:     	b.eq	0x100001924 <_coil.fmt.udec-digits+0x88>
1000018f4:     	cmp	x0, #0x1
1000018f8:     	b.eq	0x100001904 <_coil.fmt.udec-digits+0x68>
1000018fc:     	b	0x100001900 <_coil.fmt.udec-digits+0x64>
100001900:     	b	0x100001968 <_coil.fmt.udec-digits+0xcc>
100001904:     	ldur	q0, [x29, #0xc8]
100001908:     	str	q0, [x29, #0xe0]
10000190c:     	mov	w0, #0x1                ; =1
100001910:     	str	w0, [x29, #0xf0]
100001914:     	ldr	q0, [x29, #0xe0]
100001918:     	stur	q0, [x29, #0xf8]
10000191c:     	add	x23, x29, #0xf0
100001920:     	b	0x100001950 <_coil.fmt.udec-digits+0xb4>
100001924:     	ldr	x0, [x29, #0xc8]
100001928:     	mov	w0, #0xa                ; =10
10000192c:     	udiv	x1, x21, x0
100001930:     	msub	x2, x1, x0, x21
100001934:     	add	x2, x2, #0x30
100001938:     	ubfx	x2, x2, #0, #8
10000193c:     	add	x8, x29, #0x110
100001940:     	mov	x0, x20
100001944:     	mov	x1, x2
100001948:     	bl	0x100001290 <_coil.io.write-byte>
10000194c:     	add	x23, x29, #0x110
100001950:     	mov	x22, x23
100001954:     	ldr	q0, [x22]
100001958:     	str	q0, [x19]
10000195c:     	ldr	x0, [x22, #0x10]
100001960:     	str	x0, [x19, #0x10]
100001964:     	b	0x10000196c <_coil.fmt.udec-digits+0xd0>
100001968:     	brk	#0x1
10000196c:     	ldp	x19, x20, [sp, #0x10]
100001970:     	ldp	x21, x22, [sp, #0x20]
100001974:     	ldr	x23, [sp, #0x30]
100001978:     	ldp	x29, x30, [sp], #0x130
10000197c:     	ret

0000000100001980 <_coil.fmt.uhex-digits>:
100001980:     	stp	x29, x30, [sp, #-0x140]!
100001984:     	mov	x29, sp
100001988:     	stp	x19, x20, [sp, #0x10]
10000198c:     	stp	x21, x22, [sp, #0x20]
100001990:     	str	x23, [sp, #0x30]
100001994:     	mov	x19, x8
100001998:     	mov	x20, x0
10000199c:     	mov	x21, x1
1000019a0:     	cmp	x21, #0x0
1000019a4:     	b.ne	0x1000019b8 <_coil.fmt.uhex-digits+0x38>
1000019a8:     	str	wzr, [x29, #0xa0]
1000019ac:     	str	xzr, [x29, #0xa8]
1000019b0:     	add	x22, x29, #0xa0
1000019b4:     	b	0x100001a58 <_coil.fmt.uhex-digits+0xd8>
1000019b8:     	mov	w0, #0x10               ; =16
1000019bc:     	udiv	x1, x21, x0
1000019c0:     	add	x8, x29, #0xc0
1000019c4:     	mov	x0, x20
1000019c8:     	bl	0x100001980 <_coil.fmt.uhex-digits>
1000019cc:     	ldr	w0, [x29, #0xc0]
1000019d0:     	cmp	x0, #0x0
1000019d4:     	b.eq	0x100001a08 <_coil.fmt.uhex-digits+0x88>
1000019d8:     	cmp	x0, #0x1
1000019dc:     	b.eq	0x1000019e8 <_coil.fmt.uhex-digits+0x68>
1000019e0:     	b	0x1000019e4 <_coil.fmt.uhex-digits+0x64>
1000019e4:     	b	0x100001a6c <_coil.fmt.uhex-digits+0xec>
1000019e8:     	ldur	q0, [x29, #0xc8]
1000019ec:     	str	q0, [x29, #0xe0]
1000019f0:     	mov	w0, #0x1                ; =1
1000019f4:     	str	w0, [x29, #0xf0]
1000019f8:     	ldr	q0, [x29, #0xe0]
1000019fc:     	stur	q0, [x29, #0xf8]
100001a00:     	add	x23, x29, #0xf0
100001a04:     	b	0x100001a54 <_coil.fmt.uhex-digits+0xd4>
100001a08:     	ldr	x0, [x29, #0xc8]
100001a0c:     	mov	w0, #0x10               ; =16
100001a10:     	udiv	x1, x21, x0
100001a14:     	msub	x2, x1, x0, x21
100001a18:     	cmp	x2, #0xa
100001a1c:     	str	x2, [x29, #0x130]
100001a20:     	b.ge	0x100001a30 <_coil.fmt.uhex-digits+0xb0>
100001a24:     	add	x0, x2, #0x30
100001a28:     	mov	x21, x0
100001a2c:     	b	0x100001a3c <_coil.fmt.uhex-digits+0xbc>
100001a30:     	ldr	x0, [x29, #0x130]
100001a34:     	add	x0, x0, #0x57
100001a38:     	mov	x21, x0
100001a3c:     	ubfx	x21, x21, #0, #8
100001a40:     	add	x8, x29, #0x110
100001a44:     	mov	x0, x20
100001a48:     	mov	x1, x21
100001a4c:     	bl	0x100001290 <_coil.io.write-byte>
100001a50:     	add	x23, x29, #0x110
100001a54:     	mov	x22, x23
100001a58:     	ldr	q0, [x22]
100001a5c:     	str	q0, [x19]
100001a60:     	ldr	x0, [x22, #0x10]
100001a64:     	str	x0, [x19, #0x10]
100001a68:     	b	0x100001a70 <_coil.fmt.uhex-digits+0xf0>
100001a6c:     	brk	#0x1
100001a70:     	ldp	x19, x20, [sp, #0x10]
100001a74:     	ldp	x21, x22, [sp, #0x20]
100001a78:     	ldr	x23, [sp, #0x30]
100001a7c:     	ldp	x29, x30, [sp], #0x140
100001a80:     	ret

0000000100001a84 <_coil.atomic.read-ptr__i8>:
100001a84:     	ldar	x1, [x0]
100001a88:     	mov	x0, x1
100001a8c:     	ret

0000000100001a90 <_coil.atomic.store-ptr__i8>:
100001a90:     	stlr	x1, [x0]
100001a94:     	mov	w0, #0x0                ; =0
100001a98:     	ret

Disassembly of section __TEXT,__stubs:

0000000100001a9c <__stubs>:
100001a9c:     	adrp	x16, 0x100008000 <dyld_stub_binder+0x100008000>
100001aa0:     	ldr	x16, [x16]
100001aa4:     	br	x16
100001aa8:     	adrp	x16, 0x100008000 <dyld_stub_binder+0x100008000>
100001aac:     	ldr	x16, [x16, #0x8]
100001ab0:     	br	x16

Disassembly of section __TEXT,__stub_helper:

0000000100001ab4 <__stub_helper>:
100001ab4:     	adrp	x17, 0x100008000 <dyld_stub_binder+0x100008000>
100001ab8:     	add	x17, x17, #0xb8
100001abc:     	stp	x16, x17, [sp, #-0x10]!
100001ac0:     	adrp	x16, 0x100004000 <dyld_stub_binder+0x100004000>
100001ac4:     	ldr	x16, [x16]
100001ac8:     	br	x16
100001acc:     	ldr	w16, 0x100001ad4 <__stub_helper+0x20>
100001ad0:     	b	0x100001ab4 <__stub_helper>
100001ad4:     	udf	#0x0
100001ad8:     	ldr	w16, 0x100001ae0 <__stub_helper+0x2c>
100001adc:     	b	0x100001ab4 <__stub_helper>
100001ae0:     	udf	#0xd
