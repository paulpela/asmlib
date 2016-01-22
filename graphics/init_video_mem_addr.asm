init_video_mem_addr:
    xor rax, rax
    mov eax, dword [0x5c00+40]
    mov qword [video_mem], rax
    ret
