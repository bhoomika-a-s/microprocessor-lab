assume ds:data,cs:code
data segment
        msg1 db 10,13,"size:$"
        msg2 db 10,13,"enter elemets:$"
        msg3 db 10,13,"ENter elemet to search:$"
        msg4 db 10,13,"elemets are:$"
        msg5 db 10,13,"found$"
        msg6 db 10,13,"not found$"
        n db ?
	   arr db 80 dup(?)
 data ends
 code segment
 start:
        mov ax,data
        mov ds,ax

        lea dx,msg1
        mov ah,09h
        int 21h
        mov ah,01h
        int 21h
        sub al,"0"
        mov n,al
        mov cl,n
        mov si,offset arr

       repeat: lea dx,msg2
        mov ah,09h
        int 21h

        mov ah,01h
        int 21h
        sub al,"0"
        mov [si],al
        inc si
        dec cl
        jnz repeat

        mov cl,n
        lea dx,msg3
        mov ah,09h
        int 21h
        mov si,offset arr
        rept2:mov al,[si]
        add al,"0"
        mov dl,al
        mov ah,02h
        int 21h
        inc si
        dec cl
        jnz rept2

        lea dx,msg4
        mov ah,09h
        int 21h

        mov ah,01h
        int 21h
        sub al,"0"
        mov bl,al

        mov ch,n
        mov si,offset arr
        search:mov al,[si]
        cmp al,bl
        je skip
        inc si
        dec ch
        jnz search
        lea dx,msg6
        mov ah,09h
        int 21h
        jmp exit
        skip:lea dx,msg5
        mov ah,09h
        int 21h

        exit:mov ah,4ch
        int 21h
code ends
end start
