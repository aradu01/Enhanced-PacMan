public char[][] arr;
public class Maze{
  public Maze(String filename){
    String[] temp = loadStrings(filename);
    int rcounter = 0;
    int ccounter = 0;
    for(String s : temp){
      if(ccounter >= s.length()){
        rcounter++;
        ccounter = 0;
      }
      arr[rcounter][ccounter] = s.charAt(ccounter);
      ccounter++;
    }
  }
  public void mazeSetUp(Square[][] game){
    for(int r = 0; r < game.length; r++){
      for(int c = 0; c < game[r].length; c++){
        if(arr[r][c] == '#'){
          game[r][c] = new Square(r * 20, c * 20, color(0, 255, 0));
        }
        else{
          game[r][c] = new Square(r * 20, c * 20, color(0, 0, 255));
        }
      }
}
  }
}
