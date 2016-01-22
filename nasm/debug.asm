%macro debug 1
    %ifdef DEBUG
            call %1
    %endif
%endmacro
