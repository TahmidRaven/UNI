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


; 16 BIT   WORD DIVISION

MOV DX, 0002h   ; Load DX with the high 16 bits of the dividend (2 in decimal)
MOV AX, 1234h   ; Load AX with the low 16 bits of the dividend (4660 in decimal)
MOV BX, 0003h   ; Load BX with the 16-bit divisor (3 in decimal)
DIV BX          ; Divide DX:AX by BX


 
;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
