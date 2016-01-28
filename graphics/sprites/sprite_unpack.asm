%define ASMLIB_SPRITE_UNPACK

; rdi: * to packed data
; rsi: * to buffer
sprite_unpack:
    push rax
    push rbx
    push rcx
    push rdx
    push rdi
    push rsi

    call sprite_unpack_header
    call sprite_unpack_data

    pop rsi
    pop rdi
    pop rdx
    pop rcx
    pop rbx
    pop rax
    ret

sprite_unpack_data:
.unpack:
    xor rax, rax
    xor rcx, rcx
    lodsw
    cmp ax, 0x0000
    je .end
    mov cl, ah
    shr ax, 4
.write_unpacked:
    stosb
    loop .write_unpacked
    jmp .unpack
    
.end:
    ret

sprite_unpack_header:
    push rax
    push rcx

    xor rax, rax
    mov ecx, 4
.loop:
    lodsb
    stosb
    loop .loop
    
    pop rcx
    pop rax
    ret
