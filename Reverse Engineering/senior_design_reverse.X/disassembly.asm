; TODO INSERT CONFIG CODE HERE USING CONFIG BITS GENERATOR
list p=pic16f639
#include<p16f639.inc>

;Unsure if these are accurate declarations
;W   EQU	0x00
;F   EQU	0x01
    
RES_VEC CODE 0x0000
    goto label_00c

ISR CODE    0x0004
    movwf   0x7e
    movf    STATUS, W
    movwf   0x78
    movf    FSR, W
    movwf   0x79
    movf    PCLATH, W
    movwf   0x7a
    goto    label_117
label_00c:
    goto    0x02ad
label_00d:
    call    label_224
    movlw   0x00
    call    label_28b
    call    label_0a5
    bcf	    STATUS, 0x05
    bcf	    STATUS, 0X06
    clrf    0x53
    incf    0x53, f
label_015:
    decfsz  0x53, w
    goto    label_036
    clrf    PORTA
    movlw   0x3f
    bsf	    STATUS, 0x05
    movwf   PORTA
    movlw   0x30
    movwf   WPUDA
    movwf   WDA
label_01e:    
    bcf	    STATUS, 0x05
    btfsc   PORTA, 0x01
    goto    label_029
    call    label_0a5
    movlw   0x05
    bcf	    STATUS, 0x05
    bcf	    STATUS, 0x06
    movwf   0x20
    clrf    0x21
    call    label_2e8
    goto    label_01e
label_029:    
    clrf    T1CON
    movlw   0x07
    bsf	    STATUS, 0x05
    movwf   IOCA
    movlw   0xf8
    movwf   INTCON
    NOP
    SLEEP
    NOP
    NOP
    bcf	    STATUS, 0x05
    bcf	    STATUS, 0x06
    bcf	    0x53, 0x00
label_036:    
    btfss   0x53, 0x01
    goto    label_09e
    btfss   PORTA, 0x2
    goto    label_07c
    movlw   0x3
    subwf   0x4c, W
    movlw   0xe8
    btfsc   STATUS, 0x2
    subwf   0x4b, W
    btfsc   STATUS, 0x0
    goto    label_056
    movlw   0x0
    subwf   0x4c, W
    movlw   0x14
    btfsc   STATUS, 0x0
    btfsc   0x53, 0x2
    goto    label_09e
    bsf	    0x53, 0x2
    btfss   0x53, 0x3
    goto    label_09e
    movlw   0x93
    movwf   0x50
    movlw   0x50
    movwf   0x51
    movlw   0x66
    movwf   0x52
    movlw   0xf
    movwf   0x55
    bsf	    0x53, 0x7
    goto    label_09e
label_056:
    movlw   0x7
    subwf   0x4c, W
    movlw   0xd1
    btfsc   STATUS, 0x2
    subwf   0x4b, W
    btfss   STATUS, 0x0
    goto    label_09e
    movlw   0xd0
    movwf   0x4b
    movlw   0x7
    movwf   0x4c
    btfsc   0x53, 0x7
    goto    label_09e
    movlw   0x28
    incf    0x4f, F
    subwf   0x4f, W
    btfsc   STATUS, 0x0 ;if statement?
    goto    label_06c
    movlw   0x93
    movwf   0x50
    movlw   0x60
    goto    label_075
label_06c:
    movf    0x4f, W
    xorlw   0x28
    btfsc   STATUS, 0x2
    incf    0x54, F
    movlw   0x29
    movwf   0x4f
    movlw   0x93
    movwf   0x50
    movlw   0xc0
label_075:
    movwf   0x51
    movlw   0x66
    movwf   0x52
    bsf	    0x53, 0x7
    clrf    0x55
    incf    0x55, F
    goto    label_09e
label_07c:
    btfss   0x53, 0x2 ;continuation of if statement?
    goto    label_091
    bcf	    0x53, 0x2
    bcf	    0x53, 0x4
    clrf    0x4b
    clrf    0x4c
    incf    0x54, F
    clrf    0x4f
    btfss   0x53, 03
    goto    label_088
    bcf	    0x53, 0x3
    goto    label_09e
label_088:
    movlw   0x3
    subwf   0x4c, W
    movlw   0xe8
    btfsc   STATUS, 0x2
    subwf   0x4b, W
    btfsc   STATUS, 0x0
    goto    label_09e
    bsf	    0x53, 0x3
    goto    label_09e
label_091:
    movlw   0x3
    subwf   0x4c, W
    movlw   0xe8
    btfsc   STATUS, 0x2
    subwf   0x4b, W
    btfss   STATUS, 0x0
    goto    label_09e
    bcf	    0x53, 0x1
    bcf	    0x53, 0x3
    bcf	    0x53, 0x4
    clrf    0x4b
    clrf    0x4c
    clrf    0x4f
label_09e: ;very important, refernced multiple times
    btfss   0x53, 0x7
    goto    label_015 ;possibly main?
    call    label_180
    bcf	    STATUS, 0x5
    bcf	    0x53, 0x7
    bsf	    0x53, 0x0
    goto    label_015
label_0a5:
    bcf	    STATUS, 0x5
    clrf    0x36
    movlw   0x28
    movwf   FSR
    movlw   0x56
label_0af:
    movwf   0x24
    movf    FSR, W
    movwf   0x25
    movlw   0xe
    movwf   0x26
    movf    0x24, W
    bcf	    STATUS, 0x7
    movf    INDF, W
    movwf   0x27
    incf    0x24, F
    movf    0x25, W
    movwf   FSR
    movf    0x27, W
    movwf   INDF
    incf    0x25, F
    decfsz  0x26, F
    goto    label_0af ;definitally a loop ?
    clrf    0x38
label_0bd:
    movf    0x38, W
    addlw   0x40
    movwf   FSR
    bcf	    STATUS, 0x7
    movf    INDF, W
    call    label_111
    bcf	    STATUS, 0x0
    rlf	    0x38, W ;possibly a multiplication? weird
    addlw   0x28
    movwf   FSR
    movf    0x24, W
    iorwf   INDF, F
    incf    FSR, F
    movf    0x38, W
    addlw   0x40
    movwf   FSR
    movf    INDF, W
    call    label_319
    xorlw   0x0
    bcf	    STATUS, 0x0
    btfsc   STATUS, 0x2
    goto    label_0dd
    rlf	    0x38, W
    addlw   0x28
    movwf   FSR
    movlw   0x1
    iorwf   INDF, F
    incf    FSR, F
    incf    0x36, F
    bcf	    STATUS, 0x0
label_0dd:	    ;function
    rlf	    0x38, W
    addlw   0x28
    movwf   FSR
    movf    INDF, W
    movwf   0x20
    incf    FSR, F
    movf    INDF, W
    movwf   0x21
    call    label_25d
    bcf	    STATUS, 0x5
    incf    0x38, F
    movlw   0x6
    subwf   0x38, W
    btfss   STATUS, 0x0
    goto    label_0bd
    movf    0x41, W ;possibly sending data to RF?
    xorwf   0x40, W
    movwf   0x37
    movf    0x42, W
    xorwf   0x37, F
    movf    0x43, W
    xorwf   0x37, F
    movf    0x44, W
    xorwf   0x37, F
    movf    0x45, W
    xorwf   0x37, F
    movlw   0xff
    xorwf   0x37, F
    movf    0x37, W
    call    label_111
    movf    0x24, W
    iorwf   0x34, F
    movf    0x25, W
    iorwf   0x35, F
    btfss   0x36, 0x0
    bsf	    0x34, 0x0
    movf    0x35, W
    movwf   0x21
    movf    0x35, W
    movwf   0x20
    call    label_25d
    nop
    nop
    bcf	    STATUS, 0x5
    bcf	    STATUS, 0x6
    clrf    0x20
    movlw   0x20
    movwf   0x21
    call    label_25d
    nop
    nop
    return
    
label_111:	;function
    movwf   0x24
    clrf    0x25
    bcf	    STATUS, 0x0
    rlf	    0x24, F
    rlf	    0x25, F
    return
    
label_117:
    bcf	    STATUS, 0x5
    bcf	    STATUS, 0x6
    movf    PORTA, W
    movwf   PORTA
    movf    INTCON, W
    movwf   0x7b
    movlw   0xf8
    andwf   INTCON, F
    btfss   0x7b, 0x2 ;switch statement?
    goto    label_131
    btfss   0x53, 0x1
    goto    label_126
    incf    0x4b, F
    btfsc   STATUS, 0x2
    incf    0x4c, F
label_126:
    btfss   0x53, 0x5
    goto    label_131
    movlw   0xac
    incf    0x72, F
    subwf   0x72, W
    btfss   STATUS, 0x0
    goto    label_131
    clrf    0x72
    clrf    T1CON
    bcf	0x53, 0x5
    bsf	0x53, 0x0
label_131:
    btfsc   0x7b, 0x1
    bsf	0x53, 0x1
    btfss   0x7b, 0x0
    goto    label_177
    btfsc   PORTA, 0x1
    goto    label_139
    bsf	    0x53, 0x0
    goto    label_177
label_139:
    btfss   PORTA, 0x0
    goto    label_148
    btfsc   0x53, 0x5
    goto    label_142
    bsf	    0x53, 0x5
    clrf    0x74
    clrf    0x73
    clrf    0x70
    clrf    0x72
label_142:	    ;Possibly timer handler? retfie is called @17f so it would make sense
    clrf    TMR1
    clrf    TMR1H
    bsf	    T1CON, 0x0
    clrf    0x71
    incf    0x71, F
    goto    label_177
label_148:
    decfsz  0x71, W
    goto    label_177
    movlw   0x6
    subwf   TMR1H, W
    movlw   0x0
    btfsc   STATUS, 0x0
    goto    label_156
    incf    0x73, F
    clrf    0x71
    bcf	    STATUS, 0x0
    rlf	    0x74, F
    goto    label_162
label_156:
    movlw   0x2
    subwf   TMR1H, W
    btfss   STATUS, 0x0
    goto    label_162
    incf    0x73, F
    clrf    0x71
    bcf	    STATUS, 0x0
    rlf	    0x74, F
    bsf	    0x74, 0x0
label_162:
    movlw   0x8
    subwf   0x73, W
    btfss   STATUS, 0x0
    goto    label_177
    movf    0x70, W
    addlw   0x46
    movwf   FSR
    movf    0x74, W
    bcf	    STATUS, 0x7
    movwf   INDF
    incf    0x70, F
    movlw   0x5
    subwf   0x70, w
    btfss   STATUS, 0x0
    goto    label_176
    call    label_1e2
    btfss   0x53, 0x7
    goto    label_175
    clrf    0x72
label_175: ;this is strange, most likely testing state changes
    clrf    0x70
label_176:
    clrf    0x73
label_177:
    movf    0x7a, W
    movwf   PCLATH  ;what is the purpose of this reg?
    movf    0x79, W
    movwf   FSR
    movf    0x78, W
    movwf   STATUS
    swapf   0x7e, F ;why would this be useful?
    swapf   0x7e, W
    retfie  ;so this would be an ISR? must be, but where does it start?

;Function from 0x180 to 0x223
label_180:
    movlw   0xc4
    movwf   0x36
    swapf   0x54, W
    andlw   0xf0
    movwf   0x37
    movf    0x4d, W
    andlw   0xf
    iorwf   0x37, F
    movf    0x4e, W
    movwf   0x38
    movf    0x75, W
    movwf   0x39
    movf    0x50, W
    movwf   0x3a
    movf    0x51, W
    movwf   0x3b
    movf    0x52, W
    movwf   0x3c
    clrf    0x3d
    clrf    0x3f
    incf    0x3f, F
label_195:
    movf    0x3f, W
    addlw   0x36
    movwf   FSR
    bcf	    STATUS, 0x7
    movf    INDF, W
    addwf   0x3d, F
    incf    0x3f, F
    movlw   0x7
    subwf   0x3f, W
    btfss   STATUS, 0x0
    goto    label_195
    clrf    0x3f 
label_1a1:
    movf    0x3f, W
    addlw   0x36
    movwf   FSR
    movf    INDF, W
    call    label_2cd
    bcf	    STATUS, 0x0
    rlf	    0x3f, W
    addlw   0x26
    movwf   FSR		;Setting where to put memory in RAM
    movf    0x20, W
    movwf   INDF	;storing INDF?
    incf    FSR, F
    movlw   0x8
    subwf   0x3f, W
    btfss   STATUS, 0x0
    goto    label_1a1
    movlw   0x0
    call    label_28b	;strange how this is called twice here
    movlw   0x1	;must be useful for the function call
    call    label_28b
    clrf    INTCON
    bcf	    STATUS, 0x5
    movf    0x55, W
    movwf   0x3F
label_1bc:
    movf    0x3f, F
    btfsc   STATUS, 0x2
    goto    label_1de
    movlw   0x6
    movwf   0x3e
label_1c1:
    movlw   0xaa
    movwf   0x20
    movwf   0x21
    call    label_301
    decfsz  0x3e, F
    goto    label_1c1
    clrf    0x3e
    bcf	    STATUS, 0x0
label_1c9:
    rlf	    0x3e, W
    addlw   0x26
    movwf   FSR
    bcf	    STATUS, 0x7
    movf    INDF, W
    movwf   0x20
    incf    FSR, F
    movf    INDF, W
    movwf   0x21
    call    label_301
    incf    0x3e, F
    movlw   0x8
    subwf   0x3e, W
    btfss   STATUS, 0x0
    GOTO    label_1c9
    clrf    0x20
    incf    0x20, F
    clrf    0x21
    call    label_2e8
    decf    0x3f, F
    goto    label_1bc
label_1de:
    movlw   0xf8
    movwf   INTCON
    movlw   0x2
    goto    label_28b
label_1e2:
    movf    0x46, W
    movwf   0x76
    movf    0x47, W
    andlw   0x80
    addwf   0x76, F
    movlw   0x2
    movwf   0x77
label_1e9:
    movf    0x77, W
    addlw   0x46
    movwf   FSR
    movf    INDF, W
    addwf   0x76, F
    incf    0x77, F
    movlw   0x5
    subwf   0x77, W
    btfss   STATUS, 0x0
    goto    label_1e9
    bcf	    0x76, 0x7
    movf    0x47, W
    andlw   0x7f
    xorwf   0x76, W
    btfss   STATUS, 0x2
    return
    
    movf    0x48, W
    andlw   0xf0
    xorlw   0xc0
    btfss   STATUS, 0x2
    goto    label_204
    movf    0x49, W
    xorwf   0x75, W
    btfss   STATUS, 0x2
    goto    label_204
    movlw   0xc0
    movwf   0x77
label_204:
    movf    0x48, W
    andlw   0xf
    xorlw   0xc
    btfss   STATUS, 0x2
    goto    label_20f
    movf    0x4a, W
    xorwf   0x75, W
    btfss   STATUS, 0x2
    goto    label_20f
    movlw   0xc0
    movwf   0x77
label_20f:
    movf    0x77, W
    xorlw   0xc0
    btfsc   STATUS, 0x2
    btfss   0x46, 0x7
    return
    btfss   0x46, 0x6	;if bit 0x6 of 0x46 is 1, set 0x51 = 0x50, otherwise 0x51 = 0x55 
    goto    label_218
    movlw   0x55
    goto    label_219
label_218:
    movlw   0x50
label_219:
    movwf   0x51   
    movlw   0x93
    movwf   0x50
    movlw   0x55
    movwf   0x52
    bsf	    0x53, 0x7
    incf    0x54, F
    movlw   0xa
    movwf   0x55
    clrf    INTCON
    return

label_224:
    movlw   0x71
    bsf	    STATUS, 0x5
    movwf   TMR1H
label_227:  ;waiting for timer to go off
    btfss   TMR1H, 0x2
    goto    label_227 ;timer loop, delay
    clrf    INTCON
    movlw   0x41
    movwf   TMR0
    movlw   0x7
    bcf	    STATUS, 0x5
    movwf   CMCON0
    bsf	    STATUS, 0x5
    clrf    LVDCON
    bcf	    STATUS, 0x5
    clrf    PORTA
    movlw   0x3f
    bsf	    STATUS, 0x5
    movwf   PORTA
    movlw   0x30
    movwf   WPUDA    ;this repeated earlier, why?
    movwf   WDA
    clrf    IOCA
    movlw   0x2
    bcf	    STATUS, 0x5
    movwf   PORTC   ;interesting, first time use here
    movlw   0xc
    bsf	    STATUS, 0x5
    movwf   PORTC
    movlw   0x32
    bcf	    STATUS, 0x5
    movwf   0x20
    clrf    0x21
    call    label_2e8
    movlw   0x16
    call    label_331
    bcf	    STATUS, 0x5
    movwf   0x4e
    movlw   0x14
    call    label_331
    movwf   0x75
    movlw   0xa0
    bcf	    STATUS, 0x5
    movwf   0x40
    movlw   0x3b
    movwf   0x41
    movlw   0x20
    movwf   0x42
    movlw   0x10
    movwf   0x43
    clrf    0x44
    movlw   0x80
    movwf   0x45
    return
    
label_25d:
    bsf	    STATUS, 0x5 ;setting portc IO pins here, why?
    bcf	    TRISC, 0x2  ; pin 2 output
    bcf	    STATUS, 0x2
    bcf	    PORTC, 0x2  ;initialize as 0
    
    bsf	    STATUS, 0x5 ;output pin 1
    bcf	    TRISC, 0x1  
    bcf	    STATUS, 0x5
    bcf	    PORTC, 0x1
    
    bsf	    STATUS, 0x5
    bcf	    TRISC, 0x3  ;output pin 3
    bcf	    STATUS, 0x5
    bcf	    PORTC, 0x3
    clrf    0x22
label_26a:
    btfss   0x21, 0x7
    goto    label_26e
    bsf	    PORTC, 0x3
    goto    label_26f
label_26e:
    bcf	    PORTC, 0x3
label_26f:
    nop
    nop
    nop
    bcf	    STATUS, 0x5
    bcf	    STATUS, 0x6
    bsf	    PORTC, 0x2
    nop
    nop
    nop
    nop
    bcf	    STATUS, 0x5
    bcf	    STATUS, 0x6
    bcf	    PORTC, 0x2
    bcf	    STATUS, 0x0
    rlf	    0x20, F
    rlf	    0x21, F
    incf    0x22, F
    movlw   0x10
    subwf   0x22, W
    btfss   STATUS, 0x0
    goto    label_26a
    bsf	    STATUS, 0x5 ;turn off PORTC? thats what it seems here
    bsf	    TRISC, 0x3	;turn pin 3 to input
    bcf	    STATUS, 0x5
    bsf	    PORTC, 0x1	;put pin 1 high
    bsf	    STATUS, 0x5
    bsf	    TRISC, 0x2 ;turn pin 2 to input
    return
    
label_28b:
    bcf	    STATUS, 0x5
    movwf   0x20
label_28e:
    goto    label_2a2
    movlw   0xce
    andwf   PORTC, F	;F is a bitmask for PORTC here	
    bsf	    STATUS, 0x5
    andwf   TRISC, F
    return 
label_293:
    bsf	    TRISC, 0x5	;pin 5 input
    bcf	    TRISC, 0x4	;pin 4 output
    bcf	    TRISC, 0x0	;pin 0 output
    bsf	    TRISC, 0x4	;pin 4 input?
    clrf    TMR1
    clrf    TMR1H
    bsf	    T1CON, 0x0
    return
label_29b:
    bcf	    TRISC, 0x5	;pin 5 output
    bcf	    TRISC, 0x4	;pin 4 output
    bcf	    TRISC, 0x0	;pin 0 output
    clrf    T1CON
    clrf    TMR1
    clrf    TMR1H
    return

label_2a2:   
    movf    0x20, W
    xorlw   0X0
    btfsc    STATUS, 0x2
    goto    label_28e
    xorlw   0x1
    btfsc   STATUS, 0x2
    goto    label_293
    xorlw   0x3
    btfss   STATUS, 0x2
    return
    goto    label_29b
    movlw   0x70
    movwf   FSR
    movlw   0x76
    call    label_329
    bcf	    STATUS, 0x7
    movlw   0x40
    movwf   FSR
    movlw   0x56
    call    label_329
    clrf    0x56
    movlw   0xe0
    movwf   0x57
    clrf    0x58
    movlw   0xe2
    movwf   0x59
    clrf    0x5a
    movlw   0xe4
    movwf   0x5b
    clrf    0x5c
    movlw   0xe6
    movwf   0x5d
    clrf    0x5e
    movlw   0xe8
    movwf   0x5f
    clrf    0x60
    movlw   0xea
    movwf   0x61
    clrf    0x62
    movlw   0xec
    movwf   0x63
    clrf    STATUS
    goto    label_00d ;such a large jump, why?
label_2cd:
    movwf   0x22
    clrf    0x23
    clrf    0x24
    clrf    0x25
    bcf	    STATUS, 0x0	;why is this repeated twice?
    rlf	    0x23, F
    rlf	    0x24, F
    bcf	    STATUS, 0x0
label_2d2:
    rlf	    0x23, F
    rlf	    0x24, F
    btfss   0x22, 0x7
    goto    label_2db
    bsf	    0x23, 0x0
    goto    label_2dc
label_2db:
    bsf	    0x23, 0x1    
label_2dc:
    bcf	    STATUS, 0x0
    rlf	    0x22, F
    incf    0x25, F
    movlw   0x8
    subwf   0x25, W
    btfss   STATUS, 0x0
    goto    label_2d2
    movf    0x24, W
    movwf   0x21
    movf    0x23, W
    movwf   0x20
    return
    
label_2e8:
    movlw   0x1
    subwf   0x20, F
    movlw   0x0
    btfss   STATUS, 0x0
    decf    0x21, F
    subwf   0x21, F
    incf    0x20, W
    btfsc   STATUS, 0x2
    incf    0x21, W
    btfsc   STATUS, 0x2
    return
    movlw   0xe2
    movwf   0x22
    movlw   0x1
    movwf   0x23
label_2f7:
    movlw   0x1
    subwf   0x22
    btfss   STATUS, 0x0
    decf    0x23, F
    incf    0x22, W
    btfsc   STATUS, 0x2
    goto    label_2e8
    goto    label_2f7
label_301:
    movlw   0x10
    movwf   0x22
label_303:
    movlw   0x1
    subwf   TMR1H, W
    movlw   0x98
    btfsc   STATUS, 0x2
    subwf   TMR1, W
    btfss   STATUS, 0x0
    goto    label_315
    clrf    TMR1
    clrf    TMR1H
    btfss   0x21, 0x7
    goto    label_310
    bsf	    PORTC, 0x0
    goto    label_311
label_310:
    bcf	    PORTC, 0x0
label_311:
    bcf	    STATUS, 0x0
    rlf	    0x20, F
    rlf	    0x21, F
    decf    0x22, F
label_315:
    movf    0x22, F
    btfsc   STATUS, 0x2
    return
    goto    label_303
label_319:
    movwf   0x20
    movwf   0x22
    clrf    0x21
    clrf    0x23
label_31d:
    btfsc   0x22, 0x7
    incf    0x21, F
    bcf	    STATUS, 0x0
    rlf	    0x22, F
    incf    0x23, F
    movlw   0x8
    subwf   0x23, W
    btfss   STATUS, 0x0
    goto    label_31d
    btfss   0x21, 0x0 ;if 0x21 bit 0 is 1, return 0; if 0, return 1
    retlw   0x1
    retlw   0x0
label_329:
    clrwdt	;possibly this is a watchdog timer ISR?
label_32a:	;EEPROM?
    clrf    INDF
    incf    FSR, F
    xorwf   FSR, W
    btfsc   STATUS, 0x2
    retlw   0x0
    xorwf   FSR, W
    goto    label_32a
label_331:  ;EEPROM writing?
    movwf   0x20
    bsf	    STATUS, 0x5
    movwf   EEADR
    bsf	    EECON1, 0x0
    movf    CMCON1, W
    return
    
    END