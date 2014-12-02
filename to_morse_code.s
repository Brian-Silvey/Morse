    AREA asm_func, CODE, READONLY
    EXPORT to_morse_code
to_morse_code       ; return location in array corresponding to char
    CMP R0, #57     ; compare char to ascii value 57 (9)
    BGT next0       ; if letter, goto next0
    SUB R0, R0, #23 ; if number, subtract 23 and return
    B   next1       ; goto next1
next0
    SUB R0, R0, #97 ; subtract 97 and return
next1
    BX  LR          ; branch and change instruction set
    END