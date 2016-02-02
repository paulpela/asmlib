; code taken from: https://github.com/ReturnInfinity/Pure64/blob/master/src/syscalls.asm
; rax = address of handler
; rdi = gate # to configure
create_gate:
    push rdi
    push rax

    shl rdi, 4          ; quickly multiply rdi by 16
    stosw               ; store the low word (15..0)
    shr rax, 16
    add rdi, 4          ; skip the gate marker
    stosw               ; store the high word (31..16)
    shr rax, 16
    stosd               ; store the high dword (63..32)

    pop rax
    pop rdi
    ret
