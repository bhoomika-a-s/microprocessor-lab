data segment
	str1 db 40("$")
	str2 db 20("$")
	msg1 db 10,13,"Enter the first string:$"
	msg2 db 10,13,"Enter the second string:$"
	msg3 db 10,13,"The concatenated string is:$"
data ends
code segment
	assume cs:code,ds:data
	start:
	mov ax,data
	mov ds,ax
	
	lea dx,msg1
	mov ah,09h
	int 21h

	lea si,str1
	repeat1:mov ah,01h
	int 21h
	cmp al,13
	jz skip1
	mov[si],al
	inc si
	jmp repeat1
	
	skip1:lea dx,msg2
	mov ah,09h
	int 21h
	
	lea si,str2
	repeat2:mov ah,01h
	int 21h
	cmp al,13
	je skip2
	mov [si],al
	inc si
	jmp repeat2

	skip2:lea si,str1
	lea di,str2
	mov al,'$'

	up:cmp al,[si]
	jz loop1
	inc si
	jmp up

	loop1:cmp al,[di]
	jz exit
	mov bl,[di]
	mov [si],bl
	inc si
	inc di
	jmp loop1

	exit:lea dx,msg3
	mov ah,09h
	int 21h
	mov [di],al
	lea dx,str1
	mov ah,09h
	int 21h

	mov ah,4ch
	int 21h
code ends
end start
	