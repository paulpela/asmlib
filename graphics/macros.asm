%ifnmacro copy_point
    %macro copy_point 2
        push rax 

        mov rax, qword [%1+point.x]
        mov qword [%2+point.x], rax
        mov rax, [%1+point.y]
        mov qword [%2+point.y], rax

        pop rax
    %endmacro
%endif
