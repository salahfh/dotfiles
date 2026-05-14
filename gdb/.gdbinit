# Interesting information about GDB: https://stackoverflow.com/tags/x86/info
set disassembly-flavor intel
layout reg

set print static-members off
set print pretty on
macro define offsetof(t, f) &((t *) 0)->f)
