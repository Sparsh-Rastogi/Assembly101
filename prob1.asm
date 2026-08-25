include 'emu8086.inc'

.model small
.stack 100h

.data
    ; Reserve two consecutive words (4 bytes) of memory for our answers
    results dw ?, ? 

.code
main proc
    ; 1. Initialize the Data Segment 
    mov ax, @data
    mov ds, ax

    ; 2. Setup numbers and Destination Index (DI)
    mov al, 18h       
    mov bl, 0ch       
    lea di, results   ; Point DI to our safe 'results' memory

    ; --- 3. MULTIPLICATION ---
    mul bl            
    mov [di], ax      ; Store result in memory

    PRINT 'Multiplication Result (8 * 2): '
    CALL print_num    ; Prints whatever is in AX
    PRINTN ''

    ; --- 4. DIVISION ---
    mov ax, 0018h     ; Reload the first number into AX
    div bl            
    mov [di+2], ax    ; Store result in the next consecutive memory location[cite: 1]

    PRINT 'Division Result (8 / 2): '
    CALL print_num    
    PRINTN ''

    ; 5. Safely exit
    mov ah, 4Ch
    int 21h
main endp

; Define the magic printing functions at the end of the code segment
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
end main