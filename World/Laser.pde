public class Laser{
  public float x,y, xlspeed, ylspeed;
  public Laser(PacMan P){
    x = P.x();
    y = P.y();
    if(P.xspeed() == 0 && P.yspeed()== 0){
      xlspeed = 60;
    }
    else{
    xlspeed = 3 *P.xspeed();
    ylspeed = 3 *P.yspeed();
    }
  }
   public Laser(PacMan2 P){
    
    x = P.x();
    y = P.y();
    if(P.xspeed() == 0 && P.yspeed()== 0){
      xlspeed = 40;
    }
    else{
    xlspeed = 2 *P.xspeed();
    ylspeed = 2 *P.yspeed();

    }
  }
  public void move(){
    x += 1 * xlspeed;
    y += 1 * ylspeed;
  }
  public float x(){
    return x;
  }
  public float y(){
    return y;
  }
  public void display(){
    float horizontal = x;
    float vertical = y;
    if (xspeed > 0) {
      horizontal -= 20;
    }
    
    else if (xspeed < 0) {
      horizontal += 20;
    }
    
    else if (yspeed > 0) {
      vertical -= 20;
    }
    
    else if (yspeed < 0) {
      vertical += 20;
    }
    
    fill(color(255,0,0));
    ellipse(horizontal, vertical, 20, 20);
  }
}
