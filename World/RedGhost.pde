public class RedGhost extends Ghost {

  
  public RedGhost() {
    super(300, 340, color(255, 0, 0));
  }
  public void set(){
    ellipse(ghostY(), ghostX(), 20, 20);
    fill(color(255, 0, 0));
  }
}
