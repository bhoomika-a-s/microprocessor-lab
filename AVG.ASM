assume ds:data,cs:code
data segment    
    msg1 db 10,13,"enter 1 number: $"
    msg2 db 10,13,"enter 2 number : $"
    msg3 db 10,13,"enter 3 number: $"
    msg4 db 10,13,"average:$ "
data ends

code segment
    assume cs:code,ds:data
    start:
            mov ax,data
            mov ds,ax

            lea dx,msg1 ;PRINT MSG1
            mov ah,09h
            int 21h
            ;INPUT 1ST NUMBER
            mov ah,01h
            int 21h
            mov bh,al

            lea dx,msg2 ;PRINT MSG2
            mov ah,09h
            int 21h
            ;INPUT 2ST NUMBER
            mov ah,01h
            int 21h
            mov bl,al

            lea dx,msg3;PRINT MSG3
            mov ah,09h
            int 21h
            ;INPUT 3RD NUMBER
            mov ah,01h
            int 21h
            mov cl,al

            mov al,bh
            add al,bl ; ADD 2 NUMBERS
            adc al,cl ; ADD WITH CARRY

            mov ah,00h


            jc carry
            mov dh,03h
            div dh
            mov ch,ah
            jmp last
     carry: mov ah,01h
            mov dx,0003h
            div dx
            mov ch,ah
     last:
            lea dx,msg4
            mov ah,09h
            int 21h
            mov dl,al
            mov ah,02h
            int 21h

code ends
end start
