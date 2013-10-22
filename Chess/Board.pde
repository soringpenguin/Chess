public class Board {
  
  private Square[][] board;
  int numRows = 8;
  int numCols = 8;
  
  public Board() {
    board = new Square[numRows][numCols];
    for(int row = 1; row <= numRows; row++) {
      for(int col = 1; col <= numCols; col++) { 
        board[row-1][col-1] = new Square(row,col,null);
      }
    }
    pawnImage = loadImage("pion_black.png");
    setupBoard();
  }
  
  /* Will move a piece to a new location
   * will return true if the move was succesful
   * but will return false if the move was not */
  public boolean move(int fRow, int fCol, int row, int col) {
    if(getSquare(fRow,fCol).piece.isLegalMove(fRow,fCol,row,col)) {
      getSquare(row,col).piece = getSquare(fRow,fCol).piece; // Assign the new Square to the Piece object
      getSquare(fRow,fCol).piece = null; // Remove piece from old square
      return true; // The move was succesful
    }
    return false;
  }
  
  // Row and col should follow 1 base indexing
  Square getSquare(int row, int col) {
    return board[row-1][col-1]; 
  }
  
  // Will return true if a piece is on the given square and false if nothing is there
  boolean isSquareEmpty(int row, int col) {
    return board[row-1][col-1].piece == null;
  }
  
  private void clear() {
   
   for(int i = 0; i < 8; i++) {
    for(int j = 0; j < 8; j++) {
      board[i][j].piece = null;
    }
   } 
  }
  
  private void setupBoard() {
    board[0][0].piece = new Rook(false,"R");
    board[0][1].piece = new Knight(false,"N");
    board[0][2].piece = new Bishop(false,"B");
    board[0][3].piece = new Queen(false,"Q");
    board[0][4].piece = new King(false,"K");
    board[0][5].piece = new Bishop(false,"B");
    board[0][6].piece = new Knight(false,"N");
    board[0][7].piece = new Rook(false,"R");
    
    for(int i = 0; i < 8; i++)
      board[1][i].piece = new Pawn(false,"P");
      
    for(int i = 0; i < 8; i++)
      board[6][i].piece = new Pawn(true,"P");
      
    board[7][0].piece = new Rook(true,"R");
    board[7][1].piece = new Knight(true,"N");
    board[7][2].piece = new Bishop(true,"B");
    board[7][3].piece = new Queen(true,"Q");
    board[7][4].piece = new King(true,"K");
    board[7][5].piece = new Bishop(true,"B");
    board[7][6].piece = new Knight(true,"N");
    board[7][7].piece = new Rook(true,"R");

  }
  
}
