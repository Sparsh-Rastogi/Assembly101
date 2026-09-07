ORG 100H
MOV DI, 2000H    ; Base memory address for array

; Feed temperatures using Immediate-addressing-mode[cite: 1]
MOV BYTE PTR [DI], 20    ; Jan-23[cite: 1]
MOV BYTE PTR [DI+1], 32  ; Jan-31[cite: 1]
MOV BYTE PTR [DI+2], 34  ; Mar-12[cite: 1]
MOV BYTE PTR [DI+3], 38  ; Apr-22[cite: 1]
MOV BYTE PTR [DI+4], 42  ; May-24[cite: 1]
MOV BYTE PTR [DI+5], 45  ; May-31[cite: 1]
MOV BYTE PTR [DI+6], 36  ; Jul-24[cite: 1]
MOV BYTE PTR [DI+7], 33  ; Aug-24[cite: 1]
MOV BYTE PTR [DI+8], 27  ; Oct-13[cite: 1]
MOV BYTE PTR [DI+9], 23  ; Dec-13[cite: 1]

; Find Maximum Temperature
MOV SI, 2000H    ; Point SI to the start of the array
MOV CX, 0009H    ; 9 comparisons needed for 10 items
MOV AL, [SI]     ; Assume first item is the maximum initially

FIND_MAX: 
INC SI           ; Move to next memory location
CMP AL, [SI]     ; Compare current max with next item
JGE SKIP         ; If AL is Greater or Equal, jump over the replacement
MOV AL, [SI]     ; Otherwise, replace AL with the new higher value
SKIP: 
LOOP FIND_MAX    ; Repeat until all items are checked

; The maximum temperature (45) is now stored in the AL register!
RET