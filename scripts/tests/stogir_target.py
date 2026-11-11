"""What the Stogir object checks need to know about the machine they run on.

The Stogir backend generates code for the machine the compiler was built for:
AArch64 Mach-O on macOS, x86-64 ELF on Linux. Checks that ask a question about
objects in general (which symbols are defined, which symbols are called)
spell it through this module; checks that read AArch64 instruction shapes
(frame loads, load/store pairs, ADRP pairs) do not and stay AArch64-only.
"""
import platform

SYSTEM = platform.system()
MACHINE = platform.machine()
X64 = MACHINE in ('x86_64', 'AMD64')
ARM64 = MACHINE in ('arm64', 'aarch64')
if not ((SYSTEM == 'Darwin' and ARM64) or (SYSTEM == 'Linux' and X64)):
    raise SystemExit(f'stogir checks: no Stogir backend for {MACHINE} {SYSTEM}')

# Mach-O spells a C symbol with a leading underscore; ELF does not.
SYMBOL_PREFIX = '_' if SYSTEM == 'Darwin' else ''
# The relocation of a direct call, as `llvm-objdump -r` prints it.
CALL_RELOCATION = 'R_X86_64_PLT32' if X64 else 'ARM64_RELOC_BRANCH26'
# The mnemonic of a direct call in `objdump -d`.
CALL_MNEMONICS = ('call', 'callq') if X64 else ('bl',)


def symbol(name):
    """The object-file spelling of the C or Coil symbol NAME."""
    return SYMBOL_PREFIX + name


def call_target(line):
    """The symbol a call-relocation line of `llvm-objdump -dr` names, or None.
    ELF prints the addend after the symbol (`puts-0x4`)."""
    if CALL_RELOCATION not in line:
        return None
    target = line.split()[-1]
    if X64:
        for sign in ('-0x', '+0x'):
            head, found, tail = target.rpartition(sign)
            if found and tail and all(c in '0123456789abcdef' for c in tail):
                target = head
                break
    return target
