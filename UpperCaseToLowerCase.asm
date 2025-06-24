.model small
.stack 100h
.data
msg db "Enter a lowercase letter:$"
OutMessage db 0Dh,0Ah,'Uppercase:$'
.code
main:
mov ax,@data
mov ds,ax
;user message show

lea dx,msg           
mov ah,09h
int 21h
;user input

mov ah,01h
int 21h
;small letter convert to capital latter now
cmp al,'a'
jb show_output
cmp al,'z'
ja show_output
sub al,32

show_output:
;show output message

lea dx,OutMessage
mov ah,09h
int 21h
;print the letter

mov dl,al
mov ah,02h
int 21h
;end of the program
mov ah,4ch
int 21h
end main


