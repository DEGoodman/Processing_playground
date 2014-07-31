int hueVal;

void setup(){
  size(800, 800);
  smooth();
  background(0);
  colorMode(HSB);
  hueVal = 0;
}

void draw(){
  if(mousePressed){
    stroke(hueVal, 140, 240);
    strokeWeight(sqrt(abs(pow((pmouseX+pmouseY),2) - pow((mouseX+mouseY),2)))/4);
    line(mouseX, mouseY, pmouseX, pmouseY);
    hueVal = int(sqrt(pow((mouseX+mouseY),2))%256);
  }
}  

void keyPressed(){
 background(0); 
}  
