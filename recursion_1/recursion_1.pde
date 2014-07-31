float x, y;
void setup() {
  size(1000, 960);
  noLoop();
  stroke(255, 0, 0);
  background(0);
  x = width/2;
  y = height/2;
}

void draw() {
  drawCircle(width/2, height/2, x+y);
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
