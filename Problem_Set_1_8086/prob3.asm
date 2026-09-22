ORG 100H
MOV DI, 3000H    ; Set base memory address in DI
MOV AX, 0000H    ; Load first term
MOV BX, 0001H    ; Load second term
MOV [DI], AX     ; Store first term at 3000H[cite: 1]
MOV [DI+2], BX   ; Store second term at 3002H[cite: 1]
ADD DI, 04H      ; Advance DI pointer by 4 bytes

MOV CX, 0012H    ; Set counter to 18 (12H) for remaining terms[cite: 1]
L1: MOV DX, AX   ; Copy first term to DX
ADD DX, BX       ; Add second term to DX to generate next term
MOV [DI], DX     ; Store the next term in consecutive memory[cite: 1]

MOV AX, BX       ; Shift second term into first term register
MOV BX, DX       ; Shift new term into second term register
ADD DI, 02H      ; Advance memory pointer by 2 bytes
LOOP L1          ; Decrement CX and repeat until 0
RET