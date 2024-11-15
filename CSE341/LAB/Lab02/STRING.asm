.model small
.stack 100h

.data
    prompt db "Please insert a character: $"

.code
main:
    mov ax, @data          ; Initialize data segment
    mov ds, ax

    ; Display prompt message  
    
    mov ah, 9              ; DOS function to display string
    lea dx, prompt         ; Load address of prompt string
    int 21h                ; Interrupt 21h to print the string

    ; Take input character
    mov ah, 1              ; DOS function to input a single character
    int 21h                ; Interrupt 21h to get character input
    mov dl, al             ; Move the input character to DL

    ; Display the input character
    mov ah, 2              ; DOS function to output a character
    int 21h                ; Interrupt 21h to display character

    ; Exit program
    mov ah, 4Ch            ; DOS function to exit program
    int 21h    
    
end main
