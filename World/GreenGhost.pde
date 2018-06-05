public class GreenGhost extends Ghost {


  public GreenGhost() {
    super(300, 260, color(0, 255, 0));
  }
  public void set(){
    ellipse(ghostY(), ghostX(), 20, 20);
    fill(color(0, 255, 0));
  }
}
