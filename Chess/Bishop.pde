public class Bishop extends Piece {
  
  public Bishop(Square square, boolean isDark) {
   super(square,isDark); 
  }
  
  public boolean isLegalMove(Square square,int row, int col) {
   return true; 
  }
  
}
