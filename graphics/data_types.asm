; Data types definitions
%define ASMLIB_GRAPHICS_DATA_TYPES

struc point
    .x:         resq 1
    .y:         resq 1
endstruc

struc color
    .a:         resb 1 ; alpha/transparency
    .r:         resb 1
    .g:         resb 1
    .b:         resb 1
endstruc

%include "asmlib/graphics/macros.asm"
