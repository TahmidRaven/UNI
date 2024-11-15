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



; ADD AX, 1h

; NEG AX     

;  INC AX

; DEC AX



MOV AX, 4h

MOV BX, 1H

INC BX

ADD AX, BX

MOV CX, AX
 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
