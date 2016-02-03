%define ASMLIB

%include "asmlib/data_types.asm"

%include "asmlib/pure64/pure64.asm"
%include "asmlib/system/system.asm"
%include "asmlib/math/math.asm"
;%include "asmlib/graphics/graphics.asm"

%ifdef DEBUG
    %include "asmlib/nasm/debug.asm"
%endif
