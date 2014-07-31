/** L-system key:
 *    prevX + a = cos(theta) * h
 */
 
final float SCALE = 0.72;
final float DEG_DELTA = 22;
int gVar = 20;
void setup() {
  size(800, 800);
  noLoop();
  background(255);
  strokeWeight(10);
}

void draw() {
  drawBranch(width/2, height - 10, 120, 90, 7, gVar);
}  

void drawBranch(float x, float y, float len, float angle, float str, int col ) {
  if(len > 3) { //determine base case
    // calculate end points 
    float endX = x + len*cos(radians(angle)); //processing uses radians!
    float endY = y - len*sin(radians(angle));
    //draw our current line
    float strF = (str <= 0) ? 1 : str;//turnary operator
    strokeWeight(strF);
    str--;
    stroke(0, col, 0, 220);
    col+=7;
    line(x, y, endX, endY);
    //make recursive call
    drawBranch(endX, endY, len*SCALE, angle + DEG_DELTA, str, col); //left branch
    drawBranch(endX, endY, len*SCALE, angle - DEG_DELTA, str, col); //right branch
    
  }  
}  
