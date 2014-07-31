Ball myBall;

void setup(){
  size(500, 500);
  smooth();
  float radius = 25;
  myBall = new Ball( width/2, height-radius, radius);  
   
}

void draw(){
  background(255);
  myBall.render();
  myBall.update();
}


class Ball {
  float radius, w, h;
  float xPos, yPos;
  boolean squeeze, unsqueeze;
   //help to implement 'squishy' behavior
  int bounceInc = 1;
  int bounceMax = 12;
  //motion value, 'speed'
  int inc = -2; 
  
  Ball(float xVal, float yVal, float rad) {
    this.xPos = xVal;
    this.yPos = yVal;
    this.radius = rad;
    squeeze = false;
    unsqueeze = false;
    w = radius *2;
    h = radius *2;
  }  
  
  void render(){
    fill(255, 0, 0);
    ellipse(xPos, yPos, w, h); 
  }  
  
  void update(){
    if (squeeze) {
      if (bounceInc < bounceMax) {
        yPos += inc;
        w += abs(inc);
        h -= abs(inc)*3;
        bounceInc++;
      } else { //bounceInc == bounceMax
        inc = -1*inc;
        squeeze = false;
        unsqueeze = true;
      }
    } else if (unsqueeze) {
      if (bounceInc > 1) {
        yPos += inc;
        w -= abs(inc);
        h += abs(inc)*3;
        bounceInc--;
      } else {
        unsqueeze = false; 
      } 
    } else {
      yPos += inc;
   
      if (yPos <= radius || yPos >= (height-radius)) {
        squeeze = true; 
      }
    }
  }  
}  
