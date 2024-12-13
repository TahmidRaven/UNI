.MODEL SMALL
 
.STACK 100H

.DATA
msg1 db "Please insert a character: $"
msg2 db "Enter two numbers for arithmetic operations:$"
msg3 db "Enter uppercase letter: $"
msg4 db "Enter first, middle, and last initials: $"
msg5 db "Enter a hex digit: $"
msg6 db "In decimal it is: $"
msg7 db "The sum of two digits is: $"
box db "**********$"
newline db 0DH,0AH,'$'
endmsg db "$"

.CODE
MAIN PROC

; Initialize DS
MOV AX,@DATA
MOV DS,AX

; Task 1: Take a character input and display it.
LEA DX, msg1
MOV AH, 9
INT 21H           ; Display "Please insert a character:"
MOV AH, 1
INT 21H           ; Read a character
MOV DL, AL        ; Save input to DL
MOV AH, 2
INT 21H           ; Display the character
MOV AH, 9
LEA DX, newline
INT 21H           ; Newline

; Task 2: Perform arithmetic operations.
LEA DX, msg2
MOV AH, 9
INT 21H           ; Display message
MOV AH, 1
INT 21H           ; Read first digit
SUB AL, '0'       ; Convert ASCII to numeric
MOV BL, AL        ; Save input to BL

MOV AH, 1
INT 21H           ; Read second digit
SUB AL, '0'       ; Convert ASCII to numeric
MOV BH, AL        ; Save input to BH

; Perform addition
MOV AL, BL
ADD AL, BH        ; Add two numbers
ADD AL, '0'       ; Convert numeric to ASCII
MOV DL, AL
MOV AH, 2
INT 21H           ; Display result

; Task 3a: Read a character and display it on the same line.
MOV AH, 1
INT 21H           ; Read a character
MOV DL, AL
MOV AH, 2
INT 21H           ; Display the same character

; Task 3b: Convert uppercase to lowercase and display.
MOV AL, DL
ADD AL, 32        ; Convert to lowercase
MOV DL, AL
MOV AH, 2
INT 21H           ; Display the lowercase character

; Task 4: Uppercase to lowercase on the next line.
MOV AH, 9
LEA DX, newline
INT 21H           ; Newline
MOV AL, DL
SUB AL, 32        ; Convert to uppercase
MOV DL, AL
MOV AH, 2
INT 21H           ; Display lowercase on next line

; Task 5: Display '?', read two digits, and sum.
MOV DL, '?'
MOV AH, 2
INT 21H           ; Display '?'

MOV AH, 1
INT 21H           ; Read first digit
SUB AL, '0'       ; Convert ASCII to numeric
MOV BL, AL

MOV AH, 1
INT 21H           ; Read second digit
SUB AL, '0'       ; Convert ASCII to numeric
ADD AL, BL        ; Calculate sum
ADD AL, '0'       ; Convert result to ASCII
MOV DL, AL
MOV AH, 2
INT 21H           ; Display sum

; Task 6: Read initials and display them vertically.
LEA DX, msg4
MOV AH, 9
INT 21H           ; Display message

MOV AH, 1
INT 21H           ; Read first initial
MOV DL, AL
MOV AH, 2
INT 21H           ; Display initial
LEA DX, newline
MOV AH, 9
INT 21H           ; Newline

MOV AH, 1
INT 21H           ; Read second initial
MOV DL, AL
MOV AH, 2
INT 21H           ; Display initial
LEA DX, newline
MOV AH, 9
INT 21H           ; Newline

MOV AH, 1
INT 21H           ; Read third initial
MOV DL, AL
MOV AH, 2
INT 21H           ; Display initial
LEA DX, newline
MOV AH, 9
INT 21H           ; Newline

; Task 7: Convert hex digit to decimal.
LEA DX, msg5
MOV AH, 9
INT 21H           ; Display message
MOV AH, 1
INT 21H           ; Read hex digit
SUB AL, '0'       ; Convert ASCII to numeric
MOV DL, AL
MOV AH, 2
INT 21H           ; Display decimal equivalent

; Task 8: Display a 10x10 box of asterisks.
MOV CX, 10        ; 10 rows
DISPLAY_BOX:
LEA DX, box
MOV AH, 9
INT 21H           ; Display line of asterisks
LEA DX, newline
MOV AH, 9
INT 21H           ; Newline
LOOP DISPLAY_BOX  ; Loop 10 times

; Exit to DOS
MOV AX, 4C00H
INT 21H

MAIN ENDP
END MAIN
