public class Pawn extends Piece {
  
  public Pawn(boolean isDark) {
   super(isDark); 
  }
  
  public boolean isLegalMove(int row, int col) {
   if(isDark) {
     // Check if the pawn is trying to move 1 space forward
     // And the space in front of the pawn is empty
     println(square.row-1);
     println(row + ", " + col);
     println(board.isSquareEmpty(row,col));
     if(square.row-1 == row && board.isSquareEmpty(row,col)) {
       return true;
     }
     // Check to see if the pawn is trying to capture a piece on the diagonal
     else if(square.row-1 == row && (square.col-1 == col || square.col-1 == col) && board.isSquareEmpty(row,col)) {
       return true;
     }
     // The piece must be trying to make an illegal move
     else {
       return false;
     }
   }
   else if(isLight) {
     // Check if the pawn is trying to move 1 space forward
     if(square.row+1 == row) {
       
     }
   }
   return true; 
  }
  
}
