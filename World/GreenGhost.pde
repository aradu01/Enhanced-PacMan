public int greenX;
public int greenY;

public class GreenGhost extends Ghost {
  
  public GreenGhost() {
    greenX = 310;
    greenY = 310;
  }
  
  public void greenX(int value) {
    greenX += value;
  }
  
  public void greenY(int value) {
    greenY += value;
  }
  
}
