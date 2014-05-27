boolean start;
boolean ptOne;
boolean ptTwo;

int faderBack;
float fadeIn;

int hue;
float x;
float y;
float directionX = 1;
float directionY = -1;
float speed = 1;

void setup(){
  size(600, 600, P2D);
  background(255);
  smooth();
  noStroke();
  start = false;
  fill(0, 102, 153, 51);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("Press me to begin PART 3", 300, 300);
  ptOne = true;
  ptTwo = false;
  faderBack = 255;
  fadeIn = 0;
  int x = 0;
  int y = 0;
}

void draw(){
  if (start != false) {
    if(faderBack > 0){
      faderBack = faderBack - 5;
    }
    background(faderBack);
    // fade in guitar (ptOne)
    if (ptOne == true){
      fadeIn = fadeIn + 5.0;
      guitar(fadeIn);
    }
    // check if image is loaded, begin part two
    if(faderBack <= 0 && fadeIn >= 255 && ptOne == true) {
      ptOne = false;
      ptTwo = true;
      delay(2500);
    }  
    
    //animate guitar(ptTwo)
    if(ptTwo == true) {
      // the following four lines are from processing.org
      colorMode(HSB);
      if (hue >= 255)  
        hue=0;  
      else  
        hue++;
      
      x += speed * directionX;
      y += speed * directionY;  
      //see if top of guitar hits top of screen
      // top point starts at 30px
      if (30 + y <= 0)
        directionY = -directionY;
      //see if bottom of guitar hits bottom of scree
      if (577 + y >= height)
        directionY = -directionY;
      // check right side of screen
      if (400 + x >= width)
        directionX= -directionX;
      //check left
      if(200 + x <= 0)
        directionX= -directionX;
      //draw guitar, with changing coordinates
      noStroke();
      //body
      fill(hue, 255, 255);
      ellipse(300+x, 490+y, 200, 175);
      ellipse(300+x, 420+y, 145,130);
      //tone hole
      fill(0);
      ellipse(300+x, 440+y, 70, 70);
      //string holder
      fill(hue, 255, 255);
      rect(275+x, 500+y, 50, 10, 2);
      //neck
      rect(280+x, 100+y, 40, 265, 2);
      // head
      fill(hue, 255, 255);
      rect(267+x, 30+y, 66, 70, 8);
      // strings
      stroke(245);
      line(280+x, 80+y, 285+x, 100+y);
      line(280+x, 40+y, 295+x, 100+y);
      line(320+x, 40+y, 305+x, 100+y);
      line(320+x, 80+y, 315+x, 100+y);
      line(285+x, 100+y, 285+x, 505+y);
      line(295+x, 100+y, 295+x, 505+y);
      line(305+x, 100+y, 305+x, 505+y);
      line(315+x, 100+y, 315+x, 505+y);
      noStroke();
      loop();
    }  
  }  
}  

void mousePressed(){
  if (start != true){
     start = true;
     background(255);
     loop();
   }
}   

// static guitar image
void guitar(float alpha){
  noStroke();
  //body
  fill(255, 215, 0, alpha);
  ellipse(300, 490, 200, 175);
  ellipse(300, 420, 145,130);
  //tone hole
  fill(0, alpha);
  ellipse(300, 440, 70, 70);
  //string holder
  fill(139,69,19, alpha);
  rect(275, 500, 50, 10, 2);
  //neck
  rect(280, 100, 40, 265, 2);
  // head
  fill(44, 22, 6, alpha);
  rect(267, 30, 66, 70, 8);
  // strings
  stroke(240, alpha);
  line(280, 80, 285, 100);
  line(280, 40, 295, 100);
  line(320, 40, 305, 100);
  line(320, 80, 315, 100);
  line(285, 100, 285, 505);
  line(295, 100, 295, 505);
  line(305, 100, 305, 505);
  line(315, 100, 315, 505);
  noStroke();
  loop();
}
