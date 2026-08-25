; =======================================================
; TEMPLATE FOR EC-373 PROBLEM SET-1
; =======================================================

include 'emu8086.inc'   ; Import the magic printing/input library

.model small            ; Use the standard small memory model (1 data segment, 1 code segment)
.stack 100h             ; Reserve 256 bytes for the Stack

; =======================================================
.data
    ; ---> DEFINE YOUR VARIABLES AND ARRAYS HERE <---
    ; Example: my_number dw 5
    ; Example: my_array  dw 10 dup(?)
    

; =======================================================
.code
main proc
    ; 1. Initialize the Data Segment (Mandatory for EXE files)
    mov ax, @data
    mov ds, ax

    ; ---> YOUR ASSEMBLY INSTRUCTIONS GO HERE <---
    
    PRINT 'Template is working!'
    PRINTN ''
    
    
    ; ---> YOUR ASSEMBLY INSTRUCTIONS END HERE <---

    ; 2. Safely exit the program and return control to DOS
    mov ah, 4Ch
    int 21h
main endp

; =======================================================
; DEFINE EMU8086 MAGIC FUNCTIONS HERE
; (You only need to define the ones you actually used in your code)
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_SCAN_NUM         ; Useful if you need to read numbers from the keyboard
; =======================================================

end main                ; End of the entire file