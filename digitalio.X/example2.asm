    processor	18F8722
    config	OSC=HS, WDT=OFF, LVP=OFF
    radix	decimal
    org		0x00
 
    
LATA	equ 0xF89;
TRISA	equ 0xF92
LATF	equ 0xF8E
TRISF	equ 0xF97
PORTC	equ 0xF82
TRISC	equ 0xF94
PORTH	equ 0xF87
TRISH	equ 0xF99
ADCON1	equ 0xFC1

    

    MOVLW	0x0F
    MOVWF	ADCON1

    MOVLW	B'00010000'
    MOVWF	LATA
    MOVLW	B'11101111'
    MOVWF	TRISA
	
    MOVLW	B'00111100'
    MOVWF	TRISC

    MOVLW	B'11111111'
    MOVWF	TRISH

    MOVLW	0
    MOVWF	TRISF
    
L1  MOVF    PORTH, W
    MOVWF   9
    MOVF    PORTC,W
    MOVWF   10
    RRNCF   10,	W
    MOVWF   11
    RRNCF   11,W
    
    ANDLW   15
    MOVWF   11
    
    MOVF    9,W
    ANDLW   B'11110000'
    XORWF   11,1
    BTFSS   11,7
    BRA	    L2
    BRA	    L3
    
L2  MOVLW   7
    SUBWF   11
    BZ	    L4
    BN	    L4
    MOVLW   B'00000100'
    MOVWF   LATF
    MOVWF   L1
    
    BRA	    L1
    
L4  MOVLW   B'00000000'
    MOVWF   LATF
    BRA L1
    
L3  MOVLW   255
    SUBWF   11
    BZ	    L4
    MOVLW   B'00000010'
    MOVWF   LATF
    BRA	    L1
    
    
    
    end
	

	



