rnd_a: dq 0xd871f402
rnd_b: dq 0x130b7dcb
rnd_c: dq 0x10a813a1
rnd_d: dq 0x89ec00cd

gen_rnd:
    push rax
    push rbx
    push rcx
    push rdx

    rdtsc
    add rax, rdx
    mov rdx, rax
    mov rax, [rnd_a]
    add rax, rdx
    mov rbx, 1103515245
    add rax, rbx
    xor rdx, rdx
    mul rbx
    mov rbx, 65536
    xor rdx, rdx
    div rbx
    mov rcx, [rnd_b]
    ror rcx, 7
    add rax, rcx

    mov qword [rnd_a], rax
    mov qword [rnd_b], rcx

    pop rdx
    pop rcx
    pop rbx
    pop rax
    ret
    

;gen_rnd_old:
;    push rax
;    push rbx
;    push rcx
;    push rdx
;
;    mov rax, qword [rnd_a]
;    mov rbx, qword [rnd_b]
;    mov rcx, qword [rnd_c]
;    mov rdx, qword [rnd_d]
;    
;    ror rcx, 17
;    add rdx, rcx
;    inc rdx
;    xor rdx, rbx
;    shr rbx, 2
;    dec rdx
;    rol rax, 9
;    add rdx, rax
;    rol rbx, 11
;
;    mov qword [rnd_a], rdx
;    mov qword [rnd_b], rax
;    mov qword [rnd_c], rcx
;    mov qword [rnd_d], rbx
;
;    pop rdx
;    pop rcx
;    pop rbx
;    pop rax
;    ret
