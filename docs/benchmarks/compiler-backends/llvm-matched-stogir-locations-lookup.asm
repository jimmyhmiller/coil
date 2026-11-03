
build/bin/coil-normal-llvm-s3:	file format mach-o arm64

Disassembly of section __TEXT,__text:

00000001002b9898 <_stogir.locations.lookup>:
1002b9898:     	ldr	x10, [x0, #0x8]
1002b989c:     	cmp	x10, #0x1
1002b98a0:     	b.lt	0x1002b99d0 <_stogir.locations.lookup+0x138>
1002b98a4:     	stp	x20, x19, [sp, #-0x10]!
1002b98a8:     	ldr	x14, [x0]
1002b98ac:     	mov	x12, xzr
1002b98b0:     	mov	w15, wzr
1002b98b4:     	mov	x9, xzr
1002b98b8:     	adrp	x13, 0x1004c9000 <_static.cstr.2259+0x5333>
1002b98bc:     	add	x13, x13, #0x6eb
1002b98c0:     	mov	w16, #0x1               ; =1
1002b98c4:     	mov	x11, #-0x1              ; =-1
1002b98c8:     	mov	w17, #0x70              ; =112
1002b98cc:     	adrp	x0, 0x1004c9000 <_static.cstr.2259+0x5333>
1002b98d0:     	add	x0, x0, #0x6f0
1002b98d4:     	b	0x1002b98f0 <_stogir.locations.lookup+0x58>
1002b98d8:     	mov	w15, #0x1               ; =1
1002b98dc:     	mov	w9, #0x1a               ; =26
1002b98e0:     	mov	x13, x0
1002b98e4:     	add	x12, x12, #0x1
1002b98e8:     	cmp	x12, x10
1002b98ec:     	b.eq	0x1002b9998 <_stogir.locations.lookup+0x100>
1002b98f0:     	madd	x3, x12, x17, x14
1002b98f4:     	ldr	w4, [x3, #0x50]
1002b98f8:     	cmp	w4, w1
1002b98fc:     	b.ne	0x1002b98e4 <_stogir.locations.lookup+0x4c>
1002b9900:     	ldr	x4, [x3, #0x8]
1002b9904:     	cmp	x4, #0x1
1002b9908:     	b.lt	0x1002b9950 <_stogir.locations.lookup+0xb8>
1002b990c:     	ldr	x6, [x3]
1002b9910:     	mov	x5, xzr
1002b9914:     	mov	x7, x4
1002b9918:     	b	0x1002b9928 <_stogir.locations.lookup+0x90>
1002b991c:     	cmp	x5, x19
1002b9920:     	mov	x7, x19
1002b9924:     	b.ge	0x1002b9954 <_stogir.locations.lookup+0xbc>
1002b9928:     	sub	x19, x7, x5
1002b992c:     	add	x19, x19, x19, lsr #63
1002b9930:     	add	x19, x5, x19, asr #1
1002b9934:     	add	x20, x6, x19, lsl #4
1002b9938:     	ldr	x20, [x20, #0x8]
1002b993c:     	cmp	x20, x2
1002b9940:     	b.gt	0x1002b991c <_stogir.locations.lookup+0x84>
1002b9944:     	add	x5, x19, #0x1
1002b9948:     	mov	x19, x7
1002b994c:     	b	0x1002b991c <_stogir.locations.lookup+0x84>
1002b9950:     	mov	x5, xzr
1002b9954:     	cmp	x5, x4
1002b9958:     	b.ge	0x1002b98e4 <_stogir.locations.lookup+0x4c>
1002b995c:     	ldr	x4, [x3]
1002b9960:     	lsl	x5, x5, #4
1002b9964:     	ldr	x4, [x4, x5]
1002b9968:     	cmp	x4, x2
1002b996c:     	b.gt	0x1002b98e4 <_stogir.locations.lookup+0x4c>
1002b9970:     	tbnz	w15, #0x0, 0x1002b98d8 <_stogir.locations.lookup+0x40>
1002b9974:     	ldr	w11, [x3, #0x60]
1002b9978:     	tbnz	w11, #0x1f, 0x1002b9988 <_stogir.locations.lookup+0xf0>
1002b997c:     	mov	w16, wzr
1002b9980:     	mov	w15, #0x1               ; =1
1002b9984:     	b	0x1002b98e4 <_stogir.locations.lookup+0x4c>
1002b9988:     	ldr	x11, [x3, #0x68]
1002b998c:     	mov	w15, #0x1               ; =1
1002b9990:     	mov	w16, #0x1               ; =1
1002b9994:     	b	0x1002b98e4 <_stogir.locations.lookup+0x4c>
1002b9998:     	ldp	x20, x19, [sp], #0x10
1002b999c:     	cbz	x9, 0x1002b99b0 <_stogir.locations.lookup+0x118>
1002b99a0:     	mov	w10, #0x1               ; =1
1002b99a4:     	stp	x13, x9, [x8, #0x8]
1002b99a8:     	str	w10, [x8]
1002b99ac:     	ret
1002b99b0:     	cmn	x11, #0x1
1002b99b4:     	cset	w9, gt
1002b99b8:     	and	w9, w15, w9
1002b99bc:     	tbz	w9, #0x0, 0x1002b99d0 <_stogir.locations.lookup+0x138>
1002b99c0:     	str	wzr, [x8]
1002b99c4:     	stp	w16, wzr, [x8, #0x8]
1002b99c8:     	str	x11, [x8, #0x10]
1002b99cc:     	ret
1002b99d0:     	mov	w9, #0x1                ; =1
1002b99d4:     	adrp	x10, 0x1004c9000 <_static.cstr.2259+0x5333>
1002b99d8:     	add	x10, x10, #0x710
1002b99dc:     	str	w9, [x8]
1002b99e0:     	mov	w9, #0x21               ; =33
1002b99e4:     	stp	x10, x9, [x8, #0x8]
1002b99e8:     	ret
