
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov cx, 5
read_char:
mov ah, 01h
int 21h

mov ah,2
mov dl,08h
int 21h
mov dl, 2ah
int 21h

LOOP read_char

ret




