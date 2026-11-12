ORG 100h
MOV BX, 03h   ;Value of X
MOV BP, 1000h ;Factorial
MOV SP, 2000h ;Power Tower
MOV DI, 3000h ;Counter  
MOV [4000h], 01h ;Final Answer 
MOV DX, 01h
MOV [BP], DX
MOV [SI], DX
MOV [DI], DX

MOV CX,05h  

L1: MOV AX, [BP]
    MUL [DI]
    ADD BP, 02h
    MOV [BP], AX
    MOV DX, [DI]
    ADD DI, 02h
    MOV [DI], DX
    INC [DI]   
    MOV AX, [SI]
    MUL BX
    ADD SI, 02h
    MOV [SI], AX
    MOV AX, [SI]
    DIV [BP]
    ADD [4000h], AX
LOOP L1

    
    
    
