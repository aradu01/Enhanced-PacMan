import java.util.*;
import processing.sound.*;
public Ghost monster = new Ghost();
public GreenGhost G = new GreenGhost();
public BlueGhost B = new BlueGhost();
public RedGhost R = new RedGhost();
public Maze mboy;
public Square[][] game;
public ArrayList<Square> checked = new ArrayList<Square>();
public PacMan basis = new PacMan();
public String[] temp;
public float score;
PFont f;
public boolean las, laze;
public Laser l;
public boolean screen;
PImage img;
public SoundFile file;

public final int SPEED = 20;

public void setup() {
  size(600, 600);
  frameRate(10);
  game = new Square[30][30];
  mboy = new Maze("Sample.txt");
  mboy.mazeSetUp(game);
  img = loadImage("Pac-man.png");
  f = createFont("Arial", 16, true);
  textFont(f, 24);
  fill(255);
  
 // f = createFont("Arial", 16, true);
 // temp = loadStrings("Sample.txt");
 
  for(int r = 0; r < game.length; r++){
    for(int c = 0; c < game[0].length; c++){
      checked.add(game[r][c]);
    }
  }
 /* for (Square[] row: game) {
    for (Square block: row) {
    // System.out.println(block.xcor() + " " + block.ycor());
    if(block.getRect()){
    rect(block.xcor(), block.ycor(), 20, 20);
    fill(block.getColor());
    }
    else if (!block.getRect()){
      ellipse(block.xcor() + 10, block.ycor() + 10, 13, 13);
      fill(block.getColor());
    }
  }
 
}*/
}
public void updateScore(){
  score+= 100;;
}
public String getScore(){
  return "" + score;
}
public void draw() {  
  background(0,0,0);
  if(!screen){
    image(img, 0, 0, width, height);
    text("PACMAN", width/2 - 45, height/2 - 50);
    text("Press 'P' in order to start game", width/2 - 135, height/2 + 30);
   
  }
  else{
  for (Square[] row: game) {
    for (Square block: row) {
      // System.out.println(block.xcor() + " " + block.ycor())
     if(block.getRect()){
      fill(block.getColor());
      rect(block.xcor(), block.ycor(), 20, 20);
    }
    else if (!block.getRect()){
      fill(block.getColor());
      ellipse(block.xcor() + 10, block.ycor() + 10, 13, 13);
    }
    
  }
  }
  las = basis.getLaz();
  if(laze){
    l.display();
    l.move();
  }
  basis.pacManSetUp();
  monster.ghostSetUp();
  for(Square squ : checked){
    squ.checkLaser(l);
    if(squ.checkPac(basis)){
      updateScore();
    }
  }
  text(getScore(), 10, 20);
  //G.makeMove();
  //B.makeMove();
  //R.makeMove();
  
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
}

public void keyPressed() {
  if(!screen){
    if(key == 'p'){
      screen = true;
    }
  }
  else{
  if(key == 'q' && las){
    laze = true;
    l = new Laser(basis);
    l.display();
  }
  else if (key == 'w' && Y > 10) {
    xspeed = 0;
    yspeed = -SPEED;
    
    // basis.changeDirection(-HALF_PI);
    basis.checkMoves();
  }
  
  else if (key == 'a' && X> 10) {
    xspeed = -SPEED;
    yspeed = 0;
    
    // basis.changeDirection(PI);
    basis.checkMoves();
  }
  
  else if (key == 's' && Y < 590) {
    xspeed = 0;
    yspeed = SPEED;
    
    // basis.changeDirection(HALF_PI);
    basis.checkMoves();
  }
  
  else if (key == 'd' && X < 590) {
    xspeed = SPEED;
    yspeed = 0;
    
    // basis.changeDirection(0);
    basis.checkMoves();
  }
  }

}
