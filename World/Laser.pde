public class Laser{
  public float x,y, xlspeed, ylspeed;
  public Laser(PacMan P){
    
    x = P.x() + 50;
    y = P.y() + 50;
    xlspeed = P.xspeed();
    ylspeed = P.yspeed();
  }
  public void move(){
    x += 1 * xlspeed;
    y += 1 * ylspeed;
  }
  public void display(){
    ellipse(x, y, 10, 10);
    fill(color(255,215,0));
  }
}
    
