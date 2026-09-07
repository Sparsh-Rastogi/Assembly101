ORG 100H
MOV DI, 4000H    ; Set base RAM memory address in DI
MOV CX, 0008H    ; Set loop counter to 8 for the eight numbers[cite: 1]
MOV BX, 0001H    ; BX acts as the current number to multiply (1, 2, 3...)
MOV AX, 0001H    ; AX holds the running factorial result

L2: MUL BX       ; AX = AX * BX
MOV [DI], AX     ; Store the computed 2-byte factorial value in RAM[cite: 1]

INC BX           ; Increment BX to the next number
ADD DI, 02H      ; Advance memory pointer by 2 bytes for the next result[cite: 1]
LOOP L2          ; Decrement CX and repeat for all 8 numbers[cite: 1]
RET