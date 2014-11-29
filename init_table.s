    AREA asm_func, CODE, READONLY
    EXPORT init_table
init_table
    MOV R1, #0
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x6
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x11
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x15
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x9
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x2
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x14
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0xB
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x10
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x4
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x1E
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0xD
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3,#0x12
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x7
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x5
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0xF
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x16
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x1B
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0xA
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x8
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x3
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0xC
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x18
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0xE
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x19
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x1D
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x13
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x3E
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x3C
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x38
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x30
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x20
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x21
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x23
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x27
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x2F
    STR R3, [R2]
    
    ADD R1, R1, #1
    ADD R2, R0, R1, LSL#2
    MOV R3, #0x3F
    STR R3, [R2]
   
    BX  LR
    END