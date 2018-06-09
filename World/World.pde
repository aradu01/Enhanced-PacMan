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
public PacMan2 second = new PacMan2();
public String[] temp;
public float score, score2;
PFont f;
public boolean las, laze, las2, laze2;
public Laser l, l2;
public boolean screen, played, twoscreen;
PImage img;
public SoundFile file1, file2, file3, file4, file5, file6;;

public final int SPEED = 20;
public final int SPEED2 = 20;

public void setup() {
  size(600, 600);
  frameRate(10);
  game = new Square[30][30];
  mboy = new Maze("Sample.txt");
  file1 = new SoundFile(this, "Pacman_Intro.wav");
  file2 = new SoundFile(this, "Pacman_Waka_Waka.wav");
  file3 = new SoundFile(this, "pacman_death.wav");
  file4 = new SoundFile(this, "pacman_eatfruit.wav");
  file5 = new SoundFile(this, "pacman_eatghost.wav");
  file6 = new SoundFile(this, "pacman_intermission.wav");
  file1.play();
  
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
  score+= 100;
}
public void updateScore2(){
  score2+= 100;
}
public String getScore(){
  return "" + score;
}
public String getScore2(){
  return "" + score2;
}
public void draw() {  
  background(0,0,0);
  if(!played && millis() > 4000){
    file2.loop();
    played = true;
  }
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
  las2 = second.getLaz();
  if(laze){
    l.display();
    l.move();
  }
  if(laze2){
    l2.display();
    l2.move();
  }
  if(twoscreen){
    second.pacManSetUp();
  }
  basis.pacManSetUp();
  monster.ghostSetUp();
  for(Square squ : checked){
    if(laze && laze2){
      squ.checkLaser(l);
      squ.checkLaser(l2);
    }
    else if(laze){
    squ.checkLaser(l);
    }
    else if(laze2){
    squ.checkLaser(l2);
    }
    if(squ.checkPac(basis, file4)){
      updateScore();
    }
    if(squ.checkPac(second, file4)){
      updateScore2();
    }
  }
  text("P1SCORE:" + getScore(), 30, 40);
  if(twoscreen){
    text("P2SCORE:" + getScore2(), 400, 40);
  }
  fill(color(255, 215, 0));
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
  if(twoscreen){
    second.checkMoves();
  }
  basis.checkMoves();
  }
}

public void keyPressed() {
  if(!screen){
    if(key == 'p'){
      screen = true;
    }
    if(key == 't'){
      screen = true;
      twoscreen = true;
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
  if(twoscreen){
    if(key == 'o' && las2){
    laze2 = true;
    l2 = new Laser(second);
    l2.display();
    }
    else if (key == 'u' && Y2 > 10) {
    xspeed2 = 0;
    yspeed2 = -SPEED2;
    
    // basis.changeDirection(-HALF_PI);
    second.checkMoves();
  }
  
  else if (key == 'h' && X2 > 10) {
    xspeed2 = -SPEED2;
    yspeed2 = 0;
    
    // basis.changeDirection(PI);
    second.checkMoves();
  }
  
  else if (key == 'j' && Y2 < 590) {
    xspeed2 = 0;
    yspeed2 = SPEED2;
    
    // basis.changeDirection(HALF_PI);
    second.checkMoves();
  }
  
  else if (key == 'k' && X2 < 590) {
    xspeed2 = SPEED2;
    yspeed2 = 0;
    
    // basis.changeDirection(0);
    second.checkMoves();
  }
  }
  }

}
