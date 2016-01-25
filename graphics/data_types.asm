; Data types definitions
%define ASMLIB_GRAPHICS_DATA_TYPES

struc point
    .x:         resw 1
    .y:         resw 1
endstruc

struc pixel
    .a:         resb 1 ; alpha/transparency
    .r:         resb 1
    .g:         resb 1
    .b:         resb 1
endstruc

struc rect
    .origin:    resq 1 ; *struct point
    .lenght:    resw 1
    .height:    resw 1
    .color:     resq 1 ; *struct color
endstruc

struc circle
    .origin:    resq 1 ; *struct point
    .r:         resw 1
    .color:     resq 1 ; *struct color
endstruc

struc line
    .origin:    resq 1 ; *struct point
    .a:         resw 1
    .b:         resw 1 ; y = ax+b
    .length:    resw 1
    .color:     resq 1 ; *struct color
endstruc
