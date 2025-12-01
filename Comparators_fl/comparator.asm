section .data
    n1 dd 25
    n2 dd 50

    msg1 db 'Are equal', 0xA
    len1 equ $ - msg1

    msg2 db 'Are different'
    len2 equ $ - msg2

section .text
global _start
_start:
    mov eax, DWORD [n1]
    mov ebx, DWORD [n2]
    cmp eax, ebx
    je equal
    jne notequal

equal:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, len1
    int 0x80

    mov eax, 1
    int 0x80

notequal:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, len2
    int 0x80

    mov eax, 1
    int 0x80
