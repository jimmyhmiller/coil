# llhttp Coil backend

This directory contains Coil's source backend for the `llparse` state-machine
compiler. It consumes the exact dependency graph from the pinned llhttp 9.4.3
checkout and emits `src/stdlib/llhttp_generated.coil`.

The generated file is checked in. Normal Coil builds therefore require neither
Node.js nor npm. Regeneration and parity testing use an upstream checkout whose
version and Git revision are verified before its graph is loaded.

During the migration, upstream C llhttp is retained only as a differential
oracle. It is not part of the final Coil runtime.

Run `scripts/llhttp/regenerate.sh` to download the checksum-pinned `v9.4.3`
source and regenerate both the state machine and checked-in differential corpus.
You may pass an existing checkout to avoid the download; its package version is
verified. The tag resolves to `45c8699d0ca8431ab366c8706e613b2e2ac62c04`.
