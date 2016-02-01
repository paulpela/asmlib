USE64

%define ASMLIB_RESTORE_BG_BUFFER

; rdi - buffer address
restore_bg_buffer:
    push rax
    push rcx
    push rsi
    push rdi

    mov rsi, rdi

    mov rcx, SCREEN_RES_X * SCREEN_RES_Y * BYTES_PER_PIXEL
    shr rcx, 3
    xor rax, rax
    xor rdi, rdi
    mov edi, dword [VBEModeInfoBlock.PhysBasePtr]
.copy:
    lodsq
    stosq
    loop .copy

    pop rdi
    pop rsi
    pop rcx
    pop rax
    ret
