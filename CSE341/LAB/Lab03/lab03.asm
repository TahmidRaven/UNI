
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

JMP my_line ; will go to my_line skipping everything in between

JE ; jump if destination and source are equal

JG ; jump if dest > source

JL ; jump if dest < source

JGE
JLE

ret




