.model tiny
.data
str1	db	'Enter your name: $'

max1	db	32
act1	db	?
inp1 	db	32 dup('$')

fname	db	'testing.txt',0
handle	dw	?
.code
.startup

        ;print
		lea dx, str1
		mov ah, 09h
		int 21h
		
		;take input
		lea dx, max1
		mov ah, 0ah
		int 21h
		
		;create file
		mov ah, 3ch
		lea dx, fname
		mov cx, 00h
		int 21h
		mov handle, ax
		
		;open file
		mov ah, 3dh
		mov al, 01h
		int 21h
		mov handle, ax
		
		;write in file
		mov ah, 40h
		mov bx, handle
		mov cl, act1
		lea dx, inp1
		int 21h
		
		;close file
		mov ah, 3eh
		int 21h
		
.exit
end
