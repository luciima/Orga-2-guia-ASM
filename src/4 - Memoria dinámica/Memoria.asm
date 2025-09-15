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
	ret

; void strDelete(char* a)
strDelete:
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


