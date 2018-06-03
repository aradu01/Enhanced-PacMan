public class PacMan {
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
  
  private float rotating = 0.0;
  
  public void changeDirection(float amount) {
      rotating = amount;
  }
  public void checkOthers(ArrayList<Square> squares){
    for(Square s: squares){
      if(dist(xPos,yPos, s.xcor(), s.ycor()) < 20 && s.getColor() == color(0, 255, 0)){
         c = color(255, 0, 0);
      }
      else{
        c = color(255, 255, 0);
  }
  }
  }
  private float lower = QUARTER_PI + rotating;
  private float upper = TWO_PI - QUARTER_PI + rotating;
  private float increment = 0.1;
 
  public void pacManSetUp() {
    fill(c);
    arc(xPos, yPos, 20, 20, lower, upper);
    if (abs(lower - upper) > PI) {
        lower = upper;
    }
    
    
    if (upper > TWO_PI + rotating) {
      upper = TWO_PI - increment + rotating;
      // lower = TWO_PI + increment + rotating;
      increment *= -1;
    }
     
    else if (lower > QUARTER_PI + rotating) {
      upper = TWO_PI - QUARTER_PI - increment + rotating;
      lower = QUARTER_PI + increment + rotating;
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
  }

}
