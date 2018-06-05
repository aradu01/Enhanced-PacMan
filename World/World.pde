import java.util.*;

public Maze mboy;
public Square[][] game;
public PacMan basis = new PacMan();

public ArrayList<Square> squarr = new ArrayList<Square>();
public String[] temp;

public final int SPEED = 20;

public void setup() {
  size(600, 600);
  frameRate(10);
  
  game = new Square[30][30];
  mboy = new Maze("Sample.txt");
  mboy.mazeSetUp(game);
  
 // f = createFont("Arial", 16, true);
 // temp = loadStrings("Sample.txt");
 
  for(int r = 0; r < game.length; r++){
    for(int c = 0; c < game[0].length; c++){
      squarr.add(game[r][c]);
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

public void draw() {  
  for (Square[] row: game) {
    for (Square block: row) {
      // System.out.println(block.xcor() + " " + block.ycor());

      fill(block.getColor());
      rect(block.xcor(), block.ycor(), 20, 20);
    }
  }
  
  basis.pacManSetUp();
  
  // basis.checkOthers(game);
  // System.out.println("xPos: " + xPos + " yPos: " + yPos);
  
  /*
  background(255,0,0);
  textFont(f, 16);
  fill(255);
  text(temp[0], 10, 100);
  */
  
  basis.checkMoves();
}

public void keyPressed() {
  if (key == 'w' && yPos > 10) {
    xspeed = 0;
    yspeed = -SPEED;
    
    // basis.changeDirection(-HALF_PI);
    basis.checkMoves();
  }
  
  else if (key == 'a' && xPos > 10) {
    xspeed = -SPEED;
    yspeed = 0;
    
    // basis.changeDirection(PI);
    basis.checkMoves();
  }
  
  else if (key == 's' && yPos < 590) {
    xspeed = 0;
    yspeed = SPEED;
    
    // basis.changeDirection(HALF_PI);
    basis.checkMoves();
  }
  
  else if (key == 'd' && xPos < 590) {
    xspeed = SPEED;
    yspeed = 0;
    
    // basis.changeDirection(0);
    basis.checkMoves();
  }

}