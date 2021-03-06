%define ASMLIB_OFFSET_TO_ADDR

; rdi - offset in pixels
offset_to_addr:
    push rbx
    push rdi

    xor rbx, rbx
    mov ebx, dword [VBEModeInfoBlock.PhysBasePtr]
    add rdi, rbx
    mov rax, rdi

    pop rdi
    pop rbx
    ret ; rax holds the address
