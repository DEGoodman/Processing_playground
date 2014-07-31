/**
*   Quiz #1, Cellular Automata, Rock Paper Scissors rules
*
*
*  Authors: D. Erik Goodman, Michael Madril
*/

//create array of cells
Cell[][] board;
final int ALIVE = 1;
final int DEAD = 0;
final int GRIDx = 100;
final int GRIDy = 100;
//constant grid width, to make drawing easier
int wid = 10;
int gen = 0;

//RPS stuff
final int OFF = 0;
final int ROCK = 1;
final int PAPER = 2;
final int SCISSORS = 3;

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
  size(GRIDx*wid, GRIDy*wid); // default value is same size a grid dimensions
  smooth();
  frameRate(30);
}

void draw() {
  //draw current board state
  for(int i=0; i < GRIDx; i++) {
    for(int j=0; j < GRIDy; j++) {
      board[i][j].render();
    }
  }

//count neighbors 
 for(int i=0; i < GRIDx; i++) {
   for(int j=0; j < GRIDy; j++) {
     board[i][j].countNeighbors();
   }
}

//update whole board
 for(int i=0; i < GRIDx; i++) {
   for(int j=0; j < GRIDy; j++) {
     board[i][j].update();
   }
}


gen++ ;
println(gen + "th generation");  
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
  int spawn = floor(random(10));
  if (spawn < 4) //30% starting population 
    state = ALIVE;
  else
    state = DEAD; 
  
  // temp value to for debugging. Should change for all cells on countNeighbors() and update()
  neighbors = -999;
  nextState = -999; 
}

void render(){
  if (state == ALIVE)
    fill(165, 72, 72);
  else //state == DEAD
    fill(190);
  rect(i*wid, j*wid, wid, wid);
}

void countNeighbors() {
  
  //count all neighbors
  int count = 0;
  int r = 0;
  int c = 0;

  for (int a = -1; a <= 1; a++) {
    if (i + a == -1) //wraparound
      r = GRIDx - 1;
    else if (i + a == GRIDx) //wraparound
      r = 0; 
    else
      r = i + a;

    for (int b = -1; b <= 1; b++) {
      if (j + b == -1) //wraparound
        c = GRIDy - 1;
      else if (j + b == GRIDy) //wraparound
        c = 0;
      else
        c = j + b;

      if (board[r][c].state == ALIVE)
        count++;
    }
  }
  // lessen count if center is 'ALIVE'
  if (board[i][j].state == ALIVE)
    count--;
  neighbors = count;
}  

 void update(){
   //update alive/dead state
   // dead cell (lonely)
   if ( neighbors < 2) {
     nextState = DEAD; 
    }
      
    // dead cell (crowded)
    if (neighbors > 3) {
      nextState = DEAD;
    }
      
    // cell born
    if (neighbors == 3) {
      nextState = ALIVE;
    }
    // else, no change in state
    
    state = nextState; 
 }
}  // end Cell class
