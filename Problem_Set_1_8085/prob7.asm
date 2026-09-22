; 1's complement of the Flag register using 8085 (PUSH/POP PSW = PUSHF/POPF analog)
; Step i:  Copy flags to memory at 3000H (flags byte) and 3001H (A byte)
; Step ii: 1's complement the flags byte in memory
; Step iii:Reload complemented flags back into flag register

        LXI SP, 4000H     ; Initialise stack pointer

; Step i
        PUSH PSW          ; Push A (hi) and Flags (lo) onto stack
        POP H             ; H = A, L = Flags
        MOV A, L
        STA 3000H         ; Store flags byte
        MOV A, H
        STA 3001H         ; Store A byte

; Step ii
        LDA 3000H         ; Load flags from memory
        CMA               ; 1's complement
        STA 3000H         ; Store complemented flags back

; Step iii
        LDA 3001H         ; Restore original A
        MOV H, A
        LDA 3000H         ; Load complemented flags
        MOV L, A
        PUSH H            ; Push A (hi) and complemented flags (lo)
        POP PSW           ; Reload into flag register

        HLT
