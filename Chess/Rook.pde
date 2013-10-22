public class Rook extends Piece {
  
  public Rook(boolean isDark, String name) {
   super(isDark,name);
  }
  
  public boolean isLegalMove(int fRow, int fCol, int row, int col) {
   return true; 
  }
  
}
