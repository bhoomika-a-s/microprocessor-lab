assume ds:data,cs:code

data segment
msg1 db 10,13,"Enter the first number: $"
msg2 db 10,13,"Enter the second number: $"
msg3 db 10,13,"The product is: $"
data ends

code segment
start:
        mov ax,data
        mov ds,ax

        mov ah,09h
        lea dx,msg1
        int 21h
        mov ah,01h
        int 21h
        sub al,"0"
        mov bh,al

        mov ah,09h
        lea dx,msg2
        int 21h
        mov ah,01h
        int 21h
        sub al,"0"
        mov bl,al

        mul bh
        mov ah,0h
        aam

        add al,"0"
        add ah,"0"
        mov bx,ax

        mov ah,09h
        lea dx,msg3
        int 21h
        mov ah,02h
        mov dl,bh
        int 21h
        mov ah,02h
        mov dl,bl
        int 21h

        mov ah,4ch
        int 21h
 code ends
 end start