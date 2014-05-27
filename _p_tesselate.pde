boolean start;

void setup(){
  size(600, 600, P2D);
  background(255);
  smooth();
  noStroke();
  fill(0, 102, 153, 51);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("Press me to begin PART 1", 300, 300);
  start = false;
}  

void draw(){
  if (start != false) {
    // PART ONE executes
     delay(100);
     background(0);
     for (int i = 0; i < 13; i++){
        for (int j = 0; j < 13; j++){
          drawPattern( i, j);
        }
     }
  }   
}  

void mousePressed(){
  if (start != true){
     start = true;
     background(0);
     loop();
   }
}  

// draw repeating background pattern
void drawPattern (int xShift, int yShift) {
  float colorShift = random(30);
  float a = 10;
  a = random(20) + 230; // make it shimmer! 
   
  fill(244, 238, 225+colorShift, a);
  beginShape();
  vertex(-10+(50*xShift), -10+(50*yShift) + (2*yShift));
  vertex(-25+(50*xShift) + (4*xShift), 15+(50*yShift));
  vertex(-10+(50*xShift), 40+(50*yShift));
  vertex(50+(50*xShift), 40+(50*yShift)- (4*yShift));
  vertex(35+(50*xShift)+ (4*xShift), 15+(50*yShift));
  vertex(50+(50*xShift), -10+(50*yShift));
  endShape();
}
