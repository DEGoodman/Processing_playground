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
    strokeWeight(sqrt(abs(pow((pmouseX+pmouseY),2) - pow((mouseX+mouseY),2))/2));
    line(mouseX, mouseY, pmouseX, pmouseY);
    hueVal = int(mouseX%256);
  }
}  

void keyPressed(){
 background(0); 
}  
