Square[][] game;

public void setup() {
  size(600, 600);
  
  game = new Square[30][30];
  
  for (int row = 0; row < game.length; row++) {
    for (int col = 0; col < game[row].length; col++) {
      game[row][col] = new Square(row * 20, col * 20, color(0, 0, 255));
    }
  }
  
  for (Square[] row: game) {
    for (Square block: row) {
      // System.out.println(block.xcor() + " " + block.ycor());
      rect(block.xcor(), block.ycor(), 20, 20);
      fill(block.getColor());
    }
  }
}

public class Square {
  int x;
  int y;
  color c;
  
  public Square(int xcor, int ycor, color tint) {
    x = xcor;
    y = ycor;
    c = tint;
  }
  
  public int xcor() {
    return x;
  }
  
  public int ycor() {
    return y;
  }
  
  public int getColor() {
    return c;
  }
}
