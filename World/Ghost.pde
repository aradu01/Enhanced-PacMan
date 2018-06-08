public class Ghost {
  
  private int xPos;
  private int yPos;
  private color tint;
  
  /*
  public Ghost(int x, int y, color c) {
    xPos = x;
    yPos = y;
    tint = c;
  }
  */
  
  public int ghostX() {
    return xPos;
  }
  
  public int ghostY() {
    return yPos;
  }
  
  public color ghostColor() {
    return tint;
  }
  
  private int[][] getMoves(int xcor, int ycor) {
    int[][] answer = new int[4][2];
    
    if (xcor + 1 > 0 && xcor + 1 < game.length && ycor > 0 && ycor < game[0].length) {
		  if (game[xcor + 1][ycor].getColor() != color(0, 255, 0)) {
		    answer[0][0] = xcor + 1;
        answer[0][1] = ycor;
		  }
	  }

    if (xcor - 1 > 0 && xcor - 1 < game.length && ycor > 0 && ycor < game[0].length) {
		  if (game[xcor - 1][ycor].getColor() != color(0, 255, 0)) {
		    answer[0][0] = xcor - 1;
        answer[0][1] = ycor;
		  }
	  }

    if (xcor > 0 && xcor < game.length && ycor + 1 > 0 && ycor + 1 < game[0].length) {
		  if (game[xcor][ycor + 1].getColor() != color(0, 255, 0)) {
		    answer[0][0] = xcor;
        answer[0][1] = ycor + 1;
		  }
	  }

    if (xcor > 0 && xcor < game.length && ycor - 1 > 0 && ycor - 1 < game[0].length) {
		  if (game[xcor][ycor - 1].getColor() != color(0, 255, 0)) {
		    answer[0][0] = xcor;
        answer[0][1] = ycor - 1;
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
  
  public void makeMove() {
    int[][] moves = getMoves(xPos, yPos);
    int value = (int) random(0, moves.length);
    
    xPos += moves[value][0];
    yPos += moves[value][1];
  }
  
  public void ghostSetUp() {
    fill(255, 0, 0);
    ellipse(redX, redY, 20, 20);
    
    fill(0, 255, 0);
    ellipse(greenX, greenY, 20, 20);
    
    fill(0, 0, 255);
    ellipse(blueX, blueY, 20, 20);
  }
  
}