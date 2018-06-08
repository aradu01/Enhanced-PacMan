public int redX;
public int redY;

public class RedGhost extends Ghost {
  
  public RedGhost() {
    redX = 12;
    redY = 10;
  }
  
  public void redX(int value) {
    redX += value;
  }
  
  public void redY(int value) {
    redY += value;
  }
  
}