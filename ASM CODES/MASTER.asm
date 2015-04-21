$MOD51	; This includes 8051 definitions for the Metalink assembler
;high group
;u1
; Please insert your code here.
init:	mov p2,#0ffh
		mov p3,#0ffh
		mov tcon,#0h
synchronize:	jb p3.1,synchronize
				cpl p3.2

		mov dptr,#sine
		mov b,p2
		mov tmod,#21h
		mov r0,#18h
rtp:	mov tl0,#0c0h
		mov th0,#063h
		setb tr0
rtpch:	jnb tf0,proc1
		jmp init
proc1:	mov tl1,b
		mov th1,#0f0h
		setb tr1
proc2:	jnb tf1,proc2
		cpl tr1
		cpl tf1
		clr a
		movc a,@a+dptr
		mov p0,#00h
		mov p1,a
		mov p0,#1h
		mov p0,#0h
		inc dptr
		djnz r0,rtpch
proc3:	mov dptr,#sine
		mov r0,#18h
		jmp rtpch
sine:	db 127,160,191,217,237,250,255,250,237,217,191,160,127,94,63,37,17,4,0,4,17,37,63,94,127
END