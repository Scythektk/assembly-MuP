.model tiny
.data

str1 db 'Enter your name: $'
str2 db 'Enter your ID: $'

fname1 db 'name.txt',0
fname2 db 'id.txt',0
handle1 dw ?
handle2 dw ?

max1 db 32
len1 db ?
msg1 db 32 dup('$')

max2 db 32
len2 db ?
msg2 db 32 dup('$')

.code
.startup

;print
lea dx, str1
mov ah, 09h
int 21h

;input name
lea DX, max1
mov AH, 0Ah
int 21h

;print
lea dx, str2
mov ah, 09h
int 21h

;input ID
lea dx, max2
mov ah, 0Ah
int 21h

;creating a name file
mov ah, 3Ch
lea dx, fname1
mov cl, 1h
int 21h
mov handle1, ax

;creating an ID file
mov ah, 3Ch
lea dx, fname2
mov cl, 1h
int 21h
mov handle2, ax

;open the name file
mov ah, 3Dh
mov al, 1h
lea dx, fname1
int 21h
mov handle1, ax

;write in name file
mov AH, 40h
mov BX, handle1
mov CL, len1
lea DX, msg1
int 21h

;close the name file
mov AH,3eh
int 21h

;open the ID file
mov AH, 3Dh
mov Al, 1h
lea DX, fname2
int 21h
mov handle2, AX

;write in ID file
mov AH, 40h
mov BX, handle2
mov CL, len2
lea DX, msg2
int 21h

;close the ID file
mov AH,3eh
int 21h


.exit
end
