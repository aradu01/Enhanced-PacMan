public class Ghost {
  
  protected int ghostX;
  protected int ghostY;
  protected color ghostTint;
  
  /*
  public Ghost(int x, int y, color c) {
    xPos = x;
    yPos = y;
    tint = c;
  }
  */
  
  /*
  public int ghostX() {
    return xPos;
  }
  
  public int ghostY() {
    return yPos;
  }
  
  public color ghostColor() {
    return tint;
  }
  */
  
  private int[][] getMoves(int xcor, int ycor) {
    int[][] answer = new int[4][2];
    
    if (xcor + 1 > 0 && xcor + 1 < game.length && ycor > 0 && ycor < game[0].length) {
      if (game[xcor + 1][ycor].getColor() != color(0, 0, 255)) {
        answer[0][0] = xcor + 1;
        answer[0][1] = ycor;
      }
    }

    if (xcor - 1 > 0 && xcor - 1 < game.length && ycor > 0 && ycor < game[0].length) {
      if (game[xcor - 1][ycor].getColor() != color(0, 0, 255)) {
        answer[1][0] = xcor - 1;
        answer[1][1] = ycor;
      }
    }

    if (xcor > 0 && xcor < game.length && ycor + 1 > 0 && ycor + 1 < game[0].length) {
      if (game[xcor][ycor + 1].getColor() != color(0, 0, 255)) {
        answer[2][0] = xcor;
        answer[2][1] = ycor + 1;
      }
    }

    if (xcor > 0 && xcor < game.length && ycor - 1 > 0 && ycor - 1 < game[0].length) {
      if (game[xcor][ycor - 1].getColor() != color(0, 0, 255)) {
        answer[3][0] = xcor;
        answer[3][1] = ycor - 1;
      }
    }
        
    int counter = 0;

    for (int[] element: answer) {
      if (element[0] != 0 && element[1] != 0) {
        counter++;
      }
    }

    int[][] result = new int[counter][2];

    int index = 0;
        
    for (int[] element: answer) {
      if (element[0] != 0 && element[1] != 0) {
        result[index][0] = element[0];
        result[index][1] = element[1];
                
        index++;
      }
    }

    return result;
  }
  
  public int getX() {
    return ghostX;
  }
  
  public int getY() {
    return ghostY;
  }
  
  public void setX(int value) {
    ghostX = value;
  }
  
  public void setY(int value) {
    ghostY = value;
  }
  
  public void makeMove() {
    int[][] moves = getMoves((int) getX() / 20, (int) getY() / 20);
    int value = (int) random(0, moves.length);
    
    //System.out.println(print(moves));
    
    setX(moves[value][0] * 20 + 10);
    setY(moves[value][1] * 20 + 10);
  }
  
  public void ghostSetUp() {
    fill(255, 0, 0);
    ellipse(R.getX(), R.getY(), 20, 20);
    
    fill(0, 255, 0);
    ellipse(G.getX(), G.getY(), 20, 20);
    
    fill(0, 0, 255);
    ellipse(B.getX(), B.getY(), 20, 20);
  }
  
}
