import processing.serial.*;
import fsr;


Serial serial;

int x1 =0;
int x2 = 400;
float inByte1 = 0;
float inByte2 = 0;
float pressed = 0;


void setup()
{
  size(800,1024);
  println(Serial.list());
  serial = new Serial(this , "/dev/ttyACM0",9600);
  serial.bufferUntil('\n');
  
  
  background(0);
  fill(100);
  rect(0,0,400,1024);
}
void draw()
{
      pressed = map(inByte2,0,1024,0,255);
      fill(pressed,0,0);
      ellipse(40,15,10,15);
      
  
   stroke(0,200,0);
   line(x1,1024,x1,1024-inByte1);
   
   if(x1>=400)
   {
     x1 = 0;
     fill(100);
     rect(0,0,400,1024);
   }
   x1++;
   stroke(0,0,200,200);
   line(x2,1024,x2,1024-inByte2);
   if(x2>= 800)
   {
     x2 = 400;
     fill(100);
     rect(400,0,400,1024);
   }
   x2++;
  }
void serialEvent(Serial serial)
{
  String inString = serial.readStringUntil('\n');
  if(inString != null)
  {
    inString = trim(inString);
    float[] nums = float(split(inString,","));
    println("first Sensor value"+nums[0]);
    println("Second Sensor value"+nums[1]);
    inByte1 = float(inString);
   // println(inByte1);
    inByte1 = map(nums[0],0,1024,0,1024);
    inByte2 = map(nums[1],0,1024,0,1024);
  }
}
