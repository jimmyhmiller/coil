
/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-iterator-results/build/zext-power-bench/power/before-stogir.o:	file format mach-o arm64

Disassembly of section __TEXT,__text:

0000000000000000 <_gap_zext_quotient>:
       0:      	ubfx	x0, x0, #0, #32
       4:      	asr	x16, x0, #63
       8:      	lsr	x16, x16, #62
       c:      	add	x0, x0, x16
      10:      	asr	x0, x0, #2
      14:      	ret

0000000000000018 <_gap_zext_remainder>:
      18:      	ubfx	x0, x0, #0, #32
      1c:      	asr	x16, x0, #63
      20:      	lsr	x16, x16, #62
      24:      	add	x0, x0, x16
      28:      	and	x0, x0, #0x3
      2c:      	sub	x0, x0, x16
      30:      	ret
