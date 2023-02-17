
#
# Global data (x1, x2, and x3)
#
    .data
    .comm x1,1
    .global x1
    .comm x2,1
    .global x2
    .comm x3,1
    .global x3

#
# Program code (addition function)
#
    .text
    .global lightup
lightup:
    ldi r18, 0b00110001
    out 0x04, r18
    out 0x05, r18
    ret
    
