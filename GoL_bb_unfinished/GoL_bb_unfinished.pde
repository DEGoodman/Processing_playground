/**
*   Object-oriented GoL, started in class
*
*
*  Authors: D. Erik Goodman
*
*
* Brian's Brain
* 3 states
*   Firing, Resting, Off
*/

//create array of cells
Cell[][] board;
final int FIRING = 2;
final int RESTING = 1;
final int OFF = 0;
final int GRIDx = 300;
final int GRIDy = 240;
//constant grid width, to make drawing easier
int wid = 3;
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
  int spawn = floor(random(3));
  if (spawn == 0)
    state = OFF;
  else if (spawn == 1)
    state = RESTING; 
  else
    state = FIRING;  
  
  // temp value to for debugging. Should change for all cells on countNeighbors() and update()
  neighbors = -999;
  nextState = -999; 
}

void render(){
  if (state == FIRING)
    fill(165, 72, 72);
  else if (state == RESTING)
    fill(255, 255, 0);
  else
    fill(200) ; 
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

      if (board[r][c].state == FIRING)
        count++;
    }
    if (board[i][j].state == FIRING)
    count--;
  }
  neighbors = count;
  //update alive/dead state
  // dead cell (lonely)
  
  //BRIAN'S BRAIN
  if(this.state == FIRING)
    this.nextState = RESTING;
  else if (this.state == RESTING)
    this.nextState = OFF;
  else{
    if (neighbors == 2)  
      this.nextState = FIRING;
  }
  state = nextState; 
  neighbors = 0;
 }
}  // end Cell class
