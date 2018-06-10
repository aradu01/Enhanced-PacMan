public float X2 = 550;
public float Y2 = 30;
public float xspeed2 = SPEED2;
public float yspeed2 = 0;
public boolean isLas2;

public class PacMan2 {
   public float timer;
    public void decreaseTimer(){
    timer--;
  }
  public float getTimer(){
    return timer;
  }
  
  public color c2 = color(200, 0, 100);
  
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
    return X2;
  }
  public float y(){
    return Y2;
  }
  public float xspeed(){
    return xspeed2;
  }
  public float yspeed(){
    return yspeed2;
  }
  public color getcolor(){
    return c2;
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
  
  private float lower2 = QUARTER_PI; // + rotating;
  private float upper2 = TWO_PI - QUARTER_PI; // + rotating;
  private float increment2 = .1;
  
  public int direction2 = 1;
  
  public void turn2() {
    //pushMatrix();
    //translate(X, Y);
    
    if (direction2 == 0) {
      translate(X2, Y2);
      
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
      fill(c2);
      arc(0, 0, 20, 20, lower2, upper2);

      resetMatrix();
    }
    
    else if (direction2 == 1) {
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
      
      fill(c2);
      arc(X2, Y2, 20, 20, lower2, upper2);
    }
    
    else if (direction2 == 2) {
      translate(X2, Y2);
      
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
      fill(c2);
      arc(0, 0, 20, 20, lower2, upper2);

      resetMatrix();
    }
    
    else if (direction2 == 3) {
      translate(X2, Y2);
      
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
      fill(c2);
      arc(0, 0, 20, 20, lower2, upper2);

      resetMatrix();
    }
    
    //direction = value;
    
    //translate(0, 0);
    //popMatrix();
  }
 
  public void pacManSetUp() {
    //fill(c2);
    //arc(X2, Y2, 20, 20, lower2, upper2);
    
    /*
    if (abs(lower - upper) > PI) {
        lower = upper;
    }
    */
    
    if (upper2 > TWO_PI) { // + rotating) {
      upper2 = TWO_PI - increment2; // + rotating;
      // lower = TWO_PI + increment + rotating;
      increment2 *= -1;
    }
     
    else if (lower2 > QUARTER_PI) { // + rotating) {
      upper2 = TWO_PI - QUARTER_PI - increment2; // + rotating;
      lower2 = QUARTER_PI + increment2; // + rotating;
      increment2 *= -1;
    }
     
    else {
      lower2 -= 2 *increment2;
      upper2 += 2 *increment2;
    }
  
    if (X2 == 30 && xspeed2 < 0) {
      xspeed2 = 0;
      Y2 += yspeed2;
    }
    
    else if (X2 == 570 && xspeed2 > 0) {
      xspeed2 = 0;
      Y2 += yspeed2;
    }
    
    else if (Y2 == 30 && yspeed2 < 0) {
      X2 += xspeed2;
      yspeed2 = 0;
    }
    
    else if (Y2 == 570 && yspeed2 > 0) {
      X2 += xspeed2;
      yspeed2 = 0;
    }
    
    else {
      X2 += xspeed2;
      Y2 += yspeed2;
    }
  }
  public boolean getLaz(){
    return isLas2;
  }
  public void laserify(){
    isLas2 = true;
  }
  public void setC(color c){
    this.c2 = c;
  }
  public void checkMoves() {
    if (game[(int) (X2 + xspeed2) / 20][(int) (Y2 + yspeed2) / 20].getColor() == color(0, 0, 255)) {
      xspeed2 = 0;
      yspeed2 = 0;
    }
  }
  public boolean ghostDetection(Ghost first, Ghost second, Ghost third){
    if(c2 == color(200, 0, 100)){
    if((Math.abs(X2 - first.getX()) < 30 && Math.abs(Y2- first.getY()) < 30 && first.getColor() != color(0,0,0)) ||
      (Math.abs(X2 - second.getX()) < 30 && Math.abs(Y2- second.getY()) < 30 && first.getColor() != color(0,0,0)) || 
      (Math.abs(X2 - third.getX()) < 30 && Math.abs(Y2- third.getY()) < 30 && first.getColor() != color(0,0,0))){
        c2 = color(0,0,0);
         return false;
      }
    }
      return true;
}
public void enrage(){
    c2 = color(255, 0, 0);
    timer = 50;
  }

}
