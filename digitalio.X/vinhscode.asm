    processor 18F8722
    config OSC=HS, WDT=OFF , LVP = OFF
    radix decimal
    org 0x00

;Define SFRs
TRISA   equ 0xF92   ;Q3 - LEDs
TRISC   equ 0xF94   ;
TRISF   equ 0xF97   ;Control illumination of LEDs & 7 segs
TRISH   equ 0xF99   ;Q1/2 - 7 segs
LATA    equ 0xF89   ;Q3 - LEDs
LATF    equ 0xF8E   ;Control illumination of LEDs & 7 segs
LATH    equ 0xF90   ;Q1/2 - 7 segs

    ;Set port A, C, F as outputs
    MOVLW 0
    MOVWF TRISA
    MOVWF TRISC
    MOVWF TRISF
    ;Set port H pin 0 as output
    MOVLW B'11111100'
    MOVWF TRISH

    ;Turn off Q3, disable LEDs
    MOVLW 0
    MOVWF LATA
    ;Turn off Q1/2, disable 7 segs
    MOVLW 255
    MOVWF LATH

    ;Turn LED 3, 4, 5 on
 L1 MOVLW B'00111000'
    MOVWF LATF
    MOVLW B'00010000' ;Turn Q3 on
    MOVWF LATA

    ;Turn Q3 off
    MOVLW 0
    MOVWF LATA

    ;Turn on RHS 7 segments E, D, F, G
    MOVLW B'00001111'
    MOVWF LATF
    MOVLW B'11111100' ;Turn Q1 on
    MOVWF LATH
    MOVLW 255 ;Turn Q1 off
    MOVWF LATH
    BRA L1 ;Loop continiously
    end


