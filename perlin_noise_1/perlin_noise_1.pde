float[] xPos, yPos;
final int NUMLINES = 300;
float tnoise;
float twitch;

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
  tnoise = random(10);
}

void draw() {
  background(0);

  for (int y = 0; y < NUMLINES; y++ ) {
    twitch = 30 - (noise(tnoise)*60);
    line (width/2, height/2, xPos[y] + twitch, yPos[y]+ twitch);

  }
  tnoise += 0.01;

}
