%define ASMLIB_PUT_PIXEL

%ifndef ASMLIB_GRAPHICS_DATA_TYPES
    %include "asmlib/graphics/data_types.asm"
%endif

%ifndef ASMLIB_POINT_TO_ADDR
    %include "asmlib/graphics/point_to_addr.asm"
%endif

; rdi - *struct point
; rsi - *struct color
put_pixel:
    push r8
    push rcx
    push rdx
    push rdi

    call point_to_addr

    mov r8b, byte [rsi+color.b]
    mov cl, byte [rsi+color.g]
    mov dl, byte [rsi+color.r]
    mov byte [rax], r8b
    mov byte [rax+1], cl
    mov byte [rax+2], dl

    pop rdi
    pop rdx
    pop rcx
    pop r8
    ret
