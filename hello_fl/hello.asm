section .data
    msg db 'hello world!', 0xA ;string
    len equ $ - msg ;string size

section .text 
global _start
_start:
    mov eax, 4 ;Write method(sys_write)
    mov ebx, 1 ;Output method(std_out)
    mov ecx, msg ;Mesage
    mov edx, len ;Size
    int 0x80 ;Kernel call

    mov eax, 1 ;Exit method(sys_exit)
    int 0x80 ;Calling the Kernel