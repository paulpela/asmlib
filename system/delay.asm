%define ASMLIB_DELAY

delay:
    push rcx
    mov rcx, 0x0000_0000_0fff_ffff
.first_loop:
;    push rcx
;    mov rcx, 0xffff_ffff
;.second_loop:
;    nop
;    loop .second_loop
;
;    pop rcx
    loop .first_loop

    pop rcx
    ret

