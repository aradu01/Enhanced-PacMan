public class BlueGhost extends Ghost {


  
  public BlueGhost() {
    super(300, 300, color(0, 0, 255));
  }
  public void set(){
    ellipse(ghostY(), ghostX(), 20, 20);
    fill(color(0, 0, 255));
  }
}
