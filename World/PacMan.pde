public class PacMan {
  
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
  
  private float lower = QUARTER_PI + rotating;
  private float upper = TWO_PI - QUARTER_PI + rotating;
  private float increment = 0.1;
 
  public void pacManSetUp() {
    fill(255, 255, 0);
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
