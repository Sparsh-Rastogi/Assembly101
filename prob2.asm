ORG 100H
MOV AX, 00A5H    ; Load first hexadecimal number[cite: 1]
MOV BX, 0020H    ; Load second hexadecimal number[cite: 1]

; Addition
ADD AX, BX       ; AX = AX + BX
MOV CX, AX       ; Store addition result in CX register[cite: 1]

; Subtraction
MOV AX, 00A5H    ; Reload original first number into AX
SUB AX, BX       ; AX = AX - BX
MOV DX, AX       ; Store subtraction result in DX register[cite: 1]
RET