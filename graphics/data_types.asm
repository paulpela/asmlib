; Data types definitions
%define ASMLIB_GRAPHICS_DATA_TYPES

struct point
    .x:         resw 1
    .y:         resw 1
endstruc

struct pixel
    .r:         resb 1
    .g:         resb 1
    .b:         resb 1
endstruc
