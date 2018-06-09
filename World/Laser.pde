public class Laser{
  public float x,y, xlspeed, ylspeed;
  public Laser(PacMan P){
    
    x = P.x();
    y = P.y();
    xspeed = P.xspeed();
    yspeed = P.yspeed();
  }
  public void move(){
    x += 1 * xspeed;
    y += 1 * yspeed;
  }
}
    
