$MOD51
org 0000h

ljmp sr

org 000bh
clr a 
movc a,@a+dptr
inc dptr
mov p2,a
setb p3.6
clr p3.6
djnz r6,proc3
mov r6,#18h
mov dptr,#sine
proc3:reti

sine: db 127,160,191,217,237,250,255,250,237,217,191,160,127,94,63,37,17,4,0,4,17,37,63,94,127
sr:mov dptr,#sine
mov r1,#38h
store:clr a
movc a,@a+dptr
inc dptr
mov @r1,a
inc r1
cjne r1,#50h,store

org 0080h
main:mov r5,#1h
loop:mov p3,#0ffh
	 mov p1,#0ffh
	 mov tcon,#0h
	 mov P2,#0h
	mov tmod,#22h
	mov ie,#82h
	mov dptr,#sine
	mov r0,#38h
	mov r6,#18h
	check1:		mov p3,#0ffh
				cjne r5,#1h,pr
				cpl p3.4
			pr:nop
				cpl p3.0
				jb p3.4,check2
				jmp key1	
	check2:		mov p3,#0ffh
				cpl p3.0
				jb p3.5,check3
				jmp key2
	check3:		mov p3,#0ffh
				cpl p3.0
				jb p3.6,check4
				jmp key3
	check4:		mov p3,#0ffh
				cpl p3.1
				jb p3.4,check5
				jmp key4
	check5:		mov p3,#0ffh
				cpl p3.1
				jb p3.5,check6
				jmp key5
	check6:		mov p3,#0ffh
				cpl p3.1
				jb p3.6,check7
				jmp key6
	check7:		mov p3,#0ffh
				cpl p3.2
				jb p3.4,check8
				jmp key7
	check8:		mov p3,#0ffh
				cpl p3.2
				jb p3.5,check9
				jmp key8
	check9:		mov p3,#0ffh
				cpl p3.2
				jb p3.6,check0
				jmp key9
	check0:		mov p3,#0ffh
				cpl p3.3
				jb p3.5,inter
				jmp key0

inter:ljmp loop
key1:	mov r3,#0c4h  ;low
		mov r4,#0deh  ;high
		jmp trans

key2:	mov r3,#0c4h  ;low
		mov r4,#0e1h  ;high
		jmp trans

key3:	mov r3,#0c4h  ;low
		mov r4,#0e4h  ;high
		jmp trans

key4:	mov r3,#0cah  ;low
		mov r4,#0deh  ;high
		jmp trans

key5:	mov r3,#0cah  ;low
		mov r4,#0e1h  ;high
		jmp trans

key6:	mov r3,#0cah  ;low
		mov r4,#0e4h  ;high
		jmp trans

key7:	mov r3,#0d0h  ;low
		mov r4,#0deh  ;high
		jmp trans

key8:	mov r3,#0d0h  ;low
		mov r4,#0e1h  ;high
		jmp trans

key9:	mov r3,#0d0h  ;low
		mov r4,#0e4h  ;high
		jmp trans

key0:	mov r3,#0d4h  ;low
		mov r4,#0e1h  ;high
		jmp trans
trans:mov tl0,r4
mov tl1,r3
mov th0,r4
mov th1,r3
setb tr0
setb tr1
proc:jnb tf1,proc
clr tf1
mov p1,@r0
setb p3.7
clr p3.7
inc r0
cjne r0,#50h,prc
mov r0,#38h
prc:jmp proc
END