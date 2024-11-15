
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

 ; Task 11 : (1 + 2) * (3 - 1) / 5 + 3 + 2 - (1 * 2) 
    
    mov al, 1
    mov bl, 2
    add al, bl
    
    mov cl, 3
    mov dl, 1
    sub cl, dl
    
    mov bl, cl
    mul bl
    
    mov bl, 5
    div bl
    
    mov bl, 3
    add al, bl
    
    mov bl, 2
    add al, bl
    
    mov cl, al
    
    mov al, 1
    mov bl, 2
    mul bl
    
    mov dx, ax
    mov ax, cx
    mov bx, dx
    sub ax, bx

ret




