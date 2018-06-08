public int blueX;
public int blueY;

public class BlueGhost extends Ghost {
  
  public BlueGhost() {
    blueX = 350;
    blueY = 310;
  }
  
  public void blueX(int value) {
    blueX += value;
  }
  
  public void blueY(int value) {
    blueY += value;
  }
  
}