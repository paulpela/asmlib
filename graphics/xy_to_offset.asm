%include "asmlib/graphics/get_bytes_per_pixel.asm"

xy_to_offset:
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
    ret ; rax holds the offset
