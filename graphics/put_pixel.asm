%define ASMLIB_PUT_PIXEL

; rdi - point x
; rsi - point y
; rdx - color
put_pixel:
    push r8
    push r9
    push r12
    push rdx
    push rdi
    push rsi
    
    mov r9, rdi
    cmp rdi, 0
    jl .skip
    cmp rdi, SCREEN_RES_X
    jge .skip

    cmp rsi, 0
    jl .skip
    cmp rsi, SCREEN_RES_Y
    jge .skip

    mov r12, rsi
    shl rsi, 10
    shl r12, 8
    add rsi, r12
    add rsi, r9
    
    mov ebx, dword [VBEModeInfoBlock.PhysBasePtr]
    add rsi, rbx

    mov byte [rsi], dl

.skip:
    pop rsi
    pop rdi
    pop rdx
    pop r12
    pop r9
    pop r8
    ret
