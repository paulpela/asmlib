; rdi: buffer location
; rsi: size in dq
mkbuf:
    push rdi
    push rsi
    push rax
    push rcx

    xor rax, rax
    mov rcx, rsi
    rep stosq

    pop rcx
    pop rax
    pop rsi
    pop rdi
    ret
