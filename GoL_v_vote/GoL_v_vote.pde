/**
*   Object-oriented GoL, started in class
*
*
*  Authors: D. Erik Goodman, Michael Madril
*/

//create array of cells
Cell[][] board;
final int ALIVE = 1;
final int DEAD = 0;
final int GRIDx = 200;
final int GRIDy = 160;
//constant grid width, to make drawing easier
int wid = 5;
int gen = 0;


void setup(){
board = new Cell[GRIDx][GRIDy];
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
  int spawn = floor(random(2));
  if (spawn < 1)
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

void update() {
  
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
  neighbors = count;
  //update alive/dead state
  // dead cell (lonely)
  if ( neighbors > 4) {
    this.nextState = ALIVE; 
  } else {
    this.nextState = DEAD;
  }

    
  state = nextState; 
  neighbors = 0;
 }
}  // end Cell class
