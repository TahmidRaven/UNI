 .model small
.stack 100h
.data
    a dd 21201701h 
    b  dw 0FFFFh   
    q dw ?         
    r dw ?        

.code
main proc
    mov ax, @data         
    mov ds, ax

;   
;    mov dx, 2120h        
;    mov ax, 1701h  

    mov dx, 0143h
    mov ax, 8325h      
;
    mov bx, [b]    
    div bx             

    mov [q], ax   
    mov [r], dx  

 
    mov ah, 4Ch         
    int 21h
main endp
end main
