%define ASMLIB_XY_TO_ADDR

%ifndef ASMLIB_XY_TO_OFFSET
    %include "asmlib/graphics/xy_to_offset.asm"
%endif


; rdi - x
; rsi - y
xy_to_addr:
    push rbx
    push rcx
    push rdx
    push r8

    call xy_to_offset
    xor rbx, rbx
    mov ebx, dword [VBEModeInfoBlock.PhysBasePtr]
    add rax, rbx

    pop r8
    pop rdx
    pop rcx
    pop rbx
    ret ; rax holds the address
