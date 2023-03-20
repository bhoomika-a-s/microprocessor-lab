data segment
	str1 db 20 dup("$")
	msg1 db 10,13,"Enter the string: $"
	msg2 db 10,13,"Enter the character: $"
	msg3 db 10,13,"Enter the character to replace: $"
	lb db 10,13,"$"
data ends
code segment
	assume cs:code,ds:data
	start:
	mov dx,data
	mov ds,dx

	lea dx,msg1
	mov ah,09h
	int 21h

	lea si,str1
	repeat1:mov ah,01h
	int 21h
	cmp al,13
	je skip
	mov [si],al
	inc si
	jmp repeat1

	skip:lea dx,msg2
	mov ah,09h
	int 21h
	mov ah,01h
	int 21h
	mov ch,al	
	
	lea dx,msg3
	mov ah,09h
	int 21h
	mov ah,01h
	int 21h
	mov cl,al
	
	mov dl,'$'
	lea si,str1
	repeat2:cmp [si],dl
	jz exit
	cmp [si],ch
	jz change
	inc si
	jmp repeat2
	change:mov [si],cl
	inc si
	jmp repeat2
	
	exit:lea dx,lb
	mov ah,09h
	int 21h
	lea dx,str1
	mov ah,09h
	int 21h

	mov ah,4ch
	int 21h

code ends
end start
