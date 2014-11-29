    AREA asm_func, CODE, READONLY
    EXPORT to_morse_code
to_morse_code
    CMP R0, #9
    BGT next9
    CMP R0, #0
    BNE next0
    MOV R0, #26
next0
    CMP R0, #1
    BNE next1
    MOV R0, #27
next1
    CMP R0, #2
    BNE next2
    MOV R0, #28
next2
    CMP R0, #3
    BNE next3
    MOV R0, #29
next3
    CMP R0, #4
    BNE next4
    MOV R0, #30
next4
    CMP R0, #5
    BNE next5
    MOV R0, #31
next5
    CMP R0, #6
    BNE next6
    MOV R0, #32
next6
    CMP R0, #7
    BNE next7
    MOV R0, #33
next7
    CMP R0, #8
    BNE next8
    MOV R0, #34
next8
    CMP R0, #9
    BNE next9
    MOV R0, #35
next9
    SUB R0, R0, #97
    BX  LR
    END