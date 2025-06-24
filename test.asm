.model small
.stack 100h

.data
    msg db "Hello, World!$"

.code
main:
    mov ax, @data
    mov ds, ax

    mov cx, 5         ; 5 বার লুপ চালানোর জন্য কাউন্টার

display_loop:
    lea dx, msg       ; DX রেজিস্টারে মেসেজ লোড
    mov ah, 09h       ; DOS interrupt: display string
    int 21h

    loop display_loop ; লুপ চালানো

    mov ah, 4Ch       ; প্রোগ্রাম শেষ
    int 21h

end main
