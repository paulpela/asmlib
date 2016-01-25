%define ASMLIB_OFFSET_TO_ADDR

; rdi - offset in pixels
offset_to_addr:
    push rbx

    mov rbx, rdi
    call get_bytes_per_pixel
    mul rbx
    xor rbx, rbx
    mov ebx, dword [VBEModeInfoBlock.PhysBasePtr]
    add rdi, rax
    add rdi, rbx
    mov rax, rdi

    pop rbx
    ret ; rax holds the address
