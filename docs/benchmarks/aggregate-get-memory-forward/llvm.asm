
/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/build/aggregate-get-memory-forward/llvm:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000100000598 <_gap_aggregate_get>:
100000598:     	ldr	x8, [x0]
10000059c:     	add	x8, x8, x1, lsl #4
1000005a0:     	ldrsw	x9, [x8, #0x4]
1000005a4:     	ldr	x8, [x8, #0x8]
1000005a8:     	add	x9, x9, x8, asr #32
1000005ac:     	add	x0, x9, w8, sxtw
1000005b0:     	ret

00000001000005b4 <_coil.alloc.Allocator$coil.alloc.MallocAllocator$allocate>:
1000005b4:     	sub	sp, sp, #0x20
1000005b8:     	stp	x29, x30, [sp, #0x10]
1000005bc:     	add	x29, sp, #0x10
1000005c0:     	mov	x8, x1
1000005c4:     	ldr	x1, [x1, #0x18]
1000005c8:     	ldr	x2, [x8, #0x10]
1000005cc:     	cmp	x1, #0x10
1000005d0:     	b.gt	0x1000005f4 <_coil.alloc.Allocator$coil.alloc.MallocAllocator$allocate+0x40>
1000005d4:     	mov	x0, x2
1000005d8:     	bl	0x100000cec <_write+0x100000cec>
1000005dc:     	cmp	x0, #0x0
1000005e0:     	csel	x1, x8, x0, eq
1000005e4:     	cset	x0, ne
1000005e8:     	ldp	x29, x30, [sp, #0x10]
1000005ec:     	add	sp, sp, #0x20
1000005f0:     	ret
1000005f4:     	add	x0, sp, #0x8
1000005f8:     	str	xzr, [sp, #0x8]
1000005fc:     	bl	0x100000d04 <_write+0x100000d04>
100000600:     	cbz	w0, 0x100000614 <_coil.alloc.Allocator$coil.alloc.MallocAllocator$allocate+0x60>
100000604:     	mov	x0, xzr
100000608:     	ldp	x29, x30, [sp, #0x10]
10000060c:     	add	sp, sp, #0x20
100000610:     	ret
100000614:     	ldr	x1, [sp, #0x8]
100000618:     	mov	w0, #0x1                ; =1
10000061c:     	ldp	x29, x30, [sp, #0x10]
100000620:     	add	sp, sp, #0x20
100000624:     	ret

0000000100000628 <_coil.alloc.Allocator$coil.alloc.MallocAllocator$deallocate>:
100000628:     	stp	x29, x30, [sp, #-0x10]!
10000062c:     	mov	x0, x1
100000630:     	mov	x29, sp
100000634:     	bl	0x100000ce0 <_write+0x100000ce0>
100000638:     	mov	x0, xzr
10000063c:     	ldp	x29, x30, [sp], #0x10
100000640:     	ret

0000000100000644 <_coil.alloc.Allocator$coil.alloc.MallocAllocator$remap>:
100000644:     	ldr	x8, [x3, #0x18]
100000648:     	cmp	x8, #0x11
10000064c:     	b.lt	0x100000658 <_coil.alloc.Allocator$coil.alloc.MallocAllocator$remap+0x14>
100000650:     	mov	x0, xzr
100000654:     	ret
100000658:     	stp	x29, x30, [sp, #-0x10]!
10000065c:     	ldr	x8, [x3, #0x10]
100000660:     	mov	x0, x1
100000664:     	mov	x29, sp
100000668:     	mov	x1, x8
10000066c:     	bl	0x100000d10 <_write+0x100000d10>
100000670:     	cmp	x0, #0x0
100000674:     	csel	x1, x8, x0, eq
100000678:     	cset	x0, ne
10000067c:     	ldp	x29, x30, [sp], #0x10
100000680:     	ret

0000000100000684 <_coil.alloc.Allocator$coil.alloc.MallocAllocator$resize>:
100000684:     	ldr	x8, [x3, #0x10]
100000688:     	ldr	x9, [x2, #0x10]
10000068c:     	cmp	x8, x9
100000690:     	cset	w0, le
100000694:     	ret

0000000100000698 <_coil.alloc.oom-puts>:
100000698:     	stp	x20, x19, [sp, #-0x20]!
10000069c:     	stp	x29, x30, [sp, #0x10]
1000006a0:     	add	x29, sp, #0x10
1000006a4:     	mov	x19, x0
1000006a8:     	bl	0x100000d1c <_write+0x100000d1c>
1000006ac:     	ldp	x29, x30, [sp, #0x10]
1000006b0:     	mov	x2, x0
1000006b4:     	mov	w0, #0x2                ; =2
1000006b8:     	mov	x1, x19
1000006bc:     	ldp	x20, x19, [sp], #0x20
1000006c0:     	b	0x100000d28 <_write+0x100000d28>

00000001000006c4 <_coil.alloc.sized-alloc>:
1000006c4:     	cbz	x4, 0x100000748 <_coil.alloc.sized-alloc+0x84>
1000006c8:     	sub	sp, sp, #0x70
1000006cc:     	stp	x20, x19, [sp, #0x50]
1000006d0:     	stp	x29, x30, [sp, #0x60]
1000006d4:     	add	x29, sp, #0x60
1000006d8:     	mov	x19, x0
1000006dc:     	add	x0, sp, #0x8
1000006e0:     	bl	0x1000008d0 <_coil.alloc.sized-request>
1000006e4:     	ldr	w8, [sp, #0x8]
1000006e8:     	cbz	w8, 0x100000754 <_coil.alloc.sized-alloc+0x90>
1000006ec:     	ldp	q0, q1, [sp, #0x10]
1000006f0:     	mov	x0, xzr
1000006f4:     	stp	q0, q1, [sp, #0x30]
1000006f8:     	ldr	x8, [sp, #0x38]
1000006fc:     	cmp	x8, #0x1
100000700:     	b.lt	0x100000758 <_coil.alloc.sized-alloc+0x94>
100000704:     	ldr	x8, [sp, #0x40]
100000708:     	cmp	x8, #0x1
10000070c:     	b.lt	0x100000738 <_coil.alloc.sized-alloc+0x74>
100000710:     	ldr	x8, [sp, #0x48]
100000714:     	mov	x0, xzr
100000718:     	subs	x9, x8, #0x1
10000071c:     	b.lt	0x100000758 <_coil.alloc.sized-alloc+0x94>
100000720:     	and	x8, x8, x9
100000724:     	cbnz	x8, 0x100000738 <_coil.alloc.sized-alloc+0x74>
100000728:     	ldp	x0, x8, [x19]
10000072c:     	add	x1, sp, #0x30
100000730:     	ldr	x8, [x8]
100000734:     	blr	x8
100000738:     	ldp	x29, x30, [sp, #0x60]
10000073c:     	ldp	x20, x19, [sp, #0x50]
100000740:     	add	sp, sp, #0x70
100000744:     	ret
100000748:     	mov	x1, xzr
10000074c:     	mov	w0, #0x1                ; =1
100000750:     	ret
100000754:     	mov	x0, xzr
100000758:     	ldp	x29, x30, [sp, #0x60]
10000075c:     	ldp	x20, x19, [sp, #0x50]
100000760:     	add	sp, sp, #0x70
100000764:     	ret

0000000100000768 <_coil.alloc.sized-free>:
100000768:     	cbz	x2, 0x1000007fc <_coil.alloc.sized-free+0x94>
10000076c:     	sub	sp, sp, #0x70
100000770:     	stp	x20, x19, [sp, #0x50]
100000774:     	stp	x29, x30, [sp, #0x60]
100000778:     	add	x29, sp, #0x60
10000077c:     	mov	x8, x2
100000780:     	mov	x19, x1
100000784:     	mov	x20, x0
100000788:     	add	x0, sp, #0x8
10000078c:     	mov	x1, x3
100000790:     	mov	x2, x4
100000794:     	mov	x3, x5
100000798:     	mov	x4, x8
10000079c:     	bl	0x1000008d0 <_coil.alloc.sized-request>
1000007a0:     	ldr	w8, [sp, #0x8]
1000007a4:     	cbz	w8, 0x1000007f0 <_coil.alloc.sized-free+0x88>
1000007a8:     	ldp	q0, q1, [sp, #0x10]
1000007ac:     	stp	q0, q1, [sp, #0x30]
1000007b0:     	ldr	x8, [sp, #0x38]
1000007b4:     	cmp	x8, #0x1
1000007b8:     	b.lt	0x1000007f0 <_coil.alloc.sized-free+0x88>
1000007bc:     	ldr	x8, [sp, #0x40]
1000007c0:     	cmp	x8, #0x1
1000007c4:     	b.lt	0x1000007f0 <_coil.alloc.sized-free+0x88>
1000007c8:     	ldr	x8, [sp, #0x48]
1000007cc:     	subs	x9, x8, #0x1
1000007d0:     	b.lt	0x1000007f0 <_coil.alloc.sized-free+0x88>
1000007d4:     	and	x8, x8, x9
1000007d8:     	cbnz	x8, 0x1000007f0 <_coil.alloc.sized-free+0x88>
1000007dc:     	ldp	x0, x8, [x20]
1000007e0:     	add	x2, sp, #0x30
1000007e4:     	mov	x1, x19
1000007e8:     	ldr	x8, [x8, #0x18]
1000007ec:     	blr	x8
1000007f0:     	ldp	x29, x30, [sp, #0x60]
1000007f4:     	ldp	x20, x19, [sp, #0x50]
1000007f8:     	add	sp, sp, #0x70
1000007fc:     	ret

0000000100000800 <_coil.alloc.sized-reallocate>:
100000800:     	stp	x26, x25, [sp, #-0x50]!
100000804:     	stp	x24, x23, [sp, #0x10]
100000808:     	stp	x22, x21, [sp, #0x20]
10000080c:     	stp	x20, x19, [sp, #0x30]
100000810:     	stp	x29, x30, [sp, #0x40]
100000814:     	add	x29, sp, #0x40
100000818:     	mov	x19, x6
10000081c:     	mov	x20, x5
100000820:     	mov	x21, x4
100000824:     	mov	x25, x3
100000828:     	mov	x22, x2
10000082c:     	mov	x23, x1
100000830:     	mov	x24, x0
100000834:     	bl	0x100000908 <_coil.alloc.sized-resize>
100000838:     	cmp	w0, #0x1
10000083c:     	b.eq	0x100000898 <_coil.alloc.sized-reallocate+0x98>
100000840:     	mov	x0, x24
100000844:     	mov	x1, x21
100000848:     	mov	x2, x20
10000084c:     	mov	x3, x19
100000850:     	mov	x4, x25
100000854:     	bl	0x1000006c4 <_coil.alloc.sized-alloc>
100000858:     	cbz	w0, 0x1000008b4 <_coil.alloc.sized-reallocate+0xb4>
10000085c:     	cmp	x22, x25
100000860:     	mov	x0, x1
100000864:     	csel	x8, x22, x25, lt
100000868:     	mov	x25, x1
10000086c:     	mov	x1, x23
100000870:     	mul	x2, x20, x8
100000874:     	bl	0x100000cf8 <_write+0x100000cf8>
100000878:     	mov	x0, x24
10000087c:     	mov	x1, x23
100000880:     	mov	x2, x22
100000884:     	mov	x3, x21
100000888:     	mov	x4, x20
10000088c:     	mov	x5, x19
100000890:     	bl	0x100000768 <_coil.alloc.sized-free>
100000894:     	mov	x1, x25
100000898:     	mov	w0, #0x1                ; =1
10000089c:     	ldp	x29, x30, [sp, #0x40]
1000008a0:     	ldp	x20, x19, [sp, #0x30]
1000008a4:     	ldp	x22, x21, [sp, #0x20]
1000008a8:     	ldp	x24, x23, [sp, #0x10]
1000008ac:     	ldp	x26, x25, [sp], #0x50
1000008b0:     	ret
1000008b4:     	mov	x0, xzr
1000008b8:     	ldp	x29, x30, [sp, #0x40]
1000008bc:     	ldp	x20, x19, [sp, #0x30]
1000008c0:     	ldp	x22, x21, [sp, #0x20]
1000008c4:     	ldp	x24, x23, [sp, #0x10]
1000008c8:     	ldp	x26, x25, [sp], #0x50
1000008cc:     	ret

00000001000008d0 <_coil.alloc.sized-request>:
1000008d0:     	cmp	x4, #0x1
1000008d4:     	b.lt	0x1000008e8 <_coil.alloc.sized-request+0x18>
1000008d8:     	mov	x8, #0x7fffffffffffffff ; =9223372036854775807
1000008dc:     	udiv	x8, x8, x2
1000008e0:     	cmp	x4, x8
1000008e4:     	b.ls	0x1000008f0 <_coil.alloc.sized-request+0x20>
1000008e8:     	str	wzr, [x0]
1000008ec:     	ret
1000008f0:     	mul	x8, x4, x2
1000008f4:     	mov	w9, #0x1                ; =1
1000008f8:     	stp	x1, x4, [x0, #0x8]
1000008fc:     	str	w9, [x0]
100000900:     	stp	x8, x3, [x0, #0x18]
100000904:     	ret

0000000100000908 <_coil.alloc.sized-resize>:
100000908:     	sub	sp, sp, #0xe0
10000090c:     	stp	x26, x25, [sp, #0x90]
100000910:     	stp	x24, x23, [sp, #0xa0]
100000914:     	stp	x22, x21, [sp, #0xb0]
100000918:     	stp	x20, x19, [sp, #0xc0]
10000091c:     	stp	x29, x30, [sp, #0xd0]
100000920:     	add	x29, sp, #0xd0
100000924:     	cbz	x3, 0x100000a14 <_coil.alloc.sized-resize+0x10c>
100000928:     	mov	x19, x3
10000092c:     	cbz	x2, 0x100000a54 <_coil.alloc.sized-resize+0x14c>
100000930:     	mov	x23, x0
100000934:     	mov	x24, x1
100000938:     	mov	x0, sp
10000093c:     	mov	x22, x4
100000940:     	mov	x1, x4
100000944:     	mov	x4, x2
100000948:     	mov	x2, x5
10000094c:     	mov	x3, x6
100000950:     	mov	x21, x5
100000954:     	mov	x20, x6
100000958:     	mov	x25, sp
10000095c:     	bl	0x1000008d0 <_coil.alloc.sized-request>
100000960:     	ldr	w8, [sp]
100000964:     	cbz	w8, 0x100000a30 <_coil.alloc.sized-resize+0x128>
100000968:     	add	x0, sp, #0x28
10000096c:     	mov	x1, x22
100000970:     	mov	x2, x21
100000974:     	mov	x3, x20
100000978:     	mov	x4, x19
10000097c:     	bl	0x1000008d0 <_coil.alloc.sized-request>
100000980:     	ldr	w8, [sp, #0x28]
100000984:     	cbz	w8, 0x100000a30 <_coil.alloc.sized-resize+0x128>
100000988:     	ldur	q0, [x25, #0x8]
10000098c:     	ldur	q1, [x25, #0x18]
100000990:     	mov	x0, xzr
100000994:     	stp	q0, q1, [sp, #0x50]
100000998:     	ldp	q0, q1, [sp, #0x30]
10000099c:     	ldr	x8, [sp, #0x58]
1000009a0:     	cmp	x8, #0x1
1000009a4:     	stp	q0, q1, [x29, #-0x60]
1000009a8:     	b.lt	0x100000a34 <_coil.alloc.sized-resize+0x12c>
1000009ac:     	ldr	x8, [sp, #0x60]
1000009b0:     	cmp	x8, #0x1
1000009b4:     	b.lt	0x100000a34 <_coil.alloc.sized-resize+0x12c>
1000009b8:     	ldr	x8, [sp, #0x68]
1000009bc:     	ldp	x11, x9, [x29, #-0x58]
1000009c0:     	sub	x10, x8, #0x1
1000009c4:     	and	x10, x8, x10
1000009c8:     	cmp	x9, #0x0
1000009cc:     	ccmp	x10, #0x0, #0x0, gt
1000009d0:     	ccmp	x11, #0x0, #0x4, eq
1000009d4:     	ccmp	x8, #0x0, #0x4, gt
1000009d8:     	b.le	0x100000a30 <_coil.alloc.sized-resize+0x128>
1000009dc:     	ldur	x8, [x29, #-0x48]
1000009e0:     	mov	x0, xzr
1000009e4:     	subs	x9, x8, #0x1
1000009e8:     	b.lt	0x100000a34 <_coil.alloc.sized-resize+0x12c>
1000009ec:     	and	x8, x8, x9
1000009f0:     	cbnz	x8, 0x100000a34 <_coil.alloc.sized-resize+0x12c>
1000009f4:     	ldp	x0, x8, [x23]
1000009f8:     	mov	x1, x24
1000009fc:     	add	x2, sp, #0x50
100000a00:     	sub	x3, x29, #0x60
100000a04:     	ldr	x8, [x8, #0x10]
100000a08:     	blr	x8
100000a0c:     	mov	x2, x1
100000a10:     	b	0x100000a34 <_coil.alloc.sized-resize+0x12c>
100000a14:     	mov	x3, x4
100000a18:     	mov	x4, x5
100000a1c:     	mov	x5, x6
100000a20:     	bl	0x100000768 <_coil.alloc.sized-free>
100000a24:     	mov	x2, xzr
100000a28:     	mov	w0, #0x1                ; =1
100000a2c:     	b	0x100000a34 <_coil.alloc.sized-resize+0x12c>
100000a30:     	mov	x0, xzr
100000a34:     	ldp	x29, x30, [sp, #0xd0]
100000a38:     	mov	x1, x2
100000a3c:     	ldp	x20, x19, [sp, #0xc0]
100000a40:     	ldp	x22, x21, [sp, #0xb0]
100000a44:     	ldp	x24, x23, [sp, #0xa0]
100000a48:     	ldp	x26, x25, [sp, #0x90]
100000a4c:     	add	sp, sp, #0xe0
100000a50:     	ret
100000a54:     	mov	x1, x4
100000a58:     	mov	x4, x19
100000a5c:     	mov	x2, x5
100000a60:     	ldp	x29, x30, [sp, #0xd0]
100000a64:     	mov	x3, x6
100000a68:     	ldp	x20, x19, [sp, #0xc0]
100000a6c:     	ldp	x22, x21, [sp, #0xb0]
100000a70:     	ldp	x24, x23, [sp, #0xa0]
100000a74:     	ldp	x26, x25, [sp, #0x90]
100000a78:     	add	sp, sp, #0xe0
100000a7c:     	b	0x1000006c4 <_coil.alloc.sized-alloc>

0000000100000a80 <_main>:
100000a80:     	sub	sp, sp, #0xa0
100000a84:     	stp	x28, x27, [sp, #0x40]
100000a88:     	stp	x26, x25, [sp, #0x50]
100000a8c:     	stp	x24, x23, [sp, #0x60]
100000a90:     	stp	x22, x21, [sp, #0x70]
100000a94:     	stp	x20, x19, [sp, #0x80]
100000a98:     	stp	x29, x30, [sp, #0x90]
100000a9c:     	add	x29, sp, #0x90
100000aa0:     	adrp	x8, 0x100008000 <_repl_static.coil.alloc.type-id__i8.0>
100000aa4:     	add	x8, x8, #0x4
100000aa8:     	stp	xzr, xzr, [sp, #0x8]
100000aac:     	stp	xzr, x8, [sp, #0x18]
100000ab0:     	adrp	x8, 0x100004000 <_write+0x100004000>
100000ab4:     	add	x8, x8, #0x50
100000ab8:     	str	x8, [sp, #0x28]
100000abc:     	adrp	x19, 0x100004000 <_write+0x100004000>
100000ac0:     	mov	x26, #-0xffffffffffff   ; =-281474976710655
100000ac4:     	ldr	x19, [x19, #0x40]
100000ac8:     	mov	x27, #0x1               ; =1
100000acc:     	mov	x28, #0x7               ; =7
100000ad0:     	mov	x23, xzr
100000ad4:     	mov	x24, xzr
100000ad8:     	mov	x1, xzr
100000adc:     	mov	x2, xzr
100000ae0:     	mov	x25, xzr
100000ae4:     	add	x22, sp, #0x8
100000ae8:     	movk	x26, #0xfff7, lsl #32
100000aec:     	movk	x27, #0x3, lsl #32
100000af0:     	movk	x28, #0xb, lsl #32
100000af4:     	mov	w21, #0x2               ; =2
100000af8:     	b	0x100000b20 <_main+0xa0>
100000afc:     	add	x8, x1, x24
100000b00:     	add	x25, x25, #0x1
100000b04:     	add	x24, x24, #0x10
100000b08:     	stp	x23, x26, [x8]
100000b0c:     	cmp	x25, #0x20
100000b10:     	add	x23, x23, x27
100000b14:     	add	x26, x26, x28
100000b18:     	str	x25, [sp, #0x10]
100000b1c:     	b.eq	0x100000b70 <_main+0xf0>
100000b20:     	cmp	x25, x2
100000b24:     	b.lt	0x100000afc <_main+0x7c>
100000b28:     	lsl	x8, x2, #1
100000b2c:     	cmp	x2, #0x0
100000b30:     	ldur	q0, [x22, #0x18]
100000b34:     	csel	x20, x21, x8, eq
100000b38:     	str	q0, [sp, #0x30]
100000b3c:     	cmp	x20, x2
100000b40:     	b.le	0x100000afc <_main+0x7c>
100000b44:     	add	x0, sp, #0x30
100000b48:     	mov	x3, x20
100000b4c:     	mov	x4, x19
100000b50:     	mov	w5, #0x10               ; =16
100000b54:     	mov	w6, #0x4                ; =4
100000b58:     	bl	0x100000800 <_coil.alloc.sized-reallocate>
100000b5c:     	cbz	w0, 0x100000c04 <_main+0x184>
100000b60:     	mov	x2, x20
100000b64:     	str	x1, [sp, #0x8]
100000b68:     	str	x20, [sp, #0x18]
100000b6c:     	b	0x100000afc <_main+0x7c>
100000b70:     	mov	w21, #0xc200            ; =49664
100000b74:     	mov	x20, xzr
100000b78:     	mov	x19, xzr
100000b7c:     	movk	w21, #0xbeb, lsl #16
100000b80:     	add	x0, sp, #0x8
100000b84:     	and	x1, x20, #0x1f
100000b88:     	bl	0x100000598 <_gap_aggregate_get>
100000b8c:     	add	x20, x20, #0x1
100000b90:     	add	x19, x0, x19
100000b94:     	cmp	x20, x21
100000b98:     	b.ne	0x100000b80 <_main+0x100>
100000b9c:     	ldr	x8, [sp, #0x10]
100000ba0:     	cbz	x8, 0x100000ba8 <_main+0x128>
100000ba4:     	str	xzr, [sp, #0x10]
100000ba8:     	ldr	x2, [sp, #0x18]
100000bac:     	cmp	x2, #0x1
100000bb0:     	b.lt	0x100000bd0 <_main+0x150>
100000bb4:     	adrp	x3, 0x100004000 <_write+0x100004000>
100000bb8:     	ldr	x1, [sp, #0x8]
100000bbc:     	add	x0, x22, #0x18
100000bc0:     	ldr	x3, [x3, #0x40]
100000bc4:     	mov	w4, #0x10               ; =16
100000bc8:     	mov	w5, #0x4                ; =4
100000bcc:     	bl	0x100000768 <_coil.alloc.sized-free>
100000bd0:     	mov	x8, #0x1b00             ; =6912
100000bd4:     	ldp	x29, x30, [sp, #0x90]
100000bd8:     	movk	x8, #0xc8e5, lsl #16
100000bdc:     	ldp	x22, x21, [sp, #0x70]
100000be0:     	movk	x8, #0xe, lsl #32
100000be4:     	ldp	x24, x23, [sp, #0x60]
100000be8:     	cmp	x19, x8
100000bec:     	ldp	x20, x19, [sp, #0x80]
100000bf0:     	ldp	x26, x25, [sp, #0x50]
100000bf4:     	cset	w0, ne
100000bf8:     	ldp	x28, x27, [sp, #0x40]
100000bfc:     	add	sp, sp, #0xa0
100000c00:     	ret
100000c04:     	adrp	x1, 0x100000000 <_write+0x100000000>
100000c08:     	add	x1, x1, #0xd40
100000c0c:     	mov	w0, #0x2                ; =2
100000c10:     	mov	w2, #0xf                ; =15
100000c14:     	lsl	x19, x20, #4
100000c18:     	bl	0x100000d28 <_write+0x100000d28>
100000c1c:     	adrp	x1, 0x100000000 <_write+0x100000000>
100000c20:     	add	x1, x1, #0xd90
100000c24:     	mov	w0, #0x2                ; =2
100000c28:     	mov	w2, #0x12               ; =18
100000c2c:     	bl	0x100000d28 <_write+0x100000d28>
100000c30:     	adrp	x1, 0x100000000 <_write+0x100000000>
100000c34:     	add	x1, x1, #0xd50
100000c38:     	mov	w0, #0x2                ; =2
100000c3c:     	mov	w2, #0x13               ; =19
100000c40:     	bl	0x100000d28 <_write+0x100000d28>
100000c44:     	tbnz	x19, #0x3f, 0x100000cc4 <_main+0x244>
100000c48:     	adrp	x1, 0x100000000 <_write+0x100000000>
100000c4c:     	add	x1, x1, #0xd64
100000c50:     	mov	w0, #0x2                ; =2
100000c54:     	mov	w2, #0x1                ; =1
100000c58:     	bl	0x100000d28 <_write+0x100000d28>
100000c5c:     	mov	x9, #-0x3333333333333334 ; =-3689348814741910324
100000c60:     	mov	x8, xzr
100000c64:     	mov	w10, #0xa               ; =10
100000c68:     	movk	x9, #0xcccd
100000c6c:     	adrp	x14, 0x100008000 <_repl_static.coil.alloc.type-id__i8.0>
100000c70:     	add	x14, x14, #0x4
100000c74:     	umulh	x11, x19, x9
100000c78:     	add	x13, x14, x8
100000c7c:     	cmp	x19, #0x9
100000c80:     	sub	x8, x8, #0x1
100000c84:     	lsr	x11, x11, #3
100000c88:     	msub	w12, w11, w10, w19
100000c8c:     	mov	x19, x11
100000c90:     	orr	w12, w12, #0x30
100000c94:     	strb	w12, [x13, #0x18]
100000c98:     	b.hi	0x100000c74 <_main+0x1f4>
100000c9c:     	neg	x2, x8
100000ca0:     	add	x8, x14, x8
100000ca4:     	mov	w0, #0x2                ; =2
100000ca8:     	add	x1, x8, #0x19
100000cac:     	bl	0x100000d28 <_write+0x100000d28>
100000cb0:     	adrp	x1, 0x100000000 <_write+0x100000000>
100000cb4:     	add	x1, x1, #0xd66
100000cb8:     	mov	w0, #0x2                ; =2
100000cbc:     	mov	w2, #0x6                ; =6
100000cc0:     	bl	0x100000d28 <_write+0x100000d28>
100000cc4:     	adrp	x0, 0x100000000 <_write+0x100000000>
100000cc8:     	add	x0, x0, #0xd70
100000ccc:     	bl	0x100000698 <_coil.alloc.oom-puts>
100000cd0:     	bl	0x100000cd4 <_write+0x100000cd4>

Disassembly of section __TEXT,__stubs:

0000000100000cd4 <__stubs>:
100000cd4:     	adrp	x16, 0x100004000 <_write+0x100004000>
100000cd8:     	ldr	x16, [x16]
100000cdc:     	br	x16
100000ce0:     	adrp	x16, 0x100004000 <_write+0x100004000>
100000ce4:     	ldr	x16, [x16, #0x8]
100000ce8:     	br	x16
100000cec:     	adrp	x16, 0x100004000 <_write+0x100004000>
100000cf0:     	ldr	x16, [x16, #0x10]
100000cf4:     	br	x16
100000cf8:     	adrp	x16, 0x100004000 <_write+0x100004000>
100000cfc:     	ldr	x16, [x16, #0x18]
100000d00:     	br	x16
100000d04:     	adrp	x16, 0x100004000 <_write+0x100004000>
100000d08:     	ldr	x16, [x16, #0x20]
100000d0c:     	br	x16
100000d10:     	adrp	x16, 0x100004000 <_write+0x100004000>
100000d14:     	ldr	x16, [x16, #0x28]
100000d18:     	br	x16
100000d1c:     	adrp	x16, 0x100004000 <_write+0x100004000>
100000d20:     	ldr	x16, [x16, #0x30]
100000d24:     	br	x16
100000d28:     	adrp	x16, 0x100004000 <_write+0x100004000>
100000d2c:     	ldr	x16, [x16, #0x38]
100000d30:     	br	x16
