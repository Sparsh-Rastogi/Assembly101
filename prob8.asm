ORG 100H
MOV BX, 1000H    ; Set base memory address to 1000H[cite: 1]
MOV BYTE PTR [BX], 07H  ; Store a sample 8-bit number in RAM[cite: 1]

MOV AL, [BX]     ; Load the number from memory
TEST AL, 01H     ; Test the Least Significant Bit (LSB)
JZ IS_EVEN       ; If LSB is 0, jump to IS_EVEN

; If LSB is 1 (Odd Number)
MOV CX, 0000H    ; Indicate odd by loading 0000 H in CX-register[cite: 1]
JMP END_PROG     ; Jump to the end to skip the even logic

IS_EVEN: 
MOV CX, 0FFFFH   ; Indicate even by loading FFFF H in CX-register[cite: 1]

END_PROG: 
RET