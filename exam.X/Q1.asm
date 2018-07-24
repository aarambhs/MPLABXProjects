	processor 18F8722

        config     OSC=HS, WDT=OFF, LVP=OFF
	radix   decimal
	org 0x00
	
	
p	equ	10
q	equ	11
	MOVLW 40 
	MOVWF p 
	MOVWF q
loop
    DECF p
    MOVF p,W 
    ADDWF q 
    DECF q 
    MOVF p,W 
    BNZ loop 
    NOP
    
    end