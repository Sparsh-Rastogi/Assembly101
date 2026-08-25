include 'emu8086.inc'

.model small
.stack 100h

.data
    ; No variables needed for this problem

.code
main proc
    ; 1. Initialize the Data Segment 
    mov ax, @data
    mov ds, ax

    ; 2. Setup Hexadecimal Numbers
    mov ax, 00A5h   ; First hex number (165 in decimal)
    mov bx, 0020h   ; Second hex number (32 in decimal)

    ; --- 3. ADDITION ---
    add ax, bx      
    mov cx, ax      ; Store addition result in CX register[cite: 1]

    PRINT 'Addition Result (A5h + 20h) in decimal: '
    CALL print_num  ; AX still holds the result, so we can print directly!
    PRINTN ''

    ; --- 4. SUBTRACTION ---
    mov ax, 00A5h   ; Reload original first number
    sub ax, bx      
    mov dx, ax      ; Store subtraction result in DX register[cite: 1]

    PRINT 'Subtraction Result (A5h - 20h) in decimal: '
    mov ax, dx      ; We must move DX into AX so the print function can see it
    CALL print_num  
    PRINTN ''

    ; 5. Safely exit
    mov ah, 4Ch
    int 21h
main endp

; Define the magic printing functions
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
end main