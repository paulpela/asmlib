; rdi: sides of the dice
roll_single_die:
    push rdi
    push rsi

    mov rsi, rdi
    inc rsi
    mov edi, 1

    call rand_min_max

    pop rsi
    pop rdi
    ret


; rdi - # of dice to roll
; rsi - # of dice sides
; rdx - modifier
roll_rpg_dice:
    push rdi
    push rsi
    push rdx
    push r8

    xor r8, r8 ; stores the sum

    mov rcx, rdi
    mov rdi, rsi
.roll:
    call roll_single_die
    add r8, rax
    loop .roll

    add r8, rdx ; add the modifier

    mov rax, r8

    pop r8
    pop rdx
    pop rsi
    pop rdi
    ret
