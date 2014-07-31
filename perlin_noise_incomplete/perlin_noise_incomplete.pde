
/*

how to save a screenshot:
void keyPressed() {
  if (keyCode == ENTER) {
    saveFrame("screen-####.jpg"); //processing will replace '#'
  }  
}  

*/

//random variance
// forn natural-looking rondomness

size(500, 100);
background(255);
stroke(0,255,0);
strokeWeight(3);
float lastX = -999;
float lastY = -99;
float y=50;
float seedNoise = random(10);

//perlin noise bounds output, provides naturalistic random variance
// noise() is between 0 and 1, must be scaled appropriately
for(int x = 20; x <=480; x+=10) {
  y += 10 - (noise(seedNoise)*20); //variance 
  if(lastX != -999) {
    line (x, y, lastX, lastY);
  }  
  lastX = x;
  lastY = y;
  seedNoise += .8; // need to increment seedNoise
}  



//or something like that

