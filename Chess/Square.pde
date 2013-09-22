class Square {
  
  boolean isLight;
  boolean isDark;
  int row;
  int col;
  int[] COLOR;
  Piece piece;
  
  public Square(int row, char col, Piece piece) {
  
    this.piece = piece;
    this.row = row;
    this.col = (int)col;
    COLOR = new int[4];
    decideColor(row,col);
    
  }
  
  public Square(int row, int col, Piece piece) {
  
    this.piece = piece;
    this.row = row;
    this.col = col;
    COLOR = new int[4];
    decideColor(row,col);
    
  }
  
  private void decideColor(int row, int col) {
   if((row % 2 == 0 && col % 2 == 0) || (row % 2 != 0 && col % 2 != 0)) {
     isDark = true;
     isLight = false;
   }
   else {
     isDark = false;
     isLight = true;
   }
   
   if(isDark)
     COLOR = darkcolor;
   else
     COLOR = lightcolor;
  }
 
  private int convertChartoInt(char c) {
    int oneBeforeA = (int)'a' - 1;
    return oneBeforeA - (int)c; 
  }
  
  
}
