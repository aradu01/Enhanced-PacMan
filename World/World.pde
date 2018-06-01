Square[][] game;
final int SPEED = 20;

float xPos = 30;
float yPos = 30;
float xspeed = SPEED;
float yspeed = 0;

public void setup() {
  size(600, 600);
  frameRate(10);
  
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

private float lower = QUARTER_PI;
private float upper = TWO_PI - QUARTER_PI;
private float increment = 0.1;

public void draw() {  
  for (Square[] row: game) {
    for (Square block: row) {
      // System.out.println(block.xcor() + " " + block.ycor());
      
      fill(block.getColor());
      rect(block.xcor(), block.ycor(), 20, 20);
    }
  }
  
  fill(255, 255, 0);
  arc(xPos, yPos, 20, 20, lower, upper);
  
  if (upper > TWO_PI) {
      upper = TWO_PI - increment;
      // lower = TWO_PI + increment;
      increment *= -1;

  }
  
  else if (lower > QUARTER_PI) {
      upper = TWO_PI - QUARTER_PI - increment;
      lower = QUARTER_PI + increment;
      increment *= -1;
  }
  
  else {
      lower -= increment;
      upper += increment;
  }
  
  if (xPos == 30 && xspeed < 0) {
    xspeed = 0;
    yPos += yspeed;
  }
  
  else if (xPos == 570 && xspeed > 0) {
    xspeed = 0;
    yPos += yspeed;
  }
  
  else if (yPos == 30 && yspeed < 0) {
    xPos += xspeed;
    yspeed = 0;
  }
  
  else if (yPos == 570 && yspeed > 0) {
    xPos += xspeed;
    yspeed = 0;
  }
  
  else {
    xPos += xspeed;
    yPos += yspeed;
  }
 
  // System.out.println("xPos: " + xPos + " yPos: " + yPos);
}

public void keyPressed() {
  if (key == 'w' && yPos > 10) {
    xspeed = 0;
    yspeed = -SPEED;
  }
  
  else if (key == 'a' && xPos > 10) {
    xspeed = -SPEED;
    yspeed = 0;
  }
  
  else if (key == 's' && yPos < 590) {
    xspeed = 0;
    yspeed = SPEED;
  }
  
  else if (key == 'd' && xPos < 590) {
    xspeed = SPEED;
    yspeed = 0;
  }

}