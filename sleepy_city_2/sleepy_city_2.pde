/**
* A generative city night sky
*
* galaxy cluster code based on 
*   Processing, Creative Coding and Generative Art in Processing 2,
*     noise.pde, chapter 9
*
* Author: D. Erik Goodman
*/

import processing.opengl.*;

Star[] stars;
Building[] buildings;

// sky variables
float rot;
float h = 30;
float size;
int hue;

// end sky

void setup(){
  size(800, 500);
  smooth();
  noFill();
  colorMode(HSB);
  stroke(0.5);
  frameRate(15);
  size=10;
  rot = 0;
  hue = int(random(360));
  background(0);
  
  buildings = new Building[45]; //populate 50 buildings
  for(int b = 0; b < 45; b++) {
    buildings[b] = new Building();
  }

  stars = new Star[10000]; //populate stars
  for(int s = 0; s < 10000; s++) {
    stars[s] = new Star();
  }  
}  

void draw(){
  noStroke();
  background(160, 200, 50);
  
  //move star field (which is a larger canvas than display), and rotate
  translate(-943.4, 0); //magic numbers
  rotate(rot);
  for (Star s : stars)
    s.render();
  rot -= PI/21600;

  // counteract star rotation, so buildings don't move
  rotate(-rot); 
  // reposition buildings to center of visible screen
  translate(943.4, 0);
  for(Building b : buildings) {  // occasionally flickers building outline
    int toStroke = floor(random(100));
    if(toStroke < 99)
      noStroke();
    b.render();
  }
  rotate(rot);
}  

class Star{
  int hue;
  float rad, xPos, yPos;
  Star(){
    
    this.hue = floor(random(361)); 
    
    //to rotate stars, must be on a larger screen; 'star' screen is 1886.8x1886.8 
    this.xPos = random(1887);
    this.yPos = random(1887);
    
    //change below for diff size stars
    int radius = int(random(50));
    if(radius <= 40) 
      this.rad = 2;
    else if(radius > 40 && radius <= 47)
      this.rad = 4;
    else if(radius > 47 && radius < 49)
      this.rad = 6;
    else 
      this.rad = 10;
  }  
  
  void render(){
    smooth();
    // star color, flickr
    int twinkle = int(random(50)) + 1;
    fill(hue, 15, 255);
    if(twinkle < 49)
      ellipse(xPos, yPos, rad*1.2, rad*1.2);
    else 
      ellipse(xPos, yPos, rad, rad);
  }  
}  

class Building{
  int hue;
  float h, w, xPos, yPos;
  
  Building(){
    // each building has own color
    //colorMode(HSB);
    this.hue = floor(random(361)); 

    this.h = random(150) + 50;    
    this.w = h/3; // all buildings are strictly 1/3 as wide as they are tall
    
    this.xPos = random(width + 60) - 30; //buildings can hang off-screen    
    this.yPos = height - h; // move bottom of buildings to bottom of screen;
  }
  void render(){
    int toStroke = floor(random(1000));
    if(toStroke < 999)
      stroke(hue, 30, 240);
    fill(hue, 19, 180); // buildings are solid, dark grey with some color
    rect(xPos, yPos, w, h);
  }  
}
