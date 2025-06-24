section .data
    msg db "Hello, World!", 0xA ; 0xA = newline
    len equ $ - msg

section .text
    global _start

_start:
    mov eax, 4      ; syscall number for write
    mov ebx, 1      ; file descriptor (stdout)
    mov ecx, msg    ; pointer to message
    mov edx, len    ; length of message
    int 0x80        ; interrupt

    mov eax, 1      ; syscall number for exit
    xor ebx, ebx    ; exit code 0
    int 0x80
