0000000100000598 <_gap_aggregate_get>:
100000598:     	ldr	x8, [x0]
10000059c:     	add	x8, x8, x1, lsl #4
1000005a0:     	ldrsw	x9, [x8, #0x4]
1000005a4:     	ldr	x8, [x8, #0x8]
1000005a8:     	add	x9, x9, x8, asr #32
1000005ac:     	add	x0, x9, w8, sxtw
1000005b0:     	ret
