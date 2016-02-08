; rdi: x
; rsi: y
cart_to_iso:
    push rdx
    push rbx

    mov rbx, rdi
    sub rbx, rsi

    mov rdx, rsi
    shl rdx, 1
    sub rdx, rdi
    shr rdx, 1

    mov rdi, rbx
    mov rsi, rdx

    pop rbx
    pop rdx
    ret
