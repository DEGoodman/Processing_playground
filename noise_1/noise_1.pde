float rot;
float h = 30;
float size;
int hue;

void setup(){
 size(500, 500);
  smooth();
  noFill();
  stroke(0.5);
  background(0);
  frameRate(10);
  size=10;
  rot = 0;
  hue = int(random(360));
  
  colorMode(HSB);
}  

void draw() {
 
  //stroke(255, 90);
  
  //*************   method 1
  stroke(262, 62, 99);
  rect(width/2 - 20, height/2 - 20, 40, 40);
  
  //*************   method 2
  stroke(hue, 130, 220);
  translate(width/2, height/2);
  rotate(rot);
  rect(20,20,size,size);
  rot -= PI/18;
  rot += 3*PI/4;
  
  hue += 4;
  
  if (hue >= 360)
   hue = 0;
  size++;
}  
