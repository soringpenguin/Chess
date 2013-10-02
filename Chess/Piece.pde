public abstract class Piece {
  
  boolean isDark;
  boolean isLight; 
  
  public Piece(boolean isDark) {
    this.isDark = false;
    this.isLight = false;
    if(isDark)
      this.isDark = true;
    if(!isDark)
      this.isLight = true;
  }
  
  /* Will determine if the piece can be moved to the given square
   * It is abstract because legal moves will depend on kind of piece */
  public abstract boolean isLegalMove(int fRow, int fCol, int row,int col);
  
}
