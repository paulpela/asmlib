; rdi: cartesian 2d point x
; rsi: cartesian 2d point y
twod_to_iso:
    push rax
    push rbx
    push r8
    push r9

    mov rax, rdi
    mov r8, rax ; save for later
    mov r9, rsi
    sub rax, r9

    mov rbx, r8
    add rbx, r9
    shr rbx, 1

    mov rdi, rax
    mov rsi, rbx

    pop r9
    pop r8
    pop rbx
    pop rax
    ret

