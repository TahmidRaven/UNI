.MODEL SMALL
 
.STACK 100H

.DATA
a db 1,2,3,4,5
b db 5 dup(?)
.CODE
MAIN PROC

;iniitialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

mov ax, 11h

cmp ax, 10h
JL jump_less

mov bl,44h
mov ah,2h
int 21h
jmp e


jump_less:
mov BL,41h
mov ah,2h
int 21h

e:

 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
