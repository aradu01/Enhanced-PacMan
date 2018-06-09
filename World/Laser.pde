public class Laser{
  public float x,y, xlspeed, ylspeed;
  public Laser(float xcor, float ycor, PacMan P){
    x = xcor;
    y = ycor;
    xspeed = P.xspeed();
    yspeed = P.yspeed();
  }
  public void move(){
    x += 1 * xspeed;
    y += 1 * yspeed;
  }
}
    
