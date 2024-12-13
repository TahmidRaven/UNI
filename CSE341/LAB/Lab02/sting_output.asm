.MODEL SMALL
 
.STACK 100H

.DATA
a db 1,2,3,4,5
b db 5 dup(?)   
newline db 0DH,0AH,'$'  ; Newline characters for output
prompt db 'Enter a character: $'
output_msg db 'You entered: $'
char db ?               ; Placeholder for input character 

msgx db 'Enter a string: $'
output_msgx db 'You entered: $'
stringx db ?

.CODE
MAIN PROC

; Initialize DS
MOV AX, @DATA
MOV DS, AX
 
; Display prompt
MOV AH, 09H            ; DOS function to display string
LEA DX, prompt         ; Load address of the prompt
INT 21H

; Take character input
MOV AH, 01H            ; DOS function to take a single character input
INT 21H
MOV char, AL           ; Store the entered character

; Display newline
MOV AH, 09H            ; DOS function to display string
LEA DX, newline        ; Load address of newline characters
INT 21H

; Display output message
MOV AH, 09H            ; DOS function to display string
LEA DX, output_msg     ; Load address of the output message
INT 21H

; Display entered character
MOV AH, 02H            ; DOS function to display a single character
MOV DL, char           ; Load the entered character into DL
INT 21H

; Display another newline
MOV AH, 09H            ; DOS function to display string
LEA DX, newline        ; Load address of newline characters
INT 21H    


MOV AH, 02H
INT 21H
MOV stringx, AL
; Display newline
MOV AH, 09H            ; DOS function to display string
LEA DX, newline        ; Load address of newline characters
INT 21H  
; Display output message
MOV AH, 09H            ; DOS function to display string
LEA DX, output_msg     ; Load address of the output message
INT 21H   
; Display entered character
MOV AH, 02H            ; DOS function to display a single character
MOV DL, stringx           ; Load the entered character into DL
INT 21H


 

; Exit to DOS
MOV AX, 4C00H
INT 21H

MAIN ENDP
END MAIN
