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
    .extern delay

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
