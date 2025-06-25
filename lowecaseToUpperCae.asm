.model small
.stack 100h
.data
    msg1 db 'Enter a lowercase letter: $'
    msg2 db 0Dh,0Ah,'Uppercase letter: $'
    input db ?
    result db ?

.code
main:
    mov ax, @data      ; Step 1: Load data segment address
    mov ds, ax

    ; Step 2: Show message to enter lowercase letter
    lea dx, msg1
    mov ah, 09h
    int 21h

    ; Step 3: Take one character input
    mov ah, 01h
    int 21h
    mov input, al      ; Save input character

    ; Step 4: Convert to uppercase
    ; ASCII of 'a' = 97, 'A' = 65 → difference = 32
    cmp al, 'a'
    jb skip            ; If less than 'a', skip
    cmp al, 'z'
    ja skip            ; If more than 'z', skip

    sub al, 32         ; Convert to uppercase
    mov result, al     ; Store the result

    ; Step 5: Show uppercase message
    lea dx, msg2
    mov ah, 09h
    int 21h

    ; Step 6: Print the uppercase letter
    mov dl, result
    mov ah, 02h
    int 21h

    jmp exit

skip:
    ; Not a lowercase letter
    mov dl, input
    mov ah, 02h
    int 21h

exit:
    mov ah, 4Ch        ; Exit program
    int 21h
end main
