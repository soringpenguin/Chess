
int[] darkcolor = {181,136,99,0};
int[] lightcolor = {240,217,181,0};
Board board;
Square selectedSquare;
PImage pawnImage;
int inc;

void setup() {
  size(512,512);
  frame.setResizable(true);
  selectedSquare = null;
  board = new Board();
}

void draw() {
 
  background(255);
  
  inc = width/board.numRows; //  Assuming that we are working with a square
  if(height < width)
    inc = height/board.numRows;
    
  int counter = 0;
  for(int row = 0; row < board.numRows; row++) {
    for(int col = 0; col < board.numCols; col++) {
      if(board.board[row][col].isDark)
        fill(darkcolor[0],darkcolor[1],darkcolor[2]);
      else if(board.board[row][col].isLight)
        fill(lightcolor[0],lightcolor[1],lightcolor[2]);
      
      if(board.board[row][col].equals(selectedSquare))
        strokeWeight(5);
      else
        strokeWeight(1);
      int tempRow = row;
      if(board.whiteOnBottom)
        tempRow = flipYs(row,8);
        
      rect(col*inc,tempRow*inc,inc,inc);

//      if(board.board[row][col].piece != null) {
//        if(board.board[row][col].piece.isDark)
//          fill(0,128);
//        else
//          fill(255,128);
//      }
//      rect(col*inc,row*inc,inc,inc);
      counter++;
      // Print name of piece over the square
      if(board.board[row][col].piece != null) {
        if(board.board[row][col].piece.isDark)
          fill(0);
        else
          fill(255);
        textSize(36);
        text(board.board[row][col].piece.name,col*inc + (inc/3),tempRow*inc + (inc/1.5));
      }
    }
  }  
}


void mousePressed() {
  int row = mouseY / (board.numRows * 8) + 1;
  int col = mouseX / (board.numCols * 8) + 1;
  
  // If trying to make a move
  if(selectedSquare != null) {
    if(!board.move(selectedSquare.row, selectedSquare.col,row,col))
      println("move failed");
    selectedSquare = null;
  }
  // If just selecting a piece to move
  else {
    if(board.getSquare(row,col).piece != null) {
      println("Piece selected at " + row + "," + col);
      selectedSquare = board.getSquare(row,col);
    }
    else {
      println("square selected is empty");
    }
  }
  
}
  
void keyPressed() {
 if(key == 'r')
   board.setupBoard();
 else if(key == 'c')
   board.clear();
 else if(key == 'f')
   board.whiteOnBottom = !board.whiteOnBottom;  
}

int flipYs(int j, int gridSize) {
  int tempJ = 0;
  for(int i = 0; i < gridSize; i++) {
    if(j == i) {
      tempJ = gridSize-(i+1);
      break;
    }
  }
  return tempJ;
}
