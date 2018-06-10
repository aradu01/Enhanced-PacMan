public class Square {
  float xactual, yactual;
  int x;
  int y;
  color c;
  boolean isRect;

  public Square(int xcor, int ycor, color tint, boolean rect) {
    x = xcor;
    y = ycor;
    c = tint;
    xactual = x * 20;
    yactual = y * 20;
    isRect = rect;
  }
  public boolean checkPac(PacMan P, SoundFile file){
    if(c == color(0,0,0)){
      return false;
    }
    if(!getRect() && Math.abs(P.x() - x) < 15 && Math.abs(P.y() - y) < 15
    &&(Math.abs(P.x() - x) < 15 || Math.abs(P.y() - y) < 15)){
     // if(c == color(155, 215, 0)){
      //  P.laserify();
      //}
      if(c == color(255, 215, 0)){
      P.laserify();
      file.play();
    }
      setColor(color(0,0,0));
      return true;
    }
    return false;
  }
  public boolean checkPac(PacMan2 P, SoundFile file){
    if(c == color(0,0,0)){
      return false;
    }
    if(!getRect() && Math.abs(P.x() - x) < 15 && Math.abs(P.y() - y) < 15
    &&(Math.abs(P.x() - x) < 15 || Math.abs(P.y() - y) < 15)){
     // if(c == color(155, 215, 0)){
      //  P.laserify();
      //}
      if(c == color(255, 215, 0)){
      P.laserify();
      file.play();
    }
      setColor(color(0,0,0));
      return true;
    }
    return false;
  }
  public boolean checkLaser(Laser P){
    if(laze || laze2){
    if(c == color(0,0,0)){
      return false;
    }
    if(getRect() && Math.abs(P.x() - x) < 15 && Math.abs(P.y() - y) < 15){
     // if(c == color(155, 215, 0)){
      //  P.laserify();
      //}
      setColor(color(0,0,0));
      return true;
    }
    }
    return false;
  }
      
  public int xcor() {
    return x;
  }

  public int ycor() {
    return y;
  }

  public color getColor() {
    return c;
  }
  public void setColor(color c){
    this.c = c;
  }
  public float getActX(){
    return xactual;
  }
  public float getActY(){
    return yactual;
  }
  public boolean getRect(){
    return isRect;
  }
}
