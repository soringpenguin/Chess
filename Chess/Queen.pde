public class Queen extends Piece {
  
  public Queen(boolean isDark) {
   super(isDark); 
  }
  
  public boolean isLegalMove(int fRow, int fCol, int row, int col) {
   return true; 
  }
  
}
