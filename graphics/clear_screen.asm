; rdi: color 0x00rrggbb
clear_screen:
    mov rax, rdi
    mov rbx, rdi
    shr rbx, 8
    mov rdi, [video_mem]
    mov rcx, [screen_size]
.clear:
    mov byte [rdi], al
    mov word [rdi+1], bx
    add rdi, 3
    loop .clear

    ret
    

