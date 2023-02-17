#
# Global data (gender, age, and fat)
#
    .data
    .comm gender,1
    .global gender
    .comm age,1
    .global age
    .comm fat,1
    .global fat

#
# Program code (lightup function)
#
    .text
    .global lightup
lightup:
    ldi R18, 0b00110001   //Register for all 3 LEDS
    out 0x04, r18         //Sets PINS to OUT
    ldi R26, 0b00100000   //Register for BLUE LED
    ldi R27, 0b00010000   //Register for GREEN LED
    ldi R28, 0b00000001   //Register for RED LED
    ldi R24, 0b00000000   //Register to turn OFF LEDS
    lds R19, gender
    lds R20, age
    lds R21, fat
    CPI R19, 15           //Determines if to branch to MALE or FEMALE
    BREQ  FEMALE
    CPI R19, 10
    BREQ MALE
MALE:                     //Determines what age group to use
    CPI R20, 60
    BRSH OLDERTHN60M
    CPI R20, 40
    BRSH MORETHN40M
    CPI R20, 20
    BRSH MORETHN20M
OLDERTHN60M:              //Determines what weight category to use for 60+ MALE age group
    CPI R21, 30
    BRSH VERY
    CPI R21, 25
    BRSH HIGHE
    CPI R21, 13
    BRSH NORM
    JMP LOWI
MORETHN40M:               //Determines what weight category to use for 40+ MALE age group
    CPI R21, 28
    BRSH VERY
    CPI R21, 22
    BRSH HIGHE
    CPI R21, 11
    BRSH NORM
    JMP LOWI
MORETHN20M:               //Determines what weight category to use for 20+ MALE age group
    CPI R21, 25
    BRSH VERY
    CPI R21, 20
    BRSH HIGHE
    CPI R21, 8
    BRSH NORM
    JMP LOWI
FEMALE:                   //Determines what age group to use
    CPI R20, 60
    BRSH OLDERTHN60
    CPI R20, 40
    BRSH MORETHN40
    CPI R20, 20
    BRSH MORETHN20
OLDERTHN60:               //Determines what weight category to use for 60+ FEMALE age group
    CPI R21, 42
    BRSH VERY
    CPI R21, 36
    BRSH HIGHE
    CPI R21, 24
    BRSH NORM
    JMP LOWI
MORETHN40:                //Determines what weight category to use for 40+ FEMALE age group
    CPI R21, 40
    BRSH VERY
    CPI R21, 34
    BRSH HIGHE
    CPI R21, 23
    BRSH NORM
    JMP LOWI
MORETHN20:                //Determines what weight category to use for 20+ FEMALE age group
    CPI R21, 39
    BRSH VERY
    CPI R21, 33
    BRSH HIGHE
    CPI R21, 21
    BRSH NORM
    JMP LOWI
VERY:                     //Turns on all lights for VERY HIGH
    out 0x05, R18
    JMP VERY
HIGHE:                    //Sets register for RED LED for HIGH
    MOV R25, R28
    JMP LP
NORM:                     //Sets register for GREEN LED for NORMAL
    MOV R25, R27
    JMP LP
LOWI:                     //Sets register for BLUE LED for LOW
    MOV R25, R26
    JMP LP
LP:
    out 0x05, R25   //Turns on Selected LED
    CALL DELAY      //DELAYS
    out 0x05, R24   //Turns off Selected LED
    CALL DELAY      //DELAYS
    JMP LP          //LOOPS back to Blink
DELAY:              //DELAY Function
    LDI R29, 255    //Counter
AGAIN1:
    LDI R22, 255
AGAIN:
    NOP
    NOP
    NOP
    DEC R22
    BRNE AGAIN
    DEC R29
    BRNE AGAIN1
    //DEC R23
    RET
