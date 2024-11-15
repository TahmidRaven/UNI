.model small
.stack 100h
.data

x db 12h
c dw "Enter a hex digit: $"
m dw "In decimal it is :1$"
.code
Main proc
    mov ax, @data
    mov ds, ax
    
    LEA dx, c
    MOV ah , 9
    int 21h
    MOV ah, 1
    int 21h
    mov bl, al
    
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h  
    
    LEA dx, m
    mov ah, 9
    int 21h
    
    mov ah, 2
    sub bl, 11h
    mov dl, bl
    int 21h 
    
    
MOV ax, 4C00h
int 21h
main endp
    end main