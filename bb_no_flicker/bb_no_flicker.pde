int eSize = 200;
float yPos,xPos, eWidth, eHeight;
int inc = -2;
int bounceInc = 1;
int bounceMax = 12;
boolean squeeze;
boolean unsqueeze ;

void setup() {
 size(500,500);
 smooth();
 noStroke();
 yPos = height-(eSize/2);
 xPos = width/2;
 eHeight = eSize;
 eWidth = eSize;
 squeeze = false;
 unsqueeze = false;
 fill(0,30,250);
}

void draw() {
 background(0, 200, 90);
 if (squeeze) {
   if (bounceInc < bounceMax) {
     yPos += inc;
     eWidth += abs(inc);
     eHeight -= abs(inc)*3;
     //ellipse(xPos, yPos, eWidth, eHeight);
     bounceInc++;
   } else { //bounceInc == bounceMax
     inc = -1*inc;
     squeeze = false;
     unsqueeze = true;
   }
 } else if (unsqueeze) {
   if (bounceInc > 1) {
     yPos += inc;
     eWidth -= abs(inc);
     eHeight += abs(inc)*3;
     //ellipse(xPos, yPos, eWidth, eHeight);
     bounceInc--;
   } else {
    unsqueeze = false; 
   }
 } else {
   //ellipse(xPos, yPos, eWidth, eHeight);
   yPos += inc;
   
   if (yPos == eSize/2 || yPos == (height-eSize/2)) {
      squeeze = true; 
   }
 }
 ellipse(xPos, yPos, eWidth, eHeight);
}
