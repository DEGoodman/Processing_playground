/**
*   Quiz #1, Cellular Automata, Rock Paper Scissors rules
*
*  BLUE eats RED
*  RED eats GREEN
*  GREEN eats BLUE 
*
* suggest changing GRIDx and GRIDy to 180, and 'wid' to 6. Resolution is much better
*
*
*  Authors: D. Erik Goodman
*/

//create array of cells
Cell[][] board;
final int ALIVE = 1;
final int DEAD = 0;
final int GRIDx = 400;
final int GRIDy = 400;
//constant grid width, to make drawing easier
int wid = 3;
int gen = 0;

//states
final int OFF = 0;
final int ROCK = 1;
final int PAPER = 2;
final int SCISSORS = 3;

boolean pause;

void setup(){
  board = new Cell[GRIDx][GRIDy];
  // randomly seed cell states
  //build board
  for(int i=0; i < GRIDx; i++) {
    for(int j=0; j < GRIDy; j++) {
      board[i][j] = new Cell(i,j);
    }
  }
  // set other setup values
  size(GRIDx*wid, GRIDy*wid);
  smooth();
  noStroke();
  //frameRate(30);
  pause = false;
}

void draw() {
  // 'pause' functionality
  if (!pause){

    //draw current board state, update next value
    for(int i=0; i < GRIDx; i++) {
      for(int j=0; j < GRIDy; j++) {
        board[i][j].render();
        board[i][j].update();
      }
    }
    
  } else {
    textSize(64);
    fill(0, 102, 153, 5);
    rect(0, 0, width, height);
    fill(255);
    text("pause", width/2 - 100, height/2 - 50);
  }  
  
}

void keyPressed() {
  if (key == ' ') {
    pause = !pause; // toggle pause
  }  
}  

class Cell {
int state;
int nextState;
int neighbors;
int i,j;

  Cell(int i, int j) {
    this.i = i;
    this.j = j;

    // set random default value
    state = floor(random(4));
     
    // temp value for debugging. Should change for all cells on countNeighbors() and update()
    neighbors = -1;
    nextState = -1; 
  }
  
  int getState() {
    return this.state;
  }  

  void render(){
    switch(state){
      case(OFF):  
        fill(255);
        break;
      case(ROCK):
        fill(0, 255, 0);
        break;
      case(PAPER):
        fill(255,0,0);
        break;
      case(SCISSORS):
        fill(0,0,255);
        break;
      default:
        break;  
    }  
    rect(i*wid, j*wid, wid, wid);
  }

 void update(){
   // get a random neighbor value (-1, 0, 1)
   int xNeighbor = int(random(-2, 2));
   int yNeighbor = int(random(-2, 2));
   
   //take above and turn into grid coordinate
   int xPos = i + xNeighbor;
   int yPos = j + yNeighbor;
   
   // for wraparound
   int xx = (xPos + GRIDx) % GRIDx;
   int yy = (yPos + GRIDy) % GRIDy;
   
   
   // select next state
   if(xNeighbor == 0 && yNeighbor == 0){ // ********* RULE 1
     nextState = state;
   } else { 
     // get neighbor's state
     int nState = board[xx][yy].getState();
   
     if(state == OFF){ // ******** RULE 2
       nextState = nState;
     } else { // battle!
       // see declarations at top for ints
       if((state == nState + 1) || (state == nState - 2)) //******** RULE 3
         nextState = this.state;
       else // neighbor wins
         nextState = nState;
     }  
   }
   state = nextState; // change future state  
 }
}  // end Cell class
