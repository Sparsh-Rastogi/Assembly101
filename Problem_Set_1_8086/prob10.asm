org 100h
MOV BX, OFFSET NUMS
MOV SI, 1000H
MOV CX, 05H

L1:
    MOV AX, [BX]
    MOV [SI], AX
    ADD BX, 2
    ADD SI, 2  
    
LOOP L1 

;Ascending
MOV CX, 04H
MOV DI, 2008H
L2:       
    MOV SI, 1000H
    MOV AX, CX
    L3:   
        MOV BX, [SI]
        MOV DX,[SI+2]
        CMP BX, DX 
        JA SWAP
        JBE NOSWAP
        NOSWAP:
            ADD SI, 02H
            JMP WOW
        SWAP: 
            MOV BL, [SI]
            MOV DL,[SI+2]
            MOV [SI], DL
            MOV [SI+2],BL
            ADD SI, 01h
            MOV BL, [SI]
            MOV DL, [SI+2]
            MOV [SI], DL
            MOV [SI+2], BL
            ADD SI, 01H
        WOW:
            
    LOOP L3
    MOV CX, [SI]
    MOV [DI], CX
    SUB DI, 02H
    MOV CX, AX

LOOP L2                    
MOV SI, 1000h
MOV CX, [SI]
MOV [DI],CX

;Descending
MOV CX, 04H
MOV DI, 3008H
L4:       
    MOV SI, 1000H
    MOV AX, CX
    L5:   
        MOV BX, [SI]
        MOV DX,[SI+2]
        CMP BX, DX 
        JB SWAPP
        JAE NOSWAPP
        NOSWAPP:
            ADD SI, 02H
            JMP WOWW
        SWAPP: 
            MOV BL, [SI]
            MOV DL,[SI+2]
            MOV [SI], DL
            MOV [SI+2],BL
            ADD SI, 01h
            MOV BL, [SI]
            MOV DL, [SI+2]
            MOV [SI], DL
            MOV [SI+2], BL
            ADD SI, 01H
        WOWW:
            
    LOOP L5
    MOV CX, [SI]
    MOV [DI], CX
    SUB DI, 02H
    MOV CX, AX

LOOP L4                    
MOV SI, 1000h
MOV CX, [SI]
MOV [DI],CX


NUMS DW 0F3F5H, 0FFF2H, 0104H, 0842H, 8468H

 