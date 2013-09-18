
int[] darkcolor = {181,136,99,0};
int[] lightcolor = {240,217,181,0};
Square[][] board;

void setup() {
  board = new Square[8][8];
  for(int row = 1; row <= 8; row++) {
    for(int col = 1; col <= 8; col++) { 
      board[row-1][col-1] = new Square(row,col,null);
    }
  }
  board[1][1].piece = new Pawn(board[1][1],true);
  println(board[1][1].piece.isDark);
  size(512,512);
  frame.setResizable(true);
  
}

void draw() {
 
  background(255);
  
  int inc = width/8;
  if(height < width)
    inc = height/8;
    
  int counter = 0;
  for(int row = 0; row < 8; row++) {
    for(int col = 0; col < 8; col++) {
      if(board[row][col].isDark)
        fill(darkcolor[0],darkcolor[1],darkcolor[2]);
      else if(board[row][col].isLight)
        fill(lightcolor[0],lightcolor[1],lightcolor[2]);
      
      rect(row*inc,col*inc,inc,inc); 
      if(board[row][col].piece != null) {
        if(board[row][col].piece.isDark)
          fill(0);
        else
          fill(255);
        rect(row*inc + (inc/4),col*inc + (inc/4),inc/2,inc/2);
      }
      counter++;
    }
  }   
}
