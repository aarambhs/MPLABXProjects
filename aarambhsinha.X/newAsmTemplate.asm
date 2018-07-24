	processor	18F8722
	config OSC=HS, WDT=OFF, LVP=OFF 
	radix decimal
	
	org 0x00;
lcnt1	equ 14 ; assign file reg 14 to loop counter 1 (100us loop) equ 15 ; assign file reg 15 to loop counter 2 (10ms loop) equ 16 ; assign file reg 16 to loop counter 3 (n*10ms loop) equ 5 ; n value (e.g. 5, should provide a 50ms delay)
lcnt2	equ 15
LATH	equ 0xF90 ; SFR definitions equ 0xF99
lcnt3	equ 16
LATF	equ 0xF8E
n	equ 5
TRISF	equ 0xF97
TRISH	equ 0xF99
	
	MOVLW 0
	MOVWF TRISF ; set ALL PORTF pins as O/P's

L1	
	MOVLW B'11111110' ; send PIN RH0 of PORT H low MOVWF LATH ; via LATH to drive transistor Q1
	MOVWF LATH
	MOVLW B'00100110' ; send PINS RF0, RF3, RF4, RF6, RF7 low MOVWF LATF ; via LATF to display number 5 on U1
	MOVWF LATF
	MOVLW B'11111110' ; set TRISH such that pin RH0 MOVWF TRISH ; of PORTH is an output
	MOVWF TRISH 
	CALL L2
	
	MOVLW B'11111101' ; send PIN RH1 of PORT H low
	MOVWF LATH
	
	
	MOVLW B'01001100' ; send PIN RH1 of PORT H low
	MOVWF LATF
	
	MOVLW B'11111101'
	MOVWF TRISH
	
	CALL	L2


	
	BRA L1 ; loop forever
L2
	MOVLW n
; main program loop


	MOVWF	lcnt3
L3
	MOVLW	100
	MOVWF	lcnt2
	
	
L4	
	MOVLW	27
	MOVWF	lcnt2
	
L5
	NOP 
	NOP 
	NOP 
	NOP
	NOP 
	NOP
	DECF	lcnt1
	BNZ	L5
	NOP
	NOP
	DECF	lcnt2
	BNZ	L4
	DECFSZ	lcnt3
	GOTO	L3
	RETURN 
	End