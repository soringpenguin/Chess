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
    board[6][6].piece = new Pawn(true);
    println(board[6][6].piece.isDark);
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
  
}
