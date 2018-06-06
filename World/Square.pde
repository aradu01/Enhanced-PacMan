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
  public void checkPac(PacMan P){
    if (P.x() == xcor() && P.y() == ycor()){
      setColor(color(0,0,0));
    }
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