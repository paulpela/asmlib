%define ASMLIB_XY_TO_OFFSET

%ifndef ASMLIB_GET_BYTES_PER_PIXEL
    %include "asmlib/graphics/get_bytes_per_pixel.asm"
%endif

xy_to_offset:
    push rbx
    push rcx
    push rdx
    push r8

    mov rax, rsi
    xor rbx, rbx
    mov bx, word [VBEModeInfoBlock.XResolution]
    mul rbx
    add rax, rdi
    push rax

    call get_bytes_per_pixel
    mov rbx, rax

    pop rax
    mul rbx

    pop r8
    pop rdx
    pop rcx
    pop rbx
    ret ; rax holds the offset
