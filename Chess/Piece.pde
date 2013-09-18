public abstract class Piece {
  
  Square square;
  boolean isDark;
  boolean isLight; 
  
  public Piece(Square square, boolean isDark) {
    this.square = square;
    this.isDark = false;
    this.isLight = false;
    if(isDark)
      this.isDark = true;
    if(!isDark)
      this.isLight = true;
  }
  
  public abstract boolean isLegalMove(Square square,int row,int col);
  
  public boolean move(int row, int col) {
    if(isLegalMove(square,row,col)) {
      this.square = board[row][col];
      return true;
    }
    return false;
  }
 
  
  
}
