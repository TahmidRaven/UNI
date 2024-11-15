; 8A
 
MOV AX, 236Dh       
MOV BX, 0AFh        

 
MUL BX             ; AX = 236D * AF, result in DX:AX

 
MOV CX, DX          
MOV DX, AX         ; Store AX (lower part of result) in DX

; Step 2: Multiply the lower part (F) by AF
MOV AX, 0Fh        ; Low part of 236DF
MUL BX             ; AX = F * AF, result in DX:AX

; Step 3: Add the two results together
ADD AX, DX         ; Add lower result to previous high result
ADC CX, 0          ; Add carry to CX if any

; Result is in CX:AX
                                
                                
;8B                                
                                
; Step 1: Set up the dividend (8A32F4D5)
MOV DX, 08A32h      ; Load high 16 bits of 8A32F4D5 into DX
MOV AX, 0F4D5h      ; Load low 16 bits of 8A32F4D5 into AX

; Step 2: Set up the divisor (C9A5)
MOV BX, 0C9A5h      ; Load divisor C9A5 into BX

; Step 3: Perform the division
DIV BX             ; Divide DX:AX by BX
                   ; Quotient will be in AX, Remainder in DX
