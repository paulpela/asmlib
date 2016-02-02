IDTR64:					; Interrupt Descriptor Table Register
	dw 256*16-1			; limit of IDT (size minus one) (4096 bytes - 1)
	dq 0x0000000000000000		; linear address of IDTIDTR64: dq 0

reload_idt:
    cli
    lidt [IDTR64]
    sti
    ret
