public class Rook extends Piece {
  
  public Rook(boolean isDark, String name) {
   super(isDark,name);
  }
  
  public boolean isLegalMove(int fRow, int fCol, int row, int col) {
    // Check if we are moving either straight horizontally or vertically
    if(fCol == col || fRow == row) {
      // Make sure nothing is in the piece's way
      int D = max(abs(fRow-row),abs(fCol-col));
      for(int i = 0; i < D-1; i++) {
        if(fCol < col) { // Right
          if(!board.isSquareEmpty(fRow,fCol+(i+1))) {
            println("5");
            return false;
          }
        }
        else if(fRow > row) { // Up
          if(!board.isSquareEmpty(fRow-(i+1),fCol)) {
            println("4");
            return false;
          }
        }
        else if(fCol > col) { // Left
          println(fCol + ", " + fRow + ", " + i);
          if(!board.isSquareEmpty(fRow,fCol-(i+1))) {
            println("3");
            return false;
          }
        }
        else if(fRow < row) { // Down 
          if(!board.isSquareEmpty(fRow+(i+1),fCol)) {
            println("2");
            return false;
          }
        }
      }
      // Check end square for a piece
      if(board.isSquareEmpty(row,col))
        return true;
      if(isDark) {
        if(!board.isSquareEmpty(row,col) && board.getSquare(row,col).piece.isLight)
          return true;
      } else {
        if(!board.isSquareEmpty(row,col) && board.getSquare(row,col).piece.isDark)
          return true;
     }
     println("1");
     return false;
    }
    println("0");
    return false; 
  }
  
}
