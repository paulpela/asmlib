; rdi: cartesian 2d point
twod_to_iso:
    mov rax, qword [rdi+point.x]
    mov r8, rax ; save for later
    mov r9, qword [rdi+point.y]
    sub rax, r9
    mov qword [_2d_to_iso_point+point.x], rax

    mov rax, r8
    add rax, r9
    shr rax, 1
    mov qword [_2d_to_iso_point+point.y], rax

    mov rax, _2d_to_iso_point
    ret

_2d_to_iso_point: istruc point
    at point.x,     dq      0
    at point.y,     dq      0
iend
