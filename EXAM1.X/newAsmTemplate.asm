    radix decimal
    org 0x00
    
x   equ	21
y   equ	23
   
   MOVLW 0x56
   MOVWF x
   MOVLW 27
   MOVWF y
   
loop
   MOVF x, w
   INCF x
   XORWF    y
   DECF	y
   BC	loop
   
   NOP


