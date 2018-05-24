///better not look for this as it is just an experiment

package fsr;

public class Fsr
{
  PImage img;
  
  Fsr(int x,int y,int l)
  {
    img = loadImage("foot1.jpg");
    image(img,0+x,0+y,100+l,100+l);
  }
}
