/*
  Arduino handshake 
  from sparkfun tutorial
*/
import processing.serial.*;
Serial myPort;
boolean buttonOn;


void setup() {
  size(200, 200);
  println(Serial.list()); // for debugging
  String portName = Serial.list()[0]; //may need different port
  myPort = new Serial(this, portName, 9600);
  buttonOn = false;
}

void draw() {
  if(!buttonOn) {
    background(0,0,255);
  } else {
    background(255,0,0);
  }  
}   

void mouseClicked() {
  buttonOn = !buttonOn;
  
  if(buttonOn) {
    myPort.write('1');
    println('1');
  } else {
    myPort.write('0');
    println('0');
  }  
}  
