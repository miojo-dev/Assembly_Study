section .data
    msg db 'hello world!', 0xA
    len equ $ - msg

section .text
global _start
_start:
    call hello_world ;using "call" to call a label

hello_world:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80

    mov eax, 1
    int 0x80