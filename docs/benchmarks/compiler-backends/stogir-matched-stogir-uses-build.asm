
build/bin/coil-normal-stogir-s3:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001006e6638 <_stogir.uses.build>:
1006e6638:     	sub	sp, sp, #0x330
1006e663c:     	str	x29, [sp, #0x10]
1006e6640:     	str	x30, [sp, #0x18]
1006e6644:     	add	x29, sp, #0x10
1006e6648:     	sub	sp, sp, #0x50
1006e664c:     	add	x2, sp, #0x10
1006e6650:     	sub	sp, sp, #0x50
1006e6654:     	add	x3, sp, #0x10
1006e6658:     	sub	sp, sp, #0x50
1006e665c:     	add	x4, sp, #0x10
1006e6660:     	sub	sp, sp, #0x30
1006e6664:     	add	x5, sp, #0x10
1006e6668:     	sub	sp, sp, #0x30
1006e666c:     	add	x6, sp, #0x10
1006e6670:     	sub	sp, sp, #0x50
1006e6674:     	add	x7, sp, #0x10
1006e6678:     	sub	sp, sp, #0x30
1006e667c:     	add	x9, sp, #0x10
1006e6680:     	sub	sp, sp, #0x30
1006e6684:     	add	x10, sp, #0x10
1006e6688:     	sub	sp, sp, #0x10
1006e668c:     	add	x11, sp, #0x10
1006e6690:     	sub	sp, sp, #0x10
1006e6694:     	add	x12, sp, #0x10
1006e6698:     	sub	sp, sp, #0x10
1006e669c:     	add	x13, sp, #0x10
1006e66a0:     	sub	sp, sp, #0x10
1006e66a4:     	add	x14, sp, #0x10
1006e66a8:     	sub	sp, sp, #0x10
1006e66ac:     	add	x15, sp, #0x10
1006e66b0:     	str	x0, [x29, #0x10]
1006e66b4:     	sub	sp, sp, #0x10
1006e66b8:     	add	x0, sp, #0x10
1006e66bc:     	str	x0, [x29, #0x18]
1006e66c0:     	sub	sp, sp, #0x10
1006e66c4:     	add	x0, sp, #0x10
1006e66c8:     	str	x0, [x29, #0x20]
1006e66cc:     	sub	sp, sp, #0x10
1006e66d0:     	add	x0, sp, #0x10
1006e66d4:     	str	x0, [x29, #0x28]
1006e66d8:     	sub	sp, sp, #0x10
1006e66dc:     	add	x0, sp, #0x10
1006e66e0:     	str	x0, [x29, #0x30]
1006e66e4:     	sub	sp, sp, #0x10
1006e66e8:     	add	x0, sp, #0x10
1006e66ec:     	str	x0, [x29, #0x38]
1006e66f0:     	sub	sp, sp, #0x10
1006e66f4:     	add	x0, sp, #0x10
1006e66f8:     	str	x0, [x29, #0x40]
1006e66fc:     	sub	sp, sp, #0x10
1006e6700:     	add	x0, sp, #0x10
1006e6704:     	str	x0, [x29, #0x48]
1006e6708:     	sub	sp, sp, #0x10
1006e670c:     	add	x0, sp, #0x10
1006e6710:     	str	x0, [x29, #0x50]
1006e6714:     	sub	sp, sp, #0x10
1006e6718:     	add	x0, sp, #0x10
1006e671c:     	str	x0, [x29, #0x58]
1006e6720:     	sub	sp, sp, #0x10
1006e6724:     	add	x0, sp, #0x10
1006e6728:     	str	x0, [x29, #0x60]
1006e672c:     	sub	sp, sp, #0x10
1006e6730:     	add	x0, sp, #0x10
1006e6734:     	str	x0, [x29, #0x68]
1006e6738:     	sub	sp, sp, #0x10
1006e673c:     	add	x0, sp, #0x10
1006e6740:     	str	x0, [x29, #0x70]
1006e6744:     	sub	sp, sp, #0x10
1006e6748:     	add	x0, sp, #0x10
1006e674c:     	str	x0, [x29, #0x78]
1006e6750:     	sub	sp, sp, #0x10
1006e6754:     	add	x0, sp, #0x10
1006e6758:     	str	x0, [x29, #0x80]
1006e675c:     	sub	sp, sp, #0x50
1006e6760:     	add	x0, sp, #0x10
1006e6764:     	str	x0, [x29, #0x88]
1006e6768:     	movz	x0, #0x0, lsl #48
1006e676c:     	b	0x1006e678c <_stogir.uses.build+0x154>
1006e6770:     	str	x1, [x29, #0x90]
1006e6774:     	add	x1, x0, #0x8
1006e6778:     	add	x0, x4, x0
1006e677c:     	movz	x17, #0x0, lsl #48
1006e6780:     	str	x17, [x0]
1006e6784:     	mov	x0, x1
1006e6788:     	ldr	x1, [x29, #0x90]
1006e678c:     	mov	x17, #0x50              ; =80
1006e6790:     	cmp	x0, x17
1006e6794:     	b.lo	0x1006e6770 <_stogir.uses.build+0x138>
1006e6798:     	str	x1, [x29, #0x90]
1006e679c:     	orr	x0, x3, xzr
1006e67a0:     	orr	x1, x0, xzr
1006e67a4:     	movz	x3, #0x0, lsl #48
1006e67a8:     	b	0x1006e67d8 <_stogir.uses.build+0x1a0>
1006e67ac:     	nop
1006e67b0:     	str	x2, [x29, #0x98]
1006e67b4:     	add	x2, x3, #0x8
1006e67b8:     	str	x1, [x29, #0xa0]
1006e67bc:     	add	x1, x1, x3
1006e67c0:     	add	x3, x4, x3
1006e67c4:     	ldr	x3, [x3]
1006e67c8:     	str	x3, [x1]
1006e67cc:     	ldr	x1, [x29, #0xa0]
1006e67d0:     	mov	x3, x2
1006e67d4:     	ldr	x2, [x29, #0x98]
1006e67d8:     	mov	x17, #0x50              ; =80
1006e67dc:     	cmp	x3, x17
1006e67e0:     	b.lo	0x1006e67b0 <_stogir.uses.build+0x178>
1006e67e4:     	str	x2, [x29, #0x98]
1006e67e8:     	str	x1, [x29, #0xa0]
1006e67ec:     	orr	x1, x5, xzr
1006e67f0:     	orr	x2, x6, xzr
1006e67f4:     	orr	x3, x7, xzr
1006e67f8:     	add	x0, x0, #0x28
1006e67fc:     	str	x8, [x29, #0xa8]
1006e6800:     	str	x9, [x29, #0xb0]
1006e6804:     	str	x10, [x29, #0xb8]
1006e6808:     	str	x11, [x29, #0xc0]
1006e680c:     	str	x12, [x29, #0xc8]
1006e6810:     	str	x13, [x29, #0xd0]
1006e6814:     	str	x14, [x29, #0xd8]
1006e6818:     	str	x15, [x29, #0xe0]
1006e681c:     	str	x1, [x29, #0xe8]
1006e6820:     	str	x2, [x29, #0xf0]
1006e6824:     	str	x3, [x29, #0xf8]
1006e6828:     	str	x0, [x29, #0x100]
1006e682c:     	mov	x8, x1
1006e6830:     	ldr	x0, [x29, #0x90]
1006e6834:     	bl	0x1007ce35c <_inherent$coil.arraylist.ArrayList$new__stogir.uses.Range>
1006e6838:     	ldr	x0, [x29, #0xe8]
1006e683c:     	ldr	x1, [x0]
1006e6840:     	ldr	x2, [x29, #0xa0]
1006e6844:     	str	x1, [x2]
1006e6848:     	ldr	x1, [x0, #0x8]
1006e684c:     	str	x1, [x2, #0x8]
1006e6850:     	ldr	x1, [x0, #0x10]
1006e6854:     	str	x1, [x2, #0x10]
1006e6858:     	ldr	x1, [x0, #0x18]
1006e685c:     	str	x1, [x2, #0x18]
1006e6860:     	ldr	x0, [x0, #0x20]
1006e6864:     	str	x0, [x2, #0x20]
1006e6868:     	str	x2, [x29, #0xa0]
1006e686c:     	ldr	x8, [x29, #0xf0]
1006e6870:     	ldr	x0, [x29, #0x90]
1006e6874:     	bl	0x1007ce46c <_inherent$coil.arraylist.ArrayList$new__stogir.uses.Use>
1006e6878:     	ldr	x0, [x29, #0xf0]
1006e687c:     	ldr	x1, [x0]
1006e6880:     	ldr	x2, [x29, #0x100]
1006e6884:     	str	x1, [x2]
1006e6888:     	ldr	x1, [x0, #0x8]
1006e688c:     	str	x1, [x2, #0x8]
1006e6890:     	ldr	x1, [x0, #0x10]
1006e6894:     	str	x1, [x2, #0x10]
1006e6898:     	ldr	x1, [x0, #0x18]
1006e689c:     	str	x1, [x2, #0x18]
1006e68a0:     	ldr	x0, [x0, #0x20]
1006e68a4:     	str	x0, [x2, #0x20]
1006e68a8:     	movz	x0, #0x0, lsl #48
1006e68ac:     	b	0x1006e68d8 <_stogir.uses.build+0x2a0>
1006e68b0:     	add	x1, x0, #0x8
1006e68b4:     	ldr	x2, [x29, #0xf8]
1006e68b8:     	add	x3, x2, x0
1006e68bc:     	ldr	x4, [x29, #0xa0]
1006e68c0:     	add	x0, x4, x0
1006e68c4:     	ldr	x0, [x0]
1006e68c8:     	str	x0, [x3]
1006e68cc:     	str	x4, [x29, #0xa0]
1006e68d0:     	str	x2, [x29, #0xf8]
1006e68d4:     	mov	x0, x1
1006e68d8:     	mov	x17, #0x50              ; =80
1006e68dc:     	cmp	x0, x17
1006e68e0:     	b.lo	0x1006e68b0 <_stogir.uses.build+0x278>
1006e68e4:     	ldr	x2, [x29, #0xf8]
1006e68e8:     	ldr	x0, [x29, #0x98]
1006e68ec:     	orr	x1, x0, xzr
1006e68f0:     	movz	x3, #0x0, lsl #48
1006e68f4:     	b	0x1006e6910 <_stogir.uses.build+0x2d8>
1006e68f8:     	add	x4, x3, #0x8
1006e68fc:     	add	x5, x1, x3
1006e6900:     	add	x3, x2, x3
1006e6904:     	ldr	x3, [x3]
1006e6908:     	str	x3, [x5]
1006e690c:     	mov	x3, x4
1006e6910:     	mov	x17, #0x50              ; =80
1006e6914:     	cmp	x3, x17
1006e6918:     	b.lo	0x1006e68f8 <_stogir.uses.build+0x2c0>
1006e691c:     	ldr	x2, [x29, #0xb0]
1006e6920:     	ldr	x3, [x29, #0xb8]
1006e6924:     	ldr	x4, [x29, #0xc0]
1006e6928:     	ldr	x5, [x29, #0xc8]
1006e692c:     	ldr	x6, [x29, #0xd0]
1006e6930:     	orr	x7, x2, xzr
1006e6934:     	orr	x8, x4, xzr
1006e6938:     	add	x4, x4, #0x8
1006e693c:     	orr	x9, x6, xzr
1006e6940:     	add	x6, x6, #0x8
1006e6944:     	str	x0, [x29, #0x108]
1006e6948:     	str	x1, [x29, #0x110]
1006e694c:     	str	x2, [x29, #0x118]
1006e6950:     	str	x7, [x29, #0x120]
1006e6954:     	str	x3, [x29, #0x128]
1006e6958:     	str	x8, [x29, #0x130]
1006e695c:     	str	x4, [x29, #0x138]
1006e6960:     	str	x5, [x29, #0x140]
1006e6964:     	str	x9, [x29, #0x148]
1006e6968:     	str	x6, [x29, #0x150]
1006e696c:     	mov	x8, x3
1006e6970:     	ldr	x0, [x29, #0x90]
1006e6974:     	bl	0x10002e350 <_inherent$coil.arraylist.ArrayList$new__i64>
1006e6978:     	ldr	x0, [x29, #0x138]
1006e697c:     	ldr	x1, [x29, #0x150]
1006e6980:     	ldr	x2, [x29, #0x128]
1006e6984:     	ldr	x3, [x2]
1006e6988:     	ldr	x4, [x29, #0x120]
1006e698c:     	str	x3, [x4]
1006e6990:     	ldr	x3, [x2, #0x8]
1006e6994:     	str	x3, [x4, #0x8]
1006e6998:     	ldr	x3, [x2, #0x10]
1006e699c:     	str	x3, [x4, #0x10]
1006e69a0:     	ldr	x3, [x2, #0x18]
1006e69a4:     	str	x3, [x4, #0x18]
1006e69a8:     	ldr	x2, [x2, #0x20]
1006e69ac:     	str	x2, [x4, #0x20]
1006e69b0:     	movz	x2, #0x0, lsl #48
1006e69b4:     	b	0x1006e6a5c <_stogir.uses.build+0x424>
1006e69b8:     	ldr	x0, [x29, #0x140]
1006e69bc:     	movz	x17, #0x0, lsl #48
1006e69c0:     	str	x17, [x0]
1006e69c4:     	movz	x17, #0x0, lsl #48
1006e69c8:     	str	x17, [x0, #0x8]
1006e69cc:     	ldr	x2, [x0]
1006e69d0:     	ldr	x3, [x29, #0x130]
1006e69d4:     	str	x2, [x3]
1006e69d8:     	ldr	x2, [x0, #0x8]
1006e69dc:     	str	x2, [x3, #0x8]
1006e69e0:     	movz	x17, #0x0, lsl #48
1006e69e4:     	str	x17, [x3]
1006e69e8:     	ldr	x2, [x29, #0x158]
1006e69ec:     	movz	x17, #0x0, lsl #48
1006e69f0:     	str	x17, [x2]
1006e69f4:     	ldr	x4, [x3]
1006e69f8:     	ldr	x5, [x29, #0x148]
1006e69fc:     	str	x4, [x5]
1006e6a00:     	ldr	x4, [x3, #0x8]
1006e6a04:     	str	x4, [x5, #0x8]
1006e6a08:     	ldr	x4, [x5]
1006e6a0c:     	ldr	x6, [x29, #0x160]
1006e6a10:     	ldr	x7, [x6]
1006e6a14:     	str	x1, [x29, #0x168]
1006e6a18:     	str	x0, [x29, #0x140]
1006e6a1c:     	str	x3, [x29, #0x130]
1006e6a20:     	str	x2, [x29, #0x158]
1006e6a24:     	str	x5, [x29, #0x148]
1006e6a28:     	str	x6, [x29, #0x160]
1006e6a2c:     	ldr	x0, [x29, #0x108]
1006e6a30:     	mov	x1, x4
1006e6a34:     	mov	x2, x7
1006e6a38:     	bl	0x1007ce57c <_coil.core.Push$coil.arraylist.ArrayList$push!__stogir.uses.Range>
1006e6a3c:     	ldr	x0, [x29, #0x118]
1006e6a40:     	movz	x1, #0x0, lsl #48
1006e6a44:     	bl	0x10002e694 <_coil.core.Push$coil.arraylist.ArrayList$push!__i64>
1006e6a48:     	ldr	x0, [x29, #0x168]
1006e6a4c:     	add	x0, x0, #0x1
1006e6a50:     	ldr	x1, [x29, #0x160]
1006e6a54:     	mov	x2, x0
1006e6a58:     	ldr	x0, [x29, #0x158]
1006e6a5c:     	str	x0, [x29, #0x158]
1006e6a60:     	str	x1, [x29, #0x160]
1006e6a64:     	str	x2, [x29, #0x168]
1006e6a68:     	ldr	x0, [x29, #0x10]
1006e6a6c:     	bl	0x1006d172c <_coil.core.Len$coil.arraylist.ArrayList$len__stogir.node.Node>
1006e6a70:     	ldr	x1, [x29, #0x168]
1006e6a74:     	cmp	x1, x0
1006e6a78:     	b.lt	0x1006e69b8 <_stogir.uses.build+0x380>
1006e6a7c:     	ldr	x0, [x29, #0xd8]
1006e6a80:     	ldr	x1, [x29, #0xe0]
1006e6a84:     	ldr	x2, [x29, #0x18]
1006e6a88:     	ldr	x3, [x29, #0x20]
1006e6a8c:     	ldr	x4, [x29, #0x28]
1006e6a90:     	ldr	x5, [x29, #0x30]
1006e6a94:     	ldr	x6, [x29, #0x38]
1006e6a98:     	ldr	x7, [x29, #0x40]
1006e6a9c:     	ldr	x8, [x29, #0x48]
1006e6aa0:     	ldr	x9, [x29, #0x50]
1006e6aa4:     	ldr	x10, [x29, #0x58]
1006e6aa8:     	ldr	x11, [x29, #0x60]
1006e6aac:     	ldr	x12, [x29, #0x68]
1006e6ab0:     	ldr	x13, [x29, #0x70]
1006e6ab4:     	ldr	x14, [x29, #0x78]
1006e6ab8:     	ldr	x15, [x29, #0x80]
1006e6abc:     	str	x15, [x29, #0x170]
1006e6ac0:     	ldr	x15, [x29, #0x10]
1006e6ac4:     	str	x15, [x29, #0x10]
1006e6ac8:     	add	x15, x15, #0x78
1006e6acc:     	str	x15, [x29, #0x178]
1006e6ad0:     	ldr	x15, [x29, #0x108]
1006e6ad4:     	str	x14, [x29, #0x180]
1006e6ad8:     	add	x14, x15, #0x28
1006e6adc:     	str	x14, [x29, #0x188]
1006e6ae0:     	add	x14, x15, #0x28
1006e6ae4:     	str	x0, [x29, #0x190]
1006e6ae8:     	str	x0, [x29, #0x198]
1006e6aec:     	orr	x0, x1, xzr
1006e6af0:     	add	x1, x1, #0x8
1006e6af4:     	str	x0, [x29, #0x1a0]
1006e6af8:     	orr	x0, x2, xzr
1006e6afc:     	add	x2, x2, #0x8
1006e6b00:     	str	x0, [x29, #0x1a8]
1006e6b04:     	orr	x0, x3, xzr
1006e6b08:     	str	x0, [x29, #0x1b0]
1006e6b0c:     	add	x0, x3, #0x8
1006e6b10:     	add	x3, x3, #0x8
1006e6b14:     	str	x14, [x29, #0x1b8]
1006e6b18:     	orr	x14, x4, xzr
1006e6b1c:     	str	x14, [x29, #0x1c0]
1006e6b20:     	add	x14, x4, #0x8
1006e6b24:     	str	x4, [x29, #0x1c8]
1006e6b28:     	orr	x4, x5, xzr
1006e6b2c:     	add	x5, x5, #0x8
1006e6b30:     	str	x4, [x29, #0x1d0]
1006e6b34:     	orr	x4, x6, xzr
1006e6b38:     	add	x6, x6, #0x8
1006e6b3c:     	str	x4, [x29, #0x1d8]
1006e6b40:     	orr	x4, x7, xzr
1006e6b44:     	add	x7, x7, #0x4
1006e6b48:     	str	x4, [x29, #0x1e0]
1006e6b4c:     	orr	x4, x10, xzr
1006e6b50:     	add	x10, x10, #0x8
1006e6b54:     	str	x4, [x29, #0x1e8]
1006e6b58:     	orr	x4, x11, xzr
1006e6b5c:     	add	x11, x11, #0x8
1006e6b60:     	str	x4, [x29, #0x1f0]
1006e6b64:     	orr	x4, x12, xzr
1006e6b68:     	add	x12, x12, #0x8
1006e6b6c:     	str	x4, [x29, #0x1f8]
1006e6b70:     	orr	x4, x13, xzr
1006e6b74:     	add	x13, x13, #0x4
1006e6b78:     	str	x4, [x29, #0x200]
1006e6b7c:     	ldr	x4, [x29, #0x180]
1006e6b80:     	str	x4, [x29, #0x208]
1006e6b84:     	ldr	x4, [x29, #0x170]
1006e6b88:     	str	x0, [x29, #0x210]
1006e6b8c:     	movz	x0, #0x0, lsl #48
1006e6b90:     	b	0x1006e6d70 <_stogir.uses.build+0x738>
1006e6b94:     	nop
1006e6b98:     	sub	sp, sp, #0x10
1006e6b9c:     	add	x0, sp, #0x10
1006e6ba0:     	str	x1, [x29, #0x2f0]
1006e6ba4:     	str	x0, [x29, #0x300]
1006e6ba8:     	mov	x16, x0
1006e6bac:     	str	x16, [sp]
1006e6bb0:     	ldr	x0, [x29, #0x108]
1006e6bb4:     	bl	0x1007ce65c <_coil.core.Get$coil.arraylist.ArrayList$get__stogir.uses.Range>
1006e6bb8:     	ldr	x16, [sp]
1006e6bbc:     	str	x0, [x16]
1006e6bc0:     	str	x1, [x16, #0x8]
1006e6bc4:     	ldr	x0, [x29, #0x300]
1006e6bc8:     	ldr	x1, [x0]
1006e6bcc:     	ldr	x0, [x0, #0x8]
1006e6bd0:     	ldr	x2, [x29, #0x1f0]
1006e6bd4:     	str	x1, [x2]
1006e6bd8:     	ldr	x1, [x29, #0x280]
1006e6bdc:     	str	x0, [x1]
1006e6be0:     	ldr	x0, [x2]
1006e6be4:     	ldr	x3, [x29, #0x1e8]
1006e6be8:     	str	x0, [x3]
1006e6bec:     	ldr	x0, [x2, #0x8]
1006e6bf0:     	str	x0, [x3, #0x8]
1006e6bf4:     	ldr	x0, [x29, #0x2f8]
1006e6bf8:     	str	x0, [x3]
1006e6bfc:     	ldr	x4, [x3]
1006e6c00:     	ldr	x5, [x29, #0x1f8]
1006e6c04:     	str	x4, [x5]
1006e6c08:     	ldr	x4, [x3, #0x8]
1006e6c0c:     	str	x4, [x5, #0x8]
1006e6c10:     	ldr	x4, [x5]
1006e6c14:     	ldr	x6, [x29, #0x288]
1006e6c18:     	ldr	x7, [x6]
1006e6c1c:     	str	x2, [x29, #0x1f0]
1006e6c20:     	str	x1, [x29, #0x280]
1006e6c24:     	str	x3, [x29, #0x1e8]
1006e6c28:     	str	x0, [x29, #0x2f8]
1006e6c2c:     	str	x5, [x29, #0x1f8]
1006e6c30:     	str	x6, [x29, #0x288]
1006e6c34:     	ldr	x0, [x29, #0x108]
1006e6c38:     	ldr	x1, [x29, #0x2f0]
1006e6c3c:     	mov	x2, x4
1006e6c40:     	mov	x3, x7
1006e6c44:     	bl	0x1007ce6c8 <_coil.core.Set$coil.arraylist.ArrayList$set!__stogir.uses.Range>
1006e6c48:     	ldr	x0, [x29, #0x118]
1006e6c4c:     	ldr	x1, [x29, #0x2f0]
1006e6c50:     	ldr	x2, [x29, #0x2f8]
1006e6c54:     	bl	0x10002f500 <_coil.core.Set$coil.arraylist.ArrayList$set!__i64>
1006e6c58:     	ldr	x0, [x29, #0x278]
1006e6c5c:     	ldr	x1, [x0]
1006e6c60:     	ldr	x2, [x29, #0x2f0]
1006e6c64:     	add	x2, x2, #0x1
1006e6c68:     	ldr	x3, [x29, #0x2f8]
1006e6c6c:     	add	x1, x1, x3
1006e6c70:     	str	x0, [x29, #0x278]
1006e6c74:     	mov	x0, x2
1006e6c78:     	str	x0, [x29, #0x2f0]
1006e6c7c:     	str	x1, [x29, #0x2f8]
1006e6c80:     	ldr	x0, [x29, #0x108]
1006e6c84:     	bl	0x1007ce844 <_coil.core.Len$coil.arraylist.ArrayList$len__stogir.uses.Range>
1006e6c88:     	ldr	x1, [x29, #0x2f0]
1006e6c8c:     	cmp	x1, x0
1006e6c90:     	b.lt	0x1006e6b98 <_stogir.uses.build+0x560>
1006e6c94:     	ldr	x3, [x29, #0x2f8]
1006e6c98:     	ldr	x0, [x29, #0x278]
1006e6c9c:     	movz	x1, #0x0, lsl #48
1006e6ca0:     	b	0x1006e6d20 <_stogir.uses.build+0x6e8>
1006e6ca4:     	nop
1006e6ca8:     	ldr	x2, [x29, #0x208]
1006e6cac:     	movz	x17, #0x0, lsl #48
1006e6cb0:     	str	x17, [x2]
1006e6cb4:     	ldr	x4, [x2]
1006e6cb8:     	ldr	x5, [x29, #0x200]
1006e6cbc:     	str	x4, [x5]
1006e6cc0:     	movz	w17, #0x0, lsl #16
1006e6cc4:     	str	w17, [x5]
1006e6cc8:     	ldr	x4, [x29, #0x290]
1006e6ccc:     	movz	w17, #0x0, lsl #16
1006e6cd0:     	str	w17, [x4]
1006e6cd4:     	ldr	x6, [x5]
1006e6cd8:     	ldr	x7, [x29, #0x238]
1006e6cdc:     	str	x6, [x7]
1006e6ce0:     	ldr	x6, [x7]
1006e6ce4:     	str	x0, [x29, #0x278]
1006e6ce8:     	str	x3, [x29, #0x2f8]
1006e6cec:     	str	x1, [x29, #0x308]
1006e6cf0:     	str	x2, [x29, #0x208]
1006e6cf4:     	str	x5, [x29, #0x200]
1006e6cf8:     	str	x4, [x29, #0x290]
1006e6cfc:     	str	x7, [x29, #0x238]
1006e6d00:     	ldr	x0, [x29, #0x1b8]
1006e6d04:     	mov	x1, x6
1006e6d08:     	bl	0x1007ce850 <_coil.core.Push$coil.arraylist.ArrayList$push!__stogir.uses.Use>
1006e6d0c:     	ldr	x0, [x29, #0x308]
1006e6d10:     	add	x0, x0, #0x1
1006e6d14:     	ldr	x3, [x29, #0x2f8]
1006e6d18:     	mov	x1, x0
1006e6d1c:     	ldr	x0, [x29, #0x278]
1006e6d20:     	cmp	x1, x3
1006e6d24:     	b.lt	0x1006e6ca8 <_stogir.uses.build+0x670>
1006e6d28:     	str	x0, [x29, #0x278]
1006e6d2c:     	ldr	x0, [x29, #0x218]
1006e6d30:     	add	x0, x0, #0x1
1006e6d34:     	ldr	x15, [x29, #0x108]
1006e6d38:     	ldr	x1, [x29, #0x240]
1006e6d3c:     	ldr	x2, [x29, #0x248]
1006e6d40:     	ldr	x3, [x29, #0x250]
1006e6d44:     	ldr	x5, [x29, #0x260]
1006e6d48:     	ldr	x14, [x29, #0x258]
1006e6d4c:     	ldr	x6, [x29, #0x268]
1006e6d50:     	ldr	x8, [x29, #0x228]
1006e6d54:     	ldr	x7, [x29, #0x270]
1006e6d58:     	ldr	x9, [x29, #0x230]
1006e6d5c:     	ldr	x11, [x29, #0x280]
1006e6d60:     	ldr	x12, [x29, #0x288]
1006e6d64:     	ldr	x10, [x29, #0x278]
1006e6d68:     	ldr	x13, [x29, #0x290]
1006e6d6c:     	ldr	x4, [x29, #0x238]
1006e6d70:     	mov	x17, #0x2               ; =2
1006e6d74:     	cmp	x0, x17
1006e6d78:     	b.ge	0x1006e71b4 <_stogir.uses.build+0xb7c>
1006e6d7c:     	str	x0, [x29, #0x218]
1006e6d80:     	movz	x17, #0x0, lsl #48
1006e6d84:     	cmp	x0, x17
1006e6d88:     	cset	w0, eq
1006e6d8c:     	str	w0, [x29, #0x220]
1006e6d90:     	mov	x0, #0x1                ; =1
1006e6d94:     	b	0x1006e70b4 <_stogir.uses.build+0xa7c>
1006e6d98:     	ldr	x4, [x29, #0x258]
1006e6d9c:     	ldr	x5, [x4]
1006e6da0:     	add	x5, x5, #0x1
1006e6da4:     	str	x5, [x4]
1006e6da8:     	ldr	x5, [x29, #0x1c8]
1006e6dac:     	ldr	x6, [x5]
1006e6db0:     	ldr	x7, [x29, #0x1d8]
1006e6db4:     	str	x6, [x7]
1006e6db8:     	ldr	x6, [x5, #0x8]
1006e6dbc:     	str	x6, [x7, #0x8]
1006e6dc0:     	ldr	x6, [x7]
1006e6dc4:     	ldr	x8, [x29, #0x268]
1006e6dc8:     	ldr	x9, [x8]
1006e6dcc:     	str	x2, [x29, #0x1d0]
1006e6dd0:     	str	x1, [x29, #0x260]
1006e6dd4:     	str	x3, [x29, #0x1c0]
1006e6dd8:     	str	w0, [x29, #0x220]
1006e6ddc:     	str	x4, [x29, #0x258]
1006e6de0:     	str	x5, [x29, #0x1c8]
1006e6de4:     	str	x7, [x29, #0x1d8]
1006e6de8:     	str	x8, [x29, #0x268]
1006e6dec:     	ldr	x0, [x29, #0x108]
1006e6df0:     	ldr	x1, [x29, #0x2d8]
1006e6df4:     	mov	x2, x6
1006e6df8:     	mov	x3, x9
1006e6dfc:     	bl	0x1007ce6c8 <_coil.core.Set$coil.arraylist.ArrayList$set!__stogir.uses.Range>
1006e6e00:     	ldr	x0, [x29, #0x2b8]
1006e6e04:     	add	x0, x0, #0x1
1006e6e08:     	lsr	w0, w0, #0
1006e6e0c:     	sxtw	x0, w0
1006e6e10:     	mov	x1, x0
1006e6e14:     	ldr	x0, [x29, #0x2b0]
1006e6e18:     	cmp	x1, x0
1006e6e1c:     	b.gt	0x1006e7240 <_stogir.uses.build+0xc08>
1006e6e20:     	lsr	w2, w1, #0
1006e6e24:     	str	x0, [x29, #0x2b0]
1006e6e28:     	str	x1, [x29, #0x2b8]
1006e6e2c:     	str	w2, [x29, #0x2c0]
1006e6e30:     	ldr	x0, [x29, #0x190]
1006e6e34:     	bl	0x1005e8d04 <_stogir.node.opcode>
1006e6e38:     	uxtb	w0, w0
1006e6e3c:     	sub	sp, sp, #0x10
1006e6e40:     	add	x1, sp, #0x10
1006e6e44:     	lsr	w0, w0, #0
1006e6e48:     	str	x1, [x29, #0x2c8]
1006e6e4c:     	mov	x16, x1
1006e6e50:     	str	x16, [sp]
1006e6e54:     	ldr	w1, [x29, #0x2c0]
1006e6e58:     	bl	0x1005e1a10 <_stogir.opcode.operand-kind>
1006e6e5c:     	ldr	x16, [sp]
1006e6e60:     	str	x0, [x16]
1006e6e64:     	str	x1, [x16, #0x8]
1006e6e68:     	ldr	x0, [x29, #0x2c8]
1006e6e6c:     	ldr	x1, [x0]
1006e6e70:     	ldr	x0, [x0, #0x8]
1006e6e74:     	ldr	x2, [x29, #0x1a8]
1006e6e78:     	str	x1, [x2]
1006e6e7c:     	ldr	x1, [x29, #0x248]
1006e6e80:     	str	x0, [x1]
1006e6e84:     	ldr	x0, [x2]
1006e6e88:     	ldr	x3, [x1]
1006e6e8c:     	str	x2, [x29, #0x1a8]
1006e6e90:     	str	x1, [x29, #0x248]
1006e6e94:     	mov	x1, x3
1006e6e98:     	bl	0x1006ecc10 <_stogir.uses.edge-kind?>
1006e6e9c:     	movz	x17, #0x0, lsl #48
1006e6ea0:     	cmp	x0, x17
1006e6ea4:     	b.eq	0x1006e6e00 <_stogir.uses.build+0x7c8>
1006e6ea8:     	sub	sp, sp, #0x10
1006e6eac:     	add	x0, sp, #0x10
1006e6eb0:     	str	x0, [x29, #0x2d0]
1006e6eb4:     	mov	x16, x0
1006e6eb8:     	str	x16, [sp]
1006e6ebc:     	ldr	x0, [x29, #0x10]
1006e6ec0:     	ldr	w1, [x29, #0x2a8]
1006e6ec4:     	ldr	w2, [x29, #0x2c0]
1006e6ec8:     	bl	0x1007b705c <_stogir.graph.operand>
1006e6ecc:     	ldr	x16, [sp]
1006e6ed0:     	str	x0, [x16]
1006e6ed4:     	str	x1, [x16, #0x8]
1006e6ed8:     	ldr	x0, [x29, #0x2d0]
1006e6edc:     	ldr	x1, [x0]
1006e6ee0:     	ldr	x0, [x0, #0x8]
1006e6ee4:     	ldr	x2, [x29, #0x1b0]
1006e6ee8:     	str	x1, [x2]
1006e6eec:     	ldr	x1, [x29, #0x210]
1006e6ef0:     	str	x0, [x1]
1006e6ef4:     	ldr	w0, [x2]
1006e6ef8:     	lsr	x16, x0, #0
1006e6efc:     	cmp	x16, #0x1
1006e6f00:     	b.eq	0x1006e6f24 <_stogir.uses.build+0x8ec>
1006e6f04:     	b.lo	0x1006e6f0c <_stogir.uses.build+0x8d4>
1006e6f08:     	b	0x1006e6f28 <_stogir.uses.build+0x8f0>
1006e6f0c:     	cmp	x16, #0x0
1006e6f10:     	b.eq	0x1006e6f18 <_stogir.uses.build+0x8e0>
1006e6f14:     	b	0x1006e6f28 <_stogir.uses.build+0x8f0>
1006e6f18:     	str	x2, [x29, #0x1b0]
1006e6f1c:     	str	x1, [x29, #0x210]
1006e6f20:     	b	0x1006e6e00 <_stogir.uses.build+0x7c8>
1006e6f24:     	b	0x1006e6f2c <_stogir.uses.build+0x8f4>
1006e6f28:     	b	0x1006e7058 <_stogir.uses.build+0xa20>
1006e6f2c:     	ldr	x0, [x29, #0x250]
1006e6f30:     	ldr	w3, [x0]
1006e6f34:     	sxtw	x3, w3
1006e6f38:     	movz	x17, #0x0, lsl #48
1006e6f3c:     	cmp	x3, x17
1006e6f40:     	b.le	0x1006e7248 <_stogir.uses.build+0xc10>
1006e6f44:     	sub	sp, sp, #0x10
1006e6f48:     	add	x4, sp, #0x10
1006e6f4c:     	str	x2, [x29, #0x1b0]
1006e6f50:     	str	x1, [x29, #0x210]
1006e6f54:     	str	x0, [x29, #0x250]
1006e6f58:     	str	x3, [x29, #0x2d8]
1006e6f5c:     	str	x4, [x29, #0x2e0]
1006e6f60:     	mov	x16, x4
1006e6f64:     	str	x16, [sp]
1006e6f68:     	ldr	x0, [x29, #0x108]
1006e6f6c:     	mov	x1, x3
1006e6f70:     	bl	0x1007ce65c <_coil.core.Get$coil.arraylist.ArrayList$get__stogir.uses.Range>
1006e6f74:     	ldr	x16, [sp]
1006e6f78:     	str	x0, [x16]
1006e6f7c:     	str	x1, [x16, #0x8]
1006e6f80:     	ldr	x0, [x29, #0x2e0]
1006e6f84:     	ldr	x1, [x0]
1006e6f88:     	ldr	x0, [x0, #0x8]
1006e6f8c:     	ldr	x2, [x29, #0x1d0]
1006e6f90:     	str	x1, [x2]
1006e6f94:     	ldr	x1, [x29, #0x260]
1006e6f98:     	str	x0, [x1]
1006e6f9c:     	ldr	x0, [x2]
1006e6fa0:     	ldr	x3, [x29, #0x1c0]
1006e6fa4:     	str	x0, [x3]
1006e6fa8:     	ldr	x0, [x2, #0x8]
1006e6fac:     	str	x0, [x3, #0x8]
1006e6fb0:     	ldr	w0, [x29, #0x220]
1006e6fb4:     	uxtb	w16, w0
1006e6fb8:     	cmp	w16, wzr
1006e6fbc:     	b.ne	0x1006e6d98 <_stogir.uses.build+0x760>
1006e6fc0:     	str	x2, [x29, #0x1d0]
1006e6fc4:     	str	x1, [x29, #0x260]
1006e6fc8:     	str	x3, [x29, #0x1c0]
1006e6fcc:     	str	w0, [x29, #0x220]
1006e6fd0:     	ldr	x0, [x29, #0x118]
1006e6fd4:     	ldr	x1, [x29, #0x2d8]
1006e6fd8:     	bl	0x10002f1ec <_coil.core.Get$coil.arraylist.ArrayList$get__i64>
1006e6fdc:     	ldr	x1, [x29, #0x228]
1006e6fe0:     	movz	x17, #0x0, lsl #48
1006e6fe4:     	str	x17, [x1]
1006e6fe8:     	add	x2, x0, #0x1
1006e6fec:     	ldr	x3, [x1]
1006e6ff0:     	ldr	x4, [x29, #0x1e0]
1006e6ff4:     	str	x3, [x4]
1006e6ff8:     	ldr	w3, [x29, #0x2a8]
1006e6ffc:     	str	w3, [x4]
1006e7000:     	ldr	x5, [x29, #0x270]
1006e7004:     	ldr	w6, [x29, #0x2c0]
1006e7008:     	str	w6, [x5]
1006e700c:     	ldr	x6, [x4]
1006e7010:     	ldr	x7, [x29, #0x230]
1006e7014:     	str	x6, [x7]
1006e7018:     	ldr	x6, [x7]
1006e701c:     	str	x1, [x29, #0x228]
1006e7020:     	str	x2, [x29, #0x2e8]
1006e7024:     	str	x4, [x29, #0x1e0]
1006e7028:     	str	w3, [x29, #0x2a8]
1006e702c:     	str	x5, [x29, #0x270]
1006e7030:     	str	x7, [x29, #0x230]
1006e7034:     	mov	x1, x0
1006e7038:     	ldr	x0, [x29, #0x188]
1006e703c:     	mov	x2, x6
1006e7040:     	bl	0x1007ce798 <_coil.core.Set$coil.arraylist.ArrayList$set!__stogir.uses.Use>
1006e7044:     	ldr	x0, [x29, #0x118]
1006e7048:     	ldr	x1, [x29, #0x2d8]
1006e704c:     	ldr	x2, [x29, #0x2e8]
1006e7050:     	bl	0x10002f500 <_coil.core.Set$coil.arraylist.ArrayList$set!__i64>
1006e7054:     	b	0x1006e6e00 <_stogir.uses.build+0x7c8>
1006e7058:     	brk	#0
1006e705c:     	b	0x1006e7058 <_stogir.uses.build+0xa20>
1006e7060:     	ldr	x0, [x29, #0x2b0]
1006e7064:     	add	x0, x0, #0x4
1006e7068:     	mov	x17, #0x4               ; =4
1006e706c:     	sdiv	x0, x0, x17
1006e7070:     	ldr	x1, [x29, #0x298]
1006e7074:     	add	x0, x0, x1
1006e7078:     	ldr	x15, [x29, #0x108]
1006e707c:     	ldr	x1, [x29, #0x240]
1006e7080:     	ldr	x2, [x29, #0x248]
1006e7084:     	ldr	x3, [x29, #0x250]
1006e7088:     	ldr	x5, [x29, #0x260]
1006e708c:     	ldr	x14, [x29, #0x258]
1006e7090:     	ldr	x6, [x29, #0x268]
1006e7094:     	ldr	x8, [x29, #0x228]
1006e7098:     	ldr	x7, [x29, #0x270]
1006e709c:     	ldr	x9, [x29, #0x230]
1006e70a0:     	ldr	x11, [x29, #0x280]
1006e70a4:     	ldr	x12, [x29, #0x288]
1006e70a8:     	ldr	x10, [x29, #0x278]
1006e70ac:     	ldr	x13, [x29, #0x290]
1006e70b0:     	ldr	x4, [x29, #0x238]
1006e70b4:     	str	x15, [x29, #0x108]
1006e70b8:     	str	x8, [x29, #0x228]
1006e70bc:     	str	x9, [x29, #0x230]
1006e70c0:     	str	x4, [x29, #0x238]
1006e70c4:     	str	x1, [x29, #0x240]
1006e70c8:     	str	x2, [x29, #0x248]
1006e70cc:     	str	x3, [x29, #0x250]
1006e70d0:     	str	x14, [x29, #0x258]
1006e70d4:     	str	x5, [x29, #0x260]
1006e70d8:     	str	x6, [x29, #0x268]
1006e70dc:     	str	x7, [x29, #0x270]
1006e70e0:     	str	x10, [x29, #0x278]
1006e70e4:     	str	x11, [x29, #0x280]
1006e70e8:     	str	x12, [x29, #0x288]
1006e70ec:     	str	x13, [x29, #0x290]
1006e70f0:     	str	x0, [x29, #0x298]
1006e70f4:     	ldr	x0, [x29, #0x10]
1006e70f8:     	bl	0x1006d172c <_coil.core.Len$coil.arraylist.ArrayList$len__stogir.node.Node>
1006e70fc:     	ldr	x1, [x29, #0x298]
1006e7100:     	cmp	x1, x0
1006e7104:     	b.ge	0x1006e7198 <_stogir.uses.build+0xb60>
1006e7108:     	lsr	w0, w1, #0
1006e710c:     	sub	sp, sp, #0x10
1006e7110:     	add	x2, sp, #0x10
1006e7114:     	lsr	w0, w0, #0
1006e7118:     	str	x1, [x29, #0x298]
1006e711c:     	str	x2, [x29, #0x2a0]
1006e7120:     	str	w0, [x29, #0x2a8]
1006e7124:     	mov	x16, x2
1006e7128:     	str	x16, [sp]
1006e712c:     	ldr	x0, [x29, #0x10]
1006e7130:     	bl	0x1006d0384 <_coil.core.Get$coil.arraylist.ArrayList$get__stogir.node.Node>
1006e7134:     	ldr	x16, [sp]
1006e7138:     	str	x0, [x16]
1006e713c:     	str	x1, [x16, #0x8]
1006e7140:     	ldr	x0, [x29, #0x2a0]
1006e7144:     	ldr	x1, [x0]
1006e7148:     	ldr	x0, [x0, #0x8]
1006e714c:     	ldr	x2, [x29, #0x1a0]
1006e7150:     	str	x1, [x2]
1006e7154:     	ldr	x1, [x29, #0x240]
1006e7158:     	str	x0, [x1]
1006e715c:     	ldr	x0, [x2]
1006e7160:     	ldr	x3, [x29, #0x198]
1006e7164:     	str	x0, [x3]
1006e7168:     	ldr	x0, [x2, #0x8]
1006e716c:     	str	x0, [x3, #0x8]
1006e7170:     	str	x2, [x29, #0x1a0]
1006e7174:     	str	x1, [x29, #0x240]
1006e7178:     	str	x3, [x29, #0x198]
1006e717c:     	ldr	x0, [x29, #0x178]
1006e7180:     	ldr	x1, [x29, #0x298]
1006e7184:     	bl	0x1004fe82c <_coil.core.Get$coil.arraylist.ArrayList$get__i32>
1006e7188:     	lsr	w0, w0, #0
1006e718c:     	sxtw	x0, w0
1006e7190:     	mov	x1, #0x1                ; =1
1006e7194:     	b	0x1006e6e18 <_stogir.uses.build+0x7e0>
1006e7198:     	ldr	w0, [x29, #0x220]
1006e719c:     	uxtb	w16, w0
1006e71a0:     	cmp	w16, wzr
1006e71a4:     	b.eq	0x1006e6d2c <_stogir.uses.build+0x6f4>
1006e71a8:     	movz	x0, #0x0, lsl #48
1006e71ac:     	movz	x1, #0x0, lsl #48
1006e71b0:     	b	0x1006e6c78 <_stogir.uses.build+0x640>
1006e71b4:     	ldr	x0, [x29, #0x88]
1006e71b8:     	str	x0, [x29, #0x310]
1006e71bc:     	ldr	x0, [x29, #0x118]
1006e71c0:     	bl	0x100038b48 <_inherent$coil.arraylist.ArrayList$free!__i64>
1006e71c4:     	ldr	x0, [x29, #0x310]
1006e71c8:     	movz	x1, #0x0, lsl #48
1006e71cc:     	b	0x1006e71f0 <_stogir.uses.build+0xbb8>
1006e71d0:     	add	x2, x1, #0x8
1006e71d4:     	add	x3, x0, x1
1006e71d8:     	ldr	x4, [x29, #0x110]
1006e71dc:     	add	x1, x4, x1
1006e71e0:     	ldr	x1, [x1]
1006e71e4:     	str	x1, [x3]
1006e71e8:     	str	x4, [x29, #0x110]
1006e71ec:     	mov	x1, x2
1006e71f0:     	mov	x17, #0x50              ; =80
1006e71f4:     	cmp	x1, x17
1006e71f8:     	b.lo	0x1006e71d0 <_stogir.uses.build+0xb98>
1006e71fc:     	ldr	x1, [x29, #0xa8]
1006e7200:     	movz	x2, #0x0, lsl #48
1006e7204:     	b	0x1006e7220 <_stogir.uses.build+0xbe8>
1006e7208:     	add	x3, x2, #0x8
1006e720c:     	add	x4, x1, x2
1006e7210:     	add	x2, x0, x2
1006e7214:     	ldr	x2, [x2]
1006e7218:     	str	x2, [x4]
1006e721c:     	mov	x2, x3
1006e7220:     	mov	x17, #0x50              ; =80
1006e7224:     	cmp	x2, x17
1006e7228:     	b.lo	0x1006e7208 <_stogir.uses.build+0xbd0>
1006e722c:     	sub	sp, x29, #0x10
1006e7230:     	ldr	x29, [sp, #0x10]
1006e7234:     	ldr	x30, [sp, #0x18]
1006e7238:     	add	sp, sp, #0x330
1006e723c:     	ret
1006e7240:     	str	x0, [x29, #0x2b0]
1006e7244:     	b	0x1006e7060 <_stogir.uses.build+0xa28>
1006e7248:     	str	x2, [x29, #0x1b0]
1006e724c:     	str	x1, [x29, #0x210]
1006e7250:     	str	x0, [x29, #0x250]
1006e7254:     	b	0x1006e6e00 <_stogir.uses.build+0x7c8>
