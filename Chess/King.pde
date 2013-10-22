public class King extends Piece {
  
  public King(boolean isDark, String name) {
   super(isDark,name); 
  }
  
  public boolean isLegalMove(int fRow, int fCol, int row, int col) {
    if(abs(fRow-row) < 2 && abs(fCol-col) < 2) {
    if(board.isSquareEmpty(row,col))
       return true;
     if(isDark) {
       if(!board.isSquareEmpty(row,col) && board.getSquare(row,col).piece.isLight)
         return true;
     } else {
       if(!board.isSquareEmpty(row,col) && board.getSquare(row,col).piece.isDark)
         return true;
     }
     return false;
    }
    return false;
  }
  
}
