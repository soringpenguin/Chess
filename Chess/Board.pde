public class Board {
  
  private Square[][] board;
  int numRows = 8;
  int numCols = 8;
  boolean whiteOnBottom = true;
  private ArrayList<Pawn> allPawns; // TODO make sure we remove the pawns when they get captured
  private ArrayList<Piece> whitePieces;
  private ArrayList<Piece> blackPieces;
  
  public Board() {
    board = new Square[numRows][numCols];
    for(int row = 1; row <= numRows; row++) {
      for(int col = 1; col <= numCols; col++) { 
        board[row-1][col-1] = new Square(row,col,null);
      }
    }
    pawnImage = loadImage("pion_black.png");
    allPawns = new ArrayList<Pawn>(16);
    whitePieces = new ArrayList<Piece>(16);
    blackPieces = new ArrayList<Piece>(16);
    setupBoard();
  }
  
  /* Will move a piece to a new location
   * will return true if the move was succesful
   * but will return false if the move was not */
  public boolean move(int fRow, int fCol, int row, int col) {
    if(getSquare(fRow,fCol).piece.isLegalMove(fRow,fCol,row,col)) {
      if(getSquare(fRow,fCol).piece instanceof Pawn && ((Pawn)getSquare(fRow,fCol).piece).isEnPassantMove) {
        // Remove pawn that is taken on en passant
        if(getSquare(fRow,fCol).piece.isDark) {
          whitePieces.remove(getSquare(row+1,col).piece);
          allPawns.remove(getSquare(row+1,col).piece);
          getSquare(row+1,col).piece = null;
        }
        else {
          blackPieces.remove(getSquare(row-1,col).piece);
          allPawns.remove(getSquare(row-1,col).piece);
          getSquare(row-1,col).piece = null;
        } 
      }
      // Remove piece from list(s) of pieces
      if(getSquare(row,col).piece instanceof Pawn)
        allPawns.remove(getSquare(row,col).piece);
      if(getSquare(fRow,fCol).piece.isDark)
        whitePieces.remove(getSquare(row,col).piece);
      else
        blackPieces.remove(getSquare(row,col).piece);
      getSquare(row,col).piece = getSquare(fRow,fCol).piece; // Assign the new Square to the Piece object
      getSquare(fRow,fCol).piece = null; // Remove piece from old square
      
      // Logic used in the en passant rule
      for(Pawn piece : allPawns) {
        piece.isEnPassantMove = false; // a reset
        if(piece.equals(getSquare(row,col).piece)) {
          if(piece.firstMove) {
            piece.hasJustMoved = true;
            piece.firstMove = false;
          }
          else
            piece.hasJustMoved = false;
        }
      }
      return true; // The move was succesful
    }
    return false;
  }
  
  // Row and col should follow 1 base indexing
  Square getSquare(int row, int col) {
    return board[row-1][col-1]; 
  }
  
  // Will return true if a piece is on the given square and false if nothing is there
  boolean isSquareEmpty(int row, int col) {
    return board[row-1][col-1].piece == null;
  }
  
  private void clear() {
   for(int i = 0; i < 8; i++) {
    for(int j = 0; j < 8; j++) {
      board[i][j].piece = null;
    }
   } 
  }
  
  private void setupBoard() {
    board[0][0].piece = new Rook(false,"R");
    board[0][1].piece = new Knight(false,"N");
    board[0][2].piece = new Bishop(false,"B");
    board[0][3].piece = new Queen(false,"Q");
    board[0][4].piece = new King(false,"K");
    board[0][5].piece = new Bishop(false,"B");
    board[0][6].piece = new Knight(false,"N");
    board[0][7].piece = new Rook(false,"R");
    whitePieces.add(board[0][0].piece);
    whitePieces.add(board[0][1].piece);
    whitePieces.add(board[0][2].piece);
    whitePieces.add(board[0][3].piece);
    whitePieces.add(board[0][4].piece);
    whitePieces.add(board[0][5].piece);
    whitePieces.add(board[0][6].piece);
    whitePieces.add(board[0][7].piece);
    
    for(int i = 0; i < 8; i++) {
      board[1][i].piece = new Pawn(false,"P");
      allPawns.add((Pawn)board[1][i].piece);
    }
      
    for(int i = 0; i < 8; i++) {
      board[6][i].piece = new Pawn(true,"P");
      allPawns.add((Pawn)board[6][i].piece);
    }
    board[7][0].piece = new Rook(true,"R");
    board[7][1].piece = new Knight(true,"N");
    board[7][2].piece = new Bishop(true,"B");
    board[7][3].piece = new Queen(true,"Q");
    board[7][4].piece = new King(true,"K");
    board[7][5].piece = new Bishop(true,"B");
    board[7][6].piece = new Knight(true,"N");
    board[7][7].piece = new Rook(true,"R");
    blackPieces.add(board[7][0].piece);
    blackPieces.add(board[7][1].piece);
    blackPieces.add(board[7][2].piece);
    blackPieces.add(board[7][3].piece);
    blackPieces.add(board[7][4].piece);
    blackPieces.add(board[7][5].piece);
    blackPieces.add(board[7][6].piece);
    blackPieces.add(board[7][7].piece);

  }
  
}
