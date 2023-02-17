#include "avr/interrupt.h" 
extern "C"{
  void initSensor();
  byte readSensor(byte);  
}
void setup() {

  Serial.begin(9600);
  // Assume that our arduino device has XTAL = 10 Mhz
  // Unlike using Timer1 to cause a 1 second delay, we do not need to use a MonitorLoop
  // to keep checking if the timer/counter has finished counting.
  // Devices that have the ability to trigger interrupts come with additional hardware,
  // that do the job of counting, that is, your device is free to process other operations.

  // Fortunately, our Arduino does come with interrupt ability. However, it still uses 
  // built-in timers/counters (Timer0, Timer1 and Timer2) to do the counting.
  
  // In our earlier example on Timer, we used Normal mode, this time around we will be 
  // using CTC mode to program a Timer1 based interrupt.

  // The math is the same, the 'magic' number is 39063 with a pre-scaler of 256. However,
  // since we are using CTC mode, we can directly store 39063 - 1 to OCR1A. Also, to enable
  // CTC mode, we need to set the WGM12 bit (or flag) in TCCR1B to 1.

  TCCR1A = 0;
  TCCR1B = 0b00001100; // WGM12 = 1 and CS12 = 1
  OCR1A = 62500;

  // Now to enable Timer1 based interrupt, we would have to enable the OCIE1A bit in TIMSK1 and the 'I'
  // bit in SREG (achieved through sei()).
  TIMSK1 = 0b00000010; // OCIE1A = 1
  sei();

  // Our Timer1 based interrupt has now been enabled. As soon as the timer runs out, the program execution
  // would directly jump to the interrupt service routine (ISR) and execute its content.
  // Unless we reset OCR1A to 0 in ISR, an interrupt would occur every 1 second and thus, the contents of ISR 
  // will be executed every 1 second.
}

void loop() {

  // Do nothing but printing three asterisks.
 // Serial.println("***");
  
}

// Interrupt Service Routine with TIMER1 OCR1A vector setup
ISR(TIMER1_COMPA_vect){

  
  // we will continuously print "1 second delay using Timer1 based interrupt on a 10 Mhz device" 
  // every second.
  //Serial.println("1 second delay using Timer1 based interrupt on a 10 Mhz device");
  byte v;
  v = readSensor(2); // call assembly to read sensor value, A/D pin #2         
  Serial.print(" light = ");
  Serial.println(v,HEX);
  
}
