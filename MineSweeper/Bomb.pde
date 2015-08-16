public class Bomb {
  public Bomb(int x, int y) {
    xcord = x;
    ycord = y;
  }
  public void display() {
    PImage img;
    img = loadImage("bombed.png");
    image(img, xcord, ycord, 40, 40);
  }
  public int getxCord() {
    return xcord;
  }
  public int getyCord() {
    return ycord;
  }
  private int xcord;
  private int ycord;
}
