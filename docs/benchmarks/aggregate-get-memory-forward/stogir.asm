
/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/build/aggregate-get-memory-forward/stogir:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001000005a0 <_gap_aggregate_get>:
1000005a0:     	lsl	x1, x1, #4
1000005a4:     	ldr	x0, [x0]
1000005a8:     	add	x0, x1, x0
1000005ac:     	ldr	x1, [x0]
1000005b0:     	lsr	x1, x1, #32
1000005b4:     	ldr	x0, [x0, #0x8]
1000005b8:     	lsr	w1, w1, #0
1000005bc:     	lsr	w2, w0, #0
1000005c0:     	lsr	x0, x0, #32
1000005c4:     	sxtw	x1, w1
1000005c8:     	sxtw	x2, w2
1000005cc:     	lsr	w0, w0, #0
1000005d0:     	add	x1, x2, x1
1000005d4:     	sxtw	x0, w0
1000005d8:     	add	x0, x0, x1
1000005dc:     	ret

00000001000005e0 <_coil.alloc.Allocator$coil.alloc.MallocAllocator$allocate>:
1000005e0:     	sub	sp, sp, #0x20
1000005e4:     	stp	x29, x30, [sp, #0x10]
1000005e8:     	add	x29, sp, #0x10
1000005ec:     	mov	x8, x1
1000005f0:     	ldr	x1, [x1, #0x18]
1000005f4:     	ldr	x2, [x8, #0x10]
1000005f8:     	cmp	x1, #0x10
1000005fc:     	b.gt	0x100000620 <_coil.alloc.Allocator$coil.alloc.MallocAllocator$allocate+0x40>
100000600:     	mov	x0, x2
100000604:     	bl	0x100000d18 <_write+0x100000d18>
100000608:     	cmp	x0, #0x0
10000060c:     	csel	x1, x8, x0, eq
100000610:     	cset	x0, ne
100000614:     	ldp	x29, x30, [sp, #0x10]
100000618:     	add	sp, sp, #0x20
10000061c:     	ret
100000620:     	add	x0, sp, #0x8
100000624:     	str	xzr, [sp, #0x8]
100000628:     	bl	0x100000d30 <_write+0x100000d30>
10000062c:     	cbz	w0, 0x100000640 <_coil.alloc.Allocator$coil.alloc.MallocAllocator$allocate+0x60>
100000630:     	mov	x0, xzr
100000634:     	ldp	x29, x30, [sp, #0x10]
100000638:     	add	sp, sp, #0x20
10000063c:     	ret
100000640:     	ldr	x1, [sp, #0x8]
100000644:     	mov	w0, #0x1                ; =1
100000648:     	ldp	x29, x30, [sp, #0x10]
10000064c:     	add	sp, sp, #0x20
100000650:     	ret

0000000100000654 <_coil.alloc.Allocator$coil.alloc.MallocAllocator$deallocate>:
100000654:     	stp	x29, x30, [sp, #-0x10]!
100000658:     	mov	x0, x1
10000065c:     	mov	x29, sp
100000660:     	bl	0x100000d0c <_write+0x100000d0c>
100000664:     	mov	x0, xzr
100000668:     	ldp	x29, x30, [sp], #0x10
10000066c:     	ret

0000000100000670 <_coil.alloc.Allocator$coil.alloc.MallocAllocator$remap>:
100000670:     	ldr	x8, [x3, #0x18]
100000674:     	cmp	x8, #0x11
100000678:     	b.lt	0x100000684 <_coil.alloc.Allocator$coil.alloc.MallocAllocator$remap+0x14>
10000067c:     	mov	x0, xzr
100000680:     	ret
100000684:     	stp	x29, x30, [sp, #-0x10]!
100000688:     	ldr	x8, [x3, #0x10]
10000068c:     	mov	x0, x1
100000690:     	mov	x29, sp
100000694:     	mov	x1, x8
100000698:     	bl	0x100000d3c <_write+0x100000d3c>
10000069c:     	cmp	x0, #0x0
1000006a0:     	csel	x1, x8, x0, eq
1000006a4:     	cset	x0, ne
1000006a8:     	ldp	x29, x30, [sp], #0x10
1000006ac:     	ret

00000001000006b0 <_coil.alloc.Allocator$coil.alloc.MallocAllocator$resize>:
1000006b0:     	ldr	x8, [x3, #0x10]
1000006b4:     	ldr	x9, [x2, #0x10]
1000006b8:     	cmp	x8, x9
1000006bc:     	cset	w0, le
1000006c0:     	ret

00000001000006c4 <_coil.alloc.oom-puts>:
1000006c4:     	stp	x20, x19, [sp, #-0x20]!
1000006c8:     	stp	x29, x30, [sp, #0x10]
1000006cc:     	add	x29, sp, #0x10
1000006d0:     	mov	x19, x0
1000006d4:     	bl	0x100000d48 <_write+0x100000d48>
1000006d8:     	ldp	x29, x30, [sp, #0x10]
1000006dc:     	mov	x2, x0
1000006e0:     	mov	w0, #0x2                ; =2
1000006e4:     	mov	x1, x19
1000006e8:     	ldp	x20, x19, [sp], #0x20
1000006ec:     	b	0x100000d54 <_write+0x100000d54>

00000001000006f0 <_coil.alloc.sized-alloc>:
1000006f0:     	cbz	x4, 0x100000774 <_coil.alloc.sized-alloc+0x84>
1000006f4:     	sub	sp, sp, #0x70
1000006f8:     	stp	x20, x19, [sp, #0x50]
1000006fc:     	stp	x29, x30, [sp, #0x60]
100000700:     	add	x29, sp, #0x60
100000704:     	mov	x19, x0
100000708:     	add	x0, sp, #0x8
10000070c:     	bl	0x1000008fc <_coil.alloc.sized-request>
100000710:     	ldr	w8, [sp, #0x8]
100000714:     	cbz	w8, 0x100000780 <_coil.alloc.sized-alloc+0x90>
100000718:     	ldp	q0, q1, [sp, #0x10]
10000071c:     	mov	x0, xzr
100000720:     	stp	q0, q1, [sp, #0x30]
100000724:     	ldr	x8, [sp, #0x38]
100000728:     	cmp	x8, #0x1
10000072c:     	b.lt	0x100000784 <_coil.alloc.sized-alloc+0x94>
100000730:     	ldr	x8, [sp, #0x40]
100000734:     	cmp	x8, #0x1
100000738:     	b.lt	0x100000764 <_coil.alloc.sized-alloc+0x74>
10000073c:     	ldr	x8, [sp, #0x48]
100000740:     	mov	x0, xzr
100000744:     	subs	x9, x8, #0x1
100000748:     	b.lt	0x100000784 <_coil.alloc.sized-alloc+0x94>
10000074c:     	and	x8, x8, x9
100000750:     	cbnz	x8, 0x100000764 <_coil.alloc.sized-alloc+0x74>
100000754:     	ldp	x0, x8, [x19]
100000758:     	add	x1, sp, #0x30
10000075c:     	ldr	x8, [x8]
100000760:     	blr	x8
100000764:     	ldp	x29, x30, [sp, #0x60]
100000768:     	ldp	x20, x19, [sp, #0x50]
10000076c:     	add	sp, sp, #0x70
100000770:     	ret
100000774:     	mov	x1, xzr
100000778:     	mov	w0, #0x1                ; =1
10000077c:     	ret
100000780:     	mov	x0, xzr
100000784:     	ldp	x29, x30, [sp, #0x60]
100000788:     	ldp	x20, x19, [sp, #0x50]
10000078c:     	add	sp, sp, #0x70
100000790:     	ret

0000000100000794 <_coil.alloc.sized-free>:
100000794:     	cbz	x2, 0x100000828 <_coil.alloc.sized-free+0x94>
100000798:     	sub	sp, sp, #0x70
10000079c:     	stp	x20, x19, [sp, #0x50]
1000007a0:     	stp	x29, x30, [sp, #0x60]
1000007a4:     	add	x29, sp, #0x60
1000007a8:     	mov	x8, x2
1000007ac:     	mov	x19, x1
1000007b0:     	mov	x20, x0
1000007b4:     	add	x0, sp, #0x8
1000007b8:     	mov	x1, x3
1000007bc:     	mov	x2, x4
1000007c0:     	mov	x3, x5
1000007c4:     	mov	x4, x8
1000007c8:     	bl	0x1000008fc <_coil.alloc.sized-request>
1000007cc:     	ldr	w8, [sp, #0x8]
1000007d0:     	cbz	w8, 0x10000081c <_coil.alloc.sized-free+0x88>
1000007d4:     	ldp	q0, q1, [sp, #0x10]
1000007d8:     	stp	q0, q1, [sp, #0x30]
1000007dc:     	ldr	x8, [sp, #0x38]
1000007e0:     	cmp	x8, #0x1
1000007e4:     	b.lt	0x10000081c <_coil.alloc.sized-free+0x88>
1000007e8:     	ldr	x8, [sp, #0x40]
1000007ec:     	cmp	x8, #0x1
1000007f0:     	b.lt	0x10000081c <_coil.alloc.sized-free+0x88>
1000007f4:     	ldr	x8, [sp, #0x48]
1000007f8:     	subs	x9, x8, #0x1
1000007fc:     	b.lt	0x10000081c <_coil.alloc.sized-free+0x88>
100000800:     	and	x8, x8, x9
100000804:     	cbnz	x8, 0x10000081c <_coil.alloc.sized-free+0x88>
100000808:     	ldp	x0, x8, [x20]
10000080c:     	add	x2, sp, #0x30
100000810:     	mov	x1, x19
100000814:     	ldr	x8, [x8, #0x18]
100000818:     	blr	x8
10000081c:     	ldp	x29, x30, [sp, #0x60]
100000820:     	ldp	x20, x19, [sp, #0x50]
100000824:     	add	sp, sp, #0x70
100000828:     	ret

000000010000082c <_coil.alloc.sized-reallocate>:
10000082c:     	stp	x26, x25, [sp, #-0x50]!
100000830:     	stp	x24, x23, [sp, #0x10]
100000834:     	stp	x22, x21, [sp, #0x20]
100000838:     	stp	x20, x19, [sp, #0x30]
10000083c:     	stp	x29, x30, [sp, #0x40]
100000840:     	add	x29, sp, #0x40
100000844:     	mov	x19, x6
100000848:     	mov	x20, x5
10000084c:     	mov	x21, x4
100000850:     	mov	x25, x3
100000854:     	mov	x22, x2
100000858:     	mov	x23, x1
10000085c:     	mov	x24, x0
100000860:     	bl	0x100000934 <_coil.alloc.sized-resize>
100000864:     	cmp	w0, #0x1
100000868:     	b.eq	0x1000008c4 <_coil.alloc.sized-reallocate+0x98>
10000086c:     	mov	x0, x24
100000870:     	mov	x1, x21
100000874:     	mov	x2, x20
100000878:     	mov	x3, x19
10000087c:     	mov	x4, x25
100000880:     	bl	0x1000006f0 <_coil.alloc.sized-alloc>
100000884:     	cbz	w0, 0x1000008e0 <_coil.alloc.sized-reallocate+0xb4>
100000888:     	cmp	x22, x25
10000088c:     	mov	x0, x1
100000890:     	csel	x8, x22, x25, lt
100000894:     	mov	x25, x1
100000898:     	mov	x1, x23
10000089c:     	mul	x2, x20, x8
1000008a0:     	bl	0x100000d24 <_write+0x100000d24>
1000008a4:     	mov	x0, x24
1000008a8:     	mov	x1, x23
1000008ac:     	mov	x2, x22
1000008b0:     	mov	x3, x21
1000008b4:     	mov	x4, x20
1000008b8:     	mov	x5, x19
1000008bc:     	bl	0x100000794 <_coil.alloc.sized-free>
1000008c0:     	mov	x1, x25
1000008c4:     	mov	w0, #0x1                ; =1
1000008c8:     	ldp	x29, x30, [sp, #0x40]
1000008cc:     	ldp	x20, x19, [sp, #0x30]
1000008d0:     	ldp	x22, x21, [sp, #0x20]
1000008d4:     	ldp	x24, x23, [sp, #0x10]
1000008d8:     	ldp	x26, x25, [sp], #0x50
1000008dc:     	ret
1000008e0:     	mov	x0, xzr
1000008e4:     	ldp	x29, x30, [sp, #0x40]
1000008e8:     	ldp	x20, x19, [sp, #0x30]
1000008ec:     	ldp	x22, x21, [sp, #0x20]
1000008f0:     	ldp	x24, x23, [sp, #0x10]
1000008f4:     	ldp	x26, x25, [sp], #0x50
1000008f8:     	ret

00000001000008fc <_coil.alloc.sized-request>:
1000008fc:     	cmp	x4, #0x1
100000900:     	b.lt	0x100000914 <_coil.alloc.sized-request+0x18>
100000904:     	mov	x8, #0x7fffffffffffffff ; =9223372036854775807
100000908:     	udiv	x8, x8, x2
10000090c:     	cmp	x4, x8
100000910:     	b.ls	0x10000091c <_coil.alloc.sized-request+0x20>
100000914:     	str	wzr, [x0]
100000918:     	ret
10000091c:     	mul	x8, x4, x2
100000920:     	mov	w9, #0x1                ; =1
100000924:     	stp	x1, x4, [x0, #0x8]
100000928:     	str	w9, [x0]
10000092c:     	stp	x8, x3, [x0, #0x18]
100000930:     	ret

0000000100000934 <_coil.alloc.sized-resize>:
100000934:     	sub	sp, sp, #0xe0
100000938:     	stp	x26, x25, [sp, #0x90]
10000093c:     	stp	x24, x23, [sp, #0xa0]
100000940:     	stp	x22, x21, [sp, #0xb0]
100000944:     	stp	x20, x19, [sp, #0xc0]
100000948:     	stp	x29, x30, [sp, #0xd0]
10000094c:     	add	x29, sp, #0xd0
100000950:     	cbz	x3, 0x100000a40 <_coil.alloc.sized-resize+0x10c>
100000954:     	mov	x19, x3
100000958:     	cbz	x2, 0x100000a80 <_coil.alloc.sized-resize+0x14c>
10000095c:     	mov	x23, x0
100000960:     	mov	x24, x1
100000964:     	mov	x0, sp
100000968:     	mov	x22, x4
10000096c:     	mov	x1, x4
100000970:     	mov	x4, x2
100000974:     	mov	x2, x5
100000978:     	mov	x3, x6
10000097c:     	mov	x21, x5
100000980:     	mov	x20, x6
100000984:     	mov	x25, sp
100000988:     	bl	0x1000008fc <_coil.alloc.sized-request>
10000098c:     	ldr	w8, [sp]
100000990:     	cbz	w8, 0x100000a5c <_coil.alloc.sized-resize+0x128>
100000994:     	add	x0, sp, #0x28
100000998:     	mov	x1, x22
10000099c:     	mov	x2, x21
1000009a0:     	mov	x3, x20
1000009a4:     	mov	x4, x19
1000009a8:     	bl	0x1000008fc <_coil.alloc.sized-request>
1000009ac:     	ldr	w8, [sp, #0x28]
1000009b0:     	cbz	w8, 0x100000a5c <_coil.alloc.sized-resize+0x128>
1000009b4:     	ldur	q0, [x25, #0x8]
1000009b8:     	ldur	q1, [x25, #0x18]
1000009bc:     	mov	x0, xzr
1000009c0:     	stp	q0, q1, [sp, #0x50]
1000009c4:     	ldp	q0, q1, [sp, #0x30]
1000009c8:     	ldr	x8, [sp, #0x58]
1000009cc:     	cmp	x8, #0x1
1000009d0:     	stp	q0, q1, [x29, #-0x60]
1000009d4:     	b.lt	0x100000a60 <_coil.alloc.sized-resize+0x12c>
1000009d8:     	ldr	x8, [sp, #0x60]
1000009dc:     	cmp	x8, #0x1
1000009e0:     	b.lt	0x100000a60 <_coil.alloc.sized-resize+0x12c>
1000009e4:     	ldr	x8, [sp, #0x68]
1000009e8:     	ldp	x11, x9, [x29, #-0x58]
1000009ec:     	sub	x10, x8, #0x1
1000009f0:     	and	x10, x8, x10
1000009f4:     	cmp	x9, #0x0
1000009f8:     	ccmp	x10, #0x0, #0x0, gt
1000009fc:     	ccmp	x11, #0x0, #0x4, eq
100000a00:     	ccmp	x8, #0x0, #0x4, gt
100000a04:     	b.le	0x100000a5c <_coil.alloc.sized-resize+0x128>
100000a08:     	ldur	x8, [x29, #-0x48]
100000a0c:     	mov	x0, xzr
100000a10:     	subs	x9, x8, #0x1
100000a14:     	b.lt	0x100000a60 <_coil.alloc.sized-resize+0x12c>
100000a18:     	and	x8, x8, x9
100000a1c:     	cbnz	x8, 0x100000a60 <_coil.alloc.sized-resize+0x12c>
100000a20:     	ldp	x0, x8, [x23]
100000a24:     	mov	x1, x24
100000a28:     	add	x2, sp, #0x50
100000a2c:     	sub	x3, x29, #0x60
100000a30:     	ldr	x8, [x8, #0x10]
100000a34:     	blr	x8
100000a38:     	mov	x2, x1
100000a3c:     	b	0x100000a60 <_coil.alloc.sized-resize+0x12c>
100000a40:     	mov	x3, x4
100000a44:     	mov	x4, x5
100000a48:     	mov	x5, x6
100000a4c:     	bl	0x100000794 <_coil.alloc.sized-free>
100000a50:     	mov	x2, xzr
100000a54:     	mov	w0, #0x1                ; =1
100000a58:     	b	0x100000a60 <_coil.alloc.sized-resize+0x12c>
100000a5c:     	mov	x0, xzr
100000a60:     	ldp	x29, x30, [sp, #0xd0]
100000a64:     	mov	x1, x2
100000a68:     	ldp	x20, x19, [sp, #0xc0]
100000a6c:     	ldp	x22, x21, [sp, #0xb0]
100000a70:     	ldp	x24, x23, [sp, #0xa0]
100000a74:     	ldp	x26, x25, [sp, #0x90]
100000a78:     	add	sp, sp, #0xe0
100000a7c:     	ret
100000a80:     	mov	x1, x4
100000a84:     	mov	x4, x19
100000a88:     	mov	x2, x5
100000a8c:     	ldp	x29, x30, [sp, #0xd0]
100000a90:     	mov	x3, x6
100000a94:     	ldp	x20, x19, [sp, #0xc0]
100000a98:     	ldp	x22, x21, [sp, #0xb0]
100000a9c:     	ldp	x24, x23, [sp, #0xa0]
100000aa0:     	ldp	x26, x25, [sp, #0x90]
100000aa4:     	add	sp, sp, #0xe0
100000aa8:     	b	0x1000006f0 <_coil.alloc.sized-alloc>

0000000100000aac <_main>:
100000aac:     	sub	sp, sp, #0xa0
100000ab0:     	stp	x28, x27, [sp, #0x40]
100000ab4:     	stp	x26, x25, [sp, #0x50]
100000ab8:     	stp	x24, x23, [sp, #0x60]
100000abc:     	stp	x22, x21, [sp, #0x70]
100000ac0:     	stp	x20, x19, [sp, #0x80]
100000ac4:     	stp	x29, x30, [sp, #0x90]
100000ac8:     	add	x29, sp, #0x90
100000acc:     	adrp	x8, 0x100008000 <_repl_static.coil.alloc.type-id__gaps.aggregate-get-runner.Node.0>
100000ad0:     	add	x8, x8, #0x4
100000ad4:     	stp	xzr, xzr, [sp, #0x8]
100000ad8:     	stp	xzr, x8, [sp, #0x18]
100000adc:     	adrp	x8, 0x100004000 <_write+0x100004000>
100000ae0:     	add	x8, x8, #0x50
100000ae4:     	str	x8, [sp, #0x28]
100000ae8:     	adrp	x19, 0x100004000 <_write+0x100004000>
100000aec:     	mov	x26, #-0xffffffffffff   ; =-281474976710655
100000af0:     	ldr	x19, [x19, #0x40]
100000af4:     	mov	x27, #0x1               ; =1
100000af8:     	mov	x28, #0x7               ; =7
100000afc:     	mov	x23, xzr
100000b00:     	mov	x24, xzr
100000b04:     	mov	x1, xzr
100000b08:     	mov	x2, xzr
100000b0c:     	mov	x25, xzr
100000b10:     	add	x22, sp, #0x8
100000b14:     	movk	x26, #0xfff7, lsl #32
100000b18:     	movk	x27, #0x3, lsl #32
100000b1c:     	movk	x28, #0xb, lsl #32
100000b20:     	mov	w21, #0x2               ; =2
100000b24:     	b	0x100000b4c <_main+0xa0>
100000b28:     	add	x8, x1, x24
100000b2c:     	add	x25, x25, #0x1
100000b30:     	add	x24, x24, #0x10
100000b34:     	stp	x23, x26, [x8]
100000b38:     	cmp	x25, #0x20
100000b3c:     	add	x23, x23, x27
100000b40:     	add	x26, x26, x28
100000b44:     	str	x25, [sp, #0x10]
100000b48:     	b.eq	0x100000b9c <_main+0xf0>
100000b4c:     	cmp	x25, x2
100000b50:     	b.lt	0x100000b28 <_main+0x7c>
100000b54:     	lsl	x8, x2, #1
100000b58:     	cmp	x2, #0x0
100000b5c:     	ldur	q0, [x22, #0x18]
100000b60:     	csel	x20, x21, x8, eq
100000b64:     	str	q0, [sp, #0x30]
100000b68:     	cmp	x20, x2
100000b6c:     	b.le	0x100000b28 <_main+0x7c>
100000b70:     	add	x0, sp, #0x30
100000b74:     	mov	x3, x20
100000b78:     	mov	x4, x19
100000b7c:     	mov	w5, #0x10               ; =16
100000b80:     	mov	w6, #0x4                ; =4
100000b84:     	bl	0x10000082c <_coil.alloc.sized-reallocate>
100000b88:     	cbz	w0, 0x100000c30 <_main+0x184>
100000b8c:     	mov	x2, x20
100000b90:     	str	x1, [sp, #0x8]
100000b94:     	str	x20, [sp, #0x18]
100000b98:     	b	0x100000b28 <_main+0x7c>
100000b9c:     	mov	w21, #0xc200            ; =49664
100000ba0:     	mov	x20, xzr
100000ba4:     	mov	x19, xzr
100000ba8:     	movk	w21, #0xbeb, lsl #16
100000bac:     	add	x0, sp, #0x8
100000bb0:     	and	x1, x20, #0x1f
100000bb4:     	bl	0x1000005a0 <_gap_aggregate_get>
100000bb8:     	add	x20, x20, #0x1
100000bbc:     	add	x19, x0, x19
100000bc0:     	cmp	x20, x21
100000bc4:     	b.ne	0x100000bac <_main+0x100>
100000bc8:     	ldr	x8, [sp, #0x10]
100000bcc:     	cbz	x8, 0x100000bd4 <_main+0x128>
100000bd0:     	str	xzr, [sp, #0x10]
100000bd4:     	ldr	x2, [sp, #0x18]
100000bd8:     	cmp	x2, #0x1
100000bdc:     	b.lt	0x100000bfc <_main+0x150>
100000be0:     	adrp	x3, 0x100004000 <_write+0x100004000>
100000be4:     	ldr	x1, [sp, #0x8]
100000be8:     	add	x0, x22, #0x18
100000bec:     	ldr	x3, [x3, #0x40]
100000bf0:     	mov	w4, #0x10               ; =16
100000bf4:     	mov	w5, #0x4                ; =4
100000bf8:     	bl	0x100000794 <_coil.alloc.sized-free>
100000bfc:     	mov	x8, #0x1b00             ; =6912
100000c00:     	ldp	x29, x30, [sp, #0x90]
100000c04:     	movk	x8, #0xc8e5, lsl #16
100000c08:     	ldp	x22, x21, [sp, #0x70]
100000c0c:     	movk	x8, #0xe, lsl #32
100000c10:     	ldp	x24, x23, [sp, #0x60]
100000c14:     	cmp	x19, x8
100000c18:     	ldp	x20, x19, [sp, #0x80]
100000c1c:     	ldp	x26, x25, [sp, #0x50]
100000c20:     	cset	w0, ne
100000c24:     	ldp	x28, x27, [sp, #0x40]
100000c28:     	add	sp, sp, #0xa0
100000c2c:     	ret
100000c30:     	adrp	x1, 0x100000000 <_write+0x100000000>
100000c34:     	add	x1, x1, #0xd60
100000c38:     	mov	w0, #0x2                ; =2
100000c3c:     	mov	w2, #0xf                ; =15
100000c40:     	lsl	x19, x20, #4
100000c44:     	bl	0x100000d54 <_write+0x100000d54>
100000c48:     	adrp	x1, 0x100000000 <_write+0x100000000>
100000c4c:     	add	x1, x1, #0xdb0
100000c50:     	mov	w0, #0x2                ; =2
100000c54:     	mov	w2, #0x12               ; =18
100000c58:     	bl	0x100000d54 <_write+0x100000d54>
100000c5c:     	adrp	x1, 0x100000000 <_write+0x100000000>
100000c60:     	add	x1, x1, #0xd70
100000c64:     	mov	w0, #0x2                ; =2
100000c68:     	mov	w2, #0x13               ; =19
100000c6c:     	bl	0x100000d54 <_write+0x100000d54>
100000c70:     	tbnz	x19, #0x3f, 0x100000cf0 <_main+0x244>
100000c74:     	adrp	x1, 0x100000000 <_write+0x100000000>
100000c78:     	add	x1, x1, #0xd84
100000c7c:     	mov	w0, #0x2                ; =2
100000c80:     	mov	w2, #0x1                ; =1
100000c84:     	bl	0x100000d54 <_write+0x100000d54>
100000c88:     	mov	x9, #-0x3333333333333334 ; =-3689348814741910324
100000c8c:     	mov	x8, xzr
100000c90:     	mov	w10, #0xa               ; =10
100000c94:     	movk	x9, #0xcccd
100000c98:     	adrp	x14, 0x100008000 <_repl_static.coil.alloc.type-id__gaps.aggregate-get-runner.Node.0>
100000c9c:     	add	x14, x14, #0x4
100000ca0:     	umulh	x11, x19, x9
100000ca4:     	add	x13, x14, x8
100000ca8:     	cmp	x19, #0x9
100000cac:     	sub	x8, x8, #0x1
100000cb0:     	lsr	x11, x11, #3
100000cb4:     	msub	w12, w11, w10, w19
100000cb8:     	mov	x19, x11
100000cbc:     	orr	w12, w12, #0x30
100000cc0:     	strb	w12, [x13, #0x18]
100000cc4:     	b.hi	0x100000ca0 <_main+0x1f4>
100000cc8:     	neg	x2, x8
100000ccc:     	add	x8, x14, x8
100000cd0:     	mov	w0, #0x2                ; =2
100000cd4:     	add	x1, x8, #0x19
100000cd8:     	bl	0x100000d54 <_write+0x100000d54>
100000cdc:     	adrp	x1, 0x100000000 <_write+0x100000000>
100000ce0:     	add	x1, x1, #0xd86
100000ce4:     	mov	w0, #0x2                ; =2
100000ce8:     	mov	w2, #0x6                ; =6
100000cec:     	bl	0x100000d54 <_write+0x100000d54>
100000cf0:     	adrp	x0, 0x100000000 <_write+0x100000000>
100000cf4:     	add	x0, x0, #0xd90
100000cf8:     	bl	0x1000006c4 <_coil.alloc.oom-puts>
100000cfc:     	bl	0x100000d00 <_write+0x100000d00>

Disassembly of section __TEXT,__stubs:

0000000100000d00 <__stubs>:
100000d00:     	adrp	x16, 0x100004000 <_write+0x100004000>
100000d04:     	ldr	x16, [x16]
100000d08:     	br	x16
100000d0c:     	adrp	x16, 0x100004000 <_write+0x100004000>
100000d10:     	ldr	x16, [x16, #0x8]
100000d14:     	br	x16
100000d18:     	adrp	x16, 0x100004000 <_write+0x100004000>
100000d1c:     	ldr	x16, [x16, #0x10]
100000d20:     	br	x16
100000d24:     	adrp	x16, 0x100004000 <_write+0x100004000>
100000d28:     	ldr	x16, [x16, #0x18]
100000d2c:     	br	x16
100000d30:     	adrp	x16, 0x100004000 <_write+0x100004000>
100000d34:     	ldr	x16, [x16, #0x20]
100000d38:     	br	x16
100000d3c:     	adrp	x16, 0x100004000 <_write+0x100004000>
100000d40:     	ldr	x16, [x16, #0x28]
100000d44:     	br	x16
100000d48:     	adrp	x16, 0x100004000 <_write+0x100004000>
100000d4c:     	ldr	x16, [x16, #0x30]
100000d50:     	br	x16
100000d54:     	adrp	x16, 0x100004000 <_write+0x100004000>
100000d58:     	ldr	x16, [x16, #0x38]
100000d5c:     	br	x16
