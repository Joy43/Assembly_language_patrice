.model small
.stack 100h
.data
    num db 5         ;
    
    fact dw 1        ; ফলাফল এখানে থাকবে

.code
main:
    mov ax, @data    ; ডেটা সেগমেন্টের ঠিকানা লোড করো
    mov ds, ax       ; DS রেজিস্টারে সেট করো

    mov al, num      ; num = 5 → AL রেজিস্টারে লোড করো
    mov bl, al       ; BL = AL (counter)
    mov ax, 1        ; AX = 1 → শুরুতে factorial = 1
    mov cx, bx       ; loop counter = BX

factorial_loop:
    mul cx           ; AX = AX * CX (factorial হালনাগাদ)
    loop factorial_loop  ; CX– করে আবার লুপে যাবে যদি CX != 0

    mov fact, ax     ; ফাইনাল রেজাল্ট fact ভ্যারিয়েবলে রাখো

    ; প্রোগ্রাম শেষ, এখন exit
    mov ah, 4ch
    int 21h
end main
