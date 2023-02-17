
.equ TCNT1H, 0x0085
.equ TCNT1L, 0x0084
.equ TCCR1A, 0x0080
.equ TCCR1B, 0x0081
.equ TIFR1, 0x0036

.data
.text
.global waitOneSecondOn10MhzDevice

waitOneSecondOn10MhzDevice:

  # our first objective is to figure out the number 'x', such that:
  # when we put 65536 - x into TCNT1, with pre-scalers, it is able to
  # produce a delay of 1 second on a 10 Mhz Arduino device.

  # To calculate, let us understand another interpretation of XTAL = 10 Mhz
  # one interpretation of XTAL = 10 Mhz means that this device runs 
  # 10 million machine cycles in 1 second. 
  
  # Thus, if we wanted to delay for one second we would have to count upto
  # 10 million in machine cycles, that is, TCNT1 = 65536 - 10,000,000.
  # However, we cannot do that, since we do not want a negative number in TCNT1.
  # We want a number that is less than 2^16 (since TCNT1 is 16 bits in size) 
  # Does that mean we cannot delay for 1 second?

  # This is where pre-scalers come into the picture. The idea behind pre-scalers
  # is as follows: instead of saying 1 machine cycle = 1 count, we instead group 
  # several machine cycles toghether and call it 1 count. For example, a pre-scalar
  # of 64 translates to 64 machine cycles = 1 count. This is nice because with a
  # pre-scalar of (say) 64, TCNT1 = 65536 - (10,000,000 / 64) = 65536 - 156250 will
  # produce a delay of 1 second. However, 156250 is still to large for TCNT1.
  # Let's use a pre-scalar of 256, then 256 machine cycles = 1 count and 
  # TCNT1 = 65536 - (10,000,000 / 256) ~= 65536 - 39063 (approximately).
  # 39063 is perfect as it can now fit in TCNT1. Thus, we convert 39063 to hex (0x9897)
  # and store the high byte into TCNT1H, and the low byte into TCNT1L.

  LDI r20, 0x98
  STS TCNT1H, r20

  LDI r20, 0x97
  STS TCNT1L, r20

  # However, we also need to let our system know that we are going to be using a 
  # pre-scalar of 256. We convey this information by CS12, CS11 and CS10 bits in TCCR1B.
  # A quick look at the data-sheet (the attached pdf in Lab 6), tells us that: CS12 = 1,
  # CS11 = 0 and CS10 = 0 will enable a pre-scalar of 256.
  # Also, we do not need to enable any bits in TCCR1A.

  LDI r20, 0
  STS TCCR1A, r20

  LDI r20, 0b00000100
  STS TCCR1B, r20

  # With that setup we have succesfully activated the timer, we now need to monitor the TOV1
  # bit (bit 0) in TIFR1.
  
  MonitorLoop:
    LDS r18, TIFR1
    SBRS r18, 0
    jmp MonitorLoop

  # once we exit MonitorLoop, we have succesfully delayed for 1 second on a 10 Mhz machine, 
  # we now need to deactivate the timer by setting the TOV1 bit in TIFR1 to 1 and both TCCR1B
  # and TCCR1A to 0.

  LDI r20, 0b00000001
  STS TIFR1, r20

  LDI r20, 0
  STS TCCR1A, r20
  STS TCCR1B, r20
 
  ret


  waitOneSecond:

  LDI r20, 0x3D
  STS TCNT1H, r20
  LDI r20, 0x08
  STS TCNT1L, r20
  LDI R20, 0x00
  STS TCCR1A, R20
  LDI R20, 0X5
  STS TCCR1B, R20
AGAIN:
  LDS R18,TIFR1
  SBRS R18,0
  JMP AGAIN
  LDI R19, 0x00
  STS TCCR1B, R19
  STS TCCR1A, R19
  LDI R20, 0x02
  OUT TIFR1, R20
  ret

