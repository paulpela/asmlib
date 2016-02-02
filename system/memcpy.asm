; rdi: destination
; rsi: source
; rcx: number of dqs to copy
memcpy:
    push rax
    push rsi
    push rdi
    push rcx
    
    xor rax, rax

.copy:
    lodsq
    stosq
    loop .copy

    pop rcx
    pop rdi
    pop rsi
    pop rax
    ret
