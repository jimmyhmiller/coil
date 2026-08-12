; `load` is expanded by the compiler into this module. No runtime reader or
; evaluator is linked into the resulting program.
(load "tests/scheme/fixtures/load.scm")
(display (loaded-add 1))
(newline)
(display loaded-base)
(newline)
