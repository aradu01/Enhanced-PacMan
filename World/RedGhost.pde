/*
public int redX;
public int redY;
*/

public class RedGhost extends Ghost {
  
  public RedGhost() {
    ghostX = 270;
    ghostY = 310;
    c = color(255, 0, 0);
  }
  
  public void revive(){
    c = color(255, 0, 0);
  }
  /*
  public void redX(int value) {
    redX += value;
  }
  
  public void redY(int value) {
    redY += value;
  }
  */
  
}
