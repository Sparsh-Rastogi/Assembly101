ORG 100H
MOV BP, 3000H    ; Point BP to base memory location[cite: 1]

; Step i: Copy Flag register to memory[cite: 1]
PUSHF            ; Push the Flag register contents onto the stack[cite: 1]
POP AX           ; Pop them into AX
MOV [BP], AX     ; Store at the memory location pointed by BP[cite: 1]

; Step ii: Perform 1's complement[cite: 1]
NOT WORD PTR [BP]; Flips all 1s to 0s and 0s to 1s directly in memory[cite: 1]

; Step iii: Copy 1's complement back to Flag register[cite: 1]
MOV AX, [BP]     ; Move the complemented value back to AX
PUSH AX          ; Push it onto the stack
POPF             ; Pop the stack back into the Flag register[cite: 1]

RET