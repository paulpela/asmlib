%ifnmacro copy_point
    %macro copy_point 2
        push rax 

        mov ax, word [%1+point.x]
        mov word [%2+point.x], ax
        mov ax, [%1+point.y]
        mov word [%2+point.y], ax

        pop rax
    %endmacro
%endif
