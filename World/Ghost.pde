public class Ghost {
  
  protected int ghostX;
  protected int ghostY;
  protected color ghostTint;
  public PImage Ghost;
  color c;
  //color c1 = color(255, 0, 0);
  //color c2 = color(0, 255, 0);
  //color c3 = color(0, 0, 255);
  color cd = color(0, 0, 0);
  
  
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
  public void checkPac(PacMan P){
    if(P.getcolor() == color(255,0,0)){
    if(Math.abs(ghostX - P.x()) < 30 && Math.abs(ghostY - P.y()) < 30){
      c = cd;
    }
    }
  }
  public void checkPac(PacMan2 P){
    if(P.getcolor() == color(255,0,0)){
    if(Math.abs(ghostX - P.x()) < 30 && Math.abs(ghostY - P.y()) < 30){
      c = cd;
    }
    }
  }
  public void checkLaser(Laser P){
    if(Math.abs(ghostX - P.x()) < 30 && Math.abs(ghostY - P.y()) < 30){
      c = cd;
    }
  }
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
  
  public color getColor(){
    return c;
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
    fill(c);
    //rotate(HALF_PI);
    arc(ghostX, ghostY, 25, 25, PI, 2 *PI);
    //ellipse(R.getX(), R.getY(), 20, 20);
    ellipse(ghostX - 10, ghostY +3, 7, 7);
    ellipse(ghostX - 3.5, ghostY + 3, 7, 7);
    //ellipse(R.getX(), R.getY() + 8, 7, 7);
    ellipse(ghostX + 3.5, ghostY + 3, 7, 7);
    ellipse(ghostX + 10, ghostY + 3, 7, 7);
    fill(255, 255,255);
    ellipse(ghostX - 6, ghostY - 6, 8, 8);
    ellipse(ghostX + 6, ghostY - 6, 8, 8);
    fill(0,0,0);
    ellipse(ghostX - 6, ghostY - 6, 2, 2);
    ellipse(ghostX + 6, ghostY - 6, 2, 2);
    
    /*fill(c2);
    arc(G.getX(), G.getY(), 25, 25, PI, 2 *PI);
    //ellipse(R.getX(), R.getY(), 20, 20);
    ellipse(G.getX() - 10, G.getY() +3, 7, 7);
    ellipse(G.getX() - 3.5, G.getY() + 3, 7, 7);
    //ellipse(R.getX(), R.getY() + 8, 7, 7);
    ellipse(G.getX() + 3.5, G.getY() + 3, 7, 7);
    ellipse(G.getX() + 10, G.getY() + 3, 7, 7);
    fill(255, 255,255);
    ellipse(G.getX() - 6, G.getY() - 6, 8, 8);
    ellipse(G.getX() + 6, G.getY() - 6, 8, 8);
    fill(0,0,0);
    ellipse(G.getX() - 6, G.getY() - 6, 2, 2);
    ellipse(G.getX() + 6, G.getY() - 6, 2, 2);
    
    fill(c3);
    arc(B.getX(), B.getY(), 25, 25, PI, 2 *PI);
    //ellipse(R.getX(), R.getY(), 20, 20);
    ellipse(B.getX() - 10, B.getY() +3, 7, 7);
    ellipse(B.getX() - 3.5, B.getY() + 3, 7, 7);
    //ellipse(R.getX(), R.getY() + 8, 7, 7);
    ellipse(B.getX() + 3.5, B.getY() + 3, 7, 7);
    ellipse(B.getX() + 10, B.getY() + 3, 7, 7);
    fill(255, 255,255);
    ellipse(B.getX() - 6, B.getY() - 6, 8, 8);
    ellipse(B.getX() + 6, B.getY() - 6, 8, 8);
    fill(0,0,0);
    ellipse(B.getX() - 6, B.getY() - 6, 2, 2);
    ellipse(B.getX() + 6, B.getY() - 6, 2, 2);
    */
  }
  
}
