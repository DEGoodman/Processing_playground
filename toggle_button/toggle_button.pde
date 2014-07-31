/*
  Arduino handshake
*/

boolean buttonOn;

void setup() {
  size(200, 200);
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
}  
