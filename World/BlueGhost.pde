/*
public int blueX;
public int blueY;
*/

public class BlueGhost extends Ghost {
  
  public BlueGhost() {
    ghostX = 350;
    ghostY = 310;
    c = color(0, 0, 255);
  }
  
  public void revive(){
    c = color(0,0,255);
  }
  /*
  public void blueX(int value) {
    blueX += value;
  }
  
  public void blueY(int value) {
    blueY += value;
  }
  */
  
}
