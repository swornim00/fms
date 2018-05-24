/////only reads two sensors //data//
////this is just tests // remaining still developing//

#define pin1 A0
#define pin2 A1
 

void setup() 
{
pinMode(pin1,false);
pinMode(pin2,false);
Serial.begin(9600);
}

void loop() {
  Serial.print(analogRead(pin1));
  Serial.print(",");
  Serial.print(analogRead(pin2));
  Serial.print("\n");
  delay(100);
 
}
