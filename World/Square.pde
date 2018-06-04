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

  public int xcor() {
    return x;
  }

  public int ycor() {
    return y;
  }

  public color getColor() {
    return c;
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