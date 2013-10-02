public class Rook extends Piece {
  
  public Rook(boolean isDark) {
   super(isDark); 
  }
  
  public boolean isLegalMove(int fRow, int fCol, int row, int col) {
   return true; 
  }
  
}
