public float X = 30;
public float Y = 50;
public float xspeed = SPEED;
public float yspeed = 0;
public boolean isLas;
public float lives = 2;

public class PacMan {
  public float timer;
   public void decreaseTimer(){
    timer--;
  }
  public float getlives(){
    return lives;
  }
  public float getTimer(){
    return timer;
  }
  public color c = color(255, 255, 0);
  
  /*
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
  */
  
  /*
  private float rotating = 0.0;
  
  public void changeDirection(float amount) {
      rotating = amount;
  }
  */
  
  /*
  public void checkOthers(ArrayList<Square> squares){
    for (Square s: squares) {
      if (dist(xPos, yPos, s.getActX(), s.getActY()) < 30 && s.getColor() == color(0, 255, 0)) {
         c = color(255, 0, 0);
      }
      
      else {
        c = color(255, 255, 0);
      }
    }
  }
  */
  public float x(){
    return X;
  }
  public float y(){
    return Y;
  }
  public float xspeed(){
    return xspeed;
  }
  public float yspeed(){
    return yspeed;
  }
  public color getcolor(){
    return c;
  }
  public void checkOthers(Square[][] game){
    for (int r = 0; r < game.length; r++) {
      for (int c = 0; c < game[0].length; c++) {
        if (dist(X, Y, game[r][c].xcor(), game[r][c].ycor()) <= 20 && game[r][c].getColor() == color(0, 255,0)) {
          c = color(255, 0, 0);
        }
      }
    }
  }
  
  private float lower = QUARTER_PI; // + rotating;
  private float upper = TWO_PI - QUARTER_PI; // + rotating;
  private float increment = .1;
  
  public void enrage(){
    c = color(255, 0, 0);
    timer = 50;
  }
  public void pacManSetUp() {
    fill(c);
    //arc(X, Y, 20, 20, lower, upper);
    
    /*
    if (abs(lower - upper) > PI) {
        lower = upper;
    }
    */
    
    if (upper > TWO_PI) { // + rotating) {
      upper = TWO_PI - increment; // + rotating;
      // lower = TWO_PI + increment + rotating;
      increment *= -1;
    }
     
    else if (lower > QUARTER_PI) { // + rotating) {
      upper = TWO_PI - QUARTER_PI - increment; // + rotating;
      lower = QUARTER_PI + increment; // + rotating;
      increment *= -1;
    }
     
    else {
      lower -= 2 *increment;
      upper += 2 *increment;
    }
  
    if (X == 30 && xspeed < 0) {
      xspeed = 0;
      Y += yspeed;
    }
    
    else if (X == 570 && xspeed > 0) {
      xspeed = 0;
      Y += yspeed;
    }
    
    else if (Y == 30 && yspeed < 0) {
      X += xspeed;
      yspeed = 0;
    }
    
    else if (Y == 570 && yspeed > 0) {
      X += xspeed;
      yspeed = 0;
    }
    
    else {
      X += xspeed;
      Y += yspeed;
    }
  }
  public boolean getLaz(){
    return isLas;
  }
  public void laserify(){
    isLas = true;
  }
  public void setC(color c){
    this.c = c;
  }
  public void checkMoves() {
    if (game[(int) (X + xspeed) / 20][(int) (Y + yspeed) / 20].getColor() == color(0, 0, 255)) {
      xspeed = 0;
      yspeed = 0;
    }
  }
  public void oneUp(){
    lives++;
  }
  public boolean ghostDetection(Ghost first, Ghost second, Ghost third){
    if(c == color(255,255,0)){
    if((Math.abs(X - first.getX()) < 30 && Math.abs(Y- first.getY()) < 30 && first.getColor() != color(0,0,0)) ||
      (Math.abs(X - second.getX()) < 30 && Math.abs(Y- second.getY()) < 30 && second.getColor() != color(0,0,0)) || 
      (Math.abs(X - third.getX()) < 30 && Math.abs(Y- third.getY()) < 30) && third.getColor() != color(0,0,0)){
         c = color(0,0,0);
         lives--;
         timer = 50;
         return false;
      }
    }
      return true;
}
 public int direction = 1;
 public void turn() {
    //pushMatrix();
    //translate(X, Y);
    
    if (direction == 0) {
      translate(X, Y);
      
      /*
      if (value == 0) {
        fill(c);
        arc(X, Y, 20, 20, lower, upper);
      }
      
      else if (value == 1) {
        pushMatrix();
        rotate(PI/2);
        fill(c);
        arc(X, Y, 20, 20, lower, upper);
        popMatrix();
      }
      
      else if (value == 2) {
        pushMatrix();
        rotate(PI);
        fill(c);
        arc(X, Y, 20, 20, lower, upper);
        popMatrix();
      }
      
      else if (value == 3) {
        pushMatrix();
        rotate(PI + PI / 2);
        fill(c);
        arc(X, Y, 20, 20, lower, upper);
        popMatrix();
      }
      */
      
      rotate(PI + PI/2);
      fill(c);
      arc(0, 0, 20, 20, lower, upper);

      resetMatrix();
    }
    
    else if (direction == 1) {
      /*
      if (value == 0) {
        pushMatrix();
        rotate(PI + PI/2);
        fill(c);
        arc(X, Y, 20, 20, lower, upper);
        popMatrix();
      }
      
      else if (value == 2) {
        pushMatrix();
        rotate(PI/2);
        fill(c);
        arc(X, Y, 20, 20, lower, upper);
        popMatrix();
      }
      
      else if (value == 3) {
        pushMatrix();
        rotate(PI);
        fill(c);
        arc(X, Y, 20, 20, lower, upper);
        popMatrix();
      }
      */
      
      fill(c);
      arc(X, Y, 20, 20, lower, upper);
    }
    
    else if (direction == 2) {
      translate(X, Y);
      
      /*
      if (value == 0) {
        pushMatrix();
        rotate(PI);
        fill(c);
        arc(X, Y, 20, 20, lower, upper);
        popMatrix();
      }
      
      else if (value == 1) {
        pushMatrix();
        rotate(PI + PI/2);
        fill(c);
        arc(X, Y, 20, 20, lower, upper);
        popMatrix();
      }
      
      else if (value == 3) {
        pushMatrix();
        rotate(PI / 2);
        fill(c);
        arc(X, Y, 20, 20, lower, upper);
        popMatrix();
      }
      */
      
      
      rotate(PI/2);
      fill(c);
      arc(0, 0, 20, 20, lower, upper);

      resetMatrix();
    }
    
    else if (direction == 3) {
      translate(X, Y);
      
      /*
      if (value == 0) {
        pushMatrix();
        rotate(PI/2);
        fill(c);
        arc(X, Y, 20, 20, lower, upper);
        popMatrix();
      }
      
      else if (value == 1) {
        pushMatrix();
        rotate(PI);
        fill(c);
        arc(X, Y, 20, 20, lower, upper);
        popMatrix();
      }
      
      else if (value == 2) {
        pushMatrix();
        rotate(PI + PI / 2);
        fill(c);
        arc(X, Y, 20, 20, lower, upper);
        popMatrix();
      }
      */
      
      
      rotate(PI);
      fill(c);
      arc(0, 0, 20, 20, lower, upper);

      resetMatrix();
    }
    
    //direction = value;
    
    //translate(0, 0);
    //popMatrix();
  }
    }
