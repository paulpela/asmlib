%define ASMLIB_GET_SCREEN_SIZE

get_screen_size:
    push rbx

    xor rax, rax
    xor rbx, rbx
    mov ax, word [VBEModeInfoBlock.XResolution]
    mov bx, word [VBEModeInfoBlock.YResolution]
    mul rbx

    pop rbx
    ret
