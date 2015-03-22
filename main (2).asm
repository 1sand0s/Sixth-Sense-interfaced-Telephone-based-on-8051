$MOD51	; This includes 8051 definitions for the Metalink assembler
;low group
;u2
; Please insert your code here.
mov r5,#1h
loop:mov p3,#0ffh
	 mov p1,#0ffh
	 mov tcon,#0h
	check1:		mov p3,#0ffh
				cjne r5,#1h,pr
				;cpl p3.4
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
				jb p3.5,loop
				jmp key0


key1:	mov r3,#0dbh  ;low
		mov r4,#0f4h  ;high
		jmp trans

key2:	mov r3,#0dbh  ;low
		mov r4,#0f7h  ;high
		jmp trans

key3:	mov r3,#0dbh  ;low
		mov r4,#0fah  ;high
		jmp trans

key4:	mov r3,#0e2h  ;low
		mov r4,#0f4h  ;high
		jmp trans

key5:	mov r3,#0e2h  ;low
		mov r4,#0f7h  ;high
		jmp trans

key6:	mov r3,#0e2h  ;low
		mov r4,#0fah  ;high
		jmp trans

key7:	mov r3,#0e6h  ;low
		mov r4,#0f4h  ;high
		jmp trans

key8:	mov r3,#0e6h  ;low
		mov r4,#0f7h  ;high
		jmp trans

key9:	mov r3,#0e6h  ;low
		mov r4,#0fah  ;high
		jmp trans

key0:	mov r3,#0ebh  ;low
		mov r4,#0f7h  ;high
		jmp trans

trans:	mov p0,r4
		mov r5,#0h
		mov p1,#0ffh
		cpl p1.1
		synchronize:	jnb p1.2,synchronize

proc:	mov dptr,#sine
		mov tmod,#12h
		mov b,r3
		mov r0,#18h
RTP:	mov tl1,#0c0h
		mov th1,#063h
		setb tr1
crtp:   jnb tf1,proc1
		jmp loop	
proc1:	mov tl0,b
		mov th0,#0ffh
		setb tr0
proc2:	jnb tf0,proc2
		cpl tr0
		cpl tf0
		clr a
		movc a,@a+dptr
		mov p1,#00h
		mov p2,a
		mov p1,#1h
		mov p1,#0h
		inc dptr
		djnz r0,crtp
proc3:	mov dptr,#sine
		mov r0,#18h
		jmp crtp
sine:	db 127,160,191,217,237,250,255,250,237,217,191,160,127,94,63,37,17,4,0,4,17,37,63,94,127
END