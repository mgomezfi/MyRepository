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


;;

;;  AVR code to do the function of the 4 x 7 segment display of Lab 5
;;
;;
;;   Shaun Cooper
;;    CS 273
;;    Semester XXXX , 20XX
;;    Modified by Dr. Joe Song and Sajal Kumar
;;
;;  The basic algorithm is to have the main loop
;; set some shared variable values
;;  we then use simulataneous arrays (vectors)
;;  to figure out which digit among the 4 segments is desired 
;;; and which number is to be displayed
;;
;;  Since our setup utilizes PORTD and PORTB, we need to maintain
;;  simulataneous vectors for all of the digits/numbers that are neededed
;;
;; main routine does
;;   setup_ports once
;; 
;;   C code to do the following

;;   digit=1
;;   number=9
;;   show_number();; will display 9 on digit 1, for example
;;  
  .data
  .size digit_table, 4
  .size portb_table, 10
  .size portd_table, 10
  
digit_table:  #binary for seting input on PORTB for digit select
    .byte 0b00011100, 0b00011010, 0b00010110, 0b00001110
    
    ;     9           10          11          12
portb_table:  # list of binary numbers for setting port B to be ORed with digit table
    .byte 0,  0,  1,  1,  1,  1,  1,  0,  1,  1
    
    ;     0   1   2   3   4   5   6   7   8   9
portd_table: # list of binary numbers for setting port D.
    .byte  0b11111100, 0b00011000, 0b01101100, 0b00111100, 0b10011000, 0b10110100, 0b11110000, 0b00011100, 0b11111100, 0b10011100

    ;      0           1           2           3           4           5           6           7           8           9

  
  .comm digit, 1 ;; the common name for digit
  .comm number, 1 ;; the common name for number
  .comm check, 1  ;;
  .comm check1, 1 ;;
  .global number, digit, check, check1

  

# --------
  .text
  .global setup_ports
  .global show_number
  .global select_digit



setup_ports:  ;; routine to set the ports into output mode

  LDI R16, 0b11111111
  OUT 0x0A, R16;; 
  ;;OUT 0x0B, R16;; set PORT D

  LDI R18, 0b11111111
  OUT 0x04, R18
  ;;OUT 0x05, R18
  
  ret ;; of setup_ports


select_digit: ;; routine to select the correct digit among the four segments

  ;; use "digit" to find the values that need to be sent to
  ;; PORTB.

  LDI R31, hi8(digit_table)
  LDI R30, lo8(digit_table)
  
  LDS R16, digit
  LDI R17, 0x00
  LDI R18, 0X01
  LD R25, Z+
  CHECK:
    CP R17, R16
    BREQ FOUND
    JMP loop1
  loop1:
    LD R25, Z+
    ADD R17, R18
    JMP CHECK
  FOUND:
    STS check, R25
    ;;OUT 0x04, R25
    OUT 0x05, R25
    ret ;; of select_digit


show_number:  ;;  main entry point for setting a segment in the 4x7 segment

  pushall
  
  ;; call select_digit to choose the correct "digit" on the segment  
  CALL select_digit
  ;; use "number" to find the values that need to be sent to 
  ;; PORTB and PORTD.


  LDI R29, hi8(portd_table)
  LDI R28, lo8(portd_table)

  LDI R27, hi8(portb_table)
  LDI R26, lo8(portb_table)

  LD R18, X+
  LD R19, Y+

  LDS R20, number

  LDI R17, 0x00
  LDI R16, 0X01
  CHECKING:
    CP R17, R20
    BREQ FOUND1
    JMP loop2
  loop2:
    LD R19, Y+
    LD R18, X+
    ADD R17, R16
    JMP CHECKING
  FOUND1:
    CPI R18, 0
    breq clearbit
    SBI 0X05, 0
    jmp finally_done

  clearbit:
    CBI 0X05, 0

  finally_done:
    ;;out 0x0A, R19
    out 0x0B, R19
    STS check1, R19
    popall
  
  ret ;; of show_number
