float x, y;
int direction = 1;
float vx = 0.7;
void setup() {
  size(1000, 960);
  //noLoop();
  stroke(255, 0, 0);
  background(0);
  x = width/2;
  y = height/2;
}

void draw() {
  fill(0, 50);
  rect(0, 0, width, height);
  if( x > 600 || x < 400) {
    direction = -direction;
    //vx = -vx;
  }  
  drawCircle(width/2, height/2, x+y);
  x = x*vx*direction;
  y--;
}  

void drawCircle(float x, float y, float dia) {
  noFill();
  ellipse(x, y, dia, dia);
  
  if (dia > 6) {
    drawCircle(x + dia, y, dia*0.5);
    drawCircle(x - dia, y, dia*0.5);
    drawCircle(x, y + dia, dia*0.5);
    drawCircle(x, y - dia, dia*0.5);
  }  
}  
