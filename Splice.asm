.model tiny
.data
fname1 db 'NAME.txt',0
handle1 dw ?
part1 db 32 dup('$')
fname2 db 'ID.txt',0
handle2 dw ?
part2 db 32 dup('$')
fname3 db 'splice.txt',0
handle3 dw ?

len1 dw 0000h
len2 dw 0000h

.code
.startup

; open file
mov ah, 3dh
mov al, 0h
lea dx, fname1
int 21h
mov handle1, ax

; read content into msg
mov ah, 3fh
mov bx, handle1
mov cx, 32
lea dx, part1
int 21h

; store length
MOV len1, AX

; close file
mov ah, 3eh
int 21h

; open file
mov ah, 3dh
mov al, 0h
lea dx, fname2
int 21h
mov handle2, ax

; read content into msg
mov ah, 3fh
mov bx, handle2
mov cx, 32
lea dx, part2
int 21h

;store length
MOV len2, AX

; close file
mov ah, 3eh
int 21h

;creating a Splice file
MOV AH, 3Ch
LEA DX, fname3
MOV CL, 1h
INT 21h
MOV handle3, AX

;open the Splice file
MOV AH, 3Dh
MOV Al, 1h
LEA DX, fname3
INT 21h
MOV handle3, AX


MOV AX, len2
LEA DI, part2
ADD DI, AX
LEA SI, part1
MOV CX, len2
REP MOVSB

MOV CX, len2
MOV AX, len1
ADD CX, AX
MOV len2, CX

LEA DI, part2
LEA SI, part1

;write in splice file
MOV AH, 40h
MOV BX, handle3
MOV CX, len2
LEA DX, part2
INT 21h

;close the splice file
MOV AH,3eh
INT 21h

.exit
end
