int hVal;
int timeTracker;
int xPos;
int yPos;
int yDirection;

void setup(){
  size(500, 500);
  colorMode(HSB);
  timeTracker = millis();
  smooth();
  xPos = width/2;
  yPos = height - 30; //because of ellipse sizes below 
  yDirection = -1;
}

void draw(){
  if(millis() >= timeTracker + 500){
    hVal = int(random(256));
    background(hVal, 95, 190);
    timeTracker = millis();
  }
  fill(0);
  background(hVal, 95, 190);
  ellipse(xPos, yPos, 60, 60);
  if(yPos <= 0) {
    yDirection = 1;
    yPos += (yDirection * 5);
  }
  else if(yPos >= height) {
    yDirection = -1;
    yPos += (yDirection * 5);
  } 
  else {
    yPos += (yDirection * 5);
  }  
}
