
build/return-allocation-bootstrap/stogir-0.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000000001ef8b0 <_stogir.verify.structure>:
  1ef8b0:      	sub	sp, sp, #0x110
  1ef8b4:      	str	x29, [sp, #0x10]
  1ef8b8:      	str	x30, [sp, #0x18]
  1ef8bc:      	add	x29, sp, #0x10
  1ef8c0:      	str	x19, [sp, #0xb8]
  1ef8c4:      	str	x20, [sp, #0xc0]
  1ef8c8:      	str	x21, [sp, #0xc8]
  1ef8cc:      	str	x22, [sp, #0xd0]
  1ef8d0:      	str	x23, [sp, #0xd8]
  1ef8d4:      	str	x24, [sp, #0xe0]
  1ef8d8:      	str	x25, [sp, #0xe8]
  1ef8dc:      	str	x26, [sp, #0xf0]
  1ef8e0:      	str	x27, [sp, #0xf8]
  1ef8e4:      	str	x28, [sp, #0x100]
  1ef8e8:      	mov	x19, x8
  1ef8ec:      	mov	x20, x0
  1ef8f0:      	bl	0x1ef8f0 <_stogir.verify.structure+0x40>
		00000000001ef8f0:  ARM64_RELOC_BRANCH26	_coil.core.Len$coil.arraylist.ArrayList$len__stogir.node.Node
  1ef8f4:      	add	x21, x20, #0x78
  1ef8f8:      	mov	x22, x0
  1ef8fc:      	mov	x0, x21
  1ef900:      	bl	0x1ef900 <_stogir.verify.structure+0x50>
		00000000001ef900:  ARM64_RELOC_BRANCH26	_coil.core.Len$coil.arraylist.ArrayList$len__i32
  1ef904:      	cmp	x22, x0
  1ef908:      	b.ne	0x1ef938 <_stogir.verify.structure+0x88>
  1ef90c:      	adrp	x22, 0x1ef000 <_coil.compiler.codegen_stogir.translate!+0x12f0>
		00000000001ef90c:  ARM64_RELOC_PAGE21	l_stogir.37335
  1ef910:      	ldr	x22, [x22]
		00000000001ef910:  ARM64_RELOC_PAGEOFF12	l_stogir.37335
  1ef914:      	movz	x23, #0x0, lsl #48
  1ef918:      	b	0x1ef944 <_stogir.verify.structure+0x94>
  1ef91c:      	ldr	x1, [sp, #0x88]
  1ef920:      	ldr	x5, [sp, #0x90]
  1ef924:      	add	x5, x1, x5
  1ef928:      	ldr	x19, [sp, #0x40]
  1ef92c:      	add	x1, x19, #0x1
  1ef930:      	sxtw	x19, w1
  1ef934:      	b	0x1ef974 <_stogir.verify.structure+0xc4>
  1ef938:      	adrp	x22, 0x1ef000 <_coil.compiler.codegen_stogir.translate!+0x12f0>
		00000000001ef938:  ARM64_RELOC_PAGE21	l_stogir.37336
  1ef93c:      	ldr	x22, [x22]
		00000000001ef93c:  ARM64_RELOC_PAGEOFF12	l_stogir.37336
  1ef940:      	mov	x23, #0x2c              ; =44
  1ef944:      	add	x24, x20, #0x110
  1ef948:      	add	x25, x20, #0x28
  1ef94c:      	add	x26, x20, #0x50
  1ef950:      	add	x27, x24, #0x28
  1ef954:      	mov	x28, #0x1               ; =1
  1ef958:      	movz	x0, #0x0, lsl #48
  1ef95c:      	b	0x1ef9cc <_stogir.verify.structure+0x11c>
  1ef960:      	adrp	x16, 0x1ef000 <_coil.compiler.codegen_stogir.translate!+0x12f0>
		00000000001ef960:  ARM64_RELOC_PAGE21	l_stogir.37337
  1ef964:      	ldr	x16, [x16]
		00000000001ef964:  ARM64_RELOC_PAGEOFF12	l_stogir.37337
  1ef968:      	str	x16, [sp, #0x38]
  1ef96c:      	mov	x16, #0x16              ; =22
  1ef970:      	str	x16, [sp, #0x80]
  1ef974:      	b	0x1ef9a8 <_stogir.verify.structure+0xf8>
  1ef978:      	mov	x5, x28
  1ef97c:      	str	x19, [sp, #0x30]
  1ef980:      	mov	x19, x0
  1ef984:      	mov	x0, x21
  1ef988:      	mov	x2, x24
  1ef98c:      	mov	x3, x25
  1ef990:      	mov	x4, x26
  1ef994:      	adrp	x16, 0x1ef000 <_coil.compiler.codegen_stogir.translate!+0x12f0>
		00000000001ef994:  ARM64_RELOC_PAGE21	l_stogir.37338
  1ef998:      	ldr	x16, [x16]
		00000000001ef998:  ARM64_RELOC_PAGEOFF12	l_stogir.37338
  1ef99c:      	str	x16, [sp, #0x38]
  1ef9a0:      	mov	x16, #0x23              ; =35
  1ef9a4:      	str	x16, [sp, #0x80]
  1ef9a8:      	mov	x21, x0
  1ef9ac:      	mov	x24, x2
  1ef9b0:      	mov	x25, x3
  1ef9b4:      	mov	x26, x4
  1ef9b8:      	mov	x28, x5
  1ef9bc:      	mov	x0, x19
  1ef9c0:      	ldr	x19, [sp, #0x30]
  1ef9c4:      	ldr	x22, [sp, #0x38]
  1ef9c8:      	ldr	x23, [sp, #0x80]
  1ef9cc:      	cmp	x23, #0x0
  1ef9d0:      	b.ne	0x1f018c <_stogir.verify.structure+0x8dc>
  1ef9d4:      	ldr	x1, [x20, #0x8]
  1ef9d8:      	cmp	x28, x1
  1ef9dc:      	b.ge	0x1f01a0 <_stogir.verify.structure+0x8f0>
  1ef9e0:      	ldr	x1, [x20]
  1ef9e4:      	add	x1, x1, x28, lsl #4
  1ef9e8:      	ldr	x1, [x1]
  1ef9ec:      	ldr	x2, [x20, #0x78]
  1ef9f0:      	add	x2, x2, x28, lsl #2
  1ef9f4:      	ldr	w2, [x2]
  1ef9f8:      	sxtw	x2, w2
  1ef9fc:      	cmp	x2, #0x0
  1efa00:      	b.lt	0x1ef978 <_stogir.verify.structure+0xc8>
  1efa04:      	mov	x17, #0xffff            ; =65535
  1efa08:      	cmp	x2, x17
  1efa0c:      	b.gt	0x1f01b4 <_stogir.verify.structure+0x904>
  1efa10:      	uxtb	w3, w1
  1efa14:      	orr	x4, x3, xzr
  1efa18:      	cmp	x4, #0x83
  1efa1c:      	cset	w5, lt
  1efa20:      	uxtb	w16, w5
  1efa24:      	cmp	w16, wzr
  1efa28:      	b.eq	0x1f01d4 <_stogir.verify.structure+0x924>
  1efa2c:      	ubfx	x1, x1, #0, #32
  1efa30:      	ubfx	x6, x1, #8, #8
  1efa34:      	orr	x7, x6, xzr
  1efa38:      	str	x0, [sp, #0x40]
  1efa3c:      	mov	w0, w7
  1efa40:      	str	x19, [sp, #0x30]
  1efa44:      	mov	w19, w3
  1efa48:      	str	x22, [sp, #0x38]
  1efa4c:      	mov	x22, x2
  1efa50:      	str	x26, [sp, #0x48]
  1efa54:      	mov	x26, x4
  1efa58:      	str	x25, [sp, #0x50]
  1efa5c:      	mov	w25, w5
  1efa60:      	str	x21, [sp, #0x58]
  1efa64:      	mov	x21, x1
  1efa68:      	str	x24, [sp, #0x60]
  1efa6c:      	mov	w24, w6
  1efa70:      	bl	0x1efa70 <_stogir.verify.structure+0x1c0>
		00000000001efa70:  ARM64_RELOC_BRANCH26	_stogir.types.valid?
  1efa74:      	cmp	x0, #0x0
  1efa78:      	b.eq	0x1f01f4 <_stogir.verify.structure+0x944>
  1efa7c:      	adrp	x17, 0x1ef000 <_coil.compiler.codegen_stogir.translate!+0x12f0>
		00000000001efa7c:  ARM64_RELOC_PAGE21	l_stogir.37339
  1efa80:      	ldr	x17, [x17]
		00000000001efa80:  ARM64_RELOC_PAGEOFF12	l_stogir.37339
  1efa84:      	add	x0, x26, x17
  1efa88:      	ldrsb	w0, [x0]
  1efa8c:      	sxtb	x0, w0
  1efa90:      	cmp	x0, #0x0
  1efa94:      	b.lt	0x1efeac <_stogir.verify.structure+0x5fc>
  1efa98:      	uxtb	w16, w25
  1efa9c:      	cmp	w16, wzr
  1efaa0:      	b.eq	0x1eff80 <_stogir.verify.structure+0x6d0>
  1efaa4:      	adrp	x17, 0x1ef000 <_coil.compiler.codegen_stogir.translate!+0x12f0>
		00000000001efaa4:  ARM64_RELOC_PAGE21	l_stogir.37339
  1efaa8:      	ldr	x17, [x17]
		00000000001efaa8:  ARM64_RELOC_PAGEOFF12	l_stogir.37339
  1efaac:      	add	x0, x26, x17
  1efab0:      	ldrsb	w0, [x0]
  1efab4:      	sxtb	w0, w0
  1efab8:      	b	0x1eff84 <_stogir.verify.structure+0x6d4>
  1efabc:      	ldr	x0, [sp, #0x38]
  1efac0:      	ldr	x1, [sp, #0x80]
  1efac4:      	adrp	x2, 0x1ef000 <_coil.compiler.codegen_stogir.translate!+0x12f0>
		00000000001efac4:  ARM64_RELOC_PAGE21	l_stogir.37335
  1efac8:      	ldr	x2, [x2]
		00000000001efac8:  ARM64_RELOC_PAGEOFF12	l_stogir.37335
  1efacc:      	movz	x3, #0x0, lsl #48
  1efad0:      	bl	0x1efad0 <_stogir.verify.structure+0x220>
		00000000001efad0:  ARM64_RELOC_BRANCH26	_coil.core.Eq$slice<u8>$=
  1efad4:      	cmp	x0, #0x0
  1efad8:      	b.eq	0x1f0210 <_stogir.verify.structure+0x960>
  1efadc:      	and	x0, x19, #0xffffffff
  1efae0:      	movz	x1, #0x0, lsl #48
  1efae4:      	movz	x16, #0x0, lsl #48
  1efae8:      	str	x16, [sp, #0x80]
  1efaec:      	b	0x1efaf4 <_stogir.verify.structure+0x244>
  1efaf0:      	mov	x1, #0x1                ; =1
  1efaf4:      	ldr	x2, [sp, #0x30]
  1efaf8:      	str	x1, [x2]
  1efafc:      	str	x0, [x2, #0x8]
  1efb00:      	ldr	x0, [sp, #0x80]
  1efb04:      	str	x0, [x2, #0x10]
  1efb08:      	ldr	x19, [sp, #0xb8]
  1efb0c:      	ldr	x20, [sp, #0xc0]
  1efb10:      	ldr	x21, [sp, #0xc8]
  1efb14:      	ldr	x22, [sp, #0xd0]
  1efb18:      	ldr	x23, [sp, #0xd8]
  1efb1c:      	ldr	x24, [sp, #0xe0]
  1efb20:      	ldr	x25, [sp, #0xe8]
  1efb24:      	ldr	x26, [sp, #0xf0]
  1efb28:      	ldr	x27, [sp, #0xf8]
  1efb2c:      	ldr	x28, [sp, #0x100]
  1efb30:      	ldr	x29, [sp, #0x10]
  1efb34:      	ldr	x30, [sp, #0x18]
  1efb38:      	add	sp, sp, #0x110
  1efb3c:      	ret
  1efb40:      	mov	w9, w5
  1efb44:      	lsl	w9, w9, #2
  1efb48:      	ubfx	x9, x9, #0, #32
  1efb4c:      	lsr	x8, x8, x9
  1efb50:      	and	w8, w8, #0xf
  1efb54:      	b	0x1efb74 <_stogir.verify.structure+0x2c4>
  1efb58:      	movz	x1, #0x0, lsl #48
  1efb5c:      	cmp	x1, #0x0
  1efb60:      	b.eq	0x1effc0 <_stogir.verify.structure+0x710>
  1efb64:      	ldr	w1, [sp, #0xb0]
  1efb68:      	ldr	w5, [sp, #0xa8]
  1efb6c:      	b	0x1efc1c <_stogir.verify.structure+0x36c>
  1efb70:      	movz	w8, #0x0, lsl #16
  1efb74:      	b	0x1efb7c <_stogir.verify.structure+0x2cc>
  1efb78:      	movz	w8, #0x0, lsl #16
  1efb7c:      	str	w0, [sp, #0x68]
  1efb80:      	str	x2, [sp, #0x98]
  1efb84:      	mov	w2, w3
  1efb88:      	str	x4, [sp, #0xa0]
  1efb8c:      	str	x22, [sp, #0x70]
  1efb90:      	mov	x22, x1
  1efb94:      	mov	w1, w0
  1efb98:      	mov	x0, x20
  1efb9c:      	str	x26, [sp, #0x78]
  1efba0:      	mov	w26, w7
  1efba4:      	str	x23, [sp, #0x80]
  1efba8:      	mov	w23, w8
  1efbac:      	str	x19, [sp, #0x88]
  1efbb0:      	mov	w19, w5
  1efbb4:      	str	x28, [sp, #0x90]
  1efbb8:      	mov	w28, w6
  1efbbc:      	bl	0x1efbbc <_stogir.verify.structure+0x30c>
		00000000001efbbc:  ARM64_RELOC_BRANCH26	_stogir.graph.operand
  1efbc0:      	ubfx	x0, x0, #0, #32
  1efbc4:      	lsr	x16, x0, #0
  1efbc8:      	cmp	x16, #0x1
  1efbcc:      	b.eq	0x1efbe8 <_stogir.verify.structure+0x338>
  1efbd0:      	b.lo	0x1efbd8 <_stogir.verify.structure+0x328>
  1efbd4:      	b	0x1efbec <_stogir.verify.structure+0x33c>
  1efbd8:      	cmp	x16, #0x0
  1efbdc:      	b.eq	0x1efbe4 <_stogir.verify.structure+0x334>
  1efbe0:      	b	0x1efbec <_stogir.verify.structure+0x33c>
  1efbe4:      	b	0x1efbf0 <_stogir.verify.structure+0x340>
  1efbe8:      	b	0x1efcd0 <_stogir.verify.structure+0x420>
  1efbec:      	b	0x1f00f4 <_stogir.verify.structure+0x844>
  1efbf0:      	ldr	x0, [sp, #0x58]
  1efbf4:      	ldr	x2, [sp, #0x60]
  1efbf8:      	mov	w1, w21
  1efbfc:      	mov	w5, w24
  1efc00:      	ldr	x3, [sp, #0x50]
  1efc04:      	ldr	x4, [sp, #0x48]
  1efc08:      	adrp	x16, 0x1ef000 <_coil.compiler.codegen_stogir.translate!+0x12f0>
		00000000001efc08:  ARM64_RELOC_PAGE21	l_stogir.37340
  1efc0c:      	ldr	x16, [x16]
		00000000001efc0c:  ARM64_RELOC_PAGEOFF12	l_stogir.37340
  1efc10:      	str	x16, [sp, #0x38]
  1efc14:      	mov	x16, #0x17              ; =23
  1efc18:      	str	x16, [sp, #0x80]
  1efc1c:      	ldr	x6, [sp, #0x98]
  1efc20:      	add	x6, x6, #0x1
  1efc24:      	sxtw	x6, w6
  1efc28:      	ldr	x28, [sp, #0x90]
  1efc2c:      	str	x0, [sp, #0x58]
  1efc30:      	ldr	x19, [sp, #0x88]
  1efc34:      	ldr	w0, [sp, #0x68]
  1efc38:      	str	x2, [sp, #0x60]
  1efc3c:      	ldr	x26, [sp, #0x78]
  1efc40:      	mov	w21, w1
  1efc44:      	mov	w24, w5
  1efc48:      	mov	x1, x22
  1efc4c:      	ldr	x22, [sp, #0x70]
  1efc50:      	str	x3, [sp, #0x50]
  1efc54:      	str	x4, [sp, #0x48]
  1efc58:      	mov	x2, x6
  1efc5c:      	ldr	x23, [sp, #0x80]
  1efc60:      	cmp	x23, #0x0
  1efc64:      	b.ne	0x1efc78 <_stogir.verify.structure+0x3c8>
  1efc68:      	cmp	x2, x22
  1efc6c:      	cset	w3, le
  1efc70:      	ubfx	x3, x3, #0, #8
  1efc74:      	b	0x1efc7c <_stogir.verify.structure+0x3cc>
  1efc78:      	movz	x3, #0x0, lsl #48
  1efc7c:      	cmp	x3, #0x0
  1efc80:      	b.eq	0x1f0218 <_stogir.verify.structure+0x968>
  1efc84:      	orr	w3, w2, wzr
  1efc88:      	sxtw	x4, w3
  1efc8c:      	sub	w5, w3, #0x1
  1efc90:      	cmp	x4, #0x0
  1efc94:      	cset	w6, gt
  1efc98:      	cmp	x4, #0x4
  1efc9c:      	cset	w7, gt
  1efca0:      	uxtb	w16, w25
  1efca4:      	cmp	w16, wzr
  1efca8:      	b.eq	0x1efb78 <_stogir.verify.structure+0x2c8>
  1efcac:      	ldr	w8, [x26]
  1efcb0:      	uxtb	w16, w6
  1efcb4:      	cmp	w16, wzr
  1efcb8:      	b.eq	0x1efb70 <_stogir.verify.structure+0x2c0>
  1efcbc:      	uxtb	w16, w7
  1efcc0:      	cmp	w16, wzr
  1efcc4:      	b.eq	0x1efb40 <_stogir.verify.structure+0x290>
  1efcc8:      	mov	w9, #0x4                ; =4
  1efccc:      	b	0x1efb44 <_stogir.verify.structure+0x294>
  1efcd0:      	ubfx	x23, x23, #0, #32
  1efcd4:      	adrp	x16, 0x1ef000 <_coil.compiler.codegen_stogir.translate!+0x12f0>
		00000000001efcd4:  ARM64_RELOC_PAGE21	l_stogir.37341
  1efcd8:      	ldr	x16, [x16]
		00000000001efcd8:  ARM64_RELOC_PAGEOFF12	l_stogir.37341
  1efcdc:      	ldr	w0, [x16]
  1efce0:      	cmp	x23, x0
  1efce4:      	b.ne	0x1efcf8 <_stogir.verify.structure+0x448>
  1efce8:      	mov	x0, #0x1                ; =1
  1efcec:      	b	0x1efd10 <_stogir.verify.structure+0x460>
  1efcf0:      	movz	x1, #0x0, lsl #48
  1efcf4:      	b	0x1efd70 <_stogir.verify.structure+0x4c0>
  1efcf8:      	adrp	x16, 0x1ef000 <_coil.compiler.codegen_stogir.translate!+0x12f0>
		00000000001efcf8:  ARM64_RELOC_PAGE21	l_stogir.37342
  1efcfc:      	ldr	x16, [x16]
		00000000001efcfc:  ARM64_RELOC_PAGEOFF12	l_stogir.37342
  1efd00:      	ldr	w0, [x16]
  1efd04:      	cmp	x23, x0
  1efd08:      	cset	w0, eq
  1efd0c:      	ubfx	x0, x0, #0, #8
  1efd10:      	cmp	x0, #0x0
  1efd14:      	b.eq	0x1f0238 <_stogir.verify.structure+0x988>
  1efd18:      	str	w24, [sp, #0xa8]
  1efd1c:      	mov	x24, x0
  1efd20:      	mov	x0, x20
  1efd24:      	str	w21, [sp, #0xb0]
  1efd28:      	mov	w21, w1
  1efd2c:      	bl	0x1efd2c <_stogir.verify.structure+0x47c>
		00000000001efd2c:  ARM64_RELOC_BRANCH26	_stogir.graph.borrow-node
  1efd30:      	cmp	x0, #0x0
  1efd34:      	cset	w1, eq
  1efd38:      	uxtb	w16, w1
  1efd3c:      	cmp	w16, wzr
  1efd40:      	cset	x1, eq
  1efd44:      	cmp	x1, #0x0
  1efd48:      	b.eq	0x1efd70 <_stogir.verify.structure+0x4c0>
  1efd4c:      	ldr	w0, [x0]
  1efd50:      	uxtb	w0, w0
  1efd54:      	cmp	x0, #0x48
  1efd58:      	b.ne	0x1efd70 <_stogir.verify.structure+0x4c0>
  1efd5c:      	adrp	x16, 0x1ef000 <_coil.compiler.codegen_stogir.translate!+0x12f0>
		00000000001efd5c:  ARM64_RELOC_PAGE21	l_stogir.37343
  1efd60:      	ldr	x16, [x16]
		00000000001efd60:  ARM64_RELOC_PAGEOFF12	l_stogir.37343
  1efd64:      	str	x16, [sp, #0x38]
  1efd68:      	mov	x16, #0x25              ; =37
  1efd6c:      	str	x16, [sp, #0x80]
  1efd70:      	sxtw	x21, w21
  1efd74:      	adrp	x16, 0x1ef000 <_coil.compiler.codegen_stogir.translate!+0x12f0>
		00000000001efd74:  ARM64_RELOC_PAGE21	l_stogir.37344
  1efd78:      	ldr	x16, [x16]
		00000000001efd78:  ARM64_RELOC_PAGEOFF12	l_stogir.37344
  1efd7c:      	ldr	w0, [x16]
  1efd80:      	cmp	x23, x0
  1efd84:      	b.ne	0x1f024c <_stogir.verify.structure+0x99c>
  1efd88:      	cmp	x21, #0x0
  1efd8c:      	b.gt	0x1eff1c <_stogir.verify.structure+0x66c>
  1efd90:      	ldr	x2, [sp, #0x60]
  1efd94:      	movz	w0, #0x0, lsl #16
  1efd98:      	ubfx	x0, x0, #0, #32
  1efd9c:      	lsr	x16, x0, #0
  1efda0:      	cmp	x16, #0x1
  1efda4:      	b.eq	0x1efdc0 <_stogir.verify.structure+0x510>
  1efda8:      	b.lo	0x1efdb0 <_stogir.verify.structure+0x500>
  1efdac:      	b	0x1efdc4 <_stogir.verify.structure+0x514>
  1efdb0:      	cmp	x16, #0x0
  1efdb4:      	b.eq	0x1efdbc <_stogir.verify.structure+0x50c>
  1efdb8:      	b	0x1efdc4 <_stogir.verify.structure+0x514>
  1efdbc:      	b	0x1efdc8 <_stogir.verify.structure+0x518>
  1efdc0:      	b	0x1efddc <_stogir.verify.structure+0x52c>
  1efdc4:      	b	0x1f0184 <_stogir.verify.structure+0x8d4>
  1efdc8:      	adrp	x16, 0x1ef000 <_coil.compiler.codegen_stogir.translate!+0x12f0>
		00000000001efdc8:  ARM64_RELOC_PAGE21	l_stogir.37345
  1efdcc:      	ldr	x16, [x16]
		00000000001efdcc:  ARM64_RELOC_PAGEOFF12	l_stogir.37345
  1efdd0:      	str	x16, [sp, #0x38]
  1efdd4:      	mov	x16, #0x21              ; =33
  1efdd8:      	str	x16, [sp, #0x80]
  1efddc:      	cmp	x23, #0xf
  1efde0:      	b.hs	0x1f0254 <_stogir.verify.structure+0x9a4>
  1efde4:      	mov	x16, #0x1               ; =1
  1efde8:      	lsl	x0, x16, x23
  1efdec:      	mov	w17, #0x5e1c            ; =24092
  1efdf0:      	and	w0, w0, w17
  1efdf4:      	ubfx	x0, x0, #0, #32
  1efdf8:      	cmp	x0, #0x0
  1efdfc:      	b.eq	0x1f026c <_stogir.verify.structure+0x9bc>
  1efe00:      	cmp	x24, #0x0
  1efe04:      	b.eq	0x1f0008 <_stogir.verify.structure+0x758>
  1efe08:      	ldr	x0, [sp, #0x58]
  1efe0c:      	ldr	x3, [sp, #0x50]
  1efe10:      	ldr	x4, [sp, #0x48]
  1efe14:      	b	0x1efb5c <_stogir.verify.structure+0x2ac>
  1efe18:      	orr	w0, w28, wzr
  1efe1c:      	cmp	x26, #0x78
  1efe20:      	cset	w21, eq
  1efe24:      	adrp	x16, 0x1ef000 <_coil.compiler.codegen_stogir.translate!+0x12f0>
		00000000001efe24:  ARM64_RELOC_PAGE21	l_stogir.37346
  1efe28:      	ldr	x16, [x16]
		00000000001efe28:  ARM64_RELOC_PAGEOFF12	l_stogir.37346
  1efe2c:      	add	x1, x16, x26, lsl #2
  1efe30:      	adrp	x16, 0x1ef000 <_coil.compiler.codegen_stogir.translate!+0x12f0>
		00000000001efe30:  ARM64_RELOC_PAGE21	l_stogir.37346
  1efe34:      	ldr	x16, [x16]
		00000000001efe34:  ARM64_RELOC_PAGEOFF12	l_stogir.37346
  1efe38:      	add	x2, x16, x26, lsl #2
  1efe3c:      	cmp	x24, #0x0
  1efe40:      	cset	w24, eq
  1efe44:      	orr	x26, x1, xzr
  1efe48:      	orr	x1, x2, xzr
  1efe4c:      	mov	x2, #0x1                ; =1
  1efe50:      	b	0x1efc60 <_stogir.verify.structure+0x3b0>
  1efe54:      	nop
  1efe58:      	movz	x1, #0x0, lsl #48
  1efe5c:      	cmp	x1, #0x0
  1efe60:      	b.eq	0x1efe18 <_stogir.verify.structure+0x568>
  1efe64:      	add	x1, x0, x28
  1efe68:      	ldr	x2, [x20, #0x78]
  1efe6c:      	add	x1, x2, x1, lsl #2
  1efe70:      	ldr	w1, [x1]
  1efe74:      	sxtw	x1, w1
  1efe78:      	cmn	x1, #0x1
  1efe7c:      	b.eq	0x1efe90 <_stogir.verify.structure+0x5e0>
  1efe80:      	adrp	x16, 0x1ef000 <_coil.compiler.codegen_stogir.translate!+0x12f0>
		00000000001efe80:  ARM64_RELOC_PAGE21	l_stogir.37347
  1efe84:      	ldr	x16, [x16]
		00000000001efe84:  ARM64_RELOC_PAGEOFF12	l_stogir.37347
  1efe88:      	str	x16, [sp, #0x38]
  1efe8c:      	mov	x23, #0x1b              ; =27
  1efe90:      	add	x0, x0, #0x1
  1efe94:      	cmp	x23, #0x0
  1efe98:      	b.ne	0x1efe58 <_stogir.verify.structure+0x5a8>
  1efe9c:      	cmp	x0, x19
  1efea0:      	cset	w1, lt
  1efea4:      	ubfx	x1, x1, #0, #8
  1efea8:      	b	0x1efe5c <_stogir.verify.structure+0x5ac>
  1efeac:      	mov	w0, w19
  1efeb0:      	bl	0x1efeb0 <_stogir.verify.structure+0x600>
		00000000001efeb0:  ARM64_RELOC_BRANCH26	_stogir.opcode.input-count
  1efeb4:      	sxtw	x0, w0
  1efeb8:      	cmn	x0, #0x1
  1efebc:      	b.ne	0x1efedc <_stogir.verify.structure+0x62c>
  1efec0:      	ubfx	x0, x21, #16, #16
  1efec4:      	cmp	x22, x0
  1efec8:      	b.eq	0x1efedc <_stogir.verify.structure+0x62c>
  1efecc:      	adrp	x16, 0x1ef000 <_coil.compiler.codegen_stogir.translate!+0x12f0>
		00000000001efecc:  ARM64_RELOC_PAGE21	l_stogir.37348
  1efed0:      	ldr	x16, [x16]
		00000000001efed0:  ARM64_RELOC_PAGEOFF12	l_stogir.37348
  1efed4:      	str	x16, [sp, #0x38]
  1efed8:      	mov	x23, #0x24              ; =36
  1efedc:      	add	x0, x22, #0x4
  1efee0:      	ldr	x1, [x20, #0x8]
  1efee4:      	asr	x16, x0, #63
  1efee8:      	lsr	x16, x16, #62
  1efeec:      	add	x0, x0, x16
  1efef0:      	asr	x0, x0, #2
  1efef4:      	orr	x19, x0, xzr
  1efef8:      	add	x0, x19, x28
  1efefc:      	cmp	x0, x1
  1eff00:      	b.le	0x1eff14 <_stogir.verify.structure+0x664>
  1eff04:      	adrp	x16, 0x1ef000 <_coil.compiler.codegen_stogir.translate!+0x12f0>
		00000000001eff04:  ARM64_RELOC_PAGE21	l_stogir.37349
  1eff08:      	ldr	x16, [x16]
		00000000001eff08:  ARM64_RELOC_PAGEOFF12	l_stogir.37349
  1eff0c:      	str	x16, [sp, #0x38]
  1eff10:      	mov	x23, #0x15              ; =21
  1eff14:      	mov	x0, #0x1                ; =1
  1eff18:      	b	0x1efe94 <_stogir.verify.structure+0x5e4>
  1eff1c:      	ldr	x0, [x27, #0x8]
  1eff20:      	cmp	x21, x0
  1eff24:      	b.gt	0x1f0284 <_stogir.verify.structure+0x9d4>
  1eff28:      	sub	x0, x21, #0x1
  1eff2c:      	ldr	x2, [sp, #0x60]
  1eff30:      	ldr	x3, [x2, #0x28]
  1eff34:      	mov	x17, #0x18              ; =24
  1eff38:      	mul	x0, x0, x17
  1eff3c:      	add	x0, x0, x3
  1eff40:      	ldr	x3, [x0]
  1eff44:      	ldr	x0, [x0, #0x8]
  1eff48:      	ldr	x4, [x2, #0x8]
  1eff4c:      	cmp	x3, #0x0
  1eff50:      	b.lt	0x1eff78 <_stogir.verify.structure+0x6c8>
  1eff54:      	cmp	x3, x4
  1eff58:      	b.gt	0x1eff78 <_stogir.verify.structure+0x6c8>
  1eff5c:      	cmp	x0, #0x0
  1eff60:      	b.lt	0x1eff78 <_stogir.verify.structure+0x6c8>
  1eff64:      	sub	x3, x4, x3
  1eff68:      	cmp	x0, x3
  1eff6c:      	b.gt	0x1eff78 <_stogir.verify.structure+0x6c8>
  1eff70:      	mov	w0, #0x1                ; =1
  1eff74:      	b	0x1eff7c <_stogir.verify.structure+0x6cc>
  1eff78:      	movz	w0, #0x0, lsl #16
  1eff7c:      	b	0x1efd98 <_stogir.verify.structure+0x4e8>
  1eff80:      	mov	w0, #-0x2               ; =-2
  1eff84:      	sxtw	x0, w0
  1eff88:      	cmp	x22, x0
  1eff8c:      	b.eq	0x1efeac <_stogir.verify.structure+0x5fc>
  1eff90:      	ldr	x0, [sp, #0x58]
  1eff94:      	ldr	x2, [sp, #0x60]
  1eff98:      	ldr	x3, [sp, #0x50]
  1eff9c:      	ldr	x4, [sp, #0x48]
  1effa0:      	mov	x5, x28
  1effa4:      	ldr	x19, [sp, #0x40]
  1effa8:      	adrp	x16, 0x1ef000 <_coil.compiler.codegen_stogir.translate!+0x12f0>
		00000000001effa8:  ARM64_RELOC_PAGE21	l_stogir.37350
  1effac:      	ldr	x16, [x16]
		00000000001effac:  ARM64_RELOC_PAGEOFF12	l_stogir.37350
  1effb0:      	str	x16, [sp, #0x38]
  1effb4:      	mov	x16, #0x23              ; =35
  1effb8:      	str	x16, [sp, #0x80]
  1effbc:      	b	0x1ef934 <_stogir.verify.structure+0x84>
  1effc0:      	cmp	x21, #0x0
  1effc4:      	b.ne	0x1f028c <_stogir.verify.structure+0x9dc>
  1effc8:      	uxtb	w16, w25
  1effcc:      	cmp	w16, wzr
  1effd0:      	b.eq	0x1f00fc <_stogir.verify.structure+0x84c>
  1effd4:      	ldr	w1, [x22]
  1effd8:      	uxtb	w16, w28
  1effdc:      	cmp	w16, wzr
  1effe0:      	b.eq	0x1f0144 <_stogir.verify.structure+0x894>
  1effe4:      	uxtb	w16, w26
  1effe8:      	cmp	w16, wzr
  1effec:      	b.eq	0x1efff4 <_stogir.verify.structure+0x744>
  1efff0:      	mov	w19, #0x4               ; =4
  1efff4:      	lsl	w5, w19, #2
  1efff8:      	ubfx	x5, x5, #0, #32
  1efffc:      	lsr	x1, x1, x5
  1f0000:      	and	w1, w1, #0xf
  1f0004:      	b	0x1f0148 <_stogir.verify.structure+0x898>
  1f0008:      	cmp	x21, #0x0
  1f000c:      	b.le	0x1f0298 <_stogir.verify.structure+0x9e8>
  1f0010:      	ldr	x0, [x20, #0x8]
  1f0014:      	cmp	x21, x0
  1f0018:      	b.ge	0x1f02a0 <_stogir.verify.structure+0x9f0>
  1f001c:      	ldr	x0, [sp, #0x58]
  1f0020:      	ldr	x1, [x0, #0x8]
  1f0024:      	cmp	x21, x1
  1f0028:      	b.ge	0x1f0154 <_stogir.verify.structure+0x8a4>
  1f002c:      	ldr	x1, [x20, #0x78]
  1f0030:      	add	x1, x1, x21, lsl #2
  1f0034:      	ldr	w1, [x1]
  1f0038:      	sxtw	x1, w1
  1f003c:      	cmp	x1, #0x0
  1f0040:      	cset	w1, ge
  1f0044:      	ubfx	x1, x1, #0, #8
  1f0048:      	b	0x1f0158 <_stogir.verify.structure+0x8a8>
  1f004c:      	ldr	w1, [sp, #0xb0]
  1f0050:      	uxtb	w16, w1
  1f0054:      	cmp	w16, wzr
  1f0058:      	b.eq	0x1f02a8 <_stogir.verify.structure+0x9f8>
  1f005c:      	ldr	w5, [sp, #0xa8]
  1f0060:      	uxtb	w16, w5
  1f0064:      	cmp	w16, wzr
  1f0068:      	b.eq	0x1f0078 <_stogir.verify.structure+0x7c8>
  1f006c:      	ldr	x6, [sp, #0xa0]
  1f0070:      	cmp	x6, #0x2
  1f0074:      	b.eq	0x1efb6c <_stogir.verify.structure+0x2bc>
  1f0078:      	adrp	x16, 0x1f0000 <_stogir.verify.structure+0x750>
		00000000001f0078:  ARM64_RELOC_PAGE21	l_stogir.37351
  1f007c:      	ldr	x16, [x16]
		00000000001f007c:  ARM64_RELOC_PAGEOFF12	l_stogir.37351
  1f0080:      	str	x16, [sp, #0x38]
  1f0084:      	mov	x16, #0x1a              ; =26
  1f0088:      	str	x16, [sp, #0x80]
  1f008c:      	b	0x1efb6c <_stogir.verify.structure+0x2bc>
  1f0090:      	movz	x1, #0x0, lsl #48
  1f0094:      	ldr	x3, [sp, #0x50]
  1f0098:      	ldr	x4, [sp, #0x48]
  1f009c:      	b	0x1efb5c <_stogir.verify.structure+0x2ac>
  1f00a0:      	cmp	x21, #0x0
  1f00a4:      	b.ge	0x1f02b0 <_stogir.verify.structure+0xa00>
  1f00a8:      	ldr	x3, [sp, #0x50]
  1f00ac:      	ldr	x1, [x3, #0x8]
  1f00b0:      	ldr	x4, [sp, #0x48]
  1f00b4:      	ldr	x5, [x4, #0x8]
  1f00b8:      	cmp	x1, x5
  1f00bc:      	b.ne	0x1f014c <_stogir.verify.structure+0x89c>
  1f00c0:      	movz	x16, #0x0, lsl #48
  1f00c4:      	sub	x5, x16, x21
  1f00c8:      	cmp	x5, x1
  1f00cc:      	b.gt	0x1f017c <_stogir.verify.structure+0x8cc>
  1f00d0:      	sub	x1, x5, #0x1
  1f00d4:      	ldr	x5, [x20, #0x50]
  1f00d8:      	add	x1, x5, x1, lsl #2
  1f00dc:      	ldr	w1, [x1]
  1f00e0:      	sxtw	x1, w1
  1f00e4:      	cmp	x1, #0x0
  1f00e8:      	cset	w1, gt
  1f00ec:      	ubfx	x1, x1, #0, #8
  1f00f0:      	b	0x1f0180 <_stogir.verify.structure+0x8d0>
  1f00f4:      	brk	#0
  1f00f8:      	b	0x1f00f4 <_stogir.verify.structure+0x844>
  1f00fc:      	movz	w1, #0x0, lsl #16
  1f0100:      	adrp	x16, 0x1f0000 <_stogir.verify.structure+0x750>
		00000000001f0100:  ARM64_RELOC_PAGE21	l_stogir.37352
  1f0104:      	ldr	x16, [x16]
		00000000001f0104:  ARM64_RELOC_PAGEOFF12	l_stogir.37352
  1f0108:      	ldr	w5, [x16]
  1f010c:      	ubfx	x1, x1, #0, #32
  1f0110:      	cmp	x1, x5
  1f0114:      	b.ne	0x1f0124 <_stogir.verify.structure+0x874>
  1f0118:      	ldr	w1, [sp, #0xb0]
  1f011c:      	ldr	w5, [sp, #0xa8]
  1f0120:      	b	0x1efb6c <_stogir.verify.structure+0x2bc>
  1f0124:      	adrp	x16, 0x1f0000 <_stogir.verify.structure+0x750>
		00000000001f0124:  ARM64_RELOC_PAGE21	l_stogir.37353
  1f0128:      	ldr	x16, [x16]
		00000000001f0128:  ARM64_RELOC_PAGEOFF12	l_stogir.37353
  1f012c:      	ldr	w5, [x16]
  1f0130:      	cmp	x1, x5
  1f0134:      	b.ne	0x1f015c <_stogir.verify.structure+0x8ac>
  1f0138:      	ldr	w1, [sp, #0xb0]
  1f013c:      	ldr	w5, [sp, #0xa8]
  1f0140:      	b	0x1efb6c <_stogir.verify.structure+0x2bc>
  1f0144:      	movz	w1, #0x0, lsl #16
  1f0148:      	b	0x1f0100 <_stogir.verify.structure+0x850>
  1f014c:      	movz	x1, #0x0, lsl #48
  1f0150:      	b	0x1efb5c <_stogir.verify.structure+0x2ac>
  1f0154:      	movz	x1, #0x0, lsl #48
  1f0158:      	b	0x1f0094 <_stogir.verify.structure+0x7e4>
  1f015c:      	adrp	x16, 0x1f0000 <_stogir.verify.structure+0x750>
		00000000001f015c:  ARM64_RELOC_PAGE21	l_stogir.37354
  1f0160:      	ldr	x16, [x16]
		00000000001f0160:  ARM64_RELOC_PAGEOFF12	l_stogir.37354
  1f0164:      	ldr	w5, [x16]
  1f0168:      	cmp	x1, x5
  1f016c:      	b.ne	0x1f004c <_stogir.verify.structure+0x79c>
  1f0170:      	ldr	w1, [sp, #0xb0]
  1f0174:      	ldr	w5, [sp, #0xa8]
  1f0178:      	b	0x1efb6c <_stogir.verify.structure+0x2bc>
  1f017c:      	movz	x1, #0x0, lsl #48
  1f0180:      	b	0x1f0150 <_stogir.verify.structure+0x8a0>
  1f0184:      	brk	#0
  1f0188:      	b	0x1f0184 <_stogir.verify.structure+0x8d4>
  1f018c:      	str	x19, [sp, #0x30]
  1f0190:      	mov	x19, x0
  1f0194:      	str	x22, [sp, #0x38]
  1f0198:      	str	x23, [sp, #0x80]
  1f019c:      	b	0x1efabc <_stogir.verify.structure+0x20c>
  1f01a0:      	str	x19, [sp, #0x30]
  1f01a4:      	mov	x19, x0
  1f01a8:      	str	x22, [sp, #0x38]
  1f01ac:      	str	x23, [sp, #0x80]
  1f01b0:      	b	0x1efabc <_stogir.verify.structure+0x20c>
  1f01b4:      	mov	x5, x28
  1f01b8:      	str	x19, [sp, #0x30]
  1f01bc:      	mov	x19, x0
  1f01c0:      	mov	x0, x21
  1f01c4:      	mov	x2, x24
  1f01c8:      	mov	x3, x25
  1f01cc:      	mov	x4, x26
  1f01d0:      	b	0x1ef994 <_stogir.verify.structure+0xe4>
  1f01d4:      	mov	x5, x28
  1f01d8:      	str	x19, [sp, #0x30]
  1f01dc:      	mov	x19, x0
  1f01e0:      	mov	x0, x21
  1f01e4:      	mov	x2, x24
  1f01e8:      	mov	x3, x25
  1f01ec:      	mov	x4, x26
  1f01f0:      	b	0x1ef960 <_stogir.verify.structure+0xb0>
  1f01f4:      	mov	x5, x28
  1f01f8:      	ldr	x19, [sp, #0x40]
  1f01fc:      	ldr	x0, [sp, #0x58]
  1f0200:      	ldr	x2, [sp, #0x60]
  1f0204:      	ldr	x3, [sp, #0x50]
  1f0208:      	ldr	x4, [sp, #0x48]
  1f020c:      	b	0x1ef960 <_stogir.verify.structure+0xb0>
  1f0210:      	ldr	x0, [sp, #0x38]
  1f0214:      	b	0x1efaf0 <_stogir.verify.structure+0x240>
  1f0218:      	str	x28, [sp, #0x90]
  1f021c:      	ldr	x0, [sp, #0x58]
  1f0220:      	str	x19, [sp, #0x88]
  1f0224:      	ldr	x2, [sp, #0x60]
  1f0228:      	str	x23, [sp, #0x80]
  1f022c:      	ldr	x3, [sp, #0x50]
  1f0230:      	ldr	x4, [sp, #0x48]
  1f0234:      	b	0x1ef91c <_stogir.verify.structure+0x6c>
  1f0238:      	str	w21, [sp, #0xb0]
  1f023c:      	mov	w21, w1
  1f0240:      	str	w24, [sp, #0xa8]
  1f0244:      	mov	x24, x0
  1f0248:      	b	0x1efcf0 <_stogir.verify.structure+0x440>
  1f024c:      	ldr	x2, [sp, #0x60]
  1f0250:      	b	0x1efddc <_stogir.verify.structure+0x52c>
  1f0254:      	ldr	x0, [sp, #0x58]
  1f0258:      	ldr	w1, [sp, #0xb0]
  1f025c:      	ldr	w5, [sp, #0xa8]
  1f0260:      	ldr	x3, [sp, #0x50]
  1f0264:      	ldr	x4, [sp, #0x48]
  1f0268:      	b	0x1efb6c <_stogir.verify.structure+0x2bc>
  1f026c:      	ldr	x0, [sp, #0x58]
  1f0270:      	ldr	w1, [sp, #0xb0]
  1f0274:      	ldr	w5, [sp, #0xa8]
  1f0278:      	ldr	x3, [sp, #0x50]
  1f027c:      	ldr	x4, [sp, #0x48]
  1f0280:      	b	0x1efb6c <_stogir.verify.structure+0x2bc>
  1f0284:      	ldr	x2, [sp, #0x60]
  1f0288:      	b	0x1efd94 <_stogir.verify.structure+0x4e4>
  1f028c:      	ldr	w1, [sp, #0xb0]
  1f0290:      	ldr	w5, [sp, #0xa8]
  1f0294:      	b	0x1f0078 <_stogir.verify.structure+0x7c8>
  1f0298:      	ldr	x0, [sp, #0x58]
  1f029c:      	b	0x1f00a0 <_stogir.verify.structure+0x7f0>
  1f02a0:      	ldr	x0, [sp, #0x58]
  1f02a4:      	b	0x1f0090 <_stogir.verify.structure+0x7e0>
  1f02a8:      	ldr	w5, [sp, #0xa8]
  1f02ac:      	b	0x1f0078 <_stogir.verify.structure+0x7c8>
  1f02b0:      	ldr	x3, [sp, #0x50]
  1f02b4:      	ldr	x4, [sp, #0x48]
  1f02b8:      	b	0x1efb58 <_stogir.verify.structure+0x2a8>
