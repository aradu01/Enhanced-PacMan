public class Laser{
  public float x,y, xlspeed, ylspeed;
  public Laser(PacMan P){
    
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
    ellipse(x, y, 20, 20);
    fill(color(255,0,0));
  }
}
    
