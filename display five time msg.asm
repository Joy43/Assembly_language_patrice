.model small
.stack 100h

.data
    message db 'Hello, World!$'

.code
main:
    mov ax, @data
    mov ds, ax

    mov cx, 5         ; মেসেজ ৫ বার দেখানোর জন্য লুপ কাউন্টার

print_loop:
    mov ah, 09h       ; DOS interrupt 21h function 09h (string display)
    lea dx, message   ; স্ট্রিং এর ঠিকানা dx রেজিস্টারে
    int 21h           ; ইন্টারাপ্ট কল

    loop print_loop   ; cx = cx - 1, এবং যদি ≠ 0 হয় তাহলে আবার লুপে যাবে

    mov ah, 4ch       ; প্রোগ্রাম শেষ করে DOS এ ফেরত যাওয়ার জন্য
    int 21h

end main
