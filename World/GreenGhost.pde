public int greenX;
public int greenY;

public class GreenGhost extends Ghost {
  
  public GreenGhost() {
    greenX = 14;
    greenY = 10;
  }
  
  public void greenX(int value) {
    greenX += value;
  }
  
  public void greenY(int value) {
    greenY += value;
  }
  
}