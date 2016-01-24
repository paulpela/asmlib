%define ASMLIB_GET_SCREEN_SIZE

get_screen_size:
    xor rax, rax
    xor rbx, rbx
    mov ax, word [VBEModeInfoBlock.XResolution]
    mov bx, word [VBEModeInfoBlock.YResolution]
    mul rbx
    ret
