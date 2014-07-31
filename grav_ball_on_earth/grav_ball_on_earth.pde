//bouncing ball, subject to earth's gravity

/*
      NOTE: severe screen flickering at end
*/


int hueVal;
float xpos = 10;
int xdirect = 1;
float ypos = 50;
float vy = 0;
float gravity = 0.98;
float bounce = -1;
int fade = 220; //only used at program end

void setup(){
  size(800,800);
  colorMode(HSB);
  smooth();
  noStroke();
}

void draw(){
  fill(0);
  background(hueVal, 130, 220);
  //check left and right walls
  if (xpos >= width)
    xdirect = -1;
  if (xpos <= 0)
    xdirect = 1;
  xpos += 3*xdirect;
  ellipse(xpos, ypos, 60, 60);
  vy += gravity; //change speed
  ypos += vy; // change position
  
  //check if ball is done bouncing, fade screen
  if(ypos > height - 25 && vy < 2) {
    background(hueVal, 130, fade);
    fade -= 5;
  }  
  else if(ypos > height - 25) { //bounce if near floor
    vy *= bounce;
    hueVal = int(random(256)); // change background color on bounce
  }
}
