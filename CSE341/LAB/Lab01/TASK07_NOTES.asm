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

MOV AX, 0000H

MOV AL, 05h     ; Load AL with 5 (8-bit number)
MOV BL, 04h     ; Load BL with 4 (8-bit number)
MUL BL          ; Multiply AL by BL       

        ; RESULT STORED IN AX

; WORD MULTIPLICATION

MOV AX, 1234h   ; Load AX with 1234h (4660 in decimal)
MOV BX, 0020h   ; Load BX with 0020h (32 in decimal)
MUL BX          ; Multiply AX by BX

        ; RESULT SHOULD BE DX:BX

; BYTE DIVISION

MOV AX, 0234h
MOV BL, 0Ah
             
DIV BL     

        ; RESULT AL -->8bitquotient AH-->REMAINDER


; 16 BIT   WORD DIVISION

MOV DX, 0002h   ; Load DX with the high 16 bits of the dividend (2 in decimal)
MOV AX, 1234h   ; Load AX with the low 16 bits of the dividend (4660 in decimal)
MOV BX, 0003h   ; Load BX with the 16-bit divisor (3 in decimal)
DIV BX          ; Divide DX:AX by BX  

        ; RESULT AX -->Quotient DX-->REMAINDER


; X*Y/Z

 
;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
