%define ASMLIB_OFFSET_TO_ADDR

; rdi - offset
offset_to_addr:
    push rbx

    xor rbx, rbx
    mov ebx, dword [VBEModeInfoBlock.PhysBasePtr]
    add rdi, rbx
    mov rax, rdi

    pop rbx
    ret ; rax holds the address
