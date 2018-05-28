Square[][] game;
float xPos = 30;
float yPos = 30;

public void setup() {
  size(600, 600);
  
  game = new Square[30][30];
  
  for (int row = 0; row < game.length; row++) {
    for (int col = 0; col < game[row].length; col++) {
      game[row][col] = new Square(row * 20, col * 20, color(0, 0, 255));
    }
  }
  
  /*
  for (Square[] row: game) {
    for (Square block: row) {
      // System.out.println(block.xcor() + " " + block.ycor());
      rect(block.xcor(), block.ycor(), 20, 20);
      fill(block.getColor());
    }
  }
  */
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

/*
public class PacMan {
  int x;
  int y;
  float xspeed = 20;
  float yspeed = 20;
  

  public void moveUp() {
    yPos -= yspeed;
  }
  
  public void moveDown() {
    yPos += yspeed;
  }
  
  public void moveLeft() {
    xPos -= xspeed;
  }
  
  public void moveRight() {
    xPos += xspeed;
  }

}
*/

public void draw() {
  for (Square[] row: game) {
    for (Square block: row) {
      // System.out.println(block.xcor() + " " + block.ycor());
      
      fill(block.getColor());
      rect(block.xcor(), block.ycor(), 20, 20);
    }
  }
  
  fill(255, 255, 0);
  arc(xPos, yPos, 20, 20, QUARTER_PI, TWO_PI - QUARTER_PI);
  
  // System.out.println("xPos: " + xPos + " yPos: " + yPos);
}

public void keyPressed() {
  if (key == 'w' && yPos > 10) {
    yPos -= 20;
  }
  
  else if (key == 'a' && xPos > 10) {
    xPos -= 20;
  }
  
  else if (key == 's' && yPos < 590) {
    yPos += 20;
  }
  
  else if (key == 'd' && xPos < 590) {
    xPos += 20;
  }
}
