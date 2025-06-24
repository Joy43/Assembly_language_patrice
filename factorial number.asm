.model small
.stack 100h

.data
    num     db 5        ; Input number for factorial
    result  dw 1        ; Result of factorial
    msg     db "Factorial = $"
    output  db 6 dup('$') ; String buffer for output

.code
main:
    mov ax, @data
    mov ds, ax

    ; Step 1: Calculate factorial
    mov al, num
    mov bl, al
    mov ax, 1

factorial_loop:
    mul bl
    dec bl
    cmp bl, 1
    jg factorial_loop

    ; AX now has factorial result, store it
    mov result, ax

    ; Step 2: Display "Factorial = "
    lea dx, msg                            
    +
    
    mov ah, 09h
    int 21h

    ; Step 3: Convert result in AX to string and print it
    mov cx, 0              ; Digit counter
    mov bx, 10             ; Divisor for base 10

    convert:
        xor dx, dx         ; Clear DX before div
        div bx             ; AX / 10, Quotient in AX, Remainder in DX
        push dx            ; Save remainder (digit)
        inc cx             ; Count digits
        cmp ax, 0
        jne convert

    ; Step 4: Print digits from stack
    print_digits:
        pop dx
        add dl, '0'
        mov ah, 02h
        int 21h
        loop print_digits

    ; Exit program
    mov ah, 4Ch
    int 21h

end main
