# Bulk expansion delivery state

Installed source 979be2f998fb (128-byte policy), SDK digest
35de146795177f09d438a1e50e6cac17fcc5734c3a902da219418f438e7ed2c5.
FAST: 49/49 PASS, 264.5 seconds; cli/objects peak 1.60 GB warning.
Installer completed compiler/stdlib/native archive installation and warmed the
matching JIT unit and lint profile. All 337 compiler and 124 stdlib installed
files match exactly. Off-checkout Stogir compilation and the independent wide
aggregate C oracle pass (checksum 7941937658055385884).

Standalone source/evidence f77b1f41493bec4e8a9b49988fe71b4e15e0cdbc is published
on experiment/bulk-expansion. The 512-byte experiment remains separate and is
not installed; its isolated generation penalty is 19.84%.

Full compiler comparison is in BULK_EXPANSION_BOOTSTRAP.md: generation 3.0428x
faster than LLVM O3; generated runtime 2.3037x slower. Both targets remain unmet.
No controlled before/after whole-bootstrap gain is claimed across source changes.
This delivery is a validated incremental backend improvement, not goal completion.
