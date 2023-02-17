
.equ DIDR0, 0x007E
.equ ADMUX, 0x007C
.equ ADCSRA, 0x007A
.equ ADCH, 0x0079
.equ TCNT1H, 0x0085
.equ TCNT1L, 0x0084
.equ TCCR1A, 0x0080
.equ TCCR1B, 0x0081
.equ TIFR1, 0x0036

.data
.text
  .global initSensor
  .global readSensor
  .global waitOneSecond
  ;;.comm pin, 1;;

initSensor:
  ldi r18, 0b00111111
  sts DIDR0, r18
  ldi r18, 0b10000111
  sts ADCSRA, r18
  ret
  
readSensor:

  ldi r18, 0b01100000
  add R18, R24
  sts ADMUX, r18
  lds r18, ADCSRA
  ldi r19, 0b01000000
  OR r18, r19
  sts ADCSRA, r18
  loop1:
    lds r18, ADCSRA
    SBRC r18,6
    jmp loop1
    lds r24, ADCH
    clr r25
    
  
  ret
  
waitOneSecond:

  LDI r20, 0xC2
  STS TCNT1H, r20

  LDI r20, 0xF8
  STS TCNT1L, r20

  LDI r20, 0
  STS TCCR1A, r20

  LDI r20, 0x5  
  STS TCCR1B, r20
  
  MonitorLoop:
  LDS r18, TIFR1
  SBRS r18, 0
  jmp MonitorLoop

  LDI r20, 0b00000001
  STS TIFR1, r20

  LDI r20, 0
  STS TCCR1A, r20
  STS TCCR1B, r20
 
  ret
