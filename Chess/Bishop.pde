public class Bishop extends Piece {
  
  public Bishop(boolean isDark) {
   super(isDark); 
  }
  
  public boolean isLegalMove(int fRow, int fCol, int row, int col) {
   return true; 
  }
  
}
