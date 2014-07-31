int loop;
int randX;
int randY;
int ell_size;
int r;
int g;
int b;
int timeDelay;

void setup(){
  size(600, 600);
  noStroke();
  loop = 0; 
  frame.setResizable(true);
  timeDelay = 2000;
}  

void draw(){
  if(timeDelay >= 0) {
    delay(timeDelay);
    timeDelay -= 50;
  }  
    println(loop);
    randX = int(random(width*0.93)) + int(width*0.04); // keep circle center inside border
    randY = int(random(height*0.93)) + int(height*0.04);
    ell_size = int(random(width / 2.5));//random circle size
    //color circle
    r = int(random(256));
    g = int(random(256));
    b = int(random(256));
    fill(r,g,b,70);
    ellipse(randX, randY, ell_size, ell_size);
    loop++;
}  
