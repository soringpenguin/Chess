public class Knight extends Piece {
  
  public Knight(boolean isDark) {
   super(isDark); 
  }
  
  public boolean isLegalMove(int fRow, int fCol, int row, int col) {
   return true; 
  }
  
}
