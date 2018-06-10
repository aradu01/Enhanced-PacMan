public void setup() {
  size(400, 400);
  
  rectMode(CENTER);
}

public void draw() {
  translate(200, 200);
  rotate(PI / 4);
  rect(0, 0, 100, 100);
  
  resetMatrix();
  
  rotate(PI / 4);
  rect(0, 0, 100, 100);
}
