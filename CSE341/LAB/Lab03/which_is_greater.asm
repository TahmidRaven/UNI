.MODEL SMALL
 
.STACK 100H

.DATA
 
str1 db "enter a:$"
str2 db "enter b:$"
str3 db "tehy are eqqual bruh$"
str4 db "a is greater bro$"   
str5 db "b is greater bro$"

.CODE
MAIN PROC

;iniitialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
;;  


;;input a

lea dx, str1
mov ah,9
int 21h


mov ah, 1
int 21h  
mov bl, al

mov ah, 2
mov dl, 0Ah
int 21h
mov dl, 0Dh
int 21h


;;input b

lea dx, str2
mov ah,9
int 21h


mov ah, 1
int 21h  
mov cl, al

mov ah, 2
mov dl, 0Ah
int 21h
mov dl, 0Dh
int 21h


cmp bl, cl
JE equal 
JG Agreat
  
; b is grater
mov ah, 2
mov dl, 0Ah
int 21h
mov dl, 0Dh
int 21h

lea dx, str5
mov ah,9
int 21h  
jmp exit

equal:
mov ah, 2
mov dl, 0Ah
int 21h
mov dl, 0Dh
int 21h

lea dx, str3
mov ah,9
int 21h  
jmp exit
           

Agreat:

mov ah, 2
mov dl, 0Ah
int 21h
mov dl, 0Dh
int 21h

lea dx, str4
mov ah,9
int 21h  
jmp exit



;;mov ah, 1
;;int 21h 
;
;LEA dx, string
;
;mov ah, 9
;int 21h 
;        
;mov ah, 2
;mov dl, 0Dh  
;int 21h
;mov dl, 0Ah 
;
;int 21h
;       
;
;LEA dx, lekha       
;mov ah, 9
;int 21h

;exit to DOS 

exit:
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
