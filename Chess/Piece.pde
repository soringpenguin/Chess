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
  
  /* Will determine if the piece can be moved to the given square
   * It is abstract because legal moves will depend on kind of piece */
  public abstract boolean isLegalMove(Square square,int row,int col);
  
  /* Will move a piece to a new location
   * will return true if the move was succesful
   * but will return false if the move was not */
  public boolean move(int row, int col) {
    if(isLegalMove(this.square,row,col)) {
      this.square = board[row][col]; // Assign the new Square to the Piece object
      return true; // The move was succesful
    }
    return false;
  }
  
}
