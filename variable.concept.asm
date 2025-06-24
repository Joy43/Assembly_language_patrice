.model small
.stack 100h
.data
 msg db 3

 .code
 main :
 mov ax,@data
 mov ds,ax
 mov ah,2
 add msg,48
 int 21h
 exit:
 mov ah,4ch
 int 21h
 end main
