assume ds:data,cs:code

data segment
msg1 db 10,13,"Enter the first number: $"
msg2 db 10,13,"Enter the second number: $"
msg3 db 10,13,"The sum is: $"
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
      mov bh,al
      mov ah,01h
      int 21h
      mov bl,al

	mov ah,09h
	lea dx,msg2
	int 21h

	mov ah,01h
	int 21h
      mov ch,al
      mov ah,01h
      int 21h
      mov cl,al
	
	MOV AL,BL
	MOV AH,00
	ADD AL,CL
	AAA 
	ADD AX,3030H

	MOV BL,AL 
	MOV AL,AH 
	MOV AH,00 
	ADD AL,BH 
	ADD AL,CH 
	AAA
	ADD AX,3030H 
	MOV BH,AL  
	MOV CL,AH 

	MOV AH,09H
	LEA DX,MSG3
	INT 21H

	MOV AH,02H
	MOV DL,CL
	INT 21h

	MOV AH,02H
	MOV DL,BH
	INT 21h

	MOV AH,02H
	MOV DL,BL
	INT 21h	
	
	mov ah,4ch
	int 21h
code ends
end start
