public class Board {
  
  private Square[][] board;
  PImage pawnImage;
  
  public Board() {
    board = new Square[8][8];
    for(int row = 1; row <= 8; row++) {
      for(int col = 1; col <= 8; col++) { 
        board[row-1][col-1] = new Square(row,col,null);
      }
    }
    pawnImage = loadImage("pion_black.png");
    board[1][1].piece = new Pawn(board[1][1],true);
    println(board[1][1].piece.isDark);
  }
  
  boolean move
  
  // Row and col should follow 1 base indexing
  Square getSquare(int row, int col) {
    return board[row-1][col-1]; 
  }
  
  // Will return true if a piece is on the given square and false if nothing is there
  boolean isSquareEmpty(int row, int col) {
    return board[row-1][col-1] == null;
  }
  
}
