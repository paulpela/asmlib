xy_to_offset:
    mov rax, rsi
    xor rbx, rbx
    mov bx, word [VBEModeInfoBlock.XResolution]
    mul rbx
    add rax, rdi
    push rax

    xor rax, rax
    mov al, byte [VBEModeInfoBlock.BitsPerPixel]
    mov rbx, 8
    div rbx
    mov rbx, rax

    pop rax
    mul rbx
    ret ; rax holds the offset
