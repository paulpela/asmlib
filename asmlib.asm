%define ASMLIB

%include "asmlib/system.asm"
%include "asmlib/math.asm"
%include "asmlib/graphics.asm"

%ifdef USE_PURE64
    %include "asmlib/pure64/pure64.asm"
%endif

%ifdef DEBUG
    %include "asmlib/nasm/debug.asm"
%endif
