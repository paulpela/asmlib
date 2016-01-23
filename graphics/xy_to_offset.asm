xy_to_offset:
    mov rax, rsi
    xor rbx, rbx
    mov bx, word [VBEModeInfoBlock.XResolution]
    mul rbx
    add rax, rdi

    mov rbx, 3 ; TODO: remove hardcoded value
    mul rbx
    ret ; rax holds the offset
