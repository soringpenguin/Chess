public class Knight extends Piece {
  
  public Knight(boolean isDark, String name) {
   super(isDark,name); 
  }
  
  public boolean isLegalMove(int fRow, int fCol, int row, int col) {
   if (((fCol-2 == col || fCol+2 == col) && (fRow-1 == row || fRow+1 == row)) || 
      ((fCol-1 == col || fCol+1 == col) && (fRow-2 == row || fRow+2 == row))) {
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
