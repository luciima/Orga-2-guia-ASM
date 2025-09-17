extern malloc
extern free
extern fprintf

section .data

section .text

global strCmp
global strClone
global strDelete
global strPrint
global strLen

; ** String **

; int32_t strCmp(char* a, char* b)
strCmp:
	; RDI char* a, RSI char* b
	push RBP
	mov RBP, RSP

	xor RAX, RAX
	mov R8, 0

	.ciclo:
	mov DL, byte [RDI+R8]
	mov CL, byte [RSI+R8]
	cmp DL, CL
	ja .mayorA
	jb .mayorB
	add R8, 1 
	cmp DL, 0
	je .iguales
	jmp .ciclo

	.mayorA:
	mov EAX, -1
	jmp .fin

	.mayorB:
	mov EAX, 1
	jmp .fin

	.iguales:
	mov EAX, 0
	jmp .fin

	.fin:
	pop RBP
	ret

; char* strClone(char* a)
strClone:
	push RBP
	mov RBP, RSP
	push R12
	push R13
	push R14
	push R15

	mov R12, RDI

	call strLen 

	xor RDI, RDI
	add EAX, 1
	mov EDI, EAX 
	mov R14D, EAX

	call malloc

	mov R13, RAX
	mov R15, RAX

	.loop:
	cmp R14D, 1
	je .fin
	mov AL, byte [R12]
	mov [R13], AL
	add R13, 1
	add R12, 1 
	sub R14D, 1 
	jmp .loop

	.fin:
	mov [R13], byte 0
	mov RAX, R15
	pop R15 
	pop R14
	pop R13
	pop R12
	pop RBP
	ret

; void strDelete(char* a)
strDelete:
	; RDI char* a
	push RBP
	mov RBP, RSP

	call free

	pop RBP
	ret

; void strPrint(char* a, FILE* pFile)
strPrint:
	ret

; uint32_t strLen(char* a)
strLen:
	; RDI char* a
	push RBP
	mov RBP, RSP

	xor RAX, RAX
	mov R8D, 0 ;length

	.ciclo:
	mov DL, byte [RDI+R8]
	cmp DL, 0
	je .fin
	add R8D, 1
	jmp .ciclo

	.fin:
	mov EAX, R8D
	pop RBP
	ret


