public class Queen extends Piece {
  
  public Queen(Square square, boolean isDark) {
   super(square,isDark); 
  }
  
  public boolean isLegalMove(Square square,int row, int col) {
   return true; 
  }
  
}
