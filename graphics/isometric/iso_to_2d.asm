; rdi: iso point
iso_to_2d:
    mov rax, qword [rdi+point.y]
    shl rax, 1
    mov r8, rax ; save for later
    add rax, qword [rdi+point.x]
    shr rax, 1
    mov qword [_iso_to_2d_point+point.x], rax

    mov rax, r8 ; restore from before
    sub rax, qword [rdi+point.x]
    shr rax, 1
    mov qword [_iso_to_2d_point+point.y], rax

    mov rax, _iso_to_2d_point
    ret
    
_iso_to_2d_point: istruc point
    at point.x,     dq      0
    at point.y,     dq      0
iend
