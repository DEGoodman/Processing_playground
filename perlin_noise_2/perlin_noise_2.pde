float[] xPos, yPos;
final int NUMLINES = 300;
float tnoiseX;
float tnoiseY;
float twitchX;
float twitchY;

void setup() {
  size(500,500);
  smooth();
  stroke(255);
  strokeWeight(1); 
  
  xPos = new float[NUMLINES];
  yPos = new float[NUMLINES];
  
  for (int x = 0; x < NUMLINES; x++) {
    xPos[x] = random(width);
    yPos[x] = random(height);
  }
  tnoiseX = random(10);
  tnoiseY = random(10);
}

void draw() {
  background(0);

  for (int y = 0; y < NUMLINES; y++ ) {
    twitchX = 50 - (noise(tnoiseX)*100);
    twitchY = 30 - (noise(tnoiseY)*60);
    line (width/2, height/2, xPos[y] + twitchX, yPos[y]+ twitchY);

  }
  tnoiseX += 0.01;
  tnoiseY += 0.01;

}
