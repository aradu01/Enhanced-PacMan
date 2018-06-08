public int blueX;
public int blueY;

public class BlueGhost extends Ghost {
  
  public BlueGhost() {
    blueX = 10;
    blueY = 10;
  }
  
  public void blueX(int value) {
    blueX += value;
  }
  
  public void blueY(int value) {
    blueY += value;
  }
  
}