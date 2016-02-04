; rdi - min
; rsi - max
rand_min_max:
    push rdi
    push rsi
    push rbx
    push rdx

    call gen_rnd
    mov rbx, rsi
    sub rbx, rdi

    div rbx
    add rdx, rdi

    mov rax, rdx

    pop rdx
    pop rbx
    pop rsi
    pop rdi
    ret
