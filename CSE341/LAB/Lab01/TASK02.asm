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


MOV AX, 23h

MOV BX, 69h

MOV CX, AX

MOV AX, BX

MOV BX, CX



 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
