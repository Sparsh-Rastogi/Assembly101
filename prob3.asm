include 'emu8086.inc'

.model small
.stack 100h

.data
    ; Reserve 20 consecutive words (40 bytes) of memory for the 20 terms[cite: 1]
    fibo_array dw 20 dup(?) 

.code
main proc
    ; 1. Initialize the Data Segment
    mov ax, @data
    mov ds, ax

    ; 2. Setup our array pointer
    lea di, fibo_array  

    PRINT 'Fibonacci Series (First 20 terms): '
    PRINTN ''

    ; --- 3. FIRST TERM (0) ---
    mov ax, 0000h       ; AX is Term 1 (n-2)
    mov [di], ax        ; Store 0 in memory[cite: 1]
    add di, 2           ; Move memory pointer forward by 2 bytes

    CALL print_num      ; Print Term 1 (Since it is already in AX, we just print it!)
    PRINT '  '          ; Print a space for formatting

    ; --- 4. SECOND TERM (1) ---
    mov bx, 0001h       ; BX is Term 2 (n-1)
    mov [di], bx        ; Store 1 in memory[cite: 1]
    add di, 2           ; Move pointer forward

    push ax             ; SECRET TRICK: Save Term 1 to the stack
    mov ax, bx          ; Move Term 2 into AX so we can print it
    CALL print_num      ; Print Term 2
    PRINT '  '
    pop ax              ; Retrieve Term 1 back into AX

    ; --- 5. THE LOOP (Remaining 18 terms) ---
    mov cx, 18          ; Set our loop counter to 18[cite: 1]

generate_next:
    ; Calculate the next term: DX = AX + BX
    mov dx, ax          
    add dx, bx          
    mov [di], dx        ; Store newly calculated term in memory[cite: 1]
    add di, 2           

    ; Print the new term
    push ax             ; Save Term 1 to the stack again
    mov ax, dx          ; Move our new term into AX for printing
    CALL print_num
    PRINT '  '
    pop ax              ; Restore Term 1

    ; Shift our numbers forward for the next round
    mov ax, bx          ; Term 2 becomes the new Term 1
    mov bx, dx          ; The new term becomes the new Term 2

    loop generate_next  ; Automatically subtracts 1 from CX and loops!

    ; 6. Safely Exit
    mov ah, 4Ch
    int 21h
main endp

; Define the magic printing functions at the bottom
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
end main