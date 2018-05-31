public class Square {
  
  int x;
  int y;
  color c;

  public Square(int xcor, int ycor, color tint) {
    x = xcor;
    y = ycor;
    c = tint;
  }

  public int xcor() {
    return x;
  }

  public int ycor() {
    return y;
  }

  public int getColor() {
    return c;
  }

}