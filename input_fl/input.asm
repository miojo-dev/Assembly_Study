section .data
    msg db 'Type your name: '
    len equ $ - msg

section .bss
    name resb 1 ;reserve 1 byte for the name

section .text
global _start
_start:
    mov eax, 4 ;Write method(sys_write)
    mov ebx, 1 ;Output method(std_out)
    mov ecx, msg ;Message
    mov edx, len ;Message size
    int 0x80 ;Kernel call

    mov eax, 3 ;Read method(sys_read)
    mov ebx, 0 ;Input method(std_in)
    mov ecx, name ;Var who stores the input
    mov edx, 60 ;Input max size
    int 0x80 ;Kernel call

    mov eax, 4 ;Write method(sys_write)
    mov ebx, 1 ;Output method(std_out)
    mov ecx, name ;Var
    int 0x80 ;Kernel call

    mov eax, 1 ;Exit method(sys_exit)
    int 0x80 ;Calling the Kernel