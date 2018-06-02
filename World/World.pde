public Square[][] game;
public PacMan basis = new PacMan();

public final int SPEED = 20;

public float xPos = 30;
public float yPos = 30;
public float xspeed = SPEED;
public float yspeed = 0;

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

public void draw() {  
  for (Square[] row: game) {
    for (Square block: row) {
      // System.out.println(block.xcor() + " " + block.ycor());

      fill(block.getColor());
      rect(block.xcor(), block.ycor(), 20, 20);
    }
  }
  
  basis.pacManSetUp();

  // System.out.println("xPos: " + xPos + " yPos: " + yPos);
}

public void keyPressed() {
  if (key == 'w' && yPos > 10) {
    xspeed = 0;
    yspeed = -SPEED;
    
    basis.changeDirection(-HALF_PI);
  }
  
  else if (key == 'a' && xPos > 10) {
    xspeed = -SPEED;
    yspeed = 0;
    
    basis.changeDirection(PI);
  }
  
  else if (key == 's' && yPos < 590) {
    xspeed = 0;
    yspeed = SPEED;
    
    basis.changeDirection(HALF_PI);
  }
  
  else if (key == 'd' && xPos < 590) {
    xspeed = SPEED;
    yspeed = 0;
    
    basis.changeDirection(0);
  }
}
