%define ASMLIB_XY_TO_ADDR

%ifndef ASMLIB_XY_TO_OFFSET
    %include "asmlib/graphics/xy_to_offset.asm"
%endif

%ifndef ASMLIB_OFFSET_TO_ADDR
    %include "asmlib/graphics/offset_to_addr.asm"
%endif

; rdi - x
; rsi - y
xy_to_addr:
    push rbx
    push rcx
    push rdx
    push r8

    call xy_to_offset
    mov rdi, rax
    call offset_to_addr

    pop r8
    pop rdx
    pop rcx
    pop rbx
    ret ; rax holds the address
