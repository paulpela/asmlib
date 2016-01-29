%define ASMLIB

%include "asmlib/pure64/pure64.asm"
%include "asmlib/system.asm"
%include "asmlib/math.asm"
%include "asmlib/graphics.asm"

%ifdef DEBUG
    %include "asmlib/nasm/debug.asm"
%endif
