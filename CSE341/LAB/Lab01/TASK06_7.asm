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


; BYTE MULTIPLICATION

; MOV AL, 2h
; MOV BH, 3h

; MUL BH     

MOV AX 3200h
MOV BX 0004h

MUL BX
 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
