
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here 

mov ah, 2
mov cx, 5 

mov dl, 30h

startloop:

    int 21h
    inc dl
    loop startloop

ret




