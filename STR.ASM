assume ds:data,cs:code

data segment
msg1 db 10,13,"Enter the string:$"
msg2 db 10,13,"Length:$"
str db 20 dup("$")
len db ?
data ends

code segment
start:
        mov ax,data
        mov ds,ax

        mov ah,09h
        lea dx,msg1
        int 21h

        mov si,0

        loops:
                mov ah,01h
                int 21h
                cmp al,13
                je skip
                mov str[si],al
                inc si
			inc len
                jmp loops
         skip:
                mov str[si],"$"

         mov ah,09h
         lea dx,str
         int 21h
	   
	    add len,"0"

	    mov dl,len
	    mov ah,02h
	    int 21h

        mov ah,4ch
        int 21h
 code ends
 end start
