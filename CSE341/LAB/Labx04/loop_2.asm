
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here 

startloop:

mov ah, 1
int 21h

cmp al, 30h 

je end

mov ah, 3
mov dl, al
int 21h

jmp startloop

end:

ret




