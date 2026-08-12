;; Enter Jolt through Scheme's sequential `load`, matching Chez's source-mode
;; boot semantics: every definition loaded by cli.ss is visible to the forms
;; and files that follow it.
(load ".coil/jolt-coil/jolt/host/chez/cli.ss")
