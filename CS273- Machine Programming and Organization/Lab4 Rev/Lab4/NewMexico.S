.macro pushall
push r16
push r17
push r18
push r19
push r20
push r21
push r22
push r23
push r24
push r25
push r26
push r27
push r28
push r29
push r30
push r31
.endm ; of pushall

.macro popall
pop r31
pop r30
pop r29
pop r28
pop r27
pop r26
pop r25
pop r24
pop r23
pop r22
pop r21
pop r20
pop r19
pop r18
pop r17
pop r16
.endm ; of popall

.extern delay
.text
.global NewMexico

NewMexico:

    # N
    call N
    # E
    call E
    # W
    call W
    # M
    call M
    # E
    call E
    # X
    call X
    # I
    call I
    # C
    call C
    # O
    call O
    ret

N:
  call longBlink
  call shortBlink
  ret

E:
  call shortBlink
  ret

W:
  call shortBlink
  call longBlink
  call longBlink
  ret

M:
  call longBlink
  call longBlink
  ret

X:
  call longBlink
  call shortBlink
  call shortBlink
  call longBlink
  ret

I:
  call shortBlink
  call shortBlink
  ret

C:
  call longBlink
  call shortBlink
  call longBlink
  call shortBlink
  ret

O:
  call longBlink
  call longBlink
  call longBlink
  ret

shortBlink:
  call lightsOn
  call shortDelay
  call lightsOff
  call shortDelay
  ret

longBlink:
  call lightsOn
  call longDelay
  call lightsOff
  call longDelay
  ret

lightsOn:
  ldi r18, 0b00100000
  out 0x04, r18
  out 0x05, r18
  ret

lightsOff:
  ldi r19, 0b00000000
  out 0x04, r19
  out 0x05, r19
  ret

shortDelay:
  pushall
  ldi  R22, 0xF4
  ldi  R23, 0x00
  ldi  R24, 0x00
  ldi  R25, 0x00
  call delay
  popall
  ret

longDelay:
  pushall
  ldi  R22, 0xE8
  ldi  R23, 0x03
  ldi  R24, 0x00
  ldi  R25, 0x00
  call delay
  popall
  ret
