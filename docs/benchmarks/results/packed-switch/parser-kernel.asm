
0000000000002908 <_gap_profiled_selector>:
    2908:      	ldr	x0, [x0]
    290c:      	lsr	w0, w0, #0
    2910:      	cmp	x0, #0x9
    2914:      	b.hi	0x2934 <_gap_profiled_selector+0x2c>
    2918:      	lsl	x0, x0, #2
    291c:      	mov	x16, #0x3210            ; =12816
    2920:      	movk	x16, #0x7654, lsl #16
    2924:      	movk	x16, #0x68, lsl #32
    2928:      	lsr	x0, x16, x0
    292c:      	and	x0, x0, #0xf
    2930:      	ret
    2934:      	brk	#0
    2938:      	b	0x2934 <_gap_profiled_selector+0x2c>
    293c:      	udf	#0x0
