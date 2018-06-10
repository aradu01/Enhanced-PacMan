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
public boolean alive = true;

PImage img;
public SoundFile file1, file2, file3, file4, file5, file6;;

public final int SPEED = 20;
public final int SPEED2 = 20;

public void setup() {
  size(600, 600);
  frameRate(7);
  
  //System.out.print(show(arr));

  game = new Square[30][30];
  mboy = new Maze("Sample2.txt");
  
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
  }
*/
}

public void updateScore(){
  score += 100;
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
  if(!played){
    if(millis() > 4000000 || screen){
    file2.loop();
    played = true;
  }
  }
  if(!alive){
    file2.stop();
  }
  if(!screen){
    image(img, 0, 0, width, height);
    text("PACMAN", width/2 - 45, height/2 - 50);
    text("Press 'P' in order to start single player game", width/2 - 190, height/2 + 30);
    text("Press 'T' in order to start co-op game", width/2 - 170, height/2 + 70);
  }
  else if (alive){
    //if(twoscreen)
  alive = basis.ghostDetection(G, B, R);
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
    fill(color(255, 215, 0));
    l.display();
    l.move();
  }
  if(laze2){
    fill(color(255, 215, 0));
    l2.display();
    l2.move();
  }
  if(twoscreen){
    second.pacManSetUp();
  }
  basis.pacManSetUp();
  R.ghostSetUp();
  G.ghostSetUp();
  B.ghostSetUp();
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
  fill(255, 0, 0);
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
  
  R.checkPac(basis);
  G.checkPac(basis);
  B.checkPac(basis);
  
  if(twoscreen){
    R.checkPac(second);
    G.checkPac(second);
    B.checkPac(second);
  }
  if(laze){
    R.checkLaser(l);
    G.checkLaser(l);
    B.checkLaser(l);
  }
  if(laze2){
    R.checkLaser(l2);
    G.checkLaser(l2);
    B.checkLaser(l2);
  }
  
  R.makeMove();
  G.makeMove();
  B.makeMove();
 
}
else{
  text("Haha loser you died", width/2 - 190, height/2 + 30);
  text(getScore(), width/2 - 190, height/2 + 70);
  //text(getScore2(), width/2 - 190, height/2 + 100);
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
    else if(key == CODED){
    if (keyCode == UP && Y2 > 10) {
    xspeed2 = 0;
    yspeed2 = -SPEED2;
    
    // basis.changeDirection(-HALF_PI);
    second.checkMoves();
  }
  
  else if (keyCode == LEFT && X2 > 10) {
    xspeed2 = -SPEED2;
    yspeed2 = 0;
    
    // basis.changeDirection(PI);
    second.checkMoves();
  }
  
  else if (keyCode == DOWN && Y2 < 590) {
    xspeed2 = 0;
    yspeed2 = SPEED2;
    
    // basis.changeDirection(HALF_PI);
    second.checkMoves();
  }
  
  else if (keyCode == RIGHT && X2 < 590) {
    xspeed2 = SPEED2;
    yspeed2 = 0;
    
    // basis.changeDirection(0);
    second.checkMoves();
  }
  }
  }
  }

}
