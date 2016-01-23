; rdi: color 0x00rrggbb
clear_screen:
    push rdi

    xor rdi, rdi
    mov edi, dword [VBEModeInfoBlock.PhysBasePtr]

    xor rax, rax
    xor rbx, rbx
    mov ax, word [VBEModeInfoBlock.XResolution]
    mov bx, word [VBEModeInfoBlock.YResolution]
    mul rbx

    mov rcx, rax

    pop rax
    mov rbx, rax
    shr rbx, 8
.clear:
    mov byte [rdi], al
    mov word [rdi+1], bx
    add rdi, 3
    loop .clear

    ret
    

