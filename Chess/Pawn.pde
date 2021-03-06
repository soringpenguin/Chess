public class Pawn extends Piece {
  
  private boolean isOnOriginalSquare;
  private boolean hasJustMoved;
  private boolean firstMove;
  private int enPassantDarkCaptureRow = 3;
  private int enPassantLightCaptureRow = 6;
  private boolean isEnPassantMove;
  
  public Pawn(boolean isDark, String name) {
   super(isDark,name);
   isOnOriginalSquare = true; // The first square it is on is always its orginal square
   // May need to change to its standard starting square only
   
   hasJustMoved = false;
   firstMove = true;
   isEnPassantMove = false;
  }
  
  public boolean isLegalMove(int fRow, int fCol, int row, int col) {
   if(isDark) {
     // Check if the pawn is trying to move 1 space forward
     // And the space in front of the pawn is empty
     println(fRow);
     println(row + ", " + col);
     println(board.isSquareEmpty(row,col));
     if(fRow-1 == row && fCol == col && board.isSquareEmpty(row,col)) {
       print("Dark Pawn moves forward");
       return true;
     }
     // Check to see if the pawn is trying to capture a piece on the diagonal
     else if(fRow-1 == row && (fCol-1 == col || fCol+1 == col) && !board.isSquareEmpty(row,col) && board.getSquare(row,col).piece.isLight) {
       print("Dark Pawn moves diagonally");
       return true;
     }
     // Check for "en passant" capturing rule
     else if (enPassantDarkCaptureRow == row && (fCol-1 == col || fCol+1 == col) && board.isSquareEmpty(row,col)) {
       if(!board.isSquareEmpty(row+1,col) && board.getSquare(row+1,col).piece instanceof Pawn && ((Pawn)board.getSquare(row+1,col).piece).hasJustMoved) {
         println("En Passant yes");
         isEnPassantMove = true;
         return true;
       }
       else {
         println("\n" + !board.isSquareEmpty(row-1,col));
         println("En Passant No");
         return false;
       }
     }
     // Check for first move trying to move two squares
     else if(firstMove && fRow-2 == row && fCol == col && board.isSquareEmpty(row,col)) {
       print("Dark Pawn moves forward two squares");
       return true;
     }
     // The piece must be trying to make an illegal move
     else {
       return false;
     }
   }
   else if(isLight) {
     // Check if the pawn is trying to move 1 space forward
     // And the space in front of the pawn is empty
     println(fRow);
     println(row + ", " + col);
     println(board.isSquareEmpty(row,col));
     if(fRow+1 == row && fCol == col && board.isSquareEmpty(row,col)) {
       print("Light Pawn moves forward");
       return true;
     }
     // Check to see if the pawn is trying to capture a piece on the diagonal
     else if(fRow+1 == row && (fCol-1 == col || fCol+1 == col) && !board.isSquareEmpty(row,col) && board.getSquare(row,col).piece.isDark) {
       print("Light Pawn moves diagonally");
       return true;
     }
     // Check for "en passant" capturing rule
     else if (enPassantLightCaptureRow == row && (fCol-1 == col || fCol+1 == col) && board.isSquareEmpty(row,col)) {
       if(!board.isSquareEmpty(row-1,col) && board.getSquare(row-1,col).piece instanceof Pawn && ((Pawn)board.getSquare(row-1,col).piece).hasJustMoved) {
         println("En Passant yes");
         isEnPassantMove = true;
         return true;
       }
       else {
         println("\n" + !board.isSquareEmpty(row-1,col));
         println("En Passant No");
         return false;
       }
     }
     // Check for first move trying to move two squares
     else if(firstMove && fRow+2 == row && fCol == col && board.isSquareEmpty(row,col)) {
       print("Light Pawn moves forward two squares");
       return true;
     }
     // The piece must be trying to make an illegal move
     else {
       return false;
     }
   }
   return true; 
  }
  
}
