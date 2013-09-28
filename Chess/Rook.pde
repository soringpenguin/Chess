public class Rook extends Piece {
  
  public Rook(Square square, boolean isDark) {
   super(square,isDark); 
  }
  
  public boolean isLegalMove(Square square,int row, int col) {
   return true; 
  }
  
}
