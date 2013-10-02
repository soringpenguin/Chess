public class King extends Piece {
  
  public King(boolean isDark) {
   super(isDark); 
  }
  
  public boolean isLegalMove(int fRow, int fCol, int row, int col) {
   return true; 
  }
  
}
