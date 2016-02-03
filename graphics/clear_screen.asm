%define ASMLIB_CLEAR_SCREEN

; rdi: color
clear_screen:
    push rax
    push rbx
    push rcx
    push rdx

    mov rax, rdi
    shl rax, 8
    or rax, rdi
    mov rdi, rax
    shl rax, 16
    or rax, rdi
    mov rdi, rax
    shl rax, 32
    or rax, rdi

    mov edi, dword [VBEModeInfoBlock.PhysBasePtr]

    mov rcx, (SCREEN_RES_X * SCREEN_RES_Y) / 8
    rep stosq

    pop rdx
    pop rcx
    pop rbx
    pop rax
    ret
    

