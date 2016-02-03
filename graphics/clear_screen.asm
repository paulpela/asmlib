%define ASMLIB_CLEAR_SCREEN

; rdi: color
clear_screen:
    push rax
    push rbx
    push rcx
    push rdx

    mov rax, rdi

    xor rdi, rdi
    mov edi, dword [VBEModeInfoBlock.PhysBasePtr]

    mov rcx, SCREEN_RES_X * SCREEN_RES_Y
.loop:
    mov byte [rdi], al
    inc rdi
    loop .loop

    pop rdx
    pop rcx
    pop rbx
    pop rax
    ret
    

