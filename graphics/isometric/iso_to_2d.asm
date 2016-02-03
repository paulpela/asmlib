; rdi: point x
; rsi: point y
iso_to_2d:
    push r8
    push rax
    push rbx

    mov rax, rsi
    shl rax, 1
    mov r8, rax ; save for later
    add rax, rdi
    shr rax, 1

    mov rbx, r8 ; restore from before
    sub rbx, rdi
    shr rbx, 1

    mov rdi, rax
    mov rsi, rbx

    pop rbx
    pop rax
    pop r8
    ret
