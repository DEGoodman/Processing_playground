/**
 * Dynamic music player with video interpretation
 *
 * Author: D. Erik Goodman
 *
 * video interpretation based on Daniel Shiffman's 'Mirror2'
 */

// Audio stuff
import ddf.minim.*;

Minim minim;
AudioPlayer song;
AudioInput input;

//end Audio bits

// Video stuff
import processing.video.*;

// Size of each cell in the grid
int cellSize = 13;
// Number of columns and rows in our system
int cols, rows;
// Variable for capture device
Capture video;

//image essentials
PImage img;

int songClass;
int songNum;
int tempClass;
boolean start;
int hue;
int imgNum;
int barWidth = 20;
int lastBar = -1;
boolean clicked;
int barHue;

void setup() {
  size(1024, 768, P2D);
  if (frame != null) {
    frame.setResizable(true);
  }

  frameRate(30);
  cols = width / cellSize;
  rows = height / cellSize;

  video = new Capture(this, width, height);
  background(255);
  smooth();
  noStroke();
  fill(0, 102, 153, 51);
  textSize(40);
  textAlign(CENTER, CENTER);
  text("Press me to listen", 512, 360);
  start = false;
  //start program in random song location
  songClass = int(random(4));
  songNum = int(random(9));
  imgNum = int(random(14)); 
  //println(songClass);
  //println(imgNum);
  hue = int(random(361));
  img=loadImage("images/"  + songClass + "/" + imgNum + ".jpg");
  img.resize(width, height);
  colorMode(HSB, 360, 100, 100);
  clicked = false;

  //audio
  minim = new Minim(this);
}  

void draw() {
  if (start != false) {
    println(mouseX);
    if (clicked == true) {
      tempClass = -1;
      if ((mouseX >= 0 && mouseX <= (width / 4)) && (tempClass != 0)) { // left quarter of screen
        tempClass = 0;
      } 
      else if ((mouseX >= (width / 4 + 1) && mouseX <= (width / 2)) && (tempClass != 1)) { // 2nd quarter of screen
        tempClass = 1;
      } 
      else if ((mouseX >= (width / 2 + 1) && mouseX <= ((3 * width) / 4)) && (tempClass != 2)) { // 3rd quarter of screen
        tempClass = 2;
      } 
      else {  //right quarter of screen
        tempClass = 3;
      }
    }

    if (video.available()) {
      video.read();
      video.loadPixels();

      img=loadImage("images/"  + songClass + "/" + imgNum + ".jpg");
      img.resize(width, height);
      background(img);
      fill(hue, 145, 80, 20);
      rect(0, 0, width, height);
      colorMode(RGB, 255, 255, 255, 100);
      PImage overlay = createImage(width, height, ARGB);
      overlay.loadPixels();

      // Begin loop for columns. make them transparent
      for (int i = 0; i < cols;i++) {
        // Begin loop for rows
        for (int j = 0; j < rows;j++) {

          // Where are we, pixel-wise?
          int x = i * cellSize;
          int y = j * cellSize;
          int loc = (video.width - x - 1) + y*video.width; // Reversing x to mirror the image

          // Each rect is semi transparent with a size determined by brightness
          color c = video.pixels[loc];
          int sz = int((brightness(c) / 255.0) * cellSize);
          noStroke();        
          // establish slight transparency
          color clear = color(255, 255, 255, 255);
          overlay.get(x + cellSize/2, y + cellSize/2, sz, sz);
          for (int d = 0; d < sz; d++) {
            for (int e = 0; e < sz; e++)
              //color pixels
              overlay.set( (d + x + cellSize/2), (e + y + cellSize/2), clear);
          }
        }
      }
      overlay.updatePixels();
      image(overlay, 0, 0);

      colorMode(HSB, 360, 100, 100); 
      int whichBar = mouseX / barWidth;
      if (whichBar != lastBar) {
        int barX = whichBar * barWidth;
        fill(barHue, 100, 100);
        rect(barX, 0, barWidth, height);
        lastBar = whichBar;
      }
      if (clicked == true) {
        // do we need to change song? if so, do it!
        if (tempClass != songClass) {
          imgNum = int(random(10));
          img=loadImage("images/"  + songClass + "/" + imgNum + ".jpg");
          //img.resize(width, height);
          if (song != null && song.isPlaying()) {
            stopPlay();
          }  
          playSong(tempClass);
          songClass = tempClass;
          // only change bg color if class changes
          switch (tempClass) {
          case 0:
            hue = int(random(91))+ 180;
            break;
          case 1:
            hue = int(random(91)) + 90;
            break;
          case 2:
            hue = int(random(91)) + 270;
            break;
          default:
            hue = int(random(91));
            break;
          }
        }

        clicked = false;
      }
    }
  }
}

void mousePressed() {
  noCursor();
  if (start != true) {
    video.start();
    start = true;
//    background(hue, 100, 100);
//    tint(255, 255);
//    image(img, 0, 0);
  }
  // change image on click after start
  hue = int(random(360));
  if (song != null)
    stopPlay();
  playSong(songClass);
  clicked = true;
} 

void playSong(int folder) {
  //  int songNum = random(x); will change once we have enough songs
  songNum = int(random(9));
  //  minim = new Minim(this);
  song = minim.loadFile("music/"+ folder + "/" + songNum + ".mp3");
  input = minim.getLineIn();
  song.play();
}  

void stopPlay() {
  song.close();

  input.close();
  minim.stop();
}

void mouseMoved() {
  barHue = barHue + 12;
  if (barHue > 255) {
    barHue = 0;
  }
}

