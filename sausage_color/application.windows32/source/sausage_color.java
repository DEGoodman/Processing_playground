import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sausage_color extends PApplet {

int hueVal;

public void setup(){
  size(800, 800);
  smooth();
  background(0);
  colorMode(HSB);
  hueVal = 0;
}

public void draw(){
  if(mousePressed){
    stroke(hueVal, 140, 240);
    strokeWeight(sqrt(abs(pow((pmouseX+pmouseY),2) - pow((mouseX+mouseY),2))/2));
    line(mouseX, mouseY, pmouseX, pmouseY);
    hueVal = PApplet.parseInt(mouseX%256);
  }
}  

public void keyPressed(){
 background(0); 
}  
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sausage_color" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
