/**
*    CA/ GoL
*
*/

//create array of cells
Cell[][] board;
final int ALIVE = 1;
final int DEAD = 0;
final int GRID = 100;
//constant grid width, to make drawing easier
float wid = 10;


void setup(){
  board = new Cell[GRID][GRID];
  //build board
  for(int i=0; i < GRID; i++) {
    for(int j=0; j < GRID; j++) {
      board[i][j].state=DEAD;
      board[i][j].nextState=DEAD;
    }
  }  
}

void draw() {
    //update board
  update();
  
  //draw current board state
  render();
}  

int neighborCount(int a, int b) {
  int numNeighbors = 0;
  for (int x = a-1; x < a+1; x++ ) {
    for (int y = b - 1; y < b+1; y++) {
      //make sure neighboring cell is on game board!!!
      if ((x+a > -1) && (y+b > -1) && (x+a < board.length + 1) && (y+b < board[0].length + 1) {
        // check if ALIVE, don't count own cell
        if (board[a + x][b + y].now == ALIVE) && (x != 0) && (y != 0))
          numNeighbors++;
      }  
    }
  }
  //at the end of this loop, all neighbors are counted
  return numNeighbors;
}

void render() {
  for
}  

// live/ die logic
void nextBoard(){
 // look at each cell
  for(int i=0; i < board.length; i++) {
    for(int j=0; j < board[i].length; j++) {
      int neighbors = neighborCount(i, j);
      // do logic for each cell grow/die
      if(board[x][y].now == ALIVE) {
        if( neighbors == 2 || neighbors == 3) {
          board[x][y].nextState = ALIVE;
        } else
          board[x][y].nextState = DEAD;
      } else //DEAD {
        if (neighbors >= 3)
          board[x][y].nextState = ALIVE;
      }  
    }  
  }  
}

//update old board to new board
void update() {
  for(int i=0; i < board.length; i++) {
    for(int j=0; j < board[i].length; j++) {
      board[i][j].now = board[i][j].nextState; 
    }
  }  
}  

class Cell {
  int state;
  int nextState;
  Cell(int currentState, int nextState) {
    this.now = currentState;
    this.nextState = nextState;
  }

  void render(){
    if (state == ALIVE)
      fill(18, 255, 61);
    else //dead
      fill(0);
    rect(i*wid, j*wid, wid, wid);
  }  
  void update(){
  
  }  
}  
