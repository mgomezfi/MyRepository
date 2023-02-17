extern byte val;
extern byte width;
extern byte ascii;

extern "C" { 
  void decode_morse();  
  void NewMexico();
}

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

void flashNewMexico() 
{
  Serial.println("Input the number of times to blink NEWMEXICO:");
  while (!Serial.available()) delay(100);
  int rep = Serial.read()-48;
  Serial.println(rep);
  for (int i = 0; i <= rep; i++){
    NewMexico();
  }
  // You will call the NewMexico() function in assembly
}

void decodeMorse(const String & string, char message[])
{
  int index = 0;
  for( int i = 0; i < string.length(); i++){//Converts the binary to decimal
    if (string.charAt(i) == '-'){
      width++;
      val = val*2+1;
    }else if (string.charAt(i) == '.'){//Converts the binary to decimal
      width++;
      val = val*2;
    }else if (string.charAt(i) == ' ' || string.charAt(i) == '\0'){//If there is a space or null char then it will find the ascii for that morse and then check again if there is a null itwill stop the program altogether
      decode_morse();
      message[index] = ascii;
      index++;
      val = 0;
      width = 0;
    }else if( string.charAt(i) == '\0' ){
      decode_morse();
      message[index] = ascii;
      message[index+1] = '\0';
      val = 0;
      width = 0;
    }
  }
}

void decodeMorse() 
{
  Serial.println("Input a Morse code string (separate the code for characters by a space):");

  while (!Serial.available()) delay(100);
  String string = Serial.readString();

  //String string = ".- -... "; // "01 1000";
  char message[100];

  Serial.print("The Morse code string is: ");
  Serial.println(string);

  decodeMorse(string, message);

  Serial.println(message);
  
  if(strlen(message) > 0) {
    Serial.print("The decoded message is: ");
    Serial.println(message);
  } else {
    Serial.print("Failure in decoding the input Morse code\n");
    Serial.println(message);
  }  
}

void setup() {
  //
  // Initialize serial communications
  //
  Serial.begin(9600);

  flashNewMexico();

  decodeMorse();
  
}

void loop() {
  // put your main code here, to run repeatedly:
  delay(20000); // 20,000 millisecs == 20 seconds
  Serial.println("*");
}
