public char[][] arr;
public class Maze{
  public Maze(String filename){
    String[] temp = loadStrings(filename);
    arr = new char[temp.length][temp[0].length()];
    for(int r = 0; r < temp.length; r++){
      for(int c = 0; c < temp[0].length(); c++){
      arr[r][c] = temp[r].charAt(c);
    }
  }
  }
  public void mazeSetUp(Square[][] game){
    for(int r = 0; r < game.length; r++){
      for(int c = 0; c < game[r].length; c++){
        if(arr[r][c] == '#'){
          game[c][r] = new Square(c * 20, r * 20, color(0, 0, 255), true);
        }
        else if (arr[r][c] == '.'){
          game[c][r] = new Square(c * 20, r * 20, color(255, 255, 255), false);
        }
        else{
          game[c][r] = new Square(c * 20, r * 20, color(0, 0, 0), true);
        }
      }
}
  }
}