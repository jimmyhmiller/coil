
/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/build/aggregate-get-memory-forward/before:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001000005a0 <_gap_aggregate_get>:
1000005a0:     	sub	sp, sp, #0x10
1000005a4:     	str	x29, [sp]
1000005a8:     	str	x30, [sp, #0x8]
1000005ac:     	mov	x29, sp
1000005b0:     	sub	sp, sp, #0x10
1000005b4:     	mov	x2, sp
1000005b8:     	lsl	x1, x1, #4
1000005bc:     	ldr	x0, [x0]
1000005c0:     	orr	x3, x2, xzr
1000005c4:     	add	x4, x2, #0x4
1000005c8:     	add	x5, x2, #0x8
1000005cc:     	add	x2, x2, #0xc
1000005d0:     	add	x0, x1, x0
1000005d4:     	ldr	x1, [x0]
1000005d8:     	ldr	x0, [x0, #0x8]
1000005dc:     	str	x1, [x3]
1000005e0:     	str	x0, [x3, #0x8]
1000005e4:     	ldr	w0, [x4]
1000005e8:     	sxtw	x0, w0
1000005ec:     	ldr	w1, [x5]
1000005f0:     	sxtw	x1, w1
1000005f4:     	ldr	w2, [x2]
1000005f8:     	add	x0, x1, x0
1000005fc:     	sxtw	x1, w2
100000600:     	add	x0, x1, x0
100000604:     	sub	sp, x29, #0x0
100000608:     	ldr	x29, [sp]
10000060c:     	ldr	x30, [sp, #0x8]
100000610:     	add	sp, sp, #0x10
100000614:     	ret

0000000100000618 <_coil.alloc.Allocator$coil.alloc.MallocAllocator$allocate>:
100000618:     	sub	sp, sp, #0x20
10000061c:     	stp	x29, x30, [sp, #0x10]
100000620:     	add	x29, sp, #0x10
100000624:     	mov	x8, x1
100000628:     	ldr	x1, [x1, #0x18]
10000062c:     	ldr	x2, [x8, #0x10]
100000630:     	cmp	x1, #0x10
100000634:     	b.gt	0x100000658 <_coil.alloc.Allocator$coil.alloc.MallocAllocator$allocate+0x40>
100000638:     	mov	x0, x2
10000063c:     	bl	0x100000d50 <_write+0x100000d50>
100000640:     	cmp	x0, #0x0
100000644:     	csel	x1, x8, x0, eq
100000648:     	cset	x0, ne
10000064c:     	ldp	x29, x30, [sp, #0x10]
100000650:     	add	sp, sp, #0x20
100000654:     	ret
100000658:     	add	x0, sp, #0x8
10000065c:     	str	xzr, [sp, #0x8]
100000660:     	bl	0x100000d68 <_write+0x100000d68>
100000664:     	cbz	w0, 0x100000678 <_coil.alloc.Allocator$coil.alloc.MallocAllocator$allocate+0x60>
100000668:     	mov	x0, xzr
10000066c:     	ldp	x29, x30, [sp, #0x10]
100000670:     	add	sp, sp, #0x20
100000674:     	ret
100000678:     	ldr	x1, [sp, #0x8]
10000067c:     	mov	w0, #0x1                ; =1
100000680:     	ldp	x29, x30, [sp, #0x10]
100000684:     	add	sp, sp, #0x20
100000688:     	ret

000000010000068c <_coil.alloc.Allocator$coil.alloc.MallocAllocator$deallocate>:
10000068c:     	stp	x29, x30, [sp, #-0x10]!
100000690:     	mov	x0, x1
100000694:     	mov	x29, sp
100000698:     	bl	0x100000d44 <_write+0x100000d44>
10000069c:     	mov	x0, xzr
1000006a0:     	ldp	x29, x30, [sp], #0x10
1000006a4:     	ret

00000001000006a8 <_coil.alloc.Allocator$coil.alloc.MallocAllocator$remap>:
1000006a8:     	ldr	x8, [x3, #0x18]
1000006ac:     	cmp	x8, #0x11
1000006b0:     	b.lt	0x1000006bc <_coil.alloc.Allocator$coil.alloc.MallocAllocator$remap+0x14>
1000006b4:     	mov	x0, xzr
1000006b8:     	ret
1000006bc:     	stp	x29, x30, [sp, #-0x10]!
1000006c0:     	ldr	x8, [x3, #0x10]
1000006c4:     	mov	x0, x1
1000006c8:     	mov	x29, sp
1000006cc:     	mov	x1, x8
1000006d0:     	bl	0x100000d74 <_write+0x100000d74>
1000006d4:     	cmp	x0, #0x0
1000006d8:     	csel	x1, x8, x0, eq
1000006dc:     	cset	x0, ne
1000006e0:     	ldp	x29, x30, [sp], #0x10
1000006e4:     	ret

00000001000006e8 <_coil.alloc.Allocator$coil.alloc.MallocAllocator$resize>:
1000006e8:     	ldr	x8, [x3, #0x10]
1000006ec:     	ldr	x9, [x2, #0x10]
1000006f0:     	cmp	x8, x9
1000006f4:     	cset	w0, le
1000006f8:     	ret

00000001000006fc <_coil.alloc.oom-puts>:
1000006fc:     	stp	x20, x19, [sp, #-0x20]!
100000700:     	stp	x29, x30, [sp, #0x10]
100000704:     	add	x29, sp, #0x10
100000708:     	mov	x19, x0
10000070c:     	bl	0x100000d80 <_write+0x100000d80>
100000710:     	ldp	x29, x30, [sp, #0x10]
100000714:     	mov	x2, x0
100000718:     	mov	w0, #0x2                ; =2
10000071c:     	mov	x1, x19
100000720:     	ldp	x20, x19, [sp], #0x20
100000724:     	b	0x100000d8c <_write+0x100000d8c>

0000000100000728 <_coil.alloc.sized-alloc>:
100000728:     	cbz	x4, 0x1000007ac <_coil.alloc.sized-alloc+0x84>
10000072c:     	sub	sp, sp, #0x70
100000730:     	stp	x20, x19, [sp, #0x50]
100000734:     	stp	x29, x30, [sp, #0x60]
100000738:     	add	x29, sp, #0x60
10000073c:     	mov	x19, x0
100000740:     	add	x0, sp, #0x8
100000744:     	bl	0x100000934 <_coil.alloc.sized-request>
100000748:     	ldr	w8, [sp, #0x8]
10000074c:     	cbz	w8, 0x1000007b8 <_coil.alloc.sized-alloc+0x90>
100000750:     	ldp	q0, q1, [sp, #0x10]
100000754:     	mov	x0, xzr
100000758:     	stp	q0, q1, [sp, #0x30]
10000075c:     	ldr	x8, [sp, #0x38]
100000760:     	cmp	x8, #0x1
100000764:     	b.lt	0x1000007bc <_coil.alloc.sized-alloc+0x94>
100000768:     	ldr	x8, [sp, #0x40]
10000076c:     	cmp	x8, #0x1
100000770:     	b.lt	0x10000079c <_coil.alloc.sized-alloc+0x74>
100000774:     	ldr	x8, [sp, #0x48]
100000778:     	mov	x0, xzr
10000077c:     	subs	x9, x8, #0x1
100000780:     	b.lt	0x1000007bc <_coil.alloc.sized-alloc+0x94>
100000784:     	and	x8, x8, x9
100000788:     	cbnz	x8, 0x10000079c <_coil.alloc.sized-alloc+0x74>
10000078c:     	ldp	x0, x8, [x19]
100000790:     	add	x1, sp, #0x30
100000794:     	ldr	x8, [x8]
100000798:     	blr	x8
10000079c:     	ldp	x29, x30, [sp, #0x60]
1000007a0:     	ldp	x20, x19, [sp, #0x50]
1000007a4:     	add	sp, sp, #0x70
1000007a8:     	ret
1000007ac:     	mov	x1, xzr
1000007b0:     	mov	w0, #0x1                ; =1
1000007b4:     	ret
1000007b8:     	mov	x0, xzr
1000007bc:     	ldp	x29, x30, [sp, #0x60]
1000007c0:     	ldp	x20, x19, [sp, #0x50]
1000007c4:     	add	sp, sp, #0x70
1000007c8:     	ret

00000001000007cc <_coil.alloc.sized-free>:
1000007cc:     	cbz	x2, 0x100000860 <_coil.alloc.sized-free+0x94>
1000007d0:     	sub	sp, sp, #0x70
1000007d4:     	stp	x20, x19, [sp, #0x50]
1000007d8:     	stp	x29, x30, [sp, #0x60]
1000007dc:     	add	x29, sp, #0x60
1000007e0:     	mov	x8, x2
1000007e4:     	mov	x19, x1
1000007e8:     	mov	x20, x0
1000007ec:     	add	x0, sp, #0x8
1000007f0:     	mov	x1, x3
1000007f4:     	mov	x2, x4
1000007f8:     	mov	x3, x5
1000007fc:     	mov	x4, x8
100000800:     	bl	0x100000934 <_coil.alloc.sized-request>
100000804:     	ldr	w8, [sp, #0x8]
100000808:     	cbz	w8, 0x100000854 <_coil.alloc.sized-free+0x88>
10000080c:     	ldp	q0, q1, [sp, #0x10]
100000810:     	stp	q0, q1, [sp, #0x30]
100000814:     	ldr	x8, [sp, #0x38]
100000818:     	cmp	x8, #0x1
10000081c:     	b.lt	0x100000854 <_coil.alloc.sized-free+0x88>
100000820:     	ldr	x8, [sp, #0x40]
100000824:     	cmp	x8, #0x1
100000828:     	b.lt	0x100000854 <_coil.alloc.sized-free+0x88>
10000082c:     	ldr	x8, [sp, #0x48]
100000830:     	subs	x9, x8, #0x1
100000834:     	b.lt	0x100000854 <_coil.alloc.sized-free+0x88>
100000838:     	and	x8, x8, x9
10000083c:     	cbnz	x8, 0x100000854 <_coil.alloc.sized-free+0x88>
100000840:     	ldp	x0, x8, [x20]
100000844:     	add	x2, sp, #0x30
100000848:     	mov	x1, x19
10000084c:     	ldr	x8, [x8, #0x18]
100000850:     	blr	x8
100000854:     	ldp	x29, x30, [sp, #0x60]
100000858:     	ldp	x20, x19, [sp, #0x50]
10000085c:     	add	sp, sp, #0x70
100000860:     	ret

0000000100000864 <_coil.alloc.sized-reallocate>:
100000864:     	stp	x26, x25, [sp, #-0x50]!
100000868:     	stp	x24, x23, [sp, #0x10]
10000086c:     	stp	x22, x21, [sp, #0x20]
100000870:     	stp	x20, x19, [sp, #0x30]
100000874:     	stp	x29, x30, [sp, #0x40]
100000878:     	add	x29, sp, #0x40
10000087c:     	mov	x19, x6
100000880:     	mov	x20, x5
100000884:     	mov	x21, x4
100000888:     	mov	x25, x3
10000088c:     	mov	x22, x2
100000890:     	mov	x23, x1
100000894:     	mov	x24, x0
100000898:     	bl	0x10000096c <_coil.alloc.sized-resize>
10000089c:     	cmp	w0, #0x1
1000008a0:     	b.eq	0x1000008fc <_coil.alloc.sized-reallocate+0x98>
1000008a4:     	mov	x0, x24
1000008a8:     	mov	x1, x21
1000008ac:     	mov	x2, x20
1000008b0:     	mov	x3, x19
1000008b4:     	mov	x4, x25
1000008b8:     	bl	0x100000728 <_coil.alloc.sized-alloc>
1000008bc:     	cbz	w0, 0x100000918 <_coil.alloc.sized-reallocate+0xb4>
1000008c0:     	cmp	x22, x25
1000008c4:     	mov	x0, x1
1000008c8:     	csel	x8, x22, x25, lt
1000008cc:     	mov	x25, x1
1000008d0:     	mov	x1, x23
1000008d4:     	mul	x2, x20, x8
1000008d8:     	bl	0x100000d5c <_write+0x100000d5c>
1000008dc:     	mov	x0, x24
1000008e0:     	mov	x1, x23
1000008e4:     	mov	x2, x22
1000008e8:     	mov	x3, x21
1000008ec:     	mov	x4, x20
1000008f0:     	mov	x5, x19
1000008f4:     	bl	0x1000007cc <_coil.alloc.sized-free>
1000008f8:     	mov	x1, x25
1000008fc:     	mov	w0, #0x1                ; =1
100000900:     	ldp	x29, x30, [sp, #0x40]
100000904:     	ldp	x20, x19, [sp, #0x30]
100000908:     	ldp	x22, x21, [sp, #0x20]
10000090c:     	ldp	x24, x23, [sp, #0x10]
100000910:     	ldp	x26, x25, [sp], #0x50
100000914:     	ret
100000918:     	mov	x0, xzr
10000091c:     	ldp	x29, x30, [sp, #0x40]
100000920:     	ldp	x20, x19, [sp, #0x30]
100000924:     	ldp	x22, x21, [sp, #0x20]
100000928:     	ldp	x24, x23, [sp, #0x10]
10000092c:     	ldp	x26, x25, [sp], #0x50
100000930:     	ret

0000000100000934 <_coil.alloc.sized-request>:
100000934:     	cmp	x4, #0x1
100000938:     	b.lt	0x10000094c <_coil.alloc.sized-request+0x18>
10000093c:     	mov	x8, #0x7fffffffffffffff ; =9223372036854775807
100000940:     	udiv	x8, x8, x2
100000944:     	cmp	x4, x8
100000948:     	b.ls	0x100000954 <_coil.alloc.sized-request+0x20>
10000094c:     	str	wzr, [x0]
100000950:     	ret
100000954:     	mul	x8, x4, x2
100000958:     	mov	w9, #0x1                ; =1
10000095c:     	stp	x1, x4, [x0, #0x8]
100000960:     	str	w9, [x0]
100000964:     	stp	x8, x3, [x0, #0x18]
100000968:     	ret

000000010000096c <_coil.alloc.sized-resize>:
10000096c:     	sub	sp, sp, #0xe0
100000970:     	stp	x26, x25, [sp, #0x90]
100000974:     	stp	x24, x23, [sp, #0xa0]
100000978:     	stp	x22, x21, [sp, #0xb0]
10000097c:     	stp	x20, x19, [sp, #0xc0]
100000980:     	stp	x29, x30, [sp, #0xd0]
100000984:     	add	x29, sp, #0xd0
100000988:     	cbz	x3, 0x100000a78 <_coil.alloc.sized-resize+0x10c>
10000098c:     	mov	x19, x3
100000990:     	cbz	x2, 0x100000ab8 <_coil.alloc.sized-resize+0x14c>
100000994:     	mov	x23, x0
100000998:     	mov	x24, x1
10000099c:     	mov	x0, sp
1000009a0:     	mov	x22, x4
1000009a4:     	mov	x1, x4
1000009a8:     	mov	x4, x2
1000009ac:     	mov	x2, x5
1000009b0:     	mov	x3, x6
1000009b4:     	mov	x21, x5
1000009b8:     	mov	x20, x6
1000009bc:     	mov	x25, sp
1000009c0:     	bl	0x100000934 <_coil.alloc.sized-request>
1000009c4:     	ldr	w8, [sp]
1000009c8:     	cbz	w8, 0x100000a94 <_coil.alloc.sized-resize+0x128>
1000009cc:     	add	x0, sp, #0x28
1000009d0:     	mov	x1, x22
1000009d4:     	mov	x2, x21
1000009d8:     	mov	x3, x20
1000009dc:     	mov	x4, x19
1000009e0:     	bl	0x100000934 <_coil.alloc.sized-request>
1000009e4:     	ldr	w8, [sp, #0x28]
1000009e8:     	cbz	w8, 0x100000a94 <_coil.alloc.sized-resize+0x128>
1000009ec:     	ldur	q0, [x25, #0x8]
1000009f0:     	ldur	q1, [x25, #0x18]
1000009f4:     	mov	x0, xzr
1000009f8:     	stp	q0, q1, [sp, #0x50]
1000009fc:     	ldp	q0, q1, [sp, #0x30]
100000a00:     	ldr	x8, [sp, #0x58]
100000a04:     	cmp	x8, #0x1
100000a08:     	stp	q0, q1, [x29, #-0x60]
100000a0c:     	b.lt	0x100000a98 <_coil.alloc.sized-resize+0x12c>
100000a10:     	ldr	x8, [sp, #0x60]
100000a14:     	cmp	x8, #0x1
100000a18:     	b.lt	0x100000a98 <_coil.alloc.sized-resize+0x12c>
100000a1c:     	ldr	x8, [sp, #0x68]
100000a20:     	ldp	x11, x9, [x29, #-0x58]
100000a24:     	sub	x10, x8, #0x1
100000a28:     	and	x10, x8, x10
100000a2c:     	cmp	x9, #0x0
100000a30:     	ccmp	x10, #0x0, #0x0, gt
100000a34:     	ccmp	x11, #0x0, #0x4, eq
100000a38:     	ccmp	x8, #0x0, #0x4, gt
100000a3c:     	b.le	0x100000a94 <_coil.alloc.sized-resize+0x128>
100000a40:     	ldur	x8, [x29, #-0x48]
100000a44:     	mov	x0, xzr
100000a48:     	subs	x9, x8, #0x1
100000a4c:     	b.lt	0x100000a98 <_coil.alloc.sized-resize+0x12c>
100000a50:     	and	x8, x8, x9
100000a54:     	cbnz	x8, 0x100000a98 <_coil.alloc.sized-resize+0x12c>
100000a58:     	ldp	x0, x8, [x23]
100000a5c:     	mov	x1, x24
100000a60:     	add	x2, sp, #0x50
100000a64:     	sub	x3, x29, #0x60
100000a68:     	ldr	x8, [x8, #0x10]
100000a6c:     	blr	x8
100000a70:     	mov	x2, x1
100000a74:     	b	0x100000a98 <_coil.alloc.sized-resize+0x12c>
100000a78:     	mov	x3, x4
100000a7c:     	mov	x4, x5
100000a80:     	mov	x5, x6
100000a84:     	bl	0x1000007cc <_coil.alloc.sized-free>
100000a88:     	mov	x2, xzr
100000a8c:     	mov	w0, #0x1                ; =1
100000a90:     	b	0x100000a98 <_coil.alloc.sized-resize+0x12c>
100000a94:     	mov	x0, xzr
100000a98:     	ldp	x29, x30, [sp, #0xd0]
100000a9c:     	mov	x1, x2
100000aa0:     	ldp	x20, x19, [sp, #0xc0]
100000aa4:     	ldp	x22, x21, [sp, #0xb0]
100000aa8:     	ldp	x24, x23, [sp, #0xa0]
100000aac:     	ldp	x26, x25, [sp, #0x90]
100000ab0:     	add	sp, sp, #0xe0
100000ab4:     	ret
100000ab8:     	mov	x1, x4
100000abc:     	mov	x4, x19
100000ac0:     	mov	x2, x5
100000ac4:     	ldp	x29, x30, [sp, #0xd0]
100000ac8:     	mov	x3, x6
100000acc:     	ldp	x20, x19, [sp, #0xc0]
100000ad0:     	ldp	x22, x21, [sp, #0xb0]
100000ad4:     	ldp	x24, x23, [sp, #0xa0]
100000ad8:     	ldp	x26, x25, [sp, #0x90]
100000adc:     	add	sp, sp, #0xe0
100000ae0:     	b	0x100000728 <_coil.alloc.sized-alloc>

0000000100000ae4 <_main>:
100000ae4:     	sub	sp, sp, #0xa0
100000ae8:     	stp	x28, x27, [sp, #0x40]
100000aec:     	stp	x26, x25, [sp, #0x50]
100000af0:     	stp	x24, x23, [sp, #0x60]
100000af4:     	stp	x22, x21, [sp, #0x70]
100000af8:     	stp	x20, x19, [sp, #0x80]
100000afc:     	stp	x29, x30, [sp, #0x90]
100000b00:     	add	x29, sp, #0x90
100000b04:     	adrp	x8, 0x100008000 <_repl_static.coil.alloc.type-id__gaps.aggregate-get-runner.Node.0>
100000b08:     	add	x8, x8, #0x4
100000b0c:     	stp	xzr, xzr, [sp, #0x8]
100000b10:     	stp	xzr, x8, [sp, #0x18]
100000b14:     	adrp	x8, 0x100004000 <_write+0x100004000>
100000b18:     	add	x8, x8, #0x50
100000b1c:     	str	x8, [sp, #0x28]
100000b20:     	adrp	x19, 0x100004000 <_write+0x100004000>
100000b24:     	mov	x26, #-0xffffffffffff   ; =-281474976710655
100000b28:     	ldr	x19, [x19, #0x40]
100000b2c:     	mov	x27, #0x1               ; =1
100000b30:     	mov	x28, #0x7               ; =7
100000b34:     	mov	x23, xzr
100000b38:     	mov	x24, xzr
100000b3c:     	mov	x1, xzr
100000b40:     	mov	x2, xzr
100000b44:     	mov	x25, xzr
100000b48:     	add	x22, sp, #0x8
100000b4c:     	movk	x26, #0xfff7, lsl #32
100000b50:     	movk	x27, #0x3, lsl #32
100000b54:     	movk	x28, #0xb, lsl #32
100000b58:     	mov	w21, #0x2               ; =2
100000b5c:     	b	0x100000b84 <_main+0xa0>
100000b60:     	add	x8, x1, x24
100000b64:     	add	x25, x25, #0x1
100000b68:     	add	x24, x24, #0x10
100000b6c:     	stp	x23, x26, [x8]
100000b70:     	cmp	x25, #0x20
100000b74:     	add	x23, x23, x27
100000b78:     	add	x26, x26, x28
100000b7c:     	str	x25, [sp, #0x10]
100000b80:     	b.eq	0x100000bd4 <_main+0xf0>
100000b84:     	cmp	x25, x2
100000b88:     	b.lt	0x100000b60 <_main+0x7c>
100000b8c:     	lsl	x8, x2, #1
100000b90:     	cmp	x2, #0x0
100000b94:     	ldur	q0, [x22, #0x18]
100000b98:     	csel	x20, x21, x8, eq
100000b9c:     	str	q0, [sp, #0x30]
100000ba0:     	cmp	x20, x2
100000ba4:     	b.le	0x100000b60 <_main+0x7c>
100000ba8:     	add	x0, sp, #0x30
100000bac:     	mov	x3, x20
100000bb0:     	mov	x4, x19
100000bb4:     	mov	w5, #0x10               ; =16
100000bb8:     	mov	w6, #0x4                ; =4
100000bbc:     	bl	0x100000864 <_coil.alloc.sized-reallocate>
100000bc0:     	cbz	w0, 0x100000c68 <_main+0x184>
100000bc4:     	mov	x2, x20
100000bc8:     	str	x1, [sp, #0x8]
100000bcc:     	str	x20, [sp, #0x18]
100000bd0:     	b	0x100000b60 <_main+0x7c>
100000bd4:     	mov	w21, #0xc200            ; =49664
100000bd8:     	mov	x20, xzr
100000bdc:     	mov	x19, xzr
100000be0:     	movk	w21, #0xbeb, lsl #16
100000be4:     	add	x0, sp, #0x8
100000be8:     	and	x1, x20, #0x1f
100000bec:     	bl	0x1000005a0 <_gap_aggregate_get>
100000bf0:     	add	x20, x20, #0x1
100000bf4:     	add	x19, x0, x19
100000bf8:     	cmp	x20, x21
100000bfc:     	b.ne	0x100000be4 <_main+0x100>
100000c00:     	ldr	x8, [sp, #0x10]
100000c04:     	cbz	x8, 0x100000c0c <_main+0x128>
100000c08:     	str	xzr, [sp, #0x10]
100000c0c:     	ldr	x2, [sp, #0x18]
100000c10:     	cmp	x2, #0x1
100000c14:     	b.lt	0x100000c34 <_main+0x150>
100000c18:     	adrp	x3, 0x100004000 <_write+0x100004000>
100000c1c:     	ldr	x1, [sp, #0x8]
100000c20:     	add	x0, x22, #0x18
100000c24:     	ldr	x3, [x3, #0x40]
100000c28:     	mov	w4, #0x10               ; =16
100000c2c:     	mov	w5, #0x4                ; =4
100000c30:     	bl	0x1000007cc <_coil.alloc.sized-free>
100000c34:     	mov	x8, #0x1b00             ; =6912
100000c38:     	ldp	x29, x30, [sp, #0x90]
100000c3c:     	movk	x8, #0xc8e5, lsl #16
100000c40:     	ldp	x22, x21, [sp, #0x70]
100000c44:     	movk	x8, #0xe, lsl #32
100000c48:     	ldp	x24, x23, [sp, #0x60]
100000c4c:     	cmp	x19, x8
100000c50:     	ldp	x20, x19, [sp, #0x80]
100000c54:     	ldp	x26, x25, [sp, #0x50]
100000c58:     	cset	w0, ne
100000c5c:     	ldp	x28, x27, [sp, #0x40]
100000c60:     	add	sp, sp, #0xa0
100000c64:     	ret
100000c68:     	adrp	x1, 0x100000000 <_write+0x100000000>
100000c6c:     	add	x1, x1, #0xda0
100000c70:     	mov	w0, #0x2                ; =2
100000c74:     	mov	w2, #0xf                ; =15
100000c78:     	lsl	x19, x20, #4
100000c7c:     	bl	0x100000d8c <_write+0x100000d8c>
100000c80:     	adrp	x1, 0x100000000 <_write+0x100000000>
100000c84:     	add	x1, x1, #0xdf0
100000c88:     	mov	w0, #0x2                ; =2
100000c8c:     	mov	w2, #0x12               ; =18
100000c90:     	bl	0x100000d8c <_write+0x100000d8c>
100000c94:     	adrp	x1, 0x100000000 <_write+0x100000000>
100000c98:     	add	x1, x1, #0xdb0
100000c9c:     	mov	w0, #0x2                ; =2
100000ca0:     	mov	w2, #0x13               ; =19
100000ca4:     	bl	0x100000d8c <_write+0x100000d8c>
100000ca8:     	tbnz	x19, #0x3f, 0x100000d28 <_main+0x244>
100000cac:     	adrp	x1, 0x100000000 <_write+0x100000000>
100000cb0:     	add	x1, x1, #0xdc4
100000cb4:     	mov	w0, #0x2                ; =2
100000cb8:     	mov	w2, #0x1                ; =1
100000cbc:     	bl	0x100000d8c <_write+0x100000d8c>
100000cc0:     	mov	x9, #-0x3333333333333334 ; =-3689348814741910324
100000cc4:     	mov	x8, xzr
100000cc8:     	mov	w10, #0xa               ; =10
100000ccc:     	movk	x9, #0xcccd
100000cd0:     	adrp	x14, 0x100008000 <_repl_static.coil.alloc.type-id__gaps.aggregate-get-runner.Node.0>
100000cd4:     	add	x14, x14, #0x4
100000cd8:     	umulh	x11, x19, x9
100000cdc:     	add	x13, x14, x8
100000ce0:     	cmp	x19, #0x9
100000ce4:     	sub	x8, x8, #0x1
100000ce8:     	lsr	x11, x11, #3
100000cec:     	msub	w12, w11, w10, w19
100000cf0:     	mov	x19, x11
100000cf4:     	orr	w12, w12, #0x30
100000cf8:     	strb	w12, [x13, #0x18]
100000cfc:     	b.hi	0x100000cd8 <_main+0x1f4>
100000d00:     	neg	x2, x8
100000d04:     	add	x8, x14, x8
100000d08:     	mov	w0, #0x2                ; =2
100000d0c:     	add	x1, x8, #0x19
100000d10:     	bl	0x100000d8c <_write+0x100000d8c>
100000d14:     	adrp	x1, 0x100000000 <_write+0x100000000>
100000d18:     	add	x1, x1, #0xdc6
100000d1c:     	mov	w0, #0x2                ; =2
100000d20:     	mov	w2, #0x6                ; =6
100000d24:     	bl	0x100000d8c <_write+0x100000d8c>
100000d28:     	adrp	x0, 0x100000000 <_write+0x100000000>
100000d2c:     	add	x0, x0, #0xdd0
100000d30:     	bl	0x1000006fc <_coil.alloc.oom-puts>
100000d34:     	bl	0x100000d38 <_write+0x100000d38>

Disassembly of section __TEXT,__stubs:

0000000100000d38 <__stubs>:
100000d38:     	adrp	x16, 0x100004000 <_write+0x100004000>
100000d3c:     	ldr	x16, [x16]
100000d40:     	br	x16
100000d44:     	adrp	x16, 0x100004000 <_write+0x100004000>
100000d48:     	ldr	x16, [x16, #0x8]
100000d4c:     	br	x16
100000d50:     	adrp	x16, 0x100004000 <_write+0x100004000>
100000d54:     	ldr	x16, [x16, #0x10]
100000d58:     	br	x16
100000d5c:     	adrp	x16, 0x100004000 <_write+0x100004000>
100000d60:     	ldr	x16, [x16, #0x18]
100000d64:     	br	x16
100000d68:     	adrp	x16, 0x100004000 <_write+0x100004000>
100000d6c:     	ldr	x16, [x16, #0x20]
100000d70:     	br	x16
100000d74:     	adrp	x16, 0x100004000 <_write+0x100004000>
100000d78:     	ldr	x16, [x16, #0x28]
100000d7c:     	br	x16
100000d80:     	adrp	x16, 0x100004000 <_write+0x100004000>
100000d84:     	ldr	x16, [x16, #0x30]
100000d88:     	br	x16
100000d8c:     	adrp	x16, 0x100004000 <_write+0x100004000>
100000d90:     	ldr	x16, [x16, #0x38]
100000d94:     	br	x16
