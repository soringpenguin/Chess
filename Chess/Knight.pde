public class Knight extends Piece {
  
  public Knight(Square square, boolean isDark) {
   super(square,isDark); 
  }
  
  public boolean isLegalMove(Square square,int row, int col) {
   return true; 
  }
  
}
