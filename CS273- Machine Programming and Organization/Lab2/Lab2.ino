
//
// Declare the things that exist in our assembly code
//
/*
extern "C" { 
  byte x1;
  byte x2;
  byte x3;
  void lightup();
}
*/

extern byte x1, x2, x3;
extern "C" void lightup(void);

//
// function to read a 2-digit decimal value from user
//
byte read2DigitValue()
{
  byte inch; int val;
  Serial.println("Enter a 2-digit decimal value:");
  while (!Serial.available()) delay(100);
  inch = Serial.read();
  val = (inch - '0') * 10;
  while (!Serial.available()) delay(100);
  inch = Serial.read();
  val += (inch - '0');
  Serial.print("The value entered is ");
  Serial.println(val,DEC);
  return (byte) val;
}

//
// Arduino-required setup function (called once)
//
void setup()
{
  //
  // Initialize serial communications
  //
  Serial.begin(9600);

  //
  // Turn off pin 13 on PORTB
  //
  pinMode(13, OUTPUT);
  digitalWrite(13, LOW);
  
  //
  // Read three values from user, store in global vars
  //
  x1 = 0;
  x2 = 0;
  x3 = 0;
  
  //
  // Call our assembly code
  //
  lightup();
  
  //
  // print out value of x2 variable
  Serial.println("After lightup()");
  Serial.print("The value is ");
  Serial.println((int) x3,DEC);
}

//
// Arduino-required loop function (called indefinitely)
//
void loop()
{
  delay(20000); // 20,000 millisecs == 20 seconds
  Serial.println("*");
}
