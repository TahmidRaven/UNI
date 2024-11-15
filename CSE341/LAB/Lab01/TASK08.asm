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

; BYTE DIVISION

MOV AX, 0234h
MOV BL, 0Ah
             
DIV BL  


; 16 BIT

 
;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
