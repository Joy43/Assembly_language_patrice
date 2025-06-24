.model small
.stack 100h
.data 
num db 5
fact dw 1
.code
main:

mov ax,@data
mov ds,ax

mov al,num
mov bl,al
mov ax,1
mov cx,bx

factorial_loop:
mul cx
loop factorial_loop

mov fact,ax;

mov ah,4ch
int 21h
end main
