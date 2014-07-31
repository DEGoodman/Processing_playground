/**
*   GoL, started in class
*
*/

//create array of cells
Cell[][] board;
final int ALIVE = 1;
final int DEAD = 0;
final int GRID = 80;
//constant grid width, to make drawing easier
int wid = 10;
int gen = 0;


void setup(){
  board = new Cell[GRID][GRID];
  //build board
  for(int i=0; i < GRID; i++) {
    for(int j=0; j < GRID; j++) {
      board[i][j] = new Cell(i,j);
    }
  }
  // set other setup values
  size(GRID*wid, GRID*wid); // default value is same size a grid dimensions
  smooth();
  frameRate(1);
}

void draw() {
  //draw current board state
  for(int i=0; i < GRID; i++) {
    for(int j=0; j < GRID; j++) {
      board[i][j].render();
    }
  }
  
  //update board 
   for(int i=0; i < GRID; i++) {
     for(int j=0; j < GRID; j++) {
       board[i][j].update();
     }
  }
  gen++ ;
  println(gen + "th generation");  
}

void update(){
  
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
    state = floor(random(2));
    
    // temp value to for debugging. Should change for all cells on update
    neighbors = -999;
    nextState = -999; 
  }

  void render(){
    if (state == ALIVE)
      fill(18, 255, 61);
    else //state == DEAD
      fill(190);
    rect(i*wid, j*wid, wid, wid);
  }

  void update() {
    //reset neighbor count
    neighbors=0;
    
    //count all neighbors
    for (int x = this.i-1; x <= this.i+1; x++ ) {
      for (int y = this.j - 1; y <= this.j+1; y++) {
        println(i + ", " + j);
        //make sure neighboring cell is on game board!!!
        if ((x+this.i > -1) && (y+this.j > -1) && (x+this.i < GRID + 1) && (y+this.j < GRID + 1)) {
          // check if ALIVE, don't count own cell
          if ((board[i + x][j + y].state == ALIVE) && (x != 0) && (y != 0))
            neighbors++;
          }  
        }
      }
      println("i: " + i + ", j: " + j + ". neighbors: " + neighbors);
  
    //update alive/dead state
    // do logic for each cell grow/die
    if(state == ALIVE) {
      if( neighbors == 2 || neighbors == 3) {
        nextState = ALIVE;
       } else
        nextState = DEAD;
     } else {//DEAD 
      if (neighbors == 3)
       nextState = ALIVE;
     } 
    state = nextState;
     
  }
  

}  
